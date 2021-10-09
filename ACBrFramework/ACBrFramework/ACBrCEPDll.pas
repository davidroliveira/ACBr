unit ACBrCEPDll;


interface

uses
  Classes, SysUtils,
  ACBrCEP, ACBrHandlers;

{%region Declaração da funções}

{%region Constructor/Destructor }

function CEP_Create(var cepHandle: PCEPHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_Destroy(cepHandle: PCEPHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_GetUltimoErro(const cepHandle: PCEPHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Funções mapeando as propriedades do componente }

function CEP_GetChaveAcesso(const cepHandle: PCEPHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_SetChaveAcesso(const cepHandle: PCEPHandle; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_GetUsuario(const cepHandle: PCEPHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_SetUsuario(const cepHandle: PCEPHandle; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_GetSenha(const cepHandle: PCEPHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_SetSenha(const cepHandle: PCEPHandle; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_GetURL(const cepHandle: PCEPHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_GetParseText(const cepHandle: PCEPHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_SetParseText(const cepHandle: PCEPHandle; const Value: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_GetProxyHost(const cepHandle: PCEPHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_SetProxyHost(const cepHandle: PCEPHandle; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_GetProxyPort(const cepHandle: PCEPHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_SetProxyPort(const cepHandle: PCEPHandle; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_GetProxyUser(const cepHandle: PCEPHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_SetProxyUser(const cepHandle: PCEPHandle; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_GetProxyPass(const cepHandle: PCEPHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_SetProxyPass(const cepHandle: PCEPHandle; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_GetWebService(const cepHandle: PCEPHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_SetWebService(const cepHandle: PCEPHandle;
  const Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Endereços }

function CEP_GetEnderecos(const cepHandle: PCEPHandle;
  var endsHandle: TACBrCEPEnderecos): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_Enderecos_GetCount(const cepHandle: PCEPHandle;
  const endsHandle: TACBrCEPEnderecos): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_Enderecos_GetItem(const cepHandle: PCEPHandle;
  const endsHandle: TACBrCEPEnderecos; const index: integer;
  var endHandle: TACBrCEPEndereco): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Endereço }

function CEP_Endereco_GetCEP(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_Endereco_SetCEP(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_Endereco_GetBairro(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_Endereco_SetBairro(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_Endereco_GetComplemento(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_Endereco_SetComplemento(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_Endereco_GetTipo_Logradouro(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_Endereco_SetTipo_Logradouro(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_Endereco_GetLogradouro(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_Endereco_SetLogradouro(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_Endereco_GetMunicipio(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_Endereco_SetMunicipio(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_Endereco_GetUF(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_Endereco_SetUF(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_Endereco_GetIBGE_Municipio(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_Endereco_SetIBGE_Municipio(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_Endereco_GetIBGE_UF(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion }

{%region Metodos }

function CEP_LerConfiguracoesProxy(const cepHandle: PCEPHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_BuscarPorCEP(const cepHandle: PCEPHandle; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_BuscarPorLogradouro(const cepHandle: PCEPHandle;
  const ACidade, ATipo_Logradouro, ALogradouro, AUF, ABairro: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Eventos }

function CEP_SetOnBuscaEfetuada(const cepHandle: PCEPHandle;
  const method: TNoArgumentsCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function CEP_SetOnAntesAbrirHTTP(const cepHandle: PCEPHandle;
  const method: TConstStringRetStringCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
{%endregion}

{%endregion}

implementation

{%region Constructor/Destructor }
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
CRIA um novo componente TACBrCEP retornando o ponteiro para o objeto criado.
Este ponteiro deve ser armazenado pela aplicação que utiliza a DLL e informado
em todas as chamadas de função relativas ao TACBrCEP
}
function CEP_Create(var cepHandle: PCEPHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try

    New(cepHandle);

    cepHandle^.CEP := TACBrCEP.Create(nil);
    cepHandle^.EventHandlers := TEventHandlersCEP.Create();
    cepHandle^.UltimoErro := '';
    Result := 0;

  except
    on Exception: Exception do
    begin
      Result := -1;
      cepHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

{
DESTRÓI o objeto TACBrCEP e libera a memória utilizada.
Esta função deve SEMPRE ser chamada pela aplicação que utiliza a DLL
quando o componente não mais for utilizado.
}
function CEP_Destroy(cepHandle: PCEPHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    cepHandle^.CEP.Destroy();
    cepHandle^.CEP := nil;

    Dispose(cepHandle);
    cepHandle := nil;
    Result := 0;

  except
    on Exception: Exception do
    begin
      Result := -1;
      cepHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

function CEP_GetUltimoErro(const cepHandle: PCEPHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try
    StrPLCopy(Buffer, cepHandle^.UltimoErro, BufferLen);
    Result := length(cepHandle^.UltimoErro);
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Funções mapeando as propriedades do componente }

function CEP_GetChaveAcesso(const cepHandle: PCEPHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrPLCopy(Buffer, cepHandle^.CEP.ChaveAcesso, BufferLen);
    Result := length(cepHandle^.CEP.ChaveAcesso);
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_SetChaveAcesso(const cepHandle: PCEPHandle; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    cepHandle^.CEP.ChaveAcesso := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_GetUsuario(const cepHandle: PCEPHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrPLCopy(Buffer, cepHandle^.CEP.Usuario, BufferLen);
    Result := length(cepHandle^.CEP.Usuario);
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_SetUsuario(const cepHandle: PCEPHandle; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    cepHandle^.CEP.Usuario := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_GetSenha(const cepHandle: PCEPHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrPLCopy(Buffer, cepHandle^.CEP.Senha, BufferLen);
    Result := length(cepHandle^.CEP.Senha);
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_SetSenha(const cepHandle: PCEPHandle; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    cepHandle^.CEP.Senha := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_GetURL(const cepHandle: PCEPHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrPLCopy(Buffer, cepHandle^.CEP.URL, BufferLen);
    Result := length(cepHandle^.CEP.ChaveAcesso);
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_GetParseText(const cepHandle: PCEPHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if cepHandle^.CEP.ParseText then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_SetParseText(const cepHandle: PCEPHandle; const Value: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    cepHandle^.CEP.ParseText := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_GetProxyHost(const cepHandle: PCEPHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrPLCopy(Buffer, cepHandle^.CEP.ProxyHost, BufferLen);
    Result := length(cepHandle^.CEP.ChaveAcesso);
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_SetProxyHost(const cepHandle: PCEPHandle; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    cepHandle^.CEP.ProxyHost := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_GetProxyPort(const cepHandle: PCEPHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrPLCopy(Buffer, cepHandle^.CEP.ProxyPort, BufferLen);
    Result := length(cepHandle^.CEP.ChaveAcesso);
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_SetProxyPort(const cepHandle: PCEPHandle; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    cepHandle^.CEP.ProxyPort := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_GetProxyUser(const cepHandle: PCEPHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrPLCopy(Buffer, cepHandle^.CEP.ProxyUser, BufferLen);
    Result := length(cepHandle^.CEP.ChaveAcesso);
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_SetProxyUser(const cepHandle: PCEPHandle; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    cepHandle^.CEP.ProxyUser := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_GetProxyPass(const cepHandle: PCEPHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrPLCopy(Buffer, cepHandle^.CEP.ProxyPass, BufferLen);
    Result := length(cepHandle^.CEP.ChaveAcesso);
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_SetProxyPass(const cepHandle: PCEPHandle; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    cepHandle^.CEP.ProxyPass := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_GetWebService(const cepHandle: PCEPHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(cepHandle^.CEP.WebService);
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_SetWebService(const cepHandle: PCEPHandle;
  const Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    cepHandle^.CEP.WebService := TACBrCEPWebService(Value);
    Result := 0;
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Endereços }

function CEP_GetEnderecos(const cepHandle: PCEPHandle;
  var endsHandle: TACBrCEPEnderecos): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    endsHandle := cepHandle^.CEP.Enderecos;
    Result := 0;
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_Enderecos_GetCount(const cepHandle: PCEPHandle;
  const endsHandle: TACBrCEPEnderecos): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := endsHandle.Count;
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_Enderecos_GetItem(const cepHandle: PCEPHandle;
  const endsHandle: TACBrCEPEnderecos; const index: integer;
  var endHandle: TACBrCEPEndereco): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    endHandle := endsHandle[index];
    Result := 0;
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Endereço }

function CEP_Endereco_GetCEP(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrPLCopy(Buffer, endHandle.CEP, BufferLen);
    Result := length(endHandle.CEP);
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_Endereco_SetCEP(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    endHandle.CEP := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_Endereco_GetBairro(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrPLCopy(Buffer, endHandle.Bairro, BufferLen);
    Result := length(endHandle.Bairro);
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_Endereco_SetBairro(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    endHandle.Bairro := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_Endereco_GetComplemento(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrPLCopy(Buffer, endHandle.Complemento, BufferLen);
    Result := length(endHandle.Complemento);
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_Endereco_SetComplemento(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    endHandle.Complemento := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_Endereco_GetTipo_Logradouro(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrPLCopy(Buffer, endHandle.Tipo_Logradouro, BufferLen);
    Result := length(endHandle.Tipo_Logradouro);
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_Endereco_SetTipo_Logradouro(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    endHandle.Tipo_Logradouro := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_Endereco_GetLogradouro(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrPLCopy(Buffer, endHandle.Logradouro, BufferLen);
    Result := length(endHandle.Logradouro);
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_Endereco_SetLogradouro(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    endHandle.Logradouro := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_Endereco_GetMunicipio(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrPLCopy(Buffer, endHandle.Municipio, BufferLen);
    Result := length(endHandle.Municipio);
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_Endereco_SetMunicipio(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    endHandle.Municipio := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_Endereco_GetUF(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrPLCopy(Buffer, endHandle.UF, BufferLen);
    Result := length(endHandle.UF);
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_Endereco_SetUF(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    endHandle.UF := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_Endereco_GetIBGE_Municipio(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrPLCopy(Buffer, endHandle.IBGE_Municipio, BufferLen);
    Result := length(endHandle.IBGE_Municipio);
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_Endereco_SetIBGE_Municipio(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    endHandle.IBGE_Municipio := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_Endereco_GetIBGE_UF(const cepHandle: PCEPHandle;
  const endHandle: TACBrCEPEndereco; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrPLCopy(Buffer, endHandle.IBGE_UF, BufferLen);
    Result := length(endHandle.IBGE_UF);
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion }

{%region Metodos }

function CEP_LerConfiguracoesProxy(const cepHandle: PCEPHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    cepHandle^.CEP.LerConfiguracoesProxy;
    Result := 0;
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_BuscarPorCEP(const cepHandle: PCEPHandle; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := cepHandle^.CEP.BuscarPorCEP(Value);
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_BuscarPorLogradouro(const cepHandle: PCEPHandle;
  const ACidade, ATipo_Logradouro, ALogradouro, AUF, ABairro: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := cepHandle^.CEP.BuscarPorLogradouro(ACidade, ATipo_Logradouro,
      ALogradouro, AUF, ABairro);
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Eventos }

function CEP_SetOnBuscaEfetuada(const cepHandle: PCEPHandle;
  const method: TNoArgumentsCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      cepHandle^.CEP.OnBuscaEfetuada := cepHandle^.EventHandlers.OnBuscaEfetuada;
      cepHandle^.EventHandlers.OnBuscaEfetuadaCallback := method;
      Result := 0;
    end
    else
    begin
      cepHandle^.CEP.OnBuscaEfetuada := nil;
      cepHandle^.EventHandlers.OnBuscaEfetuadaCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function CEP_SetOnAntesAbrirHTTP(const cepHandle: PCEPHandle;
  const method: TConstStringRetStringCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (cepHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      cepHandle^.CEP.OnAntesAbrirHTTP := cepHandle^.EventHandlers.OnAntesAbrirHTTP;
      cepHandle^.EventHandlers.OnAntesAbrirHTTPCallback := method;
      Result := 0;
    end
    else
    begin
      cepHandle^.CEP.OnAntesAbrirHTTP := nil;
      cepHandle^.EventHandlers.OnAntesAbrirHTTPCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      cepHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

end.
