unit ACBrSMSDll;

{$mode delphi}

interface

uses
  Classes, SysUtils,
  ACBrSMSClass, ACBrSMS,
  ACBrHandlers;

{%region Declaração da funções}

{%region Constructor/Destructor/Erro}

function SMS_Create(var smsHandle: PSMSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_Destroy(smsHandle: PSMSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_GetUltimoErro(const smsHandle: PSMSHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Funções mapeando as propriedades do componente }

function SMS_GetModelo(const smsHandle: PSMSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_SetModelo(const smsHandle: PSMSHandle; const Modelo: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_GetAtivo(const smsHandle: PSMSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_SetAtivo(const smsHandle: PSMSHandle; const Ativo: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_GetATResult(const smsHandle: PSMSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_SetATResult(const smsHandle: PSMSHandle;
  const ATResult: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_GetQuebraMensagens(const smsHandle: PSMSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_SetQuebraMensagens(const smsHandle: PSMSHandle;
  const QuebraMensagens: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_GetRecebeConfirmacao(const smsHandle: PSMSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_SetRecebeConfirmacao(const smsHandle: PSMSHandle;
  const RecebeConfirmacao: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_GetATTimeOut(const smsHandle: PSMSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_SetATTimeOut(const smsHandle: PSMSHandle;
  const ATTimeOut: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_GetIntervaloEntreMensagens(const smsHandle: PSMSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_SetIntervaloEntreMensagens(const smsHandle: PSMSHandle;
  const IntervaloEntreMensagens: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_GetBandejasSimCard(const smsHandle: PSMSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_GetSimCard(const smsHandle: PSMSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_GetUltimaResposta(const smsHandle: PSMSHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_GetUltimoComando(const smsHandle: PSMSHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Propriedades - Não Visiveis }

function SMS_GetEmLinha(const smsHandle: PSMSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_GetIMEI(const smsHandle: PSMSHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_GetIMSI(const smsHandle: PSMSHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_GetOperadora(const smsHandle: PSMSHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_GetFabricante(const smsHandle: PSMSHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_GetModeloModem(const smsHandle: PSMSHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_GetFirmware(const smsHandle: PSMSHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_GetEstadoSincronismo(const smsHandle: PSMSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_GetNivelSinal(const smsHandle: PSMSHandle; var Sinal: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Metodos Componente}

function SMS_Ativar(const smsHandle: PSMSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_Desativar(const smsHandle: PSMSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_EnviarSMS(const smsHandle: PSMSHandle; const telefone, menssagem: PChar;
  Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_EnviarSMSLote(const smsHandle: PSMSHandle;
  const msgcHandle: PMSGCHandle; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_ListarMensagens(const smsHandle: PSMSHandle; const filtro: integer;
  const path: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_TrocarBandeja(const smsHandle: PSMSHandle; const sim: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Mensagems }

function SMS_MSGC_Create(var msgcHandle: PMSGCHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_MSGC_Destroy(var msgcHandle: PMSGCHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_MSGC_GetUltimoErro(const msgcHandle: PMSGCHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_MSGC_Add(const msgcHandle: PMSGCHandle;
  const msgHandle: PMSGHandle): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_MSGC_Remove(const msgcHandle: PMSGCHandle;
  const msgHandle: PMSGHandle): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_MSGC_Clear(const msgcHandle: PMSGCHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_MSGC_LoadFromFrile(const msgcHandle: PMSGCHandle;
  const arquivo: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_MSGC_GetMSG(const msgcHandle: PMSGCHandle; const msgHandle: PMSGHandle;
  const idx: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Mensagem }

function SMS_MSG_Create(var msgHandle: PMSGHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_MSG_Destroy(var msgHandle: PMSGHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_MSG_GetUltimoErro(const msgHandle: PMSGHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_MSG_GetMensagem(const msgHandle: PMSGHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_MSG_SetMensagem(const msgHandle: PMSGHandle;
  const Value: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_MSG_GetTelefone(const msgHandle: PMSGHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SMS_MSG_SetTelefone(const msgHandle: PMSGHandle;
  const Value: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Eventos }

function SMS_SetOnProgresso(const smsHandle: PSMSHandle;
  const method: TOnProgressoCallback): integer;
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
CRIA um novo componente TACBrECF retornando o ponteiro para o objeto criado.
Este ponteiro deve ser armazenado pela aplicação que utiliza a DLL e informado
em todas as chamadas de função relativas ao TACBrECF
}
function SMS_Create(var smsHandle: PSMSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try

    New(smsHandle);

    smsHandle^.SMS := TACBrSMS.Create(nil);
    smsHandle^.EventHandlers := TEventHandlersSMS.Create();
    smsHandle^.UltimoErro := '';
    Result := 0;

  except
    on Exception: Exception do
    begin
      Result := -1;
      smsHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

{
DESTRÓI o objeto TACBrECF e libera a memória utilizada.
Esta função deve SEMPRE ser chamada pela aplicação que utiliza a DLL
quando o componente não mais for utilizado.
}
function SMS_Destroy(smsHandle: PSMSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (smsHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    smsHandle^.SMS.Destroy();
    smsHandle^.SMS := nil;

    Dispose(smsHandle);
    smsHandle := nil;
    Result := 0;

  except
    on Exception: Exception do
    begin
      Result := -1;
      smsHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

function SMS_GetUltimoErro(const smsHandle: PSMSHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try
    StrPLCopy(Buffer, smsHandle^.UltimoErro, BufferLen);
    Result := length(smsHandle^.UltimoErro);
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Funções mapeando as propriedades do componente }

function SMS_GetModelo(const smsHandle: PSMSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (smsHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(smsHandle^.SMS.Modelo);
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SMS_SetModelo(const smsHandle: PSMSHandle; const Modelo: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (smsHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    smsHandle^.SMS.Modelo := TACBrSMSModelo(Modelo);
    Result := 0;
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SMS_GetAtivo(const smsHandle: PSMSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (smsHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if smsHandle^.SMS.Ativo then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SMS_SetAtivo(const smsHandle: PSMSHandle; const Ativo: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (smsHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    smsHandle^.SMS.Ativo := Ativo;
    Result := 0;
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SMS_GetATResult(const smsHandle: PSMSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (smsHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if smsHandle^.SMS.ATResult then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SMS_SetATResult(const smsHandle: PSMSHandle;
  const ATResult: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (smsHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    smsHandle^.SMS.ATResult := ATResult;
    Result := 0;
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SMS_GetQuebraMensagens(const smsHandle: PSMSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (smsHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if smsHandle^.SMS.QuebraMensagens then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SMS_SetQuebraMensagens(const smsHandle: PSMSHandle;
  const QuebraMensagens: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (smsHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    smsHandle^.SMS.QuebraMensagens := QuebraMensagens;
    Result := 0;
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SMS_GetRecebeConfirmacao(const smsHandle: PSMSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (smsHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if smsHandle^.SMS.RecebeConfirmacao then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SMS_SetRecebeConfirmacao(const smsHandle: PSMSHandle;
  const RecebeConfirmacao: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (smsHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    smsHandle^.SMS.RecebeConfirmacao := RecebeConfirmacao;
    Result := 0;
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SMS_GetATTimeOut(const smsHandle: PSMSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (smsHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := smsHandle^.SMS.ATTimeOut;
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SMS_SetATTimeOut(const smsHandle: PSMSHandle;
  const ATTimeOut: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (smsHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    smsHandle^.SMS.ATTimeOut := ATTimeOut;
    Result := 0;
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SMS_GetIntervaloEntreMensagens(const smsHandle: PSMSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (smsHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := smsHandle^.SMS.IntervaloEntreMensagens;
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SMS_SetIntervaloEntreMensagens(const smsHandle: PSMSHandle;
  const IntervaloEntreMensagens: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (smsHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    smsHandle^.SMS.IntervaloEntreMensagens := IntervaloEntreMensagens;
    Result := 0;
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SMS_GetBandejasSimCard(const smsHandle: PSMSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (smsHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := smsHandle^.SMS.BandejasSimCard;
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SMS_GetSimCard(const smsHandle: PSMSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (smsHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(smsHandle^.SMS.SimCard);
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SMS_GetUltimaResposta(const smsHandle: PSMSHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try
    StrPLCopy(Buffer, smsHandle^.SMS.UltimaResposta, BufferLen);
    Result := length(smsHandle^.SMS.UltimaResposta);
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SMS_GetUltimoComando(const smsHandle: PSMSHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try
    StrPLCopy(Buffer, smsHandle^.SMS.UltimoComando, BufferLen);
    Result := length(smsHandle^.SMS.UltimoComando);
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Propriedades - Não Visiveis }

function SMS_GetEmLinha(const smsHandle: PSMSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (smsHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if smsHandle^.SMS.EmLinha then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SMS_GetIMEI(const smsHandle: PSMSHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try
    StrPLCopy(Buffer, smsHandle^.SMS.IMEI, BufferLen);
    Result := length(smsHandle^.SMS.IMEI);
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SMS_GetIMSI(const smsHandle: PSMSHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try
    StrPLCopy(Buffer, smsHandle^.SMS.IMSI, BufferLen);
    Result := length(smsHandle^.SMS.IMSI);
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SMS_GetOperadora(const smsHandle: PSMSHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try
    StrPLCopy(Buffer, smsHandle^.SMS.Operadora, BufferLen);
    Result := length(smsHandle^.SMS.Operadora);
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SMS_GetFabricante(const smsHandle: PSMSHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try
    StrPLCopy(Buffer, smsHandle^.SMS.Fabricante, BufferLen);
    Result := length(smsHandle^.SMS.Fabricante);
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SMS_GetModeloModem(const smsHandle: PSMSHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try
    StrPLCopy(Buffer, smsHandle^.SMS.ModeloModem, BufferLen);
    Result := length(smsHandle^.SMS.ModeloModem);
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SMS_GetFirmware(const smsHandle: PSMSHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try
    StrPLCopy(Buffer, smsHandle^.SMS.Firmware, BufferLen);
    Result := length(smsHandle^.SMS.Firmware);
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SMS_GetEstadoSincronismo(const smsHandle: PSMSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (smsHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(smsHandle^.SMS.EstadoSincronismo);
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SMS_GetNivelSinal(const smsHandle: PSMSHandle; var Sinal: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (smsHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Sinal := smsHandle^.SMS.NivelSinal;
    Result := 0;
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Metodos Componente}

function SMS_Ativar(const smsHandle: PSMSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (smsHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    smsHandle^.SMS.Ativar;
    Result := 0;
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SMS_Desativar(const smsHandle: PSMSHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (smsHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    smsHandle^.SMS.Desativar;
    Result := 0;
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SMS_EnviarSMS(const smsHandle: PSMSHandle; const telefone, menssagem: PChar;
  Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  Indice: ansistring;
begin

  if (smsHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Indice := '';
    smsHandle^.SMS.EnviarSMS(telefone, menssagem, Indice);
    StrPLCopy(Buffer, Indice, BufferLen);
    Result := length(Indice);
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SMS_EnviarSMSLote(const smsHandle: PSMSHandle;
  const msgcHandle: PMSGCHandle; Buffer: PChar; const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  Indice: ansistring;
begin

  if (smsHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Indice := '';
    smsHandle^.SMS.EnviarSMSLote(msgcHandle^.Menssagens, Indice);
    StrPLCopy(Buffer, Indice, BufferLen);
    Result := length(Indice);
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SMS_ListarMensagens(const smsHandle: PSMSHandle; const filtro: integer;
  const path: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (smsHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    smsHandle^.SMS.ListarMensagens(TACBrSMSFiltro(filtro), path);
    Result := 0;
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SMS_TrocarBandeja(const smsHandle: PSMSHandle; const sim: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (smsHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    smsHandle^.SMS.TrocarBandeja(TACBrSMSSimCard(sim));
    Result := 0;
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region Mensagems }

function SMS_MSGC_Create(var msgcHandle: PMSGCHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try

    New(msgcHandle);

    msgcHandle^.Menssagens := TACBrSMSMensagens.Create();
    msgcHandle^.UltimoErro := '';
    Result := 0;

  except
    on Exception: Exception do
    begin
      Result := -1;
      msgcHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

function SMS_MSGC_Destroy(var msgcHandle: PMSGCHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (msgcHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    msgcHandle^.Menssagens.Destroy;
    msgcHandle^.Menssagens := nil;

    Dispose(msgcHandle);
    msgcHandle := nil;
    Result := 0;

  except
    on Exception: Exception do
    begin
      Result := -1;
      msgcHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

function SMS_MSGC_GetUltimoErro(const msgcHandle: PMSGCHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try
    StrPLCopy(Buffer, msgcHandle^.UltimoErro, BufferLen);
    Result := length(msgcHandle^.UltimoErro);
  except
    on Exception: Exception do
    begin
      msgcHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SMS_MSGC_Add(const msgcHandle: PMSGCHandle;
  const msgHandle: PMSGHandle): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (msgcHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    msgcHandle^.Menssagens.Add(msgHandle^.Menssagem);
    msgHandle^.Menssagem := msgcHandle^.Menssagens[msgcHandle^.Menssagens.Count - 1];
    Result := msgcHandle^.Menssagens.Count;
  except
    on Exception: Exception do
    begin
      msgcHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SMS_MSGC_Remove(const msgcHandle: PMSGCHandle;
  const msgHandle: PMSGHandle): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (msgcHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    msgcHandle^.Menssagens.Remove(msgHandle^.Menssagem);
    Result := msgcHandle^.Menssagens.Count;
  except
    on Exception: Exception do
    begin
      msgcHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SMS_MSGC_Clear(const msgcHandle: PMSGCHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (msgcHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    msgcHandle^.Menssagens.Clear;
    Result := msgcHandle^.Menssagens.Count;
  except
    on Exception: Exception do
    begin
      msgcHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SMS_MSGC_LoadFromFrile(const msgcHandle: PMSGCHandle;
  const arquivo: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (msgcHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    msgcHandle^.Menssagens.LoadFromFile(arquivo);
    Result := msgcHandle^.Menssagens.Count;
  except
    on Exception: Exception do
    begin
      msgcHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SMS_MSGC_GetMSG(const msgcHandle: PMSGCHandle; const msgHandle: PMSGHandle;
  const idx: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (msgcHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    msgHandle^.Menssagem := msgcHandle^.Menssagens[idx];
    Result := 0;
  except
    on Exception: Exception do
    begin
      msgcHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Mensagem }

function SMS_MSG_Create(var msgHandle: PMSGHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try

    New(msgHandle);

    msgHandle^.Menssagem.Create;
    msgHandle^.UltimoErro := '';
    Result := 0;

  except
    on Exception: Exception do
    begin
      Result := -1;
      msgHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

function SMS_MSG_Destroy(var msgHandle: PMSGHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (msgHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    msgHandle^.Menssagem.Destroy;
    msgHandle^.Menssagem := nil;

    Dispose(msgHandle);
    msgHandle := nil;
    Result := 0;

  except
    on Exception: Exception do
    begin
      Result := -1;
      msgHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

function SMS_MSG_GetUltimoErro(const msgHandle: PMSGHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try
    StrPLCopy(Buffer, msgHandle^.UltimoErro, BufferLen);
    Result := length(msgHandle^.UltimoErro);
  except
    on Exception: Exception do
    begin
      msgHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SMS_MSG_GetMensagem(const msgHandle: PMSGHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (msgHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrPLCopy(Buffer, msgHandle^.Menssagem.Mensagem, BufferLen);
    Result := length(msgHandle^.Menssagem.Mensagem);
  except
    on Exception: Exception do
    begin
      msgHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SMS_MSG_SetMensagem(const msgHandle: PMSGHandle;
  const Value: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (msgHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    msgHandle^.Menssagem.Mensagem := Value;
    Result := length(msgHandle^.Menssagem.Mensagem);
  except
    on Exception: Exception do
    begin
      msgHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SMS_MSG_GetTelefone(const msgHandle: PMSGHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (msgHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrPLCopy(Buffer, msgHandle^.Menssagem.Telefone, BufferLen);
    Result := length(msgHandle^.Menssagem.Telefone);
  except
    on Exception: Exception do
    begin
      msgHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SMS_MSG_SetTelefone(const msgHandle: PMSGHandle;
  const Value: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (msgHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    msgHandle^.Menssagem.Telefone := Value;
    Result := length(msgHandle^.Menssagem.Telefone);
  except
    on Exception: Exception do
    begin
      msgHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Eventos }

function SMS_SetOnProgresso(const smsHandle: PSMSHandle;
  const method: TOnProgressoCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (smsHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      smsHandle^.SMS.OnProgresso := smsHandle^.EventHandlers.OnProgresso;
      smsHandle^.EventHandlers.OnProgressoCallback := method;
      Result := 0;
    end
    else
    begin
      smsHandle^.SMS.OnProgresso := nil;
      smsHandle^.EventHandlers.OnProgressoCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      smsHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

end.
