unit ACBrSintegraDll;


interface

uses
  Classes,
  SysUtils,
  ACBrSintegra,
  ACBrHandlers,
  ACBrUtil;

{%region Registro }

type
  TRegistro10Rec = record
    CNPJ: array[0..14] of char;
    Inscricao: array[0..14] of char;
    RazaoSocial: array[0..35] of char;
    Cidade: array[0..30] of char;
    Estado: array[0..2] of char;
    Telefone: array[0..12] of char;
    DataInicial: double;
    DataFinal: double;
    CodigoConvenio: integer;
    NaturezaInformacoes: integer;
    FinalidadeArquivo: integer;
  end;

type
  TRegistro11Rec = record
    Responsavel: array[0..28] of char;
    Bairro: array[0..15] of char;
    Cep: array[0..8] of char;
    Numero: array[0..5] of char;
    Complemento: array[0..22] of char;
    Endereco: array[0..34] of char;
    Telefone: array[0..12] of char;
  end;

type
  TRegistro50Rec = record
    CPFCNPJ: array[0..14] of char;
    Inscricao: array[0..14] of char;
    UF: array[0..2] of char;
    Situacao: array[0..1] of char;
    Aliquota: double;
    Isentas: double;
    Icms: double;
    ValorContabil: double;
    BasedeCalculo: double;
    Outras: double;
    EmissorDocumento: array[0..1] of char;
    Cfop: array[0..4] of char;
    Serie: array[0..3] of char;
    Modelo: array[0..2] of char;
    Numero: array[0..6] of char;
    DataDocumento: double;
  end;

type
  TRegistro51Rec = record
    CPFCNPJ: array[0..14] of char;
    Inscricao: array[0..14] of char;
    Estado: array[0..2] of char;
    ValorIpi: double;
    ValorContabil: double;
    Serie: array[0..3] of char;
    DataDocumento: double;
    Cfop: array[0..4] of char;
    Numero: array[0..6] of char;
    Situacao: array[0..1] of char;
    ValorIsentas: double;
    ValorOutras: double;
  end;

type
  TRegistro53Rec = record
    CPFCNPJ: array[0..14] of char;
    Inscricao: array[0..14] of char;
    Estado: array[0..2] of char;
    Serie: array[0..3] of char;
    DataDocumento: double;
    Cfop: array[0..4] of char;
    Numero: array[0..6] of char;
    Situacao: array[0..3] of char;
    CodigoAntecipacao: array[0..1] of char;
    BaseST: double;
    Modelo: array[0..2] of char;
    Emitente: array[0..1] of char;
    Despesas: double;
    IcmsRetido: double;
  end;

type
  TRegistro54Rec = record
    Aliquota: double;
    BaseST: double;
    BasedeCalculo: double;
    Quantidade: double;
    ValorDescontoDespesa: double;
    ValorIpi: double;
    Valor: double;
    NumeroItem: integer;
    CST: array[0..3] of char;
    Codigo: array[0..14] of char;
    CFOP: array[0..4] of char;
    Descricao: array[0..53] of char;
    CPFCNPJ: array[0..14] of char;
    Numero: array[0..6] of char;
    Modelo: array[0..2] of char;
    Serie: array[0..3] of char;
  end;

type
  TRegistro55Rec = record
    Valor: double;
    Agencia: integer;
    Banco: integer;
    NumeroConvenio: array[0..30] of char;
    Inscricao: array[0..14] of char;
    MesAno: array[0..6] of char;
    CNPJ: array[0..14] of char;
    UF: array[0..2] of char;
    Numero: array[0..14] of char;
    DataPagamento: double;
    Vencimento: double;
  end;

type
  TRegistro56Rec = record
    Cnpj: array[0..14] of char;
    Modelo: array[0..2] of char;
    Serie: array[0..3] of char;
    Numero: array[0..6] of char;
    Cfop: array[0..4] of char;
    Cst: array[0..3] of char;
    NumeroItem: integer;
    Codigo: array[0..14] of char;
    TipoOperacao: array[0..1] of char;
    CnpjConcessionaria: array[0..14] of char;
    Ipi: double;
    Chassi: array[0..17] of char;
  end;

type
  TRegistro60MRec = record
    CRO: integer;
    NumOrdem: integer;
    VendaBruta: double;
    ModeloDoc: array[0..2] of char;
    ValorGT: double;
    CRZ: integer;
    CooFinal: integer;
    CooInicial: integer;
    NumSerie: array[0..20] of char;
    Emissao: double;
  end;

type
  TRegistro60ARec = record
    NumSerie: array[0..20] of char;
    Aliquota: array[0..4] of char;
    Emissao: double;
    Valor: double;
  end;

type
  TRegistro60DRec = record
    NumSerie: array[0..20] of char;
    StAliquota: array[0..4] of char;
    Emissao: double;
    Valor: double;
    Codigo: array[0..14] of char;
    ValorIcms: double;
    Quantidade: double;
    BaseDeCalculo: double;
  end;

type
  TRegistro60IRec = record
    NumSerie: array[0..20] of char;
    StAliquota: array[0..4] of char;
    Emissao: double;
    Valor: double;
    Codigo: array[0..14] of char;
    ValorIcms: double;
    Quantidade: double;
    BaseDeCalculo: double;
    Item: integer;
    Cupom: array[0..6] of char;
    ModeloDoc: array[0..2] of char;
  end;

type
  TRegistro60RRec = record
    BaseDeCalculo: double;
    Valor: double;
    Qtd: double;
    MesAno: array[0..6] of char;
    Codigo: array[0..14] of char;
    Aliquota: array[0..4] of char;
  end;

type
  TRegistro61Rec = record
    Emissao: double;
    Valor: double;
    ValorIcms: double;
    Outras: double;
    BaseDeCalculo: double;
    Isentas: double;
    NumOrdemInicial: integer;
    NumOrdemFinal: integer;
    Modelo: array[0..2] of char;
    SubSerie: array[0..2] of char;
    Serie: array[0..3] of char;
    Aliquota: double;
  end;

type
  TRegistro61RRec = record
    Aliquota: double;
    Valor: double;
    Qtd: double;
    MesAno: array[0..6] of char;
    Codigo: array[0..14] of char;
    BaseDeCalculo: double;
  end;

type
  TRegistro70Rec = record
    Icms: double;
    ValorContabil: double;
    UF: array[0..2] of char;
    Isentas: double;
    SubSerie: array[0..2] of char;
    Serie: array[0..1] of char;
    DataDocumento: double;
    Modelo: array[0..2] of char;
    CPFCNPJ: array[0..14] of char;
    Cfop: array[0..4] of char;
    Numero: array[0..6] of char;
    Inscricao: array[0..14] of char;
    Situacao: array[0..14] of char;
    Outras: double;
    BasedeCalculo: double;
    CifFobOutros: array[0..1] of char;
  end;

type
  TRegistro71Rec = record
    CPFCNPJ: array[0..14] of char;
    Inscricao: array[0..14] of char;
    DataDocumento: double;
    Modelo: array[0..2] of char;
    Serie: array[0..1] of char;
    SubSerie: array[0..2] of char;
    Numero: array[0..6] of char;
    UF: array[0..2] of char;
    UFNF: array[0..2] of char;
    CPFCNPJNF: array[0..14] of char;
    InscricaoNF: array[0..14] of char;
    DataNF: double;
    ModeloNF: array[0..2] of char;
    SerieNF: array[0..3] of char;
    NumeroNF: array[0..6] of char;
    ValorNF: double;
  end;

type
  TRegistro74Rec = record
    ValorProduto: double;
    CodigoPosse: array[0..1] of char;
    InscricaoPossuidor: array[0..14] of char;
    Codigo: array[0..14] of char;
    CNPJPossuidor: array[0..14] of char;
    UFPossuidor: array[0..2] of char;
    Data: double;
    Quantidade: double;
  end;

type
  TRegistro75Rec = record
    Codigo: array[0..14] of char;
    Descricao: array[0..53] of char;
    Reducao: double;
    BaseST: double;
    AliquotaIpi: double;
    NCM: array[0..8] of char;
    Unidade: array[0..6] of char;
    AliquotaICMS: double;
    DataFinal: double;
    DataInicial: double;
  end;

type
  TRegistro76Rec = record
    Isentas: double;
    ValorTotal: double;
    Icms: double;
    BasedeCalculo: double;
    Outras: double;
    Modelo: integer;
    Numero: integer;
    Situacao: array[0..1] of char;
    Inscricao: array[0..14] of char;
    SubSerie: array[0..2] of char;
    Uf: array[0..2] of char;
    Serie: array[0..2] of char;
    Cfop: array[0..4] of char;
    CPFCNPJ: array[0..14] of char;
    DataDocumento: double;
    TipoReceita: integer;
    Aliquota: integer;
  end;

type
  TRegistro77Rec = record
    Quantidade: double;
    ValorServico: double;
    ValorDesconto: double;
    BaseDeCalculo: double;
    Modelo: integer;
    Numero: integer;
    NumeroTerminal: integer;
    NumeroItem: integer;
    Aliquota: integer;
    CNPJMF: array[0..14] of char;
    Cfop: array[0..4] of char;
    Codigo: array[0..11] of char;
    SubSerie: array[0..2] of char;
    CPFCNPJ: array[0..14] of char;
    Serie: array[0..2] of char;
    TipoReceita: integer;
  end;

type
  TRegistro85Rec = record
    Declaracao: array[0..11] of char;
    DataDeclaracao: double;
    NaturezaExportacao: array[0..1] of char;
    RegistroExportacao: array[0..12] of char;
    DataRegistro: double;
    Conhecimento: array[0..16] of char;
    DataConhecimento: double;
    TipoConhecimento: array[0..2] of char;
    Pais: array[0..4] of char;
    DataAverbacao: double;
    NumeroNotaFiscal: array[0..6] of char;
    DataNotaFiscal: double;
    Modelo: array[0..2] of char;
    Serie: array[0..3] of char;
  end;

type
  TRegistro86Rec = record
    RegistroExportacao: array[0..12] of char;
    DataRegistro: double;
    CPFCNPJ: array[0..14] of char;
    Inscricao: array[0..14] of char;
    UF: array[0..2] of char;
    NumeroNotaFiscal: array[0..6] of char;
    DataDocumento: double;
    Modelo: array[0..2] of char;
    Serie: array[0..3] of char;
    Codigo: array[0..14] of char;
    Quantidade: double;
    ValorUnitario: double;
    ValorTotalProduto: double;
    Relacionamento: array[0..1] of char;
  end;

{%endregion}

{%region Declara????o da fun????es}

{%region Constructor/Destructor/Erro}

function SIN_Create(var sinHandle: PSINHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_Destroy(sinHandle: PSINHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_GetUltimoErro(const sinHandle: PSINHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Fun????es mapeando as propriedades do componente }

function SIN_GetFileName(const sinHandle: PSINHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_SetFileName(const sinHandle: PSINHandle; const FileN: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_GetVersaoValidador(const sinHandle: PSINHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_SetVersaoValidador(const sinHandle: PSINHandle;
  const Versao: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_GetAtivo(const sinHandle: PSINHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_SetAtivo(const sinHandle: PSINHandle; const Value: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_GetVersao(const sinHandle: PSINHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_GetInforma88C(const sinHandle: PSINHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_SetInforma88C(const sinHandle: PSINHandle;
  const Value: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_GetInforma88EAN(const sinHandle: PSINHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_SetInforma88EAN(const sinHandle: PSINHandle;
  const Value: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_GetInforma88SME(const sinHandle: PSINHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_SetInforma88SME(const sinHandle: PSINHandle;
  const Value: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_GetInforma88SMS(const sinHandle: PSINHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_SetInforma88SMS(const sinHandle: PSINHandle;
  const Value: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_GetInformaSapiMG(const sinHandle: PSINHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_SetInformaSapiMG(const sinHandle: PSINHandle;
  const Value: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Registro }

function SIN_Registro10(const sinHandle: PSINHandle;
  const Registro10Rec: TRegistro10Rec): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_Registro11(const sinHandle: PSINHandle;
  const Registro11Rec: TRegistro11Rec): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_Registro50(const sinHandle: PSINHandle;
  var Registro50Rec: array of TRegistro50Rec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_Registro51(const sinHandle: PSINHandle;
  var Registro51Rec: array of TRegistro51Rec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_Registro53(const sinHandle: PSINHandle;
  var Registro53Rec: array of TRegistro53Rec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_Registro54(const sinHandle: PSINHandle;
  var Registro54Rec: array of TRegistro54Rec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_Registro55(const sinHandle: PSINHandle;
  var Registro55Rec: array of TRegistro55Rec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_Registro56(const sinHandle: PSINHandle;
  var Registro56Rec: array of TRegistro56Rec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_Registro60M(const sinHandle: PSINHandle;
  var Registro60MRec: array of TRegistro60MRec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_Registro60A(const sinHandle: PSINHandle;
  var Registro60ARec: array of TRegistro60ARec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_Registro60D(const sinHandle: PSINHandle;
  var Registro60DRec: array of TRegistro60DRec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_Registro60I(const sinHandle: PSINHandle;
  var Registro60IRec: array of TRegistro60IRec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_Registro60R(const sinHandle: PSINHandle;
  var Registro60RRec: array of TRegistro60RRec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_Registro61(const sinHandle: PSINHandle;
  var Registro61Rec: array of TRegistro61Rec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_Registro61R(const sinHandle: PSINHandle;
  var Registro61RRec: array of TRegistro61RRec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_Registro70(const sinHandle: PSINHandle;
  var Registro70Rec: array of TRegistro70Rec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_Registro71(const sinHandle: PSINHandle;
  var Registro71Rec: array of TRegistro71Rec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_Registro74(const sinHandle: PSINHandle;
  var Registro74Rec: array of TRegistro74Rec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_Registro75(const sinHandle: PSINHandle;
  var Registro75Rec: array of TRegistro75Rec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_Registro76(const sinHandle: PSINHandle;
  var Registro76Rec: array of TRegistro76Rec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_Registro77(const sinHandle: PSINHandle;
  var Registro77Rec: array of TRegistro77Rec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_Registro85(const sinHandle: PSINHandle;
  var Registro85Rec: array of TRegistro85Rec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_Registro86(const sinHandle: PSINHandle;
  var Registro86Rec: array of TRegistro86Rec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%region Fun????es do Componente}

function SIN_LimparRegistros(const sinHandle: PSINHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function SIN_GeraArquivo(const sinHandle: PSINHandle): integer;
  {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

{%endregion}

{%endregion}

implementation

{%region Constructor/Destructor/Erro}

{
PADRONIZA????O DAS FUN????ES:

        PAR??METROS:
        Todas as fun????es recebem o par??metro "handle" que ?? o ponteiro
        para o componente instanciado; Este ponteiro deve ser armazenado
        pela aplica????o que utiliza a DLL;

        RETORNO:
        Todas as fun????es da biblioteca retornam um Integer com as poss??veis Respostas:

                MAIOR OU IGUAL A ZERO: SUCESSO
                Outos retornos maior que zero indicam sucesso, com valor espec??fico de cada fun????o.

                MENOR QUE ZERO: ERROS

                  -1 : Erro ao executar;
                       Vide UltimoErro

                  -2 : ACBr n??o inicializado.

                  Outros retornos negativos indicam erro espec??fico de cada fun????o;

                  A fun????o "UltimoErro" retornar?? a mensagem da ??ltima exception disparada pelo componente.
}

{
CRIA um novo componente TACBrSintegra retornando o ponteiro para o objeto criado.
Este ponteiro deve ser armazenado pela aplica????o que utiliza a DLL e informado
em todas as chamadas de fun????o relativas ao TACBrPAF.
}
function SIN_Create(var sinHandle: PSINHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try

    New(sinHandle);
    sinHandle^.Sintegra := TACBrSintegra.Create(nil);
    sinHandle^.EventHandlers := TEventHandlersSIN.Create();
    sinHandle^.UltimoErro := '';
    Result := 0;
  except
    on Exception: Exception do
    begin
      Result := -1;
      sinHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

{
DESTR??I o objeto TACBrSintegra e libera a mem??ria utilizada.
Esta fun????o deve SEMPRE ser chamada pela aplica????o que utiliza a DLL
quando o componente n??o mais for utilizado.
}
function SIN_Destroy(sinHandle: PSINHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (sinHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    sinHandle^.Sintegra.Destroy();
    sinHandle^.Sintegra := nil;

    Dispose(sinHandle);
    sinHandle := nil;
    Result := 0;

  except
    on Exception: Exception do
    begin
      Result := -1;
      sinHandle^.UltimoErro := Exception.Message;
    end
  end;

end;

function SIN_GetUltimoErro(const sinHandle: PSINHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  try
    StrPLCopy(Buffer, sinHandle^.UltimoErro, BufferLen);
    Result := length(sinHandle^.UltimoErro);
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

{%region Fun????es mapeando as propriedades do componente }

function SIN_GetFileName(const sinHandle: PSINHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (sinHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := sinHandle^.Sintegra.FileName;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SIN_SetFileName(const sinHandle: PSINHandle; const FileN: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (sinHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    sinHandle^.Sintegra.FileName := FileN;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SIN_GetVersaoValidador(const sinHandle: PSINHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (sinHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(sinHandle^.Sintegra.VersaoValidador);
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SIN_SetVersaoValidador(const sinHandle: PSINHandle;
  const Versao: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  if (sinHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    sinHandle^.Sintegra.VersaoValidador := TVersaoValidador(Versao);
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SIN_GetAtivo(const sinHandle: PSINHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (sinHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (sinHandle^.Sintegra.Ativo) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SIN_SetAtivo(const sinHandle: PSINHandle; const Value: boolean): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (sinHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try

    sinHandle^.Sintegra.Ativo := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SIN_GetVersao(const sinHandle: PSINHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (sinHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := sinHandle^.Sintegra.Versao;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SIN_GetInforma88C(const sinHandle: PSINHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (sinHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (sinHandle^.Sintegra.Informa88C) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SIN_SetInforma88C(const sinHandle: PSINHandle;
  const Value: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (sinHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    sinHandle^.Sintegra.Informa88C := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SIN_GetInforma88EAN(const sinHandle: PSINHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (sinHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (sinHandle^.Sintegra.Informa88EAN) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SIN_SetInforma88EAN(const sinHandle: PSINHandle;
  const Value: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (sinHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    sinHandle^.Sintegra.Informa88EAN := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SIN_GetInforma88SME(const sinHandle: PSINHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (sinHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (sinHandle^.Sintegra.Informa88SME) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SIN_SetInforma88SME(const sinHandle: PSINHandle;
  const Value: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (sinHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    sinHandle^.Sintegra.Informa88SME := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SIN_GetInforma88SMS(const sinHandle: PSINHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (sinHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (sinHandle^.Sintegra.Informa88SMS) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SIN_SetInforma88SMS(const sinHandle: PSINHandle;
  const Value: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (sinHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    sinHandle^.Sintegra.Informa88SMS := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SIN_GetInformaSapiMG(const sinHandle: PSINHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (sinHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if (sinHandle^.Sintegra.InformaSapiMG) then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function SIN_SetInformaSapiMG(const sinHandle: PSINHandle;
  const Value: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (sinHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    sinHandle^.Sintegra.InformaSapiMG := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

{%endregion}

{%region Registro }

function SIN_Registro10(const sinHandle: PSINHandle;
  const Registro10Rec: TRegistro10Rec): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  try
    if (sinHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    with sinHandle^.Sintegra.Registro10 do
    begin
      CNPJ := Registro10Rec.CNPJ;
      Inscricao := Registro10Rec.Inscricao;
      RazaoSocial := Registro10Rec.RazaoSocial;
      Cidade := Registro10Rec.Cidade;
      Estado := Registro10Rec.Estado;
      Telefone := Registro10Rec.Telefone;
      DataInicial := Registro10Rec.DataInicial;
      DataFinal := Registro10Rec.DataFinal;
      CodigoConvenio := IntToStr(Registro10Rec.CodigoConvenio);
      NaturezaInformacoes := IntToStr(Registro10Rec.NaturezaInformacoes);
      FinalidadeArquivo := IntToStr(Registro10Rec.FinalidadeArquivo);
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SIN_Registro11(const sinHandle: PSINHandle;
  const Registro11Rec: TRegistro11Rec): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  try
    if (sinHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    with sinHandle^.Sintegra.Registro11 do
    begin
      Responsavel := Registro11Rec.Responsavel;
      Bairro := Registro11Rec.Bairro;
      Cep := Registro11Rec.Cep;
      Numero := Registro11Rec.Numero;
      Complemento := Registro11Rec.Complemento;
      Endereco := Registro11Rec.Endereco;
      Telefone := Registro11Rec.Telefone;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SIN_Registro50(const sinHandle: PSINHandle;
  var Registro50Rec: array of TRegistro50Rec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  registro50: TRegistro50;
  i: integer;
begin
  try
    if (sinHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    for i := 0 to Count - 1 do
    begin
      with sinHandle^.Sintegra do
      begin
        registro50 := TRegistro50.Create;
        registro50.CPFCNPJ := Registro50Rec[i].CPFCNPJ;
        registro50.Inscricao := Registro50Rec[i].Inscricao;
        registro50.DataDocumento := Registro50Rec[i].DataDocumento;
        registro50.UF := Registro50Rec[i].UF;
        registro50.Modelo := Registro50Rec[i].Modelo;
        registro50.Serie := Registro50Rec[i].Serie;
        registro50.Numero := Registro50Rec[i].Numero;
        registro50.Cfop := Registro50Rec[i].Cfop;
        registro50.EmissorDocumento := Registro50Rec[i].EmissorDocumento;
        registro50.ValorContabil := Registro50Rec[i].ValorContabil;
        registro50.BasedeCalculo := Registro50Rec[i].BasedeCalculo;
        registro50.Icms := Registro50Rec[i].Icms;
        registro50.Isentas := Registro50Rec[i].Isentas;
        registro50.Outras := Registro50Rec[i].Outras;
        registro50.Aliquota := Registro50Rec[i].Aliquota;
        registro50.Situacao := Registro50Rec[i].Situacao;
        Registros50.Add(registro50);
      end;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SIN_Registro51(const sinHandle: PSINHandle;
  var Registro51Rec: array of TRegistro51Rec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  registro51: TRegistro51;
  i: integer;
begin
  try
    if (sinHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    for i := 0 to Count - 1 do
    begin
      with sinHandle^.Sintegra do
      begin
        registro51 := TRegistro51.Create;
        registro51.CPFCNPJ := Registro51Rec[i].CPFCNPJ;
        registro51.Inscricao := Registro51Rec[i].Inscricao;
        registro51.DataDocumento := Registro51Rec[i].DataDocumento;
        registro51.Estado := Registro51Rec[i].Estado;
        registro51.Serie := Registro51Rec[i].Serie;
        registro51.Numero := Registro51Rec[i].Numero;
        registro51.Cfop := Registro51Rec[i].Cfop;
        registro51.ValorContabil := Registro51Rec[i].ValorContabil;
        registro51.ValorIpi := Registro51Rec[i].ValorIpi;
        registro51.ValorOutras := Registro51Rec[i].ValorOutras;
        registro51.ValorIsentas := Registro51Rec[i].ValorIsentas;
        registro51.Situacao := Registro51Rec[i].Situacao;
        Registros51.Add(registro51);
      end;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SIN_Registro53(const sinHandle: PSINHandle;
  var Registro53Rec: array of TRegistro53Rec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  registro53: TRegistro53;
  i: integer;
begin
  try
    if (sinHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    for i := 0 to Count - 1 do
    begin
      with sinHandle^.Sintegra do
      begin
        registro53 := TRegistro53.Create;
        registro53.CPFCNPJ := Registro53Rec[i].CPFCNPJ;
        registro53.Inscricao := Registro53Rec[i].Inscricao;
        registro53.Estado := Registro53Rec[i].Estado;
        registro53.Serie := Registro53Rec[i].Serie;
        registro53.DataDocumento := Registro53Rec[i].DataDocumento;
        registro53.Cfop := Registro53Rec[i].Cfop;
        registro53.Numero := Registro53Rec[i].Numero;
        registro53.Situacao := Registro53Rec[i].Situacao;
        registro53.CodigoAntecipacao := Registro53Rec[i].CodigoAntecipacao;
        registro53.BaseST := Registro53Rec[i].BaseST;
        registro53.Modelo := Registro53Rec[i].Modelo;
        registro53.Emitente := Registro53Rec[i].Emitente;
        registro53.Despesas := Registro53Rec[i].Despesas;
        registro53.IcmsRetido := Registro53Rec[i].IcmsRetido;
        Registros53.Add(registro53);
      end;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SIN_Registro54(const sinHandle: PSINHandle;
  var Registro54Rec: array of TRegistro54Rec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  registro54: TRegistro54;
  i: integer;
begin
  try
    if (sinHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    for i := 0 to Count - 1 do
    begin
      with sinHandle^.Sintegra do
      begin
        registro54 := TRegistro54.Create;
        registro54.Aliquota := Registro54Rec[i].Aliquota;
        registro54.BaseST := Registro54Rec[i].BaseST;
        registro54.BasedeCalculo := Registro54Rec[i].BasedeCalculo;
        registro54.Quantidade := Registro54Rec[i].Quantidade;
        registro54.ValorDescontoDespesa := Registro54Rec[i].ValorDescontoDespesa;
        registro54.ValorIpi := Registro54Rec[i].ValorIpi;
        registro54.Valor := Registro54Rec[i].Valor;
        registro54.NumeroItem := Registro54Rec[i].NumeroItem;
        registro54.CST := Registro54Rec[i].CST;
        registro54.Codigo := Registro54Rec[i].Codigo;
        registro54.CFOP := Registro54Rec[i].CFOP;
        registro54.Descricao := Registro54Rec[i].Descricao;
        registro54.CPFCNPJ := Registro54Rec[i].CPFCNPJ;
        registro54.Numero := Registro54Rec[i].Numero;
        registro54.Modelo := Registro54Rec[i].Modelo;
        registro54.Serie := Registro54Rec[i].Serie;
        Registros54.Add(registro54);
      end;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SIN_Registro55(const sinHandle: PSINHandle;
  var Registro55Rec: array of TRegistro55Rec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  registro55: TRegistro55;
  i: integer;
begin
  try
    if (sinHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    for i := 0 to Count - 1 do
    begin
      with sinHandle^.Sintegra do
      begin
        registro55 := TRegistro55.Create;
        registro55.Valor := Registro55Rec[i].Valor;
        registro55.Agencia := Registro55Rec[i].Agencia;
        registro55.Banco := Registro55Rec[i].Banco;
        registro55.NumeroConvenio := Registro55Rec[i].NumeroConvenio;
        registro55.Inscricao := Registro55Rec[i].Inscricao;
        registro55.MesAno := Registro55Rec[i].MesAno;
        registro55.CNPJ := Registro55Rec[i].CNPJ;
        registro55.UF := Registro55Rec[i].UF;
        registro55.Numero := Registro55Rec[i].Numero;
        registro55.DataPagamento := Registro55Rec[i].DataPagamento;
        registro55.Vencimento := Registro55Rec[i].Vencimento;
        Registros55.Add(registro55);
      end;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SIN_Registro56(const sinHandle: PSINHandle;
  var Registro56Rec: array of TRegistro56Rec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  registro56: TRegistro56;
  i: integer;
begin
  try
    if (sinHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    for i := 0 to Count - 1 do
    begin
      with sinHandle^.Sintegra do
      begin
        registro56 := TRegistro56.Create;
        registro56.Cnpj := Registro56Rec[i].Cnpj;
        registro56.Modelo := Registro56Rec[i].Modelo;
        registro56.Serie := Registro56Rec[i].Serie;
        registro56.Numero := Registro56Rec[i].Numero;
        registro56.Cfop := Registro56Rec[i].Cfop;
        registro56.Cst := Registro56Rec[i].Cst;
        registro56.NumeroItem := Registro56Rec[i].NumeroItem;
        registro56.Codigo := Registro56Rec[i].Codigo;
        registro56.TipoOperacao := Registro56Rec[i].TipoOperacao;
        registro56.CnpjConcessionaria := Registro56Rec[i].CnpjConcessionaria;
        registro56.Ipi := Registro56Rec[i].Ipi;
        registro56.Chassi := Registro56Rec[i].Chassi;
        Registros56.Add(registro56);
      end;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SIN_Registro60M(const sinHandle: PSINHandle;
  var Registro60MRec: array of TRegistro60MRec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  registro60M: TRegistro60M;
  i: integer;
begin
  try
    if (sinHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    for i := 0 to Count - 1 do
    begin
      with sinHandle^.Sintegra do
      begin
        registro60M := TRegistro60M.Create;
        registro60M.Emissao := Registro60MRec[i].Emissao;
        registro60M.NumSerie := Registro60MRec[i].NumSerie;
        registro60M.NumOrdem := Registro60MRec[i].NumOrdem;
        registro60M.ModeloDoc := Registro60MRec[i].ModeloDoc;
        registro60M.CooInicial := Registro60MRec[i].CooInicial;
        registro60M.CooFinal := Registro60MRec[i].CooFinal;
        registro60M.CRZ := Registro60MRec[i].CRZ;
        registro60M.CRO := Registro60MRec[i].CRO;
        registro60M.VendaBruta := Registro60MRec[i].VendaBruta;
        registro60M.ValorGT := Registro60MRec[i].ValorGT;
        Registros60M.Add(registro60M);
      end;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SIN_Registro60A(const sinHandle: PSINHandle;
  var Registro60ARec: array of TRegistro60ARec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  registro60A: TRegistro60A;
  i: integer;
begin
  try
    for i := 0 to Count - 1 do
    begin
      with sinHandle^.Sintegra do
      begin
        registro60A := TRegistro60A.Create;
        registro60A.Emissao := Registro60ARec[i].Emissao;
        registro60A.NumSerie := Registro60ARec[i].NumSerie;
        registro60A.StAliquota := Registro60ARec[i].Aliquota;
        registro60A.Valor := Registro60ARec[i].Valor;
        Registros60A.Add(registro60A);
      end;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end;
  end;
end;

function SIN_Registro60D(const sinHandle: PSINHandle;
  var Registro60DRec: array of TRegistro60DRec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  registro60D: TRegistro60D;
  i: integer;
begin
  try
    for i := 0 to Count - 1 do
    begin
      with sinHandle^.Sintegra do
      begin
        registro60D := TRegistro60D.Create;
        registro60D.Emissao := Registro60DRec[i].Emissao;
        registro60D.NumSerie := Registro60DRec[i].NumSerie;
        registro60D.Codigo := Registro60DRec[i].Codigo;
        registro60D.Quantidade := Registro60DRec[i].Quantidade;
        registro60D.Valor := Registro60DRec[i].Valor;
        registro60D.BaseDeCalculo := Registro60DRec[i].BaseDeCalculo;
        registro60D.StAliquota := Registro60DRec[i].StAliquota;
        registro60D.ValorIcms := Registro60DRec[i].ValorIcms;
        Registros60D.Add(registro60D);
      end;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end;
  end;
end;

function SIN_Registro60I(const sinHandle: PSINHandle;
  var Registro60IRec: array of TRegistro60IRec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  registro60I: TRegistro60I;
  i: integer;
begin
  try
    for i := 0 to Count - 1 do
    begin
      with sinHandle^.Sintegra do
      begin
        registro60I := TRegistro60I.Create;
        registro60I.NumSerie := Registro60IRec[i].NumSerie;
        registro60I.StAliquota := Registro60IRec[i].StAliquota;
        registro60I.Emissao := Registro60IRec[i].Emissao;
        registro60I.Valor := Registro60IRec[i].Valor;
        registro60I.Codigo := Registro60IRec[i].Codigo;
        registro60I.ValorIcms := Registro60IRec[i].ValorIcms;
        registro60I.Quantidade := Registro60IRec[i].Quantidade;
        registro60I.BaseDeCalculo := Registro60IRec[i].BaseDeCalculo;
        registro60I.Item := Registro60IRec[i].Item;
        registro60I.Cupom := Registro60IRec[i].Cupom;
        registro60I.ModeloDoc := Registro60IRec[i].ModeloDoc;
        Registros60I.Add(registro60I);
      end;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end;
  end;
end;

function SIN_Registro60R(const sinHandle: PSINHandle;
  var Registro60RRec: array of TRegistro60RRec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  registro60R: TRegistro60R;
  i: integer;
begin
  try
    for i := 0 to Count - 1 do
    begin
      with sinHandle^.Sintegra do
      begin
        registro60R := TRegistro60R.Create;
        registro60R.BaseDeCalculo := Registro60RRec[i].BaseDeCalculo;
        registro60R.Valor := Registro60RRec[i].Valor;
        registro60R.Qtd := Registro60RRec[i].Qtd;
        registro60R.MesAno := Registro60RRec[i].MesAno;
        registro60R.Codigo := Registro60RRec[i].Codigo;
        registro60R.Aliquota := Registro60RRec[i].Aliquota;
        Registros60R.Add(registro60R);
      end;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end;
  end;
end;

function SIN_Registro61(const sinHandle: PSINHandle;
  var Registro61Rec: array of TRegistro61Rec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  registro61: TRegistro61;
  i: integer;
begin
  try
    for i := 0 to Count - 1 do
    begin
      with sinHandle^.Sintegra do
      begin
        registro61 := TRegistro61.Create;
        registro61.Emissao := Registro61Rec[i].Emissao;
        registro61.Valor := Registro61Rec[i].Valor;
        registro61.ValorIcms := Registro61Rec[i].ValorIcms;
        registro61.Outras := Registro61Rec[i].Outras;
        registro61.BaseDeCalculo := Registro61Rec[i].BaseDeCalculo;
        registro61.Isentas := Registro61Rec[i].Isentas;
        registro61.NumOrdemInicial := Registro61Rec[i].NumOrdemInicial;
        registro61.NumOrdemFinal := Registro61Rec[i].NumOrdemFinal;
        registro61.Modelo := Registro61Rec[i].Modelo;
        registro61.SubSerie := Registro61Rec[i].SubSerie;
        registro61.Serie := Registro61Rec[i].Serie;
        registro61.Aliquota := Registro61Rec[i].Aliquota;
        Registros61.Add(registro61);
      end;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end;
  end;
end;

function SIN_Registro61R(const sinHandle: PSINHandle;
  var Registro61RRec: array of TRegistro61RRec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  registro61R: TRegistro61R;
  i: integer;
begin
  try
    for i := 0 to Count - 1 do
    begin
      with sinHandle^.Sintegra do
      begin
        registro61R := TRegistro61R.Create;
        registro61R.BaseDeCalculo := Registro61RRec[i].BaseDeCalculo;
        registro61R.Valor := Registro61RRec[i].Valor;
        registro61R.Qtd := Registro61RRec[i].Qtd;
        registro61R.MesAno := Registro61RRec[i].MesAno;
        registro61R.Codigo := Registro61RRec[i].Codigo;
        registro61R.Aliquota := Registro61RRec[i].Aliquota;
        Registros61R.Add(registro61R);
      end;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end;
  end;
end;

function SIN_Registro70(const sinHandle: PSINHandle;
  var Registro70Rec: array of TRegistro70Rec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  registro70: TRegistro70;
  i: integer;
begin
  try
    for i := 0 to Count - 1 do
    begin
      with sinHandle^.Sintegra do
      begin
        registro70 := TRegistro70.Create;
        registro70.CPFCNPJ := Registro70Rec[i].CPFCNPJ;
        registro70.Inscricao := Registro70Rec[i].Inscricao;
        registro70.DataDocumento := Registro70Rec[i].DataDocumento;
        registro70.UF := Registro70Rec[i].UF;
        registro70.Modelo := Registro70Rec[i].Modelo;
        registro70.Serie := Registro70Rec[i].Serie;
        registro70.SubSerie := Registro70Rec[i].SubSerie;
        registro70.Numero := Registro70Rec[i].Numero;
        registro70.Cfop := Registro70Rec[i].Cfop;
        registro70.ValorContabil := Registro70Rec[i].ValorContabil;
        registro70.BasedeCalculo := Registro70Rec[i].BasedeCalculo;
        registro70.Icms := Registro70Rec[i].Icms;
        registro70.Isentas := Registro70Rec[i].Isentas;
        registro70.Outras := Registro70Rec[i].Outras;
        registro70.CifFobOutros := Registro70Rec[i].CifFobOutros;
        registro70.Situacao := Registro70Rec[i].Situacao;
        Registros70.Add(registro70);
      end;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end;
  end;
end;

function SIN_Registro71(const sinHandle: PSINHandle;
  var Registro71Rec: array of TRegistro71Rec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  registro71: TRegistro71;
  i: integer;
begin
  try
    for i := 0 to Count - 1 do
    begin
      with sinHandle^.Sintegra do
      begin
        registro71 := TRegistro71.Create;
        registro71.CPFCNPJ := Registro71Rec[i].CPFCNPJ;
        registro71.Inscricao := Registro71Rec[i].Inscricao;
        registro71.DataDocumento := Registro71Rec[i].DataDocumento;
        registro71.Modelo := Registro71Rec[i].Modelo;
        registro71.Serie := Registro71Rec[i].Serie;
        registro71.SubSerie := Registro71Rec[i].SubSerie;
        registro71.Numero := Registro71Rec[i].Numero;
        registro71.UF := Registro71Rec[i].UF;
        registro71.UFNF := Registro71Rec[i].UFNF;
        registro71.CPFCNPJNF := Registro71Rec[i].CPFCNPJNF;
        registro71.InscricaoNF := Registro71Rec[i].InscricaoNF;
        registro71.DataNF := Registro71Rec[i].DataNF;
        registro71.ModeloNF := Registro71Rec[i].ModeloNF;
        registro71.SerieNF := Registro71Rec[i].SerieNF;
        registro71.NumeroNF := Registro71Rec[i].NumeroNF;
        registro71.ValorNF := Registro71Rec[i].ValorNF;
        Registros71.Add(registro71);
      end;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end;
  end;
end;

function SIN_Registro74(const sinHandle: PSINHandle;
  var Registro74Rec: array of TRegistro74Rec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  registro74: TRegistro74;
  i: integer;
begin
  try
    for i := 0 to Count - 1 do
    begin
      with sinHandle^.Sintegra do
      begin
        registro74 := TRegistro74.Create;
        registro74.Data := Registro74Rec[i].Data;
        registro74.Codigo := Registro74Rec[i].Codigo;
        registro74.Quantidade := Registro74Rec[i].Quantidade;
        registro74.ValorProduto := Registro74Rec[i].ValorProduto;
        registro74.CodigoPosse := Registro74Rec[i].CodigoPosse;
        registro74.CNPJPossuidor := Registro74Rec[i].CNPJPossuidor;
        registro74.InscricaoPossuidor := Registro74Rec[i].InscricaoPossuidor;
        registro74.UFPossuidor := Registro74Rec[i].UFPossuidor;
        Registros74.Add(registro74);
      end;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end;
  end;
end;

function SIN_Registro75(const sinHandle: PSINHandle;
  var Registro75Rec: array of TRegistro75Rec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  registro75: TRegistro75;
  i: integer;
begin
  try
    for i := 0 to Count - 1 do
    begin
      with sinHandle^.Sintegra do
      begin
        registro75 := TRegistro75.Create;
        registro75.DataInicial := Registro75Rec[i].DataInicial;
        registro75.DataFinal := Registro75Rec[i].DataFinal;
        registro75.Codigo := Registro75Rec[i].Codigo;
        registro75.NCM := Registro75Rec[i].NCM;
        registro75.Descricao := Registro75Rec[i].Descricao;
        registro75.Unidade := Registro75Rec[i].Unidade;
        registro75.AliquotaIpi := Registro75Rec[i].AliquotaIpi;
        registro75.AliquotaICMS := Registro75Rec[i].AliquotaICMS;
        registro75.Reducao := Registro75Rec[i].Reducao;
        registro75.BaseST := Registro75Rec[i].BaseST;
        Registros75.Add(registro75);
      end;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end;
  end;
end;

function SIN_Registro76(const sinHandle: PSINHandle;
  var Registro76Rec: array of TRegistro76Rec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  registro76: TRegistro76;
  i: integer;
begin
  try
    for i := 0 to Count - 1 do
    begin
      with sinHandle^.Sintegra do
      begin
        registro76 := TRegistro76.Create;
        registro76.Isentas := Registro76Rec[i].Isentas;
        registro76.ValorTotal := Registro76Rec[i].ValorTotal;
        registro76.Icms := Registro76Rec[i].Icms;
        registro76.BasedeCalculo := Registro76Rec[i].BasedeCalculo;
        registro76.Outras := Registro76Rec[i].Outras;
        registro76.Modelo := Registro76Rec[i].Modelo;
        registro76.Numero := Registro76Rec[i].Numero;
        registro76.Situacao := Registro76Rec[i].Situacao;
        registro76.Inscricao := Registro76Rec[i].Inscricao;
        registro76.SubSerie := Registro76Rec[i].SubSerie;
        registro76.Uf := Registro76Rec[i].Uf;
        registro76.Serie := Registro76Rec[i].Serie;
        registro76.Cfop := Registro76Rec[i].Cfop;
        registro76.CPFCNPJ := Registro76Rec[i].CPFCNPJ;
        registro76.DataDocumento := Registro76Rec[i].DataDocumento;
        registro76.TipoReceita := TTipoReceita(Registro76Rec[i].TipoReceita);
        registro76.Aliquota := Registro76Rec[i].Aliquota;
        Registros76.Add(registro76);
      end;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end;
  end;
end;

function SIN_Registro77(const sinHandle: PSINHandle;
  var Registro77Rec: array of TRegistro77Rec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  registro77: TRegistro77;
  i: integer;
begin
  try
    for i := 0 to Count - 1 do
    begin
      with sinHandle^.Sintegra do
      begin
        registro77 := TRegistro77.Create;
        registro77.Quantidade := Registro77Rec[i].Quantidade;
        registro77.ValorServico := Registro77Rec[i].ValorServico;
        registro77.ValorDesconto := Registro77Rec[i].ValorDesconto;
        registro77.BasedeCalculo := Registro77Rec[i].BasedeCalculo;
        registro77.Modelo := Registro77Rec[i].Modelo;
        registro77.Numero := Registro77Rec[i].Numero;
        registro77.NumeroTerminal := Registro77Rec[i].NumeroTerminal;
        registro77.NumeroItem := Registro77Rec[i].NumeroItem;
        registro77.Aliquota := Registro77Rec[i].Aliquota;
        registro77.CNPJMF := Registro77Rec[i].CNPJMF;
        registro77.Cfop := Registro77Rec[i].Cfop;
        registro77.Codigo := Registro77Rec[i].Codigo;
        registro77.SubSerie := Registro77Rec[i].SubSerie;
        registro77.CPFCNPJ := Registro77Rec[i].CPFCNPJ;
        registro77.Serie := Registro77Rec[i].Serie;
        registro77.TipoReceita := TTipoReceita(Registro77Rec[i].TipoReceita);
        Registros77.Add(registro77);
      end;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end;
  end;
end;

function SIN_Registro85(const sinHandle: PSINHandle;
  var Registro85Rec: array of TRegistro85Rec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  registro85: TRegistro85;
  i: integer;
begin
  try
    for i := 0 to Count - 1 do
    begin
      with sinHandle^.Sintegra do
      begin
        registro85 := TRegistro85.Create;
        registro85.Declaracao := Registro85Rec[i].Declaracao;
        registro85.DataDeclaracao := Registro85Rec[i].DataDeclaracao;
        registro85.NaturezaExportacao := Registro85Rec[i].NaturezaExportacao;
        registro85.RegistroExportacao := Registro85Rec[i].RegistroExportacao;
        registro85.DataRegistro := Registro85Rec[i].DataRegistro;
        registro85.Conhecimento := Registro85Rec[i].Conhecimento;
        registro85.DataConhecimento := Registro85Rec[i].DataConhecimento;
        registro85.TipoConhecimento := Registro85Rec[i].TipoConhecimento;
        registro85.Pais := Registro85Rec[i].Pais;
        registro85.DataAverbacao := Registro85Rec[i].DataAverbacao;
        registro85.NumeroNotaFiscal := Registro85Rec[i].NumeroNotaFiscal;
        registro85.DataNotaFiscal := Registro85Rec[i].DataNotaFiscal;
        registro85.Modelo := Registro85Rec[i].Modelo;
        registro85.Serie := Registro85Rec[i].Serie;
        Registros85.Add(registro85);
      end;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end;
  end;
end;

function SIN_Registro86(const sinHandle: PSINHandle;
  var Registro86Rec: array of TRegistro86Rec; const Count: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  registro86: TRegistro86;
  i: integer;
begin
  try
    for i := 0 to Count - 1 do
    begin
      with sinHandle^.Sintegra do
      begin
        registro86 := TRegistro86.Create;
        registro86.RegistroExportacao := Registro86Rec[i].RegistroExportacao;
        registro86.DataRegistro := Registro86Rec[i].DataRegistro;
        registro86.CPFCNPJ := Registro86Rec[i].CPFCNPJ;
        registro86.Inscricao := Registro86Rec[i].Inscricao;
        registro86.UF := Registro86Rec[i].UF;
        registro86.NumeroNotaFiscal := Registro86Rec[i].NumeroNotaFiscal;
        registro86.DataDocumento := Registro86Rec[i].DataDocumento;
        registro86.Modelo := Registro86Rec[i].Modelo;
        registro86.Serie := Registro86Rec[i].Serie;
        registro86.Codigo := Registro86Rec[i].Codigo;
        registro86.Quantidade := Registro86Rec[i].Quantidade;
        registro86.ValorUnitario := Registro86Rec[i].ValorUnitario;
        registro86.ValorTotalProduto := Registro86Rec[i].ValorTotalProduto;
        registro86.Relacionamento := Registro86Rec[i].Relacionamento;
        Registros86.Add(registro86);
      end;
    end;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end;
  end;
end;

{%endregion}

{%region Fun????es do Componente}

function SIN_LimparRegistros(const sinHandle: PSINHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  try
    if (sinHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    sinHandle^.Sintegra.LimparRegistros;

  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

function SIN_GeraArquivo(const sinHandle: PSINHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin
  try
    if (sinHandle = nil) then
    begin
      Result := -2;
      Exit;
    end;

    sinHandle^.Sintegra.GeraArquivo;
    Result := 0;
  except
    on Exception: Exception do
    begin
      sinHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;
end;

{%endregion}

end.
