unit ACBrEADDll;

interface

uses
  SysUtils,
  Classes,
  ACBrEAD,
  ACBrUtil,
  ACBrHandlers;

{%region Declaração da funções}

{%region Constructor\Destructor\Erro}

function EAD_Create(var eadHandle: PEADHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function EAD_Destroy(eadHandle: PEADHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function EAD_GetUltimoErro(const eadHandle: PEADHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Propriedades do componente}

function EAD_GetChavePrivada(const eadHandle: PEADHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function EAD_SetChavePrivada(const eadHandle: PEADHandle; const Chave: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function EAD_GetChavePublica(const eadHandle: PEADHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function EAD_SetChavePublica(const eadHandle: PEADHandle; const Chave: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function EAD_GetOpenSSL_Version(const eadHandle: PEADHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function EAD_GetAbout(const eadHandle: PEADHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Metodos}

function EAD_GerarChaves(const eadHandle: PEADHandle; ChavePUB, ChavePRI: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function EAD_CalcularModuloeExpoente(const eadHandle: PEADHandle;
  ModuloBuffer, ExpoenteBuffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function EAD_CalcularChavePublica(const eadHandle: PEADHandle;
  ChavePUB: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function EAD_GerarXMLeECFc(const eadHandle: PEADHandle;
  const NomeSH, PathArquivo: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function EAD_ConverteXMLeECFcParaOpenSSL(const eadHandle: PEADHandle;
  const Arquivo: PChar; ChavePUB: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function EAD_CalcularHashArquivo(const eadHandle: PEADHandle;
  const Arquivo: PChar; const HashType: integer; Hash: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function EAD_CalcularHash(const eadHandle: PEADHandle; const str: PChar;
  const HashType: integer; Hash: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function EAD_CalcularEADArquivo(const eadHandle: PEADHandle;
  const Arquivo: PChar; EAD: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function EAD_CalcularEAD(const eadHandle: PEADHandle; const EString: array of PChar;
  const Count: integer; EAD: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function EAD_AssinarArquivoComEAD(const eadHandle: PEADHandle;
  const Arquivo: PChar; const Remove: boolean; EAD: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function EAD_VerificarEADArquivo(const eadHandle: PEADHandle;
  const Arquivo: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function EAD_VerificarEAD(const eadHandle: PEADHandle; const ead: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function EAD_RemoveEADArquivo(const eadHandle: PEADHandle;
  const Arquivo: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function EAD_MD5FromFile(const eadHandle: PEADHandle; const APathArquivo: PChar;
  Hash: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function EAD_MD5FromString(const eadHandle: PEADHandle; const AString: PChar;
  Hash: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Eventos}

function EAD_SetOnGetChavePublica(const eadHandle: PEADHandle;
  const method: TRetStringCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function EAD_SetOnGetChavePrivada(const eadHandle: PEADHandle;
  const method: TRetStringCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%endregion}

implementation

{%region Constructor\Destructor\Erro}

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
CRIA um novo componente TACBrEAD retornando o ponteiro para o objeto criado.
Este ponteiro deve ser armazenado pela aplicação que utiliza a DLL e informado
em todas as chamadas de função relativas ao TACBrPAF.
}
function EAD_Create(var eadHandle: PEADHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try

    New(eadHandle);
    eadHandle^.EAD := TACBrEAD.Create(nil);
    eadHandle^.EventHandlers := TEventHandlersEAD.Create();
    eadHandle^.UltimoErro := '';
    Result := 0;
  except
    on Exception: Exception do
    begin
      Result := -1;
      eadHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

{
DESTRÓI o objeto TACBrEAD e libera a memória utilizada.
Esta função deve SEMPRE ser chamada pela aplicação que utiliza a DLL
quando o componente não mais for utilizado.
}
function EAD_Destroy(eadHandle: PEADHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (eadHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    eadHandle^.EAD.Destroy();
    eadHandle^.EAD := nil;

    Dispose(eadHandle);
    eadHandle := nil;
    Result := 0;

  except
    on Exception: Exception do
    begin
      Result := -1;
      eadHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

function EAD_GetUltimoErro(const eadHandle: PEADHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try
    StrPLCopy(Buffer, eadHandle^.UltimoErro, BufferLen);
    Result := length(eadHandle^.UltimoErro);
  except
    on Exception: Exception do
    begin
      eadHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Propriedades do componente}

function EAD_GetChavePrivada(const eadHandle: PEADHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  try
    StrTmp := eadHandle^.EventHandlers.ChavePrivada;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      eadHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function EAD_SetChavePrivada(const eadHandle: PEADHandle; const Chave: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try
    if not Assigned(eadHandle^.EAD.OnGetChavePrivada) then
    begin
      eadHandle^.EAD.OnGetChavePrivada := eadHandle^.EventHandlers.GetChavePrivada;
    end;
    eadHandle^.EventHandlers.ChavePrivada := Chave;
    Result := 0;
  except
    on Exception: Exception do
    begin
      eadHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function EAD_GetChavePublica(const eadHandle: PEADHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  try
    StrTmp := eadHandle^.EventHandlers.ChavePublica;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      eadHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function EAD_SetChavePublica(const eadHandle: PEADHandle; const Chave: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  try
    if not Assigned(eadHandle^.EAD.OnGetChavePublica) then
    begin
      eadHandle^.EAD.OnGetChavePublica := eadHandle^.EventHandlers.GetChavePublica;
    end;
    eadHandle^.EventHandlers.ChavePublica := Chave;
    Result := 0;
  except
    on Exception: Exception do
    begin
      eadHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function EAD_GetOpenSSL_Version(const eadHandle: PEADHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  try
    StrTmp := eadHandle^.EAD.OpenSSL_Version;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      eadHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function EAD_GetAbout(const eadHandle: PEADHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  try
    StrTmp := eadHandle^.EAD.About;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      eadHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region Metodos}

function EAD_GerarChaves(const eadHandle: PEADHandle; ChavePUB, ChavePRI: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  ChavePublica, ChavePrivada: ansistring;
begin
  try
    if (eadHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    ChavePrivada := '';
    ChavePublica := '';
    eadHandle^.EAD.GerarChaves(ChavePublica, ChavePrivada);
    ChavePublica := StringReplace(ChavePublica, #10, sLineBreak, [rfReplaceAll]);
    ChavePrivada := StringReplace(ChavePrivada, #10, sLineBreak, [rfReplaceAll]);

    StrPLCopy(ChavePUB, ChavePublica, BufferLen);
    StrPLCopy(ChavePRI, ChavePrivada, BufferLen);
    Result := 0;
  except
    on Exception: Exception do
    begin
      eadHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function EAD_CalcularModuloeExpoente(const eadHandle: PEADHandle;
  ModuloBuffer, ExpoenteBuffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  Modulo, Expoente: ansistring;
begin
  try
    if (eadHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    Modulo := '';
    Expoente := '';
    eadHandle^.EAD.CalcularModuloeExpoente(Modulo, Expoente);

    StrPLCopy(ModuloBuffer, Modulo, BufferLen);
    StrPLCopy(ExpoenteBuffer, Expoente, BufferLen);
    Result := Length(ModuloBuffer) + Length(ExpoenteBuffer);
  except
    on Exception: Exception do
    begin
      eadHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function EAD_CalcularChavePublica(const eadHandle: PEADHandle;
  ChavePUB: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  Chave: ansistring;
begin
  try
    if (eadHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    Chave := eadHandle^.EAD.CalcularChavePublica;
    Chave := StringReplace(Chave, #10, sLineBreak, [rfReplaceAll]);
    StrPLCopy(ChavePUB, Chave, BufferLen);
    Result := Length(ChavePUB);
  except
    on Exception: Exception do
    begin
      eadHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function EAD_GerarXMLeECFc(const eadHandle: PEADHandle;
  const NomeSH, PathArquivo: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  try
    if (eadHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    if Assigned(PathArquivo) then
      eadHandle^.EAD.GerarXMLeECFc(NomeSH, PathArquivo)
    else
      eadHandle^.EAD.GerarXMLeECFc(NomeSH);
    Result := 0;
  except
    on Exception: Exception do
    begin
      eadHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function EAD_ConverteXMLeECFcParaOpenSSL(const eadHandle: PEADHandle;
  const Arquivo: PChar; ChavePUB: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  TempSTR: ansistring;
begin
  try
    if (eadHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    TempSTR := eadHandle^.EAD.ConverteXMLeECFcParaOpenSSL(Arquivo);
    TempSTR := StringReplace(TempSTR, #10, sLineBreak, [rfReplaceAll]);
    StrPLCopy(ChavePUB, TempSTR, BufferLen);
    Result := Length(ChavePUB);
  except
    on Exception: Exception do
    begin
      eadHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function EAD_CalcularHashArquivo(const eadHandle: PEADHandle;
  const Arquivo: PChar; const HashType: integer; Hash: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  TempSTR: ansistring;
begin
  try
    if (eadHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    TempSTR := eadHandle^.EAD.CalcularHashArquivo(Arquivo, TACBrEADDgst(HashType));
    StrPLCopy(Hash, TempSTR, BufferLen);
    Result := Length(Hash);
  except
    on Exception: Exception do
    begin
      eadHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function EAD_CalcularHash(const eadHandle: PEADHandle; const str: PChar;
  const HashType: integer; Hash: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  TempSTR: ansistring;
begin
  try
    if (eadHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    TempSTR := eadHandle^.EAD.CalcularHash(str, TACBrEADDgst(HashType));
    StrPLCopy(Hash, TempSTR, BufferLen);
    Result := Length(Hash);
  except
    on Exception: Exception do
    begin
      eadHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function EAD_CalcularEADArquivo(const eadHandle: PEADHandle;
  const Arquivo: PChar; EAD: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  TempSTR: ansistring;
begin
  try
    if (eadHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    TempSTR := eadHandle^.EAD.CalcularEADArquivo(Arquivo);
    StrPLCopy(EAD, TempSTR, BufferLen);
    Result := Length(EAD);
  except
    on Exception: Exception do
    begin
      eadHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function EAD_CalcularEAD(const eadHandle: PEADHandle; const EString: array of PChar;
  const Count: integer; EAD: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  TempSTR: ansistring;
  StringList: TStringList;
  i: integer;
begin
  try
    if (eadHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    StringList := TStringList.Create;

    for i := 0 to Count do
    begin
      StringList.Add(Estring[i]);
    end;

    TempSTR := eadHandle^.EAD.CalcularEAD(StringList);
    StrPLCopy(EAD, TempSTR, BufferLen);
    Result := Length(EAD);
  except
    on Exception: Exception do
    begin
      eadHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function EAD_AssinarArquivoComEAD(const eadHandle: PEADHandle;
  const Arquivo: PChar; const Remove: boolean; EAD: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  TempSTR: ansistring;
begin
  try
    if (eadHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    TempSTR := eadHandle^.EAD.AssinarArquivoComEAD(Arquivo, Remove);
    StrPLCopy(EAD, TempSTR, BufferLen);
    Result := Length(EAD);
  except
    on Exception: Exception do
    begin
      eadHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function EAD_VerificarEADArquivo(const eadHandle: PEADHandle;
  const Arquivo: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  try
    if (eadHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    if (eadHandle^.EAD.VerificarEADArquivo(Arquivo)) then
      Result := 1
    else
      Result := 0;

  except
    on Exception: Exception do
    begin
      eadHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function EAD_VerificarEAD(const eadHandle: PEADHandle; const ead: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  try
    if (eadHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    if (eadHandle^.EAD.VerificarEAD(ead)) then
      Result := 1
    else
      Result := 0;

  except
    on Exception: Exception do
    begin
      eadHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function EAD_RemoveEADArquivo(const eadHandle: PEADHandle;
  const Arquivo: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  try
    if (eadHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    eadHandle^.EAD.RemoveEADArquivo(Arquivo);
    Result := 0;
  except
    on Exception: Exception do
    begin
      eadHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function EAD_MD5FromFile(const eadHandle: PEADHandle; const APathArquivo: PChar;
  Hash: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  TempSTR: ansistring;
begin
  try
    if (eadHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    TempSTR := eadHandle^.EAD.MD5FromFile(APathArquivo);
    StrPLCopy(Hash, TempSTR, BufferLen);
    Result := Length(Hash);
  except
    on Exception: Exception do
    begin
      eadHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function EAD_MD5FromString(const eadHandle: PEADHandle; const AString: PChar;
  Hash: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  TempSTR: ansistring;
begin
  try
    if (eadHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    TempSTR := eadHandle^.EAD.MD5FromString(AString);
    StrPLCopy(Hash, TempSTR, BufferLen);
    Result := Length(Hash);
  except
    on Exception: Exception do
    begin
      eadHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Eventos}

function EAD_SetOnGetChavePublica(const eadHandle: PEADHandle;
  const method: TRetStringCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (eadHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      eadHandle^.EAD.OnGetChavePublica := eadHandle^.EventHandlers.GetChavePublica;
      eadHandle^.EventHandlers.OnGetChavePublicaCallback := method;
      Result := 0;
    end
    else
    begin
      eadHandle^.EAD.OnGetChavePublica := nil;
      eadHandle^.EventHandlers.OnGetChavePublicaCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      eadHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function EAD_SetOnGetChavePrivada(const eadHandle: PEADHandle;
  const method: TRetStringCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (eadHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      eadHandle^.EAD.OnGetChavePrivada := eadHandle^.EventHandlers.GetChavePrivada;
      eadHandle^.EventHandlers.OnGetChavePrivadaCallback := method;
      Result := 0;
    end
    else
    begin
      eadHandle^.EAD.OnGetChavePrivada := nil;
      eadHandle^.EventHandlers.OnGetChavePrivadaCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      eadHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

end.
