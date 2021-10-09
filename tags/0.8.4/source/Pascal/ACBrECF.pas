{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para interação com equipa- }
{ mentos de Automação Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2004 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo: Alexandre Rocha Lima e Marcondes                }
{                                                                              }
{  Você pode obter a última versão desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{ Esse arquivo usa a classe  SynaSer   Copyright (c)2001-2003, Lukas Gebauer   }
{  Project : Ararat Synapse     (Found at URL: http://www.ararat.cz/synapse/)  }
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
|* 19/05/2004: Daniel Simoes de Almeida
|*  - Primeira Versao: Criaçao e Distribuiçao da Primeira Versao
|* 20/05/2004:  Alexandre Rocha Lima e Marcondes
|*  - Primeira Versao Multi-plataforma: Compatibilidade entre VCL e VisualCLX
|* 23/06/2004:  Daniel Simoes de Almeida
|*  - Propriedade NumVersao mudou de Integer para String para compatibilizar com
|*    alguns modelos de ECF
|*  - Propriedades renomeadas: (Melhor organizaçao visual das Propriedades)
|*    MsgTempoInicio -> TempoInicioMsg,
|*    MsgExibe       -> ExibeMensagem.
|*  - Evento OnMsgAguarde teve seu parametro modificado de:
|*    TempoRestante : Integer -> Mensagem : String
|*  - Novas Propriedades:
|*    DescricaoGrande : Boolean default false;
|*    MsgRelatorio, MsgPausaRelatorio : String;
|*    PausaRelatorio : Integer  default 5
|*    LinhasEntreCupons : Integer  default 7
|*    FormMsgColor : TColor
|*    FormMsgFonte : TFonte
|*  - Novos Metodos:
|*    RelatorioGerencial(Relatorio : TStrings; Vias : Integer = 1)
|*    AbreRelatorioGerencial
|*    LinhaRelatorioGerencial( Linha : String )
|*    CupomVinculado(COO, CodFormaPagto : String; Valor : Double
|*              Relatorio : TStrings; Vias : Integer = 1)
|*    AbreCupomVinculado(COO, CodFormaPagto : String; Valor : Double)
|*    LinhaCupomVinculado( Linha : String )
|* 30/06/2004:  Daniel Simoes de Almeida
|*  - Metodo  CorrigeEstadoErro  implementado
|* 10/06/2004:  Daniel Simoes de Almeida
|*  - Adicionada sobrecarga ao método MudaHorarioVerao.
|*    Procedure MudaHorarioVerao( EHorarioVerao : Boolean ) ;
|*    - Nesse novo método não será aberta nenhuma janela ShowModal
|* 03/05/2006:  Daniel Simoes de Almeida
|*  - Métodos LinhaRelatorioGerencial e LinhaCupomVinculado agora permitem
|*    informar várias linhas separadas por #10 ou #13+#10
|*    - Se o ECF for Térmico (MFD) e permitir informar várias linhas
|*      simultaneamente, impressão de linhas será muito mais rápida
|* 23/05/2006:  Daniel Simoes de Almeida
|*   - Adicionado método: PulaLinhas( NumLinhas : Integer = 0 ) ;
******************************************************************************}

{$I ACBr.inc}

Unit ACBrECF ;

interface
uses ACBrBase, ACBrECFClass, {Units da ACBr}
     SysUtils , Classes,
     {$IFDEF VisualCLX} QControls, QForms, QDialogs, QGraphics{$ENDIF}
     {$IFDEF VCL} Controls, Forms, Dialogs, Graphics {$ENDIF} ;

type

{ Modelos de ECF Suportados pelo Componente TACBrECF atualmente
  Diveresos fabricantes usam o chipset da Mecaf como por exemplo:
  Elgin, Digiarte, Zanthus, Acr, Aoki, Chronos, Promcomp, TrendsSTS, Unigraph.
  Isso pode ser indentificado por alguma indicação no corpo do equipamento.
  Entretanto não há garantia de plena compatibilidade entre os diferentes
  equipamentos. (Favor reportar possiveis BUGS) }
TACBrECFModelo = (ecfNenhum, ecfNaoFiscal, ecfBematech, ecfSweda, ecfDaruma,
                  ecfSchalter, ecfMecaf, ecfYanco, ecfDataRegis, ecfUrano,
                  ecfICash, ecfQuattro );

{ Componente ACBrECF }
TACBrECF = class( TACBrComponent )
  private
    fsDevice  : TACBrDevice ;   { SubComponente ACBrDevice }

    { Propriedades do Componente ACBrECF }
    fsAtivo  : Boolean;
    fsProcurandoECF   : Boolean ;
    fsProcurandoPorta : Boolean ;
    fsModelo : TACBrECFModelo;
    fsMensagemRodape : String ;  
    fsFormMsgColor : TColor ;
    fsFormMsgFont  : TFont ;

    fsECF    : TACBrECFClass ;   { Classe com instancia do ECF de fsModelo }

    procedure SetAtivo(const Value: Boolean);
    procedure SetModelo(const Value: TACBrECFModelo);
    procedure SetPorta(const Value: String);
    procedure SetRetentar(const Value: Boolean);
    procedure SetTimeOut(const Value: Integer);
    procedure SetMsgAguarde(const Value: String);
    procedure SetMsgRelatorio(const Value: String);
    procedure SetPausaRelatorio(const Value: Integer);
    procedure SetTempoInicioMsg(const Value: Integer);
    procedure SetBloqueiaMouseTeclado(const Value: Boolean);
    procedure SetExibeMensagem(const Value: Boolean);
    procedure SetMsgPoucoPapel(const Value: Integer);
    procedure SetDescricaoGrande(const Value: Boolean);
//    procedure SetOnMsgErro(const Value: TACBrECFExibeErroEvent);
    procedure SetOnMsgAguarde(const Value: TACBrECFMsgAguarde);
    procedure SetOnAguardandoRespostaChange(const Value: TNotifyEvent);
    procedure SetOnMsgPoucoPapel(const Value: TNotifyEvent);

    function GetPorta: String;
    function GetRetentar: Boolean;
    function GetTimeOut: Integer;
    function GetBloqueiaMouseTeclado: Boolean;
    function GetMsgAguarde: String;
    function GetMsgRelatorio: String;
    function GetPausaRelatorio: Integer;
    function GetExibeMensagem: Boolean;
    function GetTempoInicioMsg: Integer;
    function GetMsgPoucoPapel: Integer;
//    function GetOnMsgErro: TACBrECFExibeErroEvent;
    function GetOnMsgAguarde: TACBrECFMsgAguarde;
    function GetOnAguardandoRespostaChange: TNotifyEvent;
    function GetOnMsgPoucoPapel: TNotifyEvent;

    function GetAguardandoRespostaClass: Boolean;
    function GetColunasClass: Integer;
    function GetComandoEnviadoClass: String;
    function GetRespostaComandoClass: String;
    function GetDataHoraClass: TDateTime;
    function GetNumCupomClass: String;
    function GetNumECFClass: String;
    function GetNumSerieClass: String;
    function GetNumVersaoClass: String;
    function GetEstadoClass: TACBrECFEstado;
    function GetPoucoPapelClass: Boolean;
    function GetChequeProntoClass: Boolean;
    function GetGavetaAbertaClass: Boolean;
    function GetSubTotalClass: Double;
    function GetTotalPagoClass: Double;
    function GetAliquotasClass: TACBrECFAliquotas;
    function GetFormasPagamentoClass: TACBrECFFormasPagamento;
    function GetComprovantesNaoFiscaisClass : TACBrECFComprovantesNaoFiscais;
    function GetModeloStrClass: String;
    function GetDescricaoGrande: Boolean;
    function GetMsgPausaRelatorio: String;
    procedure SetMsgPausaRelatorio(const Value: String);
    function GetLinhasEntreCupons: Integer;
    procedure SetLinhasEntreCupons(const Value: Integer);
    procedure SetFormMsgFonte(const Value: TFont);
    function GetOperador: String;
    procedure SetOperador(const Value: String);
    function GetHorarioVeraoClass: Boolean;
    function GetArredondaClass: Boolean;
    function GetNumLojaClass: String;
    function GetNumCROClass: String;
    function GetArredondaPorQtd: Boolean;
    procedure SetArredondaPorQtd(const Value: Boolean);
    function GetAguardaImpressao: Boolean;
    procedure SetAguardaImpressao(const Value: Boolean);
    function GetUnidadesMedidaClass: TACBrECFUnidadesMedida;

    procedure DoAcharPorta ;
  protected

  public
    constructor Create(AOwner: TComponent); override;
    Destructor Destroy  ; override ;

    procedure Ativar ;
    procedure Desativar ;
    property Ativo : Boolean read fsAtivo write SetAtivo ;

    property ECF : TACBrECFClass read fsECF ;

    function TestarDialog : Boolean ;
    function AcharECF( ProcuraModelo: Boolean = true;
                       ProcuraPorta : Boolean = true;
                       ATimeOut : Integer = 3): Boolean ;
    function AcharPorta(ATimeOut: Integer = 3): Boolean;

    { Propriedades lidas da Classe Instanciada em fsECF }
    Property Colunas            : Integer read GetColunasClass ;
    Property AguardandoResposta : Boolean read GetAguardandoRespostaClass ;
    Property ComandoEnviado     : String  read GetComandoEnviadoClass ;
    Property RespostaComando    : String  read GetRespostaComandoClass ;

    Property AguardaImpressao : Boolean read GetAguardaImpressao
                 write SetAguardaImpressao ;

    { ECF - Variaveis }
    Property ModeloStr : String    read GetModeloStrClass;
    Property DataHora  : TDateTime read GetDataHoraClass ;
    Property NumCupom  : String    read GetNumCupomClass ;
    Property NumLoja   : String    read GetNumLojaClass  ;
    Property NumCRO    : String    read GetNumCROClass   ;
    Property NumECF    : String    read GetNumECFClass   ;
    Property NumSerie  : String    read GetNumSerieClass ;
    Property NumVersao : String    read GetNumVersaoClass;

    { Aliquotas de ICMS }
    Property Aliquotas : TACBrECFAliquotas read GetAliquotasClass ;
    procedure CarregaAliquotas ;
    function AchaICMSAliquota( Aliquota : Double; Tipo : Char = ' ' ) :
       TACBrECFAliquota ;
    function AchaICMSIndice( Indice : String ) : TACBrECFAliquota ;
    Procedure ProgramaAliquota( Aliquota : Double; Tipo : Char = 'T';
       Posicao : String = '') ;

    { Formas de Pagamento }
    Property FormasPagamento : TACBrECFFormasPagamento
                               read GetFormasPagamentoClass;
    procedure CarregaFormasPagamento ;
    function AchaFPGDescricao( Descricao : String ) : TACBrECFFormaPagamento ;
    function AchaFPGIndice( Indice : String ) : TACBrECFFormaPagamento ;
    Procedure ProgramaFormaPagamento( var Descricao: String;
       PermiteVinculado : Boolean = true; Posicao : String = '') ;

    { Comprovantes Nao Fiscais (CNF) }
    Property ComprovantesNaoFiscais : TACBrECFComprovantesNaoFiscais
                               read GetComprovantesNaoFiscaisClass;
    procedure CarregaComprovantesNaoFiscais ;
    function AchaCNFDescricao( Descricao : String ) :
       TACBrECFComprovanteNaoFiscal ;
    function AchaCNFIndice( Indice : String ) : TACBrECFComprovanteNaoFiscal ;
    function AchaCNFFormaPagamento( CodFPG : String ) :
       TACBrECFComprovanteNaoFiscal ;
    Procedure ProgramaComprovanteNaoFiscal( var Descricao: String;
       Tipo : String = ''; Posicao : String = '') ;

    { Unidades de Medida (UMD) }
    Property UnidadesMedida : TACBrECFUnidadesMedida
                               read GetUnidadesMedidaClass;
    procedure CarregaUnidadesMedida ;
    function AchaUMDDescricao( Descricao : String ) : TACBrECFUnidadeMedida ;
    function AchaUMDIndice( Indice : String ) : TACBrECFUnidadeMedida ;
    Procedure ProgramaUnidadeMedida( var Descricao: String) ;

    { ECF - Flags }
    Function EmLinha( lTimeOut : Integer = 1) : Boolean ;
    Property PoucoPapel   : Boolean        read GetPoucoPapelClass ;
    Property Estado       : TACBrECFEstado read GetEstadoClass ;
    Property HorarioVerao : Boolean        read GetHorarioVeraoClass ;
    Property Arredonda    : Boolean        read GetArredondaClass ;

    { Procedimentos de Cupom Fiscal }
    Procedure AbreCupom( CPF_CNPJ : String = '') ;
    Procedure VendeItem( Codigo, Descricao : String; AliquotaICMS : String;
       Qtd : Double ; ValorUnitario : Double; DescontoPorc : Double = 0;
       Unidade : String = '') ;
    Procedure SubtotalizaCupom( DescontoAcrescimo : Double = 0;
       MensagemRodape : String = '') ;
    Procedure EfetuaPagamento( CodFormaPagto : String; Valor : Double;
       Observacao : String = ''; ImprimeVinculado : Boolean = false) ;
    { Para quebrar linhas nos parametros Observacao use: '|' (pipe),
       #10 ou chr(10).      Geralmente o ECF aceita no máximo 8 linhas }
    Procedure FechaCupom( Observacao : String = '') ;
    Procedure CancelaCupom ;
    Procedure CancelaItemVendido( NumItem : Integer ) ;
    Property Subtotal  : Double read GetSubTotalClass ;
    Property TotalPago : Double read GetTotalPagoClass ;

    { Gaveta de dinheiro }
    Procedure AbreGaveta  ;
    Property GavetaAberta : Boolean read GetGavetaAbertaClass ;

    { Relatorios }
    Procedure LeituraX ;
    Procedure ReducaoZ( DataHora : TDateTime = 0 ) ;
    Procedure RelatorioGerencial(Relatorio : TStrings; Vias : Integer = 1) ;
    Procedure AbreRelatorioGerencial ;
    Procedure LinhaRelatorioGerencial( Linha : String ) ;
    Procedure CupomVinculado(COO, CodFormaPagto : String; Valor : Double;
              Relatorio : TStrings; Vias : Integer = 1) ; overload ;
    Procedure CupomVinculado(COO, CodFormaPagto, CodComprovanteNaoFiscal :
       String; Valor : Double;  Relatorio : TStrings;
       Vias : Integer = 1) ; overload ;
    Procedure AbreCupomVinculado(COO, CodFormaPagto : String;
       Valor : Double) ; overload ;
    Procedure AbreCupomVinculado(COO, CodFormaPagto, CodComprovanteNaoFiscal :
       String; Valor : Double) ; overload ;
    Procedure LinhaCupomVinculado( Linha : String ) ;
    Procedure FechaRelatorio ;
    Procedure PulaLinhas( NumLinhas : Integer = 0 ) ;

    { Cheques }
    Procedure ImprimeCheque(Banco : String; Valor : Double ; Favorecido,
       Cidade : String; Data : TDateTime ;Observacao : String = '') ;
    Procedure CancelaImpressaoCheque ;
    Property ChequePronto : Boolean read GetChequeProntoClass ;

    { Utilitarios e Diversos }
    Procedure MudaHorarioVerao ; overload ;
    Procedure MudaHorarioVerao( EHorarioVerao : Boolean ) ; overload ;
    Procedure MudaArredondamento( Arredondar : Boolean ) ;
    Procedure PreparaTEF ; { Carrega as Formas, de Pagamento e CNF,
                             verifica por Vinculos, etc Particular de cada ECF }
    Procedure CorrigeEstadoErro ; { Verifica o estado da impressora e
                                    tenta deixar em estado Livre }
    Procedure ImpactoAgulhas ;
    Procedure LeituraMemoriaFiscal( DataInicial, DataFinal : TDateTime ) ;
       overload ;
    Procedure LeituraMemoriaFiscal( ReducaoInicial, ReducaoFinal : Integer);
       overload ;
    Procedure LeituraMemoriaFiscalSerial( DataInicial, DataFinal : TDateTime;
       var Linhas : TStringList ) ; overload ;
    Procedure LeituraMemoriaFiscalSerial( ReducaoInicial, ReducaoFinal : Integer;
       var Linhas : TStringList ) ; overload ;

    Function EnviaComando( cmd : String): String; overload;
    { Permitindo mudar o TimeOut padrao }
    Function EnviaComando( cmd : String; lTimeOut : Integer): String;
       overload ;

    { Gera erro se nao puder abrir Cupom, informando o motivo }
    Procedure TestaPodeAbrirCupom ;

  published
     property Modelo : TACBrECFModelo read fsModelo write SetModelo
                 default ecfNenhum ;
     property Porta : String read GetPorta write SetPorta ;
     property ReTentar : Boolean read GetRetentar write SetRetentar
                 default true;
     property TimeOut : Integer read GetTimeOut write SetTimeOut
                 default cTimeout ;
     property DescricaoGrande : Boolean read GetDescricaoGrande
                 write SetDescricaoGrande default false ;

     property Operador   : String read GetOperador   write SetOperador ;
     property MsgAguarde : String read GetMsgAguarde write SetMsgAguarde ;
     property ExibeMensagem : Boolean read GetExibeMensagem write SetExibeMensagem
                 default true ;
     property TempoInicioMsg : Integer read  GetTempoInicioMsg
                 write SetTempoInicioMsg default cTempoInicioMsg ;
     property ArredondaPorQtd : Boolean read GetArredondaPorQtd
                 write SetArredondaPorQtd default false ;
     property BloqueiaMouseTeclado : Boolean read  GetBloqueiaMouseTeclado
                 write SetBloqueiaMouseTeclado default true ;
     property MsgPoucoPapel : Integer read  GetMsgPoucoPapel
                 write SetMsgPoucoPapel  default cMsgPoucoPapel ;
     property MsgRelatorio : String read  GetMsgRelatorio
                 write SetMsgRelatorio ;
     property PausaRelatorio : Integer read  GetPausaRelatorio
                 write SetPausaRelatorio default cPausaRelatorio ;
     property MsgPausaRelatorio : String read  GetMsgPausaRelatorio
                 write SetMsgPausaRelatorio ;
     property LinhasEntreCupons : Integer read  GetLinhasEntreCupons
                 write SetLinhasEntreCupons default cLinhasEntreCupons ;
     property FormMsgFonte : TFont read  fsFormMsgFont  write SetFormMsgFonte ;
     property FormMsgColor: TColor read  fsFormMsgColor write fsFormMsgColor ;

//     property OnMsgErro : TACBrECFExibeErroEvent  read  GetOnMsgErro
//                                                  write SetOnMsgErro ;
     property OnMsgAguarde : TACBrECFMsgAguarde   read  GetOnMsgAguarde
                                                  write SetOnMsgAguarde ;
     property OnAguardandoRespostaChange : TNotifyEvent
        read GetOnAguardandoRespostaChange write SetOnAguardandoRespostaChange ;
     property OnMsgPoucoPapel : TNotifyEvent read  GetOnMsgPoucoPapel
                                             write SetOnMsgPoucoPapel ;

     { Instancia do Componente ACBrDevice, será passada para fsECF.create }
     property Device : TACBrDevice read fsDevice ;
end ;

implementation
Uses ACBrUtil, ACBrECFBematech, ACBrECFNaoFiscal, ACBrECFDaruma, ACBrECFSchalter,
     ACBrECFMecaf, ACBrECFSweda, ACBrECFDataRegis, ACBrECFUrano, ACBrECFYanco,
     ACBrECFICash, ACBrECFQuattro
    {$IFNDEF Delphi6_UP} ,ACBrD5, Windows {$ENDIF}, Math ;

{ TACBrECF }
constructor TACBrECF.Create(AOwner: TComponent);
begin
  inherited create( AOwner );

  { Inicializando as Variaveis Internas }
  fsAtivo := false ;
  fsProcurandoECF   := false ;
  fsProcurandoPorta := false ;

  { Instanciando SubComponente TACBrDevice }
  fsDevice := TACBrDevice.Create( self ) ;  { O dono é o proprio componente }
  fsDevice.Name := 'ACBrDevice' ;      { Apenas para aparecer no Object Inspector}
  {$IFDEF Delphi6_UP}
  fsDevice.SetSubComponent( true );{ para gravar no DFM/XFM }
  {$ENDIF}
  fsDevice.Porta := 'COM1';

  fsFormMsgFont  := TFont.create ;
  fsFormMsgColor :=  {$IFDEF VisualCLX} clNormalHighlight {$ELSE}
                                        clHighlight      {$ENDIF};

  { Instanciando fsECF com modelo Generico (ECFClass) }
  fsECF := TACBrECFClass.create( self ) ;
end;

destructor TACBrECF.Destroy;
begin
  Ativo := false ;
  if Assigned( fsECF ) then
     FreeAndNil( fsECF ) ;

  FreeAndNil( fsDevice ) ;

  fsFormMsgFont.Free ;

  inherited Destroy;
end;

procedure TACBrECF.SetModelo(const Value: TACBrECFModelo);
var wRetentar : Boolean ;   { Variaveis de Trabalho, usadas para transportar }
    wTimeOut  : Integer ;   { as informações de uma Classe ECF antiga para a }
    wMsgAguarde : String ;  { do novo modelo que será instanciada }
    wOperador   : String ;
    wMsgRelatorio : String ;
    wPausaRelatorio : Integer ;
    wLinhasEntreCupons : Integer ;
    wArredondaPorQtd : Boolean ;
    wExibeMensagem   : Boolean ;
    wTempoInicioMsg : Integer ;
    wBloqueiaMouseTeclado : Boolean ;
    wMsgPoucoPapel : Integer ;
//    wOnMsgErro : TACBrECFExibeErroEvent ;
    wOnMsgAguarde : TACBrECFMsgAguarde ;
    wOnMsgPoucoPapel : TNotifyEvent ;
    wOnAguardandoRespostaChange : TNotifyEvent ;
    wDescricaoGrande : Boolean ;
begin
  if fsModelo = Value then exit ;

  if fsAtivo then
     raise Exception.Create('Não é possível mudar o Modelo com o ECF Ativo');

(*  { Verificação Temporária de Modelos já Implementados }
  if not (Value in [ ecfBematech, ecfNenhum, ecfNaoFiscal, ecfDaruma,
                     ecfSchalter, ecfMecaf, ecfSweda, ecfDataRegis,
                     ecfUrano, ecfICash ]) then
     raise Exception.Create('Modelo ainda não implementado');
*)     

  wRetentar             := ReTentar ;
  wTimeOut              := TimeOut ;
  wBloqueiaMouseTeclado := BloqueiaMouseTeclado ;
  wMsgAguarde           := MsgAguarde ;
  wOperador             := Operador ;
  wMsgRelatorio         := MsgRelatorio ;
  wPausaRelatorio       := PausaRelatorio ;
  wLinhasEntreCupons    := LinhasEntreCupons ;
  wArredondaPorQtd      := ArredondaPorQtd ;
  wExibeMensagem        := ExibeMensagem ;
  wTempoInicioMsg       := TempoInicioMsg ;
  wMsgPoucoPapel        := MsgPoucoPapel ;
//  wOnMsgErro          := OnMsgErro ;
  wOnMsgAguarde         := OnMsgAguarde ;
  wOnMsgPoucoPapel      := OnMsgPoucoPapel ;
  wDescricaoGrande      := DescricaoGrande ;
  wOnAguardandoRespostaChange := OnAguardandoRespostaChange ;

  FreeAndNil( fsECF ) ;

  { Instanciando uma nova classe de acordo com fsModelo }
  case Value of
    ecfBematech  : fsECF := TACBrECFBematech.create( Self ) ;
    ecfDaruma    : fsECF := TACBrECFDaruma.create( Self ) ;
    ecfSchalter  : fsECF := TACBrECFSchalter.create( Self ) ;
    ecfMecaf     : fsECF := TACBrECFMecaf.create( Self ) ;
    ecfSweda     : fsECF := TACBrECFSweda.Create( self );
    ecfYanco     : fsECF := TACBrECFYanco.create( Self ) ;
    ecfDataRegis : fsECF := TACBrECFDataRegis.create( Self ) ;
    ecfUrano     : fsECF := TACBrECFUrano.create( Self ) ;
    ecfNaoFiscal : fsECF := TACBrECFNaoFiscal.create( Self ) ;
    ecfICash     : fsECF := TACBrECFICash.create( Self ) ;
    ecfQuattro   : fsECF := TACBrECFQuattro.create( Self ) ;
  else
     fsECF := TACBrECFClass.create( Self ) ;
  end;

  { Passando propriedades da Classe anterior para a Nova Classe }
  Retentar             := wRetentar ;
  TimeOut              := wTimeOut ;
  TempoInicioMsg       := wTempoInicioMsg ;
  Operador             := wOperador ;
  MsgAguarde           := wMsgAguarde ;
  MsgRelatorio         := wMsgRelatorio ;
  PausaRelatorio       := wPausaRelatorio ;
  LinhasEntreCupons    := wLinhasEntreCupons ;
  ArredondaPorQtd      := wArredondaPorQtd ;
  ExibeMensagem        := wExibeMensagem ;
  BloqueiaMouseTeclado := wBloqueiaMouseTeclado ;
  MsgPoucoPapel        := wMsgPoucoPapel ;
//  OnMsgErro          := wOnMsgErro ;
  OnMsgAguarde         := wOnMsgAguarde ;
  OnMsgPoucoPapel      := wOnMsgPoucoPapel ;
  OnAguardandoRespostaChange := wOnAguardandoRespostaChange ;
  DescricaoGrande      := wDescricaoGrande ;

  fsModelo := Value;
end;

procedure TACBrECF.SetAtivo(const Value: Boolean);
begin
  if Value then
     Ativar
  else
     Desativar ;
end;

procedure TACBrECF.Ativar;
begin
  if fsAtivo then exit ;

  if fsModelo = ecfNenhum then
     raise Exception.Create('Modelo não definido');

  if ((Porta = '') or (LowerCase(Porta) = 'procurar')) then
     AcharPorta ;

  fsECF.Ativar ;
  fsAtivo := true ;
end;

procedure TACBrECF.Desativar;
begin
  if not fsAtivo then exit ;

  fsECF.Desativar ;
  fsAtivo := false;
end;

function TACBrECF.GetPorta: String;
begin
  result := fsDevice.Porta ;
end;

procedure TACBrECF.SetPorta(const Value: String);
begin
  fsDevice.Porta := Value ;
end;

function TACBrECF.GetRetentar: Boolean;
begin
  result := fsECF.Retentar ;
end;

procedure TACBrECF.SetRetentar(const Value: Boolean);
begin
   fsECF.Retentar := Value ;
end;

function TACBrECF.GetTimeOut: Integer;
begin
  result := fsDevice.TimeOut ;
end;

procedure TACBrECF.SetTimeOut(const Value: Integer);
begin
   fsDevice.TimeOut := Value ;
end;

function TACBrECF.GetOperador: String;
begin
  Result := fsECF.Operador ;
end;

procedure TACBrECF.SetOperador(const Value: String);
begin
  fsECF.Operador := Value ;
end;

function TACBrECF.GetMsgAguarde: String;
begin
  result := fsECF.MsgAguarde ;
end;

procedure TACBrECF.SetMsgAguarde(const Value: String);
begin
  fsECF.MsgAguarde := Value ;
end;

function TACBrECF.GetMsgRelatorio: String;
begin
  result := fsECF.MsgRelatorio ;
end;

procedure TACBrECF.SetMsgRelatorio(const Value: String);
begin
  fsECF.MsgRelatorio := Value ;
end;

function TACBrECF.GetPausaRelatorio: Integer;
begin
  result := fsECF.PausaRelatorio ;
end;

procedure TACBrECF.SetPausaRelatorio(const Value: Integer);
begin
  fsECF.PausaRelatorio := Value ;
end;

function TACBrECF.GetLinhasEntreCupons: Integer;
begin
  result := fsECF.LinhasEntreCupons ;
end;

procedure TACBrECF.SetLinhasEntreCupons(const Value: Integer);
begin
  fsECF.LinhasEntreCupons := Value ;
end;

function TACBrECF.GetMsgPausaRelatorio: String;
begin
  result := fsECF.MsgPausaRelatorio ;
end;

procedure TACBrECF.SetMsgPausaRelatorio(const Value: String);
begin
  fsECF.MsgPausaRelatorio := Value ;
end;

function TACBrECF.GetTempoInicioMsg: Integer;
begin
  Result := fsECF.TempoInicioMsg ;
end;

procedure TACBrECF.SetTempoInicioMsg(const Value: Integer);
begin
  if Value > TimeOut then
     fsECF.TempoInicioMsg := TimeOut
  else
     fsECF.TempoInicioMsg := Value ;
end;

function TACBrECF.GetArredondaPorQtd: Boolean;
begin
  Result := fsECF.ArredondaPorQtd ;
end;

procedure TACBrECF.SetArredondaPorQtd(const Value: Boolean);
begin
  fsECF.ArredondaPorQtd := Value ;
end;

function TACBrECF.GetAguardaImpressao: Boolean;
begin
  Result := fsECF.AguardaImpressao ;
end;

procedure TACBrECF.SetAguardaImpressao(const Value: Boolean);
begin
  fsECF.AguardaImpressao := Value ;
end;

function TACBrECF.GetExibeMensagem: Boolean;
begin
  Result := fsECF.ExibeMensagem ;
end;

procedure TACBrECF.SetExibeMensagem(const Value: Boolean);
begin
  fsECF.ExibeMensagem := Value;
end;

function TACBrECF.GetBloqueiaMouseTeclado: Boolean;
begin
  Result := fsECf.BloqueiaMouseTeclado ;
end;

procedure TACBrECF.SetBloqueiaMouseTeclado(const Value: Boolean);
begin
  fsECF.BloqueiaMouseTeclado := Value;
end;

function TACBrECF.GetMsgPoucoPapel: Integer;
begin
  Result := fsECf.MsgPoucoPapel ;
end;

procedure TACBrECF.SetMsgPoucoPapel(const Value: Integer);
begin
  fsECF.MsgPoucoPapel := Value;
end;

function TACBrECF.GetDescricaoGrande: Boolean;
begin
  Result := fsECF.DescricaoGrande ;
end;

procedure TACBrECF.SetDescricaoGrande(const Value: Boolean);
begin
  fsECF.DescricaoGrande := Value ;
end;

procedure TACBrECF.SetFormMsgFonte(const Value: TFont);
begin
  fsFormMsgFont.Assign( Value ) ;
end;

function TACBrECF.GetOnMsgAguarde: TACBrECFMsgAguarde;
begin
  Result := fsECF.OnMsgAguarde ;
end;

procedure TACBrECF.SetOnMsgAguarde(const Value: TACBrECFMsgAguarde);
begin
  fsECF.OnMsgAguarde := Value ;
end;

function TACBrECF.GetOnMsgPoucoPapel: TNotifyEvent;
begin
  Result := fsECF.OnMsgPoucoPapel ;
end;

procedure TACBrECF.SetOnMsgPoucoPapel(const Value: TNotifyEvent);
begin
  fsECF.OnMsgPoucoPapel := Value ;
end;

procedure TACBrECF.SetOnAguardandoRespostaChange( const Value: TNotifyEvent);
begin
  fsECF.OnAguardandoRespostaChange := Value ;
end;

function TACBrECF.GetOnAguardandoRespostaChange: TNotifyEvent;
begin
  Result := fsECF.OnAguardandoRespostaChange ;
end;

{function TACBrECF.GetOnMsgErro: TACBrECFExibeErroEvent;
begin
  Result := fsECF.OnMsgErro ;
end;

procedure TACBrECF.SetOnMsgErro(const Value: TACBrECFExibeErroEvent);
begin
  fsECF.OnMsgErro := Value ;
end;}

function TACBrECF.TestarDialog: Boolean;
var wAtivo : Boolean ;
    wNumSerie, wNumECF, wStrDate : String ;
    WDataHora : TDateTime ;
begin
  wAtivo := Ativo ;

  try
     if not Ativo then
        Ativo := true ;

     wNumSerie := NumSerie ;
     wNumECF   := NumECF ;
     WDataHora := DataHora ;
     DateTimeToString(wStrDate,'dd/mm/yyyy hh:nn:ss ', wDataHora) ;

     MessageDlg('Impressora: '+ModeloStr+#10+
                'Versão: '+NumVersao+#10+
                'Colunas: '+IntToStr(Colunas)+#10+#10+
                'Numero de Serie: '+wNumSerie+#10+
                'Numero do ECF: '+wNumECF+#10+
                'Data / Hora: '+wStrDate,
                 mtInformation ,[mbOk],0) ;
  finally
     Result := Ativo ;
     Ativo := wAtivo ;
  end ;
end;

function TACBrECF.GetAguardandoRespostaClass: Boolean;
begin
  Result := fsECF.AguardandoResposta ;
end;

function TACBrECF.GetColunasClass: Integer;
begin
  Result := fsECF.Colunas ;
end;

function TACBrECF.GetComandoEnviadoClass: String;
begin
  Result := fsECF.ComandoEnviado ;
end;

function TACBrECF.GetRespostaComandoClass: String;
begin
  Result := fsECF.RespostaComando ;
end;

function TACBrECF.GetModeloStrClass: String;
begin
  Result := fsECF.ModeloStr ;
end;

function TACBrECF.GetDataHoraClass: TDateTime;
begin
  Result := fsECF.DataHora ;
end;

function TACBrECF.GetNumCupomClass: String;
begin
  Result := fsECF.NumCupom ;
end;

function TACBrECF.GetNumECFClass: String;
begin
  Result := fsECF.NumECF ;
end;

function TACBrECF.GetNumCROClass: String;
begin
  Result := fsECF.NumCRO ;
end;

function TACBrECF.GetNumLojaClass: String;
begin
  Result := fsECF.NumLoja ;
end;

function TACBrECF.GetNumSerieClass: String;
begin
  Result := fsECF.NumSerie ;
end;

function TACBrECF.GetNumVersaoClass: String;
begin
  Result := fsECF.NumVersao ;
end;

function TACBrECF.EmLinha(lTimeOut: Integer): Boolean;
begin
  Result := fsECF.EmLinha(lTimeOut) ;
end;

function TACBrECF.GetEstadoClass: TACBrECFEstado;
begin
  Result := fsECF.Estado ;
end;

function TACBrECF.GetPoucoPapelClass: Boolean;
begin
  Result := fsECF.PoucoPapel ;
end;

function TACBrECF.GetArredondaClass: Boolean;
begin
  Result := fsECF.Arredonda ;
end;

function TACBrECF.GetHorarioVeraoClass: Boolean;
begin
  Result := fsECF.HorarioVerao ;
end;

procedure TACBrECF.AbreCupom(CPF_CNPJ: String);
begin
  fsECF.AbreCupom( CPF_CNPJ );
end;

procedure TACBrECF.AbreGaveta;
begin
  fsECF.AbreGaveta ;
end;

procedure TACBrECF.CancelaCupom;
begin
   fsECF.CancelaCupom ;
end;

procedure TACBrECF.CancelaImpressaoCheque;
begin
  fsECF.CancelaImpressaoCheque ;
end;

procedure TACBrECF.CancelaItemVendido(NumItem: Integer);
begin
  fsECF.CancelaItemVendido( NumItem );
end;

procedure TACBrECF.CorrigeEstadoErro;
begin
  fsECF.CorrigeEstadoErro ;
end;

procedure TACBrECF.EfetuaPagamento(CodFormaPagto: String; Valor: Double;
  Observacao: String; ImprimeVinculado: Boolean);
begin
  Observacao := TrimRight(Observacao) ;
  { Tirando os Acentos e os #13 e #10 }
  Observacao := TiraAcentos( Observacao );
  Observacao := StringReplace(Observacao,CR,'',[rfReplaceAll]) ;
  Observacao := StringReplace(Observacao,LF,'',[rfReplaceAll]) ;

  Valor := RoundTo( Valor, -2) ;  { Ajustando valores acima de 2 Decimais }

  fsECF.EfetuaPagamento( CodFormaPagto, Valor, Observacao, ImprimeVinculado);
end;

function TACBrECF.EnviaComando(cmd: String ): String;
begin
  Result := fsECF.EnviaComando( cmd ) ;
end;

function TACBrECF.EnviaComando(cmd: String; lTimeOut: Integer): String;
begin
  Result := fsECF.EnviaComando( cmd, lTimeOut ) ;
end;

procedure TACBrECF.FechaCupom(Observacao: String);
begin
  if (Observacao = '') then
     Observacao := fsMensagemRodape ;
      
  { Tirando os Acentos e trocando todos os #13+#10 por #10 }
  Observacao := TiraAcentos( StringReplace(Observacao,CR+LF,#10,[rfReplaceAll]) );
  Observacao := StringReplace(Observacao,'|',#10,[rfReplaceAll]) ;

  fsECF.FechaCupom( Observacao ) ;
  
  fsMensagemRodape := '' ; 
end;

procedure TACBrECF.FechaRelatorio;
begin
  fsECF.FechaRelatorio ;
end;

procedure TACBrECF.PulaLinhas(NumLinhas: Integer);
begin
  fsECF.PulaLinhas( NumLinhas );
end;

function TACBrECF.GetChequeProntoClass: Boolean;
begin
  Result := fsECF.ChequePronto ;
end;

function TACBrECF.GetGavetaAbertaClass: Boolean;
begin
  Result := fsECF.GavetaAberta ;
end;

function TACBrECF.GetSubTotalClass: Double;
begin
  Result := fsECF.Subtotal ;
end;

function TACBrECF.GetTotalPagoClass: Double;
begin
  Result := fsECF.TotalPago ;
end;

procedure TACBrECF.ImpactoAgulhas;
begin
  fsECF.ImpactoAgulhas ;
end;

procedure TACBrECF.LeituraMemoriaFiscal(ReducaoInicial, ReducaoFinal: Integer);
begin
  fsECF.LeituraMemoriaFiscal(ReducaoInicial, ReducaoFinal);
end;

procedure TACBrECF.LeituraMemoriaFiscal(DataInicial, DataFinal: TDateTime);
begin
  fsECF.LeituraMemoriaFiscal(DataInicial, DataFinal);
end;

procedure TACBrECF.LeituraMemoriaFiscalSerial(ReducaoInicial,
   ReducaoFinal: Integer; var Linhas : TStringList );
begin
  fsECF.LeituraMemoriaFiscalSerial(ReducaoInicial, ReducaoFinal, Linhas) ;
end;

procedure TACBrECF.LeituraMemoriaFiscalSerial(DataInicial,
   DataFinal: TDateTime; var Linhas : TStringList );
begin
  fsECF.LeituraMemoriaFiscalSerial(DataInicial, DataFinal, Linhas) ;
end;

procedure TACBrECF.ImprimeCheque(Banco: String; Valor: Double; Favorecido,
  Cidade: String; Data: TDateTime; Observacao: String);
begin
  Observacao := TrimRight(Observacao) ;
  { Tirando os Acentos e os #13 e #10 }
  Observacao := TiraAcentos( Observacao );
  Observacao := StringReplace(Observacao,CR,'',[rfReplaceAll]) ;
  Observacao := StringReplace(Observacao,LF,'',[rfReplaceAll]) ;

  Valor := RoundTo( Valor, -2) ;  { Ajustando valores acima de 2 Decimais }

  fsECF.ImprimeCheque( Banco, Valor, Favorecido, Cidade, Data, Observacao );
end;

procedure TACBrECF.LeituraX;
begin
  fsECF.LeituraX ;
end;

procedure TACBrECF.MudaHorarioVerao;
begin
  fsECF.MudaHorarioVerao ;
end;

procedure TACBrECF.MudaHorarioVerao(EHorarioVerao: Boolean);
begin
  fsECF.MudaHorarioVerao(EHorarioVerao) ;
end;

procedure TACBrECF.MudaArredondamento(Arredondar: Boolean);
begin
  fsECF.MudaArredondamento(Arredondar) ;
end;

procedure TACBrECF.PreparaTEF;
begin
  fsECF.PreparaTEF ;
end;

procedure TACBrECF.ReducaoZ(DataHora: TDateTime);
begin
  fsECF.ReducaoZ( DataHora ) ;
end;

procedure TACBrECF.SubtotalizaCupom(DescontoAcrescimo: Double;
   MensagemRodape : String );
begin
  { Ajustando valores acima de 2 Decimais }
  DescontoAcrescimo := RoundTo( DescontoAcrescimo, -2) ;

  { Tirando os Acentos e trocando todos os #13+#10 por #10 }
  fsMensagemRodape := TiraAcentos( StringReplace(MensagemRodape,CR+LF,#10,[rfReplaceAll]) );
  fsMensagemRodape := StringReplace(fsMensagemRodape,'|',#10,[rfReplaceAll]) ;

  { Acumula fsMensagemRodape na memória para usar em FechaCupom. Alguns ECFs
    como a DataRegis não possuem metodo de Fechamento. O Fechamento é efetuado
    assim que o Total Pago atinge o valor do Cupom, nesse caso, a Msg de rodapé
    deve ser enviada antes dos Pagamentos } 
  
  fsECF.SubtotalizaCupom( DescontoAcrescimo, fsMensagemRodape );
end;

procedure TACBrECF.TestaPodeAbrirCupom;
begin
  fsECF.TestaPodeAbrirCupom ;
end;

procedure TACBrECF.VendeItem(Codigo, Descricao: String; AliquotaICMS : String ;
  Qtd: Double; ValorUnitario: Double; DescontoPorc: Double;
  Unidade: String);
begin
  Qtd           := RoundTo( Qtd, -3) ;  { Ajustando valores acima de 3 Decimais }
  ValorUnitario := RoundTo( ValorUnitario, -3) ;

  if Qtd <= 0 then
     raise EACBrECFCMDInvalido.Create(
           'Quantidade deve ser superior a 0.');

  if ValorUnitario <= 0 then
     raise EACBrECFCMDInvalido.Create(
           'Valor Unitario deve ser superior a 0.');

  AliquotaICMS := UpperCase( Trim(AliquotaICMS) ) ;
  if AliquotaICMS = '' then
     raise EACBrECFCMDInvalido.Create(
           'Aliquota de ICMS não pode ser vazia.');

  fsECF.VendeItem( Codigo, Descricao, AliquotaICMS, Qtd, ValorUnitario,
                   DescontoPorc, Unidade );
end;

function TACBrECF.GetAliquotasClass: TACBrECFAliquotas;
begin
  Result := fsECF.Aliquotas ;
end;

procedure TACBrECF.CarregaAliquotas;
begin
  fsECF.CarregaAliquotas ;
end;

function TACBrECF.AchaICMSAliquota(Aliquota: Double; Tipo : Char ):
   TACBrECFAliquota;
begin
  Result := fsECF.AchaICMSAliquota( Aliquota, Tipo ) ;
end;

function TACBrECF.AchaICMSIndice(Indice: String): TACBrECFAliquota;
begin
  Result := fsECF.AchaICMSIndice( Indice ) ;
end;

procedure TACBrECF.ProgramaAliquota(Aliquota: Double; Tipo: Char;
   Posicao : String);
begin
  fsECF.ProgramaAliquota(Aliquota, Tipo, Posicao);
end;

function TACBrECF.GetFormasPagamentoClass: TACBrECFFormasPagamento;
begin
  Result := fsECF.FormasPagamento ;
end;

procedure TACBrECF.CarregaFormasPagamento;
begin
  fsECF.CarregaFormasPagamento ;
end;

function TACBrECF.AchaFPGDescricao(Descricao: String): TACBrECFFormaPagamento;
begin
  Result := fsECF.AchaFPGDescricao( Descricao ) ;
end;

function TACBrECF.AchaFPGIndice(Indice: String): TACBrECFFormaPagamento;
begin
  Result := fsECF.AchaFPGIndice( Indice ) ;
end;

procedure TACBrECF.ProgramaFormaPagamento(var Descricao: String;
  PermiteVinculado: Boolean; Posicao : String);
begin
  fsECF.ProgramaFormaPagamento(Descricao, PermiteVinculado, Posicao);
end;

function TACBrECF.GetComprovantesNaoFiscaisClass: TACBrECFComprovantesNaoFiscais;
begin
  Result := fsECF.ComprovantesNaoFiscais ;
end;

procedure TACBrECF.CarregaComprovantesNaoFiscais;
begin
  fsECF.CarregaComprovantesNaoFiscais ;
end;

function TACBrECF.AchaCNFDescricao( Descricao: String):
   TACBrECFComprovanteNaoFiscal;
begin
  Result := fsECF.AchaCNFDescricao( Descricao ) ;
end;

function TACBrECF.AchaCNFIndice(
  Indice: String): TACBrECFComprovanteNaoFiscal;
begin
  Result := fsECF.AchaCNFIndice( Indice ) ;
end;

function TACBrECF.AchaCNFFormaPagamento(
  CodFPG: String): TACBrECFComprovanteNaoFiscal;
begin
  Result := fsECF.AchaCNFFormaPagamento( CodFPG ) ;
end;

procedure TACBrECF.ProgramaComprovanteNaoFiscal(var Descricao: String;
  Tipo: String; Posicao : String);
begin
  fsECF.ProgramaComprovanteNaoFiscal(Descricao, Tipo, Posicao);
end;


function TACBrECF.AchaUMDDescricao(
  Descricao: String): TACBrECFUnidadeMedida;
begin
  Result := fsECF.AchaUMDDescricao( Descricao ) ;
end;

function TACBrECF.AchaUMDIndice(Indice: String): TACBrECFUnidadeMedida;
begin
  Result := fsECF.AchaUMDIndice( Indice ) ;
end;

procedure TACBrECF.CarregaUnidadesMedida;
begin
  fsECF.CarregaUnidadesMedida ;
end;

function TACBrECF.GetUnidadesMedidaClass: TACBrECFUnidadesMedida;
begin
Result := fsECF.UnidadesMedida ;
end;

procedure TACBrECF.ProgramaUnidadeMedida(var Descricao: String);
begin
  fsECF.ProgramaUnidadeMedida(Descricao);
end;

procedure TACBrECF.RelatorioGerencial(Relatorio: TStrings; Vias: Integer);
begin
  fsECF.RelatorioGerencial( Relatorio, Vias ) ;
end;

procedure TACBrECF.AbreRelatorioGerencial;
begin
  fsECF.AbreRelatorioGerencial ;
end;

procedure TACBrECF.LinhaRelatorioGerencial(Linha: String);
begin
  fsECF.LinhaRelatorioGerencial( Linha );
end;

procedure TACBrECF.CupomVinculado(COO, CodFormaPagto: String;
  Valor: Double; Relatorio: TStrings; Vias: Integer);
begin
  Valor := RoundTo( Valor, -2) ;  { Ajustando valores acima de 2 Decimais }

  fsECF.CupomVinculado( COO, CodFormaPagto, '' , Valor, Relatorio, Vias );
end;

procedure TACBrECF.CupomVinculado(COO, CodFormaPagto,
  CodComprovanteNaoFiscal: String; Valor: Double; Relatorio: TStrings;
  Vias: Integer);
begin
  Valor := RoundTo( Valor, -2) ;  { Ajustando valores acima de 2 Decimais }

  fsECF.CupomVinculado( COO, CodFormaPagto, CodComprovanteNaoFiscal, Valor,
                        Relatorio, Vias );
end;

procedure TACBrECF.AbreCupomVinculado(COO, CodFormaPagto: String;
   Valor: Double);
begin
  Valor := RoundTo( Valor, -2) ;  { Ajustando valores acima de 2 Decimais }
  
  fsECF.AbreCupomVinculado( COO, CodFormaPagto, '', Valor);
end;

procedure TACBrECF.AbreCupomVinculado(COO, CodFormaPagto,
  CodComprovanteNaoFiscal: String; Valor: Double);
begin
  Valor := RoundTo( Valor, -2) ;  { Ajustando valores acima de 2 Decimais }

  fsECF.AbreCupomVinculado( COO, CodFormaPagto, CodComprovanteNaoFiscal, Valor);
end;

procedure TACBrECF.LinhaCupomVinculado(Linha: String);
begin
  fsECF.LinhaCupomVinculado( Linha );
end;


{------------------------------------------------------------------------------}
function TACBrECF.AcharECF( ProcuraModelo : Boolean; ProcuraPorta  : Boolean;
                            ATimeOut : Integer) : Boolean ;
Var I : Integer ;
begin
  Result := false ;
  if fsProcurandoECF then exit ; { para evitar chamadas recursivas }

  if not (ProcuraModelo or ProcuraPorta) then exit ; { nada a fazer }

  if ProcuraPorta then
     Porta := 'procurar' ;

  try
     fsProcurandoECF := true ;

     if not ProcuraModelo then
        Result := AcharPorta(ATimeOut)
     else
      begin
        For I := 2 to Integer(High(TACBrECFModelo)) do { Pula ecfNenhum, ecfNaoFiscal }
        begin
           try
              if not fsProcurandoECF then
                 break ;

              Modelo := TACBrECFModelo( I ) ;

              if AcharPorta( ATimeOut ) then
              begin
                 Result := true ;
                 Break ;
              end ;
           except
           end ;
        end ;
      end
  finally
     fsProcurandoECF := false ;
     Desativar ;
     if (not Result) and ProcuraModelo then
        Modelo := ecfNenhum ;
  end ;
end;

function TACBrECF.AcharPorta(ATimeOut : Integer): Boolean;
Var wPorta : String ;
    wTimeOut  : Integer ;
    wRetentar : Boolean ;
begin
  Result := false ;
  if fsProcurandoPorta then exit ;  { para evitar chamadas recursivas }

  if fsModelo = ecfNenhum then
     raise Exception.Create('Modelo não definido');

  if Modelo = ecfNaoFiscal then
     raise Exception.Create('Modelo: '+ModeloStr+
           ' não consegue efetuar busca automática de Porta'+sLineBreak+
           'Favor definir a Porta Ex:(COM1, LPT1, /dev/lp0, etc)');

  wPorta   := Porta ;
  wTimeOut := TimeOut ;
  wRetentar:= ReTentar ;
  try
     fsProcurandoPorta := true ;
     ReTentar := false ;
     if ATimeOut <> 0 then
        TimeOut := ATimeOut ;

     fsECF.FormMsgControla := False ;
     fsECF.FormMsgDoProcedure( DoAcharPorta, ord('C') ) ;

     if Porta = 'abortado' then
     begin
        Porta := '' ;
        fsProcurandoECF := false ;
     end ;

     Result := (Porta <> '') ;
  finally
     fsECF.FormMsgControla := True ;
     fsProcurandoPorta := false ;
     TimeOut := wTimeOut ;
     Retentar:= wReTentar ;
     if not Result then
     begin
        Desativar ;
        Porta := wPorta ;
     end ;
  end ;
end;

{------------------------------------------------------------------------------}
procedure TACBrECF.DoAcharPorta ;
  Function AtivarECF : Boolean ;
    Var Msg : String ;

  begin
     Result := false ;
     try
        Desativar ;
        try
           Device.Serial.Purge ;
        except
        end ;
        Msg := 'Procurando por ECF: '+ModeloStr+' na porta: '+Porta ;
        if (ExibeMensagem or BloqueiaMouseTeclado) then
           Msg := Msg {$IFDEF VisualCLX}+sLineBreak{$ENDIF} +
                  ' Pressione <C> para cancelar' ;

        fsECF.FormMsgPinta( Msg ) ;
        if  not (fsECF.FormMsgEstado = fmsProcessando) then exit ;

        Ativar ;      { Se não Ativar gera uma Exceção }
        Result := true ;
     except
     end ;
  end ;

Var I : Integer ;
    Achou : Boolean ;
begin
  Achou := false ;
  
  if (Porta = '') or (LowerCase(Porta) = 'procurar') then
   begin
     I := 1 ;
     { Procura de COM1 a COM6 }
     while (I < 7) and (not Achou) and (fsECF.FormMsgEstado = fmsProcessando) do
     begin
        Porta := 'COM'+IntToStr(I) ;
        Achou := AtivarECF ;
        Inc( I ) ;
     end ;
   end
  else
     Achou := AtivarECF ;

  if not Achou then
  begin
     sleep(200) ;
     if fsECF.FormMsgEstado = fmsAbortado then
        Porta := 'abortado'
     else
        Porta := '' ;
  end ;
end;

end.

