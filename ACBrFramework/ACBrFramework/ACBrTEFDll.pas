unit ACBrTEFDll;


interface

uses
  SysUtils,
  Classes,
  ACBrTEFD,
  ACBrTEFDClass,
  ACBrTEFDCliSiTef,
  ACBrHandlers,
  ACBrUtil;


{%region Declaração da funções}

{%region Constructor/Destructor}

function TEF_Create(var tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Destroy(tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_GetUltimoErro(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Propriedades Componente}

function TEF_SetAutoAtivar(const tefHandle: PTEFHandle; const Ativar: boolean): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_GetAutoAtivar(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_GetGPAtual(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_SetGPAtual(const tefHandle: PTEFHandle; GP: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_SetMultiplosCartoes(const tefHandle: PTEFHandle;
  const Ativar: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_GetMultiplosCartoes(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_SetAutoEfetuarPagamento(const tefHandle: PTEFHandle;
  const Ativar: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_GetAutoEfetuarPagamento(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_SetAutoFinalizarCupom(const tefHandle: PTEFHandle;
  const Ativar: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_GetAutoFinalizarCupom(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_SetCHQEmGerencial(const tefHandle: PTEFHandle;
  const Ativar: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_GetCHQEmGerencial(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_SetEsperaSleep(const tefHandle: PTEFHandle; const Sleep: integer): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_GetEsperaSleep(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_SetEsperaSTS(const tefHandle: PTEFHandle; const STS: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_GetEsperaSTS(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_SetNumVias(const tefHandle: PTEFHandle; const Vias: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_GetNumVias(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_SetNumeroMaximoCartoes(const tefHandle: PTEFHandle;
  const Cartoes: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_GetNumeroMaximoCartoes(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_SetArqLOG(const tefHandle: PTEFHandle; const Log: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_GetArqLOG(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_SetExibirMsgAutenticacao(const tefHandle: PTEFHandle;
  const Ativar: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_GetExibirMsgAutenticacao(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_SetPathBackup(const tefHandle: PTEFHandle; const Path: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_GetPathBackup(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_SetTrocoMaximo(const tefHandle: PTEFHandle; const troco: double): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_GetTrocoMaximo(const tefHandle: PTEFHandle; var troco: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_GetAbout(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_GetReq(const tefHandle: PTEFHandle; var reqHandle: TACBrTEFDReq): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_GetResp(const tefHandle: PTEFHandle;
  var respHandle: TACBrTEFDResp): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_GetRespostasPendentes(const tefHandle: PTEFHandle;
  var respHandle: TACBrTEFDRespostasPendentes): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_SetSuportaDesconto(const tefHandle: PTEFHandle;
  const Value: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_GetSuportaDesconto(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_SetSuportaSaque(const tefHandle: PTEFHandle;
  const Value: boolean): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_GetSuportaSaque(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Funções TEF}

function TEF_Inicializar(const tefHandle: PTEFHandle; GP: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_DesInicializar(const tefHandle: PTEFHandle; GP: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Inicializado(const tefHandle: PTEFHandle; const GP: integer): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_AtivarGP(const tefHandle: PTEFHandle; GP: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_ATV(const tefHandle: PTEFHandle; const GP: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_ADM(const tefHandle: PTEFHandle; const GP: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_CNC(const tefHandle: PTEFHandle; const Rede: PChar;
  const NSU: PChar; const DataHoraTransacao: double; const Valor: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_CNF(const tefHandle: PTEFHandle; const Rede: PChar;
  const NSU: PChar; const Finalizacao: PChar; const DocumentoVinculado: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_NCN(const tefHandle: PTEFHandle; const Rede: PChar;
  const NSU: PChar; const Finalizacao: PChar; const Valor: double;
  const DocumentoVinculado: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_CRT(const tefHandle: PTEFHandle; const Valor: double;
  const IndiceFPG_ECF: PChar; const DocumentoVinculado: PChar;
  const Moeda: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_CHQ(const tefHandle: PTEFHandle; const Valor: double;
  const IndiceFPG_ECF: PChar; const DocumentoVinculado: PChar;
  const CMC7: PChar; const TipoPessoa: char; const DocumentoPessoa: PChar;
  const DataCheque: double; const Banco: PChar; const Agencia: PChar;
  const AgenciaDC: PChar; const Conta: PChar; const ContaDC: PChar;
  const Cheque: PChar; const ChequeDC: PChar; const Compensacao: PChar): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_CancelarTransacoesPendentes(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_ConfirmarTransacoesPendentes(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_ImprimirTransacoesPendentes(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_FinalizarCupom(const tefHandle: PTEFHandle; const mouse: boolean): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Identificacao}

function TEF_Identificacao_GetNomeAplicacao(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Identificacao_SetNomeAplicacao(const tefHandle: PTEFHandle;
  const NomeAplicacao: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Identificacao_GetVersaoAplicacao(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Identificacao_SetVersaoAplicacao(const tefHandle: PTEFHandle;
  const VersaoAplicacao: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Identificacao_GetSoftwareHouse(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Identificacao_SetSoftwareHouse(const tefHandle: PTEFHandle;
  const SoftwareHouse: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Identificacao_GetRazaoSocial(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Identificacao_SetRazaoSocial(const tefHandle: PTEFHandle;
  const RazaoSocial: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Req}

function TEF_Req_GetHeader(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_SetHeader(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const Header: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_GetDocumentoVinculado(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_SetDocumentoVinculado(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const DocumentoVinculado: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_GetCMC7(const tefHandle: PTEFHandle; const reqHandle: TACBrTEFDReq;
  Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_SetCMC7(const tefHandle: PTEFHandle; const reqHandle: TACBrTEFDReq;
  const CMC7: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_GetDocumentoPessoa(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_SetDocumentoPessoa(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const DocumentoPessoa: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_GetRede(const tefHandle: PTEFHandle; const reqHandle: TACBrTEFDReq;
  Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_SetRede(const tefHandle: PTEFHandle; const reqHandle: TACBrTEFDReq;
  const Rede: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_GetNSU(const tefHandle: PTEFHandle; const reqHandle: TACBrTEFDReq;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_SetNSU(const tefHandle: PTEFHandle; const reqHandle: TACBrTEFDReq;
  const NSU: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_GetFinalizacao(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_SetFinalizacao(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const Finalizacao: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_GetBanco(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_SetBanco(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const Banco: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_GetAgencia(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_SetAgencia(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const Agencia: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_GetAgenciaDC(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_SetAgenciaDC(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const AgenciaDC: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_GetConta(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_SetConta(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const Conta: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_GetContaDC(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_SetContaDC(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const ContaDC: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_GetCheque(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_SetCheque(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const Cheque: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_GetChequeDC(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_SetChequeDC(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const ChequeDC: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_GetID(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_SetID(const tefHandle: PTEFHandle; const reqHandle: TACBrTEFDReq;
  const ID: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_GetMoeda(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_SetMoeda(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const Moeda: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_GetTipoPessoa(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_SetTipoPessoa(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const TipoPessoa: AnsiChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_GetValorTotal(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; var ValorTotal: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_SetValorTotal(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const ValorTotal: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_GetDataCheque(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; var DataCheque: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_SetDataCheque(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const DataCheque: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_GetDataHoraTransacaoComprovante(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; var DataHoraTransacaoComprovante: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_SetDataHoraTransacaoComprovante(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const DataHoraTransacaoComprovante: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Req_GravaInformacao(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; Identificacao, Sequencia: integer;
  Informacao: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Resp}

function TEF_Resp_GetHeader(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetDocumentoVinculado(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetCMC7(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetTipoPessoa(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetDocumentoPessoa(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetRede(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetNSU(const tefHandle: PTEFHandle; const respHandle: TACBrTEFDResp;
  Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetFinalizacao(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetStatusTransacao(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetNSUTransacaoCancelada(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetTextoEspecialOperador(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetTextoEspecialCliente(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetAutenticacao(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetBanco(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetAgencia(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetAgenciaDC(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetConta(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetContaDC(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetCheque(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetChequeDC(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetNomeAdministradora(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetTrailer(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetArqBackup(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetArqRespPendente(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetIndiceFPG_ECF(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetInstituicao(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetModalidadePagto(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetModalidadePagtoDescrita(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetModalidadeExtenso(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetCodigoRedeAutorizada(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetID(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetMoeda(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetTipoTransacao(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetCodigoAutorizacaoTransacao(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetNumeroLoteTransacao(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetTipoParcelamento(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetQtdParcelas(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetQtdLinhasComprovante(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetOrdemPagamento(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetTipoGP(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetParceladoPor(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetTipoOperacao(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetCNFEnviado(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetTransacaoAprovada(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetDebito(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetCredito(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetValorTotal(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; var ValorTotal: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetValorOriginal(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; var ValorOriginal: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetSaque(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; var Saque: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetDesconto(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; var Desconto: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetValorEntradaCDC(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; var ValorEntradaCDC: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetDataCheque(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; var DataCheque: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetDataHoraTransacaoHost(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; var DataHoraTransacaoHost: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetDataHoraTransacaoLocal(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; var DataHoraTransacaoLocal: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetDataPreDatado(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; var DataPreDatado: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetDataHoraTransacaoCancelada(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; var DataHoraTransacaoCancelada: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetDataHoraTransacaoComprovante(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; var DataHoraTransacaoComprovante: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetDataVencimento(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; var DataVencimento: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetDataEntradaCDC(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; var DataEntradaCDC: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetImagemComprovante1aViaCount(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetImagemComprovante1aViaLinha(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer;
  const linha: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetImagemComprovante2aViaCount(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_GetImagemComprovante2aViaLinha(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer;
  const linha: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_Resp_LeInformacao(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar;
  const BufferLen, Identificacao, Sequencia: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Respostas Pendentes}

function TEF_RespostasPendentes_GetSaldoAPagar(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDRespostasPendentes; var SaldoAPagar: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_RespostasPendentes_GetItem(const tefHandle: PTEFHandle;
  const respPendenteHandle: TACBrTEFDRespostasPendentes; const index: integer;
  var respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_RespostasPendentes_GetTotalPago(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDRespostasPendentes; var TotalPago: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_RespostasPendentes_GetTotalDesconto(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDRespostasPendentes; var TotalDesconto: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_RespostasPendentes_GetSaldoRestante(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDRespostasPendentes; var SaldoRestante: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_RespostasPendentes_GetCount(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDRespostasPendentes): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
{%endregion}

{%region TEFCliSiTef}

function TEF_TEFCliSiTef_GetArqLOG(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_SetArqLOG(const tefHandle: PTEFHandle;
  const ArqLOG: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_GetCodigoLoja(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
  {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_SetCodigoLoja(const tefHandle: PTEFHandle;
  const CodigoLoja: PChar): integer; {$IFDEF STDCALL} stdcall;
  {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_GetDataHoraFiscal(const tefHandle: PTEFHandle;
  var DataHoraFiscal: double): integer; {$IFDEF STDCALL} stdcall;
  {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_SetDataHoraFiscal(const tefHandle: PTEFHandle;
  const DataHoraFiscal: double): integer; {$IFDEF STDCALL} stdcall;
  {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_GetDocumentoFiscal(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
  {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_SetDocumentoFiscal(const tefHandle: PTEFHandle;
  const DocumentoFiscal: PChar): integer; {$IFDEF STDCALL} stdcall;
  {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_GetEnderecoIP(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_SetEnderecoIP(const tefHandle: PTEFHandle;
  const EnderecoIP: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_GetExibirErroRetorno(const tefHandle: PTEFHandle): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_SetExibirErroRetorno(const tefHandle: PTEFHandle;
  const ExibirErroRetorno: boolean): integer; {$IFDEF STDCALL} stdcall;
  {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_GetHabilitado(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_SetHabilitado(const tefHandle: PTEFHandle;
  const Habilitado: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_GetLogDebug(const tefHandle: PTEFHandle): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_SetLogDebug(const tefHandle: PTEFHandle;
  const LogDebug: boolean): integer; {$IFDEF STDCALL} stdcall;
  {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_GetName(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
  {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_SetName(const tefHandle: PTEFHandle;
  const Name: PChar): integer; {$IFDEF STDCALL} stdcall;
  {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_GetNumeroTerminal(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_SetNumeroTerminal(const tefHandle: PTEFHandle;
  const NumeroTerminal: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_GetOperacaoADM(const tefHandle: PTEFHandle): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_SetOperacaoADM(const tefHandle: PTEFHandle;
  const OperacaoADM: integer): integer; {$IFDEF STDCALL} stdcall;
  {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_GetOperacaoATV(const tefHandle: PTEFHandle): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_SetOperacaoATV(const tefHandle: PTEFHandle;
  const OperacaoATV: integer): integer; {$IFDEF STDCALL} stdcall;
  {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_GetOperacaoCHQ(const tefHandle: PTEFHandle): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_SetOperacaoCHQ(const tefHandle: PTEFHandle;
  const OperacaoCHQ: integer): integer; {$IFDEF STDCALL} stdcall;
  {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_GetOperacaoCNC(const tefHandle: PTEFHandle): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_SetOperacaoCNC(const tefHandle: PTEFHandle;
  const OperacaoCNC: integer): integer; {$IFDEF STDCALL} stdcall;
  {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_GetOperacaoCRT(const tefHandle: PTEFHandle): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_SetOperacaoCRT(const tefHandle: PTEFHandle;
  const OperacaoCRT: integer): integer; {$IFDEF STDCALL} stdcall;
   {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_GetOperacaoReImpressao(const tefHandle: PTEFHandle): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_SetOperacaoReImpressao(const tefHandle: PTEFHandle;
  const OperacaoReImpressao: integer): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_GetOperador(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_SetOperador(const tefHandle: PTEFHandle;
  const Operador: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_GetParametrosAdicionais(const tefHandle: PTEFHandle;
  linha: PChar; const BufferLen, index: integer): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_SetParametrosAdicionais(const tefHandle: PTEFHandle;
  const linhas: array of PChar; const LinhasCount: integer): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_GetParametrosAdicionaisCount(
  const tefHandle: PTEFHandle): integer; {$IFDEF STDCALL} stdcall;
  {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_GetPortaPinPad(const tefHandle: PTEFHandle): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_SetPortaPinPad(const tefHandle: PTEFHandle;
  const PortaPinPad: integer): integer; {$IFDEF STDCALL} stdcall;
  {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_GetRestricoes(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
  {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_SetRestricoes(const tefHandle: PTEFHandle;
  const Restricoes: PChar): integer; {$IFDEF STDCALL} stdcall;
  {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_GetUsaUTF8(const tefHandle: PTEFHandle): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_SetUsaUTF8(const tefHandle: PTEFHandle;
  const UsaUTF8: boolean): integer; {$IFDEF STDCALL} stdcall;
  {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_DefineMensagemPermanentePinPad(const tefHandle: PTEFHandle;
  const mensagem: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_ObtemQuantidadeTransacoesPendentes(
  const tefHandle: PTEFHandle;
  const Data: double; const Cupom: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_SetOnExibeMenu(const tefHandle: PTEFHandle;
  const method: TTEFCliSiTefExibeMenuCallback): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCliSiTef_SetOnObtemCampo(const tefHandle: PTEFHandle;
  const method: TTEFCliSiTefObtemCampoCalback): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region TEFVeSPague}

function TEF_TEFVeSPague_GetAplicacao(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_SetAplicacao(const tefHandle: PTEFHandle;
  const Aplicacao: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_GetAplicacaoVersao(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_SetAplicacaoVersao(const tefHandle: PTEFHandle;
  const AplicacaoVersao: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_GetGPExeName(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_SetGPExeName(const tefHandle: PTEFHandle;
  const GPExeName: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_GetGPExeParams(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_SetGPExeParams(const tefHandle: PTEFHandle;
  const GPExeParams: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_GetEnderecoIP(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_SetEnderecoIP(const tefHandle: PTEFHandle;
  const EnderecoIP: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_GetPorta(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_SetPorta(const tefHandle: PTEFHandle;
  const Porta: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_GetTimeOut(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_SetTimeOut(const tefHandle: PTEFHandle;
  const TimeOut: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_GetTemPendencias(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_SetTemPendencias(const tefHandle: PTEFHandle;
  const TemPendencias: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_GetTransacaoADM(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_SetTransacaoADM(const tefHandle: PTEFHandle;
  const TransacaoADM: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_GetTransacaoCRT(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_SetTransacaoCRT(const tefHandle: PTEFHandle;
  const TransacaoCRT: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_GetTransacaoCHQ(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_SetTransacaoCHQ(const tefHandle: PTEFHandle;
  const TransacaoCHQ: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_GetTransacaoCNC(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_SetTransacaoCNC(const tefHandle: PTEFHandle;
  const TransacaoCNC: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_GetTransacaoOpcao(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_SetTransacaoOpcao(const tefHandle: PTEFHandle;
  const TransacaoOpcao: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_GetTransacaoReImpressao(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_SetTransacaoReImpressao(const tefHandle: PTEFHandle;
  const TransacaoReImpressao: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_GetTransacaoPendente(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_SetTransacaoPendente(const tefHandle: PTEFHandle;
  const TransacaoPendente: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_SetOnExibeMenu(const tefHandle: PTEFHandle;
  const method: TTEFVeSPagueExibeMenuCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFVeSPague_SetOnObtemCampo(const tefHandle: PTEFHandle;
  const method: TTEFVeSPagueObtemCampoCalback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region TEFDial}

function TEF_TEFDial_GetAutoAtivarGP(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDial_SetAutoAtivarGP(const tefHandle: PTEFHandle;
  const AutoAtivarGP: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDial_GetNumVias(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDial_SetNumVias(const tefHandle: PTEFHandle;
  const NumVias: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDial_GetEsperaSTS(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDial_SetEsperaSTS(const tefHandle: PTEFHandle;
  const EsperaSTS: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDial_GetArqTemp(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDial_SetArqTemp(const tefHandle: PTEFHandle;
  const ArqTemp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDial_GetArqReq(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDial_SetArqReq(const tefHandle: PTEFHandle;
  const ArqReq: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDial_GetArqSTS(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDial_SetArqSTS(const tefHandle: PTEFHandle;
  const ArqSTS: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDial_GetArqResp(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDial_SetArqResp(const tefHandle: PTEFHandle;
  const ArqResp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDial_GetGPExeName(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDial_SetGPExeName(const tefHandle: PTEFHandle;
  const GPExeName: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDial_GetName(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDial_SetName(const tefHandle: PTEFHandle; const Name: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDial_GetHabilitado(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDial_SetHabilitado(const tefHandle: PTEFHandle;
  const Habilitado: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region TEFDisc}

function TEF_TEFDisc_GetAutoAtivarGP(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDisc_SetAutoAtivarGP(const tefHandle: PTEFHandle;
  const AutoAtivarGP: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDisc_GetNumVias(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDisc_SetNumVias(const tefHandle: PTEFHandle;
  const NumVias: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDisc_GetEsperaSTS(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDisc_SetEsperaSTS(const tefHandle: PTEFHandle;
  const EsperaSTS: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDisc_GetArqTemp(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDisc_SetArqTemp(const tefHandle: PTEFHandle;
  const ArqTemp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDisc_GetArqReq(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDisc_SetArqReq(const tefHandle: PTEFHandle;
  const ArqReq: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDisc_GetArqSTS(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDisc_SetArqSTS(const tefHandle: PTEFHandle;
  const ArqSTS: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDisc_GetArqResp(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDisc_SetArqResp(const tefHandle: PTEFHandle;
  const ArqResp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDisc_GetGPExeName(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDisc_SetGPExeName(const tefHandle: PTEFHandle;
  const GPExeName: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDisc_GetName(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDisc_SetName(const tefHandle: PTEFHandle; const Name: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDisc_GetHabilitado(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFDisc_SetHabilitado(const tefHandle: PTEFHandle;
  const Habilitado: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region TEFHiper}

function TEF_TEFHiper_GetAutoAtivarGP(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFHiper_SetAutoAtivarGP(const tefHandle: PTEFHandle;
  const AutoAtivarGP: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFHiper_GetNumVias(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFHiper_SetNumVias(const tefHandle: PTEFHandle;
  const NumVias: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFHiper_GetEsperaSTS(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFHiper_SetEsperaSTS(const tefHandle: PTEFHandle;
  const EsperaSTS: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFHiper_GetArqTemp(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFHiper_SetArqTemp(const tefHandle: PTEFHandle;
  const ArqTemp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFHiper_GetArqReq(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFHiper_SetArqReq(const tefHandle: PTEFHandle;
  const ArqReq: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFHiper_GetArqSTS(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFHiper_SetArqSTS(const tefHandle: PTEFHandle;
  const ArqSTS: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFHiper_GetArqResp(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFHiper_SetArqResp(const tefHandle: PTEFHandle;
  const ArqResp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFHiper_GetGPExeName(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFHiper_SetGPExeName(const tefHandle: PTEFHandle;
  const GPExeName: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFHiper_GetName(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFHiper_SetName(const tefHandle: PTEFHandle; const Name: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFHiper_GetHabilitado(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFHiper_SetHabilitado(const tefHandle: PTEFHandle;
  const Habilitado: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region TEFGPU}

function TEF_TEFGPU_GetAutoAtivarGP(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGPU_SetAutoAtivarGP(const tefHandle: PTEFHandle;
  const AutoAtivarGP: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGPU_GetNumVias(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGPU_SetNumVias(const tefHandle: PTEFHandle;
  const NumVias: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGPU_GetEsperaSTS(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGPU_SetEsperaSTS(const tefHandle: PTEFHandle;
  const EsperaSTS: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGPU_GetArqTemp(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGPU_SetArqTemp(const tefHandle: PTEFHandle;
  const ArqTemp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGPU_GetArqReq(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGPU_SetArqReq(const tefHandle: PTEFHandle;
  const ArqReq: PChar): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGPU_GetArqSTS(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGPU_SetArqSTS(const tefHandle: PTEFHandle;
  const ArqSTS: PChar): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGPU_GetArqResp(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGPU_SetArqResp(const tefHandle: PTEFHandle;
  const ArqResp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGPU_GetGPExeName(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGPU_SetGPExeName(const tefHandle: PTEFHandle;
  const GPExeName: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGPU_GetName(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGPU_SetName(const tefHandle: PTEFHandle; const Name: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGPU_GetHabilitado(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGPU_SetHabilitado(const tefHandle: PTEFHandle;
  const Habilitado: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region TEFAuttar}

function TEF_TEFAuttar_GetAutoAtivarGP(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFAuttar_SetAutoAtivarGP(const tefHandle: PTEFHandle;
  const AutoAtivarGP: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFAuttar_GetNumVias(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFAuttar_SetNumVias(const tefHandle: PTEFHandle;
  const NumVias: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFAuttar_GetEsperaSTS(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFAuttar_SetEsperaSTS(const tefHandle: PTEFHandle;
  const EsperaSTS: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFAuttar_GetArqTemp(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFAuttar_SetArqTemp(const tefHandle: PTEFHandle;
  const ArqTemp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFAuttar_GetArqReq(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFAuttar_SetArqReq(const tefHandle: PTEFHandle;
  const ArqReq: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFAuttar_GetArqSTS(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFAuttar_SetArqSTS(const tefHandle: PTEFHandle;
  const ArqSTS: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFAuttar_GetArqResp(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFAuttar_SetArqResp(const tefHandle: PTEFHandle;
  const ArqResp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFAuttar_GetGPExeName(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFAuttar_SetGPExeName(const tefHandle: PTEFHandle;
  const GPExeName: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFAuttar_GetName(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFAuttar_SetName(const tefHandle: PTEFHandle; const Name: PChar): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFAuttar_GetHabilitado(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFAuttar_SetHabilitado(const tefHandle: PTEFHandle;
  const Habilitado: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region TEFBanese}

function TEF_TEFBanese_GetNumVias(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFBanese_SetNumVias(const tefHandle: PTEFHandle;
  const NumVias: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFBanese_GetArqTemp(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFBanese_SetArqTemp(const tefHandle: PTEFHandle;
  const ArqTemp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFBanese_GetArqReq(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFBanese_SetArqReq(const tefHandle: PTEFHandle;
  const ArqReq: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFBanese_GetArqSTS(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFBanese_SetArqSTS(const tefHandle: PTEFHandle;
  const ArqSTS: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFBanese_GetArqResp(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFBanese_SetArqResp(const tefHandle: PTEFHandle;
  const ArqResp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFBanese_GetName(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFBanese_SetName(const tefHandle: PTEFHandle; const Name: PChar): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFBanese_GetHabilitado(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFBanese_SetHabilitado(const tefHandle: PTEFHandle;
  const Habilitado: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region TEFGood}

function TEF_TEFGood_GetAutoAtivarGP(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGood_SetAutoAtivarGP(const tefHandle: PTEFHandle;
  const AutoAtivarGP: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGood_GetNumVias(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGood_SetNumVias(const tefHandle: PTEFHandle;
  const NumVias: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGood_GetEsperaSTS(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGood_SetEsperaSTS(const tefHandle: PTEFHandle;
  const EsperaSTS: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGood_GetArqTemp(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGood_SetArqTemp(const tefHandle: PTEFHandle;
  const ArqTemp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGood_GetArqReq(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGood_SetArqReq(const tefHandle: PTEFHandle;
  const ArqReq: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGood_GetArqSTS(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGood_SetArqSTS(const tefHandle: PTEFHandle;
  const ArqSTS: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGood_GetArqResp(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGood_SetArqResp(const tefHandle: PTEFHandle;
  const ArqResp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGood_GetGPExeName(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGood_SetGPExeName(const tefHandle: PTEFHandle;
  const GPExeName: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGood_GetName(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGood_SetName(const tefHandle: PTEFHandle; const Name: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGood_GetHabilitado(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFGood_SetHabilitado(const tefHandle: PTEFHandle;
  const Habilitado: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region TEFFoxWin}

function TEF_TEFFoxWin_GetAutoAtivarGP(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFFoxWin_SetAutoAtivarGP(const tefHandle: PTEFHandle;
  const AutoAtivarGP: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFFoxWin_GetNumVias(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFFoxWin_SetNumVias(const tefHandle: PTEFHandle;
  const NumVias: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFFoxWin_GetEsperaSTS(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFFoxWin_SetEsperaSTS(const tefHandle: PTEFHandle;
  const EsperaSTS: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFFoxWin_GetArqTemp(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFFoxWin_SetArqTemp(const tefHandle: PTEFHandle;
  const ArqTemp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFFoxWin_GetArqReq(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFFoxWin_SetArqReq(const tefHandle: PTEFHandle;
  const ArqReq: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFFoxWin_GetArqSTS(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFFoxWin_SetArqSTS(const tefHandle: PTEFHandle;
  const ArqSTS: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFFoxWin_GetArqResp(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFFoxWin_SetArqResp(const tefHandle: PTEFHandle;
  const ArqResp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFFoxWin_GetGPExeName(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFFoxWin_SetGPExeName(const tefHandle: PTEFHandle;
  const GPExeName: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFFoxWin_GetName(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFFoxWin_SetName(const tefHandle: PTEFHandle; const Name: PChar): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFFoxWin_GetHabilitado(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFFoxWin_SetHabilitado(const tefHandle: PTEFHandle;
  const Habilitado: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region TEFPetrocard}

function TEF_TEFPetrocard_GetAutoAtivarGP(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFPetrocard_SetAutoAtivarGP(const tefHandle: PTEFHandle;
  const AutoAtivarGP: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFPetrocard_GetNumVias(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFPetrocard_SetNumVias(const tefHandle: PTEFHandle;
  const NumVias: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFPetrocard_GetEsperaSTS(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFPetrocard_SetEsperaSTS(const tefHandle: PTEFHandle;
  const EsperaSTS: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFPetrocard_GetArqTemp(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFPetrocard_SetArqTemp(const tefHandle: PTEFHandle;
  const ArqTemp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFPetrocard_GetArqReq(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFPetrocard_SetArqReq(const tefHandle: PTEFHandle;
  const ArqReq: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFPetrocard_GetArqSTS(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFPetrocard_SetArqSTS(const tefHandle: PTEFHandle;
  const ArqSTS: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFPetrocard_GetArqResp(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFPetrocard_SetArqResp(const tefHandle: PTEFHandle;
  const ArqResp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFPetrocard_GetGPExeName(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFPetrocard_SetGPExeName(const tefHandle: PTEFHandle;
  const GPExeName: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFPetrocard_GetName(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFPetrocard_SetName(const tefHandle: PTEFHandle;
  const Name: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFPetrocard_GetHabilitado(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFPetrocard_SetHabilitado(const tefHandle: PTEFHandle;
  const Habilitado: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region TEFCrediShop}

function TEF_TEFCrediShop_GetAutoAtivarGP(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCrediShop_SetAutoAtivarGP(const tefHandle: PTEFHandle;
  const AutoAtivarGP: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCrediShop_GetNumVias(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCrediShop_SetNumVias(const tefHandle: PTEFHandle;
  const NumVias: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCrediShop_GetEsperaSTS(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCrediShop_SetEsperaSTS(const tefHandle: PTEFHandle;
  const EsperaSTS: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCrediShop_GetArqTemp(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCrediShop_SetArqTemp(const tefHandle: PTEFHandle;
  const ArqTemp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCrediShop_GetArqReq(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCrediShop_SetArqReq(const tefHandle: PTEFHandle;
  const ArqReq: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCrediShop_GetArqSTS(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCrediShop_SetArqSTS(const tefHandle: PTEFHandle;
  const ArqSTS: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCrediShop_GetArqResp(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCrediShop_SetArqResp(const tefHandle: PTEFHandle;
  const ArqResp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCrediShop_GetGPExeName(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCrediShop_SetGPExeName(const tefHandle: PTEFHandle;
  const GPExeName: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCrediShop_GetName(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCrediShop_SetName(const tefHandle: PTEFHandle;
  const Name: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCrediShop_GetHabilitado(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_TEFCrediShop_SetHabilitado(const tefHandle: PTEFHandle;
  const Habilitado: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Eventos}

function TEF_SetOnAguardaResp(const tefHandle: PTEFHandle;
  const method: TAguardaRespCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_SetOnExibeMsg(const tefHandle: PTEFHandle;
  const method: TExibeMsgCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_SetOnBloqueiaMouseTeclado(const tefHandle: PTEFHandle;
  const method: TBloqueiaMouseTecladoCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_SetOnRestauraFocoAplicacao(const tefHandle: PTEFHandle;
  const method: TExecutaAcaoCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_SetOnLimpaTeclado(const tefHandle: PTEFHandle;
  const method: TExecutaAcaoCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_SetOnComandaECF(const tefHandle: PTEFHandle;
  const method: TComandaECFCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_SetOnComandaECFSubtotaliza(const tefHandle: PTEFHandle;
  const method: TComandaECFSubtotalizaCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_SetOnComandaECFPagamento(const tefHandle: PTEFHandle;
  const method: TComandaECFPagamentoCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_SetOnComandaECFAbreVinculado(const tefHandle: PTEFHandle;
  const method: TComandaECFAbreVinculadoCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_SetOnComandaECFImprimeVia(const tefHandle: PTEFHandle;
  const method: TComandaECFImprimeViaCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_SetOnInfoECF(const tefHandle: PTEFHandle;
  const method: TInfoECFCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
function TEF_SetOnAntesFinalizarRequisicao(const tefHandle: PTEFHandle;
  const method: TAntesFinalizarRequisicaoCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_SetOnDepoisConfirmarTransacoes(const tefHandle: PTEFHandle;
  const method: TDepoisConfirmarTransacoes): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_SetOnAntesCancelarTransacao(const tefHandle: PTEFHandle;
  const method: TAntesCancelarTransacaoCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_SetOnDepoisCancelarTransacoes(const tefHandle: PTEFHandle;
  const method: TDepoisCancelarTransacoesCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_SetOnMudaEstadoReq(const tefHandle: PTEFHandle;
  const method: TMudaEstadoReqCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function TEF_SetOnMudaEstadoResp(const tefHandle: PTEFHandle;
  const method: TMudaEstadoRespCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%endregion}

implementation

{%region Constructor/Destructor}

{
PADRONIZAÇÃO DAS FUNÇÕES:

        PARÂMETROS:
        Todas as funções recebem o parâmetro "handle" que é o ponteiro
        para o componente instanciado; Este ponteiro deve ser armazenado
        pela aplicação que utiliza a DLL;

        RETORNO:
        Todas as funções da biblioteca retornam um Integer com as possíveis Respostas:

                MAIOR OU IGUAL A ZERO: SUCESSO
                Outos retornos maior que zero indicam sucesso, com valor específico de cada função.

                MENOR QUE ZERO: ERROS

                  -1 : Erro ao executar;
                       Vide UltimoErro

                  -2 : ACBr não inicializado.

                  Outros retornos negativos indicam erro específico de cada função;

                  A função "UltimoErro" retornará a mensagem da última exception disparada pelo componente.
}

{
CRIA um novo componente TACBrECF retornando o ponteiro para o objeto criado.
Este ponteiro deve ser armazenado pela aplicação que utiliza a DLL e informado
em todas as chamadas de função relativas ao TACBrECF
}
function TEF_Create(var tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try

    New(tefHandle);

    tefHandle^.TEF := TACBrTEFD.Create(nil);
    tefHandle^.EventHandlers := TEventHandlersTEF.Create();
    tefHandle^.UltimoErro := '';
    Result := 0;

  except
    on Exception: Exception do
    begin
      Result := -1;
      tefHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

{
DESTRÓI o objeto TACBrECF e libera a memória utilizada.
Esta função deve SEMPRE ser chamada pela aplicação que utiliza a DLL
quando o componente não mais for utilizado.
}
function TEF_Destroy(tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    tefHandle^.TEF.Destroy();
    tefHandle^.TEF := nil;

    Dispose(tefHandle);
    tefHandle := nil;
    Result := 0;

  except
    on Exception: Exception do
    begin
      Result := -1;
      tefHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

function TEF_GetUltimoErro(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try
    StrPLCopy(Buffer, tefHandle^.UltimoErro, BufferLen);
    Result := length(tefHandle^.UltimoErro);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Propriedades Componente}

function TEF_SetAutoAtivar(const tefHandle: PTEFHandle; const Ativar: boolean): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.AutoAtivarGP := Ativar;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_GetAutoAtivar(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if tefHandle^.TEF.AutoAtivarGP then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_GetGPAtual(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(tefHandle^.TEF.GPAtual);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_SetGPAtual(const tefHandle: PTEFHandle; GP: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.GPAtual := TACBrTEFDTipo(GP);
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_SetMultiplosCartoes(const tefHandle: PTEFHandle;
  const Ativar: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.MultiplosCartoes := Ativar;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_GetMultiplosCartoes(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if tefHandle^.TEF.MultiplosCartoes then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_SetAutoEfetuarPagamento(const tefHandle: PTEFHandle;
  const Ativar: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.AutoEfetuarPagamento := Ativar;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_GetAutoEfetuarPagamento(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if tefHandle^.TEF.AutoEfetuarPagamento then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_SetAutoFinalizarCupom(const tefHandle: PTEFHandle;
  const Ativar: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.AutoFinalizarCupom := Ativar;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_GetAutoFinalizarCupom(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if tefHandle^.TEF.AutoFinalizarCupom then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_SetCHQEmGerencial(const tefHandle: PTEFHandle;
  const Ativar: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.CHQEmGerencial := Ativar;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_GetCHQEmGerencial(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if tefHandle^.TEF.CHQEmGerencial then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_SetEsperaSleep(const tefHandle: PTEFHandle; const Sleep: integer): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.EsperaSleep := Sleep;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_GetEsperaSleep(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.EsperaSleep;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_SetEsperaSTS(const tefHandle: PTEFHandle; const STS: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.EsperaSTS := STS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_GetEsperaSTS(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.EsperaSTS;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_SetNumVias(const tefHandle: PTEFHandle; const Vias: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.NumVias := Vias;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_GetNumVias(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.NumVias;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_SetNumeroMaximoCartoes(const tefHandle: PTEFHandle;
  const Cartoes: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.NumeroMaximoCartoes := Cartoes;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_GetNumeroMaximoCartoes(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.NumeroMaximoCartoes;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_SetArqLOG(const tefHandle: PTEFHandle; const Log: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.ArqLOG := Log;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_GetArqLOG(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.ArqLOG;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_SetExibirMsgAutenticacao(const tefHandle: PTEFHandle;
  const Ativar: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.ExibirMsgAutenticacao := Ativar;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_GetExibirMsgAutenticacao(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if tefHandle^.TEF.ExibirMsgAutenticacao then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_SetPathBackup(const tefHandle: PTEFHandle; const Path: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.PathBackup := Path;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_GetPathBackup(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.PathBackup;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_SetTrocoMaximo(const tefHandle: PTEFHandle; const troco: double): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TrocoMaximo := troco;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_GetTrocoMaximo(const tefHandle: PTEFHandle; var troco: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    troco := tefHandle^.TEF.TrocoMaximo;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_GetAbout(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.About;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_GetReq(const tefHandle: PTEFHandle; var reqHandle: TACBrTEFDReq): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    reqHandle := tefHandle^.TEF.Req;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_GetResp(const tefHandle: PTEFHandle;
  var respHandle: TACBrTEFDResp): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    respHandle := tefHandle^.TEF.Resp;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_GetRespostasPendentes(const tefHandle: PTEFHandle;
  var respHandle: TACBrTEFDRespostasPendentes): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    respHandle := tefHandle^.TEF.RespostasPendentes;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_SetSuportaDesconto(const tefHandle: PTEFHandle;
  const Value: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.SuportaDesconto := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_GetSuportaDesconto(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if tefHandle^.TEF.SuportaDesconto then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_SetSuportaSaque(const tefHandle: PTEFHandle;
  const Value: boolean): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.SuportaSaque := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_GetSuportaSaque(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if tefHandle^.TEF.SuportaSaque then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Funções TEF}

function TEF_Inicializar(const tefHandle: PTEFHandle; GP: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.Inicializar(TACBrTEFDTipo(GP));
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_DesInicializar(const tefHandle: PTEFHandle; GP: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.DesInicializar(TACBrTEFDTipo(GP));
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_Inicializado(const tefHandle: PTEFHandle; const GP: integer): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  ret: boolean;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ret := tefHandle^.TEF.Inicializado(TACBrTEFDTipo(GP));
    if (ret) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_AtivarGP(const tefHandle: PTEFHandle; GP: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.AtivarGP(TACBrTEFDTipo(GP));
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_ATV(const tefHandle: PTEFHandle; const GP: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.ATV(TACBrTEFDTipo(GP));
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_ADM(const tefHandle: PTEFHandle; const GP: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  ret: boolean;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ret := tefHandle^.TEF.ADM(TACBrTEFDTipo(GP));
    if (ret) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_CNC(const tefHandle: PTEFHandle; const Rede: PChar;
  const NSU: PChar; const DataHoraTransacao: double; const Valor: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  ret: boolean;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ret := tefHandle^.TEF.CNC(Rede, NSU, TDateTime(DataHoraTransacao), Valor);
    if (ret) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_CNF(const tefHandle: PTEFHandle; const Rede: PChar;
  const NSU: PChar; const Finalizacao: PChar; const DocumentoVinculado: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.CNF(Rede, NSU, Finalizacao, DocumentoVinculado);
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_NCN(const tefHandle: PTEFHandle; const Rede: PChar;
  const NSU: PChar; const Finalizacao: PChar; const Valor: double;
  const DocumentoVinculado: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.NCN(Rede, NSU, Finalizacao, Valor, DocumentoVinculado);
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_CRT(const tefHandle: PTEFHandle; const Valor: double;
  const IndiceFPG_ECF: PChar; const DocumentoVinculado: PChar;
  const Moeda: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  ret: boolean;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ret := tefHandle^.TEF.CRT(Valor, IndiceFPG_ECF, DocumentoVinculado, Moeda);
    if (ret) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_CHQ(const tefHandle: PTEFHandle; const Valor: double;
  const IndiceFPG_ECF: PChar; const DocumentoVinculado: PChar;
  const CMC7: PChar; const TipoPessoa: char; const DocumentoPessoa: PChar;
  const DataCheque: double; const Banco: PChar; const Agencia: PChar;
  const AgenciaDC: PChar; const Conta: PChar; const ContaDC: PChar;
  const Cheque: PChar; const ChequeDC: PChar; const Compensacao: PChar): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  ret: boolean;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    ret := tefHandle^.TEF.CHQ(Valor, IndiceFPG_ECF, DocumentoVinculado,
      CMC7, TipoPessoa, DocumentoPessoa, DataCheque, Banco, Agencia,
      AgenciaDC, Conta, ContaDC, Cheque, ChequeDC, Compensacao);
    if (ret) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_CancelarTransacoesPendentes(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.CancelarTransacoesPendentes;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_ConfirmarTransacoesPendentes(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.ConfirmarTransacoesPendentes;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_ImprimirTransacoesPendentes(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.ImprimirTransacoesPendentes;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_FinalizarCupom(const tefHandle: PTEFHandle; const mouse: boolean): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.FinalizarCupom(mouse);
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region Identificacao}

function TEF_Identificacao_GetNomeAplicacao(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.Identificacao.NomeAplicacao;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Identificacao_SetNomeAplicacao(const tefHandle: PTEFHandle;
  const NomeAplicacao: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.Identificacao.NomeAplicacao := NomeAplicacao;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_Identificacao_GetVersaoAplicacao(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.Identificacao.VersaoAplicacao;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Identificacao_SetVersaoAplicacao(const tefHandle: PTEFHandle;
  const VersaoAplicacao: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.Identificacao.VersaoAplicacao := VersaoAplicacao;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_Identificacao_GetSoftwareHouse(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.Identificacao.SoftwareHouse;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Identificacao_SetSoftwareHouse(const tefHandle: PTEFHandle;
  const SoftwareHouse: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.Identificacao.SoftwareHouse := SoftwareHouse;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_Identificacao_GetRazaoSocial(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.Identificacao.RazaoSocial;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Identificacao_SetRazaoSocial(const tefHandle: PTEFHandle;
  const RazaoSocial: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.Identificacao.RazaoSocial := RazaoSocial;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region Req}

function TEF_Req_GetHeader(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := reqHandle.Header;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Req_SetHeader(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const Header: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    reqHandle.Header := Header;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_Req_GetDocumentoVinculado(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := reqHandle.DocumentoVinculado;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Req_SetDocumentoVinculado(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const DocumentoVinculado: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    reqHandle.DocumentoVinculado := DocumentoVinculado;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_Req_GetCMC7(const tefHandle: PTEFHandle; const reqHandle: TACBrTEFDReq;
  Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := reqHandle.CMC7;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Req_SetCMC7(const tefHandle: PTEFHandle; const reqHandle: TACBrTEFDReq;
  const CMC7: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    reqHandle.CMC7 := CMC7;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_Req_GetDocumentoPessoa(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := reqHandle.DocumentoPessoa;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Req_SetDocumentoPessoa(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const DocumentoPessoa: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    reqHandle.DocumentoPessoa := DocumentoPessoa;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_Req_GetRede(const tefHandle: PTEFHandle; const reqHandle: TACBrTEFDReq;
  Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := reqHandle.Rede;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Req_SetRede(const tefHandle: PTEFHandle; const reqHandle: TACBrTEFDReq;
  const Rede: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    reqHandle.Rede := Rede;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_Req_GetNSU(const tefHandle: PTEFHandle; const reqHandle: TACBrTEFDReq;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := reqHandle.NSU;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Req_SetNSU(const tefHandle: PTEFHandle; const reqHandle: TACBrTEFDReq;
  const NSU: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    reqHandle.NSU := NSU;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_Req_GetFinalizacao(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := reqHandle.Finalizacao;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Req_SetFinalizacao(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const Finalizacao: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    reqHandle.Finalizacao := Finalizacao;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_Req_GetBanco(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := reqHandle.Banco;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Req_SetBanco(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const Banco: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    reqHandle.Banco := Banco;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_Req_GetAgencia(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := reqHandle.Agencia;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Req_SetAgencia(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const Agencia: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    reqHandle.Agencia := Agencia;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_Req_GetAgenciaDC(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := reqHandle.AgenciaDC;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Req_SetAgenciaDC(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const AgenciaDC: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    reqHandle.AgenciaDC := AgenciaDC;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_Req_GetConta(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := reqHandle.Conta;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Req_SetConta(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const Conta: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    reqHandle.Conta := Conta;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_Req_GetContaDC(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := reqHandle.ContaDC;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Req_SetContaDC(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const ContaDC: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    reqHandle.ContaDC := ContaDC;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_Req_GetCheque(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := reqHandle.Cheque;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Req_SetCheque(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const Cheque: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    reqHandle.Cheque := Cheque;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_Req_GetChequeDC(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := reqHandle.ChequeDC;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Req_SetChequeDC(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const ChequeDC: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    reqHandle.ChequeDC := ChequeDC;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;


function TEF_Req_GetID(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := reqHandle.ID;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_Req_SetID(const tefHandle: PTEFHandle; const reqHandle: TACBrTEFDReq;
  const ID: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    reqHandle.ID := ID;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_Req_GetMoeda(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := reqHandle.Moeda;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_Req_SetMoeda(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const Moeda: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    reqHandle.Moeda := Moeda;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_Req_GetTipoPessoa(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(reqHandle.TipoPessoa);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_Req_SetTipoPessoa(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const TipoPessoa: AnsiChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    reqHandle.TipoPessoa := TipoPessoa;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_Req_GetValorTotal(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; var ValorTotal: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ValorTotal := reqHandle.ValorTotal;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_Req_SetValorTotal(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const ValorTotal: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    reqHandle.ValorTotal := ValorTotal;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_Req_GetDataCheque(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; var DataCheque: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    DataCheque := double(reqHandle.DataCheque);
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_Req_SetDataCheque(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const DataCheque: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    reqHandle.DataCheque := TDateTime(DataCheque);
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_Req_GetDataHoraTransacaoComprovante(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; var DataHoraTransacaoComprovante: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    DataHoraTransacaoComprovante := double(reqHandle.DataHoraTransacaoComprovante);
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_Req_SetDataHoraTransacaoComprovante(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; const DataHoraTransacaoComprovante: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    reqHandle.DataHoraTransacaoComprovante := TDateTime(DataHoraTransacaoComprovante);
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_Req_GravaInformacao(const tefHandle: PTEFHandle;
  const reqHandle: TACBrTEFDReq; Identificacao, Sequencia: integer;
  Informacao: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    reqHandle.GravaInformacao(Identificacao, Sequencia, Informacao);
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region Resp}

function TEF_Resp_GetHeader(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.Header;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetDocumentoVinculado(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.DocumentoVinculado;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetCMC7(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.CMC7;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetTipoPessoa(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.TipoPessoa;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetDocumentoPessoa(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.DocumentoPessoa;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetRede(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.Rede;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetNSU(const tefHandle: PTEFHandle; const respHandle: TACBrTEFDResp;
  Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.NSU;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetFinalizacao(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.Finalizacao;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetStatusTransacao(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.StatusTransacao;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetNSUTransacaoCancelada(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.NSUTransacaoCancelada;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetTextoEspecialOperador(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.TextoEspecialOperador;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetTextoEspecialCliente(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.TextoEspecialOperador;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetAutenticacao(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.Autenticacao;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetBanco(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.Banco;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetAgencia(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.Agencia;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetAgenciaDC(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.AgenciaDC;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetConta(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.Conta;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetContaDC(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.ContaDC;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetCheque(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.Cheque;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetChequeDC(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.ChequeDC;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetNomeAdministradora(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.NomeAdministradora;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetTrailer(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.Trailer;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetArqBackup(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.ArqBackup;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetArqRespPendente(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.ArqRespPendente;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetIndiceFPG_ECF(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.IndiceFPG_ECF;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetInstituicao(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.Instituicao;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetModalidadePagto(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.ModalidadePagto;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetModalidadePagtoDescrita(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.ModalidadePagtoDescrita;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetModalidadeExtenso(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.ModalidadeExtenso;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetCodigoRedeAutorizada(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.CodigoRedeAutorizada;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetID(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := respHandle.ID;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetMoeda(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := respHandle.Moeda;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetTipoTransacao(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := respHandle.TipoTransacao;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetCodigoAutorizacaoTransacao(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.CodigoAutorizacaoTransacao;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetNumeroLoteTransacao(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := respHandle.NumeroLoteTransacao;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetTipoParcelamento(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := respHandle.TipoParcelamento;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetQtdParcelas(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := respHandle.QtdParcelas;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetQtdLinhasComprovante(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := respHandle.QtdLinhasComprovante;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetOrdemPagamento(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := respHandle.OrdemPagamento;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetTipoGP(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(respHandle.TipoGP);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetParceladoPor(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(respHandle.ParceladoPor);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetTipoOperacao(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(respHandle.TipoOperacao);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetCNFEnviado(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (respHandle.CNFEnviado) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetTransacaoAprovada(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (respHandle.TransacaoAprovada) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetDebito(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (respHandle.Debito) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetCredito(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (respHandle.Credito) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetValorTotal(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; var ValorTotal: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ValorTotal := respHandle.ValorTotal;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetValorOriginal(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; var ValorOriginal: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ValorOriginal := respHandle.ValorOriginal;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetSaque(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; var Saque: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Saque := respHandle.Saque;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetDesconto(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; var Desconto: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Desconto := respHandle.Desconto;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetValorEntradaCDC(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; var ValorEntradaCDC: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ValorEntradaCDC := respHandle.ValorEntradaCDC;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetDataCheque(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; var DataCheque: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    DataCheque := respHandle.DataCheque;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetDataHoraTransacaoHost(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; var DataHoraTransacaoHost: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    DataHoraTransacaoHost := respHandle.DataHoraTransacaoHost;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetDataHoraTransacaoLocal(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; var DataHoraTransacaoLocal: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    DataHoraTransacaoLocal := respHandle.DataHoraTransacaoLocal;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetDataPreDatado(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; var DataPreDatado: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    DataPreDatado := respHandle.DataPreDatado;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetDataHoraTransacaoCancelada(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; var DataHoraTransacaoCancelada: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    DataHoraTransacaoCancelada := respHandle.DataHoraTransacaoCancelada;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetDataHoraTransacaoComprovante(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; var DataHoraTransacaoComprovante: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    DataHoraTransacaoComprovante := respHandle.DataHoraTransacaoComprovante;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetDataVencimento(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; var DataVencimento: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    DataVencimento := respHandle.DataVencimento;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetDataEntradaCDC(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; var DataEntradaCDC: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    DataEntradaCDC := respHandle.DataEntradaCDC;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetImagemComprovante1aViaCount(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := respHandle.ImagemComprovante1aVia.Count;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetImagemComprovante1aViaLinha(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer;
  const linha: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.ImagemComprovante1aVia[linha];
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetImagemComprovante2aViaCount(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := respHandle.ImagemComprovante2aVia.Count;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_GetImagemComprovante2aViaLinha(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar; const BufferLen: integer;
  const linha: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.ImagemComprovante2aVia[linha];
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_Resp_LeInformacao(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDResp; Buffer: PChar;
  const BufferLen, Identificacao, Sequencia: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := respHandle.LeInformacao(Identificacao, Sequencia).AsString;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

//Parcelas : TACBrTEFDRespParcelas read fpParcelas ;
{%endregion}

{%region Respostas Pendentes}

function TEF_RespostasPendentes_GetSaldoAPagar(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDRespostasPendentes; var SaldoAPagar: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    SaldoAPagar := respHandle.SaldoAPagar;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_RespostasPendentes_GetItem(const tefHandle: PTEFHandle;
  const respPendenteHandle: TACBrTEFDRespostasPendentes; const index: integer;
  var respHandle: TACBrTEFDResp): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    respHandle := respPendenteHandle[index];
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_RespostasPendentes_GetTotalPago(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDRespostasPendentes; var TotalPago: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    TotalPago := respHandle.TotalPago;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_RespostasPendentes_GetTotalDesconto(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDRespostasPendentes; var TotalDesconto: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    TotalDesconto := respHandle.TotalDesconto;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_RespostasPendentes_GetSaldoRestante(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDRespostasPendentes; var SaldoRestante: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    SaldoRestante := respHandle.SaldoRestante;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_RespostasPendentes_GetCount(const tefHandle: PTEFHandle;
  const respHandle: TACBrTEFDRespostasPendentes): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := respHandle.Count;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region TEFCliSiTef}

function TEF_TEFCliSiTef_GetArqLOG(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFCliSiTef.ArqLOG;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFCliSiTef_SetArqLOG(const tefHandle: PTEFHandle;
  const ArqLOG: PChar): integer;
    {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFCliSiTef.ArqLOG := ArqLOG;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCliSiTef_GetEnderecoIP(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFCliSiTef.EnderecoIP;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFCliSiTef_SetEnderecoIP(const tefHandle: PTEFHandle;
  const EnderecoIP: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFCliSiTef.EnderecoIP := EnderecoIP;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCliSiTef_GetExibirErroRetorno(const tefHandle: PTEFHandle): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if tefHandle^.TEF.TEFCliSiTef.ExibirErroRetorno then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFCliSiTef_SetExibirErroRetorno(const tefHandle: PTEFHandle;
  const ExibirErroRetorno: boolean): integer;
    {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFCliSiTef.ExibirErroRetorno := ExibirErroRetorno;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCliSiTef_GetCodigoLoja(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFCliSiTef.CodigoLoja;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFCliSiTef_SetCodigoLoja(const tefHandle: PTEFHandle;
  const CodigoLoja: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFCliSiTef.CodigoLoja := CodigoLoja;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCliSiTef_GetDataHoraFiscal(const tefHandle: PTEFHandle;
  var DataHoraFiscal: double): integer;
    {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    DataHoraFiscal := double(tefHandle^.TEF.TEFCliSiTef.DataHoraFiscal);
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCliSiTef_SetDataHoraFiscal(const tefHandle: PTEFHandle;
  const DataHoraFiscal: double): integer;
    {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFCliSiTef.DataHoraFiscal := DataHoraFiscal;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCliSiTef_GetDocumentoFiscal(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer;
    {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFCliSiTef.DocumentoFiscal;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFCliSiTef_SetDocumentoFiscal(const tefHandle: PTEFHandle;
  const DocumentoFiscal: PChar): integer;
    {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFCliSiTef.DocumentoFiscal := DocumentoFiscal;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCliSiTef_GetNumeroTerminal(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFCliSiTef.NumeroTerminal;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFCliSiTef_SetNumeroTerminal(const tefHandle: PTEFHandle;
  const NumeroTerminal: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFCliSiTef.NumeroTerminal := NumeroTerminal;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCliSiTef_GetOperador(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFCliSiTef.Operador;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFCliSiTef_SetOperador(const tefHandle: PTEFHandle;
  const Operador: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFCliSiTef.Operador := Operador;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCliSiTef_GetRestricoes(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFCliSiTef.Restricoes;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFCliSiTef_SetRestricoes(const tefHandle: PTEFHandle;
  const Restricoes: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFCliSiTef.Restricoes := Restricoes;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCliSiTef_GetUsaUTF8(const tefHandle: PTEFHandle): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if tefHandle^.TEF.TEFCliSiTef.UsaUTF8 then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFCliSiTef_SetUsaUTF8(const tefHandle: PTEFHandle;
  const UsaUTF8: boolean): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFCliSiTef.UsaUTF8 := UsaUTF8;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCliSiTef_GetName(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFCliSiTef.Name;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFCliSiTef_SetName(const tefHandle: PTEFHandle;
  const Name: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFCliSiTef.Name := Name;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCliSiTef_GetHabilitado(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if tefHandle^.TEF.TEFCliSiTef.Habilitado then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFCliSiTef_SetHabilitado(const tefHandle: PTEFHandle;
  const Habilitado: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFCliSiTef.Habilitado := Habilitado;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCliSiTef_GetLogDebug(const tefHandle: PTEFHandle): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if tefHandle^.TEF.TEFCliSiTef.LogDebug then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFCliSiTef_SetLogDebug(const tefHandle: PTEFHandle;
  const LogDebug: boolean): integer;
    {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFCliSiTef.LogDebug := LogDebug;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCliSiTef_GetParametrosAdicionaisCount(
  const tefHandle: PTEFHandle): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.TEFCliSiTef.ParametrosAdicionais.Count;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCliSiTef_GetParametrosAdicionais(const tefHandle: PTEFHandle;
  linha: PChar; const BufferLen, index: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  strTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (index >= 0) and (index <
      tefHandle^.TEF.TEFCliSiTef.ParametrosAdicionais.Count) then
    begin
      strTmp := tefHandle^.TEF.TEFCliSiTef.ParametrosAdicionais[index];
      StrPLCopy(linha, strTmp, BufferLen);
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCliSiTef_GetPortaPinPad(const tefHandle: PTEFHandle): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.TEFCliSiTef.PortaPinPad;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCliSiTef_SetPortaPinPad(const tefHandle: PTEFHandle;
  const PortaPinPad: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFCliSiTef.PortaPinPad := PortaPinPad;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCliSiTef_SetParametrosAdicionais(const tefHandle: PTEFHandle;
  const linhas: array of PChar; const LinhasCount: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  i: integer;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    for i := 0 to LinhasCount - 1 do
    begin
      tefHandle^.TEF.TEFCliSiTef.ParametrosAdicionais.Add(linhas[i]);
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFCliSiTef_GetOperacaoATV(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.TEFCliSiTef.OperacaoATV;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCliSiTef_SetOperacaoATV(const tefHandle: PTEFHandle;
  const OperacaoATV: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFCliSiTef.OperacaoATV := OperacaoATV;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCliSiTef_GetOperacaoADM(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.TEFCliSiTef.OperacaoADM;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCliSiTef_SetOperacaoADM(const tefHandle: PTEFHandle;
  const OperacaoADM: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFCliSiTef.OperacaoADM := OperacaoADM;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCliSiTef_GetOperacaoCRT(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.TEFCliSiTef.OperacaoCRT;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCliSiTef_SetOperacaoCRT(const tefHandle: PTEFHandle;
  const OperacaoCRT: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFCliSiTef.OperacaoCRT := OperacaoCRT;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCliSiTef_GetOperacaoCHQ(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.TEFCliSiTef.OperacaoCHQ;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCliSiTef_SetOperacaoCHQ(const tefHandle: PTEFHandle;
  const OperacaoCHQ: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFCliSiTef.OperacaoCHQ := OperacaoCHQ;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCliSiTef_GetOperacaoCNC(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.TEFCliSiTef.OperacaoCNC;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCliSiTef_SetOperacaoCNC(const tefHandle: PTEFHandle;
  const OperacaoCNC: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFCliSiTef.OperacaoCNC := OperacaoCNC;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCliSiTef_GetOperacaoReImpressao(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.TEFCliSiTef.OperacaoReImpressao;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCliSiTef_SetOperacaoReImpressao(const tefHandle: PTEFHandle;
  const OperacaoReImpressao: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFCliSiTef.OperacaoReImpressao := OperacaoReImpressao;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCliSiTef_SetOnExibeMenu(const tefHandle: PTEFHandle;
  const method: TTEFCliSiTefExibeMenuCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      tefHandle^.TEF.TEFCliSiTef.OnExibeMenu :=
        tefHandle^.EventHandlers.OnTEFCliSiTefExibeMenu;
      tefHandle^.EventHandlers.OnTEFCliSiTefExibeMenuCallback := method;
      Result := 0;
    end
    else
    begin
      tefHandle^.TEF.TEFCliSiTef.OnExibeMenu := nil;
      tefHandle^.EventHandlers.OnTEFCliSiTefExibeMenuCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFCliSiTef_SetOnObtemCampo(const tefHandle: PTEFHandle;
  const method: TTEFCliSiTefObtemCampoCalback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      tefHandle^.TEF.TEFCliSiTef.OnObtemCampo :=
        tefHandle^.EventHandlers.OnTEFCliSiTefObtemCampo;
      tefHandle^.EventHandlers.OnTEFCliSiTefObtemCampoCalback := method;
      Result := 0;
    end
    else
    begin
      tefHandle^.TEF.TEFCliSiTef.OnObtemCampo := nil;
      tefHandle^.EventHandlers.OnTEFCliSiTefObtemCampoCalback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFCliSiTef_DefineMensagemPermanentePinPad(const tefHandle: PTEFHandle;
  const mensagem: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.TEFCliSiTef.DefineMensagemPermanentePinPad(mensagem);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFCliSiTef_ObtemQuantidadeTransacoesPendentes(
  const tefHandle: PTEFHandle;
  const Data: double; const Cupom: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.TEFCliSiTef.ObtemQuantidadeTransacoesPendentes(Data, Cupom);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region TEFVeSPague}

function TEF_TEFVeSPague_GetAplicacao(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFVeSPague.Aplicacao;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFVeSPague_SetAplicacao(const tefHandle: PTEFHandle;
  const Aplicacao: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFVeSPague.Aplicacao := Aplicacao;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFVeSPague_GetAplicacaoVersao(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFVeSPague.AplicacaoVersao;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFVeSPague_SetAplicacaoVersao(const tefHandle: PTEFHandle;
  const AplicacaoVersao: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFVeSPague.AplicacaoVersao := AplicacaoVersao;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFVeSPague_GetGPExeName(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFVeSPague.GPExeName;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFVeSPague_SetGPExeName(const tefHandle: PTEFHandle;
  const GPExeName: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFVeSPague.GPExeName := GPExeName;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFVeSPague_GetGPExeParams(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFVeSPague.GPExeParams;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFVeSPague_SetGPExeParams(const tefHandle: PTEFHandle;
  const GPExeParams: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFVeSPague.GPExeParams := GPExeParams;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFVeSPague_GetEnderecoIP(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFVeSPague.EnderecoIP;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFVeSPague_SetEnderecoIP(const tefHandle: PTEFHandle;
  const EnderecoIP: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFVeSPague.EnderecoIP := EnderecoIP;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFVeSPague_GetPorta(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFVeSPague.Porta;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFVeSPague_SetPorta(const tefHandle: PTEFHandle;
  const Porta: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFVeSPague.Porta := Porta;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFVeSPague_GetTimeOut(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.TEFVeSPague.TimeOut;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFVeSPague_SetTimeOut(const tefHandle: PTEFHandle;
  const TimeOut: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFVeSPague.TimeOut := TimeOut;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFVeSPague_GetTemPendencias(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if tefHandle^.TEF.TEFVeSPague.TemPendencias then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFVeSPague_SetTemPendencias(const tefHandle: PTEFHandle;
  const TemPendencias: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFVeSPague.TemPendencias := TemPendencias;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFVeSPague_GetTransacaoADM(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFVeSPague.TransacaoADM;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFVeSPague_SetTransacaoADM(const tefHandle: PTEFHandle;
  const TransacaoADM: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFVeSPague.TransacaoADM := TransacaoADM;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFVeSPague_GetTransacaoCRT(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFVeSPague.TransacaoCRT;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFVeSPague_SetTransacaoCRT(const tefHandle: PTEFHandle;
  const TransacaoCRT: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFVeSPague.TransacaoCRT := TransacaoCRT;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFVeSPague_GetTransacaoCHQ(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFVeSPague.TransacaoCHQ;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFVeSPague_SetTransacaoCHQ(const tefHandle: PTEFHandle;
  const TransacaoCHQ: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFVeSPague.TransacaoCHQ := TransacaoCHQ;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFVeSPague_GetTransacaoCNC(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFVeSPague.TransacaoCNC;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFVeSPague_SetTransacaoCNC(const tefHandle: PTEFHandle;
  const TransacaoCNC: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFVeSPague.TransacaoCNC := TransacaoCNC;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFVeSPague_GetTransacaoOpcao(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFVeSPague.TransacaoOpcao;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFVeSPague_SetTransacaoOpcao(const tefHandle: PTEFHandle;
  const TransacaoOpcao: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFVeSPague.TransacaoOpcao := TransacaoOpcao;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFVeSPague_GetTransacaoReImpressao(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFVeSPague.TransacaoReImpressao;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFVeSPague_SetTransacaoReImpressao(const tefHandle: PTEFHandle;
  const TransacaoReImpressao: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFVeSPague.TransacaoReImpressao := TransacaoReImpressao;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFVeSPague_GetTransacaoPendente(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFVeSPague.TransacaoPendente;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFVeSPague_SetTransacaoPendente(const tefHandle: PTEFHandle;
  const TransacaoPendente: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFVeSPague.TransacaoPendente := TransacaoPendente;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFVeSPague_SetOnExibeMenu(const tefHandle: PTEFHandle;
  const method: TTEFVeSPagueExibeMenuCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      tefHandle^.TEF.TEFVeSPague.OnExibeMenu :=
        tefHandle^.EventHandlers.OnTEFVeSPagueExibeMenu;
      tefHandle^.EventHandlers.OnTEFVeSPagueExibeMenuCallback := method;
      Result := 0;
    end
    else
    begin
      tefHandle^.TEF.TEFVeSPague.OnExibeMenu := nil;
      tefHandle^.EventHandlers.OnTEFVeSPagueExibeMenuCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFVeSPague_SetOnObtemCampo(const tefHandle: PTEFHandle;
  const method: TTEFVeSPagueObtemCampoCalback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      tefHandle^.TEF.TEFVeSPague.OnObtemCampo :=
        tefHandle^.EventHandlers.OnTEFVeSPagueObtemCampo;
      tefHandle^.EventHandlers.OnTEFVeSPagueObtemCampoCalback := method;
      Result := 0;
    end
    else
    begin
      tefHandle^.TEF.TEFVeSPague.OnObtemCampo := nil;
      tefHandle^.EventHandlers.OnTEFVeSPagueObtemCampoCalback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region TEFDial}

function TEF_TEFDial_GetAutoAtivarGP(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (tefHandle^.TEF.TEFDial.AutoAtivarGP) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFDial_SetAutoAtivarGP(const tefHandle: PTEFHandle;
  const AutoAtivarGP: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFDial.AutoAtivarGP := AutoAtivarGP;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFDial_GetNumVias(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.TEFDial.NumVias;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFDial_SetNumVias(const tefHandle: PTEFHandle;
  const NumVias: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFDial.NumVias := NumVias;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFDial_GetEsperaSTS(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.TEFDial.EsperaSTS;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFDial_SetEsperaSTS(const tefHandle: PTEFHandle;
  const EsperaSTS: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFDial.EsperaSTS := EsperaSTS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFDial_GetArqTemp(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFDial.ArqTemp;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFDial_SetArqTemp(const tefHandle: PTEFHandle;
  const ArqTemp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFDial.ArqTemp := ArqTemp;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFDial_GetArqReq(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFDial.ArqReq;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFDial_SetArqReq(const tefHandle: PTEFHandle;
  const ArqReq: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFDial.ArqReq := ArqReq;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFDial_GetArqSTS(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFDial.ArqSTS;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFDial_SetArqSTS(const tefHandle: PTEFHandle;
  const ArqSTS: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFDial.ArqSTS := ArqSTS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFDial_GetArqResp(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFDial.ArqResp;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFDial_SetArqResp(const tefHandle: PTEFHandle;
  const ArqResp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFDial.ArqResp := ArqResp;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFDial_GetGPExeName(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFDial.GPExeName;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFDial_SetGPExeName(const tefHandle: PTEFHandle;
  const GPExeName: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFDial.GPExeName := GPExeName;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFDial_GetName(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFDial.Name;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFDial_SetName(const tefHandle: PTEFHandle; const Name: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFDial.Name := Name;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFDial_GetHabilitado(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if tefHandle^.TEF.TEFDial.Habilitado then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFDial_SetHabilitado(const tefHandle: PTEFHandle;
  const Habilitado: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFDial.Habilitado := Habilitado;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region TEFDisc}

function TEF_TEFDisc_GetAutoAtivarGP(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (tefHandle^.TEF.TEFDisc.AutoAtivarGP) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFDisc_SetAutoAtivarGP(const tefHandle: PTEFHandle;
  const AutoAtivarGP: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFDisc.AutoAtivarGP := AutoAtivarGP;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFDisc_GetNumVias(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.TEFDisc.NumVias;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFDisc_SetNumVias(const tefHandle: PTEFHandle;
  const NumVias: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFDisc.NumVias := NumVias;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFDisc_GetEsperaSTS(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.TEFDisc.EsperaSTS;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFDisc_SetEsperaSTS(const tefHandle: PTEFHandle;
  const EsperaSTS: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFDisc.EsperaSTS := EsperaSTS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFDisc_GetArqTemp(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFDisc.ArqTemp;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFDisc_SetArqTemp(const tefHandle: PTEFHandle;
  const ArqTemp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFDisc.ArqTemp := ArqTemp;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFDisc_GetArqReq(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFDisc.ArqReq;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFDisc_SetArqReq(const tefHandle: PTEFHandle;
  const ArqReq: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFDisc.ArqReq := ArqReq;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFDisc_GetArqSTS(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFDisc.ArqSTS;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFDisc_SetArqSTS(const tefHandle: PTEFHandle;
  const ArqSTS: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFDisc.ArqSTS := ArqSTS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFDisc_GetArqResp(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFDisc.ArqResp;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFDisc_SetArqResp(const tefHandle: PTEFHandle;
  const ArqResp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFDisc.ArqResp := ArqResp;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFDisc_GetGPExeName(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFDisc.GPExeName;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFDisc_SetGPExeName(const tefHandle: PTEFHandle;
  const GPExeName: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFDisc.GPExeName := GPExeName;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFDisc_GetName(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFDisc.Name;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFDisc_SetName(const tefHandle: PTEFHandle; const Name: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFDisc.Name := Name;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFDisc_GetHabilitado(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if tefHandle^.TEF.TEFDisc.Habilitado then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFDisc_SetHabilitado(const tefHandle: PTEFHandle;
  const Habilitado: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFDisc.Habilitado := Habilitado;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region TEFHiper}

function TEF_TEFHiper_GetAutoAtivarGP(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (tefHandle^.TEF.TEFHiper.AutoAtivarGP) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFHiper_SetAutoAtivarGP(const tefHandle: PTEFHandle;
  const AutoAtivarGP: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFHiper.AutoAtivarGP := AutoAtivarGP;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFHiper_GetNumVias(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.TEFHiper.NumVias;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFHiper_SetNumVias(const tefHandle: PTEFHandle;
  const NumVias: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFHiper.NumVias := NumVias;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFHiper_GetEsperaSTS(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.TEFHiper.EsperaSTS;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFHiper_SetEsperaSTS(const tefHandle: PTEFHandle;
  const EsperaSTS: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFHiper.EsperaSTS := EsperaSTS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFHiper_GetArqTemp(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFHiper.ArqTemp;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFHiper_SetArqTemp(const tefHandle: PTEFHandle;
  const ArqTemp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFHiper.ArqTemp := ArqTemp;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFHiper_GetArqReq(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFHiper.ArqReq;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFHiper_SetArqReq(const tefHandle: PTEFHandle;
  const ArqReq: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFHiper.ArqReq := ArqReq;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFHiper_GetArqSTS(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFHiper.ArqSTS;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFHiper_SetArqSTS(const tefHandle: PTEFHandle;
  const ArqSTS: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFHiper.ArqSTS := ArqSTS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFHiper_GetArqResp(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFHiper.ArqResp;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFHiper_SetArqResp(const tefHandle: PTEFHandle;
  const ArqResp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFHiper.ArqResp := ArqResp;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFHiper_GetGPExeName(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFHiper.GPExeName;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFHiper_SetGPExeName(const tefHandle: PTEFHandle;
  const GPExeName: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFHiper.GPExeName := GPExeName;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFHiper_GetName(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFHiper.Name;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFHiper_SetName(const tefHandle: PTEFHandle; const Name: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFHiper.Name := Name;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFHiper_GetHabilitado(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if tefHandle^.TEF.TEFHiper.Habilitado then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFHiper_SetHabilitado(const tefHandle: PTEFHandle;
  const Habilitado: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFHiper.Habilitado := Habilitado;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region TEFGPU}

function TEF_TEFGPU_GetAutoAtivarGP(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (tefHandle^.TEF.TEFGPU.AutoAtivarGP) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFGPU_SetAutoAtivarGP(const tefHandle: PTEFHandle;
  const AutoAtivarGP: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFGPU.AutoAtivarGP := AutoAtivarGP;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFGPU_GetNumVias(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.TEFGPU.NumVias;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFGPU_SetNumVias(const tefHandle: PTEFHandle;
  const NumVias: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFGPU.NumVias := NumVias;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFGPU_GetEsperaSTS(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.TEFGPU.EsperaSTS;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFGPU_SetEsperaSTS(const tefHandle: PTEFHandle;
  const EsperaSTS: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFGPU.EsperaSTS := EsperaSTS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFGPU_GetArqTemp(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFGPU.ArqTemp;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFGPU_SetArqTemp(const tefHandle: PTEFHandle;
  const ArqTemp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFGPU.ArqTemp := ArqTemp;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFGPU_GetArqReq(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFGPU.ArqReq;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFGPU_SetArqReq(const tefHandle: PTEFHandle;
  const ArqReq: PChar): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFGPU.ArqReq := ArqReq;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFGPU_GetArqSTS(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFGPU.ArqSTS;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFGPU_SetArqSTS(const tefHandle: PTEFHandle;
  const ArqSTS: PChar): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFGPU.ArqSTS := ArqSTS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFGPU_GetArqResp(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFGPU.ArqResp;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFGPU_SetArqResp(const tefHandle: PTEFHandle;
  const ArqResp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFGPU.ArqResp := ArqResp;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFGPU_GetGPExeName(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFGPU.GPExeName;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFGPU_SetGPExeName(const tefHandle: PTEFHandle;
  const GPExeName: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFGPU.GPExeName := GPExeName;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFGPU_GetName(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFGPU.Name;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFGPU_SetName(const tefHandle: PTEFHandle; const Name: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFGPU.Name := Name;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFGPU_GetHabilitado(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if tefHandle^.TEF.TEFGPU.Habilitado then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFGPU_SetHabilitado(const tefHandle: PTEFHandle;
  const Habilitado: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFGPU.Habilitado := Habilitado;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region TEFAuttar}

function TEF_TEFAuttar_GetAutoAtivarGP(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (tefHandle^.TEF.TEFAuttar.AutoAtivarGP) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFAuttar_SetAutoAtivarGP(const tefHandle: PTEFHandle;
  const AutoAtivarGP: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFAuttar.AutoAtivarGP := AutoAtivarGP;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFAuttar_GetNumVias(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.TEFAuttar.NumVias;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFAuttar_SetNumVias(const tefHandle: PTEFHandle;
  const NumVias: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFAuttar.NumVias := NumVias;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFAuttar_GetEsperaSTS(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.TEFAuttar.EsperaSTS;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFAuttar_SetEsperaSTS(const tefHandle: PTEFHandle;
  const EsperaSTS: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFAuttar.EsperaSTS := EsperaSTS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFAuttar_GetArqTemp(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFAuttar.ArqTemp;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFAuttar_SetArqTemp(const tefHandle: PTEFHandle;
  const ArqTemp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFAuttar.ArqTemp := ArqTemp;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFAuttar_GetArqReq(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFAuttar.ArqReq;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFAuttar_SetArqReq(const tefHandle: PTEFHandle;
  const ArqReq: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFAuttar.ArqReq := ArqReq;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFAuttar_GetArqSTS(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFAuttar.ArqSTS;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFAuttar_SetArqSTS(const tefHandle: PTEFHandle;
  const ArqSTS: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFAuttar.ArqSTS := ArqSTS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFAuttar_GetArqResp(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFAuttar.ArqResp;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFAuttar_SetArqResp(const tefHandle: PTEFHandle;
  const ArqResp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFAuttar.ArqResp := ArqResp;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFAuttar_GetGPExeName(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFAuttar.GPExeName;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFAuttar_SetGPExeName(const tefHandle: PTEFHandle;
  const GPExeName: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFAuttar.GPExeName := GPExeName;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFAuttar_GetName(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFAuttar.Name;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFAuttar_SetName(const tefHandle: PTEFHandle; const Name: PChar): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFAuttar.Name := Name;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFAuttar_GetHabilitado(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if tefHandle^.TEF.TEFAuttar.Habilitado then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFAuttar_SetHabilitado(const tefHandle: PTEFHandle;
  const Habilitado: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFAuttar.Habilitado := Habilitado;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region TEFBanese}

function TEF_TEFBanese_GetNumVias(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.TEFBanese.NumVias;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFBanese_SetNumVias(const tefHandle: PTEFHandle;
  const NumVias: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFBanese.NumVias := NumVias;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFBanese_GetArqTemp(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFBanese.ArqTemp;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFBanese_SetArqTemp(const tefHandle: PTEFHandle;
  const ArqTemp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFBanese.ArqTemp := ArqTemp;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFBanese_GetArqReq(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFBanese.ArqReq;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFBanese_SetArqReq(const tefHandle: PTEFHandle;
  const ArqReq: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFBanese.ArqReq := ArqReq;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFBanese_GetArqSTS(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFBanese.ArqSTS;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFBanese_SetArqSTS(const tefHandle: PTEFHandle;
  const ArqSTS: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFBanese.ArqSTS := ArqSTS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFBanese_GetArqResp(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFBanese.ArqResp;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFBanese_SetArqResp(const tefHandle: PTEFHandle;
  const ArqResp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFBanese.ArqResp := ArqResp;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFBanese_GetName(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFBanese.Name;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFBanese_SetName(const tefHandle: PTEFHandle; const Name: PChar): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFBanese.Name := Name;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFBanese_GetHabilitado(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if tefHandle^.TEF.TEFBanese.Habilitado then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFBanese_SetHabilitado(const tefHandle: PTEFHandle;
  const Habilitado: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFBanese.Habilitado := Habilitado;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region TEFGood}

function TEF_TEFGood_GetAutoAtivarGP(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (tefHandle^.TEF.TEFGood.AutoAtivarGP) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFGood_SetAutoAtivarGP(const tefHandle: PTEFHandle;
  const AutoAtivarGP: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFGood.AutoAtivarGP := AutoAtivarGP;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFGood_GetNumVias(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.TEFGood.NumVias;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFGood_SetNumVias(const tefHandle: PTEFHandle;
  const NumVias: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFGood.NumVias := NumVias;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFGood_GetEsperaSTS(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.TEFGood.EsperaSTS;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFGood_SetEsperaSTS(const tefHandle: PTEFHandle;
  const EsperaSTS: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFGood.EsperaSTS := EsperaSTS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFGood_GetArqTemp(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFGood.ArqTemp;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFGood_SetArqTemp(const tefHandle: PTEFHandle;
  const ArqTemp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFGood.ArqTemp := ArqTemp;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFGood_GetArqReq(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFGood.ArqReq;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFGood_SetArqReq(const tefHandle: PTEFHandle;
  const ArqReq: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFGood.ArqReq := ArqReq;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFGood_GetArqSTS(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFGood.ArqSTS;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFGood_SetArqSTS(const tefHandle: PTEFHandle;
  const ArqSTS: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFGood.ArqSTS := ArqSTS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFGood_GetArqResp(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFGood.ArqResp;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFGood_SetArqResp(const tefHandle: PTEFHandle;
  const ArqResp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFGood.ArqResp := ArqResp;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFGood_GetGPExeName(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFGood.GPExeName;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFGood_SetGPExeName(const tefHandle: PTEFHandle;
  const GPExeName: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFGood.GPExeName := GPExeName;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFGood_GetName(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFGood.Name;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFGood_SetName(const tefHandle: PTEFHandle; const Name: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFGood.Name := Name;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFGood_GetHabilitado(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if tefHandle^.TEF.TEFGood.Habilitado then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFGood_SetHabilitado(const tefHandle: PTEFHandle;
  const Habilitado: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFGood.Habilitado := Habilitado;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region TEFFoxWin}

function TEF_TEFFoxWin_GetAutoAtivarGP(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (tefHandle^.TEF.TEFFoxWin.AutoAtivarGP) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFFoxWin_SetAutoAtivarGP(const tefHandle: PTEFHandle;
  const AutoAtivarGP: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFFoxWin.AutoAtivarGP := AutoAtivarGP;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFFoxWin_GetNumVias(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.TEFFoxWin.NumVias;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFFoxWin_SetNumVias(const tefHandle: PTEFHandle;
  const NumVias: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFFoxWin.NumVias := NumVias;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFFoxWin_GetEsperaSTS(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.TEFFoxWin.EsperaSTS;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFFoxWin_SetEsperaSTS(const tefHandle: PTEFHandle;
  const EsperaSTS: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFFoxWin.EsperaSTS := EsperaSTS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFFoxWin_GetArqTemp(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFFoxWin.ArqTemp;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFFoxWin_SetArqTemp(const tefHandle: PTEFHandle;
  const ArqTemp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFFoxWin.ArqTemp := ArqTemp;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFFoxWin_GetArqReq(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFFoxWin.ArqReq;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFFoxWin_SetArqReq(const tefHandle: PTEFHandle;
  const ArqReq: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFFoxWin.ArqReq := ArqReq;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFFoxWin_GetArqSTS(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFFoxWin.ArqSTS;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFFoxWin_SetArqSTS(const tefHandle: PTEFHandle;
  const ArqSTS: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFFoxWin.ArqSTS := ArqSTS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFFoxWin_GetArqResp(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFFoxWin.ArqResp;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFFoxWin_SetArqResp(const tefHandle: PTEFHandle;
  const ArqResp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFFoxWin.ArqResp := ArqResp;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFFoxWin_GetGPExeName(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFFoxWin.GPExeName;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFFoxWin_SetGPExeName(const tefHandle: PTEFHandle;
  const GPExeName: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFFoxWin.GPExeName := GPExeName;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFFoxWin_GetName(const tefHandle: PTEFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFFoxWin.Name;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFFoxWin_SetName(const tefHandle: PTEFHandle; const Name: PChar): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFFoxWin.Name := Name;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFFoxWin_GetHabilitado(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if tefHandle^.TEF.TEFFoxWin.Habilitado then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFFoxWin_SetHabilitado(const tefHandle: PTEFHandle;
  const Habilitado: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFFoxWin.Habilitado := Habilitado;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region TEFPetrocard}

function TEF_TEFPetrocard_GetAutoAtivarGP(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (tefHandle^.TEF.TEFPetrocard.AutoAtivarGP) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFPetrocard_SetAutoAtivarGP(const tefHandle: PTEFHandle;
  const AutoAtivarGP: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFPetrocard.AutoAtivarGP := AutoAtivarGP;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFPetrocard_GetNumVias(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.TEFPetrocard.NumVias;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFPetrocard_SetNumVias(const tefHandle: PTEFHandle;
  const NumVias: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFPetrocard.NumVias := NumVias;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFPetrocard_GetEsperaSTS(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.TEFPetrocard.EsperaSTS;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFPetrocard_SetEsperaSTS(const tefHandle: PTEFHandle;
  const EsperaSTS: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFPetrocard.EsperaSTS := EsperaSTS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFPetrocard_GetArqTemp(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFPetrocard.ArqTemp;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFPetrocard_SetArqTemp(const tefHandle: PTEFHandle;
  const ArqTemp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFPetrocard.ArqTemp := ArqTemp;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFPetrocard_GetArqReq(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFPetrocard.ArqReq;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFPetrocard_SetArqReq(const tefHandle: PTEFHandle;
  const ArqReq: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFPetrocard.ArqReq := ArqReq;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFPetrocard_GetArqSTS(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFPetrocard.ArqSTS;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFPetrocard_SetArqSTS(const tefHandle: PTEFHandle;
  const ArqSTS: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFPetrocard.ArqSTS := ArqSTS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFPetrocard_GetArqResp(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFPetrocard.ArqResp;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFPetrocard_SetArqResp(const tefHandle: PTEFHandle;
  const ArqResp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFPetrocard.ArqResp := ArqResp;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFPetrocard_GetGPExeName(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFPetrocard.GPExeName;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFPetrocard_SetGPExeName(const tefHandle: PTEFHandle;
  const GPExeName: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFPetrocard.GPExeName := GPExeName;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFPetrocard_GetName(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFPetrocard.Name;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFPetrocard_SetName(const tefHandle: PTEFHandle;
  const Name: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFPetrocard.Name := Name;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFPetrocard_GetHabilitado(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if tefHandle^.TEF.TEFPetrocard.Habilitado then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFPetrocard_SetHabilitado(const tefHandle: PTEFHandle;
  const Habilitado: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFPetrocard.Habilitado := Habilitado;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region TEFCrediShop}

function TEF_TEFCrediShop_GetAutoAtivarGP(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (tefHandle^.TEF.TEFCrediShop.AutoAtivarGP) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCrediShop_SetAutoAtivarGP(const tefHandle: PTEFHandle;
  const AutoAtivarGP: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFCrediShop.AutoAtivarGP := AutoAtivarGP;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCrediShop_GetNumVias(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.TEFCrediShop.NumVias;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCrediShop_SetNumVias(const tefHandle: PTEFHandle;
  const NumVias: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFCrediShop.NumVias := NumVias;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCrediShop_GetEsperaSTS(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := tefHandle^.TEF.TEFCrediShop.EsperaSTS;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCrediShop_SetEsperaSTS(const tefHandle: PTEFHandle;
  const EsperaSTS: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFCrediShop.EsperaSTS := EsperaSTS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCrediShop_GetArqTemp(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFCrediShop.ArqTemp;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFCrediShop_SetArqTemp(const tefHandle: PTEFHandle;
  const ArqTemp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFCrediShop.ArqTemp := ArqTemp;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCrediShop_GetArqReq(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFCrediShop.ArqReq;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFCrediShop_SetArqReq(const tefHandle: PTEFHandle;
  const ArqReq: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFCrediShop.ArqReq := ArqReq;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCrediShop_GetArqSTS(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFCrediShop.ArqSTS;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFCrediShop_SetArqSTS(const tefHandle: PTEFHandle;
  const ArqSTS: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFCrediShop.ArqSTS := ArqSTS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCrediShop_GetArqResp(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFCrediShop.ArqResp;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFCrediShop_SetArqResp(const tefHandle: PTEFHandle;
  const ArqResp: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFCrediShop.ArqResp := ArqResp;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCrediShop_GetGPExeName(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFCrediShop.GPExeName;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFCrediShop_SetGPExeName(const tefHandle: PTEFHandle;
  const GPExeName: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFCrediShop.GPExeName := GPExeName;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCrediShop_GetName(const tefHandle: PTEFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := tefHandle^.TEF.TEFCrediShop.Name;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFCrediShop_SetName(const tefHandle: PTEFHandle;
  const Name: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFCrediShop.Name := Name;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function TEF_TEFCrediShop_GetHabilitado(const tefHandle: PTEFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if tefHandle^.TEF.TEFCrediShop.Habilitado then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_TEFCrediShop_SetHabilitado(const tefHandle: PTEFHandle;
  const Habilitado: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    tefHandle^.TEF.TEFCrediShop.Habilitado := Habilitado;
    Result := 0;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region Eventos}

function TEF_SetOnAguardaResp(const tefHandle: PTEFHandle;
  const method: TAguardaRespCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      tefHandle^.TEF.OnAguardaResp := tefHandle^.EventHandlers.OnAguardaResp;
      tefHandle^.EventHandlers.OnAguardaRespCallback := method;
      Result := 0;
    end
    else
    begin
      tefHandle^.TEF.OnAguardaResp := nil;
      tefHandle^.EventHandlers.OnAguardaRespCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_SetOnExibeMsg(const tefHandle: PTEFHandle;
  const method: TExibeMsgCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      tefHandle^.TEF.OnExibeMsg := tefHandle^.EventHandlers.OnExibeMsg;
      tefHandle^.EventHandlers.OnExibeMsgCallback := method;
      Result := 0;
    end
    else
    begin
      tefHandle^.TEF.OnExibeMsg := nil;
      tefHandle^.EventHandlers.OnExibeMsgCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_SetOnBloqueiaMouseTeclado(const tefHandle: PTEFHandle;
  const method: TBloqueiaMouseTecladoCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      tefHandle^.TEF.OnBloqueiaMouseTeclado :=
        tefHandle^.EventHandlers.OnBloqueiaMouseTeclado;
      tefHandle^.EventHandlers.OnBloqueiaMouseTecladoCallback := method;
      Result := 0;
    end
    else
    begin
      tefHandle^.TEF.OnBloqueiaMouseTeclado := nil;
      tefHandle^.EventHandlers.OnBloqueiaMouseTecladoCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_SetOnRestauraFocoAplicacao(const tefHandle: PTEFHandle;
  const method: TExecutaAcaoCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      tefHandle^.TEF.OnRestauraFocoAplicacao :=
        tefHandle^.EventHandlers.OnRestauraFocoAplicacao;
      tefHandle^.EventHandlers.OnRestauraFocoAplicacaoCallback := method;
      Result := 0;
    end
    else
    begin
      tefHandle^.TEF.OnRestauraFocoAplicacao := nil;
      tefHandle^.EventHandlers.OnRestauraFocoAplicacaoCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_SetOnLimpaTeclado(const tefHandle: PTEFHandle;
  const method: TExecutaAcaoCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      tefHandle^.TEF.OnLimpaTeclado := tefHandle^.EventHandlers.OnLimpaTeclado;
      tefHandle^.EventHandlers.OnLimpaTecladoCallback := method;
      Result := 0;
    end
    else
    begin
      tefHandle^.TEF.OnLimpaTeclado := nil;
      tefHandle^.EventHandlers.OnLimpaTecladoCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_SetOnComandaECF(const tefHandle: PTEFHandle;
  const method: TComandaECFCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      tefHandle^.TEF.OnComandaECF := tefHandle^.EventHandlers.OnComandaECF;
      tefHandle^.EventHandlers.OnComandaECFCallback := method;
      Result := 0;
    end
    else
    begin
      tefHandle^.TEF.OnComandaECF := nil;
      tefHandle^.EventHandlers.OnComandaECFCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_SetOnComandaECFSubtotaliza(const tefHandle: PTEFHandle;
  const method: TComandaECFSubtotalizaCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      tefHandle^.TEF.OnComandaECFSubtotaliza :=
        tefHandle^.EventHandlers.OnComandaECFSubtotaliza;
      tefHandle^.EventHandlers.OnComandaECFSubtotalizaCallback := method;
      Result := 0;
    end
    else
    begin
      tefHandle^.TEF.OnComandaECFSubtotaliza := nil;
      tefHandle^.EventHandlers.OnComandaECFSubtotalizaCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_SetOnComandaECFPagamento(const tefHandle: PTEFHandle;
  const method: TComandaECFPagamentoCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      tefHandle^.TEF.OnComandaECFPagamento :=
        tefHandle^.EventHandlers.OnComandaECFPagamento;
      tefHandle^.EventHandlers.OnComandaECFPagamentoCallback := method;
      Result := 0;
    end
    else
    begin
      tefHandle^.TEF.OnComandaECFPagamento := nil;
      tefHandle^.EventHandlers.OnComandaECFPagamentoCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_SetOnComandaECFAbreVinculado(const tefHandle: PTEFHandle;
  const method: TComandaECFAbreVinculadoCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      tefHandle^.TEF.OnComandaECFAbreVinculado :=
        tefHandle^.EventHandlers.OnComandaECFAbreVinculado;
      tefHandle^.EventHandlers.OnComandaECFAbreVinculadoCallback := method;
      Result := 0;
    end
    else
    begin
      tefHandle^.TEF.OnComandaECFAbreVinculado := nil;
      tefHandle^.EventHandlers.OnComandaECFAbreVinculadoCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_SetOnComandaECFImprimeVia(const tefHandle: PTEFHandle;
  const method: TComandaECFImprimeViaCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      tefHandle^.TEF.OnComandaECFImprimeVia :=
        tefHandle^.EventHandlers.OnComandaECFImprimeVia;
      tefHandle^.EventHandlers.OnComandaECFImprimeViaCallback := method;
      Result := 0;
    end
    else
    begin
      tefHandle^.TEF.OnComandaECFImprimeVia := nil;
      tefHandle^.EventHandlers.OnComandaECFImprimeViaCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_SetOnInfoECF(const tefHandle: PTEFHandle;
  const method: TInfoECFCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      tefHandle^.TEF.OnInfoECF := tefHandle^.EventHandlers.OnInfoECF;
      tefHandle^.EventHandlers.OnInfoECFCallback := method;
      Result := 0;
    end
    else
    begin
      tefHandle^.TEF.OnInfoECF := nil;
      tefHandle^.EventHandlers.OnInfoECFCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_SetOnAntesFinalizarRequisicao(const tefHandle: PTEFHandle;
  const method: TAntesFinalizarRequisicaoCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      tefHandle^.TEF.OnAntesFinalizarRequisicao :=
        tefHandle^.EventHandlers.OnAntesFinalizarRequisicao;
      tefHandle^.EventHandlers.OnAntesFinalizarRequisicaoCallback := method;
      Result := 0;
    end
    else
    begin
      tefHandle^.TEF.OnAntesFinalizarRequisicao := nil;
      tefHandle^.EventHandlers.OnAntesFinalizarRequisicaoCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_SetOnDepoisConfirmarTransacoes(const tefHandle: PTEFHandle;
  const method: TDepoisConfirmarTransacoes): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      tefHandle^.TEF.OnDepoisConfirmarTransacoes :=
        tefHandle^.EventHandlers.OnDepoisConfirmarTransacoes;
      tefHandle^.EventHandlers.OnDepoisConfirmarTransacoesCallback := method;
      Result := 0;
    end
    else
    begin
      tefHandle^.TEF.OnDepoisConfirmarTransacoes := nil;
      tefHandle^.EventHandlers.OnDepoisConfirmarTransacoesCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_SetOnAntesCancelarTransacao(const tefHandle: PTEFHandle;
  const method: TAntesCancelarTransacaoCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      tefHandle^.TEF.OnAntesCancelarTransacao :=
        tefHandle^.EventHandlers.OnAntesCancelarTransacao;
      tefHandle^.EventHandlers.OnAntesCancelarTransacaoCallback := method;
      Result := 0;
    end
    else
    begin
      tefHandle^.TEF.OnAntesCancelarTransacao := nil;
      tefHandle^.EventHandlers.OnAntesCancelarTransacaoCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_SetOnDepoisCancelarTransacoes(const tefHandle: PTEFHandle;
  const method: TDepoisCancelarTransacoesCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      tefHandle^.TEF.OnDepoisCancelarTransacoes :=
        tefHandle^.EventHandlers.OnDepoisCancelarTransacoes;
      tefHandle^.EventHandlers.OnDepoisCancelarTransacoesCallback := method;
      Result := 0;
    end
    else
    begin
      tefHandle^.TEF.OnDepoisCancelarTransacoes := nil;
      tefHandle^.EventHandlers.OnDepoisCancelarTransacoesCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_SetOnMudaEstadoReq(const tefHandle: PTEFHandle;
  const method: TMudaEstadoReqCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      tefHandle^.TEF.OnMudaEstadoReq := tefHandle^.EventHandlers.OnMudaEstadoReq;
      tefHandle^.EventHandlers.OnMudaEstadoReqCallback := method;
      Result := 0;
    end
    else
    begin
      tefHandle^.TEF.OnMudaEstadoReq := nil;
      tefHandle^.EventHandlers.OnMudaEstadoReqCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function TEF_SetOnMudaEstadoResp(const tefHandle: PTEFHandle;
  const method: TMudaEstadoRespCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (tefHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      tefHandle^.TEF.OnMudaEstadoResp := tefHandle^.EventHandlers.OnMudaEstadoResp;
      tefHandle^.EventHandlers.OnMudaEstadoRespCallback := method;
      Result := 0;
    end
    else
    begin
      tefHandle^.TEF.OnMudaEstadoResp := nil;
      tefHandle^.EventHandlers.OnMudaEstadoRespCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      tefHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

end.
