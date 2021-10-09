unit ACBrBALDll;

interface

uses
  SysUtils,
  Classes,
  ACBrBal,
  ACBrHandlers;

{%region Declaração da funções}

{%region Constructor/Destructor/Ultimo Erro}

function BAL_Create(var balHandle: PBALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function BAL_Destroy(balHandle: PBALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function BAL_GetUltimoErro(const balHandle: PBALHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Propriedades}

function BAL_GetModelo(const balHandle: PBALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function BAL_SetModelo(const balHandle: PBALHandle; const Modelo: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function BAL_GetModeloStr(const balHandle: PBALHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function BAL_GetPorta(const balHandle: PBALHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function BAL_SetPorta(const balHandle: PBALHandle; const Porta: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function BAL_GetAtivo(const balHandle: PBALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function BAL_GetMonitoraBalanca(const balHandle: PBALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function BAL_SetMonitoraBalanca(const balHandle: PBALHandle;
  const monitora: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function BAL_GetUltimoPesoLido(const balHandle: PBALHandle; var peso: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function BAL_GetUltimaResposta(const balHandle: PBALHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Metodos}

function BAL_Ativar(const balHandle: PBALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function BAL_Desativar(const balHandle: PBALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function BAL_LePeso(const balHandle: PBALHandle; const timeout: integer;
  var peso: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Eventos}

function BAL_SetOnLePeso(const balHandle: PBALHandle;
  const method: TLePesoCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%endregion}


implementation

{%region Constructor/Destructor/Ultimo Erro}

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
CRIA um novo componente TACBrBAL retornando o ponteiro para o objeto criado.
Este ponteiro deve ser armazenado pela aplicação que utiliza a DLL e informado
em todas as chamadas de função relativas ao TACBrBAL
}
function BAL_Create(var balHandle: PBALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try

    New(balHandle);

    balHandle^.BAL := TACBrBAL.Create(nil);
    balHandle^.EventHandlers := TEventHandlersBAL.Create();
    balHandle^.BAL.MonitorarBalanca := False;
    balHandle^.UltimoErro := '';

    Result := 0;

  except
    on Exception: Exception do
    begin
      Result := -1;
      balHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

{
DESTRÓI o objeto TACBrBAL e libera a memória utilizada.
Esta função deve SEMPRE ser chamada pela aplicação que utiliza a DLL
quando o componente não mais for utilizado.
}
function BAL_Destroy(balHandle: PBALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try

    if (balHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    balHandle^.BAL.Destroy();
    balHandle^.BAL := nil;

    Dispose(balHandle);
    balHandle := nil;
    Result := 0;

  except
    on Exception: Exception do
    begin
      Result := -1;
      balHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

function BAL_GetUltimoErro(const balHandle: PBALHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (balHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrPLCopy(Buffer, balHandle^.UltimoErro, BufferLen);
    Result := length(balHandle^.UltimoErro);
  except
    on Exception: Exception do
    begin
      balHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Propriedades}

function BAL_GetModelo(const balHandle: PBALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (balHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(balHandle^.BAL.Modelo);
  except
    on Exception: Exception do
    begin
      balHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function BAL_SetModelo(const balHandle: PBALHandle; const Modelo: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (balHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    balHandle^.BAL.Modelo := TACBrBALModelo(Modelo);
    Result := 0;
  except
    on Exception: Exception do
    begin
      balHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function BAL_GetModeloStr(const balHandle: PBALHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (balHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := balHandle^.BAL.ModeloStr;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      balHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function BAL_GetPorta(const balHandle: PBALHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (balHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := balHandle^.BAL.Porta;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      balHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function BAL_SetPorta(const balHandle: PBALHandle; const Porta: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (balHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    balHandle^.BAL.Porta := Porta;
    Result := 0;
  except
    on Exception: Exception do
    begin
      balHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function BAL_GetAtivo(const balHandle: PBALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (balHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (balHandle^.BAL.Ativo) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      balHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function BAL_GetMonitoraBalanca(const balHandle: PBALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (balHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if balHandle^.BAL.MonitorarBalanca then
      Result := 1
    else
      Result := 0;

  except
    on Exception: Exception do
    begin
      balHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function BAL_SetMonitoraBalanca(const balHandle: PBALHandle;
  const monitora: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (balHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    balHandle^.BAL.MonitorarBalanca := monitora;

  except
    on Exception: Exception do
    begin
      balHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function BAL_GetUltimoPesoLido(const balHandle: PBALHandle; var peso: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (balHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    peso := balHandle^.BAL.UltimoPesoLido;
    Result := 0;
  except
    on Exception: Exception do
    begin
      balHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function BAL_GetUltimaResposta(const balHandle: PBALHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (balHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := balHandle^.BAL.UltimaResposta;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      balHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region Metodos}

function BAL_Ativar(const balHandle: PBALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (balHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    balHandle^.BAL.Ativar;
    Result := 0;
  except
    on Exception: Exception do
    begin
      balHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function BAL_Desativar(const balHandle: PBALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (balHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    balHandle^.BAL.Desativar;
    Result := 0;
  except
    on Exception: Exception do
    begin
      balHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function BAL_LePeso(const balHandle: PBALHandle; const timeout: integer;
  var peso: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (balHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    peso := balHandle^.BAL.LePeso(timeout);
    Result := 0;
  except
    on Exception: Exception do
    begin
      balHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region Eventos}

function BAL_SetOnLePeso(const balHandle: PBALHandle;
  const method: TLePesoCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (balHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      balHandle^.BAL.OnLePeso := balHandle^.EventHandlers.OnLePeso;
      balHandle^.EventHandlers.OnLePesoCallback := method;
      Result := 0;
    end
    else
    begin
      balHandle^.BAL.OnLePeso := nil;
      balHandle^.EventHandlers.OnLePesoCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      balHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}


end.
