{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para interação com equipa- }
{ mentos de Automação Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2004 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Você pode obter a última versão desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{  Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }
{                                                                              }
{  Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU      }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto}
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,  }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Você também pode obter uma copia da licença em:                              }
{ http://www.opensource.org/licenses/gpl-license.php                           }
{                                                                              }
{ Daniel Simões de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Praça Anita Costa, 34 - Tatuí - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{******************************************************************************
|* Historico
|*
|* 26/06/2006: Daniel Simões de Almeida
|* Primeira Versao: Criaçao e Distribuiçao da Primeira Versao
|* 28/11/2006: Daniel Simões de Almeida
|* Corrigo bug em SubTotalizaCupom
******************************************************************************}

{$I ACBr.inc}

unit ACBrECFFiscNET ;

interface
uses ACBrECFClass, ACBrUtil,
     Classes
     {$IFNDEF CONSOLE}
       {$IFDEF VisualCLX}, QDialogs, QControls, QForms {$ENDIF}
       {$IFDEF VCL}, Dialogs, Controls, Forms {$ENDIF}
     {$ENDIF} ;

type

TACBrECFFiscNETComando = class
  private
    fsNomeComando : String ;
    fsParams  : TStringList ;
    fsCont    : Byte ;
    fsTimeOut: Integer;

    function GetComando: String;
    procedure SetNomeComando(const Value: String);
 public
    constructor create ;
    destructor destroy ; override ;

    property NomeComando : String  write SetNomeComando ;
    property TimeOut     : Integer read fsTimeOut write fsTimeOut ;
    property Comando     : String  read GetComando ;
    property Params      : TStringList read fsParams ;

    Procedure AddParamString(ParamName : String; AString  : String) ;
    Procedure AddParamInteger(ParamName : String; AInteger : Integer) ;
    Procedure AddParamDouble(ParamName : String; ADouble  : Double) ;
    Procedure AddParamBool(ParamName : String; ABool    : Boolean) ;
    Procedure AddParamDateTime(ParamName : String; ADateTime: TDateTime;Tipo : Char = 'D'  ) ;
 end ;

TACBrECFFiscNETResposta = class
  private
    fsParams  : TStringList ;
    fsCont: Byte;
    fsCodRetorno: Integer;
    fsTamanho: Integer;
    fsResposta : String ;

    procedure SetResposta(const Value: String);
 public
    constructor create ;
    destructor destroy ; override ;

    property Resposta   : String      read fsResposta write SetResposta ;
    property Cont       : Byte        read fsCont;
    property CodRetorno : Integer     read fsCodRetorno ;
    property Params     : TStringList read fsParams ;
    property Tamanho    : Integer     read fsTamanho ;
 end ;

{ Classe filha de TACBrECFClass com implementaçao para FiscNET }
TACBrECFFiscNET = class( TACBrECFClass )
 private
    fsNumVersao : String ;
    fsNumECF    : String ;
    fsNumLoja   : String ;
    fsNumCRO    : String ;
    fsFiscNETComando: TACBrECFFiscNETComando;
    fsFiscNETResposta: TACBrECFFiscNETResposta;

    Function PreparaCmd( cmd : String ) : String ;
 protected
    function GetDataHora: TDateTime; override ;
    function GetNumCupom: String; override ;
    function GetNumECF: String; override ;
    function GetNumCRO: String; override ;
    function GetNumLoja: String; override ;
    function GetNumSerie: String; override ;
    function GetNumVersao: String; override ;
    function GetSubTotal: Double; override ;
    function GetTotalPago: Double; override ;

    function GetEstado: TACBrECFEstado; override ;
    function GetGavetaAberta: Boolean; override ;
    function GetPoucoPapel : Boolean; override ;
    function GetHorarioVerao: Boolean; override ;
    function GetChequePronto: Boolean; override ;

    Function VerificaFimLeitura(Retorno:String) : Boolean ; override ;

 public
    Constructor create( AOwner : TComponent  )  ;
    Destructor Destroy  ; override ;

    procedure Ativar ; override ;

    property FiscNETComando : TACBrECFFiscNETComando  read fsFiscNETComando ;
    property FiscNETResposta: TACBrECFFiscNETResposta read fsFiscNETResposta ;

    Function EnviaComando( cmd : String = '') : String ; override ;

    Procedure AbreCupom( CPF_CNPJ : String = '') ; override ;
    Procedure VendeItem( Codigo, Descricao : String; AliquotaICMS : String;
       Qtd : Double ; ValorUnitario : Double; DescontoPorc : Double = 0;
       Unidade : String = '') ; override ;
    Procedure SubtotalizaCupom( DescontoAcrescimo : Double = 0;
       MensagemRodape : String  = '' ) ; override ;
    Procedure EfetuaPagamento( CodFormaPagto : String; Valor : Double;
       Observacao : String = ''; ImprimeVinculado : Boolean = false) ;
       override ;
    Procedure FechaCupom( Observacao : String = '') ; override ;
    Procedure CancelaCupom ; override ;
    Procedure CancelaItemVendido( NumItem : Integer ) ; override ;

    Procedure LeituraX ; override ;
    Procedure ReducaoZ(DataHora : TDateTime) ; override ;
    Procedure AbreRelatorioGerencial ; override ;
    Procedure LinhaRelatorioGerencial( Linha : String ) ; override ;
    Procedure AbreCupomVinculado(COO, CodFormaPagto, CodComprovanteNaoFiscal :
       String; Valor : Double) ; override ;
    Procedure LinhaCupomVinculado( Linha : String ) ; override ;
    Procedure FechaRelatorio ; override ;
    Procedure PulaLinhas( NumLinhas : Integer = 0 ) ; override ;

    Procedure MudaHorarioVerao  ; overload ; override ;
    Procedure MudaHorarioVerao( EHorarioVerao : Boolean ) ; overload ; override ;
    Procedure PreparaTEF ; override ;
    Procedure CorrigeEstadoErro ; override ;

    
    Procedure LeituraMemoriaFiscal( DataInicial, DataFinal : TDateTime ) ;
       override ;
    Procedure LeituraMemoriaFiscal( ReducaoInicial, ReducaoFinal : Integer);
       override ;
    Procedure LeituraMemoriaFiscalSerial( DataInicial, DataFinal : TDateTime;
       var Linhas : TStringList ) ; override ;
    Procedure LeituraMemoriaFiscalSerial( ReducaoInicial, ReducaoFinal : Integer;
       var Linhas : TStringList ) ; override ;

    Procedure ImprimeCheque(Banco : String; Valor : Double ; Favorecido,
       Cidade : String; Data : TDateTime ;Observacao : String = '') ; override ;
    Procedure CancelaImpressaoCheque ; override ;

    Procedure AbreGaveta ; override ;

    procedure CarregaAliquotas ; override ;
    Procedure ProgramaAliquota( Aliquota : Double; Tipo : Char = 'T';
       Posicao : String = '') ; override ;

    procedure CarregaFormasPagamento ; override ;
    Procedure ProgramaFormaPagamento( var Descricao: String;
       PermiteVinculado : Boolean = true; Posicao : String = '' ) ; override ;

    procedure CarregaComprovantesNaoFiscais ; override ;
    Procedure ProgramaComprovanteNaoFiscal( var Descricao: String;
       Tipo : String = ''; Posicao : String = '') ; override ;

 end ;

implementation
Uses ACBrBase,
    {$IFDEF Delphi6_UP} DateUtils, StrUtils {$ELSE} ACBrD5, Windows{$ENDIF},
     SysUtils,  Math ;

{ -------------------------  TACBrECFFiscNETComando -------------------------- }
constructor TACBrECFFiscNETComando.create;
begin
  inherited create ;

  fsParams := TStringList.create ;
  fsCont   := 0 ;
end;

destructor TACBrECFFiscNETComando.destroy;
begin
  fsParams.Free ;

  inherited destroy ;
end;

procedure TACBrECFFiscNETComando.SetNomeComando(const Value: String);
begin
  if fsCont >= 250 then
     fsCont := 1
  else
     Inc( fsCont ) ;

  fsNomeComando := Trim(Value) ;
  fsTimeOut     := 0 ;
  fsParams.Clear ;
end;

function TACBrECFFiscNETComando.GetComando: String;
Var I : Integer ;
begin
  Result := '{'+IntToStr(fsCont)+';'+fsNomeComando+';' ;

  For I := 0 to fsParams.Count-1 do
    Result := Result + Trim(fsParams[I]) + ' ';
  Result := Trim(Result) ;

  Result := Result + ';'+IntToStr(Length(Result))+'}' ;
end;

procedure TACBrECFFiscNETComando.AddParamString(ParamName, AString: String);
var Buf : String ;
    I,ASC : Integer ;
begin
  if AString = '' then exit ;
  
  AString := StringReplace(TrimRight(AString),'\','\\',[rfReplaceAll]) ;
  AString :=  StringReplace(TrimRight(AString),'"','\"',[rfReplaceAll]) ;
  Buf     := '' ;
  For I := 1 to Length(AString) do
  begin
     ASC := Ord(AString[I]) ;
     if (ASC < 32) or (ASC > 127) then
        Buf := Buf + '\x'+Trim(IntToHex(ASC,2))
     else
        Buf := Buf + AString[I] ;
  end ;

  fsParams.Add( ParamName + '="' + Buf + '"' ) ;
end;

procedure TACBrECFFiscNETComando.AddParamDouble(ParamName: String;
  ADouble: Double);
begin
  ADouble := RoundTo(ADouble,-4) ; // FiscNet aceita no máximo 4 casas decimais
  fsParams.Add(ParamName + '=' + FloatToStr(ADouble) )
end;

procedure TACBrECFFiscNETComando.AddParamInteger(ParamName: String;
  AInteger: Integer);
begin
  fsParams.Add(ParamName + '=' + IntToStr(AInteger) )
end;

procedure TACBrECFFiscNETComando.AddParamBool(ParamName: String;
  ABool: Boolean);
Var CharBool : Char ;
begin
  if ABool then CharBool := 't' else CharBool := 'f' ;

  fsParams.Add(ParamName + '=' + CharBool )
end;

Procedure TACBrECFFiscNETComando.AddParamDateTime(ParamName : String;
  ADateTime: TDateTime;Tipo : Char = 'D'  ) ;
Var Texto : String ;
begin
  if Tipo in ['T','H'] then
     Texto := FormatDateTime('hh:nn:ss',ADateTime)
  else
     Texto := FormatDateTime('dd/mm/yyyy',ADateTime) ;

  fsParams.Add(ParamName + '=' + '#'+Texto+'#' )
end;

{ ------------------------- TACBrECFFiscNETResposta -------------------------- }

constructor TACBrECFFiscNETResposta.create;
begin
  inherited create ;

  fsParams     := TStringList.create ;
  fsCont       := 0 ;
  fsCodRetorno := 0;
  fsTamanho    := 0;
  fsResposta   := '' ;
end;

destructor TACBrECFFiscNETResposta.destroy;
begin
  fsParams.Free ;
  inherited destroy ;
end;

procedure TACBrECFFiscNETResposta.SetResposta(const Value: String);
Var Buf : String ;
    P,I : Integer ;
    Param,Hex : String ;
    CharAposIgual, CharHex : Char ;
begin
  fsParams.Clear ;
  fsCont       := 0 ;
  fsCodRetorno := 0;
  fsTamanho    := 0;
  fsResposta   := '' ;

  if Value = '' then exit ;

  fsResposta := Value ;
  Buf        := copy(fsResposta,2,Length(fsResposta)-2) ;  //  Remove "{"  "}"

  P := PosLast(';',Buf) ;
  fsTamanho := StrToIntDef(copy(Buf,P+1,Length(Buf)),0) ;
  Buf       := copy(Buf,1,P-1) ;  // Remove tamanho

  P := pos(';',Buf) ;
  try
     fsCont := StrToInt( copy(Buf,1,(P-1)) ) ;
  except
     raise Exception.Create('Num.Identificação inválido') ;
  end ;
  Buf := copy(Buf,P+1,Length(Buf)) ;  // Remove a Ident.

  P := pos(';',Buf) ;
  try
     fsCodRetorno := StrToInt( copy(Buf,1,(P-1)) ) ;
  except
     raise Exception.Create('Cod.Retorno inválido') ;
  end ;
  Buf := Trim(copy(Buf,P+1,Length(Buf))) ;  // Remove Retorno

  if Buf = '' then
     exit ;

  Buf := StringReplace(Buf,'\"','\x22',[rfReplaceAll]) ;  // Tira aspas internas
  // Tem Parametros ? //
  P := pos('=',Buf) ;
  while P > 0 do
  begin
     try
        CharAposIgual := Buf[P+1] ;
        case CharAposIgual of
           '#' : P := PosAt('#',Buf,2) ;
           '"' : P := PosAt('"',Buf,2) ;
        else
           P := Pos(' ',Buf) ;
        end ;
     except
        CharAposIgual := ' ';
        P := 0 ;
     end ;

     if P = 0 then
        P := Length(Buf) ;

     Param := Trim(copy(Buf,1,P)) ;
     Buf   := Trim(copy(Buf,P+1,Length(Buf))) ;  // Restante

     if CharAposIgual in ['"','#'] then   // É parametro Texto ou Data/Hora ?
     begin
        I := pos('=',Param) ;
        { removendo as " ou # }
        Param := copy(Param,1,I) + copy(Param,I+2,(Length(Param)-I-2) ) ;

        { Verificando por codigos em Hexa }
        P := pos('\x',Param) ;
        while P > 0 do
        begin
           Hex := copy(Param,P+2,2) ;

           try
              CharHex := Chr(StrToInt('$'+Hex)) ;
           except
              CharHex := ' ' ;
           end ;

           Param := StringReplace(Param,'\x'+Hex,CharHex,[rfReplaceAll]) ;
           P     := pos('\x',Param) ;
        end ;
     end ;

     fsParams.Add(Param) ;

     P := pos('=',Buf) ;
  end ;
end;

{ ----------------------------- TACBrECFFiscNET ----------------------------- }

constructor TACBrECFFiscNET.create( AOwner : TComponent ) ;
begin
  inherited create( AOwner ) ;

  fsFiscNETComando   := TACBrECFFiscNETComando.create ;
  fsFiscNETResposta  := TACBrECFFiscNETResposta.create ;

  fpDevice.HandShake := hsRTS_CTS ;
  fpDevice.Baud      := 115200 ;
  fpDevice.Parity    := pEven ;

  { Variaveis internas dessa classe }
  fsNumVersao := '' ;
  fsNumECF    := '' ;
  fsNumCRO    := '' ;
  fsNumLoja   := '' ;
  fpModeloStr := 'FiscNET' ;
  fpColunas   := 48 ;
  fpMFD       := True ;
  fpTermica   := True ;
end;

destructor TACBrECFFiscNET.Destroy;
begin
  fsFiscNETComando.Free ;
  fsFiscNETResposta.Free ;

  inherited Destroy ;
end;

procedure TACBrECFFiscNET.Ativar;
begin
  if not fpDevice.IsSerialPort  then
     raise Exception.Create('A impressora: '+ModeloStr+' requer'+sLineBreak+
                            'Porta Serial:  (COM1, COM2, COM3, ...)');

  inherited Ativar ; { Abre porta serial }

  fsNumVersao := '' ;
  fsNumECF    := '' ;
  fsNumCRO    := '' ;
  fsNumLoja   := '' ;

  try
     if NumVersao = '' then
        raise EACBrECFNaoInicializado.Create(
                 'Erro inicializando a impressora '+ModeloStr );

     FiscNETComando.NomeComando := 'LeTexto' ;
     FiscNETComando.AddParamString('NomeTexto','Marca') ;
     EnviaComando ;
     fpModeloStr := 'FiscNET '+ FiscNETResposta.Params.Values['ValorTexto'] ;
  except
     Desativar ;
     raise ;
  end ;
end;


Function TACBrECFFiscNET.EnviaComando( cmd : String = '' ) : String ;
Var ErroMsg : String ;
    OldTimeOut : Integer ;
begin
  if cmd <> '' then
     cmd := PreparaCmd(cmd) ;  // Ajusta e move para FiscNETcomando

  cmd := FiscNETComando.Comando ;

  Result  := '' ;
  ErroMsg := '' ;
  fpComandoEnviado   := '' ;
  fpRespostaComando  := '' ;
  FiscNETResposta.Resposta := '' ;
  AguardandoResposta := true ;
  OldTimeOut := TimeOut ;
  TimeOut    := max(FiscNETComando.TimeOut, TimeOut) ;

  try
     if (not fpDevice.Ativo) then
        raise EACBrECFNaoInicializado.create(
                 'Componente ACBrECF não está Ativo');

     VerificaEmLinha ;

     fpDevice.Serial.DeadlockTimeout := 2000 ; { Timeout p/ Envio }
     fpDevice.Serial.Purge ;                   { Limpa a Porta }

     while fpComandoEnviado = '' do
     begin
        fpDevice.Serial.Purge ;                   { Limpa a Porta }

        if not TransmiteComando( cmd ) then
           continue ;

        fpComandoEnviado := cmd ;
     end ;

     { Chama Rotina da Classe mãe TACBrClass para ler Resposta. Se houver
       falha na leitura LeResposta dispara Exceçao.
       Resposta fica gravada na váriavel "fpRespostaComando" }
     LeResposta ;

     Try
        FiscNETResposta.Resposta := fpRespostaComando ;

        ErroMsg := '' ;
        if FiscNETResposta.CodRetorno > 0 then
           ErroMsg := 'Erro: '+IntToStr(FiscNETResposta.CodRetorno) + ' - ' +
                      FiscNETResposta.Params.Values['NomeErro'] + #10 +
                      FiscNETResposta.Params.Values['Circunstancia'] ;
     except
        ErroMsg := 'Resposta do ECF inválida' ;
     end ;

     if ErroMsg <> '' then
      begin
        ErroMsg := 'Erro retornado pela Impressora: '+ModeloStr+#10+#10+
                   ErroMsg ;
        raise EACBrECFSemResposta.create(ErroMsg) ;
      end
     else
        Sleep( IntervaloAposComando ) ;  { Pequena pausa entre comandos }

  finally
     AguardandoResposta := false ;
     TimeOut := OldTimeOut ;
  end ;
end;

function TACBrECFFiscNET.PreparaCmd(cmd: String): String;
Var P : Integer ;
begin
  P := pos(';',cmd) ;
  if P = 0 then
     P := Length(cmd)+1 ;
  FiscNETComando.NomeComando := copy(cmd,1,P-1) ;
  FiscNETComando.Params.Text := copy(cmd,P+1,Length(cmd)) ;
end;

function TACBrECFFiscNET.VerificaFimLeitura(Retorno:String) : Boolean;
begin
  Result := (RightStr(Retorno,1) = '}') and (CountStr(Retorno,';') >= 3) ; 
end;

function TACBrECFFiscNET.GetDataHora: TDateTime;
Var RetCmd : String ;
    OldShortDateFormat : String ;
begin
  FiscNETComando.NomeComando := 'LeData' ;
  FiscNETComando.AddParamString('NomeData','Data');
  EnviaComando ;
  RetCmd := FiscNETResposta.Params.Values['ValorData'] ;
  RetCmd := StringReplace(RetCmd ,'/',DateSeparator, [rfReplaceAll] );
  OldShortDateFormat := ShortDateFormat ;
  try
     ShortDateFormat := 'dd/mm/yyyy' ;
     Result := StrToDate( RetCmd ) ;
  finally
     ShortDateFormat := OldShortDateFormat ;
  end ;

  FiscNETComando.NomeComando := 'LeHora' ;
  FiscNETComando.AddParamString('NomeHora','Hora');
  EnviaComando ;
  RetCmd := FiscNETResposta.Params.Values['ValorHora'] ;
  result := RecodeHour(  Result,StrToInt(copy(RetCmd,1,2))) ;
  result := RecodeMinute(Result,StrToInt(copy(RetCmd,4,2))) ;
  result := RecodeSecond(Result,StrToInt(copy(RetCmd,7,2))) ;
end;

function TACBrECFFiscNET.GetNumCupom: String;
begin
  FiscNETComando.NomeComando := 'LeInteiro' ;
  FiscNETComando.AddParamString('NomeInteiro','COO') ;
  EnviaComando ;

  Result := IntToStrZero(  StrToIntDef(
                  FiscNETResposta.Params.Values['ValorInteiro'],0 ), 6) ;
end;

function TACBrECFFiscNET.GetNumCRO: String;
begin
  FiscNETComando.NomeComando := 'LeInteiro' ;
  FiscNETComando.AddParamString('NomeInteiro','CRO') ;
  EnviaComando ;

  Result := IntToStrZero(  StrToIntDef(
                  FiscNETResposta.Params.Values['ValorInteiro'],0 ), 6) ;
end;

function TACBrECFFiscNET.GetNumLoja: String;
begin
  if fsNumLoja = '' then
  begin
     FiscNETComando.NomeComando := 'LeInteiro' ;
     FiscNETComando.AddParamString('NomeInteiro','Loja') ;
     EnviaComando ;

     fsNumLoja := IntToStrZero(  StrToIntDef(
                  FiscNETResposta.Params.Values['ValorInteiro'],0 ), 3) ;
  end ;

  Result := fsNumLoja ;
end;

function TACBrECFFiscNET.GetNumECF: String;
begin
  if fsNumECF = '' then
  begin
     FiscNETComando.NomeComando := 'LeInteiro' ;
     FiscNETComando.AddParamString('NomeInteiro','ECF') ;
     EnviaComando ;

     fsNumECF := IntToStrZero(  StrToIntDef(
                     FiscNETResposta.Params.Values['ValorInteiro'],0 ), 4) ;
  end ;

  Result := fsNumECF ;
end;

function TACBrECFFiscNET.GetNumSerie: String;
begin
  FiscNETComando.NomeComando := 'LeTexto' ;
  FiscNETComando.AddParamString('NomeTexto','NumeroSerieECF') ;
  EnviaComando ;

  Result := FiscNETResposta.Params.Values['ValorTexto'] ;
end;

function TACBrECFFiscNET.GetNumVersao: String ;
begin
  if fsNumVersao = '' then
  begin
     FiscNETComando.NomeComando := 'LeTexto' ;
     FiscNETComando.AddParamString('NomeTexto','VersaoSW') ;
     EnviaComando ;

     fsNumVersao := FiscNETResposta.Params.Values['ValorTexto'] ;
  end ;

  Result := fsNumVersao ;
end;

function TACBrECFFiscNET.GetTotalPago: Double;
begin
  FiscNETComando.NomeComando := 'LeMoeda' ;
  FiscNETComando.AddParamString('NomeDadoMonetario','TotalDocValorPago') ;
  EnviaComando ;

  Result := StringToFloatDef( FiscNETResposta.Params.Values['ValorMoeda'], 0) ;
end;

function TACBrECFFiscNET.GetSubTotal: Double;
begin
  FiscNETComando.NomeComando := 'LeMoeda' ;
  FiscNETComando.AddParamString('NomeDadoMonetario','TotalDocLiquido') ;
  EnviaComando ;

  Result := StringToFloatDef( FiscNETResposta.Params.Values['ValorMoeda'], 0) ;
end;


function TACBrECFFiscNET.GetEstado: TACBrECFEstado;
Var Est, Ind : Integer ;
begin
  if (not fpAtivo) then
     fpEstado := estNaoInicializada
  else
   begin
      fpEstado := estDesconhecido ;

      FiscNETComando.NomeComando := 'LeInteiro' ;
      FiscNETComando.AddParamString('NomeInteiro','Indicadores') ;
      EnviaComando ;
      Ind := StrToIntDef( FiscNETResposta.Params.Values['ValorInteiro'] ,0) ;


      if TestBit(Ind,5) then
         fpEstado := estBloqueada

      else if TestBit(Ind,7) then
         fpEstado := estRequerZ

//      else if not TestBit(Ind,6) then
//         fpEstado := estRequerX

      else
       begin
         FiscNETComando.NomeComando := 'LeInteiro' ;
         FiscNETComando.AddParamString('NomeInteiro','EstadoFiscal') ;
         EnviaComando ;

         Est := StrToIntDef( FiscNETResposta.Params.Values['ValorInteiro'] ,0) ;

         case Est of
            1         : fpEstado := estLivre ;
            2         : fpEstado := estVenda ;
            4,8,16    : fpEstado := estPagamento ;
            32,64,128 : fpEstado := estRelatorio ;
         end ;
       end ;
   end ;

  Result := fpEstado ;
end;

function TACBrECFFiscNET.GetGavetaAberta: Boolean;
begin
  FiscNETComando.NomeComando := 'LeIndicador' ;
  FiscNETComando.AddParamString('NomeIndicador','SensorGaveta') ;
  EnviaComando ;

  Result := (FiscNETResposta.Params.Values['ValorNumericoIndicador'] = '1')
end;

function TACBrECFFiscNET.GetPoucoPapel: Boolean;
begin
  FiscNETComando.NomeComando := 'LeIndicador' ;
  FiscNETComando.AddParamString('NomeIndicador','SensorPoucoPapel') ;
  EnviaComando ;

  Result := (FiscNETResposta.Params.Values['ValorNumericoIndicador'] = '1')
end;

function TACBrECFFiscNET.GetHorarioVerao: Boolean;
begin
  FiscNETComando.NomeComando := 'LeIndicador' ;
  FiscNETComando.AddParamString('NomeIndicador','HorarioVerao') ;
  EnviaComando ;

  Result := (FiscNETResposta.Params.Values['ValorNumericoIndicador'] = '1')
end;

Procedure TACBrECFFiscNET.LeituraX ;
begin
  FiscNETComando.NomeComando := 'EmiteLeituraX' ;
  FiscNETComando.TimeOut     := 15 ;
  FiscNETComando.AddParamString('Destino','I') ;
  FiscNETComando.AddParamString('Operador',Operador) ;
  EnviaComando ;
end;

Procedure TACBrECFFiscNET.AbreGaveta ;
begin
  FiscNETComando.NomeComando := 'AbreGaveta' ;
  EnviaComando ;
end;

Procedure TACBrECFFiscNET.ReducaoZ(DataHora: TDateTime) ;
begin
  FiscNETComando.NomeComando := 'EmiteReducaoZ' ;
  FiscNETComando.TimeOut     := 45 ;
  if DataHora <> 0 then
     FiscNETComando.AddParamDateTime('Hora',DataHora,'T') ;
  FiscNETComando.AddParamString('Operador',Operador) ;
  EnviaComando ;
end;

Procedure TACBrECFFiscNET.MudaHorarioVerao ;
begin
  MudaHorarioVerao( not HorarioVerao ) ;
end;

procedure TACBrECFFiscNET.MudaHorarioVerao(EHorarioVerao: Boolean);
begin
  FiscNETComando.NomeComando := 'AcertaHorarioVerao' ;
  FiscNETComando.AddParamInteger('EntradaHV',ifthen(EHorarioVerao,1,0)) ;
  EnviaComando ;
end;

procedure TACBrECFFiscNET.AbreCupom(CPF_CNPJ: String);
begin
  FiscNETComando.NomeComando := 'AbreCupomFiscal' ;
  FiscNETComando.TimeOut     := 5 ;
  FiscNETComando.AddParamString('IdConsumidor',CPF_CNPJ) ;
  EnviaComando ;
end;

procedure TACBrECFFiscNET.CancelaCupom;
begin
  FiscNETComando.NomeComando := 'CancelaCupom' ;
  FiscNETComando.TimeOut     := 5 ;
  FiscNETComando.AddParamString('Operador',Operador) ;
  EnviaComando ;

  FechaRelatorio ;   { Fecha relatorio se ficou algum aberto (só por garantia)}
end;

procedure TACBrECFFiscNET.CancelaItemVendido(NumItem: Integer);
begin
  FiscNETComando.NomeComando := 'CancelaItemFiscal' ;
  FiscNETComando.AddParamInteger('NumItem',NumItem) ;
  EnviaComando ;
end;

procedure TACBrECFFiscNET.EfetuaPagamento(CodFormaPagto: String;
  Valor: Double; Observacao: String; ImprimeVinculado: Boolean);
begin
  inherited EfetuaPagamento(CodFormaPagto, Valor, Observacao, ImprimeVinculado);

  FiscNETComando.NomeComando := 'PagaCupom' ;
  FiscNETComando.AddParamInteger('CodMeioPagamento', StrToInt(CodFormaPagto)) ;
  FiscNETComando.AddParamString('TextoAdicional',Observacao) ;
  FiscNETComando.AddParamDouble('Valor',Valor) ;
  EnviaComando ;
end;

procedure TACBrECFFiscNET.FechaCupom(Observacao: String);
begin
  FiscNETComando.NomeComando := 'EncerraDocumento' ;
  FiscNETComando.TimeOut     := 5 ;
  FiscNETComando.AddParamString('Operador',Operador) ;
  FiscNETComando.AddParamString('TextoPromocional',Observacao) ;
  EnviaComando ;
end;

procedure TACBrECFFiscNET.SubtotalizaCupom(DescontoAcrescimo: Double;
       MensagemRodape : String);
begin
  if DescontoAcrescimo = 0 then
     exit ;
  FiscNETComando.NomeComando := 'AcresceSubtotal' ;
  FiscNETComando.AddParamBool('Cancelar',False) ;
  FiscNETComando.AddParamDouble('ValorAcrescimo',DescontoAcrescimo) ;
  EnviaComando ;
end;

procedure TACBrECFFiscNET.VendeItem(Codigo, Descricao: String;
  AliquotaICMS : String; Qtd: Double; ValorUnitario: Double;
  DescontoPorc: Double; Unidade: String);
Var ValAliquota : Double ;
    Tipo        : Char;
    CodAliq     : Integer ;
    Aliquota    : TACBrECFAliquota ;
begin
//  if Qtd > 9999 then
//     raise EACBrECFCMDInvalido.Create(
//           'Quantidade deve ser inferior a 9999.');

  if Qtd <= 0 then
     raise EACBrECFCMDInvalido.Create(
           'Quantidade deve ser maior que zero.');

  if AliquotaICMS = '' then
     raise EACBrECFCMDInvalido.Create(
           'Aliquota de ICMS não pode ser vazia.');

  case AliquotaICMS[1] of
     'F' : CodAliq := -2 ;
     'I' : CodAliq := -3 ;
     'N' : CodAliq := -4 ;
     'T' :
        try
           CodAliq := StrToInt( copy(AliquotaICMS,2,2) ) ; {Indice}
        except
           raise EACBrECFCMDInvalido.Create('Aliquota inválida: '+AliquotaICMS);
        end ;
  else
   begin
     { Verificando se informou T ou S no final da Aliquota (Tipo) }
     VerificaTipoAliquota( AliquotaICMS, Tipo) ;

     try
        ValAliquota := StringToFloat( AliquotaICMS ) ;

        Aliquota := AchaICMSAliquota( ValAliquota, Tipo ) ;
        if Aliquota <> nil then
           CodAliq := StrToInt( Aliquota.Indice )
        else
           raise EACBrECFCMDInvalido.Create(
                 'Aliquota nao encontrada: '+AliquotaICMS + Tipo);
     except
        raise EACBrECFCMDInvalido.Create('Aliquota inválida: '+AliquotaICMS);
     end ;
   end

   end;

  if ArredondaPorQtd and (not Arredonda) then
     ArredondarPorQtd( Qtd, ValorUnitario );

  Unidade   := padL(Unidade,2) ;

  with FiscNETComando do
  begin
     NomeComando := 'VendeItem' ;
     AddParamInteger('CodAliquota',CodAliq) ;
     AddParamString('CodProduto',LeftStr(Codigo,48));
     AddParamString('NomeProduto',LeftStr(Descricao,200));
     AddParamDouble('PrecoUnitario',ValorUnitario);
     AddParamDouble('Quantidade',Qtd);
     AddParamString('Unidade',Unidade);
  end ;
  EnviaComando ;

  { Se o desconto é maior que zero dá o comando de desconto de item }
  if DescontoPorc > 0 then
  begin
     FiscNETComando.NomeComando := 'AcresceItemFiscal' ;
     FiscNETComando.AddParamDouble('ValorPercentual',DescontoPorc);
     EnviaComando ;
  end;
end;

procedure TACBrECFFiscNET.CarregaAliquotas;
var
  A        : Integer;
  Aliquota : TACBrECFAliquota ;
  ValAliq  : Double ;
  TipoAliq : Char ;
begin
  inherited CarregaAliquotas ;   { Cria fpAliquotas }

  { Lê as alíquotas cadastradas na impressora }
  for A := 0 to 15 do
  begin
     FiscNETComando.NomeComando := 'LeAliquota' ;
     FiscNETComando.AddParamInteger('CodAliquotaProgramavel',A) ;
     try
        EnviaComando ;

        ValAliq  := StringToFloat(
                         FiscNETResposta.Params.Values['PercentualAliquota'] );

        if UpCase(
            FiscNETResposta.Params.Values['AliquotaICMS'][1]) in ['F','N'] then
           TipoAliq := 'S'
        else
           TipoAliq := 'T' ;
        Aliquota          := TACBrECFAliquota.create ;
        Aliquota.Indice   :=
            FiscNETResposta.Params.Values['CodAliquotaProgramavel'] ;
        Aliquota.Aliquota := ValAliq ;
        Aliquota.Tipo     := TipoAliq ;

        fpAliquotas.Add( Aliquota ) ;
     except
     end;
  end;
end;

procedure TACBrECFFiscNET.ProgramaAliquota(Aliquota: Double; Tipo: Char;
   Posicao : String);
Var AliqECF  : TACBrECFAliquota ;
    Descr    : String ;
begin
  Tipo := UpCase(Tipo) ;
  if not (Tipo in ['T','S']) then
     Tipo := 'T' ;
     
  if Tipo = 'T' then
     Descr := 'ICMS: '
  else
     Descr := 'ISS: ' ;
  Descr := Descr + FloatToStr(Aliquota)+'%' ;
  
  with FiscNETComando do
  begin
     NomeComando := 'DefineAliquota' ;
     AddParamBool('AliquotaICMS',(Tipo = 'T')) ;
     AddParamInteger('CodAliquotaProgramavel', StrToIntDef(Posicao,-1) ) ;
     AddParamString('DescricaoAliquota', Descr)  ;
     AddParamDouble('PercentualAliquota',Aliquota);
  end ;
  EnviaComando ;

  { Adicionanodo nova Aliquota no ObjectList }
  AliqECF          := TACBrECFAliquota.create ;
  AliqECF.Indice   := FiscNETResposta.Params.Values['CodAliquotaProgramavel'] ;
  AliqECF.Aliquota := Aliquota ;
  AliqECF.Tipo     := Tipo ;

  fpAliquotas.Add( AliqECF ) ;
end;

procedure TACBrECFFiscNET.CarregaFormasPagamento;
  procedure CarregaFormasPagamento(Indice : Integer);
    var FPagto : TACBrECFFormaPagamento ;
  begin
     FiscNETComando.NomeComando := 'LeMeioPagamento' ;
     FiscNETComando.AddParamInteger('CodMeioPagamentoProgram',Indice) ;
     try
        EnviaComando ;

        FPagto := TACBrECFFormaPagamento.create ;
        FPagto.Indice :=
            FiscNETResposta.Params.Values['CodMeioPagamentoProgram'] ;
        FPagto.Descricao := FiscNETResposta.Params.Values['NomeMeioPagamento'] ;
        FPagto.PermiteVinculado := ( UpCase(
           FiscNETResposta.Params.Values['PermiteVinculado'][1]) in ['T','Y']) ;

        fpFormasPagamentos.Add( FPagto ) ;
     except
     end;
  end ;

Var A : Integer;
begin
  inherited CarregaFormasPagamento ;   { Cria fpFormasPagamentos }

  CarregaFormasPagamento(-2);  { Le Forma Padrão (fixa) -2 = Dinheiro }

  { Lê as Formas de Pagamento cadastradas na impressora }
  for A := 0 to 14 do
  begin
     CarregaFormasPagamento(A);
  end;
end;

procedure TACBrECFFiscNET.ProgramaFormaPagamento( var Descricao: String;
  PermiteVinculado : Boolean; Posicao : String) ;
var  FPagto: TACBrECFFormaPagamento ;
begin
  with FiscNETComando do
  begin
     NomeComando := 'DefineMeioPagamento' ;
     AddParamInteger('CodMeioPagamentoProgram', StrToIntDef(Posicao,-1) ) ;
     AddParamString('DescricaoMeioPagamento',Descricao) ;
     AddParamString('NomeMeioPagamento',Descricao) ;
     AddParamBool('PermiteVinculado',PermiteVinculado) ;
  end ;
  EnviaComando ;

  { Adicionanodo nova FPG no ObjectList }
  FPagto := TACBrECFFormaPagamento.create ;
  FPagto.Indice    := FiscNETResposta.Params.Values['CodMeioPagamentoProgram'] ;
  FPagto.Descricao := Descricao ;
  FPagto.PermiteVinculado :=  PermiteVinculado ;

  fpFormasPagamentos.Add( FPagto ) ;
end;

procedure TACBrECFFiscNET.CarregaComprovantesNaoFiscais;
Var A   : Integer ;
    CNF : TACBrECFComprovanteNaoFiscal ;
begin
  inherited CarregaComprovantesNaoFiscais ;

  for A := 0 to 14 do
  begin
     FiscNETComando.NomeComando := 'LeNaoFiscal' ;
     FiscNETComando.AddParamInteger('CodNaoFiscal',A) ;
     try
        EnviaComando ;

        CNF := TACBrECFComprovanteNaoFiscal.create ;

        CNF.Indice    := FiscNETResposta.Params.Values['CodNaoFiscal'] ;
        CNF.Descricao := FiscNETResposta.Params.Values['NomeNaoFiscal'] ;

        fpComprovantesNaoFiscais.Add( CNF ) ;
     except
     end;
  end ;
end;

procedure TACBrECFFiscNET.ProgramaComprovanteNaoFiscal(var Descricao : String;
   Tipo: String; Posicao : String);
Var CNF : TACBrECFComprovanteNaoFiscal ;
begin
  with FiscNETComando do
  begin
     NomeComando := 'DefineNaoFiscal' ;
     AddParamInteger('CodNaoFiscal', StrToIntDef(Posicao,-1) ) ;
     AddParamString('DescricaoNaoFiscal',Descricao) ;
     AddParamString('NomeNaoFiscal',Descricao) ;
     AddParamBool('TipoNaoFiscal',
                  (not (UpCase(PadR(Tipo,1)[1]) in ['-','F','0'])) ) ;
  end ;
  EnviaComando ;

  { Adicionanodo novo CNF no ObjectList }
  CNF := TACBrECFComprovanteNaoFiscal.create ;
  CNF.Indice    := FiscNETResposta.Params.Values['CodNaoFiscal'] ;
  CNF.Descricao := Descricao ;

  fpComprovantesNaoFiscais.Add( CNF ) ;
end;

procedure TACBrECFFiscNET.AbreRelatorioGerencial;
begin
  FiscNETComando.NomeComando := 'AbreGerencial' ;
  FiscNETComando.TimeOut     := 5 ;
  FiscNETComando.AddParamInteger('CodGerencial', 0 ) ;
  EnviaComando ;
end;

procedure TACBrECFFiscNET.LinhaRelatorioGerencial(Linha: String);
Var P, Espera : Integer ;
    Buffer : String ;
begin
  Linha := AjustaLinhas( Linha );  { Formata as Linhas de acordo com "Coluna" }

  while Length( Linha ) > 0 do
  begin
     { FiscNet aceita no máximo 492 caract. por comando }
     P := Length( Linha ) ;
     if P > 492 then    { Acha o fim de Linha mais próximo do limite máximo }
        P := PosLast(#10, LeftStr(Linha,492) ) ;

     Buffer := copy( Linha, 1, P)  ;
     Espera := Trunc( CountStr( Buffer, #10 ) / 4) ;

     AguardaImpressao := (Espera > 3) ;
     FiscNETComando.NomeComando := 'ImprimeTexto' ;
     FiscNETComando.TimeOut     := Espera ;
     FiscNETComando.AddParamString('TextoLivre',Buffer);
     EnviaComando ;

     Linha  := copy( Linha, P+1, Length(Linha) ) ;   // O Restante
  end ;
end;

procedure TACBrECFFiscNET.AbreCupomVinculado(COO, CodFormaPagto,
   CodComprovanteNaoFiscal :  String; Valor : Double ) ;
Var FPG : TACBrECFFormaPagamento ;
begin
  FPG := AchaFPGIndice( CodFormaPagto ) ;

  if FPG = nil then
     raise Exception.create( 'Forma de Pagamento: '+CodFormaPagto+
                             ' não foi cadastrada.' ) ;

  FiscNETComando.NomeComando := 'AbreCreditoDebito' ;
  FiscNETComando.TimeOut     := 5 ;
  FiscNETComando.AddParamInteger('CodMeioPagamento',
                                 StrToIntDef(CodFormaPagto,-2)) ;
  FiscNETComando.AddParamInteger('COO', StrToIntDef(COO,0));
  FiscNETComando.AddParamDouble('Valor',Valor);
  EnviaComando ;
end;

procedure TACBrECFFiscNET.LinhaCupomVinculado(Linha: String);
begin
  LinhaRelatorioGerencial( Linha );
end;

procedure TACBrECFFiscNET.FechaRelatorio;
begin
  if Estado = estRelatorio then
  begin
     FiscNETComando.NomeComando := 'EncerraDocumento' ;
     FiscNETComando.TimeOut     := 5 ;
     FiscNETComando.AddParamString('Operador',Operador) ;
     EnviaComando ;
  end ;
end;

procedure TACBrECFFiscNET.PulaLinhas(NumLinhas: Integer);
begin
  if NumLinhas = 0 then
     NumLinhas := LinhasEntreCupons ;

  { Alguem sabe quantos Dots tem 1 linha impressa ?? (no manual não consta :) )
    Estou considerando que uma Linha tem 9 dots }
    
  FiscNETComando.NomeComando := 'AvancaPapel' ;
  FiscNETComando.AddParamInteger('Avanco',NumLinhas * 9) ;
  EnviaComando ;
end;

procedure TACBrECFFiscNET.LeituraMemoriaFiscal(ReducaoInicial,
   ReducaoFinal : Integer);
begin
  with FiscNETComando do
  begin
     NomeComando := 'EmiteLeituraMF' ;
     AddParamString('Destino','I') ;
     AddParamBool('LeituraSimplificada',False);
     AddParamString('Operador',Operador) ;
     AddParamInteger('ReducaoFinal',ReducaoFinal) ;
     AddParamInteger('ReducaoInicial',ReducaoInicial) ;
  end ;
  FiscNETComando.TimeOut := 5 + (ReducaoFinal - ReducaoInicial) ;
  EnviaComando ;
end;

procedure TACBrECFFiscNET.LeituraMemoriaFiscal(DataInicial,
   DataFinal: TDateTime);
begin
  with FiscNETComando do
  begin
     NomeComando := 'EmiteLeituraMF' ;
     AddParamDateTime('DataFinal',DataFinal) ;
     AddParamDateTime('DataInicial',DataInicial) ;
     AddParamString('Destino','I') ;
     AddParamBool('LeituraSimplificada',False);
     AddParamString('Operador',Operador) ;
  end ;
  FiscNETComando.TimeOut := 5 + DaysBetween(DataInicial,DataFinal) ;
  EnviaComando ;
end;

procedure TACBrECFFiscNET.LeituraMemoriaFiscalSerial(ReducaoInicial,
   ReducaoFinal: Integer; var Linhas : TStringList);
Var Leitura : String ;
begin
  with FiscNETComando do
  begin
     NomeComando := 'EmiteLeituraMF' ;
     AddParamString('Destino','S') ;
     AddParamBool('LeituraSimplificada',False);
     AddParamString('Operador',Operador) ;
     AddParamInteger('ReducaoFinal',ReducaoFinal) ;
     AddParamInteger('ReducaoInicial',ReducaoInicial) ;
  end ;
  FiscNETComando.TimeOut := 5 + (ReducaoFinal - ReducaoInicial) ;
  EnviaComando ;
  Sleep(500);

  Linhas.Clear ;
  repeat
     FiscNETComando.NomeComando := 'LeImpressao' ;
     EnviaComando ;

     Leitura := FiscNETResposta.Params.Values['TextoImpressao'] ;
     Linhas.Text := Linhas.Text + Leitura ;
  until (Leitura = '') ;
end;

procedure TACBrECFFiscNET.LeituraMemoriaFiscalSerial(DataInicial,
   DataFinal: TDateTime; var Linhas : TStringList);
Var Leitura : String ;
begin
  with FiscNETComando do
  begin
     NomeComando := 'EmiteLeituraMF' ;
     AddParamDateTime('DataFinal',DataFinal) ;
     AddParamDateTime('DataInicial',DataInicial) ;
     AddParamString('Destino','S') ;
     AddParamBool('LeituraSimplificada',False);
     AddParamString('Operador',Operador) ;
  end ;
  FiscNETComando.TimeOut := 5 + DaysBetween(DataInicial,DataFinal) ;
  EnviaComando ;
  Sleep(500);

  Linhas.Clear ;
  repeat
     FiscNETComando.NomeComando := 'LeImpressao' ;
     EnviaComando ;

     Leitura := FiscNETResposta.Params.Values['TextoImpressao'] ;
     Linhas.Text := Linhas.Text + Leitura ;
  until (Leitura = '') ;
end;

procedure TACBrECFFiscNET.CorrigeEstadoErro;
begin
  try
     FiscNETComando.NomeComando := 'ReinicializaEquipamento' ;
     EnviaComando ;
     sleep(200) ;
  except
  end ;

  inherited CorrigeEstadoErro ;
end;

procedure TACBrECFFiscNET.CancelaImpressaoCheque;
begin
  FiscNETComando.NomeComando := 'ChancelaCheque' ;
  EnviaComando ;
end;

function TACBrECFFiscNET.GetChequePronto: Boolean;
begin
  FiscNETComando.NomeComando := 'LeIndicador' ;
  FiscNETComando.AddParamString('NomeIndicador','SensorCheque') ;
  EnviaComando ;

  Result := (FiscNETResposta.Params.Values['ValorNumericoIndicador'] = '1')
end;

procedure TACBrECFFiscNET.ImprimeCheque(Banco: String; Valor: Double;
  Favorecido, Cidade: String; Data: TDateTime; Observacao: String);
begin
   { Não implementado pois NAO encontrei uma tabela com as cordenadas de
     impressão para cada Banco }
end;

procedure TACBrECFFiscNET.PreparaTEF;
begin
  inherited;

  CarregaFormasPagamento ;
end;

end.
