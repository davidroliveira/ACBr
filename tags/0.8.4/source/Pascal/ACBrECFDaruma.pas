{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2004 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{  Esta biblioteca � software livre; voc� pode redistribu�-la e/ou modific�-la }
{ sob os termos da Licen�a P�blica Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a vers�o 2.1 da Licen�a, ou (a seu crit�rio) }
{ qualquer vers�o posterior.                                                   }
{                                                                              }
{  Esta biblioteca � distribu�da na expectativa de que seja �til, por�m, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia impl�cita de COMERCIABILIDADE OU      }
{ ADEQUA��O A UMA FINALIDADE ESPEC�FICA. Consulte a Licen�a P�blica Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICEN�A.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral Menor do GNU junto}
{ com esta biblioteca; se n�o, escreva para a Free Software Foundation, Inc.,  }
{ no endere�o 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Voc� tamb�m pode obter uma copia da licen�a em:                              }
{ http://www.opensource.org/licenses/gpl-license.php                           }
{                                                                              }
{ Daniel Sim�es de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Pra�a Anita Costa, 34 - Tatu� - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{******************************************************************************
|* Historico
|*
|* 06/09/2004:  Daniel Simoes de Almeida
|*   Primeira Versao: Cria�ao e Distribui�ao da Primeira Versao
|* 19/03/2004:  Daniel Simoes de Almeida
|*   Corrigido BUG em FechaRelatorio quando um CV estava aberto.
|*   -  Bug reportado por Aurimenes Apolonio Silva
|* 26/10/2005:  Ederson Selvati
|*   Corrigido BUG na carga de Formas de Pagamento e CNF. A rotina anterior
|*   carregava todas as formas de pagamento... mesmo as que n�o haviam sido
|*   programadas
|* 08/12/2005:  Daniel Simoes de Almeida
|*  - VerificaFimImpressao poderia disparar excess�o com ECF off-line
|*  - Diminuido tempo de alguns Sleeps de 100 para 10 a fim de agilizar a
|*    comunica�ao com o ECF (experimental)
|* 16/12/2005:  Daniel Simoes de Almeida
|*  - Corrigido Bug, m�todos que usam o comando 229 (Ler configura��o), retorna-
|*    vam dados errados (GetHorarioVerao, e GetArredonda)
|* 16/03/2006:  Daniel Simoes de Almeida
|*  - Corrigido Bug em CarregaFormasPagamento e CarregaComprovantesNaoFiscais.
|*    posi�oes livres (n�o programadas) eram lidas como v�lidas
|*  - Corrigido Bug em ProgramaFormaPagamento. Detec��o autom�tica do pr�ximo
|*     indice livre falhava
|*  - ProgramaComprovanteNaoFiscal, modificada para n�o permitir cadastrar j�
|*    existente
|* 26/04/2006:  Daniel Simoes de Almeida
|*  - M�todo "VerificaFimImpressao" otimizado para usar os flags da
|*     "Palavra de Status" , pois o m�todo antigo falhava algumas vezes
|*  - Corrigido Bugs de TimeOut em v�rios comandos como VendeItem,
|*     RelatorioGerencial, etc
|*  - Corrigido Bug em ProgramaFormaPagamento. Programa��o de FPG com Vinculado
|*     n�o causava a programa��o de um Comprovante Nao Fiscal (equaliza��o)
|* 03/05/2006:  Daniel Simoes de Almeida
|*  - Corrigido Bug em GetTotalPago, que retornava o Valor de SubTotal mesmo
|*    antes do cupom ser SubTotalizado   (bug reportado por Fabio Farias)
|* 24/05/2006:  Carlos do Nascimento Filho
|*  - Adicionada a compatibilidade com o ECF FS2000
******************************************************************************}

{$I ACBr.inc}

unit ACBrECFDaruma ;

interface
uses ACBrECFClass, ACBrUtil, 
     Classes,
     {$IFDEF VisualCLX} QDialogs, QControls, QForms {$ENDIF}
     {$IFDEF VCL} Dialogs, Controls, Forms {$ENDIF} ;

const  ESC = #27  ;
       FS  = #28  ;
       GS  = #29  ;
       ENQ = #05  ;
       CR  = #13  ;
       LF  = #10  ;
       FF  = #255 ;

type
{ Classe filha de TACBrECFClass com implementa�ao para Daruma }
TACBrECFDaruma = class( TACBrECFClass )
 private
    fsNumVersao   : String ;
    fsNumSerie    : String ;
    fsNumECF      : String ;
    fsnumcupom    : String ;
    fsArredonda   : Char ;
    fsNumCRO      : String ;
    fsTotalAPagar : Double ;
    fsEmPagamento : Boolean ;
    fsMFD         : Boolean ;
    fsDecimaisPreco: Integer;
    fsDecimaisQtd: Integer;

    Function PreparaCmd( cmd : String ) : String ;
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
    function GetArredonda : Boolean; override ;

    Function VerificaFimLeitura(Retorno:String) : Boolean ; override ;
    function VerificaFimImpressao : Boolean ; override ;

 public
    Constructor create( AOwner : TComponent  )  ;
    Destructor Destroy  ; override ;

    procedure Ativar ; override ;

    Property IsMFD : Boolean read fsMFD ;
    Property DecimaisPreco : Integer read fsDecimaisPreco ;
    Property DecimaisQtd   : Integer read fsDecimaisQtd   ;

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

    Procedure MudaHorarioVerao  ; overload ; override ;
    Procedure MudaHorarioVerao( EHorarioVerao : Boolean ) ; overload ; override ;
    Procedure MudaArredondamento( Arredondar : Boolean ) ; override ;
    Procedure PreparaTEF ; override ; { Carrega as Formas, de Pagamento e CNF}
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

{ ----------------------------- TACBrECFDaruma ------------------------------ }

constructor TACBrECFDaruma.create( AOwner : TComponent ) ;
begin
  inherited create( AOwner ) ;

  fpDevice.HandShake := hsRTS_CTS ;
  { Variaveis internas dessa classe }
  fsTotalAPagar := 0 ;
  fsEmPagamento := false ;
  fsNumVersao   := '' ;
  fsNumSerie    := '' ;
  fsNumECF      := '' ;
  fsNumCRO      := '' ;
  fsnumcupom    := '' ;
  fsArredonda   := ' ';
  fsMFD         := false ;
  fsDecimaisPreco := -1 ;
  fsDecimaisQtd   := -1;

  fpModeloStr := 'Daruma' ;
end;

destructor TACBrECFDaruma.Destroy;
begin

  inherited Destroy ;
end;

procedure TACBrECFDaruma.Ativar;
begin
  if not fpDevice.IsSerialPort  then
     raise Exception.Create('A impressora: '+ModeloStr+' requer'+#10+
                            'Porta Serial:  (COM1, COM2, COM3, ...)');

//  fpDevice.HandShake := hsRTS_CTS ;
  inherited Ativar ; { Abre porta serial }

  fsNumVersao := '' ;
  fsNumSerie  := '' ;
  fsNumECF    := '' ;
  fsNumCRO    := '' ;
  fsArredonda := ' ';
  fsnumcupom  := '';
  fsMFD       := false ;
  fsDecimaisPreco := -1 ;
  fsDecimaisQtd   := -1 ;

  try
     { Testando a comunica�ao com a porta e se � MFD }
     if NumVersao = '' then
        raise EACBrECFNaoInicializado.Create(
                 'Erro inicializando a impressora '+ModeloStr );
  except
     Desativar ;
     raise ;
  end ;
end;


Function TACBrECFDaruma.EnviaComando( cmd : String ) : String ;
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
                 'Componente ACBrECF n�o est� Ativo');

     { Codificando CMD de acordo com o protocolo da Daruma }
     cmd := PreparaCmd( cmd ) ;

     while  not EmLinha( 3 ) do  { Impressora est� em-linha ? }
     begin
        if Retentar and
           (MessageDlg('A impressora '+ModeloStr+' n�o est� pronta.'+#10+#10+
                       'Deseja tentar novamente ?',mtConfirmation,
                       [mbYes,mbNo],0) = mrYes) then
           Continue ;

        raise EACBrECFSemResposta.create(
                 'Impressora '+ModeloStr+' n�o est� em linha') ;
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
              'Camandos n�o est�o sendo enviados para Impressora '+ModeloStr+
              #10+'Deseja tentar novamente ?',
              mtConfirmation,[mbYes,mbNo],0) <> mrYes) then
              raise EACBrECFSemResposta.create(
                    'Erro ao enviar comandos para a Impressora '+ModeloStr)
           else
              continue ;
        end ;
     end ;

     sleep(20) ;

     { Chama Rotina da Classe m�e TACBrClass para ler Resposta. Se houver
       falha na leitura LeResposta dispara Exce�ao }
     LeResposta ;
     Result := fpRespostaComando ;

     { Verificando por erros }
     ErroMsg := '' ;
     Erro    := 0 ;
     if (copy(Result,1,2) = ':E') then
        Erro := StrToIntDef(copy(Result,3,2),0) ;
        
     if fsNumVersao = '2000' then   
        if (copy(result,3,2) <>  '00') then
           Erro := StrToIntDef(copy(result,3,2),0);
           
     if fpComandoEnviado[1] = FS then
        Erro := StrToIntDef(copy(Result,2,2),0) ;
        
     if (copy(result,1,2) = ':'+#200 ) then
        fsNumCupom := copy(result,7,6)
     else if (copy(result,1,2) <> ':B') then
        fsNumCupom := '';

     if Erro <> 0 then
     begin
        case Erro of
           0 : ErroMsg := 'ECF em modo de Interven��o T�cnica' ;
           1 : ErroMsg := 'Comando dispon�vel somente em modo de Interven��o T�cnica' ;
           2 : ErroMsg := 'Erro gravando mem�ria fiscal' ;
           3 : ErroMsg := 'Mem�ria fiscal esgotada' ;
           4 : ErroMsg := 'Erro no rel�gio interno' ;
           5 : ErroMsg := 'Falha mec�nica' ;
           6 : ErroMsg := 'Erro lendo mem�ria fiscal' ;
          10 : ErroMsg := 'Documento sendo emitido' ;
          11 : ErroMsg := 'Documento n�o foi aberto' ;
          12 : ErroMsg := 'N�o existe documento a cancelar' ;
          13 : ErroMsg := 'Erro nos par�metros: N�o num�rico' ;
          14 : ErroMsg := 'N�o h� mem�ria dispon�vel para esta opera��o' ;
          15 : ErroMsg := 'Item a cancelar n�o encontrado' ;
          16 : ErroMsg := 'Erro de sintaxe no comando' ;
          17 : ErroMsg := 'Numeric overflow' ;
          18 : ErroMsg := 'Totalizador Tribut�rio selecionado n�o possui '+
                          'aliquota definida' ;
          19 : ErroMsg := 'Mem�ria fiscal vazia' ;
          21 : ErroMsg := 'Detectado proximidade do final da bobina de papel' ;
          22 : ErroMsg := 'Redu��o Z j� foi emitida. ECF Bloqueado ate 00:00' ;
          23 : ErroMsg := 'Redu��o Z do dia anterior ainda pendente '+
                          'Efetue uma Redu��o Z.' ;
          24 : ErroMsg := 'Valor de desconto ou acrescimo inv�lido' ;
          25 : ErroMsg := 'Caracter inv�lido nos Par�metros' ;
          30 : ErroMsg := 'Comprovante N�O Fiscal inv�lido ou n�o programado' ;
          38 : ErroMsg := 'Forma de pagamento selecionada n�o � v�lida' ;
          39 : ErroMsg := 'Erro na sequ�ncia de fechamento do cupom fiscal' ;
          42 : ErroMsg := 'Leitura X inicial ainda n�o foi emitida' ;
          43 : ErroMsg := 'N�o pode mais emitir CNF Vinculado solicitado';
          50 : ErroMsg := 'Sem Papel' ;
          61 : ErroMsg := 'Queda de energia durante a emiss�o do Cupom Fiscal' ;
          84 : ErroMsg := 'Impressora n�o est� respondendo' ;
        else
           ErroMsg := 'Erro retornado pelo ECF: '+IntToStrZero(Erro,2) ;
        end ;

        if Erro = 21 then       { Verifica se possui erro "Pouco Papel" }
        begin
           DoOnMsgPoucoPapel ;
           ErroMsg := '' ;   { Apaga Msg de Erro para nao gerar Exce��o }
        end ;
     end ;

     if ErroMsg <> '' then
      begin
        ErroMsg := 'Erro retornado pela Impressora: '+ModeloStr+#10+#10+
                   ErroMsg ;
        raise EACBrECFSemResposta.create(ErroMsg) ;
      end
     else
        Sleep(10) ;  { Pequena pausa entre comandos }

  finally
     AguardandoResposta := false ;
  end ;

end;

Function TACBrECFDaruma.PreparaCmd( cmd : String ) : String ;
Var I, chksum, LenCmd : Integer ;
begin
  result := '' ;
  if cmd = '' then exit ;
                           
  if cmd[1] = FS then
   begin
     if cmd[1] = ESC then  { Traduzindo comando enviado no protocolo antigo }
        cmd := FS + 'F' + copy(cmd,2,Length( cmd ) ) ;

     chksum := 0 ;
     LenCmd := Length( cmd ) ;

     For I := 1 to LenCmd do   { Aplicando XOR nos Bytes do comando }
        chksum := chksum xor ord( cmd[ I ] ) ;

     Result := cmd + chr( chksum ) ;
   end
  else
     Result := cmd + #13 ; { Adcionando Sufixo padrao }
end ;

function TACBrECFDaruma.VerificaFimLeitura(Retorno:String) : Boolean;
begin
  Result := (LeftStr( Retorno ,1 ) = ':') ;

  if Result then
     if fpComandoEnviado[1] = FS then
        Result := (copy(Retorno, length(Retorno)-1 ,1 ) = #13)
     else
        Result := (RightStr(Retorno ,1 ) = #13)      ;

  { Nota sobre o VerificaFimLeitura: A DARUMA responde muito antes da
    Impressao terminar, o que pode causar problemas com comandos enviados logo
    ap�s impressoes demoradas como a Leitura X (por exemplo). Para esses casos,
    � necess�rio ativar a propriedade "AguardaImpressao := True" }
end;


function TACBrECFDaruma.VerificaFimImpressao: Boolean;
Var Cmd , RetCmd : String ;
    I : Integer ;
begin
  { Essa fun��o s� � chamada se AguardaImpressao = True,
    Como essa fun��o � executada dentro da "LeResposta", que por sua vez foi
    chamada por "EnviaComando", n�o podemos usar o m�todo "EnviaComando" (ou
    teriamos uma chamada recursiva infinita), por isso o Loop abaixo envia o
    comando "Palavra Status" diretamente para a Serial, e aguarda por .5 segundo
    a resposta... Se a Daruma consegir responder, verifica se o Bit 0 de S8,
    est� desligado, o que significa que a Impress�o Terminou }
  Result := false ;
  if not EmLinha() then
     Sleep(100)
  else
   begin
     RetCmd := '' ;
     I      := 0 ;
     if fsNumVersao = '2000' then
        Cmd := PreparaCmd( GS + ENQ )    { Palavra de Status }
     else 
        Cmd := PreparaCmd( GS + FF ) ;   { Palavra de Status }

     try
        fpDevice.Serial.Purge ;  { Limpa buffer de Entrada e Saida }
        fpDevice.Serial.SendString( Cmd );
        Sleep(10) ;
     except
     end ;

     while (not VerificaFimLeitura( RetCmd ) ) and (I < 50) do
     begin
        try
           RetCmd := RetCmd + fpDevice.Serial.RecvPacket(10) ;
        except
        end ;
        Inc( I ) ;
     end ;
     Result := VerificaFimLeitura(RetCmd) and
               (not TestBit(StrToInt('$'+RetCmd[9]),0)) ;  { Bit0 - S8 }
   end ;
end;

function TACBrECFDaruma.GetDataHora: TDateTime;
Var RetCmd : String ;
    OldShortDateFormat : String ;
begin
  RetCmd := EnviaComando( ESC + #230 ) ;
  if fsNumVersao='2000' then
      RetCmd := copy(RetCmd,5,Length(RetCmd)) ;  {Retira :% e CR }
      
  OldShortDateFormat := ShortDateFormat ;
  try
     ShortDateFormat := 'dd/mm/yy' ;
     result := StrToDate(copy(RetCmd,3,2)+ DateSeparator +
                         copy(RetCmd,5,2)+ DateSeparator +
                         copy(RetCmd,7,2)) ;
  finally
     ShortDateFormat := OldShortDateFormat ;
  end ;
  result := RecodeHour(  result,StrToInt(copy(RetCmd, 9,2))) ;
  result := RecodeMinute(result,StrToInt(copy(RetCmd,11,2))) ;
  result := RecodeSecond(result,StrToInt(copy(RetCmd,13,2))) ;
end;

function TACBrECFDaruma.GetNumCupom: String;
Var RetCmd : String ;
    Num : Integer ;
begin
  if fsNumVersao='2000' then
   begin
     if fsNumCupom <> '' then
        Result := fsNumCupom 
     else
      begin
        RetCmd := EnviaComando( ESC + #235 ) ;

        if LeftStr(RetCmd, 1) <> ':' then
           Result := '      '
  	    else
         begin
           Num    := StrToIntDef(copy(RetCmd,8,6),0) ;
           Result := IntToStrZero(Num,6) ;
         end ;
      end
   end
  else
   begin
     RetCmd := EnviaComando( ESC + #239 ) ;

     if LeftStr(RetCmd, 3) <> ':' + ESC + #239 then
        Result := '      '
     else
      begin
        Num := StrToIntDef(copy(RetCmd,9,6),0) ;

        if copy(RetCmd,8,1) = '2' then  { Nao ha cupom aberto, retorna o proximo }
           Num := Num - 1 ;

        Result := IntToStrZero(Num,6) ;
      end ;
  end ;
end;

function TACBrECFDaruma.GetNumECF: String;
Var RetCmd : String ;
begin
  if Trim(fsNumECF) = '' then
  begin
     if fsNumVersao='2000' then
      begin
       RetCmd  := EnviaComando( ESC +#233);
       fsNumECF:=copy(RetCmd,29,4);
      end
     else
      begin
        RetCmd := EnviaComando( ESC + #239 ) ;

        if LeftStr(RetCmd, 3) <> ':' + ESC + #239 then
           fsNumECF := '    '
        else
           fsNumECF := copy(RetCmd,4,4) ;
      end;
  end ;

  Result := fsNumECF ;
end;

function TACBrECFDaruma.GetNumCRO: String;
Var RetCmd : String ;
begin
  if Trim(fsNumCRO) = '' then
  begin
     if fsNumVersao='2000' then
      begin
        RetCmd := EnviaComando( ESC + #237 ) ;
        if LeftStr(RetCmd, 1) <> ':' then
           fsNumCRO := '    '
        else
           fsNumCRO := copy(RetCmd,49,6) ;
      end
     else
      begin
        RetCmd := EnviaComando( ESC + #244 ) ;
        if LeftStr(RetCmd, 3) <> ':' + ESC + #237 then
           fsNumCRO := '    '
        else
           fsNumCRO := copy(RetCmd,38,4) ;
      end;
  end ;

  Result := fsNumCRO ;
end;

function TACBrECFDaruma.GetNumSerie: String;
Var RetCmd : String ;
    Tam : Integer ;
begin
  if Trim(fsNumSerie) = '' then
  begin
     if fsNumVersao='2000' then
      begin
        RetCmd    := EnviaComando( esc +#233);
        fsNumSerie:=copy(RetCmd,17,8);
      end
     else
      begin
        RetCmd := EnviaComando(ESC + #236) ;
     	Tam    := {$IFDEF FPC}ACBrUtil.{$ENDIF}IfThen(StrToIntDef(NumVersao,0) < 345, 6, 8) ;

        if LeftStr(RetCmd, 2) <> ':V' then
           fsNumSerie := StringOfChar(' ',Tam)
        else
           fsNumSerie := copy(RetCmd,3,Tam) ;
       end;
  end ;

  Result := fsNumSerie ;
end;

function TACBrECFDaruma.GetNumVersao: String ;
Var RetCmd    : String ;
    wRetentar : Boolean ;
begin
  if fsNumVersao = '' then
  begin
     try
        wRetentar := Retentar ;
        try
           Retentar := false ;
           RetCmd   := copy(EnviaComando(FS + 'R' + #200 + '137', 1), 6, 6) ;
           if copy(RetCmd,1,5) = ':'+#200+'137' then
           begin
              RetCmd := copy(RetCmd, 6, 6) ;
              fsMFD    := true ;
           end ;
        finally
           Retentar := wRetentar ;
        end ;
     except
        fsMFD  := false ;
        RetCmd := copy(EnviaComando(ESC + #195), 1, 6) ;

        if RetCmd = ':10043' then
           fsNumVersao := '345'
        else if RetCmd = ':10033' then
           fsNumVersao := '315'
        else if retcmd=':10004' then
           fsNumVersao:='2000'
        else
           fsNumVersao := copy(RetCmd,2,length(RetCmd)-2) ;
     end ;
  end ;

  if fsMFD then
  begin
     if (fsDecimaisPreco < 0) or (fsDecimaisQtd < 0) then
     begin
        RetCmd   := EnviaComando(FS + 'R' + #200 + '139', 1) ;
        if copy(RetCmd,1,5) = ':'+#200+'139' then
        begin
           fsDecimaisQtd   := StrToIntDef(copy(RetCmd,6,1),0) ;
           fsDecimaisPreco := StrToIntDef(copy(RetCmd,7,1),0) ;
        end ;
     end ;
  end ;

  Result := fsNumVersao ;
end;

function TACBrECFDaruma.GetTotalPago: Double;
begin
  Result := 0 ;
  if fsTotalAPagar <> 0 then
     Result := Subtotal - fsTotalAPagar ;
end;

function TACBrECFDaruma.GetSubTotal: Double;
Var RetCmd : String ;
begin
  if fsNumVersao = '2000' then
   begin
     RetCmd := EnviaComando(ESC + #235);
     if LeftStr(RetCmd, 1) <> ':' then
        RetCmd := '0'
     else
        RetCmd := copy(RetCmd,32,9) ;
   end
  else
   begin
     RetCmd := EnviaComando(ESC + #239) ;

     if LeftStr(RetCmd, 3) <> ':' + ESC + #239 then
        RetCmd := '0'
     else
        if StrToIntDef(NumVersao,0) >= 345 then
           RetCmd := copy(RetCmd,29,14)
        else
           RetCmd := copy(RetCmd,31,21) ;
   end;
   
  Result := RoundTo( StrToIntDef(RetCmd,0) / 100,-2) ;
end;


function TACBrECFDaruma.GetEstado: TACBrECFEstado;
Var RetCmd1,RetCmd2 : String ;
begin
  if (not fpAtivo) then
     fpEstado := estNaoInicializada
  else
   begin
     if fsNumVersao = '2000' then
        RetCmd1 := EnviaComando( GS + ENQ )
     else 
        RetCmd1 := EnviaComando( GS + FF ) ;

     if TestBit(StrToInt('$'+RetCmd1[7]),1) then
        fpEstado := estBloqueada
     else if TestBit(StrToInt('$'+RetCmd1[3]),1) then
        fpEstado := estRequerZ
     else if not TestBit(StrToInt('$'+RetCmd1[7]),2) then
        fpEstado := estRequerX
     else if fsEmPagamento then
        fpEstado := estPagamento
     else
      begin
        RetCmd2 := EnviaComando( ESC + #239 ) ;

        if pos(copy(RetCmd2,8,1),'03') > 0 then
           fpEstado := estRelatorio

        else if TestBit(StrToInt('$'+RetCmd1[5]),2) or
                (copy(RetCmd2,8,1) = '1') then
           fpEstado := estVenda
        else
           fpEstado := estLivre ;
      end;
   end ;

  Result := fpEstado ;
end;

function TACBrECFDaruma.GetGavetaAberta: Boolean;
Var RetCmd : String ;
begin
  RetCmd := EnviaComando( GS + FF ) ;
  Result := TestBit(StrToInt('$'+RetCmd[2]),3) ;
end;

function TACBrECFDaruma.GetPoucoPapel: Boolean;
Var RetCmd : String ;
begin
  RetCmd := EnviaComando( GS + FF ) ;
  Result := TestBit(StrToInt('$'+RetCmd[3]),0) or
            TestBit(StrToInt('$'+RetCmd[2]),0)  ;
end;

function TACBrECFDaruma.GetHorarioVerao: Boolean;
Var RetCmd : String ;
begin
  RetCmd := EnviaComando( ESC + #229 ) ;
  Result := (copy(RetCmd,7,1) = '1') ;
end;

function TACBrECFDaruma.GetArredonda: Boolean;
Var RetCmd : String ;
begin
  if fsArredonda = ' ' then
  begin
     RetCmd := EnviaComando( ESC + #229 ) ;
     if (copy(RetCmd,6,1) = '1') then
        fsArredonda := 'S'
     else
        fsArredonda := 'N' ;
  end ;

  Result := (fsArredonda = 'S') ;
end;

Procedure TACBrECFDaruma.LeituraX ;
begin
  AguardaImpressao := True ;
  
  if fsNumVersao = '2000' then
     EnviaComando(ESC + #250, 40 )
  else
     EnviaComando(ESC + #207, 40 ) ;
end;

Procedure TACBrECFDaruma.AbreGaveta ;
Var wRetentar : Boolean ;
begin
  wRetentar := Retentar ;
  Retentar  := false ;
  try
     try
        EnviaComando( ESC + 'p000') ;
     except
     { exce�ao silenciosa pois AbreGaveta nao tem resposta, Sempre gera erro }
     end ;

     try
  { pede a Data somente para esperar a impressora entrar em linha. A DARUMA
   imprime uma linha na bobina (demora + ou - 4 seg), ap�s a abertura da gaveta}
        EnviaComando( ESC + #230, 5) ;
     except
     end ;
  finally
     Retentar := wRetentar ;
  end ;
end;

Procedure TACBrECFDaruma.ReducaoZ(DataHora: TDateTime) ;
begin
  if DataHora = 0 then  { Aparentemente a DataHora � obrigat�ria na Daruma }
     DataHora := now ;

  AguardaImpressao := True ;
  if fsNumVersao = '2000' then
     EnviaComando( ESC + #252 + FormatDateTime('ddmmyyhhnnss',DataHora), 40 )
  else
     EnviaComando( ESC + #208 + FormatDateTime('ddmmyyhhnnss',DataHora), 40 )
end;

Procedure TACBrECFDaruma.MudaHorarioVerao ;
Var Resp : TModalResult ;
begin
  Resp := MessageDlg('Hor�rio de Ver�o ?',mtConfirmation,mbYesNoCancel,0) ;
  if Resp = mrCancel then exit ;

  MudaHorarioVerao( Resp = mrYes ) ;
end;

procedure TACBrECFDaruma.MudaHorarioVerao(EHorarioVerao: Boolean);
Var FlagVerao : String ;
begin
  FlagVerao := IfThen( EHorarioVerao, '1','0' );
  EnviaComando(ESC + #228 + 'XXXXX' + FlagVerao + StringOfChar('X',34) ) ;
end;

procedure TACBrECFDaruma.MudaArredondamento(Arredondar: Boolean);
begin
  EnviaComando( ESC + #228 + 'XXXX' + IfThen( Arredondar, '1','0' ) +
                StringOfChar('X',35) ) ;
  fsArredonda := ' ' ;
end;

procedure TACBrECFDaruma.AbreCupom(CPF_CNPJ: String);
begin
  { Daruma n�o permite informar o CPF/CNPJ na Abertura do Cupom } 
  fpUltimaMsgPoucoPapel := 0 ;  { Zera tempo pra msg de pouco papel }

  AguardaImpressao := True ;
  EnviaComando(ESC + #200, 5) ;
  fsEmPagamento := false ;
  fsTotalAPagar := 0 ;
end;

procedure TACBrECFDaruma.CancelaCupom;
begin
  AguardaImpressao := True ;
  if fsNumVersao = '2000' then
     EnviaComando(ESC + #211, 15)
  else
     EnviaComando(ESC + #206, 15) ;
  fsEmPagamento := false ;
  fsTotalAPagar := 0 ;

  FechaRelatorio ;   { Fecha relatorio se ficou algum aberto (s� por garantia)}
end;

procedure TACBrECFDaruma.CancelaItemVendido(NumItem: Integer);
begin
  if fsNumVersao = '2000' then
     EnviaComando(ESC + #204 + IntToStrZero( NumItem ,3), 1)
  else
     EnviaComando(ESC + #205 + IntToStrZero( NumItem ,3), 1) ;
end;

procedure TACBrECFDaruma.EfetuaPagamento(CodFormaPagto: String;
  Valor: Double; Observacao: String; ImprimeVinculado: Boolean);
Var RetCmd : String ;
begin
  inherited EfetuaPagamento(CodFormaPagto, Valor, Observacao, ImprimeVinculado);

  Observacao := LeftStr(Observacao,48) + FF ;
  if fsNumVersao = '2000' then
     RetCmd := EnviaComando( ESC + #207 + '51' +
                 IntToStrZero( Round( Valor * 100),12) + Observacao, 2)
  else
     RetCmd := EnviaComando( ESC + #242 + CodFormaPagto +
                 IntToStrZero( Round( Valor * 100),12) + Observacao, 2) ;

  fsEmPagamento := true ;
  fsTotalAPagar := RoundTo( StrToIntDef( copy(RetCmd,2,12),0 ) / 100, -2) ;
end;

procedure TACBrECFDaruma.FechaCupom(Observacao: String);
begin
  Observacao := StringReplace(Observacao,#10,CR+LF,[rfReplaceAll]) + FF ;

  AguardaImpressao := True ;
  if fsNumVersao = '2000' then
     EnviaComando( ESC + #209 + Observacao, 10) 
  else
     EnviaComando( ESC + #243 + Observacao, 10) ;

  fsEmPagamento := false ;
  fsTotalAPagar := 0 ;
end;

procedure TACBrECFDaruma.SubtotalizaCupom(DescontoAcrescimo: Double;
       MensagemRodape : String );
Var A_D : Char ;
    RetCmd : String ;
begin
  if DescontoAcrescimo < 0 then
     A_D := '1'
  else if DescontoAcrescimo > 0 then
     A_D := '3'
  else
     A_D := '0' ;

  DescontoAcrescimo := abs(DescontoAcrescimo) ;

  { Inicia fechamento com formas de Pagamento }
  if fsNumVersao = '2000' then
     RetCmd := EnviaComando(ESC + #206 + A_D + IntToStrZero(
                            Round( DescontoAcrescimo * 100 ), 12), 5)
  else
     RetCmd := EnviaComando(ESC + #241 + A_D + IntToStrZero(
                            Round( DescontoAcrescimo * 100 ), 12), 5) ;

  fsEmPagamento := true ;
  fsTotalAPagar := RoundTo( StrToIntDef( copy(RetCmd,2,12),0 ) / 100, -2) ;
end;

procedure TACBrECFDaruma.VendeItem(Codigo, Descricao: String;
  AliquotaICMS : String; Qtd: Double; ValorUnitario: Double;
  DescontoPorc: Double; Unidade: String);
Var AliquotaStr, QtdStr, ValorStr, DescontoStr : String ;
    ValAliquota : Double ;
    Aliquota : TACBrECFAliquota ;
    LenQtd : Integer ;
    Tipo : Char ;
begin
  if Qtd > 99999 then
     raise EACBrECFCMDInvalido.Create(
           'Quantidade deve ser inferior a 99999.');

  case AliquotaICMS[1] of
    'I' : AliquotaStr := 'I ' ;
    'N' : AliquotaStr := 'N ' ;
    'F' : AliquotaStr := 'F ' ;
    'T' : AliquotaStr := padL(copy(AliquotaICMS,1,2),2) ; {Indice}
  else
   begin
      { Verificando se informou T ou S no final da Aliquota (Tipo) }
     VerificaTipoAliquota( AliquotaICMS, Tipo) ;

     try
        ValAliquota := StringToFloat( AliquotaICMS ) ;
     except
        raise EACBrECFCMDInvalido.Create('Aliquota inv�lida: '+AliquotaICMS);
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

  if IsMFD then
   begin
     Codigo    := padL(Codigo,14) ;
     Unidade   := padL(Unidade,3) ;
     Descricao := TrimRight(LeftStr(Descricao,233)) + FF ;

     if AliquotaStr = 'I ' then
        AliquotaStr := '19'
     else if AliquotaStr = 'N ' then
        AliquotaStr := '21'
     else if AliquotaStr = 'F ' then
        AliquotaStr := '17' ;

     QtdStr   := IntToStrZero( Round(Qtd * power(10,fsDecimaisQtd)), 7) ;
     ValorStr := IntToStrZero( Round( ValorUnitario * power(10,fsDecimaisPreco)),
                               8 ) ;
     DescontoStr := '0' + IntToStrZero( Round(DescontoPorc * 100), 4) +
                    StringOfChar('0',7) ;

     EnviaComando(ESC + 'F' + #201 + AliquotaStr + QtdStr + ValorStr +
                  DescontoStr + '00' + Codigo + Unidade + Descricao ) ;
   end
  else if fsNumVersao = '2000' then
   begin
     Codigo      := padL(Codigo,18) ;    { Ajustando Tamanhos }
     DescontoStr := IntToStrZero( Round(DescontoPorc * 100), 4) ;
     Descricao   := TrimRight(LeftStr(Descricao,174)) + FF ;
     ValorStr    := IntToStrZero( Round(ValorUnitario * 1000), 10) ;
     QtdStr      := IntToStrZero( Round(Qtd * 1000), 8) ;
     Unidade     := padL(Unidade,2) ;

     if AliquotaStr = 'I ' then
        AliquotaStr := 'II '
     else if AliquotaStr = 'N ' then
        AliquotaStr := 'NN '
     else if AliquotaStr = 'F ' then
        AliquotaStr := 'FF '
     else if AliquotaStr = 'T1' then
        AliquotaStr := 'TA '
     else if AliquotaStr = 'T2' then
        AliquotaStr := 'TB '
     else if AliquotaStr = 'T3' then
        AliquotaStr := 'TC '
     else if AliquotaStr = 'T4' then
        AliquotaStr := 'TD '
     else if AliquotaStr = 'T5' then
        AliquotaStr := 'TE ';

     EnviaComando(ESC + #202 + AliquotaStr+ Codigo + '00000' + DescontoStr +
                  ValorStr + QtdStr + Unidade + Descricao, 1) ;

   end
  else
   begin
     Codigo      := padL(Codigo,13) ;    { Ajustando Tamanhos }
     DescontoStr := IntToStrZero( Round(DescontoPorc * 100), 4) ;
     Unidade     := padL(Unidade,2) ;
     LenQtd      := 5 ;
     if StrToInt(NumVersao) >= 345 then
        LenQtd := 6 ;

     QtdStr := FloatToStr(Qtd) ;
     if Length(QtdStr) > LenQtd then
        QtdStr := FloatToStr(RoundTo(Qtd,-(LenQtd-pos(DecimalSeparator,QtdStr)))) ;
     QtdStr := PadR(StringReplace(QtdStr,DecimalSeparator,',',[rfReplaceAll])
                       ,LenQtd,'0') ;
   
     if StrToInt(NumVersao) >= 345 then
      begin
        Descricao := TrimRight(LeftStr(Descricao,174)) + FF ;
        ValorStr  := IntToStrZero( Round(ValorUnitario * 1000), 9) ;

        EnviaComando(ESC + #225 + AliquotaStr + Codigo + '0000' + DescontoStr +
                     ValorStr + QtdStr + Unidade + Descricao) ;
      end
     else
      begin
        Descricao := PadL(Descricao,30) ;
        ValorStr  := IntToStrZero( Round(ValorUnitario * 100), 9) ;

        EnviaComando(ESC + #215 + AliquotaStr + Codigo + '0000' + DescontoStr +
                     ValorStr + QtdStr + Unidade + Descricao) ;
      end ;
   end ;

  fsTotalAPagar := 0 ;
  fsEmPagamento := false ;
end;

procedure TACBrECFDaruma.CarregaAliquotas;
Var RetCmd : String ;
    Aliquota : TACBrECFAliquota ;
    ValAliq : Double ;
begin
  inherited CarregaAliquotas ;   { Cria fpAliquotas }

  RetCmd := EnviaComando( ESC + #231 ) ;
  if fsNumVersao = '2000' then
     RetCmd := copy(RetCmd,3,Length(RetCmd)-5)   {Retira :% e CR }
  else
     RetCmd := copy(RetCmd,3,Length(RetCmd)-3) ;  {Retira :% e CR }

  while Length(RetCmd) > 0 do
  begin
    if fsNumVersao = '2000' then
       ValAliq := RoundTo( StrToIntDef( copy(RetCmd,1,4) ,0) / 100, -2) 
    else
       ValAliq := RoundTo( StrToIntDef( copy(RetCmd,2,4) ,0) / 100, -2) ;

    if ValAliq > 0 then
    begin
       Aliquota := TACBrECFAliquota.create ;

       Aliquota.Indice   := 'T'+UpCase(RetCmd[1]) ;
       Aliquota.Aliquota := ValAliq ;
       if UpCase(RetCmd[1]) <> RetCmd[1] then { � minuscula ? }
          Aliquota.Tipo := 'S' ;

       fpAliquotas.Add( Aliquota ) ;
    end ;

    RetCmd := copy(RetCmd,6,Length(RetCmd) ) ;
  end ;
end;

procedure TACBrECFDaruma.ProgramaAliquota(Aliquota: Double; Tipo: Char;
   Posicao : String );
Var ValStr, TipoStr : String ;
begin
  { Esse comando na Daruma nao usa o parametro Posicao }
  ValStr  := IntToStrZero( Round(Aliquota * 100) ,4) ;
  TipoStr := UpperCase(Tipo) ;
  if TipoStr <> 'S' then
     TipoStr := '' ;

  EnviaComando( ESC + #220 + TipoStr + ValStr ) ;
  
  CarregaAliquotas ;  { Re-avalia as aliquotas } 
end;

procedure TACBrECFDaruma.CarregaFormasPagamento;  { fun�ao Lenta +- 3 sec. }
Var RetCmd, StrFPG, StrCNF, Token, Descricao : String ;
    Cont : Integer ;
    FPagto : TACBrECFFormaPagamento ;
    CNF : TACBrECFComprovanteNaoFiscal ;
begin
  inherited CarregaFormasPagamento ;       {Inicializa fpFormasPagamentos}
  inherited CarregaComprovantesNaoFiscais ;{Inicializa fpComprovantesNaoFiscais}
  if fsNumVersao = '2000' then
     RetCmd := EnviaComando( ESC + #234 )
  else
     RetCmd := EnviaComando( ESC + #238 ) ;

  StrFPG := copy(RetCmd, 710, 288) ;
  StrCNF := copy(RetCmd, 374, 336) ;  // StrCNF := UpperCase(copy(RetCmd, 22, 352)) ;

  for Cont := 1 to 16 do
  begin
     Token     := copy(StrFPG, ((Cont-1) * 18) + 1, 17) ;
     Descricao := Trim(copy(Token,2,17)) ;
     if (Descricao <> '') and
        (UpperCase(Trim(Descricao)) <> 'PAGAMENTO TIPO '+chr(64+Cont)) then
     begin
        FPagto := TACBrECFFormaPagamento.create ;

        FPagto.Indice    := chr(64+Cont) ;
        FPagto.Descricao := Descricao ;
        FPagto.PermiteVinculado := (Token[1] = 'V');

        fpFormasPagamentos.Add( FPagto ) ;
     end ;

     Token := copy(StrCNF, ((Cont-1) * 21) + 1, 21) ;
     if (Token <> '') and (Token[2] <> #255) then
     begin
        CNF := TACBrECFComprovanteNaoFiscal.create ;

        CNF.Indice := chr(64+Cont) ;
        CNF.Descricao := Trim(Token) ;

        fpComprovantesNaoFiscais.Add( CNF ) ;
     end ;
  end ;
end;

procedure TACBrECFDaruma.ProgramaFormaPagamento(var Descricao: String;
  PermiteVinculado: Boolean; Posicao : String);
Var ProxIndice : Integer ;
    FPagto : TACBrECFFormaPagamento ;
begin
  Descricao := padL(Descricao,17) ;

  CarregaFormasPagamento ;

  ProxIndice := StrToIntDef(Posicao,-1) ;
  if (ProxIndice < 0) or (ProxIndice > 15) then { Indice passado � v�lido ? }
  begin
     For ProxIndice := 0 to 16 do  { Procurando Lacuna }
     begin
        if AchaFPGIndice(chr(65+ProxIndice)) = nil then
           break ;
     end ;
  end ;

  if ProxIndice > 15 then
     raise Exception.create('N�o h� espa�o para programar novas Formas de '+
                            'Pagamento');

  EnviaComando( ESC + #218 + 'PG' + IfThen(PermiteVinculado,'V','X') +
                chr(65+ProxIndice) + Descricao ) ;

  { Adcionanodo nova FPG no ObjectList }
  FPagto := TACBrECFFormaPagamento.create ;
  FPagto.Indice    := chr(65+ProxIndice) ;
  FPagto.Descricao := Descricao ;
  FPagto.PermiteVinculado := PermiteVinculado ;
  fpFormasPagamentos.Add( FPagto ) ;

  if PermiteVinculado then  { Equalizando Formas de Pagamento com CNFs }
     if AchaCNFDescricao(Descricao) = nil then
        ProgramaComprovanteNaoFiscal(Descricao,'V');
end;

procedure TACBrECFDaruma.CarregaComprovantesNaoFiscais;
begin
  CarregaFormasPagamento ;
end;

procedure TACBrECFDaruma.ProgramaComprovanteNaoFiscal(var Descricao: String;
  Tipo: String; Posicao : String );
begin
  Descricao := Trim(Descricao) ;
  if AchaCNFDescricao(Descricao) <> nil then
     raise Exception.Create('Comprovante n�o fiscal ('+Descricao+') j� existe.') ;
     
  { Esse comando na Daruma nao usa o parametro Posicao }
  Descricao := padL(Descricao,21) ;
  if Tipo = '' then
     Tipo := 'V'
  else
     Tipo := UpperCase(Tipo) ;

  if pos(Tipo,'V+-') = 0 then
     raise Exception.Create('Os Tipos v�lidos para Daruma s�o:'+sLineBreak+
                            'V  Comprovante Vinculado'+sLineBreak+
                            '+  Entrada de Recursos'+sLineBreak+
                            '-  Saida de Recursos') ;

  EnviaComando( ESC + #226 + Tipo + Descricao ) ;
  CarregaComprovantesNaoFiscais ;
end;


procedure TACBrECFDaruma.AbreRelatorioGerencial;
begin
  AguardaImpressao := True ;
  if fsNumVersao='2000' then
     EnviaComando(ESC + #214, 30)
  else
     EnviaComando(ESC + #211, 30) ;
end;

procedure TACBrECFDaruma.LinhaRelatorioGerencial(Linha: String);
Var P, Espera : Integer ;
    Buffer : String ;
begin
  Linha := AjustaLinhas( Linha );  { Formata as Linhas de acordo com "Coluna" }

  if not IsMFD then
     if fsNumVersao = '2000' then
        ImprimirLinhaALinha( Linha, ESC + #215 )
     else
        ImprimirLinhaALinha( Linha, ESC + #213 )
  else
     while Length( Linha ) > 0 do
     begin
        { N�o sei bem ao certo o limite de caracteres para esse comando na
          Daruma. Por isso, estou limitando em 10 linhas  10 X 48 = 480 }
        P := Length( Linha ) ;
        if P > 480 then    { Acha o fim de Linha mais pr�ximo do limite m�ximo }
           P := PosLast(#10, LeftStr(Linha,480) ) ;

        Buffer := copy( Linha, 1, P)  ;
        Espera := Trunc( CountStr( Buffer, #10 ) / 4) ;

        AguardaImpressao := (Espera > 3) ;
        if fsNumVersao = '2000' then
           EnviaComando( ESC + #215 + Buffer, Espera ) 
        else
           EnviaComando( ESC + #213 + Buffer, Espera ) ;

        Linha  := copy( Linha, P+1, Length(Linha) ) ;   // O Restante
     end ;
end;

procedure TACBrECFDaruma.AbreCupomVinculado(COO, CodFormaPagto,
  CodComprovanteNaoFiscal: String; Valor: Double);
Var FPG : TACBrECFFormaPagamento ;
    CNF : TACBrECFComprovanteNaoFiscal ;
    StrValor : String ;
begin
  COO      := Poem_Zeros( trim(COO) ,6) ;
  StrValor := IntToStrZero( Round(Valor * 100) ,12) ;
  
  AguardaImpressao := True ;
  if fsNumVersao = '2000' then
     EnviaComando(ESC + #213 +CodFormaPagto+ COO + StrValor, 8)
  else
   begin
     FPG := AchaFPGIndice( CodFormaPagto ) ;
     if FPG = nil then
        raise Exception.create( 'Forma de Pagamento: '+CodFormaPagto+
                                ' n�o foi cadastrada.' ) ;

     if CodComprovanteNaoFiscal <> '' then
      begin
        CNF := AchaCNFIndice( CodComprovanteNaoFiscal ) ;
        if CNF = nil then
           raise Exception.create( 'Comprovante N�O Fiscal: '+
                            CodComprovanteNaoFiscal+' n�o cadastrado.' ) ;
      end
     else
      begin
        CNF := AchaCNFDescricao( FPG.Descricao ) ;
        if CNF = nil then
           raise Exception.create( 'N�o existe nenhum Comprovante N�O Fiscal '+
                            ' com a Descri��o: '+FPG.Descricao) ;
      end ;

     AguardaImpressao := True ;
     EnviaComando(ESC + #219 + CNF.Indice + FPG.Indice + COO + StrValor, 8);
   end ;
end;

procedure TACBrECFDaruma.LinhaCupomVinculado(Linha: String);
begin
  LinhaRelatorioGerencial( Linha ) ; 
end;

procedure TACBrECFDaruma.FechaRelatorio;
Var RetCmd : String ;
begin
  if fsNumVersao = '2000' then
   begin
     RetCmd := EnviaComando( ESC + #235 ) ;

     if pos(copy(RetCmd,7,1),'03') > 0 then
     begin
        AguardaImpressao := True ;
        EnviaComando(ESC + #216, 8 ) ;
     end ;
   end
  else
   begin
     RetCmd := EnviaComando( ESC + #239 ) ;

     if pos(copy(RetCmd,8,1),'03') > 0 then
     begin
        AguardaImpressao := True ;
        EnviaComando(ESC + #212, 8 ) ;
     end ;
   end;
end;

procedure TACBrECFDaruma.PreparaTEF;
begin
  inherited PreparaTEF ;

  CarregaFormasPagamento ;
end;

procedure TACBrECFDaruma.ImpactoAgulhas;
Var
  {$IFDEF VisualCLX}
  Value : Integer
  {$ELSE}
  Resp  : String
  {$ENDIF} ;
  Cmd : String ;
begin
  if MessageDlg('Usar uma for�a de impacto maior'+sLineBreak+
                'que a Padr�o da Impressora (Normal)'+sLineBreak+
                'implica na diminui��o da vida �til'+sLineBreak+
                'do cabe�ote impressor.'+sLineBreak+sLineBreak+
                'Deseja continuar ?',mtWarning,mbYesNoCancel,0) <> mrYes then
     exit ;

  {$IFDEF VisualCLX}
    Value := 1 ;
    if not InputQuery('For�a de Impacto',
                  'Entre com a For�a de Impacto'+sLineBreak+sLineBreak+
                  '1 - Normal (padr�o)'+sLineBreak+
                  '2 - Extra',
                   Value, 1, 2 ) then
       exit ;

       if Value = 2 then
          Cmd := '2'
       else
          Cmd := '0' ;
  {$ELSE}
    Resp := '1' ;
    if not InputQuery('For�a de Impacto',
                  'Entre com a For�a de Impacto'+sLineBreak+sLineBreak+
                  '1 - Normal (padr�o)'+sLineBreak+
                  '2 - Extra', Resp ) then
       exit ;

       if Resp = '2' then
          Cmd := '2'
       else
          Cmd := '0' ;
  {$ENDIF} ;

  EnviaComando(ESC + #228 + StringOfChar('X',13) + Cmd + StringOfChar('X',26) ) ;
end;

procedure TACBrECFDaruma.LeituraMemoriaFiscal(ReducaoInicial,
   ReducaoFinal: Integer);
Var Espera : Integer ;
begin
  Espera := 10 + (ReducaoFinal - ReducaoInicial) ;
  AguardaImpressao := True ;
  if fsNumVersao = '2000' then
     EnviaComando( ESC + #251 + 'x' + IntToStrZero(ReducaoInicial,6)+
                     IntToStrZero(ReducaoFinal  ,6), Espera ) 
  else
     EnviaComando( ESC + #209 + 'x' + IntToStrZero(ReducaoInicial,6)+
                     IntToStrZero(ReducaoFinal  ,6), Espera ) ;
end;

procedure TACBrECFDaruma.LeituraMemoriaFiscal(DataInicial,
   DataFinal: TDateTime);
Var Espera : Integer ;
begin
  Espera := 10 + DaysBetween(DataInicial,DataFinal) ;
  AguardaImpressao := True ;
  if fsNumVersao = '2000' then
     EnviaComando(ESC + #251+'x' + FormatDateTime('ddmmyy',DataInicial)+
                      FormatDateTime('ddmmyy',DataFinal), Espera )
  else
     EnviaComando( ESC + #209 + 'x' + FormatDateTime('ddmmyy',DataInicial)+
                         FormatDateTime('ddmmyy',DataFinal), Espera ) ;
end;

procedure TACBrECFDaruma.LeituraMemoriaFiscalSerial(ReducaoInicial,
   ReducaoFinal: Integer; var Linhas: TStringList);
Var Espera : Integer ;
begin
  Espera := Trunc(TimeOut + ((ReducaoFinal - ReducaoInicial)/5) ) ;
  Linhas.Clear ;
  Linhas.Text := EnviaComando(ESC + #209 + 's' +
                                  IntToStrZero(ReducaoInicial,6)+
                                  IntToStrZero(ReducaoFinal  ,6), Espera ) ;
end;

procedure TACBrECFDaruma.LeituraMemoriaFiscalSerial(DataInicial,
   DataFinal: TDateTime; var Linhas: TStringList);
Var Espera : Integer ;
begin
  Espera := Trunc(TimeOut + (DaysBetween(DataInicial,DataFinal)/5) ) ;
  Linhas.Clear ;
  Linhas.Text := EnviaComando(ESC + #209 + 's' +
                                  FormatDateTime('ddmmyy',DataInicial)+
                                  FormatDateTime('ddmmyy',DataFinal), Espera ) ;
end;

end.


