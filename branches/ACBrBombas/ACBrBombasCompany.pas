{$I ACBr.inc}

unit ACBrBombasCompany ;

interface
uses ACBrBombasClass, ACBrDevice, ACBrUtil,
     Classes
     {$IFNDEF CONSOLE}
       {$IFDEF VisualCLX}, QForms, QDialogs, QControls
       {$ELSE}, Forms, Dialogs, Controls {$ENDIF}
     {$ENDIF};

type

{ Classe filha de TACBrBombasClass com implementaçao para Company }
TACBrBombasCompany = class( TACBrBombasClass )
  private
    fsBytesResp : Integer ;

  protected
    function GetDataHora: TDateTime; override;

    procedure MapeiaosBicos;

  public
    Constructor create( AOwner : TComponent );
    Destructor Destroy; override ;

    procedure Ativar; override;
    procedure Desativar; override;

    property BytesResp : Integer read fsBytesResp write fsBytesResp;
    function RecebeResposta : String;
    function EnviaComando( cmd : String ) : String; override;

    function InicializaComunicacao(): Integer ; override; //usará os dados da configuração de propriedades
    function FinalizaComunicacao(): Integer ; override;
    function StatusComunicacao(): Integer;  override;//Function Comunica; external 'COMPANYTEC.DLL' name 'Comunica'; StatusCom external ControlTech32.dll

    function AjustaRelogio(vDataHora : TDateTime ): Integer ; override;

    function AlteraPrecoBico(bico:Integer; Preco:Real): Integer; override;

    function LeAbastecimentosPendentes(var ListaAbastecimentos: TListaAbastecimentos): Integer; override;
    function LeAbastecimentoemAndamentoBico(bico: Integer; var VolumeAbastecido, ValorAbastecido:Real): Integer;  override;//Retorna o display
//    function LeAbastecimentosEmAndamento(var: Abast_And:DisplayAbastecimentos ): Integer; virtual;

//    function LeEncerrantesBico(bico:integer; var vDadosEncerrante: Encerrante): Integer; override;


    function LeStatusBico(bico: Integer; var Status: TStatusBicoBomba ): Integer; override;
    function AutorizaBico(bico: Integer) : Integer; override;
    function BloquearBico(bico: Integer) : Integer; override;

    Function PredeterminaAbastecimentoemVolumeBico( bico: Integer; Volume:Real): Integer;  override;//não é muito usado no Brasil ??
    Function PredeterminaAbastecimentoemValorBico( bico: Integer; Valor:Real): Integer;  override; //não é muito usado no Brasil ??

  end;

implementation

Uses SysUtils, DateUtils, StrUtils, Math, dllcompanytec;

{ --------------------------- TACBrBombasCompany ----------------------------- }
constructor TACBrBombasCompany.create(AOwner: TComponent);
begin
  inherited create( AOwner ) ;

  fpDevice.HandShake := hsRTS_CTS ; //?????

  fpModeloStr := 'Companytec' ;

end;

destructor TACBrBombasCompany.Destroy;
begin

  inherited;
end;

procedure TACBrBombasCompany.Ativar;
begin
  case TipoConexao of
    tcSerial:
    begin
      if not fpDevice.IsSerialPort  then
        raise Exception.Create( 'Esse Concentrador requer Porta Serial:  '+#13+
                                '(COM1, COM2, COM3, ...)');

//      if not (fsVersao in [vrsIMS01, vrsCBC01, vrsCBC02, vrsCBC03, vrsCBC04]) then
//        raise Exception.Create( 'Versão do Concentrador não Existente.');

      fpDevice.HandShake := hsRTS_CTS ;
    end;
    tcTCPIP:
    begin
      //...
    end;
    tcDLLTCPIP, tcDLLSerial:
    begin
      InicializaComunicacao;
      MapeiaosBicos;
    end;

  end;

  inherited Ativar;

end;

function TACBrBombasCompany.RecebeResposta : String;
begin
  fpRespostaComando := '';

  { Chama Rotina da Classe mãe TACBrClass para ler Resposta. Se houver
    falha na leitura LeResposta dispara Exceçao }
  LeResposta ;

  result := fpRespostaComando;
end;

function TACBrBombasCompany.StatusComunicacao: Integer;
begin
  if (tipoConexao = tcNenhuma) then
    raise Exception.create('Não foi definido tipo de conexão!');

  if (not fpAtivo) then
    raise Exception.create('Componente não está ativo!');

  case TipoConexao of
    {tcSerial:
    begin

    end;
    tcTCPIP:
    begin

    end;
    }
    tcDLLSerial:
    begin
      result := ord(Comunica); // ord(PortOpen); //???
    end;
    tcDLLTCPIP:
    begin
      result := ord(SocketOpen);
    end
  end;

end;

function TACBrBombasCompany.InicializaComunicacao: Integer;
begin
 case TipoConexao of
{  tcSerial:
  begin

  end;
  tcTCPIP:
  begin

  end;
}
  tcDLLSerial:
  begin
    result := ord(InicializaSerial(strtoint(fpDevice.Porta)));
  end;
  tcDLLTCPIP:
  begin
    result := ord(InicializaSocket('127.0.0.1')); //????
  end
  else
  begin
   //... outra opção??
  end;
 end;
end;

function TACBrBombasCompany.FinalizaComunicacao: Integer;
begin
  if tipoConexao = tcNenhuma  then
    raise Exception.create('Não foi definido tipo de conexão!');

 case TipoConexao of
{  tcSerial:
  begin

  end;
  tcTCPIP:
  begin

  end;
}
  tcDLLSerial:
  begin
    result := FechaSerial;
  end;
  tcDLLTCPIP:
  begin
    result := ord(FechaSocket); //????
  end
  else
  begin
   //... outra opção??
  end;
 end;
end;

function TACBrBombasCompany.EnviaComando( cmd : String ) : String ;
begin
  result  := '' ;
  fpComandoEnviado   := '' ;

  if (not fpDevice.Ativo) then
    raise Exception.create('Componente ACBrBombas não está Ativo');

  { Concentrador está em-linha? }
  while not EmLinha( 3 ) do begin
    if (MessageDlg('O Concentrador não está pronto.'+#10+#10+
                   'Deseja tentar novamente ?',mtConfirmation,
                   [mbYes,mbNo],0) = mrYes) then
      Continue ;

    raise EACBrBombasSemResposta.create('Concentrador não está Pronto') ;
  end; { while }

  fpDevice.Serial.DeadlockTimeout := 1000; { Timeout p/ Envio }
  fpDevice.Serial.Purge;                   { Limpa a Porta }

  while (True) do begin
    try
      fpDevice.Serial.SendString( cmd );   { Eviando o comando }
      break;
    except
      if (MessageDlg(
            'Camandos não estão sendo enviados para o Concentrador.'+#10+
            'Deseja tentar novamente ?',
            mtConfirmation,[mbYes,mbNo],0) <> mrYes) then
        raise EACBrBombasSemResposta.create('Erro ao enviar comandos para o Concentrador.')
      else
        continue ;
    end; { except }
  end; { while }
end;

function TACBrBombasCompany.AjustaRelogio(vDataHora: TDateTime): Integer;
begin
 case TipoConexao of
{  tcSerial:
  begin

  end;
  tcTCPIP:
  begin

  end;
}
  tcDLLTCPIP,tcDLLSerial:
  begin
    result := Ord(SetClock(FormatDateTime('ddhhnn',vDataHora))); { Dia, hora e minuto, no formato DDHHMM, ou
                                       “AUTO”, caso opte pelo ajuste automático, no qual a DLL
                                       utilizará o relógio do computador.}

  end
  else
  begin
   //... outra opção??
  end;
 end;
end;

function TACBrBombasCompany.GetDataHora: TDateTime;
Var RetCmd : AnsiString ;
    OldShortDateFormat : String ;
begin
{  RetCmd := RetornaInfoECF( '23' ) ;
  OldShortDateFormat := ShortDateFormat ;
  try
     ShortDateFormat := 'dd/mm/yy' ;
     result := StrToDate(copy(RetCmd, 1,2) + DateSeparator +
                         copy(RetCmd, 3,2) + DateSeparator +
                         copy(RetCmd, 5,2)) ;
  finally
     ShortDateFormat := OldShortDateFormat ;
  end ;
  result := RecodeHour(  result,StrToInt(copy(RetCmd, 7,2))) ;
  result := RecodeMinute(result,StrToInt(copy(RetCmd, 9,2))) ;
  result := RecodeSecond(result,StrToInt(copy(RetCmd,11,2))) ;}
  inherited GetDataHora;
end;

function TACBrBombasCompany.AlteraPrecoBico(bico: Integer;
  Preco: Real): Integer;
var decimais:byte;
begin
  decimais := 3; //número de casas decimais da bomba... passar para uma propriedade?
  case TipoConexao of
{  tcSerial:
  begin

  end;
  tcTCPIP:
  begin

  end;
}
  tcDLLSerial, tcDLLTCPIP:
  begin
    result := Ord(AlteraPreco(fpBicos[bico].Codigo, preco, decimais));//??? verificar retorno
  end
  else
  begin
   //... outra opção??
  end;
 end;


end;

function TACBrBombasCompany.LeStatusBico(bico: Integer;
  var Status: TStatusBicoBomba): Integer;
var ms:multistatus;

begin
  case TipoConexao of
{  tcSerial:
  begin

  end;
  tcTCPIP:
  begin

  end;
}
  tcDLLSerial, tcDLLTCPIP:
  begin
    ms:=LeStatus;
 {   case ms.Status[bico] of
    Livre:ListBox2.Items.Add(inttostr(a) + ' (L) - Livre');
    Pronta:ListBox2.Items.Add(inttostr(a) + ' (P) - Pronto');
    Falha:ListBox2.Items.Add(inttostr(a) + ' (F) - Falha');
    Concluiu:ListBox2.Items.Add(inttostr(a) + ' (C) - Concluiu');
    Abastecendo:ListBox2.Items.Add(inttostr(a) + ' (A) - Abastecimento');
    Bloqueada:ListBox2.Items.Add(inttostr(a) + ' (B) - Bloqueado');
    SolicitaLib:ListBox2.Items.Add(inttostr(a) + ' (E) - Espera');
    end;}
//?????
//    result := Ord(LeStatus(fpBicos[bico].Codigo));//???
  end
  else
  begin
   //... outra opção??
  end;
 end;
  //..???
end;

function TACBrBombasCompany.AutorizaBico(bico: Integer): Integer;
begin
  case TipoConexao of
{  tcSerial:
  begin

  end;
  tcTCPIP:
  begin

  end;
}
  tcDLLSerial, tcDLLTCPIP:
  begin
    result := Ord(AutoLibera(fpBicos[bico].Codigo));//??? Function AutorizaAbast(bico:string):Error
  end
  else
  begin
   //... outra opção??
  end;
 end;

end;

function TACBrBombasCompany.BloquearBico(bico: Integer): Integer;
begin
  case TipoConexao of
{  tcSerial:
  begin

  end;
  tcTCPIP:
  begin

  end;
}
  tcDLLSerial, tcDLLTCPIP:
  begin
    result := Ord(BloqueiaBico(fpBicos[bico].Codigo));//??? Function AutorizaAbast(bico:string):Error
  end
  else
  begin
   //... outra opção??
  end;
 end;

end;

function TACBrBombasCompany.LeAbastecimentoemAndamentoBico(bico: Integer;
  var VolumeAbastecido, ValorAbastecido: Real): Integer;
var ol:online;
    a:byte;
begin
  case TipoConexao of
{  tcSerial:
  begin

  end;
  tcTCPIP:
  begin

  end;
}
  tcDLLSerial, tcDLLTCPIP:
  begin
    result := 0; //????
    ol:=LeVisualizacao;
    VolumeAbastecido := 0;
    for a:=1 to 48 do
    begin
      if ol.bico[a] = fpBicos[bico].codigo then
      begin
        VolumeAbastecido := ol.Litragem[bico];
        result := 1; //????
        break;
      end;
    end;
  end
  else
  begin
   //... outra opção??
  end;
 end;
end;

function TACBrBombasCompany.LeAbastecimentosPendentes(
  var ListaAbastecimentos: TListaAbastecimentos): Integer;
var
  ab:abast;
  i: integer;

begin
{  if ListaAbastecimentos = nil then
  begin
    ListaAbastecimentos := TListaAbastecimentos.create(self);
  end;}
  i := 0;

  case TipoConexao of
{  tcSerial:
  begin

  end;
  tcTCPIP:
  begin

  end;}
    tcDLLSerial, tcDLLTCPIP:
    begin
      ab := LeAbastecimento;
      while ab.canal <> '00' do
      begin
        inc(i);

        SetLength(ListaAbastecimentos,i);

        ListaAbastecimentos[i-1].Bico := ab.canal;
        ListaAbastecimentos[i-1].Hora := StringToDateTime(ab.hora);
        ListaAbastecimentos[i-1].Data := StringToDateTime(ab.data);
        ListaAbastecimentos[i-1].PrecoUnitario := ab.PU;
        ListaAbastecimentos[i-1].Litros := ab.total_litros;
        ListaAbastecimentos[i-1].ValorTotal := ab.total_dinheiro;
        ListaAbastecimentos[i-1].Encerrante := ab.encerrante;
        ListaAbastecimentos[i-1].VirgulaPrecoUnitario := 3;
        ListaAbastecimentos[i-1].VirgulaLitros := 3;

        { funções não utilizadas ainda
        editString.Text:=ab.st_full;
        editTempo.Text:=ab.tempo;
        editRegistro.Text:=floattostr(ab.registro);
        check.Checked:=ab.checksum;
        integridade.Checked:=ab.integridade;
        value.Checked:=ab.value;
        }
        ab := LeAbastecimento;
      end;
    end;
  end;

  Result := i; //???
end;


procedure TACBrBombasCompany.MapeiaosBicos;
type
  lilstr= String[2];
  codigos = array[0..32] of lilstr;
//var ms:multistatus;
//    a,i:byte;

begin
//  fpBicos.free;
//  fpBicos.Create;
  SetLength(fpBicos,0);
  SetLength(fpBicos,33);
  fpBicos[1].Codigo := '04';
  fpBicos[2].Codigo := '44';
  fpBicos[3].Codigo := '05';
  fpBicos[4].Codigo := '45';
  fpBicos[5].Codigo := '08';
  fpBicos[6].Codigo := '48';
  fpBicos[7].Codigo := '09';
  fpBicos[8].Codigo := '49';
  fpBicos[9].Codigo := '0C';
  fpBicos[10].Codigo := '4C';
  fpBicos[11].Codigo := '0D';
  fpBicos[12].Codigo := '4D';
  fpBicos[13].Codigo := '10';
  fpBicos[14].Codigo := '50';
  fpBicos[15].Codigo := '11';
  fpBicos[16].Codigo := '51';
  fpBicos[17].Codigo := '14';
  fpBicos[18].Codigo := '54';
  fpBicos[19].Codigo := '15';
  fpBicos[20].Codigo := '55';
  fpBicos[21].Codigo := '18';
  fpBicos[22].Codigo := '58';
  fpBicos[23].Codigo := '19';
  fpBicos[24].Codigo := '59';
  fpBicos[25].Codigo := '1C';
  fpBicos[26].Codigo := '5C';
  fpBicos[27].Codigo := '1D';
  fpBicos[28].Codigo := '5D';
  fpBicos[29].Codigo := '20';
  fpBicos[30].Codigo := '60';
  fpBicos[31].Codigo := '21';
  fpBicos[32].Codigo := '61';

{  i:= 0;

  ms:=LeStatus;
  for a:=1 to 32 do
  begin
    case ms.Status[a] of
      Falha:
      begin
      end
      else
      begin
        inc(i);
        fpBicos[i].Codigo := codigos[i];
      end;
    end;
  end;}
end;

function TACBrBombasCompany.PredeterminaAbastecimentoemValorBico(bico: Integer;
  Valor: Real): Integer;
begin
  case TipoConexao of
{  tcSerial:
  begin

  end;
  tcTCPIP:
  begin

  end;
}
  tcDLLSerial, tcDLLTCPIP:
  begin
    result := Ord(Preset(fpBicos[bico].Codigo,Valor));
  end
  else
  begin
   //... outra opção??
  end;
 end;

end;

function TACBrBombasCompany.PredeterminaAbastecimentoemVolumeBico(bico: Integer;
  Volume: Real): Integer;
begin
  //não há essa opção na dll. Implementar de acordo com o preço no bico????
end;

procedure TACBrBombasCompany.Desativar;
begin

  case TipoConexao of
    tcSerial:
    begin
      //....
    end;
    tcTCPIP:
    begin
      //...
    end;
    tcDLLTCPIP, tcDLLSerial:
    begin
      FinalizaComunicacao;
    end;

  end;

  inherited Desativar;
end;

end.
