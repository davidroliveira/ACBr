unit ACBrIBGEDll;

interface

uses
  SysUtils,
  Classes,
  ACBrIBGE,
  ACBrHandlers;

{Records estilo C utilizados nos retornos das funções}

type
  TCidadeRec = record
    Municipio: array[0..50] of char;
    CodMunicio: integer;
    UF: array[0..2] of char;
    CodUF: integer;
    Area: double;
  end;

{%region Declaração da funções}

{%region Constructor/Destructor}

function IBGE_Create(var ibgeHandle: PIBGEHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function IBGE_Destroy(ibgeHandle: PibgeHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function IBGE_GetUltimoErro(const ibgeHandle: PIBGEHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Methodos do componente}

function IBGE_BuscarPorCodigo(const ibgeHandle: PIBGEHandle;
  const codigo: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function IBGE_BuscarPorNome(const ibgeHandle: PIBGEHandle; const nome, uf: PChar;
  exata: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function IBGE_Cidades_GetCount(const ibgeHandle: PIBGEHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function IBGE_Cidades_GetItem(const ibgeHandle: PIBGEHandle;
  var retCidade: TCidadeRec; const index: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Eventos }

function IBGE_SetOnBuscaEfetuada(const ibgeHandle: PIBGEHandle;
  const method: TNoArgumentsCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%endregion}

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
CRIA um novo componente TACBrIBGE retornando o ponteiro para o objeto criado.
Este ponteiro deve ser armazenado pela aplicação que utiliza a DLL e informado
em todas as chamadas de função relativas ao TACBrIBGE
}
function IBGE_Create(var ibgeHandle: PIBGEHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try

    New(ibgeHandle);

    ibgeHandle^.IBGE := TACBrIBGE.Create(nil);
    ibgeHandle^.EventHandlers := TEventHandlersIBGE.Create();
    ibgeHandle^.UltimoErro := '';
    Result := 0;

  except
    on Exception: Exception do
    begin
      Result := -1;
      ibgeHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

{
DESTRÓI o objeto TACBrIBGE e libera a memória utilizada.
Esta função deve SEMPRE ser chamada pela aplicação que utiliza a DLL
quando o componente não mais for utilizado.
}
function IBGE_Destroy(ibgeHandle: PibgeHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ibgeHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    ibgeHandle^.IBGE.Destroy();
    ibgeHandle^.IBGE := nil;

    Dispose(ibgeHandle);
    ibgeHandle := nil;
    Result := 0;

  except
    on Exception: Exception do
    begin
      Result := -1;
      ibgeHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

function IBGE_GetUltimoErro(const ibgeHandle: PIBGEHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try
    StrPLCopy(Buffer, ibgeHandle^.UltimoErro, BufferLen);
    Result := length(ibgeHandle^.UltimoErro);
  except
    on Exception: Exception do
    begin
      ibgeHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Methodos do componente}

function IBGE_BuscarPorCodigo(const ibgeHandle: PIBGEHandle;
  const codigo: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ibgeHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ibgeHandle^.IBGE.BuscarPorCodigo(codigo);
  except
    on Exception: Exception do
    begin
      ibgeHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function IBGE_BuscarPorNome(const ibgeHandle: PIBGEHandle; const nome, uf: PChar;
  exata: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ibgeHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ibgeHandle^.IBGE.BuscarPorNome(nome, uf, exata);
  except
    on Exception: Exception do
    begin
      ibgeHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function IBGE_Cidades_GetCount(const ibgeHandle: PIBGEHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ibgeHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := ibgeHandle^.IBGE.Cidades.Count;
  except
    on Exception: Exception do
    begin
      ibgeHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function IBGE_Cidades_GetItem(const ibgeHandle: PIBGEHandle;
  var retCidade: TCidadeRec; const index: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  cidade: TACBrIBGECidade;
begin

  if (ibgeHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    if (index >= 0) and (index < ibgeHandle^.IBGE.Cidades.Count) then
    begin
      cidade := ibgeHandle^.IBGE.Cidades[index];

      StrPLCopy(retCidade.Municipio, cidade.Municipio, 50);
      retCidade.CodMunicio := cidade.CodMunicipio;
      StrPLCopy(retCidade.UF, cidade.UF, 2);
      retCidade.Area := cidade.Area;
      retCidade.CodUF := cidade.CodUF;
      Result := 0;
    end
    else
    begin
      Result := -3;
    end;

  except
    on Exception: Exception do
    begin
      ibgeHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Eventos }

function IBGE_SetOnBuscaEfetuada(const ibgeHandle: PIBGEHandle;
  const method: TNoArgumentsCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (ibgeHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      ibgeHandle^.IBGE.OnBuscaEfetuada := ibgeHandle^.EventHandlers.OnBuscaEfetuada;
      ibgeHandle^.EventHandlers.OnBuscaEfetuadaCallback := method;
      Result := 0;
    end
    else
    begin
      ibgeHandle^.IBGE.OnBuscaEfetuada := nil;
      ibgeHandle^.EventHandlers.OnBuscaEfetuadaCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      ibgeHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

end.
