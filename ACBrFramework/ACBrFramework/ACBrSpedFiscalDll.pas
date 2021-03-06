unit ACBrSpedFiscaldll;

interface

uses
  Classes,
  SysUtils,
  ACBrSpedDll,
  ACBrSpedFiscal,
  ACBrEFDBlocos,
  ACBrEFDBloco_0,
  ACBrHandlers;

{%region Declaração da funções}

{%region Create/Destroy/Erro}

function SPDF_Create(var spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Destroy(spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_GetUltimoErro(const spdfHandle: PSPDFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Funções mapeando as propriedades do componente }

function SPDF_GetAbout(const spdfHandle: PSPDFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_GetArquivo(const spdfHandle: PSPDFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_SetArquivo(const spdfHandle: PSPDFHandle;
  const Arquivo: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_GetCurMascara(const spdfHandle: PSPDFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_SetCurMascara(const spdfHandle: PSPDFHandle;
  const CurMascara: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_GetPath(const spdfHandle: PSPDFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_SetPath(const spdfHandle: PSPDFHandle; const Path: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_GetDelimitador(const spdfHandle: PSPDFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_SetDelimitador(const spdfHandle: PSPDFHandle;
  const Delimitador: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_GetLinhasBuffer(const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_SetLinhasBuffer(const spdfHandle: PSPDFHandle;
  const Linhas: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_GetTrimString(const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_SetTrimString(const spdfHandle: PSPDFHandle;
  const TrimString: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Funções mapeando as propriedades do componente não visiveis}

function SPDF_GetDT_INI(const spdfHandle: PSPDFHandle; var Data: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_SetDT_INI(const spdfHandle: PSPDFHandle; const Data: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_GetDT_FIN(const spdfHandle: PSPDFHandle; var Data: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_SetDT_FIN(const spdfHandle: PSPDFHandle; const Data: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Methods }

function SPDF_IniciaGeracao(const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_SaveFileTXT(const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Set Eventos }

function SPDF_SetOnError(const spdfHandle: PSPDFHandle;
  const method: TStringCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion Set Eventos }

{%region Bloco0}

function SPDF_Bloco_0_GetDT_INI(const spdfHandle: PSPDFHandle;
  var dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_0_SetDT_INI(const spdfHandle: PSPDFHandle;
  const dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_0_GetDT_FIN(const spdfHandle: PSPDFHandle;
  var dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_0_SetDT_FIN(const spdfHandle: PSPDFHandle;
  const dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_0_GetGravado(const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_0_Registro0000New(const spdfHandle: PSPDFHandle;
  const registro0000: Bloco0Registro0000): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_0_Registro0001New(const spdfHandle: PSPDFHandle;
  const registro0001: Bloco0Registro0001): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_0_Registro0005New(const spdfHandle: PSPDFHandle;
  const registro0005: Bloco0Registro0005): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_0_Registro0015New(const spdfHandle: PSPDFHandle;
  const registro0015: Bloco0Registro0015): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_0_Registro0100New(const spdfHandle: PSPDFHandle;
  const registro0100: Bloco0Registro0100): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_0_Registro0150New(const spdfHandle: PSPDFHandle;
  const registro0150: Bloco0Registro0150): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_0_Registro0175New(const spdfHandle: PSPDFHandle;
  const registro0175: Bloco0Registro0175): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_0_Registro0190New(const spdfHandle: PSPDFHandle;
  const registro0190: Bloco0Registro0190): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_0_Registro0200New(const spdfHandle: PSPDFHandle;
  const registro0200: Bloco0Registro0200): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_0_Registro0205New(const spdfHandle: PSPDFHandle;
  const registro0205: Bloco0Registro0205): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_0_Registro0206New(const spdfHandle: PSPDFHandle;
  const registro0206: Bloco0Registro0206): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_0_Registro0220New(const spdfHandle: PSPDFHandle;
  const registro0220: Bloco0Registro0220): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_0_Registro0300New(const spdfHandle: PSPDFHandle;
  const registro0300: Bloco0Registro0300): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_0_Registro0305New(const spdfHandle: PSPDFHandle;
  const registro0305: Bloco0Registro0305): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_0_Registro0400New(const spdfHandle: PSPDFHandle;
  const registro0400: Bloco0Registro0400): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_0_Registro0450New(const spdfHandle: PSPDFHandle;
  const registro0450: Bloco0Registro0450): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_0_Registro0460New(const spdfHandle: PSPDFHandle;
  const registro0460: Bloco0Registro0460): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_0_Registro0500New(const spdfHandle: PSPDFHandle;
  const registro0500: Bloco0Registro0500): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_0_Registro0600New(const spdfHandle: PSPDFHandle;
  const registro0600: Bloco0Registro0600): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_0_Registro0990_GetQTD_LIN_0(
  const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion Bloco0}

{%region Bloco1}

function SPDF_Bloco_1_GetDT_INI(const spdfHandle: PSPDFHandle;
  var dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_1_SetDT_INI(const spdfHandle: PSPDFHandle;
  const dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_1_GetDT_FIN(const spdfHandle: PSPDFHandle;
  var dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_1_SetDT_FIN(const spdfHandle: PSPDFHandle;
  const dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_1_GetGravado(const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_1_Registro1001New(const spdfHandle: PSPDFHandle;
  const registro1001: Bloco1Registro1001): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_1_Registro1010New(const spdfHandle: PSPDFHandle;
  const registro1010: Bloco1Registro1010): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_1_Registro1100New(const spdfHandle: PSPDFHandle;
  const registro1100: Bloco1Registro1100): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_1_Registro1105New(const spdfHandle: PSPDFHandle;
  const registro1105: Bloco1Registro1105): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_1_Registro1110New(const spdfHandle: PSPDFHandle;
  const registro1110: Bloco1Registro1110): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_1_Registro1200New(const spdfHandle: PSPDFHandle;
  const registro1200: Bloco1Registro1200): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_1_Registro1210New(const spdfHandle: PSPDFHandle;
  const registro1210: Bloco1Registro1210): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_1_Registro1300New(const spdfHandle: PSPDFHandle;
  const registro1300: Bloco1Registro1300): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_1_Registro1310New(const spdfHandle: PSPDFHandle;
  const registro1310: Bloco1Registro1310): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_1_Registro1320New(const spdfHandle: PSPDFHandle;
  const registro1320: Bloco1Registro1320): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_1_Registro1350New(const spdfHandle: PSPDFHandle;
  const registro1350: Bloco1Registro1350): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_1_Registro1360New(const spdfHandle: PSPDFHandle;
  const registro1360: Bloco1Registro1360): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_1_Registro1370New(const spdfHandle: PSPDFHandle;
  const registro1370: Bloco1Registro1370): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_1_Registro1390New(const spdfHandle: PSPDFHandle;
  const registro1390: Bloco1Registro1390): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_1_Registro1400New(const spdfHandle: PSPDFHandle;
  const registro1400: Bloco1Registro1400): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_1_Registro1500New(const spdfHandle: PSPDFHandle;
  const registro1500: Bloco1Registro1500): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_1_Registro1510New(const spdfHandle: PSPDFHandle;
  const registro1510: Bloco1Registro1510): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_1_Registro1600New(const spdfHandle: PSPDFHandle;
  const registro1600: Bloco1Registro1600): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_1_Registro1700New(const spdfHandle: PSPDFHandle;
  const registro1700: Bloco1Registro1700): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_1_Registro1710New(const spdfHandle: PSPDFHandle;
  const registro1710: Bloco1Registro1710): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_1_Registro1800New(const spdfHandle: PSPDFHandle;
  const registro1800: Bloco1Registro1800): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_1_Registro1990_GetQTD_LIN_1(
  const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion Bloco1}

{%region Bloco9}

function SPDF_Bloco_9_GetDT_INI(const spdfHandle: PSPDFHandle;
  var dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_9_SetDT_INI(const spdfHandle: PSPDFHandle;
  const dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_9_GetDT_FIN(const spdfHandle: PSPDFHandle;
  var dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_9_SetDT_FIN(const spdfHandle: PSPDFHandle;
  const dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_9_GetGravado(const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_9_Registro9001New(const spdfHandle: PSPDFHandle;
  const registro9001: Bloco9Registro9001): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_9_Registro9900New(const spdfHandle: PSPDFHandle;
  const registro9900: Bloco9Registro9900): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_9_Registro9990_GetQTD_LIN_9(
  const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_9_Registro9999_GetQTD_LIN(const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion Bloco9}

{%region BlocoC}

function SPDF_Bloco_C_GetDT_INI(const spdfHandle: PSPDFHandle;
  var dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_SetDT_INI(const spdfHandle: PSPDFHandle;
  const dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_GetDT_FIN(const spdfHandle: PSPDFHandle;
  var dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_SetDT_FIN(const spdfHandle: PSPDFHandle;
  const dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_GetGravado(const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC001New(const spdfHandle: PSPDFHandle;
  const registroC001: BlocoCRegistroC001): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC100New(const spdfHandle: PSPDFHandle;
  const registroC100: BlocoCRegistroC100): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC110New(const spdfHandle: PSPDFHandle;
  const registroC110: BlocoCRegistroC110): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC105New(const spdfHandle: PSPDFHandle;
  const registroC105: BlocoCRegistroC105): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC111New(const spdfHandle: PSPDFHandle;
  const registroC111: BlocoCRegistroC111): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC112New(const spdfHandle: PSPDFHandle;
  const registroC112: BlocoCRegistroC112): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC113New(const spdfHandle: PSPDFHandle;
  const registroC113: BlocoCRegistroC113): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC114New(const spdfHandle: PSPDFHandle;
  const registroC114: BlocoCRegistroC114): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC115New(const spdfHandle: PSPDFHandle;
  const registroC115: BlocoCRegistroC115): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC116New(const spdfHandle: PSPDFHandle;
  const registroC116: BlocoCRegistroC116): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC120New(const spdfHandle: PSPDFHandle;
  const registroC120: BlocoCRegistroC120): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC130New(const spdfHandle: PSPDFHandle;
  const registroC130: BlocoCRegistroC130): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC140New(const spdfHandle: PSPDFHandle;
  const registroC140: BlocoCRegistroC140): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC141New(const spdfHandle: PSPDFHandle;
  const registroC141: BlocoCRegistroC141): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC160New(const spdfHandle: PSPDFHandle;
  const registroC160: BlocoCRegistroC160): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC165New(const spdfHandle: PSPDFHandle;
  const registroC165: BlocoCRegistroC165): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC170New(const spdfHandle: PSPDFHandle;
  const registroC170: BlocoCRegistroC170): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC171New(const spdfHandle: PSPDFHandle;
  const registroC171: BlocoCRegistroC171): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC172New(const spdfHandle: PSPDFHandle;
  const registroC172: BlocoCRegistroC172): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC173New(const spdfHandle: PSPDFHandle;
  const registroC173: BlocoCRegistroC173): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC174New(const spdfHandle: PSPDFHandle;
  const registroC174: BlocoCRegistroC174): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC175New(const spdfHandle: PSPDFHandle;
  const registroC175: BlocoCRegistroC175): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC176New(const spdfHandle: PSPDFHandle;
  const registroC176: BlocoCRegistroC176): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC177New(const spdfHandle: PSPDFHandle;
  const registroC177: BlocoCRegistroC177): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC178New(const spdfHandle: PSPDFHandle;
  const registroC178: BlocoCRegistroC178): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC179New(const spdfHandle: PSPDFHandle;
  const registroC179: BlocoCRegistroC179): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC190New(const spdfHandle: PSPDFHandle;
  const registroC190: BlocoCRegistroC190): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC195New(const spdfHandle: PSPDFHandle;
  const registroC195: BlocoCRegistroC195): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC197New(const spdfHandle: PSPDFHandle;
  const registroC197: BlocoCRegistroC197): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC300New(const spdfHandle: PSPDFHandle;
  const registroC300: BlocoCRegistroC300): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC310New(const spdfHandle: PSPDFHandle;
  const registroC310: BlocoCRegistroC310): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC320New(const spdfHandle: PSPDFHandle;
  const registroC320: BlocoCRegistroC320): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC321New(const spdfHandle: PSPDFHandle;
  const registroC321: BlocoCRegistroC321): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC350New(const spdfHandle: PSPDFHandle;
  const registroC350: BlocoCRegistroC350): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC370New(const spdfHandle: PSPDFHandle;
  const registroC370: BlocoCRegistroC370): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC390New(const spdfHandle: PSPDFHandle;
  const registroC390: BlocoCRegistroC390): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC400New(const spdfHandle: PSPDFHandle;
  const registroC400: BlocoCRegistroC400): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC405New(const spdfHandle: PSPDFHandle;
  const registroC405: BlocoCRegistroC405): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC410New(const spdfHandle: PSPDFHandle;
  const registroC410: BlocoCRegistroC410): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC420New(const spdfHandle: PSPDFHandle;
  const registroC420: BlocoCRegistroC420): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC425New(const spdfHandle: PSPDFHandle;
  const registroC425: BlocoCRegistroC425): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC460New(const spdfHandle: PSPDFHandle;
  const registroC460: BlocoCRegistroC460): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC470New(const spdfHandle: PSPDFHandle;
  const registroC470: BlocoCRegistroC470): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC490New(const spdfHandle: PSPDFHandle;
  const registroC490: BlocoCRegistroC490): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC495New(const spdfHandle: PSPDFHandle;
  const registroC495: BlocoCRegistroC495): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC500New(const spdfHandle: PSPDFHandle;
  const registroC500: BlocoCRegistroC500): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC510New(const spdfHandle: PSPDFHandle;
  const registroC510: BlocoCRegistroC510): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC590New(const spdfHandle: PSPDFHandle;
  const registroC590: BlocoCRegistroC590): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC600New(const spdfHandle: PSPDFHandle;
  const registroC600: BlocoCRegistroC600): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC601New(const spdfHandle: PSPDFHandle;
  const registroC601: BlocoCRegistroC601): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC610New(const spdfHandle: PSPDFHandle;
  const registroC610: BlocoCRegistroC610): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC690New(const spdfHandle: PSPDFHandle;
  const registroC690: BlocoCRegistroC690): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC700New(const spdfHandle: PSPDFHandle;
  const registroC700: BlocoCRegistroC700): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC790New(const spdfHandle: PSPDFHandle;
  const registroC790: BlocoCRegistroC790): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC791New(const spdfHandle: PSPDFHandle;
  const registroC791: BlocoCRegistroC791): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC800New(const spdfHandle: PSPDFHandle;
  const registroC800: BlocoCRegistroC800): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC850New(const spdfHandle: PSPDFHandle;
  const registroC850: BlocoCRegistroC850): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC860New(const spdfHandle: PSPDFHandle;
  const registroC860: BlocoCRegistroC860): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC890New(const spdfHandle: PSPDFHandle;
  const registroC890: BlocoCRegistroC890): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_C_RegistroC990_GetQTD_LIN_C(
  const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion BlocoC}

{%region BlocoD}

function SPDF_Bloco_D_GetDT_INI(const spdfHandle: PSPDFHandle;
  var dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_SetDT_INI(const spdfHandle: PSPDFHandle;
  const dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_GetDT_FIN(const spdfHandle: PSPDFHandle;
  var dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_SetDT_FIN(const spdfHandle: PSPDFHandle;
  const dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_GetGravado(const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD001New(const spdfHandle: PSPDFHandle;
  const registroD001: BlocoDRegistroD001): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD100New(const spdfHandle: PSPDFHandle;
  const registroD100: BlocoDRegistroD100): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD110New(const spdfHandle: PSPDFHandle;
  const registroD110: BlocoDRegistroD110): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD120New(const spdfHandle: PSPDFHandle;
  const registroD120: BlocoDRegistroD120): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD130New(const spdfHandle: PSPDFHandle;
  const registroD130: BlocoDRegistroD130): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD140New(const spdfHandle: PSPDFHandle;
  const registroD140: BlocoDRegistroD140): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD150New(const spdfHandle: PSPDFHandle;
  const registroD150: BlocoDRegistroD150): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD160New(const spdfHandle: PSPDFHandle;
  const registroD160: BlocoDRegistroD160): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD161New(const spdfHandle: PSPDFHandle;
  const registroD161: BlocoDRegistroD161): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD162New(const spdfHandle: PSPDFHandle;
  const registroD162: BlocoDRegistroD162): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD170New(const spdfHandle: PSPDFHandle;
  const registroD170: BlocoDRegistroD170): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD180New(const spdfHandle: PSPDFHandle;
  const registroD180: BlocoDRegistroD180): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD190New(const spdfHandle: PSPDFHandle;
  const registroD190: BlocoDRegistroD190): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD195New(const spdfHandle: PSPDFHandle;
  const registroD195: BlocoDRegistroD195): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD197New(const spdfHandle: PSPDFHandle;
  const registroD197: BlocoDRegistroD197): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD300New(const spdfHandle: PSPDFHandle;
  const registroD300: BlocoDRegistroD300): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD301New(const spdfHandle: PSPDFHandle;
  const registroD301: BlocoDRegistroD301): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD310New(const spdfHandle: PSPDFHandle;
  const registroD310: BlocoDRegistroD310): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD350New(const spdfHandle: PSPDFHandle;
  const registroD350: BlocoDRegistroD350): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD355New(const spdfHandle: PSPDFHandle;
  const registroD355: BlocoDRegistroD355): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD360New(const spdfHandle: PSPDFHandle;
  const registroD360: BlocoDRegistroD360): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD365New(const spdfHandle: PSPDFHandle;
  const registroD365: BlocoDRegistroD365): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD370New(const spdfHandle: PSPDFHandle;
  const registroD370: BlocoDRegistroD370): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD390New(const spdfHandle: PSPDFHandle;
  const registroD390: BlocoDRegistroD390): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD400New(const spdfHandle: PSPDFHandle;
  const registroD400: BlocoDRegistroD400): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD410New(const spdfHandle: PSPDFHandle;
  const registroD410: BlocoDRegistroD410): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD411New(const spdfHandle: PSPDFHandle;
  const registroD411: BlocoDRegistroD411): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD420New(const spdfHandle: PSPDFHandle;
  const registroD420: BlocoDRegistroD420): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD500New(const spdfHandle: PSPDFHandle;
  const registroD500: BlocoDRegistroD500): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD510New(const spdfHandle: PSPDFHandle;
  const registroD510: BlocoDRegistroD510): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD530New(const spdfHandle: PSPDFHandle;
  const registroD530: BlocoDRegistroD530): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD590New(const spdfHandle: PSPDFHandle;
  const registroD590: BlocoDRegistroD590): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD600New(const spdfHandle: PSPDFHandle;
  const registroD600: BlocoDRegistroD600): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD610New(const spdfHandle: PSPDFHandle;
  const registroD610: BlocoDRegistroD610): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD690New(const spdfHandle: PSPDFHandle;
  const registroD690: BlocoDRegistroD690): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD695New(const spdfHandle: PSPDFHandle;
  const registroD695: BlocoDRegistroD695): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD696New(const spdfHandle: PSPDFHandle;
  const registroD696: BlocoDRegistroD696): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD697New(const spdfHandle: PSPDFHandle;
  const registroD697: BlocoDRegistroD697): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_D_RegistroD990_GetQTD_LIN_D(
  const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion BlocoD}

{%region BlocoE}

function SPDF_Bloco_E_GetDT_INI(const spdfHandle: PSPDFHandle;
  var dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_E_SetDT_INI(const spdfHandle: PSPDFHandle;
  const dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_E_GetDT_FIN(const spdfHandle: PSPDFHandle;
  var dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_E_SetDT_FIN(const spdfHandle: PSPDFHandle;
  const dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_E_GetGravado(const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_E_RegistroE001New(const spdfHandle: PSPDFHandle;
  const registroE001: BlocoERegistroE001): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_E_RegistroE100New(const spdfHandle: PSPDFHandle;
  const registroE100: BlocoERegistroE100): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_E_RegistroE110New(const spdfHandle: PSPDFHandle;
  const registroE110: BlocoERegistroE110): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_E_RegistroE111New(const spdfHandle: PSPDFHandle;
  const registroE111: BlocoERegistroE111): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_E_RegistroE112New(const spdfHandle: PSPDFHandle;
  const registroE112: BlocoERegistroE112): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_E_RegistroE113New(const spdfHandle: PSPDFHandle;
  const registroE113: BlocoERegistroE113): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_E_RegistroE115New(const spdfHandle: PSPDFHandle;
  const registroE115: BlocoERegistroE115): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_E_RegistroE116New(const spdfHandle: PSPDFHandle;
  const registroE116: BlocoERegistroE116): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_E_RegistroE200New(const spdfHandle: PSPDFHandle;
  const registroE200: BlocoERegistroE200): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_E_RegistroE210New(const spdfHandle: PSPDFHandle;
  const registroE210: BlocoERegistroE210): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_E_RegistroE220New(const spdfHandle: PSPDFHandle;
  const registroE220: BlocoERegistroE220): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_E_RegistroE230New(const spdfHandle: PSPDFHandle;
  const registroE230: BlocoERegistroE230): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_E_RegistroE240New(const spdfHandle: PSPDFHandle;
  const registroE240: BlocoERegistroE240): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_E_RegistroE250New(const spdfHandle: PSPDFHandle;
  const registroE250: BlocoERegistroE250): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_E_RegistroE500New(const spdfHandle: PSPDFHandle;
  const registroE500: BlocoERegistroE500): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_E_RegistroE510New(const spdfHandle: PSPDFHandle;
  const registroE510: BlocoERegistroE510): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_E_RegistroE520New(const spdfHandle: PSPDFHandle;
  const registroE520: BlocoERegistroE520): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_E_RegistroE530New(const spdfHandle: PSPDFHandle;
  const registroE530: BlocoERegistroE530): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_E_RegistroE990_GetQTD_LIN_E(
  const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion BlocoE}

{%region BlocoG}

function SPDF_Bloco_G_GetDT_INI(const spdfHandle: PSPDFHandle;
  var dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_G_SetDT_INI(const spdfHandle: PSPDFHandle;
  const dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_G_GetDT_FIN(const spdfHandle: PSPDFHandle;
  var dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_G_SetDT_FIN(const spdfHandle: PSPDFHandle;
  const dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_G_GetGravado(const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_G_RegistroG001New(const spdfHandle: PSPDFHandle;
  const registroG001: BlocoGRegistroG001): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_G_RegistroG110New(const spdfHandle: PSPDFHandle;
  const registroG110: BlocoGRegistroG110): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_G_RegistroG125New(const spdfHandle: PSPDFHandle;
  const registroG125: BlocoGRegistroG125): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_G_RegistroG126New(const spdfHandle: PSPDFHandle;
  const registroG126: BlocoGRegistroG126): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_G_RegistroG130New(const spdfHandle: PSPDFHandle;
  const registroG130: BlocoGRegistroG130): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_G_RegistroG140New(const spdfHandle: PSPDFHandle;
  const registroG140: BlocoGRegistroG140): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_G_RegistroG990_GetQTD_LIN_G(
  const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion BlocoG}

{%region BlocoH}

function SPDF_Bloco_H_GetDT_INI(const spdfHandle: PSPDFHandle;
  var dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_H_SetDT_INI(const spdfHandle: PSPDFHandle;
  const dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_H_GetDT_FIN(const spdfHandle: PSPDFHandle;
  var dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_H_SetDT_FIN(const spdfHandle: PSPDFHandle;
  const dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_H_GetGravado(const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_H_RegistroH001New(const spdfHandle: PSPDFHandle;
  const registroH001: BlocoHRegistroH001): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_H_RegistroH005New(const spdfHandle: PSPDFHandle;
  const registroH005: BlocoHRegistroH005): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_H_RegistroH010New(const spdfHandle: PSPDFHandle;
  const registroH010: BlocoHRegistroH010): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_H_RegistroH020New(const spdfHandle: PSPDFHandle;
  const registroH020: BlocoHRegistroH020): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SPDF_Bloco_H_RegistroH990_GetQTD_LIN_H(
  const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion BlocoH}

{%endregion}

implementation

{%region Create/Destroy/Erro}
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
CRIA um novo componente TACBrSPEDFiscal retornando o ponteiro para o objeto criado.
Este ponteiro deve ser armazenado pela aplicação que utiliza a DLL e informado
em todas as chamadas de função relativas ao TACBrPAF.
}
function SPDF_Create(var spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try
    New(spdfHandle);
    spdfHandle^.SPEDFiscal := TACBrSPEDFiscal.Create(nil);
    spdfHandle^.EventHandlers := TEventHandlersSPDF.Create();
    spdfHandle^.UltimoErro := '';
    Result := 0;
  except
    on Exception: Exception do
    begin
      Result := -1;
      spdfHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

{
DESTRÓI o objeto TACBrSPEDFiscal e libera a memória utilizada.
Esta função deve SEMPRE ser chamada pela aplicação que utiliza a DLL
quando o componente não mais for utilizado.
}
function SPDF_Destroy(spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    spdfHandle^.SPEDFiscal.Destroy();
    spdfHandle^.SPEDFiscal := nil;

    Dispose(spdfHandle);
    spdfHandle := nil;
    Result := 0;

  except
    on Exception: Exception do
    begin
      Result := -1;
      spdfHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

function SPDF_GetUltimoErro(const spdfHandle: PSPDFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try
    StrPLCopy(Buffer, spdfHandle^.UltimoErro, BufferLen);
    Result := length(spdfHandle^.UltimoErro);
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Funções mapeando as propriedades do componente }

function SPDF_GetAbout(const spdfHandle: PSPDFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := spdfHandle^.SPEDFiscal.About;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SPDF_GetArquivo(const spdfHandle: PSPDFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := spdfHandle^.SPEDFiscal.Arquivo;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SPDF_SetArquivo(const spdfHandle: PSPDFHandle;
  const Arquivo: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    spdfHandle^.SPEDFiscal.Arquivo := Arquivo;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SPDF_GetCurMascara(const spdfHandle: PSPDFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := spdfHandle^.SPEDFiscal.CurMascara;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SPDF_SetCurMascara(const spdfHandle: PSPDFHandle;
  const CurMascara: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    spdfHandle^.SPEDFiscal.CurMascara := CurMascara;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SPDF_GetPath(const spdfHandle: PSPDFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := spdfHandle^.SPEDFiscal.Path;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SPDF_SetPath(const spdfHandle: PSPDFHandle; const Path: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    spdfHandle^.SPEDFiscal.Path := Path;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SPDF_GetDelimitador(const spdfHandle: PSPDFHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := spdfHandle^.SPEDFiscal.Delimitador;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SPDF_SetDelimitador(const spdfHandle: PSPDFHandle;
  const Delimitador: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    spdfHandle^.SPEDFiscal.Delimitador := Delimitador;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SPDF_GetLinhasBuffer(const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := spdfHandle^.SPEDFiscal.LinhasBuffer;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_SetLinhasBuffer(const spdfHandle: PSPDFHandle;
  const Linhas: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    spdfHandle^.SPEDFiscal.LinhasBuffer := Linhas;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_GetTrimString(const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if spdfHandle^.SPEDFiscal.TrimString then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_SetTrimString(const spdfHandle: PSPDFHandle;
  const TrimString: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    spdfHandle^.SPEDFiscal.TrimString := TrimString;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Funções mapeando as propriedades do componente não visiveis}

function SPDF_GetDT_INI(const spdfHandle: PSPDFHandle; var Data: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Data := double(spdfHandle^.SPEDFiscal.DT_INI);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_SetDT_INI(const spdfHandle: PSPDFHandle; const Data: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    spdfHandle^.SPEDFiscal.DT_INI := Data;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_GetDT_FIN(const spdfHandle: PSPDFHandle; var Data: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Data := double(spdfHandle^.SPEDFiscal.DT_FIN);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_SetDT_FIN(const spdfHandle: PSPDFHandle; const Data: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    spdfHandle^.SPEDFiscal.DT_FIN := Data;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Methods }

function SPDF_IniciaGeracao(const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  OldSeparator : Char;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  OldSeparator := DefaultFormatSettings.DecimalSeparator;

  try
    DefaultFormatSettings.DecimalSeparator := ',';
    spdfHandle^.SPEDFiscal.IniciaGeracao;
    DefaultFormatSettings.DecimalSeparator := OldSeparator;
    Result := 0;
  except
    on Exception: Exception do
    begin
      DefaultFormatSettings.DecimalSeparator := OldSeparator;
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_SaveFileTXT(const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    spdfHandle^.SPEDFiscal.SaveFileTXT;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Set Eventos }

function SPDF_SetOnError(const spdfHandle: PSPDFHandle;
  const method: TStringCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      spdfHandle^.SPEDFiscal.OnError := spdfHandle^.EventHandlers.OnError;
      spdfHandle^.EventHandlers.OnErrorCallback := method;
      Result := 0;
    end
    else
    begin
      spdfHandle^.SPEDFiscal.OnError := nil;
      spdfHandle^.EventHandlers.OnErrorCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion Set Eventos }

{%region Bloco0}

function SPDF_Bloco_0_GetDT_INI(const spdfHandle: PSPDFHandle;
  var dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    dtIni := double(spdfHandle^.SPEDFiscal.Bloco_0.DT_INI);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_0_SetDT_INI(const spdfHandle: PSPDFHandle;
  const dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    spdfHandle^.SPEDFiscal.Bloco_0.DT_INI := TDateTime(dtIni);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_0_GetDT_FIN(const spdfHandle: PSPDFHandle;
  var dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    dtFin := double(spdfHandle^.SPEDFiscal.Bloco_0.DT_FIN);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_0_SetDT_FIN(const spdfHandle: PSPDFHandle;
  const dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    spdfHandle^.SPEDFiscal.Bloco_0.DT_FIN := TDateTime(dtFin);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_0_GetGravado(const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if spdfHandle^.SPEDFiscal.Bloco_0.Gravado then
      Result := 1
    else
      Result := 0;

  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_0_Registro0000New(const spdfHandle: PSPDFHandle;
  const registro0000: Bloco0Registro0000): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_0.Registro0000New do
    begin

      COD_VER := TACBrVersaoLeiaute(registro0000.COD_VER);
      COD_FIN := TACBrCodFinalidade(registro0000.COD_FIN);
      DT_INI := TDateTime(registro0000.DT_INI);
      DT_FIN := TDateTime(registro0000.DT_FIN);
      NOME := registro0000.NOME;
      CNPJ := registro0000.CNPJ;
      CPF := registro0000.CPF;
      UF := registro0000.UF;
      IE := registro0000.IE;
      COD_MUN := registro0000.COD_MUN;
      IM := registro0000.IM;
      SUFRAMA := registro0000.SUFRAMA;
      IND_PERFIL := TACBrPerfil(registro0000.IND_PERFIL);
      IND_ATIV := TACBrAtividade(registro0000.IND_ATIV);

    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_0_Registro0001New(const spdfHandle: PSPDFHandle;
  const registro0001: Bloco0Registro0001): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_0.Registro0001New do
    begin
      IND_MOV := TACBrIndicadorMovimento(registro0001.IND_MOV);
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_0_Registro0005New(const spdfHandle: PSPDFHandle;
  const registro0005: Bloco0Registro0005): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_0.Registro0005New do
    begin

      FANTASIA := registro0005.FANTASIA;
      CEP := registro0005.CEP;
      ENDERECO := registro0005.ENDERECO;
      NUM := registro0005.NUM;
      COMPL := registro0005.COMPL;
      BAIRRO := registro0005.BAIRRO;
      FONE := registro0005.FONE;
      FAX := registro0005.FAX;
      EMAIL := registro0005.EMAIL;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_0_Registro0015New(const spdfHandle: PSPDFHandle;
  const registro0015: Bloco0Registro0015): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_0.Registro0015New do
    begin

      UF_ST := registro0015.UF_ST;
      IE_ST := registro0015.IE_ST;

    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_0_Registro0100New(const spdfHandle: PSPDFHandle;
  const registro0100: Bloco0Registro0100): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_0.Registro0100New do
    begin

      NOME := registro0100.NOME;
      CPF := registro0100.CPF;
      CRC := registro0100.CRC;
      CNPJ := registro0100.CNPJ;
      CEP := registro0100.CEP;
      ENDERECO := registro0100.ENDERECO;
      NUM := registro0100.NUM;
      COMPL := registro0100.COMPL;
      BAIRRO := registro0100.BAIRRO;
      FONE := registro0100.FONE;
      FAX := registro0100.FAX;
      EMAIL := registro0100.EMAIL;
      COD_MUN := registro0100.COD_MUN;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_0_Registro0150New(const spdfHandle: PSPDFHandle;
  const registro0150: Bloco0Registro0150): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    with spdfHandle^.SPEDFiscal.Bloco_0.Registro0150New do
    begin

      COD_PART := registro0150.COD_PART;
      NOME := registro0150.NOME;
      COD_PAIS := registro0150.COD_PAIS;
      CNPJ := registro0150.CNPJ;
      CPF := registro0150.CPF;
      IE := registro0150.IE;
      COD_MUN := registro0150.COD_MUN;
      SUFRAMA := registro0150.SUFRAMA;
      ENDERECO := registro0150.ENDERECO;
      NUM := registro0150.NUM;
      COMPL := registro0150.COMPL;
      BAIRRO := registro0150.BAIRRO;

    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_0_Registro0175New(const spdfHandle: PSPDFHandle;
  const registro0175: Bloco0Registro0175): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    with spdfHandle^.SPEDFiscal.Bloco_0.Registro0175New do
    begin

      DT_ALT := TDateTime(registro0175.DT_ALT);
      NR_CAMPO := registro0175.NR_CAMPO;
      CONT_ANT := registro0175.CONT_ANT;

    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_0_Registro0190New(const spdfHandle: PSPDFHandle;
  const registro0190: Bloco0Registro0190): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    with spdfHandle^.SPEDFiscal.Bloco_0.Registro0190New do
    begin

      UNID := registro0190.UNID;
      DESCR := registro0190.DESCR;

    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_0_Registro0200New(const spdfHandle: PSPDFHandle;
  const registro0200: Bloco0Registro0200): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    with spdfHandle^.SPEDFiscal.Bloco_0.Registro0200New do
    begin

      COD_ITEM := registro0200.COD_ITEM;
      DESCR_ITEM := registro0200.DESCR_ITEM;
      COD_BARRA := registro0200.COD_BARRA;
      COD_ANT_ITEM := registro0200.COD_ANT_ITEM;
      UNID_INV := registro0200.UNID_INV;
      TIPO_ITEM := TACBrTipoItem(registro0200.TIPO_ITEM);
      COD_NCM := registro0200.COD_NCM;
      EX_IPI := registro0200.EX_IPI;
      COD_GEN := registro0200.COD_GEN;
      COD_LST := registro0200.COD_LST;
      ALIQ_ICMS := registro0200.ALIQ_ICMS;

    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_0_Registro0205New(const spdfHandle: PSPDFHandle;
  const registro0205: Bloco0Registro0205): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    with spdfHandle^.SPEDFiscal.Bloco_0.Registro0205New do
    begin

      DESCR_ANT_ITEM := registro0205.DESCR_ANT_ITEM;
      DT_INI := TDateTime(registro0205.DT_INI);
      DT_FIN := TDateTime(registro0205.DT_FIN);
      COD_ANT_ITEM := registro0205.COD_ANT_ITEM;

    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_0_Registro0206New(const spdfHandle: PSPDFHandle;
  const registro0206: Bloco0Registro0206): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    with spdfHandle^.SPEDFiscal.Bloco_0.Registro0206New do
    begin

      COD_COMB := registro0206.COD_COMB;

    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_0_Registro0220New(const spdfHandle: PSPDFHandle;
  const registro0220: Bloco0Registro0220): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    with spdfHandle^.SPEDFiscal.Bloco_0.Registro0220New do
    begin

      UNID_CONV := registro0220.UNID_CONV;
      FAT_CONV := registro0220.FAT_CONV;

    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_0_Registro0300New(const spdfHandle: PSPDFHandle;
  const registro0300: Bloco0Registro0300): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    with spdfHandle^.SPEDFiscal.Bloco_0.Registro0300New do
    begin
      COD_IND_BEM := registro0300.COD_IND_BEM;
      IDENT_MERC := registro0300.IDENT_MERC;
      DESCR_ITEM := registro0300.DESCR_ITEM;
      COD_PRNC := registro0300.COD_PRNC;
      COD_CTA := registro0300.COD_CTA;
      NR_PARC := registro0300.NR_PARC;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_0_Registro0305New(const spdfHandle: PSPDFHandle;
  const registro0305: Bloco0Registro0305): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    with spdfHandle^.SPEDFiscal.Bloco_0.Registro0305New do
    begin

      COD_CCUS := registro0305.COD_CCUS;
      FUNC := registro0305.FUNC;
      VIDA_UTIL := registro0305.VIDA_UTIL;

    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_0_Registro0400New(const spdfHandle: PSPDFHandle;
  const registro0400: Bloco0Registro0400): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    with spdfHandle^.SPEDFiscal.Bloco_0.Registro0400New do
    begin

      COD_NAT := registro0400.COD_NAT;
      DESCR_NAT := registro0400.DESCR_NAT;

    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_0_Registro0450New(const spdfHandle: PSPDFHandle;
  const registro0450: Bloco0Registro0450): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    with spdfHandle^.SPEDFiscal.Bloco_0.Registro0450New do
    begin

      COD_INF := registro0450.COD_INF;
      TXT := registro0450.TXT;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_0_Registro0460New(const spdfHandle: PSPDFHandle;
  const registro0460: Bloco0Registro0460): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    with spdfHandle^.SPEDFiscal.Bloco_0.Registro0460New do
    begin

      COD_OBS := registro0460.COD_OBS;
      TXT := registro0460.TXT;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_0_Registro0500New(const spdfHandle: PSPDFHandle;
  const registro0500: Bloco0Registro0500): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_0.Registro0500New do
    begin
      DT_ALT := TDateTime(registro0500.DT_ALT);
      COD_NAT_CC := registro0500.COD_NAT_CC;
      IND_CTA := registro0500.IND_CTA;
      NIVEL := registro0500.NIVEL;
      COD_CTA := registro0500.COD_CTA;
      NOME_CTA := registro0500.NOME_CTA;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_0_Registro0600New(const spdfHandle: PSPDFHandle;
  const registro0600: Bloco0Registro0600): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_0.Registro0600New do
    begin
      DT_ALT := TDateTime(registro0600.DT_ALT);
      COD_CCUS := registro0600.COD_CCUS;
      CCUS := registro0600.CCUS;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_0_Registro0990_GetQTD_LIN_0(
  const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := spdfHandle^.SPEDFiscal.Bloco_0.Registro0990.QTD_LIN_0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion Bloco0}

{%region Bloco1}

function SPDF_Bloco_1_GetDT_INI(const spdfHandle: PSPDFHandle;
  var dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    dtIni := double(spdfHandle^.SPEDFiscal.Bloco_1.DT_INI);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_1_SetDT_INI(const spdfHandle: PSPDFHandle;
  const dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    spdfHandle^.SPEDFiscal.Bloco_1.DT_INI := TDateTime(dtIni);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_1_GetDT_FIN(const spdfHandle: PSPDFHandle;
  var dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    dtFin := double(spdfHandle^.SPEDFiscal.Bloco_1.DT_FIN);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_1_SetDT_FIN(const spdfHandle: PSPDFHandle;
  const dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    spdfHandle^.SPEDFiscal.Bloco_1.DT_FIN := TDateTime(dtFin);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_1_GetGravado(const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if spdfHandle^.SPEDFiscal.Bloco_1.Gravado then
      Result := 1
    else
      Result := 0;

  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_1_Registro1001New(const spdfHandle: PSPDFHandle;
  const registro1001: Bloco1Registro1001): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_1.Registro1001New do
    begin
      IND_MOV := TACBrIndicadorMovimento(registro1001.IND_MOV);
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_1_Registro1010New(const spdfHandle: PSPDFHandle;
  const registro1010: Bloco1Registro1010): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_1.Registro1010New do
    begin

      IND_EXP := registro1010.IND_EXP;
      IND_CCRF := registro1010.IND_CCRF;
      IND_COMB := registro1010.IND_COMB;
      IND_USINA := registro1010.IND_USINA;
      IND_VA := registro1010.IND_VA;
      IND_EE := registro1010.IND_EE;
      IND_CART := registro1010.IND_CART;
      IND_FORM := registro1010.IND_FORM;
      IND_AER := registro1010.IND_AER;

    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_1_Registro1100New(const spdfHandle: PSPDFHandle;
  const registro1100: Bloco1Registro1100): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_1.Registro1100New do
    begin
      IND_DOC := TACBrTipoDocto(registro1100.IND_DOC);
      NRO_DE := registro1100.NRO_DE;
      DT_DE := TDateTime(registro1100.DT_DE);
      NAT_EXP := TACBrExportacao(registro1100.NAT_EXP);
      NRO_RE := registro1100.NRO_RE;
      DT_RE := TDateTime(registro1100.DT_RE);
      CHC_EMB := registro1100.CHC_EMB;
      DT_CHC := TDateTime(registro1100.DT_CHC);
      DT_AVB := TDateTime(registro1100.DT_AVB);
      TP_CHC := TACBrConhecEmbarque(registro1100.TP_CHC);
      PAIS := registro1100.PAIS;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_1_Registro1105New(const spdfHandle: PSPDFHandle;
  const registro1105: Bloco1Registro1105): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_1.Registro1105New do
    begin
      COD_MOD := registro1105.COD_MOD;
      SERIE := registro1105.SERIE;
      NUM_DOC := registro1105.NUM_DOC;
      CHV_NFE := registro1105.CHV_NFE;
      DT_DOC := TDateTime(registro1105.DT_DOC);
      COD_ITEM := registro1105.COD_ITEM;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_1_Registro1110New(const spdfHandle: PSPDFHandle;
  const registro1110: Bloco1Registro1110): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_1.Registro1110New do
    begin
      COD_PART := registro1110.COD_PART;
      COD_MOD := registro1110.COD_MOD;
      SER := registro1110.SER;
      NUM_DOC := registro1110.NUM_DOC;
      DT_DOC := TDateTime(registro1110.DT_DOC);
      CHV_NFE := registro1110.CHV_NFE;
      NR_MEMO := registro1110.NR_MEMO;
      QTD := registro1110.QTD;
      UNID := registro1110.UNID;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_1_Registro1200New(const spdfHandle: PSPDFHandle;
  const registro1200: Bloco1Registro1200): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_1.Registro1200New do
    begin
      COD_AJ_APUR := registro1200.COD_AJ_APUR;
      SLD_CRED := registro1200.SLD_CRED;
      CRED_APR := registro1200.CRED_APR;
      CRED_RECEB := registro1200.CRED_RECEB;
      CRED_UTIL := registro1200.CRED_UTIL;
      SLD_CRED_FIM := registro1200.SLD_CRED_FIM;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_1_Registro1210New(const spdfHandle: PSPDFHandle;
  const registro1210: Bloco1Registro1210): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_1.Registro1210New do
    begin
      TIPO_UTIL := registro1210.TIPO_UTIL;
      NR_DOC := registro1210.NR_DOC;
      VL_CRED_UTIL := registro1210.VL_CRED_UTIL;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_1_Registro1300New(const spdfHandle: PSPDFHandle;
  const registro1300: Bloco1Registro1300): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_1.Registro1300New do
    begin
      COD_ITEM := registro1300.COD_ITEM;
      DT_FECH := TDateTime(registro1300.DT_FECH);
      ESTQ_ABERT := registro1300.ESTQ_ABERT;
      VOL_ENTR := registro1300.VOL_ENTR;
      VOL_DISP := registro1300.VOL_DISP;
      VOL_SAIDAS := registro1300.VOL_SAIDAS;
      ESTQ_ESCR := registro1300.ESTQ_ESCR;
      VAL_AJ_PERDA := registro1300.VAL_AJ_PERDA;
      VAL_AJ_GANHO := registro1300.VAL_AJ_GANHO;
      FECH_FISICO := registro1300.FECH_FISICO;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_1_Registro1310New(const spdfHandle: PSPDFHandle;
  const registro1310: Bloco1Registro1310): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_1.Registro1310New do
    begin
      NUM_TANQUE := registro1310.NUM_TANQUE;
      ESTQ_ABERT := registro1310.ESTQ_ABERT;
      VOL_ENTR := registro1310.VOL_ENTR;
      VOL_DISP := registro1310.VOL_DISP;
      VOL_SAIDAS := registro1310.VOL_SAIDAS;
      ESTQ_ESCR := registro1310.ESTQ_ESCR;
      VAL_AJ_PERDA := registro1310.VAL_AJ_PERDA;
      VAL_AJ_GANHO := registro1310.VAL_AJ_GANHO;
      FECH_FISICO := registro1310.FECH_FISICO;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_1_Registro1320New(const spdfHandle: PSPDFHandle;
  const registro1320: Bloco1Registro1320): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_1.Registro1320New do
    begin
      NUM_BICO := registro1320.NUM_BICO;
      NR_INTERV := registro1320.NR_INTERV;
      MOT_INTERV := registro1320.MOT_INTERV;
      NOM_INTERV := registro1320.NOM_INTERV;
      CNPJ_INTERV := registro1320.CNPJ_INTERV;
      CPF_INTERV := registro1320.CPF_INTERV;
      VAL_FECHA := registro1320.VAL_FECHA;
      VAL_ABERT := registro1320.VAL_ABERT;
      VOL_AFERI := registro1320.VOL_AFERI;
      VOL_VENDAS := registro1320.VOL_VENDAS;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_1_Registro1350New(const spdfHandle: PSPDFHandle;
  const registro1350: Bloco1Registro1350): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_1.Registro1350New do
    begin
      SERIE := registro1350.SERIE;
      FABRICANTE := registro1350.FABRICANTE;
      MODELO := registro1350.MODELO;
      TIPO_MEDICAO := TACBrMedicao(registro1350.TIPO_MEDICAO);
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_1_Registro1360New(const spdfHandle: PSPDFHandle;
  const registro1360: Bloco1Registro1360): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_1.Registro1360New do
    begin
      NUM_LACRE := registro1360.NUM_LACRE;
      DT_APLICACAO := TDateTime(registro1360.DT_APLICACAO);
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_1_Registro1370New(const spdfHandle: PSPDFHandle;
  const registro1370: Bloco1Registro1370): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_1.Registro1370New do
    begin
      NUM_BICO := registro1370.NUM_BICO;
      COD_ITEM := registro1370.COD_ITEM;
      NUM_TANQUE := registro1370.NUM_TANQUE;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_1_Registro1390New(const spdfHandle: PSPDFHandle;
  const registro1390: Bloco1Registro1390): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_1.Registro1390New do
    begin
      COD_PROD := registro1390.COD_PROD;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_1_Registro1400New(const spdfHandle: PSPDFHandle;
  const registro1400: Bloco1Registro1400): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_1.Registro1400New do
    begin
      COD_ITEM := registro1400.COD_ITEM;
      MUN := registro1400.MUN;
      VALOR := registro1400.VALOR;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_1_Registro1500New(const spdfHandle: PSPDFHandle;
  const registro1500: Bloco1Registro1500): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_1.Registro1500New do
    begin
      IND_OPER := registro1500.IND_OPER;
      IND_EMIT := registro1500.IND_EMIT;
      COD_PART := registro1500.COD_PART;
      COD_MOD := registro1500.COD_MOD;
      COD_SIT := TACBrSituacaoDocto(registro1500.COD_SIT);
      SER := registro1500.SER;
      SUB := registro1500.SUB;
      COD_CONS := TACBrClasseConsumo(registro1500.COD_CONS);
      NUM_DOC := registro1500.NUM_DOC;
      DT_DOC := TDateTime(registro1500.DT_DOC);
      DT_E_S := TDateTime(registro1500.DT_E_S);
      VL_DOC := registro1500.VL_DOC;
      VL_DESC := registro1500.VL_DESC;
      VL_FORN := registro1500.VL_FORN;
      VL_SERV_NT := registro1500.VL_SERV_NT;
      VL_TERC := registro1500.VL_TERC;
      VL_DA := registro1500.VL_DA;
      VL_BC_ICMS := registro1500.VL_BC_ICMS;
      VL_ICMS := registro1500.VL_ICMS;
      VL_BC_ICMS_ST := registro1500.VL_BC_ICMS_ST;
      VL_ICMS_ST := registro1500.VL_ICMS_ST;
      COD_INF := registro1500.COD_INF;
      VL_PIS := registro1500.VL_PIS;
      VL_COFINS := registro1500.VL_COFINS;
      TP_LIGACAO := TACBrTipoLigacao(registro1500.TP_LIGACAO);
      COD_GRUPO_TENSAO := TACBrGrupoTensao(registro1500.COD_GRUPO_TENSAO);
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_1_Registro1510New(const spdfHandle: PSPDFHandle;
  const registro1510: Bloco1Registro1510): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_1.Registro1510New do
    begin
      NUM_ITEM := registro1510.NUM_ITEM;
      COD_ITEM := registro1510.COD_ITEM;
      COD_CLASS := registro1510.COD_CLASS;
      QTD := registro1510.QTD;
      UNID := registro1510.UNID;
      VL_ITEM := registro1510.VL_ITEM;
      VL_DESC := registro1510.VL_DESC;
      CST_ICMS := registro1510.CST_ICMS;
      CFOP := registro1510.CFOP;
      VL_BC_ICMS := registro1510.VL_BC_ICMS;
      ALIQ_ICMS := registro1510.ALIQ_ICMS;
      VL_ICMS := registro1510.VL_ICMS;
      VL_BC_ICMS_ST := registro1510.VL_BC_ICMS_ST;
      ALIQ_ST := registro1510.ALIQ_ST;
      VL_ICMS_ST := registro1510.VL_ICMS_ST;
      IND_REC := TACBrTipoReceita(registro1510.IND_REC);
      COD_PART := registro1510.COD_PART;
      VL_PIS := registro1510.VL_PIS;
      VL_COFINS := registro1510.VL_COFINS;
      COD_CTA := registro1510.COD_CTA;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_1_Registro1600New(const spdfHandle: PSPDFHandle;
  const registro1600: Bloco1Registro1600): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_1.Registro1600New do
    begin
      COD_PART := registro1600.COD_PART;
      TOT_CREDITO := registro1600.TOT_CREDITO;
      TOT_DEBITO := registro1600.TOT_DEBITO;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_1_Registro1700New(const spdfHandle: PSPDFHandle;
  const registro1700: Bloco1Registro1700): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_1.Registro1700New do
    begin
      COD_DISP := TACBrDispositivo(registro1700.COD_DISP);
      COD_MOD := registro1700.COD_MOD;
      SER := registro1700.SER;
      SUB := registro1700.SUB;
      NUM_DOC_INI := registro1700.NUM_DOC_INI;
      NUM_DOC_FIN := registro1700.NUM_DOC_FIN;
      NUM_AUT := registro1700.NUM_AUT;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_1_Registro1710New(const spdfHandle: PSPDFHandle;
  const registro1710: Bloco1Registro1710): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_1.Registro1710New do
    begin
      NUM_DOC_INI := registro1710.NUM_DOC_INI;
      NUM_DOC_FIN := registro1710.NUM_DOC_FIN;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_1_Registro1800New(const spdfHandle: PSPDFHandle;
  const registro1800: Bloco1Registro1800): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_1.Registro1800New do
    begin
      VL_CARGA := registro1800.VL_CARGA;
      VL_PASS := registro1800.VL_PASS;
      VL_FAT := registro1800.VL_FAT;
      IND_RAT := registro1800.IND_RAT;
      VL_ICMS_ANT := registro1800.VL_ICMS_ANT;
      VL_BC_ICMS := registro1800.VL_BC_ICMS;
      VL_ICMS_APUR := registro1800.VL_ICMS_APUR;
      VL_BC_ICMS_APUR := registro1800.VL_BC_ICMS_APUR;
      VL_DIF := registro1800.VL_DIF;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_1_Registro1990_GetQTD_LIN_1(
  const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := spdfHandle^.SPEDFiscal.Bloco_1.Registro1990.QTD_LIN_1;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion Bloco1}

{%region Bloco9}

function SPDF_Bloco_9_GetDT_INI(const spdfHandle: PSPDFHandle;
  var dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    dtIni := double(spdfHandle^.SPEDFiscal.Bloco_9.DT_INI);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_9_SetDT_INI(const spdfHandle: PSPDFHandle;
  const dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    spdfHandle^.SPEDFiscal.Bloco_9.DT_INI := TDateTime(dtIni);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_9_GetDT_FIN(const spdfHandle: PSPDFHandle;
  var dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    dtFin := double(spdfHandle^.SPEDFiscal.Bloco_9.DT_FIN);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_9_SetDT_FIN(const spdfHandle: PSPDFHandle;
  const dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    spdfHandle^.SPEDFiscal.Bloco_9.DT_FIN := TDateTime(dtFin);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_9_GetGravado(const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if spdfHandle^.SPEDFiscal.Bloco_9.Gravado then
      Result := 1
    else
      Result := 0;

  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_9_Registro9001New(const spdfHandle: PSPDFHandle;
  const registro9001: Bloco9Registro9001): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    with spdfHandle^.SPEDFiscal.Bloco_9.Registro9001 do
    begin
      IND_MOV := TACBrIndicadorMovimento(registro9001.IND_MOV);
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_9_Registro9900New(const spdfHandle: PSPDFHandle;
  const registro9900: Bloco9Registro9900): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    with spdfHandle^.SPEDFiscal.Bloco_9.Registro9900.New do
    begin
      REG_BLC := registro9900.REG_BLC;
      QTD_REG_BLC := registro9900.QTD_REG_BLC;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_9_Registro9990_GetQTD_LIN_9(
  const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := spdfHandle^.SPEDFiscal.Bloco_9.Registro9990.QTD_LIN_9;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_9_Registro9999_GetQTD_LIN(const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := spdfHandle^.SPEDFiscal.Bloco_9.Registro9999.QTD_LIN;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion Bloco9}

{%region BlocoC}

function SPDF_Bloco_C_GetDT_INI(const spdfHandle: PSPDFHandle;
  var dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    dtIni := double(spdfHandle^.SPEDFiscal.Bloco_C.DT_INI);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_SetDT_INI(const spdfHandle: PSPDFHandle;
  const dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    spdfHandle^.SPEDFiscal.Bloco_C.DT_INI := TDateTime(dtIni);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_GetDT_FIN(const spdfHandle: PSPDFHandle;
  var dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    dtFin := double(spdfHandle^.SPEDFiscal.Bloco_C.DT_FIN);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_SetDT_FIN(const spdfHandle: PSPDFHandle;
  const dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    spdfHandle^.SPEDFiscal.Bloco_0.DT_FIN := TDateTime(dtFin);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_GetGravado(const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if spdfHandle^.SPEDFiscal.Bloco_0.Gravado then
      Result := 1
    else
      Result := 0;

  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC001New(const spdfHandle: PSPDFHandle;
  const registroC001: BlocoCRegistroC001): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC001New do
    begin
      IND_MOV := TACBrIndicadorMovimento(registroC001.IND_MOV);
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC100New(const spdfHandle: PSPDFHandle;
  const registroC100: BlocoCRegistroC100): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC100New do
    begin
      IND_OPER := TACBrTipoOperacao(registroC100.IND_OPER);
      IND_EMIT := TACBrEmitente(registroC100.IND_EMIT);
      COD_PART := registroC100.COD_PART;
      COD_MOD := registroC100.COD_MOD;
      COD_SIT := TACBrSituacaoDocto(registroC100.COD_SIT);
      SER := registroC100.SER;
      NUM_DOC := registroC100.NUM_DOC;
      CHV_NFE := registroC100.CHV_NFE;
      DT_DOC := TDateTime(registroC100.DT_DOC);
      DT_E_S := TDateTime(registroC100.DT_E_S);
      VL_DOC := registroC100.VL_DOC;
      IND_PGTO := TACBrTipoPagamento(registroC100.IND_PGTO);
      VL_DESC := registroC100.VL_DESC;
      VL_ABAT_NT := registroC100.VL_ABAT_NT;
      VL_MERC := registroC100.VL_MERC;
      IND_FRT := TACBrTipoFrete(registroC100.IND_FRT);
      VL_FRT := registroC100.VL_FRT;
      VL_SEG := registroC100.VL_SEG;
      VL_OUT_DA := registroC100.VL_OUT_DA;
      VL_BC_ICMS := registroC100.VL_BC_ICMS;
      VL_ICMS := registroC100.VL_ICMS;
      VL_BC_ICMS_ST := registroC100.VL_BC_ICMS_ST;
      VL_ICMS_ST := registroC100.VL_ICMS_ST;
      VL_IPI := registroC100.VL_IPI;
      VL_PIS := registroC100.VL_PIS;
      VL_COFINS := registroC100.VL_COFINS;
      VL_PIS_ST := registroC100.VL_PIS_ST;
      VL_COFINS_ST := registroC100.VL_COFINS_ST;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC110New(const spdfHandle: PSPDFHandle;
  const registroC110: BlocoCRegistroC110): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC110New do
    begin
      COD_INF := registroC110.COD_INF;
      TXT_COMPL := registroC110.TXT_COMPL;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC105New(const spdfHandle: PSPDFHandle;
  const registroC105: BlocoCRegistroC105): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC105New do
    begin
      OPER := TACBrTipoOperacaoST(registroC105.OPER);
      UF := registroC105.UF;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC111New(const spdfHandle: PSPDFHandle;
  const registroC111: BlocoCRegistroC111): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC111New do
    begin
      NUM_PROC := registroC111.NUM_PROC;
      IND_PROC := TACBrOrigemProcesso(registroC111.IND_PROC);
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC112New(const spdfHandle: PSPDFHandle;
  const registroC112: BlocoCRegistroC112): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC112New do
    begin
      COD_DA := TACBrDoctoArrecada(registroC112.COD_DA);
      UF := registroC112.UF;
      NUM_DA := registroC112.NUM_DA;
      COD_AUT := registroC112.COD_AUT;
      VL_DA := registroC112.VL_DA;
      DT_VCTO := TDateTime(registroC112.DT_VCTO);
      DT_PGTO := TDateTime(registroC112.DT_PGTO);
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC113New(const spdfHandle: PSPDFHandle;
  const registroC113: BlocoCRegistroC113): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC113New do
    begin
      IND_OPER := TACBrTipoOperacao(registroC113.IND_OPER);
      IND_EMIT := TACBrEmitente(registroC113.IND_EMIT);
      COD_PART := registroC113.COD_PART;
      COD_MOD := registroC113.COD_MOD;
      SER := registroC113.SER;
      SUB := registroC113.SUB;
      NUM_DOC := registroC113.NUM_DOC;
      DT_DOC := TDateTime(registroC113.DT_DOC);
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC114New(const spdfHandle: PSPDFHandle;
  const registroC114: BlocoCRegistroC114): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC114New do
    begin
      COD_MOD := registroC114.COD_MOD;
      ECF_FAB := registroC114.ECF_FAB;
      ECF_CX := registroC114.ECF_CX;
      NUM_DOC := registroC114.NUM_DOC;
      DT_DOC := TDateTime(registroC114.DT_DOC);
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC115New(const spdfHandle: PSPDFHandle;
  const registroC115: BlocoCRegistroC115): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC115New do
    begin
      IND_CARGA := TACBrTipoTransporte(registroC115.IND_CARGA);
      CNPJ_COL := registroC115.CNPJ_COL;
      IE_COL := registroC115.IE_COL;
      CPF_COL := registroC115.CPF_COL;
      COD_MUN_COL := registroC115.COD_MUN_COL;
      CNPJ_ENTG := registroC115.CNPJ_ENTG;
      IE_ENTG := registroC115.IE_ENTG;
      CPF_ENTG := registroC115.CPF_ENTG;
      COD_MUN_ENTG := registroC115.COD_MUN_ENTG;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC116New(const spdfHandle: PSPDFHandle;
  const registroC116: BlocoCRegistroC116): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC116New do
    begin
      COD_MOD := registroC116.COD_MOD;
      NR_SAT := registroC116.NR_SAT;
      CHV_CFE := registroC116.CHV_CFE;
      NUM_CFE := registroC116.NUM_CFE;
      DT_DOC := TDateTime(registroC116.DT_DOC);
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC120New(const spdfHandle: PSPDFHandle;
  const registroC120: BlocoCRegistroC120): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC120New do
    begin
      COD_DOC_IMP := TACBrDoctoImporta(registroC120.COD_DOC_IMP);
      NUM_DOC__IMP := registroC120.NUM_DOC__IMP;
      PIS_IMP := registroC120.PIS_IMP;
      COFINS_IMP := registroC120.COFINS_IMP;
      NUM_ACDRAW := registroC120.NUM_ACDRAW;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC130New(const spdfHandle: PSPDFHandle;
  const registroC130: BlocoCRegistroC130): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC130New do
    begin
      VL_SERV_NT := registroC130.VL_SERV_NT;
      VL_BC_ISSQN := registroC130.VL_BC_ISSQN;
      VL_ISSQN := registroC130.VL_ISSQN;
      VL_BC_IRRF := registroC130.VL_BC_IRRF;
      VL_IRRF := registroC130.VL_IRRF;
      VL_BC_PREV := registroC130.VL_BC_PREV;
      VL_PREV := registroC130.VL_PREV;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC140New(const spdfHandle: PSPDFHandle;
  const registroC140: BlocoCRegistroC140): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC140New do
    begin
      IND_EMIT := TACBrEmitente(registroC140.IND_EMIT);
      IND_TIT := TACBrTipoTitulo(registroC140.IND_TIT);
      DESC_TIT := registroC140.DESC_TIT;
      NUM_TIT := registroC140.NUM_TIT;
      QTD_PARC := registroC140.QTD_PARC;
      VL_TIT := registroC140.VL_TIT;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC141New(const spdfHandle: PSPDFHandle;
  const registroC141: BlocoCRegistroC141): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC141New do
    begin
      NUM_PARC := registroC141.NUM_PARC;
      DT_VCTO := TDateTime(registroC141.DT_VCTO);
      VL_PARC := registroC141.VL_PARC;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC160New(const spdfHandle: PSPDFHandle;
  const registroC160: BlocoCRegistroC160): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC160New do
    begin
      COD_PART := registroC160.COD_PART;
      VEIC_ID := registroC160.VEIC_ID;
      QTD_VOL := registroC160.QTD_VOL;
      PESO_BRT := registroC160.PESO_BRT;
      PESO_LIQ := registroC160.PESO_LIQ;
      UF_ID := registroC160.UF_ID;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC165New(const spdfHandle: PSPDFHandle;
  const registroC165: BlocoCRegistroC165): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC165New do
    begin
      COD_PART := registroC165.COD_PART;
      VEIC_ID := registroC165.VEIC_ID;
      COD_AUT := registroC165.COD_AUT;
      NR_PASSE := registroC165.NR_PASSE;
      HORA := registroC165.HORA;
      TEMPER := registroC165.TEMPER;
      QTD_VOL := registroC165.QTD_VOL;
      PESO_BRT := registroC165.PESO_BRT;
      PESO_LIQ := registroC165.PESO_LIQ;
      NOM_MOT := registroC165.NOM_MOT;
      CPF := registroC165.CPF;
      UF_ID := registroC165.UF_ID;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC170New(const spdfHandle: PSPDFHandle;
  const registroC170: BlocoCRegistroC170): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC170New do
    begin
      NUM_ITEM := registroC170.NUM_ITEM;
      COD_ITEM := registroC170.COD_ITEM;
      DESCR_COMPL := registroC170.DESCR_COMPL;
      QTD := registroC170.QTD;
      UNID := registroC170.UNID;
      VL_ITEM := registroC170.VL_ITEM;
      VL_DESC := registroC170.VL_DESC;
      IND_MOV := TACBrMovimentacaoFisica(registroC170.IND_MOV);
      CST_ICMS := registroC170.CST_ICMS;
      CFOP := registroC170.CFOP;
      COD_NAT := registroC170.COD_NAT;
      VL_BC_ICMS := registroC170.VL_BC_ICMS;
      ALIQ_ICMS := registroC170.ALIQ_ICMS;
      VL_ICMS := registroC170.VL_ICMS;
      VL_BC_ICMS_ST := registroC170.VL_BC_ICMS_ST;
      ALIQ_ST := registroC170.ALIQ_ST;
      VL_ICMS_ST := registroC170.VL_ICMS_ST;
      IND_APUR := TACBrApuracaoIPI(registroC170.IND_APUR);
      CST_IPI := registroC170.CST_IPI;
      COD_ENQ := registroC170.COD_ENQ;
      VL_BC_IPI := registroC170.VL_BC_IPI;
      ALIQ_IPI := registroC170.ALIQ_IPI;
      VL_IPI := registroC170.VL_IPI;
      CST_PIS := registroC170.CST_PIS;
      VL_BC_PIS := registroC170.VL_BC_PIS;
      ALIQ_PIS_PERC := registroC170.ALIQ_PIS_PERC;
      QUANT_BC_PIS := registroC170.QUANT_BC_PIS;
      ALIQ_PIS_R := registroC170.ALIQ_PIS_R;
      VL_PIS := registroC170.VL_PIS;
      CST_COFINS := registroC170.CST_COFINS;
      VL_BC_COFINS := registroC170.VL_BC_COFINS;
      ALIQ_COFINS_PERC := registroC170.ALIQ_COFINS_PERC;
      QUANT_BC_COFINS := registroC170.QUANT_BC_COFINS;
      ALIQ_COFINS_R := registroC170.ALIQ_COFINS_R;
      VL_COFINS := registroC170.VL_COFINS;
      COD_CTA := registroC170.COD_CTA;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC171New(const spdfHandle: PSPDFHandle;
  const registroC171: BlocoCRegistroC171): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC171New do
    begin
      NUM_TANQUE := registroC171.NUM_TANQUE;
      QTDE := registroC171.QTDE;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC172New(const spdfHandle: PSPDFHandle;
  const registroC172: BlocoCRegistroC172): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC172New do
    begin
      VL_BC_ISSQN := registroC172.VL_BC_ISSQN;
      ALIQ_ISSQN := registroC172.ALIQ_ISSQN;
      VL_ISSQN := registroC172.VL_ISSQN;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC173New(const spdfHandle: PSPDFHandle;
  const registroC173: BlocoCRegistroC173): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC173New do
    begin
      LOTE_MED := registroC173.LOTE_MED;
      QTD_ITEM := registroC173.QTD_ITEM;
      DT_FAB := TDateTime(registroC173.DT_FAB);
      DT_VAL := TDateTime(registroC173.DT_VAL);
      IND_MED := TACBrTipoBaseMedicamento(registroC173.IND_MED);
      TP_PROD := TACBrTipoProduto(registroC173.TP_PROD);
      VL_TAB_MAX := registroC173.VL_TAB_MAX;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC174New(const spdfHandle: PSPDFHandle;
  const registroC174: BlocoCRegistroC174): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC174New do
    begin
      IND_ARM := TACBrTipoArmaFogo(registroC174.IND_ARM);
      NUM_ARM := registroC174.NUM_ARM;
      DESCR_COMPL := registroC174.DESCR_COMPL;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC175New(const spdfHandle: PSPDFHandle;
  const registroC175: BlocoCRegistroC175): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC175New do
    begin
      IND_VEIC_OPER := TACBrTipoOperacaoVeiculo(registroC175.IND_VEIC_OPER);
      CNPJ := registroC175.CNPJ;
      UF := registroC175.UF;
      CHASSI_VEIC := registroC175.CHASSI_VEIC;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC176New(const spdfHandle: PSPDFHandle;
  const registroC176: BlocoCRegistroC176): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC176New do
    begin
      COD_MOD_ULT_E := registroC176.COD_MOD_ULT_E;
      NUM_DOC_ULT_E := registroC176.NUM_DOC_ULT_E;
      SER_ULT_E := registroC176.SER_ULT_E;
      DT_ULT_E := TDateTime(registroC176.DT_ULT_E);
      COD_PART_ULT_E := registroC176.COD_PART_ULT_E;
      QUANT_ULT_E := registroC176.QUANT_ULT_E;
      VL_UNIT_ULT_E := registroC176.VL_UNIT_ULT_E;
      VL_UNIT_BC_ST := registroC176.VL_UNIT_BC_ST;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC177New(const spdfHandle: PSPDFHandle;
  const registroC177: BlocoCRegistroC177): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC177New do
    begin
      COD_SELO_IPI := registroC177.COD_SELO_IPI;
      QT_SELO_IPI := registroC177.QT_SELO_IPI;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC178New(const spdfHandle: PSPDFHandle;
  const registroC178: BlocoCRegistroC178): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC178New do
    begin
      CL_ENQ := registroC178.CL_ENQ;
      VL_UNID := registroC178.VL_UNID;
      QUANT_PAD := registroC178.QUANT_PAD;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC179New(const spdfHandle: PSPDFHandle;
  const registroC179: BlocoCRegistroC179): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC179New do
    begin
      BC_ST_ORIG_DEST := registroC179.BC_ST_ORIG_DEST;
      ICMS_ST_REP := registroC179.ICMS_ST_REP;
      ICMS_ST_COMPL := registroC179.ICMS_ST_COMPL;
      BC_RET := registroC179.BC_RET;
      ICMS_RET := registroC179.ICMS_RET;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC190New(const spdfHandle: PSPDFHandle;
  const registroC190: BlocoCRegistroC190): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC190New do
    begin
      CST_ICMS := registroC190.CST_ICMS;
      CFOP := registroC190.CFOP;
      ALIQ_ICMS := registroC190.ALIQ_ICMS;
      VL_OPR := registroC190.VL_OPR;
      VL_BC_ICMS := registroC190.VL_BC_ICMS;
      VL_ICMS := registroC190.VL_ICMS;
      VL_BC_ICMS_ST := registroC190.VL_BC_ICMS_ST;
      VL_ICMS_ST := registroC190.VL_ICMS_ST;
      VL_RED_BC := registroC190.VL_RED_BC;
      VL_IPI := registroC190.VL_IPI;
      COD_OBS := registroC190.COD_OBS;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC195New(const spdfHandle: PSPDFHandle;
  const registroC195: BlocoCRegistroC195): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC195New do
    begin
      COD_OBS := registroC195.COD_OBS;
      TXT_COMPL := registroC195.TXT_COMPL;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC197New(const spdfHandle: PSPDFHandle;
  const registroC197: BlocoCRegistroC197): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC197New do
    begin
      COD_AJ := registroC197.COD_AJ;
      DESCR_COMPL_AJ := registroC197.DESCR_COMPL_AJ;
      COD_ITEM := registroC197.COD_ITEM;
      VL_BC_ICMS := registroC197.VL_BC_ICMS;
      ALIQ_ICMS := registroC197.ALIQ_ICMS;
      VL_ICMS := registroC197.VL_ICMS;
      VL_OUTROS := registroC197.VL_OUTROS;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC300New(const spdfHandle: PSPDFHandle;
  const registroC300: BlocoCRegistroC300): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC300New do
    begin
      COD_MOD := registroC300.COD_MOD;
      SER := registroC300.SER;
      SUB := registroC300.SUB;
      NUM_DOC_INI := registroC300.NUM_DOC_INI;
      NUM_DOC_FIN := registroC300.NUM_DOC_FIN;
      DT_DOC := TDateTime(registroC300.DT_DOC);
      VL_DOC := registroC300.VL_DOC;
      VL_PIS := registroC300.VL_PIS;
      VL_COFINS := registroC300.VL_COFINS;
      COD_CTA := registroC300.COD_CTA;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC310New(const spdfHandle: PSPDFHandle;
  const registroC310: BlocoCRegistroC310): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC310New do
    begin
      NUM_DOC_CANC := registroC310.NUM_DOC_CANC;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC320New(const spdfHandle: PSPDFHandle;
  const registroC320: BlocoCRegistroC320): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC320New do
    begin
      CST_ICMS := registroC320.CST_ICMS;
      CFOP := registroC320.CFOP;
      ALIQ_ICMS := registroC320.ALIQ_ICMS;
      VL_OPR := registroC320.VL_OPR;
      VL_BC_ICMS := registroC320.VL_BC_ICMS;
      VL_ICMS := registroC320.VL_ICMS;
      VL_RED_BC := registroC320.VL_RED_BC;
      COD_OBS := registroC320.COD_OBS;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC321New(const spdfHandle: PSPDFHandle;
  const registroC321: BlocoCRegistroC321): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC321New do
    begin
      COD_ITEM := registroC321.COD_ITEM;
      QTD := registroC321.QTD;
      UNID := registroC321.UNID;
      VL_ITEM := registroC321.VL_ITEM;
      VL_DESC := registroC321.VL_DESC;
      VL_BC_ICMS := registroC321.VL_BC_ICMS;
      VL_ICMS := registroC321.VL_ICMS;
      VL_PIS := registroC321.VL_PIS;
      VL_COFINS := registroC321.VL_COFINS;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC350New(const spdfHandle: PSPDFHandle;
  const registroC350: BlocoCRegistroC350): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC350New do
    begin
      SER := registroC350.SER;
      SUB_SER := registroC350.SUB_SER;
      NUM_DOC := registroC350.NUM_DOC;
      DT_DOC := TDateTime(registroC350.DT_DOC);
      CNPJ_CPF := registroC350.CNPJ_CPF;
      VL_MERC := registroC350.VL_MERC;
      VL_DOC := registroC350.VL_DOC;
      VL_DESC := registroC350.VL_DESC;
      VL_PIS := registroC350.VL_PIS;
      VL_COFINS := registroC350.VL_COFINS;
      COD_CTA := registroC350.COD_CTA;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC370New(const spdfHandle: PSPDFHandle;
  const registroC370: BlocoCRegistroC370): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC370New do
    begin
      NUM_ITEM := registroC370.NUM_ITEM;
      COD_ITEM := registroC370.COD_ITEM;
      QTD := registroC370.QTD;
      UNID := registroC370.UNID;
      VL_ITEM := registroC370.VL_ITEM;
      VL_DESC := registroC370.VL_DESC;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC390New(const spdfHandle: PSPDFHandle;
  const registroC390: BlocoCRegistroC390): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC390New do
    begin
      CST_ICMS := registroC390.CST_ICMS;
      CFOP := registroC390.CFOP;
      ALIQ_ICMS := registroC390.ALIQ_ICMS;
      VL_OPR := registroC390.VL_OPR;
      VL_BC_ICMS := registroC390.VL_BC_ICMS;
      VL_ICMS := registroC390.VL_ICMS;
      VL_RED_BC := registroC390.VL_RED_BC;
      COD_OBS := registroC390.COD_OBS;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC400New(const spdfHandle: PSPDFHandle;
  const registroC400: BlocoCRegistroC400): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC400New do
    begin
      COD_MOD := registroC400.COD_MOD;
      ECF_MOD := registroC400.ECF_MOD;
      ECF_FAB := registroC400.ECF_FAB;
      ECF_CX := registroC400.ECF_CX;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC405New(const spdfHandle: PSPDFHandle;
  const registroC405: BlocoCRegistroC405): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC405New do
    begin
      DT_DOC := TDateTime(registroC405.DT_DOC);
      CRO := registroC405.CRO;
      CRZ := registroC405.CRZ;
      NUM_COO_FIN := registroC405.NUM_COO_FIN;
      GT_FIN := registroC405.GT_FIN;
      VL_BRT := registroC405.VL_BRT;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC410New(const spdfHandle: PSPDFHandle;
  const registroC410: BlocoCRegistroC410): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC410New do
    begin
      VL_PIS := registroC410.VL_PIS;
      VL_COFINS := registroC410.VL_COFINS;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC420New(const spdfHandle: PSPDFHandle;
  const registroC420: BlocoCRegistroC420): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC420New do
    begin
      COD_TOT_PAR := registroC420.COD_TOT_PAR;
      VLR_ACUM_TOT := registroC420.VLR_ACUM_TOT;
      NR_TOT := registroC420.NR_TOT;
      DESCR_NR_TOT := registroC420.DESCR_NR_TOT;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC425New(const spdfHandle: PSPDFHandle;
  const registroC425: BlocoCRegistroC425): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC425New do
    begin
      COD_ITEM := registroC425.COD_ITEM;
      QTD := registroC425.QTD;
      UNID := registroC425.UNID;
      VL_ITEM := registroC425.VL_ITEM;
      VL_PIS := registroC425.VL_PIS;
      VL_COFINS := registroC425.VL_COFINS;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC460New(const spdfHandle: PSPDFHandle;
  const registroC460: BlocoCRegistroC460): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC460New do
    begin
      COD_MOD := registroC460.COD_MOD;
      COD_SIT := TACBrSituacaoDocto(registroC460.COD_SIT);
      NUM_DOC := registroC460.NUM_DOC;
      DT_DOC := TDateTime(registroC460.DT_DOC);
      VL_DOC := registroC460.VL_DOC;
      VL_PIS := registroC460.VL_PIS;
      VL_COFINS := registroC460.VL_COFINS;
      CPF_CNPJ := registroC460.CPF_CNPJ;
      NOM_ADQ := registroC460.NOM_ADQ;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC470New(const spdfHandle: PSPDFHandle;
  const registroC470: BlocoCRegistroC470): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC470New do
    begin
      COD_ITEM := registroC470.COD_ITEM;
      QTD := registroC470.QTD;
      QTD_CANC := registroC470.QTD_CANC;
      UNID := registroC470.UNID;
      VL_ITEM := registroC470.VL_ITEM;
      CST_ICMS := registroC470.CST_ICMS;
      CFOP := registroC470.CFOP;
      ALIQ_ICMS := registroC470.ALIQ_ICMS;
      VL_PIS := registroC470.VL_PIS;
      VL_COFINS := registroC470.VL_COFINS;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC490New(const spdfHandle: PSPDFHandle;
  const registroC490: BlocoCRegistroC490): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC490New do
    begin
      CST_ICMS := registroC490.CST_ICMS;
      CFOP := registroC490.CFOP;
      ALIQ_ICMS := registroC490.ALIQ_ICMS;
      VL_OPR := registroC490.VL_OPR;
      VL_BC_ICMS := registroC490.VL_BC_ICMS;
      VL_ICMS := registroC490.VL_ICMS;
      COD_OBS := registroC490.COD_OBS;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC495New(const spdfHandle: PSPDFHandle;
  const registroC495: BlocoCRegistroC495): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC495New do
    begin
      ALIQ_ICMS := registroC495.ALIQ_ICMS;
      COD_ITEM := registroC495.COD_ITEM;
      QTD := registroC495.QTD;
      QTD_CANC := registroC495.QTD_CANC;
      UNID := registroC495.UNID;
      VL_ITEM := registroC495.VL_ITEM;
      VL_DESC := registroC495.VL_DESC;
      VL_CANC := registroC495.VL_CANC;
      VL_ACMO := registroC495.VL_ACMO;
      VL_BC_ICMS := registroC495.VL_BC_ICMS;
      VL_ICMS := registroC495.VL_ICMS;
      VL_ISEN := registroC495.VL_ISEN;
      VL_NT := registroC495.VL_NT;
      VL_ICMS_ST := registroC495.VL_ICMS_ST;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC500New(const spdfHandle: PSPDFHandle;
  const registroC500: BlocoCRegistroC500): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC500New do
    begin
      IND_OPER := TACBrTipoOperacao(registroC500.IND_OPER);
      IND_EMIT := TACBrEmitente(registroC500.IND_EMIT);
      COD_PART := registroC500.COD_PART;
      COD_MOD := registroC500.COD_MOD;
      COD_SIT := TACBrSituacaoDocto(registroC500.COD_SIT);
      SER := registroC500.SER;
      SUB := registroC500.SUB;
      COD_CONS := registroC500.COD_CONS;
      NUM_DOC := registroC500.NUM_DOC;
      DT_DOC := TDateTime(registroC500.DT_DOC);
      DT_E_S := TDateTime(registroC500.DT_E_S);
      VL_DOC := registroC500.VL_DOC;
      VL_DESC := registroC500.VL_DESC;
      VL_FORN := registroC500.VL_FORN;
      VL_SERV_NT := registroC500.VL_SERV_NT;
      VL_TERC := registroC500.VL_TERC;
      VL_DA := registroC500.VL_DA;
      VL_BC_ICMS := registroC500.VL_BC_ICMS;
      VL_ICMS := registroC500.VL_ICMS;
      VL_BC_ICMS_ST := registroC500.VL_BC_ICMS_ST;
      VL_ICMS_ST := registroC500.VL_ICMS_ST;
      COD_INF := registroC500.COD_INF;
      VL_PIS := registroC500.VL_PIS;
      VL_COFINS := registroC500.VL_COFINS;
      TP_LIGACAO := TACBrTipoLigacao(registroC500.TP_LIGACAO);
      COD_GRUPO_TENSAO := TACBrGrupoTensao(registroC500.COD_GRUPO_TENSAO);
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC510New(const spdfHandle: PSPDFHandle;
  const registroC510: BlocoCRegistroC510): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC510New do
    begin
      NUM_ITEM := registroC510.NUM_ITEM;
      COD_ITEM := registroC510.COD_ITEM;
      COD_CLASS := registroC510.COD_CLASS;
      QTD := registroC510.QTD;
      UNID := registroC510.UNID;
      VL_ITEM := registroC510.VL_ITEM;
      VL_DESC := registroC510.VL_DESC;
      CST_ICMS := registroC510.CST_ICMS;
      CFOP := registroC510.CFOP;
      VL_BC_ICMS := registroC510.VL_BC_ICMS;
      ALIQ_ICMS := registroC510.ALIQ_ICMS;
      VL_ICMS := registroC510.VL_ICMS;
      VL_BC_ICMS_ST := registroC510.VL_BC_ICMS_ST;
      ALIQ_ST := registroC510.ALIQ_ST;
      VL_ICMS_ST := registroC510.VL_ICMS_ST;
      IND_REC := TACBrTipoReceita(registroC510.IND_REC);
      COD_PART := registroC510.COD_PART;
      VL_PIS := registroC510.VL_PIS;
      VL_COFINS := registroC510.VL_COFINS;
      COD_CTA := registroC510.COD_CTA;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC590New(const spdfHandle: PSPDFHandle;
  const registroC590: BlocoCRegistroC590): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC590New do
    begin
      CST_ICMS := registroC590.CST_ICMS;
      CFOP := registroC590.CFOP;
      ALIQ_ICMS := registroC590.ALIQ_ICMS;
      VL_OPR := registroC590.VL_OPR;
      VL_BC_ICMS := registroC590.VL_BC_ICMS;
      VL_ICMS := registroC590.VL_ICMS;
      VL_BC_ICMS_ST := registroC590.VL_BC_ICMS_ST;
      VL_ICMS_ST := registroC590.VL_ICMS_ST;
      VL_RED_BC := registroC590.VL_RED_BC;
      COD_OBS := registroC590.COD_OBS;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC600New(const spdfHandle: PSPDFHandle;
  const registroC600: BlocoCRegistroC600): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC600New do
    begin
      COD_MOD := registroC600.COD_MOD;
      COD_MUN := registroC600.COD_MUN;
      SER := registroC600.SER;
      SUB := registroC600.SUB;
      COD_CONS := registroC600.COD_CONS;
      QTD_CONS := registroC600.QTD_CONS;
      QTD_CANC := registroC600.QTD_CANC;
      DT_DOC := TDateTime(registroC600.DT_DOC);
      VL_DOC := registroC600.VL_DOC;
      VL_DESC := registroC600.VL_DESC;
      CONS := registroC600.CONS;
      VL_FORN := registroC600.VL_FORN;
      VL_SERV_NT := registroC600.VL_SERV_NT;
      VL_TERC := registroC600.VL_TERC;
      VL_DA := registroC600.VL_DA;
      VL_BC_ICMS := registroC600.VL_BC_ICMS;
      VL_ICMS := registroC600.VL_ICMS;
      VL_BC_ICMS_ST := registroC600.VL_BC_ICMS_ST;
      VL_ICMS_ST := registroC600.VL_ICMS_ST;
      VL_PIS := registroC600.VL_PIS;
      VL_COFINS := registroC600.VL_COFINS;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC601New(const spdfHandle: PSPDFHandle;
  const registroC601: BlocoCRegistroC601): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC601New do
    begin
      NUM_DOC_CANC := registroC601.NUM_DOC_CANC;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC610New(const spdfHandle: PSPDFHandle;
  const registroC610: BlocoCRegistroC610): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC610New do
    begin
      COD_CLASS := registroC610.COD_CLASS;
      COD_ITEM := registroC610.COD_ITEM;
      QTD := registroC610.QTD;
      UNID := registroC610.UNID;
      VL_ITEM := registroC610.VL_ITEM;
      VL_DESC := registroC610.VL_DESC;
      CST_ICMS := registroC610.CST_ICMS;
      CFOP := registroC610.CFOP;
      ALIQ_ICMS := registroC610.ALIQ_ICMS;
      VL_BC_ICMS := registroC610.VL_BC_ICMS;
      VL_ICMS := registroC610.VL_ICMS;
      VL_BC_ICMS_ST := registroC610.VL_BC_ICMS_ST;
      VL_ICMS_ST := registroC610.VL_ICMS_ST;
      VL_PIS := registroC610.VL_PIS;
      VL_COFINS := registroC610.VL_COFINS;
      COD_CTA := registroC610.COD_CTA;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC690New(const spdfHandle: PSPDFHandle;
  const registroC690: BlocoCRegistroC690): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC690New do
    begin
      CST_ICMS := registroC690.CST_ICMS;
      CFOP := registroC690.CFOP;
      ALIQ_ICMS := registroC690.ALIQ_ICMS;
      VL_OPR := registroC690.VL_OPR;
      VL_BC_ICMS := registroC690.VL_BC_ICMS;
      VL_ICMS := registroC690.VL_ICMS;
      VL_RED_BC := registroC690.VL_RED_BC;
      VL_BC_ICMS_ST := registroC690.VL_BC_ICMS_ST;
      VL_ICMS_ST := registroC690.VL_ICMS_ST;
      COD_OBS := registroC690.COD_OBS;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC700New(const spdfHandle: PSPDFHandle;
  const registroC700: BlocoCRegistroC700): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC700New do
    begin
      COD_MOD := registroC700.COD_MOD;
      SER := registroC700.SER;
      NRO_ORD_INI := registroC700.NRO_ORD_INI;
      NRO_ORD_FIN := registroC700.NRO_ORD_FIN;
      DT_DOC_INI := TDateTime(registroC700.DT_DOC_INI);
      DT_DOC_FIN := TDateTime(registroC700.DT_DOC_FIN);
      NOM_MEST := registroC700.NOM_MEST;
      CHV_COD_DIG := registroC700.CHV_COD_DIG;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC790New(const spdfHandle: PSPDFHandle;
  const registroC790: BlocoCRegistroC790): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC790New do
    begin
      CST_ICMS := registroC790.CST_ICMS;
      CFOP := registroC790.CFOP;
      ALIQ_ICMS := registroC790.ALIQ_ICMS;
      VL_OPR := registroC790.VL_OPR;
      VL_BC_ICMS := registroC790.VL_BC_ICMS;
      VL_ICMS := registroC790.VL_ICMS;
      VL_BC_ICMS_ST := registroC790.VL_BC_ICMS_ST;
      VL_ICMS_ST := registroC790.VL_ICMS_ST;
      VL_RED_BC := registroC790.VL_RED_BC;
      COD_OBS := registroC790.COD_OBS;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC791New(const spdfHandle: PSPDFHandle;
  const registroC791: BlocoCRegistroC791): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC791New do
    begin
      UF := registroC791.UF;
      VL_BC_ICMS_ST := registroC791.VL_BC_ICMS_ST;
      VL_ICMS_ST := registroC791.VL_ICMS_ST;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC800New(const spdfHandle: PSPDFHandle;
  const registroC800: BlocoCRegistroC800): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC800New do
    begin
      COD_MOD := registroC800.COD_MOD;
      COD_SIT := TACBrSituacaoDocto(registroC800.COD_SIT);
      NUM_CFE := registroC800.NUM_CFE;
      DT_DOC := TDateTime(registroC800.DT_DOC);
      VL_CFE := registroC800.VL_CFE;
      VL_PIS := registroC800.VL_PIS;
      VL_COFINS := registroC800.VL_COFINS;
      CNPJ_CPF := registroC800.CNPJ_CPF;
      NR_SAT := registroC800.NR_SAT;
      CHV_CFE := registroC800.CHV_CFE;
      VL_DESC := registroC800.VL_DESC;
      VL_MERC := registroC800.VL_MERC;
      VL_OUT_DA := registroC800.VL_OUT_DA;
      VL_ICMS := registroC800.VL_ICMS;
      VL_PIS_ST := registroC800.VL_PIS_ST;
      VL_COFINS_ST := registroC800.VL_COFINS_ST;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC850New(const spdfHandle: PSPDFHandle;
  const registroC850: BlocoCRegistroC850): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC850New do
    begin
      CST_ICMS := registroC850.CST_ICMS;
      CFOP := registroC850.CFOP;
      ALIQ_ICMS := registroC850.ALIQ_ICMS;
      VL_OPR := registroC850.VL_OPR;
      VL_BC_ICMS := registroC850.VL_BC_ICMS;
      VL_ICMS := registroC850.VL_ICMS;
      COD_OBS := registroC850.COD_OBS;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC860New(const spdfHandle: PSPDFHandle;
  const registroC860: BlocoCRegistroC860): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC860New do
    begin
      COD_MOD := registroC860.COD_MOD;
      NR_SAT := registroC860.NR_SAT;
      DT_DOC := TDateTime(registroC860.DT_DOC);
      DOC_INI := registroC860.DOC_INI;
      DOC_FIN := registroC860.DOC_FIN;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC890New(const spdfHandle: PSPDFHandle;
  const registroC890: BlocoCRegistroC890): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_C.RegistroC890New do
    begin
      CST_ICMS := registroC890.CST_ICMS;
      CFOP := registroC890.CFOP;
      ALIQ_ICMS := registroC890.ALIQ_ICMS;
      VL_OPR := registroC890.VL_OPR;
      VL_BC_ICMS := registroC890.VL_BC_ICMS;
      VL_ICMS := registroC890.VL_ICMS;
      COD_OBS := registroC890.COD_OBS;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_C_RegistroC990_GetQTD_LIN_C(
  const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := spdfHandle^.SPEDFiscal.Bloco_C.RegistroC990.QTD_LIN_C;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion BlocoC}

{%region BlocoD}

function SPDF_Bloco_D_GetDT_INI(const spdfHandle: PSPDFHandle;
  var dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    dtIni := double(spdfHandle^.SPEDFiscal.Bloco_D.DT_INI);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_SetDT_INI(const spdfHandle: PSPDFHandle;
  const dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    spdfHandle^.SPEDFiscal.Bloco_D.DT_INI := TDateTime(dtIni);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_GetDT_FIN(const spdfHandle: PSPDFHandle;
  var dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    dtFin := double(spdfHandle^.SPEDFiscal.Bloco_D.DT_FIN);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_SetDT_FIN(const spdfHandle: PSPDFHandle;
  const dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    spdfHandle^.SPEDFiscal.Bloco_D.DT_FIN := TDateTime(dtFin);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_GetGravado(const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if spdfHandle^.SPEDFiscal.Bloco_D.Gravado then
      Result := 1
    else
      Result := 0;

  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD001New(const spdfHandle: PSPDFHandle;
  const registroD001: BlocoDRegistroD001): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD001New do
    begin
      IND_MOV := TACBrIndicadorMovimento(registroD001.IND_MOV);
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD100New(const spdfHandle: PSPDFHandle;
  const registroD100: BlocoDRegistroD100): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD100New do
    begin
      IND_OPER := TACBrTipoOperacao(registroD100.IND_OPER);
      IND_EMIT := TACBrEmitente(registroD100.IND_EMIT);
      COD_PART := registroD100.COD_PART;
      COD_MOD := registroD100.COD_MOD;
      COD_SIT := TACBrSituacaoDocto(registroD100.COD_SIT);
      SER := registroD100.SER;
      SUB := registroD100.SUB;
      NUM_DOC := registroD100.NUM_DOC;
      CHV_CTE := registroD100.CHV_CTE;
      DT_DOC := TDateTime(registroD100.DT_DOC);
      DT_A_P := TDateTime(registroD100.DT_A_P);
      TP_CT_e := registroD100.TP_CT_e;
      CHV_CTE_REF := registroD100.CHV_CTE_REF;
      VL_DOC := registroD100.VL_DOC;
      VL_DESC := registroD100.VL_DESC;
      IND_FRT := TACBrTipoFrete(registroD100.IND_FRT);
      VL_SERV := registroD100.VL_SERV;
      VL_BC_ICMS := registroD100.VL_BC_ICMS;
      VL_ICMS := registroD100.VL_ICMS;
      VL_NT := registroD100.VL_NT;
      COD_INF := registroD100.COD_INF;
      COD_CTA := registroD100.COD_CTA;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD110New(const spdfHandle: PSPDFHandle;
  const registroD110: BlocoDRegistroD110): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD110New do
    begin
      COD_ITEM := registroD110.COD_ITEM;
      NUN_ITEM := registroD110.NUN_ITEM;
      VL_SERV := registroD110.VL_SERV;
      VL_OUT := registroD110.VL_OUT;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD120New(const spdfHandle: PSPDFHandle;
  const registroD120: BlocoDRegistroD120): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD120New do
    begin
      COD_MUN_ORIG := registroD120.COD_MUN_ORIG;
      COD_MUN_DEST := registroD120.COD_MUN_DEST;
      VEIC_ID := registroD120.VEIC_ID;
      UF_ID := registroD120.UF_ID;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD130New(const spdfHandle: PSPDFHandle;
  const registroD130: BlocoDRegistroD130): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD130New do
    begin
      COD_PART_CONSG := registroD130.COD_PART_CONSG;
      COD_PART_RED := registroD130.COD_PART_RED;
      IND_FRT_RED := TACBrTipoFreteRedespacho(registroD130.IND_FRT_RED);
      COD_MUN_ORIG := registroD130.COD_MUN_ORIG;
      COD_MUN_DEST := registroD130.COD_MUN_DEST;
      VEIC_ID := registroD130.VEIC_ID;
      VL_LIQ_FRT := registroD130.VL_LIQ_FRT;
      VL_SEC_CAT := registroD130.VL_SEC_CAT;
      VL_DESP := registroD130.VL_DESP;
      VL_PEDG := registroD130.VL_PEDG;
      VL_OUT := registroD130.VL_OUT;
      VL_FRT := registroD130.VL_FRT;
      UF_ID := registroD130.UF_ID;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD140New(const spdfHandle: PSPDFHandle;
  const registroD140: BlocoDRegistroD140): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD140New do
    begin
      COD_PART_CONSG := registroD140.COD_PART_CONSG;
      COD_MUN_ORIG := registroD140.COD_MUN_ORIG;
      COD_MUN_DEST := registroD140.COD_MUN_DEST;
      IND_VEIC := registroD140.IND_VEIC;
      VEIC_ID := TACBrTipoVeiculo(registroD140.VEIC_ID);
      IND_NAV := TACBrTipoNavegacao(registroD140.IND_NAV);
      VIAGEM := registroD140.VIAGEM;
      VL_FRT_LIQ := registroD140.VL_FRT_LIQ;
      VL_DESP_PORT := registroD140.VL_DESP_PORT;
      VL_DESP_CAR_DESC := registroD140.VL_DESP_CAR_DESC;
      VL_OUT := registroD140.VL_OUT;
      VL_FRT_BRT := registroD140.VL_FRT_BRT;
      VL_FRT_MM := registroD140.VL_FRT_MM;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD150New(const spdfHandle: PSPDFHandle;
  const registroD150: BlocoDRegistroD150): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD150New do
    begin
      COD_MUN_ORIG := registroD150.COD_MUN_ORIG;
      COD_MUN_DEST := registroD150.COD_MUN_DEST;
      VEIC_ID := registroD150.VEIC_ID;
      VIAGEM := registroD150.VIAGEM;
      IND_TFA := TACBrTipoTarifa(registroD150.IND_TFA);
      VL_PESO_TX := registroD150.VL_PESO_TX;
      VL_TX_TERR := registroD150.VL_TX_TERR;
      VL_TX_RED := registroD150.VL_TX_RED;
      VL_OUT := registroD150.VL_OUT;
      VL_TX_ADV := registroD150.VL_TX_ADV;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD160New(const spdfHandle: PSPDFHandle;
  const registroD160: BlocoDRegistroD160): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD160New do
    begin
      DESPACHO := registroD160.DESPACHO;
      CNPJ_CPF_REM := registroD160.CNPJ_CPF_REM;
      IE_REM := registroD160.IE_REM;
      COD_MUN_ORI := registroD160.COD_MUN_ORI;
      CNPJ_CPF_DEST := registroD160.CNPJ_CPF_DEST;
      IE_DEST := registroD160.IE_DEST;
      COD_MUN_DEST := registroD160.COD_MUN_DEST;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD161New(const spdfHandle: PSPDFHandle;
  const registroD161: BlocoDRegistroD161): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD161New do
    begin
      IND_CARGA := TACBrTipoTransporte(registroD161.IND_CARGA);
      CNPJ_COL := registroD161.CNPJ_COL;
      IE_COL := registroD161.IE_COL;
      COD_MUN_COL := registroD161.COD_MUN_COL;
      CNPJ_ENTG := registroD161.CNPJ_ENTG;
      IE_ENTG := registroD161.IE_ENTG;
      COD_MUN_ENTG := registroD161.COD_MUN_ENTG;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD162New(const spdfHandle: PSPDFHandle;
  const registroD162: BlocoDRegistroD162): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD162New do
    begin
      COD_MOD := registroD162.COD_MOD;
      SER := registroD162.SER;
      NUM_DOC := registroD162.NUM_DOC;
      DT_DOC := TDateTime(registroD162.DT_DOC);
      VL_DOC := registroD162.VL_DOC;
      VL_MERC := registroD162.VL_MERC;
      QTD_VOL := registroD162.QTD_VOL;
      PESO_BRT := registroD162.PESO_BRT;
      PESO_LIQ := registroD162.PESO_LIQ;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD170New(const spdfHandle: PSPDFHandle;
  const registroD170: BlocoDRegistroD170): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD170New do
    begin
      COD_PART_CONSG := registroD170.COD_PART_CONSG;
      COD_PART_RED := registroD170.COD_PART_RED;
      COD_MUN_ORIG := registroD170.COD_MUN_ORIG;
      COD_MUN_DEST := registroD170.COD_MUN_DEST;
      OTM := registroD170.OTM;
      IND_NAT_FRT := TACBrNaturezaFrete(registroD170.IND_NAT_FRT);
      VL_LIQ_FRT := registroD170.VL_LIQ_FRT;
      VL_GRIS := registroD170.VL_GRIS;
      VL_PDG := registroD170.VL_PDG;
      VL_OUT := registroD170.VL_OUT;
      VL_FRT := registroD170.VL_FRT;
      VEIC_ID := registroD170.VEIC_ID;
      UF_ID := registroD170.UF_ID;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD180New(const spdfHandle: PSPDFHandle;
  const registroD180: BlocoDRegistroD180): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD180New do
    begin
      NUM_SEQ := registroD180.NUM_SEQ;
      IND_EMIT := TACBrEmitente(registroD180.IND_EMIT);
      CNPJ_EMIT := registroD180.CNPJ_EMIT;
      UF_EMIT := registroD180.UF_EMIT;
      IE_EMIT := registroD180.IE_EMIT;
      COD_MUN_ORIG := registroD180.COD_MUN_ORIG;
      CNPJ_CPF_TOM := registroD180.CNPJ_CPF_TOM;
      UF_TOM := registroD180.UF_TOM;
      IE_TOM := registroD180.IE_TOM;
      COD_MUN_DEST := registroD180.COD_MUN_DEST;
      COD_MOD := registroD180.COD_MOD;
      SER := registroD180.SER;
      SUB := registroD180.SUB;
      NUM_DOC := registroD180.NUM_DOC;
      DT_DOC := TDateTime(registroD180.DT_DOC);
      VL_DOC := registroD180.VL_DOC;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD190New(const spdfHandle: PSPDFHandle;
  const registroD190: BlocoDRegistroD190): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD190New do
    begin
      CST_ICMS := registroD190.CST_ICMS;
      CFOP := registroD190.CFOP;
      ALIQ_ICMS := registroD190.ALIQ_ICMS;
      VL_OPR := registroD190.VL_OPR;
      VL_BC_ICMS := registroD190.VL_BC_ICMS;
      VL_ICMS := registroD190.VL_ICMS;
      VL_RED_BC := registroD190.VL_RED_BC;
      COD_OBS := registroD190.COD_OBS;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD195New(const spdfHandle: PSPDFHandle;
  const registroD195: BlocoDRegistroD195): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD195New do
    begin
      COD_OBS := registroD195.COD_OBS;
      TXT_COMPL := registroD195.TXT_COMPL;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD197New(const spdfHandle: PSPDFHandle;
  const registroD197: BlocoDRegistroD197): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD197New do
    begin
      COD_AJ := registroD197.COD_AJ;
      DESCR_COMPL_AJ := registroD197.DESCR_COMPL_AJ;
      COD_ITEM := registroD197.COD_ITEM;
      VL_BC_ICMS := registroD197.VL_BC_ICMS;
      ALIQ_ICMS := registroD197.ALIQ_ICMS;
      VL_ICMS := registroD197.VL_ICMS;
      VL_OUTROS := registroD197.VL_OUTROS;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD300New(const spdfHandle: PSPDFHandle;
  const registroD300: BlocoDRegistroD300): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD300New do
    begin
      COD_MOD := registroD300.COD_MOD;
      SER := registroD300.SER;
      SUB := registroD300.SUB;
      NUM_DOC_INI := registroD300.NUM_DOC_INI;
      NUM_DOC_FIN := registroD300.NUM_DOC_FIN;
      CST_ICMS := registroD300.CST_ICMS;
      CFOP := registroD300.CFOP;
      ALIQ_ICMS := registroD300.ALIQ_ICMS;
      DT_DOC := TDateTime(registroD300.DT_DOC);
      VL_OPR := registroD300.VL_OPR;
      VL_DESC := registroD300.VL_DESC;
      VL_SERV := registroD300.VL_SERV;
      VL_SEG := registroD300.VL_SEG;
      VL_OUT_DESP := registroD300.VL_OUT_DESP;
      VL_BC_ICMS := registroD300.VL_BC_ICMS;
      VL_ICMS := registroD300.VL_ICMS;
      VL_RED_BC := registroD300.VL_RED_BC;
      COD_OBS := registroD300.COD_OBS;
      COD_CTA := registroD300.COD_CTA;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD301New(const spdfHandle: PSPDFHandle;
  const registroD301: BlocoDRegistroD301): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD301New do
    begin
      NUM_DOC_CANC := registroD301.NUM_DOC_CANC;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD310New(const spdfHandle: PSPDFHandle;
  const registroD310: BlocoDRegistroD310): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD310New do
    begin
      COD_MUN_ORIG := registroD310.COD_MUN_ORIG;
      VL_SERV := registroD310.VL_SERV;
      VL_BC_ICMS := registroD310.VL_BC_ICMS;
      VL_ICMS := registroD310.VL_ICMS;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD350New(const spdfHandle: PSPDFHandle;
  const registroD350: BlocoDRegistroD350): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD350New do
    begin
      COD_MOD := registroD350.COD_MOD;
      ECF_MOD := registroD350.ECF_MOD;
      ECF_FAB := registroD350.ECF_FAB;
      ECF_CX := registroD350.ECF_CX;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD355New(const spdfHandle: PSPDFHandle;
  const registroD355: BlocoDRegistroD355): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD355New do
    begin
      DT_DOC := TDateTime(registroD355.DT_DOC);
      CRO := registroD355.CRO;
      CRZ := registroD355.CRZ;
      NUM_COO_FIN := registroD355.NUM_COO_FIN;
      GT_FIN := registroD355.GT_FIN;
      VL_BRT := registroD355.VL_BRT;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD360New(const spdfHandle: PSPDFHandle;
  const registroD360: BlocoDRegistroD360): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD360New do
    begin
      VL_PIS := registroD360.VL_PIS;
      VL_COFINS := registroD360.VL_COFINS;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD365New(const spdfHandle: PSPDFHandle;
  const registroD365: BlocoDRegistroD365): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD365New do
    begin
      COD_TOT_PAR := registroD365.COD_TOT_PAR;
      VLR_ACUM_TOT := registroD365.VLR_ACUM_TOT;
      NR_TOT := registroD365.NR_TOT;
      DESCR_NR_TOT := registroD365.DESCR_NR_TOT;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD370New(const spdfHandle: PSPDFHandle;
  const registroD370: BlocoDRegistroD370): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD370New do
    begin
      COD_MUN_ORIG := registroD370.COD_MUN_ORIG;
      VL_SERV := registroD370.VL_SERV;
      QTD_BILH := registroD370.QTD_BILH;
      VL_BC_ICMS := registroD370.VL_BC_ICMS;
      VL_ICMS := registroD370.VL_ICMS;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD390New(const spdfHandle: PSPDFHandle;
  const registroD390: BlocoDRegistroD390): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD390New do
    begin
      CST_ICMS := registroD390.CST_ICMS;
      CFOP := registroD390.CFOP;
      ALIQ_ICMS := registroD390.ALIQ_ICMS;
      VL_OPR := registroD390.VL_OPR;
      VL_BC_ISSQN := registroD390.VL_BC_ISSQN;
      ALIQ_ISSQN := registroD390.ALIQ_ISSQN;
      VL_ISSQN := registroD390.VL_ISSQN;
      VL_BC_ICMS := registroD390.VL_BC_ICMS;
      VL_ICMS := registroD390.VL_ICMS;
      COD_OBS := registroD390.COD_OBS;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD400New(const spdfHandle: PSPDFHandle;
  const registroD400: BlocoDRegistroD400): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD400New do
    begin
      COD_PART := registroD400.COD_PART;
      COD_MOD := registroD400.COD_MOD;
      COD_SIT := TACBrSituacaoDocto(registroD400.COD_SIT);
      SER := registroD400.SER;
      SUB := registroD400.SUB;
      NUM_DOC := registroD400.NUM_DOC;
      DT_DOC := TDateTime(registroD400.DT_DOC);
      VL_DOC := registroD400.VL_DOC;
      VL_DESC := registroD400.VL_DESC;
      VL_SERV := registroD400.VL_SERV;
      VL_BC_ICMS := registroD400.VL_BC_ICMS;
      VL_ICMS := registroD400.VL_ICMS;
      VL_PIS := registroD400.VL_PIS;
      VL_COFINS := registroD400.VL_COFINS;
      COD_CTA := registroD400.COD_CTA;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD410New(const spdfHandle: PSPDFHandle;
  const registroD410: BlocoDRegistroD410): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD410New do
    begin
      COD_MOD := registroD410.COD_MOD;
      SER := registroD410.SER;
      SUB := registroD410.SUB;
      NUM_DOC_INI := registroD410.NUM_DOC_INI;
      NUM_DOC_FIN := registroD410.NUM_DOC_FIN;
      DT_DOC := TDateTime(registroD410.DT_DOC);
      CST_ICMS := registroD410.CST_ICMS;
      CFOP := registroD410.CFOP;
      ALIQ_ICMS := registroD410.ALIQ_ICMS;
      VL_OPR := registroD410.VL_OPR;
      VL_DESC := registroD410.VL_DESC;
      VL_SERV := registroD410.VL_SERV;
      VL_BC_ICMS := registroD410.VL_BC_ICMS;
      VL_ICMS := registroD410.VL_ICMS;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD411New(const spdfHandle: PSPDFHandle;
  const registroD411: BlocoDRegistroD411): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD411New do
    begin
      NUM_DOC_CANC := registroD411.NUM_DOC_CANC;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD420New(const spdfHandle: PSPDFHandle;
  const registroD420: BlocoDRegistroD420): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD420New do
    begin
      COD_MUN_ORIG := registroD420.COD_MUN_ORIG;
      VL_SERV := registroD420.VL_SERV;
      VL_BC_ICMS := registroD420.VL_BC_ICMS;
      VL_ICMS := registroD420.VL_ICMS;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD500New(const spdfHandle: PSPDFHandle;
  const registroD500: BlocoDRegistroD500): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD500New do
    begin
      IND_OPER := TACBrTipoOperacao(registroD500.IND_OPER);
      IND_EMIT := TACBrEmitente(registroD500.IND_EMIT);
      COD_PART := registroD500.COD_PART;
      COD_MOD := registroD500.COD_MOD;
      COD_SIT := TACBrSituacaoDocto(registroD500.COD_SIT);
      SER := registroD500.SER;
      SUB := registroD500.SUB;
      NUM_DOC := registroD500.NUM_DOC;
      DT_DOC := TDateTime(registroD500.DT_DOC);
      DT_A_P := TDateTime(registroD500.DT_A_P);
      VL_DOC := registroD500.VL_DOC;
      VL_DESC := registroD500.VL_DESC;
      VL_SERV := registroD500.VL_SERV;
      VL_SERV_NT := registroD500.VL_SERV_NT;
      VL_TERC := registroD500.VL_TERC;
      VL_DA := registroD500.VL_DA;
      VL_BC_ICMS := registroD500.VL_BC_ICMS;
      VL_ICMS := registroD500.VL_ICMS;
      COD_INF := registroD500.COD_INF;
      VL_PIS := registroD500.VL_PIS;
      VL_COFINS := registroD500.VL_COFINS;
      COD_CTA := registroD500.COD_CTA;
      TP_ASSINANTE := TACBrTipoAssinante(registroD500.TP_ASSINANTE);
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD510New(const spdfHandle: PSPDFHandle;
  const registroD510: BlocoDRegistroD510): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD510New do
    begin
      IND_REC := TACBrIndTipoReceita(registroD510.IND_REC);
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD530New(const spdfHandle: PSPDFHandle;
  const registroD530: BlocoDRegistroD530): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD530New do
    begin
      IND_SERV := TACBrServicoPrestado(registroD530.IND_SERV);
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD590New(const spdfHandle: PSPDFHandle;
  const registroD590: BlocoDRegistroD590): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD590New do
    begin
      CST_ICMS := registroD590.CST_ICMS;
      CFOP := registroD590.CFOP;
      ALIQ_ICMS := registroD590.ALIQ_ICMS;
      VL_OPR := registroD590.VL_OPR;
      VL_BC_ICMS := registroD590.VL_BC_ICMS;
      VL_ICMS := registroD590.VL_ICMS;
      VL_BC_ICMS_UF := registroD590.VL_BC_ICMS_UF;
      VL_ICMS_UF := registroD590.VL_ICMS_UF;
      VL_RED_BC := registroD590.VL_RED_BC;
      COD_OBS := registroD590.COD_OBS;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD600New(const spdfHandle: PSPDFHandle;
  const registroD600: BlocoDRegistroD600): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD600New do
    begin
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;


function SPDF_Bloco_D_RegistroD610New(const spdfHandle: PSPDFHandle;
  const registroD610: BlocoDRegistroD610): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD610New do
    begin
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD690New(const spdfHandle: PSPDFHandle;
  const registroD690: BlocoDRegistroD690): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD690New do
    begin
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD695New(const spdfHandle: PSPDFHandle;
  const registroD695: BlocoDRegistroD695): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD695New do
    begin
      COD_MOD := registroD695.COD_MOD;
      SER := registroD695.SER;
      NRO_ORD_INI := registroD695.NRO_ORD_INI;
      NRO_ORD_FIN := registroD695.NRO_ORD_FIN;
      DT_DOC_INI := TDateTime(registroD695.DT_DOC_INI);
      DT_DOC_FIN := TDateTime(registroD695.DT_DOC_FIN);
      NOM_MEST := registroD695.NOM_MEST;
      CHV_COD_DIG := registroD695.CHV_COD_DIG;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD696New(const spdfHandle: PSPDFHandle;
  const registroD696: BlocoDRegistroD696): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD696New do
    begin
      CST_ICMS := registroD696.CST_ICMS;
      CFOP := registroD696.CFOP;
      ALIQ_ICMS := registroD696.ALIQ_ICMS;
      VL_OPR := registroD696.VL_OPR;
      VL_BC_ICMS := registroD696.VL_BC_ICMS;
      VL_ICMS := registroD696.VL_ICMS;
      VL_BC_ICMS_UF := registroD696.VL_BC_ICMS_UF;
      VL_ICMS_UF := registroD696.VL_ICMS_UF;
      VL_RED_BC := registroD696.VL_RED_BC;
      COD_OBS := registroD696.COD_OBS;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD697New(const spdfHandle: PSPDFHandle;
  const registroD697: BlocoDRegistroD697): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_D.RegistroD697New do
    begin
      UF := registroD697.UF;
      VL_BC_ICMS := registroD697.VL_BC_ICMS;
      VL_ICMS := registroD697.VL_ICMS;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_D_RegistroD990_GetQTD_LIN_D(
  const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := spdfHandle^.SPEDFiscal.Bloco_D.RegistroD990.QTD_LIN_D;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion BlocoD}

{%region BlocoE}

function SPDF_Bloco_E_GetDT_INI(const spdfHandle: PSPDFHandle;
  var dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    dtIni := double(spdfHandle^.SPEDFiscal.Bloco_E.DT_INI);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_E_SetDT_INI(const spdfHandle: PSPDFHandle;
  const dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    spdfHandle^.SPEDFiscal.Bloco_E.DT_INI := TDateTime(dtIni);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_E_GetDT_FIN(const spdfHandle: PSPDFHandle;
  var dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    dtFin := double(spdfHandle^.SPEDFiscal.Bloco_E.DT_FIN);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_E_SetDT_FIN(const spdfHandle: PSPDFHandle;
  const dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    spdfHandle^.SPEDFiscal.Bloco_E.DT_FIN := TDateTime(dtFin);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_E_GetGravado(const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if spdfHandle^.SPEDFiscal.Bloco_E.Gravado then
      Result := 1
    else
      Result := 0;

  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_E_RegistroE001New(const spdfHandle: PSPDFHandle;
  const registroE001: BlocoERegistroE001): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_E.RegistroE001New do
    begin
      IND_MOV := TACBrIndicadorMovimento(registroE001.IND_MOV);
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_E_RegistroE100New(const spdfHandle: PSPDFHandle;
  const registroE100: BlocoERegistroE100): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_E.RegistroE100New do
    begin
      DT_INI := TDateTime(registroE100.DT_INI);
      DT_FIN := TDateTime(registroE100.DT_FIN);
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_E_RegistroE110New(const spdfHandle: PSPDFHandle;
  const registroE110: BlocoERegistroE110): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_E.RegistroE110New do
    begin
      VL_TOT_DEBITOS := registroE110.VL_TOT_DEBITOS;
      VL_AJ_DEBITOS := registroE110.VL_AJ_DEBITOS;
      VL_TOT_AJ_DEBITOS := registroE110.VL_TOT_AJ_DEBITOS;
      VL_ESTORNOS_CRED := registroE110.VL_ESTORNOS_CRED;
      VL_TOT_CREDITOS := registroE110.VL_TOT_CREDITOS;
      VL_AJ_CREDITOS := registroE110.VL_AJ_CREDITOS;
      VL_TOT_AJ_CREDITOS := registroE110.VL_TOT_AJ_CREDITOS;
      VL_ESTORNOS_DEB := registroE110.VL_ESTORNOS_DEB;
      VL_SLD_CREDOR_ANT := registroE110.VL_SLD_CREDOR_ANT;
      VL_SLD_APURADO := registroE110.VL_SLD_APURADO;
      VL_TOT_DED := registroE110.VL_TOT_DED;
      VL_ICMS_RECOLHER := registroE110.VL_ICMS_RECOLHER;
      VL_SLD_CREDOR_TRANSPORTAR := registroE110.VL_SLD_CREDOR_TRANSPORTAR;
      DEB_ESP := registroE110.DEB_ESP;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_E_RegistroE111New(const spdfHandle: PSPDFHandle;
  const registroE111: BlocoERegistroE111): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_E.RegistroE111New do
    begin
      COD_AJ_APUR := registroE111.COD_AJ_APUR;
      DESCR_COMPL_AJ := registroE111.DESCR_COMPL_AJ;
      VL_AJ_APUR := registroE111.VL_AJ_APUR;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_E_RegistroE112New(const spdfHandle: PSPDFHandle;
  const registroE112: BlocoERegistroE112): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_E.RegistroE112New do
    begin
      NUM_DA := registroE112.NUM_DA;
      NUM_PROC := registroE112.NUM_PROC;
      IND_PROC := TACBrOrigemProcesso(registroE112.IND_PROC);
      PROC := registroE112.PROC;
      TXT_COMPL := registroE112.TXT_COMPL;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_E_RegistroE113New(const spdfHandle: PSPDFHandle;
  const registroE113: BlocoERegistroE113): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_E.RegistroE113New do
    begin
      COD_PART := registroE113.COD_PART;
      COD_MOD := registroE113.COD_MOD;
      SER := registroE113.SER;
      SUB := registroE113.SUB;
      NUM_DOC := registroE113.NUM_DOC;
      DT_DOC := TDateTime(registroE113.DT_DOC);
      CHV_NFE := registroE113.CHV_NFE;
      COD_ITEM := registroE113.COD_ITEM;
      VL_AJ_ITEM := registroE113.VL_AJ_ITEM;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_E_RegistroE115New(const spdfHandle: PSPDFHandle;
  const registroE115: BlocoERegistroE115): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_E.RegistroE115New do
    begin
      COD_INF_ADIC := registroE115.COD_INF_ADIC;
      VL_INF_ADIC := registroE115.VL_INF_ADIC;
      DESCR_COMPL_AJ := registroE115.DESCR_COMPL_AJ;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_E_RegistroE116New(const spdfHandle: PSPDFHandle;
  const registroE116: BlocoERegistroE116): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_E.RegistroE116New do
    begin
      COD_OR := registroE116.COD_OR;
      VL_OR := registroE116.VL_OR;
      DT_VCTO := TDateTime(registroE116.DT_VCTO);
      COD_REC := registroE116.COD_REC;
      NUM_PROC := registroE116.NUM_PROC;
      IND_PROC := TACBrOrigemProcesso(registroE116.IND_PROC);
      PROC := registroE116.PROC;
      TXT_COMPL := registroE116.TXT_COMPL;
      MES_REF := registroE116.MES_REF;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_E_RegistroE200New(const spdfHandle: PSPDFHandle;
  const registroE200: BlocoERegistroE200): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_E.RegistroE200New do
    begin
      UF := registroE200.UF;
      DT_INI := TDateTime(registroE200.DT_INI);
      DT_FIN := TDateTime(registroE200.DT_FIN);
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_E_RegistroE210New(const spdfHandle: PSPDFHandle;
  const registroE210: BlocoERegistroE210): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_E.RegistroE210New do
    begin
      IND_MOV_ST := TACBRMovimentoST(registroE210.IND_MOV_ST);
      VL_SLD_CRED_ANT_ST := registroE210.VL_SLD_CRED_ANT_ST;
      VL_DEVOL_ST := registroE210.VL_DEVOL_ST;
      VL_RESSARC_ST := registroE210.VL_RESSARC_ST;
      VL_OUT_CRED_ST := registroE210.VL_OUT_CRED_ST;
      VL_AJ_CREDITOS_ST := registroE210.VL_AJ_CREDITOS_ST;
      VL_RETENCAO_ST := registroE210.VL_RETENCAO_ST;
      VL_OUT_DEB_ST := registroE210.VL_OUT_DEB_ST;
      VL_AJ_DEBITOS_ST := registroE210.VL_AJ_DEBITOS_ST;
      VL_SLD_DEV_ANT_ST := registroE210.VL_SLD_DEV_ANT_ST;
      VL_DEDUCOES_ST := registroE210.VL_DEDUCOES_ST;
      VL_ICMS_RECOL_ST := registroE210.VL_ICMS_RECOL_ST;
      VL_SLD_CRED_ST_TRANSPORTAR := registroE210.VL_SLD_CRED_ST_TRANSPORTAR;
      DEB_ESP_ST := registroE210.DEB_ESP_ST;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_E_RegistroE220New(const spdfHandle: PSPDFHandle;
  const registroE220: BlocoERegistroE220): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_E.RegistroE220New do
    begin
      COD_AJ_APUR := registroE220.COD_AJ_APUR;
      DESCR_COMPL_AJ := registroE220.DESCR_COMPL_AJ;
      VL_AJ_APUR := registroE220.VL_AJ_APUR;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_E_RegistroE230New(const spdfHandle: PSPDFHandle;
  const registroE230: BlocoERegistroE230): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_E.RegistroE230New do
    begin
      NUM_DA := registroE230.NUM_DA;
      NUM_PROC := registroE230.NUM_PROC;
      IND_PROC := TACBrOrigemProcesso(registroE230.IND_PROC);
      PROC := registroE230.PROC;
      TXT_COMPL := registroE230.TXT_COMPL;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_E_RegistroE240New(const spdfHandle: PSPDFHandle;
  const registroE240: BlocoERegistroE240): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_E.RegistroE240New do
    begin
      COD_PART := registroE240.COD_PART;
      COD_MOD := registroE240.COD_MOD;
      SER := registroE240.SER;
      SUB := registroE240.SUB;
      NUM_DOC := registroE240.NUM_DOC;
      DT_DOC := TDateTime(registroE240.DT_DOC);
      CHV_NFE := registroE240.CHV_NFE;
      COD_ITEM := registroE240.COD_ITEM;
      VL_AJ_ITEM := registroE240.VL_AJ_ITEM;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_E_RegistroE250New(const spdfHandle: PSPDFHandle;
  const registroE250: BlocoERegistroE250): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_E.RegistroE250New do
    begin
      COD_OR := registroE250.COD_OR;
      VL_OR := registroE250.VL_OR;
      DT_VCTO := TDateTime(registroE250.DT_VCTO);
      COD_REC := registroE250.COD_REC;
      NUM_PROC := registroE250.NUM_PROC;
      IND_PROC := TACBrOrigemProcesso(registroE250.IND_PROC);
      PROC := registroE250.PROC;
      TXT_COMPL := registroE250.TXT_COMPL;
      MES_REF := registroE250.MES_REF;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_E_RegistroE500New(const spdfHandle: PSPDFHandle;
  const registroE500: BlocoERegistroE500): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_E.RegistroE500New do
    begin
      IND_APUR := TACBrApuracaoIPI(registroE500.IND_APUR);
      DT_INI := TDateTime(registroE500.DT_INI);
      DT_FIN := TDateTime(registroE500.DT_FIN);
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_E_RegistroE510New(const spdfHandle: PSPDFHandle;
  const registroE510: BlocoERegistroE510): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_E.RegistroE510New do
    begin
      CFOP := registroE510.CFOP;
      CST_IPI := registroE510.CST_IPI;
      VL_CONT_IPI := registroE510.VL_CONT_IPI;
      VL_BC_IPI := registroE510.VL_BC_IPI;
      VL_IPI := registroE510.VL_IPI;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_E_RegistroE520New(const spdfHandle: PSPDFHandle;
  const registroE520: BlocoERegistroE520): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_E.RegistroE520New do
    begin
      VL_SD_ANT_IPI := registroE520.VL_SD_ANT_IPI;
      VL_DEB_IPI := registroE520.VL_DEB_IPI;
      VL_CRED_IPI := registroE520.VL_CRED_IPI;
      VL_OD_IPI := registroE520.VL_OD_IPI;
      VL_OC_IPI := registroE520.VL_OC_IPI;
      VL_SC_IPI := registroE520.VL_SC_IPI;
      VL_SD_IPI := registroE520.VL_SD_IPI;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_E_RegistroE530New(const spdfHandle: PSPDFHandle;
  const registroE530: BlocoERegistroE530): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_E.RegistroE530New do
    begin
      IND_AJ := TACBrTipoAjuste(registroE530.IND_AJ);
      VL_AJ := registroE530.VL_AJ;
      COD_AJ := registroE530.COD_AJ;
      IND_DOC := TACBrOrigemDocto(registroE530.IND_DOC);
      NUM_DOC := registroE530.NUM_DOC;
      DESCR_AJ := registroE530.DESCR_AJ;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_E_RegistroE990_GetQTD_LIN_E(
  const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := spdfHandle^.SPEDFiscal.Bloco_E.RegistroE990.QTD_LIN_E;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion BlocoE}

{%region BlocoG}

function SPDF_Bloco_G_GetDT_INI(const spdfHandle: PSPDFHandle;
  var dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    dtIni := double(spdfHandle^.SPEDFiscal.Bloco_G.DT_INI);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_G_SetDT_INI(const spdfHandle: PSPDFHandle;
  const dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    spdfHandle^.SPEDFiscal.Bloco_G.DT_INI := TDateTime(dtIni);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_G_GetDT_FIN(const spdfHandle: PSPDFHandle;
  var dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    dtFin := double(spdfHandle^.SPEDFiscal.Bloco_G.DT_FIN);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_G_SetDT_FIN(const spdfHandle: PSPDFHandle;
  const dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    spdfHandle^.SPEDFiscal.Bloco_G.DT_FIN := TDateTime(dtFin);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_G_GetGravado(const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if spdfHandle^.SPEDFiscal.Bloco_G.Gravado then
      Result := 1
    else
      Result := 0;

  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_G_RegistroG001New(const spdfHandle: PSPDFHandle;
  const registroG001: BlocoGRegistroG001): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_G.RegistroG001New do
    begin
      IND_MOV := TACBrIndicadorMovimento(registroG001.IND_MOV);
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_G_RegistroG110New(const spdfHandle: PSPDFHandle;
  const registroG110: BlocoGRegistroG110): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_G.RegistroG110New do
    begin
      MODO_CIAP := registroG110.MODO_CIAP;
      SALDO_IN_ICMS := registroG110.SALDO_IN_ICMS;
      SALDO_FN_ICMS := registroG110.SALDO_FN_ICMS;
      SOM_PARC := registroG110.SOM_PARC;
      VL_TRIB_EXP := registroG110.VL_TRIB_EXP;
      VL_TOTAL := registroG110.VL_TOTAL;
      IND_PER_SAI := registroG110.IND_PER_SAI;
      ICMS_APROP := registroG110.ICMS_APROP;
      SOM_ICMS_OC := registroG110.SOM_ICMS_OC;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_G_RegistroG125New(const spdfHandle: PSPDFHandle;
  const registroG125: BlocoGRegistroG125): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_G.RegistroG125New do
    begin
      COD_IND_BEM := registroG125.COD_IND_BEM;
      DT_MOV := TDateTime(registroG125.DT_MOV);
      TIPO_MOV := TACBrMovimentoBens(registroG125.TIPO_MOV);
      VL_IMOB_ICMS_OP := registroG125.VL_IMOB_ICMS_OP;
      VL_IMOB_ICMS_ST := registroG125.VL_IMOB_ICMS_ST;
      VL_IMOB_ICMS_FRT := registroG125.VL_IMOB_ICMS_FRT;
      VL_IMOB_ICMS_DIF := registroG125.VL_IMOB_ICMS_DIF;
      NUM_PARC := registroG125.NUM_PARC;
      VL_PARC_PASS := registroG125.VL_PARC_PASS;
      VL_PARC_APROP := registroG125.VL_PARC_APROP;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_G_RegistroG126New(const spdfHandle: PSPDFHandle;
  const registroG126: BlocoGRegistroG126): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_G.RegistroG126New do
    begin
      DT_INI := TDateTime(registroG126.DT_INI);
      DT_FIN := TDateTime(registroG126.DT_FIN);
      NUM_PARC := registroG126.NUM_PARC;
      VL_PARC_PASS := registroG126.VL_PARC_PASS;
      VL_TRIB_OC := registroG126.VL_TRIB_OC;
      VL_TOTAL := registroG126.VL_TOTAL;
      IND_PER_SAI := registroG126.IND_PER_SAI;
      VL_PARC_APROP := registroG126.VL_PARC_APROP;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_G_RegistroG130New(const spdfHandle: PSPDFHandle;
  const registroG130: BlocoGRegistroG130): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_G.RegistroG130New do
    begin
      IND_EMIT := TACBrEmitente(registroG130.IND_EMIT);
      COD_PART := registroG130.COD_PART;
      COD_MOD := registroG130.COD_MOD;
      SERIE := registroG130.SERIE;
      NUM_DOC := registroG130.NUM_DOC;
      CHV_NFE_CTE := registroG130.CHV_NFE_CTE;
      DT_DOC := TDateTime(registroG130.DT_DOC);
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_G_RegistroG140New(const spdfHandle: PSPDFHandle;
  const registroG140: BlocoGRegistroG140): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_G.RegistroG140New do
    begin
      NUM_ITEM := registroG140.NUM_ITEM;
      COD_ITEM := registroG140.COD_ITEM;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_G_RegistroG990_GetQTD_LIN_G(
  const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := spdfHandle^.SPEDFiscal.Bloco_G.RegistroG990.QTD_LIN_G;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;


{%endregion BlocoG}

{%region BlocoH}

function SPDF_Bloco_H_GetDT_INI(const spdfHandle: PSPDFHandle;
  var dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    dtIni := double(spdfHandle^.SPEDFiscal.Bloco_H.DT_INI);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_H_SetDT_INI(const spdfHandle: PSPDFHandle;
  const dtIni: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    spdfHandle^.SPEDFiscal.Bloco_H.DT_INI := TDateTime(dtIni);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_H_GetDT_FIN(const spdfHandle: PSPDFHandle;
  var dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    dtFin := double(spdfHandle^.SPEDFiscal.Bloco_H.DT_FIN);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_H_SetDT_FIN(const spdfHandle: PSPDFHandle;
  const dtFin: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    spdfHandle^.SPEDFiscal.Bloco_H.DT_FIN := TDateTime(dtFin);
    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_H_GetGravado(const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if spdfHandle^.SPEDFiscal.Bloco_H.Gravado then
      Result := 1
    else
      Result := 0;

  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_H_RegistroH001New(const spdfHandle: PSPDFHandle;
  const registroH001: BlocoHRegistroH001): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_H.RegistroH001New do
    begin
      IND_MOV := TACBrIndicadorMovimento(registroH001.IND_MOV);
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_H_RegistroH005New(const spdfHandle: PSPDFHandle;
  const registroH005: BlocoHRegistroH005): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_H.RegistroH005New do
    begin
      DT_INV := TDateTime(registroH005.DT_INV);
      VL_INV := registroH005.VL_INV;
      MOT_INV := TACBrMotivoInventario(registroH005.MOT_INV);
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_H_RegistroH010New(const spdfHandle: PSPDFHandle;
  const registroH010: BlocoHRegistroH010): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_H.RegistroH010New do
    begin
      COD_ITEM := registroH010.COD_ITEM;
      UNID := registroH010.UNID;
      QTD := registroH010.QTD;
      VL_UNIT := registroH010.VL_UNIT;
      VL_ITEM := registroH010.VL_ITEM;
      IND_PROP := TACBrPosseItem(registroH010.IND_PROP);
      COD_PART := registroH010.COD_PART;
      TXT_COMPL := registroH010.TXT_COMPL;
      COD_CTA := registroH010.COD_CTA;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SPDF_Bloco_H_RegistroH020New(const spdfHandle: PSPDFHandle;
  const registroH020: BlocoHRegistroH020): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    with spdfHandle^.SPEDFiscal.Bloco_H.RegistroH020New do
    begin
      CST_ICMS := registroH020.CST_ICMS;
      BC_ICMS := registroH020.BC_ICMS;
      VL_ICMS := registroH020.VL_ICMS;
    end;

    Result := 0;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;


function SPDF_Bloco_H_RegistroH990_GetQTD_LIN_H(
  const spdfHandle: PSPDFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (spdfHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := spdfHandle^.SPEDFiscal.Bloco_H.RegistroH990.QTD_LIN_H;
  except
    on Exception: Exception do
    begin
      spdfHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion BlocoH}

end.
