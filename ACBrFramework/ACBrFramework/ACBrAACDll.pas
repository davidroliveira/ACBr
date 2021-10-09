unit ACBrAACDll;

interface

uses
  SysUtils,
  Classes,
  ACBrPAFClass,
  ACBrAAC,
  ACBrHandlers,
  ACBrUtil;

{Records estilo C utilizados nos retornos das funções}

type
  TECFAutorizado = record
    ValorGT: double;
    Serie: array[0..30] of char;
    CNI: integer;
    CRO: integer;
    DtHrAtualizado: double;
  end;

type
  TECFArquivo = record
    NOME_ARQUIVO: array[0..50] of char;
    MD5: array[0..32] of char;
  end;

{%region Declaração da funções}

{%region Constructor/Destructor/Erro}

function AAC_Create(var aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_Destroy(aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_GetUltimoErro(const aacHandle: PAACHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Propriedades do AAC}

function AAC_GetArqLOG(const aacHandle: PAACHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_SetArqLOG(const aacHandle: PAACHandle; const ArqLOG: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_GetCriarBAK(const aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_SetCriarBAK(const aacHandle: PAACHandle; const Value: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_GetEfetuarFlush(const aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_SetEfetuarFlush(const aacHandle: PAACHandle;
  const Value: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_GetGravarConfigApp(const aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_SetGravarConfigApp(const aacHandle: PAACHandle;
  const Value: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_GetGravarDadosPAF(const aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_SetGravarDadosPAF(const aacHandle: PAACHandle;
  const Value: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_GetGravarDadosSH(const aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_SetGravarDadosSH(const aacHandle: PAACHandle;
  const Value: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_GetGravarTodosECFs(const aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_SetGravarTodosECFs(const aacHandle: PAACHandle;
  const Value: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_GetNomeArquivoAux(const aacHandle: PAACHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_SetNomeArquivoAux(const aacHandle: PAACHandle;
  const NomeArquivoAux: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_GetParams(const aacHandle: PAACHandle; Buffer: PChar;
  const BufferLen, index: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_GetParamsCount(const aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_SetParams(const aacHandle: PAACHandle; const Params: array of PChar;
  const Count: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_GetChave(const aacHandle: PAACHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_SetChave(const aacHandle: PAACHandle; const Chave: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Metodos do AAC}

function AAC_AbrirArquivo(const aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_SalvarArquivo(const aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_VerificarGTECF(const aacHandle: PAACHandle; const NumSerie: PChar;
  var GrandeTotal: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_AtualizarValorGT(const aacHandle: PAACHandle; const NumSerie: PChar;
  const GrandeTotal: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_AtualizarMD5(const aacHandle: PAACHandle; const md5: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_AchaECF(const aacHandle: PAACHandle; const numero: PChar;
  var ECF: TECFAutorizado): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_AchaIndiceECF(const aacHandle: PAACHandle; const numero: PChar;
  var Indice: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_VerificaReCarregarArquivo(const aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Dados de ECF autorizados}

function AAC_IdentPaf_ECFsAutorizados_Clear(const aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_ECFsAutorizados_Get(const aacHandle: PAACHandle;
  var retEcfAutorizado: TEcfAutorizado; const index: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_ECFsAutorizados_New(const aacHandle: PAACHandle;
  const retEcfAutorizado: TEcfAutorizado): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_ECFsAutorizados_Count(const aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Dados de Outros Arquivos}

function AAC_IdentPaf_OutrosArquivos_Clear(const aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_OutrosArquivos_Get(const aacHandle: PAACHandle;
  var retECFArquivos: TECFArquivo; const index: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_OutrosArquivos_New(const aacHandle: PAACHandle;
  const ECFArquivos: TECFArquivo): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_OutrosArquivos_Count(const aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region ArquivoListaAutenticados}

function AAC_IdentPaf_ArquivoListaAutenticados_GetNome(const aacHandle: PAACHandle;
  Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_ArquivoListaAutenticados_SetNome(const aacHandle: PAACHandle;
  const Nome: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_ArquivoListaAutenticados_GetMD5(const aacHandle: PAACHandle;
  Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_ArquivoListaAutenticados_SetMD5(const aacHandle: PAACHandle;
  const md5: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Dados da identificação do PAF}

function AAC_IdentPaf_GetNumeroLaudo(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_SetNumeroLaudo(const aacHandle: PaacHandle;
  const numLaudo: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_GetDataLaudo(const aacHandle: PaacHandle;
   var dataLaudo: double): integer; {$IFDEF STDCALL} stdcall;
  {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_SetDataLaudo(const aacHandle: PaacHandle;
  const dataLaudo: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_GetVersaoER(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_SetVersaoER(const aacHandle: PaacHandle;
  const versaoER: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region DADOS DE NÃO CONCOMITÂNCIA}

function AAC_IdentPaf_Paf_GetRealizaPreVenda(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetRealizaPreVenda(const aacHandle: PaacHandle;
  const RealizaPreVenda: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetRealizaDAVECF(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetRealizaDAVECF(const aacHandle: PaacHandle;
  const RealizaDAVECF: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetRealizaDAVNaoFiscal(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetRealizaDAVNaoFiscal(const aacHandle: PaacHandle;
  const RealizaDAVNaoFiscal: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetRealizaDAVOS(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetRealizaDAVOS(const aacHandle: PaacHandle;
  const RealizaDAVOS: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetDAVConfAnexoII(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetDAVConfAnexoII(const aacHandle: PaacHandle;
  const DAVConfAnexoII: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetRealizaLancamentoMesa(
  const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetRealizaLancamentoMesa(const aacHandle: PaacHandle;
  const RealizaLancamentoMesa: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Posto Combustivel }

function AAC_IdentPaf_Paf_GetAcumulaVolumeDiario(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetAcumulaVolumeDiario(const aacHandle: PaacHandle;
  const AcumulaVolumeDiario: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetArmazenaEncerranteIniFinal(
  const aacHandle: PaacHandle): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetArmazenaEncerranteIniFinal(const aacHandle: PaacHandle;
  const ArmazenaEncerranteIniFinal: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetCadastroPlacaBomba(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetCadastroPlacaBomba(const aacHandle: PaacHandle;
  const CadastroPlacaBomba: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetEmiteContrEncerrAposREDZLEIX(
  const aacHandle: PaacHandle): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetEmiteContrEncerrAposREDZLEIX(const aacHandle: PaacHandle;
  const EmiteContrEncerrAposREDZLEIX: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetImpedeVendaVlrZero(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetImpedeVendaVlrZero(const aacHandle: PaacHandle;
  const ImpedeVendaVlrZero: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetIntegradoComBombas(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetIntegradoComBombas(const aacHandle: PaacHandle;
  const IntegradoComBombas: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetCriaAbastDivergEncerrante(
  const aacHandle: PaacHandle): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetCriaAbastDivergEncerrante(const aacHandle: PaacHandle;
  const CriaAbastDivergEncerrante: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Transporte Passageiros }

function AAC_IdentPaf_Paf_GetTransportePassageiro(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetTransportePassageiro(const aacHandle: PaacHandle;
  const TransportePassageiro: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region DADOS DE FUNCIONALIDADE}

function AAC_IdentPaf_Paf_GetTipoFuncionamento(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetTipoFuncionamento(const aacHandle: PaacHandle;
  const TipoFuncionamento: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetTipoDesenvolvimento(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetTipoDesenvolvimento(const aacHandle: PaacHandle;
  const TipoDesenvolvimento: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetIntegracaoPafECF(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetIntegracaoPafECF(const aacHandle: PaacHandle;
  const IntegracaoPafECF: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region DADOS DO APLICATIVO}

function AAC_IdentPaf_Paf_GetNome(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetNome(const aacHandle: PaacHandle;
  const Nome: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetLinguagem(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetLinguagem(const aacHandle: PaacHandle;
  const Linguagem: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetBancoDados(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetBancoDados(const aacHandle: PaacHandle;
  const BancoDados: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetSistemaOperacional(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetSistemaOperacional(const aacHandle: PaacHandle;
  const SistemaOperacional: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetVersao(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetVersao(const aacHandle: PaacHandle;
  const Versao: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_PrincipalExe_GetNome(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_PrincipalExe_SetNome(const aacHandle: PaacHandle;
  const NomePrincipalExe: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_PrincipalExe_GetMD5(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_PrincipalExe_SetMD5(const aacHandle: PaacHandle;
  const MD5: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetPerfilRequisitos(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetPerfilRequisitos(const aacHandle: PaacHandle;
  const Perfil: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region DADOS DE APLICAÇÕES ESPECIAIS}

function AAC_IdentPaf_Paf_GetIndiceTecnicoProd(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetIndiceTecnicoProd(const aacHandle: PaacHandle;
  const IndiceTecnicoProd: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetBarSimilarECFRestaurante(
  const aacHandle: PaacHandle): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetBarSimilarECFRestaurante(const aacHandle: PaacHandle;
  const BarSimilarECFRestaurante: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetBarSimilarECFComum(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetBarSimilarECFComum(const aacHandle: PaacHandle;
  const BarSimilarECFComum: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetBarSimilarBalanca(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetBarSimilarBalanca(const aacHandle: PaacHandle;
  const BarSimilarBalanca: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetUsaImpressoraNaoFiscal(
  const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetUsaImpressoraNaoFiscal(const aacHandle: PaacHandle;
  const UsaImpressoraNaoFiscal: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetDAVDiscrFormula(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetDAVDiscrFormula(const aacHandle: PaacHandle;
  const DAVDiscrFormula: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region CRITÉRIOS POR UF }

function AAC_IdentPaf_Paf_GetTotalizaValoresLista(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetTotalizaValoresLista(const aacHandle: PaacHandle;
  const TotalizaValoresLista: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetTransfPreVenda(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetTransfPreVenda(const aacHandle: PaacHandle;
  const TransfPreVenda: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetTransfDAV(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetTransfDAV(const aacHandle: PaacHandle;
  const TransfDAV: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetRecompoeGT(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetRecompoeGT(const aacHandle: PaacHandle;
  const RecompoeGT: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetEmitePED(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetEmitePED(const aacHandle: PaacHandle;
  const EmitePED: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetCupomMania(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetCupomMania(const aacHandle: PaacHandle;
  const CupomMania: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetMinasLegal(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetMinasLegal(const aacHandle: PaacHandle;
  const MinasLegal: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetParaibaLegal(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetParaibaLegal(const aacHandle: PaacHandle;
  const ParaibaLegal: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetNotaLegalDF(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetNotaLegalDF(const aacHandle: PaacHandle;
  const NotaLegalDF: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetRecompoeNumSerie(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetRecompoeNumSerie(const aacHandle: PaacHandle;
  const RecompoeNumSerie: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_GetTrocoEmCartao(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Paf_SetTrocoEmCartao(const aacHandle: PaacHandle;
  const TrocoEmCartao: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region DADOS DA SOFTWARE HOUSE}

function AAC_IdentPaf_Empresa_GetCNPJ(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Empresa_SetCNPJ(const aacHandle: PaacHandle;
  const CNPJ: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Empresa_GetRazaoSocial(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Empresa_SetRazaoSocial(const aacHandle: PaacHandle;
  const RazaoSocial: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Empresa_GetEndereco(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Empresa_SetEndereco(const aacHandle: PaacHandle;
  const Endereco: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Empresa_GetCep(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Empresa_SetCep(const aacHandle: PaacHandle;
  const Cep: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Empresa_GetCidade(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Empresa_SetCidade(const aacHandle: PaacHandle;
  const Cidade: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Empresa_GetUf(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Empresa_SetUf(const aacHandle: PaacHandle;
  const Uf: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Empresa_GetTelefone(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Empresa_SetTelefone(const aacHandle: PaacHandle;
  const Telefone: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Empresa_GetContato(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Empresa_SetContato(const aacHandle: PaacHandle;
  const Contato: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Empresa_GetEmail(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Empresa_SetEmail(const aacHandle: PaacHandle;
  const Email: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Empresa_GetIE(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Empresa_SetIE(const aacHandle: PaacHandle;
  const IE: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Empresa_GetIM(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_IdentPaf_Empresa_SetIM(const aacHandle: PaacHandle;
  const IM: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Set Eventos}

function AAC_SetOnAntesAbrirArquivo(const aacHandle: PAACHandle;
  const method: TBooleanCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_SetOnAntesGravarArquivo(const aacHandle: PAACHandle;
  const method: TBooleanCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_SetOnCrypt(const aacHandle: PAACHandle;
  const method: TCryptCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_SetOnDeCrypt(const aacHandle: PAACHandle;
  const method: TCryptCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_SetOnDepoisAbrirArquivo(const aacHandle: PAACHandle;
  const method: TNoArgumentsCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_SetOnDepoisGravarArquivo(const aacHandle: PAACHandle;
  const method: TNoArgumentsCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_SetOnGetChave(const aacHandle: PAACHandle;
  const method: TRetStringCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_SetVerificarRecomporNumSerie(const aacHandle: PAACHandle;
  const method: TVerificarRecomporNumSerieCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function AAC_SetVerificarRecomporValorGT(const aacHandle: PAACHandle;
  const method: TVerificarRecomporValorGTCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%endregion}

implementation

{%region Constructor/Destructor/Erro}
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
CRIA um novo componente TACBrAAC retornando o ponteiro para o objeto criado.
Este ponteiro deve ser armazenado pela aplicação que utiliza a DLL e informado
em todas as chamadas de função relativas ao TACBrAAC
}
function AAC_Create(var aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try
    New(aacHandle);
    aacHandle^.AAC := TACBrAAC.Create(nil);
    aacHandle^.EventHandlers := TEventHandlersAAC.Create();
    aacHandle^.UltimoErro := '';
    Result := 0;
  except
    on Exception: Exception do
    begin
      Result := -1;
      aacHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

{
DESTRÓI o objeto TACBrAAC e libera a memória utilizada.
Esta função deve SEMPRE ser chamada pela aplicação que utiliza a DLL
quando o componente não mais for utilizado.
}
function AAC_Destroy(aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    aacHandle^.AAC.Destroy;
    aacHandle^.AAC := nil;

    Dispose(aacHandle);
    aacHandle := nil;
    Result := 0;

  except
    on Exception: Exception do
    begin
      Result := -1;
      aacHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

function AAC_GetUltimoErro(const aacHandle: PAACHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try
    StrPLCopy(Buffer, aacHandle^.UltimoErro, BufferLen);
    Result := length(aacHandle^.UltimoErro);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Propriedades do AAC}

function AAC_GetArqLOG(const aacHandle: PAACHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := aacHandle^.AAC.ArqLOG;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_SetArqLOG(const aacHandle: PAACHandle; const ArqLOG: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.ArqLOG := ArqLOG;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_GetCriarBAK(const aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if aacHandle^.AAC.CriarBAK then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_SetCriarBAK(const aacHandle: PAACHandle; const Value: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.CriarBAK := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_GetEfetuarFlush(const aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if aacHandle^.AAC.EfetuarFlush then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_SetEfetuarFlush(const aacHandle: PAACHandle;
  const Value: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.EfetuarFlush := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_GetGravarConfigApp(const aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if aacHandle^.AAC.GravarConfigApp then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function AAC_SetGravarConfigApp(const aacHandle: PAACHandle;
  const Value: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.GravarConfigApp := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function AAC_GetGravarDadosPAF(const aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if aacHandle^.AAC.GravarDadosPAF then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function AAC_SetGravarDadosPAF(const aacHandle: PAACHandle;
  const Value: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.GravarDadosPAF := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function AAC_GetGravarDadosSH(const aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if aacHandle^.AAC.GravarDadosSH then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function AAC_SetGravarDadosSH(const aacHandle: PAACHandle;
  const Value: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.GravarDadosSH := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function AAC_GetGravarTodosECFs(const aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if aacHandle^.AAC.GravarTodosECFs then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function AAC_SetGravarTodosECFs(const aacHandle: PAACHandle;
  const Value: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.GravarTodosECFs := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function AAC_GetNomeArquivoAux(const aacHandle: PAACHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := aacHandle^.AAC.NomeArquivoAux;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_SetNomeArquivoAux(const aacHandle: PAACHandle;
  const NomeArquivoAux: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.NomeArquivoAux := NomeArquivoAux;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_GetParams(const aacHandle: PAACHandle; Buffer: PChar;
  const BufferLen, index: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := aacHandle^.AAC.Params[Index];
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_GetParamsCount(const aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := aacHandle^.AAC.Params.Count;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_SetParams(const aacHandle: PAACHandle; const Params: array of PChar;
  const Count: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  i: integer;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.Params.Clear;
    for i := 0 to Count - 1 do
    begin
      aacHandle^.AAC.Params.Add(Params[i]);
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_GetChave(const aacHandle: PAACHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  try
    StrTmp := aacHandle^.EventHandlers.ChaveCriptografia;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_SetChave(const aacHandle: PAACHandle; const Chave: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try
    if not Assigned(aacHandle^.AAC.OnGetChave) then
    begin
      aacHandle^.AAC.OnGetChave := aacHandle^.EventHandlers.OnGetChave;
    end;
    aacHandle^.EventHandlers.ChaveCriptografia := Chave;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region Metodos do AAC}

function AAC_AbrirArquivo(const aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.AbrirArquivo;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_SalvarArquivo(const aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;
  try
    aacHandle^.AAC.SalvarArquivo;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_VerificarGTECF(const aacHandle: PAACHandle; const NumSerie: PChar;
  var GrandeTotal: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;
  try
    Result := aacHandle^.AAC.VerificarGTECF(NumSerie, GrandeTotal);

    //Os retornos do método VerificarGTECF são números negativos
    //Para o ACBrDLL os retornos precisam ser positivos, caso contrário serão exceptions
    // Retornos:
    //   0 = Tudo OK
    //  -1 = NumSerie não encontrado
    //  -2 = GT não confere
    Result := Result * -1;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_AtualizarValorGT(const aacHandle: PAACHandle; const NumSerie: PChar;
  const GrandeTotal: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;
  try
    aacHandle^.AAC.AtualizarValorGT(NumSerie, GrandeTotal);
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_AtualizarMD5(const aacHandle: PAACHandle; const md5: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.AtualizarMD5(md5);
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_AchaECF(const aacHandle: PAACHandle; const numero: PChar;
  var ECF: TECFAutorizado): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  TECF: TACBrAACECF;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    TECF := aacHandle^.AAC.AchaECF(numero);
    if TECF <> nil then
    begin
      ECF.CNI := TECF.CNI;
      ECF.CRO := TECF.CRO;
      ECF.DtHrAtualizado := TECF.DtHrAtualizado;
      ECF.ValorGT := TECF.ValorGT;
      ECF.Serie := TECF.NumeroSerie;
      Result := 1;
    end
    else
    begin
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function AAC_AchaIndiceECF(const aacHandle: PAACHandle; const numero: PChar;
  var Indice: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Indice := aacHandle^.AAC.AchaIndiceECF(numero);
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function AAC_VerificaReCarregarArquivo(const aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.VerificaReCarregarArquivo;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Dados de ECF autorizados}

function AAC_IdentPaf_ECFsAutorizados_Clear(const aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.ECFsAutorizados.Clear;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_ECFsAutorizados_Get(const aacHandle: PAACHandle;
  var retEcfAutorizado: TEcfAutorizado; const index: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  ecfAutorizado: TACBrAACECF;
begin
  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (index >= 0) and (index < aacHandle^.AAC.IdentPAF.ECFsAutorizados.Count) then
    begin

      ecfAutorizado := aacHandle^.AAC.IdentPAF.ECFsAutorizados[index];
      retEcfAutorizado.CNI := ecfAutorizado.CNI;
      retEcfAutorizado.CRO := ecfAutorizado.CRO;
      retEcfAutorizado.ValorGT := ecfAutorizado.ValorGT;
      retEcfAutorizado.Serie := PChar(ecfAutorizado.NumeroSerie);
      Result := 0;
    end
    else
    begin
      Result := -3;
    end;

  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function AAC_IdentPaf_ECFsAutorizados_New(const aacHandle: PAACHandle;
  const retEcfAutorizado: TEcfAutorizado): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  serie: PChar;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    begin
      with aacHandle^.AAc.IdentPAF.ECFsAutorizados.New do
      begin
        serie := StrAlloc(30);
        StrPLCopy(serie, retEcfAutorizado.Serie, 30);
        NumeroSerie := string(serie);
        ValorGT := retEcfAutorizado.ValorGT;
        CRO := retEcfAutorizado.CRO;
        CNI := retEcfAutorizado.CNI;
        StrDispose(serie);
      end;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_ECFsAutorizados_Count(const aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := aacHandle^.AAC.IdentPAF.ECFsAutorizados.Count;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region Dados de Outros Arquivos}

function AAC_IdentPaf_OutrosArquivos_Clear(const aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.OutrosArquivos.Clear;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_OutrosArquivos_Get(const aacHandle: PAACHandle;
  var retECFArquivos: TECFArquivo; const index: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  ecfArquivo: TACBrECFArquivo;
begin
  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (index >= 0) and (index < aacHandle^.AAC.IdentPAF.OutrosArquivos.Count) then
    begin
      ecfArquivo := aacHandle^.AAC.IdentPAF.OutrosArquivos[index];
      retECFArquivos.NOME_ARQUIVO := PChar(ecfArquivo.Nome);
      retECFArquivos.MD5 := PChar(ecfArquivo.MD5);
      Result := 0;
    end
    else
    begin
      Result := -3;
    end;

  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function AAC_IdentPaf_OutrosArquivos_New(const aacHandle: PAACHandle;
  const ECFArquivos: TECFArquivo): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with aacHandle^.AAc.IdentPAF.OutrosArquivos.New do
    begin
      Nome := ECFArquivos.NOME_ARQUIVO;
      MD5 := ECFArquivos.MD5;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function AAC_IdentPaf_OutrosArquivos_Count(const aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := aacHandle^.AAC.IdentPAF.OutrosArquivos.Count;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region ArquivoListaAutenticados}

function AAC_IdentPaf_ArquivoListaAutenticados_GetNome(const aacHandle: PAACHandle;
  Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := aacHandle^.AAC.IdentPAF.ArquivoListaAutenticados.Nome;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_ArquivoListaAutenticados_SetNome(const aacHandle: PAACHandle;
  const Nome: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.ArquivoListaAutenticados.Nome := Nome;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_ArquivoListaAutenticados_GetMD5(const aacHandle: PAACHandle;
  Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := aacHandle^.AAC.IdentPAF.ArquivoListaAutenticados.MD5;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_ArquivoListaAutenticados_SetMD5(const aacHandle: PAACHandle;
  const md5: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.ArquivoListaAutenticados.MD5 := md5;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region Dados da identificação do PAF}

function AAC_IdentPaf_GetNumeroLaudo(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := aacHandle^.AAC.IdentPAF.NumeroLaudo;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_SetNumeroLaudo(const aacHandle: PaacHandle;
  const numLaudo: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.NumeroLaudo := numLaudo;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_GetDataLaudo(const aacHandle: PaacHandle;
  var dataLaudo: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    dataLaudo := double(aacHandle^.AAC.IdentPAF.DataLaudo);
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_SetDataLaudo(const aacHandle: PaacHandle;
  const dataLaudo: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.DataLaudo := dataLaudo;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;


function AAC_IdentPaf_GetVersaoER(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := aacHandle^.AAC.IdentPAF.VersaoER;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_SetVersaoER(const aacHandle: PaacHandle;
  const versaoER: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.VersaoER := versaoER;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region DADOS DE NÃO CONCOMITÂNCIA}

function AAC_IdentPaf_Paf_GetRealizaPreVenda(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.RealizaPreVenda);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetRealizaPreVenda(const aacHandle: PaacHandle;
  const RealizaPreVenda: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.RealizaPreVenda := RealizaPreVenda;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetRealizaDAVECF(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.RealizaDAVECF);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetRealizaDAVECF(const aacHandle: PaacHandle;
  const RealizaDAVECF: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.RealizaDAVECF := RealizaDAVECF;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetRealizaDAVNaoFiscal(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.RealizaDAVNaoFiscal);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetRealizaDAVNaoFiscal(const aacHandle: PaacHandle;
  const RealizaDAVNaoFiscal: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.RealizaDAVNaoFiscal := RealizaDAVNaoFiscal;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetRealizaDAVOS(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.RealizaDAVOS);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetRealizaDAVOS(const aacHandle: PaacHandle;
  const RealizaDAVOS: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.RealizaDAVOS := RealizaDAVOS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetDAVConfAnexoII(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.DAVConfAnexoII);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetDAVConfAnexoII(const aacHandle: PaacHandle;
  const DAVConfAnexoII: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.DAVConfAnexoII := DAVConfAnexoII;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetRealizaLancamentoMesa(
  const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.RealizaLancamentoMesa);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetRealizaLancamentoMesa(const aacHandle: PaacHandle;
  const RealizaLancamentoMesa: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.RealizaLancamentoMesa := RealizaLancamentoMesa;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region Posto Combustivel }

function AAC_IdentPaf_Paf_GetAcumulaVolumeDiario(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.AcumulaVolumeDiario);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetAcumulaVolumeDiario(const aacHandle: PaacHandle;
  const AcumulaVolumeDiario: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.AcumulaVolumeDiario := AcumulaVolumeDiario;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetArmazenaEncerranteIniFinal(
  const aacHandle: PaacHandle): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.ArmazenaEncerranteIniFinal);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetArmazenaEncerranteIniFinal(const aacHandle: PaacHandle;
  const ArmazenaEncerranteIniFinal: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.ArmazenaEncerranteIniFinal :=
      ArmazenaEncerranteIniFinal;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetCadastroPlacaBomba(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.CadastroPlacaBomba);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetCadastroPlacaBomba(const aacHandle: PaacHandle;
  const CadastroPlacaBomba: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.CadastroPlacaBomba := CadastroPlacaBomba;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetEmiteContrEncerrAposREDZLEIX(
  const aacHandle: PaacHandle): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.EmiteContrEncerrAposREDZLEIX);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetEmiteContrEncerrAposREDZLEIX(const aacHandle: PaacHandle;
  const EmiteContrEncerrAposREDZLEIX: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.EmiteContrEncerrAposREDZLEIX :=
      EmiteContrEncerrAposREDZLEIX;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetImpedeVendaVlrZero(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.ImpedeVendaVlrZero);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetImpedeVendaVlrZero(const aacHandle: PaacHandle;
  const ImpedeVendaVlrZero: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.ImpedeVendaVlrZero := ImpedeVendaVlrZero;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetIntegradoComBombas(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.IntegradoComBombas);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetIntegradoComBombas(const aacHandle: PaacHandle;
  const IntegradoComBombas: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.IntegradoComBombas := IntegradoComBombas;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetCriaAbastDivergEncerrante(
  const aacHandle: PaacHandle): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.CriaAbastDivergEncerrante);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetCriaAbastDivergEncerrante(const aacHandle: PaacHandle;
  const CriaAbastDivergEncerrante: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.CriaAbastDivergEncerrante := CriaAbastDivergEncerrante;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region Transporte Passageiros }

function AAC_IdentPaf_Paf_GetTransportePassageiro(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.TransportePassageiro);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetTransportePassageiro(const aacHandle: PaacHandle;
  const TransportePassageiro: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.TransportePassageiro := TransportePassageiro;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;


{%endregion}

{%region DADOS DE FUNCIONALIDADE}

function AAC_IdentPaf_Paf_GetTipoFuncionamento(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.TipoFuncionamento);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetTipoFuncionamento(const aacHandle: PaacHandle;
  const TipoFuncionamento: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.TipoFuncionamento :=
      TACBrPAFTipoFuncionamento(TipoFuncionamento);
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetTipoDesenvolvimento(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.TipoDesenvolvimento);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetTipoDesenvolvimento(const aacHandle: PaacHandle;
  const TipoDesenvolvimento: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.TipoDesenvolvimento :=
      TACBrPAFTipoDesenvolvimento(TipoDesenvolvimento);
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetIntegracaoPafECF(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.IntegracaoPAFECF);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetIntegracaoPafECF(const aacHandle: PaacHandle;
  const IntegracaoPafECF: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.IntegracaoPAFECF :=
      TACBrPAFTipoIntegracao(IntegracaoPafECF);
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region DADOS DO APLICATIVO}

function AAC_IdentPaf_Paf_GetNome(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := aacHandle^.AAC.IdentPAF.Paf.Nome;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetNome(const aacHandle: PaacHandle;
  const Nome: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.Nome := Nome;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetLinguagem(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := aacHandle^.AAC.IdentPAF.Paf.Linguagem;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetLinguagem(const aacHandle: PaacHandle;
  const Linguagem: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.Linguagem := Linguagem;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetBancoDados(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := aacHandle^.AAC.IdentPAF.Paf.BancoDados;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetBancoDados(const aacHandle: PaacHandle;
  const BancoDados: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.BancoDados := BancoDados;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetSistemaOperacional(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := aacHandle^.AAC.IdentPAF.Paf.SistemaOperacional;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetSistemaOperacional(const aacHandle: PaacHandle;
  const SistemaOperacional: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.SistemaOperacional := SistemaOperacional;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetVersao(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := aacHandle^.AAC.IdentPAF.Paf.Versao;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetVersao(const aacHandle: PaacHandle;
  const Versao: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.Versao := Versao;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_PrincipalExe_GetNome(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := aacHandle^.AAC.IdentPAF.Paf.PrincipalExe.Nome;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_PrincipalExe_SetNome(const aacHandle: PaacHandle;
  const NomePrincipalExe: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.PrincipalExe.Nome := NomePrincipalExe;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_PrincipalExe_GetMD5(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := aacHandle^.AAC.IdentPAF.Paf.PrincipalExe.MD5;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_PrincipalExe_SetMD5(const aacHandle: PaacHandle;
  const MD5: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.PrincipalExe.MD5 := MD5;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetPerfilRequisitos(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := aacHandle^.AAC.IdentPAF.Paf.PerfilRequisitos;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetPerfilRequisitos(const aacHandle: PaacHandle;
  const Perfil: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.PerfilRequisitos := Perfil;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region DADOS DE APLICAÇÕES ESPECIAIS}

function AAC_IdentPaf_Paf_GetIndiceTecnicoProd(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.IndiceTecnicoProd);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetIndiceTecnicoProd(const aacHandle: PaacHandle;
  const IndiceTecnicoProd: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.IndiceTecnicoProd := IndiceTecnicoProd;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetBarSimilarECFRestaurante(
  const aacHandle: PaacHandle): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.BarSimilarECFRestaurante);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetBarSimilarECFRestaurante(const aacHandle: PaacHandle;
  const BarSimilarECFRestaurante: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.BarSimilarECFRestaurante := BarSimilarECFRestaurante;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetBarSimilarECFComum(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.BarSimilarECFComum);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetBarSimilarECFComum(const aacHandle: PaacHandle;
  const BarSimilarECFComum: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.BarSimilarECFComum := BarSimilarECFComum;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetBarSimilarBalanca(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.BarSimilarBalanca);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetBarSimilarBalanca(const aacHandle: PaacHandle;
  const BarSimilarBalanca: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.BarSimilarBalanca := BarSimilarBalanca;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetUsaImpressoraNaoFiscal(
  const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.UsaImpressoraNaoFiscal);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetUsaImpressoraNaoFiscal(const aacHandle: PaacHandle;
  const UsaImpressoraNaoFiscal: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.UsaImpressoraNaoFiscal := UsaImpressoraNaoFiscal;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetDAVDiscrFormula(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.DAVDiscrFormula);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetDAVDiscrFormula(const aacHandle: PaacHandle;
  const DAVDiscrFormula: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.DAVDiscrFormula := DAVDiscrFormula;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region CRITÉRIOS POR UF }

function AAC_IdentPaf_Paf_GetTotalizaValoresLista(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.TotalizaValoresLista);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetTotalizaValoresLista(const aacHandle: PaacHandle;
  const TotalizaValoresLista: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.TotalizaValoresLista := TotalizaValoresLista;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetTransfPreVenda(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.TransfPreVenda);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetTransfPreVenda(const aacHandle: PaacHandle;
  const TransfPreVenda: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.TransfPreVenda := TransfPreVenda;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetTransfDAV(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.TransfDAV);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetTransfDAV(const aacHandle: PaacHandle;
  const TransfDAV: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.TransfDAV := TransfDAV;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetRecompoeGT(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.RecompoeGT);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetRecompoeGT(const aacHandle: PaacHandle;
  const RecompoeGT: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.RecompoeGT := RecompoeGT;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetEmitePED(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.EmitePED);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetEmitePED(const aacHandle: PaacHandle;
  const EmitePED: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.EmitePED := EmitePED;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetCupomMania(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.CupomMania);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetCupomMania(const aacHandle: PaacHandle;
  const CupomMania: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.CupomMania := CupomMania;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetMinasLegal(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.MinasLegal);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetMinasLegal(const aacHandle: PaacHandle;
  const MinasLegal: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.MinasLegal := MinasLegal;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetParaibaLegal(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.ParaibaLegal);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetParaibaLegal(const aacHandle: PaacHandle;
  const ParaibaLegal: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.ParaibaLegal := ParaibaLegal;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetNotaLegalDF(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.NotaLegalDF);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetNotaLegalDF(const aacHandle: PaacHandle;
  const NotaLegalDF: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.NotaLegalDF := NotaLegalDF;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetRecompoeNumSerie(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.RecompoeNumSerie);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetRecompoeNumSerie(const aacHandle: PaacHandle;
  const RecompoeNumSerie: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.RecompoeNumSerie := RecompoeNumSerie;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_GetTrocoEmCartao(const aacHandle: PaacHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(aacHandle^.AAC.IdentPAF.Paf.TrocoEmCartao);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Paf_SetTrocoEmCartao(const aacHandle: PaacHandle;
  const TrocoEmCartao: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Paf.TrocoEmCartao := TrocoEmCartao;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region DADOS DA SOFTWARE HOUSE}

function AAC_IdentPaf_Empresa_GetCNPJ(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := aacHandle^.AAC.IdentPAF.Empresa.CNPJ;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Empresa_SetCNPJ(const aacHandle: PaacHandle;
  const CNPJ: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Empresa.CNPJ := CNPJ;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Empresa_GetRazaoSocial(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := aacHandle^.AAC.IdentPAF.Empresa.RazaoSocial;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Empresa_SetRazaoSocial(const aacHandle: PaacHandle;
  const RazaoSocial: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Empresa.RazaoSocial := RazaoSocial;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Empresa_GetEndereco(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := aacHandle^.AAC.IdentPAF.Empresa.Endereco;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Empresa_SetEndereco(const aacHandle: PaacHandle;
  const Endereco: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Empresa.Endereco := Endereco;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Empresa_GetCep(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := aacHandle^.AAC.IdentPAF.Empresa.Cep;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Empresa_SetCep(const aacHandle: PaacHandle;
  const Cep: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Empresa.Cep := Cep;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Empresa_GetCidade(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := aacHandle^.AAC.IdentPAF.Empresa.Cidade;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Empresa_SetCidade(const aacHandle: PaacHandle;
  const Cidade: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Empresa.Cidade := Cidade;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Empresa_GetUf(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := aacHandle^.AAC.IdentPAF.Empresa.Uf;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Empresa_SetUf(const aacHandle: PaacHandle;
  const Uf: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Empresa.Uf := Uf;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Empresa_GetTelefone(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := aacHandle^.AAC.IdentPAF.Empresa.Telefone;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Empresa_SetTelefone(const aacHandle: PaacHandle;
  const Telefone: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Empresa.Telefone := Telefone;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Empresa_GetContato(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := aacHandle^.AAC.IdentPAF.Empresa.Contato;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Empresa_SetContato(const aacHandle: PaacHandle;
  const Contato: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Empresa.Contato := Contato;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Empresa_GetEmail(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := aacHandle^.AAC.IdentPAF.Empresa.Email;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Empresa_SetEmail(const aacHandle: PaacHandle;
  const Email: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Empresa.Email := Email;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Empresa_GetIE(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := aacHandle^.AAC.IdentPAF.Empresa.IE;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Empresa_SetIE(const aacHandle: PaacHandle;
  const IE: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Empresa.IE := IE;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Empresa_GetIM(const aacHandle: PaacHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := aacHandle^.AAC.IdentPAF.Empresa.IM;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_IdentPaf_Empresa_SetIM(const aacHandle: PaacHandle;
  const IM: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    aacHandle^.AAC.IdentPAF.Empresa.IM := IM;
    Result := 0;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region Set Eventos}

function AAC_SetOnAntesAbrirArquivo(const aacHandle: PAACHandle;
  const method: TBooleanCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      aacHandle^.AAC.OnAntesAbrirArquivo := aacHandle^.EventHandlers.OnAntesAbrirArquivo;
      aacHandle^.EventHandlers.OnAntesAbrirArquivoCallback := method;
      Result := 0;
    end
    else
    begin
      aacHandle^.AAC.OnAntesAbrirArquivo := nil;
      aacHandle^.EventHandlers.OnAntesAbrirArquivoCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_SetOnAntesGravarArquivo(const aacHandle: PAACHandle;
  const method: TBooleanCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      aacHandle^.AAC.OnAntesGravarArquivo :=
        aacHandle^.EventHandlers.OnAntesGravarArquivo;
      aacHandle^.EventHandlers.OnAntesGravarArquivoCallback := method;
      Result := 0;
    end
    else
    begin
      aacHandle^.AAC.OnAntesGravarArquivo := nil;
      aacHandle^.EventHandlers.OnAntesGravarArquivoCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_SetOnCrypt(const aacHandle: PAACHandle;
  const method: TCryptCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      aacHandle^.AAC.OnCrypt := aacHandle^.EventHandlers.OnCrypt;
      aacHandle^.EventHandlers.OnCryptCallback := method;
      Result := 0;
    end
    else
    begin
      aacHandle^.AAC.OnCrypt := nil;
      aacHandle^.EventHandlers.OnCryptCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_SetOnDeCrypt(const aacHandle: PAACHandle;
  const method: TCryptCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      aacHandle^.AAC.OnDeCrypt := aacHandle^.EventHandlers.OnDeCrypt;
      aacHandle^.EventHandlers.OnDeCryptCallback := method;
      Result := 0;
    end
    else
    begin
      aacHandle^.AAC.OnDeCrypt := nil;
      aacHandle^.EventHandlers.OnDeCryptCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_SetOnDepoisAbrirArquivo(const aacHandle: PAACHandle;
  const method: TNoArgumentsCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      aacHandle^.AAC.OnDepoisAbrirArquivo :=
        aacHandle^.EventHandlers.OnDepoisAbrirArquivo;
      aacHandle^.EventHandlers.OnDepoisAbrirArquivoCallback := method;
      Result := 0;
    end
    else
    begin
      aacHandle^.AAC.OnDepoisAbrirArquivo := nil;
      aacHandle^.EventHandlers.OnDepoisAbrirArquivoCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_SetOnDepoisGravarArquivo(const aacHandle: PAACHandle;
  const method: TNoArgumentsCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      aacHandle^.AAC.OnDepoisGravarArquivo :=
        aacHandle^.EventHandlers.OnDepoisGravarArquivo;
      aacHandle^.EventHandlers.OnDepoisAbrirArquivoCallback := method;
      Result := 0;
    end
    else
    begin
      aacHandle^.AAC.OnDepoisGravarArquivo := nil;
      aacHandle^.EventHandlers.OnDepoisGravarArquivoCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_SetOnGetChave(const aacHandle: PAACHandle;
  const method: TRetStringCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      aacHandle^.AAC.OnGetChave := aacHandle^.EventHandlers.OnGetChave;
      aacHandle^.EventHandlers.OnGetChaveCallback := method;
      Result := 0;
    end
    else
    begin
      aacHandle^.AAC.OnGetChave := nil;
      aacHandle^.EventHandlers.OnGetChaveCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_SetVerificarRecomporNumSerie(const aacHandle: PAACHandle;
  const method: TVerificarRecomporNumSerieCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      aacHandle^.AAC.VerificarRecomporNumSerie :=
        aacHandle^.EventHandlers.VerificarRecomporNumSerie;
      aacHandle^.EventHandlers.VerificarRecomporNumSerieCallback := method;
      Result := 0;
    end
    else
    begin
      aacHandle^.AAC.VerificarRecomporNumSerie := nil;
      aacHandle^.EventHandlers.VerificarRecomporNumSerieCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function AAC_SetVerificarRecomporValorGT(const aacHandle: PAACHandle;
  const method: TVerificarRecomporValorGTCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (aacHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      aacHandle^.AAC.VerificarRecomporValorGT :=
        aacHandle^.EventHandlers.VerificarRecomporValorGT;
      aacHandle^.EventHandlers.VerificarRecomporValorGTCallback := method;
      Result := 0;
    end
    else
    begin
      aacHandle^.AAC.VerificarRecomporValorGT := nil;
      aacHandle^.EventHandlers.VerificarRecomporValorGTCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      aacHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

end.
