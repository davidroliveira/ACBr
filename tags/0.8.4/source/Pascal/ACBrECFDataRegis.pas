{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para interação com equipa- }
{ mentos de Automação Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2005 Airton Stodulski                       }
{                                                                              }
{ Colaboradores nesse arquivo:          Anderson Rogerio Bejatto               }
{                                       Daniel Simoes de Almeida               }
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
|* 20/06/2005:  Airton Stodulski
|*   Inicio do desenvolvimento  baseada na yanco
|* 23-6     function AchaIndiceTipo( chrTipo:char ) : TACBrECFAliquota;
|* 21-7     relatorios gerencias/enviacomandoespera
|* 23/10/2005:  Anderson Rogerio Bejatto
|*   Ajuste de todos os métodos para compatibilizar com a 02.05
|* 27/10/2005:  Daniel Simões de Almeida
|*   Revisão de diversos métodos
|* 22/11/2005:  Daniel Simões de Almeida
|*   Adcionada a Impressão do Numero do Item antes do Cod.Produto no formato
|*   001.. (DataRegis não imprime n.Item, o que dificulta no cancelamento)
|* 08/12/2005:  Daniel Simoes de Almeida
|*  - VerificaFimImpressao poderia disparar excessão com ECF off-line
|* 08/12/2005:  Anderson Rogerio Bejatto
|*  - Removido tempo de alguns Sleeps a fim de agilizar a comunicaçao com o ECF
|*   (experimental)
|*  - Método Cancela cupom detecta o estado do ECF para permitir cancelamento
|*    com o Cupom aberto...
|*  - Modificado mecanismo de Gravação e Leitura de memoria auxiliar (INI) para
|*    ficar mais rápida a rotina de venda
|* 10/03/2006:  Airton Stodulski
|*  - Corrigido Bug na leitura de modelos de Cheques
|*  - Nao reconhecia corretamente todas as versoes de .03 e .05
|* 13/03/2006:  Daniel Simões de Almeida
|*  - Inserido suporte a Venda de Item com 3 casas decimais
|*  - Metodo VendeItem usará o Arredondamento de Item sempre que necessário
|*  - Corrigido bug em pulos de Linha em ListaRelatorioGerencial e
|*    ListaCupomVinculado
|*  - SubTotal, não considerava Desconto Acrescimo pendente informado em
|*    SubtotalizaCupom
|* 11/05/2006:  Anderson Rogerio Bejatto
|*  - Acerto das cordenadas para Impressao de Cheques
******************************************************************************}

{$I ACBr.inc}

unit ACBrECFDataRegis ;

interface
uses ACBrECFClass, ACBrUtil, 
     Classes, Contnrs,
     {$IFDEF VisualCLX} QDialogs, QControls, QForms {$ENDIF}
     {$IFDEF VCL} Dialogs, Controls, Forms {$ENDIF} ;

      //CONFORME MANUAL PARA VERSOES X.03
const STX = #02 ;
      ETX = #03 ;
	   _START = #254 ;
	   _ACKN	 = #004 ;
	   _NAKN	 = #006 ;
	   _ACKC	 = #008 ;
	   _EOM	 = #026 ;
	   _END	 = #013 ;

 //********************************************************
 //        Lista de mensagem de aviso
 //********************************************************
   MEMORIAFISCALTROCADA                  = 'A';
   SEMNUMEROFABRICACAO                   = 'a';
   BUFFERIMPRESSAOCHEIA                  = 'B';
   ITEMCANCELAMENTONAOENCONTRADO         = 'b';
   COMANDONAOEXECUTADO                   = 'C';
   CANCELAMENTOACIMALIMITE               = 'c';
   DESCONTOACIMATOTAL                    = 'D';
   DATAINVALIDA                          = 'd';
   EPROMFISCALDESCONECTADA               = 'E';
   VERSAOINCORRETA                       = 'e';
   ERROFISCAL                            = 'F';
   SEMCLICHE                             = 'f';
   SEMCNPJIECCM                          = 'G';
   NUMEROCOMPROVANTESINVALIDO            = 'g';
   NUMERORELATORIOGERENCIALINVALIDO      = 'H';
   ESGOTADONUMEROVIASVINCULADO           = 'h';
   COMANDOINVALIDO                       = 'I';
   DADOSCOMANDOINVALIDO                  = 'i';
   VENDASUJEITAICMSSEMIE                 = 'J';
   IMPRESSORAOK                          = 'K';
   MFSEMLOGOTIPO                         = 'M';
   ERROGRAVACAOMF                        = 'm';
   ESTADOINVALIDO                        = 'N';
   NUMEROFINALIZADORAINVALIDO            = 'n';
   FIMPAPEL                              = 'P';
   FALHAIMPRESSORA                       = 'p';
   REDUCAOZOBRIGATORIA                   = 'R';
   VENDASUJEITAISSQNSEMIM                = 'S';
   DESCONTOSUBTOTALICMSISSQNNAOPERMITIDO = 's';
   INDICETRIBUTOINVALIDO                 = 'T';
   ENCONTRADOPALAVRATOTAL                = 't';
   UNIDADEMEDIDAINVALIDA                 = 'U';
   VALORITEMACIMAPERMITIDO               = 'V';
   CANCELAMENTOCUPOMTOTALIZADOEMZERO     = 'v';
   FALTASENHA                            = 'W';
   LEITURAXOBRIGATORIAABERTURACAIXA      = 'X';
   DATAREDUCAOZRETROATIVA                = 'Y';
   AJUSTERETROATIVORELOGIO               = 'y';
   REDUCAOZREALIZADA                     = 'Z';
   ESGOTAMENTOMEMORIAFISCAL              = 'z';

Type
{ Classe filha de TACBrECFClass com implementaçao para DataRegis }
TACBrECFDataRegis = class( TACBrECFClass )
 private
    fsNumVersao : String ;
    fsNumSerie  : String ;
    fsNumECF    : String ;

    fsMensagem  : String ;

    fsSEQ       : Integer ;
    fsACK       : Byte ;

    fsModelosCheque : TStringList ;

    fsDescontoAcrescimo :double;
    fsTotalPago         : Double ;
    fsItensCupom        : TStringList ;
    fsNumCupom          : String ;

    fsArqPrgBcoTXT: String;
    fsNomeArqINI: String;
    fsArqINI : String ;
    fsTotalAcumulado: Double;

    Function PreparaCmd( cmd : String ) : String ;
    Function ExtraiRetorno( Retorno : String ) : String ;

    procedure CarregaPrgBcoTXT ;
    function GetModelosCheque: TStringList;
    procedure SetArqPrgBcoTXT(const Value: String);
    procedure SetNomeArqINI(const Value: String);
    procedure LeArqINI ;
    procedure GravaArqINI ;

    Function IsV03 : Boolean ;
    Function IsV05 : Boolean ;
 protected
    function GetDataHora: TDateTime; override ;
    function GetNumCupom: String; override ;
    function GetNumECF: String; override ;
    function GetNumSerie: String; override ;
    function GetNumVersao: String; override ;
    function GetNumCRO: String; override;
    function GetSubTotal: Double; override ;
    function GetTotalPago: Double; override ;
    function GetHorarioVerao: Boolean; override ;
    function GetArredonda: Boolean; override ;
    function GetEstado: TACBrECFEstado; override ;
    function GetGavetaAberta: Boolean; override ;
    function GetPoucoPapel : Boolean; override ;
    function GetChequePronto: Boolean; override ;

    Function VerificaFimLeitura(Retorno:String) : Boolean ; override ;
    function VerificaFimImpressao : Boolean ; override ;

    procedure EnviaMensagem(Mensagem:String);

 public
    Constructor create( AOwner : TComponent  )  ;
    Destructor Destroy  ; override ;

    procedure Ativar ; override ;

    Property ACK : Byte read fsACK ;

    { Manupilaçao do Arquivo com a configuração de cheques }
    property ArqPrgBcoTXT : String read fsArqPrgBcoTXT write SetArqPrgBcoTXT ;
    property ModelosCheque : TStringList read GetModelosCheque
       write fsModelosCheque ;
    Function AchaModeloBanco( Banco : String ) : String ;
    property NomeArqINI : String read fsNomeArqINI write SetNomeArqINI ;

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

    function AchaIndiceTipo( chrTipo:char ) : TACBrECFAliquota;
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

    procedure CarregaUnidadesMedida; override ;
    procedure ProgramaUnidadeMedida(var Descricao: String); override ;

    Procedure LeituraMemoriaFiscal( DataInicial, DataFinal : TDateTime ) ;
       override ;
   Procedure LeituraMemoriaFiscal( ReducaoInicial, ReducaoFinal : Integer);
       override ;
    Procedure LeituraMemoriaFiscalSerial( DataInicial, DataFinal : TDateTime;
       var Linhas : TStringList ) ; override ;
    Procedure LeituraMemoriaFiscalSerial( ReducaoInicial, ReducaoFinal : Integer;
       var Linhas : TStringList ) ; override ;

    function GetOperador: Integer;
    procedure SetOperador(Codigo: Integer);

 end ;

implementation
Uses ACBrBase,
    {$IFDEF Delphi6_UP} DateUtils, StrUtils {$ELSE} ACBrD5, Windows{$ENDIF},
     SysUtils, Math, IniFiles ;

{ ----------------------------- TDJECFDataRegis ------------------------------ }

constructor TACBrECFDataRegis.create( AOwner : TComponent ) ;
begin
  inherited create( AOwner ) ;
  fpDevice.HandShake := hsDTR_DSR ;

  { Variaveis internas dessa classe }
  fsNumVersao := '' ;
  fsNumSerie  := '' ;
  fsNumECF    := '' ;
  fsArqINI    := '' ;

  {Coloquei espaco para fsMensagem para que caso a primeira mensagem seja um
   espaco em branco ocorra a programacao da impressora (Anderson) }
  fsMensagem  := ' ';

  fsTotalPago         := 0 ;
  fsDescontoAcrescimo := 0 ;
  fsNumCupom          := '' ;
  fsItensCupom        := TStringList.Create ;
  fsArqPrgBcoTXT      := '' ;   { Vazio usa valores default }
  fsModelosCheque     := TStringList.create;

  fpColunas   := 40 ;
  fpModeloStr := 'DataRegis' ;
  fsSEQ       := 0 ;
  fsACK       := 0 ;
end;

destructor TACBrECFDataRegis.Destroy;
begin
  fsModelosCheque.Free ;
  fsItensCupom.Free ;

  inherited Destroy ;
end;

procedure TACBrECFDataRegis.Ativar;
begin
  if not fpDevice.IsSerialPort  then
     raise Exception.Create('Esse modelo de impressora requer'+#10+
                            'Porta Serial:  (COM1, COM2, COM3, ...)');

  fpDevice.HandShake := hsDTR_DSR ;
  inherited Ativar ; { Abre porta serial }

  fsNumVersao := '' ;
  fsNumSerie  := '' ;
  fsNumECF    := '' ;
  fsACK       := 0 ;

  try
     { Testando a comunicaçao com a porta }
     if NumVersao = '' then
        raise EACBrECFNaoInicializado.Create(
               'Erro inicializando a impressora '+ModeloStr );

     if NomeArqINI <> '' then
        fsArqINI := NomeArqINI
     else
        fsArqINI := ExtractFilePath(Application.ExeName)+'ACBrECFDataRegis'+
                    Poem_Zeros( NumECF, 3 )+'.INI';

     LeArqINI ;

  except
     Desativar ;
     raise ;
  end ;
end;


Function TACBrECFDataRegis.EnviaComando( cmd : String ) : String ;
Var ErroMsg : String ;
    charAviso:char;
    PediuStatus : Boolean ;
begin
  Result  := '' ;
  ErroMsg := '' ;
  fsACK   := 0 ;
  fpComandoEnviado   := '' ;
  fpRespostaComando  := '' ;
  AguardandoResposta := true ;

  PediuStatus := (cmd = 'R');
  try
     if (not fpDevice.Ativo) then
        raise EACBrECFNaoInicializado.create(
                 'Componente ACBrECF não está Ativo');

     { Codificando CMD de acordo com o protocolo da DataRegis }
     cmd := PreparaCmd( cmd ) ;

     while  not EmLinha( TimeOut ) do  { Impressora está em-linha ? }
     begin
        If not PediuStatus then //quando pede status nao pergunta por retentar, aborta logo
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
              sLineBreak+'Deseja tentar novamente ?',
              mtConfirmation,[mbYes,mbNo],0) <> mrYes) then
              raise EACBrECFSemResposta.create(
                    'Erro ao enviar comandos para a Impressora '+ModeloStr)
           else
              continue ;
        end ;
     end ;

     if not fpDevice.Serial.CTS then
        fpDevice.Serial.RTS := false ;

     { Chama Rotina da Classe mãe TACBrClass para ler Resposta. Se houver
       falha na leitura LeResposta dispara Exceçao }
     LeResposta ;
     charAviso := IMPRESSORAOK ;  

     { Nesse ponto a variavel "fpRespostaComando" contém todos os bytes
       respondidos pelo ECF... é necessário separar os Retornos dos Flags do
       protocolo e checksum... Se houve erro (_NAKN) o Status já foi pedido e
       tambem está em "fpRespostaComando" }
     if Length(fpRespostaComando) > 1 then
     begin
        fsACK := Ord( fpRespostaComando[1] ) ;

        case chr(fsACK) of
           { Tudo OK, Comando entendido... porém ECF não efetuará nenhum
             retorno... portanto ''...}
           _ACKN : Result := '' ;

           { Tudo OK, Comando entendido... Resposta está apos o _ACKC  }
           _ACKC :
            begin
              Result := ExtraiRetorno( fpRespostaComando ) ;

              { verifica se e a mesmo SEQ }
              if copy(fpRespostaComando,5,1) <> copy(cmd,3,1) then
                 charAviso := chr(1);
            end ;

           { Comando não foi entendido... Status já foi pedido pela função
              "VerificaFimLeitura" e está adcionado na Resposta.. Vamos pegar o
              Byte de Erro e ver o que houve }
           _NAKN :
            begin
              Result    := ExtraiRetorno( fpRespostaComando ) ;
              try
                 charAviso := Result[6] ;
              except
                 charAViso := chr(2) ;
              end ;
            end ;
        end ;
     end ;

     case charAviso of
       IMPRESSORAOK                          : ErroMsg := '' ; { Tudo OK }
       #1                                    : ErroMsg := 'Resposta do ECF inválida' ;
       #2                                    : ErroMsg := 'Não foi possivel detectar o Erro' ;
       MEMORIAFISCALTROCADA                  : ErroMsg := 'Memoria Fiscal Trocada';
       SEMNUMEROFABRICACAO                   : ErroMsg := 'Sem Número de Fabricação';
       BUFFERIMPRESSAOCHEIA                  : ErroMsg := 'Buffer de impressão Cheia';
       ITEMCANCELAMENTONAOENCONTRADO         : ErroMsg := 'Item de Cancelamento não encontrado';
       COMANDONAOEXECUTADO                   : ErroMsg := 'Comando Não Executado';
       CANCELAMENTOACIMALIMITE               : ErroMsg := 'Cancelamento Acima do Limite';
       DESCONTOACIMATOTAL                    : ErroMsg := 'Desconto Acima do Permitido';
       DATAINVALIDA                          : ErroMsg := 'Data Inválida';
       EPROMFISCALDESCONECTADA               : ErroMsg := 'EPROM Fiscal Desconectada';
       VERSAOINCORRETA                       : ErroMsg := 'Versão Incorreta do Software Básico';
       ERROFISCAL                            : ErroMsg := 'ERRO FISCAL';
       SEMCLICHE                             : ErroMsg := 'Sem Cliche';
       SEMCNPJIECCM                          : ErroMsg := 'Sem CNPJ;IE/CCM';
       NUMEROCOMPROVANTESINVALIDO            : ErroMsg := 'Quantidade ou Número de Comprovante Inválido';
       NUMERORELATORIOGERENCIALINVALIDO      : ErroMsg := 'Quantidade ou´Número de Relatórios Gerenciais Inválido';
       ESGOTADONUMEROVIASVINCULADO           : ErroMsg := 'Esgotado Número de Vias para o Vinculado';
       COMANDOINVALIDO                       : ErroMsg := 'COMANDO INVÁLIDO';
       DADOSCOMANDOINVALIDO                  : ErroMsg := 'DADOS DO COMANDO INVÁLIDO';
       VENDASUJEITAICMSSEMIE                 : ErroMsg := 'Venda Sujeita ao ICMS sem Inscrição Estadual programada';
       MFSEMLOGOTIPO                         : ErroMsg := 'Memória Fiscal sem Logotipo';
       ESTADOINVALIDO                        : ErroMsg := 'ESTADO INVÁLIDO';
       NUMEROFINALIZADORAINVALIDO            : ErroMsg := 'Número de Finalizadora Inválido';
       FIMPAPEL                              : ErroMsg := 'FIM DE PAPEL';
       FALHAIMPRESSORA                       : ErroMsg := 'Falha na Impressora';
       REDUCAOZOBRIGATORIA                   : ErroMsg := 'Redução Z Obrigatória';
       VENDASUJEITAISSQNSEMIM                : ErroMsg := 'Venda Sujeita ao ISSQN sem Inscrição Municipal Programada';
       DESCONTOSUBTOTALICMSISSQNNAOPERMITIDO : ErroMsg := 'Desconto em Subtotal com Venda Sujeita ao ICMS/ISSQN não Permitido';
       INDICETRIBUTOINVALIDO                 : ErroMsg := 'Indice do Tributo Inválido';
       ENCONTRADOPALAVRATOTAL                : ErroMsg := 'Palavra TOTAL e/ou suas variantes encontrada';
       UNIDADEMEDIDAINVALIDA                 : ErroMsg := 'Unidade de Medida Inválida';
       VALORITEMACIMAPERMITIDO               : ErroMsg := 'Valor Total do Item Acima do Permitido';
       CANCELAMENTOCUPOMTOTALIZADOEMZERO     : ErroMsg := 'Cancelamento do Cupom Totalizado em Zero';
       FALTASENHA                            : ErroMsg := 'Falta Senha para Permitir Gravação da Senha do Primeiro Usuário';
       LEITURAXOBRIGATORIAABERTURACAIXA      : ErroMsg := 'Leitura X Obrigatória para abertura do Caixa';
       DATAREDUCAOZRETROATIVA                : ErroMsg := 'Tentativa de Redução Z com Data/Hora anterior a última redução Gravada';
       AJUSTERETROATIVORELOGIO               : ErroMsg := 'Tentativa de Ajusta Relógio com Data/Hora anterior a última redução Gravada';
       REDUCAOZREALIZADA                     : ErroMsg := 'Redução Z Realizada';
       ESGOTAMENTOMEMORIAFISCAL              : ErroMsg := 'Esgotamento da Capacidade de Gravação de dados na MF';
     else
        ErroMsg := 'Erro Código ('+ charAviso +')' ;
     end;

     if ErroMsg <> '' then
      begin
        ErroMsg := 'Erro retornado pela Impressora: '+ModeloStr+#10+#10+
                   ErroMsg ;
        raise EACBrECFSemResposta.create(ErroMsg) ;
      end ;
{    else
        Sleep(10) ;  { Pequena pausa entre comandos }
  finally
     AguardandoResposta := false ;
  end ;

end;

Function TACBrECFDataRegis.PreparaCmd( cmd : String ) : String ;
Var A, iSoma   : Integer ;
    CKS1       : String ;
begin

  Result := '' ;
  if cmd = '' then exit ;

  fsSEQ := fsSEQ + 1 ;
  if fsSEQ > 250 then fsSEQ := 1 ;

  //  START (1 byte)	 +	BLOCO	(1 byte) +	COMANDO  (1 byte) +	TAMANHO (1 byte) + [DADOS] (variavel) + CHKSUM (1 byte)
  cmd   := _START + Chr(fsSEQ)+ Copy(cmd,1,1) + Chr(Length(cmd)-1) + Copy(cmd,2,length(cmd)-1) ;

  { Calculando a Soma dos caracteres ASC }
  iSoma := 0 ;
  For A := 3 to Length(cmd) do
     iSoma := iSoma + ord( cmd[A] ) ;

  CKS1 := chr( iSoma mod 256 ) ;

  result := cmd + CKS1;
end ;

function TACBrECFDataRegis.ExtraiRetorno(Retorno: String): String;
Var Inicio, Fim, Ajuste : Integer ;
begin
  Result := '' ;

  { START (1 byte) +	BLOCO	(1 byte) + COMANDO (1 byte) +	TAMANHO (1 byte) +
    [DADOS] (variavel) + CHKSUM (1 byte) [+ EOM (1 byte)] + END (1 byte) }

  while Retorno <> '' do
  begin
     Inicio  := Pos( _START, Retorno) ;  { Acha o START }
     if Inicio = 0 then
        exit ;                           { Nao tem START, então sai }

     Inicio := Inicio + 4 ;     { Pula START+BLOCO+COMANDO+TAMANHO }

     Retorno := copy(Retorno, Inicio, Length(Retorno)) ;  { Restante }

     Fim := Pos( _END, Retorno)  ;           { Acha o fim da Mensagem }
     if Fim = 0 then
        Fim :=  Length(Retorno) ;

     if copy(Retorno, Fim - 1, 1) = _EOM then
        Ajuste := 3
     else
        Ajuste := 2 ;

     Result := Result + copy(Retorno, 1, Fim - Ajuste ) ;

     Retorno := copy(Retorno, Fim + 1, Length(Retorno)) ;  { Restante }
  end ;
end;

function TACBrECFDataRegis.VerificaFimLeitura(Retorno:String) : Boolean;
Var ACK : Char ;
    cmd : String ;
    Bytes : Integer ;
begin
  Bytes  := Length(Retorno) ;
  Result := (Bytes > 1) and (RightStr( Retorno, 1) = _END);

  if Result then
  begin
     if Bytes = 2 then   { Recebeu apenas o ACK }
      begin
        ACK := Retorno[1] ;

        case ACK of
           { Tudo OK, Comando entendido... porém ECF não efetuará nenhum
             retorno... portanto FIM...}
           _ACKN : Result := True ;

           { Tudo OK, Comando entendido... ECF enviará agora os dados...
             Portanto, não pode terminar ainda... }
           _ACKC : Result := False ;

           { Comando não foi entendido... Vamos pedir Status e ver o que houve }
           _NAKN :
           begin
              cmd := PreparaCmd('R') ;
              if fpComandoEnviado <> cmd then  { Se estava pedindo Status nao deve pedir novamente }
              begin
                 Result := False ;
                 cmd    := PreparaCmd('R') ;
                 fpDevice.Serial.Purge ;              { Limpa a porta }
                 fpDevice.Serial.SendString( cmd );   { Eviando o comando }
              end ;
           end ;
        end ;
      end
     else
      begin
        fpDevice.Serial.SendString(_ACKN); { confirmando Leitura do bloco }
        Result := (RightStr( Retorno, 2) = _EOM+_END) { Mensagem terminou ? }
      end ;
  end ;
end;

function TACBrECFDataRegis.VerificaFimImpressao: Boolean;
Var Cmd , RetCmd, Retorno : String ;
    I : Integer ;
    Estado : Char ;
begin
  { Essa função só é chamada se AguardaImpressao = True,
    Como essa função é executada dentro da "LeResposta", que por sua vez foi
    chamada por "EnviaComando", não podemos usar o método "EnviaComando" (ou
    teriamos uma chamada recursiva infinita), por isso o Loop abaixo envia o
    comando 'R' diretamente para a Serial, e aguarda por 1 segundo a resposta...
     Se a DataRegis consegir responder, significa que a Impressão Terminou }

  Result := False ;
  if not EmLinha() then
  begin
    sleep(100) ;
    exit ;
  end ;

  RetCmd := '' ;
  I      := 0 ;
  Cmd    := PreparaCmd( 'R' ) ;
  try
     fpDevice.Serial.Purge ;  { Limpa buffer de Entrada e Saida }
     fpDevice.Serial.SendString( Cmd );   { Pede Status }
     //Sleep(10) ;
  except
  end ;

  while (not VerificaFimLeitura( RetCmd ) ) and (I < 100) do
  begin
     try
        RetCmd := RetCmd + fpDevice.Serial.RecvPacket(10) ;
     except
     end ;
     Inc( I ) ;
  end ;

  if VerificaFimLeitura(RetCmd) then
  begin
     Retorno := ExtraiRetorno( RetCmd ) ;
     Try
        Estado := RetCmd[1] ;
     except
        Estado := 'X' ;
     end ;

     Result := (Estado <> 'X') ;
  end ;
end;

function TACBrECFDataRegis.GetNumVersao: String ;
var wRetentar : Boolean ;
begin
  if fsNumVersao = '' then
  begin                                                         
     wRetentar := Retentar ;
     try
        Retentar := false ;
        try
           fsNumVersao := copy(EnviaComando( 'PS' ), 1, 5) ;  {Comando da 02.03}
           if fsNumVersao = '' then
              raise Exception.Create('Erro') ;
        except
           try
              fsNumVersao := copy(EnviaComando( 'l' ),39, 5) ;{Comando da 02.05}
           except
              fsNumVersao := '' ;
           end ;
        end
     finally
        Retentar := wRetentar ;
     end ;
  end ;

  Result := fsNumVersao ;
end;

function TACBrECFDataRegis.GetDataHora: TDateTime;
Var RetCmd : String ;
    OldShortDateFormat : String ;
begin
  {Compativel com 02.03 e 02.05}
  RetCmd := EnviaComando( 'd' );

  OldShortDateFormat := ShortDateFormat ;
  try
     ShortDateFormat := 'dd/mm/yy' ;
     result := StrToDate( StringReplace(Copy(RetCmd,1,8),'/',DateSeparator,
                          [rfReplaceAll] ) ) ;
  finally
     ShortDateFormat := OldShortDateFormat ;
  end ;
  result := RecodeHour(  result,StrToIntDef(copy(RetCmd,10,2),0)) ;
  result := RecodeMinute(result,StrToIntDef(copy(RetCmd,13,2),0)) ;
end;

function TACBrECFDataRegis.GetNumCupom: String;
begin
   {Compativel com 02.03 e 02.05}
   if IsV03 then
      result := Copy(EnviaComando( 'd' ),16,6)
   else
      Result := Copy(EnviaComando( 'd' ),15,6);
end;

function TACBrECFDataRegis.GetNumECF: String;
begin
   {Compativel com 02.03 e 02.05}
   if fsNumECF = '' then
   begin
      if IsV03 then
         fsNumECF := Copy(EnviaComando( 'PS' ),7,3)
      else
         fsNumECF := Copy(EnviaComando( 'l' ),15,3);
   end;

   Result := fsNumECF
end;

function TACBrECFDataRegis.GetNumSerie: String;
begin
  {Compativel com 02.03 e 02.05}
  if fsNumSerie = '' then
  begin
     if IsV03 then
        fsNumSerie := Trim( copy(EnviaComando( 'PS' ), 14, 6))
     else
        fsNumSerie := Trim( copy(EnviaComando( 'l' ), 32, 7));
  end;

  result := fsNumSerie ;
end;

function TACBrECFDataRegis.GetNumCRO: String;
var
   retCmd: String;
begin
   //ORIGINAL result := copy(EnviaComando( 'IS'+FormatDateTime('ddmmaa',date-1)+FormatDateTime('ddmmaa',date) ), 49, 4) ;
   //TESTE
   //SHOWMESSAGE(copy(EnviaComando( 'IS'+FormatDateTime('ddmmaa',date-1)+FormatDateTime('ddmmaa',date) ), 49, 4) );
   Result := '';

   {Compativel com 02.05}
   if IsV05 then
   begin
      retCmd := EnviaComando( 'o');
      Result := Copy( retCmd, 1, 3 );
   end ;
end;

function TACBrECFDataRegis.GetTotalPago: Double;
begin
  Result := fsTotalPago ;
end;

function TACBrECFDataRegis.GetSubTotal: Double;
var RetCmd : String;
    Valor  : Double ;
begin
   {Compativel com 02.03 e 02.05}
   Result := 0;
   RetCmd := EnviaComando( 'C' );
   Try
      Valor := StrToInt(Copy(RetCmd,2,14)) / 100 ;

      Valor := Valor + fsDescontoAcrescimo ;  { Considera Desc/Acres pendente }

      If RetCmd[1] = 'S' then
         Result := Valor + TotalPago
      else If RetCmd[1] = 'T' then
         Result := TotalPago - Valor ;
   except
   end ;
end;

function TACBrECFDataRegis.GetEstado: TACBrECFEstado;
var RetCmd:String;
begin
   {Compativel com 02.03 e 02.05}
   if (not fpAtivo) then
      fpEstado := estNaoInicializada
   else
   begin
      RetCmd := EnviaComando( 'R' ) ;
      if RetCmd <> '' then
      begin
         {
         -F (AGUARDANDO COND. PAGAMENTO)
         -L LIVRE
         -O OBRIGATORIO Z
         -R LEITURA X - DURANTE EMISSAO DE RELATORIO
         -V ESTA EM ITENS DA VENDA
         -A OBRIGA X
         -X IMPRESSORA OCUPADA}
         if RetCmd[1] = 'X' then
            fpEstado := estBloqueada
         else if RetCmd[1] = 'O' then
            fpEstado := estRequerZ
         else if RetCmd[1] = 'A' then
            fpEstado := estRequerX
         else if RetCmd[1] = 'F' then
            fpEstado := estPagamento
         else if RetCmd[1] = 'V' then
            fpEstado := estVenda
         else if RetCmd[1] = 'R' then
            fpEstado := estRelatorio
         else if RetCmd[1] = 'L' then
            fpEstado := estLivre
         else
            fpEstado := estDesconhecido ;
      end ;
   end ;
   Result := fpEstado ;
end;

function TACBrECFDataRegis.GetGavetaAberta: Boolean;
var
   RetCmd:String;
begin
   {Compativel com 02.03 e 02.05}
   RetCmd := EnviaComando('R');

   Result := (RetCmd[4] <> 'N') ;
end;

function TACBrECFDataRegis.GetPoucoPapel: Boolean;
var
   RetCmd : string;
begin
   {Compativel com 02.03 e 02.05}
   {Retorna se a impressora esta sem papel}
   RetCmd := EnviaComando('R');

   Result := (RetCmd[2] = 'N') ;
end;

Procedure TACBrECFDataRegis.LeituraX ;
begin
   {Compativel com 02.03 e 02.05}
   AguardaImpressao := True ;
   if IsV03 then
      EnviaComando( 'GNS',75)
   else
      EnviaComando('G',33);

  fsItensCupom.Clear ;
  fsTotalPago         := 0 ;
  fsDescontoAcrescimo := 0 ;
  fsNumCupom          := '' ;
  fsTotalAcumulado    := 0;
  GravaArqINI ;
end;

Procedure TACBrECFDataRegis.AbreGaveta ;
begin
   {Compativel com 02.03 e 02.05}
   EnviaComando('N') ;
end;

Procedure TACBrECFDataRegis.ReducaoZ(DataHora: TDateTime) ;
begin
   {Compativel com 02.03 e 02.05}
   {Dataregis, Nao usa DataHora}
   AguardaImpressao := True ;
   if IsV03 then
      EnviaComando('HN',145)
   else
      EnviaComando('H',35);

  fsItensCupom.Clear ;
  fsTotalPago         := 0 ;
  fsDescontoAcrescimo := 0 ;
  fsNumCupom          := '' ;
  fsTotalAcumulado    := 0;
  GravaArqINI ;
end;

Procedure TACBrECFDataRegis.MudaHorarioVerao ;
var
   DataHora : TDateTime;
begin
   {Compativel com 02.03 e 02.05}
   {Obs:}
   {Nao pode ser alterado para mais se for 23 horas, nem para menos se for 0 horas.}

   DataHora := GetDataHora;
   if GetHorarioVerao then
    begin
      if (DataHora < StrToTime('23:00')) then
         raise
         Exception.Create('Não é possível retornar do horário de verão.' +
                          #13 + 'Aguarde ate as 00:00 para poder alterar.');
      AguardaImpressao := True;
      EnviaComando( 'T' + 'D', 10 ) ;
    end
   else
    begin
      if ((DataHora > StrToTime('00:00')) and (DataHora < StrToTime('01:00'))) then
         raise
         Exception.Create('Não é possível mudar para o horário de verão.' +
                          #13 + 'Aguarde ate a hora 01:00 para poder alterar');
      AguardaImpressao := True;
      EnviaComando( 'T' + 'A', 10 ) ;
    end;
end;

procedure TACBrECFDataRegis.MudaHorarioVerao(EHorarioVerao: Boolean);
begin
  if EHorarioVerao <> HorarioVerao then
     MudaHorarioVerao ;
end;

procedure TACBrECFDataRegis.AbreCupom(CPF_CNPJ: String);
begin
   {Compativel com 02.03 e 02.05}
   {Nao envia comando porque ao regigistrar item abre cupom}
end;

procedure TACBrECFDataRegis.CancelaCupom;
var
   bCancela: Boolean;
   dValor: Double;
begin
  {Compativel com 02.03 e 02.05}
  bCancela:= True;

  {Obteremos o estado da impressora e dentro dos case as correcoes necessarias}
  GetEstado;
  case fpEstado of
    estVenda :
       begin
          dValor:= GetSubTotal;
          if dValor = 0 then
             bCancela:= False;

          SubtotalizaCupom();
          EfetuaPagamento('00',dValor);
       end;

    estPagamento:
       begin
          EfetuaPagamento('00',GetSubTotal);
       end;
  end;
  
  {Cancelamento propriamente dito}
  AguardaImpressao := True ;
  if bCancela then
     EnviaComando('F',20);
     
  fsItensCupom.Clear ;
  fsTotalPago         := 0 ;
  fsDescontoAcrescimo := 0 ;
  fsNumCupom          := '' ;
  fsTotalAcumulado    := 0;

  GravaArqINI ;
end;

procedure TACBrECFDataRegis.CancelaItemVendido(NumItem: Integer);
begin
{0203
código/descrição [36/76]    Codigo=7891000142202 Descricao=Sha Seda 400ml
indice do tributo [2]       Aliquota=00
quantidade [6]              Quant = 100156 = 100.156
valor unitário [9]          ValorUnit=000000100 = 1.00
desconto ou acréscimo [4]   Desc=0000 o desconto é em percentual
 Codigo + Descricao + Aliquota + Quant + ValorUnit + Desc
}
{0205
código/descrição [36/76]
índice do tributo [2]
quantidade [6]
valor unitário [9]
desconto ou acréscimo [4]
unidade de medida[2]        Unidade=00 indice da unidade
 Codigo + Descricao + Aliquota + Quant + ValorUnit + Desc + Unidade
}
  if (NumItem < 1) or (NumItem > fsItensCupom.Count) then
     raise Exception.create('Item ('+IntToStrZero(NumItem,3)+') não encontrado') ;

{ ATENÇÃO. A DataRegis não extorna corretamente Itens vendidos com 3 casas
  decimais. Esse bug é no Software Básico do ECF }

  EnviaComando( 'b' + fsItensCupom[NumItem-1] ) ;
  fsTotalAcumulado:= GetSubTotal;
end;

procedure TACBrECFDataRegis.EfetuaPagamento(CodFormaPagto: String;
  Valor: Double; Observacao: String; ImprimeVinculado: Boolean);
var curValorDescAcre:currency;
    strTipo:string;
begin
   {Compativel com 02.03 e 02.05}
   inherited EfetuaPagamento(CodFormaPagto, Valor, Observacao, ImprimeVinculado);

   if IsV03 then
      Observacao := Copy(padL(Observacao,18,' '),1,18)
   else
      Observacao := '';

   If fsDescontoAcrescimo <> 0 then
    begin
      If fsDescontoAcrescimo > 0 then
         strTipo:='A'
      Else
         strTipo:='D';

      curValorDescAcre := abs(fsDescontoAcrescimo);
      AguardaImpressao := True ;
      EnviaComando('c' + CodFormaPagto + Observacao +
                   IntToStrZero( Round(Valor*100), 14) +
                   IntToStrZero( Round(curValorDescAcre*100), 14) +
                   strTipo,15 );
      fsTotalAcumulado := 0;
    end
   Else
    begin
      AguardaImpressao := True ;//EnviaComando('D'+CodFormaPagto+stringofChar(#32,18)+
      EnviaComando('D' + CodFormaPagto + Observacao +
                       IntToStrZero(Round(Valor*100),14),15);
      fsTotalAcumulado := 0;
    end;

   fsTotalPago := fsTotalPago + (Valor - fsDescontoAcrescimo) ;
   { So imprime o desconto ou acrescimo na primeira vez, pois foi armazenado por
     SubTotaliza }
   fsDescontoAcrescimo := 0;
   GravaArqINI ;
end;

procedure TACBrECFDataRegis.FechaCupom(Observacao: String);
begin
  {Compativel com 02.03 e 02.05}
  {Dataregis não precisa fechar cupom, ele é fechado sozinho}
  fsItensCupom.Clear ;
  fsTotalPago         := 0 ;
  fsDescontoAcrescimo := 0 ;
  fsNumCupom          := '' ;
  GravaArqINI ;
end;

procedure TACBrECFDataRegis.SubtotalizaCupom(DescontoAcrescimo: Double;
       MensagemRodape : String);
begin
   {Compativel com 02.03 e 02.05}
   {nao tem subtotalizador e desconto ou acrescimento tem que jogar na forma de pagamento}
   if fsTotalPago <> 0 then
      raise Exception.Create('SubTotalizaCupom já efetuado');

   {if MensagemRodape <> '' then
   tem que tirar esse if pois o metodo precisa ser enviado mesmo que tenha espaco
   em branco, com isso ira retirar da impressora o rodape (Anderson) }
   EnviaMensagem( MensagemRodape );

   fsDescontoAcrescimo := DescontoAcrescimo;
   fsTotalPago         := 0 ;
   GravaArqINI ;
end;

function TACBrECFDataRegis.AchaIndiceTipo( chrTipo:char ) : TACBrECFAliquota;
var A : Integer ;
begin
  if not Assigned( fpAliquotas ) then
     CarregaAliquotas ;

  result := nil ;
  with fpAliquotas do
  begin
     For A := 0 to Count -1 do
        if Objects[A].tipo = chrTipo then
         begin
           result := Objects[A] ;
           Break ;
         end ;
  end ;
end;

procedure TACBrECFDataRegis.VendeItem(Codigo, Descricao: String;
  AliquotaICMS : String; Qtd: Double; ValorUnitario: Double;
  DescontoPorc: Double; Unidade: String);
Var AliquotaStr, QtdStr, ValorStr, DescStr, CodDescr, LinhaItem : String ;
    ValAliquota : Double ;
    Aliquota : TACBrECFAliquota ;
    Tipo : Char ;
    UMD : TACBrECFUnidadeMedida;
    Ini : TIniFile;
    FlagArredonda, Cmd : String ;

begin
  if Qtd > 999.999 then
     raise EACBrECFCMDInvalido.Create(
           'Quantidade deve ser inferior a 9999.');

  case AliquotaICMS[1] of
    'I','N','F' :
       begin
          Aliquota := AchaIndiceTipo( AliquotaICMS[1] ) ;
          if Aliquota <> nil then
             AliquotaStr := Aliquota.Indice
          else
             raise EACBrECFCMDInvalido.Create('Aliquota nao encontrada: '+AliquotaICMS);
       end;
    'T','S' : AliquotaStr := padR(copy(AliquotaICMS,2,2),2,'0') ; {Indice}
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

  { Ajustando Tamanhos }
  Unidade  := padL(Unidade,2) ;
  if Length(Trim(Codigo)) < 6 then
     Codigo:= padR(Codigo,6,'0');  { Seis primeiros caracteres devem ser Numeros }
  CodDescr := Codigo + ' ' + IntToStrZero( fsItensCupom.Count+1,3) + ' ' +
              Trim(Descricao) ;

  if DescricaoGrande and (Length(CodDescr) > 36) Then
     CodDescr := padL(CodDescr,76)
  else
     CodDescr := padL(CodDescr,36) ;

  QtdStr  := IntToStrZero( Round( Qtd*1000 ) ,6) ;
  DescStr := IntToStrZero( Round( DescontoPorc*100),4) ;

  { Tem mais de 2 casas decimais no Preço Unitario ?
    Valor Total arredondado é maior que o Valor Truncado ?
     Se sim, imprime com 3 casas que sempre irá acionar o arredondamento }
  if (RoundTo(ValorUnitario,-2) <> ValorUnitario) or
     (RoundTo(Qtd*ValorUnitario,-2) >
      RoundTo(TruncFix(Qtd*ValorUnitario*100)/100,-2) ) then
   begin
     Cmd := 'a' ;
     FlagArredonda := 'A' ;
     ValorStr := IntToStrZero( Round( ValorUnitario*1000 ) ,9) ;
   end
  else
   begin
     Cmd := 'A' ;
     FlagArredonda := '' ;
     ValorStr := IntToStrZero( Round( ValorUnitario*100 ) ,9) ;
   end ;

  LinhaItem := CodDescr + AliquotaStr + QtdStr +
               {IntToStrZero( Round( ValorUnitario*100 ) ,9) +}
               ValorStr +
               DescStr ;
  Cmd := Cmd + CodDescr + AliquotaStr + QtdStr + ValorStr + DescStr +
               FlagArredonda ;

  if IsV05 then
  begin
     UMD := AchaUMDDescricao( Unidade );
     if UMD = nil then
        raise Exception.Create('Unidade de Medida não cadastrada');

     Cmd       := Cmd       + UMD.Indice ;
     LinhaItem := LinhaItem + UMD.Indice ;
  end;

  if fsItensCupom.Count = 0 then  { Primeiro Item, abre o cupom e demora mais }
   begin
      AguardaImpressao := True ;
      EnviaComando( Cmd , 10) ;
   end
  else
      EnviaComando( Cmd ) ;

  { Devido a impressora nao ter comando especifico para sub-totalizar e desconto,
    sendo enviado com o comando que registra a finalizadora, a variavel abaixo
    controla o valor de desconto ou acrescimo conforme funcao subtotaliza e
    finalizadora. E inicializa neste momento com valor zero. }
   fsDescontoAcrescimo := 0;
   fsTotalPago         := 0;

   { Adcionando o Item Vendido em ObjectList para permitir o uso em
     CancelaItemVendido }
   fsItensCupom.Add( LinhaItem ) ;

   if FlagArredonda <> 'A' then
      fsTotalAcumulado := fsTotalAcumulado +
                          (TruncFix(Qtd * ValorUnitario * 100 ) / 100)
   else
      fsTotalAcumulado := fsTotalAcumulado +
                          RoundTo(Qtd * ValorUnitario, -2) ;

   if fsItensCupom.Count = 1 then
      GravaArqINI
   else
    begin
      Ini := TIniFile.Create( fsArqINI ) ;
      try
         Ini.WriteFloat('Variaveis','TotalAcumulado',fsTotalAcumulado);
         Ini.WriteString('Itens',
                         IntToStrZero( fsItensCupom.Count-1 ,3),
                         fsItensCupom[ fsItensCupom.Count-1]);
      finally
         Ini.Free ;
      end;
    end;

end;

procedure TACBrECFDataRegis.CarregaAliquotas;
var Aliquota : TACBrECFAliquota ;
    retCmd,strAliquota: String;
    intTotal:integer;
    intX:integer;
begin
   {Compativel com 02.03 e 02.05}
   inherited CarregaAliquotas ;   { Cria fpAliquotas }

   if IsV03 then
    begin
      retCmd := EnviaComando( 'Q' );

      intTotal:=0;
      try
         intTotal:=StrToInt(copy(retCmd,1,2));
      except
      end;
      for intX:=1 to intTotal do
      begin
          strAliquota := copy(retCmd,((intX-1) * 5) + 3,5) ;
          Aliquota := TACBrECFAliquota.create ;

          Aliquota.Indice   := IntToStrZero(intX -1, 2) ;
          Aliquota.Aliquota := StrToInt(copy(strAliquota,2,4))/100 ;
          Aliquota.Tipo     := strAliquota[1];

          fpAliquotas.Add( Aliquota ) ;
      end;
    end
   else
    begin
      retCmd := EnviaComando( 'p' );
      retCmd := Copy( retCmd, 1, Length( retCmd ) - 14 );
      intX := -1;
      while retCmd <> '' do
      begin
         Inc( intX );
         Aliquota := TACBrECFAliquota.create ;
         Aliquota.Indice   := IntToStrZero(intX, 2) ;
         Aliquota.Aliquota := StrToInt(copy(retCmd,2,4))/100 ;
         Aliquota.Tipo     := retCmd[1];
         fpAliquotas.Add( Aliquota ) ;
         Delete (retCmd, 1, 33);
      end;
    end;
end;

procedure TACBrECFDataRegis.CarregaFormasPagamento;
var FPagto : TACBrECFFormaPagamento ;
    retCmd,strForma: String;
    Cont:integer;
begin
   {Compativel com 02.03 e 02.05}
   inherited CarregaFormasPagamento ;   { Cria fpFormasPagamentos }

   if IsV03 then
    begin
      retCmd := EnviaComando( 'f' );
      retCmd := StringReplace(retCmd, #10, '', [rfReplaceAll]) ;
      For Cont := 1 to 32 do
      begin
         strForma := trim( copy( retCmd, Cont * 30 - 29, 16) ) ;
         if strForma <> '' then
         begin
            FPagto := TACBrECFFormaPagamento.create ;
            FPagto.Indice    := IntToStrZero(Cont - 1,2) ;
            FPagto.Descricao := Copy(strForma,3,14) ;
            {Feito testes e permitiu cupom vinculado para todas as finalizadoras}
            {Não é necessário nem cadastrar algum Vinculado}
            FPagto.PermiteVinculado := True ;
            fpFormasPagamentos.Add( FPagto ) ;
         end;
      end ;
    end
   else
    begin
      retCmd := EnviaComando( 'L' );
      retCmd := StringReplace(retCmd, #10, '', [rfReplaceAll]) ;
      Cont := -1;
      while retCmd <> '' do
      begin
         Inc(Cont);
         FPagto := TACBrECFFormaPagamento.create ;
         FPagto.Indice    := IntToStrZero(Cont, 2) ;
         FPagto.Descricao := Trim( Copy(retCmd , 1, 14) ) ;
         FPagto.PermiteVinculado := (retCmd[15] = 'T') ;
         fpFormasPagamentos.Add( FPagto ) ;
         Delete( retCmd, 1, 29);
      end;
    end;
end;

procedure TACBrECFDataregis.ProgramaFormaPagamento( var Descricao: String;
  PermiteVinculado : Boolean; Posicao : String) ;
Var
   FPagto : TACBrECFFormaPagamento ;
   FlagVinc : Char ;
begin
   {Compativel com 02.03 e 02.05}
   { Impressora Dataregis não usa Posicao }

   { Dataregis cadastra qualquer descrição mesmo repetida, por isso vamos ver se ja existe antes }
   FPagto:= AchaFPGDescricao(Descricao);
   if FPagto <> nil then
      raise Exception.Create('Forma de Pagamento já cadastrada');   
      
   Descricao := padL(Descricao,14) ;         { Ajustando tamanho final }

   if IsV03 then
      { Obs: 02.03 nao usa PermiteVinculado }
      EnviaComando( 't' + '01' + Descricao + '/') 
   else
    begin
      { O ultimo parametro 01 diz o numero de vias a serem impressas}
      FlagVinc := 'N' ;
      If PermiteVinculado then FlagVinc := 'T' ;
      EnviaComando( 't' + '01' + FlagVinc + Descricao + '01');
    end ;

   { Adcionanodo nova FPG no ObjectList }
   FPagto := TACBrECFFormaPagamento.create ;
   FPagto.Indice    := IntToStrZero(FormasPagamento.Count,2) ;
   FPagto.Descricao := Descricao ;
   FPagto.PermiteVinculado := PermiteVinculado ;
   fpFormasPagamentos.Add( FPagto ) ;
end;

procedure TACBrECFDataRegis.CancelaImpressaoCheque;
begin
   { Dataregis não possui comando para cancelar a impressão de cheques}
   raise Exception.Create('Impressora '+ModeloStr+ ' não possui comando para '+
                          'cancelar a impressão de cheques. ' + sLineBreak +
                          'Por favor desligue e ligue a impressora ou insira '+
                          'um documento.');
end;

function TACBrECFDataRegis.GetChequePronto: Boolean;
begin
   { Compativel com 02.03 e 02.05}
   { Dataregis não possui comandos para saber se o cheque esta pronto}
   Result := True ;
end;

procedure TACBrECFDataRegis.AbreRelatorioGerencial;
begin
   {Compativel com 02.03 e 02.05}
   {Impressora 02.05 pede o indice do relatorio gerencial, 00 é o default}
   AguardaImpressao := True ;
   if IsV03 then
      EnviaComando('j' + StringOfChar(#32,Colunas),75) //LINHA EM BRANCO SO PARA ABRIR O RELATORIO
   else
      EnviaComando('j' + '00' + StringOfChar(#32,Colunas),15); //LINHA EM BRANCO SO PARA ABRIR O RELATORIO
end;

procedure TACBrECFDataRegis.LinhaRelatorioGerencial(Linha: String);
begin
  {Compativel com 02.03 e 02.05}
  {Impressora 02.05 pede o indice do relatorio gerencial, 00 é o default}
  if IsV03 then
     ImprimirLinhaALinha( Linha, 'j' )
  else
     ImprimirLinhaALinha( Linha, 'j' + '00' );
end;

procedure TACBrECFDataRegis.AbreCupomVinculado(COO, CodFormaPagto,
  CodComprovanteNaoFiscal: String; Valor: Double);
Var FPG : TACBrECFFormaPagamento ;
begin
   FPG := AchaFPGIndice( CodFormaPagto ) ;

   if FPG = nil then
      raise Exception.create( 'Forma de Pagamento: '+CodFormaPagto+
                              ' não foi cadastrada.' ) ;

   {Compativel com 02.03 e 02.05}
   if IsV03 then
    begin
      AguardaImpressao := True ;
      EnviaComando( 'J'+CodFormaPagto+StringOfChar(#32,38), 15) ;
    end
   else
    begin
      if CodComprovanteNaoFiscal = '' then
         CodComprovanteNaoFiscal := '00';
      AguardaImpressao := True;
      EnviaComando( 'J' + CodComprovanteNaoFiscal + StringOfChar(#32,40), 15);
    end;
end;

procedure TACBrECFDataRegis.LinhaCupomVinculado(Linha: String);
begin
  {Compativel com 02.03 e 02.05}
  {Impressora 02.05 pede o indice do relatorio gerencial, 00 é o default}
  if IsV03 then
     ImprimirLinhaALinha( Linha, 'J' )
  else
     ImprimirLinhaALinha( Linha, 'J' + '00' );
end;

procedure TACBrECFDataRegis.FechaRelatorio;
begin
   if Estado <> estRelatorio then exit ;

   {Compativel com 02.03 e 02.05}
   { Fecha o relatorio Gerencial ou Vinculado }
   { DataRegis não tem um Flag para identificar qual Tipo de Relatorio está
     aberto, portanto tentamos fechar os 2 tipos }

   try
      AguardaImpressao := True ;
      EnviaComando( 'k', 15 ) ;     // Fecha Gerencial
   except
      AguardaImpressao := True;
      EnviaComando( 'K', 15);       // Fecha Vinculado
   end;
end;

function TACBrECFDataRegis.GetHorarioVerao: Boolean;
var
   RetCmd : string;
begin
   {Compativel com 02.03 e 02.05}
   {'V' avançou-se 1 hora / ' ' (espaço) não avançou}
   RetCmd := EnviaComando( 'd' ) ;
   if IsV03 then
      Result := (RetCmd[15] = 'V')
   else
      Result := (RetCmd[9] = 'V');
end;

function TACBrECFDataRegis.GetArredonda: Boolean;
begin
  Result := True ;
end;

procedure TACBrECFDataRegis.ProgramaComprovanteNaoFiscal(
  var Descricao: String; Tipo, Posicao: String);
begin
   {Compativel com 02.03 e 02.05}
   { Obs: Dataregis nao usa Tipo }
   { Dataregis nao usa posicao   }
   { No manual da dataregis diz que é preciso associar a uma finalizadora}
   { iremos associar a finalizadora 00, no entanto foram feitos testes e }
   { o cupom vinculado é impresso até mesmo se não possuirmos cupom      }
   { vinculado, ou seja, não precisa ter na impressora um cupom vinculado}
   { cadastrado para imprimir um cupom vinculado}
   Descricao := padL(Descricao,20) ;

   EnviaComando( 'e' + '01' + Descricao + '01' );
   CarregaComprovantesNaoFiscais;
end;

procedure TACBrECFDataRegis.ProgramaAliquota(Aliquota: Double; Tipo: Char;
  Posicao: String);
Var ValStr : String ;
begin
   {Compativel com 02.03 e 02.05}
   { Podem ser cadastradas, no máximo, 15 situações tributárias. }
   { As situações F, I e N são obrigatórias, }
   { T corresponde a tributadas e S corresponde a ISS.}
   { Descrição do bloco de dados a ser enviado:}
   { quantidade de tributos [2]}
   { símbolo e porcentagem do tributo [5] (ex.: "T1800" = T 18,00%)}

   { Impressora Dataregis não usa o parâmetro Posicao }
   ValStr := IntToStrZero( Round(Aliquota * 100) ,4) ;
   Tipo   := UpCase(Tipo) ;
   EnviaComando( 'Z' + '01' + Tipo + ValStr, 20 ) ;
   CarregaAliquotas ;
end;

procedure TACBrECFDataRegis.EnviaMensagem(Mensagem: String);
var
  StrCmd, Temp : string;
begin
   {Compativel com 02.03 e 02.05}
   {A Dataregis pede 6 linhas com 40 caracteres cada linha}
   {Cada linha deve iniciar com S:imprir; N:Não imprimir;E:Expandido}
   {Mesmo que não sejam usados todas as linhas elas devem ser informadas}
   {com o valor N (nao imprimir)}
   {Na Dataregis, o comando de Mensagem de Rodapé é independente do Recebimento}
   if fsMensagem = Mensagem then Exit;

   StrCmd := '';
   fsMensagem := Mensagem;
   Mensagem := padL( Trim(Mensagem),240,' ' ) ;
   while Mensagem <> '' do
   begin
      Temp := Copy(Mensagem,1,40);
      if Length(trim(temp)) = 0 then
         StrCmd := StrCmd + 'N' + padL(Temp,40)
      else
         StrCmd := StrCmd + 'S' + padL(Temp,40);
      Delete(Mensagem,1,40);
   end;

   if StrCmd <> '' then
      EnviaComando( 'S' + StrCmd );
end;

procedure TACBrECFDataRegis.LeituraMemoriaFiscal(DataInicial,
  DataFinal: TDateTime);
var
   Espera: Integer;
begin
   {Compativel com 02.03 e 02.05}
   {Dataregis versão 02.03 possui um bug, ao solicitar que seja }
   {impresso a memoria fiscal de determinado periodo, a impressora}
   {imprime toda a memória fiscal que ela possui, esse erro foi}
   {corrigido na versão 02.05}
   if IsV03 then
      raise Exception.Create('Essa Impressora Fiscal não possui este recurso')
   else
    begin
      {Falta testar}
      Espera := 20 + DaysBetween(DataInicial,DataFinal) ;
      AguardaImpressao := True ;
      EnviaComando( 'I' + 'N' + FormatDateTime('ddmmyy',DataInicial) +
                    FormatDateTime('ddmmyy',DataFinal),   Espera ) ;
    end;
end;

procedure TACBrECFDataRegis.LeituraMemoriaFiscal(ReducaoInicial,
  ReducaoFinal: Integer);
var
   Espera: INteger;
begin
   {Compativel com 02.03 e 02.05}
   {Falta testar}
   Espera := Trunc(10 + ((ReducaoFinal - ReducaoInicial)/2) ) ;
   EnviaComando( 'i' + 'N' + IntToStrZero(ReducaoInicial,4)+
                 IntToStrZero(ReducaoFinal,4), Espera ) ;
end;

procedure TACBrECFDataRegis.LeituraMemoriaFiscalSerial(DataInicial,
  DataFinal: TDateTime; var Linhas: TStringList);
Var Espera : Integer ;
begin
   {Compativel com 02.03 e 02.05}
   if IsV03 then
      raise Exception.Create('Essa Impressora Fiscal não possui este recurso')
   else
    begin
      {Falta testar}
      Espera := Trunc(10 + (DaysBetween(DataInicial,DataFinal)/2) ) ;
      Linhas.Clear ;
      Linhas.Text := EnviaComando( 'I' + 'S' +FormatDateTime('ddmmyy',DataInicial)+
                                  FormatDateTime('ddmmyy',DataFinal), Espera);
    end;
end;

procedure TACBrECFDataRegis.LeituraMemoriaFiscalSerial(ReducaoInicial,
  ReducaoFinal: Integer; var Linhas: TStringList);
begin
   raise Exception.Create('Impressora fiscal não possui este recurso');
end;

procedure TACBrECFDataRegis.CarregaComprovantesNaoFiscais;
Var
   StrRet : String;
   Cont   : Integer ;
   CNF    : TACBrECFComprovanteNaoFiscal ;
   Descr  : String ;
begin
   { Compativel com 02.05}
   {Falta testar pois parece que o comando não existe}
   inherited CarregaComprovantesNaoFiscais ;
   
   if IsV03 then
      {Versao 0203}
   else
    begin
      {Versao 0205}
      Cont      := 1 ;
      StrRet    := EnviaComando( 'q', 5 ) ;
      while StrRet <> '' do
      begin
         Descr := trim( copy(StrRet, 1, 20)  ) ;
         CNF := TACBrECFComprovanteNaoFiscal.create ;
         CNF.Indice := IntToStrZero(Cont,2) ;
         CNF.Descricao := Descr ;
         fpComprovantesNaoFiscais.Add( CNF ) ;

         Delete( StrRet, 1, 24);
         Cont := Cont + 1 ;
      end ;
    end;
end;

procedure TACBrECFDataRegis.ImprimeCheque(Banco: String; Valor: Double;
  Favorecido, Cidade: String; Data: TDateTime; Observacao: String);
var
   Formato, ValStr, DataStr: String;
begin
   {linha [2] e coluna [2] do valor numérico
	 linha [2] e coluna [2] da primeira linha do extenso
	 linha [2] e coluna [2] da segunda linha do extenso
	 linha [2] e coluna [2] do favorecido
	 linha [2] e coluna [2] da cidade e data
    Formato := '03750406070010001336'}

  if fsModelosCheque.Count = 0 then
     CarregaPrgBcoTXT ;

   Formato := AchaModeloBanco( Banco ) ;
   if Formato = '' then
      raise Exception.create('Modelo de cheque do Banco: '+Banco+
                             ' não encontrado');

   ValStr     := IntToStrZero( Round(abs(Valor)*100),14) ;
   Favorecido := Copy( padL(Favorecido,50), 1, 50);
   Cidade     := Copy( padL(Cidade, 20), 1, 20);
   DataStr    := FormatDateTime('ddmmyy',Data) ;

   AguardaImpressao := True;
   EnviaComando( 'U' + 'A' + Formato + ValStr + Favorecido + Cidade + DataStr , 30);
end;

function TACBrECFDataRegis.AchaModeloBanco(Banco:String): String;
Var I : Integer ;
begin
  Result := '' ;
  Banco  := Poem_Zeros(Trim(Banco),3) ;

  if fsModelosCheque.Count = 0 then
     CarregaPrgBcoTXT ;

  For I := 0 to fsModelosCheque.Count -1 do
  begin
     if Banco = Copy(fsModelosCheque[I],1,3) then
     begin
        Result := Copy(fsModelosCheque[I],28,20) ;
        Break ;
     end ;
  end ;
end;

procedure TACBrECFDataRegis.SetArqPrgBcoTXT(const Value: String);
begin
  fsArqPrgBcoTXT := Value;
  CarregaPrgBcoTXT ;
end;

function TACBrECFDataRegis.GetModelosCheque: TStringList;
begin
  if fsModelosCheque.Count = 0 then
     CarregaPrgBcoTXT ;

  Result := fsModelosCheque;
end;

procedure TACBrECFDataRegis.CarregaPrgBcoTXT ;
Var ArqTemp : String ;
begin
  { Verificando se o arquivo é válido }
  if (fsArqPrgBcoTXT <> '') and (not FileExists( fsArqPrgBcoTXT )) then
  begin
     MessageDlg('Arquivo '+fsArqPrgBcoTXT+' não encontrado. '+
                'Valores padrões serão utilizados.',mtWarning,[mbOk],0);
     fsArqPrgBcoTXT := '' ;
  end ;

  if fsArqPrgBcoTXT = '' then
     ArqTemp := ExtractFilePath( Application.ExeName )+'prgbco.txt'
  else
     ArqTemp := fsArqPrgBcoTXT ;

  fsModelosCheque.Clear ;
  { Adcionando valores default }
  if (not FileExists( ArqTemp )) then
   begin
     with fsModelosCheque do
     begin
//           ....+....1....+....2....+....3....+....4....+..
      Add('001BANCO DO BRASIL S/A     02750412070010001325') ;
      Add('003BANCO DA AMAZONIA S/A   01650400060009001121') ;
      Add('004BANCO DO NORDESTE DO BRA02650500070009001122') ;
      Add('006BANCO NACIONAL DE CREDIT02650500070009001122') ;
      Add('008BANCO MERIDIONAL DO BRAS01750500070010001230') ;
      Add('022BANCO DE CREDITO REAL DE00760300050008001123') ;
      Add('027BANCO DO ESTADO DE SANTA01650401060008001026') ;
      Add('028BANCO DO ESTADO DA BAHIA02650500070010001222') ;
      Add('029BANCO DO ESTADO DO RIO D01750500090011001424') ;
      Add('031BANCO DO ESTADO DE GOIAS02650500070009001122') ;
      Add('033BANCO DO ESTADO DE SAO P01690500080010001237') ;
      Add('034BANCO DO ESTADO DO AMAZO01650400060008001021') ;
      Add('037BANCO DO ESTADO DO PARA 01650400060009001121') ;
      Add('038BANCO DO ESTADO DO PARAN02750610080011001425') ;
      Add('039BANCO DO ESTADO DO PIAUI01650410060008001021') ;
      Add('041BANCO DO ESTADO DO RIO G02760500080011001331') ;
      Add('048BANCO DO ESTADO DE MINAS01740300060009001120') ;
      Add('070BANCO REGIONAL  DE BRASI01650400060009001121') ;
      Add('104CAIXA ECONOMICA FEDERAL 01750410060009001537') ;
      Add('106BANCO CREFISUL S/A      01780500080010001227') ;
      Add('150CAIXA ECONOMICA DO ESTAD02650500070009001122') ;
      Add('151CAIXA ECONOMICA DO ESTAD01750400070009001219') ;
      Add('152CAIXA ECONOMICA DO ESTAD01650400060009001121') ;
      Add('153CAIXA ECONOMICA DO ESTAD01650500070009001122') ;
      Add('168BANCO DE MONTREAL S/A - 01650400070009001125') ;
      Add('207BANCO GERAL DO COMERCIO 01730400070010001227') ;
      Add('215BANCO AMERICA DO SUL S/A01730400060009001136') ;
      Add('219BANCO DE CREDITO DE SAO 01650400070009001125') ;
      Add('220BANCO ANTONIO DE QUEIROZ01650400060009001121') ;
      Add('230BANCO BANDEIRANTES S/A  01700400060009001228') ;
      Add('231BANCO BOAVISTA S/A      01740400060009001229') ;
      Add('237BANCO BRASILEIRO DE DESC03720600090012001534') ;
      Add('244BANCO CIDADE DE SAO PAUL01650500070009001223') ;
      Add('254PARANA BANCO S/A        01650400070010001325') ;
      Add('275BANCO REAL              01720500070009001232') ;
      Add('282BANCO BRASILEIRO COMERCI01650400060009001121') ;
      Add('291BANCO DE CREDITO NACIONA02720400070009001222') ;
      Add('294BANCO DE CREDITO REAL DO01650400070009001125') ;
      Add('302BANCO DO PROGRESSO S/A  01650400060009001121') ;
      Add('320BANCO INDUSTRIAL E COMER02650500070009001122') ;
      Add('334BANCO ECONOMICO S/A     01750400070009001128') ;
      Add('341BANCO ITAU S/A          02800512070010001334') ;
      Add('344BANCO MERCANTIL DE PERNA01650400070009001125') ;
      Add('346BANCO FRANCES E BRASILEI01760400070009001231') ;
      Add('347BANCO SUDAMERIS BRASIL S00710400070010001326') ;
      Add('353BANCO GERAL DO COMERCIO 01750300050008001132') ;
      Add('366BANCO SOGERAL S/A       02650502080010001223') ;
      Add('369BANCO DIGITAL S/A       01650500070009001122') ;
      Add('370BANCO EUROPEU           01650400060009001121') ;
      Add('372BANCO ITAMARATI S/A     01750400070010001323') ;
      Add('376BANCO CHASE MANHATAN S/A01650400070009001125') ;
      Add('388BANCO MERCANTIL DE DESCO02650500070010001222') ;
      Add('389BANCO MERCANTIL DO BRASI01650500070009001223') ;
      Add('392BANCO MERCANTIL DE SAO P02760600090011001338') ;
      Add('394BANCO DE CREDITO REAL DE00740300050008001223') ;
      Add('399BANCO BAMERINDUS DO BRAS02750510080011001425') ;
      Add('409UNIBANCO - UNIAO DE BANC02700500080011001334') ;
      Add('415BANCO NACIONAL S/A      02730502080211021323') ;
      Add('420BANCO NACIONAL DO NORTE 01650400070009001125') ;
      Add('422BANCO SAFRA             01750400060009001226') ;
      Add('424BANCO NOROESTE S/A      01750500070009001222') ;
      Add('434BANCO POPULAR DE FORTALE01650400060009001121') ;
      Add('453BANCO RURAL S/A         01650400060009001128') ;
      Add('466BANCO MITSUBISHI BRASILE01650400060009001126') ;
      Add('472LLOYDS BANK             02650500070010001222') ;
      Add('473BANCO FINANCIAL PORTUGUE01650400060009001121') ;
      Add('477CITYBANK N.A.           02760600080011001325') ;
      Add('479THE FIRST NATIONAL BANK 00750400070009001225') ;
      Add('480BANCO ROYAL DO CANADA   02650500070009001125') ;
      Add('487DEUTSCHE BANK           02650500070009001122') ;
      Add('493BANCO UNION, C.A.       01650500070009001122') ;
      Add('494BANCO DE LA REPUBLICA OR01650400070009001121') ;
      Add('495BANCO DE LA PROVINCIA DE01650400070009001121') ;
      Add('498BANCO EXTERIOR DE SPANA 01650400060008001021') ;
      Add('602BANCO PATENTE S/A       02650500070009001125') ;
      Add('605BANCO PAO DE ACUCAR S/A 01650400060008001124') ;
      Add('606BANCO GRANDE RIO S/A    01650500070009001122') ;
      Add('611BANCO PAULISTA S/A      01650400070009001125') ;
      Add('642BANCO GERAL DO COMERCIO 01740500080011001338') ;
      Add('748SICREDI                 02750410070010001325') ;
      Add('999BAGGIO                  02750400060009001232') ;
     end ;
   end
  else
     fsModelosCheque.LoadFromFile( ArqTemp );
end;

procedure TACBrECFDataRegis.CarregaUnidadesMedida;
var
   StrRet: String;
   UMD: TACBrECFUnidadeMedida;
begin
  {Compativel com 02.03 e 02.05}
  inherited CarregaUnidadesMedida ;

  {Versao 0203 não utiliza unidades de medida}
  if IsV05 then
  begin
     StrRet    := EnviaComando( 'm', 5 ) ;
     while StrRet <> '' do
     begin
        UMD := TACBrECFUnidadeMedida.create ;
        UMD.Indice := IntToStrZero( StrToInt( copy( StrRet, 1, 2)) ,2) ;
        UMD.Descricao := trim( copy(StrRet, 3, 2) );

        fpUnidadesMedida.Add( UMD ) ;
        Delete( StrRet, 1, 4);
     end ;
  end;
end;

procedure TACBrECFDataRegis.ProgramaUnidadeMedida(var Descricao: String);
var
   UMD: TACBrECFUnidadeMedida;
begin
   {Versao 0203 não utiliza unidades de medida}
   if IsV05 then
   begin
      Descricao := Copy(padL(Descricao,2), 1, 2) ;
      UMD := AchaUMDDescricao(Descricao);
      if UMD = nil then
      begin
         EnviaComando( 's' + '01' + Descricao );
         CarregaUnidadesMedida;
      end;
   end;
end;

procedure TACBrECFDataRegis.SetNomeArqINI(const Value: String);
begin
  fsNomeArqINI := Value;
end;

procedure TACBrECFDataRegis.GravaArqINI;
Var Ini : TIniFile ;
    I   : Integer ;
begin
  if fsNumSerie = '' then
     GetNumSerie;

  Ini := TIniFile.Create( fsArqINI ) ;
  try
     Ini.WriteString('ECF','NumECF',fsNumECF) ;
     Ini.WriteString('ECF','NumSerie',fsNumSerie);

     Ini.WriteFloat('Variaveis','TotalPago',fsTotalPago);
     Ini.WriteFloat('Variaveis','DescontoAcrescimo',fsDescontoAcrescimo);
     Ini.WriteFloat('Variaveis','TotalAcumulado',fsTotalAcumulado);

     Ini.EraseSection('Itens');

     if fsTotalPago = 0 then
        For I := 0 to fsItensCupom.Count -1 do
           Ini.WriteString('Itens',IntToStrZero(I,3),fsItensCupom[I] )
     else
        fsItensCupom.Clear;

  finally
     Ini.Free ;
  end ;
end;

procedure TACBrECFDataRegis.LeArqINI;
Var Ini : TIniFile ;
    I   : Integer ;
    S   : String ;
    ValS: Double;
begin
  fsItensCupom.Clear ;
  fsDescontoAcrescimo := 0 ;
  fsTotalPago         := 0 ;
  fsTotalAcumulado    := 0 ;

  GetEstado;

  if not FileExists(fsArqINI) then
    begin
      if fpEstado = estVenda then fsTotalAcumulado:= GetSubTotal;
      exit ;
    end;

  if fsNumECF = '' then
     GetNumECF ;

  if fsNumSerie = '' then
     GetNumSerie ;

  Ini := TIniFile.Create( fsArqINI ) ;
  try

    if (Trim(Ini.ReadString('ECF','NumECF',''))   <> fsNumECF) or
       (Trim(Ini.ReadString('ECF','NumSerie','')) <> fsNumSerie) then
       exit ;

    fsTotalPago         := Ini.ReadFloat('Variaveis','TotalPago',0);
    fsDescontoAcrescimo := Ini.ReadFloat('Variaveis','DescontoAcrescimo',0);
    fsTotalAcumulado    := Ini.ReadFloat('Variaveis','TotalAcumulado',0);

    if fsTotalAcumulado > 0 then
      begin
      ValS := GetSubTotal;
      if fsTotalAcumulado <> ValS then
        fsTotalAcumulado := ValS;
      end;

    if fpEstado <> estVenda then
      begin
        Ini.EraseSection('Itens');
        Ini.WriteFloat('Variaveis','TotalAcumulado',0);
      end
    else
      begin
        I := 0 ;
        while true do
        begin
           S := Ini.ReadString('Itens',IntToStrZero(I,3), '*FIM*') ;

           if S = '*FIM*' then break ;

           fsItensCupom.Add( S ) ;
           I := I + 1 ;
        end ;
      end;
  finally
     Ini.Free ;
  end ;
end;

function TACBrECFDataRegis.GetOperador: Integer;
var
   Op: String;
begin
   {Compativel com 02.03 e 02.05}
   if IsV03 then
      begin
      {Falta implementar mas sera usando o comando 'g'}
      Result:= 0;
      end
   else
      begin
      Op:= Copy(EnviaComando('l'),22,10);
      Result:= StrToInt(Op);
      end;
end;

procedure TACBrECFDataRegis.SetOperador(Codigo: Integer);
var
   StrCod: String;
begin
   {Compativel com 02.03 e 02.05}
   if IsV03 then
      begin
      if (Codigo < 0) or (Codigo > 999999) then
         raise Exception.Create('Valor Inválido para o Operador');
         StrCod:= padR(IntToStr(Codigo), 6, '0');
      end
   else
      begin
      if (Codigo < 0) or (Codigo > 9999999999) then
         raise Exception.Create('Valor Inválido para o Operador');
         StrCod:= padR(IntToStr(Codigo), 10, '0');
      end;

   EnviaComando( 'O' + StrCod );
end;

function TACBrECFDataRegis.IsV03: Boolean;
begin
  Result := RightStr(fsNumVersao,2) = '03' ;
end;

function TACBrECFDataRegis.IsV05: Boolean;
begin
  Result := RightStr(fsNumVersao,2) = '05' ;
end;

end.

