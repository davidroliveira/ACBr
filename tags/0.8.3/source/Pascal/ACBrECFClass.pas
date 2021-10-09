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
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Simões de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Praça Anita Costa, 34 - Tatuí - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{******************************************************************************
|* Historico
|*
|* 19/05/2004: Primeira Versao
|*    Daniel Simoes de Almeida
|*    Criaçao e Distribuiçao da Primeira Versao
|* 28/06/2004: Varias modificaçoes. Documentado em ACBrECF.pas ou
|*    ACBr-change-log.txt
******************************************************************************}

{$I ACBr.inc}

Unit ACBrECFClass ;

interface
uses ACBrBase,
     SysUtils , Classes, Contnrs,
     {$IFDEF VisualCLX} QControls, QForms, QGraphics, QDialogs {$ENDIF}
     {$IFDEF VCL}Controls, Forms, Graphics, Dialogs {$ENDIF} ;

const
  cTempoInicioMsg = 3 ;  { Tempo para iniciar a exibiçao da mensagem
                           'Aguardando a Resposta da Impressora' }
  cMsgAguardando  = 'Aguardando a resposta da Impressora: %d segundos' ;
  cMsgPoucoPapel  = 30 ; {Exibe alerta de Pouco Papel somente a cada 30 segundos}
  cMsgRelatorio   = 'Imprimindo %s  %dª Via ' ;
  cPausaRelatorio = 5 ;
  cMsgPausaRelatorio = 'Destaque a %dª via, <ENTER> proxima, %d seg.';
  cLinhasEntreCupons = 7 ;

type

TACBrECFEstado = (estNaoInicializada, { Porta Serial ainda nao foi aberta }
                  estDesconhecido, {Porta aberta, mas estado ainda nao definido}
                  estLivre, { Impressora Livre, sem nenhum cupom aberto,
                              pronta para nova venda, Reducao Z e Leitura X ok,
                              pode ou nao já ter ocorrido 1ª venda no dia...}
                  estVenda, { Cupom de Venda Aberto com ou sem venda do 1º Item}
                  estPagamento, { Iniciado Fechamento de Cupom com Formas Pagto
                                  pode ou não ter efetuado o 1º pagto. Nao pode
                                  mais vender itens, ou alterar Subtotal}
                  estRelatorio, { Imprimindo Cupom Fiscal Vinculado ou
                                  Relatorio Gerencial }
                  estBloqueada, { Reduçao Z já emitida, bloqueada até as 00:00 }
                  estRequerZ, {Reducao Z dia anterior nao emitida. Emita agora }
                  estRequerX  {Esta impressora requer Leitura X todo inicio de
                               dia. Imprima uma Leitura X para poder vender}
                  ) ;

EACBrECFCMDInvalido     = class(Exception) ;
EACBrECFSemResposta     = class(Exception) ;
EACBrECFNaoInicializado = class(Exception) ;

{ Definindo novo tipo para armazenar Aliquota de ICMS }
TACBrECFAliquota = class
 private
    fsIndice: String;
    fsAliquota: Double ;
    fsTipo: Char;
 public
    constructor create ;
    property Indice   : String read fsIndice   write fsIndice ;
    property Aliquota : Double read fsAliquota write fsAliquota ;
    property Tipo     : Char read fsTipo write fsTipo ;
end;

{ Lista de Objetos do tipo TACBrECFAliquota }
TACBrECFAliquotas = class(TObjectList)
  protected
    procedure SetObject (Index: Integer; Item: TACBrECFAliquota);
    function GetObject (Index: Integer): TACBrECFAliquota;
  public
    function Add (Obj: TACBrECFAliquota): Integer;
    procedure Insert (Index: Integer; Obj: TACBrECFAliquota);
    property Objects [Index: Integer]: TACBrECFAliquota
      read GetObject write SetObject; default;
  end;

{ Definindo novo tipo para armazenar as Formas de Pagamento }
TACBrECFFormaPagamento = class
 private
    fsIndice: String;
    fsDescricao: String;
    fsPermiteVinculado: Boolean;
 public
    constructor create ;
    property Indice    : String read fsIndice    write fsIndice ;
    property Descricao : String read fsDescricao write fsDescricao ;
    property PermiteVinculado : Boolean read fsPermiteVinculado
                                       write fsPermiteVinculado ;
end;

{ Lista de Objetos do tipo TACBrECFFormaPagamento }
TACBrECFFormasPagamento = class(TObjectList)
  protected
    procedure SetObject (Index: Integer; Item: TACBrECFFormaPagamento);
    function GetObject (Index: Integer): TACBrECFFormaPagamento;
  public
    function Add (Obj: TACBrECFFormaPagamento): Integer;
    procedure Insert (Index: Integer; Obj: TACBrECFFormaPagamento);
    property Objects [Index: Integer]: TACBrECFFormaPagamento
      read GetObject write SetObject; default;
  end;

{ Definindo novo tipo para armazenar as unida3des de Medida }
TACBrECFUnidadeMedida = class
 private
    fsIndice: String;
    fsDescricao: String;
 public
    constructor create ;
    property Indice    : String read fsIndice    write fsIndice ;
    property Descricao : String read fsDescricao write fsDescricao ;
end;

{ Lista de Objetos do tipo TACBrECFunidadeMedida }
TACBrECFUnidadesMedida = class(TObjectList)
  protected
    procedure SetObject (Index: Integer; Item: TACBrECFUnidadeMedida);
    function GetObject (Index: Integer): TACBrECFUnidadeMedida;
  public
    function Add (Obj: TACBrECFUnidadeMedida): Integer;
    procedure Insert (Index: Integer; Obj: TACBrECFUnidadeMedida);
    property Objects [Index: Integer]: TACBrECFUnidadeMedida
      read GetObject write SetObject; default;
  end;

{ Definindo novo tipo para armazenar os Comprovantes NAO Fiscais (CNF) }
TACBrECFComprovanteNaoFiscal = class
 private
    fsIndice: String;
    fsDescricao: String;
    fsPermiteVinculado: Boolean;
    fsFormaPagamento: String;
 public
    constructor create ;
    property Indice    : String read fsIndice    write fsIndice ;
    property Descricao : String read fsDescricao write fsDescricao ;
    property PermiteVinculado : Boolean read fsPermiteVinculado
                                       write fsPermiteVinculado ;
    property FormaPagamento : String read fsFormaPagamento
                                    write fsFormaPagamento ;
end;

{ Lista de Objetos do tipo TACBrECFComprovanteNaoFiscal }
TACBrECFComprovantesNaoFiscais = class(TObjectList)
  protected
    procedure SetObject (Index: Integer; Item: TACBrECFComprovanteNaoFiscal);
    function GetObject (Index: Integer): TACBrECFComprovanteNaoFiscal;
  public
    function Add (Obj: TACBrECFComprovanteNaoFiscal): Integer;
    procedure Insert (Index: Integer; Obj: TACBrECFComprovanteNaoFiscal);
    property Objects [Index: Integer]: TACBrECFComprovanteNaoFiscal
      read GetObject write SetObject; default;
  end;

{ Evento para o usuário exibir os erros encontrados pela classe TACBrECFClass.
  Se o evento OnMsgErro NAO for programado a Classe TACBrECFClass exibirá as
  Msg de erro através de Exceçoes. Se o evento OnMsgErro for programado a Classe
  nao exibe nenhuma msg de erro, que deverao ser tratados dentro deste evento }
TACBrECFExibeErroEvent = procedure(Erro : Exception) of object ;
{ Evento para enviar as msg de Aguarde para o Componente  }
TACBrECFMsgAguarde = procedure(Mensagem : String) of object ;

{ Thread para ler a resposta da Impressora, enquanto exibe o Form definido em
  FormMsgAguarde de modo ShowModal (para bloquear o teclado) }
TACBrECFThreadLeResposta = class(TThread)
  private
    { Private declarations }
    fsOwner : TObject ;
    fsTempoLimite : TDateTime ;
    fsTempoInicio : TDateTime ;
    fsAbriuFormMsg : Boolean ;
    procedure AtualizaMsg ;
    procedure PerguntaRetentar ;
    procedure FechaFormMsg ;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  protected
    constructor Create(AOwner : TObject);
    procedure Execute; override;
  public
    property AbriuFormMsg : Boolean read fsAbriuFormMsg write fsAbriuFormMsg ;
  end;


{ Thread para listar relatorio Gerencial }
TACBrECFThreadRelatorio = class(TThread)
  private
    fsOwner : TObject ;
    fsRelatorio : TStrings ;
    fsVias : Integer ;
    fsTipoRelatorio : Char ;
    fsErro : String ;

    procedure Lista ;
    procedure FechaFormMsg ;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  protected
    constructor Create(AOwner : TObject; Relatorio : TStrings;
       Vias : Integer; TipoRelatorio : Char);
    procedure Execute; override;
  public
     property ErroMsg : String read fsErro ;
  end;


{ Classe generica de ECF, nao implementa nenhum modelo especifico, apenas
  declara a Classe. NAO DEVE SER INSTANCIADA. Usada apenas como base para
  as demais Classes de ECF como por exemplo a classe TACBrECFBematech  }

{ Nota sobre procimentos e funções VIRTUAL. Essas funçoes/procedimentos PODEM
  ou NAO ser implementados nas Classes filhas com a clausula OVERRIDE. Se não
  forem implementadas nas classes filhas, a funçao/procedimento definida aqui
  nessa classe (TACBrECFClass) e que será execuada }

TACBrECFClass = class
 private
    fsRetentar     : Boolean;

    fsBloqueiaMouseTeclado: Boolean;
    fsExibeMensagem: Boolean;
    fsTempoInicioMsg: Integer;
    fsMsgAguarde: String;
    fsMsgRelatorio : String;
    fsPausaRelatorio : Integer ;
    fsLinhasEntreCupons : Integer ;
    fsMsgPausaRelatorio : String ;
    fsMsgPoucoPapel: Integer;
    fsDescricaoGrande: Boolean;
    fsControlaFormMsg : Boolean ;
    fsFimPausa : TDateTime ;
    fsOnMsgErro    : TACBrECFExibeErroEvent ;
    fsOnMsgAguarde : TACBrECFMsgAguarde ;
    fsAguardandoResposta: Boolean;
    fsOnAguardandoRespostaChange: TNotifyEvent;
    fsOnMsgPoucoPapel: TNotifyEvent;
    fsOperador: String;
    fpAguardaImpressao: Boolean;

    procedure SetAtivo(const Value: Boolean);
    procedure SetTimeOut(const Value: Integer);
    function GetTimeOut: Integer;
    function GetExibeFormulario: Boolean;

    procedure ErroAbstract( NomeProcedure : String ) ;
    function GetAliquotas: TACBrECFAliquotas;
    function GetFormasPagamentos: TACBrECFFormasPagamento;
    procedure SetAguardandoResposta(const Value: Boolean);
    function GetComprovantesNaoFiscais: TACBrECFComprovantesNaoFiscais;
    function GetUnidadesMedida: TACBrECFUnidadesMedida;
 Protected
    fpDevice  : TACBrDevice ;
    fpAtivo  : Boolean ;
    fpColunas: Integer;
    fpModeloStr: String;
    fpComandoEnviado: String;
    fpRespostaComando: String;
    fpUltimaMsgPoucoPapel : TDateTime ;
    fpEstado: TACBrECFEstado;
    fpArredondaPorQtd: Boolean;

    { Coleçao de objetos TACBrECFAliquota }
    fpAliquotas: TACBrECFAliquotas;
    { Coleçao de objetos TACBrECFFormasPagamento }
    fpFormasPagamentos : TACBrECFFormasPagamento;
    { Coleçao de objetos TACBrECFFormasPagamento }
    fpComprovantesNaoFiscais : TACBrECFComprovantesNaoFiscais;
    { Coleçao de objetos TACBrECFUnidadesMedida}
    fpUnidadesMedida : TACBrECFUnidadesMedida;

    fpFormMsg : TForm ;  { Ponteiro para FormMsg do Componente ACBrECF }

    procedure GeraErro( E : Exception ) ;

    function GetModeloStr: String; virtual ;
    function GetDataHora: TDateTime; virtual ;
    function GetNumCupom: String; virtual ;
    function GetNumECF: String; virtual ;
    function GetNumCRO: String; virtual ;
    function GetNumLoja: String; virtual ;
    function GetNumSerie: String; virtual ;
    function GetNumVersao: String ; virtual ;
    function GetSubTotal: Double; virtual ;
    function GetTotalPago: Double; virtual ;

    function GetEstado: TACBrECFEstado; virtual ;
    function GetGavetaAberta: Boolean; virtual ;
    function GetPoucoPapel : Boolean; virtual ;
    function GetHorarioVerao: Boolean; virtual ;
    function GetArredonda: Boolean; virtual ;
    function GetChequePronto: Boolean; virtual ;

    procedure LeResposta ; virtual ;
    function VerificaFimLeitura(Retorno:String)   : Boolean ; virtual ;
    function VerificaFimImpressao : Boolean ; virtual ;
    procedure ListaRelatorioGerencial(Relatorio : TStrings; Vias : Integer = 1);
       virtual ;
    Procedure ListaCupomVinculado( Relatorio : TStrings; Vias : Integer = 1) ;
       virtual ;
    procedure PausarRelatorio( Via : Integer) ;
    procedure FormKeyPress(Sender: TObject; var Key: Char);

    procedure ArredondarPorQtd( var Qtd: Double; ValorUnitario: Double;
       Precisao : Integer = -2 ) ;
    procedure DoOnMsgPoucoPapel( Mensagem : String = '') ;

    { Função usada pelo metodo VendeItem. Verificando se informou o Tipo da
      Aliquota (T ou S) no final da String.. Exs: 12T,  5S,  2,10T }
    procedure VerificaTipoAliquota( var AliquotaICMS : String; var Tipo : char ) ;
 public
    Constructor create( AOwner : TComponent ) ;
    Destructor Destroy  ; override ;

    Property Ativo  : Boolean read fpAtivo write SetAtivo ;
    procedure Ativar ; virtual ;
    procedure Desativar ; virtual ;

    property ArredondaPorQtd : Boolean read fpArredondaPorQtd
       write fpArredondaPorQtd ;
    property AguardaImpressao : Boolean read fpAguardaImpressao
       write fpAguardaImpressao ;
    property ExibeFormulario : Boolean read GetExibeFormulario ;
    procedure PintaFormMsg( Texto : String ) ;
    property ControlaFormMsg : Boolean read fsControlaFormMsg write fsControlaFormMsg ;

    { Proriedades de uso interno, configurando o funcionamento da classe,
      atribuidas pelo Objeto TACBrECF dono dessa classe }
//    property OnMsgErro : TACBrECFExibeErroEvent read  fpOnMsgErro
//                write fpOnMsgErro ;
    property OnMsgAguarde : TACBrECFMsgAguarde read  fsOnMsgAguarde
                write fsOnMsgAguarde ;
    property OnAguardandoRespostaChange : TNotifyEvent
        read fsOnAguardandoRespostaChange write fsOnAguardandoRespostaChange ;
    property OnMsgPoucoPapel : TNotifyEvent
        read fsOnMsgPoucoPapel write fsOnMsgPoucoPapel ;

    Property TimeOut  : Integer read GetTimeOut write SetTimeOut ;
    Property Retentar : Boolean read fsRetentar write fsRetentar ;

    property BloqueiaMouseTeclado : Boolean read  fsBloqueiaMouseTeclado
                                            write fsBloqueiaMouseTeclado ;
    property Operador   : String  read fsOperador   write fsOperador ;
    property MsgAguarde : String  read fsMsgAguarde write fsMsgAguarde ;
    property MsgRelatorio : String  read fsMsgRelatorio write fsMsgRelatorio ;
    property PausaRelatorio : Integer read fsPausaRelatorio
                write fsPausaRelatorio ;
    property LinhasEntreCupons : Integer read fsLinhasEntreCupons
                write fsLinhasEntreCupons ;
    property MsgPausaRelatorio : String  read fsMsgPausaRelatorio
                write fsMsgPausaRelatorio ;
    property ExibeMensagem : Boolean read fsExibeMensagem write fsExibeMensagem ;
    property TempoInicioMsg : Integer read  fsTempoInicioMsg
                                      write fsTempoInicioMsg ;
    property MsgPoucoPapel : Integer read  fsMsgPoucoPapel
                                     write fsMsgPoucoPapel  ;
    property DescricaoGrande : Boolean read fsDescricaoGrande
                                      write fsDescricaoGrande ;

    { Proriedades ReadOnly }
    Property Colunas  : Integer read fpColunas  ;
    Property ModeloStr: String  read GetModeloStr ;
    Property AguardandoResposta : Boolean read fsAguardandoResposta
       write SetAguardandoResposta ;
    { String com Comando exatamente como foi enviado para impressora }
    Property ComandoEnviado : String read fpComandoEnviado ;
    { String com a Resposta Completa da Impressora (sem tratamentos) }
    Property RespostaComando : String read fpRespostaComando ;

    { Propriedades relacionadas aos dados do ECF }
    { ECF - Variaveis }
    Property DataHora  : TDateTime read GetDataHora  ;
    Property NumCupom  : String    read GetNumCupom  ;
    Property NumLoja   : String    read GetNumLoja   ;
    Property NumCRO    : String    read GetNumCRO    ;
    Property NumECF    : String    read GetNumECF    ;
    Property NumSerie  : String    read GetNumSerie  ;
    Property NumVersao : String    read GetNumVersao ;

    { Aliquotas de ICMS }
    procedure CarregaAliquotas ; virtual ;
    Property Aliquotas : TACBrECFAliquotas read GetAliquotas ;
    function AchaICMSAliquota( Aliquota : Double; Tipo : Char = ' ' ) :
       TACBrECFAliquota ; virtual;
    function AchaICMSIndice( Indice : String ) : TACBrECFAliquota ; virtual ;
    Procedure ProgramaAliquota( Aliquota : Double; Tipo : Char = 'T';
       Posicao : String = '') ; virtual ;

    { Formas de Pagamento }
    procedure CarregaFormasPagamento ; virtual ;
    Property FormasPagamento : TACBrECFFormasPagamento read GetFormasPagamentos;
    function AchaFPGDescricao( Descricao : String ) : TACBrECFFormaPagamento ;
       virtual ;
    function AchaFPGIndice( Indice : String ) : TACBrECFFormaPagamento ;
       virtual ;
    Procedure ProgramaFormaPagamento( var Descricao: String;
       PermiteVinculado : Boolean = true; Posicao : String = '' ) ; virtual ;

    { Comprovantes Nao Fiscais (CNF) }
    procedure CarregaComprovantesNaoFiscais ; virtual ;
    Property ComprovantesNaoFiscais : TACBrECFComprovantesNaoFiscais
       read GetComprovantesNaoFiscais ;
    function AchaCNFDescricao( Descricao : String ) :
       TACBrECFComprovanteNaoFiscal ; virtual ;
    function AchaCNFIndice( Indice : String ) : TACBrECFComprovanteNaoFiscal ;
       virtual ;
    function AchaCNFFormaPagamento( CodFPG : String ) :
       TACBrECFComprovanteNaoFiscal ; virtual ;
    Procedure ProgramaComprovanteNaoFiscal( var Descricao: String;
       Tipo : String = ''; Posicao : String = '') ; virtual ;

    { Unidades de Medida (UMD) }
    procedure CarregaUnidadesMedida ; virtual ;
    Property UnidadesMedida : TACBrECFUnidadesMedida read GetUnidadesMedida;
    function AchaUMDDescricao( Descricao : String ) : TACBrECFUnidadeMedida ;
       virtual ;
    function AchaUMDIndice( Indice : String ) : TACBrECFUnidadeMedida ;
       virtual ;
    Procedure ProgramaUnidadeMedida( var Descricao: String) ; virtual ;

    { ECF - Flags }
    Function EmLinha( lTimeOut : Integer = 1) : Boolean ; virtual ;
    Property PoucoPapel : Boolean read GetPoucoPapel ;
    Property Estado : TACBrECFEstado read GetEstado ;
    Property HorarioVerao : Boolean read GetHorarioVerao ;
    Property Arredonda : Boolean read GetArredonda ;

    { Procedimentos de Cupom Fiscal }
    Procedure AbreCupom( CPF_CNPJ : String = '') ; virtual ;
    Procedure VendeItem( Codigo, Descricao : String; AliquotaICMS : String;
       Qtd : Double ; ValorUnitario : Double; DescontoPorc : Double = 0;
       Unidade : String = '') ; virtual ;
    Procedure SubtotalizaCupom( DescontoAcrescimo : Double = 0;
       MensagemRodape : String = '' ) ;
       virtual ; 
    Procedure EfetuaPagamento( CodFormaPagto : String; Valor : Double;
       Observacao : String = ''; ImprimeVinculado : Boolean = false) ;
       virtual ; 
    { Para quebrar linhas nos parametros Observacao use #10 ou chr(10),
      Geralmente o ECF aceita no máximo 8 linhas }
    Procedure FechaCupom( Observacao : String = '') ; virtual ;
    Procedure CancelaCupom ; virtual ;
    Procedure CancelaItemVendido( NumItem : Integer ) ; virtual ;
    Property Subtotal  : Double read GetSubTotal ;
    Property TotalPago : Double read GetTotalPago ;

    { Gaveta de dinheiro }
    Procedure AbreGaveta  ; virtual ;
    Property GavetaAberta : Boolean read GetGavetaAberta ;

    { Relatorios }
    Procedure LeituraX ; virtual ;
    Procedure ReducaoZ( DataHora : TDateTime = 0 ) ; virtual ;
    Procedure RelatorioGerencial(Relatorio : TStrings; Vias : Integer = 1) ;
    Procedure AbreRelatorioGerencial ; virtual ;
    Procedure LinhaRelatorioGerencial( Linha : String ) ; virtual ;

    Procedure CupomVinculado(COO, CodFormaPagto, CodComprovanteNaoFiscal :
       String; Valor : Double;  Relatorio : TStrings;
       Vias : Integer = 1) ; 
    Procedure AbreCupomVinculado(COO, CodFormaPagto, CodComprovanteNaoFiscal :
       String; Valor : Double) ; virtual ; 
    Procedure LinhaCupomVinculado( Linha : String ) ; virtual ;
    Procedure FechaRelatorio ; virtual ;

    { Cheques }
    Procedure ImprimeCheque(Banco : String; Valor : Double ; Favorecido,
       Cidade : String; Data : TDateTime ;Observacao : String = '') ; virtual ;
    Procedure CancelaImpressaoCheque ; virtual ;
    Property ChequePronto : Boolean read GetChequePronto ;

    { Utilitarios e Diversos }
    Procedure MudaHorarioVerao ; virtual ; 
    Procedure MudaArredondamento( Arredondar : Boolean ) ; virtual ;
    Procedure PreparaTEF ; virtual ; { Carrega as Formas, de Pagamento e CNF,
                            verifica por Vinculos, etc Particular de cada ECF }
    Procedure CorrigeEstadoErro ; virtual ; { Verifica o estado da impressora e
                                              tenta deixar em estado Livre }
    Procedure ImpactoAgulhas ; virtual ;
    Procedure LeituraMemoriaFiscal( DataInicial, DataFinal : TDateTime ) ;
       overload ; virtual ;
    Procedure LeituraMemoriaFiscal( ReducaoInicial, ReducaoFinal : Integer);
       overload ; virtual ;
    Procedure LeituraMemoriaFiscalSerial( DataInicial, DataFinal : TDateTime;
       var Linhas : TStringList ) ; overload ; virtual ;
    Procedure LeituraMemoriaFiscalSerial( ReducaoInicial, ReducaoFinal: Integer;
       var Linhas : TStringList ) ; overload ; virtual ;

    { Retorna a Resposta do ECF }
    Function EnviaComando( cmd : String ) : String ; overload ; virtual ;
    { Versao que Permite mudar o TimeOut padrao }
    Function EnviaComando( cmd : String; lTimeOut : Integer): String; overload ;
       virtual ;
    { Versao que Permite mudar o TimeOut padrao e o TempoInicioMsg }
    Function EnviaComando( cmd : String; lTimeOut, lTempoInicioMsg : Integer):
       String; overload ; virtual ;

    { Gera erro se nao puder abrir Cupom, informando o motivo }
    Function TestaPodeAbrirCupom : Boolean ; virtual ;

end ;

implementation
Uses ACBrECF, ACBrUtil,
     {$IFDEF Delphi6_UP} DateUtils, StrUtils {$ELSE} ACBrD5 {$ENDIF}, Math ;

{ ---------------------------- TACBrECFAliquotas -------------------------- }

{ TACBrECFAliquota }
constructor TACBrECFAliquota.create;
begin
  fsIndice   := ''  ;
  fsAliquota := 0   ;
  fsTipo     := 'T' ;
end;

function TACBrECFAliquotas.Add(Obj: TACBrECFAliquota): Integer;
begin
  Result := inherited Add(Obj) ;
end;

function TACBrECFAliquotas.GetObject(Index: Integer): TACBrECFAliquota;
begin
  Result := inherited GetItem(Index) as TACBrECFAliquota ;
end;

procedure TACBrECFAliquotas.Insert(Index: Integer; Obj: TACBrECFAliquota);
begin
  inherited Insert(Index, Obj);
end;

procedure TACBrECFAliquotas.SetObject(Index: Integer; Item: TACBrECFAliquota);
begin
  inherited SetItem (Index, Item) ;
end;


{ --------------------------- TACBrECFFormasPagamento ---------------------- }

{ TACBrECFFormaPagamento }
constructor TACBrECFFormaPagamento.create;
begin
  fsIndice           := '' ;
  fsDescricao        := '' ;
  fsPermiteVinculado := true ;
end;

function TACBrECFFormasPagamento.Add(Obj: TACBrECFFormaPagamento): Integer;
begin
  Result := inherited Add(Obj) ;
end;

function TACBrECFFormasPagamento.GetObject( Index: Integer):
   TACBrECFFormaPagamento;
begin
  Result := inherited GetItem(Index) as TACBrECFFormaPagamento ;
end;

procedure TACBrECFFormasPagamento.Insert(Index: Integer;
  Obj: TACBrECFFormaPagamento);
begin
  inherited Insert(Index, Obj);
end;

procedure TACBrECFFormasPagamento.SetObject(Index: Integer;
  Item: TACBrECFFormaPagamento);
begin
  inherited SetItem (Index, Item) ;
end;

{ ---------------------- TACBrECFComprovantesNaoFiscais --------------------- }

{ TACBrECFComprovanteNaoFiscal }
constructor TACBrECFComprovanteNaoFiscal.create;
begin
  fsIndice           := '' ;
  fsDescricao        := '' ;
  fsPermiteVinculado := true ;
  fsFormaPagamento   := '' ;
end;

function TACBrECFComprovantesNaoFiscais.Add(
  Obj: TACBrECFComprovanteNaoFiscal): Integer;
begin
  Result := inherited Add(Obj) ;
end;

function TACBrECFComprovantesNaoFiscais.GetObject(
  Index: Integer): TACBrECFComprovanteNaoFiscal;
begin
  Result := inherited GetItem(Index) as TACBrECFComprovanteNaoFiscal ;
end;

procedure TACBrECFComprovantesNaoFiscais.Insert(Index: Integer;
  Obj: TACBrECFComprovanteNaoFiscal);
begin
  inherited Insert(Index, Obj);
end;

procedure TACBrECFComprovantesNaoFiscais.SetObject(Index: Integer;
  Item: TACBrECFComprovanteNaoFiscal);
begin
  inherited SetItem (Index, Item) ;
end;

{ ---------------------------- TACBrECFClass ------------------------------ }

constructor TACBrECFClass.create( AOwner : TComponent ) ;
begin
  if not (AOwner is TACBrECF) then
     raise Exception.create('Essa Classe deve ser instanciada por TACBrECF');

  { Criando ponteiro interno para as Propriedade SERIAL e FORMMSG de ACBrECF,
    para permitir as Classes Filhas o acesso a essas propriedades do Componente}
  fpDevice := (AOwner as TACBrECF).Device ;
  fpFormMsg:= (AOwner as TACBrECF).FormMsg ;
  fpDevice.SetDefaultValues ;

  { Ajustando variaveis Internas }
  fsRetentar             := true ;
  fsOperador             := '' ;
  fsMsgAguarde           := cMsgAguardando ;
  fsMsgRelatorio         := cMsgRelatorio ;
  fsPausaRelatorio       := cPausaRelatorio ;
  fsLinhasEntreCupons    := cLinhasEntreCupons ;
  fsMsgPausaRelatorio    := cMsgPausaRelatorio ;
  fsTempoInicioMsg       := cTempoInicioMsg ;
  fsExibeMensagem        := true ;
  fsBloqueiaMouseTeclado := true ;
  fsMsgPoucoPapel        := cMsgPoucoPapel ;
  fsDescricaoGrande      := false ;
  fsControlaFormMsg      := true ;
  fsFimPausa             := now ;
  fsOnAguardandoRespostaChange := nil ;
  fsOnMsgPoucoPapel            := nil ;
  fsAguardandoResposta         := false ;
  fsOnMsgErro                  := nil ;
  fsOnMsgAguarde               := nil ;

  { Variaveis Protected fp___ acessiveis pelas Classes filhas }
  fpAtivo                 := false ;
  fpEstado                := estNaoInicializada ;
  fpColunas               := 48 ;
  fpModeloStr             := 'Não Definido' ;
  fpComandoEnviado        := '' ;
  fpRespostaComando       := '' ;
  fpUltimaMsgPoucoPapel   := 0 ;
  fpArredondaPorQtd       := false ;
  fpAliquotas             := nil ;
  fpFormasPagamentos      := nil ;
  fpComprovantesNaoFiscais:= nil ;
end;

destructor TACBrECFClass.Destroy;
begin
  Desativar ;
  fpDevice  := nil ; { Apenas remove referencia (ponteiros internos) }
  fpFormMsg := nil ;

  if Assigned( fpAliquotas ) then
     fpAliquotas.Free ;

  if Assigned( fpFormasPagamentos ) then
     fpFormasPagamentos.Free ;

  if Assigned( fpComprovantesNaoFiscais ) then
     fpComprovantesNaoFiscais.Free ;

  inherited Destroy ;
end;

procedure TACBrECFClass.SetAtivo(const Value: Boolean);
begin
  if Value then
     Ativar
  else
     Desativar ;
end;

procedure TACBrECFClass.Ativar;
begin
  if fpAtivo then exit ;

  fpDevice.Ativar ;

  fpEstado := estDesconhecido ;
  fpAtivo  := true ;
end;

procedure TACBrECFClass.Desativar;
begin
  if not fpAtivo then exit ;

  fpDevice.Desativar ;

  fpEstado := estNaoInicializada ;
  fpAtivo  := false ;
end;


function TACBrECFClass.GetTimeOut: Integer;
begin
  Result := fpDevice.TimeOut ;
end;

procedure TACBrECFClass.SetTimeOut(const Value: Integer);
begin
  fpDevice.TimeOut := Value ;
end;

{ Essa função PODE ser override por cada Classe Filha criada }
Function TACBrECFClass.TestaPodeAbrirCupom : Boolean ;
Var Msg : String ;
begin
  result := true ;
  case Estado of
     estRequerX :
        Msg := 'A impressora '+ModeloStr+
               ' requer Leitura X todo inicio de dia.'+#10+
               ' Imprima uma Leitura X para poder vender'  ;
     estRequerZ :
        Msg := 'Redução Z de dia anterior não emitida.'+#10+
               ' Imprima uma Redução Z para poder vender' ;
     estBloqueada :
        Msg := 'Reduçao Z de hoje já emitida, ECF bloqueado até as 00:00' ;
     estVenda :
        Msg := 'Cupom Fiscal aberto' ;
     estNaoInicializada :
        Msg := 'Impressora nao foi Inicializada (Ativo = false)' ;
     estLivre :
        Msg := '' ;
  else ;
     Msg := 'Estado da impressora '+ModeloStr+' não é Livre' ;
  end;

  if Msg <> '' then
  begin
     result := false ;
     GeraErro( EACBrECFCMDInvalido.Create( Msg ) );
  end ;
end;

procedure TACBrECFClass.SetAguardandoResposta(const Value: Boolean);
begin
  if Value = fsAguardandoResposta then exit ;

  fsAguardandoResposta := Value;
  if Assigned( fsOnAguardandoRespostaChange ) then
     fsOnAguardandoRespostaChange( self ) ;
end;

procedure TACBrECFClass.GeraErro( E : Exception ) ;
begin
  if Assigned( fsOnMsgErro ) then
     fsOnMsgErro( E )
  else
     raise E ;
end;

function TACBrECFClass.EmLinha( lTimeOut: Integer): Boolean;
begin
  Result := fpDevice.EmLinha( lTimeOut ) ;
end;

function TACBrECFClass.GetDataHora: TDateTime;
begin
  Result := now ;
end;

function TACBrECFClass.GetNumECF: String;
begin
  Result := '001' ;
end;

function TACBrECFClass.GetNumCRO: String;
begin
  Result := '001' ;
end;

function TACBrECFClass.GetNumLoja: String;
begin
  Result := '001' ;
end;

function TACBrECFClass.GetNumSerie: String;
begin
  Result := 'ecfNennhum' ;
end;


{ Essa função DEVE ser override por cada Classe Filha criada }
Procedure TACBrECFClass.AbreGaveta ;
begin
  GeraErro( EACBrECFCMDInvalido.Create(
            'A Impressora '+ModeloStr+' não manipula Gavetas'));
end;

{ Essa função DEVE ser override por cada Classe Filha criada }
function TACBrECFClass.GetEstado: TACBrECFEstado;
begin
  Result := fpEstado ;
end;

{ Essa função PODE ser override por cada Classe Filha criada }
function TACBrECFClass.GetGavetaAberta: Boolean;
begin
  Result := false ;
end;

{ Essa função DEVE ser override por cada Classe Filha criada }
function TACBrECFClass.GetPoucoPapel: Boolean;
begin
  Result := false ;
end;

{ Essa função DEVE ser override por cada Classe Filha criada }
function TACBrECFClass.GetArredonda: Boolean;
begin
  Result := false ;
end;

{ Essa função DEVE ser override por cada Classe Filha criada }
function TACBrECFClass.GetHorarioVerao: Boolean;
begin
  Result := false ;
  { Nao encontrei Flag de Horário de Verao no modelo Schalter}
end;

{ Essa função PODE ser override por cada Classe Filha criada }
procedure TACBrECFClass.ImpactoAgulhas;
begin
  GeraErro( EACBrECFCMDInvalido.Create(
      'A Impressora '+ModeloStr+' não permite ajustar o Impacto das Agulhas') );
end;

{ Essa função PODE ser override por cada Classe Filha criada }
procedure TACBrECFClass.LeituraMemoriaFiscal(ReducaoInicial,
   ReducaoFinal: Integer);
begin
  ErroAbstract('LeituraMemoriaFiscal');
end;

procedure TACBrECFClass.LeituraMemoriaFiscal(DataInicial, DataFinal: TDateTime);
begin
  ErroAbstract('LeituraMemoriaFiscal');
end;

procedure TACBrECFClass.LeituraMemoriaFiscalSerial(ReducaoInicial,
   ReducaoFinal: Integer; var Linhas : TStringList);
begin
  ErroAbstract('LeituraMemoriaFiscalSerial');
end;

procedure TACBrECFClass.LeituraMemoriaFiscalSerial(DataInicial,
   DataFinal: TDateTime; var Linhas : TStringList);
begin
  ErroAbstract('LeituraMemoriaFiscalSerial');
end;

{ Essa função PODE ser override por cada Classe Filha criada }
procedure TACBrECFClass.ImprimeCheque(Banco: String; Valor: Double; Favorecido,
  Cidade: String; Data: TDateTime; Observacao: String);
begin
  GeraErro( EACBrECFCMDInvalido.Create(
               'Rotina de Impressão de Cheques não implementada para '+
               'Impressora '+ModeloStr ) );
end;

{ Essa função PODE ser override por cada Classe Filha criada }
procedure TACBrECFClass.CancelaImpressaoCheque;
begin
  GeraErro( EACBrECFCMDInvalido.Create(
               'Rotina de Impressão de Cheques não implementada para '+
               'Impressora '+ModeloStr ) );
end;

{ Essa função PODE ser override por cada Classe Filha criada }
function TACBrECFClass.GetChequePronto: Boolean;
begin
  result := false ;
end;

procedure TACBrECFClass.CorrigeEstadoErro;
begin
  case Estado of
     estRequerX : LeituraX ;

     estRequerZ : ReducaoZ( now );

     estRelatorio : FechaRelatorio ;

     estVenda, estPagamento :  CancelaCupom ;

     estBloqueada : GeraErro( EACBrECFCMDInvalido.Create(
              'Reduçao Z de hoje já emitida, ECF bloqueado até as 00:00' ) );
  end;
end;

function TACBrECFClass.AchaFPGDescricao(Descricao: String) :
   TACBrECFFormaPagamento;
var A : Integer ;
begin
  if not Assigned( fpFormasPagamentos ) then
     CarregaFormasPagamento ;

  result := nil ;
  with fpFormasPagamentos do
  begin
     Descricao := UpperCase( Descricao ) ;
     For A := 0 to Count -1 do
        if UpperCase(Objects[A].Descricao) = Descricao then
        begin
           result := Objects[A] ;
           Break ;
        end ;
  end ;
end;

{---------------------------- FORMAS DE PAGAMENTO ----------------------------}
function TACBrECFClass.AchaFPGIndice( Indice: String) :
   TACBrECFFormaPagamento;
var A : Integer ;
begin
  if not Assigned( fpFormasPagamentos ) then
     CarregaFormasPagamento ;

  result := nil ;
  with fpFormasPagamentos do
  begin
     For A := 0 to Count -1 do
        if Objects[A].Indice = Indice then
        begin
           result := Objects[A] ;
           Break ;
        end ;
  end ;
end;

procedure TACBrECFClass.ProgramaFormaPagamento(var Descricao: String;
  PermiteVinculado: Boolean; Posicao : String);
begin
  ErroAbstract('ProgramaFormaPagamento');
end;

{------------------------- COMPROVANTES NAO FISCAIS --------------------------}
function TACBrECFClass.AchaCNFDescricao(
  Descricao: String): TACBrECFComprovanteNaoFiscal;
var A : Integer ;
begin
  if not Assigned( fpComprovantesNaoFiscais ) then
     CarregaComprovantesNaoFiscais ;

  result := nil ;
  with fpComprovantesNaoFiscais do
  begin
     Descricao := UpperCase( Descricao ) ;
     For A := 0 to Count -1 do
        if UpperCase( Objects[A].Descricao ) = Descricao then
         begin
           result := Objects[A] ;
           Break ;
         end ;
  end ;
end;

function TACBrECFClass.AchaCNFIndice(
  Indice: String): TACBrECFComprovanteNaoFiscal;
var A : Integer ;
begin
  if not Assigned( fpComprovantesNaoFiscais ) then
     CarregaComprovantesNaoFiscais ;

  result := nil ;
  with fpComprovantesNaoFiscais do
  begin
     For A := 0 to Count -1 do
        if Objects[A].Indice = Indice then
        begin
           result := Objects[A] ;
           Break ;
        end ;
  end ;
end;

function TACBrECFClass.AchaCNFFormaPagamento(
  CodFPG: String): TACBrECFComprovanteNaoFiscal;
var A : Integer ;
begin
  if not Assigned( fpComprovantesNaoFiscais ) then
     CarregaComprovantesNaoFiscais ;

  result := nil ;
  with fpComprovantesNaoFiscais do
  begin
     For A := 0 to Count -1 do
        if Objects[A].FormaPagamento = CodFPG then
        begin
           result := Objects[A] ;
           Break ;
        end ;
  end ;
end;

procedure TACBrECFClass.ProgramaComprovanteNaoFiscal(var Descricao: String;
  Tipo: String; Posicao : String);
begin
  ErroAbstract('ProgramaComprovanteNaoFiscal');
end;

{-------------------------------- ALIQUOTAS ----------------------------------}
function TACBrECFClass.AchaICMSAliquota( Aliquota: Double; Tipo : Char ) :
   TACBrECFAliquota;
var A : Integer ;
begin
  if not Assigned( fpAliquotas ) then
     CarregaAliquotas ;

  if not (Tipo in ['S','T']) then
     Tipo := ' ' ;
       
  result := nil ;
  with fpAliquotas do
  begin
     For A := 0 to Count -1 do
        if (Objects[A].Aliquota = Aliquota) and
           ((Tipo = ' ') or (Tipo = Objects[A].Tipo) ) then
         begin
           result := Objects[A] ;
           Break ;
         end ;
  end ;
end;

function TACBrECFClass.AchaICMSIndice(Indice: String): TACBrECFAliquota;
var A : Integer ;
begin
  if not Assigned( fpAliquotas ) then
     CarregaAliquotas ;

  result := nil ;
  with fpAliquotas do
  begin
     For A := 0 to Count -1 do
        if Objects[A].Indice = Indice then
        begin
           result := Objects[A] ;
           Break ;
        end ;
  end ;
end;

procedure TACBrECFClass.ProgramaAliquota(Aliquota: Double; Tipo: Char;
   Posicao : String);
begin
  ErroAbstract('ProgramaAliquota');
end;

{------------------------------------------------------------------------------}
function TACBrECFClass.EnviaComando(cmd: String; lTimeOut: Integer): String;
Var wTimeOut : Integer ;
begin
  wTimeOut := TimeOut ;        { Salvando os valores antigos }
  TimeOut  := lTimeOut ;       { Novo Valor recebido pelo metodo }

  try
     result := EnviaComando( cmd ) ;
  finally
     TimeOut := wTimeOut ;     { Restaurando valor antigo }
  end ;
end;

function TACBrECFClass.EnviaComando(cmd: String; lTimeOut,
  lTempoInicioMsg: Integer): String;
Var wTimeOut, wTempoInicioMsg : Integer ;
begin
  wTimeOut        := TimeOut ;          { Salvando os valores antigos }
  wTempoInicioMsg := TempoInicioMsg ;

  TimeOut         := lTimeOut ;         { Novos Valores recebidos pelo metodo }
  TempoInicioMsg  := lTempoInicioMsg ;

  try
     result := EnviaComando( cmd ) ;
  finally
     TimeOut        := wTimeOut ;      { Restaurando valores antigos }
     TempoInicioMsg := wTempoInicioMsg ;
  end ;
end;


function TACBrECFClass.EnviaComando(cmd: String): String;
begin
  ErroAbstract( 'EnviaComando' );
end;

{------ LE RESPOSTA - Rotina de Leitura da Resposta através de Thread ---------}
procedure TACBrECFClass.LeResposta;
Var wThreadLeResposta : TACBrECFThreadLeResposta ;
begin

  { Lendo a Resposta do ECF atraves da Thread e gravando em  *fpRespostaComando*
    Após a execução da linha abaixo, o programa terá 2 fluxos distintos...
    1 - O fluxo principal (o Application) irá seguir para as proximas linhas e
      ficará "preso" no ShowModal (se BloqueiaMouseTeclado for True),
    2 - A Thread criada abaixo, será um novo processo que fica lendo os bytes
      recebidos pela Serial até que a função *VerificaFimLeitura* retorne true.
      Quando a Thread termina ela mesmo fecha o ShowModal, liberando o fluxo 1 }
  wThreadLeResposta := TACBrECFThreadLeResposta.Create( self );

  try
     { Exibindo Formulario de Aguarde em ShowModal para Bloquear o mouse e
       teclado do programa. }
     if fsControlaFormMsg and ExibeFormulario and
        ( ( not VerificaFimLeitura(fpRespostaComando) )  or
          (AguardaImpressao and (not VerificaFimImpressao)) ) then
     begin
        wThreadLeResposta.AbriuFormMsg := true ;
        if BloqueiaMouseTeclado then
           fpFormMsg.ShowModal
        else
           fpFormMsg.Show ;
        Application.ProcessMessages;
     end ;

  finally
     wThreadLeResposta.WaitFor ;
     wThreadLeResposta.Free ;
  end ;

  if fpRespostaComando = 'ACBrErro' then
  begin
     fpRespostaComando := '' ;
     raise EACBrECFSemResposta.create(
                           'Impressora '+ModeloStr+' não está respondendo') ;
  end ;
end;

{------------------------- TACBrECFThreadLeResposta ---------------------------}
constructor TACBrECFThreadLeResposta.Create( AOwner: TObject);
begin
  if not (AOwner is TACBrECFClass) then
     raise Exception.Create('Uso Inválido da ThreadLeResposta');

  fsOwner := AOwner ;
  with (AOwner as TACBrECFClass) do
  begin
     if fsControlaFormMsg then
     begin
        fpFormMsg.OnCloseQuery := FormCloseQuery ; { Ajustando o Form }
        fpFormMsg.Width  := 0 ;
        fpFormMsg.Height := 0 ;
     end;

     fpDevice.Serial.DeadlockTimeout := TimeOut * 1000 ; { Define Timeout }
  end ;

  inherited Create( false ) ;  { rodar imediatamente }

end;

procedure TACBrECFThreadLeResposta.Execute;
Var Fim : Boolean ;
begin
  with (fsOwner as TACBrECFClass) do
  begin
     try
        fpRespostaComando := '' ;  { de fsOwner as TACBrECFClass }

        { Calcula Tempo Limite. Espera resposta até Tempo Limite. Se a resposta
          for Lida antes, já encerra. Se nao chegar até TempoLimite, gera erro.}
        fsTempoLimite := IncSecond( now, TimeOut) ;
        fsTempoInicio := IncSecond( now, TempoInicioMsg) ;
        Fim := True ;

        { - Le até atingir a condiçao descrita na funçao VerificaFimLeitura que
            é particular de cada Classe Filha (override)
          - VerificaFimImpressao é necessário apenas nos ECFs que respondem
            antes do termino da impressao (Sweda, Bematech, Daruma) }
        repeat
           { Chama AtualizaMsg para ver se deve exibir a msg e atualiza-la }
          {$IFDEF MSWINDOWS}
           {$IFDEF VisualCLX}
           if BloqueiaMouseTeclado then
               AtualizaMsg  { removido do Synchronize para funcionar na UNVCLX 3.9 }
            else
           {$ENDIF}
          {$ENDIF}
              Synchronize( AtualizaMsg );

           if now > fsTempoLimite then       { TimeOut }
           begin
              if Retentar then
                 Synchronize( PerguntaRetentar ) ;

              if now > fsTempoLimite then      { Respondeu Nao a Retentar }
              begin
                 fpRespostaComando := 'ACBrErro' ;
                 break ;
              end ;
           end ;

           Fim := True ;
           if not VerificaFimLeitura(fpRespostaComando) then
            begin
              Fim := False ;
              try
                 fpRespostaComando := fpRespostaComando + { Le conteudo da porta }
                                      fpDevice.Serial.RecvPacket(100) ;
              except
                 { Exceçao silenciosa }
              end ;
            end
           else
              if AguardaImpressao then
                 Fim := VerificaFimImpressao ;

        until Fim ;
     finally
        AguardaImpressao := False ;
        if fsControlaFormMsg then
          {$IFDEF MSWINDOWS}
           {$IFDEF VisualCLX}
           if BloqueiaMouseTeclado then
              FechaFormMsg{ removido do Synchronize para funcionar na UNVCLX 3.9 }
           else
           {$ENDIF}
          {$ENDIF}
              Synchronize( FechaFormMsg );
     end ;
  end ;

  Terminate ;
end;

{ Essa função DEVE ser override por cada Classe Filha criada }
function TACBrECFClass.VerificaFimLeitura(Retorno:String): Boolean;
begin
  raise Exception.Create(
    'Erro Function VerificaFimLeitura não implementada em '+ModeloStr);
end;

{ Essa função PODE ser override por cada Classe Filha criada
  - Ela é necessária apenas para ECFs que respondem antes do termino da
    Impressao como a Sweda, Bematech, Daruma, etc.
  - Substitui a antiga função "EnviaComandoEspera"
  - Para usa-la ative a Propriedade "AguardarImpressao" entes de chamar
    "EnviaComando"
  - IMPORTANTE: Não é permitido o uso de chamadas EnviaComando dentra dessa
    função, caso constrário ela entrará em chamada Recursiva Infinita }
function TACBrECFClass.VerificaFimImpressao: Boolean;
begin
  Result := True ;
end;

procedure TACBrECFThreadLeResposta.AtualizaMsg ;
Var Texto : String ;
    TempoRestante : Integer ;
begin
  with (fsOwner as TACBrECFClass) do
  begin
     if fsControlaFormMsg and (now >= fsTempoInicio) then
     begin
        TempoRestante := SecondsBetween( now, fsTempoLimite) ;
        try
           Texto := Format(MsgAguarde, [ TempoRestante ]) ;
        except
           Texto := MsgAguarde ;
        end ;

        PintaFormMsg( Texto );
     end ;

     if not BloqueiaMouseTeclado then
        Application.ProcessMessages ;
  end ;

end;

procedure TACBrECFThreadLeResposta.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := self.Terminated ;
end;

procedure TACBrECFThreadLeResposta.PerguntaRetentar;
begin
  with (fsOwner as TACBrECFClass) do
  begin
     if fsControlaFormMsg then
     begin
        fpFormMsg.Width  := 0 ;  { Escondendo o Form da Msg }
        fpFormMsg.Height := 0 ;
     end ;

     if MessageDlg('A impressora '+ModeloStr+' não está repondendo.'+#10+
                   'Deseja tentar novamente ?',
                   mtConfirmation,[mbYes,mbNo],0) = mrYes then
        fsTempoLimite := IncSecond( now, TimeOut)  ;
  end ;
end;

procedure TACBrECFThreadLeResposta.FechaFormMsg;
begin
  with (fsOwner as TACBrECFClass) do
  begin
     if Assigned( fsOnMsgAguarde ) then
        fsOnMsgAguarde( '' ) ;

     if fsControlaFormMsg then
     begin
        { Espera fpForMsg terminar de abrir, senao ninguem consiguirá fecha-lo }
        while AbriuFormMsg and (not fpFormMsg.Visible) do
           Application.ProcessMessages ;

        fpFormMsg.OnCloseQuery := nil ;
        fpFormMsg.Close ;
     end ;
  end ;
end;

{-------------------PINTAFORMMSG - Desenha a janela de mensagens --------------}
procedure TACBrECFClass.PintaFormMsg( Texto : String );
Var H, W, X, Y : Integer ;
begin
  if Assigned( fsOnMsgAguarde ) then
     fsOnMsgAguarde( Texto ) ;

  if fpFormMsg.Visible and ExibeMensagem then
  begin
     with fpFormMsg.Canvas do      { Pintando <Texto> no Canvas do fpFormMsg }
     begin
        H := TextHeight(Texto) + 10 ;    { Calcula o tamanho do Texto }
        W := TextWidth (Texto) + 20 ;

        { Ajusta o Form para caber o Texto }
        if (abs(W - fpFormMsg.Width ) > 4) or
           (abs(H - fpFormMsg.Height) > 4) then
        begin
           fpFormMsg.Width  := W ;
           fpFormMsg.Height := H ;
           fpFormMsg.Position := poMainFormCenter ;
        end ;

        Brush.Color := fpFormMsg.Color ;
        Font.Color  := fpFormMsg.Font.Color ;
        Pen.Color   := fpFormMsg.Font.Color ;
        Rectangle(fpFormMsg.ClientRect);
       {$IFDEF VisualCLX}
        X := 0 ;
        Y := 0 ;
        TextRect(fpFormMsg.ClientRect,X,Y, Texto, 36 ) ; { 36 = No Centro }
       {$ELSE}
        { Na VCL nao tem como centralizar no Form nem quebra de Linhas }
        Texto := StringReplace( Texto, #10, ' ', [rfReplaceAll,rfIgnoreCase] ) ;
        X := 10 ;
        Y := 5 ;
        TextRect(fpFormMsg.ClientRect,X,Y, Texto ) ;
       {$ENDIF}
        Application.ProcessMessages ;
     end ;
  end ;
end;

function TACBrECFClass.GetExibeFormulario: Boolean;
begin
  result := (ExibeMensagem or BloqueiaMouseTeclado) and
            ((TimeOut - TempoInicioMsg) > 1) ;
end;

function TACBrECFClass.GetAliquotas: TACBrECFAliquotas;
begin
  if not Assigned( fpAliquotas ) then
     CarregaAliquotas ;

  result := fpAliquotas ;
end;

function TACBrECFClass.GetFormasPagamentos: TACBrECFFormasPagamento;
begin
  if not Assigned( fpFormasPagamentos ) then
     CarregaFormasPagamento ;

  result := fpFormasPagamentos ;
end;

function TACBrECFClass.GetComprovantesNaoFiscais: TACBrECFComprovantesNaoFiscais;
begin
  if not Assigned( fpComprovantesNaoFiscais ) then
     CarregaComprovantesNaoFiscais ;

  result := fpComprovantesNaoFiscais ;
end;

procedure TACBrECFClass.CarregaAliquotas;
begin
  { Apenas instancia um ObjectList de Aliquotas (TACBrECFAliquotas) vazia }
  if Assigned( fpAliquotas ) then
     fpAliquotas.Free ;

  fpAliquotas := TACBrECFAliquotas.create( true ) ;
end;

procedure TACBrECFClass.CarregaFormasPagamento;
begin
  if Assigned( fpFormasPagamentos ) then
     fpFormasPagamentos.Free ;

  fpFormasPagamentos := TACBrECFFormasPagamento.Create( true ) ;
end;

procedure TACBrECFClass.CarregaComprovantesNaoFiscais;
begin
  if Assigned( fpComprovantesNaoFiscais ) then
     fpComprovantesNaoFiscais.Free ;

  fpComprovantesNaoFiscais := TACBrECFComprovantesNaoFiscais.Create( true ) ;
end;

procedure TACBrECFClass.AbreCupom(CPF_CNPJ: String);
begin
  ErroAbstract('AbreCupom');
end;

procedure TACBrECFClass.CancelaCupom;
begin
  ErroAbstract('CancelaCupom');
end;

procedure TACBrECFClass.CancelaItemVendido(NumItem: Integer);
begin
  ErroAbstract('CancelaItemVendido');
end;

procedure TACBrECFClass.EfetuaPagamento(CodFormaPagto: String;
  Valor: Double; Observacao: String; ImprimeVinculado: Boolean);
Var FPG : TACBrECFFormaPagamento ;
begin
  FPG := AchaFPGIndice( CodFormaPagto ) ;
  if FPG = nil then
     raise Exception.Create('Forma de Pagamento: '+CodFormaPagto+' inválida');

  if ImprimeVinculado and (not FPG.fsPermiteVinculado) then
     raise Exception.Create('Forma de Pagamento: '+CodFormaPagto+#10+
                            'não permite Cupom Vinculado');
end;

procedure TACBrECFClass.FechaCupom(Observacao: String);
begin
  ErroAbstract('FechaCupom');
end;

procedure TACBrECFClass.FechaRelatorio;
begin
  ErroAbstract('FechaRelatorio');
end;

function TACBrECFClass.GetNumCupom: String;
begin
  Result := '' ;
end;

function TACBrECFClass.GetNumVersao: String ;
begin
  Result := ''
end;

function TACBrECFClass.GetSubTotal: Double;
begin
  Result := 0 ;
end;

function TACBrECFClass.GetTotalPago: Double;
begin
  Result := 0 ;
end;

procedure TACBrECFClass.LeituraX;
begin
  ErroAbstract('LeituraX');
end;

procedure TACBrECFClass.MudaHorarioVerao;
begin
  ErroAbstract('MudaHorarioVerao');
end;

procedure TACBrECFClass.MudaArredondamento(Arredondar: Boolean);
begin
  ErroAbstract('MudaArredondamento');
end;

procedure TACBrECFClass.PreparaTEF;
begin
  FechaRelatorio ;
end;

procedure TACBrECFClass.ReducaoZ(DataHora: TDateTime);
begin
  ErroAbstract('ReducaoZ');
end;

procedure TACBrECFClass.SubtotalizaCupom(DescontoAcrescimo: Double;
       MensagemRodape : String);
begin
  ErroAbstract('SubtotalizaCupom');
end;

procedure TACBrECFClass.VendeItem(Codigo, Descricao, AliquotaICMS: String;
  Qtd: Double; ValorUnitario: Double; DescontoPorc: Double; Unidade: String);
begin
  ErroAbstract('VendeItem');
end;

procedure TACBrECFClass.ErroAbstract(NomeProcedure: String);
begin
  raise EACBrECFCMDInvalido.create('Procedure: '+NomeProcedure + sLineBreak +
        ' não implementada para a Impressora: '+ModeloStr ) ;
end;

function TACBrECFClass.GetModeloStr: String;
begin
  result := fpModeloStr ;
end;

procedure TACBrECFClass.DoOnMsgPoucoPapel( Mensagem : String ) ;
begin
  if now > IncSecond(fpUltimaMsgPoucoPapel, MsgPoucoPapel) then { Avisa ? }
  begin
     if Assigned( fsOnMsgPoucoPapel ) then
        fsOnMsgPoucoPapel( self )
     else
      begin
        if Mensagem = '' then
           Mensagem := 'Detectado pouco papel' ;

        MessageDlg(Mensagem,mtError,[mbOk],0)  ;
      end ;
        
     fpUltimaMsgPoucoPapel := now ;
  end ;

end;

procedure TACBrECFClass.AbreRelatorioGerencial;
begin
  ErroAbstract('AbreRelatorioGerencial');
end;

procedure TACBrECFClass.LinhaRelatorioGerencial(Linha: String);
begin
  ErroAbstract('LinhaRelatorioGerencial');
end;

procedure TACBrECFClass.ListaRelatorioGerencial(Relatorio: TStrings;
  Vias: Integer);
begin
  ErroAbstract('ListaRelatorioGerencial');
end;

procedure TACBrECFClass.AbreCupomVinculado(COO, CodFormaPagto,
  CodComprovanteNaoFiscal: String; Valor: Double);
begin
  ErroAbstract('AbreCupomVinculado');
end;

procedure TACBrECFClass.LinhaCupomVinculado(Linha: String);
begin
  ErroAbstract('LinhaCupomVinculado');
end;

procedure TACBrECFClass.ListaCupomVinculado( Relatorio: TStrings;
  Vias: Integer);
begin
  ErroAbstract('ListaCupomVinculado');
end;

procedure TACBrECFClass.ArredondarPorQtd(var Qtd: Double; ValorUnitario: Double;
       Precisao : Integer = -2 );
Var TotalRound, TotalTrunc, Pot : Double ;
begin
  Pot := Power(10,Precisao*-1) ;
  TotalRound := RoundTo( Qtd * ValorUnitario, Precisao) ;
  TotalTrunc := RoundTo( TruncFix(Qtd * ValorUnitario * Pot) / Pot, Precisao) ;

  while TotalTrunc < TotalRound do
  begin
     Qtd := RoundTo(Qtd + 0.001, -3) ;
     TotalTrunc := RoundTo( TruncFix(Qtd * ValorUnitario * Pot) / Pot, Precisao) ;
  end ;
end;

procedure TACBrECFClass.VerificaTipoAliquota(var AliquotaICMS: String;
  var Tipo: char);
Var UltDigito : String ;
begin
  UltDigito := RightStr(AliquotaICMS,1) ;
  case UltDigito[1] of
     'T','S' :
       begin
         Tipo := UltDigito[1] ;
         AliquotaICMS := copy( AliquotaICMS,1,Length(AliquotaICMS)-1 ) ;
       end ;
  else
     Tipo := ' ' ;
  end ;
end;

procedure TACBrECFClass.CupomVinculado(COO, CodFormaPagto,
  CodComprovanteNaoFiscal: String; Valor: Double; Relatorio: TStrings;
  Vias: Integer);
Var wThreadRelatorio : TACBrECFThreadRelatorio ;
    ErroMsg : String ;
begin
  AbreCupomVinculado( COO, CodFormaPagto, CodComprovanteNaoFiscal, Valor) ;

  { Isso fará a procedure LeResposta nao pintar o FormMsgAguarde }
  fsControlaFormMsg := false ;
  { Inicia listagem do Relatorio em um processo paralelo }
  wThreadRelatorio :=
    TACBrECFThreadRelatorio.Create( self, Relatorio, Vias, 'V' );

  try
     { Exibindo Formulario de Aguarde em ShowModal para Bloquear o mouse e
      teclado do programa. }
     if (ExibeMensagem or BloqueiaMouseTeclado) then
     begin
        if BloqueiaMouseTeclado then
           fpFormMsg.ShowModal
        else
           fpFormMsg.Show ;
        Application.ProcessMessages;
     end ;

     wThreadRelatorio.WaitFor ;
  finally
     ErroMsg := wThreadRelatorio.ErroMsg ;
     wThreadRelatorio.Free ;
     fsControlaFormMsg := true ;

     if ErroMsg <> '' then
        raise Exception.create( ErroMsg );
  end ;
end;

procedure TACBrECFClass.RelatorioGerencial(Relatorio: TStrings; Vias: Integer);
Var wThreadRelatorio : TACBrECFThreadRelatorio ;
    wMsgAguarde : String ;
    ErroMsg : String ;
begin
  try
     FechaRelatorio ; { Fecha se ficou algum aberto }
  Except
  end ;

  wMsgAguarde := MsgAguarde ;
  MsgAguarde  := 'Abrindo Relatório Gerencial, aguarde %d seg' ;
  try
     AbreRelatorioGerencial ;
  finally
     MsgAguarde := wMsgAguarde ;
  end ;

  { Isso fará a procedure LeResposta nao pintar o FormMsgAguarde }
  fsControlaFormMsg := false ;
  { Inicia listagem do Relatorio em um processo paralelo }
  wThreadRelatorio :=
    TACBrECFThreadRelatorio.Create( self, Relatorio, Vias, 'G' );

  try
    { Exibindo Formulario de Aguarde em ShowModal para Bloquear o mouse e
      teclado do programa. }
     if (ExibeMensagem or BloqueiaMouseTeclado) then
     begin
        if BloqueiaMouseTeclado then
           fpFormMsg.ShowModal
        else
           fpFormMsg.Show ;
        Application.ProcessMessages;
     end ;

     wThreadRelatorio.WaitFor ;
  finally
     ErroMsg := wThreadRelatorio.ErroMsg ;
     wThreadRelatorio.Free ;
     fsControlaFormMsg := true ;

     if ErroMsg <> '' then
        raise Exception.create( ErroMsg );
  end ;
end;

procedure TACBrECFClass.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
     fsFimPausa := now ;
end;

procedure TACBrECFClass.PausarRelatorio( Via : Integer );
Var Texto : String ;
    SecRest, SecAnt : Integer ;
begin
  fpFormMsg.OnKeyPress := FormKeyPress ; { Ajustando o Form }
  fpFormMsg.KeyPreview := true ;
  fsFimPausa := IncSecond( now, PausaRelatorio ) ;
  SecAnt := 0 ;

  try
     while now < fsFimPausa do
     begin
        SecRest := SecondsBetween(now,  fsFimPausa) ;
        if SecAnt <> SecRest then
        begin
           SecAnt := SecRest ;
           
           try
              Texto := Format(MsgPausaRelatorio, [Via, SecRest]) ;
           except
              Texto := MsgPausaRelatorio ;
           end ;

           PintaFormMsg( Texto );
        end ;

        Application.ProcessMessages ;
     end ;
  finally
     fpFormMsg.OnKeyPress := nil ;
     fpFormMsg.KeyPreview := false ;
  end ;
end;


{ TACBrECFThreadRelatorio }

constructor TACBrECFThreadRelatorio.Create(AOwner: TObject;
  Relatorio: TStrings; Vias: Integer; TipoRelatorio : Char );
begin
  if not (AOwner is TACBrECFClass) then
     raise Exception.Create('Uso Inválido da ThreadRelatorio');

  fsOwner         := AOwner ;
  fsRelatorio     := Relatorio ;
  fsVias          := Vias ;
  fsTipoRelatorio := TipoRelatorio ;
  fsErro          := '' ;
  with (AOwner as TACBrECFClass) do
  begin
     fpFormMsg.OnCloseQuery := FormCloseQuery ; { Ajustando o Form }
     fpFormMsg.Width  := 0 ;
     fpFormMsg.Height := 0 ;
  end ;

  inherited Create( false ) ;  { rodar imediatamente }
end;

procedure TACBrECFThreadRelatorio.Execute;
Var wRetentar : Boolean ;
begin
  with (fsOwner as TACBrECFClass) do
  begin
     wRetentar := Retentar ;
     Retentar  := false ;

     try
        try
          {$IFDEF MSWINDOWS}
           {$IFDEF VisualCLX}
           if BloqueiaMouseTeclado then
              Lista { removido do Synchronize para funcionar na UNVCLX 3.9 }
           else
           {$ENDIF}
          {$ENDIF}
              Synchronize( Lista );
        finally
          {$IFDEF MSWINDOWS}
           {$IFDEF VisualCLX}
           if BloqueiaMouseTeclado then
              FechaFormMsg{ removido do Synchronize para funcionar na UNVCLX 3.9 }
           else
           {$ENDIF}
          {$ENDIF}
              Synchronize( FechaFormMsg );

           Retentar := wRetentar ;
        end ;
     except
        On E : Exception do
           fsErro := E.Message ;
     end ;
  end ;
end;

procedure TACBrECFThreadRelatorio.Lista;
begin
  with (fsOwner as TACBrECFClass) do
  begin
     if fsTipoRelatorio = 'G' then
        ListaRelatorioGerencial( fsRelatorio, fsVias )
     else if fsTipoRelatorio = 'V' then
        ListaCupomVinculado( fsRelatorio, fsVias );
  end ;
end;

procedure TACBrECFThreadRelatorio.FechaFormMsg;
begin
  with (fsOwner as TACBrECFClass) do
  begin
     if Assigned( fsOnMsgAguarde ) then
        fsOnMsgAguarde( '' ) ;

     fpFormMsg.OnCloseQuery := nil ;
     fpFormMsg.Close ;
  end ;
end;

procedure TACBrECFThreadRelatorio.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := self.Terminated ;
end;

{ TACBrECFUnidadeMedida }

constructor TACBrECFUnidadeMedida.create;
begin
  fsIndice           := '' ;
  fsDescricao        := '' ;
end;

{ TACBrECFUnidadesMedida }

function TACBrECFUnidadesMedida.Add(Obj: TACBrECFUnidadeMedida): Integer;
begin
  Result := inherited Add(Obj) ;
end;

function TACBrECFUnidadesMedida.GetObject(
  Index: Integer): TACBrECFUnidadeMedida;
begin
  Result := inherited GetItem(Index) as TACBrECFUnidadeMedida ;
end;

procedure TACBrECFUnidadesMedida.Insert(Index: Integer;
  Obj: TACBrECFUnidadeMedida);
begin
  inherited Insert(Index, Obj);
end;

procedure TACBrECFUnidadesMedida.SetObject(Index: Integer;
  Item: TACBrECFUnidadeMedida);
begin
  inherited SetItem (Index, Item) ;
end;

procedure TACBrECFClass.CarregaUnidadesMedida;
begin
  if Assigned( fpUnidadesMedida ) then
     fpUnidadesMedida.Free ;

  fpUnidadesMedida := TACBrECFUnidadesMedida.Create( true ) ;
end;

function TACBrECFClass.GetUnidadesMedida: TACBrECFUnidadesMedida;
begin
  if not Assigned( fpUnidadesMedida ) then
     CarregaUnidadesMedida ;

  result := fpUnidadesMedida ;
end;

procedure TACBrECFClass.ProgramaUnidadeMedida(var Descricao: String);
begin
  ErroAbstract('ProgramaUnidadeMedida');
end;

function TACBrECFClass.AchaUMDDescricao(
  Descricao: String): TACBrECFUnidadeMedida;
var A : Integer ;
begin
  if not Assigned( fpUnidadesMedida ) then
     CarregaUnidadesMedida ;

  result := nil ;
  with fpUnidadesMedida do
  begin
     Descricao := UpperCase( Descricao ) ;
     For A := 0 to Count -1 do
        if UpperCase( Objects[A].Descricao ) = Descricao then
         begin
           result := Objects[A] ;
           Break ;
         end ;
  end ;
end;

function TACBrECFClass.AchaUMDIndice(
  Indice: String): TACBrECFUnidadeMedida;
var A : Integer ;
begin
  if not Assigned( fpUnidadesMedida ) then
     CarregaUnidadesMedida ;

  result := nil ;
  with fpUnidadesMedida do
  begin
     For A := 0 to Count -1 do
        if Objects[A].Indice = Indice then
        begin
           result := Objects[A] ;
           Break ;
        end ;
  end ;
end;

end.

