{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2009   Isaque Pinheiro                      }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{  Esta biblioteca � software livre; voc� pode redistribu�-la e/ou modific�-la }
{ sob os termos da Licen�a P�blica Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a vers�o 2.1 da Licen�a, ou (a seu crit�rio) }
{ qualquer vers�o posterior.                                                   }
{                                                                              }
{  Esta biblioteca � distribu�da na expectativa de que seja �til, por�m, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia impl�cita de COMERCIABILIDADE OU      }
{ ADEQUA��O A UMA FINALIDADE ESPEC�FICA. Consulte a Licen�a P�blica Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICEN�A.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral Menor do GNU junto}
{ com esta biblioteca; se n�o, escreva para a Free Software Foundation, Inc.,  }
{ no endere�o 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Voc� tamb�m pode obter uma copia da licen�a em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Sim�es de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Pra�a Anita Costa, 34 - Tatu� - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{******************************************************************************
|* Historico
|*
|* 10/04/2009: Isaque Pinheiro
|*  - Cria��o e distribui��o da Primeira Versao
*******************************************************************************}

unit ACBrEFDBloco_C;

interface

uses
  SysUtils, Classes, DateUtils, ACBrEFDBlocos;

type
  /// Registro C001 - ABERTURA DO BLOCO C

  TRegistroC001 = class(TOpenBlocos)
  private
  public
  end;

  TRegistroC110List = class;
  TRegistroC111List = class;
  TRegistroC112List = class;
  TRegistroC113List = class;
  TRegistroC114List = class;
  TRegistroC115List = class;
  TRegistroC120List = class;
  TRegistroC130List = class;
  TRegistroC140List = class; {M�rcio Lopes 30Nov2009}
  TRegistroC141List = class; {M�rcio Lopes 30Nov2009}
  TRegistroC160List = class;
  TRegistroC165List = class;
  TRegistroC170List = class;
  TRegistroC171List = class;
  TRegistroC172List = class;
  TRegistroC173List = class;
  TRegistroC174List = class;
  TRegistroC175List = class;
  TRegistroC176List = class;
  TRegistroC177List = class;
  TRegistroC178List = class;
  TRegistroC179List = class;
  TRegistroC190List = class;
  TRegistroC195List = class;
  TRegistroC370List = class;
  TRegistroC390List = class;
  TRegistroC405List = class;
  TRegistroC410List = class;
  TRegistroC420List = class;
  TRegistroC425List = class;
  TRegistroC460List = class;
  TRegistroC490List = class;
  TRegistroC470List = class;
  TRegistroC510List = class; {M�rcio Lopes 30Nov2009}
  TRegistroC590List = class; {M�rcio Lopes 30Nov2009}


  /// Registro C100 - NOTA FISCAL (C�DIGO 01), NOTA FISCAL AVULSA (C�DIGO 1B), NOTA FISCAL DE PRODUTOR (C�DIGO 04) E NFE (C�DIGO 55)

  TRegistroC100 = class(TPersistent)
  private
    fIND_OPER: AnsiString;     /// Indicador do tipo de opera��o: 0- Entrada; 1- Sa�da
    fIND_EMIT: AnsiString;     /// Indicador do emitente do documento fiscal: 0- Emiss�o pr�pria; 1- Terceiros
    fCOD_PART: AnsiString;     /// C�digo do participante (campo 02 do Registro 0150):
    fCOD_MOD: AnsiString;      /// C�digo do modelo do documento fiscal, conforme a Tabela 4.1.1
    fCOD_SIT: AnsiString;      /// C�digo da situa��o do documento fiscal, conforme a Tabela 4.1.2
    fSER: AnsiString;          /// S�rie do documento fiscal
    fNUM_DOC: AnsiString;      /// N�mero do documento fiscal
    fCHV_NFE: AnsiString;      /// Chave da Nota Fiscal Eletr�nica
    fDT_DOC: TDateTime;        /// Data da emiss�o do documento fiscal
    fDT_E_S: TDateTime;        /// Data da entrada ou da sa�da
    fVL_DOC: currency;         /// Valor total do documento fiscal
    fIND_PGTO: AnsiString;     /// Indicador do tipo de pagamento:
    fVL_DESC: currency;        /// Valor total do desconto // Prates
    fVL_ABAT_NT: currency;     /// Abatimento n�o tributado e n�o comercial Ex. desconto ICMS nas remessas para ZFM: // Prates
    fVL_MERC: currency;        /// Valor das mercadorias constantes no documento fiscal
    fIND_FRT: AnsiString;      /// Indicador do tipo do frete:
    fVL_FRT: currency;         /// Valor do frete indicado no documento fiscal
    fVL_SEG: currency;         /// Valor do seguro indicado no documento fiscal
    fVL_OUT_DA: currency;      /// Valor de outras despesas acess�rias
    fVL_BC_ICMS: currency;     /// Valor da base de c�lculo do ICMS
    fVL_ICMS: currency;        /// Valor do ICMS
    fVL_BC_ICMS_ST: currency;  /// Valor da base de c�lculo do ICMS substitui��o tribut�ria
    fVL_ICMS_ST: currency;     /// Valor do ICMS retido por substitui��o tribut�ria
    fVL_IPI: currency;         /// Valor total do IPI
    fVL_PIS: currency;         /// Valor total do PIS
    fVL_COFINS: currency;      /// Valor total da COFINS
    fVL_PIS_ST: currency;      /// Valor total do PIS retido por substitui��o tribut�ria
    fVL_COFINS_ST: currency;   /// Valor total da COFINS retido por substitui��o tribut�ria

    FRegistroC110: TRegistroC110List;  /// BLOCO C - Lista de RegistroC110 (FILHO)
    FRegistroC120: TRegistroC120List;  /// BLOCO C - Lista de RegistroC120 (FILHO)
    FRegistroC130: TRegistroC130List;  /// BLOCO C - Lista de RegistroC130 (FILHO)
    FRegistroC140: TRegistroC140List;  /// BLOCO C - Lista de RegistroC140 (FILHO) {M�rcio Lopes 30Nov2009}
    FRegistroC160: TRegistroC160List;  /// BLOCO C - Lista de RegistroC160 (FILHO)
    FRegistroC165: TRegistroC165List;  /// BLOCO C - Lista de RegistroC165 (FILHO)
    FRegistroC170: TRegistroC170List;  /// BLOCO C - Lista de RegistroC170 (FILHO)
    FRegistroC190: TRegistroC190List;  /// BLOCO C - Lista de RegistroC190 (FILHO) {Jean Barreiros 17Nov2009}
    FRegistroC195: TRegistroC195List;  /// BLOCO C - Lista de RegistroC195 (FILHO)
  public
    constructor Create; virtual; /// Create
    destructor Destroy; override; /// Destroy

    property IND_OPER: AnsiString read FIND_OPER write FIND_OPER;
    property IND_EMIT: AnsiString read FIND_EMIT write FIND_EMIT;
    property COD_PART: AnsiString read FCOD_PART write FCOD_PART;
    property COD_MOD: AnsiString read FCOD_MOD write FCOD_MOD;
    property COD_SIT: AnsiString read FCOD_SIT write FCOD_SIT;
    property SER: AnsiString read FSER write FSER;
    property NUM_DOC: AnsiString read FNUM_DOC write FNUM_DOC;
    property CHV_NFE: AnsiString read FCHV_NFE write FCHV_NFE;
    property DT_DOC: TDateTime read FDT_DOC write FDT_DOC;
    property DT_E_S: TDateTime read FDT_E_S write FDT_E_S;
    property VL_DOC: currency read FVL_DOC write FVL_DOC;
    property IND_PGTO: AnsiString read FIND_PGTO write FIND_PGTO;
    property VL_DESC: currency read FVL_DESC write FVL_DESC; // prates
    property VL_ABAT_NT: currency read FVL_ABAT_NT write FVL_ABAT_NT; // Prates
    property VL_MERC: currency read FVL_MERC write FVL_MERC;
    property IND_FRT: AnsiString read FIND_FRT write FIND_FRT;
    property VL_FRT: currency read FVL_FRT write FVL_FRT;
    property VL_SEG: currency read FVL_SEG write FVL_SEG;
    property VL_OUT_DA: currency read FVL_OUT_DA write FVL_OUT_DA;
    property VL_BC_ICMS: currency read FVL_BC_ICMS write FVL_BC_ICMS;
    property VL_ICMS: currency read FVL_ICMS write FVL_ICMS;
    property VL_BC_ICMS_ST: currency read FVL_BC_ICMS_ST write FVL_BC_ICMS_ST;
    property VL_ICMS_ST: currency read FVL_ICMS_ST write FVL_ICMS_ST;
    property VL_IPI: currency read FVL_IPI write FVL_IPI;
    property VL_PIS: currency read FVL_PIS write FVL_PIS;
    property VL_COFINS: currency read FVL_COFINS write FVL_COFINS;
    property VL_PIS_ST: currency read FVL_PIS_ST write FVL_PIS_ST;
    property VL_COFINS_ST: currency read FVL_COFINS_ST write FVL_COFINS_ST;
    /// Registros FILHOS
    property RegistroC110: TRegistroC110List read FRegistroC110 write FRegistroC110;
    property RegistroC120: TRegistroC120List read FRegistroC120 write FRegistroC120;
    property RegistroC130: TRegistroC130List read FRegistroC130 write FRegistroC130;
    property RegistroC140: TRegistroC140List read FRegistroC140 write FRegistroC140; {M�rcio Lopes 30Nov2009}
    property RegistroC160: TRegistroC160List read FRegistroC160 write FRegistroC160;
    property RegistroC165: TRegistroC165List read FRegistroC165 write FRegistroC165;
    property RegistroC170: TRegistroC170List read FRegistroC170 write FRegistroC170;
    property RegistroC190: TRegistroC190List read FRegistroC190 write FRegistroC190;  {Jean Barreiros 17Nov2009}
    property RegistroC195: TRegistroC195List read FRegistroC195 write FRegistroC195;
  end;

  /// Registro C100 - Lista

  TRegistroC100List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC100; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC100); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC100;
    property Items[Index: Integer]: TRegistroC100 read GetItem write SetItem;
  end;

  /// Registro C110 - INFORMA��O COMPLEMENTAR DA NOTA FISCAL (C�DIGO 01; 1B, 04 e 55)

  TRegistroC110 = class(TPersistent)
  private
    fCOD_INF: AnsiString;       /// C�digo da informa��o complementar do documento fiscal (campo 02 do Registro 0450)
    fTXT_COMPL: AnsiString;    /// Descri��o complementar do c�digo de refer�ncia.

    FRegistroC111: TRegistroC111List;  /// BLOCO C - Lista de RegistroC111 (FILHO fo FILHO)
    FRegistroC112: TRegistroC112List;  /// BLOCO C - Lista de RegistroC111 (FILHO fo FILHO)
    FRegistroC113: TRegistroC113List;  /// BLOCO C - Lista de RegistroC111 (FILHO fo FILHO)
    FRegistroC114: TRegistroC114List;  /// BLOCO C - Lista de RegistroC111 (FILHO fo FILHO)
    FRegistroC115: TRegistroC115List;  /// BLOCO C - Lista de RegistroC111 (FILHO fo FILHO)
  public
    constructor Create; virtual; /// Create
    destructor Destroy; override; /// Destroy

    property COD_INF: AnsiString read FCOD_INF write FCOD_INF;
    property TXT_COMPL: AnsiString read FTXT_COMPL write FTXT_COMPL;
    /// Resgistro FILHO do FILHO
    property RegistroC111: TRegistroC111List read FRegistroC111 write FRegistroC111;
    property RegistroC112: TRegistroC112List read FRegistroC112 write FRegistroC112;
    property RegistroC113: TRegistroC113List read FRegistroC113 write FRegistroC113;
    property RegistroC114: TRegistroC114List read FRegistroC114 write FRegistroC114;
    property RegistroC115: TRegistroC115List read FRegistroC115 write FRegistroC115;
  end;

  /// Registro C110 - Lista

  TRegistroC110List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC110; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC110); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC110;
    property Items[Index: Integer]: TRegistroC110 read GetItem write SetItem;
  end;

  /// Registro C111 - PROCESSO REFERENCIADO

  TRegistroC111 = class(TPersistent)
  private
    fNUM_PROC: AnsiString;       /// Identifica��o do processo ou ato concess�rio
    fIND_PROC: AnsiString;       /// Indicador da origem do processo:
  public
    property NUM_PROC: AnsiString read FNUM_PROC write FNUM_PROC;
    property IND_PROC: AnsiString read FIND_PROC write FIND_PROC;
  end;

  /// Registro C111 - Lista

  TRegistroC111List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC111; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC111); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC111;
    property Items[Index: Integer]: TRegistroC111 read GetItem write SetItem;
  end;

  /// Registro C112 - DOCUMENTO DE ARRECADA��O REFERENCIADO

  TRegistroC112 = class(TPersistent)
  private
    fCOD_DA: AnsiString;        /// C�digo do modelo do documento de arrecada��o :
    fUF: AnsiString;            /// Unidade federada benefici�ria do recolhimento
    fNUM_DA: AnsiString;        /// N�mero do documento de arrecada��o
    fCOD_AUT: AnsiString;       /// C�digo completo da autentica��o banc�ria
    fVL_DA: Currency;         /// Valor do total do documento de arrecada��o (principal, atualiza��o monet�ria, juros e multa) // Prates
    fDT_VCTO: TDateTime;    /// Data de vencimento do documento de arrecada��o
    fDT_PGTO: TDateTime;    /// Data de pagamento do documento de arrecada��o, ou data do vencimento, no caso de ICMS antecipado a recolher.
  public
    property COD_DA: AnsiString read FCOD_DA write FCOD_DA;
    property UF: AnsiString read FUF write FUF;
    property NUM_DA: AnsiString read FNUM_DA write FNUM_DA;
    property COD_AUT: AnsiString read FCOD_AUT write FCOD_AUT;
    property VL_DA: currency read FVL_DA write FVL_DA; // Prats
    property DT_VCTO: TDateTime read FDT_VCTO write FDT_VCTO;
    property DT_PGTO: TDateTime read FDT_PGTO write FDT_PGTO;
  end;

  /// Registro C112 - Lista

  TRegistroC112List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC112; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC112); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC112;
    property Items[Index: Integer]: TRegistroC112 read GetItem write SetItem;
  end;

  /// Registro C113 - DOCUMENTO FISCAL REFERENCIADO

  TRegistroC113 = class(TPersistent)
  private
    fIND_OPER: AnsiString; /// Indicador do tipo de opera��o: 0 - Entrada/aquisi��o; 1- Sa�da/presta��o
    fIND_EMIT: AnsiString; /// Indicador do emitente do t�tulo: 0 - Emiss�o pr�pria; 1- Terceiros
    fCOD_PART: AnsiString; /// C�digo do participante emitente (campo 02 do Registro 0150)  do documento referenciado.
    fCOD_MOD: AnsiString; /// C�digo do documento fiscal, conforme a Tabela 4.1.1
    fSER: AnsiString; /// S�rie do documento fiscal
    fSUB: AnsiString; /// Subs�rie do documento fiscal
    fNUM_DOC: AnsiString; /// N�mero do documento fiscal
    fDT_DOC: TDateTime; /// Data da emiss�o do documento fiscal.
  public
    property IND_OPER: AnsiString read fIND_OPER write fIND_OPER;
    property IND_EMIT: AnsiString read fIND_EMIT write fIND_EMIT;
    property COD_PART: AnsiString read fCOD_PART write fCOD_PART;
    property COD_MOD: AnsiString read fCOD_MOD write fCOD_MOD;
    property SER: AnsiString read fSER write fSER;
    property SUB: AnsiString read fSUB write fSUB;
    property NUM_DOC: AnsiString read fNUM_DOC write fNUM_DOC;
    property DT_DOC: TDateTime read fDT_DOC write fDT_DOC;
  end;

  /// Registro C113 - Lista

  TRegistroC113List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC113; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC113); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC113;
    property Items[Index: Integer]: TRegistroC113 read GetItem write SetItem;
  end;

  /// Registro C114 - CUPOM FISCAL REFERENCIADO

  TRegistroC114 = class(TPersistent)
  private
    fCOD_MOD: AnsiString;        /// C�digo do modelo do documento fiscal, conforme a tabela indicada no item 4.1.1
    fECF_FAB: AnsiString;        /// N�mero de s�rie de fabrica��o do ECF
    fECF_CX: AnsiString;         /// N�mero do caixa atribu�do ao ECF
    fNUM_DOC: AnsiString;        /// N�mero do documento fiscal
    fDT_DOC: TDateTime;      /// Data da emiss�o do documento fiscal
  public
    property COD_MOD: AnsiString read FCOD_MOD write FCOD_MOD;
    property ECF_FAB: AnsiString read FECF_FAB write FECF_FAB;
    property ECF_CX: AnsiString read FECF_CX write FECF_CX;
    property NUM_DOC: AnsiString read FNUM_DOC write FNUM_DOC;
    property DT_DOC: TDateTime read FDT_DOC write FDT_DOC;
  end;

  /// Registro C114 - Lista

  TRegistroC114List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC114; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC114); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC114;
    property Items[Index: Integer]: TRegistroC114 read GetItem write SetItem;
  end;

  /// Registro C115 - LOCAL DA COLETA E ENTREGA (C�DIGO 01, 1B E 04)

  TRegistroC115 = class(TPersistent)
  private
    fIND_CARGA: AnsiString;     /// Indicador do tipo de transporte da carga coletada: 0 - Rodovi�rio; 1 - Ferrovi�rio; 2 - Rodo-Ferrovi�rio; 3 - Aquavi�rio; 4 - Dutovi�rio; 5 - A�reo; 9 - Outros.
    fCNPJ_COL: AnsiString;      /// N�mero do CNPJ do contribuinte do local de coleta
    fIE_COL: AnsiString;        /// Inscri��o Estadual do contribuinte do local de coleta
    fCPF_COL: AnsiString;       /// CPF do contribuinte do local de coleta das mercadorias.
    fCOD_MUN_COL: AnsiString;   /// C�digo do Munic�pio do local de coleta
    fCNPJ_ENTG: AnsiString;     /// N�mero do CNPJ do contribuinte do local de entrega
    fIE_ENTG: AnsiString;       /// Inscri��o Estadual do contribuinte do local de entrega
    fCPF_ENTG: AnsiString;      /// Cpf do contribuinte do local de entrega
    fCOD_MUN_ENTG: AnsiString;  /// C�digo do Munic�pio do local de entrega
  public
    property IND_CARGA: AnsiString read FIND_CARGA write FIND_CARGA;
    property CNPJ_COL: AnsiString read FCNPJ_COL write FCNPJ_COL;
    property IE_COL: AnsiString read FIE_COL write FIE_COL;
    property CPF_COL: AnsiString read FCPF_COL write FCPF_COL;
    property COD_MUN_COL: AnsiString read FCOD_MUN_COL write FCOD_MUN_COL;
    property CNPJ_ENTG: AnsiString read FCNPJ_ENTG write FCNPJ_ENTG;
    property IE_ENTG: AnsiString read FIE_ENTG write FIE_ENTG;
    property CPF_ENTG: AnsiString read FCPF_ENTG write FCPF_ENTG;
    property COD_MUN_ENTG: AnsiString read FCOD_MUN_ENTG write FCOD_MUN_ENTG;
  end;

  /// Registro C115 - Lista

  TRegistroC115List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC115; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC115); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC115;
    property Items[Index: Integer]: TRegistroC115 read GetItem write SetItem;
  end;

  /// Registro C120 - OPERA��ES DE IMPORTA��O (C�DIGO 01)

  TRegistroC120 = class(TPersistent)
  private
    fCOD_DOC_IMP: AnsiString;      /// Documento de importa��o:
    fNUM_DOC__IMP: AnsiString;     /// N�mero do documento de Importa��o.
    fPIS_IMP: currency;        /// Valor pago de PIS na importa��o
    fCOFINS_IMP: currency;     /// Valor pago de COFINS na importa��o
  public
    property COD_DOC_IMP: AnsiString read FCOD_DOC_IMP write FCOD_DOC_IMP;
    property NUM_DOC__IMP: AnsiString read FNUM_DOC__IMP write FNUM_DOC__IMP;
    property PIS_IMP: currency read FPIS_IMP write FPIS_IMP;
    property COFINS_IMP: currency read FCOFINS_IMP write FCOFINS_IMP;
  end;

  /// Registro C120 - Lista

  TRegistroC120List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC120; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC120); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC120;
    property Items[Index: Integer]: TRegistroC120 read GetItem write SetItem;
  end;

  /// Registro C130 - ISSQN, IRRF E PREVID�NCIA SOCIAL

  TRegistroC130 = class(TPersistent)
  private
    fVL_SERV_NT: currency;     /// Valor dos servi�os sob n�o-incid�ncia ou n�o-tributados pelo ICMS
    fVL_BC_ISSQN: currency;    /// Valor da base de c�lculo do ISSQN
    fVL_ISSQN: currency;       /// Valor do ISSQN
    fVL_BC_IRRF: currency;     /// Valor da base de c�lculo do Imposto de Renda Retido na Fonte
    fVL_IRRF: currency;        /// Valor do Imposto de Renda - Retido na Fonte
    fVL_BC_PREV: currency;     /// Valor da base de c�lculo de reten��o da Previd�ncia Social
    fVL_PREV: currency;        /// Valor destacado para reten��o da Previd�ncia Social
  public
    property VL_SERV_NT: currency read FVL_SERV_NT write FVL_SERV_NT;
    property VL_BC_ISSQN: currency read FVL_BC_ISSQN write FVL_BC_ISSQN;
    property VL_ISSQN: currency read FVL_ISSQN write FVL_ISSQN;
    property VL_BC_IRRF: currency read FVL_BC_IRRF write FVL_BC_IRRF;
    property VL_IRRF: currency read FVL_IRRF write FVL_IRRF;
    property VL_BC_PREV: currency read FVL_BC_PREV write FVL_BC_PREV;
    property VL_PREV: currency read FVL_PREV write FVL_PREV;
  end;

  /// Registro C130 - Lista

  TRegistroC130List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC130; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC130); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC130;
    property Items[Index: Integer]: TRegistroC130 read GetItem write SetItem;
  end;

  /// Registro C140 - FATURA (C�DIGO 01)

  TRegistroC140 = class(TPersistent)
  private
    fIND_EMIT: AnsiString;       /// Indicador do emitente do t�tulo: 0- Emiss�o pr�pria; 1- Terceiros
    fIND_TIT: AnsiString;        /// Indicador do tipo de t�tulo de cr�dito: 00- Duplicata; 01- Cheque; 02- Promiss�ria; 03- Recibo; 99- Outros (descrever)
    fDESC_TIT: AnsiString;       /// Descri��o complementar do t�tulo de cr�dito
    fNUM_TIT: AnsiString;        /// N�mero ou c�digo identificador do t�tulo de cr�dito
    fQTD_PARC: Integer;          /// Quantidade de parcelas a receber/pagar
    fVL_TIT: currency;           /// Valor original do t�tulo de cr�dito

    FRegistroC141: TRegistroC141List;  /// BLOCO C - Lista de RegistroC141 (FILHO fo FILHO)
  public
    constructor Create; virtual; /// Create
    destructor Destroy; override; /// Destroy

    property IND_EMIT: AnsiString read FIND_EMIT write FIND_EMIT;
    property IND_TIT: AnsiString read FIND_TIT write FIND_TIT;
    property DESC_TIT: AnsiString read FDESC_TIT write FDESC_TIT;
    property NUM_TIT: AnsiString read FNUM_TIT write FNUM_TIT;
    property QTD_PARC: Integer read FQTD_PARC write FQTD_PARC;
    property VL_TIT: currency read FVL_TIT write FVL_TIT;
    /// Registros FILHOS
    property RegistroC141: TRegistroC141List read FRegistroC141 write FRegistroC141; {M�rcio Lopes 30Nov2009}
  end;

  /// Registro C140 - Lista

  TRegistroC140List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC140; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC140); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC140;
    property Items[Index: Integer]: TRegistroC140 read GetItem write SetItem;
  end;

  /// Registro C141 - VENCIMENTO DA FATURA (C�DIGO 01)

  TRegistroC141 = class(TPersistent)
  private
    fNUM_PARC: AnsiString;       /// N�mero da parcela a receber/pagar
    fDT_VCTO: TDateTime;     /// Data de vencimento da parcela
    fVL_PARC: currency;      /// Valor da parcela a receber/pagar
  public
    property NUM_PARC: AnsiString read FNUM_PARC write FNUM_PARC;
    property DT_VCTO: TDateTime read FDT_VCTO write FDT_VCTO;
    property VL_PARC: currency read FVL_PARC write FVL_PARC;
  end;

  /// Registro C141 - Lista

  TRegistroC141List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC141; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC141); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC141;
    property Items[Index: Integer]: TRegistroC141 read GetItem write SetItem;
  end;

  /// Registro C160 - VOLUMES TRANSPORTADOS (C�DIGO 01 E 04) - EXCETO COMBUST�VEIS.

  TRegistroC160 = class(TPersistent)
  private
    fCOD_PART: AnsiString;      /// C�digo do participante (campo 02 do Registro 0150):
    fVEIC_ID: AnsiString;       /// Placa de identifica��o do ve�culo
    fQTD_VOL: currency;     /// Quantidade de volumes transportados
    fPESO_BRT: currency;    /// Peso bruto dos volumes transportados (em Kg)
    fPESO_LIQ: currency;    /// Peso l�quido dos volumes transportados (em Kg)
    fUF_ID: AnsiString;         /// Sigla da UF da placa do ve�culo
  public
    property COD_PART: AnsiString read FCOD_PART write FCOD_PART;
    property VEIC_ID: AnsiString read FVEIC_ID write FVEIC_ID;
    property QTD_VOL: currency read FQTD_VOL write FQTD_VOL;
    property PESO_BRT: currency read FPESO_BRT write FPESO_BRT;
    property PESO_LIQ: currency read FPESO_LIQ write FPESO_LIQ;
    property UF_ID: AnsiString read FUF_ID write FUF_ID;
  end;

  /// Registro C160 - Lista

  TRegistroC160List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC160; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC160); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC160;
    property Items[Index: Integer]: TRegistroC160 read GetItem write SetItem;
  end;

  /// Registro C165 - OPERA��ES COM COMBUST�VEIS(C�DIGO 01; 55)

  TRegistroC165 = class(TPersistent)
  private
    fCOD_PART: AnsiString;      /// C�digo do participante (campo 02 do Registro 0150):
    fVEIC_ID: AnsiString;       /// Placa de identifica��o do ve�culo
    fCOD_AUT: AnsiString;       /// C�digo da autoriza��o fornecido pela SEFAZ (combust�veis)
    fNR_PASSE: AnsiString;      /// N�mero do Passe Fiscal
    fHORA: AnsiString;          /// Hora da sa�da das mercadorias
    fTEMPER: AnsiString;        /// Temperatura em graus Celsius utilizada para quantifica��o do volume de combust�vel
    fQTD_VOL: currency;     /// Quantidade de volumes transportados
    fPESO_BRT: currency;    /// Peso bruto dos volumes transportados (em Kg)
    fPESO_LIQ: currency;    /// Peso l�quido dos volumes transportados (em Kg)
    fNOM_MOT: AnsiString;       /// Nome do motorista
    fCPF: AnsiString;           /// CPF do motorista
    fUF_ID: AnsiString;         /// Sigla da UF da placa do ve�culo
  public
    property COD_PART: AnsiString read FCOD_PART write FCOD_PART;
    property VEIC_ID: AnsiString read FVEIC_ID write FVEIC_ID;
    property COD_AUT: AnsiString read FCOD_AUT write FCOD_AUT;
    property NR_PASSE: AnsiString read FNR_PASSE write FNR_PASSE;
    property HORA: AnsiString read FHORA write FHORA;
    property TEMPER: AnsiString read FTEMPER write FTEMPER;
    property QTD_VOL: currency read FQTD_VOL write FQTD_VOL;
    property PESO_BRT: currency read FPESO_BRT write FPESO_BRT;
    property PESO_LIQ: currency read FPESO_LIQ write FPESO_LIQ;
    property NOM_MOT: AnsiString read FNOM_MOT write FNOM_MOT;
    property CPF: AnsiString read FCPF write FCPF;
    property UF_ID: AnsiString read FUF_ID write FUF_ID;
  end;

  /// Registro C165 - Lista

  TRegistroC165List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC165; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC165); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC165;
    property Items[Index: Integer]: TRegistroC165 read GetItem write SetItem;
  end;

  /// Registro C170 - ITENS DO DOCUMENTO (C�DIGO 01, 1B, 04 e 55)

  TRegistroC170 = class(TPersistent)
  private
    fNUM_ITEM: AnsiString;            /// N�mero seq�encial do item no documento fiscal
    fCOD_ITEM: AnsiString;            /// C�digo do item (campo 02 do Registro 0200)
    fDESCR_COMPL: AnsiString;         /// Descri��o complementar do item como adotado no documento fiscal
    fQTD: Double;                     /// Quantidade do item
    fUNID: AnsiString;                /// Unidade do item(Campo 02 do registro 0190)
    fVL_ITEM: currency;               /// Valor total do item
    fVL_DESC: currency;               /// Valor do desconto comercial
    fIND_MOV: AnsiString;             /// Movimenta��o f�sica do ITEM/PRODUTO: 0 - SIM; 1- N�O
    fCST_ICMS: AnsiString;            /// C�digo da Situa��o Tribut�ria referente ao ICMS, conforme a Tabela indicada no item 4.3.1
    fCFOP: AnsiString;                /// C�digo Fiscal de Opera��o e Presta��o
    fCOD_NAT: AnsiString;             /// C�digo da natureza da opera��o (campo 02 do Registro 0400)
    fVL_BC_ICMS: currency;            /// Valor da base de c�lculo do ICMS
    fALIQ_ICMS: currency;             /// Al�quota do ICMS
    fVL_ICMS: currency;               /// Valor do ICMS creditado/debitado
    fVL_BC_ICMS_ST: currency;         /// Valor da base de c�lculo referente � substitui��o tribut�ria
    fALIQ_ST: currency;               /// Al�quota do ICMS da substitui��o tribut�ria na unidade da federa��o de destino
    fVL_ICMS_ST: currency;            /// Valor do ICMS referente � substitui��o tribut�ria
    fIND_APUR: AnsiString;            /// Indicador de per�odo de apura��o do IPI: 0 - Mensal; 1 - Decendial
    fCST_IPI: AnsiString;             /// C�digo da Situa��o Tribut�ria referente ao IPI, conforme a Tabela indicada no item 4.3.2.
    fCOD_ENQ: AnsiString;             /// C�digo de enquadramento legal do IPI, conforme tabela indicada no item 4.5.3.
    fVL_BC_IPI: currency;             /// Valor da base de c�lculo do IPI
    fALIQ_IPI: currency;              /// Al�quota do IPI
    fVL_IPI: currency;                /// Valor do IPI creditado/debitado
    fCST_PIS: AnsiString;             /// C�digo da Situa��o Tribut�ria referente ao PIS.
    fVL_BC_PIS: currency;             /// Valor da base de c�lculo do PIS
    fALIQ_PIS_PERC: currency;         /// Al�quota do PIS (em percentual)
    fQUANT_BC_PIS: Double;            /// Quantidade - Base de c�lculo PIS
    fALIQ_PIS_R: Double;              /// Al�quota do PIS (em reais)
    fVL_PIS: currency;                /// Valor do PIS
    fCST_COFINS: AnsiString;          /// C�digo da Situa��o Tribut�ria referente ao COFINS.
    fVL_BC_COFINS: currency;          /// Valor da base de c�lculo da COFINS
    fALIQ_COFINS_PERC: currency;      /// Al�quota do COFINS (em percentual)
    fQUANT_BC_COFINS: Double;       /// Quantidade - Base de c�lculo COFINS
    fALIQ_COFINS_R: Double;           /// Al�quota da COFINS (em reais)
    fVL_COFINS: currency;             /// Valor da COFINS
    fCOD_CTA: AnsiString;             /// C�digo da conta anal�tica cont�bil debitada/creditada

    FRegistroC171: TRegistroC171List;  /// BLOCO C - Lista de RegistroC141 (FILHO fo FILHO)
    FRegistroC172: TRegistroC172List;  /// BLOCO C - Lista de RegistroC141 (FILHO fo FILHO)
    FRegistroC173: TRegistroC173List;  /// BLOCO C - Lista de RegistroC141 (FILHO fo FILHO)
    FRegistroC174: TRegistroC174List;  /// BLOCO C - Lista de RegistroC141 (FILHO fo FILHO)
    FRegistroC175: TRegistroC175List;  /// BLOCO C - Lista de RegistroC141 (FILHO fo FILHO)
    FRegistroC176: TRegistroC176List;  /// BLOCO C - Lista de RegistroC141 (FILHO fo FILHO)
    FRegistroC177: TRegistroC177List;  /// BLOCO C - Lista de RegistroC141 (FILHO fo FILHO)
    FRegistroC178: TRegistroC178List;  /// BLOCO C - Lista de RegistroC141 (FILHO fo FILHO)
    FRegistroC179: TRegistroC179List;  /// BLOCO C - Lista de RegistroC141 (FILHO fo FILHO)
  public
    constructor Create; virtual; /// Create
    destructor Destroy; override; /// Destroy

    property NUM_ITEM: AnsiString       read FNUM_ITEM         write FNUM_ITEM;
    property COD_ITEM: AnsiString       read FCOD_ITEM         write FCOD_ITEM;
    property DESCR_COMPL: AnsiString    read FDESCR_COMPL      write FDESCR_COMPL;
    property QTD: Double                read FQTD              write FQTD;
    property UNID: AnsiString           read FUNID             write FUNID;
    property VL_ITEM: currency          read FVL_ITEM          write FVL_ITEM;
    property VL_DESC: currency          read FVL_DESC          write FVL_DESC;
    property IND_MOV: AnsiString        read FIND_MOV          write FIND_MOV;
    property CST_ICMS: AnsiString       read FCST_ICMS         write FCST_ICMS;
    property CFOP: AnsiString           read FCFOP             write FCFOP;
    property COD_NAT: AnsiString        read FCOD_NAT          write FCOD_NAT;
    property VL_BC_ICMS: currency       read FVL_BC_ICMS       write FVL_BC_ICMS;
    property ALIQ_ICMS: currency        read FALIQ_ICMS        write FALIQ_ICMS;
    property VL_ICMS: currency          read FVL_ICMS          write FVL_ICMS;
    property VL_BC_ICMS_ST: currency    read FVL_BC_ICMS_ST    write FVL_BC_ICMS_ST;
    property ALIQ_ST: currency          read FALIQ_ST          write FALIQ_ST;
    property VL_ICMS_ST: currency       read FVL_ICMS_ST       write FVL_ICMS_ST;
    property IND_APUR: AnsiString       read FIND_APUR         write FIND_APUR;
    property CST_IPI: AnsiString        read FCST_IPI          write FCST_IPI;
    property COD_ENQ: AnsiString        read FCOD_ENQ          write FCOD_ENQ;
    property VL_BC_IPI: currency        read FVL_BC_IPI        write FVL_BC_IPI;
    property ALIQ_IPI: currency         read FALIQ_IPI         write FALIQ_IPI;
    property VL_IPI: currency           read FVL_IPI           write FVL_IPI;
    property CST_PIS: AnsiString        read FCST_PIS          write FCST_PIS;
    property VL_BC_PIS: currency        read FVL_BC_PIS        write FVL_BC_PIS;
    property ALIQ_PIS_PERC: currency    read FALIQ_PIS_PERC    write FALIQ_PIS_PERC;
    property QUANT_BC_PIS: Double       read FQUANT_BC_PIS     write FQUANT_BC_PIS;
    property ALIQ_PIS_R: Double         read FALIQ_PIS_R       write FALIQ_PIS_R;
    property VL_PIS: currency           read FVL_PIS           write FVL_PIS;
    property CST_COFINS: AnsiString     read FCST_COFINS       write FCST_COFINS;
    property VL_BC_COFINS: currency     read FVL_BC_COFINS     write FVL_BC_COFINS;
    property ALIQ_COFINS_PERC: currency read FALIQ_COFINS_PERC write FALIQ_COFINS_PERC;
    property QUANT_BC_COFINS: Double    read FQUANT_BC_COFINS  write FQUANT_BC_COFINS;
    property ALIQ_COFINS_R: Double      read FALIQ_COFINS_R    write FALIQ_COFINS_R;
    property VL_COFINS: currency        read FVL_COFINS        write FVL_COFINS;
    property COD_CTA: AnsiString        read FCOD_CTA          write FCOD_CTA;
    /// Registros FILHOS
    property RegistroC171: TRegistroC171List read FRegistroC171 write FRegistroC171;
    property RegistroC172: TRegistroC172List read FRegistroC172 write FRegistroC172;
    property RegistroC173: TRegistroC173List read FRegistroC173 write FRegistroC173;
    property RegistroC174: TRegistroC174List read FRegistroC174 write FRegistroC174;
    property RegistroC175: TRegistroC175List read FRegistroC175 write FRegistroC175;
    property RegistroC176: TRegistroC176List read FRegistroC176 write FRegistroC176;
    property RegistroC177: TRegistroC177List read FRegistroC177 write FRegistroC177;
    property RegistroC178: TRegistroC178List read FRegistroC178 write FRegistroC178;
    property RegistroC179: TRegistroC179List read FRegistroC179 write FRegistroC179;
  end;

  /// Registro C170 - Lista

  TRegistroC170List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC170; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC170); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC170;
    property Items[Index: Integer]: TRegistroC170 read GetItem write SetItem;
  end;

  /// Registro C171 - ARMAZENAMENTO DE COMBUSTIVEIS (c�digo 01, 55)

  TRegistroC171 = class(TPersistent)
  private
    fNUM_TANQUE: AnsiString;    /// Tanque onde foi armazenado o combust�vel
    fQTDE: Double;        /// Quantidade ou volume armazenado
  public
    property NUM_TANQUE: AnsiString read FNUM_TANQUE write FNUM_TANQUE;
    property QTDE: Double read FQTDE write FQTDE;
  end;

  /// Registro C171 - Lista

  TRegistroC171List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC171; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC171); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC171;
    property Items[Index: Integer]: TRegistroC171 read GetItem write SetItem;
  end;

  /// Registro C172 - OPERA��ES COM ISSQN (C�DIGO 01)

  TRegistroC172 = class(TPersistent)
  private
    fVL_BC_ISSQN: currency;    /// Valor da base de c�lculo do ISSQN
    fALIQ_ISSQN: currency;     /// Al�quota do ISSQN
    fVL_ISSQN: currency;       /// Valor do ISSQN
  public
    property VL_BC_ISSQN: currency read FVL_BC_ISSQN write FVL_BC_ISSQN;
    property ALIQ_ISSQN: currency read FALIQ_ISSQN write FALIQ_ISSQN;
    property VL_ISSQN: currency read FVL_ISSQN write FVL_ISSQN;
  end;

  /// Registro C172 - Lista

  TRegistroC172List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC172; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC172); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC172;
    property Items[Index: Integer]: TRegistroC172 read GetItem write SetItem;
  end;

  /// Registro C173 - OPERA��ES COM MEDICAMENTOS (C�DIGO 01, 55)

  TRegistroC173 = class(TPersistent)
  private
    fLOTE_MED: AnsiString;      /// N�mero do lote de fabrica��o do medicamento
    fQTD_ITEM: Double;    /// Quantidade de item por lote
    fDT_FAB: TDateTime;     /// Data de fabrica��o do medicamento
    fDT_VAL: TDateTime;     /// Data de expira��o da validade do medicamento
    fIND_MED: AnsiString;       /// Indicador de tipo de refer�ncia da base de c�lculo do ICMS (ST) do produto farmac�utico:
    fTP_PROD: AnsiString;       /// Tipo de produto:
    fVL_TAB_MAX: currency;  /// Valor do pre�o tabelado ou valor do pre�o m�ximo
  public
    property LOTE_MED: AnsiString read FLOTE_MED write FLOTE_MED;
    property QTD_ITEM: Double read FQTD_ITEM write FQTD_ITEM;
    property DT_FAB: TDateTime read FDT_FAB write FDT_FAB;
    property DT_VAL: TDateTime read FDT_VAL write FDT_VAL;
    property IND_MED: AnsiString read FIND_MED write FIND_MED;
    property TP_PROD: AnsiString read FTP_PROD write FTP_PROD;
    property VL_TAB_MAX: currency read FVL_TAB_MAX write FVL_TAB_MAX;
  end;

  /// Registro C173 - Lista

  TRegistroC173List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC173; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC173); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC173;
    property Items[Index: Integer]: TRegistroC173 read GetItem write SetItem;
  end;

  /// Registro C174 - OPERA��ES COM ARMAS DE FOGO (C�DIGO 01)

  TRegistroC174 = class(TPersistent)
  private
    fIND_ARM: AnsiString;       /// Indicador do tipo da arma de fogo: 0- Uso permitido; 1- Uso restrito
    fNUM_ARM: AnsiString;       /// Numera��o de s�rie de fabrica��o da arma
    fDESCR_COMPL: AnsiString;   /// Descri��o da arma, compreendendo: n�mero do cano, calibre, marca, capacidade de cartuchos, tipo de funcionamento, quantidade de canos, comprimento, tipo de alma, quantidade e sentido das raias e demais elementos que permitam sua perfeita identifica��o
  public
    property IND_ARM: AnsiString read FIND_ARM write FIND_ARM;
    property NUM_ARM: AnsiString read FNUM_ARM write FNUM_ARM;
    property DESCR_COMPL: AnsiString read FDESCR_COMPL write FDESCR_COMPL;
  end;

  /// Registro C174 - Lista

  TRegistroC174List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC174; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC174); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC174;
    property Items[Index: Integer]: TRegistroC174 read GetItem write SetItem;
  end;

  /// Registro C175 - OPERA��ES COM VE�CULOS NOVOS (C�DIGO 01, 55)

  TRegistroC175 = class(TPersistent)
  private
    fIND_VEIC_OPER: AnsiString; /// Indicador do tipo de opera��o com ve�culo: 0- Venda para concession�ria; 1- Faturamento direto; 2- Venda direta; 3- Venda da concession�ria; 9- Outros
    fCNPJ: AnsiString;          /// CNPJ da Concession�ria
    fUF: AnsiString;            /// Sigla da unidade da federa��o da Concession�ria
    fCHASSI_VEIC: AnsiString;   /// Chassi do ve�culo
  public
    property IND_VEIC_OPER: AnsiString read FIND_VEIC_OPER write FIND_VEIC_OPER;
    property CNPJ: AnsiString read FCNPJ write FCNPJ;
    property UF: AnsiString read FUF write FUF;
    property CHASSI_VEIC: AnsiString read FCHASSI_VEIC write FCHASSI_VEIC;
  end;

  /// Registro C175 - Lista

  TRegistroC175List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC175; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC175); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC175;
    property Items[Index: Integer]: TRegistroC175 read GetItem write SetItem;
  end;

  /// Registro C176 - RESSARCIMENTO DE ICMS EM OPERA��ES COM SUBSTITUI��O TRIBUT�RIA (C�DIGO 01,55)

  TRegistroC176 = class(TPersistent)
  private
    fCOD_MOD_ULT_E: AnsiString;    /// C�digo do modelo do documento fiscal relativa a �ltima entrada
    fNUM_DOC_ULT_E: AnsiString;    /// N�mero do documento fiscal relativa a �ltima entrada
    fSER_ULT_E: AnsiString;        /// S�rie do documento fiscal relativa a �ltima entrada
    fDT_ULT_E: TDateTime;      /// Data relativa a �ltima entrada da mercadoria
    fCOD_PART_ULT_E: AnsiString;   /// C�digo do participante (do emitente do documento relativa a �ltima entrada)
    fQUANT_ULT_E: Double;    /// Quantidade do item relativa a �ltima entrada
    fVL_UNIT_ULT_E: Double;  /// Valor unit�rio da mercadoria constante na NF relativa a �ltima entrada inclusive despesas acess�rias.
    fVL_UNIT_BC_ST: Double;  /// Valor unit�rio da base de c�lculo do imposto pago por substitui��o.
  public
    property COD_MOD_ULT_E: AnsiString read FCOD_MOD_ULT_E write FCOD_MOD_ULT_E;
    property NUM_DOC_ULT_E: AnsiString read FNUM_DOC_ULT_E write FNUM_DOC_ULT_E;
    property SER_ULT_E: AnsiString read FSER_ULT_E write FSER_ULT_E;
    property DT_ULT_E: TDateTime read FDT_ULT_E write FDT_ULT_E;
    property COD_PART_ULT_E: AnsiString read FCOD_PART_ULT_E write FCOD_PART_ULT_E;
    property QUANT_ULT_E: Double read FQUANT_ULT_E write FQUANT_ULT_E;
    property VL_UNIT_ULT_E: Double read FVL_UNIT_ULT_E write FVL_UNIT_ULT_E;
    property VL_UNIT_BC_ST: Double read FVL_UNIT_BC_ST write FVL_UNIT_BC_ST;
  end;

  /// Registro C176 - Lista

  TRegistroC176List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC176; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC176); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC176;
    property Items[Index: Integer]: TRegistroC176 read GetItem write SetItem;
  end;

  /// Registro C177 - OPERA��ES COM PRODUTOS SUJEITOS A SELO DE CONTROLE IPI.

  TRegistroC177 = class(TPersistent)
  private
    fCOD_SELO_IPI: AnsiString;  /// C�digo do selo de controle do IPI, conforme Tabela 4.5.2
    fQT_SELO_IPI: currency; /// Quantidade de selo de controle do IPI aplicada
  public
    property COD_SELO_IPI: AnsiString read FCOD_SELO_IPI write FCOD_SELO_IPI;
    property QT_SELO_IPI: currency read FQT_SELO_IPI write FQT_SELO_IPI;
  end;

  /// Registro C177 - Lista

  TRegistroC177List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC177; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC177); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC177;
    property Items[Index: Integer]: TRegistroC177 read GetItem write SetItem;
  end;

  /// Registro C178 - OPERA��ES COM PRODUTOS SUJEITOS A TRIBUTA��O DE IPI POR UNIDADE OU QUANTIDADE DE PRODUTO.

  TRegistroC178 = class(TPersistent)
  private
    fCL_ENQ: AnsiString;        /// C�digo da classe de enquadramento do IPI, conforme Tabela 4.5.1.
    fVL_UNID: currency;     /// Valor por unidade padr�o de tributa��o
    fQUANT_PAD: Double;   /// Quantidade total de produtos na unidade padr�o de tributa��o
  public
    property CL_ENQ: AnsiString read FCL_ENQ write FCL_ENQ;
    property VL_UNID: currency read FVL_UNID write FVL_UNID;
    property QUANT_PAD: Double read FQUANT_PAD write FQUANT_PAD;
  end;

  /// Registro C178 - Lista

  TRegistroC178List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC178; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC178); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC178;
    property Items[Index: Integer]: TRegistroC178 read GetItem write SetItem;
  end;

  /// Registro C179 - INFORMA��ES COMPLEMENTARES ST (C�DIGO 01)

  TRegistroC179 = class(TPersistent)
  private
    fBC_ST_ORIG_DEST: currency;   /// Valor da base de c�lculo ST na origem/destino em opera��es interestaduais.
    fICMS_ST_REP: currency;       /// Valor do ICMS-ST a repassar/deduzir em opera��es interestaduais
    fICMS_ST_COMPL: currency;     /// Valor do ICMS-ST a complementar � UF de destino
    fBC_RET: currency;            /// Valor da BC de reten��o em remessa promovida por Substitu�do intermedi�rio
    fICMS_RET: currency;          /// Valor da parcela do imposto retido em remessa promovida por substitu�do intermedi�rio
  public
    property BC_ST_ORIG_DEST: currency read FBC_ST_ORIG_DEST write FBC_ST_ORIG_DEST;
    property ICMS_ST_REP: currency read FICMS_ST_REP write FICMS_ST_REP;
    property ICMS_ST_COMPL: currency read FICMS_ST_COMPL write FICMS_ST_COMPL;
    property BC_RET: currency read FBC_RET write FBC_RET;
    property ICMS_RET: currency read FICMS_RET write FICMS_RET;
  end;

  /// Registro C179 - Lista

  TRegistroC179List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC179; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC179); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC179;
    property Items[Index: Integer]: TRegistroC179 read GetItem write SetItem;
  end;

  /// Registro C190 - REGISTRO ANAL�TICO DO DOCUMENTO (C�DIGO 01, 1B, 04 E 55)

  TRegistroC190 = class(TPersistent)
  private
    fCST_ICMS: AnsiString;         /// C�digo da Situa��o Tribut�ria, conforme a Tabela indicada no item 4.3.1
    fCFOP: AnsiString;             /// C�digo Fiscal de Opera��o e Presta��o do agrupamento de itens
    fALIQ_ICMS: currency;      /// Al�quota do ICMS
    fVL_OPR: currency;         /// Valor da opera��o correspondente � combina��o de CST_ICMS, CFOP, e al�quota do ICMS, inclu�das as despesas acess�rias (frete, seguros e outras despesas acess�rias)  e IPI
    fVL_BC_ICMS: currency;     /// Parcela correspondente ao "Valor da base de c�lculo do ICMS" referente � combina��o de CST_ICMS, CFOP e al�quota do ICMS.
    fVL_ICMS: currency;        /// Parcela correspondente ao "Valor do ICMS" referente � combina��o de CST_ICMS, CFOP e al�quota do ICMS.
    fVL_BC_ICMS_ST: currency;  /// Parcela correspondente ao "Valor da base de c�lculo do ICMS" da substitui��o tribut�ria referente � combina��o de CST_ICMS, CFOP e al�quota do ICMS.
    fVL_ICMS_ST: currency;     /// Parcela correspondente ao valor creditado/debitado do ICMS da substitui��o tribut�ria, referente � combina��o de CST_ICMS, CFOP, e al�quota do ICMS.
    fVL_RED_BC: currency;      /// Valor n�o tributado em fun��o da redu��o da base de c�lculo do ICMS, referente � combina��o de CST_ICMS, CFOP e al�quota do ICMS.
    fVL_IPI: currency;         /// Parcela correspondente ao "Valor do IPI" referente � combina��o CST_ICMS, CFOP e al�quota do ICMS.
    fCOD_OBS: AnsiString;          /// C�digo da observa��o do lan�amento fiscal (campo 02 do Registro 0460
  public
    property CST_ICMS: AnsiString read FCST_ICMS write FCST_ICMS;
    property CFOP: AnsiString read FCFOP write FCFOP;
    property ALIQ_ICMS: currency read FALIQ_ICMS write FALIQ_ICMS;
    property VL_OPR: currency read FVL_OPR write FVL_OPR;
    property VL_BC_ICMS: currency read FVL_BC_ICMS write FVL_BC_ICMS;
    property VL_ICMS: currency read FVL_ICMS write FVL_ICMS;
    property VL_BC_ICMS_ST: currency read FVL_BC_ICMS_ST write FVL_BC_ICMS_ST;
    property VL_ICMS_ST: currency read FVL_ICMS_ST write FVL_ICMS_ST;
    property VL_RED_BC: currency read FVL_RED_BC write FVL_RED_BC;
    property VL_IPI: currency read FVL_IPI write FVL_IPI;
    property COD_OBS: AnsiString read FCOD_OBS write FCOD_OBS;

  end;

  /// Registro C190 - Lista

  TRegistroC190List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC190; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC190); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC190;
    property Items[Index: Integer]: TRegistroC190 read GetItem write SetItem;
  end;

  /// Registro C195 - OBSERVA�OES DO LAN�AMENTO FISCAL (C�DIGO 01, 1B E 55)

  TRegistroC195 = class(TPersistent)
  private
    fCOD_OBS: AnsiString;    /// C�digo da observa��o do lan�amento fiscal (campo 02 do Registro 0460)
    fTXT_COMPL: AnsiString;  /// Descri��o complementar do c�digo de observa��o.
  public
    property COD_OBS: AnsiString read FCOD_OBS write FCOD_OBS;
    property TXT_COMPL: AnsiString read FTXT_COMPL write FTXT_COMPL;
  end;

  /// Registro C195 - Lista

  TRegistroC195List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC195; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC195); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC195;
    property Items[Index: Integer]: TRegistroC195 read GetItem write SetItem;
  end;

  /// Registro C197 - OUTRAS OBRIGA��ES TRIBUT�RIAS, AJUSTES E INFORMA��ES DE VALORES PROVENIENTES DE DOCUMENTO FISCAL.

  TRegistroC197 = class(TPersistent)
  private
    fCOD_AJ: AnsiString;           /// C�digo do ajustes/benef�cio/incentivo, conforme tabela indicada no item 5.3.
    fDESCR_COMPL_AJ: AnsiString;   /// Descri��o complementar do ajuste da apura��o, nos casos em que o c�digo da tabela for �9999�
    fCOD_ITEM: AnsiString;         /// C�digo do item (campo 02 do Registro 0200)
    fVL_BC_ICMS: currency;     /// Base de c�lculo do ICMS ou do ICMS ST
    fALIQ_ICMS: currency;      /// Al�quota do ICMS
    fVL_ICMS: currency;        /// Valor do ICMS ou do ICMS ST
    fVL_OUTROS: currency;      /// Outros valores
  public
    property COD_AJ: AnsiString read FCOD_AJ write FCOD_AJ;
    property DESCR_COMPL_AJ: AnsiString read FDESCR_COMPL_AJ write FDESCR_COMPL_AJ;
    property COD_ITEM: AnsiString read FCOD_ITEM write FCOD_ITEM;
    property VL_BC_ICMS: currency read FVL_BC_ICMS write FVL_BC_ICMS;
    property ALIQ_ICMS: currency read FALIQ_ICMS write FALIQ_ICMS;
    property VL_ICMS: currency read FVL_ICMS write FVL_ICMS;
    property VL_OUTROS: currency read FVL_OUTROS write FVL_OUTROS;
  end;

  /// Registro C197 - Lista

  TRegistroC197List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC197; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC197); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC197;
    property Items[Index: Integer]: TRegistroC197 read GetItem write SetItem;
  end;

  /// Registro C300 - RESUMO DI�RIO DAS NOTAS FISCAIS DE VENDA A CONSUMIDOR (C�DIGO 02)

  TRegistroC300 = class(TPersistent)
  private
    fCOD_MOD: AnsiString; /// C�digo do modelo do documento fiscal, conforme a Tabela 4.1.1
    fSER: AnsiString; /// S�rie do documento fiscal
    fSUB: AnsiString; /// Subs�rie do documento fiscal
    fNUM_DOC_INI: AnsiString; /// N�mero do documento fiscal inicial
    fNUM_DOC_FIN: AnsiString; /// N�mero do documento fiscal final
    fDT_DOC: TDateTime; /// Data da emiss�o dos documentos fiscais
    fVL_DOC: currency; /// Valor total dos documentos
    fVL_PIS: currency; /// Valor total do PIS
    fVL_COFINS: currency; /// Valor total da COFINS
    fCOD_CTA: AnsiString; /// C�digo da conta anal�tica cont�bil debitada/creditada
  public
    property COD_MOD: AnsiString read fCOD_MOD write fCOD_MOD;
    property SER: AnsiString read fSER write fSER;
    property SUB: AnsiString read fSUB write fSUB;
    property NUM_DOC_INI: AnsiString read fNUM_DOC_INI write fNUM_DOC_INI;
    property NUM_DOC_FIN: AnsiString read fNUM_DOC_FIN write fNUM_DOC_FIN;
    property DT_DOC: TDateTime read fDT_DOC write fDT_DOC;
    property VL_DOC: currency read fVL_DOC write fVL_DOC;
    property VL_PIS: currency read fVL_PIS write fVL_PIS;
    property VL_COFINS: currency read fVL_COFINS write fVL_COFINS;
    property COD_CTA: AnsiString read fCOD_CTA write fCOD_CTA;
  end;

  /// Registro C300 - Lista

  TRegistroC300List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC300; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC300); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC300;
    property Items[Index: Integer]: TRegistroC300 read GetItem write SetItem;
  end;

  /// Registro C310 - DOCUMENTOS CANCELADOS DE NOTAS FISCAIS DE VENDA A CONSUMIDOR (C�DIGO 02)

  TRegistroC310 = class(TPersistent)
  private
    fNUM_DOC_CANC: AnsiString; /// N�mero do documento fiscal cancelado
  public
    property NUM_DOC_CANC: AnsiString read fNUM_DOC_CANC write fNUM_DOC_CANC;
  end;

  /// Registro C310 - Lista

  TRegistroC310List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC310; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC310); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC310;
    property Items[Index: Integer]: TRegistroC310 read GetItem write SetItem;
  end;

  /// Registro C320 - REGISTRO ANAL�TICO DO RESUMO DI�RIO DAS NOTAS FISCAIS DE VENDA A CONSUMIDOR (C�DIGO 02)

  TRegistroC320 = class(TPersistent)
  private
    fCST_ICMS: AnsiString;     /// C�digo da Situa��o Tribut�ria, conforme a Tabela indicada no item 4.3.1
    fCFOP: AnsiString;         /// C�digo Fiscal de Opera��o e Presta��o
    fALIQ_ICMS: Currency;  /// Al�quota do ICMS
    fVL_OPR: currency;     /// Valor total acumulado das opera��es correspondentes � combina��o de CST_ICMS, CFOP e al�quota do ICMS, inclu�das as despesas acess�rias e acr�scimos.
    fVL_BC_ICMS: currency; /// Valor acumulado da base de c�lculo do ICMS, referente � combina��o de CST_ICMS, CFOP, e al�quota do ICMS.
    fVL_ICMS: currency;    /// Valor acumulado do ICMS, referente � combina��o de CST_ICMS, CFOP e al�quota do ICMS.
    fVL_RED_BC: currency;  /// Valor n�o tributado em fun��o da redu��o da base de c�lculo do ICMS, referente � combina��o de CST_ICMS, CFOP, e al�quota do ICMS.
    fCOD_OBS: AnsiString;      /// C�digo da observa��o do lan�amento fiscal (campo 02 do Registro 0460)
  public
    property CST_ICMS: AnsiString read fCST_ICMS write fCST_ICMS;
    property CFOP: AnsiString read fCFOP write fCFOP;
    property ALIQ_ICMS: Currency read fALIQ_ICMS write fALIQ_ICMS;
    property VL_OPR: currency read fVL_OPR write fVL_OPR;
    property VL_BC_ICMS: currency read fVL_BC_ICMS write fVL_BC_ICMS;
    property VL_ICMS: currency read fVL_ICMS write fVL_ICMS;
    property VL_RED_BC: currency read fVL_RED_BC write fVL_RED_BC;
    property COD_OBS: AnsiString read fCOD_OBS write fCOD_OBS;
  end;

  /// Registro C320 - Lista

  TRegistroC320List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC320; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC320); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC320;
    property Items[Index: Integer]: TRegistroC320 read GetItem write SetItem;
  end;

  /// Registro C321 - ITENS DO RESUMO DI�RIO DOS DOCUMENTOS (C�DIGO 02)

  TRegistroC321 = class(TPersistent)
  private
    fCOD_ITEM: AnsiString;     /// C�digo do item (campo 02 do Registro 0200)
    fQTD: Double;              /// Quantidade acumulada do item
    fUNID: AnsiString;         /// Unidade do item (Campo 02 do registro 0190)
    fVL_ITEM: currency;        /// Valor acumulado do item
    fVL_DESC: currency;        /// Valor do desconto acumulado
    fVL_BC_ICMS: currency;     /// Valor acumulado da base de c�lculo do ICMS
    fVL_ICMS: currency;        /// Valor acumulado do ICMS debitado
    fVL_PIS: currency;         /// Valor acumulado do PIS
    fVL_COFINS: currency;      /// Valor acumulado da COFINS
  public
    property COD_ITEM: AnsiString read FCOD_ITEM write FCOD_ITEM;
    property QTD: Double read FQTD write FQTD;
    property UNID: AnsiString read FUNID write FUNID;
    property VL_ITEM: currency read FVL_ITEM write FVL_ITEM;
    property VL_DESC: currency read FVL_DESC write FVL_DESC;
    property VL_BC_ICMS: currency read FVL_BC_ICMS write FVL_BC_ICMS;
    property VL_ICMS: currency read FVL_ICMS write FVL_ICMS;
    property VL_PIS: currency read FVL_PIS write FVL_PIS;
    property VL_COFINS: currency read FVL_COFINS write FVL_COFINS;
  end;

  /// Registro C321 - Lista

  TRegistroC321List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC321; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC321); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC321;
    property Items[Index: Integer]: TRegistroC321 read GetItem write SetItem;
  end;

  /// Registro C350 - NOTA FISCAL DE VENDA A CONSUMIDOR (C�DIGO 02)

  TRegistroC350 = class(TPersistent)
  private
    fSER: AnsiString;           /// S�rie do documento fiscal
    fSUB_SER: AnsiString;       /// Subs�rie do documento fiscal
    fNUM_DOC: AnsiString;       /// N�mero do documento fiscal
    fDT_DOC: TDateTime;     /// Data da emiss�o do documento fiscal
    fCNPJ_CPF: AnsiString;      /// CNPJ ou CPF do destinat�rio
    fVL_MERC: currency;     /// Valor das mercadorias constantes no documento fiscal
    fVL_DOC: currency;      /// Valor total do documento fiscal
    fVL_DESC: currency;     /// Valor total do desconto
    fVL_PIS: currency;      /// Valor total do PIS
    fVL_COFINS: currency;   /// Valor total da COFINS
    fCOD_CTA: AnsiString;       /// C�digo da conta anal�tica cont�bil debitada/creditada

    FRegistroC370: TRegistroC370List;  /// BLOCO C - Lista de RegistroC370 (FILHO)
    FRegistroC390: TRegistroC390List;  /// BLOCO C - Lista de RegistroC390 (FILHO)
  public
    constructor Create; virtual; /// Create
    destructor Destroy; override; /// Destroy

    property SER: AnsiString read FSER write FSER;
    property SUB_SER: AnsiString read FSUB_SER write FSUB_SER;
    property NUM_DOC: AnsiString read FNUM_DOC write FNUM_DOC;
    property DT_DOC: TDateTime read FDT_DOC write FDT_DOC;
    property CNPJ_CPF: AnsiString read FCNPJ_CPF write FCNPJ_CPF;
    property VL_MERC: currency read FVL_MERC write FVL_MERC;
    property VL_DOC: currency read FVL_DOC write FVL_DOC;
    property VL_DESC: currency read FVL_DESC write FVL_DESC;
    property VL_PIS: currency read FVL_PIS write FVL_PIS;
    property VL_COFINS: currency read FVL_COFINS write FVL_COFINS;
    property COD_CTA: AnsiString read FCOD_CTA write FCOD_CTA;

    property RegistroC370: TRegistroC370List read FRegistroC370 write FRegistroC370;
    property RegistroC390: TRegistroC390List read FRegistroC390 write FRegistroC390;
  end;

  /// Registro C350 - Lista

  TRegistroC350List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC350; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC350); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC350;
    property Items[Index: Integer]: TRegistroC350 read GetItem write SetItem;
  end;

  /// Registro C370 - ITENS DO DOCUMENTO (C�DIGO 02)

  TRegistroC370 = class(TPersistent)
  private
    fNUM_ITEM: AnsiString;   /// N�mero seq�encial do item no documento fiscal
    fCOD_ITEM: AnsiString;   /// C�digo do Item (campo 02 do registro 0200)
    fQTD: Double;            /// Quantidade do item
    fUNID: AnsiString;       /// Unidade do item (campo 02 do registro 0190)
    fVL_ITEM: currency;      /// Valor total do item
    fVL_DESC: currency;      /// Valor total do desconto no item
  public
    property NUM_ITEM: AnsiString read FNUM_ITEM write FNUM_ITEM;
    property COD_ITEM: AnsiString read FCOD_ITEM write FCOD_ITEM;
    property QTD: Double read FQTD write FQTD;
    property UNID: AnsiString read FUNID write FUNID;
    property VL_ITEM: currency read FVL_ITEM write FVL_ITEM;
    property VL_DESC: currency read FVL_DESC write FVL_DESC;
  end;

  /// Registro C370 - Lista

  TRegistroC370List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC370; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC370); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC370;
    property Items[Index: Integer]: TRegistroC370 read GetItem write SetItem;
  end;

  /// Registro C390 - REGISTRO ANAL�TICO DAS NOTAS FISCAIS DE VENDA A CONSUMIDOR (C�DIGO 02)

  TRegistroC390 = class(TPersistent)
  private
    fCST_ICMS: AnsiString;         /// C�digo da Situa��o Tribut�ria, conforme a Tabela indicada no item 4.3.1
    fCFOP: AnsiString;             /// C�digo Fiscal de Opera��o e Presta��o
    fALIQ_ICMS: currency;      /// Al�quota do ICMS
    fVL_OPR: currency;         /// Valor total acumulado das opera��es correspondentes � combina��o de CST_ICMS, CFOP e al�quota do ICMS, inclu�das as despesas acess�rias e acr�scimos.
    fVL_BC_ICMS: currency;     /// Valor acumulado da base de c�lculo do ICMS, referente � combina��o de CST_ICMS, CFOP, e al�quota do ICMS.
    fVL_ICMS: currency;        /// Valor acumulado do ICMS, referente � combina��o de CST_ICMS, CFOP e al�quota do ICMS.
    fVL_RED_BC: currency;      /// Valor n�o tributado em fun��o da redu��o da base de c�lculo do ICMS, referente � combina��o de CST_ICMS, CFOP, e al�quota do ICMS.
    fCOD_OBS: AnsiString;          /// C�digo da observa��o do lan�amento fiscal (campo 02 do Registro 0460)
  public
    property CST_ICMS: AnsiString read FCST_ICMS write FCST_ICMS;
    property CFOP: AnsiString read FCFOP write FCFOP;
    property ALIQ_ICMS: currency read FALIQ_ICMS write FALIQ_ICMS;
    property VL_OPR: currency read FVL_OPR write FVL_OPR;
    property VL_BC_ICMS: currency read FVL_BC_ICMS write FVL_BC_ICMS;
    property VL_ICMS: currency read FVL_ICMS write FVL_ICMS;
    property VL_RED_BC: currency read FVL_RED_BC write FVL_RED_BC;
    property COD_OBS: AnsiString read FCOD_OBS write FCOD_OBS;
  end;

  /// Registro C390 - Lista

  TRegistroC390List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC390; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC390); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC390;
    property Items[Index: Integer]: TRegistroC390 read GetItem write SetItem;
  end;

  /// Registro C400 - EQUIPAMENTO ECF (C�DIGO 02 E 2D)

  TRegistroC400 = class(TPersistent)
  private
    fCOD_MOD: AnsiString; /// C�digo do modelo do documento fiscal, conforme a Tabela 4.1.1
    fECF_MOD: AnsiString; /// Modelo do equipamento
    fECF_FAB: AnsiString; /// N�mero de s�rie de fabrica��o do ECF
    fECF_CX: AnsiString;  /// N�mero do caixa atribu�do ao ECF

    FRegistroC405: TRegistroC405List;  /// BLOCO C - Lista de RegistroC405 (FILHO)
  public
    constructor Create; virtual; /// Create
    destructor Destroy; override; /// Destroy

    property COD_MOD: AnsiString read fCOD_MOD write fCOD_MOD;
    property ECF_MOD: AnsiString read fECF_MOD write fECF_MOD;
    property ECF_FAB: AnsiString read fECF_FAB write fECF_FAB;
    property ECF_CX: AnsiString read fECF_CX write fECF_CX;
    /// Registros FILHOS
    property RegistroC405: TRegistroC405List read FRegistroC405 write FRegistroC405;
  end;

  /// Registro C400 - Lista

  TRegistroC400List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC400; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC400); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC400;
    property Items[Index: Integer]: TRegistroC400 read GetItem write SetItem;
  end;

  /// Registro C405 - REDU��O Z (C�DIGO 02 E 2D)

  TRegistroC405 = class(TPersistent)
  private
    fDT_DOC: TDateTime;       /// Data do movimento a que se refere a Redu��o Z
    fCRO: integer;            /// Posi��o do Contador de Rein�cio de Opera��o
    fCRZ: integer;            /// Posi��o do Contador de Redu��o Z
    fNUM_COO_FIN: integer;    /// N�mero do Contador de Ordem de Opera��o do �ltimo documento emitido no dia. (N�mero do COO na Redu��o Z)
    fGT_FIN: currency;        /// Valor do Grande Total final
    fVL_BRT: currency;        /// Valor da venda bruta

    FRegistroC410: TRegistroC410List;  /// BLOCO C - Lista de RegistroC410 (FILHO)
    FRegistroC420: TRegistroC420List;  /// BLOCO C - Lista de RegistroC420 (FILHO)
    FRegistroC460: TRegistroC460List;  /// BLOCO C - Lista de RegistroC460 (FILHO)
    FRegistroC490: TRegistroC490List;  /// BLOCO C - Lista de RegistroC490 (FILHO)
  public
    constructor Create; virtual; /// Create
    destructor Destroy; override; /// Destroy

    property DT_DOC: TDateTime read fDT_DOC write fDT_DOC;
    property CRO: integer read fCRO write fCRO;
    property CRZ: integer read fCRZ write fCRZ;
    property NUM_COO_FIN: integer read fNUM_COO_FIN write fNUM_COO_FIN;
    property GT_FIN: currency read fGT_FIN write fGT_FIN;
    property VL_BRT: currency read fVL_BRT write fVL_BRT;

    property RegistroC410: TRegistroC410List read FRegistroC410 write FRegistroC410;
    property RegistroC420: TRegistroC420List read FRegistroC420 write FRegistroC420;
    property RegistroC460: TRegistroC460List read FRegistroC460 write FRegistroC460;
    property RegistroC490: TRegistroC490List read FRegistroC490 write FRegistroC490;
  end;

  /// Registro C405 - Lista

  TRegistroC405List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC405; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC405); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC405;
    property Items[Index: Integer]: TRegistroC405 read GetItem write SetItem;
  end;

  /// Registro C410 - PIS E COFINS TOTALIZADOS NO DIA (C�DIGO 02 E 2D)

  TRegistroC410 = class(TPersistent)
  private
    fVL_PIS: currency;      /// 'Valor total do PIS
    fVL_COFINS: currency;   /// 'Valor total da COFINS
  public
    property VL_PIS: currency read FVL_PIS write FVL_PIS;
    property VL_COFINS: currency read FVL_COFINS write FVL_COFINS;
  end;

  /// Registro C410 - Lista

  TRegistroC410List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC410; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC410); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC410;
    property Items[Index: Integer]: TRegistroC410 read GetItem write SetItem;
  end;

  /// Registro C420 - REGISTRO DOS TOTALIZADORES PARCIAIS DA REDU��O Z (COD 02 E 2D)

  TRegistroC420 = class(TPersistent)
  private
    fCOD_TOT_PAR: AnsiString;     /// C�digo do totalizador, conforme Tabela 4.4.6
    fVLR_ACUM_TOT: currency;  /// Valor acumulado no totalizador, relativo � respectiva Redu��o Z.
    fNR_TOT: integer;         /// N�mero do totalizador quando ocorrer mais de uma situa��o com a mesma carga tribut�ria efetiva.
    fDESCR_NR_TOT: AnsiString;    /// Descri��o da situa��o tribut�ria relativa ao totalizador parcial, quando houver mais de um com a mesma carga tribut�ria efetiva.

    FRegistroC425: TRegistroC425List;  /// BLOCO C - Lista de RegistroC425 (FILHO)
  public
    constructor Create; virtual; /// Create
    destructor Destroy; override; /// Destroy

    property COD_TOT_PAR: AnsiString read fCOD_TOT_PAR write fCOD_TOT_PAR;
    property VLR_ACUM_TOT: currency read fVLR_ACUM_TOT write fVLR_ACUM_TOT;
    property NR_TOT: integer read fNR_TOT write fNR_TOT;
    property DESCR_NR_TOT: AnsiString read fDESCR_NR_TOT write fDESCR_NR_TOT;
    /// Registros FILHOS
    property RegistroC425: TRegistroC425List read FRegistroC425 write FRegistroC425;
  end;

  /// Registro C420 - Lista

  TRegistroC420List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC420; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC420); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC420;
    property Items[Index: Integer]: TRegistroC420 read GetItem write SetItem;
  end;

  /// Registro C425 - RESUMO DE ITENS DO MOVIMENTO DI�RIO (C�DIGO 02 E 2D)

  TRegistroC425 = class(TPersistent)
  private
    fCOD_ITEM: AnsiString;           /// C�digo do item (campo 02 do Registro 0200):
    fQTD: Double;              /// Quantidade acumulada do item:
    fUNID: AnsiString;               /// Unidade do item (Campo 02 do registro 0190)
    fVL_ITEM: currency;          /// Valor acumulado do item:
    fVL_PIS: currency;           /// Valor do PIS
    fVL_COFINS: currency;        /// Valor da COFINS
  public
    property COD_ITEM: AnsiString read FCOD_ITEM write FCOD_ITEM;
    property QTD: Double read FQTD write FQTD;
    property UNID: AnsiString read FUNID write FUNID;
    property VL_ITEM: currency read FVL_ITEM write FVL_ITEM;
    property VL_PIS: currency read fVL_PIS write fVL_PIS;
    property VL_COFINS: currency read fVL_COFINS write fVL_COFINS;
  end;

  /// Registro C425 - Lista

  TRegistroC425List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC425; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC425); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC425;
    property Items[Index: Integer]: TRegistroC425 read GetItem write SetItem;
  end;

  /// Registro C460 - DOCUMENTO FISCAL EMITIDO POR ECF (C�DIGO 02 E 2D)

  TRegistroC460 = class(TPersistent)
  private
    fCOD_MOD: AnsiString;   /// C�digo do modelo do documento fiscal, conforme a Tabela 4.1.1
    fCOD_SIT: AnsiString;   /// C�digo da situa��o do documento fiscal, conforme a Tabela 4.1.2
    fNUM_DOC: AnsiString;   /// N�mero do documento fiscal (COO)
    fDT_DOC: TDateTime;    /// Data da emiss�o do documento fiscal
    fVL_DOC: currency;     /// Valor total do documento fiscal
    fVL_PIS: currency;     /// Valor do PIS
    fVL_COFINS: currency;  /// Valor da COFINS
    fCPF_CNPJ: AnsiString;     /// CPF ou CNPJ do adquirente
    fNOM_ADQ: AnsiString;      /// Nome do adquirente

    FRegistroC470: TRegistroC470List;  /// BLOCO C - Lista de RegistroC110 (FILHO)
  public
    constructor Create; virtual; /// Create
    destructor Destroy; override; /// Destroy

    property COD_MOD: AnsiString read fCOD_MOD write fCOD_MOD;
    property COD_SIT: AnsiString read fCOD_SIT write fCOD_SIT;
    property NUM_DOC: AnsiString read fNUM_DOC write fNUM_DOC;
    property DT_DOC: TDateTime read fDT_DOC write fDT_DOC;
    property VL_DOC: currency read fVL_DOC write fVL_DOC;
    property VL_PIS: currency read fVL_PIS write fVL_PIS;
    property VL_COFINS: currency read fVL_COFINS write fVL_COFINS;
    property CPF_CNPJ: AnsiString read fCPF_CNPJ write fCPF_CNPJ;
    property NOM_ADQ: AnsiString read fNOM_ADQ write fNOM_ADQ;
    /// Registros FILHOS
    property RegistroC470: TRegistroC470List read FRegistroC470 write FRegistroC470;
  end;

  /// Registro C460 - Lista

  TRegistroC460List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC460; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC460); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC460;
    property Items[Index: Integer]: TRegistroC460 read GetItem write SetItem;
  end;

  /// Registro C470 - ITENS DO DOCUMENTO FISCAL EMITIDO POR ECF (C�DIGO 02 E 2D)

  TRegistroC470 = class(TPersistent)
  private
    fCOD_ITEM: AnsiString;       /// C�digo do item (campo 02 do Registro 0200):
    fQTD: Double;                /// Quantidade do item
    fQTD_CANC: Double;           /// Quantidade cancelada, no caso de cancelamento parcial de item
    fUNID: AnsiString;           /// Unidade do item (Campo 02 do registro 0190)
    fVL_ITEM: currency;          /// Valor do item:
    fCST_ICMS: AnsiString;       /// C�digo da Situa��o Tribut�ria, conforme a Tabela indicada no item 4.3.1.
    fCFOP: AnsiString;           /// C�digo Fiscal de Opera��o e Presta��o
    fALIQ_ICMS: Currency;        /// Al�quota do ICMS - Carga tribut�ria efetiva em percentual
    fVL_PIS: currency;           /// Valor do PIS
    fVL_COFINS: currency;        /// Valor da COFINS
  public
    property COD_ITEM: AnsiString read FCOD_ITEM write FCOD_ITEM;
    property QTD: Double read FQTD write FQTD;
    property QTD_CANC: Double read FQTD_CANC write FQTD_CANC;
    property UNID: AnsiString read FUNID write FUNID;
    property VL_ITEM: currency read FVL_ITEM write FVL_ITEM;
    property CST_ICMS: AnsiString read fCST_ICMS write fCST_ICMS;
    property CFOP: AnsiString read fCFOP write fCFOP;
    property ALIQ_ICMS: Currency read fALIQ_ICMS write fALIQ_ICMS;
    property VL_PIS: currency read fVL_PIS write fVL_PIS;
    property VL_COFINS: currency read fVL_COFINS write fVL_COFINS;
  end;

  /// Registro C470 - Lista

  TRegistroC470List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC470; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC470); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC470;
    property Items[Index: Integer]: TRegistroC470 read GetItem write SetItem;
  end;

  /// Registro C490 - REGISTRO ANAL�TICO DO MOVIMENTO DI�RIO (C�DIGO 02 E 2D)

  TRegistroC490 = class(TPersistent)
  private
    fCST_ICMS: AnsiString;     /// C�digo da Situa��o Tribut�ria, conforme a Tabela indicada no item 4.3.1
    fCFOP: AnsiString;         /// C�digo Fiscal de Opera��o e Presta��o
    fALIQ_ICMS: currency;      /// Al�quota do ICMS
    fVL_OPR: currency;         /// Valor da opera��o correspondente � combina��o de CST_ICMS, CFOP, e al�quota do ICMS, inclu�das as despesas acess�rias e acr�scimos
    fVL_BC_ICMS: currency;     /// Valor acumulado da base de c�lculo do ICMS, referente � combina��o de CST_ICMS, CFOP, e al�quota do ICMS.
    fVL_ICMS: currency;        /// Valor acumulado do ICMS, referente � combina��o de CST_ICMS, CFOP e al�quota do ICMS.
    fCOD_OBS: AnsiString;      /// C�digo da observa��o do lan�amento fiscal (campo 02 do Registro 0460)
  public
    property CST_ICMS: AnsiString read FCST_ICMS write FCST_ICMS;
    property CFOP: AnsiString read FCFOP write FCFOP;
    property ALIQ_ICMS: currency read FALIQ_ICMS write FALIQ_ICMS;
    property VL_OPR: currency read FVL_OPR write FVL_OPR;
    property VL_BC_ICMS: currency read FVL_BC_ICMS write FVL_BC_ICMS;
    property VL_ICMS: currency read FVL_ICMS write FVL_ICMS;
    property COD_OBS: AnsiString read FCOD_OBS write FCOD_OBS;
  end;

  /// Registro C490 - Lista

  TRegistroC490List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC490; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC490); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC490;
    property Items[Index: Integer]: TRegistroC490 read GetItem write SetItem;
  end;

  /// Registro C495 - RESUMO MENSAL DE ITENS DO ECF POR ESTABELECIMENTO (C�DIGO 02, 2D)

  TRegistroC495 = class(TPersistent)
  private
    fALIQ_ICMS: currency;      /// Al�quota do ICMS
    fCOD_ITEM: AnsiString;     /// C�digo do item (campo 02 do Registro 0200)
    fQTD: Double;              /// Quantidade acumulada do item
    fQTD_CANC: Double;         /// Quantidade cancelada acumulada, no caso de cancelamento parcial de item
    fUNID: AnsiString;         /// Unidade do item (Campo 02 do registro 0190)
    fVL_ITEM: currency;        /// Valor acumulado do item
    fVL_DESC: currency;        /// Valor acumulado dos descontos
    fVL_CANC: currency;        /// Valor acumulado dos cancelamentos
    fVL_ACMO: currency;        /// Valor acumulado dos acr�scimos
    fVL_BC_ICMS: currency;     /// Valor acumulado da base de c�lculo do ICMS
    fVL_ICMS: currency;        /// Valor acumulado do ICMS
    fVL_ISEN: currency;        /// Valor das sa�das isentas do ICMS
    fVL_NT: currency;          /// Valor das sa�das sob n�o-incid�ncia ou n�o-tributadas pelo ICMS
    fVL_ICMS_ST: currency;     /// Valor das sa�das de mercadorias adquiridas com substitui��o tribut�ria do ICMS
  public
    property ALIQ_ICMS: currency read FALIQ_ICMS write FALIQ_ICMS;
    property COD_ITEM: AnsiString read FCOD_ITEM write FCOD_ITEM;
    property QTD: Double read FQTD write FQTD;
    property QTD_CANC: Double read FQTD_CANC write FQTD_CANC;
    property UNID: AnsiString read FUNID write FUNID;
    property VL_ITEM: currency read FVL_ITEM write FVL_ITEM;
    property VL_DESC: currency read FVL_DESC write FVL_DESC;
    property VL_CANC: currency read FVL_CANC write FVL_CANC;
    property VL_ACMO: currency read FVL_ACMO write FVL_ACMO;
    property VL_BC_ICMS: currency read FVL_BC_ICMS write FVL_BC_ICMS;
    property VL_ICMS: currency read FVL_ICMS write FVL_ICMS;
    property VL_ISEN: currency read FVL_ISEN write FVL_ISEN;
    property VL_NT: currency read FVL_NT write FVL_NT;
    property VL_ICMS_ST: currency read FVL_ICMS_ST write FVL_ICMS_ST;
  end;

  /// Registro C495 - Lista

  TRegistroC495List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC495; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC495); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC495;
    property Items[Index: Integer]: TRegistroC495 read GetItem write SetItem;
  end;

  /// Registro C500 - NOTA FISCAL/CONTA DE ENERGIA EL�TRICA (C�DIGO 06) E NOTA FISCAL CONSUMO FORNECIMENTO DE G�S (C�DIGO 28)

  TRegistroC500 = class(TPersistent)
  private
    fIND_OPER: AnsiString;     /// Indicador do tipo de opera��o: 0 - Entrada; 1- Sa�da
    fIND_EMIT: AnsiString;     /// Indicador do emitente do documento fiscal: 0- Emiss�o pr�pria; 1- Terceiros
    fCOD_PART: AnsiString;     /// C�digo do participante (campo 02 do Registro 0150): - do adquirente, no caso das sa�das; - do fornecedor no caso de entradas
    fCOD_MOD: AnsiString;      /// C�digo do modelo do documento fiscal, conforme a Tabela 4.1.1
    fCOD_SIT: AnsiString;      /// C�digo da situa��o do documento fiscal, conforme a Tabela 4.1.2
    fSER: AnsiString;          /// S�rie do documento fiscal
    fSUB: AnsiString;          /// Subs�rie do documento fiscal
    fCOD_CONS: AnsiString;     /// C�digo de classe de consumo de energia el�trica, conforme a Tabela 4.4.5 ou C�digo da classe de consumo de g�s canalizado conforme Tabela 4.4.3.
    fNUM_DOC: AnsiString;      /// N�mero do documento fiscal
    fDT_DOC: TDateTime;    /// Data da emiss�o do documento fiscal
    fDT_E_S: TDateTime;    /// Data da entrada ou da sa�da
    fVL_DOC: currency;     /// Valor total do documento fiscal
    fVL_DESC: currency;    /// Valor total do desconto
    fVL_FORN: currency;    /// Valor total fornecido/consumido
    fVL_SERV_NT: currency;    /// Valor total dos servi�os n�o-tributados pelo ICMS
    fVL_TERC: currency;    /// Valor total cobrado em nome de terceiros
    fVL_DA: currency;      /// Valor total de despesas acess�rias indicadas no documento fiscal
    fVL_BC_ICMS: currency;    /// Valor acumulado da base de c�lculo do ICMS
    fVL_ICMS: currency;    /// Valor acumulado do ICMS
    fVL_BC_ICMS_ST: currency;    /// Valor acumulado da base de c�lculo do ICMS substitui��o tribut�ria
    fVL_ICMS_ST: currency;    /// Valor acumulado do ICMS retido por substitui��o tribut�ria
    fCOD_INF: AnsiString;         /// C�digo da informa��o complementar do documento fiscal (campo 02 do Registro 0450)
    fVL_PIS: currency;        /// Valor do PIS
    fVL_COFINS: currency;     /// Valor da COFINS
    fTP_LIGACAO:AnsiString;   /// C�digo de tipo de Liga��o [ 1 - Monof�sico 2 - Bif�sico 3 - Trif�sico ]
    fCOD_GRUPO_TENSAO:AnsiString; /// C�digo de grupo de tens�o: Vide Manual Registro C500 Campo 27

    FRegistroC510: TRegistroC510List;  /// BLOCO C - Lista de RegistroC510 (FILHO) {M�rcio Lopes 20Dez2009}
    FRegistroC590: TRegistroC590List;  /// BLOCO C - Lista de RegistroC590 (FILHO) {M�rcio Lopes 20Dez2009}

  public
    constructor Create; virtual; /// Create
    destructor Destroy; override; /// Destroy

    property IND_OPER: AnsiString read fIND_OPER write fIND_OPER;
    property IND_EMIT: AnsiString read fIND_EMIT write fIND_EMIT;
    property COD_PART: AnsiString read fCOD_PART write fCOD_PART;
    property COD_MOD: AnsiString read fCOD_MOD write fCOD_MOD;
    property COD_SIT: AnsiString read fCOD_SIT write fCOD_SIT;
    property SER: AnsiString read fSER write fSER;
    property SUB: AnsiString read fSUB write fSUB;
    property COD_CONS: AnsiString read fCOD_CONS write fCOD_CONS;
    property NUM_DOC: AnsiString read fNUM_DOC write fNUM_DOC;
    property DT_DOC: TDateTime read fDT_DOC write fDT_DOC;
    property DT_E_S: TDateTime read fDT_E_S write fDT_E_S;
    property VL_DOC: currency read fVL_DOC write fVL_DOC;
    property VL_DESC: currency read fVL_DESC write fVL_DESC;
    property VL_FORN: currency read fVL_FORN write fVL_FORN;
    property VL_SERV_NT: currency read fVL_SERV_NT write fVL_SERV_NT;
    property VL_TERC: currency read fVL_TERC write fVL_TERC;
    property VL_DA: currency read fVL_DA write fVL_DA;
    property VL_BC_ICMS: currency read fVL_BC_ICMS write fVL_BC_ICMS;
    property VL_ICMS: currency read fVL_ICMS write fVL_ICMS;
    property VL_BC_ICMS_ST: currency read fVL_BC_ICMS_ST write fVL_BC_ICMS_ST;
    property VL_ICMS_ST: currency read fVL_ICMS_ST write fVL_ICMS_ST;
    property COD_INF: AnsiString read fCOD_INF write fCOD_INF;
    property VL_PIS: currency read fVL_PIS write fVL_PIS;
    property VL_COFINS: currency read fVL_COFINS write fVL_COFINS;
    property TP_LIGACAO:        AnsiString read fTP_LIGACAO       write fTP_LIGACAO;
    property COD_GRUPO_TENSAO:  AnsiString read fCOD_GRUPO_TENSAO write fCOD_GRUPO_TENSAO;

    /// Registros FILHOS
    property RegistroC510: TRegistroC510List read FRegistroC510 write FRegistroC510;
    property RegistroC590: TRegistroC590List read FRegistroC590 write FRegistroC590;

  end;

  /// Registro C500 - Lista

  TRegistroC500List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC500; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC500); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC500;
    property Items[Index: Integer]: TRegistroC500 read GetItem write SetItem;
  end;

  /// Registro C510 - ITENS DO DOCUMENTO NOTA FISCAL/CONTA ENERGIA EL�TRICA (C�DIGO 06) E NOTA FISCAL/CONTA DE FORNECIMENTO DE G�S (C�DIGO 28)

  TRegistroC510 = class(TPersistent)
  private
    fNUM_ITEM: AnsiString;       /// N�mero seq�encial do item no documento fiscal
    fCOD_ITEM: AnsiString;       /// C�digo do item (campo 02 do Registro 0200)
    fCOD_CLASS: AnsiString;      /// C�digo de classifica��o do item de energia el�trica, conforme a Tabela 4.4.1
    fQTD: Double;                /// Quantidade do item
    fUNID: AnsiString;           /// Unidade do item (Campo 02 do registro 0190)
    fVL_ITEM: currency;          /// Valor do item
    fVL_DESC: currency;          /// Valor total do desconto
    fCST_ICMS: AnsiString;       /// C�digo da Situa��o Tribut�ria, conforme a Tabela indicada no item 4.3.1
    fCFOP: AnsiString;           /// C�digo Fiscal de Opera��o e Presta��o
    fVL_BC_ICMS: currency;       /// Valor da base de c�lculo do ICMS
    fALIQ_ICMS: Currency;        /// Al�quota do ICMS
    fVL_ICMS: currency;          /// Valor do ICMS creditado/debitado
    fVL_BC_ICMS_ST: currency;    /// Valor da base de c�lculo referente � substitui��o tribut�ria
    fALIQ_ST: Currency;          /// Al�quota do ICMS da substitui��o tribut�ria na unidade da federa��o de destino
    fVL_ICMS_ST: currency;       /// Valor do ICMS referente � substitui��o tribut�ria
    fIND_REC: AnsiString;        /// Indicador do tipo de receita: 0- Receita pr�pria; 1- Receita de terceiros
    fCOD_PART: AnsiString;       /// C�digo do participante receptor da receita, terceiro da opera��o (campo 02 do Registro 0150)
    fVL_PIS: currency;           /// Valor do PIS
    fVL_COFINS: currency;        /// Valor da COFINS
    fCOD_CTA: AnsiString;        /// C�digo da conta anal�tica cont�bil debitada/creditada
  public
    property NUM_ITEM: AnsiString read fNUM_ITEM write fNUM_ITEM;
    property COD_ITEM: AnsiString read fCOD_ITEM write fCOD_ITEM;
    property COD_CLASS: AnsiString read fCOD_CLASS write fCOD_CLASS;
    property QTD: Double read fQTD write fQTD;
    property UNID: AnsiString read fUNID write fUNID;
    property VL_ITEM: currency read fVL_ITEM write fVL_ITEM;
    property VL_DESC: currency read fVL_DESC write fVL_DESC;
    property CST_ICMS: AnsiString read fCST_ICMS write fCST_ICMS;
    property CFOP: AnsiString read fCFOP write fCFOP;
    property VL_BC_ICMS: currency read fVL_BC_ICMS write fVL_BC_ICMS;
    property ALIQ_ICMS: Currency read fALIQ_ICMS write fALIQ_ICMS;
    property VL_ICMS: currency read fVL_ICMS write fVL_ICMS;
    property VL_BC_ICMS_ST: currency read fVL_BC_ICMS_ST write fVL_BC_ICMS_ST;
    property ALIQ_ST: Currency read fALIQ_ST write fALIQ_ST;
    property VL_ICMS_ST: currency read fVL_ICMS_ST write fVL_ICMS_ST;
    property IND_REC: AnsiString read fIND_REC write fIND_REC;
    property COD_PART: AnsiString read fCOD_PART write fCOD_PART;
    property VL_PIS: currency read fVL_PIS write fVL_PIS;
    property VL_COFINS: currency read fVL_COFINS write fVL_COFINS;
    property COD_CTA: AnsiString read fCOD_CTA write fCOD_CTA;
  end;

  /// Registro C510 - Lista

  TRegistroC510List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC510; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC510); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC510;
    property Items[Index: Integer]: TRegistroC510 read GetItem write SetItem;
  end;

  /// Registro C590 - REGISTRO ANAL�TICO DO DOCUMENTO - NOTA FISCAL/CONTA DE ENERGIA EL�TRICA (C�DIGO 06) E NOTA FISCAL CONSUMO FORNECIMENTO DE G�S (C�DIGO 28)

  TRegistroC590 = class(TPersistent)
  private
    fCST_ICMS: AnsiString;        /// C�digo da Situa��o Tribut�ria, conforme a Tabela indicada no item 4.3.1.
    fCFOP: AnsiString;            /// C�digo Fiscal de Opera��o e Presta��o do agrupamento de itens
    fALIQ_ICMS: Currency;     /// Al�quota do ICMS
    fVL_OPR: currency;        /// Valor da opera��o correspondente � combina��o de CST_ICMS, CFOP, e al�quota do ICMS.
    fVL_BC_ICMS: currency;    /// Parcela correspondente ao "Valor da base de c�lculo do ICMS" referente � combina��o de CST_ICMS, CFOP e al�quota do ICMS.
    fVL_ICMS: currency;       /// Parcela correspondente ao "Valor do ICMS" referente � combina��o de CST_ICMS, CFOP e al�quota do ICMS.
    fVL_BC_ICMS_ST: currency; /// Parcela correspondente ao "Valor da base de c�lculo do ICMS" da substitui��o tribut�ria referente � combina��o de CST_ICMS, CFOP e al�quota do ICMS.
    fVL_ICMS_ST: currency;    /// Parcela correspondente ao valor creditado/debitado do ICMS da substitui��o tribut�ria, referente � combina��o de CST_ICMS,  CFOP, e al�quota do ICMS.
    fVL_RED_BC: currency;     /// Valor n�o tributado em fun��o da redu��o da base de c�lculo do ICMS, referente � combina��o de CST_ICMS, CFOP e al�quota do ICMS.
    fCOD_OBS: AnsiString;         /// C�digo da observa��o do lan�amento fiscal (campo 02 do Registro 0460)
  public
    property CST_ICMS: AnsiString read fCST_ICMS write fCST_ICMS;
    property CFOP: AnsiString read fCFOP write fCFOP;
    property ALIQ_ICMS: Currency read fALIQ_ICMS write fALIQ_ICMS;
    property VL_OPR: currency read fVL_OPR write fVL_OPR;
    property VL_BC_ICMS: currency read fVL_BC_ICMS write fVL_BC_ICMS;
    property VL_ICMS: currency read fVL_ICMS write fVL_ICMS;
    property VL_BC_ICMS_ST: currency read fVL_BC_ICMS_ST write fVL_BC_ICMS_ST;
    property VL_ICMS_ST: currency read fVL_ICMS_ST write fVL_ICMS_ST;
    property VL_RED_BC: currency read fVL_RED_BC write fVL_RED_BC;
    property COD_OBS: AnsiString read fCOD_OBS write fCOD_OBS;
  end;

  /// Registro C590 - Lista

  TRegistroC590List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC590; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC590); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC590;
    property Items[Index: Integer]: TRegistroC590 read GetItem write SetItem;
  end;

  /// Registro C600 - CONSOLIDA��O DI�RIA DE NOTAS FISCAIS/CONTAS DE ENERGIA EL�TRICA (C�DIGO 06), NOTA FISCAL/CONTA DE FORNECIMENTO D'�GUA CANALIZADA (C�DIGO 29) E NOTA FISCAL/CONTA DE FORNECIMENTO DE G�S (C�DIGO 28) (EMPRESAS N�O OBRIGADAS AO CONVENIO ICMS 115/03)

  TRegistroC600 = class(TPersistent)
  private
    fCOD_MOD: AnsiString;      /// C�digo do modelo do documento fiscal, conforme a Tabela 4.1.1
    fCOD_MUN: AnsiString;      /// C�digo do munic�pio dos pontos de consumo, conforme a tabela IBGE
    fSER: AnsiString;          /// S�rie do documento fiscal
    fSUB: AnsiString;          /// Subs�rie do documento fiscal
    fCOD_CONS: AnsiString;     /// C�digo de classe de consumo de energia el�trica, conforme a Tabela 4.4.5, ou C�digo de Consumo de Fornecimento D��gua - Tabela 4.4.2 ou C�digo da classe de consumo de g�s canalizado   conforme Tabela 4.4.3.
    fQTD_CONS: Currency;   /// Quantidade de documentos consolidados neste registro
    fQTD_CANC: Currency;   /// Quantidade de documentos cancelados
    fDT_DOC: TDateTime;    /// Data dos documentos consolidados
    fVL_DOC: currency;     /// Valor total dos documentos
    fVL_DESC: currency;    /// Valor acumulado dos descontos
    fCONS: Currency;       /// Consumo total acumulado, em kWh (C�digo 06)
    fVL_FORN: currency;    /// Valor acumulado do fornecimento
    fVL_SERV_NT: currency; /// Valor acumulado dos servi�os n�o-tributados pelo ICMS
    fVL_TERC: currency;    /// Valores cobrados em nome de terceiros
    fVL_DA: currency;      /// Valor acumulado das despesas acess�rias
    fVL_BC_ICMS: currency; /// Valor acumulado da base de c�lculo do ICMS
    fVL_ICMS: currency;    /// Valor acumulado do ICMS
    fVL_BC_ICMS_ST: currency;    /// Valor acumulado da base de c�lculo do ICMS substitui��o tribut�ria
    fVL_ICMS_ST: currency;       /// Valor acumulado do ICMS retido por substitui��o tribut�ria
    fVL_PIS: currency;           /// Valor acumulado do PIS
    fVL_COFINS: currency;        /// Valor acumulado COFINS
  public
    property COD_MOD: AnsiString read fCOD_MOD write fCOD_MOD;
    property COD_MUN: AnsiString read fCOD_MUN write fCOD_MUN;
    property SER: AnsiString read fSER write fSER;
    property SUB: AnsiString read fSUB write fSUB;
    property COD_CONS: AnsiString read fCOD_CONS write fCOD_CONS;
    property QTD_CONS: Currency read fQTD_CONS write fQTD_CONS;
    property QTD_CANC: Currency read fQTD_CANC write fQTD_CANC;
    property DT_DOC: TDateTime read fDT_DOC write fDT_DOC;
    property VL_DOC: currency read fVL_DOC write fVL_DOC;
    property VL_DESC: currency read fVL_DESC write fVL_DESC;
    property CONS: Currency read fCONS write fCONS;
    property VL_FORN: currency read fVL_FORN write fVL_FORN;
    property VL_SERV_NT: currency read fVL_SERV_NT write fVL_SERV_NT;
    property VL_TERC: currency read fVL_TERC write fVL_TERC;
    property VL_DA: currency read fVL_DA write fVL_DA;
    property VL_BC_ICMS: currency read fVL_BC_ICMS write fVL_BC_ICMS;
    property VL_ICMS: currency read fVL_ICMS write fVL_ICMS;
    property VL_BC_ICMS_ST: currency read fVL_BC_ICMS_ST write fVL_BC_ICMS_ST;
    property VL_ICMS_ST: currency read fVL_ICMS_ST write fVL_ICMS_ST;
    property VL_PIS: currency read fVL_PIS write fVL_PIS;
    property VL_COFINS: currency read fVL_COFINS write fVL_COFINS;
  end;

  /// Registro C600 - Lista

  TRegistroC600List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC600; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC600); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC600;
    property Items[Index: Integer]: TRegistroC600 read GetItem write SetItem;
  end;

  /// Registro C601 - DOCUMENTOS CANCELADOS - CONSOLIDA��O DI�RIA DE NOTAS FISCAIS/CONTAS DE ENERGIA EL�TRICA (C�DIGO 06), NOTA FISCAL/CONTA DE FORNECIMENTO D'�GUA CANALIZADA (C�DIGO 29) E NOTA FISCAL/CONTA DE FORNECIMENTO DE G�S (C�DIGO 28)

  TRegistroC601 = class(TPersistent)
  private
    fNUM_DOC_CANC: AnsiString;        /// N�mero do documento fiscal cancelado
  public
    property NUM_DOC_CANC: AnsiString read FNUM_DOC_CANC write FNUM_DOC_CANC;
  end;

  /// Registro C601 - Lista

  TRegistroC601List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC601; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC601); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC601;
    property Items[Index: Integer]: TRegistroC601 read GetItem write SetItem;
  end;

  /// Registro C610 - ITENS DO DOCUMENTO CONSOLIDADO NOTAS FISCAIS/CONTAS DE ENERGIA EL�TRICA (C�DIGO 06), NOTA FISCAL/CONTA DE FORNECIMENTO D'�GUA CANALIZADA (C�DIGO 29) E NOTA FISCAL/CONTA DE FORNECIMENTO DE G�S (C�DIGO 28) (EMPRESAS N�O OBRIGADAS AO CONVENIO ICMS 115/03)

  TRegistroC610 = class(TPersistent)
  private
    fCOD_CLASS: AnsiString;       /// C�digo de classifica��o do item de energia el�trica, conforme Tabela 4.4.1
    fCOD_ITEM: AnsiString;        /// C�digo do item (campo 02 do Registro 0200)
    fQTD: Double;                 /// Quantidade acumulada do item
    fUNID: AnsiString;            /// Unidade do item (Campo 02 do registro 0190)
    fVL_ITEM: currency;           /// Valor acumulado do item
    fVL_DESC: currency;           /// Valor acumulado dos descontos
    fCST_ICMS: AnsiString;        /// C�digo da Situa��o Tribut�ria, conforme a Tabela indicada no item 4.3.1
    fCFOP: AnsiString;            /// C�digo Fiscal de Opera��o e Presta��o conforme tabela indicada no item 4.2.2
    fALIQ_ICMS: currency;         /// Al�quota do ICMS
    fVL_BC_ICMS: currency;        /// Valor acumulado da base de c�lculo do ICMS
    fVL_ICMS: currency;           /// Valor acumulado do ICMS debitado
    fVL_BC_ICMS_ST: currency;     /// Valor da base de c�lculo do ICMS substitui��o tribut�ria
    fVL_ICMS_ST: currency;        /// Valor do ICMS retido por substitui��o tribut�ria
    fVL_PIS: currency;            /// Valor do PIS
    fVL_COFINS: currency;         /// Valor da COFINS
    fCOD_CTA: AnsiString;         /// C�digo da conta anal�tica cont�bil debitada/creditada
  public
    property COD_CLASS: AnsiString read FCOD_CLASS write FCOD_CLASS;
    property COD_ITEM: AnsiString read FCOD_ITEM write FCOD_ITEM;
    property QTD: Double read FQTD write FQTD;
    property UNID: AnsiString read FUNID write FUNID;
    property VL_ITEM: currency read FVL_ITEM write FVL_ITEM;
    property VL_DESC: currency read FVL_DESC write FVL_DESC;
    property CST_ICMS: AnsiString read FCST_ICMS write FCST_ICMS;
    property CFOP: AnsiString read FCFOP write FCFOP;
    property ALIQ_ICMS: currency read FALIQ_ICMS write FALIQ_ICMS;
    property VL_BC_ICMS: currency read FVL_BC_ICMS write FVL_BC_ICMS;
    property VL_ICMS: currency read FVL_ICMS write FVL_ICMS;
    property VL_BC_ICMS_ST: currency read FVL_BC_ICMS_ST write FVL_BC_ICMS_ST;
    property VL_ICMS_ST: currency read FVL_ICMS_ST write FVL_ICMS_ST;
    property VL_PIS: currency read FVL_PIS write FVL_PIS;
    property VL_COFINS: currency read FVL_COFINS write FVL_COFINS;
    property COD_CTA: AnsiString read FCOD_CTA write FCOD_CTA;
  end;

  /// Registro C610 - Lista

  TRegistroC610List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC610; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC610); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC610;
    property Items[Index: Integer]: TRegistroC610 read GetItem write SetItem;
  end;

  /// Registro C620 - COMPLEMENTO DO DOCUMENTO - DADOS ADICIONAIS (C�DIGO 06)

  TRegistroC620 = class(TPersistent)
  private
    fVL_FCP: currency;      /// Valor do ICMS resultante da al�quota adicional dos itens inclu�dos no Fundo de Combate � Pobreza
    fIND_F0: AnsiString;        /// Indicador de nota fiscal recebida/destinada de/a participante do Programa Fome Zero: 0- N�o; 1- Sim
  public
    property VL_FCP: currency read FVL_FCP write FVL_FCP;
    property IND_F0: AnsiString read FIND_F0 write FIND_F0;
  end;

  /// Registro C620 - Lista

  TRegistroC620List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC620; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC620); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC620;
    property Items[Index: Integer]: TRegistroC620 read GetItem write SetItem;
  end;

  /// Registro C690 - REGISTRO ANAL�TICO DOS DOCUMENTOS (Notas Fiscais/Contas de Energia El�trica (C�digo 06), Nota Fiscal/Conta de Fornecimento d��gua CANALIZADA (c�digo 29) e Nota Fiscal/Conta de Fornecimento de G�s (C�digo 28)

  TRegistroC690 = class(TPersistent)
  private
    fCST_ICMS: AnsiString;            /// C�digo da Situa��o Tribut�ria, conforme a tabela indicada no item 4.3.1
    fCFOP: AnsiString;                /// C�digo Fiscal de Opera��o e Presta��o, conforme a tabela indicada no item 4.2.2
    fALIQ_ICMS: currency;         /// Al�quota do ICMS
    fVL_OPR: currency;            /// Valor da opera��o correspondente � combina��o de CST_ICMS, CFOP, e al�quota do ICMS.
    fVL_BC_ICMS: currency;        /// Parcela correspondente ao "Valor da base de c�lculo do ICMS" referente � combina��o CST_ICMS, CFOP e al�quota do ICMS
    fVL_ICMS: currency;           /// Parcela correspondente ao "Valor do ICMS" referente � combina��o CST_ICMS, CFOP e al�quota do ICMS
    fVL_RED_BC: currency;         /// Valor n�o tributado em fun��o da redu��o da base de c�lculo do ICMS, referente � combina��o de CST_ICMS, CFOP e al�quota do ICMS.
    fVL_BC_ICMS_ST: currency;     /// Valor da base de c�lculo do ICMS substitui��o tribut�ria
    fVL_ICMS_ST: currency;        /// Valor do ICMS retido por substitui��o tribut�ria
    fCOD_OBS: AnsiString;             /// C�digo da observa��o do lan�amento fiscal (campo 02 do Registro 0460)
  public
    property CST_ICMS: AnsiString read FCST_ICMS write FCST_ICMS;
    property CFOP: AnsiString read FCFOP write FCFOP;
    property ALIQ_ICMS: currency read FALIQ_ICMS write FALIQ_ICMS;
    property VL_OPR: currency read FVL_OPR write FVL_OPR;
    property VL_BC_ICMS: currency read FVL_BC_ICMS write FVL_BC_ICMS;
    property VL_ICMS: currency read FVL_ICMS write FVL_ICMS;
    property VL_RED_BC: currency read FVL_RED_BC write FVL_RED_BC;
    property VL_BC_ICMS_ST: currency read FVL_BC_ICMS_ST write FVL_BC_ICMS_ST;
    property VL_ICMS_ST: currency read FVL_ICMS_ST write FVL_ICMS_ST;
    property COD_OBS: AnsiString read FCOD_OBS write FCOD_OBS;
  end;

  /// Registro C690 - Lista

  TRegistroC690List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC690; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC690); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC690;
    property Items[Index: Integer]: TRegistroC690 read GetItem write SetItem;
  end;

  /// Registro C700 - CONSOLIDA��O DOS DOCUMENTOS NF/CONTA ENERGIA EL�TRICA (C�DIGO 06), EMITIDAS EM VIA �NICA (EMPRESAS OBRIGADAS AO CONVENIO ICMS 115/03)

  TRegistroC700 = class(TPersistent)
  private
    fCOD_MOD: AnsiString;      /// C�digo do modelo d documento fiscal, conforme a Tabela 4.1.1
    fSER: AnsiString;          /// S�rie do documento fiscal
    fNRO_ORD_INI: integer; /// N�mero de ordem inicial
    fNRO_ORD_FIN: integer; /// N�mero de ordem final
    fDT_DOC_INI: TDateTime;   /// Data de emiss�o inicial dos documentos
    fDT_DOC_FIN: TDateTime;   /// Data de emiss�o final dos documentos
    fNOM_MEST: AnsiString;        /// Nome do arquivo Mestre de Documento Fiscal
    fCHV_COD_DIG: AnsiString;     /// Chave de codifica��o digital do arquivo Mestre de Documento Fiscal
  public
    property COD_MOD: AnsiString read fCOD_MOD write fCOD_MOD;
    property SER: AnsiString read fSER write fSER;
    property NRO_ORD_INI: integer read fNRO_ORD_INI write fNRO_ORD_INI;
    property NRO_ORD_FIN: integer read fNRO_ORD_FIN write fNRO_ORD_FIN;
    property DT_DOC_INI: TDateTime read fDT_DOC_INI write fDT_DOC_INI;
    property DT_DOC_FIN: TDateTime read fDT_DOC_FIN write fDT_DOC_FIN;
    property NOM_MEST: AnsiString read fNOM_MEST write fNOM_MEST;
    property CHV_COD_DIG: AnsiString read fCHV_COD_DIG write fCHV_COD_DIG;
  end;

  /// Registro C700 - Lista

  TRegistroC700List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC700; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC700); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC700;
    property Items[Index: Integer]: TRegistroC700 read GetItem write SetItem;
  end;

  /// Registro C790 - REGISTRO ANAL�TICO DOS DOCUMENTOS (COD 06)

  TRegistroC790 = class(TPersistent)
  private
    fCST_ICMS: AnsiString;            /// C�digo da Situa��o Tribut�ria, conforme a tabela indicada no item 4.3.1
    fCFOP: AnsiString;                /// C�digo Fiscal de Opera��o e Presta��o, conforme a tabela indicada no item 4.2.2
    fALIQ_ICMS: currency;         /// Al�quota do ICMS
    fVL_OPR: currency;            /// Valor da opera��o correspondente � combina��o de CST_ICMS, CFOP, e al�quota do ICMS.
    fVL_BC_ICMS: currency;        /// Parcela correspondente ao "Valor da base de c�lculo do ICMS" referente � combina��o CST_ICMS, CFOP, e al�quota do ICMS
    fVL_ICMS: currency;           /// Parcela correspondente ao "Valor do ICMS" referente � combina��o CST_ICMS, CFOP e al�quota do ICMS
    fVL_BC_ICMS_ST: currency;     /// Valor da base de c�lculo do ICMS substitui��o tribut�ria
    fVL_ICMS_ST: currency;        /// Valor do ICMS retido por substitui��o tribut�ria
    fVL_RED_BC: currency;         /// Valor n�o tributado em fun��o da redu��o da base de c�lculo do ICMS, referente � combina��o de CST_ICMS, CFOP e al�quota do ICMS.
    fCOD_OBS: AnsiString;             /// C�digo da observa��o do lan�amento fiscal (campo 02 do Registro 0460)
  public
    property CST_ICMS: AnsiString read FCST_ICMS write FCST_ICMS;
    property CFOP: AnsiString read FCFOP write FCFOP;
    property ALIQ_ICMS: currency read FALIQ_ICMS write FALIQ_ICMS;
    property VL_OPR: currency read FVL_OPR write FVL_OPR;
    property VL_BC_ICMS: currency read FVL_BC_ICMS write FVL_BC_ICMS;
    property VL_ICMS: currency read FVL_ICMS write FVL_ICMS;
    property VL_BC_ICMS_ST: currency read FVL_BC_ICMS_ST write FVL_BC_ICMS_ST;
    property VL_ICMS_ST: currency read FVL_ICMS_ST write FVL_ICMS_ST;
    property VL_RED_BC: currency read FVL_RED_BC write FVL_RED_BC;
    property COD_OBS: AnsiString read FCOD_OBS write FCOD_OBS;
  end;

  /// Registro C790 - Lista

  TRegistroC790List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC790; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC790); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC790;
    property Items[Index: Integer]: TRegistroC790 read GetItem write SetItem;
  end;

  /// Registro C791 - REGISTRO DE INFORMA��ES DE ICMS ST POR UF (COD 06)

  TRegistroC791 = class(TPersistent)
  private
    fUF: AnsiString;                  /// Sigla da unidade da federa��o a que se refere a reten��o ST
    fVL_BC_ICMS_ST: currency;     /// Valor da base de c�lculo do ICMS substitui��o tribut�ria
    fVL_ICMS_ST: currency;        /// Valor do ICMS retido por substitui��o tribut�ria
  public
    property UF: AnsiString read FUF write FUF;
    property VL_BC_ICMS_ST: currency read FVL_BC_ICMS_ST write FVL_BC_ICMS_ST;
    property VL_ICMS_ST: currency read FVL_ICMS_ST write FVL_ICMS_ST;
  end;

  /// Registro C791 - Lista

  TRegistroC791List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroC791; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistroC791); /// SetItem
  public
    destructor Destroy; override;
    function New: TRegistroC791;
    property Items[Index: Integer]: TRegistroC791 read GetItem write SetItem;
  end;

  /// Registro C990 - ENCERRAMENTO DO BLOCO C

  TRegistroC990 = class(TPersistent)
  private
    fQTD_LIN_C: Integer; /// Quantidade total de linhas do Bloco C
  public
    property QTD_LIN_C: Integer read fQTD_LIN_C write fQTD_LIN_C;
  end;

implementation

{ TRegistroC100 }

{ TRegistroC100List }

destructor TRegistroC100List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC100List.GetItem(Index: Integer): TRegistroC100;
begin
  Result := TRegistroC100(Inherited Items[Index]);
end;

function TRegistroC100List.New: TRegistroC100;
begin
  Result := TRegistroC100.Create;
  Add(Result);
end;

procedure TRegistroC100List.SetItem(Index: Integer; const Value: TRegistroC100);
begin
  Put(Index, Value);
end;

{ TRegistroC110List }

destructor TRegistroC110List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC110List.GetItem(Index: Integer): TRegistroC110;
begin
  Result := TRegistroC110(Inherited Items[Index]);
end;

function TRegistroC110List.New: TRegistroC110;
begin
  Result := TRegistroC110.Create;
  Add(Result);
end;

procedure TRegistroC110List.SetItem(Index: Integer; const Value: TRegistroC110);
begin
  Put(Index, Value);
end;

{ TRegistroC111List }

destructor TRegistroC111List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC111List.GetItem(Index: Integer): TRegistroC111;
begin
  Result := TRegistroC111(Inherited Items[Index]);
end;

function TRegistroC111List.New: TRegistroC111;
begin
  Result := TRegistroC111.Create;
  Add(Result);
end;

procedure TRegistroC111List.SetItem(Index: Integer; const Value: TRegistroC111);
begin
  Put(Index, Value);
end;

{ TRegistroC112List }

destructor TRegistroC112List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC112List.GetItem(Index: Integer): TRegistroC112;
begin
  Result := TRegistroC112(Inherited Items[Index]);
end;

function TRegistroC112List.New: TRegistroC112;
begin
  Result := TRegistroC112.Create;
  Add(Result);
end;

procedure TRegistroC112List.SetItem(Index: Integer; const Value: TRegistroC112);
begin
  Put(Index, Value);
end;

{ TRegistroC113List }

destructor TRegistroC113List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC113List.GetItem(Index: Integer): TRegistroC113;
begin
  Result := TRegistroC113(Inherited Items[Index]);
end;

function TRegistroC113List.New: TRegistroC113;
begin
  Result := TRegistroC113.Create;
  Add(Result);
end;

procedure TRegistroC113List.SetItem(Index: Integer; const Value: TRegistroC113);
begin
  Put(Index, Value);
end;

{ TRegistroC114List }

destructor TRegistroC114List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC114List.GetItem(Index: Integer): TRegistroC114;
begin
  Result := TRegistroC114(Inherited Items[Index]);
end;

function TRegistroC114List.New: TRegistroC114;
begin
  Result := TRegistroC114.Create;
  Add(Result);
end;

procedure TRegistroC114List.SetItem(Index: Integer; const Value: TRegistroC114);
begin
  Put(Index, Value);
end;

{ TRegistroC115List }

destructor TRegistroC115List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC115List.GetItem(Index: Integer): TRegistroC115;
begin
  Result := TRegistroC115(Inherited Items[Index]);
end;

function TRegistroC115List.New: TRegistroC115;
begin
  Result := TRegistroC115.Create;
  Add(Result);
end;

procedure TRegistroC115List.SetItem(Index: Integer; const Value: TRegistroC115);
begin
  Put(Index, Value);
end;

{ TRegistroC120List }

destructor TRegistroC120List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC120List.GetItem(Index: Integer): TRegistroC120;
begin
  Result := TRegistroC120(Inherited Items[Index]);
end;

function TRegistroC120List.New: TRegistroC120;
begin
  Result := TRegistroC120.Create;
  Add(Result);
end;

procedure TRegistroC120List.SetItem(Index: Integer; const Value: TRegistroC120);
begin
  Put(Index, Value);
end;

{ TRegistroC130List }

destructor TRegistroC130List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC130List.GetItem(Index: Integer): TRegistroC130;
begin
  Result := TRegistroC130(Inherited Items[Index]);
end;

function TRegistroC130List.New: TRegistroC130;
begin
  Result := TRegistroC130.Create;
  Add(Result);
end;

procedure TRegistroC130List.SetItem(Index: Integer; const Value: TRegistroC130);
begin
  Put(Index, Value);
end;

{ TRegistroC140List }

destructor TRegistroC140List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC140List.GetItem(Index: Integer): TRegistroC140;
begin
  Result := TRegistroC140(Inherited Items[Index]);
end;

function TRegistroC140List.New: TRegistroC140;
begin
  Result := TRegistroC140.Create;
  Add(Result);
end;

procedure TRegistroC140List.SetItem(Index: Integer; const Value: TRegistroC140);
begin
  Put(Index, Value);
end;

{ TRegistroC141List }

destructor TRegistroC141List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC141List.GetItem(Index: Integer): TRegistroC141;
begin
  Result := TRegistroC141(Inherited Items[Index]);
end;

function TRegistroC141List.New: TRegistroC141;
begin
  Result := TRegistroC141.Create;
  Add(Result);
end;

procedure TRegistroC141List.SetItem(Index: Integer; const Value: TRegistroC141);
begin
  Put(Index, Value);
end;

{ TRegistroC160List }

destructor TRegistroC160List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC160List.GetItem(Index: Integer): TRegistroC160;
begin
  Result := TRegistroC160(Inherited Items[Index]);
end;

function TRegistroC160List.New: TRegistroC160;
begin
  Result := TRegistroC160.Create;
  Add(Result);
end;

procedure TRegistroC160List.SetItem(Index: Integer; const Value: TRegistroC160);
begin
  Put(Index, Value);
end;

{ TRegistroC165List }

destructor TRegistroC165List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC165List.GetItem(Index: Integer): TRegistroC165;
begin
  Result := TRegistroC165(Inherited Items[Index]);
end;

function TRegistroC165List.New: TRegistroC165;
begin
  Result := TRegistroC165.Create;
  Add(Result);
end;

procedure TRegistroC165List.SetItem(Index: Integer; const Value: TRegistroC165);
begin
  Put(Index, Value);
end;

{ TRegistroC170List }

destructor TRegistroC170List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC170List.GetItem(Index: Integer): TRegistroC170;
begin
  Result := TRegistroC170(Inherited Items[Index]);
end;

function TRegistroC170List.New: TRegistroC170;
begin
  Result := TRegistroC170.Create;
  Add(Result);
end;

procedure TRegistroC170List.SetItem(Index: Integer; const Value: TRegistroC170);
begin
  Put(Index, Value);
end;

{ TRegistroC171List }

destructor TRegistroC171List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC171List.GetItem(Index: Integer): TRegistroC171;
begin
  Result := TRegistroC171(Inherited Items[Index]);
end;

function TRegistroC171List.New: TRegistroC171;
begin
  Result := TRegistroC171.Create;
  Add(Result);
end;

procedure TRegistroC171List.SetItem(Index: Integer; const Value: TRegistroC171);
begin
  Put(Index, Value);
end;

{ TRegistroC172List }

destructor TRegistroC172List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC172List.GetItem(Index: Integer): TRegistroC172;
begin
  Result := TRegistroC172(Inherited Items[Index]);
end;

function TRegistroC172List.New: TRegistroC172;
begin
  Result := TRegistroC172.Create;
  Add(Result);
end;

procedure TRegistroC172List.SetItem(Index: Integer; const Value: TRegistroC172);
begin
  Put(Index, Value);
end;

{ TRegistroC173List }

destructor TRegistroC173List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC173List.GetItem(Index: Integer): TRegistroC173;
begin
  Result := TRegistroC173(Inherited Items[Index]);
end;

function TRegistroC173List.New: TRegistroC173;
begin
  Result := TRegistroC173.Create;
  Add(Result);
end;

procedure TRegistroC173List.SetItem(Index: Integer; const Value: TRegistroC173);
begin
  Put(Index, Value);
end;

{ TRegistroC174List }

destructor TRegistroC174List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC174List.GetItem(Index: Integer): TRegistroC174;
begin
  Result := TRegistroC174(Inherited Items[Index]);
end;

function TRegistroC174List.New: TRegistroC174;
begin
  Result := TRegistroC174.Create;
  Add(Result);
end;

procedure TRegistroC174List.SetItem(Index: Integer; const Value: TRegistroC174);
begin
  Put(Index, Value);
end;

{ TRegistroC175List }

destructor TRegistroC175List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC175List.GetItem(Index: Integer): TRegistroC175;
begin
  Result := TRegistroC175(Inherited Items[Index]);
end;

function TRegistroC175List.New: TRegistroC175;
begin
  Result := TRegistroC175.Create;
  Add(Result);
end;

procedure TRegistroC175List.SetItem(Index: Integer; const Value: TRegistroC175);
begin
  Put(Index, Value);
end;

{ TRegistroC176List }

destructor TRegistroC176List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC176List.GetItem(Index: Integer): TRegistroC176;
begin
  Result := TRegistroC176(Inherited Items[Index]);
end;

function TRegistroC176List.New: TRegistroC176;
begin
  Result := TRegistroC176.Create;
  Add(Result);
end;

procedure TRegistroC176List.SetItem(Index: Integer; const Value: TRegistroC176);
begin
  Put(Index, Value);
end;

{ TRegistroC177List }

destructor TRegistroC177List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC177List.GetItem(Index: Integer): TRegistroC177;
begin
  Result := TRegistroC177(Inherited Items[Index]);
end;

function TRegistroC177List.New: TRegistroC177;
begin
  Result := TRegistroC177.Create;
  Add(Result);
end;

procedure TRegistroC177List.SetItem(Index: Integer; const Value: TRegistroC177);
begin
  Put(Index, Value);
end;

{ TRegistroC178List }

destructor TRegistroC178List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC178List.GetItem(Index: Integer): TRegistroC178;
begin
  Result := TRegistroC178(Inherited Items[Index]);
end;

function TRegistroC178List.New: TRegistroC178;
begin
  Result := TRegistroC178.Create;
  Add(Result);
end;

procedure TRegistroC178List.SetItem(Index: Integer; const Value: TRegistroC178);
begin
  Put(Index, Value);
end;

{ TRegistroC179List }

destructor TRegistroC179List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC179List.GetItem(Index: Integer): TRegistroC179;
begin
  Result := TRegistroC179(Inherited Items[Index]);
end;

function TRegistroC179List.New: TRegistroC179;
begin
  Result := TRegistroC179.Create;
  Add(Result);
end;

procedure TRegistroC179List.SetItem(Index: Integer; const Value: TRegistroC179);
begin
  Put(Index, Value);
end;

{ TRegistroC190List }

destructor TRegistroC190List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC190List.GetItem(Index: Integer): TRegistroC190;
begin
  Result := TRegistroC190(Inherited Items[Index]);
end;

function TRegistroC190List.New: TRegistroC190;
begin
  Result := TRegistroC190.Create;
  Add(Result);
end;

procedure TRegistroC190List.SetItem(Index: Integer; const Value: TRegistroC190);
begin
  Put(Index, Value);
end;

{ TRegistroC195List }

destructor TRegistroC195List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC195List.GetItem(Index: Integer): TRegistroC195;
begin
  Result := TRegistroC195(Inherited Items[Index]);
end;

function TRegistroC195List.New: TRegistroC195;
begin
  Result := TRegistroC195.Create;
  Add(Result);
end;

procedure TRegistroC195List.SetItem(Index: Integer; const Value: TRegistroC195);
begin
  Put(Index, Value);
end;

{ TRegistroC197List }

destructor TRegistroC197List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC197List.GetItem(Index: Integer): TRegistroC197;
begin
  Result := TRegistroC197(Inherited Items[Index]);
end;

function TRegistroC197List.New: TRegistroC197;
begin
  Result := TRegistroC197.Create;
  Add(Result);
end;

procedure TRegistroC197List.SetItem(Index: Integer; const Value: TRegistroC197);
begin
  Put(Index, Value);
end;

{ TRegistroC300List }

destructor TRegistroC300List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC300List.GetItem(Index: Integer): TRegistroC300;
begin
  Result := TRegistroC300(Inherited Items[Index]);
end;

function TRegistroC300List.New: TRegistroC300;
begin
  Result := TRegistroC300.Create;
  Add(Result);
end;

procedure TRegistroC300List.SetItem(Index: Integer; const Value: TRegistroC300);
begin
  Put(Index, Value);
end;

{ TRegistroC310List }

destructor TRegistroC310List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC310List.GetItem(Index: Integer): TRegistroC310;
begin
  Result := TRegistroC310(Inherited Items[Index]);
end;

function TRegistroC310List.New: TRegistroC310;
begin
  Result := TRegistroC310.Create;
  Add(Result);
end;

procedure TRegistroC310List.SetItem(Index: Integer; const Value: TRegistroC310);
begin
  Put(Index, Value);
end;

{ TRegistroC320List }

destructor TRegistroC320List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC320List.GetItem(Index: Integer): TRegistroC320;
begin
  Result := TRegistroC320(Inherited Items[Index]);
end;

function TRegistroC320List.New: TRegistroC320;
begin
  Result := TRegistroC320.Create;
  Add(Result);
end;

procedure TRegistroC320List.SetItem(Index: Integer; const Value: TRegistroC320);
begin
  Put(Index, Value);
end;

{ TRegistroC321List }

destructor TRegistroC321List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC321List.GetItem(Index: Integer): TRegistroC321;
begin
  Result := TRegistroC321(Inherited Items[Index]);
end;

function TRegistroC321List.New: TRegistroC321;
begin
  Result := TRegistroC321.Create;
  Add(Result);
end;

procedure TRegistroC321List.SetItem(Index: Integer; const Value: TRegistroC321);
begin
  Put(Index, Value);
end;

{ TRegistroC350List }

destructor TRegistroC350List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC350List.GetItem(Index: Integer): TRegistroC350;
begin
  Result := TRegistroC350(Inherited Items[Index]);
end;

function TRegistroC350List.New: TRegistroC350;
begin
  Result := TRegistroC350.Create;
  Add(Result);
end;

procedure TRegistroC350List.SetItem(Index: Integer; const Value: TRegistroC350);
begin
  Put(Index, Value);
end;

{ TRegistroC370List }

destructor TRegistroC370List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC370List.GetItem(Index: Integer): TRegistroC370;
begin
  Result := TRegistroC370(Inherited Items[Index]);
end;

function TRegistroC370List.New: TRegistroC370;
begin
  Result := TRegistroC370.Create;
  Add(Result);
end;

procedure TRegistroC370List.SetItem(Index: Integer; const Value: TRegistroC370);
begin
  Put(Index, Value);
end;

{ TRegistroC390List }

destructor TRegistroC390List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC390List.GetItem(Index: Integer): TRegistroC390;
begin
  Result := TRegistroC390(Inherited Items[Index]);
end;

function TRegistroC390List.New: TRegistroC390;
begin
  Result := TRegistroC390.Create;
  Add(Result);
end;

procedure TRegistroC390List.SetItem(Index: Integer; const Value: TRegistroC390);
begin
  Put(Index, Value);
end;

{ TRegistroC400List }

destructor TRegistroC400List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC400List.GetItem(Index: Integer): TRegistroC400;
begin
  Result := TRegistroC400(Inherited Items[Index]);
end;

function TRegistroC400List.New: TRegistroC400;
begin
  Result := TRegistroC400.Create;
  Add(Result);
end;

procedure TRegistroC400List.SetItem(Index: Integer; const Value: TRegistroC400);
begin
  Put(Index, Value);
end;

{ TRegistroC405List }

destructor TRegistroC405List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC405List.GetItem(Index: Integer): TRegistroC405;
begin
  Result := TRegistroC405(Inherited Items[Index]);
end;

function TRegistroC405List.New: TRegistroC405;
begin
  Result := TRegistroC405.Create;
  Add(Result);
end;

procedure TRegistroC405List.SetItem(Index: Integer; const Value: TRegistroC405);
begin
  Put(Index, Value);
end;

{ TRegistroC410List }

destructor TRegistroC410List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC410List.GetItem(Index: Integer): TRegistroC410;
begin
  Result := TRegistroC410(Inherited Items[Index]);
end;

function TRegistroC410List.New: TRegistroC410;
begin
  Result := TRegistroC410.Create;
  Add(Result);
end;

procedure TRegistroC410List.SetItem(Index: Integer; const Value: TRegistroC410);
begin
  Put(Index, Value);
end;

{ TRegistroC420List }

destructor TRegistroC420List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC420List.GetItem(Index: Integer): TRegistroC420;
begin
  Result := TRegistroC420(Inherited Items[Index]);
end;

function TRegistroC420List.New: TRegistroC420;
begin
  Result := TRegistroC420.Create;
  Add(Result);
end;

procedure TRegistroC420List.SetItem(Index: Integer; const Value: TRegistroC420);
begin
  Put(Index, Value);
end;

{ TRegistroC425List }

destructor TRegistroC425List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC425List.GetItem(Index: Integer): TRegistroC425;
begin
  Result := TRegistroC425(Inherited Items[Index]);
end;

function TRegistroC425List.New: TRegistroC425;
begin
  Result := TRegistroC425.Create;
  Add(Result);
end;

procedure TRegistroC425List.SetItem(Index: Integer; const Value: TRegistroC425);
begin
  Put(Index, Value);
end;

{ TRegistroC460List }

destructor TRegistroC460List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC460List.GetItem(Index: Integer): TRegistroC460;
begin
  Result := TRegistroC460(Inherited Items[Index]);
end;

function TRegistroC460List.New: TRegistroC460;
begin
  Result := TRegistroC460.Create;
  Add(Result);
end;

procedure TRegistroC460List.SetItem(Index: Integer; const Value: TRegistroC460);
begin
  Put(Index, Value);
end;

{ TRegistroC470List }

destructor TRegistroC470List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC470List.GetItem(Index: Integer): TRegistroC470;
begin
  Result := TRegistroC470(Inherited Items[Index]);
end;

function TRegistroC470List.New: TRegistroC470;
begin
  Result := TRegistroC470.Create;
  Add(Result);
end;

procedure TRegistroC470List.SetItem(Index: Integer; const Value: TRegistroC470);
begin
  Put(Index, Value);
end;

{ TRegistroC490List }

destructor TRegistroC490List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC490List.GetItem(Index: Integer): TRegistroC490;
begin
  Result := TRegistroC490(Inherited Items[Index]);
end;

function TRegistroC490List.New: TRegistroC490;
begin
  Result := TRegistroC490.Create;
  Add(Result);
end;

procedure TRegistroC490List.SetItem(Index: Integer; const Value: TRegistroC490);
begin
  Put(Index, Value);
end;

{ TRegistroC495List }

destructor TRegistroC495List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC495List.GetItem(Index: Integer): TRegistroC495;
begin
  Result := TRegistroC495(Inherited Items[Index]);
end;

function TRegistroC495List.New: TRegistroC495;
begin
  Result := TRegistroC495.Create;
  Add(Result);
end;

procedure TRegistroC495List.SetItem(Index: Integer; const Value: TRegistroC495);
begin
  Put(Index, Value);
end;

{ TRegistroC500List }

destructor TRegistroC500List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC500List.GetItem(Index: Integer): TRegistroC500;
begin
  Result := TRegistroC500(Inherited Items[Index]);
end;

function TRegistroC500List.New: TRegistroC500;
begin
  Result := TRegistroC500.Create;
  Add(Result);
end;

procedure TRegistroC500List.SetItem(Index: Integer; const Value: TRegistroC500);
begin
  Put(Index, Value);
end;

{ TRegistroC510List }

destructor TRegistroC510List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC510List.GetItem(Index: Integer): TRegistroC510;
begin
  Result := TRegistroC510(Inherited Items[Index]);
end;

function TRegistroC510List.New: TRegistroC510;
begin
  Result := TRegistroC510.Create;
  Add(Result);
end;

procedure TRegistroC510List.SetItem(Index: Integer; const Value: TRegistroC510);
begin
  Put(Index, Value);
end;

{ TRegistroC590List }

destructor TRegistroC590List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC590List.GetItem(Index: Integer): TRegistroC590;
begin
  Result := TRegistroC590(Inherited Items[Index]);
end;

function TRegistroC590List.New: TRegistroC590;
begin
  Result := TRegistroC590.Create;
  Add(Result);
end;

procedure TRegistroC590List.SetItem(Index: Integer; const Value: TRegistroC590);
begin
  Put(Index, Value);
end;

{ TRegistroC600List }

destructor TRegistroC600List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC600List.GetItem(Index: Integer): TRegistroC600;
begin
  Result := TRegistroC600(Inherited Items[Index]);
end;

function TRegistroC600List.New: TRegistroC600;
begin
  Result := TRegistroC600.Create;
  Add(Result);
end;

procedure TRegistroC600List.SetItem(Index: Integer; const Value: TRegistroC600);
begin
  Put(Index, Value);
end;

{ TRegistroC601List }

destructor TRegistroC601List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC601List.GetItem(Index: Integer): TRegistroC601;
begin
  Result := TRegistroC601(Inherited Items[Index]);
end;

function TRegistroC601List.New: TRegistroC601;
begin
  Result := TRegistroC601.Create;
  Add(Result);
end;

procedure TRegistroC601List.SetItem(Index: Integer; const Value: TRegistroC601);
begin
  Put(Index, Value);
end;

{ TRegistroC610List }

destructor TRegistroC610List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC610List.GetItem(Index: Integer): TRegistroC610;
begin
  Result := TRegistroC610(Inherited Items[Index]);
end;

function TRegistroC610List.New: TRegistroC610;
begin
  Result := TRegistroC610.Create;
  Add(Result);
end;

procedure TRegistroC610List.SetItem(Index: Integer; const Value: TRegistroC610);
begin
  Put(Index, Value);
end;

{ TRegistroC620List }

destructor TRegistroC620List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC620List.GetItem(Index: Integer): TRegistroC620;
begin
  Result := TRegistroC620(Inherited Items[Index]);
end;

function TRegistroC620List.New: TRegistroC620;
begin
  Result := TRegistroC620.Create;
  Add(Result);
end;

procedure TRegistroC620List.SetItem(Index: Integer; const Value: TRegistroC620);
begin
  Put(Index, Value);
end;

{ TRegistroC690List }

destructor TRegistroC690List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC690List.GetItem(Index: Integer): TRegistroC690;
begin
  Result := TRegistroC690(Inherited Items[Index]);
end;

function TRegistroC690List.New: TRegistroC690;
begin
  Result := TRegistroC690.Create;
  Add(Result);
end;

procedure TRegistroC690List.SetItem(Index: Integer; const Value: TRegistroC690);
begin
  Put(Index, Value);
end;

{ TRegistroC700List }

destructor TRegistroC700List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC700List.GetItem(Index: Integer): TRegistroC700;
begin
  Result := TRegistroC700(Inherited Items[Index]);
end;

function TRegistroC700List.New: TRegistroC700;
begin
  Result := TRegistroC700.Create;
  Add(Result);
end;

procedure TRegistroC700List.SetItem(Index: Integer; const Value: TRegistroC700);
begin
  Put(Index, Value);
end;

{ TRegistroC790List }

destructor TRegistroC790List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC790List.GetItem(Index: Integer): TRegistroC790;
begin
  Result := TRegistroC790(Inherited Items[Index]);
end;

function TRegistroC790List.New: TRegistroC790;
begin
  Result := TRegistroC790.Create;
  Add(Result);
end;

procedure TRegistroC790List.SetItem(Index: Integer; const Value: TRegistroC790);
begin
  Put(Index, Value);
end;

{ TRegistroC791List }

destructor TRegistroC791List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroC791List.GetItem(Index: Integer): TRegistroC791;
begin
  Result := TRegistroC791(Inherited Items[Index]);
end;

function TRegistroC791List.New: TRegistroC791;
begin
  Result := TRegistroC791.Create;
  Add(Result);
end;

procedure TRegistroC791List.SetItem(Index: Integer; const Value: TRegistroC791);
begin
  Put(Index, Value);
end;

{ TRegistroC100 }

constructor TRegistroC100.Create;
begin
  FRegistroC110 := TRegistroC110List.Create;  /// BLOCO C - Lista de RegistroC110 (FILHO)
  FRegistroC120 := TRegistroC120List.Create;  /// BLOCO C - Lista de RegistroC110 (FILHO)
  FRegistroC130 := TRegistroC130List.Create;  /// BLOCO C - Lista de RegistroC110 (FILHO)
  FRegistroC140 := TRegistroC140List.Create;  /// BLOCO C - Lista de RegistroC140 (FILHO)
  FRegistroC160 := TRegistroC160List.Create;  /// BLOCO C - Lista de RegistroC110 (FILHO)
  FRegistroC165 := TRegistroC165List.Create;  /// BLOCO C - Lista de RegistroC110 (FILHO)
  FRegistroC170 := TRegistroC170List.Create;  /// BLOCO C - Lista de RegistroC170 (FILHO)
  FRegistroC190 := TRegistroC190List.Create;  /// BLOCO C - Lista de RegistroC190 (FILHO) {Jean Barreiros 19Nov2009}
  FRegistroC195 := TRegistroC195List.Create;  /// BLOCO C - Lista de RegistroC110 (FILHO)
end;

destructor TRegistroC100.Destroy;
begin
  FRegistroC110.Free;
  FRegistroC120.Free;
  FRegistroC130.Free;
  FRegistroC140.Free;
  FRegistroC160.Free;
  FRegistroC165.Free;
  FRegistroC170.Free;
  FRegistroC190.Free;
  FRegistroC195.Free;
  inherited;
end;

{ TRegistroC110 }

constructor TRegistroC110.Create;
begin
  FRegistroC111 := TRegistroC111List.Create;  /// BLOCO C - Lista de RegistroC111 (FILHO fo FILHO)
  FRegistroC112 := TRegistroC112List.Create;  /// BLOCO C - Lista de RegistroC111 (FILHO fo FILHO)
  FRegistroC113 := TRegistroC113List.Create;  /// BLOCO C - Lista de RegistroC111 (FILHO fo FILHO)
  FRegistroC114 := TRegistroC114List.Create;  /// BLOCO C - Lista de RegistroC111 (FILHO fo FILHO)
  FRegistroC115 := TRegistroC115List.Create;  /// BLOCO C - Lista de RegistroC111 (FILHO fo FILHO)
end;

destructor TRegistroC110.Destroy;
begin
  FRegistroC111.Free;
  FRegistroC112.Free;
  FRegistroC113.Free;
  FRegistroC114.Free;
  FRegistroC115.Free;
  inherited;
end;

{ TRegistroC140 }

constructor TRegistroC140.Create;
begin
  FRegistroC141 := TRegistroC141List.Create; // BLOCO C - Lista de Registro (FILHO do FILHO)
end;

destructor TRegistroC140.Destroy;
begin
  FRegistroC141.Free;
  inherited;
end;

{ TRegistroC460 }

constructor TRegistroC460.Create;
begin
  FRegistroC470 := TRegistroC470List.Create; // BLOCO C - Lista de Registro (FILHO do FILHO)
end;

destructor TRegistroC460.Destroy;
begin
  FRegistroC470.Free;
  inherited;
end;

{ TRegistroC350 }

constructor TRegistroC350.Create;
begin
  FRegistroC370 := TRegistroC370List.Create;  /// BLOCO C - Lista de RegistroC370 (FILHO)
  FRegistroC390 := TRegistroC390List.Create;  /// BLOCO C - Lista de RegistroC370 (FILHO)
end;

destructor TRegistroC350.Destroy;
begin
  FRegistroC370.Free;
  FRegistroC390.Free;  
  inherited;
end;

constructor TRegistroC420.Create;
begin
  FRegistroC425 := TRegistroC425List.Create;
end;

destructor TRegistroC420.Destroy;
begin
  FRegistroC425.Free;
  inherited;
end;

{ TRegistroC400 }

constructor TRegistroC400.Create;
begin
  FRegistroC405 := TRegistroC405List.Create;
end;

destructor TRegistroC400.Destroy;
begin
  FRegistroC405.Free;
  inherited;
end;

{ TRegistroC405 }

constructor TRegistroC405.Create;
begin
  FRegistroC410 := TRegistroC410List.Create;
  FRegistroC420 := TRegistroC420List.Create;
  FRegistroC460 := TRegistroC460List.Create;
  FRegistroC490 := TRegistroC490List.Create;
end;

destructor TRegistroC405.Destroy;
begin
  FRegistroC410.Free;
  FRegistroC420.Free;
  FRegistroC460.Free;
  FRegistroC490.Free;
  inherited;
end;

{ TRegistroC170 }

constructor TRegistroC170.Create;
begin
  FRegistroC171 := TRegistroC171List.Create;
  FRegistroC172 := TRegistroC172List.Create;
  FRegistroC173 := TRegistroC173List.Create;
  FRegistroC174 := TRegistroC174List.Create;
  FRegistroC175 := TRegistroC175List.Create;
  FRegistroC176 := TRegistroC176List.Create;
  FRegistroC177 := TRegistroC177List.Create;
  FRegistroC178 := TRegistroC178List.Create;
  FRegistroC179 := TRegistroC179List.Create;
end;

destructor TRegistroC170.Destroy;
begin
  FRegistroC171.Free;
  FRegistroC172.Free;
  FRegistroC173.Free;
  FRegistroC174.Free;
  FRegistroC175.Free;
  FRegistroC176.Free;
  FRegistroC177.Free;
  FRegistroC178.Free;
  FRegistroC179.Free;
  inherited;
end;

{ TRegistroC500 }

constructor TRegistroC500.Create;
begin
  FRegistroC510 := TRegistroC510List.Create;  /// BLOCO C - Lista de RegistroC510 (FILHO)
  FRegistroC590 := TRegistroC590List.Create;  /// BLOCO C - Lista de RegistroC590 (FILHO)
end;

destructor TRegistroC500.Destroy;
begin
  FRegistroC510.Free;
  FRegistroC590.Free;
  inherited;
end;

end.
