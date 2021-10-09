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
|* 06/09/2004:  Daniel Simoes de Almeida
|*   Primeira Versao: Criaçao e Distribuiçao da Primeira Versao
|* 22/03/2005:  Daniel Simoes de Almeida  / Valmor Florez
|*   Corrigido Bug na AbreCupom, que omitia o Endereço do Emissor,
|*    -  Bug Reportado por: Valmor Florez - Evoluthiva
|*   Inserido novo comando que permite imprimir o CNPJ / CPF do Cliente, na
|*      AbreCupom
|* 22/06/2005:  Valmor Florez
|*   Corrigido Bug na VendeItem, que interpretava errado Produtos vendidos sem
|*   sem nenhuma casa decimal como 3 casas decimais.
******************************************************************************}

{$I ACBr.inc}

unit ACBrECFSchalter ;

interface
uses ACBrECFClass, ACBrUtil,
     Classes,
     {$IFDEF VisualCLX} QDialogs, QControls, QForms {$ENDIF}
     {$IFDEF VCL} Dialogs, Controls, Forms {$ENDIF} ;

const
   ByteCabecalho = #146 ;        { #146 -> Ligando os bits 1,4,7 }
   
type
{ Classe filha de TACBrECFClass com implementaçao para Schalter }
TACBrECFSchalter = class( TACBrECFClass )
 private
    fsOldResp   : String ;
    fsSemMudanca: Integer;
    fsBytesResp : Integer ;
    fsNumVersao : String ;
    fsNumSerie  : String ;
    fsNumECF    : String ;
    fsTotalPago : Double ;

    Function PreparaCmd( cmd : String ) : String ;
    Procedure ZeraVinculados ;
    Procedure AvancaLinhas ;

 protected
    function GetDataHora: TDateTime; override ;
    function GetNumCupom: String; override ;
    function GetNumECF: String; override ;
    function GetNumSerie: String; override ;
    function GetNumVersao: String; override ;
    function GetSubTotal: Double; override ;
    function GetTotalPago: Double; override ;

    function GetEstado: TACBrECFEstado; override ;
    function GetGavetaAberta: Boolean; override ;
    function GetPoucoPapel : Boolean; override ;
    function GetArredonda : Boolean; override ;

    Function VerificaFimLeitura(Retorno:String) : Boolean ; override ;

    procedure ListaRelatorioGerencial(Relatorio : TStrings; Vias : Integer = 1);
       override ;
    Procedure ListaCupomVinculado( Relatorio : TStrings; Vias : Integer = 1) ;
      override ;

 public
    Constructor create( AOwner : TComponent  )  ;
    Destructor Destroy  ; override ;

    procedure Ativar ; override ;

    Property BytesResp : Integer read fsBytesResp write fsBytesResp ;
    Function EnviaComando( cmd : String ) : String ; override ;

    Procedure AbreCupom( CPF_CNPJ : String = '') ; override ;
    Procedure VendeItem( Codigo, Descricao : String; AliquotaICMS : String;
       Qtd : Double ; ValorUnitario : Double; DescontoPorc : Double = 0;
       Unidade : String = '') ; override ;
    Procedure SubtotalizaCupom( DescontoAcrescimo : Double = 0 ;
       MensagemRodape : String  = '') ; override ;
    Procedure EfetuaPagamento( CodFormaPagto : String; Valor : Double;
       Observacao : String = ''; ImprimeVinculado : Boolean = false) ;
       override ;
    Procedure FechaCupom( Observacao : String = '') ; override ;
    Procedure CancelaCupom ; override ;
    Procedure CancelaItemVendido( NumItem : Integer ) ; override ;

    Procedure LeituraX ; override ;
    Procedure ReducaoZ(DataHora : TDateTime = 0 ) ; override ;
    Procedure AbreRelatorioGerencial ; override ;
    Procedure LinhaRelatorioGerencial( Linha : String ) ; override ;
    Procedure AbreCupomVinculado(COO, CodFormaPagto, CodComprovanteNaoFiscal :
       String; Valor : Double) ; override ;
    Procedure LinhaCupomVinculado( Linha : String ) ; override ;
    Procedure FechaRelatorio ; override ;

    Procedure MudaHorarioVerao  ; override ;
    Procedure PreparaTEF ; override ; { Carrega as Formas, de Pagamento e CNF}
    Procedure LeituraMemoriaFiscal( DataInicial, DataFinal : TDateTime ) ;
       override ;
    Procedure LeituraMemoriaFiscal( ReducaoInicial, ReducaoFinal : Integer);
       override ;
    Procedure LeituraMemoriaFiscalSerial( DataInicial, DataFinal : TDateTime;
       var Linhas : TStringList ) ; override ;
    Procedure LeituraMemoriaFiscalSerial( ReducaoInicial, ReducaoFinal : Integer;
       var Linhas : TStringList ) ; override ;

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
     SysUtils, Math,
    {$IFDEF Delphi6_UP} DateUtils, StrUtils {$ELSE} ACBrD5, Windows{$ENDIF} ;

{ ----------------------------- TACBrECFSchalter ----------------------------- }

constructor TACBrECFSchalter.create( AOwner : TComponent ) ;
begin
  inherited create( AOwner ) ;

  fpDevice.Parity    := pEven ;
  fpDevice.HandShake := hsRTS_CTS ;
  { Variaveis internas dessa classe }
  fsOldResp   := '';
  fsSemMudanca:= 0 ;
  fsBytesResp := 1 ;
  fsTotalPago := 0 ;
  fsNumVersao := '' ;
  fsNumSerie  := '' ;
  fsNumECF    := '' ;

  fpColunas   := 48 ;  { Na verdade Schalter imprime apenas 40 colunas, mas
                         todos os comandos de Impressao de Linha precisam
                         receber uma string de 48 caracteres.... Vai entender..}
  fpModeloStr := 'Schalter' ;
end;

destructor TACBrECFSchalter.Destroy;
begin

  inherited Destroy ;
end;

procedure TACBrECFSchalter.Ativar;
begin
  if not fpDevice.IsSerialPort  then
     raise Exception.Create('A impressora: '+ModeloStr+' requer'+#10+
                            'Porta Serial:  (COM1, COM2, COM3, ...)');

  fpDevice.HandShake := hsRTS_CTS ;
  inherited Ativar ; { Abre porta serial }

  fsNumVersao := '' ;
  fsNumSerie  := '' ;
  fsNumECF    := '' ;
  fsBytesResp := 1  ;
  fsSemMudanca:= 0 ;
  fsOldResp   := '' ;

  try
     { Testando a comunicaçao com a porta }
     if NumVersao = '' then
        raise EACBrECFNaoInicializado.Create(
                 'Erro inicializando a impressora '+ModeloStr );
  except
     Desativar ;
     raise ;
  end ;
end;


Function TACBrECFSchalter.EnviaComando( cmd : String ) : String ;
Var ErroMsg : String ;
    Erro : Integer ;
begin

  result  := '' ;
  ErroMsg := '' ;
  fpComandoEnviado   := '' ;
  fpRespostaComando  := '' ;
  AguardandoResposta := true ;

  try
     if (not fpDevice.Ativo) then
        raise EACBrECFNaoInicializado.create(
                 'Componente ACBrECF não está Ativo');

     { Codificando CMD de acordo com o protocolo da Schalter }
     cmd := PreparaCmd( cmd ) ;

     while not EmLinha( 1 ) do  { Impressora está em-linha ? }
     begin
        if Retentar and
           (MessageDlg('A impressora '+ModeloStr+' não está pronta.'+#10+#10+
                       'Deseja tentar novamente ?',mtConfirmation,
                       [mbYes,mbNo],0) = mrYes) then
           Continue ;

        raise EACBrECFSemResposta.create(
                 'Impressora '+ModeloStr+' não está em linha') ;
     end ;

     fpDevice.Serial.DeadlockTimeout := 2000 ; { Timeout p/ Envio }

     while fpComandoEnviado = '' do
     begin
        fpDevice.Serial.Purge ;                   { Limpa a Porta }

        try
           fpDevice.Serial.SendString( cmd );   { Eviando o comando }
           fpComandoEnviado := cmd ;
        except
           if (not Retentar) or (MessageDlg(
              'Camandos não estão sendo enviados para Impressora '+ModeloStr+
              #10+'Deseja tentar novamente ?',
              mtConfirmation,[mbYes,mbNo],0) <> mrYes) then
              raise EACBrECFSemResposta.create(
                    'Erro ao enviar comandos para a Impressora '+ModeloStr)
           else
              continue ;
        end ;
     end ;

     sleep(20) ;

     { Chama Rotina da Classe mãe TACBrClass para ler Resposta. Se houver
       falha na leitura LeResposta dispara Exceçao }
     LeResposta ;
     Result := fpRespostaComando ;
     if Result = '' then
        Result := #0 ;

     { Verificando por erros }
     ErroMsg := '' ;
     Erro    := ord( Result[1] ) ;

     case Erro of
        0 : ErroMsg := '' ;
        2 : ErroMsg := 'Impressora não responde.' ;
       27 :  { Tudo OK.  Verificando o CheckSum recebido }
          if Result <> PreparaCmd( copy(Result,3,Length(Result)-3) ) then
          begin
             ErroMsg := 'CheckSum do Retorno não é válido.' ;
             Result  := #01 ;
          end ;
       65 : ErroMsg := 'Comando não permitido com a Impressora EM VENDA.' ;
       68 : ErroMsg := 'Cabeçalho de Venda já impresso' ;
       69 : ErroMsg := 'Cabeçalho de Venda ainda não foi impresso' ;
       70 : ErroMsg := 'Valor da venda do Item é inválido' ;
       73, 118 : ErroMsg := 'Valor Total de Pagamentos‚ inferior ao Total da'+
                            ' Venda  Erro:('+IntToStr(Erro)+')' ;
       79 : ErroMsg := 'Checksum errado. Comando inválido' ;
       80 : ErroMsg := 'A palavra "TOTAL" não pode ser enviada para a Impressora' ;
       81 : ErroMsg := 'Papel próximo do fim.' ;
       86 : ErroMsg := 'Nao houve nenhum pagamento. Impossível fechar o cupom.';
       87 : ErroMsg := 'Cupom já totalizado' ;
       88 : ErroMsg := 'Não é possível cancelar VENDA, pois ainda não foi iniciada.' ;
       89 : ErroMsg := 'Comando incompleto' ;
       90 : ErroMsg := 'Cupom ainda está aberto. Termine a venda primeiro, ou cancele-a.' ;
       91 : ErroMsg := 'Impossivel cancelar. Ultimo documento não é um Cupom Fiscal.' ;
       92, 94, 112 : ErroMsg := 'Aliquota nao programada  Erro:('+IntToStr(Erro)+')' ;
       99 : ErroMsg := 'Impressora em Intervenção Técnica' ;
      100 : ErroMsg := 'Impressora em periodo de Venda. '+
                       'É necessário a impressão de uma REDUÇAO Z' ;
      101 : ErroMsg := 'Comando permitido somente sob Intervenção Técnica' ;
      102 : ErroMsg := 'Desconto Inválido, Item já possui desconto' ;
      103 : ErroMsg := 'Número de linhas comerciais excedido (8)' ;
      107 : ErroMsg := 'Comando inexistente' ;
      108 : ErroMsg := 'Não houve fechamento do dia Efetue uma Redução Z' ;
      110, 133 : ErroMsg := 'Data/Hora Inválida ('+IntToStr(Erro)+')' ;
      111, 116, 147 : ErroMsg := 'Somente é permitida a alteração da hora '+
                       'para mais ou menos uma hora, uma vez por dia '+
                       'e após a Redução Z. (Horario de verão) '+
                       'Erro: ('+IntToStr(Erro)+')' ;
      113 : ErroMsg := 'Fechamento do dia anterior não foi realizado. '+
                       'Efetue uma REDUÇÃO Z para imprimir as Vendas de HOJE.' ;
      114 : ErroMsg := 'Dia já foi fechado (REDUÇÃO Z). Impossível vender hoje'+
                       ' Impressora bloqueada até amanha' ;
      115 : ErroMsg := 'Dia já foi fechado REDUÇÃO Z já foi efetuada' ;
      126 : ErroMsg := 'Comando fora da sequencia' ;
      132 : ErroMsg := 'Houve uma queda de energia' ;
      136, 141 : ErroMsg := 'Parâmetros de Venda de Produtos errados ('+
                            IntToStr(Erro)+')' ;
      137 : ErroMsg := 'Valor da Venda muito alto' ;
      138, 148 : ErroMsg := 'Relógio fora de operação ('+IntToStr(Erro)+
                            '). Será necessária uma Intervenção Técnica.' ;
      144 : ErroMsg := 'Cupom Vinculado Pendente. Utilize a rotina '+
                       'CorrigeEstadoErro' ;
      146 : ErroMsg := 'Não há Cupom Vinculado pendente' ;
      149 : ErroMsg := 'Nenhuma forma de pagamento foi programada' ;
     else
        ErroMsg := 'Erro na impressora '+ModeloStr+' ('+IntToStr(ERRO)+')' ;
     end ;

     { NAO faz verificaça de tempo de msg para o erro "Pouco Papel", pois:
        Schalter não permite Abrir Cupom ou Vender Itens se o Erro
        81 - Pouco Papel estiver ocorrendo, por isso não podemos ignorar o erro,
        devemos gerar exceção }
     if ErroMsg <> '' then
      begin
        ErroMsg := 'Erro retornado pela Impressora: '+ModeloStr+#10+#10+
                   ErroMsg ;
        raise EACBrECFSemResposta.create(ErroMsg) ;
      end
     else
        Sleep(100) ;  { Pequena pausa entre comandos }

  finally
     AguardandoResposta := false ;
     BytesResp          := 1 ;
     fsSemMudanca       := 0 ;
     fsOldResp          := '' ;
  end ;

end;

function TACBrECFSchalter.PreparaCmd(cmd: String): String;
Var iSoma, POS : Integer ;
begin

  Result := cmd ;
  if cmd = '' then exit ;

  { comando 110 - Imp.Linha nao tem 'f' e nao tem CHKSUM }
  if ord(cmd[1]) = 110 then
  begin
     Result := #27 + cmd + #13 ;
     exit ;
  end ;

  cmd   := #27 + 'f' + cmd ;
  POS   := 1 ;
  iSoma := 0 ;

  while POS <= Length(cmd) do
  begin
     iSoma := iSoma + ord( cmd[POS] ) ;

     while iSoma > 256 do
        iSoma := iSoma - 256 ;

     POS := POS + 1 ;
  end ;
  iSoma := 256 - iSoma ;

  Result := cmd + chr( iSoma ) ;
end;


function TACBrECFSchalter.VerificaFimLeitura(Retorno:String) : Boolean;
begin
  { Lê até atingir todos os Bytes esperados (BytesResp) e ECF entra EmLinha}
  { BytesResp é necessário, pois a Schalter nao usa um Sufixo padrão no fim
    da resposta da Impressora. }
  Result := false ;

  if BytesResp < 0 then   { Comandos com Tamanho de Resposta Variavel }
   begin
     if fsOldResp = Retorno then  { Parou de receber Dados ? } 
        fsSemMudanca := fsSemMudanca + 1
     else
        fsSemMudanca := 0 ;

     fsOldResp := Retorno ;
     if fsSemMudanca > 3 then   { Ficou 4 loops sem receber novos dados... FIM }
        Result := true ;
   end
  else
     if Length( Retorno ) >= BytesResp then
        Result := true ;

  { Verifica se impressora retornou erro e NAO o Retorno esperado }
  if (BytesResp <> 1) and (Length( Retorno ) = 1) and
     (copy(Retorno,1,1) <> #27) then
     Result := true

end;

function TACBrECFSchalter.GetDataHora: TDateTime;
Var RetCmd : String ;
    OldShortDateFormat : String ;
begin
  BytesResp := 73 ;
  RetCmd := EnviaComando( #224 + '  ' ) ;
  OldShortDateFormat := ShortDateFormat ;
  try
     ShortDateFormat := 'dd/mm/yy' ;
     result := StrToDate(copy(RetCmd,23,2)+'/'+copy(RetCmd,26,2)+'/'+copy(RetCmd,29,2)) ;
  finally
     ShortDateFormat := OldShortDateFormat ;
  end ;
  result := RecodeHour(  result,StrToInt(copy(RetCmd,17,2))) ;
  result := RecodeMinute(result,StrToInt(copy(RetCmd,19,2))) ;
  result := RecodeSecond(result,StrToInt(copy(RetCmd,21,2))) ;
end;

function TACBrECFSchalter.GetNumCupom: String;
Var RetCmd : String ;
    Num : Integer ;
    ForaDeCupom : Boolean ;
begin
  Result    := '      ' ;
  BytesResp := 73 ;
  RetCmd := EnviaComando( #224 + '  ' ) ;
  Num         := StrToInt( copy(RetCmd,9,6) ) ;
  ForaDeCupom := (RetCmd[8] = '2') ;

  Result := IntToStrZero( Num - {$IFDEF FPC}ACBrUtil.{$ENDIF}IfThen(ForaDeCupom,1,0), 6 ) ;
end;

function TACBrECFSchalter.GetNumECF: String;
Var RetCmd : String ;
begin
  if Trim(fsNumECF) = '' then
  begin
     BytesResp := 73 ;
     RetCmd    := EnviaComando( #224 + '  ' ) ;
     fsNumECF  := copy(RetCmd,4,4) ;
  end ;

  Result := fsNumECF ;
end;

function TACBrECFSchalter.GetNumSerie: String;
Var RetCmd : String ;
begin
  if Trim(fsNumSerie) = '' then
  begin
     BytesResp  := 53 ;
     RetCmd     := EnviaComando( #228 + '  ') ;
     fsNumSerie := trim(copy(RetCmd,36,10)) ;
  end ;

  Result := fsNumSerie ;
end;

function TACBrECFSchalter.GetNumVersao: String ;
Var RetCmd : String ;
begin
  if fsNumVersao = '' then
  begin
     BytesResp   := 53 ;
     RetCmd      := EnviaComando( #228 + '  ' ) ;
     if copy(RetCmd,1,3) = #27 + 'f' + #228 then
     begin
        fsNumVersao := copy(RetCmd,31,4) ;
        fsNumVersao := StringReplace(fsNumVersao,',',DecimalSeparator,[]) ;
        fsNumVersao := StringReplace(fsNumVersao,'.',DecimalSeparator,[]) ;
     end ;
  end ;

  Result := fsNumVersao ;
end;

function TACBrECFSchalter.GetTotalPago: Double;
begin
  Result := fsTotalPago ;
end;

function TACBrECFSchalter.GetSubTotal: Double;
Var RetCmd : String ;
begin
  BytesResp := 73 ;
  RetCmd    := copy( EnviaComando( #224 + '  ' ),31,21) ;
  RetCmd    := StringReplace(RetCmd,'.','',[rfReplaceAll]) ; 
  RetCmd    := StringReplace(RetCmd,',',DecimalSeparator,[rfReplaceAll]) ;

  Result    := StrToFloatDef( RetCmd, 0 ) ; 
end;


function TACBrECFSchalter.GetEstado: TACBrECFEstado;
Var RetCmd : String ;
    EstInt : Integer ;
begin
  if (not fpAtivo) then
     fpEstado := estNaoInicializada
  else
   begin
     BytesResp := 8 ;
     RetCmd    := EnviaComando( #223 + '  ' ) ;
     EstInt    := ord( RetCmd[6] ) ;

     case EstInt of
        99 : fpEstado := estDesconhecido ;
       115 : fpEstado := estBloqueada ;
       113 : fpEstado := estRequerZ ;
       122 : fpEstado := estRelatorio ;
       123,124 : fpEstado := estPagamento ;
        65, 90 : fpEstado := estVenda ;
     else ;
        fpEstado := estLivre ;
     end;

   end ;

  Result := fpEstado ;
end;

function TACBrECFSchalter.GetGavetaAberta: Boolean;
Var RetCmd : String ;
begin
  BytesResp := 8 ;
  RetCmd    := EnviaComando( #223 + '  ' ) ;
  Result    := TestBit(ord(RetCmd[7]),3) ;
end;

function TACBrECFSchalter.GetPoucoPapel: Boolean;
Var RetCmd : String ;
begin
  BytesResp := 8 ;
  RetCmd    := EnviaComando( #223 + '  ' ) ;
  Result    := TestBit(ord(RetCmd[7]),1) ;
end;

function TACBrECFSchalter.GetArredonda: Boolean;
begin
  Result := true ;  { ACBrECF sempre tenta arredondar na Schalter }
end;

Procedure TACBrECFSchalter.LeituraX ;
begin
  BytesResp := 1 ;
  EnviaComando( #20 + PadL(Operador,8), 35) ;
  AvancaLinhas ;
end;

Procedure TACBrECFSchalter.AbreGaveta ;
begin
  BytesResp := 1 ;
  EnviaComando( #250 + '  ' ) ;
  sleep(100) ;
end;

Procedure TACBrECFSchalter.ReducaoZ(DataHora: TDateTime) ;
begin
  BytesResp := 1 ;
  EnviaComando( #19 + PadL(Operador,8), 35) ;   { Schalter NAO usa DataHora }
  AvancaLinhas ;

  ZeraVinculados ;
end;

Procedure TACBrECFSchalter.MudaHorarioVerao ;
Var Hora : String ;
begin
  Hora := copy( TimeToStr( IncHour( now, -1) ), 1,5) ;
  if not InputQuery('Horário de Verão', 'Informe o novo horário', Hora ) then
     exit ;

  BytesResp := 1 ;
  EnviaComando( #22 + '01' + copy(Hora,4,2) + copy(Hora,1,2) +
                       ' ' + FormatDateTime('ddmmyy',now) )
end;

procedure TACBrECFSchalter.AbreCupom(CPF_CNPJ: String);
var TamDoc : Integer ;
begin
  fpUltimaMsgPoucoPapel := 0 ;  { Zera tempo pra msg de pouco papel }

  { Efetuando carga dos CNF's pois Nao permite carregar depois que abrir cupom }
  if not Assigned( fpComprovantesNaoFiscais ) then
     CarregaComprovantesNaoFiscais ;

  CPF_CNPJ := Trim(CPF_CNPJ) ;
  TamDoc := Length(CPF_CNPJ) ;

  BytesResp := 1 ;
  EnviaComando( #01 + ByteCabecalho ,10) ;

  fsTotalPago := 0 ;

  if StrToFloat( NumVersao ) <= 3 then
   begin
     EnviaComando( #110 + padL('Item  Codigo      Descricao',Colunas) ) ;
     EnviaComando( #110 + padL('                    Qtd            Preco',
        Colunas) ) ;
   end
  else
   begin
     BytesResp := 1 ;
     if TamDoc > 11 then    { É CNPJ ? }
        EnviaComando( #05 + '  ' + PadL(CPF_CNPJ,18) + StringOfChar(' ',11), 5)
     else if TamDoc > 0 then  { Enviou algum Documento ? }
        EnviaComando( #05 + '  ' + StringOfChar(' ',18) + PadL(CPF_CNPJ,11), 5);
   end ;
end;

procedure TACBrECFSchalter.CancelaCupom;
Var EstImp : TACBrECFEstado ;
    SubTot, TotPag : Double ;
begin

  BytesResp := 1 ;
  EstImp    := Estado ;  { para ler estado da impressora apenas 1 vez }

  if EstImp = estVenda then
     { Cancelamento de Documento Atual }
     EnviaComando( #07 + '  ' + PadL(Operador,8) + '    ', 15)
  else
   begin
     if EstImp = estPagamento then
     begin
        SubTot := Subtotal ;  { para ler SubTotal da impressora apenas 1 vez }
        TotPag := TotalPago ;

        if (SubTot > 0) and (TotPag < SubTot) then
           try
              EfetuaPagamento('00',SubTot-TotPag,'CUPOM SERA CANCELADO');
           except
           end ;

        { Fechando Cupom }
        EnviaComando( #06 + '  ' + PadL(Operador,8), 15) ;
     end ;

     { Cancelamento de Documento Anterior }
     EnviaComando( #199 + '  ' + PadL(Operador,8) ,15) ;
   end ;

  fsTotalPago := 0 ;
  AvancaLinhas ;
  FechaRelatorio ;   { Fecha relatorio se ficou algum aberto (só por garantia)}
end;

procedure TACBrECFSchalter.CancelaItemVendido(NumItem: Integer);
begin
  BytesResp := 1 ;
  EnviaComando(#212 + IntToStrZero( NumItem ,4) + StringOfChar(' ',30) ) ;
end;

procedure TACBrECFSchalter.EfetuaPagamento(CodFormaPagto: String;
  Valor: Double; Observacao: String; ImprimeVinculado: Boolean);
Var FlagObs : Char ;
begin
  inherited EfetuaPagamento(CodFormaPagto, Valor, Observacao, ImprimeVinculado);

  Observacao := LeftStr(Observacao,48) ;
  FlagObs    := chr( {$IFDEF FPC}ACBrUtil.{$ENDIF}IfThen(Observacao = '',0,1) ) ;
  BytesResp  := 1 ;
  EnviaComando( #213 + #0 + FlagObs + #0 + StringOfChar(' ',10) +
                CodFormaPagto + IntToStrZero( Round( Valor * 100),10) ) ;

  fsTotalPago := fsTotalPago + Valor ;

  if Observacao <> '' then
     EnviaComando( #110 + padL( Observacao, Colunas) ) ;
end;

procedure TACBrECFSchalter.FechaCupom(Observacao: String);
Var A,P,N : Integer ;
begin
  BytesResp := 1 ;
  { Quebrando e Imprimindo as linhas de Observaçao }
  A := 1 ; 
  while (A <= 8) and (Length(Observacao) > 0) do
  begin
     P := pos(#10,Observacao) ;
     N := 1 ;
     if P = 0 then
     begin
        P := min(Length( Observacao ), Colunas) ;
        N := 0 ;
     end ;

     EnviaComando( #110 + padL( copy(Observacao,1,P-N) , Colunas) ) ;

     A := A + 1 ;
     Observacao := copy(Observacao, P+1, Length(Observacao) ) ;
  end ;

  { Fechando o Documento }
  EnviaComando( #06 + '  ' + PadL(Operador,8) ,10) ;

  fsTotalPago := 0 ;
  AvancaLinhas ;
end;

procedure TACBrECFSchalter.SubtotalizaCupom(DescontoAcrescimo: Double;
       MensagemRodape : String);
Var A_D : Char ;
begin
  BytesResp := 1 ;
  EnviaComando( #209 + ' ' ) ;

  if DescontoAcrescimo <> 0 then
  begin
     A_D := chr( {$IFDEF FPC}ACBrUtil.{$ENDIF}ifThen( DescontoAcrescimo < 0,0,1 ) );

     EnviaComando( #217 + A_D + #0 +
        padL(ifThen(DescontoAcrescimo < 0,'Desconto:','Acrescimo:'),25) +
        IntToStrZero( Round(abs(DescontoAcrescimo) * 100),10) ) ;
  end ;

  fsTotalPago := 0 ;
end;

procedure TACBrECFSchalter.VendeItem(Codigo, Descricao: String;
  AliquotaICMS : String; Qtd: Double; ValorUnitario: Double;
  DescontoPorc: Double; Unidade: String);
Var AliquotaStr, QtdStr, ValorStr : String ;
    ValAliquota : Double ;
    Aliquota : TACBrECFAliquota ;
    Decimais : Integer ;
    Tipo : Char ;
begin
  if Qtd > 99999 then
     raise EACBrECFCMDInvalido.Create(
           'Quantidade deve ser inferior a 99999.');

  case AliquotaICMS[1] of
    'F' : AliquotaStr := '16' ;
    'I' : AliquotaStr := '17' ;
    'N' : AliquotaStr := '18' ;
    'T' : AliquotaStr := padR(copy(AliquotaICMS,2,2),2,'0') ; {Indice}
  else
   begin
      { Verificando se informou T ou S no final da Aliquota (Tipo) }
     VerificaTipoAliquota( AliquotaICMS, Tipo) ;

     try
        ValAliquota := StrToFloat( AliquotaICMS ) ;
     except
        raise EACBrECFCMDInvalido.Create('Aliquota inválida: '+AliquotaICMS);
     end ;

     Aliquota := AchaICMSAliquota( ValAliquota, Tipo ) ;
     if Aliquota <> nil then
        AliquotaStr := Aliquota.Indice
     else
        raise EACBrECFCMDInvalido.Create(
              'Aliquota nao encontrada: '+AliquotaICMS + Tipo);
   end
  end;
  
  { SCHALTER TRUNCA quando PrecoUnit tem 3 ou mais decimais, com 2 decimais ela
   arredonda. Caso o PrecoUnit tenha 3 decimais, aumentamos a QTD até o valor
   TOTAL truncado atingir o Valor Esperado }
  if ArredondaPorQtd then
     if RoundTo(ValorUnitario,-2) <> ValorUnitario then {Tem mais de 2 casas dec ?}
        ArredondarPorQtd( Qtd, ValorUnitario );  { ajusta a Qtd para Arredondar }

  Codigo      := padL(Codigo,13) ;
  Descricao   := padL(Descricao,62) ;
  Unidade     := padL(Unidade,2) ;
  Decimais    := 2 ;
  QtdStr      := FloatToStr(Qtd) ;
  if Length(QtdStr) > 7 then
     QtdStr := FloatToStr(RoundTo(Qtd,-(7-pos(DecimalSeparator,QtdStr)))) ;
  QtdStr := PadR(StringReplace(QtdStr,DecimalSeparator,',',[rfReplaceAll]),7,'0') ;

  if StrToFloat( NumVersao ) > 3 then
  begin
     ValorStr := FloatToStr(ValorUnitario) ;

     Decimais := pos(DecimalSeparator,ValorStr) ;
     if Decimais = 0 then
        Decimais := 2
     else
      begin
        Decimais := Length(ValorStr) - Decimais ;
        Decimais := {$IFDEF FPC}ACBrUtil.{$ENDIF}IfThen(Decimais > 2,3,2) ;
      end ;
  end ;

  BytesResp := 1 ;
  EnviaComando( #208 + '    ' + Codigo + ' ' + Descricao + QtdStr + 'x' +
                Unidade + StringOfChar(' ',9) + IntToStr(Decimais) + 
                IntToStrZero( Round(ValorUnitario * IntPower(10,Decimais)),9) +
                AliquotaStr ) ;
  fsTotalPago := 0 ;
  
  if DescontoPorc > 0 then
     EnviaComando( #211 + #3 + ' ' + #0 + StringofChar(' ',65) +
              IntToStrZero( Round(ValorUnitario*Qtd*DescontoPorc), 9) ) ;
end;

procedure TACBrECFSchalter.CarregaAliquotas;
Var RetCmd,ValStr : String ;
    Aliquota : TACBrECFAliquota ;
    ValAliq : Double ;
    A :Integer ;
begin
  inherited CarregaAliquotas ;   { Cria fpAliquotas }

  for A := 0 to 15 do
  begin
     BytesResp := 42 ;
     RetCmd    := EnviaComando( #225 + IntToStrZero(A,2)) ;
     ValStr    := StringReplace(copy(RetCmd,5,5),',',DecimalSeparator,[]);
     ValAliq   := StringToFloatDef( ValStr, 0 ) ;

     if ValAliq > 0 then
     begin
        Aliquota := TACBrECFAliquota.create ;

        Aliquota.Indice   :=IntToStrZero(A,2) ;
        Aliquota.Aliquota := ValAliq ;
        if copy(RetCmd,4,1) = 'S' then
           Aliquota.Tipo  := 'S';

        fpAliquotas.Add( Aliquota ) ;
    end ;
  end ;
end;

procedure TACBrECFSchalter.ProgramaAliquota(Aliquota: Double; Tipo: Char;
   Posicao : String);
Var ProxIndice : Integer ;
    ValStr : String ;
    Aliq : TACBrECFAliquota ;
begin
  ValStr := IntToStrZero( Round(Aliquota * 100) ,4) ;
  Tipo := UpCase(Tipo) ;
  if Tipo <> 'S' then
     Tipo := 'T' ;
     
  CarregaAliquotas ;

  ProxIndice := StrToIntDef(Posicao,-1) ;
  if (ProxIndice < 0) or (ProxIndice > 15) then { Indice passado é válido ? }
  begin
     For ProxIndice := 0 to 16 do  { Procurando Lacuna }
     begin
        if AchaICMSIndice(IntToStrZero(ProxIndice,2)) = nil then
           break ;
     end ;
  end ;
  
  if ProxIndice > 15 then
     raise Exception.create('Não há espaço para programar novas Aliquotas');

  BytesResp := 1 ;
  EnviaComando( #34 + IntToStrZero(ProxIndice,2) + Tipo + ValStr ) ;

  { Adcionanodo nova Aliquota no ObjectList }
  Aliq := TACBrECFAliquota.create ;
  Aliq.Indice   := IntToStrZero(ProxIndice,2) ;
  Aliq.Aliquota := Aliquota ;
  Aliq.Tipo     := Tipo ;
  fpAliquotas.Add( Aliq ) ;
end;

procedure TACBrECFSchalter.CarregaFormasPagamento;  { funçao Lenta +- 3 sec. }
Var RetCmd, Descricao : String ;
    Cont : Integer ;
    FPagto : TACBrECFFormaPagamento ;
begin
  inherited CarregaFormasPagamento ;       {Inicializa fpFormasPagamentos}

   for Cont := 0 to 19 do
   begin
      BytesResp := 48 ;
      RetCmd    := EnviaComando( #226 + IntToStrZero(Cont,2)) ;
      Descricao := Trim(UpperCase(copy(RetCmd,6,20))) ;

      if (RetCmd[4] = 'S') and (Descricao <> '') then
      begin
         FPagto := TACBrECFFormaPagamento.create ;

         FPagto.Indice    := IntToStrZero(Cont,2) ;
         FPagto.Descricao := Descricao ;
         FPagto.PermiteVinculado := (RetCmd[5] = 'S');

         fpFormasPagamentos.Add( FPagto ) ;
      end ;
   end ;
end;

procedure TACBrECFSchalter.ProgramaFormaPagamento(var Descricao: String;
  PermiteVinculado: Boolean; Posicao : String);
Var ProxIndice : Integer ;
    FPagto : TACBrECFFormaPagamento ;
begin
  Descricao := padL(Descricao,20) ;

  CarregaFormasPagamento ;

  ProxIndice := StrToIntDef(Posicao,-1) ;
  if (ProxIndice < 0) or (ProxIndice > 19) then { Indice passado é válido ? }
  begin
     For ProxIndice := 0 to 20 do  { Procurando Lacuna }
     begin
        if AchaCNFIndice(IntToStrZero(ProxIndice,2)) = nil then
           break ;
     end ;
  end ;

  if ProxIndice > 19 then
     raise Exception.create('Não há espaço para programar novas Formas de '+
                            'Pagamento');

  BytesResp := 1 ;
  EnviaComando( #36 + IntToStrZero(ProxIndice,2) + Descricao ) ;

  { Adcionanodo nova FPG no ObjectList }
  FPagto := TACBrECFFormaPagamento.create ;
  FPagto.Indice    := IntToStrZero(ProxIndice,2) ;
  FPagto.Descricao := Descricao ;
  fpFormasPagamentos.Add( FPagto ) ;

  if PermiteVinculado then
     ProgramaComprovanteNaoFiscal(Descricao,'V'+IntToStrZero(ProxIndice,2));

  FPagto.PermiteVinculado := PermiteVinculado ;
end;

procedure TACBrECFSchalter.CarregaComprovantesNaoFiscais;
Var RetCmd, Descricao : String ;
    Cont : Integer ;
    CNF : TACBrECFComprovanteNaoFiscal ;
begin
  inherited CarregaComprovantesNaoFiscais ;{Inicializa fpComprovantesNaoFiscais}

   for Cont := 0 to 19 do
   begin
      BytesResp := 124 ;
      RetCmd    := EnviaComando( #227 + IntToStrZero(Cont,2)) ;
      Descricao := Trim(UpperCase(copy(RetCmd,5,20))) ;

      if (RetCmd[4] = 'S') and (Descricao <> '') then
      begin
         CNF := TACBrECFComprovanteNaoFiscal.create ;

         CNF.Indice           := IntToStrZero(Cont,2) ;
         CNF.Descricao        := Descricao ;
         CNF.PermiteVinculado := ( copy(RetCmd,30,1) = 'S' ) ;
         CNF.FormaPagamento   :=   copy(RetCmd,31,2) ;

         fpComprovantesNaoFiscais.Add( CNF ) ;
      end ;
   end ;
end;

procedure TACBrECFSchalter.ProgramaComprovanteNaoFiscal(var Descricao: String;
  Tipo: String; Posicao : String );
Var P, ProxIndice, IndiceFPG : Integer ;
    FlagD, FlagA, FlagC, FlagP, FlagV : String ;
    FPG : TACBrECFFormaPagamento ;
    DescrFPG : String ;
    CNF : TACBrECFComprovanteNaoFiscal ;
begin
  Tipo      := UpperCase(Tipo) ;
  Descricao := padL(Descricao,20) ;
  IndiceFPG := 0 ;
  DescrFPG  := '' ;

  if Tipo = '' then
     Tipo := 'DAC'
  else
   begin
     IndiceFPG := StrToIntDef(Tipo,0) ;
     if IndiceFPG = 0 then            { Passou apenas o Indice de uma FPG ? }
     begin
        P := pos( 'V',Tipo) ;
        if P > 0 then
        begin
           IndiceFPG := StrToIntDef(copy(Tipo,P+1,2),0) ;
           if IndiceFPG = 0 then
              raise Exception.Create('A impressora '+ModeloStr+' necessita como '+
                    'parâmetro o Indice de uma Forma de Pagamento para permitir '+
                    'o Vinculado.'+sLineBreak+sLineBreak+
                    'Experimente passar para o parametro Tipo '+
                    'o valor "V99" onde 99 é o indice da Forma de Pagamento a '+
                    'ser usada para o Vinculo.') ;
        end ;
     end ;
   end ;

  if IndiceFPG > 0 then
     Tipo := 'V'
  else
     if IndiceFPG <> 99 then  { 99 = Vinculo a Cupom }
     begin
        FPG := AchaFPGIndice(IntToStrZero(IndiceFPG,2)) ;
        if FPG = nil then
           raise Exception.Create('Forma de Pagamento: '+
                                  IntToStrZero(IndiceFPG,2)+ ' não encontrada.') ;
        DescrFPG := FPG.Descricao ;
     end ;

  FlagD := ifThen(pos('D',Tipo) > 0,'S','N') ;
  FlagA := ifThen(pos('A',Tipo) > 0,'S','N') ;
  FlagC := ifThen(pos('C',Tipo) > 0,'S','N') ;
  FlagP := ifThen(pos('P',Tipo) > 0,'S','N') ;
  FlagV := ifThen(pos('V',Tipo) > 0,'S','N') ;

  CarregaComprovantesNaoFiscais ;
  
  ProxIndice := StrToIntDef(Posicao,-1) ;
  if (ProxIndice < 0) or (ProxIndice > 19) then { Indice passado é válido ? }
  begin
     For ProxIndice := 0 to 20 do  { Procurando Lacuna }
     begin
        if AchaCNFIndice(IntToStrZero(ProxIndice,2)) = nil then
           break ;
     end ;
  end ;

  if ProxIndice > 19 then
     raise Exception.create('Não há espaço para programar novos Comprovantes'+
                            ' não Fiscais');

  if (IndiceFPG > 0) and (IndiceFPG <> 99) then
  begin
     if MessageDlg('Atenção. Você irá criar um vinculo entre:'+sLineBreak+
                   'Forma de Pagamento: '+DescrFPG+' e o '+sLineBreak+
                   'Comprovante não Fiscal: '+Descricao+sLineBreak+sLineBreak+
                   'Dessa maneira, toda vez que a Forma de Pagamento for '+
                   'utilizada, será OBRIGATÓRIA a emissao de um Comprovante '+
                   'Não Fiscal Vinculado. (Consulte o manual da '+ModeloStr+
                   ')'+sLineBreak+sLineBreak+'Continua com a operação ?',
                   mtConfirmation,mbYesNoCancel,0) <> mrYes then
        raise Exception.create('Programaçao de Comprovante não Fiscal cancelada');
  end ;

  BytesResp := 1 ;
  EnviaComando( #35 + IntToStrZero(ProxIndice,2) + Descricao +
                StringOfChar(' ',20) + FlagD + FlagA + FlagC + FlagP + FlagV +
                IntToStrZero(IndiceFPG,2) ) ;

  { Adcionanodo novo CNF no ObjectList }
  CNF := TACBrECFComprovanteNaoFiscal.create ;
  CNF.Indice           := IntToStrZero(ProxIndice,2) ;
  CNF.Descricao        := Descricao ;
  CNF.PermiteVinculado := (FlagV = 'S') ;
  CNF.FormaPagamento   := IntToStrZero(IndiceFPG,2) ;
  fpComprovantesNaoFiscais.Add( CNF ) ;
end;


procedure TACBrECFSchalter.AbreRelatorioGerencial;
begin
  BytesResp := 1 ;
  EnviaComando( #16 + PadL(Operador,8) ,35 ) ;
end;

procedure TACBrECFSchalter.LinhaRelatorioGerencial(Linha: String);
begin
  BytesResp := 1 ;
  EnviaComando( #110 + padL( Linha,48) ) ;
end;

procedure TACBrECFSchalter.AbreCupomVinculado(COO, CodFormaPagto,
  CodComprovanteNaoFiscal: String; Valor: Double);
Var FPG : TACBrECFFormaPagamento ;
    CNF : TACBrECFComprovanteNaoFiscal ;
    StrValor : String ;
begin
  FPG := AchaFPGIndice( CodFormaPagto ) ;
  if FPG = nil then
     raise Exception.create( 'Forma de Pagamento: '+CodFormaPagto+
                             ' não foi cadastrada.' ) ;

  if CodComprovanteNaoFiscal <> '' then
   begin
     CNF := AchaCNFIndice( CodComprovanteNaoFiscal ) ;
     if CNF = nil then
        raise Exception.create( 'Comprovante NÃO Fiscal: '+
                         CodComprovanteNaoFiscal+' não cadastrado.' ) ;
   end
  else
   begin
     CNF := AchaCNFFormaPagamento( FPG.Indice ) ;
     if CNF = nil then
        raise Exception.create( 'Não existe nenhum Comprovante NÃO Fiscal '+
                         ' associado a Forma de Pagamento: '+FPG.Indice ) ;
   end ;

  if not CNF.PermiteVinculado then
     raise Exception.create( 'O Comprovante não Fiscal: '+CNF.Descricao+
                             ' não permite Cupom NÃO Fiscal Vinculado' ) ;
                             
  COO      := Poem_Zeros( trim(COO) ,6) ;
  StrValor := IntToStrZero( Round(Valor * 100) ,9) ;

  BytesResp := 1 ;
  { Abrindo Cabeçalho }
  EnviaComando( #01 + ByteCabecalho,10) ;
  { Informando que será Cupom NAO Fiscal Vinculado }
  EnviaComando( #222 + COO + CNF.Indice + StrValor ,10) ;
end;

procedure TACBrECFSchalter.LinhaCupomVinculado(Linha: String);
begin
  LinhaRelatorioGerencial( Linha ) ; 
end;

procedure TACBrECFSchalter.FechaRelatorio;
Var RetCmd : String ;
    EstInt : Integer ;
begin
  BytesResp := 8 ;
  RetCmd    := EnviaComando( #223 + '  ' ) ;
  EstInt    := ord( RetCmd[6] ) ;

  if (EstInt = 90) or (EstInt = 122) or ( EstInt = 124) then
  begin
     BytesResp := 1 ;
     EnviaComando( #06 + '  ' + padL(Operador,8), 10 ) ;
     AvancaLinhas ;
  end
end;


procedure TACBrECFSchalter.ListaRelatorioGerencial(Relatorio: TStrings;
  Vias: Integer);
Var Imp, Linha : Integer ;
    Texto : String ;
begin
  Imp := 0 ;

  while Imp < Vias do
  begin
     try
        Texto := Format(MsgRelatorio,['Relatório Gerêncial',Imp+1 ]) ;
     except
        Texto := MsgRelatorio ;
     end ;

     PintaFormMsg( Texto );

     Linha := 0 ;
     while Linha <= ( Relatorio.Count - 1) do
     begin
        LinhaRelatorioGerencial( LeftStr( Relatorio[ Linha ], fpColunas) ) ;
        Linha := Linha + 1 ;

        if not BloqueiaMouseTeclado then
           Application.ProcessMessages ;
     end ;

     Imp := Imp + 1 ;

     if Imp < Vias then
     begin
        AvancaLinhas ;
        PausarRelatorio( Imp ) ;
     end ;
  end ;

  PintaFormMsg( 'Fechando Relatório Gerencial' );
  FechaRelatorio ;

end;

procedure TACBrECFSchalter.ListaCupomVinculado(Relatorio: TStrings;
  Vias: Integer);
Var Imp, Linha : Integer ;
    Texto : String ;
begin
  Imp := 0 ;

  while Imp < Vias do
  begin
     try
        Texto := Format(MsgRelatorio,['Cupom Vinculado',Imp+1 ]) ;
     except
        Texto := MsgRelatorio ;
     end ;

     PintaFormMsg( Texto );

     Linha := 0 ;
     while Linha <= ( Relatorio.Count - 1) do
     begin
        LinhaCupomVinculado( LeftStr( Relatorio[ Linha ], fpColunas) ) ;
        Linha := Linha + 1 ;

        if not BloqueiaMouseTeclado then
           Application.ProcessMessages ;
     end ;

     Imp := Imp + 1 ;

     if Imp < Vias then
     begin
        AvancaLinhas ;
        PausarRelatorio( Imp ) ;
     end ;
  end ;

  PintaFormMsg( 'Fechando Cupom Vinculado' );
  FechaRelatorio ;

end;

procedure TACBrECFSchalter.PreparaTEF;
begin
  inherited PreparaTEF ;

  CarregaFormasPagamento ;
  CarregaComprovantesNaoFiscais ;
end;

procedure TACBrECFSchalter.ZeraVinculados;
Var Pos : Integer ;
    RetCmd, FPG, COO : String ;
    Valor : Double ;
    Texto : TStringList ; 
begin
  { Na Schalter, se houver mais de 30 Cupons vinculados pendentes a Impressora
    pode ficar travada. Essa rotina irá imprimir e cancelar esses Cupons
    Vinculados pendentes.
    - Esse problema pode ocorrer se você associar um CNF a uma Forma de Pagamento.
    Nesse caso SEMPRE que a Forma de pagamento for utilizada obrigatoriamente
    deverá ser listado um Cupom NAO Fiscal Vinculado. Cuidado: Nunca crie um
    vinculo na forma de Pagamento DINHEIRO }

  if StrToFloat( NumVersao ) <= 3 then exit ;

  Texto := TStringList.Create ;

  try
     Texto.Clear ;
     Texto.Text := '** CANCELANDO VINCULO PENDENTE **' ;

     For POS := 1 to 30 do
     begin
        BytesResp := 67 ;
        RetCmd    := EnviaComando( #231 + IntToStrZero(Pos,2) ) ;

        if RetCmd[4] = 'S' then { Pendencia existente ? ...cancelando }
        begin
           FPG   := copy(RetCmd, 5,2) ;
           COO   := copy(RetCmd,50,6) ;
           Valor := StrToFloatDef( StringReplace( StringReplace( copy(RetCmd,
              8,20),'.','',[rfReplaceAll]) ,',', DecimalSeparator,[]), 0) ;
           if Valor = 0 then
              Valor := StrToFloatDef( StringReplace( StringReplace( copy(RetCmd,
                 29,20),'.','',[rfReplaceAll]) ,',', DecimalSeparator,[]), 0 ) ;

           CupomVinculado(COO, FPG ,'', Valor ,Texto);
           CancelaCupom ;
        end ;
     end ;
  finally
     Texto.Free ;
  end ;

end;

procedure TACBrECFSchalter.AvancaLinhas;
begin
  BytesResp := 1 ;
  EnviaComando( #236 + '1'+IntToStrZero(LinhasEntreCupons,2)) ;
end;

procedure TACBrECFSchalter.LeituraMemoriaFiscal(ReducaoInicial,
   ReducaoFinal: Integer);
Var Espera : Integer ;
begin
  Espera := 10 + (ReducaoFinal - ReducaoInicial) ;
  BytesResp := 1 ;
  EnviaComando( #21 + #2 + IntToStrZero(0,12) +
                     IntToStrZero(ReducaoInicial,4)+
                     IntToStrZero(ReducaoFinal  ,4), Espera ) ;
end;

procedure TACBrECFSchalter.LeituraMemoriaFiscal(DataInicial,
   DataFinal: TDateTime);
Var Espera : Integer ;
begin
  Espera := 10 + DaysBetween(DataInicial,DataFinal) ;
  BytesResp := 1 ;
  EnviaComando( #21 + #1 + FormatDateTime('ddmmyy',DataInicial)+
                           FormatDateTime('ddmmyy',DataFinal)  +
                           IntToStrZero(0,8),   Espera ) ;
end;

procedure TACBrECFSchalter.LeituraMemoriaFiscalSerial(ReducaoInicial,
   ReducaoFinal: Integer; var Linhas: TStringList);
Var Espera : Integer ;
begin
  Espera := Trunc(TimeOut + ((ReducaoFinal - ReducaoInicial)/5) ) ;
  BytesResp := -1 ;   { Reposta de Tamanho Variavel }
  Linhas.Clear ;
  Linhas.Text := EnviaComando( #21 + #4 + IntToStrZero(0,12) +
                     IntToStrZero(ReducaoInicial,4)+
                     IntToStrZero(ReducaoFinal  ,4), Espera ) ;
end;

procedure TACBrECFSchalter.LeituraMemoriaFiscalSerial(DataInicial,
   DataFinal: TDateTime; var Linhas: TStringList);
Var Espera : Integer ;
begin
  Espera := Trunc(TimeOut + (DaysBetween(DataInicial,DataFinal)/5) ) ;
  BytesResp := -1 ;   { Reposta de Tamanho Variavel }
  Linhas.Clear ;
  Linhas.Text := EnviaComando( #21 + #3 +
                           FormatDateTime('ddmmyy',DataInicial)+
                           FormatDateTime('ddmmyy',DataFinal)  +
                           IntToStrZero(0,8),   Espera ) ;
end;

end.


