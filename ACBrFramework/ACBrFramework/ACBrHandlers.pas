unit ACBrHandlers;

{$mode delphi}

interface

uses
  Classes, SysUtils, ACBrBase, ACBrDevice, ACBrECF, ACBrRFD, ACBrPAF, ACBrBal,
  ACBrLCB, ACBrAAC, ACBrEAD, ACBrSintegra, ACBrSpedFiscal, ACBrTEFD,
  ACBrTEFDClass, ACBrTEFDCliSiTef, ACBrCNIEE, ACBrSMS, ACBrSMSClass, ACBrIBGE,
  ACBrValidador, ACBrCEP, ACBrLFD, ACBrPosPrinter, ACBrETQ, ACBrUtil;

{%region Ponteiros de função para uso nos eventos}

{ Ponteiros de função para uso nos eventos}
type
  TLogCallback = function(const ALogLine: string): boolean; cdecl;

type
  TConstStringRetStringCallback = function(const Linha: PChar): PChar; cdecl;

type
  TRetStringCallback = function(): PChar; cdecl;

type
  TConstStringCallback = procedure(const str: PChar); cdecl;

type
  TNoArgumentsCallback = procedure(); cdecl;

type
  TAbreCupomCallback = procedure(const CPF_CNPJ, Nome, Endereco: PChar); cdecl;

type
  TIntegerCallback = procedure(const Indice: integer); cdecl;

type
  TEfetuaPagamentoCallback = procedure(const CodFormaPagto: PChar;
    const Valor: double; const Observacao: PChar;
    const ImprimeVinculado: boolean); cdecl;

type
  TFechaCupomCallback = procedure(const Observacao: PChar;
    const IndiceBMP: integer); cdecl;

type
  TSangriaSuprimentoCallback = procedure(const Valor: double;
    const Obs, DescricaoCNF, DescricaoFPG: PChar); cdecl;

type
  TSubtotalizaCupomCallback = procedure(const DescontoAcrescimo: double;
    const MensagemRodape: PChar); cdecl;

type
  TVendeItemCallback = procedure(const Codigo, Descricao, AliquotaICMS: PChar;
    const Qtd, ValorUnitario, ValorDescontoAcrescimo: double;
    const Unidade, TipoDescontoAcrescimo, DescontoAcrescimo: PChar); cdecl;

type
  TBobinaProcedureCallback = procedure(const Linhas: PChar;
    const Operacao: PChar); cdecl;

type
  TChangeEstadoCallback = procedure(const EstadoAnterior, EstadoAtual: integer); cdecl;

type
  TChequeEstadoCallback = function(const EstadoAtual: integer): boolean; cdecl;

type
  TBooleanCallback = function(): boolean; cdecl;

type
  TErrorRelatorioCallback = function(const Indice: integer): boolean; cdecl;

type
  TStringCallback = procedure(Mensagem: PChar); cdecl;

type
  TMsgRetentarCallback = function(const Mensagem, Situacao: PChar): boolean; cdecl;

type
  TLePesoCallback = procedure(const Value: double); cdecl;

type
  TCryptCallback = function(Value: PChar): PChar; cdecl;

type
  TVerificarRecomporNumSerieCallback = procedure(const NumSerie: string;
    const ValorGT: double; var CRO, CNI: integer); cdecl;

type
  TVerificarRecomporValorGTCallback = procedure(const NumSerie: PChar;
    var gt: double); cdecl;

type
  TAguardaRespCallback = procedure(const Arquivo: PChar;
    const SegundosTimeOut: integer; var Interromper: boolean); cdecl;

type
  TExibeMsgCallback = procedure(const Operacao: integer; const Mensagem: PChar;
    var AModalResult: TModalResult); cdecl;

type
  TBloqueiaMouseTecladoCallback = procedure(const Bloqueia: boolean;
    var Tratado: boolean); cdecl;

type
  TExecutaAcaoCallback = procedure(var Tratado: boolean); cdecl;

type
  TComandaECFCallback = procedure(const Operacao: integer;
    const Resp: TACBrTEFDResp; var RetornoECF: integer); cdecl;

type
  TComandaECFSubtotalizaCallback = procedure(const DescAcre: double;
    var RetornoECF: integer); cdecl;

type
  TComandaECFPagamentoCallback = procedure(const IndiceECF: PChar;
    const Valor: double; var RetornoECF: integer); cdecl;

type
  TComandaECFAbreVinculadoCallback = procedure(const COO: PChar;
    const IndiceECF: PChar; const Valor: double; var RetornoECF: integer); cdecl;

type
  TComandaECFImprimeViaCallback = procedure(const TipoRelatorio: integer;
    const Via: integer; const ImagemComprovante: array of PChar;
    const ImagemComprovanteCount: integer; var RetornoECF: integer); cdecl;

type
  TInfoECFCallback = procedure(const Operacao: integer; const RetornoECF: PChar;
    const RetornoECFLen: integer); cdecl;

type
  TAntesFinalizarRequisicaoCallback = procedure(const Req: TACBrTEFDReq); cdecl;

type
  TDepoisConfirmarTransacoes = procedure(
    const RespostasPendentes: TACBrTEFDRespostasPendentes); cdecl;

type
  TAntesCancelarTransacaoCallback = procedure(const RespostaPendente: TACBrTEFDResp);
    cdecl;

type
  TDepoisCancelarTransacoesCallback = procedure(
    const RespostasPendentes: TACBrTEFDRespostasPendentes); cdecl;

type
  TMudaEstadoReqCallback = procedure(const EstadoReq: integer); cdecl;

type
  TMudaEstadoRespCallback = procedure(const EstadoResp: integer); cdecl;

type
  TTEFCliSiTefExibeMenuCallback = procedure(const Titulo: PChar;
    const Opcoes: array of PChar; const OpcoesCount: integer;
    var ItemSelecionado: integer; var VoltarMenu: boolean); cdecl;

type
  TTEFCliSiTefObtemCampoCalback = procedure(const Titulo: PChar;
    const TamanhoMinimo: integer; const TamanhoMaximo: integer;
    const TipoCampo: integer; Operacao: TACBrTEFDCliSiTefOperacaoCampo;
    const Resposta: PChar; const RespLen: integer; var Digitado: boolean;
    var VoltarMenu: boolean); cdecl;

type
  TTEFVeSPagueExibeMenuCallback = procedure(const Titulo: PChar;
    const Opcoes: array of PChar; const OpcoesCount: integer;
    const Memo: array of PChar; const MemoCount: integer;
    var ItemSelecionado: integer); cdecl;

type
  TTEFVeSPagueObtemCampoCalback = procedure(const Titulo: PChar;
    const Mascara: PChar; const Tipo: char; var Resposta: PChar;
    var Digitado: boolean); cdecl;

type
  TOnProgressoCallback = procedure(const AAtual, ATotal: integer); cdecl;

{%endregion}

{%region ACBrDevice}

{Classe que armazena os EventHandlers para o componente ACBr}
type
  TEventHandlersDEV = class
  end;

{Handle para o componente TACBrDevice }
type
  TDeviceHandle = record
    UltimoErro: string;
    Component: TACBrComponent;
    EventHandlers: TEventHandlersDEV;
  end;

{Ponteiro para o Handle }
type
  PDeviceHandle = ^TDeviceHandle;

{%endregion ACBrDevice}

{%region ACBrECF}

{%region Classe que armazena os EventHandlers para o componente ACBr}

type
  TEventHandlersECF = class

    OnMsgPoucoPapelCallback: TNoArgumentsCallback;
    OnAguardandoRespostaChangeCallback: TNoArgumentsCallback;

    OnAntesAbreCupomCallback: TAbreCupomCallback;
    OnAntesAbreCupomVinculadoCallback: TNoArgumentsCallback;
    OnAntesAbreNaoFiscalCallback: TAbreCupomCallback;
    OnAntesAbreRelatorioGerencialCallback: TIntegerCallback;
    OnAntesCancelaCupomCallback: TNoArgumentsCallback;
    OnAntesCancelaItemNaoFiscalCallback: TIntegerCallback;
    OnAntesCancelaItemVendidoCallback: TIntegerCallback;
    OnAntesCancelaNaoFiscalCallback: TNoArgumentsCallback;
    OnAntesEfetuaPagamentoCallback: TEfetuaPagamentoCallback;
    OnAntesEfetuaPagamentoNaoFiscalCallback: TEfetuaPagamentoCallback;
    OnAntesFechaCupomCallback: TFechaCupomCallback;
    OnAntesFechaNaoFiscalCallback: TFechaCupomCallback;
    OnAntesFechaRelatorioCallback: TNoArgumentsCallback;
    OnAntesLeituraXCallback: TNoArgumentsCallback;
    OnAntesReducaoZCallback: TNoArgumentsCallback;
    OnAntesSangriaCallback: TSangriaSuprimentoCallback;
    OnAntesSubtotalizaCupomCallback: TSubtotalizaCupomCallback;
    OnAntesSubtotalizaNaoFiscalCallback: TSubtotalizaCupomCallback;
    OnAntesSuprimentoCallback: TSangriaSuprimentoCallback;
    OnAntesVendeItemCallback: TVendeItemCallback;

    OnBobinaAdicionaLinhasCallback: TBobinaProcedureCallback;
    OnChangeEstadoCallback: TChangeEstadoCallback;
    OnChequeEstadoCallback: TChequeEstadoCallback;

    OnDepoisAbreCupomCallback: TAbreCupomCallback;
    OnDepoisAbreCupomVinculadoCallback: TNoArgumentsCallback;
    OnDepoisAbreNaoFiscalCallback: TAbreCupomCallback;
    OnDepoisAbreRelatorioGerencialCallback: TIntegerCallback;
    OnDepoisCancelaCupomCallback: TNoArgumentsCallback;
    OnDepoisCancelaItemNaoFiscalCallback: TIntegerCallback;
    OnDepoisCancelaItemVendidoCallback: TIntegerCallback;
    OnDepoisCancelaNaoFiscalCallback: TNoArgumentsCallback;
    OnDepoisEfetuaPagamentoCallback: TEfetuaPagamentoCallback;
    OnDepoisEfetuaPagamentoNaoFiscalCallback: TEfetuaPagamentoCallback;
    OnDepoisFechaCupomCallback: TFechaCupomCallback;
    OnDepoisFechaNaoFiscalCallback: TFechaCupomCallback;
    OnDepoisFechaRelatorioCallback: TNoArgumentsCallback;
    OnDepoisLeituraXCallback: TNoArgumentsCallback;
    OnDepoisReducaoZCallback: TNoArgumentsCallback;
    OnDepoisSangriaCallback: TSangriaSuprimentoCallback;
    OnDepoisSubtotalizaCupomCallback: TSubtotalizaCupomCallback;
    OnDepoisSubtotalizaNaoFiscalCallback: TSubtotalizaCupomCallback;
    OnDepoisSuprimentoCallback: TSangriaSuprimentoCallback;
    OnDepoisVendeItemCallback: TVendeItemCallback;

    OnErrorAbreCupomCallback: TBooleanCallback;
    OnErrorAbreCupomVinculadoCallback: TBooleanCallback;
    OnErrorAbreNaoFiscalCallback: TBooleanCallback;
    OnErrorAbreRelatorioGerencialCallback: TErrorRelatorioCallback;
    OnErrorCancelaCupomCallback: TBooleanCallback;
    OnErrorCancelaItemNaoFiscalCallback: TBooleanCallback;
    OnErrorCancelaItemVendidoCallback: TBooleanCallback;
    OnErrorCancelaNaoFiscalCallback: TBooleanCallback;
    OnErrorEfetuaPagamentoCallback: TBooleanCallback;
    OnErrorEfetuaPagamentoNaoFiscalCallback: TBooleanCallback;
    OnErrorFechaCupomCallback: TBooleanCallback;
    OnErrorFechaNaoFiscalCallback: TBooleanCallback;
    OnErrorFechaRelatorioCallback: TBooleanCallback;
    OnErrorLeituraXCallback: TBooleanCallback;
    OnErrorReducaoZCallback: TBooleanCallback;
    OnErrorSangriaCallback: TBooleanCallback;
    OnErrorSemPapelCallback: TNoArgumentsCallback;
    OnErrorSubtotalizaCupomCallback: TBooleanCallback;
    OnErrorSubtotalizaNaoFiscalCallback: TBooleanCallback;
    OnErrorSuprimentoCallback: TBooleanCallback;
    OnErrorVendeItemCallback: TBooleanCallback;

    OnMsgAguardeCallback: TStringCallback;
    OnMsgRetentarCallback: TMsgRetentarCallback;
    OnPAFCalcEADCallback: TStringCallback;
    OnPAFGetKeyRSACallback: TRetStringCallback;

    procedure OnMsgPoucoPapel(Sender: TObject);
    procedure OnAguardandoRespostaChange(Sender: TObject);

    procedure OnAntesAbreCupom(const CPF_CNPJ, Nome, Endereco: string);
    procedure OnAntesAbreCupomVinculado(Sender: TObject);
    procedure OnAntesAbreNaoFiscal(const CPF_CNPJ, Nome, Endereco: string);
    procedure OnAntesAbreRelatorioGerencial(const Indice: integer);
    procedure OnAntesCancelaCupom(Sender: TObject);
    procedure OnAntesCancelaItemNaoFiscal(const NumItem: integer);
    procedure OnAntesCancelaItemVendido(const NumItem: integer);
    procedure OnAntesCancelaNaoFiscal(Sender: TObject);
    procedure OnAntesEfetuaPagamento(const CodFormaPagto: string;
      const Valor: double; const Observacao: ansistring;
      const ImprimeVinculado: boolean);
    procedure OnAntesEfetuaPagamentoNaoFiscal(const CodFormaPagto: string;
      const Valor: double; const Observacao: ansistring;
      const ImprimeVinculado: boolean);
    procedure OnAntesFechaCupom(const Observacao: ansistring; const IndiceBMP: integer);
    procedure OnAntesFechaNaoFiscal(const Observacao: ansistring;
      const IndiceBMP: integer);
    procedure OnAntesFechaRelatorio(Sender: TObject);
    procedure OnAntesLeituraX(Sender: TObject);
    procedure OnAntesReducaoZ(Sender: TObject);
    procedure OnAntesSangria(const Valor: double; const Obs: ansistring;
      const DescricaoCNF, DescricaoFPG: string);
    procedure OnAntesSubtotalizaCupom(const DescontoAcrescimo: double;
      const MensagemRodape: ansistring);
    procedure OnAntesSubtotalizaNaoFiscal(const DescontoAcrescimo: double;
      const MensagemRodape: ansistring);
    procedure OnAntesSuprimento(const Valor: double; const Obs: ansistring;
      const DescricaoCNF, DescricaoFPG: string);
    procedure OnAntesVendeItem(const Codigo, Descricao, AliquotaICMS: string;
      const Qtd, ValorUnitario, ValorDescontoAcrescimo: double;
      const Unidade, TipoDescontoAcrescimo, DescontoAcrescimo: string);

    procedure OnBobinaAdicionaLinhas(const Linhas: string; const Operacao: string);
    procedure OnChangeEstado(const EstadoAnterior, EstadoAtual: TACBrECFEstado);
    procedure OnChequeEstado(const EstadoAtual: TACBrECFCHQEstado;
      var Continuar: boolean);

    procedure OnDepoisAbreCupom(const CPF_CNPJ, Nome, Endereco: string);
    procedure OnDepoisAbreCupomVinculado(Sender: TObject);
    procedure OnDepoisAbreNaoFiscal(const CPF_CNPJ, Nome, Endereco: string);
    procedure OnDepoisAbreRelatorioGerencial(const Indice: integer);
    procedure OnDepoisCancelaCupom(Sender: TObject);
    procedure OnDepoisCancelaItemNaoFiscal(const NumItem: integer);
    procedure OnDepoisCancelaItemVendido(const NumItem: integer);
    procedure OnDepoisCancelaNaoFiscal(Sender: TObject);
    procedure OnDepoisEfetuaPagamento(const CodFormaPagto: string;
      const Valor: double; const Observacao: ansistring;
      const ImprimeVinculado: boolean);
    procedure OnDepoisEfetuaPagamentoNaoFiscal(const CodFormaPagto: string;
      const Valor: double; const Observacao: ansistring;
      const ImprimeVinculado: boolean);
    procedure OnDepoisFechaCupom(const Observacao: ansistring; const IndiceBMP: integer);
    procedure OnDepoisFechaNaoFiscal(const Observacao: ansistring;
      const IndiceBMP: integer);
    procedure OnDepoisFechaRelatorio(Sender: TObject);
    procedure OnDepoisLeituraX(Sender: TObject);
    procedure OnDepoisReducaoZ(Sender: TObject);
    procedure OnDepoisSangria(const Valor: double; const Obs: ansistring;
      const DescricaoCNF, DescricaoFPG: string);
    procedure OnDepoisSubtotalizaCupom(const DescontoAcrescimo: double;
      const MensagemRodape: ansistring);
    procedure OnDepoisSubtotalizaNaoFiscal(const DescontoAcrescimo: double;
      const MensagemRodape: ansistring);
    procedure OnDepoisSuprimento(const Valor: double; const Obs: ansistring;
      const DescricaoCNF, DescricaoFPG: string);
    procedure OnDepoisVendeItem(const Codigo, Descricao, AliquotaICMS: string;
      const Qtd, ValorUnitario, ValorDescontoAcrescimo: double;
      const Unidade, TipoDescontoAcrescimo, DescontoAcrescimo: string);

    procedure OnErrorAbreCupom(var Tratado: boolean);
    procedure OnErrorAbreCupomVinculado(var Tratado: boolean);
    procedure OnErrorAbreNaoFiscal(var Tratado: boolean);
    procedure OnErrorAbreRelatorioGerencial(var Tratado: boolean; const Indice: integer);
    procedure OnErrorCancelaCupom(var Tratado: boolean);
    procedure OnErrorCancelaItemNaoFiscal(var Tratado: boolean);
    procedure OnErrorCancelaItemVendido(var Tratado: boolean);
    procedure OnErrorCancelaNaoFiscal(var Tratado: boolean);
    procedure OnErrorEfetuaPagamento(var Tratado: boolean);
    procedure OnErrorEfetuaPagamentoNaoFiscal(var Tratado: boolean);
    procedure OnErrorFechaCupom(var Tratado: boolean);
    procedure OnErrorFechaNaoFiscal(var Tratado: boolean);
    procedure OnErrorFechaRelatorio(var Tratado: boolean);
    procedure OnErrorLeituraX(var Tratado: boolean);
    procedure OnErrorReducaoZ(var Tratado: boolean);
    procedure OnErrorSangria(var Tratado: boolean);
    procedure OnErrorSemPapel(Sender: TObject);
    procedure OnErrorSubtotalizaCupom(var Tratado: boolean);
    procedure OnErrorSubtotalizaNaoFiscal(var Tratado: boolean);
    procedure OnErrorSuprimento(var Tratado: boolean);
    procedure OnErrorVendeItem(var Tratado: boolean);

    procedure OnMsgAguarde(const Mensagem: string);
    procedure OnMsgRetentar(const Mensagem: string; const Situacao: string;
      var Result: boolean);
    procedure OnPAFCalcEAD(Arquivo: string);
    procedure OnPAFGetKeyRSA(var Chave: ansistring);

  end;

{%endregion}

{Handle para o componente TACBrECF }
type
  TECFHandle = record
    UltimoErro: string;
    ECF: TACBrECF;
    EventHandlers: TEventHandlersECF;
  end;

{Ponteiro para o Handle }
type
  PECFHandle = ^TECFHandle;

{%endregion}

{%region ACBrRFD}

{Classe que armazena os EventHandlers para o componente ACBr}
type
  TEventHandlersRFD = class

    OnCalcEADCallback: TStringCallback;
    OnCalcHashLogCallback: TConstStringRetStringCallback;
    OnGetKeyHashLogCallback: TRetStringCallback;
    OnGetKeyRSACallback: TRetStringCallback;

    procedure OnCalcEAD(Arquivo: string);
    procedure OnCalcHashLog(const Linha: string; var Hash: string);
    procedure OnGetKeyHashLog(var Chave: string);
    procedure OnGetKeyRSA(var Chave: ansistring);

  end;

{Handle para o componente TACBrRFD}
type
  TRFDHandle = record
    UltimoErro: string;
    RFD: TACBrRFD;
    EventHandlers: TEventHandlersRFD;
  end;

{Ponteiro para o Handle }
type
  PRFDHandle = ^TRFDHandle;

{%endregion}

{%region ACBrPAF}

{Classe que armazena os EventHandlers para o componente ACBr}
type
  TEventHandlersPAF = class
    ChaveRSA: ansistring;
    OnGetChaveRSACallback: TRetStringCallback;
    procedure GetChaveRSA(var Chave: ansistring);
  end;

{Handle para o componente TACBrPAF }
type
  TPAFHandle = record
    UltimoErro: string;
    PAF: TACBrPAF;
    EventHandlers: TEventHandlersPAF;
  end;

{Ponteiro para o Handle }
type
  PPAFHandle = ^TPAFHandle;

{%endregion}

{%region ACBrBAL}

{Classe que armazena os EventHandlers para o componente ACBr}
type
  TEventHandlersBAL = class
    OnLePesoCallback: TLePesoCallback;
    procedure OnLePeso(Peso: double; Resposta: ansistring);
  end;

{Handle para o componente TACBrBAL }
type
  TBALHandle = record
    UltimoErro: string;
    BAL: TACBrBAL;
    EventHandlers: TEventHandlersBAL;
  end;

{Ponteiro para o Handle}
type
  PBALHandle = ^TBALHandle;

{%endregion}

{%region ACBrLCB}

{ Classe que armazena os ponteiros de função para os Handlers }
type
  TEventHandlersLCB = class
    OnLeCodigoCallback: TNoArgumentsCallback;
    OnLeFilaCallback: TNoArgumentsCallback;
    procedure OnLeCodigo(Sender: TObject);
    procedure OnLeFila(Sender: TObject);
  end;

{Handle para o componente TACBrLCB }
type
  TLCBHandle = record
    UltimoErro: string;
    LCB: TACBrLCB;
    EventHandlers: TEventHandlersLCB;
  end;

{Ponteiro para o Handle}
type
  PLCBHandle = ^TLCBHandle;

{%endregion}

{%region ACBrAAC}

{Classe para armazenar EventHandlers do componente }
type
  TEventHandlersAAC = class

    ChaveCriptografia: string;

    OnAntesAbrirArquivoCallback: TBooleanCallback;
    OnAntesGravarArquivoCallback: TBooleanCallback;
    OnCryptCallback: TCryptCallback;
    OnDeCryptCallback: TCryptCallback;
    OnDepoisAbrirArquivoCallback: TNoArgumentsCallback;
    OnDepoisGravarArquivoCallback: TNoArgumentsCallback;
    OnGetChaveCallback: TRetStringCallback;
    VerificarRecomporNumSerieCallback: TVerificarRecomporNumSerieCallback;
    VerificarRecomporValorGTCallback: TVerificarRecomporValorGTCallback;

    procedure OnAntesAbrirArquivo(var Continua: boolean);
    procedure OnAntesGravarArquivo(var Continua: boolean);
    procedure OnCrypt(ConteudoArquivo: ansistring; var Resposta: ansistring);
    procedure OnDeCrypt(ConteudoCriptografado: ansistring; var Resposta: ansistring);
    procedure OnDepoisAbrirArquivo(Sender: TObject);
    procedure OnDepoisGravarArquivo(Sender: TObject);
    procedure OnGetChave(var Chave: ansistring);
    procedure VerificarRecomporNumSerie(const NumSerie: string;
      const ValorGT: double; var CRO: integer; var CNI: integer);
    procedure VerificarRecomporValorGT(const NumSerie: string; var ValorGT: double);
  end;

{Handle para o componente TACBrAAC}
type
  TAACHandle = record
    UltimoErro: string;
    AAC: TACBrAAC;
    EventHandlers: TEventHandlersAAC;
  end;

{Ponteiro para o Handle }
type
  PAACHandle = ^TAACHandle;

{%endregion ACBrAAC}

{%region ACBrEAD}

{Classe que armazena os EventHandlers para o componente ACBr}
type
  TEventHandlersEAD = class
    ChavePrivada: ansistring;
    ChavePublica: ansistring;
    OnGetChavePrivadaCallback: TRetStringCallback;
    OnGetChavePublicaCallback: TRetStringCallback;
    procedure GetChavePrivada(var Chave: ansistring);
    procedure GetChavePublica(var Chave: ansistring);
  end;

{Handle para o componente TACBrEAD }
type
  TEADHandle = record
    UltimoErro: string;
    EAD: TACBrEAD;
    EventHandlers: TEventHandlersEAD;
  end;

{Ponteiro para o Handle }
type
  PEADHandle = ^TEADHandle;

{%endregion}

{%region ACBrSintegra}

{Classe que armazena os EventHandlers para o componente ACBr}
type
  TEventHandlersSIN = class
  end;

{Handle para o componente TACBrSintegra }
type
  TSintegraHandle = record
    UltimoErro: string;
    Sintegra: TACBrSintegra;
    EventHandlers: TEventHandlersSIN;
  end;

{Ponteiro para o Handle }
type
  PSINHandle = ^TSintegraHandle;

{%endregion ACBrSintegra}

{%region ACBrSpedFiscal}

{Classe que armazena os EventHandlers para o componente ACBr}
type
  TEventHandlersSPDF = class
    OnErrorCallback: TStringCallback;
    procedure OnError(const MsnError: ansistring);
  end;

{Handle para o componente TACBrSPEDFiscal}
type
  TSPDFHandle = record
    UltimoErro: string;
    SPEDFiscal: TACBrSPEDFiscal;
    EventHandlers: TEventHandlersSPDF;
  end;

{Ponteiro para o Handle }
type
  PSPDFHandle = ^TSPDFHandle;

{%endregion ACBrSpedFiscal}

{%region ACBrTEFD}

{%region Classe que armazena os EventHandlers para o componente ACBr}

type
  TEventHandlersTEF = class

    OnAguardaRespCallback: TAguardaRespCallback;
    OnExibeMsgCallback: TExibeMsgCallback;
    OnBloqueiaMouseTecladoCallback: TBloqueiaMouseTecladoCallback;
    OnRestauraFocoAplicacaoCallback: TExecutaAcaoCallback;
    OnLimpaTecladoCallback: TExecutaAcaoCallback;
    OnComandaECFCallback: TComandaECFCallback;
    OnComandaECFSubtotalizaCallback: TComandaECFSubtotalizaCallback;
    OnComandaECFPagamentoCallback: TComandaECFPagamentoCallback;
    OnComandaECFAbreVinculadoCallback: TComandaECFAbreVinculadoCallback;
    OnComandaECFImprimeViaCallback: TComandaECFImprimeViaCallback;
    OnInfoECFCallback: TInfoECFCallback;
    OnAntesFinalizarRequisicaoCallback: TAntesFinalizarRequisicaoCallback;
    OnDepoisConfirmarTransacoesCallback: TDepoisConfirmarTransacoes;
    OnAntesCancelarTransacaoCallback: TAntesCancelarTransacaoCallback;
    OnDepoisCancelarTransacoesCallback: TDepoisCancelarTransacoesCallback;
    OnMudaEstadoReqCallback: TMudaEstadoReqCallback;
    OnMudaEstadoRespCallback: TMudaEstadoRespCallback;

    OnTEFCliSiTefExibeMenuCallback: TTEFCliSiTefExibeMenuCallback;
    OnTEFCliSiTefObtemCampoCalback: TTEFCliSiTefObtemCampoCalback;

    OnTEFVeSPagueExibeMenuCallback: TTEFVeSPagueExibeMenuCallback;
    OnTEFVeSPagueObtemCampoCalback: TTEFVeSPagueObtemCampoCalback;

    procedure OnAguardaResp(Arquivo: string; SegundosTimeOut: integer;
      var Interromper: boolean);
    procedure OnExibeMsg(Operacao: TACBrTEFDOperacaoMensagem;
      Mensagem: string; var AModalResult: TModalResult);
    procedure OnBloqueiaMouseTeclado(Bloqueia: boolean; var Tratado: boolean);
    procedure OnRestauraFocoAplicacao(var Tratado: boolean);
    procedure OnLimpaTeclado(var Tratado: boolean);
    procedure OnComandaECF(Operacao: TACBrTEFDOperacaoECF; Resp: TACBrTEFDResp;
      var RetornoECF: integer);
    procedure OnComandaECFSubtotaliza(DescAcre: double; var RetornoECF: integer);
    procedure OnComandaECFPagamento(IndiceECF: string; Valor: double;
      var RetornoECF: integer);
    procedure OnComandaECFAbreVinculado(COO, IndiceECF: string;
      Valor: double; var RetornoECF: integer);
    procedure OnComandaECFImprimeVia(TipoRelatorio: TACBrTEFDTipoRelatorio;
      Via: integer; ImagemComprovante: TStringList; var RetornoECF: integer);
    procedure OnInfoECF(Operacao: TACBrTEFDInfoECF; var RetornoECF: string);
    procedure OnAntesFinalizarRequisicao(Req: TACBrTEFDReq);
    procedure OnDepoisConfirmarTransacoes(RespostasPendentes:
      TACBrTEFDRespostasPendentes);
    procedure OnAntesCancelarTransacao(RespostaPendente: TACBrTEFDResp);
    procedure OnDepoisCancelarTransacoes(RespostasPendentes:
      TACBrTEFDRespostasPendentes);
    procedure OnMudaEstadoReq(EstadoReq: TACBrTEFDReqEstado);
    procedure OnMudaEstadoResp(EstadoResp: TACBrTEFDRespEstado);

    procedure OnTEFCliSiTefExibeMenu(Titulo: string; Opcoes: TStringList;
      var ItemSelecionado: integer; var VoltarMenu: boolean);
    procedure OnTEFCliSiTefObtemCampo(Titulo: string;
      TamanhoMinimo, TamanhoMaximo: integer; TipoCampo: integer;
      Operacao: TACBrTEFDCliSiTefOperacaoCampo; var Resposta: ansistring;
      var Digitado: boolean; var VoltarMenu: boolean);

    procedure OnTEFVeSPagueExibeMenu(Titulo: string; Opcoes: TStringList;
      Memo: TStringList; var ItemSelecionado: integer);
    procedure OnTEFVeSPagueObtemCampo(Titulo: string; Mascara: string;
      Tipo: AnsiChar; var Resposta: string; var Digitado: boolean);


  end;

{%endregion}

{Handle para o componente TACBrTEFD }
type
  TTEFHandle = record
    UltimoErro: string;
    TEF: TACBrTEFD;
    EventHandlers: TEventHandlersTEF;
  end;

{Ponteiro para o Handle }
type
  PTEFHandle = ^TTEFHandle;

{%endregion ACBrTEFD}

{%region ACBrCNIEE}

{Classe que armazena os EventHandlers para o componente ACBr}
type
  TEventHandlersCNIEE = class
  end;

{Handle para o componente TACBrCNIEE}
type
  TCNIEEHandle = record
    UltimoErro: string;
    CNIEE: TACBrCNIEE;
    EventHandlers: TEventHandlersCNIEE;
  end;

{Ponteiro para o Handle }
type
  PCNIEEHandle = ^TCNIEEHandle;

{%endregion ACBrCNIEE}

{%region ACBrSMS}

{Classe que armazena os EventHandlers para o componente ACBr}
type
  TEventHandlersSMS = class
    OnProgressoCallback: TOnProgressoCallback;
    procedure OnProgresso(const AAtual, ATotal: integer);
  end;

{Handle para o componente ACBrSMS }

type
  TSMSHandle = record
    UltimoErro: string;
    SMS: TACBrSMS;
    EventHandlers: TEventHandlersSMS;
  end;

type
  TMSGCHandle = record
    UltimoErro: string;
    Menssagens: TACBrSMSMensagens;
  end;

type
  TMSGHandle = record
    UltimoErro: string;
    Menssagem: TACBrSMSMensagem;
  end;

{Ponteiro para o Handle }

type
  PSMSHandle = ^TSMSHandle;

type
  PMSGCHandle = ^TMSGCHandle;

type
  PMSGHandle = ^TMSGHandle;

{%endregion ACBrSMS}

{%region ACBrIBGE}

{Classe que armazena os EventHandlers para o componente ACBr}
type
  TEventHandlersIBGE = class
    OnBuscaEfetuadaCallback: TNoArgumentsCallback;
    procedure OnBuscaEfetuada(Sender: TObject);
  end;


{Handle para o componente TACBrECF }
type
  TIBGEHandle = record
    UltimoErro: string;
    IBGE: TACBrIBGE;
    EventHandlers: TEventHandlersIBGE;
  end;

{Ponteiro para o Handle }
type
  PIBGEHandle = ^TIBGEHandle;

{%endregion ACBrIBGE}

{%region ACBrValidador}

{Classe que armazena os EventHandlers para o componente ACBr}
type
  TEventHandlersVal = class
    OnMsgErroCallback: TStringCallback;
    procedure OnMsgErro(Mensagem: string);
  end;

{Handle para o componente TACBrValidador}
type
  TVALHandle = record
    UltimoErro: string;
    Val: TACBrValidador;
    EventHandlers: TEventHandlersVal;
  end;

{Ponteiro para o Handle }
type
  PVALHandle = ^TVALHandle;

{%endregion ACBrValidador}

{%region ACBrCEP}

type
  TEventHandlersCEP = class

    OnBuscaEfetuadaCallback: TNoArgumentsCallback;
    OnAntesAbrirHTTPCallback: TConstStringRetStringCallback;

    procedure OnBuscaEfetuada(Sender: TObject);
    procedure OnAntesAbrirHTTP(var AURL: string);

  end;

{Handle para o componente TACBrCEP }
type
  TCEPHandle = record
    UltimoErro: string;
    CEP: TACBrCEP;
    EventHandlers: TEventHandlersCEP;
  end;

{Ponteiro para o Handle }
type
  PCEPHandle = ^TCEPHandle;

{%endregion ACBrCEP}

{%region ACBrLFD}

type
  TEventHandlersLFD = class
    OnErrorCallback: TConstStringCallback;
    procedure OnError(const MsnError: ansistring);
  end;

{Handle para o componente TACBrSPEDFiscal}
type
  TLFDHandle = record
    UltimoErro: string;
    LFD: TACBrLFD;
    EventHandlers: TEventHandlersLFD;
  end;

{Ponteiro para o Handle }
type
  PTFDHandle = ^TLFDHandle;

{%endregion ACBrLFD}

{%region ACBrPosPrinter}

type
  TEventHandlersPOS = class
    OnGravarLogCallback: TLogCallback;
    OnEnviarStringDeviceCallback: TLogCallback;
    procedure OnGravarLog(const ALogLine: string; var Tratado: boolean);
    procedure OnEnviarStringDevice(const ALogLine: string; var Tratado: boolean);
  end;

{Handle para o componente ACBrPosPrinter}
type
  TPOSHandle = record
    UltimoErro: string;
    POS: TACBrPosPrinter;
    EventHandlers: TEventHandlersPOS;
  end;

{Ponteiro para o Handle }
type
  PPOSHandle = ^TPOSHandle;

{%endregion ACBrPosPrinter}

{%region ACBrETQ}

type
  TEventHandlersETQ = class
    OnGravarLogCallback: TLogCallback;
    procedure OnGravarLog(const ALogLine: String; var Tratado: Boolean);
  end;

{Handle para o componente ACBrPosPrinter}
type
  TETQHandle = record
    UltimoErro: string;
    ETQ: TACBrETQ;
    EventHandlers: TEventHandlersETQ;
  end;

{Ponteiro para o Handle }
type
  PETQHandle = ^TETQHandle;

{%endregion ACBrETQ}


implementation

{%region Eventos ACBrECF}

procedure TEventHandlersECF.OnMsgPoucoPapel(Sender: TObject);
begin
  OnMsgPoucoPapelCallback();
end;

procedure TEventHandlersECF.OnAguardandoRespostaChange(Sender: TObject);
begin
  OnAguardandoRespostaChangeCallback();
end;

procedure TEventHandlersECF.OnAntesAbreCupom(const CPF_CNPJ, Nome, Endereco: string);
begin
  OnAntesAbreCupomCallback(PChar(CPF_CNPJ), PChar(Nome), PChar(Endereco));
end;

procedure TEventHandlersECF.OnAntesAbreCupomVinculado(Sender: TObject);
begin
  OnAntesAbreCupomVinculadoCallback();
end;

procedure TEventHandlersECF.OnAntesAbreNaoFiscal(
  const CPF_CNPJ, Nome, Endereco: string);
begin
  OnAntesAbreNaoFiscalCallback(PChar(CPF_CNPJ), PChar(Nome), PChar(Endereco));
end;

procedure TEventHandlersECF.OnAntesAbreRelatorioGerencial(const Indice: integer);
begin
  OnAntesAbreRelatorioGerencialCallback(Indice);
end;

procedure TEventHandlersECF.OnAntesCancelaCupom(Sender: TObject);
begin
  OnAntesCancelaCupomCallback();
end;

procedure TEventHandlersECF.OnAntesCancelaItemNaoFiscal(const NumItem: integer);
begin
  OnAntesCancelaItemNaoFiscalCallback(NumItem);
end;

procedure TEventHandlersECF.OnAntesCancelaItemVendido(const NumItem: integer);
begin
  OnAntesCancelaItemVendidoCallback(NumItem);
end;

procedure TEventHandlersECF.OnAntesCancelaNaoFiscal(Sender: TObject);
begin
  OnAntesCancelaNaoFiscalCallback();
end;

procedure TEventHandlersECF.OnAntesEfetuaPagamento(const CodFormaPagto: string;
  const Valor: double; const Observacao: ansistring; const ImprimeVinculado: boolean);
begin
  OnAntesEfetuaPagamentoCallback(PChar(CodFormaPagto), Valor,
    PChar(Observacao), ImprimeVinculado);
end;

procedure TEventHandlersECF.OnAntesEfetuaPagamentoNaoFiscal(
  const CodFormaPagto: string;
  const Valor: double; const Observacao: ansistring; const ImprimeVinculado: boolean);
begin
  OnAntesEfetuaPagamentoNaoFiscalCallback(PChar(CodFormaPagto),
    Valor, PChar(Observacao), ImprimeVinculado);
end;

procedure TEventHandlersECF.OnAntesFechaCupom(const Observacao: ansistring;
  const IndiceBMP: integer);
begin
  OnAntesFechaCupomCallback(PChar(Observacao), IndiceBMP);
end;

procedure TEventHandlersECF.OnAntesFechaNaoFiscal(const Observacao: ansistring;
  const IndiceBMP: integer);
begin
  OnAntesFechaNaoFiscalCallback(PChar(Observacao), IndiceBMP);
end;

procedure TEventHandlersECF.OnAntesFechaRelatorio(Sender: TObject);
begin
  OnAntesFechaRelatorioCallback();
end;

procedure TEventHandlersECF.OnAntesLeituraX(Sender: TObject);
begin
  OnAntesLeituraXCallback();
end;

procedure TEventHandlersECF.OnAntesReducaoZ(Sender: TObject);
begin
  OnAntesReducaoZCallback();
end;

procedure TEventHandlersECF.OnAntesSangria(const Valor: double;
  const Obs: ansistring; const DescricaoCNF, DescricaoFPG: string);
begin
  OnAntesSangriaCallback(Valor, PChar(Obs), PChar(DescricaoCNF), PChar(DescricaoFPG));
end;

procedure TEventHandlersECF.OnAntesSubtotalizaCupom(const DescontoAcrescimo: double;
  const MensagemRodape: ansistring);
begin
  OnAntesSubtotalizaCupomCallback(DescontoAcrescimo, PChar(MensagemRodape));
end;

procedure TEventHandlersECF.OnAntesSubtotalizaNaoFiscal(const DescontoAcrescimo: double;
  const MensagemRodape: ansistring);
begin
  OnAntesSubtotalizaNaoFiscalCallback(DescontoAcrescimo, PChar(MensagemRodape));
end;

procedure TEventHandlersECF.OnAntesSuprimento(const Valor: double;
  const Obs: ansistring; const DescricaoCNF, DescricaoFPG: string);
begin
  OnAntesSuprimentoCallback(Valor, PChar(Obs), PChar(DescricaoCNF),
    PChar(DescricaoFPG));
end;

procedure TEventHandlersECF.OnAntesVendeItem(
  const Codigo, Descricao, AliquotaICMS: string;
  const Qtd, ValorUnitario, ValorDescontoAcrescimo: double;
  const Unidade, TipoDescontoAcrescimo, DescontoAcrescimo: string);
begin
  OnAntesVendeItemCallback(PChar(Codigo), PChar(Descricao),
    PChar(AliquotaICMS), Qtd, ValorUnitario,
    ValorDescontoAcrescimo, PChar(Unidade), PChar(TipoDescontoAcrescimo),
    PChar(DescontoAcrescimo));
end;

procedure TEventHandlersECF.OnBobinaAdicionaLinhas(const Linhas: string;
  const Operacao: string);
var
  pLinhas: PChar;
  pOperacao: PChar;
begin
  pLinhas := PChar(Linhas);
  pOperacao := PChar(Operacao);
  OnBobinaAdicionaLinhasCallback(pLinhas, pOperacao);
end;

procedure TEventHandlersECF.OnChangeEstado(
  const EstadoAnterior, EstadoAtual: TACBrECFEstado);
begin
  OnChangeEstadoCallback(integer(EstadoAnterior), integer(EstadoAtual));
end;

procedure TEventHandlersECF.OnChequeEstado(const EstadoAtual: TACBrECFCHQEstado;
  var Continuar: boolean);
begin
  Continuar := OnChequeEstadoCallback(integer(EstadoAtual));
end;

procedure TEventHandlersECF.OnDepoisAbreCupom(const CPF_CNPJ, Nome, Endereco: string);
begin
  OnDepoisAbreCupomCallback(PChar(CPF_CNPJ), PChar(Nome), PChar(Endereco));
end;

procedure TEventHandlersECF.OnDepoisAbreCupomVinculado(Sender: TObject);
begin
  OnDepoisAbreCupomVinculadoCallback();
end;

procedure TEventHandlersECF.OnDepoisAbreNaoFiscal(
  const CPF_CNPJ, Nome, Endereco: string);
begin
  OnDepoisAbreNaoFiscalCallback(PChar(CPF_CNPJ), PChar(Nome), PChar(Endereco));
end;

procedure TEventHandlersECF.OnDepoisAbreRelatorioGerencial(const Indice: integer);
begin
  OnDepoisAbreRelatorioGerencialCallback(Indice);
end;

procedure TEventHandlersECF.OnDepoisCancelaCupom(Sender: TObject);
begin
  OnDepoisCancelaCupomCallback();
end;

procedure TEventHandlersECF.OnDepoisCancelaItemNaoFiscal(const NumItem: integer);
begin
  OnDepoisCancelaItemNaoFiscalCallback(NumItem);
end;

procedure TEventHandlersECF.OnDepoisCancelaItemVendido(const NumItem: integer);
begin
  OnDepoisCancelaItemVendidoCallback(NumItem);
end;

procedure TEventHandlersECF.OnDepoisCancelaNaoFiscal(Sender: TObject);
begin
  OnDepoisCancelaNaoFiscalCallback();
end;

procedure TEventHandlersECF.OnDepoisEfetuaPagamento(const CodFormaPagto: string;
  const Valor: double; const Observacao: ansistring; const ImprimeVinculado: boolean);
begin
  OnDepoisEfetuaPagamentoCallback(PChar(CodFormaPagto), Valor,
    PChar(Observacao), ImprimeVinculado);
end;

procedure TEventHandlersECF.OnDepoisEfetuaPagamentoNaoFiscal(
  const CodFormaPagto: string; const Valor: double; const Observacao: ansistring;
  const ImprimeVinculado: boolean);
begin
  OnDepoisEfetuaPagamentoNaoFiscalCallback(PChar(CodFormaPagto),
    Valor, PChar(Observacao), ImprimeVinculado);
end;

procedure TEventHandlersECF.OnDepoisFechaCupom(const Observacao: ansistring;
  const IndiceBMP: integer);
begin
  OnDepoisFechaCupomCallback(PChar(Observacao), IndiceBMP);
end;

procedure TEventHandlersECF.OnDepoisFechaNaoFiscal(const Observacao: ansistring;
  const IndiceBMP: integer);
begin
  OnDepoisFechaNaoFiscalCallback(PChar(Observacao), IndiceBMP);
end;

procedure TEventHandlersECF.OnDepoisFechaRelatorio(Sender: TObject);
begin
  OnDepoisFechaRelatorioCallback();
end;

procedure TEventHandlersECF.OnDepoisLeituraX(Sender: TObject);
begin
  OnDepoisLeituraXCallback();
end;

procedure TEventHandlersECF.OnDepoisReducaoZ(Sender: TObject);
begin
  OnDepoisReducaoZCallback();
end;

procedure TEventHandlersECF.OnDepoisSangria(const Valor: double;
  const Obs: ansistring; const DescricaoCNF, DescricaoFPG: string);
begin
  OnDepoisSangriaCallback(Valor, PChar(Obs), PChar(DescricaoCNF),
    PChar(DescricaoFPG));
end;

procedure TEventHandlersECF.OnDepoisSubtotalizaCupom(const DescontoAcrescimo: double;
  const MensagemRodape: ansistring);
begin
  OnDepoisSubtotalizaCupomCallback(DescontoAcrescimo, PChar(MensagemRodape));
end;

procedure TEventHandlersECF.OnDepoisSubtotalizaNaoFiscal(
  const DescontoAcrescimo: double;
  const MensagemRodape: ansistring);
begin
  OnDepoisSubtotalizaNaoFiscalCallback(DescontoAcrescimo, PChar(MensagemRodape));
end;

procedure TEventHandlersECF.OnDepoisSuprimento(const Valor: double;
  const Obs: ansistring; const DescricaoCNF, DescricaoFPG: string);
begin
  OnDepoisSuprimentoCallback(Valor, PChar(Obs), PChar(DescricaoCNF),
    PChar(DescricaoFPG));
end;

procedure TEventHandlersECF.OnDepoisVendeItem(
  const Codigo, Descricao, AliquotaICMS: string;
  const Qtd, ValorUnitario, ValorDescontoAcrescimo: double;
  const Unidade, TipoDescontoAcrescimo, DescontoAcrescimo: string);
begin
  OnDepoisVendeItemCallback(PChar(Codigo), PChar(Descricao),
    PChar(AliquotaICMS), Qtd, ValorUnitario,
    ValorDescontoAcrescimo, PChar(Unidade), PChar(TipoDescontoAcrescimo),
    PChar(DescontoAcrescimo));
end;

procedure TEventHandlersECF.OnErrorAbreCupom(var Tratado: boolean);
begin
  Tratado := OnErrorAbreCupomCallback();
end;

procedure TEventHandlersECF.OnErrorAbreCupomVinculado(var Tratado: boolean);
begin
  Tratado := OnErrorAbreCupomVinculadoCallback();
end;

procedure TEventHandlersECF.OnErrorAbreNaoFiscal(var Tratado: boolean);
begin
  Tratado := OnErrorAbreNaoFiscalCallback();
end;

procedure TEventHandlersECF.OnErrorAbreRelatorioGerencial(var Tratado: boolean;
  const Indice: integer);
begin
  Tratado := OnErrorAbreRelatorioGerencialCallback(Indice);
end;

procedure TEventHandlersECF.OnErrorCancelaCupom(var Tratado: boolean);
begin
  Tratado := OnErrorCancelaCupomCallback();
end;

procedure TEventHandlersECF.OnErrorCancelaItemNaoFiscal(var Tratado: boolean);
begin
  Tratado := OnErrorCancelaItemNaoFiscalCallback();
end;

procedure TEventHandlersECF.OnErrorCancelaItemVendido(var Tratado: boolean);
begin
  Tratado := OnErrorCancelaItemVendidoCallback();
end;

procedure TEventHandlersECF.OnErrorCancelaNaoFiscal(var Tratado: boolean);
begin
  Tratado := OnErrorCancelaNaoFiscalCallback();
end;

procedure TEventHandlersECF.OnErrorEfetuaPagamento(var Tratado: boolean);
begin
  Tratado := OnErrorEfetuaPagamentoCallback();
end;

procedure TEventHandlersECF.OnErrorEfetuaPagamentoNaoFiscal(var Tratado: boolean);
begin
  Tratado := OnErrorEfetuaPagamentoNaoFiscalCallback();
end;

procedure TEventHandlersECF.OnErrorFechaCupom(var Tratado: boolean);
begin
  Tratado := OnErrorFechaCupomCallback();
end;

procedure TEventHandlersECF.OnErrorFechaNaoFiscal(var Tratado: boolean);
begin
  Tratado := OnErrorFechaNaoFiscalCallback();
end;

procedure TEventHandlersECF.OnErrorFechaRelatorio(var Tratado: boolean);
begin
  Tratado := OnErrorFechaRelatorioCallback();
end;

procedure TEventHandlersECF.OnErrorLeituraX(var Tratado: boolean);
begin
  Tratado := OnErrorLeituraXCallback();
end;

procedure TEventHandlersECF.OnErrorReducaoZ(var Tratado: boolean);
begin
  Tratado := OnErrorReducaoZCallback();
end;

procedure TEventHandlersECF.OnErrorSangria(var Tratado: boolean);
begin
  Tratado := OnErrorSangriaCallback();
end;

procedure TEventHandlersECF.OnErrorSemPapel(Sender: TObject);
begin
  OnErrorSemPapelCallback();
end;

procedure TEventHandlersECF.OnErrorSubtotalizaCupom(var Tratado: boolean);
begin
  Tratado := OnErrorSubtotalizaCupomCallback();
end;

procedure TEventHandlersECF.OnErrorSubtotalizaNaoFiscal(var Tratado: boolean);
begin
  Tratado := OnErrorSubtotalizaNaoFiscalCallback();
end;

procedure TEventHandlersECF.OnErrorSuprimento(var Tratado: boolean);
begin
  Tratado := OnErrorSuprimentoCallback();
end;

procedure TEventHandlersECF.OnErrorVendeItem(var Tratado: boolean);
begin
  Tratado := OnErrorVendeItemCallback();
end;

procedure TEventHandlersECF.OnMsgAguarde(const Mensagem: string);
begin
  OnMsgAguardeCallback(PChar(Mensagem));
end;

procedure TEventHandlersECF.OnMsgRetentar(const Mensagem: string;
  const Situacao: string; var Result: boolean);
begin
  Result := OnMsgRetentarCallback(PChar(Mensagem), PChar(Situacao));
end;

procedure TEventHandlersECF.OnPAFCalcEAD(Arquivo: string);
begin
  OnPAFCalcEADCallback(PChar(Arquivo));
end;

procedure TEventHandlersECF.OnPAFGetKeyRSA(var Chave: ansistring);
begin
  Chave := OnPAFGetKeyRSACallback();
end;


{%endregion}

{%region Eventos ACBrRFD}

procedure TEventHandlersRFD.OnCalcEAD(Arquivo: string);
begin
  OnCalcEADCallback(PChar(Arquivo));
end;

procedure TEventHandlersRFD.OnCalcHashLog(const Linha: string; var Hash: string);
begin
  Hash := OnCalcHashLogCallback(PChar(Linha));
end;

procedure TEventHandlersRFD.OnGetKeyHashLog(var Chave: string);
begin
  Chave := OnGetKeyHashLogCallback();
end;

procedure TEventHandlersRFD.OnGetKeyRSA(var Chave: string);
begin
  Chave := OnGetKeyRSACallback();
end;

{%endregion}

{%region Eventos ACBrPAF}

procedure TEventHandlersPAF.GetChaveRSA(var Chave: ansistring);
begin
  if (Length(ChaveRSA) > 0) then
    Chave := ChaveRSA
  else
    Chave := OnGetChaveRSACallback();
end;

{%endregion}

{%region Eventos ACBrBAL}

procedure TEventHandlersBAL.OnLePeso(Peso: double; Resposta: ansistring);
begin
  OnLePesoCallback(Peso);
end;

{%endregion}

{%region Eventos ACBrLCB}

procedure TEventHandlersLCB.OnLeCodigo(Sender: TObject);
begin
  OnLeCodigoCallback();
end;

procedure TEventHandlersLCB.OnLeFila(Sender: TObject);
begin
  OnLeFilaCallback();
end;

{%endregion}

{%region Eventos ACBrAAC}

procedure TEventHandlersAAC.OnAntesAbrirArquivo(var Continua: boolean);
begin
  Continua := OnAntesAbrirArquivoCallback();
end;

procedure TEventHandlersAAC.OnAntesGravarArquivo(var Continua: boolean);
begin
  Continua := OnAntesGravarArquivoCallback();
end;

procedure TEventHandlersAAC.OnCrypt(ConteudoArquivo: ansistring;
  var Resposta: ansistring);
begin
  Resposta := OnCryptCallback(PChar(ConteudoArquivo));
end;

procedure TEventHandlersAAC.OnDeCrypt(ConteudoCriptografado: ansistring;
  var Resposta: ansistring);
begin
  Resposta := OnCryptCallback(PChar(ConteudoCriptografado));
end;

procedure TEventHandlersAAC.OnDepoisAbrirArquivo(Sender: TObject);
begin
  OnDepoisAbrirArquivoCallback();
end;

procedure TEventHandlersAAC.OnDepoisGravarArquivo(Sender: TObject);
begin
  OnDepoisGravarArquivoCallback();
end;

procedure TEventHandlersAAC.OnGetChave(var Chave: ansistring);
begin
  if (Length(ChaveCriptografia) > 0) then
    Chave := ChaveCriptografia
  else
    Chave := OnGetChaveCallback();
end;

procedure TEventHandlersAAC.VerificarRecomporNumSerie(const NumSerie: string;
  const ValorGT: double; var CRO: integer; var CNI: integer);
begin
  VerificarRecomporNumSerieCallback(PChar(NumSerie), ValorGT, CRO, CNI);
end;

procedure TEventHandlersAAC.VerificarRecomporValorGT(const NumSerie: string;
  var ValorGT: double);
begin
  VerificarRecomporValorGTCallback(PChar(NumSerie), ValorGT);
end;

{%endregion Eventos ACBrAAC}

{%region Eventos ACBrEAD}

procedure TEventHandlersEAD.GetChavePrivada(var Chave: ansistring);
begin
  if (Length(ChavePrivada) > 0) then
    Chave := ChavePrivada
  else
    Chave := OnGetChavePrivadaCallback();
end;

procedure TEventHandlersEAD.GetChavePublica(var Chave: ansistring);
begin
  if (Length(ChavePublica) > 0) then
    Chave := ChavePublica
  else
    Chave := OnGetChavePublicaCallback();
end;

{%endregion Eventos ACBrEAD}

{%region Eventos ACBrSPEDFiscal}

procedure TEventHandlersSPDF.OnError(const MsnError: ansistring);
begin
  OnErrorCallback(PChar(MsnError));
end;

{%endregion Eventos ACBrSPEDFiscal}

{%region Eventos ACBrTEFD}

procedure TEventHandlersTEF.OnAguardaResp(Arquivo: string;
  SegundosTimeOut: integer; var Interromper: boolean);
begin
  OnAguardaRespCallback(PChar(Arquivo), SegundosTimeOut, Interromper);
end;

procedure TEventHandlersTEF.OnExibeMsg(Operacao: TACBrTEFDOperacaoMensagem;
  Mensagem: string; var AModalResult: TModalResult);
begin
  OnExibeMsgCallback(Ord(Operacao), PChar(Mensagem), AModalResult);
end;

procedure TEventHandlersTEF.OnBloqueiaMouseTeclado(Bloqueia: boolean;
  var Tratado: boolean);
begin
  OnBloqueiaMouseTecladoCallback(Bloqueia, Tratado);
end;

procedure TEventHandlersTEF.OnRestauraFocoAplicacao(var Tratado: boolean);
begin
  OnRestauraFocoAplicacaoCallback(Tratado);
end;

procedure TEventHandlersTEF.OnLimpaTeclado(var Tratado: boolean);
begin
  OnLimpaTecladoCallback(Tratado);
end;

procedure TEventHandlersTEF.OnComandaECF(Operacao: TACBrTEFDOperacaoECF;
  Resp: TACBrTEFDResp; var RetornoECF: integer);
begin
  OnComandaECFCallback(Ord(Operacao), Resp, RetornoECF);
end;

procedure TEventHandlersTEF.OnComandaECFSubtotaliza(DescAcre: double;
  var RetornoECF: integer);
begin
  OnComandaECFSubtotalizaCallback(DescAcre, RetornoECF);
end;

procedure TEventHandlersTEF.OnComandaECFPagamento(IndiceECF: string;
  Valor: double; var RetornoECF: integer);
begin
  OnComandaECFPagamentoCallback(PChar(IndiceECF), Valor, RetornoECF);
end;

procedure TEventHandlersTEF.OnComandaECFAbreVinculado(COO, IndiceECF: string;
  Valor: double; var RetornoECF: integer);
begin
  OnComandaECFAbreVinculadoCallback(PChar(COO), PChar(IndiceECF), Valor, RetornoECF);
end;

procedure TEventHandlersTEF.OnComandaECFImprimeVia(TipoRelatorio: TACBrTEFDTipoRelatorio;
  Via: integer; ImagemComprovante: TStringList; var RetornoECF: integer);
var
  i: integer;
  linha: string;
  imagem: array of PChar;
begin

  SetLength(imagem, ImagemComprovante.Count);
  for i := 0 to ImagemComprovante.Count - 1 do
  begin

    linha := ImagemComprovante.Strings[i];
    imagem[i] := PChar(linha);
  end;

  OnComandaECFImprimeViaCallback(Ord(TipoRelatorio), Via, imagem,
    ImagemComprovante.Count, RetornoECF);

  SetLength(imagem, 0);

end;

procedure TEventHandlersTEF.OnInfoECF(Operacao: TACBrTEFDInfoECF;
  var RetornoECF: string);
var
  retorno: PChar;
const
  retornoLen = 30;
begin

  retorno := StrAlloc(retornoLen);
  OnInfoECFCallback(Ord(Operacao), retorno, retornoLen);
  RetornoECF := retorno;

end;

procedure TEventHandlersTEF.OnAntesFinalizarRequisicao(Req: TACBrTEFDReq);
begin
  OnAntesFinalizarRequisicaoCallback(Req);
end;

procedure TEventHandlersTEF.OnDepoisConfirmarTransacoes(RespostasPendentes:
  TACBrTEFDRespostasPendentes);
begin
  OnDepoisConfirmarTransacoesCallback(RespostasPendentes);
end;

procedure TEventHandlersTEF.OnAntesCancelarTransacao(RespostaPendente: TACBrTEFDResp);
begin
  OnAntesCancelarTransacaoCallback(RespostaPendente);
end;

procedure TEventHandlersTEF.OnDepoisCancelarTransacoes(RespostasPendentes:
  TACBrTEFDRespostasPendentes);
begin
  OnDepoisCancelarTransacoesCallback(RespostasPendentes);
end;

procedure TEventHandlersTEF.OnMudaEstadoReq(EstadoReq: TACBrTEFDReqEstado);
begin
  OnMudaEstadoReqCallback(Ord(EstadoReq));
end;

procedure TEventHandlersTEF.OnMudaEstadoResp(EstadoResp: TACBrTEFDRespEstado);
begin
  OnMudaEstadoRespCallback(Ord(EstadoResp));
end;

procedure TEventHandlersTEF.OnTEFCliSiTefExibeMenu(Titulo: string;
  Opcoes: TStringList; var ItemSelecionado: integer; var VoltarMenu: boolean);
var
  i: integer;
  linha: string;
  lista: array of PChar;
begin

  SetLength(lista, Opcoes.Count);
  for i := 0 to Opcoes.Count - 1 do
  begin
    linha := Opcoes.Strings[i];
    lista[i] := PChar(linha);
  end;

  OnTEFCliSiTefExibeMenuCallback(PChar(Titulo), lista, Opcoes.Count,
    ItemSelecionado, VoltarMenu);

  SetLength(lista, 0);
end;

procedure TEventHandlersTEF.OnTEFCliSiTefObtemCampo(Titulo: string;
  TamanhoMinimo, TamanhoMaximo: integer; TipoCampo: integer;
  Operacao: TACBrTEFDCliSiTefOperacaoCampo; var Resposta: ansistring;
  var Digitado: boolean; var VoltarMenu: boolean);
var
  resp: PChar;
const
  respLen = 256;
begin

  resp := StrAlloc(respLen);
  OnTEFCliSiTefObtemCampoCalback(PChar(Titulo), TamanhoMinimo,
    TamanhoMaximo, TipoCampo, Operacao, resp, respLen, Digitado, VoltarMenu);

  Resposta := resp;

end;

procedure TEventHandlersTEF.OnTEFVeSPagueExibeMenu(Titulo: string;
  Opcoes: TStringList; Memo: TStringList; var ItemSelecionado: integer);
var
  i: integer;
  linha: string;
  lista: array of PChar;
  lista2: array of PChar;
begin

  SetLength(lista, Opcoes.Count);
  for i := 0 to Opcoes.Count - 1 do
  begin
    linha := Opcoes.Strings[i];
    lista[i] := PChar(linha);
  end;

  SetLength(lista2, Memo.Count);
  for i := 0 to Memo.Count - 1 do
  begin
    linha := Memo.Strings[i];
    lista2[i] := PChar(linha);
  end;

  OnTEFVeSPagueExibeMenuCallback(PChar(Titulo), lista, Opcoes.Count,
    lista2, Memo.Count, ItemSelecionado);

  SetLength(lista, 0);
  SetLength(lista2, 0);
end;

procedure TEventHandlersTEF.OnTEFVeSPagueObtemCampo(Titulo: string;
  Mascara: string; Tipo: AnsiChar; var Resposta: string; var Digitado: boolean);
var
  resp: PChar;
const
  respLen = 256;
begin
  resp := StrAlloc(respLen);

  OnTEFVeSPagueObtemCampoCalback(PChar(Titulo), PChar(Mascara), char(Tipo),
    resp, Digitado);

  Resposta := resp;

end;

{%endregion Eventos ACBrTEFD}

{%region Eventos ACBrSMS}

procedure TEventHandlersSMS.OnProgresso(const AAtual, ATotal: integer);
begin
  OnProgressoCallback(AAtual, ATotal);
end;

{%endregion Eventos ACBrSMS}

{%region Eventos ACBrIBGE}

procedure TEventHandlersIBGE.OnBuscaEfetuada(Sender: TObject);
begin
  OnBuscaEfetuadaCallback();
end;

{%endregion Eventos ACBrIBGE}

{%region Eventos ACBrValidador}

procedure TEventHandlersVal.OnMsgErro(Mensagem: string);
begin
  OnMsgErroCallback(PChar(Mensagem));
end;

{%endregion Eventos ACBrValidador}

{%region Eventos ACBrCEP}

procedure TEventHandlersCEP.OnBuscaEfetuada(Sender: TObject);
begin
  OnBuscaEfetuadaCallback();
end;

procedure TEventHandlersCEP.OnAntesAbrirHTTP(var AURL: string);
begin
  AURL := OnAntesAbrirHTTPCallback(PChar(AURL));
end;

{%endregion Eventos ACBrCEP}

{%region Eventos ACBrLFD}

procedure TEventHandlersLFD.OnError(const MsnError: ansistring);
begin
  OnErrorCallback(PChar(MsnError));
end;

{%endregion Eventos ACBrLFD}

{%region Eventos ACBrPosPrinter}

procedure TEventHandlersPOS.OnGravarLog(const ALogLine: string; var Tratado: boolean);
begin
  Tratado := OnGravarLogCallback(PChar(ALogLine));
end;

procedure TEventHandlersPOS.OnEnviarStringDevice(const ALogLine: string; var Tratado: boolean);
begin
  Tratado := OnEnviarStringDeviceCallback(PChar(ALogLine));
end;

{%endregion Eventos ACBrPosPrinter}

{%region Eventos ACBrETQ}

procedure TEventHandlersETQ.OnGravarLog(const ALogLine: string; var Tratado: boolean);
begin
  Tratado := OnGravarLogCallback(PChar(ALogLine));
end;

{%endregion Eventos ACBrETQ}

end.
