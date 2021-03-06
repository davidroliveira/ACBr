unit ACBrLFDBlocosDll;

{$mode delphi}

interface

uses
  Classes, SysUtils;

{%region Ponteiros de função para uso nos eventos}

type TNoArgumentsCallback = procedure(); cdecl;
type TStringCallback = procedure(const str : PChar); cdecl;

{%endregion Ponteiros de função para uso nos eventos}

{%region Registros Bloco 0}

type Bloco0Registro0000 = record
  COD_VER      : Integer; /// Código da versão do leiaute: 100, 101, 102
  COD_FIN      : Integer; /// Código da finalidade do arquivo: 0 - Remessa do arquivo original / 1 - Remessa do arquivo substituto.
  DT_INI       : Double;           /// Data inicial das informações contidas no arquivo
  DT_FIN       : Double;           /// Data final das informações contidas no arquivo
  NOME         : array[0..100] of char;                 /// Nome empresarial do contribuinte:
  CNPJ         : array[0..14] of char;               /// Número de inscrição do contribuinte:
  UF           : array[0..2] of char;                  /// Sigla da unidade da federação:
  IE           : array[0..14] of char;                  /// Inscrição Estadual do contribuinte:
  COD_MUN      : Integer;            /// Código do município do domicílio fiscal:
  IM           : array[0..14] of char;                  /// Inscrição Municipal do contribuinte:
  SUFRAMA      : array[0..9] of char;             /// Número de inscrição do contribuinte:
  COD_CONTEUDO : Integer;            /// Código do município do domicílio fiscal:
  FANTASIA     : array[0..100] of char;                /// Nome de fantasia associado ao nome empresarial
  NIRE         : Integer;            /// Número de Identificação do Registro de Empresas da Junta Comercial
end;

type Bloco0Registro0001 = record
   IND_MOV    : Integer; /// Indicador de movimento: 0- Bloco com dados informados, 1- Bloco sem dados informados.
   COD_MUN    : Integer;
end;

type Bloco0Registro0005 = record
  NOMERESP  : array[0..60] of char;
  COD_ASS  : Integer;
  CPFRESP  : array[0..11] of char;
  CEP      : array[0..8] of char;     /// Código de Endereçamento Postal:
  ENDERECO : array[0..60] of char;     /// Logradouro e endereço do imóvel:
  NUM      : array[0..10] of char;     /// Número do imóvel:
  COMPL    : array[0..60] of char;     /// Dados complementares do endereço:
  BAIRRO   : array[0..60] of char;     /// Bairro em que o imóvel está situado:
  CEP_CP   : array[0..8] of char;
  CP       : Integer;
  FONE     : array[0..10] of char;     /// Número do telefone:
  FAX      : array[0..10] of char;     /// Número do fax:
  EMAIL    : array[0..150] of char;     /// Endereço do correio eletrônico:
end;

type Bloco0Registro0025 = record
  CODBF_ICMS  : Integer;
  CODBF_ISS   : Integer;
end;

type Bloco0Registro0100 = record
  NOME     : array[0..100] of char;       /// Nome do contabilista/escritório:
  CPF      : array[0..11] of char;        /// Número de inscrição no CPF:
  CRC      : array[0..15] of char;        /// Número de inscrição no Conselho Regional:
  CNPJ     : array[0..14] of char;        /// CNPJ do escritório de contabilidade, se houver:
  CEP      : array[0..8] of char;         /// Código de Endereçamento Postal:
  CEP_CP   : array[0..8] of char;         /// Código de Endereçamento Postal:
  CP      : array[0..8] of char;         /// Código de Endereçamento Postal:
  ENDERECO : array[0..60] of char;        /// Logradouro e endereço do imóvel:
  NUM      : array[0..10] of char;        /// Número do imóvel:
  COMPL    : array[0..60] of char;        /// Dados complementares do endereço:
  BAIRRO   : array[0..60] of char;        /// Bairro em que o imóvel está situado:
  UF       : array[0..1] of char;
  FONE     : array[0..10] of char;        /// Número do telefone:
  FAX      : array[0..10] of char;        /// Número do fax:
  EMAIL    : array[0..150] of char;       /// Endereço do correio eletrônico:
  COD_MUN  : integer;                     /// Código do município, conforme tabela IBGE:
  COD_ASS  : array[0..0] of char;
end;

type Bloco0Registro0150 = record
  COD_PART  : array[0..60] of char;       /// Código de identificação do participante:
  NOME      : array[0..100] of char;      /// Nome pessoal ou empresarial:
  COD_PAIS  : array[0..5] of char;        /// Código do país do participante:
  CNPJ      : array[0..14] of char;       /// CNPJ do participante:
  CPF       : array[0..11] of char;       /// CPF do participante na unidade da federação do destinatário:
  IE_ST     : array[0..14] of char;
  IE        : array[0..14] of char;       /// Inscrição Estadual do participante:
  IM        : array[0..14] of char;
  COD_MUN   : integer;                    /// Código do município:
  SUFRAMA   : array[0..9] of char;        /// Número de inscrição na Suframa:
  ENDERECO  : array[0..60] of char;       /// Logradouro e endereço do imóvel:
  NUM       : array[0..10] of char;       /// Número do imóvel:
  COMPL     : array[0..60] of char;       /// Dados complementares do endereço:
  BAIRRO    : array[0..60] of char;       /// Bairro em que o imóvel está situado:
  UF        : array[0..1] of char;
end;

type Bloco0Registro0175 = record
  CEP : array[0..8] of char;
  ENDERECO : array[0..60] of char;
  NUM : array[0..10] of char;
  COMPL : array[0..60] of char;
  BAIRRO : array[0..60] of char;
  CEP_CP : array[0..8] of char;
  CP : Integer;
  FONE : array[0..10] of char;
  FAX : array[0..10] of char;
end;

type Bloco0Registro0200 = record
  COD_ITEM     : array[0..60] of char;        /// Código do item:
  DESCR_ITEM   : array[0..200] of char;       /// Descrição do item:
  COD_GEN      : array[0..2] of char;         /// Código gênero item, tabela indicada item 4.2.1:
  COD_LST      : array[0..4] of char;         /// Código serviço Anexo I - Lei nº116/03:
end;

type Bloco0Registro0205 = record
  DESCR_ANT_ITEM : array[0..200] of char;    /// Descrição anterior do item:
  DT_INI         : double;                   /// Data inicial de utilização do código:
  DT_FIN         : double;                   /// Data final de utilização do código:
  COD_ANT_ITEM   : array[0..60] of char;     /// Código anterior do item com relação à última informação apresentada.
end;

type Bloco0Registro0210 = record
  UNID_ITEM 	  : array[0..6] of char;
  COD_ITEM_COMP   : array[0..60] of char;
  QTD_COMP	  : double;
  UNID_COMP 	  : array[0..6] of char;
  PERDA_COMP	  : double;
  DT_INI_COMP	  : double;
  DT_FIN_COMP 	  : double;
  IND_ALT 	  : Integer;
end;

type Bloco0Registro0220 = record
  UNID_CONV  : array[0..6] of char;       /// Unidade comercial a ser convertida na unidade de estoque, referida em 0200:
  FAT_CONV   : Double;                    /// Fator de conversão:
end;

type Bloco0Registro0300 = record
  COD_IND_BEM : array[0..60] of char;    /// Código individualizado do bem ou componente adotado no controle patrimonial do estabelecimento informante
  IDENT_MERC  : Integer;                 /// Identificação do tipo de mercadoria: 1 = bem; 2 = componente.
  DESCR_ITEM  : array[0..200] of char;   /// Descrição do bem ou componente (modelo, marca e outras características necessárias a sua individualização)
  COD_PRNC    : array[0..60] of char;    /// Código de cadastro do bem principal nos casos em que o bem ou componente ( campo 02) esteja vinculado a um bem principal.
  COD_CTA     : array[0..60] of char;    /// Código da conta analítica de contabilização do bem ou componente (campo 06 do Registro 0500)
  NR_PARC     : Double;                  /// Número total de parcelas a serem apropriadas, segundo a legislação de cada unidade federada
end;

type Bloco0Registro0305 = record
  COD_CCUS   : array[0..60] of char;     /// Código do centro de custo onde o bem está sendo ou será utilizado (campo 03 do Registro 0600)
  FUNC       : array[0..200] of char;    /// Descrição sucinta da função do bem na atividade do estabelecimento
  VIDA_UTIL  : Integer;                  /// Vida útil estimada do bem, em número de meses
end;

type Bloco0Registro0400 = record
  COD_NAT    : array[0..60] of char;     /// Código da natureza:
  DESCR_NAT  : array[0..200] of char;    /// Descrição da natureza:
end;

type Bloco0Registro0450 = record
  COD_INF   : array[0..6] of char;      /// Código da informação complementar do documento fiscal:
  TXT       : array[0..1023] of char;    /// Texto livre (1Kb):
end;

type Bloco0Registro0460 = record
  COD_OBS   : array[0..6] of char;      /// Código da Observação do lançamento fiscal:
  TXT       : array[0..1023] of char;   /// Descrição da observação vinculada ao lançamento fiscal:
end;

type Bloco0Registro0500 = record
    DT_ALT     : double;                // Data da inclusão/alteração
    COD_NAT_CC : array[0..2] of char;   // Código da natureza da conta/grupo de contas
    IND_CTA    : array[0..1] of char;   // Indicador do tipo de conta:  S - Sintética ou A - Analítica
    NIVEL      : array[0..5] of char;   // Nível da conta analítica/grupo de contas
    COD_CTA    : array[0..60] of char;  // Código da conta analítica/grupo de conta
    NOME_CTA   : array[0..60] of char;  // Nome da conta analítica/grupo de contas
end;

type Bloco0Registro0600 = record
  DT_ALT     : double;        // Data da inclusão/alteração
  COD_CCUS   : array[0..60] of char;       // Código do centro de custos.
  CCUS       : array[0..60] of char;       // Nome do centro de custos.
end;

{%endregion}

{%region Registros Bloco A}

type BlocoARegistroA001 = record
	IND_MOV : Integer;
	COD_MUN : Integer;
end;

type BlocoARegistroA350 = record
	CPF_CONS : array[0..11] of char;
	CNPJ_CONS : array[0..14] of char;
	COD_MOD : array[0..2] of char;
	COD_SIT : Integer;
	ECF_CX : Integer;
	ECF_FAB : array[0..20] of char;
	CRO : Integer;
	CRZ : Integer;
	NUM_DOC : array[0..60] of char;
	DT_DOC: Double;
	COP : array[0..3] of char;
	VL_DOC: Double;
	VL_CANC_ISS: Double;
	VL_CANC_ICMS: Double;
	VL_DESC_ISS: Double;
	VL_DESC_ICMS : Double;
	VL_ACMO_ISS : Double;
	VL_ACMO_ICMS : Double;
	VL_BC_ISS : Double;
	VL_ISS : Double;
	VL_ISN_ISS : Double;
	VL_NT_ISS : Double;
	VL_RET_ISS : Double;
end;

type BlocoARegistroA360 = record
	NUM_ITEM : Integer;
	COD_ITEM : array[0..60] of char;
	UNID : array[0..10] of char;
	VL_UNIT : Double;
	QTD : Double;
	QTDCANC : Integer;
	VL_DESC_I : Double;
	VL_ACMO_I : Double;
	VL_CANC_I : Double;
	VL_ITEM : Double;
	CTISS : array[0..2] of char;
	VL_BC_ISS_I : Double;
	ALIQ_ISS : Double;
	VL_ISS_I : Double;
	VL_ISN_ISS_I : Double;
	VL_NT_ISS_I : Double;
	VL_RT_ISS_I : Double;
end;

{%endregion}

{%region Registros Bloco C}

type BlocoCRegistroC001 = record
      IND_MOV : Integer;
      COD_MUN : Integer;
end;

type BlocoCRegistroC020 = record
	IND_OPER : Integer;
	IND_EMIT : Integer;
	COD_PART : array[0..60] of char;
	COD_MOD : array[0..2] of char;
	COD_SIT : Integer;
	SER : array[0..2] of char;
	NUM_DOC : array[0..60] of char;
	CHV_NFE : array[0..44] of char;
	DT_EMIS : Double;
	DT_DOC : Double;
	COD_NAT : array[0..11] of char;
	IND_PGTO : Integer;
	VL_DOC : Double;
	VL_DESC : Double;
	VL_ACMO : Double;
	VL_MERC : Double;
	IND_FRT : Integer;
	VL_FRT : Double;
	VL_SEG : Double;
	VL_OUT_DA : Double;
	VL_BC_ICMS : Double;
	VL_ICMS : Double;
	VL_BC_ST : Double;
	VL_ICMS_ST : Double;
	VL_AT : Double;
	VL_IPI : Double;
	COD_INF_OBS : array[0..11] of char;
end;

type BlocoCRegistroC550 = record
	CPF_CONS : array[0..11] of char;
	CNPJ_CONS : array[0..14] of char;
	COD_MOD : array[0..2] of char;
	COD_SIT : Integer;
	SER : array[0..20] of char;
	SUB : array[0..20] of char;
	NUM_DOC : array[0..60] of char;
	DT_DOC : Double;
	COP : array[0..60] of char;
	VL_DOC : Double;
	VL_DESC : Double;
	VL_ACMO : Double;
	VL_MERC : Double;
	VL_BC_ICMS : Double;
	VL_ICMS : Double;
	COD_INF_OBS : array[0..60] of char;
end;

type BlocoCRegistroC555 = record
	NUM_ITEM : Integer;
	COD_ITEM : array[0..60] of char;
	UNID : array[0..14] of char;
	VL_UNIT : Double;
	QTD : Double;
	VL_DESC_I : Double;
	VL_ACMO_I : Double;
	VL_ITEM : Double;
	CST : array[0..3] of char;
	CFOP : array[0..4] of char;
	VL_BC_ICMS_I : Double;
	ALIQ_ICMS : Double;
	VL_ICMS_I : Double;
end;

type BlocoCRegistroC600 = record
	CPF_CONS : array[0..11] of char;
	CNPJ_CONS : array[0..14] of char;
	COD_MOD : array[0..2] of char;
	COD_SIT : Integer;
	ECF_CX : Integer;
	ECF_FAB : array[0..20] of char;
	CRO : Integer;
	CRZ : Integer;
	NUM_DOC : array[0..60] of char;
	DT_DOC : Double;
	COP : array[0..20] of char;
	VL_DOC : Double;
	VL_CANC_ICMS : Double;
	VL_DESC_ICMS : Double;
	VL_ACMO_ICMS : Double;
	VL_CANC_ISS : Double;
	VL_DESC_ISS : Double;
	VL_ACMO_ISS : Double;
	VL_BC_ICMS : Double;
	VL_ICMS : Double;
	 VL_ISN : Double;
	VL_NT : Double;
	VL_ST : Double;
	VL_ISS : Double;
	VL_ICMS_ST : Double;
end;

type BlocoCRegistroC605 = record
  NUM_ITEM : Integer;
  COD_ITEM : array[0..60] of char;
  UNID : array[0..14] of char;
  VL_UNIT : Double;
  QTD : Double;
  QTD_CANC_I : Double;
  VL_ITEM : Double;
  VL_DESC_I : Double;
  VL_CANC_I : Double;
  VL_ACMO_I : Double;
  VL_ISS : Double;
  CST : array[0..3] of char;
  CFOP : array[0..4] of char;
  VL_BC_ICMS_I : Double;
  ALIQ_ICMS : Double;
  VL_ICMS_I : Double;
  VL_ISN_I : Double;
  VL_NT_I : Double;
  VL_ST_I : Double;
  VL_ICMS_ST_I : Double;
end;

{%endregion}

{%region Registros Bloco 9}

type Bloco9Registro9001 = record
   IND_MOV    : Integer;
end;

type Bloco9Registro9900 = record
REG_BLC     : array[0..4] of char;
QTD_REG_BLC : Integer;
end;

{%endregion Registros Bloco 9}

implementation

end.

