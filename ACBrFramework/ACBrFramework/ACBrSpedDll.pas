unit ACBrSpedDll;

{$mode delphi}

interface

uses
  Classes, SysUtils;

{%region Registros Bloco 0}

type
  Bloco0Registro0000 = record
    COD_VER: integer; /// Código da versão do leiaute: 100, 101, 102
    COD_FIN: integer;
    /// Código da finalidade do arquivo: 0 - Remessa do arquivo original / 1 - Remessa do arquivo substituto.
    DT_INI: double;           /// Data inicial das informações contidas no arquivo
    DT_FIN: double;           /// Data final das informações contidas no arquivo
    NOME: array[0..100] of char;
    /// Nome empresarial do contribuinte:
    CNPJ: array[0..14] of char;
    /// Número de inscrição do contribuinte:
    CPF: array[0..11] of char;
    /// Número de inscrição do contribuinte:
    UF: array[0..2] of char;                  /// Sigla da unidade da federação:
    IE: array[0..14] of char;
    /// Inscrição Estadual do contribuinte:
    COD_MUN: integer;            /// Código do município do domicílio fiscal:
    IM: array[0..14] of char;
    /// Inscrição Municipal do contribuinte:
    SUFRAMA: array[0..9] of char;             /// Número de inscrição do contribuinte:
    IND_PERFIL: integer;
    /// Perfil de apresentação do arquivo fiscal: A - Perfil A / B - Perfil B / C - Perfil C
    IND_ATIV: integer;
  end;

type
  Bloco0Registro0001 = record
    IND_MOV: integer;
    /// Indicador de movimento: 0- Bloco com dados informados, 1- Bloco sem dados informados.
  end;

type
  Bloco0Registro0005 = record
    FANTASIA: array[0..60] of char;     /// Nome de fantasia associado:
    CEP: array[0..8] of char;     /// Código de Endereçamento Postal:
    ENDERECO: array[0..60] of char;     /// Logradouro e endereço do imóvel:
    NUM: array[0..10] of char;     /// Número do imóvel:
    COMPL: array[0..60] of char;     /// Dados complementares do endereço:
    BAIRRO: array[0..60] of char;     /// Bairro em que o imóvel está situado:
    FONE: array[0..10] of char;     /// Número do telefone:
    FAX: array[0..10] of char;     /// Número do fax:
    EMAIL: array[0..150] of char;     /// Endereço do correio eletrônico:
  end;

type
  Bloco0Registro0015 = record
    UF_ST: array[0..2] of char;   /// Sigla da unidade da federação:
    IE_ST: array[0..14] of char;   /// Inscrição Estadual:
  end;

type
  Bloco0Registro0100 = record
    NOME: array[0..100] of char;       /// Nome do contabilista/escritório:
    CPF: array[0..11] of char;        /// Número de inscrição no CPF:
    CRC: array[0..15] of char;        /// Número de inscrição no Conselho Regional:
    CNPJ: array[0..14] of char;
    /// CNPJ do escritório de contabilidade, se houver:
    CEP: array[0..8] of char;         /// Código de Endereçamento Postal:
    ENDERECO: array[0..60] of char;        /// Logradouro e endereço do imóvel:
    NUM: array[0..10] of char;        /// Número do imóvel:
    COMPL: array[0..60] of char;        /// Dados complementares do endereço:
    BAIRRO: array[0..60] of char;        /// Bairro em que o imóvel está situado:
    FONE: array[0..10] of char;        /// Número do telefone:
    FAX: array[0..10] of char;        /// Número do fax:
    EMAIL: array[0..150] of char;       /// Endereço do correio eletrônico:
    COD_MUN: integer;                     /// Código do município, conforme tabela IBGE:
  end;

type
  Bloco0Registro0150 = record
    COD_PART: array[0..60] of char;       /// Código de identificação do participante:
    NOME: array[0..100] of char;      /// Nome pessoal ou empresarial:
    COD_PAIS: array[0..5] of char;        /// Código do país do participante:
    CNPJ: array[0..14] of char;       /// CNPJ do participante:
    CPF: array[0..11] of char;
    /// CPF do participante na unidade da federação do destinatário:
    IE: array[0..14] of char;       /// Inscrição Estadual do participante:
    COD_MUN: integer;                    /// Código do município:
    SUFRAMA: array[0..9] of char;        /// Número de inscrição na Suframa:
    ENDERECO: array[0..60] of char;       /// Logradouro e endereço do imóvel:
    NUM: array[0..10] of char;       /// Número do imóvel:
    COMPL: array[0..60] of char;       /// Dados complementares do endereço:
    BAIRRO: array[0..60] of char;       /// Bairro em que o imóvel está situado:
  end;

type
  Bloco0Registro0175 = record
    DT_ALT: double;                      /// Data de alteração do cadastro:
    NR_CAMPO: array[0..2] of char;
    /// Número do campo alterado (Somente campos 03 a 13):
    CONT_ANT: array[0..100] of char;       /// Conteúdo anterior do campo:
  end;

type
  Bloco0Registro0190 = record
    UNID: array[0..6] of char;        /// Código da unidade de medida:
    DESCR: array[0..100] of char;
  end;

type
  Bloco0Registro0200 = record
    COD_ITEM: array[0..60] of char;        /// Código do item:
    DESCR_ITEM: array[0..200] of char;       /// Descrição do item:
    COD_BARRA: array[0..14] of char;        /// Código de barra do produto, se houver:
    COD_ANT_ITEM: array[0..60] of char;
    /// Código anterior do item (ultima apresentado):
    UNID_INV: array[0..6] of char;         /// Unidade de medida do estoque:
    TIPO_ITEM: integer;
    /// Tipo do item - Atividades Industriais, Comerciais e Serviços: 00 - Mercadoria para Revenda, 01 - Matéria-Prima,  02 - Embalagem, 03 - Produto em Processo, 04 - Produto Acabado, 05 - Subproduto, 06 - Produto Intermediário, 07 - Material de Uso e Consumo, 08 - Ativo Imobilizado, 09 - Serviços, 10 - Outros insumos, 99 - Outras
    COD_NCM: array[0..8] of char;
    /// Código da Nomenclatura Comum do Mercosul:
    EX_IPI: array[0..3] of char;         /// Código EX, conforme a TIPI:
    COD_GEN: array[0..2] of char;
    /// Código gênero item, tabela indicada item 4.2.1:
    COD_LST: array[0..4] of char;         /// Código serviço Anexo I - Lei nº116/03:
    ALIQ_ICMS: double;
    /// Alíquota ICMS aplicável (operações internas):
  end;

type
  Bloco0Registro0205 = record
    DESCR_ANT_ITEM: array[0..200] of char;    /// Descrição anterior do item:
    DT_INI: double;                   /// Data inicial de utilização do código:
    DT_FIN: double;                   /// Data final de utilização do código:
    COD_ANT_ITEM: array[0..60] of char;
    /// Código anterior do item com relação à última informação apresentada.
  end;

type
  Bloco0Registro0206 = record
    COD_COMB: array[0..60] of char;
    /// Código do combustível, conforme tabela publicada pela ANP:
  end;

type
  Bloco0Registro0220 = record
    UNID_CONV: array[0..6] of char;
    /// Unidade comercial a ser convertida na unidade de estoque, referida em 0200:
    FAT_CONV: double;                    /// Fator de conversão:
  end;

type
  Bloco0Registro0300 = record
    COD_IND_BEM: array[0..60] of char;
    /// Código individualizado do bem ou componente adotado no controle patrimonial do estabelecimento informante
    IDENT_MERC: integer;
    /// Identificação do tipo de mercadoria: 1 = bem; 2 = componente.
    DESCR_ITEM: array[0..200] of char;
    /// Descrição do bem ou componente (modelo, marca e outras características necessárias a sua individualização)
    COD_PRNC: array[0..60] of char;
    /// Código de cadastro do bem principal nos casos em que o bem ou componente ( campo 02) esteja vinculado a um bem principal.
    COD_CTA: array[0..60] of char;
    /// Código da conta analítica de contabilização do bem ou componente (campo 06 do Registro 0500)
    NR_PARC: double;
    /// Número total de parcelas a serem apropriadas, segundo a legislação de cada unidade federada
  end;

type
  Bloco0Registro0305 = record
    COD_CCUS: array[0..60] of char;
    /// Código do centro de custo onde o bem está sendo ou será utilizado (campo 03 do Registro 0600)
    FUNC: array[0..200] of char;
    /// Descrição sucinta da função do bem na atividade do estabelecimento
    VIDA_UTIL: integer;                  /// Vida útil estimada do bem, em número de meses
  end;

type
  Bloco0Registro0400 = record
    COD_NAT: array[0..60] of char;     /// Código da natureza:
    DESCR_NAT: array[0..200] of char;    /// Descrição da natureza:
  end;

type
  Bloco0Registro0450 = record
    COD_INF: array[0..6] of char;
    /// Código da informação complementar do documento fiscal:
    TXT: array[0..1023] of char;    /// Texto livre (1Kb):
  end;

type
  Bloco0Registro0460 = record
    COD_OBS: array[0..6] of char;      /// Código da Observação do lançamento fiscal:
    TXT: array[0..1023] of char;
    /// Descrição da observação vinculada ao lançamento fiscal:
  end;

type
  Bloco0Registro0500 = record
    DT_ALT: double;                // Data da inclusão/alteração
    COD_NAT_CC: array[0..2] of char;   // Código da natureza da conta/grupo de contas
    IND_CTA: array[0..1] of char;
    // Indicador do tipo de conta:  S - Sintética ou A - Analítica
    NIVEL: array[0..5] of char;   // Nível da conta analítica/grupo de contas
    COD_CTA: array[0..60] of char;  // Código da conta analítica/grupo de conta
    NOME_CTA: array[0..60] of char;  // Nome da conta analítica/grupo de contas
  end;

type
  Bloco0Registro0600 = record
    DT_ALT: double;        // Data da inclusão/alteração
    COD_CCUS: array[0..60] of char;       // Código do centro de custos.
    CCUS: array[0..60] of char;       // Nome do centro de custos.
  end;

{%endregion}

{%region Registros Bloco 1}

type
  Bloco1Registro1001 = record
    IND_MOV: integer;
    /// Indicador de movimento: 0- Bloco com dados informados, 1- Bloco sem dados informados.
  end;

type
  Bloco1Registro1010 = record
    IND_EXP: array[0..1] of char;
    // Reg. 1100 - Ocorreu averbação (conclusão) de exportação no período:
    IND_CCRF: array[0..1] of char;
    // Reg. 1200 – Existem informações acerca de créditos de ICMS a serem controlados, definidos pela Sefaz:
    IND_COMB: array[0..1] of char; // Reg. 1300 – É comercio varejista de combustíveis:
    IND_USINA: array[0..1] of char;
    // Reg. 1390 – Usinas de açúcar e/álcool – O estabelecimento é produtor de açúcar e/ou álcool carburante:
    IND_VA: array[0..1] of char;
    // Reg. 1400 – Existem informações a serem prestadas neste registro e o registro é obrigatório em sua Unidade da Federação:
    IND_EE: array[0..1] of char;
    // Reg. 1500 - A empresa é distribuidora de energia e ocorreu fornecimento de energia elétrica para consumidores de outra UF:
    IND_CART: array[0..1] of char;
    // Reg. 1600 - Realizou vendas com Cartão de Crédito ou de débito:
    IND_FORM: array[0..1] of char;
    // Reg. 1700 - É obrigatório em sua unidade da federação o controle de utilização de documentos  fiscais em papel:
    IND_AER: array[0..1] of char;
    // Reg. 1800 – A empresa prestou serviços de transporte aéreo de cargas e de passageiros:
  end;

type
  Bloco1Registro1100 = record
    IND_DOC: integer;
    /// Informe o tipo de documento: 0 - Declaração de Exportação, 1 - Declaração Simplificada de Exportação.
    NRO_DE: array[0..11] of char;   /// Número da declaração
    DT_DE: double;                 /// Data da declaração (DDMMAAAA)
    NAT_EXP: integer;
    /// Preencher com: 0 - Exportação Direta, 1 - Exportação Indireta
    NRO_RE: array[0..12] of char;   /// Nº do registro de Exportação
    DT_RE: double;                 /// Data do Registro de Exportação (DDMMAAAA)
    CHC_EMB: array[0..18] of char;   /// Nº do conhecimento de embarque
    DT_CHC: double;                 /// Data do conhecimento de embarque (DDMMAAAA)
    DT_AVB: double;
    /// Data da averbação da Declaração de exportação (ddmmaaaa)
    TP_CHC: integer;
    /// Informação do tipo de conhecimento de transporte : 01 - AWB; 02 - MAWB; 03 - HAWB;04 - COMAT; 06 - R. EXPRESSAS; 07 - ETIQ. REXPRESSAS; 08 - HR. EXPRESSAS; 09 - AV7; 10 - BL; 11 - MBL; 12 - HBL; 13 - CRT; 14 - DSIC; 16 - COMAT BL; 17 - RWB; 18 - HRWB; 19 - TIF/DTA; 20 - CP2; 91 - NÂO IATA; 92 - MNAO IATA; 93 - HNAO IATA; 99 - OUTROS.
    PAIS: array[0..3] of char;
    /// Código do país de destino da mercadoria (Preencher conforme tabela do SISCOMEX)
  end;

type
  Bloco1Registro1105 = record
    COD_MOD: array[0..2] of char;
    /// Código do modelo da NF, conforme tabela 4.1.1
    SERIE: array[0..3] of char;        /// Série da Nota Fiscal
    NUM_DOC: array[0..9] of char;
    /// Número de Nota Fiscal de Exportação emitida pelo Exportador
    CHV_NFE: array[0..44] of char;       /// Chave da Nota Fiscal Eletrônica
    DT_DOC: double;                     /// Data da emissão da NF de exportação
    COD_ITEM: array[0..60] of char;       /// Código do item (campo 02 do Registro 0200)
  end;

type
  Bloco1Registro1110 = record
    COD_PART: array[0..60] of char;
    COD_MOD: array[0..2] of char;
    SER: array[0..4] of char;
    NUM_DOC: array[0..9] of char;
    DT_DOC: double;
    CHV_NFE: array[0..44] of char;
    NR_MEMO: array[0..60] of char;
    QTD: double;
    UNID: array[0..6] of char;
  end;

type
  Bloco1Registro1200 = record
    COD_AJ_APUR: array[0..8] of char;
    SLD_CRED: double;
    CRED_APR: double;
    CRED_RECEB: double;
    CRED_UTIL: double;
    SLD_CRED_FIM: double;
  end;

type
  Bloco1Registro1210 = record
    TIPO_UTIL: array[0..4] of char;
    NR_DOC: array[0..60] of char;
    VL_CRED_UTIL: double;
  end;

type
  Bloco1Registro1300 = record
    COD_ITEM: array[0..60] of char;
    DT_FECH: double;
    ESTQ_ABERT: double;
    VOL_ENTR: double;
    VOL_DISP: double;
    VOL_SAIDAS: double;
    ESTQ_ESCR: double;
    VAL_AJ_PERDA: double;
    VAL_AJ_GANHO: double;
    FECH_FISICO: double;
  end;


type
  Bloco1Registro1310 = record
    NUM_TANQUE: array[0..3] of char;
    ESTQ_ABERT: double;
    VOL_ENTR: double;
    VOL_DISP: double;
    VOL_SAIDAS: double;
    ESTQ_ESCR: double;
    VAL_AJ_PERDA: double;
    VAL_AJ_GANHO: double;
    FECH_FISICO: double;
  end;

type
  Bloco1Registro1320 = record
    NUM_BICO: array[0..60] of char;
    NR_INTERV: array[0..60] of char;
    MOT_INTERV: array[0..50] of char;
    NOM_INTERV: array[0..30] of char;
    CNPJ_INTERV: array[0..14] of char;
    CPF_INTERV: array[0..11] of char;
    VAL_FECHA: double;
    VAL_ABERT: double;
    VOL_AFERI: double;
    VOL_VENDAS: double;
  end;

type
  Bloco1Registro1350 = record
    SERIE: array[0..4] of char;
    FABRICANTE: array[0..60] of char;
    MODELO: array[0..60] of char;
    TIPO_MEDICAO: integer;
  end;

type
  Bloco1Registro1360 = record
    NUM_LACRE: array[0..20] of char;
    DT_APLICACAO: double;
  end;

type
  Bloco1Registro1370 = record
    NUM_BICO: array[0..3] of char;
    COD_ITEM: array[0..60] of char;
    NUM_TANQUE: array[0..3] of char;
  end;

type
  Bloco1Registro1390 = record
    COD_PROD: array[0..2] of char;
  end;

type
  Bloco1Registro1400 = record
    COD_ITEM: array[0..60] of char;
    MUN: array[0..7] of char;
    VALOR: double;
  end;

type
  Bloco1Registro1500 = record
    IND_OPER: array[0..1] of char;
    IND_EMIT: array[0..1] of char;
    COD_PART: array[0..60] of char;
    COD_MOD: array[0..60] of char;
    COD_SIT: integer;
    SER: array[0..4] of char;
    SUB: array[0..3] of char;
    COD_CONS: integer;
    NUM_DOC: array[0..9] of char;
    DT_DOC: double;
    DT_E_S: double;
    VL_DOC: double;
    VL_DESC: double;
    VL_FORN: double;
    VL_SERV_NT: double;
    VL_TERC: double;
    VL_DA: double;
    VL_BC_ICMS: double;
    VL_ICMS: double;
    VL_BC_ICMS_ST: double;
    VL_ICMS_ST: double;
    COD_INF: array[0..6] of char;
    VL_PIS: double;
    VL_COFINS: double;
    TP_LIGACAO: integer;
    COD_GRUPO_TENSAO: integer;
  end;

type
  Bloco1Registro1510 = record
    NUM_ITEM: array[0..3] of char;
    COD_ITEM: array[0..60] of char;
    COD_CLASS: array[0..4] of char;
    QTD: double;
    UNID: array[0..6] of char;
    VL_ITEM: double;
    VL_DESC: double;
    CST_ICMS: array[0..3] of char;
    CFOP: array[0..4] of char;
    VL_BC_ICMS: double;
    ALIQ_ICMS: double;
    VL_ICMS: double;
    VL_BC_ICMS_ST: double;
    ALIQ_ST: double;
    VL_ICMS_ST: double;
    IND_REC: integer;
    COD_PART: array[0..60] of char;
    VL_PIS: double;
    VL_COFINS: double;
    COD_CTA: array[0..60] of char;
  end;

type
  Bloco1Registro1600 = record
    COD_PART: array[0..60] of char;
    TOT_CREDITO: double;
    TOT_DEBITO: double;
  end;

type
  Bloco1Registro1700 = record
    COD_DISP: integer;
    COD_MOD: array[0..2] of char;
    SER: array[0..4] of char;
    SUB: array[0..3] of char;
    NUM_DOC_INI: array[0..12] of char;
    NUM_DOC_FIN: array[0..12] of char;
    NUM_AUT: array[0..60] of char;
  end;

type
  Bloco1Registro1710 = record
    NUM_DOC_INI: array[0..12] of char;
    NUM_DOC_FIN: array[0..12] of char;
  end;

type
  Bloco1Registro1800 = record
    VL_CARGA: double;
    VL_PASS: double;
    VL_FAT: double;
    IND_RAT: double;
    VL_ICMS_ANT: double;
    VL_BC_ICMS: double;
    VL_ICMS_APUR: double;
    VL_BC_ICMS_APUR: double;
    VL_DIF: double;
  end;

{%endregion Registros Bloco 1}

{%region Registros Bloco 9}

type
  Bloco9Registro9001 = record
    IND_MOV: integer;
  end;

type
  Bloco9Registro9900 = record
    REG_BLC: array[0..4] of char;
    QTD_REG_BLC: integer;
  end;

{%endregion Registros Bloco 9}

{%region Registros Bloco C}

type
  BlocoCRegistroC001 = record
    IND_MOV: integer;
  end;

type
  BlocoCRegistroC100 = record
    IND_OPER: integer;
    IND_EMIT: integer;
    COD_PART: array[0..60] of char;
    COD_MOD: array[0..2] of char;
    COD_SIT: integer;
    SER: array[0..3] of char;
    NUM_DOC: array[0..9] of char;
    CHV_NFE: array[0..44] of char;
    DT_DOC: double;
    DT_E_S: double;
    VL_DOC: double;
    IND_PGTO: integer;
    VL_DESC: double;
    VL_ABAT_NT: double;
    VL_MERC: double;
    IND_FRT: integer;
    VL_FRT: double;
    VL_SEG: double;
    VL_OUT_DA: double;
    VL_BC_ICMS: double;
    VL_ICMS: double;
    VL_BC_ICMS_ST: double;
    VL_ICMS_ST: double;
    VL_IPI: double;
    VL_PIS: double;
    VL_COFINS: double;
    VL_PIS_ST: double;
    VL_COFINS_ST: double;
  end;

type
  BlocoCRegistroC110 = record
    COD_INF: array[0..6] of char;
    TXT_COMPL: array[0..1023] of char;
  end;

type
  BlocoCRegistroC105 = record
    OPER: integer;
    UF: array[0..2] of char;
  end;

type
  BlocoCRegistroC111 = record
    NUM_PROC: array[0..15] of char;
    IND_PROC: integer;
  end;

type
  BlocoCRegistroC112 = record
    COD_DA: integer;
    UF: array[0..2] of char;
    NUM_DA: array[0..60] of char;
    COD_AUT: array[0..60] of char;
    VL_DA: double;
    DT_VCTO: double;
    DT_PGTO: double;
  end;

type
  BlocoCRegistroC113 = record
    IND_OPER: integer;
    IND_EMIT: integer;
    COD_PART: array[0..60] of char;
    COD_MOD: array[0..2] of char;
    SER: array[0..4] of char;
    SUB: array[0..3] of char;
    NUM_DOC: array[0..9] of char;
    DT_DOC: double;
  end;

type
  BlocoCRegistroC114 = record
    COD_MOD: array[0..2] of char;
    ECF_FAB: array[0..20] of char;
    ECF_CX: array[0..3] of char;
    NUM_DOC: array[0..6] of char;
    DT_DOC: double;
  end;

type
  BlocoCRegistroC115 = record
    IND_CARGA: integer;
    CNPJ_COL: array[0..14] of char;
    IE_COL: array[0..14] of char;
    CPF_COL: array[0..11] of char;
    COD_MUN_COL: array[0..7] of char;
    CNPJ_ENTG: array[0..14] of char;
    IE_ENTG: array[0..14] of char;
    CPF_ENTG: array[0..11] of char;
    COD_MUN_ENTG: array[0..7] of char;
  end;

type
  BlocoCRegistroC116 = record
    COD_MOD: array[0..2] of char;
    NR_SAT: array[0..9] of char;
    CHV_CFE: array[0..44] of char;
    NUM_CFE: array[0..6] of char;
    DT_DOC: double;
  end;

type
  BlocoCRegistroC120 = record
    COD_DOC_IMP: integer;
    NUM_DOC__IMP: array[0..10] of char;
    PIS_IMP: double;
    COFINS_IMP: double;
    NUM_ACDRAW: array[0..20] of char;
  end;

type
  BlocoCRegistroC130 = record
    VL_SERV_NT: double;
    VL_BC_ISSQN: double;
    VL_ISSQN: double;
    VL_BC_IRRF: double;
    VL_IRRF: double;
    VL_BC_PREV: double;
    VL_PREV: double;
  end;

type
  BlocoCRegistroC140 = record
    IND_EMIT: integer;
    IND_TIT: integer;
    DESC_TIT: array[0..254] of char;
    NUM_TIT: array[0..60] of char;
    QTD_PARC: integer;
    VL_TIT: double;
  end;

type
  BlocoCRegistroC141 = record
    NUM_PARC: array[0..2] of char;
    DT_VCTO: double;
    VL_PARC: double;
  end;

type
  BlocoCRegistroC160 = record
    COD_PART: array[0..60] of char;
    VEIC_ID: array[0..7] of char;
    QTD_VOL: integer;
    PESO_BRT: double;
    PESO_LIQ: double;
    UF_ID: array[0..2] of char;
  end;

type
  BlocoCRegistroC165 = record
    COD_PART: array[0..60] of char;
    VEIC_ID: array[0..7] of char;
    COD_AUT: array[0..60] of char;
    NR_PASSE: array[0..60] of char;
    HORA: array[0..6] of char;
    TEMPER: array[0..60] of char;
    QTD_VOL: integer;
    PESO_BRT: double;
    PESO_LIQ: double;
    NOM_MOT: array[0..60] of char;
    CPF: array[0..11] of char;
    UF_ID: array[0..2] of char;
  end;

type
  BlocoCRegistroC170 = record
    NUM_ITEM: array[0..3] of char;
    COD_ITEM: array[0..60] of char;
    DESCR_COMPL: array[0..254] of char;
    QTD: double;
    UNID: array[0..6] of char;
    VL_ITEM: double;
    VL_DESC: double;
    IND_MOV: integer;
    CST_ICMS: array[0..3] of char;
    CFOP: array[0..4] of char;
    COD_NAT: array[0..10] of char;
    VL_BC_ICMS: double;
    ALIQ_ICMS: double;
    VL_ICMS: double;
    VL_BC_ICMS_ST: double;
    ALIQ_ST: double;
    VL_ICMS_ST: double;
    IND_APUR: integer;
    CST_IPI: array[0..2] of char;
    COD_ENQ: array[0..3] of char;
    VL_BC_IPI: double;
    ALIQ_IPI: double;
    VL_IPI: double;
    CST_PIS: array[0..2] of char;
    VL_BC_PIS: double;
    ALIQ_PIS_PERC: double;
    QUANT_BC_PIS: double;
    ALIQ_PIS_R: double;
    VL_PIS: double;
    CST_COFINS: array[0..2] of char;
    VL_BC_COFINS: double;
    ALIQ_COFINS_PERC: double;
    QUANT_BC_COFINS: double;
    ALIQ_COFINS_R: double;
    VL_COFINS: double;
    COD_CTA: array[0..60] of char;
  end;

type
  BlocoCRegistroC171 = record
    NUM_TANQUE: array[0..3] of char;
    QTDE: double;
  end;

type
  BlocoCRegistroC172 = record
    VL_BC_ISSQN: double;
    ALIQ_ISSQN: double;
    VL_ISSQN: double;
  end;

type
  BlocoCRegistroC173 = record
    LOTE_MED: array[0..60] of char;
    QTD_ITEM: double;
    DT_FAB: double;
    DT_VAL: double;
    IND_MED: integer;
    TP_PROD: integer;
    VL_TAB_MAX: double;
  end;

type
  BlocoCRegistroC174 = record
    IND_ARM: integer;
    NUM_ARM: array[0..60] of char;
    DESCR_COMPL: array[0..254] of char;
  end;

type
  BlocoCRegistroC175 = record
    IND_VEIC_OPER: integer;
    CNPJ: array[0..14] of char;
    UF: array[0..2] of char;
    CHASSI_VEIC: array[0..17] of char;
  end;

type
  BlocoCRegistroC176 = record
    COD_MOD_ULT_E: array[0..2] of char;
    NUM_DOC_ULT_E: array[0..9] of char;
    SER_ULT_E: array[0..3] of char;
    DT_ULT_E: double;
    COD_PART_ULT_E: array[0..60] of char;
    QUANT_ULT_E: double;
    VL_UNIT_ULT_E: double;
    VL_UNIT_BC_ST: double;
  end;

type
  BlocoCRegistroC177 = record
    COD_SELO_IPI: array[0..6] of char;
    QT_SELO_IPI: double;
  end;

type
  BlocoCRegistroC178 = record
    CL_ENQ: array[0..5] of char;
    VL_UNID: double;
    QUANT_PAD: double;
  end;

type
  BlocoCRegistroC179 = record
    BC_ST_ORIG_DEST: double;
    ICMS_ST_REP: double;
    ICMS_ST_COMPL: double;
    BC_RET: double;
    ICMS_RET: double;
  end;

type
  BlocoCRegistroC190 = record
    CST_ICMS: array[0..3] of char;
    CFOP: array[0..4] of char;
    ALIQ_ICMS: double;
    VL_OPR: double;
    VL_BC_ICMS: double;
    VL_ICMS: double;
    VL_BC_ICMS_ST: double;
    VL_ICMS_ST: double;
    VL_RED_BC: double;
    VL_IPI: double;
    COD_OBS: array[0..6] of char;
  end;

type
  BlocoCRegistroC195 = record
    COD_OBS: array[0..6] of char;
    TXT_COMPL: array[0..1023] of char;
  end;

type
  BlocoCRegistroC197 = record
    COD_AJ: array[0..10] of char;
    DESCR_COMPL_AJ: array[0..254] of char;
    COD_ITEM: array[0..60] of char;
    VL_BC_ICMS: double;
    ALIQ_ICMS: double;
    VL_ICMS: double;
    VL_OUTROS: double;
  end;

type
  BlocoCRegistroC300 = record
    COD_MOD: array[0..2] of char;
    SER: array[0..4] of char;
    SUB: array[0..3] of char;
    NUM_DOC_INI: array[0..6] of char;
    NUM_DOC_FIN: array[0..6] of char;
    DT_DOC: double;
    VL_DOC: double;
    VL_PIS: double;
    VL_COFINS: double;
    COD_CTA: array[0..60] of char;
  end;

type
  BlocoCRegistroC310 = record
    NUM_DOC_CANC: array[0..60] of char;
  end;

type
  BlocoCRegistroC320 = record
    CST_ICMS: array[0..3] of char;
    CFOP: array[0..4] of char;
    ALIQ_ICMS: double;
    VL_OPR: double;
    VL_BC_ICMS: double;
    VL_ICMS: double;
    VL_RED_BC: double;
    COD_OBS: array[0..6] of char;
  end;

type
  BlocoCRegistroC321 = record
    COD_ITEM: array[0..60] of char;
    QTD: double;
    UNID: array[0..6] of char;
    VL_ITEM: double;
    VL_DESC: double;
    VL_BC_ICMS: double;
    VL_ICMS: double;
    VL_PIS: double;
    VL_COFINS: double;
  end;

type
  BlocoCRegistroC350 = record
    SER: array[0..3] of char;
    SUB_SER: array[0..3] of char;
    NUM_DOC: array[0..6] of char;
    DT_DOC: double;
    CNPJ_CPF: array[0..14] of char;
    VL_MERC: double;
    VL_DOC: double;
    VL_DESC: double;
    VL_PIS: double;
    VL_COFINS: double;
    COD_CTA: array[0..60] of char;
  end;

type
  BlocoCRegistroC370 = record
    NUM_ITEM: array[0..3] of char;
    COD_ITEM: array[0..60] of char;
    QTD: double;
    UNID: array[0..6] of char;
    VL_ITEM: double;
    VL_DESC: double;
  end;

type
  BlocoCRegistroC390 = record
    CST_ICMS: array[0..3] of char;
    CFOP: array[0..4] of char;
    ALIQ_ICMS: double;
    VL_OPR: double;
    VL_BC_ICMS: double;
    VL_ICMS: double;
    VL_RED_BC: double;
    COD_OBS: array[0..6] of char;
  end;

type
  BlocoCRegistroC400 = record
    COD_MOD: array[0..2] of char;
    ECF_MOD: array[0..20] of char;
    ECF_FAB: array[0..20] of char;
    ECF_CX: array[0..3] of char;
  end;

type
  BlocoCRegistroC405 = record
    DT_DOC: double;
    CRO: integer;
    CRZ: integer;
    NUM_COO_FIN: integer;
    GT_FIN: double;
    VL_BRT: double;
  end;

type
  BlocoCRegistroC410 = record
    VL_PIS: double;
    VL_COFINS: double;
  end;

type
  BlocoCRegistroC420 = record
    COD_TOT_PAR: array[0..7] of char;
    VLR_ACUM_TOT: double;
    NR_TOT: integer;
    DESCR_NR_TOT: array[0..254] of char;
  end;

type
  BlocoCRegistroC425 = record
    COD_ITEM: array[0..60] of char;
    QTD: double;
    UNID: array[0..6] of char;
    VL_ITEM: double;
    VL_PIS: double;
    VL_COFINS: double;
  end;

type
  BlocoCRegistroC460 = record
    COD_MOD: array[0..6] of char;
    COD_SIT: integer;
    NUM_DOC: array[0..14] of char;
    DT_DOC: double;
    VL_DOC: double;
    VL_PIS: double;
    VL_COFINS: double;
    CPF_CNPJ: array[0..14] of char;
    NOM_ADQ: array[0..60] of char;
  end;

type
  BlocoCRegistroC470 = record
    COD_ITEM: array[0..60] of char;
    QTD: double;
    QTD_CANC: double;
    UNID: array[0..6] of char;
    VL_ITEM: double;
    CST_ICMS: array[0..3] of char;
    CFOP: array[0..4] of char;
    ALIQ_ICMS: double;
    VL_PIS: double;
    VL_COFINS: double;
  end;

type
  BlocoCRegistroC490 = record
    CST_ICMS: array[0..3] of char;
    CFOP: array[0..4] of char;
    ALIQ_ICMS: double;
    VL_OPR: double;
    VL_BC_ICMS: double;
    VL_ICMS: double;
    COD_OBS: array[0..6] of char;
  end;

type
  BlocoCRegistroC495 = record
    ALIQ_ICMS: double;
    COD_ITEM: array[0..60] of char;
    QTD: double;
    QTD_CANC: double;
    UNID: array[0..6] of char;
    VL_ITEM: double;
    VL_DESC: double;
    VL_CANC: double;
    VL_ACMO: double;
    VL_BC_ICMS: double;
    VL_ICMS: double;
    VL_ISEN: double;
    VL_NT: double;
    VL_ICMS_ST: double;
  end;

type
  BlocoCRegistroC500 = record
    IND_OPER: integer;
    IND_EMIT: integer;
    COD_PART: array[0..60] of char;
    COD_MOD: array[0..2] of char;
    COD_SIT: integer;
    SER: array[0..4] of char;
    SUB: array[0..3] of char;
    COD_CONS: array[0..2] of char;
    NUM_DOC: array[0..9] of char;
    DT_DOC: double;
    DT_E_S: double;
    VL_DOC: double;
    VL_DESC: double;
    VL_FORN: double;
    VL_SERV_NT: double;
    VL_TERC: double;
    VL_DA: double;
    VL_BC_ICMS: double;
    VL_ICMS: double;
    VL_BC_ICMS_ST: double;
    VL_ICMS_ST: double;
    COD_INF: array[0..6] of char;
    VL_PIS: double;
    VL_COFINS: double;
    TP_LIGACAO: integer;
    COD_GRUPO_TENSAO: integer;
  end;

type
  BlocoCRegistroC510 = record
    NUM_ITEM: array[0..3] of char;
    COD_ITEM: array[0..60] of char;
    COD_CLASS: array[0..4] of char;
    QTD: double;
    UNID: array[0..6] of char;
    VL_ITEM: double;
    VL_DESC: double;
    CST_ICMS: array[0..3] of char;
    CFOP: array[0..4] of char;
    VL_BC_ICMS: double;
    ALIQ_ICMS: double;
    VL_ICMS: double;
    VL_BC_ICMS_ST: double;
    ALIQ_ST: double;
    VL_ICMS_ST: double;
    IND_REC: integer;
    COD_PART: array[0..60] of char;
    VL_PIS: double;
    VL_COFINS: double;
    COD_CTA: array[0..60] of char;
  end;

type
  BlocoCRegistroC590 = record
    CST_ICMS: array[0..3] of char;
    CFOP: array[0..4] of char;
    ALIQ_ICMS: double;
    VL_OPR: double;
    VL_BC_ICMS: double;
    VL_ICMS: double;
    VL_BC_ICMS_ST: double;
    VL_ICMS_ST: double;
    VL_RED_BC: double;
    COD_OBS: array[0..6] of char;
  end;

type
  BlocoCRegistroC600 = record
    COD_MOD: array[0..2] of char;
    COD_MUN: array[0..7] of char;
    SER: array[0..4] of char;
    SUB: array[0..3] of char;
    COD_CONS: array[0..2] of char;
    QTD_CONS: double;
    QTD_CANC: double;
    DT_DOC: double;
    VL_DOC: double;
    VL_DESC: double;
    CONS: double;
    VL_FORN: double;
    VL_SERV_NT: double;
    VL_TERC: double;
    VL_DA: double;
    VL_BC_ICMS: double;
    VL_ICMS: double;
    VL_BC_ICMS_ST: double;
    VL_ICMS_ST: double;
    VL_PIS: double;
    VL_COFINS: double;
  end;

type
  BlocoCRegistroC601 = record
    NUM_DOC_CANC: array[0..9] of char;
  end;

type
  BlocoCRegistroC610 = record
    COD_CLASS: array[0..4] of char;
    COD_ITEM: array[0..60] of char;
    QTD: double;
    UNID: array[0..6] of char;
    VL_ITEM: double;
    VL_DESC: double;
    CST_ICMS: array[0..3] of char;
    CFOP: array[0..4] of char;
    ALIQ_ICMS: double;
    VL_BC_ICMS: double;
    VL_ICMS: double;
    VL_BC_ICMS_ST: double;
    VL_ICMS_ST: double;
    VL_PIS: double;
    VL_COFINS: double;
    COD_CTA: array[0..60] of char;
  end;

type
  BlocoCRegistroC690 = record
    CST_ICMS: array[0..3] of char;
    CFOP: array[0..4] of char;
    ALIQ_ICMS: double;
    VL_OPR: double;
    VL_BC_ICMS: double;
    VL_ICMS: double;
    VL_RED_BC: double;
    VL_BC_ICMS_ST: double;
    VL_ICMS_ST: double;
    COD_OBS: array[0..6] of char;
  end;

type
  BlocoCRegistroC700 = record
    COD_MOD: array[0..2] of char;
    SER: array[0..4] of char;
    NRO_ORD_INI: integer;
    NRO_ORD_FIN: integer;
    DT_DOC_INI: double;
    DT_DOC_FIN: double;
    NOM_MEST: array[0..15] of char;
    CHV_COD_DIG: array[0..32] of char;
  end;

type
  BlocoCRegistroC790 = record
    CST_ICMS: array[0..3] of char;
    CFOP: array[0..4] of char;
    ALIQ_ICMS: double;
    VL_OPR: double;
    VL_BC_ICMS: double;
    VL_ICMS: double;
    VL_BC_ICMS_ST: double;
    VL_ICMS_ST: double;
    VL_RED_BC: double;
    COD_OBS: array[0..6] of char;
  end;

type
  BlocoCRegistroC791 = record
    UF: array[0..2] of char;
    VL_BC_ICMS_ST: double;
    VL_ICMS_ST: double;
  end;

type
  BlocoCRegistroC800 = record
    COD_MOD: array[0..2] of char;
    COD_SIT: integer;
    NUM_CFE: array[0..6] of char;
    DT_DOC: double;
    VL_CFE: double;
    VL_PIS: double;
    VL_COFINS: double;
    CNPJ_CPF: array[0..14] of char;
    NR_SAT: array[0..9] of char;
    CHV_CFE: array[0..44] of char;
    VL_DESC: double;
    VL_MERC: double;
    VL_OUT_DA: double;
    VL_ICMS: double;
    VL_PIS_ST: double;
    VL_COFINS_ST: double;
  end;

type
  BlocoCRegistroC850 = record
    CST_ICMS: array[0..3] of char;
    CFOP: array[0..4] of char;
    ALIQ_ICMS: double;
    VL_OPR: double;
    VL_BC_ICMS: double;
    VL_ICMS: double;
    COD_OBS: array[0..6] of char;
  end;

type
  BlocoCRegistroC860 = record
    COD_MOD: array[0..2] of char;
    NR_SAT: array[0..9] of char;
    DT_DOC: double;
    DOC_INI: array[0..6] of char;
    DOC_FIN: array[0..6] of char;
  end;

type
  BlocoCRegistroC890 = record
    CST_ICMS: array[0..3] of char;
    CFOP: array[0..4] of char;
    ALIQ_ICMS: currency;
    VL_OPR: currency;
    VL_BC_ICMS: currency;
    VL_ICMS: currency;
    COD_OBS: array[0..6] of char;
  end;


{%endregion Registros Bloco C}

{%region Registro Bloco D}

type
  BlocoDRegistroD001 = record
    IND_MOV: integer;
  end;

type
  BlocoDRegistroD100 = record
    IND_OPER: integer;
    IND_EMIT: integer;
    COD_PART: array[0..60] of char;
    COD_MOD: array[0..2] of char;
    COD_SIT: integer;
    SER: array[0..4] of char;
    SUB: array[0..3] of char;
    NUM_DOC: array[0..9] of char;
    CHV_CTE: array[0..44] of char;
    DT_DOC: double;
    DT_A_P: double;
    TP_CT_e: array[0..1] of char;
    CHV_CTE_REF: array[0..44] of char;
    VL_DOC: double;
    VL_DESC: double;
    IND_FRT: integer;
    VL_SERV: double;
    VL_BC_ICMS: double;
    VL_ICMS: double;
    VL_NT: double;
    COD_INF: array[0..6] of char;
    COD_CTA: array[0..60] of char;
  end;

type
  BlocoDRegistroD110 = record
    COD_ITEM: array[0..60] of char;
    NUN_ITEM: integer;
    VL_SERV: double;
    VL_OUT: double;
  end;

type
  BlocoDRegistroD120 = record
    COD_MUN_ORIG: array[0..7] of char;
    COD_MUN_DEST: array[0..7] of char;
    VEIC_ID: array[0..7] of char;
    UF_ID: array[0..2] of char;
  end;

type
  BlocoDRegistroD130 = record
    COD_PART_CONSG: array[0..60] of char;
    COD_PART_RED: array[0..60] of char;
    IND_FRT_RED: integer;
    COD_MUN_ORIG: array[0..7] of char;
    COD_MUN_DEST: array[0..7] of char;
    VEIC_ID: array[0..7] of char;
    VL_LIQ_FRT: double;
    VL_SEC_CAT: double;
    VL_DESP: double;
    VL_PEDG: double;
    VL_OUT: double;
    VL_FRT: double;
    UF_ID: array[0..2] of char;
  end;

type
  BlocoDRegistroD140 = record
    COD_PART_CONSG: array[0..60] of char;
    COD_MUN_ORIG: array[0..7] of char;
    COD_MUN_DEST: array[0..7] of char;
    IND_VEIC: array[0..1] of char;
    VEIC_ID: integer;
    IND_NAV: integer;
    VIAGEM: array[0..60] of char;
    VL_FRT_LIQ: double;
    VL_DESP_PORT: double;
    VL_DESP_CAR_DESC: double;
    VL_OUT: double;
    VL_FRT_BRT: double;
    VL_FRT_MM: double;
  end;

type
  BlocoDRegistroD150 = record
    COD_MUN_ORIG: array[0..7] of char;
    COD_MUN_DEST: array[0..7] of char;
    VEIC_ID: array[0..60] of char;
    VIAGEM: array[0..60] of char;
    IND_TFA: integer;
    VL_PESO_TX: double;
    VL_TX_TERR: double;
    VL_TX_RED: double;
    VL_OUT: double;
    VL_TX_ADV: double;
  end;

type
  BlocoDRegistroD160 = record
    DESPACHO: array[0..60] of char;
    CNPJ_CPF_REM: array[0..14] of char;
    IE_REM: array[0..14] of char;
    COD_MUN_ORI: array[0..7] of char;
    CNPJ_CPF_DEST: array[0..14] of char;
    IE_DEST: array[0..14] of char;
    COD_MUN_DEST: array[0..7] of char;
  end;

type
  BlocoDRegistroD161 = record
    IND_CARGA: integer;
    CNPJ_COL: array[0..14] of char;
    IE_COL: array[0..14] of char;
    COD_MUN_COL: array[0..7] of char;
    CNPJ_ENTG: array[0..14] of char;
    IE_ENTG: array[0..14] of char;
    COD_MUN_ENTG: array[0..7] of char;
  end;

type
  BlocoDRegistroD162 = record
    COD_MOD: array[0..2] of char;
    SER: array[0..4] of char;
    NUM_DOC: array[0..9] of char;
    DT_DOC: double;
    VL_DOC: double;
    VL_MERC: double;
    QTD_VOL: integer;
    PESO_BRT: double;
    PESO_LIQ: double;
  end;

type
  BlocoDRegistroD170 = record
    COD_PART_CONSG: array[0..60] of char;
    COD_PART_RED: array[0..60] of char;
    COD_MUN_ORIG: array[0..7] of char;
    COD_MUN_DEST: array[0..7] of char;
    OTM: array[0..60] of char;
    IND_NAT_FRT: integer;
    VL_LIQ_FRT: double;
    VL_GRIS: double;
    VL_PDG: double;
    VL_OUT: double;
    VL_FRT: double;
    VEIC_ID: array[0..7] of char;
    UF_ID: array[0..2] of char;
  end;

type
  BlocoDRegistroD180 = record
    NUM_SEQ: array[0..60] of char;
    IND_EMIT: integer;
    CNPJ_EMIT: array[0..14] of char;
    UF_EMIT: array[0..2] of char;
    IE_EMIT: array[0..14] of char;
    COD_MUN_ORIG: array[0..7] of char;
    CNPJ_CPF_TOM: array[0..14] of char;
    UF_TOM: array[0..2] of char;
    IE_TOM: array[0..14] of char;
    COD_MUN_DEST: array[0..7] of char;
    COD_MOD: array[0..2] of char;
    SER: array[0..4] of char;
    SUB: array[0..3] of char;
    NUM_DOC: array[0..9] of char;
    DT_DOC: double;
    VL_DOC: double;
  end;

type
  BlocoDRegistroD190 = record
    CST_ICMS: array[0..3] of char;
    CFOP: array[0..4] of char;
    ALIQ_ICMS: double;
    VL_OPR: double;
    VL_BC_ICMS: double;
    VL_ICMS: double;
    VL_RED_BC: double;
    COD_OBS: array[0..6] of char;
  end;

type
  BlocoDRegistroD195 = record
    COD_OBS: array[0..6] of char;
    TXT_COMPL: array[0..1023] of char;
  end;

type
  BlocoDRegistroD197 = record
    COD_AJ: array[0..10] of char;
    DESCR_COMPL_AJ: array[0..254] of char;
    COD_ITEM: array[0..60] of char;
    VL_BC_ICMS: double;
    ALIQ_ICMS: double;
    VL_ICMS: double;
    VL_OUTROS: double;
  end;

type
  BlocoDRegistroD300 = record
    COD_MOD: array[0..2] of char;
    SER: array[0..4] of char;
    SUB: array[0..3] of char;
    NUM_DOC_INI: array[0..6] of char;
    NUM_DOC_FIN: array[0..6] of char;
    CST_ICMS: array[0..3] of char;
    CFOP: array[0..4] of char;
    ALIQ_ICMS: double;
    DT_DOC: double;
    VL_OPR: double;
    VL_DESC: double;
    VL_SERV: double;
    VL_SEG: double;
    VL_OUT_DESP: double;
    VL_BC_ICMS: double;
    VL_ICMS: double;
    VL_RED_BC: double;
    COD_OBS: array[0..6] of char;
    COD_CTA: array[0..60] of char;
  end;

type
  BlocoDRegistroD301 = record
    NUM_DOC_CANC: array[0..60] of char;
  end;

type
  BlocoDRegistroD310 = record
    COD_MUN_ORIG: array[0..7] of char;
    VL_SERV: double;
    VL_BC_ICMS: double;
    VL_ICMS: double;
  end;

type
  BlocoDRegistroD350 = record
    COD_MOD: array[0..2] of char;
    ECF_MOD: array[0..20] of char;
    ECF_FAB: array[0..20] of char;
    ECF_CX: array[0..3] of char;
  end;

type
  BlocoDRegistroD355 = record
    DT_DOC: double;
    CRO: integer;
    CRZ: integer;
    NUM_COO_FIN: integer;
    GT_FIN: double;
    VL_BRT: double;
  end;

type
  BlocoDRegistroD360 = record
    VL_PIS: double;
    VL_COFINS: double;
  end;

type
  BlocoDRegistroD365 = record
    COD_TOT_PAR: array[0..7] of char;
    VLR_ACUM_TOT: double;
    NR_TOT: array[0..2] of char;
    DESCR_NR_TOT: array[0..254] of char;
  end;

type
  BlocoDRegistroD370 = record
    COD_MUN_ORIG: array[0..7] of char;
    VL_SERV: double;
    QTD_BILH: double;
    VL_BC_ICMS: double;
    VL_ICMS: double;
  end;

type
  BlocoDRegistroD390 = record
    CST_ICMS: array[0..3] of char;
    CFOP: array[0..4] of char;
    ALIQ_ICMS: double;
    VL_OPR: double;
    VL_BC_ISSQN: double;
    ALIQ_ISSQN: double;
    VL_ISSQN: double;
    VL_BC_ICMS: double;
    VL_ICMS: double;
    COD_OBS: array[0..6] of char;
  end;

type
  BlocoDRegistroD400 = record
    COD_PART: array[0..60] of char;
    COD_MOD: array[0..2] of char;
    COD_SIT: integer;
    SER: array[0..4] of char;
    SUB: array[0..3] of char;
    NUM_DOC: array[0..6] of char;
    DT_DOC: double;
    VL_DOC: double;
    VL_DESC: double;
    VL_SERV: double;
    VL_BC_ICMS: double;
    VL_ICMS: double;
    VL_PIS: double;
    VL_COFINS: double;
    COD_CTA: array[0..60] of char;
  end;

type
  BlocoDRegistroD410 = record
    COD_MOD: array[0..2] of char;
    SER: array[0..4] of char;
    SUB: array[0..3] of char;
    NUM_DOC_INI: array[0..6] of char;
    NUM_DOC_FIN: array[0..6] of char;
    DT_DOC: double;
    CST_ICMS: array[0..3] of char;
    CFOP: array[0..4] of char;
    ALIQ_ICMS: double;
    VL_OPR: double;
    VL_DESC: double;
    VL_SERV: double;
    VL_BC_ICMS: double;
    VL_ICMS: double;
  end;

type
  BlocoDRegistroD411 = record
    NUM_DOC_CANC: array[0..60] of char;
  end;

type
  BlocoDRegistroD420 = record
    COD_MUN_ORIG: array[0..7] of char;
    VL_SERV: double;
    VL_BC_ICMS: double;
    VL_ICMS: double;
  end;

type
  BlocoDRegistroD500 = record
    IND_OPER: integer;
    IND_EMIT: integer;
    COD_PART: array[0..60] of char;
    COD_MOD: array[0..2] of char;
    COD_SIT: integer;
    SER: array[0..4] of char;
    SUB: array[0..3] of char;
    NUM_DOC: array[0..9] of char;
    DT_DOC: double;
    DT_A_P: double;
    VL_DOC: double;
    VL_DESC: double;
    VL_SERV: double;
    VL_SERV_NT: double;
    VL_TERC: double;
    VL_DA: double;
    VL_BC_ICMS: double;
    VL_ICMS: double;
    COD_INF: array[0..6] of char;
    VL_PIS: double;
    VL_COFINS: double;
    COD_CTA: array[0..60] of char;
    TP_ASSINANTE: integer;
  end;

type
  BlocoDRegistroD510 = record
    IND_REC: integer;
  end;

type
  BlocoDRegistroD530 = record
    IND_SERV: integer;
  end;

type
  BlocoDRegistroD590 = record
    CST_ICMS: array[0..3] of char;
    CFOP: array[0..4] of char;
    ALIQ_ICMS: double;
    VL_OPR: double;
    VL_BC_ICMS: double;
    VL_ICMS: double;
    VL_BC_ICMS_UF: double;
    VL_ICMS_UF: double;
    VL_RED_BC: double;
    COD_OBS: array[0..6] of char;
  end;

type
  BlocoDRegistroD600 = record
  end;

type
  BlocoDRegistroD610 = record
  end;

type
  BlocoDRegistroD690 = record
  end;

type
  BlocoDRegistroD695 = record
    COD_MOD: array[0..2] of char;
    SER: array[0..4] of char;
    NRO_ORD_INI: integer;
    NRO_ORD_FIN: integer;
    DT_DOC_INI: double;
    DT_DOC_FIN: double;
    NOM_MEST: array[0..15] of char;
    CHV_COD_DIG: array[0..32] of char;
  end;

type
  BlocoDRegistroD696 = record
    CST_ICMS: array[0..3] of char;
    CFOP: array[0..4] of char;
    ALIQ_ICMS: double;
    VL_OPR: double;
    VL_BC_ICMS: double;
    VL_ICMS: double;
    VL_BC_ICMS_UF: double;
    VL_ICMS_UF: double;
    VL_RED_BC: double;
    COD_OBS: array[0..6] of char;
  end;

type
  BlocoDRegistroD697 = record
    UF: array[0..2] of char;
    VL_BC_ICMS: double;
    VL_ICMS: double;
  end;

{%endregion Registro Bloco D}

{%region Registro Bloco E}

type
  BlocoERegistroE001 = record
    IND_MOV: integer;
  end;

type
  BlocoERegistroE100 = record
    DT_INI: double;
    DT_FIN: double;
  end;

type
  BlocoERegistroE110 = record
    VL_TOT_DEBITOS: double;
    VL_AJ_DEBITOS: double;
    VL_TOT_AJ_DEBITOS: double;
    VL_ESTORNOS_CRED: double;
    VL_TOT_CREDITOS: double;
    VL_AJ_CREDITOS: double;
    VL_TOT_AJ_CREDITOS: double;
    VL_ESTORNOS_DEB: double;
    VL_SLD_CREDOR_ANT: double;
    VL_SLD_APURADO: double;
    VL_TOT_DED: double;
    VL_ICMS_RECOLHER: double;
    VL_SLD_CREDOR_TRANSPORTAR: double;
    DEB_ESP: double;
  end;

type
  BlocoERegistroE111 = record
    COD_AJ_APUR: array[0..8] of char;
    DESCR_COMPL_AJ: array[0..254] of char;
    VL_AJ_APUR: double;
  end;

type
  BlocoERegistroE112 = record
    NUM_DA: array[0..60] of char;
    NUM_PROC: array[0..15] of char;
    IND_PROC: integer;
    PROC: array[0..1023] of char;
    TXT_COMPL: array[0..1023] of char;
  end;

type
  BlocoERegistroE113 = record
    COD_PART: array[0..60] of char;
    COD_MOD: array[0..2] of char;
    SER: array[0..4] of char;
    SUB: array[0..3] of char;
    NUM_DOC: array[0..9] of char;
    DT_DOC: double;
    CHV_NFE: array[0..44] of char;
    COD_ITEM: array[0..60] of char;
    VL_AJ_ITEM: double;
  end;

type
  BlocoERegistroE115 = record
    COD_INF_ADIC: array[0..8] of char;
    VL_INF_ADIC: double;
    DESCR_COMPL_AJ: array[0..1023] of char;
  end;

type
  BlocoERegistroE116 = record
    COD_OR: array[0..3] of char;
    VL_OR: double;
    DT_VCTO: double;
    COD_REC: array[0..60] of char;
    NUM_PROC: array[0..15] of char;
    IND_PROC: integer;
    PROC: array[0..1023] of char;
    TXT_COMPL: array[0..1023] of char;
    MES_REF: array[0..6] of char;
  end;

type
  BlocoERegistroE200 = record
    UF: array[0..2] of char;
    DT_INI: double;
    DT_FIN: double;
  end;

type
  BlocoERegistroE210 = record
    IND_MOV_ST: integer;
    VL_SLD_CRED_ANT_ST: double;
    VL_DEVOL_ST: double;
    VL_RESSARC_ST: double;
    VL_OUT_CRED_ST: double;
    VL_AJ_CREDITOS_ST: double;
    VL_RETENCAO_ST: double;
    VL_OUT_DEB_ST: double;
    VL_AJ_DEBITOS_ST: double;
    VL_SLD_DEV_ANT_ST: double;
    VL_DEDUCOES_ST: double;
    VL_ICMS_RECOL_ST: double;
    VL_SLD_CRED_ST_TRANSPORTAR: double;
    DEB_ESP_ST: double;
  end;

type
  BlocoERegistroE220 = record
    COD_AJ_APUR: array[0..8] of char;
    DESCR_COMPL_AJ: array[0..1023] of char;
    VL_AJ_APUR: double;
  end;

type
  BlocoERegistroE230 = record
    NUM_DA: array[0..60] of char;
    NUM_PROC: array[0..15] of char;
    IND_PROC: integer;
    PROC: array[0..1023] of char;
    TXT_COMPL: array[0..1023] of char;
  end;

type
  BlocoERegistroE240 = record
    COD_PART: array[0..60] of char;
    COD_MOD: array[0..2] of char;
    SER: array[0..4] of char;
    SUB: array[0..3] of char;
    NUM_DOC: array[0..9] of char;
    DT_DOC: double;
    CHV_NFE: array[0..44] of char;
    COD_ITEM: array[0..60] of char;
    VL_AJ_ITEM: double;
  end;

type
  BlocoERegistroE250 = record
    COD_OR: array[0..3] of char;
    VL_OR: double;
    DT_VCTO: double;
    COD_REC: array[0..60] of char;
    NUM_PROC: array[0..15] of char;
    IND_PROC: integer;
    PROC: array[0..1023] of char;
    TXT_COMPL: array[0..1023] of char;
    MES_REF: array[0..6] of char;
  end;

type
  BlocoERegistroE500 = record
    IND_APUR: integer;
    DT_INI: double;
    DT_FIN: double;
  end;

type
  BlocoERegistroE510 = record
    CFOP: array[0..4] of char;
    CST_IPI: array[0..2] of char;
    VL_CONT_IPI: double;
    VL_BC_IPI: double;
    VL_IPI: double;
  end;

type
  BlocoERegistroE520 = record
    VL_SD_ANT_IPI: double;
    VL_DEB_IPI: double;
    VL_CRED_IPI: double;
    VL_OD_IPI: double;
    VL_OC_IPI: double;
    VL_SC_IPI: double;
    VL_SD_IPI: double;
  end;

type
  BlocoERegistroE530 = record
    IND_AJ: integer;
    VL_AJ: double;
    COD_AJ: array[0..3] of char;
    IND_DOC: integer;
    NUM_DOC: array[0..60] of char;
    DESCR_AJ: array[0..1023] of char;
  end;

{%endregion Registro Bloco E}

{%region Registro Bloco G}

type
  BlocoGRegistroG001 = record
    IND_MOV: integer;
  end;

type
  BlocoGRegistroG110 = record
    MODO_CIAP: array[0..60] of char;
    SALDO_IN_ICMS: double;
    SALDO_FN_ICMS: double;
    SOM_PARC: double;
    VL_TRIB_EXP: double;
    VL_TOTAL: double;
    IND_PER_SAI: double;
    ICMS_APROP: double;
    SOM_ICMS_OC: double;
  end;

type
  BlocoGRegistroG125 = record
    COD_IND_BEM: array[0..60] of char;
    DT_MOV: double;
    TIPO_MOV: integer;
    VL_IMOB_ICMS_OP: double;
    VL_IMOB_ICMS_ST: double;
    VL_IMOB_ICMS_FRT: double;
    VL_IMOB_ICMS_DIF: double;
    NUM_PARC: integer;
    VL_PARC_PASS: double;
    VL_PARC_APROP: double;
  end;

type
  BlocoGRegistroG126 = record
    DT_INI: double;
    DT_FIN: double;
    NUM_PARC: integer;
    VL_PARC_PASS: double;
    VL_TRIB_OC: double;
    VL_TOTAL: double;
    IND_PER_SAI: double;
    VL_PARC_APROP: double;
  end;

type
  BlocoGRegistroG130 = record
    IND_EMIT: integer;
    COD_PART: array[0..60] of char;
    COD_MOD: array[0..2] of char;
    SERIE: array[0..3] of char;
    NUM_DOC: array[0..9] of char;
    CHV_NFE_CTE: array[0..44] of char;
    DT_DOC: double;
  end;

type
  BlocoGRegistroG140 = record
    NUM_ITEM: array[0..3] of char;
    COD_ITEM: array[0..60] of char;
  end;

{%endregion Registro Bloco G}

{%region Registro Bloco H}

type
  BlocoHRegistroH001 = record
    IND_MOV: integer;
  end;

type
  BlocoHRegistroH005 = record
    DT_INV: double;
    VL_INV: double;
    MOT_INV: integer;
  end;

type
  BlocoHRegistroH010 = record
    COD_ITEM: array[0..60] of char;
    UNID: array[0..6] of char;
    QTD: double;
    VL_UNIT: double;
    VL_ITEM: double;
    IND_PROP: integer;
    COD_PART: array[0..60] of char;
    TXT_COMPL: array[0..1023] of char;
    COD_CTA: array[0..60] of char;
  end;

type
  BlocoHRegistroH020 = record
    CST_ICMS: array[0..3] of char;
    BC_ICMS: double;
    VL_ICMS: double;
  end;

{%endregion Registro Bloco H}

implementation

end.
