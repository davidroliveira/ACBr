unit ACBrECFDll;

interface

uses
  SysUtils,
  Classes,
  ACBrECF,
  ACBrECFClass,
  ACBrDevice,
  ACBrUtil,
  ACBrAACDll,
  ACBrEADDll,
  ACBrHandlers,
  ACBrPAFClass;

{%region Records estilo C utilizados nos retornos das funções}

type
  TAliquotaRec = record
    Indice: array[0..3] of char;
    Aliquota: double;
    Tipo: char;
    Total: double;
    Sequencia: byte;
  end;

type
  TDAVsRec = record
    Numero: array[0..13] of char;
    COO_Cupom: integer;
    COO_Dav: integer;
    Titulo: array[0..30] of char;
    Valor: double;
    DtEmissao: double;
  end;

type
  TFormaPagamentoRec = record
    Indice: array[0..3] of char;
    Descricao: array[0..29] of char;
    PermiteVinculado: boolean;
    Total: double;
    Data: TDateTime;
    TipoDoc: array[0..29] of char;
  end;

type
  TComprovanteNaoFiscalRec = record
    Indice: array[0..3] of char;
    Descricao: array[0..29] of char;
    PermiteVinculado: boolean;
    FormaPagamento: array[0..3] of char;
    Total: double;
    Contador: integer;
  end;

type
  TRelatorioGerencialRec = record
    Indice: array[0..3] of char;
    Descricao: array[0..29] of char;
    Contador: integer;
  end;

{%endregion}

{%region Declaração da funções}

{%region Constructor/Destructor}

function ECF_Create(var ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_Destroy(ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetUltimoErro(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Funções mapeando as propriedades do componente }

function ECF_GetAbout(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetModelo(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetModelo(const ecfHandle: PECFHandle; const Modelo: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetPorta(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetPorta(const ecfHandle: PECFHandle; const Porta: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetTimeOut(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetTimeOut(const ecfHandle: PECFHandle; const TimeOut: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetPaginaDeCodigo(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetPaginaDeCodigo(const ecfHandle: PECFHandle;
  const PaginaDeCodigo: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetIntervaloAposComando(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetIntervaloAposComando(const ecfHandle: PECFHandle;
  const Intervalo: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetDescricaoGrande(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetDescricaoGrande(const ecfHandle: PECFHandle;
  const DescricaoGrande: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetControlePorta(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetControlePorta(const ecfHandle: PECFHandle;
  const ControlePorta: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetGavetaSinalInvertido(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetGavetaSinalInvertido(const ecfHandle: PECFHandle;
  const GavetaSinalInvertido: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetQuebraLinhaRodape(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetQuebraLinhaRodape(const ecfHandle: PECFHandle;
  const QuebraLinhaRodape: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetArredondaPorQtd(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetArredondaPorQtd(const ecfHandle: PECFHandle;
  const ArredondaPorQtd: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetArredondaItemMFD(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetArredondaItemMFD(const ecfHandle: PECFHandle;
  const ArredondaItemMFD: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetIgnorarTagsFormatacao(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetIgnorarTagsFormatacao(const ecfHandle: PECFHandle;
  const IgnorarTagsFormatacao: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetOperador(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOperador(const ecfHandle: PECFHandle; const Operador: PChar): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetLinhasEntreCupons(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetLinhasEntreCupons(const ecfHandle: PECFHandle;
  const LinhasEntreCupons: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetDecimaisPreco(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetDecimaisPreco(const ecfHandle: PECFHandle;
  const DecimaisPreco: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetDecimaisQtd(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetDecimaisQtd(const ecfHandle: PECFHandle;
  const DecimaisQtd: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetArqLOG(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetArqLOG(const ecfHandle: PECFHandle; const ArqLog: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetMaxLinhasBuffer(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetMaxLinhasBuffer(const ecfHandle: PECFHandle;
  const MaxLinha: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetPausaRelatorio(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetPausaRelatorio(const ecfHandle: PECFHandle;
  const Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetDataHoraUltimaReducaoZ(const ecfHandle: PECFHandle;
  var Data: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetReTentar(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetReTentar(const ecfHandle: PECFHandle; const ReTentar: boolean): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region InfoRodapeCupom}

function ECF_InfoRodapeCupom_GetMD5(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_SetMD5(const ecfHandle: PECFHandle;
  const md5: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_GetDav(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_SetDav(const ecfHandle: PECFHandle;
  const Dav: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_GetDavOs(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_SetDavOs(const ecfHandle: PECFHandle;
  const DavOs: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_GetPreVenda(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_SetPreVenda(const ecfHandle: PECFHandle;
  const PreVenda: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_GetCupomMania(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_SetCupomMania(const ecfHandle: PECFHandle;
  const CupomMania: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_GetMinasLegal(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_SetMinasLegal(const ecfHandle: PECFHandle;
  const MinasLegal: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_GetParaibaLegal(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_SetParaibaLegal(const ecfHandle: PECFHandle;
  const ParaibaLegal: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_NotaLegalDF_GetImprimir(
  const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_NotaLegalDF_SetImprimir(const ecfHandle: PECFHandle;
  const Imprimir: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_NotaLegalDF_GetProgramaDeCredito(
  const ecfHandle: PECFHandle): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_NotaLegalDF_SetProgramaDeCredito(
  const ecfHandle: PECFHandle; const ProgramaDeCredito: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_NotaLegalDF_GetValorICMS(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_NotaLegalDF_SetValorICMS(const ecfHandle: PECFHandle;
  const ValorICMS: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_NotaLegalDF_GetValorISS(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_NotaLegalDF_SetValorISS(const ecfHandle: PECFHandle;
  const ValorISS: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_Restaurante_GetImprimir(
  const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_Restaurante_SetImprimir(const ecfHandle: PECFHandle;
  const Imprimir: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_Restaurante_GetECF(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_Restaurante_SetECF(const ecfHandle: PECFHandle;
  const ECF: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_Restaurante_GetCER(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_Restaurante_SetCER(const ecfHandle: PECFHandle;
  const CER: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_Restaurante_GetCOO(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_Restaurante_SetCOO(const ecfHandle: PECFHandle;
  const COO: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_Restaurante_GetMesa(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_Restaurante_SetMesa(const ecfHandle: PECFHandle;
  const mesa: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_Imposto_GetTexto(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_Imposto_SetTexto(const ecfHandle: PECFHandle;
  const texto: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_Imposto_GetFonte(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_Imposto_SetFonte(const ecfHandle: PECFHandle;
  const fonte: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_Imposto_GetValorAproximado(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_Imposto_SetValorAproximado(const ecfHandle: PECFHandle;
  const valor: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_Imposto_GetValorAproximadoFederal(
  const ecfHandle: PECFHandle; var Value: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_Imposto_SetValorAproximadoFederal(
  const ecfHandle: PECFHandle; const valor: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_Imposto_GetValorAproximadoEstadual(
  const ecfHandle: PECFHandle; var Value: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_Imposto_SetValorAproximadoEstadual(
  const ecfHandle: PECFHandle; const valor: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_Imposto_GetValorAproximadoMunicipal(
  const ecfHandle: PECFHandle; var Value: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_Imposto_SetValorAproximadoMunicipal(
  const ecfHandle: PECFHandle; const valor: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_Imposto_GetModoCompacto(
  const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_Imposto_SetModoCompacto(const ecfHandle: PECFHandle;
  const Imprimir: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_PostoCombustivel_GetImprimir(
  const ecfHandle: PECFHandle): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_PostoCombustivel_SetImprimir(const ecfHandle: PECFHandle;
  const Imprimir: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_PostoCombustivel_New(const ecfHandle: PECFHandle;
  var abaHandle: TACBRRodapeAbastecimento): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_PostoCombustivel_Remove(const ecfHandle: PECFHandle;
  var abaHandle: TACBRRodapeAbastecimento): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_PostoCombustivel_Clear(
  const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_PostoCombustivel_GetAutomatico(
  const ecfHandle: PECFHandle;
  const abaHandle: TACBRRodapeAbastecimento): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_PostoCombustivel_SetAutomatico(
  const ecfHandle: PECFHandle;
  const abaHandle: TACBRRodapeAbastecimento; const Value: boolean): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_PostoCombustivel_GetEF(const ecfHandle: PECFHandle;
  const abaHandle: TACBRRodapeAbastecimento; var Value: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_PostoCombustivel_SetEF(const ecfHandle: PECFHandle;
  const abaHandle: TACBRRodapeAbastecimento; const Value: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_PostoCombustivel_GetEI(const ecfHandle: PECFHandle;
  const abaHandle: TACBRRodapeAbastecimento; var Value: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_PostoCombustivel_SetEI(const ecfHandle: PECFHandle;
  const abaHandle: TACBRRodapeAbastecimento; const Value: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_PostoCombustivel_GetVolume(const ecfHandle: PECFHandle;
  const abaHandle: TACBRRodapeAbastecimento; var Value: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_PostoCombustivel_SetVolume(const ecfHandle: PECFHandle;
  const abaHandle: TACBRRodapeAbastecimento; const Value: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_PostoCombustivel_GetBico(const ecfHandle: PECFHandle;
  const abaHandle: TACBRRodapeAbastecimento): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_InfoRodapeCupom_PostoCombustivel_SetBico(const ecfHandle: PECFHandle;
  const abaHandle: TACBRRodapeAbastecimento; const Value: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Consumidor}

function ECF_Consumidor_GetDocumento(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_Consumidor_GetEndereco(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_Consumidor_GetNome(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_Consumidor_GetEnviado(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_Consumidor_SetEnviado(const ecfHandle: PECFHandle;
  const Value: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_Consumidor_GetAtribuido(const ecfHandle: PECFHandle;
  var Value: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_Consumidor_AtribuiConsumidor(const ecfHandle: PECFHandle;
  const CPF_CNPJ, Nome, Endereco: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_Consumidor_Zera(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region ConfigBarras}

function ECF_ConfigBarras_GetAltura(const ecfHandle: PECFHandle;
  var Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_ConfigBarras_SetAltura(const ecfHandle: PECFHandle;
  const Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_ConfigBarras_GetLarguraLinha(const ecfHandle: PECFHandle;
  var Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_ConfigBarras_SetLarguraLinha(const ecfHandle: PECFHandle;
  const Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_ConfigBarras_GetMargem(const ecfHandle: PECFHandle;
  var Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_ConfigBarras_SetMargem(const ecfHandle: PECFHandle;
  const Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_ConfigBarras_GetMostrarCodigo(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_ConfigBarras_SetMostrarCodigo(const ecfHandle: PECFHandle;
  const Value: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Propriedades - Não Visiveis }

function ECF_GetAtivo(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetColunas(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetAguardandoResposta(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetComandoLog(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetComandoLog(const ecfHandle: PECFHandle;
  const ComandoLog: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetAguardaImpressao(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetAguardaImpressao(const ecfHandle: PECFHandle;
  const AguardaImpressao: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetModeloStr(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetRFDID(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetDataHora(const ecfHandle: PECFHandle; var ticks: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetDataHoraStr(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetNumCupom(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetNumCOO(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetNumLoja(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetNumECF(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetNumSerie(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetNumSerieMFD(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetNumVersao(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetDataMovimento(const ecfHandle: PECFHandle; var ticks: double): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetDataMovimentoStr(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetDataHoraSB(const ecfHandle: PECFHandle; var ticks: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetDataHoraSBStr(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetCNPJ(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetIE(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetIM(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetCliche(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetUsuarioAtual(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetSubModeloECF(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetPAF(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetNumCRZ(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetNumCRO(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetNumCCF(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetNumGNF(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetNumGRG(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetNumCDC(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetComandoEnviado(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetRespostaComando(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetNumCOOInicial(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetVendaBruta(const ecfHandle: PECFHandle;
  var VendaBruta: double): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetGrandeTotal(const ecfHandle: PECFHandle;
  var GrandeTotal: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetTotalCancelamentos(const ecfHandle: PECFHandle;
  var TotalCancelamentos: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetTotalDescontos(const ecfHandle: PECFHandle;
  var TotalDescontos: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetTotalAcrescimos(const ecfHandle: PECFHandle;
  var TotalAcrescimos: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetTotalTroco(const ecfHandle: PECFHandle;
  var TotalTroco: double): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetTotalSubstituicaoTributaria(const ecfHandle: PECFHandle;
  var TotalSubstituicaoTributaria: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetTotalNaoTributado(const ecfHandle: PECFHandle;
  var TotalNaoTributado: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetTotalIsencao(const ecfHandle: PECFHandle;
  var TotalIsencao: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetTotalCancelamentosISSQN(const ecfHandle: PECFHandle;
  var TotalCancelamentosISSQN: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetTotalDescontosISSQN(const ecfHandle: PECFHandle;
  var TotalDescontosISSQN: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetTotalAcrescimosISSQN(const ecfHandle: PECFHandle;
  var TotalAcrescimosISSQN: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetTotalSubstituicaoTributariaISSQN(const ecfHandle: PECFHandle;
  var TotalSubstituicaoTributariaISSQN: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetTotalNaoTributadoISSQN(const ecfHandle: PECFHandle;
  var TotalNaoTributadoISSQN: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetTotalIsencaoISSQN(const ecfHandle: PECFHandle;
  var TotalIsencaoISSQN: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetTotalNaoFiscal(const ecfHandle: PECFHandle;
  var TotalNaoFiscal: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetNumUltItem(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Propriedades - Componentes ACBr }

function ECF_SetAAC(const ecfHandle: PECFHandle; const aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetEAD(const ecfHandle: PECFHandle; const eadHandle: PEADHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetRFD(const ecfHandle: PECFHandle; const rfdHandle: PRFDHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region ECF - Flags }

function ECF_GetEmLinha(const ecfHandle: PECFHandle; const TimeOut: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetPoucoPapel(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetEstado(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetHorarioVerao(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetArredonda(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetTermica(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetMFD(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetMFAdicional(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetIdentificaConsumidorRodape(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetParamDescontoISSQN(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetSubTotal(const ecfHandle: PECFHandle; var SubTotal: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetTotalPago(const ecfHandle: PECFHandle; var TotalPago: double): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetGavetaAberta(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetChequePronto(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Métodos do componente}

function ECF_Ativar(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_Desativar(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_PreparaTEF(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_TestaPodeAbrirCupom(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_Sangria(const ecfHandle: PECFHandle; const Valor: double;
  const Obs, DescricaoCNF, DescricaoFPG: PChar; IndiceBMP: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_Suprimento(const ecfHandle: PECFHandle; const Valor: double;
  const Obs, DescricaoCNF, DescricaoFPG: PChar; IndiceBMP: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_AbreGaveta(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_MudaHorarioVerao(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_MudaArredondamento(const ecfHandle: PECFHandle;
  const Arredondar: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_CorrigeEstadoErro(const ecfHandle: PECFHandle;
  const ReducaoZ: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_AcharECF(const ecfHandle: PECFHandle; const ProcuraModelo: boolean;
  const ProcuraPorta: boolean; const TimeOut: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_AcharPorta(const ecfHandle: PECFHandle; const TimeOut: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_PulaLinhas(const ecfHandle: PECFHandle; const NumLinhas: integer): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_CortaPapel(const ecfHandle: PECFHandle;
  const CorteParcial: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_IdentificaOperador(const ecfHandle: PECFHandle;
  const Nome: PChar): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Metodos Bobina }

function ECF_SetMemoParams(const ecfHandle: PECFHandle; var linhas: array of PChar;
  const LinhasCount: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetMemoParams(const ecfHandle: PECFHandle; linha: PChar;
  const BufferLen, index: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetMemoParamsCount(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_MemoLeParams(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Métodos do cupom fiscal}

function ECF_IdentificaConsumidor(const ecfHandle: PECFHandle;
  const CPF_CNPJ, Nome, Endereco: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_AbreCupom(const ecfHandle: PECFHandle;
  const CPF_CNPJ, Nome, Endereco: PChar; const ModoPreVenda: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_LegendaInmetroProximoItem(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_VendeItem(const ecfHandle: PECFHandle;
  const Codigo, Descricao, AliquotaICMS: PChar;
  const Qtd, ValorUnitario, DescontoPorc: double;
  const Unidade, TipoDescontoAcrescimo, DescontoAcrescimo: PChar;
  const CodDepartamento: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_VendeItemEx(const ecfHandle: PECFHandle;
  const Codigo, Descricao, AliquotaICMS: PChar;
  const Qtd, ValorUnitario, DescontoPorc: double;
  const Unidade, TipoDescontoAcrescimo, DescontoAcrescimo: PChar;
  const CodDepartamento: integer; EAN13: PChar;
  CasasDecimaisQtde, CasasDecimaisValor: integer; ArredondaTrunca: char;
  NCM, CFOP, InformacaoAdicional: PChar; TotalDosTributos: double;
  OrigemProduto: integer; CST_ICMS: PChar; ModalidadeBCICMS: integer;
  PercentualReducaoBCICMS: double; CSOSN: PChar;
  ValorBaseCalculoSN, ValorICMSRetidoSN, AliquotaCalculoCreditoSN,
  ValorCreditoICMSSN: double; ItemListaServico, CodigoISS, NaturezaOperacaoISS: PChar;
  IndicadorIncentivoFiscalISS: integer; CodigoIBGE: PChar;
  ModalidadeBCICMSST: integer;
  PercentualMargemICMSST, PercentualReducaoBCICMSST, ValorReducaoBCICMSST,
  AliquotaICMSST, ValorICMSST, ValorICMSDesonerado: double;
  MotivoDesoneracaoICMS: integer; CST_PIS: PChar;
  BaseCalculoPIS, AliquotaPIS, ValorPIS, QuantidadeVendidaPIS, ValorAliquotaPIS: double;
  CST_COFINS: PChar; BaseCalculoCOFINS, AliquotaCOFINS, ValorCOFINS,
  QuantidadeVendidaCOFINS, ValorAliquotaCOFINS: double; CEST: PChar): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DescontoAcrescimoItemAnterior(const ecfHandle: PECFHandle;
  const ValorDescontoAcrescimo: double;
  const DescontoAcrescimo, TipoDescontoAcrescimo: PChar; const Item: integer): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SubtotalizaCupom(const ecfHandle: PECFHandle;
  const DescontoAcrescimo: double; const MensagemRodape: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_EfetuaPagamento(const ecfHandle: PECFHandle;
  const CodFormaPagto: PChar; const Valor: double; const Observacao: PChar;
  const ImprimeVinculado: boolean; const CodMeioPagamento: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_EstornaPagamento(const ecfHandle: PECFHandle;
  const CodFormaPagtoEstornar: PChar; const CodFormaPagtoEfetivar: PChar;
  const Valor: double; const Observacao: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_FechaCupom(const ecfHandle: PECFHandle; const Observacao: PChar): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_CancelaCupom(const ecfHandle: PECFHandle;
  const NumCOOCancelar: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_EstornaCCD(const ecfHandle: PECFHandle; const Todos: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_CancelaItemVendido(const ecfHandle: PECFHandle;
  const NumItem: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_CancelaItemVendidoParcial(const ecfHandle: PECFHandle;
  const NumItem: integer; const Quantidade: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_CancelaDescontoAcrescimoItem(const ecfHandle: PECFHandle;
  const NumItem: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_CancelaDescontoAcrescimoSubTotal(const ecfHandle: PECFHandle;
  const TipoAcrescimoDesconto: char): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Cupom Vinculado }

function ECF_AbreCupomVinculado(const ecfHandle: PECFHandle;
  const COO, CodFormaPagto: PChar; const Valor: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_AbreCupomVinculadoCNF(const ecfHandle: PECFHandle;
  const COO, CodFormaPagto, CodComprovanteNaoFiscal: PChar;
  const Valor: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_LinhaCupomVinculado(const ecfHandle: PECFHandle;
  const Linha: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_ReimpressaoVinculado(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SegundaViaVinculado(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Alíquotas}

function ECF_GetAliquota(const ecfHandle: PECFHandle; var retAliquota: TAliquotaRec;
  const index: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetALCount(const ecfHandle: PECFHandle; var Value: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_CarregaAliquotas(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetAliquotasStr(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_LerTotaisAliquota(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_LerTotaisAliquotaStr(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_ProgramaAliquota(const ecfHandle: PECFHandle; const Aliquota: double;
  const Tipo: char): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_AchaIcmsAliquota(const ecfHandle: PECFHandle; const Aliq: double;
  const Tipo: char; var ret_pos: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Forma de pagamento}

function ECF_GetFormaPagamento(const ecfHandle: PECFHandle;
  var retFormaPagamento: TFormaPagamentoRec; const index: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetFPGCount(const ecfHandle: PECFHandle; var Value: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_CarregaFormasPagamento(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_LerTotaisFormaPagamento(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetFormasPagamentoStr(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_LerTotaisFormaPagamentoStr(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_ProgramaFormaPagamento(const ecfHandle: PECFHandle;
  const Descricao: PChar; const PermiteVinculado: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_AchaFPGDescricao(const ecfHandle: PECFHandle; const descricao: PChar;
  const BuscaExata, IgnorarCase: boolean;
  var retFormaPagamento: TFormaPagamentoRec): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_AchaFPGIndice(const ecfHandle: PECFHandle; const indice: PChar;
  var retFormaPagamento: TFormaPagamentoRec): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Comprovantes Não Fiscais}

function ECF_AbreNaoFiscal(const ecfHandle: PECFHandle;
  const CPF_CNPJ, Nome, Endereco: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_RegistraItemNaoFiscal(const ecfHandle: PECFHandle;
  const CodCNF: PChar; const Valor: double; const Obs: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SubtotalizaNaoFiscal(const ecfHandle: PECFHandle;
  const DescontoAcrescimo: double; const MensagemRodape: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_EfetuaPagamentoNaoFiscal(const ecfHandle: PECFHandle;
  const CodFormaPagto: PChar; const Valor: double; const Observacao: PChar;
  const ImprimeVinculado: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_FechaNaoFiscal(const ecfHandle: PECFHandle; const Observacao: PChar;
  const IndiceBMP: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_CancelaNaoFiscal(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetComprovanteNaoFiscal(const ecfHandle: PECFHandle;
  var retComprovanteNaoFiscal: TComprovanteNaoFiscalRec; const index: integer): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetCNFCount(const ecfHandle: PECFHandle; var Value: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_CarregaComprovantesNaoFiscais(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_LerTotaisComprovanteNaoFiscal(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_ComprovantesNaoFiscais(const ecfHandle: PECFHandle;
  var v_ComprovantesNaoFiscais: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_LerTotaisComprovante(const ecfHandle: PECFHandle;
  var v_LerTotaisComprovante: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_ProgramaComprovanteNaoFiscal(const ecfHandle: PECFHandle;
  const Descricao, Tipo: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_AchaCNFDescricao(const ecfHandle: PECFHandle;
  var retComprovanteNaoFiscal: TComprovanteNaoFiscalRec; const descricao: PChar;
  const busca, ignore: boolean): integer; cdecl; export;

{%endregion}

{%region Leitura Memoria Fiscal }

function ECF_LeituraMemoriaFiscalReducao(const ecfHandle: PECFHandle;
  const ReducaoInicial: integer; const ReducaoFinal: integer;
  const Simplificada: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_LeituraMemoriaFiscalData(const ecfHandle: PECFHandle;
  const DataInicial: double; const DataFinal: double;
  const Simplificada: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_LeituraMemoriaFiscalSerialReducao(const ecfHandle: PECFHandle;
  const ReducaoInicial: integer; const ReducaoFinal: integer;
  const Simplificada: boolean; Buffer: PChar; const BufferLen: integer): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_LeituraMemoriaFiscalSerialData(const ecfHandle: PECFHandle;
  const DataInicial: double; const DataFinal: double; const Simplificada: boolean;
  Buffer: PChar; const BufferLen: integer): integer;{$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_LeituraMemoriaFiscalArquivoReducao(const ecfHandle: PECFHandle;
  const ReducaoInicial: integer; const ReducaoFinal: integer;
  const NomeArquivo: PChar; const Simplificada: boolean): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_LeituraMemoriaFiscalArquivoData(const ecfHandle: PECFHandle;
  const DataInicial: double; const DataFinal: double; const NomeArquivo: PChar;
  const Simplificada: boolean): integer;{$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Leitura X}

function ECF_LeituraX(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_PafMF_LX_Impressao(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Redução Z }

function ECF_ReducaoZ(const ecfHandle: PECFHandle; const date: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetDadosReducaoZ(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetDadosUltimaReducaoZ(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Redução Z Class}

function ECF_DadosReducaoZClass_GetCOO(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetCFD(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetCancelamentoISSQN(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetGNFC(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetCRO(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetValorVendaBruta(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetAcrescimoICMS(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetDataHoraEmissao(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetDescontoICMS(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetNaoTributadoICMS(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetCRZ(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetGRG(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetValorGrandeTotal(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetAcrescimoISSQN(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetNaoTributadoISSQN(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetIsentoICMS(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetSubstituicaoTributariaICMS(
  const ecfHandle: PECFHandle; var Value: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetDataDaImpressora(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetTotalOperacaoNaoFiscal(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetDescontoISSQN(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetCancelamentoOPNF(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetAcrescimoOPNF(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetDescontoOPNF(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetCancelamentoICMS(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetGNF(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetIsentoISSQN(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetSubstituicaoTributariaISSQN(
  const ecfHandle: PECFHandle; var Value: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetVendaLiquida(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetCFC(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetCCF(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetTotalISSQN(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetTotalICMS(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetCDC(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetCCDC(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetNCN(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetDataDoMovimento(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetNumeroCOOInicial(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetNumeroDoECF(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetNumeroDeSerie(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetNumeroDeSerieMFD(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetNumeroDaLoja(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetTotalTroco(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetCNFCount(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetCNF(const ecfHandle: PECFHandle;
  var retComprovanteNaoFiscal: TComprovanteNaoFiscalRec; const index: integer): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetICMSCount(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetICMS(const ecfHandle: PECFHandle;
  var retAliquota: TAliquotaRec; const index: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetRGCount(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetRG(const ecfHandle: PECFHandle;
  var retRelatorios: TRelatorioGerencialRec; const index: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetISSQNCount(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetISSQN(const ecfHandle: PECFHandle;
  var retAliquota: TAliquotaRec; const index: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetFPGCount(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_GetFPG(const ecfHandle: PECFHandle;
  var retFormaPagamento: TFormaPagamentoRec; const index: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_CalculaValoresVirtuais(
  const ecfHandle: PECFHandle): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DadosReducaoZClass_MontaDadosReducaoZ(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region PAF }

function ECF_IdentificaPAF(const ecfHandle: PECFHandle; const NomeVersao: PChar;
  const MD5: PChar): integer;{$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_PafMF_GerarCAT52(const ecfHandle: PECFHandle;
  const DataInicial, DataFinal: double; const CaminhoArquivo: PChar): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DoAtualizarValorGT(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DoVerificaValorGT(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetRodapePaf(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region PAF LMFC }

function ECF_PafMF_LMFC_Cotepe1704(const ecfHandle: PECFHandle;
  const DataInicial, DataFinal: double; const CaminhoArquivo: PChar): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_PafMF_LMFC_Cotepe1704_CRZ(const ecfHandle: PECFHandle;
  const CRZInicial, CRZFinal: integer; const PathArquivo: PChar): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_PafMF_LMFC_Espelho(const ecfHandle: PECFHandle;
  const DataInicial, DataFinal: double; const CaminhoArquivo: PChar): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_PafMF_LMFC_Espelho_CRZ(const ecfHandle: PECFHandle;
  const CRZInicial, CRZFinal: integer; const PathArquivo: PChar): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_PafMF_LMFC_Impressao(const ecfHandle: PECFHandle;
  const DataInicial, DataFinal: double): integer;{$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_PafMF_LMFC_Impressao_CRZ(const ecfHandle: PECFHandle;
  const CRZInicial, CRZFinal: integer): integer;{$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region PAF LMFS }

function ECF_PafMF_LMFS_Espelho(const ecfHandle: PECFHandle;
  const DataInicial, DataFinal: double; const CaminhoArquivo: PChar): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_PafMF_LMFS_Espelho_CRZ(const ecfHandle: PECFHandle;
  const CRZInicial, CRZFinal: integer; const PathArquivo: PChar): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_PafMF_LMFS_Impressao(const ecfHandle: PECFHandle;
  const DataInicial, DataFinal: double): integer;{$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_PafMF_LMFS_Impressao_CRZ(const ecfHandle: PECFHandle;
  const CRZInicial, CRZFinal: integer): integer;{$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region PAF Espelho MFD }

function ECF_PafMF_MFD_Cotepe1704(const ecfHandle: PECFHandle;
  const DataInicial, DataFinal: double; const CaminhoArquivo: PChar): integer;
      {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_PafMF_MFD_Cotepe1704_COO(const ecfHandle: PECFHandle;
  const COOInicial, COOFinal: integer; const PathArquivo: PChar): integer;
      {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region PAF Arquivos }

function ECF_ArquivoMFD_DLL(const ecfHandle: PECFHandle;
  const DataInicial, DataFinal: double; const Arquivo: PChar;
  var documentos: array of integer; const QTD_DOC, Finalidade: integer): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_ArquivoMFD_DLL_COO(const ecfHandle: PECFHandle;
  const COOInicial, COOFinal: integer; const Arquivo: PChar;
  var documentos: array of integer;
  const QTD_DOC, Finalidade, TipoContador: integer): integer;{$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_ArquivoMF_Binario_DLL(const ecfHandle: PECFHandle;
  const Arquivo: PChar): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_ArquivoMFD_Binario_DLL(const ecfHandle: PECFHandle;
  const Arquivo: PChar): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_ArquivoMFD_Binario_DLL_Data(const ecfHandle: PECFHandle;
  const Arquivo: PChar; const DataInicial, DataFinal: double): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_ArquivoMFD_Binario_DLL_COO(const ecfHandle: PECFHandle;
  const Arquivo: PChar; const COOInicial, COOFinal: integer): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_EspelhoMFD_DLL(const ecfHandle: PECFHandle;
  const DataInicial, DataFinal: double; const Arquivo: PChar;
  var documentos: array of integer; const QTD_DOC: integer): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_EspelhoMFD_DLL_COO(const ecfHandle: PECFHandle;
  const COOInicial, COOFinal: integer; const Arquivo: PChar;
  var Documentos: array of integer; const QTD_DOC: integer): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_PafMF_ArqMF_Binario(const ecfHandle: PECFHandle;
  const path: PChar; const Assinar: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

 function ECF_PafMF_ArqMFD_Binario(const ecfHandle: PECFHandle;
   const path: PChar; const DataInicial, DataFinal: double; Assinar : boolean): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region PAF Arq. MFD }

function ECF_PafMF_MFD_Espelho(const ecfHandle: PECFHandle;
  const DataInicial, DataFinal: double; const CaminhoArquivo: PChar): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_PafMF_MFD_Espelho_COO(const ecfHandle: PECFHandle;
  const COOInicial, COOFinal: integer; const PathArquivo: PChar): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Metodos DAV }

function ECF_DAV_Abrir(const ecfHandle: PECFHandle; const AEmissao: double;
  const ADescrDocumento, ANumero, ASituacao, AVendedor, AObservacao,
  ACNPJCPF, ANomeCliente, AEndereco, ANumFabricacao, AMarca, AModelo,
  AAno, APlaca, ARenavam: PChar; AIndice: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DAV_RegistrarItem(const ecfHandle: PECFHandle;
  const ACodigo, ADescricao, AUnid: PChar;
  const AQuantidade, AVlrUnitario, AVlrDesconto, AVlrAcrescimo: double;
  const ACancelado: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_DAV_Fechar(const ecfHandle: PECFHandle; const Observacao: PChar;
  const AVlrDesconto, AVlrAcrescimo: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_PafMF_RelDAVEmitidos(const ecfHandle: PECFHandle;
  var DAVsEmitidos: array of TDAVsRec; const Index: integer;
  const TituloRelatorio: PChar; const IndiceRelatorio: integer): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Paf Rels }

function ECF_PafMF_RelMeiosPagamento(const ecfHandle: PECFHandle;
  var formasPagamento: array of TFormaPagamentoRec; const Index: integer;
  const TituloRelatorio: PChar; const IndiceRelatorio: integer): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_PafMF_RelIdentificacaoPafECF(const ecfHandle: PECFHandle;
  const aacHandle: PAACHandle; const indiceRelatorio: integer): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_PafMF_RelParametrosConfiguracao(const ecfHandle: PECFHandle;
  const aacHandle: PAACHandle; const indiceRelatorio: integer): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_PafMF_RelParametrosConfiguracao2(const ecfHandle: PECFHandle;
  const Perfil: PChar; const indiceRelatorio: integer): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Relatorio Gerencial }

function ECF_AbreRelatorioGerencial(const ecfHandle: PECFHandle;
  const Indice: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_FechaRelatorio(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_LinhaRelatorioGerencial(const ecfHandle: PECFHandle;
  const Linha: PChar; const IndiceBMP: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_ProgramaRelatoriosGerenciais(const ecfHandle: PECFHandle;
  const Descricao, Posicao: PChar): integer;{$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_CarregaRelatoriosGerenciais(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_LerTotaisRelatoriosGerenciais(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_GetRelatoriosGerenciais(const ecfHandle: PECFHandle;
  var retRelatorios: TRelatorioGerencialRec; const index: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_RelatorioGerencial(const ecfHandle: PECFHandle;
  var linhas: array of PChar; const LinhasCount: integer; const Vias: integer;
  const Indice: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Cheques}

function ECF_ImprimeCheque(const ecfHandle: PECFHandle; const Banco: PChar;
  const Valor: double; const Favorecido, Cidade: PChar; const Data: double;
  const Observacao: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_CancelaImpressaoCheque(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_LeituraCMC7(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Comando}

function ECF_EnviaComando(const ecfHandle: PECFHandle; cmd: PChar;
  const timeout: integer; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Set Eventos }

function ECF_SetOnMsgPoucoPapel(const ecfHandle: PECFHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnAguardandoRespostaChange(const ecfHandle: PECFHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnAntesAbreCupom(const ecfHandle: PECFHandle;
  const method: TAbreCupomCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnAntesAbreCupomVinculado(const ecfHandle: PECFHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnAntesAbreNaoFiscal(const ecfHandle: PECFHandle;
  const method: TAbreCupomCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnAntesAbreRelatorioGerencial(const ecfHandle: PECFHandle;
  const method: TIntegerCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnAntesCancelaCupom(const ecfHandle: PECFHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnAntesCancelaItemNaoFiscal(const ecfHandle: PECFHandle;
  const method: TIntegerCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnAntesCancelaItemVendido(const ecfHandle: PECFHandle;
  const method: TIntegerCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnAntesCancelaNaoFiscal(const ecfHandle: PECFHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnAntesEfetuaPagamento(const ecfHandle: PECFHandle;
  const method: TEfetuaPagamentoCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnAntesEfetuaPagamentoNaoFiscal(const ecfHandle: PECFHandle;
  const method: TEfetuaPagamentoCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnAntesFechaCupom(const ecfHandle: PECFHandle;
  const method: TFechaCupomCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnAntesFechaNaoFiscal(const ecfHandle: PECFHandle;
  const method: TFechaCupomCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnAntesFechaRelatorio(const ecfHandle: PECFHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnAntesLeituraX(const ecfHandle: PECFHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnAntesReducaoZ(const ecfHandle: PECFHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnAntesSangria(const ecfHandle: PECFHandle;
  const method: TSangriaSuprimentoCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnAntesSubtotalizaCupom(const ecfHandle: PECFHandle;
  const method: TSubtotalizaCupomCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnAntesSubtotalizaNaoFiscal(const ecfHandle: PECFHandle;
  const method: TSubtotalizaCupomCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnAntesSuprimento(const ecfHandle: PECFHandle;
  const method: TSangriaSuprimentoCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnAntesVendeItem(const ecfHandle: PECFHandle;
  const method: TVendeItemCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnBobinaAdicionaLinhas(const ecfHandle: PECFHandle;
  const method: TBobinaProcedureCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnChangeEstado(const ecfHandle: PECFHandle;
  const method: TChangeEstadoCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnChequeEstado(const ecfHandle: PECFHandle;
  const method: TChequeEstadoCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnDepoisAbreCupom(const ecfHandle: PECFHandle;
  const method: TAbreCupomCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnDepoisAbreCupomVinculado(const ecfHandle: PECFHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnDepoisAbreNaoFiscal(const ecfHandle: PECFHandle;
  const method: TAbreCupomCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnDepoisAbreRelatorioGerencial(const ecfHandle: PECFHandle;
  const method: TIntegerCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnDepoisCancelaCupom(const ecfHandle: PECFHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnDepoisCancelaItemNaoFiscal(const ecfHandle: PECFHandle;
  const method: TIntegerCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnDepoisCancelaItemVendido(const ecfHandle: PECFHandle;
  const method: TIntegerCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnDepoisCancelaNaoFiscal(const ecfHandle: PECFHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnDepoisEfetuaPagamento(const ecfHandle: PECFHandle;
  const method: TEfetuaPagamentoCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnDepoisEfetuaPagamentoNaoFiscal(const ecfHandle: PECFHandle;
  const method: TEfetuaPagamentoCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnDepoisFechaCupom(const ecfHandle: PECFHandle;
  const method: TFechaCupomCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnDepoisFechaNaoFiscal(const ecfHandle: PECFHandle;
  const method: TFechaCupomCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnDepoisFechaRelatorio(const ecfHandle: PECFHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnDepoisLeituraX(const ecfHandle: PECFHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnDepoisReducaoZ(const ecfHandle: PECFHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnDepoisSangria(const ecfHandle: PECFHandle;
  const method: TSangriaSuprimentoCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnDepoisSubtotalizaCupom(const ecfHandle: PECFHandle;
  const method: TSubtotalizaCupomCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnDepoisSubtotalizaNaoFiscal(const ecfHandle: PECFHandle;
  const method: TSubtotalizaCupomCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnDepoisSuprimento(const ecfHandle: PECFHandle;
  const method: TSangriaSuprimentoCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnDepoisVendeItem(const ecfHandle: PECFHandle;
  const method: TVendeItemCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnErrorAbreCupom(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnErrorAbreCupomVinculado(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnErrorAbreNaoFiscal(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnErrorAbreRelatorioGerencial(const ecfHandle: PECFHandle;
  const method: TErrorRelatorioCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnErrorCancelaCupom(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnErrorCancelaItemNaoFiscal(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnErrorCancelaItemVendido(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnErrorCancelaNaoFiscal(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnErrorEfetuaPagamento(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnErrorEfetuaPagamentoNaoFiscal(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnErrorFechaCupom(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnErrorFechaNaoFiscal(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnErrorFechaRelatorio(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnErrorLeituraX(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnErrorReducaoZ(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnErrorSangria(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnErrorSemPapel(const ecfHandle: PECFHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnErrorSubtotalizaCupom(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnErrorSubtotalizaNaoFiscal(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnErrorSuprimento(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnErrorVendeItem(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnMsgAguarde(const ecfHandle: PECFHandle;
  const method: TStringCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnMsgRetentar(const ecfHandle: PECFHandle;
  const method: TMsgRetentarCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnPAFCalcEAD(const ecfHandle: PECFHandle;
  const method: TStringCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ECF_SetOnPAFGetKeyRSA(const ecfHandle: PECFHandle;
  const method: TRetStringCallback): integer; {$IFDEF STDCALL} stdcall;
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
function ECF_Create(var ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try

    New(ecfHandle);

    ecfHandle^.ECF := TACBrECF.Create(nil);
    ecfHandle^.EventHandlers := TEventHandlersECF.Create();
    ecfHandle^.ECF.ExibeMensagem := False;
    ecfHandle^.ECF.BloqueiaMouseTeclado := False;
    ecfHandle^.UltimoErro := '';
    Result := 0;

  except
    on Exception: Exception do
    begin
      Result := -1;
      ecfHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

{
DESTRÓI o objeto TACBrECF e libera a memória utilizada.
Esta função deve SEMPRE ser chamada pela aplicação que utiliza a DLL
quando o componente não mais for utilizado.
}
function ECF_Destroy(ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    ecfHandle^.ECF.Destroy();
    ecfHandle^.ECF := nil;
    Dispose(ecfHandle);
    ecfHandle := nil;
    Result := 0;

  except
    on Exception: Exception do
    begin
      Result := -1;
      ecfHandle^.UltimoErro := Exception.Message;
    end
  end;
end;

function ECF_GetUltimoErro(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try
    StrPLCopy(Buffer, ecfHandle^.UltimoErro, BufferLen);
    Result := length(ecfHandle^.UltimoErro);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Funções mapeando as propriedades do componente }

function ECF_GetAbout(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := ecfHandle^.ECF.About;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_GetModelo(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(ecfHandle^.ECF.Modelo);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_SetModelo(const ecfHandle: PECFHandle; const Modelo: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.Modelo := TACBrECFModelo(Modelo);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_GetPorta(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := ecfHandle^.ECF.Porta;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_SetPorta(const ecfHandle: PECFHandle; const Porta: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.Porta := Porta;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_GetTimeOut(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.TimeOut;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_SetTimeOut(const ecfHandle: PECFHandle; const TimeOut: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.TimeOut := TimeOut;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_GetPaginaDeCodigo(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.PaginaDeCodigo;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_SetPaginaDeCodigo(const ecfHandle: PECFHandle;
  const PaginaDeCodigo: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.PaginaDeCodigo := PaginaDeCodigo;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_GetIntervaloAposComando(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.IntervaloAposComando;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetIntervaloAposComando(const ecfHandle: PECFHandle;
  const Intervalo: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.IntervaloAposComando := Intervalo;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetDescricaoGrande(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if ecfHandle^.ECF.DescricaoGrande then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetDescricaoGrande(const ecfHandle: PECFHandle;
  const DescricaoGrande: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.DescricaoGrande := DescricaoGrande;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetControlePorta(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if ecfHandle^.ECF.ControlePorta then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetControlePorta(const ecfHandle: PECFHandle;
  const ControlePorta: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.ControlePorta := ControlePorta;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetGavetaSinalInvertido(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if ecfHandle^.ECF.GavetaSinalInvertido then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetGavetaSinalInvertido(const ecfHandle: PECFHandle;
  const GavetaSinalInvertido: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.GavetaSinalInvertido := GavetaSinalInvertido;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetQuebraLinhaRodape(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if ecfHandle^.ECF.QuebraLinhaRodape then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetQuebraLinhaRodape(const ecfHandle: PECFHandle;
  const QuebraLinhaRodape: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.QuebraLinhaRodape := QuebraLinhaRodape;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetArredondaPorQtd(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if ecfHandle^.ECF.ArredondaPorQtd then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetArredondaPorQtd(const ecfHandle: PECFHandle;
  const ArredondaPorQtd: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.ArredondaPorQtd := ArredondaPorQtd;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetArredondaItemMFD(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if ecfHandle^.ECF.ArredondaItemMFD then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetArredondaItemMFD(const ecfHandle: PECFHandle;
  const ArredondaItemMFD: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.ArredondaItemMFD := ArredondaItemMFD;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetIgnorarTagsFormatacao(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if ecfHandle^.ECF.IgnorarTagsFormatacao then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetIgnorarTagsFormatacao(const ecfHandle: PECFHandle;
  const IgnorarTagsFormatacao: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.IgnorarTagsFormatacao := IgnorarTagsFormatacao;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetOperador(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  strTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := ecfHandle^.ECF.Operador;
    StrPLCopy(Buffer, strTmp, BufferLen);
    Result := length(strTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOperador(const ecfHandle: PECFHandle; const Operador: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;
  try
    ecfHandle^.ECF.Operador := Operador;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetLinhasEntreCupons(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.LinhasEntreCupons;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetLinhasEntreCupons(const ecfHandle: PECFHandle;
  const LinhasEntreCupons: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.LinhasEntreCupons := LinhasEntreCupons;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetDecimaisPreco(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.DecimaisPreco;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetDecimaisPreco(const ecfHandle: PECFHandle;
  const DecimaisPreco: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.DecimaisPreco := DecimaisPreco;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetDecimaisQtd(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.DecimaisQtd;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetDecimaisQtd(const ecfHandle: PECFHandle;
  const DecimaisQtd: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.DecimaisQtd := DecimaisQtd;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetArqLOG(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := ecfHandle^.ECF.ArqLOG;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetArqLOG(const ecfHandle: PECFHandle; const ArqLog: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.ArqLOG := ArqLog;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetMaxLinhasBuffer(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.MaxLinhasBuffer;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetMaxLinhasBuffer(const ecfHandle: PECFHandle;
  const MaxLinha: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.MaxLinhasBuffer := MaxLinha;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetPausaRelatorio(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.PausaRelatorio;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetPausaRelatorio(const ecfHandle: PECFHandle;
  const Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.PausaRelatorio := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetDataHoraUltimaReducaoZ(const ecfHandle: PECFHandle;
  var Data: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Data := ecfHandle^.ECF.DataHoraUltimaReducaoZ;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetReTentar(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if ecfHandle^.ECF.ReTentar then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetReTentar(const ecfHandle: PECFHandle; const ReTentar: boolean): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.ReTentar := ReTentar;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region InfoRodapeCupom}

function ECF_InfoRodapeCupom_GetMD5(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := ecfHandle^.ECF.InfoRodapeCupom.MD5;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_SetMD5(const ecfHandle: PECFHandle;
  const md5: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.InfoRodapeCupom.MD5 := md5;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_GetDav(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := ecfHandle^.ECF.InfoRodapeCupom.Dav;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_SetDav(const ecfHandle: PECFHandle;
  const Dav: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.InfoRodapeCupom.Dav := Dav;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_GetDavOs(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := ecfHandle^.ECF.InfoRodapeCupom.DavOs;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_SetDavOs(const ecfHandle: PECFHandle;
  const DavOs: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.InfoRodapeCupom.DavOs := DavOs;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_GetPreVenda(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := ecfHandle^.ECF.InfoRodapeCupom.PreVenda;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_SetPreVenda(const ecfHandle: PECFHandle;
  const PreVenda: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.InfoRodapeCupom.PreVenda := PreVenda;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_GetCupomMania(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if ecfHandle^.ECF.InfoRodapeCupom.CupomMania then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_SetCupomMania(const ecfHandle: PECFHandle;
  const CupomMania: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.InfoRodapeCupom.CupomMania := CupomMania;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_GetMinasLegal(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if ecfHandle^.ECF.InfoRodapeCupom.MinasLegal then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_SetMinasLegal(const ecfHandle: PECFHandle;
  const MinasLegal: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.InfoRodapeCupom.MinasLegal := MinasLegal;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_GetParaibaLegal(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if ecfHandle^.ECF.InfoRodapeCupom.ParaibaLegal then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_SetParaibaLegal(const ecfHandle: PECFHandle;
  const ParaibaLegal: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.InfoRodapeCupom.ParaibaLegal := ParaibaLegal;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_NotaLegalDF_GetImprimir(
  const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if ecfHandle^.ECF.InfoRodapeCupom.NotaLegalDF.Imprimir then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_NotaLegalDF_SetImprimir(const ecfHandle: PECFHandle;
  const Imprimir: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.InfoRodapeCupom.NotaLegalDF.Imprimir := Imprimir;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_NotaLegalDF_GetProgramaDeCredito(
  const ecfHandle: PECFHandle): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if ecfHandle^.ECF.InfoRodapeCupom.NotaLegalDF.ProgramaDeCredito then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_NotaLegalDF_SetProgramaDeCredito(
  const ecfHandle: PECFHandle; const ProgramaDeCredito: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.InfoRodapeCupom.NotaLegalDF.ProgramaDeCredito := ProgramaDeCredito;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_NotaLegalDF_GetValorICMS(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.InfoRodapeCupom.NotaLegalDF.ValorICMS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_NotaLegalDF_SetValorICMS(const ecfHandle: PECFHandle;
  const ValorICMS: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.InfoRodapeCupom.NotaLegalDF.ValorICMS := ValorICMS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_NotaLegalDF_GetValorISS(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.InfoRodapeCupom.NotaLegalDF.ValorISS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_NotaLegalDF_SetValorISS(const ecfHandle: PECFHandle;
  const ValorISS: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.InfoRodapeCupom.NotaLegalDF.ValorISS := ValorISS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_Restaurante_GetImprimir(
  const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (ecfHandle^.ECF.InfoRodapeCupom.Restaurante.Imprimir) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_Restaurante_SetImprimir(const ecfHandle: PECFHandle;
  const Imprimir: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.InfoRodapeCupom.Restaurante.Imprimir := Imprimir;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_Restaurante_GetECF(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.InfoRodapeCupom.Restaurante.ECF;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_Restaurante_SetECF(const ecfHandle: PECFHandle;
  const ECF: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.InfoRodapeCupom.Restaurante.ECF := ECF;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_Restaurante_GetCER(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.InfoRodapeCupom.Restaurante.CER;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_Restaurante_SetCER(const ecfHandle: PECFHandle;
  const CER: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.InfoRodapeCupom.Restaurante.CER := CER;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_Restaurante_GetCOO(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.InfoRodapeCupom.Restaurante.COO;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_Restaurante_SetCOO(const ecfHandle: PECFHandle;
  const COO: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.InfoRodapeCupom.Restaurante.COO := COO;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_Restaurante_GetMesa(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := ecfHandle^.ECF.InfoRodapeCupom.Restaurante.Mesa;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_Restaurante_SetMesa(const ecfHandle: PECFHandle;
  const mesa: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.InfoRodapeCupom.Restaurante.Mesa := mesa;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_Imposto_GetTexto(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := ecfHandle^.ECF.InfoRodapeCupom.Imposto.Texto;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_Imposto_SetTexto(const ecfHandle: PECFHandle;
  const texto: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.InfoRodapeCupom.Imposto.Texto := texto;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_Imposto_GetFonte(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := ecfHandle^.ECF.InfoRodapeCupom.Imposto.Fonte;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_Imposto_SetFonte(const ecfHandle: PECFHandle;
  const fonte: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.InfoRodapeCupom.Imposto.Fonte := fonte;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_Imposto_GetValorAproximado(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.InfoRodapeCupom.Imposto.ValorAproximado;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_Imposto_SetValorAproximado(const ecfHandle: PECFHandle;
  const valor: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.InfoRodapeCupom.Imposto.ValorAproximado := valor;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_Imposto_GetValorAproximadoFederal(
  const ecfHandle: PECFHandle; var Value: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.InfoRodapeCupom.Imposto.ValorAproximadoFederal;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_Imposto_SetValorAproximadoFederal(
  const ecfHandle: PECFHandle; const valor: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.InfoRodapeCupom.Imposto.ValorAproximadoFederal := valor;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_Imposto_GetValorAproximadoEstadual(
  const ecfHandle: PECFHandle; var Value: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.InfoRodapeCupom.Imposto.ValorAproximadoEstadual;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_InfoRodapeCupom_Imposto_SetValorAproximadoEstadual(
  const ecfHandle: PECFHandle; const valor: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.InfoRodapeCupom.Imposto.ValorAproximadoEstadual := valor;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_InfoRodapeCupom_Imposto_GetValorAproximadoMunicipal(
  const ecfHandle: PECFHandle; var Value: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.InfoRodapeCupom.Imposto.ValorAproximadoMunicipal;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_Imposto_SetValorAproximadoMunicipal(
  const ecfHandle: PECFHandle; const valor: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.InfoRodapeCupom.Imposto.ValorAproximadoMunicipal := valor;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_InfoRodapeCupom_Imposto_GetModoCompacto(
  const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (ecfHandle^.ECF.InfoRodapeCupom.Imposto.ModoCompacto) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_Imposto_SetModoCompacto(const ecfHandle: PECFHandle;
  const Imprimir: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.InfoRodapeCupom.Imposto.ModoCompacto := Imprimir;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%region PostoCombustivel}

function ECF_InfoRodapeCupom_PostoCombustivel_GetImprimir(
  const ecfHandle: PECFHandle): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (ecfHandle^.ECF.InfoRodapeCupom.PostoCombustivel.Imprimir) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_PostoCombustivel_SetImprimir(const ecfHandle: PECFHandle;
  const Imprimir: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.InfoRodapeCupom.PostoCombustivel.Imprimir := Imprimir;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_PostoCombustivel_New(const ecfHandle: PECFHandle;
  var abaHandle: TACBRRodapeAbastecimento): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    abaHandle := ecfHandle^.ECF.InfoRodapeCupom.PostoCombustivel.New;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_PostoCombustivel_Remove(const ecfHandle: PECFHandle;
  var abaHandle: TACBRRodapeAbastecimento): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) or (abaHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.InfoRodapeCupom.PostoCombustivel.Remove(abaHandle);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_PostoCombustivel_Clear(
  const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.InfoRodapeCupom.PostoCombustivel.Clear;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_PostoCombustivel_GetAutomatico(
  const ecfHandle: PECFHandle;
  const abaHandle: TACBRRodapeAbastecimento): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) or (abaHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (abaHandle.Automatico) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_PostoCombustivel_SetAutomatico(
  const ecfHandle: PECFHandle;
  const abaHandle: TACBRRodapeAbastecimento; const Value: boolean): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) or (abaHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    abaHandle.Automatico := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_PostoCombustivel_GetEF(const ecfHandle: PECFHandle;
  const abaHandle: TACBRRodapeAbastecimento; var Value: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) or (abaHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := abaHandle.EF;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_PostoCombustivel_SetEF(const ecfHandle: PECFHandle;
  const abaHandle: TACBRRodapeAbastecimento; const Value: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) or (abaHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    abaHandle.EF := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_PostoCombustivel_GetEI(const ecfHandle: PECFHandle;
  const abaHandle: TACBRRodapeAbastecimento; var Value: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) or (abaHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := abaHandle.EI;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_PostoCombustivel_SetEI(const ecfHandle: PECFHandle;
  const abaHandle: TACBRRodapeAbastecimento; const Value: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) or (abaHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    abaHandle.EI := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_PostoCombustivel_GetVolume(const ecfHandle: PECFHandle;
  const abaHandle: TACBRRodapeAbastecimento; var Value: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) or (abaHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := abaHandle.Volume;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_PostoCombustivel_SetVolume(const ecfHandle: PECFHandle;
  const abaHandle: TACBRRodapeAbastecimento; const Value: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) or (abaHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    abaHandle.Volume := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_PostoCombustivel_GetBico(const ecfHandle: PECFHandle;
  const abaHandle: TACBRRodapeAbastecimento): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) or (abaHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := abaHandle.Bico;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_InfoRodapeCupom_PostoCombustivel_SetBico(const ecfHandle: PECFHandle;
  const abaHandle: TACBRRodapeAbastecimento; const Value: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) or (abaHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    abaHandle.Bico := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%endregion}

{%region Consumidor}

function ECF_Consumidor_GetDocumento(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := ecfHandle^.ECF.Consumidor.Documento;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_Consumidor_GetEndereco(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := ecfHandle^.ECF.Consumidor.Endereco;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_Consumidor_GetNome(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := ecfHandle^.ECF.Consumidor.Nome;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_Consumidor_GetEnviado(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if ecfHandle^.ECF.Consumidor.Enviado then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_Consumidor_SetEnviado(const ecfHandle: PECFHandle;
  const Value: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.Consumidor.Enviado := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_Consumidor_GetAtribuido(const ecfHandle: PECFHandle;
  var Value: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if ecfHandle^.ECF.Consumidor.Atribuido then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_Consumidor_AtribuiConsumidor(const ecfHandle: PECFHandle;
  const CPF_CNPJ, Nome, Endereco: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.Consumidor.AtribuiConsumidor(CPF_CNPJ, Nome, Endereco);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_Consumidor_Zera(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.Consumidor.Zera;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region ConfigBarras}

function ECF_ConfigBarras_GetAltura(const ecfHandle: PECFHandle;
  var Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.ConfigBarras.Altura;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_ConfigBarras_SetAltura(const ecfHandle: PECFHandle;
  const Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.ConfigBarras.Altura := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_ConfigBarras_GetLarguraLinha(const ecfHandle: PECFHandle;
  var Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.ConfigBarras.LarguraLinha;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_ConfigBarras_SetLarguraLinha(const ecfHandle: PECFHandle;
  const Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.ConfigBarras.LarguraLinha := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_ConfigBarras_GetMargem(const ecfHandle: PECFHandle;
  var Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.ConfigBarras.Margem;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_ConfigBarras_SetMargem(const ecfHandle: PECFHandle;
  const Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.ConfigBarras.Margem := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_ConfigBarras_GetMostrarCodigo(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if ecfHandle^.ECF.ConfigBarras.MostrarCodigo then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_ConfigBarras_SetMostrarCodigo(const ecfHandle: PECFHandle;
  const Value: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.ConfigBarras.MostrarCodigo := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region Propriedades - Não Visiveis }

function ECF_GetAtivo(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (ecfHandle^.ECF.Ativo) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_GetColunas(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.Colunas;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetAguardandoResposta(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (ecfHandle^.ECF.AguardandoResposta) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetComandoLog(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := ecfHandle^.ECF.ComandoLOG;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_SetComandoLog(const ecfHandle: PECFHandle;
  const ComandoLog: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.ComandoLOG := ComandoLog;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_GetAguardaImpressao(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if ecfHandle^.ECF.AguardaImpressao then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetAguardaImpressao(const ecfHandle: PECFHandle;
  const AguardaImpressao: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.AguardaImpressao := AguardaImpressao;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetModeloStr(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := ecfHandle^.ECF.ModeloStr;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetRFDID(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := ecfHandle^.ECF.RFDID;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetDataHora(const ecfHandle: PECFHandle; var ticks: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ticks := double(ecfHandle^.ECF.DataHora);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetDataHoraStr(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  strTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := FormatDateTime('dd/mm/yyyy hh:nn:ss', ecfHandle^.ECF.DataHora);
    StrPLCopy(Buffer, strTmp, BufferLen);
    Result := length(strTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetNumCupom(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  strTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := ecfHandle^.ECF.NumCupom;
    StrPLCopy(Buffer, strTmp, BufferLen);
    Result := length(strTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetNumCOO(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  strTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := ecfHandle^.ECF.NumCOO;
    StrPLCopy(Buffer, strTmp, BufferLen);
    Result := length(strTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetNumLoja(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  strTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := ecfHandle^.ECF.NumLoja;
    StrPLCopy(Buffer, strTmp, BufferLen);
    Result := length(strTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetNumECF(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  strTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := ecfHandle^.ECF.NumECF;
    StrPLCopy(Buffer, strTmp, BufferLen);
    Result := length(strTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetNumSerie(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  strTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := ecfHandle^.ECF.NumSerie;
    StrPLCopy(Buffer, strTmp, BufferLen);
    Result := length(strTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetNumSerieMFD(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  strTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := ecfHandle^.ECF.NumSerieMFD;
    StrPLCopy(Buffer, strTmp, BufferLen);
    Result := length(strTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetNumVersao(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  strTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := ecfHandle^.ECF.NumVersao;
    StrPLCopy(Buffer, strTmp, BufferLen);
    Result := length(strTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end;
  end;
end;

function ECF_GetDataMovimento(const ecfHandle: PECFHandle; var ticks: double): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ticks := double(ecfHandle^.ECF.DataMovimento);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetDataMovimentoStr(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  strTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := PChar(FormatDateTime('dd/mm/yyyy', ecfHandle^.ECF.DataMovimento));
    StrPLCopy(Buffer, strTmp, BufferLen);
    Result := length(strTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetDataHoraSB(const ecfHandle: PECFHandle; var ticks: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ticks := double(ecfHandle^.ECF.DataHoraSB);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetDataHoraSBStr(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  strTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := PChar(FormatDateTime('dd/mm/yyyy hh:nn:ss', ecfHandle^.ECF.DataHoraSB));
    StrPLCopy(Buffer, strTmp, BufferLen);
    Result := length(strTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetCNPJ(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  strTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := ecfHandle^.ECF.CNPJ;
    StrPLCopy(Buffer, strTmp, BufferLen);
    Result := length(strTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetIE(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  strTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := ecfHandle^.ECF.IE;
    StrPLCopy(Buffer, strTmp, BufferLen);
    Result := length(strTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetIM(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  strTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := ecfHandle^.ECF.IM;
    StrPLCopy(Buffer, strTmp, BufferLen);
    Result := length(strTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetCliche(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := ecfHandle^.ECF.Cliche;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_GetUsuarioAtual(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := ecfHandle^.ECF.UsuarioAtual;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_GetSubModeloECF(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := ecfHandle^.ECF.SubModeloECF;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_GetPAF(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := ecfHandle^.ECF.PAF;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_GetNumCRZ(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  strTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := ecfHandle^.ECF.NumCRZ;
    StrPLCopy(Buffer, strTmp, BufferLen);
    Result := length(strTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetNumCRO(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  strTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := ecfHandle^.ECF.NumCRO;
    StrPLCopy(Buffer, strTmp, BufferLen);
    Result := length(strTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetNumCCF(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  strTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := ecfHandle^.ECF.NumCCF;
    StrPLCopy(Buffer, strTmp, BufferLen);
    Result := length(strTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetNumGNF(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  strTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := ecfHandle^.ECF.NumGNF;
    StrPLCopy(Buffer, strTmp, BufferLen);
    Result := length(strTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetNumGRG(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  strTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := ecfHandle^.ECF.NumGRG;
    StrPLCopy(Buffer, strTmp, BufferLen);
    Result := length(strTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetNumCDC(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  strTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := ecfHandle^.ECF.NumCDC;
    StrPLCopy(Buffer, strTmp, BufferLen);
    Result := length(strTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetComandoEnviado(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  cmd: string;
  strTmp: string;
  Ch: string;
  ASC: byte;
  I: integer;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := '';
    cmd := ecfHandle^.ECF.ComandoEnviado;
    for I := 1 to Length(cmd) do
    begin
      ASC := Ord(cmd[I]);

      case ASC of
        2: Ch := '[STX]';
        3: Ch := '[ETX]';
        6: Ch := '[ACK]';
        10: Ch := #10; //'[LF]' ;
        13: Ch := #13; //'[CR]' ;
        27: Ch := '[ESC]';
        255: Ch := '[FF]';
        32..127: Ch := cmd[I];
        else;
          Ch := '[' + IntToStr(ASC) + ']'
      end;
      strTmp := strTmp + Ch;
    end;

    StrPLCopy(Buffer, strTmp, BufferLen);
    Result := length(strTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetRespostaComando(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  cmd: string;
  strTmp: string;
  Ch: string;
  ASC: byte;
  I: integer;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := '';
    cmd := ecfHandle^.ECF.RespostaComando;
    for I := 1 to Length(cmd) do
    begin
      ASC := Ord(cmd[I]);

      case ASC of
        2: Ch := '[STX]';
        3: Ch := '[ETX]';
        6: Ch := '[ACK]';
        10: Ch := #10; //'[LF]' ;
        13: Ch := #13; //'[CR]' ;
        27: Ch := '[ESC]';
        255: Ch := '[FF]';
        32..127: Ch := cmd[I];
        else;
          Ch := '[' + IntToStr(ASC) + ']'
      end;
      strTmp := strTmp + Ch;
    end;

    StrPLCopy(Buffer, strTmp, BufferLen);
    Result := length(strTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetNumCOOInicial(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  strTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := ecfHandle^.ECF.NumCOOInicial;
    StrPLCopy(Buffer, strTmp, BufferLen);
    Result := length(strTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetVendaBruta(const ecfHandle: PECFHandle;
  var VendaBruta: double): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    VendaBruta := ecfHandle^.ECF.VendaBruta;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetGrandeTotal(const ecfHandle: PECFHandle;
  var GrandeTotal: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    GrandeTotal := ecfHandle^.ECF.GrandeTotal;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetTotalCancelamentos(const ecfHandle: PECFHandle;
  var TotalCancelamentos: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    TotalCancelamentos := ecfHandle^.ECF.TotalCancelamentos;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetTotalDescontos(const ecfHandle: PECFHandle;
  var TotalDescontos: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    TotalDescontos := ecfHandle^.ECF.TotalDescontos;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetTotalAcrescimos(const ecfHandle: PECFHandle;
  var TotalAcrescimos: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    TotalAcrescimos := ecfHandle^.ECF.TotalAcrescimos;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetTotalTroco(const ecfHandle: PECFHandle;
  var TotalTroco: double): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    TotalTroco := ecfHandle^.ECF.TotalTroco;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetTotalSubstituicaoTributaria(const ecfHandle: PECFHandle;
  var TotalSubstituicaoTributaria: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    TotalSubstituicaoTributaria := ecfHandle^.ECF.TotalSubstituicaoTributaria;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetTotalNaoTributado(const ecfHandle: PECFHandle;
  var TotalNaoTributado: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    TotalNaoTributado := ecfHandle^.ECF.TotalNaoTributado;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetTotalIsencao(const ecfHandle: PECFHandle;
  var TotalIsencao: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    TotalIsencao := ecfHandle^.ECF.TotalIsencao;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetTotalCancelamentosISSQN(const ecfHandle: PECFHandle;
  var TotalCancelamentosISSQN: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    TotalCancelamentosISSQN := ecfHandle^.ECF.TotalCancelamentosISSQN;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetTotalDescontosISSQN(const ecfHandle: PECFHandle;
  var TotalDescontosISSQN: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    TotalDescontosISSQN := ecfHandle^.ECF.TotalDescontosISSQN;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetTotalAcrescimosISSQN(const ecfHandle: PECFHandle;
  var TotalAcrescimosISSQN: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    TotalAcrescimosISSQN := ecfHandle^.ECF.TotalAcrescimosISSQN;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetTotalSubstituicaoTributariaISSQN(const ecfHandle: PECFHandle;
  var TotalSubstituicaoTributariaISSQN: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    TotalSubstituicaoTributariaISSQN := ecfHandle^.ECF.TotalSubstituicaoTributariaISSQN;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetTotalNaoTributadoISSQN(const ecfHandle: PECFHandle;
  var TotalNaoTributadoISSQN: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    TotalNaoTributadoISSQN := ecfHandle^.ECF.TotalNaoTributadoISSQN;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetTotalIsencaoISSQN(const ecfHandle: PECFHandle;
  var TotalIsencaoISSQN: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    TotalIsencaoISSQN := ecfHandle^.ECF.TotalIsencaoISSQN;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetTotalNaoFiscal(const ecfHandle: PECFHandle;
  var TotalNaoFiscal: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    TotalNaoFiscal := ecfHandle^.ECF.TotalNaoFiscal;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetNumUltItem(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.NumUltItem;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Propriedades - Componentes ACBr }

function ECF_SetAAC(const ecfHandle: PECFHandle; const aacHandle: PAACHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    if (aacHandle = nil) then
    begin
      ecfHandle^.ECF.AAC := nil;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.AAC := aacHandle^.AAC;
      Result := 0;
    end;

  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetEAD(const ecfHandle: PECFHandle; const eadHandle: PEADHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (eadHandle = nil) then
    begin
      ecfHandle^.ECF.EAD := nil;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.EAD := eadHandle^.EAD;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetRFD(const ecfHandle: PECFHandle; const rfdHandle: PRFDHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;
  try

    if (rfdHandle = nil) then
    begin
      ecfHandle^.ECF.RFD := nil;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.RFD := rfdHandle^.RFD;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;


{%endregion}

{%region ECF - Flags }

function ECF_GetEmLinha(const ecfHandle: PECFHandle; const TimeOut: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    if (ecfHandle^.ECF.EmLinha(TimeOut)) then
      Result := 1
    else
      Result := 0;

  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetPoucoPapel(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    if (ecfHandle^.ECF.PoucoPapel) then
      Result := 1
    else
      Result := 0;

  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetEstado(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(ecfHandle^.ECF.Estado);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetHorarioVerao(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if ecfHandle^.ECF.HorarioVerao then
      Result := 1
    else
      Result := 0;


  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetArredonda(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if ecfHandle^.ECF.Arredonda then
      Result := 1
    else
      Result := 0;

  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetTermica(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if ecfHandle^.ECF.Termica then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetMFD(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if ecfHandle^.ECF.MFD then
      Result := 1
    else
      Result := 0;

  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetMFAdicional(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := ecfHandle^.ECF.MFAdicional;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_GetIdentificaConsumidorRodape(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if ecfHandle^.ECF.IdentificaConsumidorRodape then
      Result := 1
    else
      Result := 0;

  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetParamDescontoISSQN(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if ecfHandle^.ECF.ParamDescontoISSQN then
      Result := 1
    else
      Result := 0;

  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;


function ECF_GetSubTotal(const ecfHandle: PECFHandle; var SubTotal: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;
  ;

  try
    SubTotal := ecfHandle^.ECF.Subtotal;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetTotalPago(const ecfHandle: PECFHandle; var TotalPago: double): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    TotalPago := ecfHandle^.ECF.TotalPago;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetGavetaAberta(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if ecfHandle^.ECF.GavetaAberta then
      Result := 1
    else
      Result := 0;

  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetChequePronto(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if ecfHandle^.ECF.ChequePronto then
      Result := 1
    else
      Result := 0;

  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Métodos do componente}

function ECF_Ativar(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.Ativar;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_Desativar(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.Desativar;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_PreparaTEF(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.PreparaTEF;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_TestaPodeAbrirCupom(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.TestaPodeAbrirCupom;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_Sangria(const ecfHandle: PECFHandle; const Valor: double;
  const Obs, DescricaoCNF, DescricaoFPG: PChar; IndiceBMP: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.Sangria(Valor, Obs, DescricaoCNF, DescricaoFPG, IndiceBMP);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_Suprimento(const ecfHandle: PECFHandle; const Valor: double;
  const Obs, DescricaoCNF, DescricaoFPG: PChar; IndiceBMP: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.Suprimento(Valor, Obs, DescricaoCNF, DescricaoFPG, IndiceBMP);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_AbreGaveta(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.AbreGaveta;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_MudaHorarioVerao(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.MudaHorarioVerao;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_MudaArredondamento(const ecfHandle: PECFHandle;
  const Arredondar: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.MudaArredondamento(Arredondar);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_CorrigeEstadoErro(const ecfHandle: PECFHandle;
  const ReducaoZ: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.CorrigeEstadoErro(ReducaoZ);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_AcharECF(const ecfHandle: PECFHandle; const ProcuraModelo: boolean;
  const ProcuraPorta: boolean; const TimeOut: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (ecfHandle^.ECF.AcharECF(ProcuraModelo, ProcuraPorta, TimeOut)) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_AcharPorta(const ecfHandle: PECFHandle; const TimeOut: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (ecfHandle^.ECF.AcharPorta(TimeOut)) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_PulaLinhas(const ecfHandle: PECFHandle; const NumLinhas: integer): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.PulaLinhas(NumLinhas);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_CortaPapel(const ecfHandle: PECFHandle;
  const CorteParcial: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.CortaPapel(CorteParcial);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_IdentificaOperador(const ecfHandle: PECFHandle;
  const Nome: PChar): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  strTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.IdentificaOperador(Nome);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Metodos Bobina }

function ECF_SetMemoParams(const ecfHandle: PECFHandle; var linhas: array of PChar;
  const LinhasCount: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  i: integer;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.MemoParams.Clear;
    for i := 0 to LinhasCount - 1 do
    begin
      ecfHandle^.ECF.MemoParams.Add(linhas[i]);
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetMemoParams(const ecfHandle: PECFHandle; linha: PChar;
  const BufferLen, index: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  strTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := ecfHandle^.ECF.MemoParams[index];
    StrPLCopy(linha, strTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetMemoParamsCount(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.MemoParams.Count;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_MemoLeParams(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.MemoLeParams;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Métodos do cupom fiscal}

function ECF_IdentificaConsumidor(const ecfHandle: PECFHandle;
  const CPF_CNPJ, Nome, Endereco: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.IdentificaConsumidor(CPF_CNPJ, Nome, Endereco);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_AbreCupom(const ecfHandle: PECFHandle;
  const CPF_CNPJ, Nome, Endereco: PChar; const ModoPreVenda: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.AbreCupom(CPF_CNPJ, Nome, Endereco, ModoPreVenda);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_LegendaInmetroProximoItem(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.LegendaInmetroProximoItem;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_VendeItem(const ecfHandle: PECFHandle;
  const Codigo, Descricao, AliquotaICMS: PChar;
  const Qtd, ValorUnitario, DescontoPorc: double;
  const Unidade, TipoDescontoAcrescimo, DescontoAcrescimo: PChar;
  const CodDepartamento: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.VendeItem(Codigo, Descricao, AliquotaICMS, Qtd, ValorUnitario,
      DescontoPorc, Unidade, TipoDescontoAcrescimo,
      DescontoAcrescimo, CodDepartamento);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_VendeItemEx(const ecfHandle: PECFHandle;
  const Codigo, Descricao, AliquotaICMS: PChar;
  const Qtd, ValorUnitario, DescontoPorc: double;
  const Unidade, TipoDescontoAcrescimo, DescontoAcrescimo: PChar;
  const CodDepartamento: integer; EAN13: PChar;
  CasasDecimaisQtde, CasasDecimaisValor: integer; ArredondaTrunca: char;
  NCM, CFOP, InformacaoAdicional: PChar; TotalDosTributos: double;
  OrigemProduto: integer; CST_ICMS: PChar; ModalidadeBCICMS: integer;
  PercentualReducaoBCICMS: double; CSOSN: PChar;
  ValorBaseCalculoSN, ValorICMSRetidoSN, AliquotaCalculoCreditoSN,
  ValorCreditoICMSSN: double; ItemListaServico, CodigoISS, NaturezaOperacaoISS: PChar;
  IndicadorIncentivoFiscalISS: integer; CodigoIBGE: PChar;
  ModalidadeBCICMSST: integer;
  PercentualMargemICMSST, PercentualReducaoBCICMSST, ValorReducaoBCICMSST,
  AliquotaICMSST, ValorICMSST, ValorICMSDesonerado: double;
  MotivoDesoneracaoICMS: integer; CST_PIS: PChar;
  BaseCalculoPIS, AliquotaPIS, ValorPIS, QuantidadeVendidaPIS, ValorAliquotaPIS: double;
  CST_COFINS: PChar; BaseCalculoCOFINS, AliquotaCOFINS, ValorCOFINS,
  QuantidadeVendidaCOFINS, ValorAliquotaCOFINS: double; CEST: PChar): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.VendeItemEx(Codigo, Descricao, AliquotaICMS, Qtd, ValorUnitario,
      DescontoPorc, Unidade, TipoDescontoAcrescimo,
      DescontoAcrescimo,
      CodDepartamento, EAN13, CasasDecimaisQtde,
      CasasDecimaisValor,
      ArredondaTrunca, NCM, CFOP, InformacaoAdicional,
      TotalDosTributos, OrigemProduto, CST_ICMS,
      ModalidadeBCICMS, PercentualReducaoBCICMS,
      CSOSN, ValorBaseCalculoSN, ValorICMSRetidoSN,
      AliquotaCalculoCreditoSN, ValorCreditoICMSSN,
      ItemListaServico, CodigoISS, NaturezaOperacaoISS,
      IndicadorIncentivoFiscalISS, CodigoIBGE,
      ModalidadeBCICMSST,
      PercentualMargemICMSST, PercentualReducaoBCICMSST,
      ValorReducaoBCICMSST, AliquotaICMSST,
      ValorICMSST, ValorICMSDesonerado, MotivoDesoneracaoICMS,
      CST_PIS, BaseCalculoPIS, AliquotaPIS, ValorPIS,
      QuantidadeVendidaPIS, ValorAliquotaPIS, CST_COFINS,
      BaseCalculoCOFINS, AliquotaCOFINS,
      ValorCOFINS, QuantidadeVendidaCOFINS, ValorAliquotaCOFINS,
      CEST);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_DescontoAcrescimoItemAnterior(const ecfHandle: PECFHandle;
  const ValorDescontoAcrescimo: double;
  const DescontoAcrescimo, TipoDescontoAcrescimo: PChar; const Item: integer): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.DescontoAcrescimoItemAnterior(ValorDescontoAcrescimo,
      DescontoAcrescimo, TipoDescontoAcrescimo, Item);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_SubtotalizaCupom(const ecfHandle: PECFHandle;
  const DescontoAcrescimo: double; const MensagemRodape: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.SubtotalizaCupom(DescontoAcrescimo, MensagemRodape);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_EfetuaPagamento(const ecfHandle: PECFHandle;
  const CodFormaPagto: PChar; const Valor: double; const Observacao: PChar;
  const ImprimeVinculado: boolean; const CodMeioPagamento: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.EfetuaPagamento(CodFormaPagto, Valor, Observacao,
      ImprimeVinculado, CodMeioPagamento);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_EstornaPagamento(const ecfHandle: PECFHandle;
  const CodFormaPagtoEstornar: PChar; const CodFormaPagtoEfetivar: PChar;
  const Valor: double; const Observacao: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.EstornaPagamento(CodFormaPagtoEstornar,
      CodFormaPagtoEfetivar, Valor, Observacao);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_FechaCupom(const ecfHandle: PECFHandle; const Observacao: PChar): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.FechaCupom(Observacao);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_CancelaCupom(const ecfHandle: PECFHandle;
  const NumCOOCancelar: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.CancelaCupom(NumCOOCancelar);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_EstornaCCD(const ecfHandle: PECFHandle; const Todos: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.EstornaCCD(Todos);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_CancelaItemVendido(const ecfHandle: PECFHandle;
  const NumItem: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.CancelaItemVendido(NumItem);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_CancelaItemVendidoParcial(const ecfHandle: PECFHandle;
  const NumItem: integer; const Quantidade: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.CancelaItemVendidoParcial(NumItem, Quantidade);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_CancelaDescontoAcrescimoItem(const ecfHandle: PECFHandle;
  const NumItem: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.CancelaDescontoAcrescimoItem(NumItem);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_CancelaDescontoAcrescimoSubTotal(const ecfHandle: PECFHandle;
  const TipoAcrescimoDesconto: char): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.CancelaDescontoAcrescimoSubTotal(TipoAcrescimoDesconto);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Cupom Vinculado }

function ECF_AbreCupomVinculado(const ecfHandle: PECFHandle;
  const COO, CodFormaPagto: PChar; const Valor: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.AbreCupomVinculado(COO, CodFormaPagto, Valor);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_AbreCupomVinculadoCNF(const ecfHandle: PECFHandle;
  const COO, CodFormaPagto, CodComprovanteNaoFiscal: PChar;
  const Valor: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.AbreCupomVinculado(COO, CodFormaPagto,
      CodComprovanteNaoFiscal, Valor);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_LinhaCupomVinculado(const ecfHandle: PECFHandle;
  const Linha: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.LinhaCupomVinculado(Linha);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_ReimpressaoVinculado(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.ReimpressaoVinculado;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SegundaViaVinculado(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.SegundaViaVinculado;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Alíquotas}

function ECF_GetAliquota(const ecfHandle: PECFHandle; var retAliquota: TAliquotaRec;
  const index: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  aliquota: TACBrECFAliquota;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    aliquota := ecfHandle^.ECF.Aliquotas[index];
    StrPLCopy(retAliquota.Indice, aliquota.Indice, 4);
    retAliquota.Aliquota := aliquota.Aliquota;
    retAliquota.Tipo := aliquota.Tipo;
    retAliquota.Total := aliquota.Total;
    retAliquota.Sequencia := aliquota.Sequencia;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetALCount(const ecfHandle: PECFHandle; var Value: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(ecfHandle^.ECF.Aliquotas) then
    begin
      Value := ecfHandle^.ECF.Aliquotas.Count;
      Result := 1;
    end
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_CarregaAliquotas(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.CarregaAliquotas;
    Result := ecfHandle^.ECF.Aliquotas.Count;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_GetAliquotasStr(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  I: integer;
  strTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := '';
    if ecfHandle^.ECF.Aliquotas.Count < 1 then
      ecfHandle^.ECF.CarregaAliquotas;

    for I := 0 to ecfHandle^.ECF.Aliquotas.Count - 1 do
      strTmp := strTmp + PadRight(ecfHandle^.ECF.Aliquotas[I].Indice, 4) +
        ' ' + ecfHandle^.ECF.Aliquotas[I].Tipo +
        FormatFloat('#0.00', ecfHandle^.ECF.Aliquotas[I].Aliquota) + '|';

    StrPLCopy(Buffer, strTmp, BufferLen);
    Result := length(strTmp);

  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_LerTotaisAliquota(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.LerTotaisAliquota;
    Result := ecfHandle^.ECF.Aliquotas.Count;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_LerTotaisAliquotaStr(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  I: integer;
  strTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := '';
    ecfHandle^.ECF.LerTotaisAliquota;

    for I := 0 to ecfHandle^.ECF.Aliquotas.Count - 1 do
      strTmp := strTmp + PadRight(ecfHandle^.ECF.Aliquotas[I].Indice, 4) +
        FormatFloat('########0.00', ecfHandle^.ECF.Aliquotas[I].Total) + '|';


    StrPLCopy(Buffer, strTmp, BufferLen);
    Result := length(strTmp);

  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_ProgramaAliquota(const ecfHandle: PECFHandle; const Aliquota: double;
  const Tipo: char): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.ProgramaAliquota(Aliquota, Tipo);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_AchaIcmsAliquota(const ecfHandle: PECFHandle; const Aliq: double;
  const Tipo: char; var ret_pos: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  ICMS: TACBrECFAliquota;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ICMS := ecfHandle^.ECF.AchaICMSAliquota(Aliq, Tipo);
    if ICMS <> nil then
      ret_pos := PChar(PadRight(ICMS.Indice, 4))
    else
      ret_pos := PChar(PadRight('-1', 4));
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Forma de pagamento}

function ECF_GetFormaPagamento(const ecfHandle: PECFHandle;
  var retFormaPagamento: TFormaPagamentoRec; const index: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  formaPagamento: TACBrECFFormaPagamento;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    if (index >= 0) and (index < ecfHandle^.ECF.FormasPagamento.Count) then
    begin

      formaPagamento := ecfHandle^.ECF.FormasPagamento[index];

      StrPLCopy(retFormaPagamento.Indice, formaPagamento.Indice, 4);
      StrPLCopy(retFormaPagamento.Descricao, formaPagamento.Descricao, 30);
      retFormaPagamento.PermiteVinculado := formaPagamento.PermiteVinculado;
      retFormaPagamento.Total := formaPagamento.Total;
      retFormaPagamento.Data := formaPagamento.Data;
      StrPLCopy(retFormaPagamento.TipoDoc, formaPagamento.TipoDoc, 30);
      Result := 0;
    end
    else
    begin
      Result := -3;
    end;

  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetFPGCount(const ecfHandle: PECFHandle; var Value: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(ecfHandle^.ECF.FormasPagamento) then
    begin
      Value := ecfHandle^.ECF.FormasPagamento.Count;
      Result := 1;
    end
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_CarregaFormasPagamento(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.CarregaFormasPagamento;
    Result := ecfHandle^.ECF.FormasPagamento.Count;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_LerTotaisFormaPagamento(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.LerTotaisFormaPagamento;
    Result := ecfHandle^.ECF.FormasPagamento.Count;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetFormasPagamentoStr(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  I: integer;
  strTmp: string;
  Vinc: char;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := '';
    if ecfHandle^.ECF.FormasPagamento.Count < 1 then
      ecfHandle^.ECF.CarregaFormasPagamento;


    for I := 0 to ecfHandle^.ECF.FormasPagamento.Count - 1 do
    begin
      Vinc := ' ';
      if ecfHandle^.ECF.FormasPagamento[I].PermiteVinculado then
        Vinc := 'V';

      strTmp := strTmp + PadRight(ecfHandle^.ECF.FormasPagamento[I].Indice, 4) +
        ' ' + Vinc + ecfHandle^.ECF.FormasPagamento[I].Descricao + '|';
    end;

    StrPLCopy(Buffer, strTmp, BufferLen);
    Result := length(strTmp)
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_LerTotaisFormaPagamentoStr(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  I: integer;
  strTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := '';
    ecfHandle^.ECF.LerTotaisFormaPagamento;

    for I := 0 to ecfHandle^.ECF.FormasPagamento.Count - 1 do
      strTmp := strTmp + PadRight(ecfHandle^.ECF.FormasPagamento[I].Indice, 4) +
        FormatFloat('########0.00', ecfHandle^.ECF.FormasPagamento[I].Total) + '|';


    StrPLCopy(Buffer, strTmp, BufferLen);
    Result := length(strTmp)
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_ProgramaFormaPagamento(const ecfHandle: PECFHandle;
  const Descricao: PChar; const PermiteVinculado: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  pDesc: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    pDesc := string(Descricao);
    ecfHandle^.ECF.ProgramaFormaPagamento(pDesc, PermiteVinculado);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_AchaFPGDescricao(const ecfHandle: PECFHandle; const descricao: PChar;
  const BuscaExata, IgnorarCase: boolean;
  var retFormaPagamento: TFormaPagamentoRec): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  FormPGT: TACBrECFFormaPagamento;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    FormPGT := ecfHandle^.ECF.AchaFPGDescricao(descricao, BuscaExata, IgnorarCase);
    if FormPGT <> nil then
    begin
      retFormaPagamento.Data := FormPGT.Data;
      retFormaPagamento.Descricao := FormPGT.Descricao;
      retFormaPagamento.Indice := FormPGT.Indice;
      retFormaPagamento.PermiteVinculado := FormPGT.PermiteVinculado;
      retFormaPagamento.TipoDoc := FormPGT.TipoDoc;
      retFormaPagamento.Total := FormPGT.Total;
      Result := 1;
    end
    else
    begin
      Result := 0;
    end

  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_AchaFPGIndice(const ecfHandle: PECFHandle; const indice: PChar;
  var retFormaPagamento: TFormaPagamentoRec): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  FormPGT: TACBrECFFormaPagamento;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    FormPGT := ecfHandle^.ECF.AchaFPGIndice(indice);
    if FormPGT <> nil then
    begin
      retFormaPagamento.Data := FormPGT.Data;
      retFormaPagamento.Descricao := FormPGT.Descricao;
      retFormaPagamento.Indice := FormPGT.Indice;
      retFormaPagamento.PermiteVinculado := FormPGT.PermiteVinculado;
      retFormaPagamento.TipoDoc := FormPGT.TipoDoc;
      retFormaPagamento.Total := FormPGT.Total;
      Result := 1;
    end
    else
    begin
      Result := 0;
    end

  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region Comprovantes Não Fiscais}

function ECF_AbreNaoFiscal(const ecfHandle: PECFHandle;
  const CPF_CNPJ, Nome, Endereco: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.AbreNaoFiscal(CPF_CNPJ, Nome, Endereco);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_RegistraItemNaoFiscal(const ecfHandle: PECFHandle;
  const CodCNF: PChar; const Valor: double; const Obs: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.RegistraItemNaoFiscal(CodCNF, Valor, Obs);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SubtotalizaNaoFiscal(const ecfHandle: PECFHandle;
  const DescontoAcrescimo: double; const MensagemRodape: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.SubtotalizaNaoFiscal(DescontoAcrescimo, MensagemRodape);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_EfetuaPagamentoNaoFiscal(const ecfHandle: PECFHandle;
  const CodFormaPagto: PChar; const Valor: double; const Observacao: PChar;
  const ImprimeVinculado: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.EfetuaPagamentoNaoFiscal(CodFormaPagto, Valor,
      Observacao, ImprimeVinculado);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_FechaNaoFiscal(const ecfHandle: PECFHandle; const Observacao: PChar;
  const IndiceBMP: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.FechaNaoFiscal(Observacao, IndiceBMP);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_CancelaNaoFiscal(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.CancelaNaoFiscal;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetComprovanteNaoFiscal(const ecfHandle: PECFHandle;
  var retComprovanteNaoFiscal: TComprovanteNaoFiscalRec; const index: integer): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  comprovanteNaoFiscal: TACBrECFComprovanteNaoFiscal;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    if (index >= 0) and (index < ecfHandle^.ECF.ComprovantesNaoFiscais.Count) then
    begin
      comprovanteNaoFiscal := ecfHandle^.ECF.ComprovantesNaoFiscais[index];

      StrPLCopy(retComprovanteNaoFiscal.Indice, comprovanteNaoFiscal.Indice, 4);
      StrPLCopy(retComprovanteNaoFiscal.Descricao,
        comprovanteNaoFiscal.Descricao, 30);
      retComprovanteNaoFiscal.PermiteVinculado :=
        comprovanteNaoFiscal.PermiteVinculado;
      StrPLCopy(retComprovanteNaoFiscal.FormaPagamento,
        comprovanteNaoFiscal.FormaPagamento, 4);
      retComprovanteNaoFiscal.Total := comprovanteNaoFiscal.Total;
      retComprovanteNaoFiscal.Contador := comprovanteNaoFiscal.Contador;
      Result := 0;
    end
    else
    begin
      Result := -3;
    end;

  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetCNFCount(const ecfHandle: PECFHandle; var Value: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(ecfHandle^.ECF.ComprovantesNaoFiscais) then
    begin
      Value := ecfHandle^.ECF.ComprovantesNaoFiscais.Count;
      Result := 1;
    end
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_CarregaComprovantesNaoFiscais(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.CarregaComprovantesNaoFiscais;
    Result := ecfHandle^.ECF.ComprovantesNaoFiscais.Count;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_LerTotaisComprovanteNaoFiscal(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.LerTotaisComprovanteNaoFiscal;
    Result := ecfHandle^.ECF.ComprovantesNaoFiscais.Count;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_ComprovantesNaoFiscais(const ecfHandle: PECFHandle;
  var v_ComprovantesNaoFiscais: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  I: integer;
  resp: string;
  Vinc: char;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    resp := '';
    if ecfHandle^.ECF.ComprovantesNaoFiscais.Count < 1 then
      ecfHandle^.ECF.CarregaComprovantesNaoFiscais;


    for I := 0 to ecfHandle^.ECF.ComprovantesNaoFiscais.Count - 1 do
    begin
      Vinc := ' ';
      if ecfHandle^.ECF.ComprovantesNaoFiscais[I].PermiteVinculado then
        Vinc := 'V';

      resp := resp + PadRight(ecfHandle^.ECF.ComprovantesNaoFiscais[I].Indice,
        4) + ' ' + Vinc + ecfHandle^.ECF.ComprovantesNaoFiscais[I].Descricao
        + '|';
    end;
    if resp <> '' then
    begin
      v_ComprovantesNaoFiscais := PChar(copy(resp, 1, Length(resp) - 1));
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_LerTotaisComprovante(const ecfHandle: PECFHandle;
  var v_LerTotaisComprovante: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  I: integer;
  resp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    resp := '';
    ecfHandle^.ECF.LerTotaisComprovanteNaoFiscal;

    for I := 0 to ecfHandle^.ECF.ComprovantesNaoFiscais.Count - 1 do
      resp := resp + PadRight(ecfHandle^.ECF.ComprovantesNaoFiscais[I].Indice,
        4) + FormatFloat('########0.00',
        ecfHandle^.ECF.ComprovantesNaoFiscais[I].Total) + '|';


    if resp <> '' then
    begin
      v_LerTotaisComprovante := PChar(copy(resp, 1, Length(resp) - 1));
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_ProgramaComprovanteNaoFiscal(const ecfHandle: PECFHandle;
  const Descricao, Tipo: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  pDesc: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    pDesc := string(Descricao);
    ecfHandle^.ECF.ProgramaComprovanteNaoFiscal(pDesc, Tipo);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_AchaCNFDescricao(const ecfHandle: PECFHandle;
  var retComprovanteNaoFiscal: TComprovanteNaoFiscalRec; const descricao: PChar;
  const busca, ignore: boolean): integer; cdecl; export;
var
  CNF: TACBrECFComprovanteNaoFiscal;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    CNF := ecfHandle^.ECF.AchaCNFDescricao(descricao, busca, ignore);
    if CNF <> nil then
    begin
      StrPLCopy(retComprovanteNaoFiscal.Indice, CNF.Indice, 4);
      StrPLCopy(retComprovanteNaoFiscal.Descricao, CNF.Descricao, 30);
      retComprovanteNaoFiscal.PermiteVinculado := CNF.PermiteVinculado;
      StrPLCopy(retComprovanteNaoFiscal.FormaPagamento, CNF.FormaPagamento, 4);
      retComprovanteNaoFiscal.Total := CNF.Total;
      retComprovanteNaoFiscal.Contador := CNF.Contador;
      Result := 1;
    end
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Leitura Memoria Fiscal }

function ECF_LeituraMemoriaFiscalReducao(const ecfHandle: PECFHandle;
  const ReducaoInicial: integer; const ReducaoFinal: integer;
  const Simplificada: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.LeituraMemoriaFiscal(ReducaoInicial, ReducaoFinal, Simplificada);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_LeituraMemoriaFiscalData(const ecfHandle: PECFHandle;
  const DataInicial: double; const DataFinal: double;
  const Simplificada: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.LeituraMemoriaFiscal(DataInicial, DataFinal, Simplificada);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_LeituraMemoriaFiscalSerialReducao(const ecfHandle: PECFHandle;
  const ReducaoInicial: integer; const ReducaoFinal: integer;
  const Simplificada: boolean; Buffer: PChar; const BufferLen: integer): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  lista: TStringList;
begin

  try
    if (ecfHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    try
      lista := TStringList.Create;
      lista.Delimiter := #10;

      ecfHandle^.ECF.LeituraMemoriaFiscalSerial(ReducaoInicial,
        ReducaoFinal, lista, Simplificada);

      StrPLCopy(Buffer, lista.DelimitedText, BufferLen);
      Result := length(lista.DelimitedText);
    except
      on Exception: Exception do
      begin
        ecfHandle^.UltimoErro := Exception.Message;
        Result := -1;
      end
    end;
  finally
    FreeAndNil(lista);
  end;
end;

function ECF_LeituraMemoriaFiscalSerialData(const ecfHandle: PECFHandle;
  const DataInicial: double; const DataFinal: double; const Simplificada: boolean;
  Buffer: PChar; const BufferLen: integer): integer;{$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  lista: TStringList;

begin

  try
    if (ecfHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    try
      lista := TStringList.Create;
      lista.Delimiter := #10;

      ecfHandle^.ECF.LeituraMemoriaFiscalSerial(DataInicial, DataFinal,
        lista, Simplificada);

      StrPLCopy(Buffer, lista.DelimitedText, BufferLen);
      Result := length(lista.DelimitedText);

    except
      on Exception: Exception do
      begin
        ecfHandle^.UltimoErro := Exception.Message;
        Result := -1;
      end
    end;
  finally
    FreeAndNil(lista);
  end;
end;

function ECF_LeituraMemoriaFiscalArquivoReducao(const ecfHandle: PECFHandle;
  const ReducaoInicial: integer; const ReducaoFinal: integer;
  const NomeArquivo: PChar; const Simplificada: boolean): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    ecfHandle^.ECF.LeituraMemoriaFiscalSerial(ReducaoInicial,
      ReducaoFinal, NomeArquivo, Simplificada);
    Result := 0;

  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_LeituraMemoriaFiscalArquivoData(const ecfHandle: PECFHandle;
  const DataInicial: double; const DataFinal: double; const NomeArquivo: PChar;
  const Simplificada: boolean): integer;{$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    ecfHandle^.ECF.LeituraMemoriaFiscalSerial(DataInicial, DataFinal,
      NomeArquivo, Simplificada);
    Result := 0;

  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Leitura X}

function ECF_LeituraX(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.LeituraX;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_PafMF_LX_Impressao(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.PafMF_LX_Impressao;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Redução Z }

function ECF_ReducaoZ(const ecfHandle: PECFHandle; const date: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.ReducaoZ(date);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetDadosReducaoZ(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := ecfHandle^.ECF.DadosReducaoZ;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_GetDadosUltimaReducaoZ(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := ecfHandle^.ECF.DadosUltimaReducaoZ;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region Redução Z Class}

function ECF_DadosReducaoZClass_GetCOO(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.DadosReducaoZClass.COO;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetCFD(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.DadosReducaoZClass.CFD;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetCancelamentoISSQN(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.DadosReducaoZClass.CancelamentoISSQN;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetGNFC(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.DadosReducaoZClass.GNFC;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetCRO(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.DadosReducaoZClass.CRO;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetValorVendaBruta(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.DadosReducaoZClass.ValorVendaBruta;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetAcrescimoICMS(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.DadosReducaoZClass.AcrescimoICMS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetDataHoraEmissao(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.DadosReducaoZClass.DataHoraEmissao;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetDescontoICMS(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.DadosReducaoZClass.DescontoICMS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetNaoTributadoICMS(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.DadosReducaoZClass.NaoTributadoICMS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetCRZ(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.DadosReducaoZClass.CRZ;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetGRG(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.DadosReducaoZClass.GRG;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetValorGrandeTotal(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.DadosReducaoZClass.ValorGrandeTotal;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetAcrescimoISSQN(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.DadosReducaoZClass.AcrescimoISSQN;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetNaoTributadoISSQN(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.DadosReducaoZClass.NaoTributadoISSQN;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetIsentoICMS(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.DadosReducaoZClass.IsentoICMS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetSubstituicaoTributariaICMS(
  const ecfHandle: PECFHandle; var Value: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.DadosReducaoZClass.SubstituicaoTributariaICMS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetDataDaImpressora(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.DadosReducaoZClass.DataDaImpressora;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetTotalOperacaoNaoFiscal(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.DadosReducaoZClass.TotalOperacaoNaoFiscal;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetDescontoISSQN(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.DadosReducaoZClass.DescontoISSQN;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetCancelamentoOPNF(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.DadosReducaoZClass.CancelamentoOPNF;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetAcrescimoOPNF(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.DadosReducaoZClass.AcrescimoOPNF;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetDescontoOPNF(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.DadosReducaoZClass.DescontoOPNF;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetCancelamentoICMS(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.DadosReducaoZClass.CancelamentoICMS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetGNF(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.DadosReducaoZClass.GNF;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetIsentoISSQN(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.DadosReducaoZClass.IsentoISSQN;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetSubstituicaoTributariaISSQN(
  const ecfHandle: PECFHandle; var Value: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.DadosReducaoZClass.SubstituicaoTributariaISSQN;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetVendaLiquida(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.DadosReducaoZClass.VendaLiquida;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetCFC(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.DadosReducaoZClass.CFC;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetCCF(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.DadosReducaoZClass.CCF;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetTotalISSQN(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.DadosReducaoZClass.TotalISSQN;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetTotalICMS(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.DadosReducaoZClass.TotalICMS;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetCDC(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.DadosReducaoZClass.CDC;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetCCDC(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.DadosReducaoZClass.CCDC;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetNCN(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.DadosReducaoZClass.NCN;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetDataDoMovimento(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.DadosReducaoZClass.DataDoMovimento;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetNumeroCOOInicial(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := ecfHandle^.ECF.DadosReducaoZClass.NumeroCOOInicial;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_DadosReducaoZClass_GetNumeroDoECF(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := ecfHandle^.ECF.DadosReducaoZClass.NumeroDoECF;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_DadosReducaoZClass_GetNumeroDeSerie(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := ecfHandle^.ECF.DadosReducaoZClass.NumeroDeSerie;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_DadosReducaoZClass_GetNumeroDeSerieMFD(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := ecfHandle^.ECF.DadosReducaoZClass.NumeroDeSerieMFD;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_DadosReducaoZClass_GetNumeroDaLoja(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := ecfHandle^.ECF.DadosReducaoZClass.NumeroDaLoja;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_DadosReducaoZClass_GetTotalTroco(const ecfHandle: PECFHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := ecfHandle^.ECF.DadosReducaoZClass.TotalTroco;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetCNFCount(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.DadosReducaoZClass.TotalizadoresNaoFiscais.Count;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetCNF(const ecfHandle: PECFHandle;
  var retComprovanteNaoFiscal: TComprovanteNaoFiscalRec; const index: integer): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  comprovanteNaoFiscal: TACBrECFComprovanteNaoFiscal;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    if (index >= 0) and (index <
      ecfHandle^.ECF.DadosReducaoZClass.TotalizadoresNaoFiscais.Count) then
    begin
      comprovanteNaoFiscal :=
        ecfHandle^.ECF.DadosReducaoZClass.TotalizadoresNaoFiscais[index];

      StrPLCopy(retComprovanteNaoFiscal.Indice, comprovanteNaoFiscal.Indice, 4);
      StrPLCopy(retComprovanteNaoFiscal.Descricao,
        comprovanteNaoFiscal.Descricao, 30);
      retComprovanteNaoFiscal.PermiteVinculado :=
        comprovanteNaoFiscal.PermiteVinculado;
      StrPLCopy(retComprovanteNaoFiscal.FormaPagamento,
        comprovanteNaoFiscal.FormaPagamento, 4);
      retComprovanteNaoFiscal.Total := comprovanteNaoFiscal.Total;
      retComprovanteNaoFiscal.Contador := comprovanteNaoFiscal.Contador;
      Result := 0;
    end
    else
    begin
      Result := -3;
    end;

  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetICMSCount(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.DadosReducaoZClass.ICMS.Count;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetICMS(const ecfHandle: PECFHandle;
  var retAliquota: TAliquotaRec; const index: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  aliquota: TACBrECFAliquota;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    aliquota := ecfHandle^.ECF.DadosReducaoZClass.ICMS[index];
    StrPLCopy(retAliquota.Indice, aliquota.Indice, 4);
    retAliquota.Aliquota := aliquota.Aliquota;
    retAliquota.Tipo := aliquota.Tipo;
    retAliquota.Total := aliquota.Total;
    retAliquota.Sequencia := aliquota.Sequencia;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetRGCount(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.DadosReducaoZClass.RelatorioGerencial.Count;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetRG(const ecfHandle: PECFHandle;
  var retRelatorios: TRelatorioGerencialRec; const index: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  relatorios: TACBrECFRelatorioGerencial;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    if (index >= 0) and (index <
      ecfHandle^.ECF.DadosReducaoZClass.RelatorioGerencial.Count) then
    begin

      relatorios := ecfHandle^.ECF.DadosReducaoZClass.RelatorioGerencial[index];

      StrPLCopy(retRelatorios.Indice, relatorios.Indice, 4);
      StrPLCopy(retRelatorios.Descricao, relatorios.Descricao, 30);
      retRelatorios.Contador := relatorios.Contador;
      Result := 0;
    end
    else
    begin
      Result := -3;
    end;

  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetISSQNCount(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.DadosReducaoZClass.ISSQN.Count;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetISSQN(const ecfHandle: PECFHandle;
  var retAliquota: TAliquotaRec; const index: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  aliquota: TACBrECFAliquota;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    aliquota := ecfHandle^.ECF.DadosReducaoZClass.ISSQN[index];
    StrPLCopy(retAliquota.Indice, aliquota.Indice, 4);
    retAliquota.Aliquota := aliquota.Aliquota;
    retAliquota.Tipo := aliquota.Tipo;
    retAliquota.Total := aliquota.Total;
    retAliquota.Sequencia := aliquota.Sequencia;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetFPGCount(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ecfHandle^.ECF.DadosReducaoZClass.MeiosDePagamento.Count;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_GetFPG(const ecfHandle: PECFHandle;
  var retFormaPagamento: TFormaPagamentoRec; const index: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  formaPagamento: TACBrECFFormaPagamento;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    if (index >= 0) and (index <
      ecfHandle^.ECF.DadosReducaoZClass.MeiosDePagamento.Count) then
    begin

      formaPagamento :=
        ecfHandle^.ECF.DadosReducaoZClass.MeiosDePagamento[index];

      StrPLCopy(retFormaPagamento.Indice, formaPagamento.Indice, 4);
      StrPLCopy(retFormaPagamento.Descricao, formaPagamento.Descricao, 30);
      retFormaPagamento.PermiteVinculado := formaPagamento.PermiteVinculado;
      retFormaPagamento.Total := formaPagamento.Total;
      retFormaPagamento.Data := formaPagamento.Data;
      StrPLCopy(retFormaPagamento.TipoDoc, formaPagamento.TipoDoc, 30);
      Result := 0;
    end
    else
    begin
      Result := -3;
    end;

  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_CalculaValoresVirtuais(
  const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall;{$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.DadosReducaoZClass.CalculaValoresVirtuais;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DadosReducaoZClass_MontaDadosReducaoZ(const ecfHandle: PECFHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := ecfHandle^.ECF.DadosReducaoZClass.MontaDadosReducaoZ;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region PAF }

function ECF_IdentificaPAF(const ecfHandle: PECFHandle; const NomeVersao: PChar;
  const MD5: PChar): integer;{$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    ecfHandle^.ECF.IdentificaPAF(NomeVersao, MD5);
    Result := 0;

  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_PafMF_GerarCAT52(const ecfHandle: PECFHandle;
  const DataInicial, DataFinal: double; const CaminhoArquivo: PChar): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.PafMF_GerarCAT52(DataInicial, DataFinal, CaminhoArquivo);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DoAtualizarValorGT(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.DoAtualizarValorGT;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_DoVerificaValorGT(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.DoVerificaValorGT;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetRodapePaf(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := ecfHandle^.ECF.GetRodapePaf;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region PAF LMFC }

function ECF_PafMF_LMFC_Cotepe1704(const ecfHandle: PECFHandle;
  const DataInicial, DataFinal: double; const CaminhoArquivo: PChar): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.PafMF_LMFC_Cotepe1704(DataInicial, DataFinal, CaminhoArquivo);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_PafMF_LMFC_Cotepe1704_CRZ(const ecfHandle: PECFHandle;
  const CRZInicial, CRZFinal: integer; const PathArquivo: PChar): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.PafMF_LMFC_Cotepe1704(CRZInicial, CRZFinal, PathArquivo);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_PafMF_LMFC_Espelho(const ecfHandle: PECFHandle;
  const DataInicial, DataFinal: double; const CaminhoArquivo: PChar): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.PafMF_LMFC_Espelho(DataInicial, DataFinal, CaminhoArquivo);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_PafMF_LMFC_Espelho_CRZ(const ecfHandle: PECFHandle;
  const CRZInicial, CRZFinal: integer; const PathArquivo: PChar): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.PafMF_LMFC_Espelho(CRZInicial, CRZFinal, PathArquivo);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_PafMF_LMFC_Impressao(const ecfHandle: PECFHandle;
  const DataInicial, DataFinal: double): integer;{$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.PafMF_LMFC_Impressao(DataInicial, DataFinal);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_PafMF_LMFC_Impressao_CRZ(const ecfHandle: PECFHandle;
  const CRZInicial, CRZFinal: integer): integer;{$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.PafMF_LMFC_Impressao(CRZInicial, CRZFinal);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region PAF LMFS }

function ECF_PafMF_LMFS_Espelho(const ecfHandle: PECFHandle;
  const DataInicial, DataFinal: double; const CaminhoArquivo: PChar): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.PafMF_LMFS_Espelho(DataInicial, DataFinal, CaminhoArquivo);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_PafMF_LMFS_Espelho_CRZ(const ecfHandle: PECFHandle;
  const CRZInicial, CRZFinal: integer; const PathArquivo: PChar): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.PafMF_LMFS_Espelho(CRZInicial, CRZFinal, PathArquivo);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_PafMF_LMFS_Impressao(const ecfHandle: PECFHandle;
  const DataInicial, DataFinal: double): integer;{$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.PafMF_LMFS_Impressao(DataInicial, DataFinal);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_PafMF_LMFS_Impressao_CRZ(const ecfHandle: PECFHandle;
  const CRZInicial, CRZFinal: integer): integer;{$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.PafMF_LMFS_Impressao(CRZInicial, CRZFinal);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region PAF Espelho MFD }

function ECF_PafMF_MFD_Cotepe1704(const ecfHandle: PECFHandle;
  const DataInicial, DataFinal: double; const CaminhoArquivo: PChar): integer;
      {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.PafMF_MFD_Cotepe1704(DataInicial, DataFinal, CaminhoArquivo);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_PafMF_MFD_Cotepe1704_COO(const ecfHandle: PECFHandle;
  const COOInicial, COOFinal: integer; const PathArquivo: PChar): integer;
      {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.PafMF_MFD_Cotepe1704(COOInicial, COOFinal, PathArquivo);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region PAF Arquivos }

function ECF_ArquivoMFD_DLL(const ecfHandle: PECFHandle;
  const DataInicial, DataFinal: double; const Arquivo: PChar;
  var documentos: array of integer; const QTD_DOC, Finalidade: integer): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  DocumentSet: TACBrECFTipoDocumentoSet;
  i: integer;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (QTD_DOC = 0) and (Finalidade = -1) then
    begin
      ecfHandle^.ECF.ArquivoMFD_DLL(DataInicial, DataFinal, Arquivo);
    end
    else
    begin
      DocumentSet := [];
      for i := 0 to QTD_DOC - 1 do
      begin
        Include(DocumentSet, TACBrECFTipoDocumento(Documentos[i]));
      end;
      ecfHandle^.ECF.ArquivoMFD_DLL(DataInicial, DataFinal, Arquivo, DocumentSet,
        TACBrECFFinalizaArqMFD(Finalidade));
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_ArquivoMFD_DLL_COO(const ecfHandle: PECFHandle;
  const COOInicial, COOFinal: integer; const Arquivo: PChar;
  var documentos: array of integer;
  const QTD_DOC, Finalidade, TipoContador: integer): integer;{$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  DocumentSet: TACBrECFTipoDocumentoSet;
  i: integer;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (QTD_DOC = 0) and (Finalidade = -1) and (TipoContador = -1) then
    begin
      ecfHandle^.ECF.ArquivoMFD_DLL(COOInicial, COOFinal, Arquivo);
    end
    else
    begin
      DocumentSet := [];
      for i := 0 to QTD_DOC - 1 do
      begin
        Include(DocumentSet, TACBrECFTipoDocumento(Documentos[i]));
      end;
      ecfHandle^.ECF.ArquivoMFD_DLL(COOInicial, COOFinal, Arquivo, DocumentSet,
        TACBrECFFinalizaArqMFD(Finalidade), TACBrECFTipoContador(TipoContador));
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_ArquivoMF_Binario_DLL(const ecfHandle: PECFHandle;
  const Arquivo: PChar): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.ArquivoMF_Binario_DLL(Arquivo);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_ArquivoMFD_Binario_DLL(const ecfHandle: PECFHandle;
  const Arquivo: PChar): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.ArquivoMFD_Binario_DLL(Arquivo);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_ArquivoMFD_Binario_DLL_Data(const ecfHandle: PECFHandle;
  const Arquivo: PChar; const DataInicial, DataFinal: double): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.ArquivoMFD_Binario_DLL(Arquivo, DataInicial, DataFinal);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_ArquivoMFD_Binario_DLL_COO(const ecfHandle: PECFHandle;
  const Arquivo: PChar; const COOInicial, COOFinal: integer): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.ArquivoMFD_Binario_DLL(Arquivo, COOInicial, COOFinal);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_EspelhoMFD_DLL(const ecfHandle: PECFHandle;
  const DataInicial, DataFinal: double; const Arquivo: PChar;
  var documentos: array of integer; const QTD_DOC: integer): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  DocumentSet: TACBrECFTipoDocumentoSet;
  i: integer;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (QTD_DOC = 0) then
    begin
      ecfHandle^.ECF.EspelhoMFD_DLL(DataInicial, DataFinal, Arquivo);
    end
    else
    begin
      DocumentSet := [];
      for i := 0 to QTD_DOC - 1 do
      begin
        Include(DocumentSet, TACBrECFTipoDocumento(Documentos[i]));
      end;
      ecfHandle^.ECF.EspelhoMFD_DLL(DataInicial, DataFinal, Arquivo, DocumentSet);
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_EspelhoMFD_DLL_COO(const ecfHandle: PECFHandle;
  const COOInicial, COOFinal: integer; const Arquivo: PChar;
  var Documentos: array of integer; const QTD_DOC: integer): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  DocumentSet: TACBrECFTipoDocumentoSet;
  i: integer;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (QTD_DOC = 0) then
    begin
      ecfHandle^.ECF.EspelhoMFD_DLL(COOInicial, COOFinal, Arquivo);
    end
    else
    begin
      DocumentSet := [];
      for i := 0 to QTD_DOC - 1 do
      begin
        Include(DocumentSet, TACBrECFTipoDocumento(Documentos[i]));
      end;
      ecfHandle^.ECF.EspelhoMFD_DLL(COOInicial, COOFinal, Arquivo, DocumentSet);
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_PafMF_ArqMF_Binario(const ecfHandle: PECFHandle;
  const path: PChar; const Assinar: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.PafMF_ArqMF_Binario(path, Assinar);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_PafMF_ArqMFD_Binario(const ecfHandle: PECFHandle;
  const path: PChar; const DataInicial, DataFinal: double; Assinar : boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.PafMF_ArqMFD_Binario(path, DataInicial, DataFinal, Assinar);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region PAF Arq. MFD }

function ECF_PafMF_MFD_Espelho(const ecfHandle: PECFHandle;
  const DataInicial, DataFinal: double; const CaminhoArquivo: PChar): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.PafMF_MFD_Espelho(DataInicial, DataFinal, CaminhoArquivo);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_PafMF_MFD_Espelho_COO(const ecfHandle: PECFHandle;
  const COOInicial, COOFinal: integer; const PathArquivo: PChar): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.PafMF_MFD_Espelho(COOInicial, COOFinal, PathArquivo);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Metodos DAV }

function ECF_DAV_Abrir(const ecfHandle: PECFHandle; const AEmissao: double;
  const ADescrDocumento, ANumero, ASituacao, AVendedor, AObservacao,
  ACNPJCPF, ANomeCliente, AEndereco, ANumFabricacao, AMarca, AModelo,
  AAno, APlaca, ARenavam: PChar; AIndice: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.DAV_Abrir(AEmissao, AdescrDocumento, ANumero, ASituacao, AVendedor,
      AObservacao, ACNPJCPF, ANomeCliente, AEndereco, ANumFabricacao, AMarca,
      AModelo, AAno, APlaca, ARenavam, AIndice);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_DAV_RegistrarItem(const ecfHandle: PECFHandle;
  const ACodigo, ADescricao, AUnid: PChar;
  const AQuantidade, AVlrUnitario, AVlrDesconto, AVlrAcrescimo: double;
  const ACancelado: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.DAV_RegistrarItem(ACodigo, ADescricao, AUnid,
      AQuantidade, AVlrUnitario, AVlrDesconto, AVlrAcrescimo, ACancelado);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function ECF_DAV_Fechar(const ecfHandle: PECFHandle; const Observacao: PChar;
  const AVlrDesconto, AVlrAcrescimo: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.DAV_Fechar(Observacao, AVlrDesconto, AVlrAcrescimo);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_PafMF_RelDAVEmitidos(const ecfHandle: PECFHandle;
  var DAVsEmitidos: array of TDAVsRec; const Index: integer;
  const TituloRelatorio: PChar; const IndiceRelatorio: integer): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  DAVs: TACBrECFDAVs;
  I: integer;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;
  if (Index <= 0) then
  begin
    ecfHandle^.UltimoErro := 'O Número de DAVs precisa ser maior que zero';
    Result := -1;
  end;
  try
    DAVs := TACBrECFDAVs.Create;
    for I := 0 to Index - 1 do
    begin
      with DAVs.New do
      begin
        Numero := DAVsEmitidos[i].Numero;
        COO_Dav := DAVsEmitidos[i].COO_Dav;
        COO_Cupom := DAVsEmitidos[i].COO_Cupom;
        Titulo := DAVsEmitidos[i].Titulo;
        DtEmissao := DAVsEmitidos[i].DtEmissao;
        Valor := DAVsEmitidos[i].Valor;
      end;
    end;

    ecfHandle^.ECF.PafMF_RelDAVEmitidos(DAVs, TituloRelatorio, IndiceRelatorio);
    DAVs.Free;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      DAVs.Free;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Paf Rels }

function ECF_PafMF_RelMeiosPagamento(const ecfHandle: PECFHandle;
  var formasPagamento: array of TFormaPagamentoRec; const Index: integer;
  const TituloRelatorio: PChar; const IndiceRelatorio: integer): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  AFormasPagamento: TACBrECFFormasPagamento;
  I: integer;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;
  if (Index <= 0) then
  begin
    ecfHandle^.UltimoErro :=
      'O Número de formas de pagamento precisa ser maior que zero';
    Result := -1;
  end;
  try
    AFormasPagamento := TACBrECFFormasPagamento.Create;
    for I := 0 to Index - 1 do
    begin
      with AFormasPagamento.New do
      begin
        Indice := formasPagamento[i].Indice;
        Descricao := formasPagamento[i].Descricao;
        PermiteVinculado := formasPagamento[i].PermiteVinculado;
        Total := formasPagamento[i].Total;
        Data := formasPagamento[i].Data;
        TipoDoc := formasPagamento[i].TipoDoc;
      end;
    end;

    ecfHandle^.ECF.PafMF_RelMeiosPagamento(AFormasPagamento, TituloRelatorio,
      IndiceRelatorio);
    AFormasPagamento.Free;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      AFormasPagamento.Free;
      Result := -1;
    end
  end;
end;

function ECF_PafMF_RelIdentificacaoPafECF(const ecfHandle: PECFHandle;
  const aacHandle: PAACHandle; const indiceRelatorio: integer): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  if (aacHandle = nil) then
  begin
    Result := -1;
    ecfHandle^.UltimoErro := 'A Identificação não pode ser nula';
    Exit;
  end;

  try
    ecfHandle^.ECF.PafMF_RelIdentificacaoPafECF(aacHandle^.AAC.IdentPAF,
      indiceRelatorio);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_PafMF_RelParametrosConfiguracao(const ecfHandle: PECFHandle;
  const aacHandle: PAACHandle; const indiceRelatorio: integer): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  if (aacHandle = nil) then
  begin
    Result := -1;
    ecfHandle^.UltimoErro := 'Os Parametros não podem ser nulos';
    Exit;
  end;

  try
    ecfHandle^.ECF.PafMF_RelParametrosConfiguracao(aacHandle^.AAC.IdentPAF.Paf,
      indiceRelatorio);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_PafMF_RelParametrosConfiguracao2(const ecfHandle: PECFHandle;
  const Perfil: PChar; const indiceRelatorio: integer): integer;
{$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.PafMF_RelParametrosConfiguracao(Perfil, indiceRelatorio);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Relatorio Gerencial }

function ECF_AbreRelatorioGerencial(const ecfHandle: PECFHandle;
  const Indice: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.AbreRelatorioGerencial(Indice);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_FechaRelatorio(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.FechaRelatorio;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_LinhaRelatorioGerencial(const ecfHandle: PECFHandle;
  const Linha: PChar; const IndiceBMP: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.LinhaRelatorioGerencial(Linha, IndiceBMP);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_ProgramaRelatoriosGerenciais(const ecfHandle: PECFHandle;
  const Descricao, Posicao: PChar): integer;{$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  pDesc, pPosi: string;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    pDesc := string(Descricao);
    pPosi := string(Posicao);
    ecfHandle^.ECF.ProgramaRelatoriosGerenciais(pDesc, pPosi);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_CarregaRelatoriosGerenciais(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.CarregaRelatoriosGerenciais;
    Result := ecfHandle^.ECF.RelatoriosGerenciais.Count;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_LerTotaisRelatoriosGerenciais(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.LerTotaisRelatoriosGerenciais;
    Result := ecfHandle^.ECF.RelatoriosGerenciais.Count;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_GetRelatoriosGerenciais(const ecfHandle: PECFHandle;
  var retRelatorios: TRelatorioGerencialRec; const index: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  relatorios: TACBrECFRelatorioGerencial;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    if (index >= 0) and (index < ecfHandle^.ECF.RelatoriosGerenciais.Count) then
    begin

      relatorios := ecfHandle^.ECF.RelatoriosGerenciais[index];

      StrPLCopy(retRelatorios.Indice, relatorios.Indice, 4);
      StrPLCopy(retRelatorios.Descricao, relatorios.Descricao, 30);
      retRelatorios.Contador := relatorios.Contador;
      Result := 0;
    end
    else
    begin
      Result := -3;
    end;

  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_RelatorioGerencial(const ecfHandle: PECFHandle;
  var linhas: array of PChar; const LinhasCount: integer; const Vias: integer;
  const Indice: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  i: integer;
  Lista: TStringList;
begin

  try

    if (ecfHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    try
      Lista := TStringList.Create();
      for i := 0 to LinhasCount - 1 do
      begin
        Lista.Add(string(linhas[i]));
      end;
      ecfHandle^.ECF.RelatorioGerencial(Lista, Vias, Indice);
      Result := 0;
    except
      on Exception: Exception do
      begin
        ecfHandle^.UltimoErro := Exception.Message;
        Result := -1;
      end
    end;
  finally
    FreeAndNil(Lista);
  end;
end;

{%endregion}

{%region Cheques}

function ECF_ImprimeCheque(const ecfHandle: PECFHandle; const Banco: PChar;
  const Valor: double; const Favorecido, Cidade: PChar; const Data: double;
  const Observacao: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.ImprimeCheque(Banco, Valor, Favorecido, Cidade, Data, Observacao);
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_CancelaImpressaoCheque(const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    ecfHandle^.ECF.CancelaImpressaoCheque;
    Result := 0;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_LeituraCMC7(const ecfHandle: PECFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  strTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := ecfHandle^.ECF.LeituraCMC7;
    StrPLCopy(Buffer, strTmp, BufferLen);
    Result := length(strTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Comando}

function ECF_EnviaComando(const ecfHandle: PECFHandle; cmd: PChar;
  const timeout: integer; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  strTmp: string;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (timeout < 0) then
      strTmp := ecfHandle^.ECF.EnviaComando(cmd)
    else
      strTmp := ecfHandle^.ECF.EnviaComando(cmd, timeout);

    StrPLCopy(Buffer, strTmp, BufferLen);
    Result := length(strTmp);
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Set Eventos }

function ECF_SetOnMsgPoucoPapel(const ecfHandle: PECFHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnMsgPoucoPapel := ecfHandle^.EventHandlers.OnMsgPoucoPapel;
      ecfHandle^.EventHandlers.OnMsgPoucoPapelCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnMsgPoucoPapel := nil;
      ecfHandle^.EventHandlers.OnMsgPoucoPapelCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnAguardandoRespostaChange(const ecfHandle: PECFHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnAguardandoRespostaChange :=
        ecfHandle^.EventHandlers.OnAguardandoRespostaChange;
      ecfHandle^.EventHandlers.OnAguardandoRespostaChangeCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnAguardandoRespostaChange := nil;
      ecfHandle^.EventHandlers.OnAguardandoRespostaChangeCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnAntesAbreCupom(const ecfHandle: PECFHandle;
  const method: TAbreCupomCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnAntesAbreCupom := ecfHandle^.EventHandlers.OnAntesAbreCupom;
      ecfHandle^.EventHandlers.OnAntesAbreCupomCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnAntesAbreCupom := nil;
      ecfHandle^.EventHandlers.OnAntesAbreCupomCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnAntesAbreCupomVinculado(const ecfHandle: PECFHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnAntesAbreCupomVinculado :=
        ecfHandle^.EventHandlers.OnAntesAbreCupomVinculado;
      ecfHandle^.EventHandlers.OnAntesAbreCupomVinculadoCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnAntesAbreCupomVinculado := nil;
      ecfHandle^.EventHandlers.OnAntesAbreCupomVinculadoCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnAntesAbreNaoFiscal(const ecfHandle: PECFHandle;
  const method: TAbreCupomCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnAntesAbreNaoFiscal :=
        ecfHandle^.EventHandlers.OnAntesAbreNaoFiscal;
      ecfHandle^.EventHandlers.OnAntesAbreNaoFiscalCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnAntesAbreNaoFiscal := nil;
      ecfHandle^.EventHandlers.OnAntesAbreNaoFiscalCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnAntesAbreRelatorioGerencial(const ecfHandle: PECFHandle;
  const method: TIntegerCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnAntesAbreRelatorioGerencial :=
        ecfHandle^.EventHandlers.OnAntesAbreRelatorioGerencial;
      ecfHandle^.EventHandlers.OnAntesAbreRelatorioGerencialCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnAntesAbreRelatorioGerencial := nil;
      ecfHandle^.EventHandlers.OnAntesAbreRelatorioGerencialCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnAntesCancelaCupom(const ecfHandle: PECFHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnAntesCancelaCupom :=
        ecfHandle^.EventHandlers.OnAntesCancelaCupom;
      ecfHandle^.EventHandlers.OnAntesCancelaCupomCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnAntesCancelaCupom := nil;
      ecfHandle^.EventHandlers.OnAntesCancelaCupomCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnAntesCancelaItemNaoFiscal(const ecfHandle: PECFHandle;
  const method: TIntegerCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnAntesCancelaItemNaoFiscal :=
        ecfHandle^.EventHandlers.OnAntesCancelaItemNaoFiscal;
      ecfHandle^.EventHandlers.OnAntesCancelaItemNaoFiscalCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnAntesCancelaItemNaoFiscal := nil;
      ecfHandle^.EventHandlers.OnAntesCancelaItemNaoFiscalCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnAntesCancelaItemVendido(const ecfHandle: PECFHandle;
  const method: TIntegerCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnAntesCancelaItemVendido :=
        ecfHandle^.EventHandlers.OnAntesCancelaItemVendido;
      ecfHandle^.EventHandlers.OnAntesCancelaItemVendidoCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnAntesCancelaItemVendido := nil;
      ecfHandle^.EventHandlers.OnAntesCancelaItemVendidoCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnAntesCancelaNaoFiscal(const ecfHandle: PECFHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnAntesCancelaNaoFiscal :=
        ecfHandle^.EventHandlers.OnAntesCancelaNaoFiscal;
      ecfHandle^.EventHandlers.OnAntesCancelaNaoFiscalCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnAntesCancelaNaoFiscal := nil;
      ecfHandle^.EventHandlers.OnAntesCancelaNaoFiscalCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnAntesEfetuaPagamento(const ecfHandle: PECFHandle;
  const method: TEfetuaPagamentoCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnAntesEfetuaPagamento :=
        ecfHandle^.EventHandlers.OnAntesEfetuaPagamento;
      ecfHandle^.EventHandlers.OnAntesEfetuaPagamentoCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnAntesEfetuaPagamento := nil;
      ecfHandle^.EventHandlers.OnAntesEfetuaPagamentoCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnAntesEfetuaPagamentoNaoFiscal(const ecfHandle: PECFHandle;
  const method: TEfetuaPagamentoCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnAntesEfetuaPagamentoNaoFiscal :=
        ecfHandle^.EventHandlers.OnAntesEfetuaPagamentoNaoFiscal;
      ecfHandle^.EventHandlers.OnAntesEfetuaPagamentoNaoFiscalCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnAntesEfetuaPagamentoNaoFiscal := nil;
      ecfHandle^.EventHandlers.OnAntesEfetuaPagamentoNaoFiscalCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnAntesFechaCupom(const ecfHandle: PECFHandle;
  const method: TFechaCupomCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnAntesFechaCupom := ecfHandle^.EventHandlers.OnAntesFechaCupom;
      ecfHandle^.EventHandlers.OnAntesFechaCupomCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnAntesFechaCupom := nil;
      ecfHandle^.EventHandlers.OnAntesFechaCupomCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnAntesFechaNaoFiscal(const ecfHandle: PECFHandle;
  const method: TFechaCupomCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnAntesFechaNaoFiscal :=
        ecfHandle^.EventHandlers.OnAntesFechaNaoFiscal;
      ecfHandle^.EventHandlers.OnAntesFechaNaoFiscalCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnAntesFechaNaoFiscal := nil;
      ecfHandle^.EventHandlers.OnAntesFechaNaoFiscalCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnAntesFechaRelatorio(const ecfHandle: PECFHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnAntesFechaRelatorio :=
        ecfHandle^.EventHandlers.OnAntesFechaRelatorio;
      ecfHandle^.EventHandlers.OnAntesFechaRelatorioCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnAntesFechaRelatorio := nil;
      ecfHandle^.EventHandlers.OnAntesFechaRelatorioCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnAntesLeituraX(const ecfHandle: PECFHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnAntesLeituraX := ecfHandle^.EventHandlers.OnAntesLeituraX;
      ecfHandle^.EventHandlers.OnAntesLeituraXCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnAntesLeituraX := nil;
      ecfHandle^.EventHandlers.OnAntesLeituraXCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnAntesReducaoZ(const ecfHandle: PECFHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnAntesReducaoZ := ecfHandle^.EventHandlers.OnAntesReducaoZ;
      ecfHandle^.EventHandlers.OnAntesReducaoZCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnAntesReducaoZ := nil;
      ecfHandle^.EventHandlers.OnAntesReducaoZCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnAntesSangria(const ecfHandle: PECFHandle;
  const method: TSangriaSuprimentoCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnAntesSangria := ecfHandle^.EventHandlers.OnAntesSangria;
      ecfHandle^.EventHandlers.OnAntesSangriaCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnAntesSangria := nil;
      ecfHandle^.EventHandlers.OnAntesSangriaCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnAntesSubtotalizaCupom(const ecfHandle: PECFHandle;
  const method: TSubtotalizaCupomCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnAntesSubtotalizaCupom :=
        ecfHandle^.EventHandlers.OnAntesSubtotalizaCupom;
      ecfHandle^.EventHandlers.OnAntesSubtotalizaCupomCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnAntesSubtotalizaCupom := nil;
      ecfHandle^.EventHandlers.OnAntesSubtotalizaCupomCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnAntesSubtotalizaNaoFiscal(const ecfHandle: PECFHandle;
  const method: TSubtotalizaCupomCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnAntesSubtotalizaNaoFiscal :=
        ecfHandle^.EventHandlers.OnAntesSubtotalizaNaoFiscal;
      ecfHandle^.EventHandlers.OnAntesSubtotalizaNaoFiscalCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnAntesSubtotalizaNaoFiscal := nil;
      ecfHandle^.EventHandlers.OnAntesSubtotalizaNaoFiscalCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnAntesSuprimento(const ecfHandle: PECFHandle;
  const method: TSangriaSuprimentoCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnAntesSuprimento := ecfHandle^.EventHandlers.OnAntesSuprimento;
      ecfHandle^.EventHandlers.OnAntesSuprimentoCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnAntesSuprimento := nil;
      ecfHandle^.EventHandlers.OnAntesSuprimentoCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnAntesVendeItem(const ecfHandle: PECFHandle;
  const method: TVendeItemCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnAntesVendeItem := ecfHandle^.EventHandlers.OnAntesVendeItem;
      ecfHandle^.EventHandlers.OnAntesVendeItemCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnAntesVendeItem := nil;
      ecfHandle^.EventHandlers.OnAntesVendeItemCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnBobinaAdicionaLinhas(const ecfHandle: PECFHandle;
  const method: TBobinaProcedureCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnBobinaAdicionaLinhas :=
        ecfHandle^.EventHandlers.OnBobinaAdicionaLinhas;
      ecfHandle^.EventHandlers.OnBobinaAdicionaLinhasCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnBobinaAdicionaLinhas := nil;
      ecfHandle^.EventHandlers.OnBobinaAdicionaLinhasCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnChangeEstado(const ecfHandle: PECFHandle;
  const method: TChangeEstadoCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnChangeEstado := ecfHandle^.EventHandlers.OnChangeEstado;
      ecfHandle^.EventHandlers.OnChangeEstadoCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnChangeEstado := nil;
      ecfHandle^.EventHandlers.OnChangeEstadoCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnChequeEstado(const ecfHandle: PECFHandle;
  const method: TChequeEstadoCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnChequeEstado := ecfHandle^.EventHandlers.OnChequeEstado;
      ecfHandle^.EventHandlers.OnChequeEstadoCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnChangeEstado := nil;
      ecfHandle^.EventHandlers.OnChequeEstadoCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnDepoisAbreCupom(const ecfHandle: PECFHandle;
  const method: TAbreCupomCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnDepoisAbreCupom := ecfHandle^.EventHandlers.OnDepoisAbreCupom;
      ecfHandle^.EventHandlers.OnDepoisAbreCupomCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnDepoisAbreCupom := nil;
      ecfHandle^.EventHandlers.OnDepoisAbreCupomCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnDepoisAbreCupomVinculado(const ecfHandle: PECFHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnDepoisAbreCupomVinculado :=
        ecfHandle^.EventHandlers.OnDepoisAbreCupomVinculado;
      ecfHandle^.EventHandlers.OnDepoisAbreCupomVinculadoCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnDepoisAbreCupomVinculado := nil;
      ecfHandle^.EventHandlers.OnDepoisAbreCupomVinculadoCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnDepoisAbreNaoFiscal(const ecfHandle: PECFHandle;
  const method: TAbreCupomCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnDepoisAbreNaoFiscal :=
        ecfHandle^.EventHandlers.OnDepoisAbreNaoFiscal;
      ecfHandle^.EventHandlers.OnDepoisAbreNaoFiscalCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnDepoisAbreNaoFiscal := nil;
      ecfHandle^.EventHandlers.OnDepoisAbreNaoFiscalCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnDepoisAbreRelatorioGerencial(const ecfHandle: PECFHandle;
  const method: TIntegerCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnDepoisAbreRelatorioGerencial :=
        ecfHandle^.EventHandlers.OnDepoisAbreRelatorioGerencial;
      ecfHandle^.EventHandlers.OnDepoisAbreRelatorioGerencialCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnDepoisAbreRelatorioGerencial := nil;
      ecfHandle^.EventHandlers.OnDepoisAbreRelatorioGerencialCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnDepoisCancelaCupom(const ecfHandle: PECFHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnDepoisCancelaCupom :=
        ecfHandle^.EventHandlers.OnDepoisCancelaCupom;
      ecfHandle^.EventHandlers.OnDepoisCancelaCupomCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnDepoisCancelaCupom := nil;
      ecfHandle^.EventHandlers.OnDepoisCancelaCupomCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnDepoisCancelaItemNaoFiscal(const ecfHandle: PECFHandle;
  const method: TIntegerCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnDepoisCancelaItemNaoFiscal :=
        ecfHandle^.EventHandlers.OnDepoisCancelaItemNaoFiscal;
      ecfHandle^.EventHandlers.OnDepoisCancelaItemNaoFiscalCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnDepoisCancelaItemNaoFiscal := nil;
      ecfHandle^.EventHandlers.OnDepoisCancelaItemNaoFiscalCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnDepoisCancelaItemVendido(const ecfHandle: PECFHandle;
  const method: TIntegerCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnDepoisCancelaItemVendido :=
        ecfHandle^.EventHandlers.OnDepoisCancelaItemVendido;
      ecfHandle^.EventHandlers.OnDepoisCancelaItemVendidoCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnDepoisCancelaItemVendido := nil;
      ecfHandle^.EventHandlers.OnDepoisCancelaItemVendidoCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnDepoisCancelaNaoFiscal(const ecfHandle: PECFHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnDepoisCancelaNaoFiscal :=
        ecfHandle^.EventHandlers.OnDepoisCancelaNaoFiscal;
      ecfHandle^.EventHandlers.OnDepoisCancelaNaoFiscalCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnDepoisCancelaNaoFiscal := nil;
      ecfHandle^.EventHandlers.OnDepoisCancelaNaoFiscalCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnDepoisEfetuaPagamento(const ecfHandle: PECFHandle;
  const method: TEfetuaPagamentoCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnDepoisEfetuaPagamento :=
        ecfHandle^.EventHandlers.OnDepoisEfetuaPagamento;
      ecfHandle^.EventHandlers.OnDepoisEfetuaPagamentoCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnDepoisEfetuaPagamento := nil;
      ecfHandle^.EventHandlers.OnDepoisEfetuaPagamentoCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnDepoisEfetuaPagamentoNaoFiscal(const ecfHandle: PECFHandle;
  const method: TEfetuaPagamentoCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnDepoisEfetuaPagamentoNaoFiscal :=
        ecfHandle^.EventHandlers.OnDepoisEfetuaPagamentoNaoFiscal;
      ecfHandle^.EventHandlers.OnDepoisEfetuaPagamentoNaoFiscalCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnDepoisEfetuaPagamentoNaoFiscal := nil;
      ecfHandle^.EventHandlers.OnDepoisEfetuaPagamentoNaoFiscalCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnDepoisFechaCupom(const ecfHandle: PECFHandle;
  const method: TFechaCupomCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnDepoisFechaCupom := ecfHandle^.EventHandlers.OnDepoisFechaCupom;
      ecfHandle^.EventHandlers.OnDepoisFechaCupomCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnDepoisFechaCupom := nil;
      ecfHandle^.EventHandlers.OnDepoisFechaCupomCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnDepoisFechaNaoFiscal(const ecfHandle: PECFHandle;
  const method: TFechaCupomCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnDepoisFechaNaoFiscal :=
        ecfHandle^.EventHandlers.OnDepoisFechaNaoFiscal;
      ecfHandle^.EventHandlers.OnDepoisFechaNaoFiscalCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnDepoisFechaNaoFiscal := nil;
      ecfHandle^.EventHandlers.OnDepoisFechaNaoFiscalCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnDepoisFechaRelatorio(const ecfHandle: PECFHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnDepoisFechaRelatorio :=
        ecfHandle^.EventHandlers.OnDepoisFechaRelatorio;
      ecfHandle^.EventHandlers.OnDepoisFechaRelatorioCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnDepoisFechaRelatorio := nil;
      ecfHandle^.EventHandlers.OnDepoisFechaRelatorioCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnDepoisLeituraX(const ecfHandle: PECFHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnDepoisLeituraX := ecfHandle^.EventHandlers.OnDepoisLeituraX;
      ecfHandle^.EventHandlers.OnDepoisLeituraXCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnDepoisLeituraX := nil;
      ecfHandle^.EventHandlers.OnDepoisLeituraXCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnDepoisReducaoZ(const ecfHandle: PECFHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnDepoisReducaoZ := ecfHandle^.EventHandlers.OnDepoisReducaoZ;
      ecfHandle^.EventHandlers.OnDepoisReducaoZCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnDepoisReducaoZ := nil;
      ecfHandle^.EventHandlers.OnDepoisReducaoZCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnDepoisSangria(const ecfHandle: PECFHandle;
  const method: TSangriaSuprimentoCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnDepoisSangria := ecfHandle^.EventHandlers.OnDepoisSangria;
      ecfHandle^.EventHandlers.OnDepoisSangriaCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnDepoisSangria := nil;
      ecfHandle^.EventHandlers.OnDepoisSangriaCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnDepoisSubtotalizaCupom(const ecfHandle: PECFHandle;
  const method: TSubtotalizaCupomCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnDepoisSubtotalizaCupom :=
        ecfHandle^.EventHandlers.OnDepoisSubtotalizaCupom;
      ecfHandle^.EventHandlers.OnDepoisSubtotalizaCupomCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnDepoisSubtotalizaCupom := nil;
      ecfHandle^.EventHandlers.OnDepoisSubtotalizaCupomCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnDepoisSubtotalizaNaoFiscal(const ecfHandle: PECFHandle;
  const method: TSubtotalizaCupomCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnDepoisSubtotalizaNaoFiscal :=
        ecfHandle^.EventHandlers.OnDepoisSubtotalizaNaoFiscal;
      ecfHandle^.EventHandlers.OnDepoisSubtotalizaNaoFiscalCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnDepoisSubtotalizaNaoFiscal := nil;
      ecfHandle^.EventHandlers.OnDepoisSubtotalizaNaoFiscalCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnDepoisSuprimento(const ecfHandle: PECFHandle;
  const method: TSangriaSuprimentoCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnDepoisSuprimento := ecfHandle^.EventHandlers.OnDepoisSuprimento;
      ecfHandle^.EventHandlers.OnDepoisSuprimentoCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnDepoisSuprimento := nil;
      ecfHandle^.EventHandlers.OnDepoisSuprimentoCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnDepoisVendeItem(const ecfHandle: PECFHandle;
  const method: TVendeItemCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnDepoisVendeItem := ecfHandle^.EventHandlers.OnDepoisVendeItem;
      ecfHandle^.EventHandlers.OnDepoisVendeItemCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnDepoisVendeItem := nil;
      ecfHandle^.EventHandlers.OnDepoisVendeItemCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnErrorAbreCupom(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnErrorAbreCupom := ecfHandle^.EventHandlers.OnErrorAbreCupom;
      ecfHandle^.EventHandlers.OnErrorAbreCupomCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnErrorAbreCupom := nil;
      ecfHandle^.EventHandlers.OnErrorAbreCupomCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnErrorAbreCupomVinculado(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnErrorAbreCupomVinculado :=
        ecfHandle^.EventHandlers.OnErrorAbreCupomVinculado;
      ecfHandle^.EventHandlers.OnErrorAbreCupomVinculadoCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnErrorAbreCupomVinculado := nil;
      ecfHandle^.EventHandlers.OnErrorAbreCupomVinculadoCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnErrorAbreNaoFiscal(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnErrorAbreNaoFiscal :=
        ecfHandle^.EventHandlers.OnErrorAbreNaoFiscal;
      ecfHandle^.EventHandlers.OnErrorAbreNaoFiscalCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnErrorAbreNaoFiscal := nil;
      ecfHandle^.EventHandlers.OnErrorAbreNaoFiscalCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnErrorAbreRelatorioGerencial(const ecfHandle: PECFHandle;
  const method: TErrorRelatorioCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnErrorAbreRelatorioGerencial :=
        ecfHandle^.EventHandlers.OnErrorAbreRelatorioGerencial;
      ecfHandle^.EventHandlers.OnErrorAbreRelatorioGerencialCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnErrorAbreRelatorioGerencial := nil;
      ecfHandle^.EventHandlers.OnErrorAbreRelatorioGerencialCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnErrorCancelaCupom(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnErrorCancelaCupom := ecfHandle^.EventHandlers.OnErrorCancelaCupom;
      ecfHandle^.EventHandlers.OnErrorCancelaCupomCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnErrorCancelaCupom := nil;
      ecfHandle^.EventHandlers.OnErrorCancelaCupomCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnErrorCancelaItemNaoFiscal(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnErrorCancelaItemNaoFiscal :=
        ecfHandle^.EventHandlers.OnErrorCancelaItemNaoFiscal;
      ecfHandle^.EventHandlers.OnErrorCancelaItemNaoFiscalCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnErrorCancelaItemNaoFiscal := nil;
      ecfHandle^.EventHandlers.OnErrorCancelaItemNaoFiscalCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnErrorCancelaItemVendido(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnErrorCancelaItemVendido :=
        ecfHandle^.EventHandlers.OnErrorCancelaItemVendido;
      ecfHandle^.EventHandlers.OnErrorCancelaItemVendidoCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnErrorCancelaItemVendido := nil;
      ecfHandle^.EventHandlers.OnErrorCancelaItemVendidoCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnErrorCancelaNaoFiscal(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnErrorCancelaNaoFiscal :=
        ecfHandle^.EventHandlers.OnErrorCancelaNaoFiscal;
      ecfHandle^.EventHandlers.OnErrorCancelaNaoFiscalCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnErrorCancelaNaoFiscal := nil;
      ecfHandle^.EventHandlers.OnErrorCancelaNaoFiscalCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnErrorEfetuaPagamento(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnErrorEfetuaPagamento :=
        ecfHandle^.EventHandlers.OnErrorEfetuaPagamento;
      ecfHandle^.EventHandlers.OnErrorEfetuaPagamentoCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnErrorEfetuaPagamento := nil;
      ecfHandle^.EventHandlers.OnErrorEfetuaPagamentoCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnErrorEfetuaPagamentoNaoFiscal(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnErrorEfetuaPagamentoNaoFiscal :=
        ecfHandle^.EventHandlers.OnErrorEfetuaPagamentoNaoFiscal;
      ecfHandle^.EventHandlers.OnErrorEfetuaPagamentoNaoFiscalCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnErrorEfetuaPagamentoNaoFiscal := nil;
      ecfHandle^.EventHandlers.OnErrorEfetuaPagamentoNaoFiscalCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnErrorFechaCupom(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnErrorFechaCupom := ecfHandle^.EventHandlers.OnErrorFechaCupom;
      ecfHandle^.EventHandlers.OnErrorFechaCupomCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnErrorFechaCupom := nil;
      ecfHandle^.EventHandlers.OnErrorFechaCupomCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnErrorFechaNaoFiscal(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnErrorFechaNaoFiscal :=
        ecfHandle^.EventHandlers.OnErrorFechaNaoFiscal;
      ecfHandle^.EventHandlers.OnErrorFechaNaoFiscalCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnErrorFechaNaoFiscal := nil;
      ecfHandle^.EventHandlers.OnErrorFechaNaoFiscalCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnErrorFechaRelatorio(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnErrorFechaRelatorio :=
        ecfHandle^.EventHandlers.OnErrorFechaRelatorio;
      ecfHandle^.EventHandlers.OnErrorFechaRelatorioCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnErrorFechaRelatorio := nil;
      ecfHandle^.EventHandlers.OnErrorFechaRelatorioCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnErrorLeituraX(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnErrorLeituraX := ecfHandle^.EventHandlers.OnErrorLeituraX;
      ecfHandle^.EventHandlers.OnErrorLeituraXCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnErrorLeituraX := nil;
      ecfHandle^.EventHandlers.OnErrorLeituraXCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnErrorReducaoZ(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnErrorReducaoZ := ecfHandle^.EventHandlers.OnErrorReducaoZ;
      ecfHandle^.EventHandlers.OnErrorReducaoZCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnErrorReducaoZ := nil;
      ecfHandle^.EventHandlers.OnErrorReducaoZCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnErrorSangria(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnErrorSangria := ecfHandle^.EventHandlers.OnErrorSangria;
      ecfHandle^.EventHandlers.OnErrorSangriaCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnErrorSangria := nil;
      ecfHandle^.EventHandlers.OnErrorSangriaCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnErrorSemPapel(const ecfHandle: PECFHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnErrorSemPapel := ecfHandle^.EventHandlers.OnErrorSemPapel;
      ecfHandle^.EventHandlers.OnErrorSemPapelCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnErrorSemPapel := nil;
      ecfHandle^.EventHandlers.OnErrorSemPapelCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnErrorSubtotalizaCupom(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnErrorSubtotalizaCupom :=
        ecfHandle^.EventHandlers.OnErrorSubtotalizaCupom;
      ecfHandle^.EventHandlers.OnErrorSubtotalizaCupomCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnErrorSubtotalizaCupom := nil;
      ecfHandle^.EventHandlers.OnErrorSubtotalizaCupomCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnErrorSubtotalizaNaoFiscal(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnErrorSubtotalizaNaoFiscal :=
        ecfHandle^.EventHandlers.OnErrorSubtotalizaNaoFiscal;
      ecfHandle^.EventHandlers.OnErrorSubtotalizaNaoFiscalCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnErrorSubtotalizaNaoFiscal := nil;
      ecfHandle^.EventHandlers.OnErrorSubtotalizaNaoFiscalCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnErrorSuprimento(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnErrorSuprimento := ecfHandle^.EventHandlers.OnErrorSuprimento;
      ecfHandle^.EventHandlers.OnErrorSuprimentoCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnErrorSuprimento := nil;
      ecfHandle^.EventHandlers.OnErrorSuprimentoCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnErrorVendeItem(const ecfHandle: PECFHandle;
  const method: TBooleanCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnErrorVendeItem := ecfHandle^.EventHandlers.OnErrorVendeItem;
      ecfHandle^.EventHandlers.OnErrorVendeItemCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnErrorVendeItem := nil;
      ecfHandle^.EventHandlers.OnErrorVendeItemCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnMsgAguarde(const ecfHandle: PECFHandle;
  const method: TStringCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnMsgAguarde := ecfHandle^.EventHandlers.OnMsgAguarde;
      ecfHandle^.EventHandlers.OnMsgAguardeCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnMsgAguarde := nil;
      ecfHandle^.EventHandlers.OnMsgAguardeCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnMsgRetentar(const ecfHandle: PECFHandle;
  const method: TMsgRetentarCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnMsgRetentar := ecfHandle^.EventHandlers.OnMsgRetentar;
      ecfHandle^.EventHandlers.OnMsgRetentarCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnMsgRetentar := nil;
      ecfHandle^.EventHandlers.OnMsgRetentarCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnPAFCalcEAD(const ecfHandle: PECFHandle;
  const method: TStringCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnPAFCalcEAD := ecfHandle^.EventHandlers.OnPAFCalcEAD;
      ecfHandle^.EventHandlers.OnPAFCalcEADCallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnPAFCalcEAD := nil;
      ecfHandle^.EventHandlers.OnPAFCalcEADCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ECF_SetOnPAFGetKeyRSA(const ecfHandle: PECFHandle;
  const method: TRetStringCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ecfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ecfHandle^.ECF.OnPAFGetKeyRSA := ecfHandle^.EventHandlers.OnPAFGetKeyRSA;
      ecfHandle^.EventHandlers.OnPAFGetKeyRSACallback := method;
      Result := 0;
    end
    else
    begin
      ecfHandle^.ECF.OnPAFGetKeyRSA := nil;
      ecfHandle^.EventHandlers.OnPAFGetKeyRSACallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ecfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

end.
