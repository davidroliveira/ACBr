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
|*             O B S E R V A C O E S   S O B R E   A   M E C A F
|* - A Mecaf produz ECF's OEM para varios outros fabricantes, como por exemplo:
|*   Elgin, Digiarte, Zanthus, Acr, Aoki, Chronos, Promcomp, TrendsSTS, Unigraph.
|*   ( Geralmente existe o Logotipo da MECAF no corpo do equipamento )
|*   Entretanto não há garantia de plena compatibilidade entre os diferentes
|*   equipamentos, se eles usarem protocolos diferentes. (Favor reportar BUGS)
|* - O Procotolo utilizado para esse Modulo é o padrão de fábrica da MECAF
|*   STX/ETX. Se o protocolo estiver diferente não funcionará, é possivel mudar
|*   o protocolo usando o "MODO MENU" da impressora.
******************************************************************************}
{******************************************************************************
|* Historico
|*
|* 13/09/2004:  Daniel Simoes de Almeida
|*   Primeira Versao: Criaçao e Distribuiçao da Primeira Versao
|* 23/05/2005:  Daniel Simoes de Almeida
|*   Corrigido BUG em FechaCupom. Linhas de Observação eram impressas com
|*   alinhamento errado.
|*   Corrigido BUG em Estado. No incio do dia Estado sempre constava como
|*   estBloqueda
|*   -  Bugs reportados por Licerio Jose Rodrigues Neto
|* 16/06/2005:  Daniel Simoes de Almeida e Licerio Jose Rodrigues Neto
|*   - Adaptado para suporte da Versao FCP201 da MECAF (antiga)
|* 23/05/2005:  Daniel Simoes de Almeida
|*   - Corrigido BUG em VendeItem... para a MECAF imprimir Item em 2 linhas (e
|*     e nao 3 linhas) ela deve restringir a descriçao em 20 caracteres
|*     - Bug Reportado por Rildecy de Queiroz Borba
|* 01/11/2005: Gabriel Fernandes - Duel Informática
|*   - Compatibilizado com a vesão 301
|*   - Corrigido BUG. Quando a redução z ficava pendente de um dia para o outro
|*     o ECF ficava em estDesconhecido.
|* 08/12/2005:  Daniel Simoes de Almeida
|*  - Diminuido tempo de alguns Sleeps de 100 para 10 a fim de agilizar a
|*    comunicaçao com o ECF (experimental)
|* 27/04/2006:  Daniel Simoes de Almeida e Valmor Florez
|*   - Melhorado o suporte a Versao FCP201/301 da MECAF (antiga)
******************************************************************************}
{$I ACBr.inc}

unit ACBrECFMecaf ;

interface
uses ACBrECFClass, ACBrUtil, 
     Classes,
     {$IFDEF VisualCLX} QDialogs, QControls, QForms {$ENDIF}
     {$IFDEF VCL} Dialogs, Controls, Forms {$ENDIF} ;

const  STX = #02  ;
       ETX = #03  ;
       ESC = #27  ;
       CR  = #13  ;
       LF  = #10  ;

type
{ Classe filha de TACBrECFClass com implementaçao para Mecaf }
TACBrECFMecaf = class( TACBrECFClass )
 private
    fsNumVersao : String ;
    fsNumSerie  : String ;
    fsNumCRO    : String ;
    fsNumECF    : String ;
    fsArredonda : Char ;
    fsVinculado : Boolean ;

    { Substitui caracteres nulos do retorno por espaços. #0 -> ' ' }
    function LimpaStr( AString : String ) : String ;
    { Retorna Verdadeiro se o ECF é antigo Versão: 201 ou 301 }
    function IsOldMecaf : Boolean ;

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

    Procedure ImprimeCheque(Banco : String; Valor : Double ; Favorecido,
       Cidade : String; Data : TDateTime ;Observacao : String = '') ; override ;
    Procedure CancelaImpressaoCheque ; override ;
    
    Procedure MudaHorarioVerao  ; overload ; override ;
    Procedure MudaHorarioVerao( EHorarioVerao : Boolean ) ; overload ; override ;
    Procedure MudaArredondamento( Arredondar : Boolean ) ; override ;
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
       PermiteVinculado : Boolean = true; Posicao : String = '') ; override ;

    procedure CarregaComprovantesNaoFiscais ; override ;
    Procedure ProgramaComprovanteNaoFiscal( var Descricao: String;
       Tipo : String = ''; Posicao : String = '') ; override ;
 end ;

implementation
Uses ACBrBase,
     SysUtils, Math,
    {$IFDEF Delphi6_UP} DateUtils, StrUtils {$ELSE} ACBrD5, Windows{$ENDIF} ;

{ ----------------------------- TACBrECFMecaf ------------------------------ }

constructor TACBrECFMecaf.create( AOwner : TComponent ) ;
begin
  inherited create( AOwner ) ;

  fpDevice.HandShake := hsRTS_CTS ;
  { Variaveis internas dessa classe }
  fsVinculado := false ;
  fsNumVersao := '' ;
  fsNumSerie  := '' ;
  fsNumECF    := '' ;
  fsNumCRO    := '' ;
  fsArredonda := ' ';

  fpModeloStr := 'Mecaf' ;

  // O ecf em teste recebia apenas 40 colunas. Mecaf FPE 301
  fpColunas := 40;
end;

destructor TACBrECFMecaf.Destroy;
begin

  inherited Destroy ;
end;

procedure TACBrECFMecaf.Ativar;
begin
  if not fpDevice.IsSerialPort  then
     raise Exception.Create('A impressora: '+ModeloStr+' requer'+#10+
                            'Porta Serial:  (COM1, COM2, COM3, ...)');

  fpDevice.HandShake := hsRTS_CTS ;
  inherited Ativar ; { Abre porta serial }

  fsNumVersao := '' ;
  fsNumSerie  := '' ;
  fsNumECF    := '' ;
  fsNumCRO    := '' ;
  fsArredonda := ' ';

  try
     { Testando a comunicaçao com a porta }
     if NumVersao = '' then
        raise EACBrECFNaoInicializado.Create(
                 'Erro inicializando a impressora '+ModeloStr );

     if IsOldMecaf then
        fpColunas := 48   // Mecaf antiga aceita 48 colunas
  except
     Desativar ;
     raise ;
  end ;
end;


Function TACBrECFMecaf.EnviaComando( cmd : String ) : String ;
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

     { Codificando CMD de acordo com o protocolo da Mecaf }
     cmd := STX + ESC + '$' + cmd + ETX ;

     while not EmLinha( 3 ) do  { Impressora está em-linha ? }
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
              'Camandos não estão sendo enviados para Impressora '+ModeloStr+#10+
              'Deseja tentar novamente ?',
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
     { Retirando STX e ETX }
     Result := copy(fpRespostaComando, 2, Length(fpRespostaComando)-2 ) ;

     { Verificando por erros }
     ErroMsg := '' ;
     Erro    := StrToIntDef( copy(Result,6,2), 0 ) ;
     if LeftStr(Result,1) = '-' then
        case Erro of
           1 : ErroMsg := 'Cabeçalho contém caracteres inválidos' ;
           2 : ErroMsg := 'Comando inexistente' ;
           3 : ErroMsg := 'Valor não numérico em campo numérico' ;
           4 : ErroMsg := 'Caracteres inválidos no Comando' ;
           5 : ErroMsg := 'Campo deve iniciar com `@´, `&´ ou `%´' ;
           6 : ErroMsg := 'Campo deve iniciar com `$´, `#´ ou `?´' ;
           7 : ErroMsg := 'O intervalo é inconsistente' ;
           9 : ErroMsg := 'A palavra TOTAL não é aceita' ;
          10 : ErroMsg := 'A sintaxe do comando está errada' ;
          11 : ErroMsg := 'Excedeu o nº máximo de linhas permitidas pelo comando' ;
          12 : ErroMsg := 'O terminador enviado não está obedecendo o protocolo de comunicação' ;
          13 : ErroMsg := 'O checksum enviado está incorreto' ;
          14 : ErroMsg := 'A situação tributária deve iniciar com `T´, `F´,`I´ ou ´N´' ;
          16 : ErroMsg := 'Data Inválida' ;
          17 : ErroMsg := 'Hora Inválida' ;
          18 : ErroMsg := 'Aliquota não programada ou fora do Intervalo' ;
          20 : ErroMsg := 'Comando só aceito em Intervenção Fiscal' ;
          21 : ErroMsg := 'Comando só aceito em Modo Normal' ;
          22 : ErroMsg := 'Necessário abrir cupom' ;
          23 : ErroMsg := 'Comando não aceito durante Cupom Fiscal' ;
          26 : ErroMsg := 'O relógio já está em horário de verão' ;
          27 : ErroMsg := 'O relógio não está em horário de verão' ;
          28 : ErroMsg := 'Necessário realizar Redução Z' ;
          29 : ErroMsg := 'Fechamento diário (Redução Z) já realizada' ;
          31 : ErroMsg := 'Item inexistente ou já cancelado' ;
          32 : ErroMsg := 'Cupom anterior não pode ser cancelado' ;
          33 : ErroMsg := 'Detectado falta de papel' ;
          37 : ErroMsg := 'Necessário realizar intervenção fiscal' ;
          38 : ErroMsg := 'Memória fiscal não permite mais realizar vendas. '+
                          'Só é possível efetuar Leitura X ou da Mem.Fiscal.' ;
          39 : ErroMsg := 'OCORREU ALGUM PROBLEMA NA MEMORIA FISCAL. '+
                          'Será necessário realizar uma Intervenção Técnica '+
                          'Só é possível efetuar Leitura X ou da Mem.Fiscal.' ;
          40 : ErroMsg := 'Necessário programar a Data do Relógio' ;
          41 : ErroMsg := 'Número máximo de itens por cupom ultrapassado' ;
          44 : ErroMsg := 'Impressora em Estado de impressão de cheque' ;
          46 : ErroMsg := 'Necessário inserir o cheque' ;
          47 : ErroMsg := 'Necessário inserir nova bobina' ;
          48 : ErroMsg := 'Necessário executar uma Leitura X' ;
          49 : ErroMsg := 'Detectado algum problema na Impressora. '+
                          'Papel encravado, sobretensão, etc...' ;
          50 : ErroMsg := 'Cupom já foi totalizado' ;
          53 : ErroMsg := 'Ocorreu erro de gravação na memória fiscal' ;
          58 : ErroMsg := 'Falta completar valor do pagamento' ;
          61 : ErroMsg := 'Troco não realizado' ;
          63 : ErroMsg := 'Impressora não está respondendo' ;
        else
           ErroMsg := 'Erro retornado pelo ECF: '+IntToStr(Erro) ;
        end
     else
        { Verifica se possui erro "Pouco Papel" }
        if (LeftStr(Result,1) = '+') and (Erro = 1) then
           DoOnMsgPoucoPapel ;

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

function TACBrECFMecaf.VerificaFimLeitura(Retorno:String) : Boolean;
begin
//  result := (LeftStr(  Retorno,1 ) = STX) and
//            (RightStr( Retorno,1 ) = ETX) ;
  { Modificado pois leitura da Memoria Fiscal pela serial nao inicia com STX }
  result := (RightStr( Retorno,1 ) = ETX) ;
end;

function TACBrECFMecaf.GetDataHora: TDateTime;
Var RetCmd : String ;
    OldShortDateFormat : String ;
begin
  RetCmd := EnviaComando( '33' ) ;
  OldShortDateFormat := ShortDateFormat ;
  try
     ShortDateFormat := 'dd/mm/yy' ;
     result := StrToDate( StringReplace(Copy(RetCmd,6,8),'/',DateSeparator,
                          [rfReplaceAll] ) ) ;
  finally
     ShortDateFormat := OldShortDateFormat ;
  end ;
  result := RecodeHour(  result,StrToInt(copy(RetCmd,15,2))) ;
  result := RecodeMinute(result,StrToInt(copy(RetCmd,18,2))) ;
  result := RecodeSecond(result,StrToInt(copy(RetCmd,21,2))) ;
end;

function TACBrECFMecaf.GetNumCupom: String;
Var RetCmd : String ;
begin
  RetCmd := EnviaComando( '34M41' ) ;

  if LeftStr(RetCmd, 1) <> '+' then
     Result := '      '
  else
     Result := IntToStrZero( StrToIntDef( copy(RetCmd,6,6), 0), 6) ;
end;

function TACBrECFMecaf.GetNumCRO: String;
Var RetCmd : String ;
begin
  if Trim(fsNumCRO) = '' then
  begin
     RetCmd := EnviaComando( '34M43' ) ;
     if LeftStr(RetCmd,1) = '+' then
        fsNumCRO := IntToStrZero( StrToIntDef(copy(RetCmd,6,4),0),4) ;
  end ;

  Result := fsNumCRO ;
end;

function TACBrECFMecaf.GetNumECF: String;
Var RetCmd : String ;
begin
  if Trim(fsNumECF) = '' then
  begin
     RetCmd := EnviaComando( '34M48' ) ;
     if LeftStr(RetCmd,1) = '+' then
        fsNumECF := IntToStrZero( StrToIntDef(copy(RetCmd,6,6),0),4) ;
  end ;

  Result := fsNumECF ;
end;

function TACBrECFMecaf.GetNumSerie: String;
Var RetCmd : String ;
begin
  if Trim(fsNumSerie) = '' then
  begin
     RetCmd := EnviaComando( '34M49' ) ;
     if LeftStr(RetCmd,1) = '+' then
        fsNumSerie := Copy(RetCmd,6,10) ;
  end ;

  Result := fsNumSerie ;
end;

function TACBrECFMecaf.GetNumVersao: String ;
Var RetCmd : String ;
begin
  if fsNumVersao = '' then
  begin
     RetCmd := EnviaComando( '34M47' ) ;
     if LeftStr(RetCmd,1) = '+' then
        fsNumVersao := Copy(RetCmd,6,7) ;
  end ;

  Result := fsNumVersao ;
end;

function TACBrECFMecaf.GetTotalPago: Double;
Var RetCmd : String ;
    Valor : Double ;
begin

  RetCmd := EnviaComando( '34M97' ) ;
  Result := 0 ;

  if LeftStr(RetCmd,1) = '+' then
  begin
     Valor := RoundTo( StrToIntDef(copy(RetCmd,6,15),0) / 100, -2 ) ;

     if RightStr(RetCmd,1) = '-' then
        Result := Subtotal - Valor 
     else
        Result := Subtotal + Valor ;

     Result := RoundTo(Result,-2) ;
  end ;
end;

function TACBrECFMecaf.GetSubTotal: Double;
Var RetCmd : String ;
begin
  RetCmd := EnviaComando( '34M96' ) ;
  Result :=  0 ;
  if LeftStr(RetCmd, 1) = '+' then
     Result := RoundTo( StrToInt( copy(RetCmd,6,15) ) / 100, -2) ;
end;


function TACBrECFMecaf.GetEstado: TACBrECFEstado;
Var RetCmd : String ;
    Stat1,Stat4,Stat5 : Byte ;
    DataRedZ : String ;
begin
  if (not fpAtivo) then
     fpEstado := estNaoInicializada
  else
   begin
     RetCmd := EnviaComando( '32' ) ;

     Stat1  := StrToInt( '$'+copy(RetCmd, 6,2) ) ;
     Stat4  := StrToInt( '$'+copy(RetCmd,12,2) ) ;
     Stat5  := StrToInt( '$'+copy(RetCmd,14,2) ) ;
     DataRedZ := '' ;

     // este if foi alterado pois estava jogando para um estado
     // desconhecido qdo a reducao ficava pendente e no dia seguinte era efetuada.
     if TestBit( Stat1 ,2) then 
     begin
        RetCmd := EnviaComando( '34M83' ) ;
        { Usei o StringReplace pois não tenho certeza se a resposta vem com ou
          sem as / (estou sem o ECF para testes). Segundo o manual não deveriam
          vir as /  }
        DataRedZ := StringReplace(copy(RetCmd,6,8),'/','',[rfReplaceAll]) ;
     end;

     if TestBit( Stat1 ,5) then
        fpEstado := estRequerZ
     else if TestBit( Stat4 ,7) then
        fpEstado := estRequerX
     else if  TestBit( Stat1 ,2) and (DataRedZ = FormatDateTime('ddmmyy',now)) then
        fpEstado := estBloqueada
     else if TestBit( Stat1,0) and
            (TestBit( Stat5,1) or TestBit( Stat5,4) or TestBit( Stat5,5)) then
        fpEstado := estPagamento
     else if TestBit( Stat1, 0) then
        fpEstado := estVenda
     else
      begin
        RetCmd := EnviaComando( '34M84' ) ;
        Stat1  := StrToIntDef( '$'+copy(RetCmd, 6,2) ,0 ) ;

        if TestBit( Stat1, 0) or TestBit( Stat1, 1) or TestBit( Stat1, 2) then
           fpEstado := estRelatorio
        else
           fpEstado := estLivre ;
      end ;
   end ;

  Result := fpEstado ;
end;

function TACBrECFMecaf.GetGavetaAberta: Boolean;
Var RetCmd : String ;
    Stat3 : Byte ;
begin
  RetCmd := EnviaComando( '32' ) ;
  Stat3  := StrToInt( '$'+copy(RetCmd,10,2) ) ;
  Result := TestBit( Stat3, 1) ;
end;

function TACBrECFMecaf.GetPoucoPapel: Boolean;
Var RetCmd : String ;
    Stat3  : Byte ;
begin
  RetCmd := EnviaComando( '32' ) ;
  Stat3  := StrToInt( '$'+copy(RetCmd,10,2) ) ;
  Result := TestBit( Stat3, 6) ;
end;

function TACBrECFMecaf.GetHorarioVerao: Boolean;
Var RetCmd : String ;
    Stat1  : Byte ;
begin
  RetCmd := EnviaComando( '32' ) ;
  Stat1  := StrToInt( '$'+copy(RetCmd,6,2) ) ;
  Result := TestBit( Stat1, 6) ;
end;

function TACBrECFMecaf.GetArredonda: Boolean;
Var RetCmd : String ;
    Stat1  : Byte ;
begin
  if fsArredonda = ' ' then
  begin
     RetCmd := EnviaComando( '34M84' ) ;
     Stat1  := StrToIntDef( '$'+copy(RetCmd, 6,2) ,0 ) ;

     if TestBit( Stat1, 6) then
        fsArredonda := 'S'
     else
        fsArredonda := 'N' ;
  end ;

  Result := (fsArredonda = 'S') ;
end;

Procedure TACBrECFMecaf.LeituraX ;
begin
  EnviaComando('150' , 40 ) ;
end;

Procedure TACBrECFMecaf.ReducaoZ(DataHora: TDateTime) ;
begin
  EnviaComando( '160', 40 ) ;  { Mecaf NAO usa DataHora }
end;

Procedure TACBrECFMecaf.AbreGaveta ;
begin
  EnviaComando( '240' + #20 + #80 ) ;
  sleep(100) ;
end;

Procedure TACBrECFMecaf.MudaHorarioVerao ;
Var Resp : TModalResult ;
begin
  Resp := MessageDlg('Horário de Verão ?',mtConfirmation,mbYesNoCancel,0) ;
  if Resp = mrCancel then exit ;

  MudaHorarioVerao( Resp = mrYes ) ;
end;

procedure TACBrECFMecaf.MudaHorarioVerao(EHorarioVerao: Boolean);
begin
  EnviaComando( '27' + IfThen(EHorarioVerao,'+','-'), 3 ) ;
end;

procedure TACBrECFMecaf.MudaArredondamento(Arredondar: Boolean);
begin
  EnviaComando( '50' + IfThen(Arredondar,'1','0') ) ;
end;

procedure TACBrECFMecaf.AbreCupom(CPF_CNPJ: String);
begin
  fpUltimaMsgPoucoPapel := 0 ;  { Zera tempo pra msg de pouco papel }

  if IsOldMecaf then
     CPF_CNPJ := '' ;

  CPF_CNPJ := trim(CPF_CNPJ) ;
  if CPF_CNPJ <> '' then
     CPF_CNPJ := padL(CPF_CNPJ,28) ;
  EnviaComando('10'+CPF_CNPJ, 8) ;
end;

procedure TACBrECFMecaf.CancelaCupom;
begin
  EnviaComando( '14' ,18) ;
  FechaRelatorio ;   { Fecha relatorio se ficou algum aberto (só por garantia)}
end;

procedure TACBrECFMecaf.CancelaItemVendido(NumItem: Integer);
begin
  EnviaComando( '12' + IntToStrZero(NumItem,3) ,1) ;
end;

procedure TACBrECFMecaf.EfetuaPagamento(CodFormaPagto: String;
  Valor: Double; Observacao: String; ImprimeVinculado: Boolean);
Var Linhas, CodTroco : String ;
    FPG : TACBrECFFormaPagamento ;
begin
  inherited EfetuaPagamento(CodFormaPagto, Valor, Observacao, ImprimeVinculado);

  if ImprimeVinculado then
     if fsVinculado then
        raise Exception.Create('Já existe Forma de Pagamento com '+#10+
                               'comprovante NAO fiscal vinculado pendente. '+#10+
                               'Impressora: '+ModeloStr+' aceita apenas um '+#10+
                               'Comprovante não Fiscal Viculado por Cupom.')
     else
        fsVinculado := true ;
        
  Linhas := '' ;

  if IsOldMecaf then     { Modelo antigo não aceita Observações }
     Observacao := '' ;

  if Length(Observacao) > 41 then
   begin
     Linhas     := '4' ;
     Observacao := padL(Observacao,80) ;
   end
  else if Length(Observacao) > 1 then
   begin
     Linhas     := '2' ;
     Observacao := padL(Observacao,40) ;
   end ;

  EnviaComando( '07' + CodFormaPagto + IntToStrZero( Round(Valor*100) ,15) +
                Linhas + Observacao ,2) ;

  { Mecaf nao lança troco sozinha. Verificando se precisa lançar Troco }
  if TotalPago > SubTotal then
  begin
     CodTroco := '00' ;
     FPG      := AchaFPGDescricao('Dinheiro') ;

     if FPG = nil then
{        MessageDlg('Forma de pagamento DINHEIRO não encontrada. '+#10+
                    'Usando Forma de Pagamento "00" para lançar o Troco.',
                    mtWarning,[mbOk],0)}
     else
        CodTroco := FPG.Indice ;

     EnviaComando( '07' + CodTroco + StringOfChar('0' ,15) ,2) ;
  end ;
end;

procedure TACBrECFMecaf.FechaCupom(Observacao: String);
Var Linhas : Integer ;
    Obs    : String ;
begin
  { Ajustando a Observaçao em N Linhas do mesmo tamanho de COLUNAS}
  Obs    := AjustaLinhas( Observacao, 8, True) ;
  Linhas := CountStr( Obs, #10) ;

  { Fecha cupom }
  EnviaComando( '08S' + IntToStrZero(Length(Obs),3) + Obs, 7 + Linhas) ;

  fsVinculado := false
end;

procedure TACBrECFMecaf.SubtotalizaCupom(DescontoAcrescimo: Double;
       MensagemRodape : String);
Var A_D : String ;
begin
  if DescontoAcrescimo > 0 then
     A_D := '@'
  else
     A_D := '' ;

  DescontoAcrescimo := abs(DescontoAcrescimo) ;

  { Inicia fechamento com formas de Pagamento }
  EnviaComando( '06' + A_D + '&' +
                IntToStrZero( Round(DescontoAcrescimo*100), 15) ,2) ;
  fsVinculado := false ;
end;

procedure TACBrECFMecaf.VendeItem(Codigo, Descricao: String;
  AliquotaICMS : String; Qtd: Double; ValorUnitario: Double;
  DescontoPorc: Double; Unidade: String);
Var AliquotaStr, QtdStr, ValorStr, DescontoStr, Fmt: String ;
    ValAliquota : Double ;
    Aliquota : TACBrECFAliquota ;
    FlagDesc : Integer ;
    Tipo : Char ;
begin
  if Qtd > 9999 then
     raise EACBrECFCMDInvalido.Create(
           'Quantidade deve ser inferior a 9999.');

  case AliquotaICMS[1] of
    'I' : AliquotaStr := 'I00' ;
    'N' : AliquotaStr := 'N00' ;
    'F' : AliquotaStr := 'F00' ;
    'T' : AliquotaStr := 'T'+padR(copy(AliquotaICMS,2,2),2,'0') ; {Indice}
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

  Codigo      := padL(Codigo,13) ;    { Ajustando Tamanhos }
  Unidade     := padL(Unidade,2) ;

  if IsOldMecaf then
   begin
     QtdStr   := IntToStrZero( Round( Qtd*1000 ) ,6) ;
     Fmt      := '-' ;
     ValorStr := IntToStrZero( Round( ValorUnitario*100 ) ,11) ;
   end
  else
   begin
     QtdStr := IntToStrZero( Round( Qtd*1000 ) ,7) ;

     if RoundTo(ValorUnitario,-2) <> ValorUnitario then {Tem mais de 2 casas dec ?}
      begin
        Fmt := 'H' ;
        ValorStr := IntToStrZero( Round( ValorUnitario*1000 ) ,11) ;
      end
     else
      begin
        Fmt   := 'G' ;
        ValorStr := IntToStrZero( Round( ValorUnitario*100 ) ,11) ;
      end;
   end ;

  DescontoStr := '%' + IntToStrZero( Round(DescontoPorc * 100), 4) ;
  Descricao := LeftStr( TrimRight(Descricao), 190) { maximo 5 linhas de 38 } ;
  if (Length(Descricao) <= 20) or (not DescricaoGrande) then
   begin
     FlagDesc  := 0 ;
     Descricao := padL(Descricao,20) ;
   end

  else if (Length(Descricao) <= 38) then
   begin
     FlagDesc  := 1 ;
     Descricao := padL(Descricao,38) ;
   end
  else
   begin
     FlagDesc  := Trunc( Length(Descricao) / 38 ) +
                  {$IFDEF FPC}ACBrUtil.{$ENDIF}ifThen( Length(Descricao) mod 38 > 0,1,0) ;
     Descricao := PadL(Descricao, (38 * FlagDesc) ) ;
   end ;

  EnviaComando( '11' + Fmt + QtdStr + ValorStr + AliquotaStr +
                DescontoStr + Unidade + Codigo + IntToStr( FlagDesc ) +
                Descricao ,2) ;
end;

procedure TACBrECFMecaf.CarregaAliquotas;
Var RetCmd : String ;
    Aliquota : TACBrECFAliquota ;
    ValAliq : Double ;
    A : Integer ;
    ByteISS1,ByteISS2 : Byte ;
begin
  inherited CarregaAliquotas ;   { Cria fpAliquotas }

  RetCmd   := EnviaComando( '34M86' ) ;
  ByteISS2 := StrToIntDef( '$'+copy(RetCmd, 8,2) ,0 ) ;
  ByteISS1 := StrToIntDef( '$'+copy(RetCmd,10,2) ,0 ) ;

  RetCmd := EnviaComando( '30' ) ;

  For A := 0 to 15 do
  begin
     ValAliq := RoundTo( StrToIntDef( copy(RetCmd, 6+(A*4), 4),0 ) / 100, -2) ;

     if ValAliq > 0 then
     begin
        Aliquota := TACBrECFAliquota.create ;

        Aliquota.Indice   := 'T'+IntToStrZero(A,2) ;
        Aliquota.Aliquota := ValAliq ;

        if A < 8 then
         begin
           if TestBit( ByteISS1, A ) then
              Aliquota.Tipo := 'S' ;
         end
        else
           if TestBit( ByteISS2, A-8) then
              Aliquota.Tipo := 'S' ;

        fpAliquotas.Add( Aliquota ) ;
     end ;
  end ;
end;

procedure TACBrECFMecaf.ProgramaAliquota(Aliquota: Double; Tipo: Char;
   Posicao : String);
Var ProxIndice : Integer ;
    sTipo, ValStr : String ;
    Aliq : TACBrECFAliquota ;
begin
  ValStr := IntToStrZero( Round(Aliquota * 100) ,4) ;
  Tipo := UpCase(Tipo) ;
  if Tipo = 'S' then
     sTipo := '001'
  else
     sTipo := '000' ;

  CarregaAliquotas ;

  ProxIndice := StrToIntDef(Posicao,0) ;
  if (ProxIndice < 1) or (ProxIndice > 15) then { Indice passado é válido ? }
  begin
     For ProxIndice := 1 to 16 do  { Procurando Lacuna }
     begin
        if AchaICMSIndice('T'+IntToStrZero(ProxIndice,2)) = nil then
           break ;
     end ;
  end ;

  if ProxIndice > 15 then
     raise Exception.create('Não há espaço para programar novas Aliquotas');

  EnviaComando( '46' + IntToStrZero(ProxIndice,2) + ValStr + sTipo ) ;

  { Adcionanodo nova Aliquota no ObjectList }
  Aliq := TACBrECFAliquota.create ;
  Aliq.Indice   := 'T'+IntToStrZero(ProxIndice,2) ;
  Aliq.Aliquota := Aliquota ;
  if Tipo = '1' then
     Aliq.Tipo := 'S' ;
  fpAliquotas.Add( Aliq ) ;
end;


procedure TACBrECFMecaf.CarregaFormasPagamento;  { funçao Lenta +- 3 sec. }
Var RetCmd, Descricao : String ;
    Cont : Integer ;
    FPagto : TACBrECFFormaPagamento ;
begin
  inherited CarregaFormasPagamento ;       {Inicializa fpFormasPagamentos}

  for Cont := 0 to 15 do
  begin
     RetCmd    := EnviaComando( '34M' + IntToStrZero(50 + Cont,2) ) ;

     Descricao := Trim(copy(RetCmd,6,16)) ;
     if Descricao <> '' then
     begin
        FPagto := TACBrECFFormaPagamento.create ;

        FPagto.Indice    := IntToStrZero(Cont,2) ;
        FPagto.Descricao := Descricao ;

        fpFormasPagamentos.Add( FPagto ) ;
     end ;
   end ;
end;

procedure TACBrECFMecaf.ProgramaFormaPagamento(var Descricao: String;
  PermiteVinculado: Boolean; Posicao : String );
Var ProxIndice : Integer ;
    FPagto : TACBrECFFormaPagamento ;
begin
  { Obs: Mecaf nao usa PermiteVinculado }
  Descricao := padL(Descricao,16) ;

  CarregaFormasPagamento ;
  
  ProxIndice := StrToIntDef(Posicao,0) ;
  if (ProxIndice < 1) or (ProxIndice > 15) then { Indice passado é válido ? }
  begin
     For ProxIndice := 0 to 16 do  { Procurando Lacuna }
     begin
        if AchaFPGIndice(IntToStrZero(ProxIndice,2)) = nil then
           break ;
     end ;
  end ;

  if ProxIndice > 15 then
     raise Exception.create('Não há espaço para programar novas Formas de '+
                            'Pagamento');

  EnviaComando( '29' + IntToStrZero(ProxIndice,2) + Descricao ) ;

  { Adcionanodo nova FPG no ObjectList }
  FPagto := TACBrECFFormaPagamento.create ;
  FPagto.Indice    := IntToStrZero(ProxIndice,2) ;
  FPagto.Descricao := Descricao ;
  fpFormasPagamentos.Add( FPagto ) ;
end;

procedure TACBrECFMecaf.CarregaComprovantesNaoFiscais;
Var RetCmd, Descricao : String ;
    Cont : Integer ;
    CNF : TACBrECFComprovanteNaoFiscal ;
begin
  inherited CarregaComprovantesNaoFiscais ;{Inicializa fpComprovantesNaoFiscais}

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
end;

procedure TACBrECFMecaf.ProgramaComprovanteNaoFiscal(var Descricao: String;
  Tipo: String; Posicao : String );
Var ProxIndice : Integer ;
    CNF : TACBrECFComprovanteNaoFiscal ;
begin
  { Obs: Mecaf nao usa Tipo }
  Descricao := padL(Descricao,16) ;

  CarregaComprovantesNaoFiscais ;

  ProxIndice := StrToIntDef(Posicao,0) ;
  if (ProxIndice < 16) or (ProxIndice > 31) then { Indice passado é válido ? }
  begin
     For ProxIndice := 16 to 32 do  { Procurando Lacuna }
     begin
        if AchaCNFIndice(IntToStrZero(ProxIndice,2)) = nil then
           break ;
     end ;
  end ;

  if ProxIndice > 31 then
     raise Exception.create('Não há espaço para programar novos Comprovantes'+
                            ' não Fiscais');

  EnviaComando( '29' + IntToStrZero(ProxIndice,2) + Descricao ) ;

  { Adcionanodo novo CNF no ObjectList }
  CNF := TACBrECFComprovanteNaoFiscal.create ;
  CNF.Indice    := IntToStrZero(ProxIndice,2) ;
  CNF.Descricao := Descricao ;
  fpComprovantesNaoFiscais.Add( CNF ) ;
end;


procedure TACBrECFMecaf.AbreRelatorioGerencial;
begin
  EnviaComando( '151' ,40 ) ;
end;

procedure TACBrECFMecaf.LinhaRelatorioGerencial(Linha: String);
begin
  ImprimirLinhaALinha( Linha, '260' );
end;

procedure TACBrECFMecaf.AbreCupomVinculado(COO, CodFormaPagto,
  CodComprovanteNaoFiscal: String; Valor: Double);
begin
  { Mecaf nao faz Vinculo a uma Forma de Pagamento específica do Cupom Anterior
    também não é necessário informar nenhum CNF, ou Valor do Cupom Anterior.
    A unica exigencia que a impressora faz é que o Documento Anterior seja
    Cupom Fiscal ou Comprovante nao vinculado
    Fica fácil criar o Vinculado, mas não há a possibilidade de criar Varios
    Cupons Vinculados a mais de uma forma de pagamento do Cupom Anterior. Ou
    Seja o vinculo é feito ao CUPOM Anterior e não a alguma das Formas de
    Pagamento. }

  EnviaComando( '20' ,8 ) ;
end;

procedure TACBrECFMecaf.LinhaCupomVinculado(Linha: String);
begin
  LinhaRelatorioGerencial( Linha ) ; 
end;

procedure TACBrECFMecaf.FechaRelatorio;
Var RetCmd : String ;
    Stat   : Byte ;
begin
  RetCmd := EnviaComando( '34M84' ) ;
  Stat   := StrToInt( '$'+copy(RetCmd, 6,2) ) ;

  if TestBit( Stat, 0) or TestBit( Stat, 1) or TestBit( Stat, 2) then
     EnviaComando( '21' ,12 ) ;
end;

procedure TACBrECFMecaf.PreparaTEF;
begin
  inherited PreparaTEF ;

  CarregaFormasPagamento ;
end;

procedure TACBrECFMecaf.LeituraMemoriaFiscal(ReducaoInicial,
   ReducaoFinal: Integer);
Var Espera : Integer ;
begin
  Espera := 60 + (ReducaoFinal - ReducaoInicial) ;
  EnviaComando( '18'+IntToStrZero(ReducaoInicial,4)+
                     IntToStrZero(ReducaoFinal  ,4), Espera ) ;
end;

procedure TACBrECFMecaf.LeituraMemoriaFiscal(DataInicial, DataFinal: TDateTime);
Var Espera : Integer ;
begin
  Espera := 60 + DaysBetween(DataInicial,DataFinal) ;
  EnviaComando( '17'+FormatDateTime('ddmmyy',DataInicial)+
                     FormatDateTime('ddmmyy',DataFinal),   Espera ) ;
end;

procedure TACBrECFMecaf.LeituraMemoriaFiscalSerial(ReducaoInicial,
   ReducaoFinal: Integer; var Linhas : TStringList);
Var Espera : Integer ;
    RetCmd : String ;
begin
  Espera := Trunc(60 + (ReducaoFinal - ReducaoInicial) ) ;
  Linhas.Clear ;
  RetCmd := EnviaComando( '37'+IntToStrZero(ReducaoInicial,4)+
                              IntToStrZero(ReducaoFinal  ,4), Espera ) ;
  RetCmd := LimpaStr( RetCmd ) ;  { Troca #0 dentro da String por espaços }
  Linhas.Clear ;
  Linhas.Text := RetCmd ;
end;

procedure TACBrECFMecaf.LeituraMemoriaFiscalSerial(DataInicial,
  DataFinal: TDateTime; var Linhas : TStringList);
Var Espera : Integer ;
    RetCmd : String ;
begin
  Espera := Trunc(60 + DaysBetween(DataInicial,DataFinal) ) ;
  RetCmd := EnviaComando( '36'+FormatDateTime('ddmmyy',DataInicial)+
                               FormatDateTime('ddmmyy',DataFinal), Espera );
  RetCmd := LimpaStr( RetCmd ) ;  { Troca #0 dentro da String por espaços }
  Linhas.Clear ;
  Linhas.Text := RetCmd ;
end;

function TACBrECFMecaf.GetChequePronto: Boolean;
Var RetCmd : String ;
    Stat4 : Byte ;
begin
  RetCmd := EnviaComando( '32' ) ;
  Stat4  := StrToInt( '$'+copy(RetCmd,12,2) ) ;
  Result := TestBit( Stat4, 2) ;
end;

procedure TACBrECFMecaf.CancelaImpressaoCheque;
begin
  EnviaComando( '04' ) ;
end;

procedure TACBrECFMecaf.ImprimeCheque(Banco: String; Valor: Double;
  Favorecido, Cidade: String; Data: TDateTime; Observacao: String);
Var Dia,Mes,Ano, Lin : String ;
begin
  Favorecido := padL(Favorecido,80) ;
  Cidade     := padL(Cidade,20) ;
  Observacao := LeftStr(Observacao,160) ;
  Dia        := IntToStrZero(  DayOf(Data),2) ;
  Mes        := IntToStrZero(MonthOf(Data),2) ;
  Ano        := RightStr(IntToStrZero( YearOf(Data),4),2) ;

  Lin := #36 + #75 + #72 + #10 + #36 + #10 + #36 + #36 + #40 + #36 + #36 + #75 ;

  EnviaComando( '011' ) ;
  EnviaComando( '02' + Lin + IntToStrZero(Round(Valor*100),15) +
                Favorecido + Cidade + '1' + Dia + Mes + Ano + Observacao ,10) ;
end;

function TACBrECFMecaf.LimpaStr(AString: String): String;
Var A,Len : Integer ;
begin
  Result := '' ;
  Len    := Length( AString ) ;

  For A := 1 to Len do
  begin
     if AString[A] = #0 then
        Result := Result + ' '
     else
        Result := Result + AString[A] ;
  end ;
end;

function TACBrECFMecaf.IsOldMecaf: Boolean;
begin
  Result := (pos('201', fsNumVersao) > 0) or (pos('301', fsNumVersao) > 0) ;
end;

end.


