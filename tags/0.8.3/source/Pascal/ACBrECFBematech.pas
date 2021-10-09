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
|* 19/05/2004:  Daniel Simoes de Almeida
|*   Primeira Versao: Criaçao e Distribuiçao da Primeira Versao
|* 21/06/2004:  Daniel Simoes de Almeida
|*   Otimizacao acesso a Variaveis do ECF (NumSerie, NumECF, NumVersao)
|*   Melhorado o suporte a Impressora Thermica MFD
|* 20/05/2005:  Daniel Simoes de Almeida
|*   Corrigido BUG em FechaCupom. Linhas de Observação eram impressas erradas.
|*   -  Bug reportado por: Erique Costa
|* 13/06/2005:  Daniel Simoes de Almeida
|*   Corrigido BUG em AbreCupom na MP25 / MFD. Mesmo que CPF/CNPJ não fosse
|*   informado era impressa a linha de CPF/CNPJ.
|*   -  Bug reportado por: Anderson Rogerio Bejatto
|* 26/10/2005:  Daniel Simoes de Almeida
|*   Corrigido BUG em CarregaFormasPagamento. Todas as formas carregadas eram
|*   convertidas para Maiusculas   Bug reportado por: Ederson Selvati 
|* 29/10/2005:  Daniel Simoes de Almeida
|*   Adcionado itens SA-Sangria e SU-suprimento em CarregaComprovantesNaoFiscais.
|*   pois esses indices sempre estarão presentes na Bematech
******************************************************************************}

{$I ACBr.inc}

unit ACBrECFBematech ;

interface
uses ACBrECFClass, ACBrUtil, ACBrCHQClass,
     Classes, 
     {$IFDEF VisualCLX} QDialogs, QControls, QForms {$ENDIF}
     {$IFDEF VCL} Dialogs, Controls, Forms {$ENDIF} ;

const ErrosST1 : array[0..7] of string =
      ('Número de parâmetros de CMD inválido',
       'Cupom aberto',
       'Comando inexistente',
       'Primeiro dado de CMD não foi ESC (27d)',
       'Impressora em erro',
       'Erro no relógio',
       'Pouco papel',
       'Fim de papel') ;
const ErrosST2 : array[0..7] of string =
      ('Comando não executado',
       'CGC/IE do proprietário não programados',
       'Cancelamento não permitido',
       'Capacidade de alíquotas programáveis lotada',
       'Alíquota não programada',
       'Erro na Memória RAM CMOS não volátil',
       'Memória fiscal lotada',
       'Tipo de parâmetro de CMD inválido') ;
       
const ETX = #03 ;

type

{ Classe filha de TACBrECFClass com implementaçao para Bematech }
TACBrECFBematech = class( TACBrECFClass )
 private
    fsACK, fsST1, fsST2 : Integer ; { Status da Bematech }
    { Tamanho da Resposta Esperada ao comando. Necessário, pois a Bematech nao
      usa um Sufixo padrão no fim da resposta da Impressora. }
    fsBytesResp : Integer ;
    fsNumVersao : String ;
    fsNumSerie  : String ;
    fsNumECF    : String ;
    fsNumLoja   : String ;
    fsNumCRO    : String ;
    fsMFD       : Boolean ;
    fsArredonda : Char ;
    fsTotalPago : Double ;

    fsModelosCheque : TACBrCHQModelos ;

    Function PreparaCmd( cmd : String ) : String ;

    Function BcdToAsc( StrBCD : String) : String ;
 protected
    function GetModeloStr: String; override ;
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
    function GetArredonda: Boolean; override ;
    function GetChequePronto: Boolean; override ;

    procedure ListaRelatorioGerencial(Relatorio : TStrings; Vias : Integer = 1);
       override ;
    Procedure ListaCupomVinculado( Relatorio : TStrings; Vias : Integer = 1) ;
      override ;

    Function VerificaFimLeitura(Retorno:String) : Boolean ; override ;
    function VerificaFimImpressao : Boolean ; override ;

 public
    Constructor create( AOwner : TComponent  )  ;
    Destructor Destroy  ; override ;

    procedure Ativar ; override ;

    Property ACK   : Integer read fsACK ;
    Property ST1   : Integer read fsST1 ;
    Property ST2   : Integer read fsST2 ;
    Property IsMFD : Boolean read fsMFD ;
    property ModelosCheque : TACBrCHQModelos read fsModelosCheque
       write fsModelosCheque ;

    Property BytesResp : Integer read fsBytesResp write fsBytesResp ;
    Function EnviaComando( cmd : String ) : String ; override ;

    Procedure AbreCupom( CPF_CNPJ : String = '') ; override ;
    Procedure VendeItem( Codigo, Descricao : String; AliquotaICMS : String;
       Qtd : Double ; ValorUnitario : Double; DescontoPorc : Double = 0;
       Unidade : String = '') ; override ;
    Procedure SubtotalizaCupom( DescontoAcrescimo : Double = 0;
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

    Procedure ImprimeCheque(Banco : String; Valor : Double ; Favorecido,
       Cidade : String; Data : TDateTime ;Observacao : String = '') ; override ;
    Procedure CancelaImpressaoCheque ; override ;

    Procedure MudaHorarioVerao  ; override ;
    Procedure MudaArredondamento( Arredondar : Boolean ) ; override ;
    Procedure CorrigeEstadoErro ; override ;
    Procedure ImpactoAgulhas ; override ;
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
    function AchaFPGDescricao( Descricao : String ) : TACBrECFFormaPagamento ;
       override ;
    Procedure ProgramaFormaPagamento( var Descricao: String;
       PermiteVinculado : Boolean = true; Posicao : String = '' ) ; override ;

    procedure CarregaComprovantesNaoFiscais ; override ;
    Procedure ProgramaComprovanteNaoFiscal( var Descricao: String;
       Tipo : String = ''; Posicao : String = '') ; override ;

 end ;

implementation
Uses ACBrBase,
     SysUtils,
   {$IFDEF Delphi6_UP} DateUtils, StrUtils, {$ELSE} ACBrD5, Windows,{$ENDIF}
     Math ;

{ ----------------------------- TACBrECFBematech ------------------------------ }

constructor TACBrECFBematech.create( AOwner : TComponent ) ;
begin
  inherited create( AOwner ) ;

  fpDevice.HandShake := hsRTS_CTS ;
  { Variaveis internas dessa classe }
  fsST1       := 0 ;
  fsST2       := 0 ;
  fsACK       := 0 ;
  fsBytesResp := 0 ;
  fsTotalPago := 0 ;
  fsNumVersao := '' ;
  fsNumSerie  := '' ;
  fsNumECF    := '' ;
  fsNumLoja   := '' ;
  fsNumCRO    := '' ;
  fsMFD       := false ;
  fsArredonda := ' ';
  fpModeloStr := 'Bematech' ;

  fsModelosCheque := TACBrCHQModelos.create( true );
end;

destructor TACBrECFBematech.Destroy;
begin
  fsModelosCheque.Free ;

  inherited Destroy ;
end;

procedure TACBrECFBematech.Ativar;
begin
  if not fpDevice.IsSerialPort  then
     raise Exception.Create('A impressora: '+ModeloStr+' requer'+sLineBreak+
                            'Porta Serial:  (COM1, COM2, COM3, ...)');

  fpDevice.HandShake := hsRTS_CTS ;
  inherited Ativar ; { Abre porta serial }

  fsNumVersao := '' ;
  fsNumSerie  := '' ;
  fsNumECF    := '' ;
  fsNumLoja   := '' ;
  fsNumCRO    := '' ;
  fsMFD       := false ;
  fsArredonda := ' ';

  try
     { Testando a comunicaçao com a porta }
     EnviaComando( #19 ) ;    { Pede Status }

     if (fsACK = 21) or (fsACK <> 6) then
        raise EACBrECFNaoInicializado.Create(
                 'Erro inicializando a impressora '+ModeloStr );

     NumVersao ;   { Inicializa fsMFD e fsNumVersao }
  except
     Desativar ;
     raise ;
  end ;
end;


Function TACBrECFBematech.EnviaComando( cmd : String ) : String ;
Var ErroMsg : String ;
    B : Byte ;
    PediuStatus : Boolean ;
    wTempoLimite : TDateTime ;
begin

  fsACK   := 0  ;
  fsST1   := 0  ;
  fsST2   := 0  ;
  Result  := '' ;
  ErroMsg := '' ;
  fpComandoEnviado   := '' ;
  fpRespostaComando  := '' ;
  AguardandoResposta := true ;

  PediuStatus := ( cmd = #19 ) ; { quando pede Status nao deve disparar
                            exceçao com erros "Pouco Papel" ou "Cupom Aberto" }
  try
     if (not fpDevice.Ativo) then
        raise EACBrECFNaoInicializado.create(
                 'Componente ACBrECF não está Ativo');

     { Codificando CMD de acordo com o protocolo da Bematech }
     cmd := PreparaCmd( cmd ) ;

     while  not EmLinha( 1 ) do  { Impressora está em-linha ? }
     begin
        if Retentar and
           (MessageDlg('A impressora '+ModeloStr+' não está pronta.'+sLineBreak+
                       sLineBreak+'Deseja tentar novamente ?',mtConfirmation,
                       [mbYes,mbNo],0) = mrYes) then
           Continue ;

        raise EACBrECFSemResposta.create(
                 'Impressora '+ModeloStr+' não está em linha') ;
     end ;

     fpDevice.Serial.DeadlockTimeout := 2000 ; { Timeout p/ Envio }
     fpDevice.Serial.Purge ;                   { Limpa a Porta }

     if PediuStatus then
        wTempoLimite := IncSecond( now, TimeOut)
     else
        wTempoLimite := now ;

     while (fsACK <> 6) do     { Se ACK = 6 Comando foi reconhecido }
     begin
        fsACK := 0 ;

        try
           fpDevice.Serial.SendString( cmd );   { Eviando o comando }
        except
           if (not Retentar) or (MessageDlg(
              'Camandos não estão sendo enviados para Impressora '+ModeloStr+
              sLineBreak+'Deseja tentar novamente ?',
              mtConfirmation,[mbYes,mbNo],0) <> mrYes) then
              raise EACBrECFSemResposta.create(
                    'Erro ao enviar comandos para a Impressora '+ModeloStr)
           else
              continue ;
        end ;

        { espera ACK chegar na Porta por 1,5 seg }
        try
           try
              fsACK := fpDevice.Serial.RecvByte( 1500 ) ;
           except
              raise EACBrECFSemResposta.create(
                    'Impressora '+ModeloStr+' não responde') ;
           end ;

           if fsACK = 21 then    { retorno em caracter 21d=15h=NAK }
              raise EACBrECFSemResposta.create(
                    'Impressora '+ModeloStr+' não reconheceu o Comando')
           else if fsACK <> 6 then
              raise EACBrECFSemResposta.create(
                    'Erro. Resposta da Impressora '+ModeloStr+' inválida') ;
        except
           on E : EACBrECFSemResposta do
           begin
              fpDevice.Serial.Purge ;

              if PediuStatus and (wTempoLimite > now) then
                 Continue ;

              if (not Retentar) or
                 (MessageDlg( E.Message +sLineBreak+sLineBreak+
                     'Deseja tentar novamente ?'+sLineBreak+sLineBreak+
                     'Se o problema persistir, verifique os cabos, ou'+sLineBreak+
                     'experimente desligar a impressora durante 5 seg,'+sLineBreak+
                     'liga-la novamente, e repetir a operação...',
                     mtConfirmation,[mbYes,mbNo],0) <> mrYes) then
                 raise ;
           end ;
           else
              raise ;
        end ;
     end ;

     fpComandoEnviado := cmd ;

     { Chama Rotina da Classe mãe TACBrClass para ler Resposta. Se houver
       falha na leitura LeResposta dispara Exceçao }
     LeResposta ;

     { Separando o Retorno }
     if BytesResp >= 0 then
      begin
        fsST1  := ord( fpRespostaComando[ BytesResp+1 ] ) ;
        fsST2  := ord( fpRespostaComando[ BytesResp+2 ] ) ;
        Result := copy(fpRespostaComando, 1, BytesResp) ;
      end
     else  { Quando BytesResp < 0 espera por ETX no final }
      begin
        fsST1  := ord( fpRespostaComando[ 1 ] ) ;
        fsST2  := ord( fpRespostaComando[ 2 ] ) ;
        Result := copy(fpRespostaComando, 3, Length(fpRespostaComando)-3 ) ;
      end ;

     { Verificando por erros em ST1 e ST2 }
     ErroMsg := '' ;
     For B := 0 to 7 do
     begin
        if TestBit( ST1, B) then
           if (not PediuStatus) or ((B <> 1) and (B <> 6)) then
              ErroMsg := ErroMsg + ErrosST1[ B ] + sLineBreak ;

        if TestBit( ST2, B) then
           ErroMsg := ErroMsg + ErrosST2[ B ] + sLineBreak ;
     end ;

     { Verifica se possui erro "Pouco Papel" = ErrosST1[ 6 ] }
     if pos(ErrosST1[ 6 ] + sLineBreak, ErroMsg) > 0 then
     begin
        DoOnMsgPoucoPapel ;
        { Remove da lista de erros para nao gerar Exceção }
        ErroMsg := StringReplace(ErroMsg,ErrosST1[ 6 ] + sLineBreak,'',
                                         [rfReplaceAll,rfIgnoreCase]) ;
     end ;

     if ErroMsg <> '' then
      begin
        ErroMsg := 'Erro retornado pela Impressora: '+ModeloStr+sLineBreak+
                   sLineBreak+ErroMsg ;
        raise EACBrECFSemResposta.create(ErroMsg) ;
      end
     else
        Sleep(100) ;  { Pequena pausa entre comandos }

  finally
     BytesResp := 0 ;
     AguardandoResposta := false ;
  end ;

end;

function TACBrECFBematech.VerificaFimLeitura(Retorno:String) : Boolean;
begin
  { Lê até atingir todos os Bytes esperados (BytesResp) e ECF entra EmLinha}
  { BytesResp é necessário, pois a Bematech nao usa um Sufixo padrão no fim
    da resposta da Impressora. }
  { Somei + 2 em BytesResp pois a Bematech tambem envia ST1 e ST2 no final
    de cada comando }
  if BytesResp >= 0 then
     Result := (Length( Retorno ) >= (BytesResp + 2) )
  else
     Result := (RightStr(Retorno,1) = ETX) ;

  { Nota sobre o VerificaFimLeitura: A Bematech responde muito antes da
    Impressao terminar, o que pode causar problemas com comandos enviados logo
    após impressoes demoradas como a Leitura X (por exemplo). Para esses casos,
    é necessário ativar a propriedade "AguardaImpressao := True" }
end;

function TACBrECFBematech.VerificaFimImpressao: Boolean;
Var Cmd , RetCmd : String ;
    I : Integer ;
begin
  { Essa função só é chamada se AguardaImpressao = True,
    Como essa função é executada dentro da "LeResposta", que por sua vez foi
    chamada por "EnviaComando", não podemos usar o método "EnviaComando" (ou
    teriamos uma chamada recursiva infinita), por isso o Loop abaixo envia o
    comando #19 diretamente para a Serial, e aguarda por 1 segundo a resposta...
     Se a Bematech consegir responder, significa que a Impressão Terminou }
  RetCmd := '' ;
  I      := 0 ;
  Cmd    := PreparaCmd( #19 ) ;
  fpDevice.Serial.Purge ;  { Limpa buffer de Entrada e Saida }
  fpDevice.Serial.SendString( Cmd );   { Pede Status }
  Sleep(100) ;

  while (not VerificaFimLeitura( RetCmd ) ) and (I < 100) do
  begin
     try
        RetCmd := RetCmd + fpDevice.Serial.RecvPacket(10) ;
     except
     end ;
     Inc( I ) ;
  end ;
  Result := VerificaFimLeitura(RetCmd)
end;

Function TACBrECFBematech.PreparaCmd( cmd : String ) : String ;  // Adaptada do manual da Bematech //
Var A, iSoma, LenCmd : Integer ;
    STX, NBL, NBH, CSL, CSH : String ;
begin

  result := '' ;
  if cmd = '' then exit ;

  cmd := #27 + cmd ;   { Prefixo ESC }

  { Calculando a Soma dos caracteres ASC }
  iSoma := 0 ;
  For A := 1 to Length(cmd) do
     iSoma := iSoma + ord( cmd[A] ) ;

  { Calculando os dígitos }
  LenCmd := Length( CMD ) + 2  ;    { + 2 = CSL + CSH }
  STX    := #2 ;
  NBL    := chr( LenCmd mod 256 ) ;
  NBH    := chr( Trunc( LenCmd / 256 ) ) ;
  CSL    := chr( iSoma mod 256 ) ;
  CSH    := chr( Trunc(iSoma / 256 ) ) ;

  result := STX + NBL + NBH + CMD + CSL + CSH
end ;


function TACBrECFBematech.BcdToAsc(StrBCD: String): String;  // Adaptada do manual da Bematech //
Var A,BCD_CHAR : Integer ;
    BH,BL,ASC_CHAR : String ;
begin
  result := '' ;

  for A := 1 to Length( StrBCD ) do
  begin
     BCD_CHAR := ord( StrBCD[A] ) ;
     BH := IntToStr( Trunc(BCD_CHAR / 16) ) ;
     BL := IntToStr( BCD_CHAR mod 16 ) ;

     ASC_CHAR := BH + BL ;
     result := result + ASC_CHAR
  end ;
end;

function TACBrECFBematech.GetDataHora: TDateTime;
Var RetCmd : String ;
    OldShortDateFormat : String ;
begin
  BytesResp := 6 ;
  RetCmd := BcdToAsc( EnviaComando( #35 + #23 ) );
  OldShortDateFormat := ShortDateFormat ;
  try
     ShortDateFormat := 'dd/mm/yy' ;
     result := StrToDate(copy(RetCmd, 1,2)+'/'+copy(RetCmd, 3,2)+'/'+copy(RetCmd, 5,2)) ;
  finally
     ShortDateFormat := OldShortDateFormat ;
  end ;
  result := RecodeHour(  result,StrToInt(copy(RetCmd, 7,2))) ;
  result := RecodeMinute(result,StrToInt(copy(RetCmd, 9,2))) ;
  result := RecodeSecond(result,StrToInt(copy(RetCmd,11,2))) ;
end;

function TACBrECFBematech.GetNumCupom: String;
begin
  BytesResp := 3 ;
  result := Trim( BcdToAsc( EnviaComando( #30 ) ) ) ;
end;

function TACBrECFBematech.GetNumCRO: String;
begin
  if fsNumCRO = '' then
  begin
     BytesResp := 2 ;
     fsNumCRO := Trim( BcdToAsc( EnviaComando( #35+#10 ) )) ;
  end ;

  Result := fsNumCRO ;
end;

function TACBrECFBematech.GetNumLoja: String;
begin
  if fsNumLoja = '' then
  begin
     BytesResp := 2 ;
     fsNumLoja := Trim( BcdToAsc( EnviaComando( #35+#15 ) )) ;
  end ;

  Result := fsNumLoja ;
end;

function TACBrECFBematech.GetNumECF: String;
begin
  if fsNumECF = '' then
  begin
     BytesResp := 2 ;
     fsNumECF  := Trim( BcdToAsc( EnviaComando( #35+#14 ) )) ;
  end ;

  Result := fsNumECF ;
end;

function TACBrECFBematech.GetNumSerie: String;
var wRetentar : Boolean ;
begin
  if fsNumSerie = '' then
  begin
     BytesResp := 15 ;
     wRetentar := Retentar ;
     if IsMFD then
     begin
        Retentar := false ;
        try
           try
              BytesResp  := 20 ;
              fsNumSerie := Trim( EnviaComando( #35+#40 ) ) ;
           except
              BytesResp := 15
           end ;
        finally
           Retentar := wRetentar ;
        end ;
     end ;

     if BytesResp = 15 then
        fsNumSerie := Trim( EnviaComando( #35+#00 ) ) ;
  end ;

  result := fsNumSerie ;
end;

function TACBrECFBematech.GetNumVersao: String ;
var wRetentar : Boolean ;
begin
  if fsNumVersao = '' then
  begin
     try
        wRetentar := Retentar ;
        try
           Retentar    := false ;
           BytesResp   := 3 ;      { #35+#41 só existe na MP2000 Termica }
           fsNumVersao := Trim( BcdToAsc( EnviaComando( #35+#41,1 ))) ;
           fsMFD       := true ;
        finally
           Retentar := wRetentar ;
        end ;
     except
        fsMFD       := false ;
        BytesResp   := 2 ;
        fsNumVersao := Trim( BcdToAsc( EnviaComando( #35+#01 )))  ;
     end ;
  end ;

  Result := fsNumVersao ;
end;

function TACBrECFBematech.GetTotalPago: Double;
begin
  if NumVersao = '010000' then
     Result := fsTotalPago
  else
   begin
     BytesResp := 7 ;
     Result := StrToInt( BcdToAsc( EnviaComando( #35+#22 ))) / 100 ;
     Result := RoundTo( Result, -2) ;
   end ;
end;

function TACBrECFBematech.GetSubTotal: Double;
begin
  BytesResp := 7 ;
  Result := StrToInt( BcdToAsc( EnviaComando( #29 ))) / 100 ;
  Result := RoundTo( Result, -2) ;
end;


function TACBrECFBematech.GetEstado: TACBrECFEstado;
Var RetCmd : String ;
    B : Byte ;
begin
  if (not fpAtivo) then
     fpEstado := estNaoInicializada
  else
   begin
      BytesResp := 1 ;
      RetCmd    := EnviaComando( #35+#17 ) ;
      try B := ord( RetCmd[1] ) except B := 0 end ;

      if TestBit( B ,3) then
        fpEstado := estBloqueada
      else if TestBit( B ,1) then
        fpEstado := estPagamento
      else if TestBit( B ,0) then
        fpEstado := estVenda
      else
        fpEstado := estLivre ;
   end ;

  Result := fpEstado ;
  { Bematech nao possui Flag para inidicar se está Imprimindo Relatório
    (Cupom Fiscal Vinculado ou Relatorio Gerencial) }
end;

function TACBrECFBematech.GetGavetaAberta: Boolean;
Var B : Byte ;
    Resp : String ;
begin
  BytesResp := 1 ;
  Resp := EnviaComando( #23 ) ;
  B := ord( Resp[1] ) ;
  Result := (B <> 0) ;
end;

function TACBrECFBematech.GetPoucoPapel: Boolean;
begin
  Result := TestBit(fsST1, 6) ;
end;

function TACBrECFBematech.GetHorarioVerao: Boolean;
Var RetCmd : String ;
    B : Byte ;
begin
   BytesResp := 1 ;
   RetCmd    := EnviaComando( #35+#17 ) ;
   try B := ord( RetCmd[1] ) except B := 0 end ;

   Result := TestBit( B ,2)
end;

function TACBrECFBematech.GetArredonda: Boolean;
Var RetCmd : String ;
    B : Byte ;
begin
  if fsArredonda = ' ' then
  begin
     BytesResp := 1 ;
     RetCmd    := EnviaComando( #35+#28 ) ;
     try B := ord( RetCmd[1] ) except B := 0 end ;

     if (B <> 0) then
        fsArredonda := 'S'
     else
        fsArredonda := 'N' ;
  end ;

  Result := (fsArredonda = 'S') ;
end;

Procedure TACBrECFBematech.LeituraX ;
begin
  BytesResp := 0 ;
  AguardaImpressao := True ;
  EnviaComando( #06, 35 ) ;
end;

Procedure TACBrECFBematech.AbreGaveta ;
begin
  BytesResp := 0 ;
  EnviaComando( #22 + #100 ) ;
  sleep(100) ;
end;

Procedure TACBrECFBematech.ReducaoZ(DataHora: TDateTime) ;
Var DataStr : String ;
begin
  BytesResp := 0 ;

  DataStr := '' ;
  if DataHora <> 0 then
     DataStr := FormatDateTime('ddmmyyhhnnss',DataHora) ;

  AguardaImpressao := True ;
  EnviaComando( #05 + DataStr, 35 )
end;

Procedure TACBrECFBematech.MudaHorarioVerao ;
begin
  BytesResp := 0 ;
  EnviaComando( #18 ) ;
end;

procedure TACBrECFBematech.MudaArredondamento(Arredondar: Boolean);
begin
  BytesResp := 0 ;
  EnviaComando( #39 + chr( IfThen(Arredondar,1,0) ) ) ;
end;

procedure TACBrECFBematech.AbreCupom(CPF_CNPJ: String);
Var Resto : String ;
begin
  Resto    := '' ;
  CPF_CNPJ := padL(CPF_CNPJ,29) ;

  if IsMFD and (Trim(CPF_CNPJ) <> '') then
   begin
     CPF_CNPJ := copy(CPF_CNPJ,1,29) ;
     Resto    := copy(CPF_CNPJ,30,110) ;
   end
  else
     CPF_CNPJ := trim( CPF_CNPJ ) ;

  fpUltimaMsgPoucoPapel := 0 ;  { Zera tempo pra msg de pouco papel }
  BytesResp := 0 ;
  AguardaImpressao := True ;
  EnviaComando( #00 + CPF_CNPJ + Resto,10) ;
  fsTotalPago := 0 ;
end;

procedure TACBrECFBematech.CancelaCupom;
begin
  if Estado = estVenda then   { Abriu Cupom mas nao vendeu nenhum Item ? }
     if SubTotal = 0 then     { Deve Vender 1 Item para conseguir cancelar }
        if not IsMFD then
           VendeItem('00000','CUPOM SERA CANCELADO','NN',1,0.01,0,'') ;

  BytesResp := 0 ;      
  AguardaImpressao := True ;
  EnviaComando( #14 , 15) ;
  fsTotalPago := 0 ;

  FechaRelatorio ;   { Fecha relatorio se ficou algum aberto (só por garantia)} 
end;

procedure TACBrECFBematech.CancelaItemVendido(NumItem: Integer);
begin
  BytesResp := 0 ;
  EnviaComando( #31 + IntToStrZero(NumItem ,4) ) ;
end;

procedure TACBrECFBematech.EfetuaPagamento(CodFormaPagto: String;
  Valor: Double; Observacao: String; ImprimeVinculado: Boolean);
begin
  inherited EfetuaPagamento(CodFormaPagto, Valor, Observacao, ImprimeVinculado);
  
  Observacao := copy(Observacao,1,80) ;
  BytesResp  := 0 ;
  EnviaComando( #72 + CodFormaPagto +
                IntToStrZero( Round(Valor * 100) ,14) +
                Observacao ) ;
  fsTotalPago := fsTotalPago + RoundTo(Valor,-2) ;
end;

procedure TACBrECFBematech.FechaCupom(Observacao: String);
begin
  Observacao := TrimRight( Observacao ) ;
  if Copy( Observacao, length( Observacao ), 1) <> #10 then
     Observacao := Observacao + #10 ;

  Observacao := copy(Observacao,1, 492) ; { Limite da Bematech }
  BytesResp  := 0 ;
  AguardaImpressao := True ;
  EnviaComando( #34 + Observacao, 14 ) ;
  fsTotalPago := 0 ;
end;

procedure TACBrECFBematech.SubtotalizaCupom(DescontoAcrescimo: Double;
       MensagemRodape : String);
Var A_D : Char ;
begin
  if DescontoAcrescimo < 0 then
     A_D := 'd'
  else
     A_D := 'a' ;

  DescontoAcrescimo := abs(DescontoAcrescimo) ;

  { Inicia fechamento com formas de Pagamento }
  BytesResp  := 0 ;
  EnviaComando( #32 + A_D +
                IntToStrZero( Round( DescontoAcrescimo * 100),14) );
  fsTotalPago := 0 ;
end;

procedure TACBrECFBematech.VendeItem(Codigo, Descricao: String;
  AliquotaICMS : String; Qtd: Double; ValorUnitario: Double;
  DescontoPorc: Double; Unidade: String);
Var AliquotaStr, QtdStr, ValorStr, DescontoStr : String ;
    ValAliquota : Double ;
    Aliquota : TACBrECFAliquota ;
    CMD : Byte ;
    Tipo : Char ;
begin
  if Qtd > 9999 then
     raise EACBrECFCMDInvalido.Create(
           'Quantidade deve ser inferior a 9999.');

  case AliquotaICMS[1] of
    'I' : AliquotaStr := 'II' ;
    'N' : AliquotaStr := 'NN' ;
    'F' : AliquotaStr := 'FF' ;
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

  if ArredondaPorQtd and (not Arredonda) then
     ArredondarPorQtd( Qtd, ValorUnitario );

  Codigo    := padL(Codigo,13) ;    { Ajustando Tamanhos }
  Descricao := trim(Descricao) ;
  Unidade   := padL(Unidade,2) ;

  if Round( Qtd ) = Qtd then
     QtdStr := IntToStrZero( Round( Qtd ), 4)
  else
     QtdStr := IntToStrZero( Round(Qtd * 1000), 7) ;

  if RoundTo( ValorUnitario, -2 ) = ValorUnitario then
   begin
     ValorStr := IntToStrZero( Round(ValorUnitario * 100), 8) ;
     CMD := 09 ;
   end
  else
   begin
     ValorStr := IntToStrZero( Round(ValorUnitario * 1000), 8) ;
     CMD := 56 ;
   end ;

  DescontoStr := IntToStrZero( Round(DescontoPorc * 100), 4) ;

  if (not IsMFD) and ( StrToIntDef( NumVersao,0 ) >= 300) and
     (Trim(Unidade) <> '') then
  begin
     BytesResp := 0 ;
     EnviaComando( #62+#51 + Unidade ) ;            { Programando a UN }
  end ;

  if DescricaoGrande then
     if Length( Descricao ) > 29 then       { Programando aumento de Descricao }
        if IsMFD or ( StrToIntDef( NumVersao,0 ) >= 300) then
           EnviaComando( #62+#52 + copy(Descricao,1,200) ) ;

  Descricao := padL(Descricao,29) ;
  BytesResp := 0 ;
  EnviaComando(chr(CMD) + Codigo + Descricao + AliquotaStr + QtdStr +
            ValorStr + DescontoStr ) ;
  fsTotalPago := 0 ;
end;

procedure TACBrECFBematech.CarregaAliquotas;
Var StrRet : String ;
    Cont : Integer ;
    Aliquota : TACBrECFAliquota ;
    ValAliq : Double ;
    ByteISS1,ByteISS2 : Byte ;
begin
  inherited CarregaAliquotas ;   { Cria fpAliquotas }

  BytesResp := 2 ;
  StrRet    := EnviaComando( #35 + #29 ) ;
  try ByteISS1 := Ord(StrRet[1]) ; except ByteISS1 := 0 ; end ;
  try ByteISS2 := Ord(StrRet[2]) ; except ByteISS2 := 0 ; end ;
  
  BytesResp := 33 ;
  StrRet := EnviaComando( #26 ) ;
  StrRet := BcdToAsc( copy( StrRet,2, Length(StrRet)) ) ;  { 1o Byte nao é BCD }

  for Cont := 1 to 16 do
  begin
    ValAliq  := RoundTo( StrToIntDef(copy(StrRet,((Cont-1)*4)+1,4),0)/100,-2);

    if ValAliq > 0 then
    begin
       Aliquota := TACBrECFAliquota.create ;

       Aliquota.Indice   := IntToStrZero(Cont,2) ;
       Aliquota.Aliquota := ValAliq ;

       if Cont < 9 then
        begin
          if TestBit( ByteISS1, 8 -Cont) then
             Aliquota.Tipo := 'S' ;
        end
       else
          if TestBit( ByteISS2, 16-Cont) then
             Aliquota.Tipo := 'S' ;

       fpAliquotas.Add( Aliquota ) ;
    end ;
  end ;
end;

procedure TACBrECFBematech.ProgramaAliquota(Aliquota: Double; Tipo: Char;
   Posicao : String);
Var ValStr : String ;
begin
  { Impressora Bematech não usa o parâmetro Posicao }
  ValStr := IntToStrZero( Round(Aliquota * 100) ,4) ;
  Tipo   := UpCase(Tipo) ;
  if Tipo = 'S' then
     Tipo := '1'
  else
     Tipo := '0' ;

  BytesResp := 0 ;
  EnviaComando( #07 + ValStr + Tipo ) ;
  CarregaAliquotas ;
end;


procedure TACBrECFBematech.CarregaFormasPagamento;  { funçao Lenta +- 3 sec. }
Var StrRet : String ;
    Cont : Integer ;
    FPagto : TACBrECFFormaPagamento ;
    Descr : String ;
begin
  inherited CarregaFormasPagamento ;   { Cria fpFormasPagamentos }

  BytesResp := 1925 ;
  StrRet := copy( EnviaComando( #35+#32, 5 ), 2,  832 ) ;

  For Cont := 1 to 16 do
  begin
    Descr := trim( copy( StrRet, (Cont * 16) - 15, 16) ) ;
    if Descr <> '' then
    begin
       FPagto := TACBrECFFormaPagamento.create ;

       FPagto.Indice    := IntToStrZero(Cont,2) ;
       FPagto.Descricao := Descr ;
       FPagto.PermiteVinculado := (Cont > 1); {Apenas 1-Dinheiro nao permite}

       fpFormasPagamentos.Add( FPagto ) ;
    end ;
  end ;
end;

function TACBrECFBematech.AchaFPGDescricao( Descricao: String):
  TACBrECFFormaPagamento;
begin
  result := inherited AchaFPGDescricao(Descricao) ;

  { A Bematech permite programas as Formas de Pagamento dinamicamente. A cada
  Reduçao Z as Formas programadas dinamicamente sao zeradas. Tentando programar}
  if (Result = nil) then
  begin
     ProgramaFormaPagamento( Descricao ) ;
     result := inherited AchaFPGDescricao(Descricao) ;
  end ;
end;

procedure TACBrECFBematech.ProgramaFormaPagamento( var Descricao: String;
  PermiteVinculado : Boolean; Posicao : String) ;
Var StrRet : String ;
    FPagto : TACBrECFFormaPagamento ;
begin
  { Obs: Bematech nao usa PermiteVinculado }
  { Impressora Bematech não usa o parâmetro Posicao }

  { Bematech recomenda programar 1ª Maiuscula e restante Minusculas }
  Descricao := UpperCase(copy(Descricao,1,1)) + LowerCase(copy(Descricao,2,16));
  { Bematech recomenda nao haver espaços em Branco na Descricao }
  Descricao := StringReplace(Descricao,' ','',[rfReplaceAll,rfIgnoreCase]) ;
  Descricao := padL(Descricao,16) ;         { Ajustando tamanho final }

  BytesResp := 2 ;
  StrRet := BcdToAsc( EnviaComando( #71 + Descricao) ) ;
  StrRet := copy(StrRet,2,1)+copy(StrRet,4,1) ;

  {Adcionando nova Forma no ObjectList }
  if (StrToIntDef( StrRet, 0 ) > 0) then
  begin
     if Assigned( fpFormasPagamentos ) then
     begin
        { Bematech retorna o mesmo indice se já existir, verificando se é nova }
        FPagto := AchaFPGIndice(StrRet) ;
        if FPagto = nil then
        begin
           FPagto := TACBrECFFormaPagamento.create ;
           FPagto.Indice    := StrRet ;
           FPagto.Descricao := UpperCase( Trim(Descricao) ) ;
           FPagto.PermiteVinculado := true ; { Apenas Fpagto 01-Dinheiro nao permite }
           fpFormasPagamentos.Add( FPagto ) ;
        end ;
        Descricao := FPagto.Descricao ;
     end ;
  end ;
end;


procedure TACBrECFBematech.CarregaComprovantesNaoFiscais;
Var StrRet : String ;
    Cont   : Integer ;
    CNF    : TACBrECFComprovanteNaoFiscal ;
    Descr  : String ;
begin
  inherited CarregaComprovantesNaoFiscais ;

  Cont      := 1 ;
  BytesResp := 1550 ;
  StrRet    := EnviaComando( #35+#33, 5 ) ;

  while Length(StrRet) > 0 do
  begin
    Descr  := trim( copy(StrRet, 13,19) ) ;

    if Descr <> '' then
    begin
       CNF := TACBrECFComprovanteNaoFiscal.create ;

       CNF.Indice    := IntToStrZero(Cont,2) ;
       CNF.Descricao := Descr ;

       fpComprovantesNaoFiscais.Add( CNF ) ;
    end ;

    StrRet := copy(StrRet, 32, Length(StrRet) ) ;
    Cont   := Cont + 1 ;
  end ;

{ Adcionando SA-Sangria e SU-Suprimento que sempre estarão presentes na Bematech}
  CNF := TACBrECFComprovanteNaoFiscal.create ;
  CNF.Indice    := 'SA' ;
  CNF.Descricao := 'Sangria' ;
  fpComprovantesNaoFiscais.Insert(0, CNF ) ;

  CNF := TACBrECFComprovanteNaoFiscal.create ;
  CNF.Indice    := 'SU' ;
  CNF.Descricao := 'Suprimento' ;
  fpComprovantesNaoFiscais.Insert(1, CNF ) ;
end;

procedure TACBrECFBematech.ProgramaComprovanteNaoFiscal(var Descricao : String;
   Tipo: String; Posicao : String);
Var ProxIndice : Integer ;
    CNF    : TACBrECFComprovanteNaoFiscal ;
begin
  { Obs: Bematech nao usa Tipo }
  Descricao := padL(Descricao,19) ;

  CarregaComprovantesNaoFiscais ;

  ProxIndice := StrToIntDef(Posicao,0) ;
  if (ProxIndice < 1) or (ProxIndice > 50) then { Indice passado é válido ? }
     ProxIndice := ComprovantesNaoFiscais.Count + 1 ;

  if ProxIndice > 50 then
     raise Exception.create('Não há espaço para programar novos Comprovantes'+
                            ' não Fiscais');

  BytesResp := 0 ;
  EnviaComando( #40 + IntToStrZero(ProxIndice,2) + Descricao ) ;

  { Adcionanodo novo CNF no ObjectList }
  CNF := TACBrECFComprovanteNaoFiscal.create ;
  CNF.Indice    := IntToStrZero(ProxIndice,2) ;
  CNF.Descricao := Descricao ;
  fpComprovantesNaoFiscais.Add( CNF ) ;
end;


procedure TACBrECFBematech.ImprimeCheque(Banco: String; Valor: Double;
  Favorecido, Cidade: String; Data: TDateTime; Observacao: String);
Var ValStr, DataStr : String ;
    Modelo  : TACBrCHQModelo ;
begin

  Banco      := IntToStrZero( StrToInt(Banco), 3) ;
  Favorecido := padL(Favorecido,45) ;
  Cidade     := padR(trim(Cidade),27) ;
  Observacao := copy(Observacao,1,120) ;
  DataStr    := FormatDateTime('ddmmyyyy',Data) ;
  ValStr     := IntToStrZero( Round(abs(Valor)*100),14) ;

  Modelo := fsModelosCheque.AchaModeloBanco( Banco ) ;
  if Modelo = nil then
     raise Exception.create('Modelo de cheque do Banco: '+Banco+
                            ' não encontrado');
  BytesResp := 0 ;
  with Modelo do
     EnviaComando( #57 + ValStr + Favorecido + Cidade + DataStr +
                   chr( ColunaValor    ) + chr( ColunaExtenso1   ) +
                   chr( ColunaExtenso2 ) + chr( ColunaFavorecido ) +
                   chr( ColunaLocal    ) +
                   chr( ColunaDia ) + chr( ColunaMes ) + chr( ColunaAno ) +
                   chr( LinhaValor    ) + chr( LinhaExtenso1   ) +
                   chr( LinhaExtenso2 ) + chr( LinhaFavorecido ) +
                   chr( LinhaLocal ) + Observacao )
end;

procedure TACBrECFBematech.CancelaImpressaoCheque;
begin
  BytesResp := 0 ;
  EnviaComando( #62 + #49 ) ;
end;

function TACBrECFBematech.GetChequePronto: Boolean;
Var B : Byte ;
    Resp : String ;
begin
  BytesResp := 1 ;
  Resp := EnviaComando( #62 + #48 ) ;
  B := ord( Resp[1] ) ;
  Result := not TestBit(B,5) ;
end;

procedure TACBrECFBematech.ImpactoAgulhas;
Var
  {$IFDEF VisualCLX}
  Value : Integer
  {$ELSE}
  Resp  : String
  {$ENDIF} ;

begin
  if {IsMFD or }( StrToIntDef( NumVersao,0 ) < 310) then
     raise Exception.Create('Comando (124) aumentar o impacto das agulhas '+
                            'disponível apenas na Versão 3.10 ou superior.') ;

  if MessageDlg('Atenção, a Bematech adverte...'+sLineBreak+sLineBreak+
                'Usar uma força de impacto maior'+sLineBreak+
                'que a Padrão da Impressora (Fraco)'+sLineBreak+
                'implica na diminuição da vida útil'+sLineBreak+
                'do cabeçote impressor.'+sLineBreak+sLineBreak+
                'Deseja continuar ?',mtWarning,mbYesNoCancel,0) <> mrYes then
     exit ;

  {$IFDEF VisualCLX}
    Value := 1 ;
    if InputQuery('Força de Impacto',
                  'Entre com a Força de Impacto'+sLineBreak+sLineBreak+
                  '1 - Fraco (padrão)'+sLineBreak+
                  '2 - Médio'+sLineBreak+
                  '3 - Forte', Value, 1, 3 ) then
       EnviaComando( #124 + IntToStr( Value ) ) ;
  {$ELSE}
    Resp := '1' ;
    if InputQuery('Força de Impacto',
                  'Entre com a Força de Impacto'+sLineBreak+sLineBreak+
                  '1 - Fraco (padrão)'+sLineBreak+
                  '2 - Médio'+sLineBreak+
                  '3 - Forte', Resp ) then
       EnviaComando( #124 + Resp ) ;
  {$ENDIF} ;

end;

function TACBrECFBematech.GetModeloStr: String;
begin
  Result := fpModeloStr ;
  if IsMFD then
     Result := Result + ' MFD' ;
end;

procedure TACBrECFBematech.AbreRelatorioGerencial;
begin
  BytesResp := 0 ;
  AguardaImpressao := True ;
  EnviaComando( #20, 30) ;
end;

procedure TACBrECFBematech.LinhaRelatorioGerencial(Linha: String);
begin
  EnviaComando( #20 + Linha + #10 ) ; 
end;

procedure TACBrECFBematech.AbreCupomVinculado(COO, CodFormaPagto,
   CodComprovanteNaoFiscal :  String; Valor : Double ) ;
Var FPG : TACBrECFFormaPagamento ;
    StrValor, FPGDesc : String ;
begin
  FPG := AchaFPGIndice( CodFormaPagto ) ;

  if FPG = nil then
     raise Exception.create( 'Forma de Pagamento: '+CodFormaPagto+
                             ' não foi cadastrada.' ) ;

  COO       := Poem_Zeros( trim(COO) ,6) ;
  FPGDesc   := padL( FPG.Descricao, 16 ) ;
  FPGDesc   := UpperCase(copy(FPGDesc,1,1))+LowerCase(copy(FPGDesc,2,16)) ;
  BytesResp := 0 ;

  if (Valor > 0) and (IsMfd or (StrToIntDef( NumVersao,0 ) >= 310) ) then
   begin
     StrValor := IntToStrZero( Round(Valor * 100) ,14) ;
     AguardaImpressao := True ;
     EnviaComando( #66 + FPGDesc + StrValor + COO, 10)
   end
  else
   begin
     AguardaImpressao := True ;
     EnviaComando( #66 + FPGDesc, 10) ;
   end ;
end;

procedure TACBrECFBematech.LinhaCupomVinculado(Linha: String);
begin
  EnviaComando( #67 + Linha + #10 ) ; 
end;

procedure TACBrECFBematech.FechaRelatorio;
begin
  BytesResp := 0 ;
  try
     AguardaImpressao := True ;
     EnviaComando( #21, 5 ) ;  { Fecha o relatorio Gerencial ou Vinculado }
  except   // Exceçao silenciosa, pois a Impressora pode nao estar em Estado
  end ;    // de Relatorio. Na Bematech não há flag para sinalizar Relatorio Aberto 
end;


procedure TACBrECFBematech.ListaRelatorioGerencial(Relatorio: TStrings;
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
        LinhaRelatorioGerencial( StringofChar(#10, LinhasEntreCupons ) ) ;
        PausarRelatorio( Imp ) ;
     end ;
  end ;

  PintaFormMsg( 'Fechando Relatório Gerencial' );
  FechaRelatorio ;

end;

procedure TACBrECFBematech.ListaCupomVinculado(Relatorio: TStrings;
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
        LinhaCupomVinculado( StringofChar(#10, LinhasEntreCupons ) ) ;
        PausarRelatorio( Imp ) ;
     end ;
  end ;

  PintaFormMsg( 'Fechando Cupom Vinculado' );
  FechaRelatorio ;

end;

procedure TACBrECFBematech.CorrigeEstadoErro;
begin
  try
     EnviaComando( #70 ) ;
     sleep(200) ;
  except
  end ;

  inherited CorrigeEstadoErro ;
end;

procedure TACBrECFBematech.LeituraMemoriaFiscal(ReducaoInicial,
   ReducaoFinal : Integer);
Var Espera : Integer ;
begin
  Espera := 20 + (ReducaoFinal - ReducaoInicial) ;
  AguardaImpressao := True ;
  EnviaComando( #8 + IntToStrZero(ReducaoInicial,6) +
                      IntToStrZero(ReducaoFinal  ,6) + 'I' , Espera ) ;

end;

procedure TACBrECFBematech.LeituraMemoriaFiscal(DataInicial,
   DataFinal: TDateTime);
Var Espera : Integer ;
begin
  Espera := 20 + DaysBetween(DataInicial,DataFinal) ;
  AguardaImpressao := True ;
  EnviaComando( #8 + FormatDateTime('ddmmyy',DataInicial) +
                      FormatDateTime('ddmmyy',DataFinal)   + 'I' ,   Espera ) ;

end;

procedure TACBrECFBematech.LeituraMemoriaFiscalSerial(ReducaoInicial,
   ReducaoFinal: Integer; var Linhas : TStringList);
Var Espera : Integer ;
begin
  BytesResp := -1 ; { espera por ETX }
  Espera := Trunc(10 + ((ReducaoFinal - ReducaoInicial)/2) ) ;
  Linhas.Clear ;
  Linhas.Text := EnviaComando( #8 + IntToStrZero(ReducaoInicial,6)+
                                   IntToStrZero(ReducaoFinal  ,6)+'R', Espera ) ;
end;

procedure TACBrECFBematech.LeituraMemoriaFiscalSerial(DataInicial,
   DataFinal: TDateTime; var Linhas : TStringList);
Var Espera : Integer ;
begin
  BytesResp := -1 ; { espera por ETX }
  Espera := Trunc(10 + (DaysBetween(DataInicial,DataFinal)/2) ) ;
  Linhas.Clear ;
  Linhas.Text := EnviaComando( #8+FormatDateTime('ddmmyy',DataInicial)+
                                 FormatDateTime('ddmmyy',DataFinal)+'R',Espera);
end;

end.


