unit ACBrPosPrinterDll;

{$mode delphi}

interface

uses
  Classes,
  SysUtils,
  ACBrHandlers,
  ACBrPosPrinter;

{%region Declaração da funções}

{%region Constructor/Destructor}

function POS_Create(var posHandle: PPOSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function POS_Destroy(posHandle: PPOSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function POS_GetUltimoErro(const posHandle: PPOSHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Propriedades}

function POS_GetInicializada(const posHandle: PPOSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function POS_GetAtivo(const posHandle: PPOSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function POS_SetAtivo(const posHandle: PPOSHandle; const Ativo: boolean): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function POS_GetColunas(const posHandle: PPOSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function POS_GetColunasFonteNormal(const posHandle: PPOSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function POS_GetColunasFonteExpandida(const posHandle: PPOSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function POS_GetColunasFonteCondensada(const posHandle: PPOSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion Propriedades}

{%region Fontes}

function POS_GetAlinhamento(const posHandle: PPOSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function POS_GetFonteStatus(const posHandle: PPOSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion Fontes}

{%region Buffer }

function POS_SetBuffer(const posHandle: PPOSHandle; var linhas: array of PChar;
  const LinhasCount: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function POS_GetBuffer(const posHandle: PPOSHandle; linha: PChar;
  const BufferLen, index: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function POS_GetBufferCount(const posHandle: PPOSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion Buffer}

{%endregion Declaração da funções}

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
CRIA um novo componente TACBrPosPrinter retornando o ponteiro para o objeto criado.
Este ponteiro deve ser armazenado pela aplicação que utiliza a DLL e informado
em todas as chamadas de função relativas ao TACBrPosPrinter
}
function POS_Create(var posHandle: PPOSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try

    New(posHandle);

    posHandle^.POS := TACBrPosPrinter.Create(nil);
    posHandle^.EventHandlers := TEventHandlersPOS.Create();
    posHandle^.UltimoErro := '';
    Result := 0;

  except
    on Exception: Exception do
    begin
      Result := -1;
      posHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

{
DESTRÓI o objeto TACBrPosPrinter e libera a memória utilizada.
Esta função deve SEMPRE ser chamada pela aplicação que utiliza a DLL
quando o componente não mais for utilizado.
}
function POS_Destroy(posHandle: PPOSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (posHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    posHandle^.POS.Destroy();
    posHandle^.POS := nil;
    Dispose(posHandle);
    posHandle := nil;
    Result := 0;

  except
    on Exception: Exception do
    begin
      Result := -1;
      posHandle^.UltimoErro := Exception.Message;
    end
  end;
end;

function POS_GetUltimoErro(const posHandle: PPOSHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try
    StrPLCopy(Buffer, posHandle^.UltimoErro, BufferLen);
    Result := length(posHandle^.UltimoErro);
  except
    on Exception: Exception do
    begin
      posHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Propriedades}

function POS_GetInicializada(const posHandle: PPOSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (posHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if posHandle^.POS.Inicializada then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      posHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function POS_GetAtivo(const posHandle: PPOSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (posHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if posHandle^.POS.Ativo then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      posHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function POS_SetAtivo(const posHandle: PPOSHandle; const Ativo: boolean): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (posHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    posHandle^.POS.Ativo := Ativo;
    Result := 0;
  except
    on Exception: Exception do
    begin
      posHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function POS_GetColunas(const posHandle: PPOSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (posHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := posHandle^.POS.Colunas;
  except
    on Exception: Exception do
    begin
      posHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function POS_GetColunasFonteNormal(const posHandle: PPOSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (posHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := posHandle^.POS.ColunasFonteNormal;
  except
    on Exception: Exception do
    begin
      posHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function POS_GetColunasFonteExpandida(const posHandle: PPOSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (posHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := posHandle^.POS.ColunasFonteExpandida;
  except
    on Exception: Exception do
    begin
      posHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function POS_GetColunasFonteCondensada(const posHandle: PPOSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (posHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := posHandle^.POS.ColunasFonteCondensada;
  except
    on Exception: Exception do
    begin
      posHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion Propriedades}

{%region Fontes}

function POS_GetAlinhamento(const posHandle: PPOSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (posHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := Integer(posHandle^.POS.Alinhamento);
  except
    on Exception: Exception do
    begin
      posHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function POS_GetFonteStatus(const posHandle: PPOSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
Var
  i: TACBrPosTipoFonte;
begin

  if (posHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := 0;
    for i := Low(TACBrPosTipoFonte) to High(TACBrPosTipoFonte) do
    begin
      if i in posHandle^.POS.FonteStatus then
        Result := Result + (1 << Ord(i));
    end;
  except
    on Exception: Exception do
    begin
      posHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion Fontes}

{%region Buffer }

function POS_SetBuffer(const posHandle: PPOSHandle; var linhas: array of PChar;
  const LinhasCount: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  i: integer;
begin

  if (posHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    posHandle^.POS.Buffer.Clear;
    for i := 0 to LinhasCount - 1 do
    begin
      posHandle^.POS.Buffer.Add(linhas[i]);
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      posHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function POS_GetBuffer(const posHandle: PPOSHandle; linha: PChar;
  const BufferLen, index: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  strTmp: string;
begin

  if (posHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := posHandle^.POS.Buffer[index];
    StrPLCopy(linha, strTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      posHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function POS_GetBufferCount(const posHandle: PPOSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (posHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := posHandle^.POS.Buffer.Count;
  except
    on Exception: Exception do
    begin
      posHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion Buffer }

end.
