unit ACBrETQDll;

interface

uses
  Classes,
  SysUtils,
  ACBrHandlers,
  ACBrDevice,
  ACBrETQ;

{%region Declaração da funções}

{%region Constructor/Destructor}

function ETQ_Create(var etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_Destroy(etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_GetUltimoErro(const etqHandle: PETQHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region ETQ}

function ETQ_GetAtivo(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_SetAtivo(const etqHandle: PETQHandle; const Ativo: boolean): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_GetEtqInicializada(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_GetEtqFinalizada(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_GetModeloStr(const etqHandle: PETQHandle; Buffer: PChar;
  const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_GetModelo(const etqHandle: PETQHandle): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_SetModelo(const etqHandle: PETQHandle; modelo : Integer): integer; {$IFDEF STDCALL} stdcall;
  {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_GetPorta(const etqHandle: PETQHandle; Buffer: PChar;
    const BufferLen: integer): integer;
   {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_SetPorta(const etqHandle: PETQHandle; const Porta: PChar):
   integer; {$IFDEF STDCALL} stdcall;
    {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

 function ETQ_GetArqLOG(const etqHandle: PETQHandle; Buffer: PChar;
  const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_SetArqLOG(const etqHandle: PETQHandle; const ArqLog: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_GetTemperatura(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_SetTemperatura(const etqHandle: PETQHandle;
   const Temperatura: integer): integer; {$IFDEF STDCALL} stdcall; {$ENDIF}
   {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_GetVelocidade(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_SetVelocidade(const etqHandle: PETQHandle;
   const Velocidade: integer): integer; {$IFDEF STDCALL} stdcall; {$ENDIF}
   {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_GetAvanco(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_SetAvanco(const etqHandle: PETQHandle;
   const Avanco: integer): integer; {$IFDEF STDCALL} stdcall; {$ENDIF}
   {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_GetUnidade(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_SetUnidade(const etqHandle: PETQHandle;
   const Unidade: integer): integer; {$IFDEF STDCALL} stdcall; {$ENDIF}
   {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_GetDPI(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_SetDPI(const etqHandle: PETQHandle;
   const DPI: integer): integer; {$IFDEF STDCALL} stdcall; {$ENDIF}
   {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_GetLimparMemoria(const etqHandle: PETQHandle): integer;
    {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_SetLimparMemoria(const etqHandle: PETQHandle; const Limpar: boolean): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_GetBackFeed(const etqHandle: PETQHandle): integer;
    {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_SetBackFeed(const etqHandle: PETQHandle; const BackFeed: integer): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_GetOrigem(const etqHandle: PETQHandle): integer;
    {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_SetOrigem(const etqHandle: PETQHandle; const Origem: integer): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_GetListaCmdCount(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_GetListaCmd(const etqHandle: PETQHandle; linha: PChar;
  const BufferLen, index: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_SetListaCmd(const etqHandle: PETQHandle; var linhas: array of PChar;
  const LinhasCount: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_Ativar(const etqHandle: PETQHandle): integer;
   {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_Desativar(const etqHandle: PETQHandle): integer;
    {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_ImprimirTexto(const etqHandle: PETQHandle; Orientacao, Fonte,
   MultiplicadorH, MultiplicadorV, Vertical, Horizontal: Integer;
   Texto: PChar; SubFonte: Integer; ImprimirReverso : Boolean): integer;
   {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_ImprimirBarras(const etqHandle: PETQHandle; Orientacao : Integer;
   TipoBarras, LarguraBarraLarga, LarguraBarraFina: PChar;
   Vertical, Horizontal: Integer; Texto: PChar; AlturaCodBarras,
   ExibeCodigo: Integer): integer;
   {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_ImprimirLinha(const etqHandle: PETQHandle; Vertical,
   Horizontal, Largura, Altura: Integer): integer;
   {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_ImprimirCaixa(const etqHandle: PETQHandle; Vertical,
   Horizontal, Largura, Altura, EspessuraVertical, EspessuraHorizontal: Integer): integer;
   {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_ImprimirImagem(const etqHandle: PETQHandle; MultiplicadorImagem,
   Vertical, Horizontal: Integer; NomeImagem: PChar): integer;
   {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_CarregarImagemStream(const etqHandle: PETQHandle; Imagem: array of Byte;
   size: Integer; NomeImagem: PChar; Flipped : Boolean; Tipo: PChar): integer;
   {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_CarregarImagem(const etqHandle: PETQHandle; Imagem, NomeImagem: PChar;
   Flipped : Boolean): integer;
   {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_IniciarEtiqueta(const etqHandle: PETQHandle): integer;
   {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_FinalizarEtiqueta(const etqHandle: PETQHandle; Copias, AvancoEtq: Integer): integer;
   {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_Imprimir(const etqHandle: PETQHandle; Copias, AvancoEtq: Integer): integer;
   {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion ETQ}

{%region ETQClass}

function ETQ_Class_GetModeloStr(const etqHandle: PETQHandle; Buffer: PChar;
  const BufferLen: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_Class_GetTemperatura(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_Class_SetTemperatura(const etqHandle: PETQHandle;
   const Temperatura: integer): integer; {$IFDEF STDCALL} stdcall; {$ENDIF}
   {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_Class_GetVelocidade(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_Class_SetVelocidade(const etqHandle: PETQHandle;
   const Velocidade: integer): integer; {$IFDEF STDCALL} stdcall; {$ENDIF}
   {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_Class_GetAvanco(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_Class_SetAvanco(const etqHandle: PETQHandle;
   const Avanco: integer): integer; {$IFDEF STDCALL} stdcall; {$ENDIF}
   {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_Class_GetUnidade(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_Class_SetUnidade(const etqHandle: PETQHandle;
   const Unidade: integer): integer; {$IFDEF STDCALL} stdcall; {$ENDIF}
   {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_Class_GetDPI(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_Class_SetDPI(const etqHandle: PETQHandle;
   const DPI: integer): integer; {$IFDEF STDCALL} stdcall; {$ENDIF}
   {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_Class_GetBackFeed(const etqHandle: PETQHandle): integer;
    {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_Class_SetBackFeed(const etqHandle: PETQHandle; const BackFeed: integer): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_Class_GetOrigem(const etqHandle: PETQHandle): integer;
      {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function ETQ_Class_SetOrigem(const etqHandle: PETQHandle; const Origem: integer): integer;
    {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion ETQClass}

{%region Set Eventos}

function ETQ_SetOnGravarLog(const etqHandle: PETQHandle;
  const method: TLogCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion Set Eventos}

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
CRIA um novo componente TACBrETQ retornando o ponteiro para o objeto criado.
Este ponteiro deve ser armazenado pela aplicação que utiliza a DLL e informado
em todas as chamadas de função relativas ao TACBrPosPrinter
}
function ETQ_Create(var etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try

    New(etqHandle);

    etqHandle^.ETQ := TACBrETQ.Create(nil);
    etqHandle^.EventHandlers := TEventHandlersETQ.Create();
    etqHandle^.UltimoErro := '';
    Result := 0;

  except
    on Exception: Exception do
    begin
      Result := -1;
      etqHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

{
DESTRÓI o objeto TACBrETQ e libera a memória utilizada.
Esta função deve SEMPRE ser chamada pela aplicação que utiliza a DLL
quando o componente não mais for utilizado.
}
function ETQ_Destroy(etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    etqHandle^.ETQ.Destroy();
    etqHandle^.ETQ := nil;
    Dispose(etqHandle);
    etqHandle := nil;
    Result := 0;

  except
    on Exception: Exception do
    begin
      Result := -1;
      etqHandle^.UltimoErro := Exception.Message;
    end
  end;
end;

function ETQ_GetUltimoErro(const etqHandle: PETQHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrPLCopy(Buffer, etqHandle^.UltimoErro, BufferLen);
    Result := length(etqHandle^.UltimoErro);
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Propriedades Não visiveis}

function ETQ_GetAtivo(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if etqHandle^.ETQ.Ativo then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_SetAtivo(const etqHandle: PETQHandle; const Ativo: boolean): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    etqHandle^.ETQ.Ativo := Ativo;
    Result := 0;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_GetEtqInicializada(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if etqHandle^.ETQ.EtqInicializada then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_GetEtqFinalizada(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if etqHandle^.ETQ.EtqFinalizada then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_GetModeloStr(const etqHandle: PETQHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrPLCopy(Buffer, etqHandle^.ETQ.ModeloStr, BufferLen);
    Result := length(etqHandle^.ETQ.ModeloStr);
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_GetModelo(const etqHandle: PETQHandle): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := Integer(etqHandle^.ETQ.Modelo);
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_SetModelo(const etqHandle: PETQHandle; modelo : Integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    etqHandle^.ETQ.Modelo := TACBrETQModelo(modelo);
    Result := 0;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_GetPorta(const etqHandle: PETQHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrPLCopy(Buffer, etqHandle^.ETQ.Porta, BufferLen);
    Result := length(etqHandle^.ETQ.Porta);
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_SetPorta(const etqHandle: PETQHandle; const Porta: PChar):
integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    etqHandle^.ETQ.Porta := Porta;
    Result := 0;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_GetArqLOG(const etqHandle: PETQHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrPLCopy(Buffer, etqHandle^.ETQ.ArqLOG, BufferLen);
    Result := length(etqHandle^.ETQ.ArqLOG);
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_SetArqLOG(const etqHandle: PETQHandle; const ArqLOG: PChar):
integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    etqHandle^.ETQ.ArqLOG := ArqLOG;
    Result := 0;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_GetTemperatura(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := etqHandle^.ETQ.Temperatura;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_SetTemperatura(const etqHandle: PETQHandle;
   const Temperatura: integer): integer; {$IFDEF STDCALL} stdcall; {$ENDIF}
   {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    etqHandle^.ETQ.Temperatura := Temperatura;
    Result := 0;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_GetVelocidade(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := etqHandle^.ETQ.Velocidade;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_SetVelocidade(const etqHandle: PETQHandle;
   const Velocidade: integer): integer; {$IFDEF STDCALL} stdcall; {$ENDIF}
   {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    etqHandle^.ETQ.Velocidade := Velocidade;
    Result := 0;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_GetAvanco(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := etqHandle^.ETQ.Avanco;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_SetAvanco(const etqHandle: PETQHandle;
   const Avanco: integer): integer; {$IFDEF STDCALL} stdcall; {$ENDIF}
   {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    etqHandle^.ETQ.Avanco := Avanco;
    Result := 0;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_GetUnidade(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := Integer(etqHandle^.ETQ.Unidade);
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_SetUnidade(const etqHandle: PETQHandle;
   const Unidade: integer): integer; {$IFDEF STDCALL} stdcall; {$ENDIF}
   {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    etqHandle^.ETQ.Unidade := TACBrETQUnidade(Unidade);
    Result := 0;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_GetDPI(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := Integer(etqHandle^.ETQ.DPI);
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_SetDPI(const etqHandle: PETQHandle;
   const DPI: integer): integer; {$IFDEF STDCALL} stdcall; {$ENDIF}
   {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    etqHandle^.ETQ.DPI := TACBrETQDPI(DPI);
    Result := 0;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_GetLimparMemoria(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if etqHandle^.ETQ.LimparMemoria then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_SetLimparMemoria(const etqHandle: PETQHandle; const Limpar: boolean): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    etqHandle^.ETQ.LimparMemoria := Limpar;
    Result := 0;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_GetBackFeed(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(etqHandle^.ETQ.BackFeed);
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_SetBackFeed(const etqHandle: PETQHandle; const BackFeed: integer): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    etqHandle^.ETQ.BackFeed := TACBrETQBackFeed(BackFeed);
    Result := 0;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_GetOrigem(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(etqHandle^.ETQ.Origem);
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_SetOrigem(const etqHandle: PETQHandle; const Origem: integer): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    etqHandle^.ETQ.Origem := TACBrETQOrigem(Origem);
    Result := 0;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_GetListaCmdCount(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := etqHandle^.ETQ.ListaCmd.Count;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_GetListaCmd(const etqHandle: PETQHandle; linha: PChar;
  const BufferLen, index: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
   strTmp: string;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    strTmp := etqHandle^.ETQ.ListaCmd[index];
    StrPLCopy(linha, strTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_SetListaCmd(const etqHandle: PETQHandle; var linhas: array of PChar;
  const LinhasCount: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
   i : Integer;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    etqHandle^.ETQ.ListaCmd.Clear;
    for i := 0 to LinhasCount - 1 do
    begin
      etqHandle^.ETQ.ListaCmd.Add(linhas[i]);
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_Ativar(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    etqHandle^.ETQ.Ativar;
    Result := 0;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_Desativar(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    etqHandle^.ETQ.Desativar;
    Result := 0;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_ImprimirTexto(const etqHandle: PETQHandle; Orientacao, Fonte, MultiplicadorH,
      MultiplicadorV, Vertical, Horizontal: Integer;
      Texto: PChar; SubFonte: Integer; ImprimirReverso : Boolean): integer;
      {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
   if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    etqHandle^.ETQ.ImprimirTexto(TACBrETQOrientacao(Orientacao), Fonte,
    MultiplicadorH, MultiplicadorV, Vertical, Horizontal, Texto, SubFonte,
    ImprimirReverso);
    Result := 0;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_ImprimirBarras(const etqHandle: PETQHandle; Orientacao : Integer;
    TipoBarras, LarguraBarraLarga, LarguraBarraFina: PChar;
    Vertical, Horizontal: Integer; Texto: PChar; AlturaCodBarras,
      ExibeCodigo: Integer): integer;
   {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
   if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    etqHandle^.ETQ.ImprimirBarras(TACBrETQOrientacao(Orientacao), TipoBarras,
    LarguraBarraLarga, LarguraBarraFina, Vertical, Horizontal, Texto, AlturaCodBarras,
    TACBrETQBarraExibeCodigo(ExibeCodigo));
    Result := 0;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_ImprimirLinha(const etqHandle: PETQHandle; Vertical,
   Horizontal, Largura, Altura: Integer): integer;
   {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
   if (etqHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    try
      etqHandle^.ETQ.ImprimirLinha(Vertical, Horizontal, Largura, Altura);
      Result := 0;
    except
      on Exception: Exception do
      begin
        etqHandle^.UltimoErro := Exception.Message;
        Result := -1;
      end
    end;
end;

function ETQ_ImprimirCaixa(const etqHandle: PETQHandle; Vertical,
   Horizontal, Largura, Altura, EspessuraVertical, EspessuraHorizontal: Integer): integer;
   {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
   if (etqHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    try
      etqHandle^.ETQ.ImprimirCaixa(Vertical, Horizontal, Largura, Altura,
                                       EspessuraVertical, EspessuraHorizontal);
      Result := 0;
    except
      on Exception: Exception do
      begin
        etqHandle^.UltimoErro := Exception.Message;
        Result := -1;
      end
    end;
end;

function ETQ_ImprimirImagem(const etqHandle: PETQHandle; MultiplicadorImagem,
   Vertical, Horizontal: Integer; NomeImagem: PChar): integer;
   {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
   if (etqHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    try
      etqHandle^.ETQ.ImprimirImagem(MultiplicadorImagem, Vertical,
                                        Horizontal, NomeImagem);
      Result := 0;
    except
      on Exception: Exception do
      begin
        etqHandle^.UltimoErro := Exception.Message;
        Result := -1;
      end
    end;
end;

function ETQ_CarregarImagemStream(const etqHandle: PETQHandle; Imagem: array of byte;
   size: Integer; NomeImagem: PChar; Flipped : Boolean; Tipo: PChar): integer;
   {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
Var
   AStream : TMemoryStream;
Begin
   if (etqHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    try

      AStream := TMemoryStream.Create;
      AStream.WriteBuffer(Imagem[0], size);

      etqHandle^.ETQ.CarregarImagem(AStream, NomeImagem,
                                        Flipped, Tipo);
      FreeAndNil(AStream);
      Result := 0;
    except
      on Exception: Exception do
      begin
        FreeAndNil(AStream);
        etqHandle^.UltimoErro := Exception.Message;
        Result := -1;
      end
    end;
end;

function ETQ_CarregarImagem(const etqHandle: PETQHandle; Imagem, NomeImagem: PChar;
   Flipped : Boolean): integer;
   {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
Begin
   if (etqHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    try
      etqHandle^.ETQ.CarregarImagem(Imagem, NomeImagem, Flipped);
      Result := 0;
    except
      on Exception: Exception do
      begin
        etqHandle^.UltimoErro := Exception.Message;
        Result := -1;
      end
    end;
end;

function ETQ_IniciarEtiqueta(const etqHandle: PETQHandle): integer;
   {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
   if (etqHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    try
      etqHandle^.ETQ.IniciarEtiqueta;
      Result := 0;
    except
      on Exception: Exception do
      begin
        etqHandle^.UltimoErro := Exception.Message;
        Result := -1;
      end
    end;
end;

function ETQ_FinalizarEtiqueta(const etqHandle: PETQHandle; Copias, AvancoEtq: Integer): integer;
   {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
   if (etqHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    try
      etqHandle^.ETQ.FinalizarEtiqueta(Copias, AvancoEtq);
      Result := 0;
    except
      on Exception: Exception do
      begin
        etqHandle^.UltimoErro := Exception.Message;
        Result := -1;
      end
    end;
end;

function ETQ_Imprimir(const etqHandle: PETQHandle; Copias, AvancoEtq: Integer): integer;
   {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
   if (etqHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    try
      etqHandle^.ETQ.Imprimir(Copias, AvancoEtq);
      Result := 0;
    except
      on Exception: Exception do
      begin
        etqHandle^.UltimoErro := Exception.Message;
        Result := -1;
      end
    end;
end;

{%endregion Propriedades Não visiveis}

{%region ETQClass}

function ETQ_Class_GetModeloStr(const etqHandle: PETQHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrPLCopy(Buffer, etqHandle^.ETQ.ETQ.ModeloStr, BufferLen);
    Result := length(etqHandle^.ETQ.ETQ.ModeloStr);
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_Class_GetTemperatura(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := etqHandle^.ETQ.ETQ.Temperatura;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_Class_SetTemperatura(const etqHandle: PETQHandle;
   const Temperatura: integer): integer; {$IFDEF STDCALL} stdcall; {$ENDIF}
   {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    etqHandle^.ETQ.ETQ.Temperatura := Temperatura;
    Result := 0;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_Class_GetVelocidade(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := etqHandle^.ETQ.ETQ.Velocidade;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_Class_SetVelocidade(const etqHandle: PETQHandle;
   const Velocidade: integer): integer; {$IFDEF STDCALL} stdcall; {$ENDIF}
   {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    etqHandle^.ETQ.ETQ.Velocidade := Velocidade;
    Result := 0;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_Class_GetAvanco(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := etqHandle^.ETQ.ETQ.Avanco;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_Class_SetAvanco(const etqHandle: PETQHandle;
   const Avanco: integer): integer; {$IFDEF STDCALL} stdcall; {$ENDIF}
   {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    etqHandle^.ETQ.ETQ.Avanco := Avanco;
    Result := 0;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_Class_GetUnidade(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := Integer(etqHandle^.ETQ.ETQ.Unidade);
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_Class_SetUnidade(const etqHandle: PETQHandle;
   const Unidade: integer): integer; {$IFDEF STDCALL} stdcall; {$ENDIF}
   {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    etqHandle^.ETQ.ETQ.Unidade := TACBrETQUnidade(Unidade);
    Result := 0;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_Class_GetDPI(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := Integer(etqHandle^.ETQ.ETQ.DPI);
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_Class_SetDPI(const etqHandle: PETQHandle;
   const DPI: integer): integer; {$IFDEF STDCALL} stdcall; {$ENDIF}
   {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    etqHandle^.ETQ.ETQ.DPI := TACBrETQDPI(DPI);
    Result := 0;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_Class_GetBackFeed(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(etqHandle^.ETQ.ETQ.BackFeed)
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_Class_SetBackFeed(const etqHandle: PETQHandle; const BackFeed: integer): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    etqHandle^.ETQ.ETQ.BackFeed := TACBrETQBackFeed(BackFeed);
    Result := 0;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_Class_GetOrigem(const etqHandle: PETQHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(etqHandle^.ETQ.ETQ.Origem)
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function ETQ_Class_SetOrigem(const etqHandle: PETQHandle; const Origem: integer): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    etqHandle^.ETQ.ETQ.Origem := TACBrETQOrigem(Origem);
    Result := 0;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion ETQClass}

{%region Set Eventos}

function ETQ_SetOnGravarLog(const etqHandle: PETQHandle;
  const method: TLogCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (etqHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      etqHandle^.ETQ.OnGravarLog := etqHandle^.EventHandlers.OnGravarLog;
      etqHandle^.EventHandlers.OnGravarLogCallback := method;
      Result := 0;
    end
    else
    begin
      etqHandle^.ETQ.OnGravarLog := nil;
      etqHandle^.EventHandlers.OnGravarLogCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      etqHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion Set Eventos}

end.

