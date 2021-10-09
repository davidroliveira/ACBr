unit ACBrCNIEEDll;

interface

uses
  Classes,
  SysUtils,
  ACBrCNIEE,
  ACBrHandlers;

type
  TCNIEERegistroRec = record
    Marca: array[0..2] of char;
    Modelo: array[0..2] of char;
    Versao: array[0..2] of char;
    Tipo: array[0..10] of char;
    MarcaDescr: array[0..30] of char;
    ModeloDescr: array[0..30] of char;
    VersaoSB: array[0..20] of char;
    QtLacreSL: integer;
    QTLacreFab: integer;
    MFD: array[0..3] of char;
    LacreMFD: array[0..3] of char;
    AtoAprovacao: array[0..25] of char;
    AtoRegistro: array[0..25] of char;
    FormatoNumero: array[0..20] of char;
  end;

{%region Declaração da funções}

function CNIEE_Create(var cnieeHandle: PCNIEEHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CNIEE_Destroy(cnieeHandle: PCNIEEHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CNIEE_GetUltimoErro(const cnieeHandle: PCNIEEHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%region Propriedades do Componente }

function CNIEE_GetArquivo(const cnieeHandle: PCNIEEHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CNIEE_SetArquivo(const cnieeHandle: PCNIEEHandle;
  const Arquivo: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CNIEE_GetVersaoArquivo(const cnieeHandle: PCNIEEHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CNIEE_GetURLDownload(const cnieeHandle: PCNIEEHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CNIEE_SetURLDownload(const cnieeHandle: PCNIEEHandle;
  const URLDownload: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CNIEE_GetProxyUser(const cnieeHandle: PCNIEEHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CNIEE_SetProxyUser(const cnieeHandle: PCNIEEHandle;
  const ProxyUser: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CNIEE_GetProxyPass(const cnieeHandle: PCNIEEHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CNIEE_SetProxyPass(const cnieeHandle: PCNIEEHandle;
  const ProxyPass: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CNIEE_GetProxyHost(const cnieeHandle: PCNIEEHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CNIEE_SetProxyHost(const cnieeHandle: PCNIEEHandle;
  const ProxyHost: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CNIEE_GetProxyPort(const cnieeHandle: PCNIEEHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CNIEE_SetProxyPort(const cnieeHandle: PCNIEEHandle;
  const ProxyPort: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CNIEE_GetParseText(const cnieeHandle: PCNIEEHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CNIEE_SetParseText(const cnieeHandle: PCNIEEHandle;
  const ParseText: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion Propriedades do Componente}

{%region Metodos do Componente }

function CNIEE_LerConfiguracoesProxy(const cnieeHandle: PCNIEEHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CNIEE_DownloadTabela(const cnieeHandle: PCNIEEHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CNIEE_AbrirTabela(const cnieeHandle: PCNIEEHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CNIEE_Exportar(const cnieeHandle: PCNIEEHandle; const path: PChar;
  const delimitador: PChar; const tipo: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CNIEE_BuscarECF(const cnieeHandle: PCNIEEHandle;
  var retRegistro: TCNIEERegistroRec; const marca, modelo, versaoSB: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CNIEE_GetRegistro(const cnieeHandle: PCNIEEHandle;
  var retRegistro: TCNIEERegistroRec; const index: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CNIEE_GetRegistroCount(const cnieeHandle: PCNIEEHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}


{%endregion}

implementation

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
CRIA um novo componente TACBrCNIEE retornando o ponteiro para o objeto criado.
Este ponteiro deve ser armazenado pela aplicação que utiliza a DLL e informado
em todas as chamadas de função relativas ao TACBrCNIEE.
}
function CNIEE_Create(var cnieeHandle: PCNIEEHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try
    New(cnieeHandle);
    cnieeHandle^.CNIEE := TACBrCNIEE.Create(nil);
    cnieeHandle^.EventHandlers := TEventHandlersCNIEE.Create();
    cnieeHandle^.UltimoErro := '';
    Result := 0;
  except
    on Exception: Exception do
    begin
      Result := -1;
      cnieeHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

{
DESTRÓI o objeto TACBrSPEDFiscal e libera a memória utilizada.
Esta função deve SEMPRE ser chamada pela aplicação que utiliza a DLL
quando o componente não mais for utilizado.
}
function CNIEE_Destroy(cnieeHandle: PCNIEEHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cnieeHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    cnieeHandle^.CNIEE.Destroy();
    cnieeHandle^.CNIEE := nil;

    Dispose(cnieeHandle);
    cnieeHandle := nil;
    Result := 0;

  except
    on Exception: Exception do
    begin
      Result := -1;
      cnieeHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

function CNIEE_GetUltimoErro(const cnieeHandle: PCNIEEHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try
    StrPLCopy(Buffer, cnieeHandle^.UltimoErro, BufferLen);
    Result := length(cnieeHandle^.UltimoErro);
  except
    on Exception: Exception do
    begin
      cnieeHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%region Propriedades do Componente }

function CNIEE_GetArquivo(const cnieeHandle: PCNIEEHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (cnieeHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := cnieeHandle^.CNIEE.Arquivo;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      cnieeHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function CNIEE_SetArquivo(const cnieeHandle: PCNIEEHandle;
  const Arquivo: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cnieeHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    cnieeHandle^.CNIEE.Arquivo := Arquivo;
    Result := 0;
  except
    on Exception: Exception do
    begin
      cnieeHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function CNIEE_GetVersaoArquivo(const cnieeHandle: PCNIEEHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (cnieeHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := cnieeHandle^.CNIEE.VersaoArquivo;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      cnieeHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function CNIEE_GetURLDownload(const cnieeHandle: PCNIEEHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (cnieeHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := cnieeHandle^.CNIEE.URLDownload;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      cnieeHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function CNIEE_SetURLDownload(const cnieeHandle: PCNIEEHandle;
  const URLDownload: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cnieeHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    cnieeHandle^.CNIEE.URLDownload := URLDownload;
    Result := 0;
  except
    on Exception: Exception do
    begin
      cnieeHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function CNIEE_GetProxyUser(const cnieeHandle: PCNIEEHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (cnieeHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := cnieeHandle^.CNIEE.ProxyUser;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      cnieeHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function CNIEE_SetProxyUser(const cnieeHandle: PCNIEEHandle;
  const ProxyUser: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cnieeHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    cnieeHandle^.CNIEE.ProxyUser := ProxyUser;
    Result := 0;
  except
    on Exception: Exception do
    begin
      cnieeHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function CNIEE_GetProxyPass(const cnieeHandle: PCNIEEHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (cnieeHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := cnieeHandle^.CNIEE.ProxyPass;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      cnieeHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function CNIEE_SetProxyPass(const cnieeHandle: PCNIEEHandle;
  const ProxyPass: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cnieeHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    cnieeHandle^.CNIEE.ProxyPass := ProxyPass;
    Result := 0;
  except
    on Exception: Exception do
    begin
      cnieeHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function CNIEE_GetProxyHost(const cnieeHandle: PCNIEEHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (cnieeHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := cnieeHandle^.CNIEE.ProxyHost;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      cnieeHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function CNIEE_SetProxyHost(const cnieeHandle: PCNIEEHandle;
  const ProxyHost: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cnieeHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    cnieeHandle^.CNIEE.ProxyHost := ProxyHost;
    Result := 0;
  except
    on Exception: Exception do
    begin
      cnieeHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function CNIEE_GetProxyPort(const cnieeHandle: PCNIEEHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (cnieeHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := cnieeHandle^.CNIEE.ProxyPort;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      cnieeHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function CNIEE_SetProxyPort(const cnieeHandle: PCNIEEHandle;
  const ProxyPort: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cnieeHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    cnieeHandle^.CNIEE.ProxyPort := ProxyPort;
    Result := 0;
  except
    on Exception: Exception do
    begin
      cnieeHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function CNIEE_GetParseText(const cnieeHandle: PCNIEEHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cnieeHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (cnieeHandle^.CNIEE.ParseText) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      cnieeHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function CNIEE_SetParseText(const cnieeHandle: PCNIEEHandle;
  const ParseText: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cnieeHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    cnieeHandle^.CNIEE.ParseText := ParseText;
    Result := 0;
  except
    on Exception: Exception do
    begin
      cnieeHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion Propriedades do Componente}

{%region Metodos do Componente }

function CNIEE_LerConfiguracoesProxy(const cnieeHandle: PCNIEEHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cnieeHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    cnieeHandle^.CNIEE.LerConfiguracoesProxy;
    Result := 0;
  except
    on Exception: Exception do
    begin
      cnieeHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CNIEE_DownloadTabela(const cnieeHandle: PCNIEEHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cnieeHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (cnieeHandle^.CNIEE.DownloadTabela) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      cnieeHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CNIEE_AbrirTabela(const cnieeHandle: PCNIEEHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cnieeHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (cnieeHandle^.CNIEE.AbrirTabela) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      cnieeHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CNIEE_Exportar(const cnieeHandle: PCNIEEHandle; const path: PChar;
  const delimitador: PChar; const tipo: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cnieeHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(delimitador) then
    begin
      cnieeHandle^.CNIEE.Exportar(path, delimitador);
    end
    else
    begin
      cnieeHandle^.CNIEE.Exportar(path, TACBrCNIEEExporta(tipo));
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      cnieeHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CNIEE_BuscarECF(const cnieeHandle: PCNIEEHandle;
  var retRegistro: TCNIEERegistroRec; const marca, modelo, versaoSB: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  Registro: TACBrCNIEERegistro;
begin

  if (cnieeHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Registro := cnieeHandle^.CNIEE.BuscarECF(marca, modelo, versaosb);
    if Registro <> nil then
    begin
      StrPLCopy(retRegistro.AtoAprovacao, Registro.AtoAprovacao, 60);
      StrPLCopy(retRegistro.Marca, Registro.CodMarca, 2);
      StrPLCopy(retRegistro.Modelo, Registro.CodModelo, 2);
      StrPLCopy(retRegistro.Versao, Registro.CodVersao, 2);
      StrPLCopy(retRegistro.Tipo, Registro.TipoECF, 10);
      StrPLCopy(retRegistro.MarcaDescr, Registro.DescrMarca, 30);
      StrPLCopy(retRegistro.ModeloDescr, Registro.DescrModelo, 30);
      StrPLCopy(retRegistro.VersaoSB, Registro.Versao, 20);
      retRegistro.QtLacreSL := Registro.QtLacresSL;
      retRegistro.QTLacreFab := Registro.QtLacresFab;
      StrPLCopy(retRegistro.MFD, Registro.TemMFD, 3);
      StrPLCopy(retRegistro.LacreMFD, Registro.TemMFD, 3);
      StrPLCopy(retRegistro.AtoAprovacao, Registro.AtoAprovacao, 25);
      StrPLCopy(retRegistro.AtoRegistro, Registro.AtoRegistro, 25);
      StrPLCopy(retRegistro.FormatoNumero, Registro.FormatoNumFabricacao, 20);
      Result := 1;
    end
    else
    begin
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      cnieeHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CNIEE_GetRegistro(const cnieeHandle: PCNIEEHandle;
  var retRegistro: TCNIEERegistroRec; const index: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  Registro: TACBrCNIEERegistro;
begin

  if (cnieeHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    if (index >= 0) and (index < cnieeHandle^.CNIEE.Cadastros.Count) then
    begin

      Registro := cnieeHandle^.CNIEE.Cadastros[index];

      StrPLCopy(retRegistro.AtoAprovacao, Registro.AtoAprovacao, 60);
      StrPLCopy(retRegistro.Marca, Registro.CodMarca, 2);
      StrPLCopy(retRegistro.Modelo, Registro.CodModelo, 2);
      StrPLCopy(retRegistro.Versao, Registro.CodVersao, 2);
      StrPLCopy(retRegistro.Tipo, Registro.TipoECF, 10);
      StrPLCopy(retRegistro.MarcaDescr, Registro.DescrMarca, 30);
      StrPLCopy(retRegistro.ModeloDescr, Registro.DescrModelo, 30);
      StrPLCopy(retRegistro.VersaoSB, Registro.Versao, 20);
      retRegistro.QtLacreSL := Registro.QtLacresSL;
      retRegistro.QTLacreFab := Registro.QtLacresFab;
      StrPLCopy(retRegistro.MFD, Registro.TemMFD, 3);
      StrPLCopy(retRegistro.LacreMFD, Registro.TemMFD, 3);
      StrPLCopy(retRegistro.AtoAprovacao, Registro.AtoAprovacao, 25);
      StrPLCopy(retRegistro.AtoRegistro, Registro.AtoRegistro, 25);
      StrPLCopy(retRegistro.FormatoNumero, Registro.FormatoNumFabricacao, 20);
      Result := 0;
    end
    else
    begin
      Result := -3;
    end;

  except
    on Exception: Exception do
    begin
      cnieeHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CNIEE_GetRegistroCount(const cnieeHandle: PCNIEEHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cnieeHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := cnieeHandle^.CNIEE.Cadastros.Count;
  except
    on Exception: Exception do
    begin
      cnieeHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

end.
