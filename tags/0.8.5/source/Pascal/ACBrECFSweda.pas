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
|* 21/02/2005:  Daniel Simoes de Almeida
|*   Primeira Versao: Criaçao e Distribuiçao da Primeira Versao
|* 22/06/2005:  Daniel Simoes de Almeida e Licerio Jose Rodrigues Neto
|*   - Corrigido diversos Bugs nos ECFs versao 0.3, em VendeItem,
|*     EfetuaPagamento
|* 28/09/2005:  Daniel Simoes de Almeida
|*   - Corrigido BUG na Rotina EnviaComando, que causava TimeOuts em vários
|*     métodos e propriedades. ( O Controle de Fluxo de Hardware estava errado)
|*   - Modificado mecanismo de Espera do termino da Impressao usando a
|*     a propriedade AguardaImpressao:=True e a função VerificaFimImpressao....
|*     - Removido o método EnviaComandoEspera
|*   - Adcionado suporte a Impressao de cheques
|*   - Rotinas testadas e compatibilizadas com a serie 9000
|*   - Modificado o sistema de detecção de Firmaware através da propriedade
|*     Publica "Versao : TACBrECFSwedaVersao"
|* 29/09/2005:  Ederson Selvati
|*   - Corrigido BUG em VendeItem quando havia desconto.
|* 08/12/2005:  Daniel Simoes de Almeida
|*   VerificaFimImpressao poderia disparar excessão com ECF off-line
|*   Bug reportado por: Adriano Alves Dornelas
|* 16/12/2005:  Daniel Simoes de Almeida
|*   - Adicionda a propriedade UsaDTR : Boolean (False)... Se ela for Verdadeiro
|*     o DTR é desligado para ler a resposta do ECF, (isso pode ser necessário
|*     em alguns modelos de ECF. No metodo Ativar o componente tenta detctar
|*     o estado necessário para o UsaDTR)
|*   - Melhorado o Suporte a linha ST (MFD), graças ao emprestimo de um modelo
|*     ST100, por "Mauro Sano" da Sweda
|*   - Corrigido Bug de TimeOut durante a Redução Z em ECFs Matriciais
|*   - ProgramaFormaPagamento e ProgramaComprovanteNaoFiscal ajustados para a
|*     linha ST (MFD)
|* 13/03/2006:  Daniel Simoes de Almeida
|*   - Removida a propriedade UsaDTR, Revisto mecanismo de comunicação usando o
|*     DTR. Se tiver problemas com o DTR use ACBrECF1.Device.Hardflow := True ;
|*   - Corrigido bugs na detectção da Versao e Modelo do ECF
|* 09/05/2006:  Daniel Simoes de Almeida  e  Ederson Selvati
|*   - Corrigido Bug na detecção do Modelo / Versão quando Versao = 1.1
|* 09/05/2006:  Daniel Simoes de Almeida
|*   - GavetaAberta: modificado para ficar de acordo com o Manual. Se o sinal
|*     estiver invertido use a nova propriedade ACBrECF.GavetaSinalInvertido
|*   - Inserido pequeno Interavalo na leitura do Estado se o ECF for swdC
|* 03/10/2006:  Daniel Simoes de Almeida
|*   - Comando ImprimeCheque adaptado para funcionar na Serie detectada como (B)
|* 07/11/2006:  Daniel Simoes de Almeida
|*   - Corrigido problemas na Detecção do estado após ocorrencia de Erro no ECF
|*   - Corrigido problemas no Calculo do Valor Total em VendeItem (TruncFix)
|*   - Corrigido problema na VendeItem quando executado várias vezes rapidamente
|*     na sequencia
******************************************************************************}
{$I ACBr.inc}

unit ACBrECFSweda ;

interface
uses ACBrECFClass, ACBrUtil, 
     Classes
     {$IFNDEF CONSOLE}
       {$IFDEF VCL}, Dialogs , Controls , Forms {$ENDIF}
       {$IFDEF VisualCLX}, QDialogs, QControls, QForms {$ENDIF}
     {$ENDIF};

type TACBrECFSwedaVersao = ( swdNenhum, swdA, swdB, swdC,
                             swdD, swdST ) ;
{ swdA =  Serie 7000 versao 0.3 e 0.4
  swdB =  Serie 7000 versao 1.0
  swdC =  Serie 7000 versao 1.A, 1.5, 1.6
  swdD  =  Serie 9000 versao 1.0 e 1.1
  swdST    =  Serie MFD 01.00.03 e 01.00.04 }

type
{ Classe filha de TACBrECFClass com implementaçao para Sweda }

{ TACBrECFSweda }

TACBrECFSweda = class( TACBrECFClass )
 private
    fsNumVersao : String ;
    fsNumCRO    : String ;
    fsNumECF    : String ;
    fsModeloSweda : Char ; { A - IF-7000III, B - IF-7000I,   C - IF-7000II,
                             D - IF-7000IE,  E - IF-7000IIE, F - IFS-9000,
                             G - IFS9000IIIE }
    fsArredonda  : Boolean ;
    fsVinculado  : Integer ;  { 0 = Nenhum, ou numero de Vinculados pendentes }
    fsOldSeq     : String ;
    fsPago       : Double ;
    fsCMDVinculado : String ;
    fsVersaoSweda  : TACBrECFSwedaVersao;
    fsEsperaMinima :TDateTime ;
    function GetVersaoSweda : TACBrECFSwedaVersao;

    procedure EsperaEstado( EstadoAEsperar : TACBrECFEstado;
       TimeOut : Integer = 2000 ) ;

 protected
    function GetDataHora: TDateTime; override ;
    function GetNumCupom: String; override ;
    function GetNumECF: String; override ;
    function GetNumCRO: String; override ;
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

    Function VerificaFimLeitura(Retorno:String) : Boolean ; override ;
    function VerificaFimImpressao : Boolean ; override ;

    procedure ListaRelatorioGerencial(Relatorio : TStrings; Vias : Integer = 1);
       override ;
    Procedure ListaCupomVinculado( Relatorio : TStrings; Vias : Integer = 1) ;
      override ;

 public
    Constructor create( AOwner : TComponent  )  ;
    Destructor Destroy  ; override ;

    procedure Ativar ; override ;

    Property VersaoSweda : TACBrECFSwedaVersao read GetVersaoSweda ;

    Function EnviaComando( cmd : String ) : String ; override ;

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
    Procedure ReducaoZ(DataHora : TDateTime = 0 ) ; override ;
    Procedure AbreRelatorioGerencial ; override ;
    Procedure LinhaRelatorioGerencial( Linha : String ) ; override ;
    Procedure AbreCupomVinculado(COO, CodFormaPagto, CodComprovanteNaoFiscal :
       String; Valor : Double) ; override ;
    Procedure LinhaCupomVinculado( Linha : String ) ; override ;
    Procedure FechaRelatorio ; override ;
    Procedure PulaLinhas( NumLinhas : Integer = 0 ) ; override ;

    Procedure ImprimeCheque(Banco : String; Valor : Double ; Favorecido,
       Cidade : String; Data : TDateTime ;Observacao : String = '') ; override ;
    Procedure CancelaImpressaoCheque ; override ;
    
    Procedure MudaHorarioVerao  ; overload ; override ;
    Procedure MudaHorarioVerao( EHorarioVerao : Boolean ) ; overload ; override ;
    Procedure CorrigeEstadoErro ; override ;
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
    {$IFDEF Delphi6_UP} DateUtils, StrUtils {$ELSE} ACBrD5, Windows {$ENDIF},
     SysUtils, Math ;

{ ----------------------------- TACBrECFSweda ------------------------------ }

constructor TACBrECFSweda.create( AOwner : TComponent ) ;
begin
  inherited create( AOwner ) ;

  fpDevice.HandShake := hsDTR_DSR ;
  { Variaveis internas dessa classe }
  fsVinculado   := 0 ;
  fsPago        := -1 ;
  fsNumVersao   := '' ;
  fsNumECF      := '' ;
  fsNumCRO      := '' ;
  fsModeloSweda := ' ' ;
  fsCMDVinculado:= '' ;
  fsEsperaMinima:= 0;
  fsOldSeq      := '' ;

  fpColunas     := 40 ;
  fpModeloStr   := 'Sweda' ;
  fsVersaoSweda := swdNenhum ;
  fsArredonda   := False ;
end;

destructor TACBrECFSweda.Destroy;
begin

  inherited Destroy ;
end;

procedure TACBrECFSweda.Ativar;
begin
  if not fpDevice.IsSerialPort  then
     raise Exception.Create('A impressora: '+ModeloStr+' requer'+#10+
                            'Porta Serial:  (COM1, COM2, COM3, ...)');

//  fpDevice.HandShake := hsDTR_DSR ;
  inherited Ativar ; { Abre porta serial }

  fsNumVersao   := '' ;
  fsNumECF      := '' ;
  fsNumCRO      := '' ;
  fsModeloSweda := ' ' ;
  fpModeloStr   := 'Sweda' ;
  fsVersaoSweda := swdNenhum ;
  fsArredonda   := False ;
  fsEsperaMinima:= 0;

  try
     fpDevice.Serial.Purge ;
//     sleep(100) ;
     { Testando a comunicaçao com a porta }
     GetVersaoSweda ;     

     if VersaoSweda = swdNenhum then
        raise EACBrECFNaoInicializado.Create(
                 'Erro inicializando a impressora '+ModeloStr );
  except
     Desativar ;
     raise ;
  end ;
end;


Function TACBrECFSweda.EnviaComando( cmd : String ) : String ;
Var ErroMsg : String ;
    AUT, SLIP, STATUS : Char ;
    Verificar : Boolean ;
    LeituraMF : Boolean ;
begin
  result    := '' ;
  ErroMsg   := '' ;
  Verificar := false ;
  LeituraMF := (cmd = '++') ;
  fpComandoEnviado   := '' ;
  fpRespostaComando  := '' ;
  AguardandoResposta := true ;

  if AguardaImpressao and (fsEsperaMinima = 0) then
     fsEsperaMinima := IncSecond( now, max(Trunc(TimeOut/IfThen(fsVersaoSweda >= swdST,10,5)),1)) ;
     
  try
     if (not fpDevice.Ativo) then
        raise EACBrECFNaoInicializado.create(
                 'Componente ACBrECF não está Ativo');

     { Codificando CMD de acordo com o protocolo da Sweda }
     cmd := #27 + '.' + cmd + '}' ;
//     fpDevice.Serial.RTS := false ;

     VerificaEmLinha ;

     fpDevice.Serial.DeadlockTimeout := 2000 ; { Timeout p/ Envio }

     while fpComandoEnviado = '' do
     begin
        if not LeituraMF then  {Se estiver lendo Mem.Fiscal tem dados no Buffer}
           fpDevice.Serial.Purge ;                   { Limpa a Porta }

        if not TransmiteComando( cmd ) then
           continue ;

        fpComandoEnviado := cmd ;
     end ;

     if fpDevice.HandShake = hsDTR_DSR then
        fpDevice.Serial.DTR := True ;  { Liga o DTR para ler a Resposta }

     if not fpDevice.Serial.CTS then
        fpDevice.Serial.RTS := false ;
{    *** Mini - LeResposta para uso de Debug ***
     while (not VerificaFimLeitura(fpRespostaComando)) do
     begin
        try
           fpRespostaComando := fpRespostaComando + // Le conteudo da porta
                                fpDevice.Serial.RecvPacket(100) ;
        except
        end ;
     end ;
}
     { Chama Rotina da Classe mãe TACBrClass para ler Resposta. Se houver
       falha na leitura LeResposta dispara Exceçao }
     LeResposta ;
     Result := fpRespostaComando ;

     if Result = '' then
        Result := '.-0001^TIMEOUT' ;

     { Verificando por erros }
     ErroMsg := '' ;
     if (copy(Result, 1, 5) = '.-P00') and (Length(Result) = 7) then
      begin
        case Result[6] of
          '2' : ErroMsg := 'Comando não foi enviado a Impressora.' ;
          '6' : ErroMsg := 'Não foi recebida a resposta da Impressora.' ;
        end;
        Verificar := true ;
      end

     else if copy(Result, 1, 3) = '.-P' then
      begin
        try AUT    := Result[4] except AUT    := ' ' end ;
        try SLIP   := Result[5] except SLIP   := ' ' end ;
        try STATUS := Result[6] except STATUS := ' ' end ;

        if (AUT = '1') or (SLIP = '1') or (STATUS = '1') then
         begin
           ErroMsg   := 'Impressora fora de linha'+sLineBreak ;
           Verificar := true ;
         end
        else if (AUT = '2') or (SLIP = '2') or (STATUS = '2') then
         begin
           ErroMsg   := 'Time-out de Transmissao'+sLineBreak ;
           Verificar := true ;
         end
        else if (AUT = '6') or (SLIP = '6') or (STATUS = '6') then
         begin
           ErroMsg   := 'Impressora não está pronta para aceitar novo comando'+
                        sLineBreak ;
           Verificar := true ;
         end ;

{       if AUT = '5' then
           ErroMsg := ErroMsg + 'SEM documento para AUTENTICAR'+sLineBreak ;

        if SLIP = '5' then
           ErroMsg := ErroMsg + 'SEM FOLHA solta presente'+sLineBreak ;
}
        if STATUS = '5' then
        begin
           if fsOldSeq <> copy(Result,9,4) then
              DoOnMsgPoucoPapel( 'Papel acabando' )
           else
              ErroMsg := 'Sem papel' ;
        end ;
      end
     else if copy(Result, 1, 2) = '.-' then
      begin
        ErroMsg := copy(Result,7,Length(Result)-7) ;
      end
     else if copy(Result, 1, 2) = '.+' then
        fsOldSeq := copy(Result,3,4) ;

     if Verificar then
     begin
        ErroMsg := ErroMsg + sLineBreak+
                   'Verifique:'+sLineBreak+
                   '- A impressora está ligada ? '+sLineBreak+
                   '- A tampa está aberta ?'+sLineBreak+
                   '- Os cabos estão conectados ?' ;
     //  Debug     +sLineBreak+'Comando enviado: ('+fpComandoEnviado+')' ;
     end ;

     if ErroMsg <> '' then
      begin
        ErroMsg := 'Erro retornado pela Impressora: '+ModeloStr+
                   sLineBreak + sLineBreak+
                   ErroMsg ;
        raise EACBrECFSemResposta.create( ErroMsg ) ;
      end
     else
        Sleep( IntervaloAposComando ) ;  { Pequena pausa entre comandos }

  finally
     AguardandoResposta  := false ;
     fsEsperaMinima      := 0;
  end ;
end;

function TACBrECFSweda.VerificaFimLeitura(Retorno:String) : Boolean;
begin
  { Nota sobre o VerificaFimLeitura: A SWEDA responde muito antes da
    Impressao terminar, o que pode causar problemas com comandos enviados logo
    após impressoes demoradas como a Leitura X (por exemplo). Para esses casos,
    é necessário ativar a propriedade "AguardaImpressao := True" }
  Result := (pos('}',RightStr(Retorno,2)) > 0) and (Length(Retorno) >= 3) ;

  { Se respondeu com Erro, não precisa Aguardar a Impressao }
  if AguardaImpressao and (copy(Retorno, 1, 2) = '.-') then
     AguardaImpressao := False ;
end;


function TACBrECFSweda.VerificaFimImpressao: Boolean;
Var RetCmd : String ;
    I : Integer ;
begin
  { Alguns comandos da sweda respondem ok a essa função caso eles ainda não
    tenham iniciado (é o caso da ReduçãoZ).... O fsEsperaMinima aguarda pelo
    menos 1/5 do Tempo definido em TimeOut }
  Result := false ;
  if (now < fsEsperaMinima) or (not EmLinha() ) then
     Sleep(100)
  else
   begin
     { Essa função só é chamada se AguardaImpressao = True,
       Como essa função é executada dentro da "LeResposta", que por sua vez foi
       chamada por "EnviaComando", não podemos usar o método "EnviaComando" (ou
       teriamos uma chamada recursiva infinita), por isso o Loop abaixo envia o
       comando .27 diretamente para a Serial, e aguarda por segundos a resposta...
        Se a Sweda consegir responder, significa que a Impressão Terminou }
     RetCmd := '' ;
     I      := 0 ;
     try
        fpDevice.Serial.Purge ;  { Limpa buffer de Entrada e Saida }
//      fpDevice.Serial.SendString( #27 + '.23}' );   { Pede Status }
        fpDevice.Serial.SendString( #27 + '.271}' );   { Pede Numcupom }
        Sleep(20) ;

        if fpDevice.HandShake = hsDTR_DSR then
           fpDevice.Serial.DTR := True ;  { Liga o DTR para ler a Resposta }

        if not fpDevice.Serial.CTS then
           fpDevice.Serial.RTS := false ;

        repeat
           try
              RetCmd := RetCmd + fpDevice.Serial.RecvPacket(100) ;
           except
              if fpDevice.Serial.WaitingDataEx <= 0 then
              begin
                 Inc( I ) ;   // Nao achou dados para ler, incrementa num falhas
                 sleep(200) ; // Aguarda um pouco, para ECF enviar os dados
              end ;
           end ;
        until (I > 5) or ( VerificaFimLeitura( RetCmd ) )  ;
     except
     end ;

(* { Se tiver "6" em AUT, SLIP ou STATUS é porque o ECF não está pronto para
       aceitar novos comandos }
     Result := VerificaFimLeitura(RetCmd) and (pos('6', copy(RetCmd,4,3)) = 0) ;*)

     Result := VerificaFimLeitura(RetCmd) and
               (LeftStr(RetCmd, 3) = '.+C') and
               ( StrToIntDef( copy(RetCmd,14,4), 0) > 0 ) ;
   end ;
end;

function TACBrECFSweda.GetDataHora: TDateTime;
Var RetCmd : String ;
    OldShortDateFormat : String ;
    P : Integer ;
begin
  RetCmd := EnviaComando( '28' ) ;
  P      := pos('!',RetCmd) ;
  Result := 0 ;
  if P > 0 then
  begin
     OldShortDateFormat := ShortDateFormat ;
     try
        ShortDateFormat := 'dd/mm/yy' ;
        result := StrToDate(copy(RetCmd,P+1,2)+ DateSeparator +
                            copy(RetCmd,P+3,2)+ DateSeparator +
                            copy(RetCmd,P+5,2)) ;
        result := RecodeHour(  result,StrToIntDef(copy(RetCmd,P+7,2),0)) ;
        result := RecodeMinute(result,StrToIntDef(copy(RetCmd,P+9,2),0)) ;
        { Obs.: Sweda nao retorna os Segundos }
     finally
        ShortDateFormat := OldShortDateFormat ;
     end ;
  end ;
end;

function TACBrECFSweda.GetNumCupom: String;
Var RetCmd : String ;
begin
  RetCmd := EnviaComando( '27'+'1' ) ;
  Result := '      ' ;

  if LeftStr(RetCmd, 3) = '.+C' then
     Result := IntToStrZero( StrToIntDef( copy(RetCmd,14,4), 0), 6) ;
end;

function TACBrECFSweda.GetNumCRO: String;
Var RetCmd : String ;
begin
  if Trim(fsNumCRO) = '' then
  begin
     if fsVersaoSweda < swdB then                { 0.3 tem outro retorno }
      begin
        RetCmd := EnviaComando( '27'+'9' ) ;
        if LeftStr(RetCmd, 3) = '.+C' then
           fsNumCRO := IntToStrZero( StrToIntDef(copy(RetCmd,116,4),0),4) ;
      end
     else
      begin
        RetCmd := EnviaComando( '27'+'G' ) ;
        if LeftStr(RetCmd, 3) = '.+C' then
           fsNumCRO := IntToStrZero( StrToIntDef(copy(RetCmd,16,4),0),4) ;
      end ;
  end ;

  Result := fsNumCRO ;
end;

function TACBrECFSweda.GetNumECF: String;
Var RetCmd : String ;
begin
  if Trim(fsNumECF) = '' then
  begin
     RetCmd := EnviaComando( '27'+'F' ) ;  { F ‚ o menor, mais rapido de ler }
        
     if LeftStr(RetCmd, 3) = '.+C' then
        fsNumECF := IntToStrZero( StrToIntDef(copy(RetCmd,4,3),0),4) ;
  end ;

  Result := fsNumECF ;
end;

function TACBrECFSweda.GetNumSerie: String;
Var RetCmd : String ;
begin
  Result := '' ;
  
  if fsVersaoSweda < swdB then                { 0.3 tem outro retorno }
   begin
     RetCmd := EnviaComando( '27'+'2' ) ;
     if LeftStr(RetCmd, 3) = '.+C' then
        Result := Trim(Copy(RetCmd,8,11)) ;
   end
  else
   begin
     RetCmd := EnviaComando( '27'+'3' ) ;
     if LeftStr(RetCmd, 3) = '.+C' then
        Result := Trim(Copy(RetCmd,13,9)) ;
   end ;
end;

function TACBrECFSweda.GetNumVersao: String ;
Var RetCmd : String ;
begin
  if fsModeloSweda = ' ' then
  begin
     RetCmd := EnviaComando( '27'+'1' ) ;
     if (LeftStr(RetCmd, 3) = '.+C') and (copy(RetCmd, 7, 1) = '1') then
        try
           fsModeloSweda := RetCmd[125] ;
        except
           fsModeloSweda := ' ' ;
        end ;
//     sleep(100)
  end ;

  if fsNumVersao = '' then
  begin
     RetCmd := EnviaComando( '27'+'G' ) ;
     if (LeftStr(RetCmd, 3) = '.+C') and (copy(RetCmd, 7, 1) = 'G') then
        fsNumVersao := copy(RetCmd,28,3)
     else
        fsNumVersao := '0.3';
  end ;

  Result := fsNumVersao ;
end;

function TACBrECFSweda.GetVersaoSweda: TACBrECFSwedaVersao;
Var VerInt : Integer ;
    SubModelo, VerString : string ;
begin
(*  Correspondência de Modelos:
       Linha 7000             Linha 9000             Linha ST
  "A"  IFS-7000-III 0.3
  "B"  IFS-7000 I   1.0       IFS-9000 I    1.1
  "C"  IFS-7000 II  1.0       IFS-9000 IIE  1.1
  "D"  IFS-7000 IE  1.0       IFS-9000 IE   1.1
  "E"  IFS-7000 IEE           IFS-9000 II
  "F"                         IFS-9000 IIIE 1.0
  "G"                                                IF ST1000   "G"
  "H"                                                IF ST100    "H"
  
  Modelo      Primeira Versao
  7000-III      0.3
  7000-I        1.0
  7000 II       1.0
  7000 IE       1.0
  7000 IEE      ??

  9000 I        1.1
  9000 IE       1.1
  9000 II       1.1
  9000 IIE      1.1
  9000 IIIE     1.0

  ST            1.0   (01.00.03)


  Compatibilidade de Comandos entre versões:
  swdA   =  Serie 7000 versao 0.3 e 0.4
  swdB   =  Serie 7000/9000 versao (7000 1.0 , 1.A) (9000 1.1)
  swdC   =  Serie 7000/9000 versao 1.5, 1.6
  swdD   =  Serie 9000IIIE versao 1.0 e 1.1 e 1.7
  swdST  =  Serie MFD
*)

  Result := fsVersaoSweda ;

  if fsVersaoSweda = swdNenhum then
  begin
     fpModeloStr := 'Sweda' ;
     fsArredonda := False ;
     fpMFD       := False ;
     fpTermica   := False ;

     VerString := NumVersao ;
     if (VerString = '') or (fsModeloSweda = ' ') then
        exit ;

     case fsModeloSweda of
       'A' : SubModelo := '7000-III' ;
       'B' : SubModelo := '7000-I / 9000-I' ;
       'C' : SubModelo := '7000-II / 9000-IIE' ;
       'D' : SubModelo := '7000-IE / 9000-IE' ;
       'E' : SubModelo := '7000-IEE / 9000-II' ;
       'F' : SubModelo := '9000-IIIE' ;
       'G' : SubModelo := 'ST1000' ;
       'H' : SubModelo := 'ST100' ;
     else
        SubModelo := '???' ;
     end ;

     fpModeloStr := Trim(fpModeloStr + ' ' +SubModelo) ;

     if VerString = '1.A' then
        VerString := '1.0' ;

     VerString := StringReplace(VerString,'.',DecimalSeparator,[]) ;
     { Usando Versao x 10 pois o Delphi se perde com Double em 1.1 }
     VerInt    := TruncFix(StrToFloatDef(VerString,0)*10) ;
     if VerInt = 0 then
        exit ;

     if fsModeloSweda < 'F' then
      begin
        if VerInt < 10 then
         begin
           fsVersaoSweda := swdA ;
           fsArredonda   := True ;
           fpModeloStr := fpModeloStr + ' (A)' ;
         end
        else if (VerInt = 10) or (VerInt = 11) then
         begin
           fsVersaoSweda := swdB ;
           fsArredonda   := (VerInt = 10) ;
           fpModeloStr := fpModeloStr + ' (B)' ;
         end
        else if (VerInt > 11) then
         begin
           fsVersaoSweda := swdC ;
           fpModeloStr   := fpModeloStr + ' (C)' ;
         end ;
      end
     else if fsModeloSweda = 'F' then
      begin
        fsVersaoSweda := swdD ;
        fpModeloStr := fpModeloStr + ' (D)' ;
      end
     else if fsModeloSweda >= 'G' then
      begin
        fsVersaoSweda := swdST ;
        fpModeloStr   := fpModeloStr + ' (ST)' ;
        fpMFD         := True ;
        fpTermica     := True ;
      end
     else
        fsVersaoSweda := swdNenhum ;
  end ;

  Result := fsVersaoSweda ;
end;

function TACBrECFSweda.GetTotalPago: Double;
Var RetCmd : String ;
    SubTot, Falta : Double ;
    P : Integer ;
begin
  RetCmd := EnviaComando('28') ;
  P      := pos('!',RetCmd) ;
  Result := 0 ;
  if P > 0 then
  begin
     SubTot := RoundTo(StrToIntDef(copy(RetCmd,P-24,12),0) / 100, -2) ;
     Falta  := RoundTo(StrToIntDef(copy(RetCmd,P+52,12),0) / 100, -2) ;
     Result := max( RoundTo(SubTot - Falta,-2) ,0) ; { evitar negativo }
  end ;
end;

function TACBrECFSweda.GetSubTotal: Double;
Var RetCmd : String ;
    P : Integer ;
begin
  RetCmd := EnviaComando('28') ;
  P      := pos('!',RetCmd) ;
  Result := 0 ;
  if P > 0 then
     Result := RoundTo(StrToIntDef(copy(RetCmd,P-24,12),0) / 100, -2) ;
end;

function TACBrECFSweda.GetEstado: TACBrECFEstado;
Var RetCmd, Status, Transacao : String ;
    P, I : Integer ;
    FlagZ, FlagX : Char ;
    SubTot, Falta : Double ;
begin
  if (not fpAtivo) then
     fpEstado := estNaoInicializada
  else
   begin
     RetCmd := EnviaComando( '28' ) ;
     P      := pos('!',RetCmd) ;
     if P > 0 then
     begin
        try
           FlagX := RetCmd[P+76]
        except
           FlagX := ' '
        end ;
        try
           FlagZ := RetCmd[P+77]
        except
           FlagZ := ' '
        end ;
        SubTot := RoundTo(StrToIntDef(copy(RetCmd,P-24,12),0) / 100, -2) ;
        Falta  := RoundTo(StrToIntDef(copy(RetCmd,P+52,12),0) / 100, -2) ;

        If fsVersaoSweda > swdA then I := 10 else I := 07 ;
        { Status pode ser: C - concluida, P - Pendente, E - Erro no Comando }
        Status    := UpperCase(copy(RetCmd,I,1)) ;
        Transacao := UpperCase(Trim(copy(RetCmd,I+1,8))) ;
        fpEstado  := estDesconhecido ;

        if FlagZ = 'S' then
           fpEstado := estBloqueada
        else if FlagZ = 'F' then
           fpEstado := estRequerZ
        else if not (Status[1] in ['C']) then
         begin
           if ((Transacao = 'N.FISCAL') or (Transacao = 'LEIT. X') ) then
              fpEstado := estRelatorio
           else if (fsPago >= 0) or ((SubTot <> 0) and (SubTot <> Falta) and (Status<>'E')) then
              fpEstado := estPagamento
           else if (Transacao = 'VENDAS')  then
              fpEstado := estVenda ;
         end ;

        if fpEstado = estDesconhecido then
        begin
           if FlagX = 'F' then
              fpEstado := estRequerX
           else if Status[1] in ['C','E'] then
              fpEstado := estLivre ;
        end ;
     end ;
   end ;

  Result := fpEstado ;
end;

function TACBrECFSweda.GetGavetaAberta: Boolean;
Var RetCmd : String ;
begin
  if fsModeloSweda = 'B' then
     RetCmd := EnviaComando('22')
  else
     RetCmd := EnviaComando('43') ;

  Result := (copy(RetCmd,1,6) = '.+G000')
end;


function TACBrECFSweda.GetPoucoPapel: Boolean;
Var RetCmd : String ;
begin
  RetCmd := EnviaComando( '23' ) ;
  Result := (copy( RetCmd, 6,1) = '5') ;
end;

function TACBrECFSweda.GetHorarioVerao: Boolean;
Var RetCmd : String ;
    P : Integer ;
begin
  RetCmd := EnviaComando( '28' ) ;
  P      := pos('!',RetCmd) ;
  Result := False ;
  if P > 0 then
     Result := (copy(RetCmd,P+11,1) = 'S') ;
end;

function TACBrECFSweda.GetArredonda: Boolean;
begin
  Result := fsArredonda  // (fsVersaoSweda < swdD) ;
end;

Procedure TACBrECFSweda.LeituraX ;
Var Espera : Integer ;
begin
  Espera := IfThen( fsVersaoSweda >= swdST, 20,  55) ;
  AguardaImpressao := True ;
  EnviaComando('13N' , Espera ) ;
end;

Procedure TACBrECFSweda.ReducaoZ(DataHora: TDateTime) ;
Var Cmd, DataStr : String ;
    Espera : Integer ;
begin
  DataStr := '' ;
  if DataHora <> 0 then
     DataStr := FormatDateTime('ddmmyy',DataHora) ;

  Cmd := '14' ;
  if fsVersaoSweda > swdA then  { .03 nao tem o flag }
     Cmd := Cmd + 'N' ;

  Espera := IfThen( fsVersaoSweda >= swdST, 35,  60) ;
  AguardaImpressao := true ;
  if fsVersaoSweda <= swdD then
     fsEsperaMinima := IncSecond( now, 30) ;  { Espera no minimo 30 seg }
  EnviaComando( Cmd + DataStr, Espera ) ;

  { Sweda pode demorar um pouco para entrar no estado Livre, se tentar
    Abrir cupom antes, o ECF pode para de responder }

   try
      Espera := 0 ;
      repeat
         sleep( 200 ) ;
         Inc(Espera) ;
      until (Estado in [estLivre, estRequerX] ) or (Espera > 10) ;
   except
   end ;
end;

Procedure TACBrECFSweda.AbreGaveta ;
begin
  if fsModeloSweda = 'B' then
     EnviaComando('21',7)
  else
     EnviaComando('42',7) ;
end;

Procedure TACBrECFSweda.MudaHorarioVerao ;
begin
  MudaHorarioVerao( not HorarioVerao) ;
end;

procedure TACBrECFSweda.MudaHorarioVerao(EHorarioVerao: Boolean);
Var Cmd  : String ;
begin
  If EHorarioVerao then Cmd := 'S' else Cmd := 'N' ;

  EnviaComando( '36' + Cmd, 3 ) ;
end;

procedure TACBrECFSweda.CorrigeEstadoErro;
begin
  inherited CorrigeEstadoErro ;
  
  { Na MFD em algumas ocasioes e necessario "confirmar a Data/Hora" }
  try
     EnviaComando('35'+FormatDateTime('hhnnssddmmyy',now) );
  except
  end ;
end;

procedure TACBrECFSweda.AbreCupom(CPF_CNPJ: String);
Var Espera : Integer ;
begin
  fpUltimaMsgPoucoPapel := 0 ;  { Zera tempo pra msg de pouco papel }
  if Estado = estRequerX then
     raise Exception.create('Leitura X inicial ainda não foi emitida');

  CPF_CNPJ := padL(CPF_CNPJ,20) ;

  Espera := IfThen( fsVersaoSweda >= swdST, 5,  15);
  AguardaImpressao := True ;
  EnviaComando('17'+CPF_CNPJ, Espera) ;

  fsPago := -1 ;
  { Versao 0.3 tem problemas com se o primeiro Item Vendido ocorrer muito
    rápidamente logo apos Abrir o Cupom Fiscal... solução provisória }
//  if fsVersaoSweda <= swdC then
//     Sleep(900)
//  else if fsVersaoSweda < swdST then
//     Sleep(300);
end;

procedure TACBrECFSweda.CancelaCupom;
Var Cmd, RetCmd : String ;
    Cancelou    : Boolean ;
    SubTot      : Double ;
    Espera      : Integer ;
begin
{ TODO : Modelos F e superiores permitem cancelar o Cupom Nao Fiscal Vinculado
         usando: .088 }
  Espera := IfThen( fsVersaoSweda >= swdST, 10,  25) ;
  AguardaImpressao := True ;
  RetCmd   := EnviaComando( '05' ,Espera) ;
  Cancelou := (copy(RetCmd,1,2) = '.+') ;

  if not Cancelou then { Pagamento aberto, Efetua Pagamento, Fecha e Cancela }
  begin
     SubTot := Subtotal ;
     EnviaComando('10'+'01'+IntToStrZero( Round(SubTot*100) ,12) ) ; { 10-Paga }

     Cmd := '12' ;
     if fsVersaoSweda > swdA then
     begin
        Cmd := Cmd + 'N' ;
        if fsVersaoSweda < swdD then
           Cmd := Cmd + 'N' ;
     end ;

     AguardaImpressao := True ;
     EnviaComando( Cmd, 10 ) ;       { 12-Fecha }
     AguardaImpressao := True ;
     EnviaComando('05' ,Espera) ;    { 05-Cancela }
  end ;

  FechaRelatorio ;   { Fecha relatorio se ficou algum aberto (só por garantia)}
end;

procedure TACBrECFSweda.CancelaItemVendido(NumItem: Integer);
begin
  EnviaComando( '04' + IntToStrZero(NumItem,3) ) ;
end;

procedure TACBrECFSweda.EfetuaPagamento(CodFormaPagto: String;
  Valor: Double; Observacao: String; ImprimeVinculado: Boolean);
Var Espera : Integer ;
begin
  inherited EfetuaPagamento(CodFormaPagto, Valor, Observacao, ImprimeVinculado);

  if ImprimeVinculado then
     if (fsVersaoSweda < swdD) and (fsVinculado > 0) then
        raise Exception.Create('Já existe Forma de Pagamento com '+sLineBreak+
                       'comprovante NAO fiscal vinculado pendente. '+sLineBreak+
                       'Impressora: '+ModeloStr+' Modelo: '+fsModeloSweda+sLineBreak+
                       ' aceita apenas 1 Compr.NAO Fiscal Viculado por Cupom.')
     else
        fsVinculado := fsVinculado + 1 ;

  If fsVersaoSweda < swdB then
     Observacao := ''
  else
     Observacao := '{' + copy(Observacao,1,80) ;

  EnviaComando('10' + CodFormaPagto + IntToStrZero( Round(Valor*100) ,12) +
                     Observacao , 10, 10) ;

  { Sweda pode demorar um pouco para entrar no estado de Pagmento, se tentar
    fechar o Cupom antes, o ECF pode para de responder }
  try
     if fsPago <= 0 then         // É o primeiro pagamento ?
     begin
        Espera := 0 ;
        while (TotalPago = 0 ) and (Espera < 10) do
        begin
           sleep( 200 ) ;
           Inc(Espera) ;
        end ;
     end ;
  except
  end ;

  fsPago := 1 ;
end;

procedure TACBrECFSweda.FechaCupom(Observacao: String);
Var Linhas   : TStringList ;
    I        : Integer ;
    Obs, Cmd : String ;
    Espera   : Integer ;
begin
  { Versao 0.3 tem problemas se o Fechamento ocorrer muito rápidamente
    logo apos o final das formas de Pagamento... solução provisória }
//  if fsVersaoSweda = swdA then
//     Sleep(2000);

  Observacao := AjustaLinhas( Observacao, 8 );
  Obs        := '' ;

  Linhas := TStringList.Create ;
  try
     Linhas.Text := Observacao ;

     for I := 0 to min(Linhas.Count-1 ,8) do
        Obs := Obs + '0' + padL( Linhas[I] , Colunas) ;
  finally
     Linhas.Free ;
  end ;

  { Fecha cupom }
  Cmd := '12' ;
  if fsVersaoSweda > swdA then          {V0.3 nao tem parametros adcionais }
  begin
     {Versao 1.1 e 9000IIIE nao possui param VINC }
     if (Trim(NumVersao) <> '1.1') and (fsVersaoSweda <> swdD) then
        if fsVinculado > 0 then
           Cmd := Cmd + 'S'
        else
           Cmd := Cmd + 'N' ;

     Cmd := Cmd + 'N' ;              {N = Sem cupom Adcional }
  end ;

  Espera := IfThen( fsVersaoSweda >= swdST, 5,  20) ;
  AguardaImpressao := True ;
  EnviaComando( Cmd + Obs, Espera ) ;

  fsVinculado := 0 ;
  fsPago      := -1 ;

  { Sweda pode demorar um pouco para entrar no estado Livre, se tentar
    Abrir cupom antes, o ECF pode para de responder }
  EsperaEstado(estLivre);
end;

procedure TACBrECFSweda.SubtotalizaCupom(DescontoAcrescimo: Double;
       MensagemRodape : String );
Var SubTot, Porc : Double ;
    FlagSubTotal : String ;
begin
  if DescontoAcrescimo < 0 then
   begin
     DescontoAcrescimo := abs(DescontoAcrescimo) ;
     if fsVersaoSweda = swdD then
        EnviaComando('03'+'0000'+IntToStrZero(Round(DescontoAcrescimo*100),12)+
                     'S' ,3)
     else
      begin
        SubTot := Subtotal ;
        FlagSubTotal := '' ;
        if (fsVersaoSweda >= swdB) and (fsVersaoSweda <= swdC) then
           FlagSubTotal := 'N' ;

        Porc   := RoundTo( DescontoAcrescimo / SubTot * 100, -2) ;
        EnviaComando('03' + padL(FormatFloat('00.00',Porc),10) +
                     IntToStrZero(Round(DescontoAcrescimo*100),12) +
                     FlagSubTotal ,10) ;
      end
   end
  else if DescontoAcrescimo > 0 then
   begin
     If fsVersaoSweda < swdB then
        EnviaComando('11' + '53' + '0000' +
                 IntToStrZero(Round(DescontoAcrescimo*100),11) + '   ' + 'N', 3)
     else
      begin
        FlagSubTotal := '' ;
        if fsVersaoSweda <> swdD then
           FlagSubTotal := 'N' ;
        EnviaComando('11' + '51' + '0000' +
                  IntToStrZero(Round(DescontoAcrescimo*100),11) +
                  FlagSubTotal , 3) ;
      end ;
   end ;

  { Inicia fechamento com formas de Pagamento }
  If fsVersaoSweda > swdA then
     EnviaComando('10') ;

  fsVinculado := 0 ;
  fsPago      := 0 ;
end;

procedure TACBrECFSweda.VendeItem(Codigo, Descricao: String;
  AliquotaICMS : String; Qtd: Double; ValorUnitario: Double;
  DescontoPorc: Double; Unidade: String);
Var AliquotaStr, QtdStr, ValorStr, TotalStr, Descr2 : String ;
    ValAliquota, ValDesc : Double ;
    Aliquota : TACBrECFAliquota ;
    Tipo : Char ;
    ValTotal : Double ;
    wIntervaloAposComando : Integer ;
begin
  { Obs.: Sweda nao usa parametro Unidade }
  if Qtd > 9999 then
     raise EACBrECFCMDInvalido.Create(
           'Quantidade deve ser inferior a 9999.');

  if pos(copy(AliquotaICMS,1,2), 'TT,SS') > 0 then { Corrige Duplo T ou S }
     AliquotaICMS := copy(AliquotaICMS,2,5) ;

  case AliquotaICMS[1] of
    'I' : AliquotaStr := 'I  ' ;
    'N' : AliquotaStr := 'N  ' ;
    'F' : AliquotaStr := 'F  ' ;
    'T' : AliquotaStr := 'T'+padR(copy(AliquotaICMS,2,2),2) ; {Indice}
    'S' : AliquotaStr := 'S'+padR(copy(AliquotaICMS,2,2),2) ; {Indice}
  else
   begin
      { Verificando se informou T ou S no final da Aliquota (Tipo) }
     VerificaTipoAliquota( AliquotaICMS, Tipo) ;

     try
        ValAliquota := StringToFloat( AliquotaICMS ) ;
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

  Codigo  := padL(Codigo,13) ;    { Ajustando Tamanhos }
  if Unidade <> '' then
     Descricao := Descricao + ' ' + padL(Unidade,2);

  Descr2  := '' ;                 { Usa descriçao Grande ? }
  if DescricaoGrande Then
     Descr2 := copy(Descricao,24,ifthen(fsVersaoSweda >= swdST,209, 40)) ;

  if Length(Trim(Descr2)) = 0 then
     Descr2 := ''
  else
     if (fsVersaoSweda >= swdST) then
        Descr2 := TrimRight(Descr2) 
     else
        Descr2 := padL(Descr2,40) ;

  Descricao   := padL(Descricao,23) ; {23 e nao 24 porque adiciona o campo Sinal}
  QtdStr      := IntToStrZero( Round( Qtd*1000 ) ,7) ;
  ValorStr    := IntToStrZero( Round( ValorUnitario*1000 ) ,9) ;

  if not Arredonda then
   begin
     ValTotal := Qtd * ValorUnitario * 100 ;
     TotalStr := IntToStrZero( TruncFix(ValTotal) ,12) ;
   end
  else
   begin
     ValTotal := RoundTo( Qtd*ValorUnitario, -2 ) ;
     TotalStr := IntToStrZero( Round( ValTotal*100 ) ,12) ;
   end ;

  // Aumentando IntervaloAposComando para evitar problemas nos comandos abaixo //
  wIntervaloAposComando := IntervaloAposComando ;
  IntervaloAposComando  := max(IntervaloAposComando, 200 ) ;
  try
     EnviaComando( '01' + Codigo + QtdStr + ValorStr + TotalStr + '~' +
                   Descricao + AliquotaStr + Descr2, 5, 5) ;
     fsPago := -1 ;

     if DescontoPorc > 0 then
     begin
        ValDesc := RoundTo( ValTotal * (DescontoPorc / 100), -2) / 100 ;
        if fsVersaoSweda >= swdD then
           EnviaComando('02' + '0000' + IntToStrZero( Round(ValDesc*100) ,12) )
        else
           EnviaComando('02' + padL(FormatFloat('00.00',DescontoPorc),10) +
                               IntToStrZero( Round(ValDesc*100) ,12) ) ;
     end ;
  finally
     IntervaloAposComando := wIntervaloAposComando ;
  end ;
end;

procedure TACBrECFSweda.CarregaAliquotas;
Var RetCmd, AliquotasStr, AliqStr : String ;
    Aliquota : TACBrECFAliquota ;
    ValAliq : Double ;
    A : Integer ;
begin
  inherited CarregaAliquotas ;   { Cria fpAliquotas }

  AliquotasStr := '' ;
  AliqStr      := '' ;

  if fsVersaoSweda < swdB then   { Retorno da 0.3 é muito diferente }
   begin
     RetCmd := EnviaComando('29'+'3') ;
     if copy(RetCmd,1,3) = '.+T' then
     begin
        AliquotasStr := AliquotasStr + copy(RetCmd,49,64) ;

        RetCmd := EnviaComando('29'+'4') ;
        if copy(RetCmd,1,3) = '.+T' then
        begin
           AliquotasStr := AliquotasStr + copy(RetCmd,8,112) ;

           RetCmd := EnviaComando('29'+'5') ;
           if copy(RetCmd,1,3) = '.+T' then
              AliquotasStr := AliquotasStr + copy(RetCmd,8,64) ;
        end ;
     end ;

     for A := 1 to 15 do
     begin
        AliqStr := copy(AliquotasStr,((A-1) * 16) + 1,16) ;
        ValAliq := StrToIntDef(copy(AliqStr,9,4),0) / 100 ;
        if (StrToIntDef( copy(AliqStr,2,2) ,0) > 0) and
           (pos(copy(AliqStr,1,1),'TS') > 0)        then
        begin
           Aliquota := TACBrECFAliquota.create ;

           Aliquota.Indice   := copy(AliqStr,1,3) ;
           Aliquota.Aliquota := ValAliq ;
           if copy(AliqStr,1,1) = 'S' then
              Aliquota.Tipo := 'S' ;

           fpAliquotas.Add( Aliquota ) ;
        end ;
     end ;
   end
  else
   begin
     RetCmd := EnviaComando('29'+'3') ;
     if copy(RetCmd,1,3) = '.+T' then
     begin
        AliquotasStr := AliquotasStr + copy(RetCmd,49,28) ;

        RetCmd := EnviaComando('29'+'4') ;
        if copy(RetCmd,1,3) = '.+T' then
        begin
           AliquotasStr := AliquotasStr + copy(RetCmd,8,49) ;

           RetCmd := EnviaComando('29'+'5') ;
           if copy(RetCmd,1,3) = '.+T' then
               AliquotasStr :=  AliquotasStr + copy(RetCmd,8,28) ;
        end ;
     end ;

     for A := 1 to 15 do
     begin
        AliqStr := copy(AliquotasStr,((A-1) * 7) + 1,7) ;
        ValAliq := StrToIntDef(copy(AliqStr,4,4),0) / 100 ;
        if (StrToIntDef( copy(AliqStr,2,2) ,0) > 0) and
           (pos(copy(AliqStr,1,1),'TS') > 0)        then
        begin
           Aliquota := TACBrECFAliquota.create ;

           Aliquota.Indice   := copy(AliqStr,1,3) ;
           Aliquota.Aliquota := ValAliq ;
           if copy(AliqStr,1,1) = 'S' then
              Aliquota.Tipo := 'S' ;

           fpAliquotas.Add( Aliquota ) ;
        end ;
     end ;
   end ;
end;

procedure TACBrECFSweda.ProgramaAliquota(Aliquota: Double; Tipo: Char;
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

  ProxIndice := StrToIntDef(Posicao,0) ;
  if (ProxIndice < 1) or (ProxIndice > 15) then { Indice passado é válido ? }
  begin
     For ProxIndice := 1 to 16 do  { Procurando Lacuna }
     begin
        if (AchaICMSIndice('T'+IntToStrZero(ProxIndice,2)) = nil) and
           (AchaICMSIndice('S'+IntToStrZero(ProxIndice,2)) = nil) then
           break ;
     end ;
  end ;

  if ProxIndice > 15 then
     raise Exception.create('Não há espaço para programar novas Aliquotas');

  EnviaComando( '33' + Tipo + IntToStrZero(ProxIndice,2) + ValStr ) ;

  { Adcionanodo nova Aliquota no ObjectList }
  Aliq := TACBrECFAliquota.create ;
  Aliq.Indice   := Tipo + IntToStrZero(ProxIndice,2) ;
  Aliq.Aliquota := Aliquota ;
  Aliq.Tipo     := Tipo ;
  fpAliquotas.Add( Aliq ) ;
end;


procedure TACBrECFSweda.CarregaFormasPagamento;  
Var RetCmd, Str, Descricao : String ;
    Cont, Inicio : Integer ;
    FPagto : TACBrECFFormaPagamento ;
    PermiteVinc : Boolean ;
begin
  inherited CarregaFormasPagamento ;       {Inicializa fpFormasPagamentos}

  Str := '' ;
  if fsVersaoSweda < swdD then
   begin
     { Retorno da 0.3 é diferente }
     if fsVersaoSweda > swdA then Inicio := 36 else Inicio := 72 ;
     RetCmd := EnviaComando('29' + '5') ;
     if copy(RetCmd,1,3) = '.+T' then
     begin
        Str := Str + PadL(copy(RetCmd,81,1),1,'S') +
                     copy(RetCmd, Inicio   , 15) ;
        Str := Str + PadL(copy(RetCmd,82,1),1,'S') +
                     copy(RetCmd, Inicio+15, 15) ;
        Str := Str + PadL(copy(RetCmd,83,1),1,'S') +
                     copy(RetCmd, Inicio+30, 15) ;

        RetCmd := EnviaComando('29' + '6') ;
        if copy(RetCmd,1,3) = '.+T' then
        begin
           Str := Str + PadL(copy(RetCmd,113,1),1,'S') +
                        copy(RetCmd, 8 , 15) ;
           Str := Str + PadL(copy(RetCmd,114,1),1,'S') +
                        copy(RetCmd, 23, 15) ;
           Str := Str + PadL(copy(RetCmd,115,1),1,'S') +
                        copy(RetCmd, 38, 15) ;
           Str := Str + PadL(copy(RetCmd,116,1),1,'S') +
                        copy(RetCmd, 53, 15) ;
           Str := Str + PadL(copy(RetCmd,117,1),1,'S') +
                        copy(RetCmd, 68, 15) ;
           Str := Str + PadL(copy(RetCmd,118,1),1,'S') +
                        copy(RetCmd, 83, 15) ;
           Str := Str + PadL(copy(RetCmd,119,1),1,'S') +
                        copy(RetCmd, 98, 15) ;
        end ;
     end ;
   end
  else
   begin
     RetCmd := EnviaComando('29' + '5') ;
     if copy(RetCmd,1,3) = '.+T' then
     begin
        Str := Str + copy(RetCmd, 36, 48) ;

        RetCmd := EnviaComando('29' + '6') ;
        if copy(RetCmd,1,3) = '.+T' then
           Str := Str + copy(RetCmd, 8, 112) ;
     end ;
   end ;

  for Cont := 1 to 10 do
  begin
    Descricao   := TrimRight( copy(Str, (Cont * 16) - 15, 16) ) ;
    PermiteVinc := (copy(Descricao,1,1) = 'S') ;
    Descricao   := copy(Descricao,2,15) ;

    if Descricao <> '' then
    begin
       FPagto := TACBrECFFormaPagamento.create ;

       FPagto.Indice    := IntToStrZero(Cont,2) ;
       FPagto.Descricao := Descricao ;
       FPagto.PermiteVinculado := PermiteVinc ;

       fpFormasPagamentos.Add( FPagto ) ;
    end ;
  end
end;

procedure TACBrECFSweda.ProgramaFormaPagamento(var Descricao: String;
  PermiteVinculado: Boolean; Posicao : String);
Var ProxIndice, I : Integer ;
    LenMax        : Integer ;
    FPagto        : TACBrECFFormaPagamento ;
    Cmd, CmdIns   : String ;
    TemVinculado  : Boolean ;
begin
  if fsVersaoSweda < swdD then
     PermiteVinculado := true ;

  TemVinculado := ( fsVersaoSweda > swdB ) ;

  Cmd    := '' ;
  CmdIns := '' ;
  If TemVinculado then
     If PermiteVinculado then CmdIns := 'S' else CmdIns := 'N' ;
  CmdIns := CmdIns + padL(Descricao,15) ;

  if fsVersaoSweda >=  swdST then
     Cmd := CmdIns 
  else
   begin
     CarregaFormasPagamento ;
     { Sweda permite reprogramar Todas as FPG, por isso é preciso enviar uma String
       com as FPG já existentes... Criando String com as existentes}
     For I := 0 to FormasPagamento.Count - 1  do
     begin
        if TemVinculado then    { Modelos novos tem Flag de Vinculado }
        begin
           If FormasPagamento[I].PermiteVinculado Then
              Cmd := Cmd + 'S'
           else
              Cmd := Cmd + 'N' ;
           Cmd := Cmd + padL(FormasPagamento[I].Descricao,15) ;
        end ;
     end ;

     ProxIndice := StrToIntDef(Posicao,0) ;
     if (ProxIndice < 1) or (ProxIndice > 10) then { Indice passado é válido ? }
        ProxIndice := 0 ;

     if ProxIndice = 0 then
        Cmd := Cmd + CmdIns
     else
        If TemVinculado then
           Cmd := StuffString(Cmd, (ProxIndice*16)-15,0, CmdIns )
        else
           Cmd := StuffString(Cmd, (ProxIndice*15)-14,0, CmdIns ) ;

     if TemVinculado then LenMax := 160 else LenMax := 150 ;
     if Length(Cmd) > LenMax then
        raise Exception.create('Não há espaço para programar novas Formas de '+
                               'Pagamento');
   end ;

  EnviaComando( '39' + Cmd ) ;

  { Adcionanodo nova FPG no ObjectList }
  FPagto := TACBrECFFormaPagamento.create ;
  FPagto.Indice    := IntToStrZero(FormasPagamento.Count,2) ;
  FPagto.Descricao := Descricao ;
  FPagto.PermiteVinculado := PermiteVinculado ;
  fpFormasPagamentos.Add( FPagto ) ;
end;

procedure TACBrECFSweda.CarregaComprovantesNaoFiscais;
Var RetCmd, Str, Descricao : String ;
    Cont : Integer ;
    CNF : TACBrECFComprovanteNaoFiscal ;
begin
  inherited CarregaComprovantesNaoFiscais ;{Inicializa fpComprovantesNaoFiscais}

  RetCmd := EnviaComando('29' + '7') ;
  if copy(RetCmd,1,3) <> '.+T' then exit ;
  Str := Str + copy(RetCmd, 8, 120) ;

  RetCmd := EnviaComando('29' + '8') ;
  if copy(RetCmd,1,3) <> '.+T' then exit ;
  Str := Str + copy(RetCmd, 8, 120) ;

  if ( fsVersaoSweda < swdB ) then { Versão 0.3 tem apenas 20 CNFs }
   begin
     RetCmd := EnviaComando('29' + '9') ;
     if copy(RetCmd,1,3) <> '.+T' then exit ;
     Str := Str + copy(RetCmd, 8, 60) ;
   end
  else
   begin
     RetCmd := EnviaComando('29' + '9') ;
     if copy(RetCmd,1,3) <> '.+T' then exit ;
     Str := Str + copy(RetCmd, 8, 120) ;

     RetCmd := EnviaComando('29' + 'A') ;
     if copy(RetCmd,1,3) <> '.+T' then exit ;
     Str := Str + copy(RetCmd, 8, 120) ;

     RetCmd := EnviaComando('29' + 'B') ;
     if copy(RetCmd,1,3) <> '.+T' then exit ;
     Str := Str + copy(RetCmd, 8, 120) ;

     RetCmd := EnviaComando('29' + 'C') ;
     if copy(RetCmd,1,3) <> '.+T' then exit ;
     Str := Str + copy(RetCmd, 8, 120) ;

     RetCmd := EnviaComando('29' + 'D') ;
     if copy(RetCmd,1,3) <> '.+T' then exit ;
     Str := Str + copy(RetCmd, 8, 60) ;
   end ;

  for Cont := 1 to 50 do
  begin
    Descricao := Trim( copy(Str, (Cont * 15) - 14, 15) ) ;

    if Descricao <> '' then
    begin
       CNF := TACBrECFComprovanteNaoFiscal.create ;

       if Cont = 1 then
          CNF.Indice := 'A '
       else if Cont = 2 then
          CNF.Indice := 'B '
       else
          CNF.Indice := IntToStrZero(Cont-2,2) ;
       CNF.Descricao := Descricao ;

       fpComprovantesNaoFiscais.Add( CNF ) ;
    end
  end ;
end;

procedure TACBrECFSweda.ProgramaComprovanteNaoFiscal(var Descricao: String;
  Tipo: String; Posicao : String);
Var ProxIndice, I : Integer ;
    CNF : TACBrECFComprovanteNaoFiscal ;
    Cmd : String ;
begin
  if Trim(Tipo) = '' then
     Tipo := '+' ;

  if (pos(Tipo,'&+-') = 0) or (Length(Tipo) > 1) then
     raise Exception.Create('Os Tipos válidos para Sweda são:'+sLineBreak+
                            '&  Criaçao de um novo Grupo (Titulo)'+sLineBreak+
                            '+  Entrada de Recursos'+sLineBreak+
                            '-  Saida de Recursos'+sLineBreak+sLineBreak+
                            'Dentro de um Grupo (titulo) deve ter'+sLineBreak+
                            'apenas legendas de mesmo sinal') ;

  Cmd := '' ;
  ProxIndice := 0 ;
  if fsVersaoSweda < swdST then
  begin
     CarregaComprovantesNaoFiscais ;
     { Sweda permite reprogramar Todas as CNF, por isso é preciso enviar uma String
       com as CNF já existentes... Criando String com as existentes}
     For I := 2 to ComprovantesNaoFiscais.Count - 1  do
        Cmd := Cmd + padL(ComprovantesNaoFiscais[I].Descricao,15) ;

     ProxIndice := StrToIntDef(Posicao,0) ;
     if (ProxIndice < 1) or (ProxIndice > 50) then { Indice passado é válido ? }
        ProxIndice := 0 ;
  end ;

  if ProxIndice = 0 then
     Cmd := Cmd + padL(Tipo + Descricao,15)
  else
     Cmd := StuffString(Cmd, (ProxIndice*15)-14,0, padL(Tipo + Descricao,15) ) ;

  if Length(Cmd) > 750 then
     raise Exception.create('Não há espaço para programar novos Comprovantes'+
                            ' não Fiscais');

  EnviaComando( '38' + 'N' + Cmd ) ;

  { Adcionanodo novo CNF no ObjectList }
  CNF := TACBrECFComprovanteNaoFiscal.create ;
  CNF.Indice    := IntToStrZero(ProxIndice,2) ;
  CNF.Descricao := Descricao ;
  fpComprovantesNaoFiscais.Add( CNF ) ;
end;


procedure TACBrECFSweda.AbreRelatorioGerencial;
Var Espera : Integer ;
    Cmd    : String ;
begin
  Espera := IfThen( fsVersaoSweda >= swdST, 10,  50) ;
  Cmd := 'S' ;
{  if fsVersaoSweda >= swdST then
     Cmd := Cmd + PadL(' ',15) ;
}
  AguardaImpressao := True ;
  if fsVersaoSweda <= swdD then
     fsEsperaMinima := IncSecond( now, 30) ;  { Espera no minimo 30 seg }
  EnviaComando( '13' + Cmd ,Espera ) ;
end;

procedure TACBrECFSweda.LinhaRelatorioGerencial(Linha: String);
begin
  ImprimirLinhaALinha( Linha, '080' ) ;
end;

procedure TACBrECFSweda.AbreCupomVinculado(COO, CodFormaPagto,
  CodComprovanteNaoFiscal: String; Valor: Double);
Var Parcelas : String ;
    Espera   : Integer ;
begin
  Try
     COO := IntToStrZero(StrToInt(COO),4) ;
  except
     COO := '    ' ;
  end ;

  fsCMDVinculado := COO + CodFormaPagto ;
  Parcelas       := '' ;
  if (fsVersaoSweda >= swdD) or (fsVersaoSweda = swdB) then
     Parcelas:=StringOfChar(' ',20) + '01';
//   Parcelas:=StringOfChar(' ',20) + IntToStrZero(max(fsVinculado,1),2);

  Espera := IfThen( fsVersaoSweda >= swdST, 5,  10) ;
  AguardaImpressao := True ;
  EnviaComando( '1900' + fsCMDVinculado + Parcelas ,Espera ) ;

  { Sweda pode demorar um pouco para entrar no estado Relatorio }
  EsperaEstado(estRelatorio);
end;

procedure TACBrECFSweda.LinhaCupomVinculado(Linha: String);
begin
  LinhaRelatorioGerencial( Linha ) ;
end;

procedure TACBrECFSweda.FechaRelatorio;
Var RetCmd,Status,Transacao,Cmd,Param : String ;
    P,I : Integer ;
    Fechou : Boolean ;
begin
  RetCmd := EnviaComando( '28' ) ;
  P      := pos('!',RetCmd) ;
  Fechou := False ;
  
  if P > 0 then
  begin
     Param := '' ;
     I     := 07 ;
     if (fsVersaoSweda > swdA) then
     begin
        I := 10 ;
        if (fsVersaoSweda = swdB) and (Trim(NumVersao) = '1.1') then
          Param := 'N'
        else if fsVersaoSweda = swdD then
           Param := ''
        else if fsVersaoSweda < swdD then
           Param := 'NN'
        else
           Param := 'N' ;
     end ;

     { Status pode ser: C - concluida, P - Pendente, E - Erro no Comando }
     Status    := UpperCase(copy(RetCmd,I,1)) ;
     Transacao := UpperCase(Trim(copy(RetCmd,I+1,8))) ;
     Cmd       := Trim(copy(RetCmd,I+9,2)) ;

     if ((Status <> 'C') and (Transacao = 'N.FISCAL')) or
        ((Cmd = '08')    and (Transacao = 'VENDAS'))   then
      begin
        AguardaImpressao := True ;
        EnviaComando( '12' + Param, 10 ) ;
        if fsVersaoSweda = swdD then     { Solução provisoria para Liberar o ECFC }
        begin
           AguardaImpressao := True ;
           EnviaComando( '12N', 10 ) ;
           Fechou := True ;
        end ;
      end
     else if (Status <> 'C') and (Transacao = 'LEIT. X') then
      begin
        AguardaImpressao := True ;
        EnviaComando('08', 10) ;
        Fechou := True ;
      end ;
  end ;

  { Sweda pode demorar um pouco para entrar no estado Livre, se tentar
    Abrir cupom antes, o ECF pode para de responder }
  if Fechou then
     EsperaEstado(estLivre);
end;

procedure TACBrECFSweda.PulaLinhas(NumLinhas: Integer);
begin
  if NumLinhas = 0 then
     NumLinhas := LinhasEntreCupons ;

  NumLinhas := min(NumLinhas,9) ;
  
  EnviaComando('089'+IntToStrZero(NumLinhas,1)) ;
end;

procedure TACBrECFSweda.ListaRelatorioGerencial(Relatorio: TStrings;
  Vias: Integer);
Var Imp, Linha : Integer ;
    Texto : String ;
    Bufferiza : Boolean ;
begin
(* OBS: A SWEDA 1.0 e modelo < F, apenas inicia a impressão das Linhas do
Relatório apos o envio do comando de Fechamento .08} por isso não há como
fazer Pausa entre as vias a Mensagem enviada ao usuário também foi modificada *)

  Imp := 0 ;
  Bufferiza := (fsVersaoSweda < swdC) ;

  while Imp < Vias do
  begin
    if Bufferiza then
       Texto :=  Format('Enviando %s  %dª Via ',['Relatório Gerêncial',Imp+1 ])
    else
       try
          Texto := Format(MsgRelatorio,['Relatório Gerêncial',Imp+1 ]) ;
       except
          Texto := MsgRelatorio ;
       end ;

     {$IFNDEF CONSOLE}
       FormMsgPinta( Texto );
     {$ENDIF}

     Linha := 0 ;
     while Linha <= ( Relatorio.Count - 1) do
     begin
        LinhaRelatorioGerencial( LeftStr( Relatorio[ Linha ], fpColunas) ) ;
        Linha := Linha + 1 ;

        {$IFNDEF CONSOLE}
          Application.ProcessMessages ;
        {$ENDIF}
     end ;

     Imp := Imp + 1 ;

     if Imp < Vias then
     begin
        PulaLinhas ;
        if not Bufferiza then
           PausarRelatorio( Imp ) ;
     end ;
  end ;

  {$IFNDEF CONSOLE}
    if Bufferiza then
       FormMsgPinta( 'Imprimindo Relatório Gerencial' )
    else
       FormMsgPinta( 'Fechando Relatório Gerencial' );
  {$ENDIF}

  FechaRelatorio ;
end;

procedure TACBrECFSweda.ListaCupomVinculado(Relatorio: TStrings;
  Vias: Integer);
Var Imp, Linha : Integer ;
    Texto : String ;
    Bufferiza : Boolean ;
begin
(* OBS: A SWEDA 1.0 e modelo < F, apenas inicia a impressão das Linhas do
Relatório apos o envio do comando de Fechamento .08} por isso não há como
fazer Pausa entre as vias a Mensagem enviada ao usuário também foi modificada *)

  Imp := 0 ;
  Bufferiza := (fsVersaoSweda < swdC) ;

  if Bufferiza then
   begin
     while Imp < Vias do
     begin
        Texto :=  Format('Enviando %s  %dª Via ',['Cupom Vinculado',Imp+1 ]) ;
        {$IFNDEF CONSOLE}
          FormMsgPinta( Texto );
        {$ENDIF}

        Linha := 0 ;
        while Linha <= ( Relatorio.Count - 1) do
        begin
           LinhaCupomVinculado( LeftStr( Relatorio[ Linha ], fpColunas) ) ;
           Linha := Linha + 1 ;

           {$IFNDEF CONSOLE}
             Application.ProcessMessages ;
           {$ENDIF}
        end ;

        Imp := Imp + 1 ;

        if Imp < Vias then
        begin
           PulaLinhas ;
           EnviaComando('1900'+fsCMDVinculado) ;
        end ;
     end ;

     { Buffer já está cheio, imprimindo todas as vias}
     while Imp > 0 do
     begin
        FechaRelatorio ;

        if Imp > 1 then
           PausarRelatorio( Imp ) ;

        Imp := Imp - 1 ;
     end ;
   end
  else
     inherited ListaCupomVinculado(Relatorio, Vias);

end;

procedure TACBrECFSweda.PreparaTEF;
begin
  inherited PreparaTEF ;

  CarregaFormasPagamento ;
  CarregaComprovantesNaoFiscais ;
end;

procedure TACBrECFSweda.LeituraMemoriaFiscal(ReducaoInicial,
   ReducaoFinal: Integer);
Var Espera : Integer ;
begin
  Espera := IfThen( fsVersaoSweda >= swdST, 10,  40) + (ReducaoFinal - ReducaoInicial) ;
  AguardaImpressao := True ;
  EnviaComando( '15' + IntToStrZero(ReducaoInicial,4) +
                             IntToStrZero(ReducaoFinal  ,4) , Espera ) ;
end;

procedure TACBrECFSweda.LeituraMemoriaFiscal(DataInicial, DataFinal: TDateTime);
Var Espera : Integer ;
begin
  Espera := IfThen( fsVersaoSweda >= swdST, 10,  40) + DaysBetween(DataInicial,DataFinal) ;
  AguardaImpressao := True ;
  EnviaComando('16' + FormatDateTime('ddmmyy',DataInicial) +
                            FormatDateTime('ddmmyy',DataFinal) ,   Espera ) ;
end;

procedure TACBrECFSweda.LeituraMemoriaFiscalSerial(ReducaoInicial,
   ReducaoFinal: Integer; var Linhas : TStringList);
Var Ret,Resp,Linha : String ;
    P1,P2 : Integer ;
    wTempoInicioMsg : Integer ;
    wRetentar : Boolean ;
begin
  Linhas.Clear ;
  wRetentar := Retentar ;
  wTempoInicioMsg := TempoInicioMsg ;
  try
     Retentar       := false ;
     TempoInicioMsg := 10 ;
     Resp := EnviaComando( '15' + IntToStrZero(ReducaoInicial,4) +
                                 IntToStrZero(ReducaoFinal  ,4) + '|', 15) ;
     Repeat
        try
           Ret := EnviaComando('++') ;
        except
           break ;
        end ;

        Resp := Resp  + Ret ;
     Until (Pos('.]}',Ret) > 0) ;

     Resp := StringReplace(Resp,'.]}','',[rfReplaceAll]) ;
     while Resp <> '' do
     begin
        P2 := pos('}',Resp) ;
        if P2 = 0 then P2 := Length(Resp) ;
        P1 := pos('.+',Resp) ;
        if (P1 = 0) or (P1 > P2) then P1 := -5 ;

        Linha := Copy(Resp,P1+6, P2-P1-6) ;
        Linhas.Add( Linha ) ;
        Resp := copy(Resp,P2+1,Length(Resp)) ;
     end ;
  finally
     Retentar       := wRetentar ;
     TempoInicioMsg := wTempoInicioMsg ;
  end ;
end;

procedure TACBrECFSweda.LeituraMemoriaFiscalSerial(DataInicial,
  DataFinal: TDateTime; var Linhas : TStringList);
Var Ret,Resp,Linha : String ;
    P1,P2 : Integer ;
    wTempoInicioMsg : Integer ;
    wRetentar : Boolean ;
begin
  Linhas.Clear ;
  wRetentar := Retentar ;
  wTempoInicioMsg := TempoInicioMsg ;
  try
     Retentar       := false ;
     TempoInicioMsg := 10 ;
     Resp := EnviaComando( '16' + FormatDateTime('ddmmyy',DataInicial)+
                                 FormatDateTime('ddmmyy',DataFinal)  + '|',15 );
     Repeat
        try
           Ret := EnviaComando('++') ;
        except
           break ;
        end ;

        Resp := Resp  + Ret ;
     Until (Pos('.]}',Ret) > 0) ;

     Resp := StringReplace(Resp,'.]}','',[rfReplaceAll]) ;
     while Resp <> '' do
     begin
        P2 := pos('}',Resp) ;
        if P2 = 0 then P2 := Length(Resp) ;
        P1 := pos('.+',Resp) ;
        if (P1 = 0) or (P1 > P2) then P1 := -5 ;

        Linha := Copy(Resp,P1+6, P2-P1-6) ;
        Linhas.Add( Linha ) ;
        Resp := copy(Resp,P2+1,Length(Resp)) ;
     end ;
  finally
     Retentar       := wRetentar ;
     TempoInicioMsg := wTempoInicioMsg ;
  end ;
end;

function TACBrECFSweda.GetChequePronto: Boolean;
Var RetCmd : String ;
begin
  RetCmd := EnviaComando('23') ;
  Result := (copy( RetCmd, 5,1) = '0') ;
end;

procedure TACBrECFSweda.CancelaImpressaoCheque;
begin
  EnviaComando( '25' ) ;
end;

procedure TACBrECFSweda.ImprimeCheque(Banco: String; Valor: Double;
  Favorecido, Cidade: String; Data: TDateTime; Observacao: String);
Var Dia,Mes,Ano   : String ;
    Moeda, Moedas : String ;
    wRetentar     : Boolean ;
    ComPapel      : Boolean ;
    SecRestante   : Integer ;
    TempoInicio   : TDateTime ;
    Espera        : Integer ;
begin
  if not ChequePronto then
     raise Exception.Create('Cheque não está posicionado') ;

  Espera     := 25 ;
  Banco      := IntToStrZero(StrToIntDef(Banco,1),3) ;
  Favorecido := padL(Favorecido,80) ;
  Cidade     := padL(Cidade,30) ;
  Moeda      := padL('Real',20) ;
  Moedas     := padL('Reais',20) ;

  EnviaComando('44' + Favorecido + Cidade + Moeda + Moedas) ;
  Sleep(300) ;

  Observacao := padL(Observacao,120) ;
  Dia        := IntToStrZero(  DayOf(Data),2) ;
  Mes        := IntToStrZero(MonthOf(Data),2) ;
  Ano        := IntToStrZero( YearOf(Data),4) ;

  ComPapel   := True ;
  wRetentar  := Retentar ;
  try
     Retentar    := False ;
     TempoInicio := now  ;
     AguardaImpressao := True ;
     EnviaComando('24' + Banco + IntToStrZero(Round(Valor * 100),12) +
                  ' ' + Observacao + '4' + Dia + Mes + Ano, Espera ) ;

     { Sweda série B precisa de 2 comandos 24 para imprimir o cheque. O primeiro
       comando apenas puxa a folha, o segundo realmente imprime
       http://www.forumweb.com.br/foruns/index.php?s=&showtopic=50409&view=findpost&p=224119 }
     if fsVersaoSweda = swdB then
     begin
       TempoInicio := now  ;
       AguardaImpressao := True ;
       EnviaComando('24' + Banco + IntToStrZero(Round(Valor * 100),12) +
                    ' ' + Observacao + '4' + Dia + Mes + Ano, Espera ) ;
     end ;

     while ComPapel do
     begin
        SecRestante := 1 ;
        while ComPapel and (SecRestante > 0 ) do
        begin
           try
              ComPapel := ChequePronto
           except
              ComPapel := True ;
              Sleep(100) ;
           end ;
           SecRestante := Espera - SecondsBetween(now, TempoInicio) ;
        end ;

        if ComPapel then
           {$IFNDEF CONSOLE}
              if (MessageDlg('Favor remover o cheque e pressionar OK',
                             mtConfirmation,[mbOk,mbCancel],0) = mrCancel) then
                 break ;
           {$ELSE}
              writeln('Favor remover o cheque') ;
           {$ENDIF}

        TempoInicio := now ;
        Espera      := 5 ;
     end ;
  finally
     Retentar := wRetentar ;
  end ;
end;

procedure TACBrECFSweda.EsperaEstado(EstadoAEsperar: TACBrECFEstado;
   TimeOut : Integer = 2000 );
Var TFim : TDateTime ;
begin
  TFim := IncMilliSecond(now,TimeOut) ;
  
  while (now <= TFim) do
  begin
     try
        if Estado = EstadoAEsperar then
           break ;
     except
     end ;
     sleep( 200 ) ;
  end ;
end;

end.

