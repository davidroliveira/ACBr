{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para interação com equipa- }
{ mentos de Automação Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2004 Rodrigo Frühwirth                      }
{                                       Daniel Simoes de Almeida               }
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
|* 25/11/2005: Rodrigo Frühwirth
|*   Primeira Versao: Criaçao e Distribuiçao da Primeira Versao
|* 06/12/2005:  Rodrigo Frühwirth
|*  - Corrigido bug na leitura do Estado do ECF
|* 08/12/2005:  Daniel Simoes de Almeida
|*  - Diminuido tempo de alguns Sleeps de 100 para 10 a fim de agilizar a
|*    comunicaçao com o ECF (experimental)
******************************************************************************}
{$I ACBr.inc}

unit ACBrECFICash ;

interface
uses ACBrECFClass, ACBrBase, ACBrUtil,
     Classes ;

const  STX = #2;
       ETX = #3;
       ACK = #6;
       NACK = #15;

type
{ Classe filha de TACBrECFClass com implementaçao para ICash }
TACBrECFICash = class( TACBrECFClass )
 private
    fsNumVersao : String ;
    fsNumCRO    : String ;
    fsNumECF    : String ;
    fsArredonda : Char ;
    fsVinculado : Boolean ;

    function PreparaCMD( cmd : String ) : String ;

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

 public
    Constructor create( AOwner : TComponent  )  ;
    Destructor Destroy  ; override ;

    procedure Ativar ; override ;

    Function EnviaComando_ECF( cmd : String ) : String ; override ;

    Procedure AbreCupom ; override ;
    Procedure VendeItem( Codigo, Descricao : String; AliquotaECF : String;
       Qtd : Double ; ValorUnitario : Double; DescontoPorc : Double = 0;
       Unidade : String = ''; TipoDescontoAcrescimo: String = '%') ; override ;
    Procedure SubtotalizaCupom( DescontoAcrescimo : Double = 0;
       MensagemRodape : String = '' ) ; override ;
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

    Procedure MudaHorarioVerao  ; overload ; override ;
    Procedure MudaHorarioVerao( EHorarioVerao : Boolean ) ; overload ; override ;
    Procedure MudaArredondamento( Arredondar : Boolean ) ; override ;
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
    function AchaICMSAliquota( var AliquotaICMS : String ) :
       TACBrECFAliquota ;  override;

    procedure CarregaFormasPagamento ; override ;
    Procedure ProgramaFormaPagamento( var Descricao: String;
       PermiteVinculado : Boolean = true; Posicao : String = '') ; override ;

    procedure CarregaComprovantesNaoFiscais ; override ;
    Procedure ProgramaComprovanteNaoFiscal( var Descricao: String;
       Tipo : String = ''; Posicao : String = '') ; override ;
 end ;

implementation
Uses SysUtils, Math,
    {$IFDEF COMPILER6_UP} DateUtils, StrUtils {$ELSE} ACBrD5, Windows{$ENDIF} ;

{ ----------------------------- TACBrECFICash ------------------------------ }

constructor TACBrECFICash.create( AOwner : TComponent ) ;
begin
  inherited create( AOwner ) ;

  fpDevice.HandShake := hsRTS_CTS ;
  { Variaveis internas dessa classe }
  fsVinculado := false ;
  fsNumVersao := '';
  fsNumECF    := '';
  fsNumCRO    := '';
  fsArredonda := ' ';

  fpModeloStr := 'ICash' ;
  fpRFDID     := 'IC' ;
end;

destructor TACBrECFICash.Destroy;
begin

  inherited Destroy ;
end;

procedure TACBrECFICash.Ativar;
var RetCMD: String;
begin
  if not fpDevice.IsSerialPort  then
     raise Exception.Create('A impressora: '+ModeloStr+' requer'+#10+
                            'Porta Serial:  (COM1, COM2, COM3, ...)');

  fpDevice.HandShake := hsRTS_CTS ;
  inherited Ativar ; { Abre porta serial }

  RetCMD      := EnviaComando( '67089' );
  RetCMD      := Copy( RetCMD, Pos( STX, RetCMD ) +3, 6 );
  fsNumVersao := RetCMD;

  try
     { Testando a comunicaçao com a porta }
     if NumVersao = '' then
        raise EACBrECFNaoInicializado.Create(
                 'Erro inicializando a impressora '+ModeloStr );
  except
     Desativar ;
     raise ;
  end ;

  RetCMD      := EnviaComando( '67086' );
  RetCMD      := Copy( RetCMD, Pos( STX, RetCMD ) +3, 4 );
  fsNumECF    := RetCMD;

  RetCMD      := EnviaComando( '67000' );
  RetCMD      := Copy( RetCMD, Pos( STX, RetCMD ) +3, 4 );
  fsNumCRO    := RetCMD;

  fsArredonda := ' ';
end;

Function TACBrECFICash.PreparaCMD( cmd : String ) : String;
Var nPos, nSoma: Integer;
    cResult, cCMDHEX, cCMD : String;
Begin
   Result := cmd;
   if cmd = '' then exit;

   cResult := '';
   nSoma := 0;
   nPos := 1;
   cCMDHEX := '';
   cCMD := '';
   while nPos <= length( cmd ) do begin
      nSoma   := nSoma + ord( cmd[nPos] );
      cCMDHex    := cCMDHex + Chr( ord( cmd[nPos] ) );
      inc( nPos );
   end;
   nSoma := nSoma + 5;
   cCMDHEX := STX + cCMDHEX + ETX;
   If nSoma < 256 Then Begin
      cCMDHEX := cCMDHEX + Chr(00) + Chr( nSoma );
   End else Begin
      cCMD := IntToHex(nSoma,4);
      cCMDHEX := cCMDHEX + chr( strtoint( '0x'+Copy(cCMD,1,2)));
      cCMDHEX := cCMDHEX + chr( strtoint( '0x'+Copy(cCMD,3,2)));
   End;
   Result  := cCMDHEX;
End;

Function TACBrECFICash.EnviaComando_ECF( cmd : String ) : String ;
Var ErroMsg, ErroMsg2 : String ;
    Erro, Erro2 : Integer;
    Retorno, Retorno2 : Char;
begin
  result  := '' ;
  ErroMsg := '' ;
  ErroMsg2:= '' ;
  fpComandoEnviado   := '' ;
  fpRespostaComando  := '' ;

  { Codificando CMD de acordo com o protocolo da ICash }
  cmd := PreparaCMD( cmd );

  fpDevice.Serial.DeadlockTimeout := 2000 ; { Timeout p/ Envio }

  while fpComandoEnviado = '' do
  begin
     fpDevice.Serial.Purge ;                   { Limpa a Porta }

     if not TransmiteComando( cmd ) then
        continue ;

     fpComandoEnviado := cmd ;
  end ;

  Sleep(20);

  { Chama Rotina da Classe mãe TACBrClass para ler Resposta. Se houver
    falha na leitura LeResposta dispara Exceçao }
  LeResposta;

  { Retirando STX e ETX }
  Result := copy( fpRespostaComando, 2, Length( fpRespostaComando )-2 );

  { Verificando por erros }
  ErroMsg  := '' ;
  ErroMsg2 := '' ;
  Retorno  := fpRespostaComando[2];
  Retorno2 := fpRespostaComando[3];
  Erro    := Ord( Retorno );
  Erro2   := Ord( Retorno2 );
  if Erro<>0 then
     case Erro of
       48 : ErroMsg := '';
       49 : ErroMsg := 'Cupom Fiscal Aberto (Cabeçalho Impresso)';
       50 : ErroMsg := 'Cupom Fiscal em Posição de Efetuar Venda';
       51 : ErroMsg := 'Cupom Fiscal Totalizando Venda';
       52 : ErroMsg := 'Cupom Fiscal Finalizando a Totalização (Formas de Pagamento)';
       53 : ErroMsg := 'Cupom Fiscal com Totalização Finalizada';
       54 : ErroMsg := 'Cupom Não Fiscal Aberto';
       55 : ErroMsg := 'Cupom Não Fiscal em Posição de Efetuar Venda';
       56 : ErroMsg := 'Cupom Não Fiscal Totalizando Venda';
       57 : ErroMsg := 'Cupom Não Fiscal Finalizando a Totalização';
       65 : ErroMsg := 'Cupom Não Fiscal com Totalização Finalizada';
       66 : ErroMsg := 'Emitindo Relatório Gerencial';
       67 : ErroMsg := 'Em Intervenção Técnica';
       68 : ErroMsg := 'Dia já Encerrado';
       69 : ErroMsg := 'Obrigatório Fechar Dia';
       70 : ErroMsg := 'Comprovante de Crédito/Débito Aberto';
       71 : ErroMsg := 'Comprovante de Estorno Crédito/Débito Aberto';
       72 : ErroMsg := 'Fora de Período de Vendas';
     else
        ErroMsg := 'Erro retornado pelo ECF: '+IntToStr(Erro) ;
     end;
//     else
     { Verifica se possui erro "Pouco Papel" }
//        if (LeftStr(Result,1) = '+') and (Erro = 1) then
//           DoOnMsgPoucoPapel ;

  if (Erro2<>0) and (Erro2<>32) then
     case Erro2 of
//          32 : ErroMsg2 := 'Operação realizada com sucesso';
       35 : ErroMsg2 := 'Tamanho do Comando Inválido';
       36 : ErroMsg2 := 'Comando Inválido';
       37 : ErroMsg2 := 'O Comando deve ser executado após zerar toda a memória';
       38 : ErroMsg2 := 'Não é após Redução Z';
       39 : ErroMsg2 := 'Erro de Cupom Aberto';
       40 : ErroMsg2 := 'Dados Numéricos Inválidos';
       41 : ErroMsg2 := 'Data e Hora Inválida';
       42 : ErroMsg2 := 'Comando já executado ou proibido';
       43 : ErroMsg2 := 'Erro de Texto Inválido';
       44 : ErroMsg2 := 'Erro de Sequencia de Operação';
       45 : ErroMsg2 := 'Erro de Parametro Inválido';
       47 : ErroMsg2 := 'Necessário Programação Prévia';
       64 : ErroMsg2 := 'Jumper de Intervenção na Posição Errada';
       67 : ErroMsg2 := 'Redução Z do Dia já Realizada';
       68 : ErroMsg2 := 'Efetuar Redução Z';
       79 : ErroMsg2 := 'Erro não Definido!';
     else
        ErroMsg2 := 'Erro retornado pelo ECF: '+IntToStr(Erro2) ;
     end;

  Sleep( IntervaloAposComando ) ;  { Pequena pausa entre comandos }

  If ( LeftStr( fpComandoEnviado, 3 ) = '200' ) and ( ( Erro = 49 ) or ( Erro = 50 ) ) and (Erro2 = 32) Then Exit; // Abertura de Cupom
  If ( LeftStr( fpComandoEnviado, 2 ) = '67' ) Then Exit;                                    // Leitura das Memórias de trabalho
  If ( LeftStr( fpComandoEnviado, 2 ) = '21' ) and ( Erro = 50 ) and (Erro2 = 32) Then Exit; // Venda de Item no Cupom
  If ( LeftStr( fpComandoEnviado, 2 ) = '22' ) and ( Erro = 53 ) and (Erro2 = 32) Then Exit; // Totalização de Cupom
  If ( LeftStr( fpComandoEnviado, 2 ) = '23' ) and ( Erro = 53 ) and (Erro2 = 32) Then Exit; // Mensagem Promocional
  If ( LeftStr( fpComandoEnviado, 2 ) = '26' ) and ( Erro = 50 ) and (Erro2 = 32) Then Exit; // Desconto/Acresimo Item
  If ( LeftStr( fpComandoEnviado, 2 ) = '27' ) and ( Erro = 51 ) and (Erro2 = 32) Then Exit; // Desconto/Acresimo Subtotal cupom
  If ( LeftStr( fpComandoEnviado, 2 ) = '72' ) and ( Erro = 68 ) and (Erro2 = 32) Then Exit; // Reducao Z
  If ( LeftStr( fpComandoEnviado, 2 ) = '2E' ) and ( Erro2 = 32) Then Exit;                  // Leitura do Total do Cupom

  if (ErroMsg <> '') or (ErroMsg2 <> '') then
  begin
     ErroMsg := 'Erro retornado pela Impressora: '+ModeloStr+#10+#10+
                ErroMsg +#10+#10+
             ErroMsg2 ;
     raise EACBrECFSemResposta.create(ErroMsg) ;
  end ;
end;

function TACBrECFICash.VerificaFimLeitura(Retorno:String) : Boolean;
begin
   If Retorno <> ACK Then
    Begin
      If ( ( LeftStr( fpComandoEnviado, 2 ) = '21' ) or ( LeftStr( fpComandoEnviado, 2 ) = '26' ) or ( LeftStr( fpComandoEnviado, 2 ) = '67' ) or ( LeftStr( fpComandoEnviado, 2 ) = '2E' ) ) Then
       Begin
         If Length( Retorno ) = 3 Then
            result := ( LeftStr( Retorno,1 ) = ACK )
         Else
          Begin
            If ( LeftStr( fpComandoEnviado, 2 ) = '21' ) and  (pos(ETX,Retorno)=0) Then
               sleep(500);
            result := ( LeftStr( Retorno,1 ) = ACK ) and (pos(ETX,Retorno)>0);
          End;
       End
      Else
         result := ( LeftStr( Retorno,1 ) = ACK );
    End
   Else
      If Retorno = NACK Then
         raise exception.Create( 'Impressora ' + ModeloStr + ' retornou NACK' )
      Else
         result := False;
end;

function TACBrECFICash.GetDataHora: TDateTime;
Var RetCmd : String ;
    DataHora: TDateTime;
begin
   RetCmd := EnviaComando( '67081' ) ;
   RetCMD := Copy( RetCMD, Pos( STX, RetCMD ) +3, 14 );
   DataHora := EncodeDateTime( StrToInt( Copy( RetCMD, 5,4 ) ),
                               StrToInt( Copy( RetCMD, 3, 2 ) ),
                               StrToInt( Copy( RetCMD, 1, 2 ) ),
                               StrToInt( Copy( RetCMD, 9, 2 ) ),
                               StrToInt( Copy( RetCMD, 11, 2 ) ),
                               StrToInt( Copy( RetCMD, 13, 2 ) ),
                               0 );
   Result := DataHora;
end;

function TACBrECFICash.GetNumCupom: String;
Var RetCmd : String ;
begin
  RetCmd := EnviaComando( '67002' ) ;
  Result := Copy( RetCMD, Pos( STX, RetCMD ) +9, 6 );
end;

function TACBrECFICash.GetNumCRO: String;
Var RetCmd : String ;
begin
   if Trim(fsNumCRO) = '' then begin
      RetCMD      := EnviaComando( '67000' );
      RetCMD      := Copy( RetCMD, Pos( STX, RetCMD ) +3, 4 );
      fsNumCRO    := RetCMD;
   end;
   Result := fsNumCRO ;
end;

function TACBrECFICash.GetNumECF: String;
Var RetCmd : String ;
begin
   If Trim( fsNumECF ) = '' then Begin
      RetCMD      := EnviaComando( '67086' );
      fsNumECF    := Copy( RetCMD, Pos( STX, RetCMD ) +3, 4 );
   End;
   Result := fsNumECF;
end;

function TACBrECFICash.GetNumSerie: String;
Var RetCmd : String ;
begin
   RetCMD := EnviaComando( '67091' );
   Result := Copy( RetCMD, Pos( STX, RetCMD ) +3, 12 );
end;

function TACBrECFICash.GetNumVersao: String ;
Var RetCmd : String ;
begin
   if fsNumVersao = '' then begin
      RetCMD      := EnviaComando( '67089' );
      RetCMD      := Copy( RetCMD, Pos( STX, RetCMD ) +3, 6 );
      fsNumVersao := RetCMD;
  end;
  Result := fsNumVersao ;
end;

function TACBrECFICash.GetTotalPago: Double;
Var RetCmd : String ;
begin
   RetCmd := EnviaComando( '2E', 4 ) ;
   RetCMD := Copy( RetCMD, Pos( STX, RetCMD ) +31, 14 );
   Result := StrToFloat( RetCMD ) / 100;
end;

function TACBrECFICash.GetSubTotal: Double;
Var RetCmd : String ;
begin
   RetCmd := EnviaComando( '2E' ) ;
   RetCMD := Copy( RetCMD, Pos( STX, RetCMD ) +3, 14 );
   Result := StrToFloat( RetCMD ) / 100;
end;


function TACBrECFICash.GetEstado: TACBrECFEstado;
Var RetCmd : String ;
    Ret1: Integer;
begin
   if (not fpAtivo) then
      fpEstado := estNaoInicializada
   else begin
      RetCmd := EnviaComando( '67082' ) ;
      retCMD := Copy( RetCMD, Pos( STX, RetCMD ) +3, 10 );
      Ret1 := Ord( RetCMD[1] );

      If (Ret1 = 48) Then
         fpEstado := estLivre
      Else If (Ret1 = 49) Then
         fpEstado := estVenda
      Else If (Ret1 = 51) or (Ret1 = 52) or (Ret1 = 53) Then
         fpEstado := estPagamento
      Else If (Ret1 = 66) Then
         fpEstado := estRelatorio
      Else If (Ret1 = 72) or (Ret1 = 68) Then
         fpEstado := estBloqueada
      Else If (Ret1 = 69) Then
         fpEstado := estRequerZ
      Else
         fpEstado := estDesconhecido;
   End;
   Result := fpEstado ;
end;

function TACBrECFICash.GetGavetaAberta: Boolean;
Var RetCmd : String ;
begin
   RetCMD := EnviaComando( '67082' );
   RetCMD := Copy( RetCMD, Pos( STX, RetCMD ) +3, Length( RetCMD ) );
   Result := RetCMD[1] = '1';
end;

function TACBrECFICash.GetPoucoPapel: Boolean;
var RetCMD: String;
begin
   RetCMD := EnviaComando( '67082' );
   RetCMD := Copy( RetCMD, Pos( STX, RetCMD ) +3, Length( RetCMD ) );
   Result := RetCMD[2] = '0';
end;

function TACBrECFICash.GetHorarioVerao: Boolean;
var RetCMD: String;
begin
   RetCMD := EnviaComando( '67082' );
   RetCMD := Copy( RetCMD, Pos( STX, RetCMD ) +3, Length( RetCMD ) );
   Result := RetCMD[3] = '1';
end;

function TACBrECFICash.GetArredonda: Boolean;
begin
  if fsArredonda = ' ' then
  begin
     fsArredonda := 'S' ;
  end ;

  Result := (fsArredonda = 'S') ;
end;

Procedure TACBrECFICash.LeituraX ;
begin
  EnviaComando( '510', 45 ) ;
end;

Procedure TACBrECFICash.ReducaoZ(DataHora: TDateTime) ;
begin
  EnviaComando( '7200', 45 );
end;

Procedure TACBrECFICash.AbreGaveta ;
begin
  EnviaComando( '45' );
end;

Procedure TACBrECFICash.MudaHorarioVerao ;
begin
  EnviaComando( '71', 3 ) ;
end;

procedure TACBrECFICash.MudaHorarioVerao(EHorarioVerao: Boolean);
begin
  if EHorarioVerao <> HorarioVerao then
     MudaHorarioVerao ;
end;

procedure TACBrECFICash.MudaArredondamento(Arredondar: Boolean);
begin
//  EnviaComando( '50' + IfThen(Arredondar,'1','0') ) ;
end;

procedure TACBrECFICash.AbreCupom ;
begin
  fpUltimaMsgPoucoPapel := 0 ;  { Zera tempo pra msg de pouco papel }
  if not Assigned( fpAliquotas ) then
     CarregaAliquotas ;
  EnviaComando('200', 8 ) ;
end;

procedure TACBrECFICash.CancelaCupom;
begin
   If Estado = estLivre Then
      EnviaComando( '2A', 16 )  // Cancela Cupom Anterior
   Else
      EnviaComando( '29', 8 ); // Cancela Cupom Atual
end;

procedure TACBrECFICash.CancelaItemVendido(NumItem: Integer);
begin
  EnviaComando( '25' + IntToStrZero(NumItem,3), 10 ) ;
end;

procedure TACBrECFICash.EfetuaPagamento(CodFormaPagto: String;
  Valor: Double; Observacao: String; ImprimeVinculado: Boolean);
Var cRestoObs, Linhas, Linhas2 : String ;
    Conta: Integer;
begin
  if ImprimeVinculado then
     if fsVinculado then
        raise Exception.Create('Já existe Forma de Pagamento com '+#10+
                               'comprovante NAO fiscal vinculado pendente. '+#10+
                               'Impressora: '+ModeloStr+' aceita apenas um '+#10+
                               'Comprovante não Fiscal Viculado por Cupom.')
     else
        fsVinculado := true ;

  EnviaComando( '22' + CodFormaPagto + IntToStrZero( Round(Valor*100) ,13) );
  if Observacao <> '' then Begin
     cRestoOBS := LeftStr( Observacao, 192 );
     Linhas  := '';
     Linhas2 := '';
     If cRestoOBS <> '' Then Begin
        for Conta := 1 to 4 do Begin
           Linhas := Linhas +'0' + PadL( Copy( cRestoOBS, 1, 48 ), 48 );
           Delete( cRestoOBS, 1, 48 );
        End;
     End;
     If cRestoOBS <> '' Then Begin
        for Conta := 1 to 4 do Begin
           Linhas2 := Linhas2 +'0' + PadL( Copy( cRestoOBS, 1, 48 ), 48 );
           Delete( cRestoOBS, 1, 48 );
        End;
     End;
     If Linhas  <> '' Then
        EnviaComando( '23' + Linhas );
     If Linhas2 <> '' Then
        EnviaComando( '23' + Linhas2 );
  End;
end;

procedure TACBrECFICash.FechaCupom(Observacao: String);
var cRestoOBS, Linhas, Linhas2: String;
   Conta: Integer;
begin
  if Observacao <> '' then Begin
     cRestoOBS := LeftStr( Observacao, 192 );
     Linhas  := '';
     Linhas2 := '';
     If cRestoOBS <> '' Then Begin
        for Conta := 1 to 4 do Begin
           Linhas := Linhas +'0' + PadL( Copy( cRestoOBS, 1, 48 ), 48 );
           Delete( cRestoOBS, 1, 48 );
        End;
     End;
     If cRestoOBS <> '' Then Begin
        for Conta := 1 to 4 do Begin
           Linhas2 := Linhas2 +'0' + PadL( Copy( cRestoOBS, 1, 48 ), 48 );
           Delete( cRestoOBS, 1, 48 );
        End;
     End;
     If Linhas  <> '' Then
        EnviaComando( '23' + Linhas ); // Observacoes 4 Linhas
     If Linhas2 <> '' Then
        EnviaComando( '23' + Linhas2 );  // Observacoes 4 Linhas
  End;

  EnviaComando( '17', 5 ) ; // Fechando Cupom
  fsVinculado := false
end;

procedure TACBrECFICash.SubtotalizaCupom( DescontoAcrescimo : Double = 0;
       MensagemRodape : String = '' ) ;
var DescontoSTR, cTipoDesc, RetCMD: String;
begin
   DescontoSTR := '';
   cTipoDesc   := '';
   If DescontoAcrescimo <>0 then Begin
      If DescontoAcrescimo < 0 Then
         cTipoDesc := '2'
      Else
         cTipoDesc := '4';
      DescontoStr := IntToStrZero( Round( Abs( DescontoAcrescimo ) * 100), 12 );

      RetCMD := EnviaComando( '27' + cTipoDesc + '0000' + DescontoSTR );
   End;
end;

procedure TACBrECFICash.VendeItem(Codigo, Descricao: String;
  AliquotaECF : String; Qtd: Double; ValorUnitario: Double;
  DescontoPorc: Double; Unidade: String; TipoDescontoAcrescimo: String);
Var QtdStr, ValorStr, DescontoStr, Fmt, cNumDecimais: String ;
    RetCMD: String;
    nNumItem: Integer;
begin
   if Qtd > 9999 then
      raise EACBrECFCMDInvalido.Create(
           'Quantidade deve ser inferior a 9999.');

   Codigo      := padL(Codigo,14) ;    { Ajustando Tamanhos }
   Unidade     := padL(Unidade,3) ;

   Fmt := Format( '%.3f', [ValorUnitario]);
   If RightStr(fmt,1) = '0' Then
      cNumDecimais := '2'
   Else
      cNumDecimais := '3';
   QtdStr   := IntToStrZero( Round( Qtd*1000 ), 7 );
   If cNumDecimais = '2' then
      ValorStr := IntToStrZero( Round( ValorUnitario*100 ), 8 )
   else
      ValorStr := IntToStrZero( Round( ValorUnitario*1000 ), 8 );

  Descricao := padl(LeftStr( Trim(Descricao), 28),28);

  RetCMD   := EnviaComando( '21' + Codigo + Descricao + QtdStr + Unidade + ValorStr + cNumDecimais + AliquotaECF, 7 );
  nNumItem := StrToInt( Copy( RetCMD, Pos(STX, RetCMD)+3, 3 ) );

  If DescontoPorc > 0 then
  begin
     if TipoDescontoAcrescimo='%' then
        DescontoStr := '1' + IntToStrZero( Round(DescontoPorc * 100), 4) +
                             StringOfChar('0',12)
     else
        DescontoStr := '2' + '0000' + IntToStrZero( Round(DescontoPorc*100), 12) ;

     EnviaComando( '26' + DescontoStr + IntToStrZero( nNumItem, 3 ), 4  );
  end ;
end;

procedure TACBrECFICash.CarregaAliquotas;
Var RetCmd : String ;
    Aliquota : TACBrECFAliquota ;
    ValAliq : Double ;
    A, nTentativas : Integer ;
begin
  inherited CarregaAliquotas ;   { Cria fpAliquotas }

  try
     ValAliq := 0;
     nTentativas := 0;
     A           := 0;
     While A <= 16 do begin
        RetCmd := EnviaComando( '67'+IntToStrZero(A+19,3), 2 ) ;
        if (Copy( RetCMD, pos('%',RetCMD)-5,5) <> '**,**') and (pos('%',RetCMD)>0) Then
           ValAliq := StrToFloat( Copy( RetCMD, pos('%',RetCMD)-5,5))
        Else Begin
           If nTentativas < 5 then begin
              Inc( nTentativas );
              Continue;
           End Else Begin
              Inc(A);
              Continue;
           End;
        End;
        if ValAliq > 0 then begin
           Aliquota := TACBrECFAliquota.create ;
           Aliquota.Indice   := 'T'+IntToStrZero(A,2) ;
           Aliquota.Aliquota := ValAliq ;
           Aliquota.Tipo     := Copy( RetCMD, pos('%',RetCMD)-6,1)[1];
           fpAliquotas.Add( Aliquota ) ;
        end;
        Inc(A);
     end ;
  except
     fpAliquotas.Free ;
     fpAliquotas := nil ;

     raise ;
  end ;

end;

procedure TACBrECFICash.ProgramaAliquota(Aliquota: Double; Tipo: Char;
   Posicao : String);
begin
   // ICash só permite programação em Estado de Intervenção técnica.
end;

function TACBrECFICash.AchaICMSAliquota( var AliquotaICMS: String):
   TACBrECFAliquota;
  Var AliquotaStr : String ;
begin
  AliquotaStr := '' ;
  Result      := nil ;

   if copy(AliquotaICMS,1,2) = 'TT' then { Corrige Duplo T  }
     AliquotaICMS := copy(AliquotaICMS,2,5) ;

   case AliquotaICMS[1] of
      'I' : AliquotaStr := 'I1 ' ;
      'N' : AliquotaStr := 'N1 ' ;
      'F' : AliquotaStr := 'F1 ' ;
      'T' : AliquotaICMS := 'T'+padR(copy(AliquotaICMS,2,2),2) ; {Indice}
  end ;

  if AliquotaStr = '' then
   begin
     Result := inherited AchaICMSAliquota( AliquotaICMS ) ;
     if Result <> nil then
        AliquotaICMS := 'T'+Format('%5.2f', [Result.Aliquota])+'%'
   end 
  else
     AliquotaICMS := AliquotaStr ;
end;


procedure TACBrECFICash.CarregaFormasPagamento;  { funçao Lenta +- 3 sec. }
Var RetCmd, Descricao : String ;
    Cont : Integer ;
    FPagto : TACBrECFFormaPagamento ;
begin
  inherited CarregaFormasPagamento ;       {Inicializa fpFormasPagamentos}

  try
     for Cont := 0 to 9 do
     begin
        RetCmd    := EnviaComando( '67' + IntToStrZero(65 + Cont,3) ) ;

        Descricao := Trim(copy(RetCmd, Pos( STX, RetCMD ) +3 + 15,15)) ;
        if Descricao <> '' then
        begin
           FPagto := TACBrECFFormaPagamento.create ;

           FPagto.Indice    := IntToStrZero(Cont,2) ;
           FPagto.Descricao := Descricao ;

           fpFormasPagamentos.Add( FPagto ) ;
        end ;
     end ;
  except
     fpFormasPagamentos.Free ;
     fpFormasPagamentos := nil ;

     raise ;
  end ;
end;

procedure TACBrECFICash.ProgramaFormaPagamento(var Descricao: String;
  PermiteVinculado: Boolean; Posicao : String );
begin
   // ICash só permite programação em Estado de Intervenção técnica.
end;

procedure TACBrECFICash.CarregaComprovantesNaoFiscais;
Var RetCmd, Descricao : String ;
    Cont : Integer ;
    CNF : TACBrECFComprovanteNaoFiscal ;
begin
  inherited CarregaComprovantesNaoFiscais ;{Inicializa fpComprovantesNaoFiscais}

  try
     for Cont := 16 to 31 do
     begin
        RetCmd    := EnviaComando( '34M' + IntToStrZero(50 + Cont,2) ) ;

        Descricao := Trim(copy(RetCmd,6,16)) ;
        if Descricao <> '' then
        begin
           CNF := TACBrECFComprovanteNaoFiscal.create ;

           CNF.Indice    := IntToStrZero(Cont,2) ;
           CNF.Descricao := Descricao ;

           fpComprovantesNaoFiscais.Add( CNF ) ;
        end ;
      end ;
  except
     fpComprovantesNaoFiscais.Free ;
     fpComprovantesNaoFiscais := nil ;

     raise ;
  end ;
end;

procedure TACBrECFICash.ProgramaComprovanteNaoFiscal(var Descricao: String;
  Tipo: String; Posicao : String );
begin
   // ICash só permite programação em Estado de Intervenção técnica.
end;


procedure TACBrECFICash.AbreRelatorioGerencial;
begin
   EnviaComando( '5601', 40 ) ;
end;

procedure TACBrECFICash.LinhaRelatorioGerencial(Linha: String);
begin
  ImprimirLinhaALinha(Linha, '570' );
end;

procedure TACBrECFICash.AbreCupomVinculado(COO, CodFormaPagto,
  CodComprovanteNaoFiscal: String; Valor: Double);
begin
   EnviaComando( '20' ,8 ) ;
end;

procedure TACBrECFICash.LinhaCupomVinculado(Linha: String);
begin
   LinhaRelatorioGerencial( Linha ) ;
end;

procedure TACBrECFICash.FechaRelatorio;
begin
   EnviaComando( '58' ) ;
end;

procedure TACBrECFICash.LeituraMemoriaFiscal(ReducaoInicial,
   ReducaoFinal: Integer);
Var Espera : Integer ;
begin
  Espera := 60 + (ReducaoFinal - ReducaoInicial) ;
  EnviaComando( '54'+IntToStrZero(ReducaoInicial,4)+
                     IntToStrZero(ReducaoFinal  ,4)+'0', Espera ) ;
end;

procedure TACBrECFICash.LeituraMemoriaFiscal(DataInicial, DataFinal: TDateTime);
Var Espera : Integer ;
begin
  Espera := 60 + DaysBetween(DataInicial,DataFinal) ;
  EnviaComando( '55'+FormatDateTime('ddmmyyyy',DataInicial)+
                     FormatDateTime('ddmmyyyy',DataFinal)+'0', Espera ) ;
end;

procedure TACBrECFICash.LeituraMemoriaFiscalSerial(ReducaoInicial,
   ReducaoFinal: Integer; var Linhas : TStringList);
begin
end;

procedure TACBrECFICash.LeituraMemoriaFiscalSerial(DataInicial,
  DataFinal: TDateTime; var Linhas : TStringList);
begin
end;

function TACBrECFICash.GetChequePronto: Boolean;
begin
  Result := True ;
end;

procedure TACBrECFICash.CancelaImpressaoCheque;
begin
end;

procedure TACBrECFICash.ImprimeCheque(Banco: String; Valor: Double;
  Favorecido, Cidade: String; Data: TDateTime; Observacao: String);
begin
end;

end.


