unit ACBrRFDDll;

{$mode delphi}

interface

uses
  Classes,
  ACBrRFD,
  ACBrHandlers,
  SysUtils;

{%region Declaração da funções}

{%region Create/Destroy/Erro}

function RFD_Create(var rfdHandle: PRFDHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_Destroy(rfdHandle: PRFDHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetUltimoErro(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Funções mapeando as propriedades do componente }

function RFD_GetDirRFD(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_SetDirRFD(const rfdHandle: PRFDHandle; const Dir: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetSH_CNPJ(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_SetSH_CNPJ(const rfdHandle: PRFDHandle; const SH_CNPJ: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetSH_COO(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_SetSH_COO(const rfdHandle: PRFDHandle; const SH_COO: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetSH_IE(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_SetSH_IE(const rfdHandle: PRFDHandle; const SH_IE: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetSH_IM(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_SetSH_IM(const rfdHandle: PRFDHandle; const SH_IM: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetSH_Linha1(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_SetSH_Linha1(const rfdHandle: PRFDHandle;
  const SH_Linha1: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetSH_Linha2(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_SetSH_Linha2(const rfdHandle: PRFDHandle;
  const SH_Linha2: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetSH_NomeAplicativo(const rfdHandle: PRFDHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_SetSH_NomeAplicativo(const rfdHandle: PRFDHandle;
  const SH_NomeAplicativo: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetSH_VersaoAplicativo(const rfdHandle: PRFDHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_SetSH_VersaoAplicativo(const rfdHandle: PRFDHandle;
  const SH_VersaoAplicativo: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetSH_NumeroAplicativo(const rfdHandle: PRFDHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_SetSH_NumeroAplicativo(const rfdHandle: PRFDHandle;
  const SH_NumeroAplicativo: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetIgnoraEcfMfd(const rfdHandle: PRFDHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_SetIgnoraEcfMfd(const rfdHandle: PRFDHandle;
  const IgnoraEcfMfd: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Funções mapeando as propriedades do componente não visiveis}

function RFD_GetAtivo(const rfdHandle: PRFDHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_SetAtivo(const rfdHandle: PRFDHandle; const Ativo: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetDiaMov(const rfdHandle: PRFDHandle; var Value: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetDirECF(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetDirECFLog(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetDirECFMes(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetArqRFDID(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetArqRFD(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetArqReducaoZ(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetArqINI(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetECF_CROAtual(const rfdHandle: PRFDHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_SetECF_CROAtual(const rfdHandle: PRFDHandle;
  const Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetECF_RFDID(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_SetECF_RFDID(const rfdHandle: PRFDHandle; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetECF_DataHoraSwBasico(const rfdHandle: PRFDHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_SetECF_DataHoraSwBasico(const rfdHandle: PRFDHandle;
  const Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetAtoCotepe(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_SetAtoCotepe(const rfdHandle: PRFDHandle; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetCONT_CNPJ(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_SetCONT_CNPJ(const rfdHandle: PRFDHandle; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetCONT_IE(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_SetCONT_IE(const rfdHandle: PRFDHandle; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetCONT_NumUsuario(const rfdHandle: PRFDHandle;
  var Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_SetCONT_NumUsuario(const rfdHandle: PRFDHandle;
  const Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetCONT_RazaoSocial(const rfdHandle: PRFDHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_SetCONT_RazaoSocial(const rfdHandle: PRFDHandle;
  const Value: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetCONT_Endereco(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_SetCONT_Endereco(const rfdHandle: PRFDHandle;
  const Value: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetCONT_DataHoraCadastro(const rfdHandle: PRFDHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_SetCONT_DataHoraCadastro(const rfdHandle: PRFDHandle;
  const Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetCONT_CROCadastro(const rfdHandle: PRFDHandle;
  var Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_SetCONT_CROCadastro(const rfdHandle: PRFDHandle;
  const Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GetCONT_GTCadastro(const rfdHandle: PRFDHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_SetCONT_GTCadastro(const rfdHandle: PRFDHandle;
  const Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Componente ACBr}

function RFD_SetECF(const rfdHandle: PRFDHandle;
  const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Metodos}

function RFD_Ativar(const rfdHandle: PRFDHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_Desativar(const rfdHandle: PRFDHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_VerificaParametros(const rfdHandle: PRFDHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_AchaRFDID(const rfdHandle: PRFDHandle; const Value: PChar;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_LerINI(const rfdHandle: PRFDHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_GravarINI(const rfdHandle: PRFDHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_CriarArqRFDID(const rfdHandle: PRFDHandle; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_NomeArqRFD(const rfdHandle: PRFDHandle; const Value: double;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_AbreCupom(const rfdHandle: PRFDHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_VendeItem(const rfdHandle: PRFDHandle; const Codigo, Descricao: PChar;
  const Qtd, ValorUnitario: double; const Unidade: PChar;
  const ValorDescAcres: double; Aliquota: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_SubTotalizaCupom(const rfdHandle: PRFDHandle;
  const DescontoAcrescimo: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_FechaCupom(const rfdHandle: PRFDHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_CancelaCupom(const rfdHandle: PRFDHandle; const Value: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_CancelaItemVendido(const rfdHandle: PRFDHandle;
  const Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_ReducaoZ(const rfdHandle: PRFDHandle; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_Documento(const rfdHandle: PRFDHandle; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_EfetuaPagamento(const rfdHandle: PRFDHandle; const Value: PChar;
  const valor: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Eventos}

function RFD_SetOnCalcEAD(const rfdHandle: PRFDHandle;
  const method: TStringCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_SetOnCalcHashLog(const rfdHandle: PRFDHandle;
  const method: TConstStringRetStringCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_SetOnGetKeyHashLog(const rfdHandle: PRFDHandle;
  const method: TRetStringCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function RFD_SetOnGetKeyRSA(const rfdHandle: PRFDHandle;
  const method: TRetStringCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

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
CRIA um novo componente TACBrRFD retornando o ponteiro para o objeto criado.
Este ponteiro deve ser armazenado pela aplicação que utiliza a DLL e informado
em todas as chamadas de função relativas ao TACBrRFD.
}
function RFD_Create(var rfdHandle: PRFDHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try
    New(rfdHandle);
    rfdHandle^.RFD := TACBrRFD.Create(nil);
    rfdHandle^.EventHandlers := TEventHandlersRFD.Create();
    rfdHandle^.UltimoErro := '';
    Result := 0;
  except
    on Exception: Exception do
    begin
      Result := -1;
      rfdHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

{
DESTRÓI o objeto TACBrRFD e libera a memória utilizada.
Esta função deve SEMPRE ser chamada pela aplicação que utiliza a DLL
quando o componente não mais for utilizado.
}
function RFD_Destroy(rfdHandle: PRFDHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.Destroy();
    rfdHandle^.RFD := nil;

    Dispose(rfdHandle);
    rfdHandle := nil;
    Result := 0;

  except
    on Exception: Exception do
    begin
      Result := -1;
      rfdHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

function RFD_GetUltimoErro(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try
    StrPLCopy(Buffer, rfdHandle^.UltimoErro, BufferLen);
    Result := length(rfdHandle^.UltimoErro);
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Funções mapeando as propriedades do componente }

function RFD_GetDirRFD(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := rfdHandle^.RFD.DirRFD;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_SetDirRFD(const rfdHandle: PRFDHandle; const Dir: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.DirRFD := Dir;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_GetSH_CNPJ(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := rfdHandle^.RFD.SH_CNPJ;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_SetSH_CNPJ(const rfdHandle: PRFDHandle; const SH_CNPJ: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.SH_CNPJ := SH_CNPJ;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_GetSH_COO(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := rfdHandle^.RFD.SH_COO;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_SetSH_COO(const rfdHandle: PRFDHandle; const SH_COO: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.SH_COO := SH_COO;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_GetSH_IE(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := rfdHandle^.RFD.SH_IE;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_SetSH_IE(const rfdHandle: PRFDHandle; const SH_IE: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.SH_IE := SH_IE;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_GetSH_IM(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := rfdHandle^.RFD.SH_IM;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_SetSH_IM(const rfdHandle: PRFDHandle; const SH_IM: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.SH_IM := SH_IM;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_GetSH_Linha1(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := rfdHandle^.RFD.SH_Linha1;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_SetSH_Linha1(const rfdHandle: PRFDHandle;
  const SH_Linha1: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.SH_Linha1 := SH_Linha1;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_GetSH_Linha2(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := rfdHandle^.RFD.SH_Linha2;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_SetSH_Linha2(const rfdHandle: PRFDHandle;
  const SH_Linha2: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.SH_Linha2 := SH_Linha2;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_GetSH_NomeAplicativo(const rfdHandle: PRFDHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := rfdHandle^.RFD.SH_NomeAplicativo;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_SetSH_NomeAplicativo(const rfdHandle: PRFDHandle;
  const SH_NomeAplicativo: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.SH_NomeAplicativo := SH_NomeAplicativo;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_GetSH_VersaoAplicativo(const rfdHandle: PRFDHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := rfdHandle^.RFD.SH_VersaoAplicativo;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_SetSH_VersaoAplicativo(const rfdHandle: PRFDHandle;
  const SH_VersaoAplicativo: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.SH_VersaoAplicativo := SH_VersaoAplicativo;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_GetSH_NumeroAplicativo(const rfdHandle: PRFDHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := rfdHandle^.RFD.SH_NumeroAplicativo;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_SetSH_NumeroAplicativo(const rfdHandle: PRFDHandle;
  const SH_NumeroAplicativo: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.SH_NumeroAplicativo := SH_NumeroAplicativo;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_GetIgnoraEcfMfd(const rfdHandle: PRFDHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if rfdHandle^.RFD.IgnoraEcfMfd then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_SetIgnoraEcfMfd(const rfdHandle: PRFDHandle;
  const IgnoraEcfMfd: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.IgnoraEcfMfd := IgnoraEcfMfd;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region Funções mapeando as propriedades do componente não visiveis}

function RFD_GetAtivo(const rfdHandle: PRFDHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if rfdHandle^.RFD.Ativo then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_SetAtivo(const rfdHandle: PRFDHandle; const Ativo: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.Ativo := Ativo;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_GetDiaMov(const rfdHandle: PRFDHandle; var Value: double): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := rfdHandle^.RFD.DiaMov;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_GetDirECF(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := rfdHandle^.RFD.DirECF;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_GetDirECFLog(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := rfdHandle^.RFD.DirECFLog;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_GetDirECFMes(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := rfdHandle^.RFD.DirECFMes;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_GetArqRFDID(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := rfdHandle^.RFD.ArqRFDID;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_GetArqRFD(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := rfdHandle^.RFD.ArqRFD;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_GetArqReducaoZ(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := rfdHandle^.RFD.ArqReducaoZ;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_GetArqINI(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := rfdHandle^.RFD.ArqINI;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_GetECF_CROAtual(const rfdHandle: PRFDHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := rfdHandle^.RFD.ECF_CROAtual;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_SetECF_CROAtual(const rfdHandle: PRFDHandle;
  const Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.ECF_CROAtual := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_GetECF_RFDID(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := rfdHandle^.RFD.ECF_RFDID;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_SetECF_RFDID(const rfdHandle: PRFDHandle; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.ECF_RFDID := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_GetECF_DataHoraSwBasico(const rfdHandle: PRFDHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := rfdHandle^.RFD.ECF_DataHoraSwBasico;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_SetECF_DataHoraSwBasico(const rfdHandle: PRFDHandle;
  const Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.ECF_DataHoraSwBasico := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_GetAtoCotepe(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := rfdHandle^.RFD.AtoCotepe;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_SetAtoCotepe(const rfdHandle: PRFDHandle; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.AtoCotepe := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_GetCONT_CNPJ(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := rfdHandle^.RFD.CONT_CNPJ;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_SetCONT_CNPJ(const rfdHandle: PRFDHandle; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.CONT_CNPJ := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_GetCONT_IE(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := rfdHandle^.RFD.CONT_IE;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_SetCONT_IE(const rfdHandle: PRFDHandle; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.CONT_IE := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_GetCONT_NumUsuario(const rfdHandle: PRFDHandle;
  var Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := rfdHandle^.RFD.CONT_NumUsuario;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_SetCONT_NumUsuario(const rfdHandle: PRFDHandle;
  const Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.CONT_NumUsuario := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_GetCONT_RazaoSocial(const rfdHandle: PRFDHandle;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := rfdHandle^.RFD.CONT_RazaoSocial;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_SetCONT_RazaoSocial(const rfdHandle: PRFDHandle;
  const Value: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.CONT_RazaoSocial := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_GetCONT_Endereco(const rfdHandle: PRFDHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := rfdHandle^.RFD.CONT_Endereco;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_SetCONT_Endereco(const rfdHandle: PRFDHandle;
  const Value: PChar): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.CONT_Endereco := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_GetCONT_DataHoraCadastro(const rfdHandle: PRFDHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := rfdHandle^.RFD.CONT_DataHoraCadastro;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_SetCONT_DataHoraCadastro(const rfdHandle: PRFDHandle;
  const Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.CONT_DataHoraCadastro := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_GetCONT_CROCadastro(const rfdHandle: PRFDHandle;
  var Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := rfdHandle^.RFD.CONT_CROCadastro;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_SetCONT_CROCadastro(const rfdHandle: PRFDHandle;
  const Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.CONT_CROCadastro := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_GetCONT_GTCadastro(const rfdHandle: PRFDHandle;
  var Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Value := rfdHandle^.RFD.CONT_GTCadastro;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function RFD_SetCONT_GTCadastro(const rfdHandle: PRFDHandle;
  const Value: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.CONT_GTCadastro := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region Componente ACBr}

function RFD_SetECF(const rfdHandle: PRFDHandle;
  const ecfHandle: PECFHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (ecfHandle = nil) then
    begin
      rfdHandle^.RFD.ECF := nil;
      Result := 0;
    end
    else
    begin
      rfdHandle^.RFD.ECF := ecfHandle^.ECF;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Metodos}

function RFD_Ativar(const rfdHandle: PRFDHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.Ativar;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function RFD_Desativar(const rfdHandle: PRFDHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.Desativar;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function RFD_VerificaParametros(const rfdHandle: PRFDHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.VerificaParametros;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function RFD_AchaRFDID(const rfdHandle: PRFDHandle; const Value: PChar;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := rfdHandle^.RFD.AchaRFDID(Value);
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function RFD_LerINI(const rfdHandle: PRFDHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.LerINI;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function RFD_GravarINI(const rfdHandle: PRFDHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.GravarINI;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function RFD_CriarArqRFDID(const rfdHandle: PRFDHandle; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.CriarArqRFDID(Value);
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function RFD_NomeArqRFD(const rfdHandle: PRFDHandle; const Value: double;
  Buffer: PChar; const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := rfdHandle^.RFD.NomeArqRFD(Value);
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function RFD_AbreCupom(const rfdHandle: PRFDHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.AbreCupom;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function RFD_VendeItem(const rfdHandle: PRFDHandle; const Codigo, Descricao: PChar;
  const Qtd, ValorUnitario: double; const Unidade: PChar;
  const ValorDescAcres: double; Aliquota: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.VendeItem(Codigo, Descricao, Qtd, ValorUnitario,
      Unidade, ValorDescAcres, Aliquota);
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function RFD_SubTotalizaCupom(const rfdHandle: PRFDHandle;
  const DescontoAcrescimo: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.SubTotalizaCupom(DescontoAcrescimo);
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function RFD_FechaCupom(const rfdHandle: PRFDHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.FechaCupom;
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function RFD_CancelaCupom(const rfdHandle: PRFDHandle; const Value: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.CancelaCupom(Value);
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function RFD_CancelaItemVendido(const rfdHandle: PRFDHandle;
  const Value: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.CancelaItemVendido(Value);
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function RFD_ReducaoZ(const rfdHandle: PRFDHandle; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.ReducaoZ(Value);
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function RFD_Documento(const rfdHandle: PRFDHandle; const Value: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.Documento(Value);
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function RFD_EfetuaPagamento(const rfdHandle: PRFDHandle; const Value: PChar;
  const valor: double): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    rfdHandle^.RFD.EfetuaPagamento(Value, valor);
    Result := 0;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Eventos}

function RFD_SetOnCalcEAD(const rfdHandle: PRFDHandle;
  const method: TStringCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      rfdHandle^.RFD.OnCalcEAD := rfdHandle^.EventHandlers.OnCalcEAD;
      rfdHandle^.EventHandlers.OnCalcEADCallback := method;
      Result := 0;
    end
    else
    begin
      rfdHandle^.RFD.OnCalcEAD := nil;
      rfdHandle^.EventHandlers.OnCalcEADCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function RFD_SetOnCalcHashLog(const rfdHandle: PRFDHandle;
  const method: TConstStringRetStringCallback): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      rfdHandle^.RFD.OnCalcHashLog := rfdHandle^.EventHandlers.OnCalcHashLog;
      rfdHandle^.EventHandlers.OnCalcHashLogCallback := method;
      Result := 0;
    end
    else
    begin
      rfdHandle^.RFD.OnCalcHashLog := nil;
      rfdHandle^.EventHandlers.OnCalcHashLogCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function RFD_SetOnGetKeyHashLog(const rfdHandle: PRFDHandle;
  const method: TRetStringCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      rfdHandle^.RFD.OnGetKeyHashLog := rfdHandle^.EventHandlers.OnGetKeyHashLog;
      rfdHandle^.EventHandlers.OnGetKeyHashLogCallback := method;
      Result := 0;
    end
    else
    begin
      rfdHandle^.RFD.OnGetKeyHashLog := nil;
      rfdHandle^.EventHandlers.OnGetKeyHashLogCallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function RFD_SetOnGetKeyRSA(const rfdHandle: PRFDHandle;
  const method: TRetStringCallback): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (rfdHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if Assigned(method) then
    begin
      rfdHandle^.RFD.OnGetKeyRSA := rfdHandle^.EventHandlers.OnGetKeyRSA;
      rfdHandle^.EventHandlers.OnGetKeyRSACallback := method;
      Result := 0;
    end
    else
    begin
      rfdHandle^.RFD.OnGetKeyRSA := nil;
      rfdHandle^.EventHandlers.OnGetKeyRSACallback := nil;
      Result := 0;
    end;
  except
    on Exception: Exception do
    begin
      rfdHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

end.
