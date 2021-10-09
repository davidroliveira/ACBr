unit ACBrValidadorDll;

interface

uses
  Classes,
  SysUtils,
  ACBrValidador,
  ACBrHandlers;

{%region Declaração da funções}

 {%region Create/Destroy/Erro}

function VAL_Create(var valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_Destroy(valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_GetUltimoErro(const valHandle: PVALHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Funções mapeando as propriedades do componente}

function VAL_GetDocumento(const valHandle: PVALHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_SetDocumento(const valHandle: PVALHandle; const Arquivo: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_GetComplemento(const valHandle: PVALHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_SetComplemento(const valHandle: PVALHandle;
  const Complemento: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_GetIgnorarChar(const valHandle: PVALHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_SetIgnorarChar(const valHandle: PVALHandle;
  const IgnorarChar: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_GetTipoDocto(const valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_SetTipoDocto(const valHandle: PVALHandle;
  const TipoDocto: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_GetAjustarTamanho(const valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_SetAjustarTamanho(const valHandle: PVALHandle;
  const AjustarTamanho: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_GetExibeDigitoCorreto(const valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_SetExibeDigitoCorreto(const valHandle: PVALHandle;
  const ExibeDigitoCorreto: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_GetPermiteVazio(const valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_SetPermiteVazio(const valHandle: PVALHandle;
  const PermiteVazio: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_GetRaiseExcept(const valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_SetRaiseExcept(const valHandle: PVALHandle;
  const RaiseExcept: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Funções mapeando as propriedades do componente não visiveis}

function VAL_GetDoctoValidado(const valHandle: PVALHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_GetMsgErro(const valHandle: PVALHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_GetDigitoCalculado(const valHandle: PVALHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Modulo}

function VAL_Modulo_GetDocumento(const valHandle: PVALHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_Modulo_SetDocumento(const valHandle: PVALHandle;
  const Value: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_Modulo_GetMultiplicadorInicial(const valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_Modulo_SetMultiplicadorInicial(const valHandle: PVALHandle;
  const Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_Modulo_GetMultiplicadorFinal(const valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_Modulo_SetMultiplicadorFinal(const valHandle: PVALHandle;
  const Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_Modulo_GetMultiplicadorAtual(const valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_Modulo_SetMultiplicadorAtual(const valHandle: PVALHandle;
  const Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_Modulo_GetDigitoFinal(const valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_Modulo_GetModuloFinal(const valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_Modulo_GetSomaDigitos(const valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_Modulo_GetFormulaDigito(const valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_Modulo_SetFormulaDigito(const valHandle: PVALHandle;
  const Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_Modulo_Calcular(const valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_Modulo_CalculoPadrao(const valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Metodos do Componente}

function VAL_Validar(const valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function VAL_Formatar(const valHandle: PVALHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Eventos}

function VAL_SetOnMsgErro(const valHandle: PVALHandle;
  const method: TStringCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

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
CRIA um novo componente TACBrValidador retornando o ponteiro para o objeto criado.
Este ponteiro deve ser armazenado pela aplicação que utiliza a DLL e informado
em todas as chamadas de função relativas ao TACBrValidador.
}
function VAL_Create(var valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try
    New(valHandle);
    valHandle^.Val := TACBrValidador.Create(nil);
    valHandle^.EventHandlers := TEventHandlersVal.Create();
    valHandle^.UltimoErro := '';
    Result := 0;
  except
    on Exception: Exception do
    begin
      Result := -1;
      valHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

{
DESTRÓI o objeto TACBrValidador e libera a memória utilizada.
Esta função deve SEMPRE ser chamada pela aplicação que utiliza a DLL
quando o componente não mais for utilizado.
}
function VAL_Destroy(valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    valHandle^.Val.Destroy();
    valHandle^.Val := nil;

    Dispose(valHandle);
    valHandle := nil;
    Result := 0;

  except
    on Exception: Exception do
    begin
      Result := -1;
      valHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

function VAL_GetUltimoErro(const valHandle: PVALHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try
    StrPLCopy(Buffer, valHandle^.UltimoErro, BufferLen);
    Result := length(valHandle^.UltimoErro);
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Funções mapeando as propriedades do componente}

function VAL_GetDocumento(const valHandle: PVALHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := valHandle^.Val.Documento;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function VAL_SetDocumento(const valHandle: PVALHandle; const Arquivo: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    valHandle^.Val.Documento := Arquivo;
    Result := 0;
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function VAL_GetComplemento(const valHandle: PVALHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := valHandle^.Val.Complemento;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function VAL_SetComplemento(const valHandle: PVALHandle;
  const Complemento: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    valHandle^.Val.Complemento := Complemento;
    Result := 0;
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function VAL_GetIgnorarChar(const valHandle: PVALHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := valHandle^.Val.IgnorarChar;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function VAL_SetIgnorarChar(const valHandle: PVALHandle;
  const IgnorarChar: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    valHandle^.Val.IgnorarChar := IgnorarChar;
    Result := 0;
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function VAL_GetTipoDocto(const valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(valHandle^.Val.TipoDocto);
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function VAL_SetTipoDocto(const valHandle: PVALHandle;
  const TipoDocto: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    valHandle^.Val.TipoDocto := TACBrValTipoDocto(TipoDocto);
    Result := 0;
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function VAL_GetAjustarTamanho(const valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if valHandle^.Val.AjustarTamanho then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function VAL_SetAjustarTamanho(const valHandle: PVALHandle;
  const AjustarTamanho: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    valHandle^.VAL.AjustarTamanho := AjustarTamanho;
    Result := 0;
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function VAL_GetExibeDigitoCorreto(const valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if valHandle^.Val.ExibeDigitoCorreto then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function VAL_SetExibeDigitoCorreto(const valHandle: PVALHandle;
  const ExibeDigitoCorreto: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    valHandle^.VAL.ExibeDigitoCorreto := ExibeDigitoCorreto;
    Result := 0;
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function VAL_GetPermiteVazio(const valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if valHandle^.Val.PermiteVazio then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function VAL_SetPermiteVazio(const valHandle: PVALHandle;
  const PermiteVazio: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    valHandle^.VAL.PermiteVazio := PermiteVazio;
    Result := 0;
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function VAL_GetRaiseExcept(const valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if valHandle^.Val.RaiseExcept then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function VAL_SetRaiseExcept(const valHandle: PVALHandle;
  const RaiseExcept: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    valHandle^.VAL.RaiseExcept := RaiseExcept;
    Result := 0;
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Funções mapeando as propriedades do componente não visiveis}

function VAL_GetDoctoValidado(const valHandle: PVALHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := valHandle^.Val.DoctoValidado;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function VAL_GetMsgErro(const valHandle: PVALHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := valHandle^.Val.MsgErro;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function VAL_GetDigitoCalculado(const valHandle: PVALHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := valHandle^.Val.DigitoCalculado;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Modulo}

function VAL_Modulo_GetDocumento(const valHandle: PVALHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := valHandle^.Val.Modulo.Documento;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function VAL_Modulo_SetDocumento(const valHandle: PVALHandle;
  const Value: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    valHandle^.Val.Modulo.Documento := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function VAL_Modulo_GetMultiplicadorInicial(const valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := valHandle^.Val.Modulo.MultiplicadorInicial;
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function VAL_Modulo_SetMultiplicadorInicial(const valHandle: PVALHandle;
  const Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    valHandle^.Val.Modulo.MultiplicadorInicial := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function VAL_Modulo_GetMultiplicadorFinal(const valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := valHandle^.Val.Modulo.MultiplicadorFinal;
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function VAL_Modulo_SetMultiplicadorFinal(const valHandle: PVALHandle;
  const Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    valHandle^.Val.Modulo.MultiplicadorFinal := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function VAL_Modulo_GetMultiplicadorAtual(const valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := valHandle^.Val.Modulo.MultiplicadorAtual;
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function VAL_Modulo_SetMultiplicadorAtual(const valHandle: PVALHandle;
  const Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    valHandle^.Val.Modulo.MultiplicadorAtual := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function VAL_Modulo_GetDigitoFinal(const valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := valHandle^.Val.Modulo.DigitoFinal;
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function VAL_Modulo_GetModuloFinal(const valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := valHandle^.Val.Modulo.ModuloFinal;
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function VAL_Modulo_GetSomaDigitos(const valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := valHandle^.Val.Modulo.SomaDigitos;
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function VAL_Modulo_GetFormulaDigito(const valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(valHandle^.Val.Modulo.FormulaDigito);
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function VAL_Modulo_SetFormulaDigito(const valHandle: PVALHandle;
  const Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    valHandle^.Val.Modulo.FormulaDigito := TACBrCalcDigFormula(Value);
    Result := 0;
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function VAL_Modulo_Calcular(const valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    valHandle^.Val.Modulo.Calcular;
    Result := 0;
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function VAL_Modulo_CalculoPadrao(const valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    valHandle^.Val.Modulo.CalculoPadrao;
    Result := 0;
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region Metodos do Componente}

function VAL_Validar(const valHandle: PVALHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if valHandle^.Val.Validar then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function VAL_Formatar(const valHandle: PVALHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := valHandle^.Val.Formatar;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
    Result := 0;
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Eventos}

function VAL_SetOnMsgErro(const valHandle: PVALHandle;
  const method: TStringCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (valHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      valHandle^.Val.OnMsgErro := valHandle^.EventHandlers.OnMsgErro;
      valHandle^.EventHandlers.OnMsgErroCallback := method;
      Result := 0;
    end
    else
    begin
      valHandle^.Val.OnMsgErro := nil;
      valHandle^.EventHandlers.OnMsgErroCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      valHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

end.
