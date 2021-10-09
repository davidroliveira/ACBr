unit ACBrLCBDll;

interface

uses
  SysUtils,
  Classes,
  ACBrLCB,
  ACBrHandlers;

{%region Declaração da funções}

function LCB_Create(var lcbHandle: PLCBHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function LCB_Destroy(lcbHandle: PLCBHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function LCB_GetUltimoErro(const lcbHandle: PLCBHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function LCB_Ativar(const lcbHandle: PLCBHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function LCB_Desativar(const lcbHandle: PLCBHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function LCB_GetPorta(const lcbHandle: PLCBHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function LCB_SetPorta(const lcbHandle: PLCBHandle; const Porta: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function LCB_GetAtivo(const lcbHandle: PLCBHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function LCB_GetUltimoCodigo(const lcbHandle: PLCBHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function LCB_GetUltimaLeitura(const lcbHandle: PLCBHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function LCB_LerString(const lcbHandle: PLCBHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function LCB_SetOnLeCodigo(const lcbHandle: PLCBHandle;
  const method: TNoArgumentsCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function LCB_SetOnLeFila(const lcbHandle: PLCBHandle; const method: TNoArgumentsCallback): integer;
 {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

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
CRIA um novo componente TACBrLCB retornando o ponteiro para o objeto criado.
Este ponteiro deve ser armazenado pela aplicação que utiliza a DLL e informado
em todas as chamadas de função relativas ao TACBrLCB
}

function LCB_Create(var lcbHandle: PLCBHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try

    New(lcbHandle);

    lcbHandle^.LCB := TACBrLCB.Create(nil);
    lcbHandle^.EventHandlers := TEventHandlersLCB.Create();
    lcbHandle^.UltimoErro := '';
    Result := 0;

  except
    on Exception: Exception do
    begin
      Result := -1;
      lcbHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

{
DESTRÓI o objeto TACBrLCB e libera a memória utilizada.
Esta função deve SEMPRE ser chamada pela aplicação que utiliza a DLL
quando o componente não mais for utilizado.
}
function LCB_Destroy(lcbHandle: PLCBHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try

    if (lcbHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    lcbHandle^.LCB.Destroy();
    lcbHandle^.LCB := nil;

    Dispose(lcbHandle);
    lcbHandle := nil;
    Result := 0;

  except
    on Exception: Exception do
    begin
      Result := -1;
      lcbHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

function LCB_GetUltimoErro(const lcbHandle: PLCBHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (lcbHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrPLCopy(Buffer, lcbHandle^.UltimoErro, BufferLen);
    Result := length(lcbHandle^.UltimoErro);
  except
    on Exception: Exception do
    begin
      lcbHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function LCB_Ativar(const lcbHandle: PLCBHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (lcbHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    lcbHandle^.LCB.Ativar;
    Result := 0;
  except
    on Exception: Exception do
    begin
      lcbHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function LCB_Desativar(const lcbHandle: PLCBHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (lcbHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    lcbHandle^.LCB.Desativar;
    Result := 0;
  except
    on Exception: Exception do
    begin
      lcbHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function LCB_GetPorta(const lcbHandle: PLCBHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (lcbHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := lcbHandle^.LCB.Porta;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      lcbHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function LCB_SetPorta(const lcbHandle: PLCBHandle; const Porta: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (lcbHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    lcbHandle^.LCB.Porta := Porta;
    Result := 0;
  except
    on Exception: Exception do
    begin
      lcbHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function LCB_GetAtivo(const lcbHandle: PLCBHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (lcbHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (lcbHandle^.LCB.Ativo) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      lcbHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function LCB_GetUltimoCodigo(const lcbHandle: PLCBHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (lcbHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := lcbHandle^.LCB.UltimoCodigo;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      lcbHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function LCB_GetUltimaLeitura(const lcbHandle: PLCBHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (lcbHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := lcbHandle^.LCB.UltimaLeitura;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      lcbHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function LCB_LerString(const lcbHandle: PLCBHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (lcbHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := lcbHandle^.LCB.LerString;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      lcbHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function LCB_SetOnLeCodigo(const lcbHandle: PLCBHandle;
  const method: TNoArgumentsCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (lcbHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      lcbHandle^.LCB.OnLeCodigo := lcbHandle^.EventHandlers.OnLeCodigo;
      lcbHandle^.EventHandlers.OnLeCodigoCallback := method;
      Result := 0;
    end
    else
    begin
      lcbHandle^.LCB.OnLeCodigo := nil;
      lcbHandle^.EventHandlers.OnLeCodigoCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      lcbHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function LCB_SetOnLeFila(const lcbHandle: PLCBHandle; const method: TNoArgumentsCallback): integer;
 {$IFDEF STDCALL} stdcall {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (lcbHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      lcbHandle^.LCB.OnLeFila := lcbHandle^.EventHandlers.OnLeFila;
      lcbHandle^.EventHandlers.OnLeFilaCallback := method;
      Result := 0;
    end
    else
    begin
      lcbHandle^.LCB.OnLeFila := nil;
      lcbHandle^.EventHandlers.OnLeFilaCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      lcbHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;


end.
