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
|* 15/03/2010: Alessandro Yamasaki
|*  - Adicionado o REGISTRO 0500: PLANO DE CONTAS CONT�BEIS
*******************************************************************************}

unit ACBrEFDBloco_0;

interface

uses
  SysUtils, Classes, DateUtils, ACBrEFDBlocos;

type
  /// Registro 0000 - ABERTURA DO ARQUIVO DIGITAL E IDENTIFICA��O DA ENTIDADE

  TRegistro0000 = class(TPersistent)
  private
    fCOD_VER: integer;         /// C�digo da vers�o do leiaute: 100; 101
    fCOD_FIN: integer;         /// C�digo da finalidade do arquivo: 0 - Remessa do arquivo original / 1 - Remessa do arquivo substituto.
    fDT_INI: TDateTime;        /// Data inicial das informa��es contidas no arquivo
    fDT_FIN: TDateTime;        /// Data final das informa��es contidas no arquivo
    fNOME: AnsiString;         /// Nome empresarial do contribuinte:
    fCNPJ: AnsiString;         /// N�mero de inscri��o do contribuinte:
    fCPF: AnsiString;          /// N�mero de inscri��o do contribuinte:
    fUF: AnsiString;           /// Sigla da unidade da federa��o:
    fIE: AnsiString;           /// Inscri��o Estadual do contribuinte:
    fCOD_MUN: integer;         /// C�digo do munic�pio do domic�lio fiscal:
    fIM: AnsiString;           /// Inscri��o Municipal do contribuinte:
    fSUFRAMA: AnsiString;      /// N�mero de inscri��o do contribuinte:
    fIND_PERFIL: AnsiString;   /// Perfil de apresenta��o do arquivo fiscal: A - Perfil A / B - Perfil B / C - Perfil C
    fIND_ATIV: integer;        /// Indicador de tipo de atividade: 0 - Industrial ou equiparado a industrial; 1 - Outros.
  public
    property COD_VER: integer read FCOD_VER write FCOD_VER;
    property COD_FIN: integer read FCOD_FIN write FCOD_FIN;
    property DT_INI: TDateTime read FDT_INI write FDT_INI;
    property DT_FIN: TDateTime read FDT_FIN write FDT_FIN;
    property NOME: AnsiString read FNOME write FNOME;
    property CNPJ: AnsiString read FCNPJ write FCNPJ;
    property CPF: AnsiString read FCPF write FCPF;
    property UF: AnsiString read FUF write FUF;
    property IE: AnsiString read FIE write FIE;
    property COD_MUN: integer read FCOD_MUN write FCOD_MUN;
    property IM: AnsiString read FIM write FIM;
    property SUFRAMA: AnsiString read FSUFRAMA write FSUFRAMA;
    property IND_PERFIL: AnsiString read FIND_PERFIL write FIND_PERFIL;
    property IND_ATIV: integer read FIND_ATIV write FIND_ATIV;
  end;

  /// Registro 0001 - ABERTURA DO BLOCO 0

  TRegistro0001 = class(TOpenBlocos)
  private
  public
  end;

  TRegistro0175List = class;
  TRegistro0205List = class;
  TRegistro0206List = class;
  TRegistro0220List = class;

  /// Registro 0005 - DADOS COMPLEMENTARES DA ENTIDADE

  TRegistro0005 = class(TPersistent)
  private
    fFANTASIA: AnsiString;     /// Nome de fantasia associado:
    fCEP: AnsiString;          /// C�digo de Endere�amento Postal:
    fENDERECO: AnsiString;     /// Logradouro e endere�o do im�vel:
    fNUM: AnsiString;          /// N�mero do im�vel:
    fCOMPL: AnsiString;        /// Dados complementares do endere�o:
    fBAIRRO: AnsiString;       /// Bairro em que o im�vel est� situado:
    fFONE: AnsiString;         /// N�mero do telefone:
    fFAX: AnsiString;          /// N�mero do fax:
    fEMAIL: AnsiString;        /// Endere�o do correio eletr�nico:
  public
    property FANTASIA: AnsiString read fFANTASIA write fFANTASIA;
    property CEP: AnsiString read FCEP write FCEP;
    property ENDERECO: AnsiString read FENDERECO write FENDERECO;
    property NUM: AnsiString read FNUM write FNUM;
    property COMPL: AnsiString read FCOMPL write FCOMPL;
    property BAIRRO: AnsiString read FBAIRRO write FBAIRRO;
    property FONE: AnsiString read FFONE write FFONE;
    property FAX: AnsiString read FFAX write FFAX;
    property EMAIL: AnsiString read FEMAIL write FEMAIL;
  end;

  /// Registro 0015 - DADOS DO CONTRIBUINTE SUBSTITUTO

  TRegistro0015 = class(TPersistent)
  private
    fUF_ST: AnsiString;   /// Sigla da unidade da federa��o:
    fIE_ST: AnsiString;   /// Inscri��o Estadual:
  public
    property UF_ST: AnsiString read FUF_ST write FUF_ST;
    property IE_ST: AnsiString read FIE_ST write FIE_ST;
  end;

  /// Registro 0015 - Lista

  TRegistro0015List = class(TList)
  private
    function GetItem(Index: Integer): TRegistro0015;
    procedure SetItem(Index: Integer; const Value: TRegistro0015);
  public
    destructor Destroy; override;
    function New: TRegistro0015;
    property Items[Index: Integer]: TRegistro0015 read GetItem write SetItem;
  end;

  /// Registro 0100 - DADOS DO CONTABILISTA

  TRegistro0100 = class(TPersistent)
  private
    fNOME: AnsiString;        /// Nome do contabilista/escrit�rio:
    fCPF: AnsiString;         /// N�mero de inscri��o no CPF:
    fCRC: AnsiString;         /// N�mero de inscri��o no Conselho Regional:
    fCNPJ: AnsiString;        /// CNPJ do escrit�rio de contabilidade, se houver:
    fCEP: AnsiString;         /// C�digo de Endere�amento Postal:
    fENDERECO: AnsiString;    /// Logradouro e endere�o do im�vel:
    fNUM: AnsiString;         /// N�mero do im�vel:
    fCOMPL: AnsiString;       /// Dados complementares do endere�o:
    fBAIRRO: AnsiString;      /// Bairro em que o im�vel est� situado:
    fFONE: AnsiString;        /// N�mero do telefone:
    fFAX: AnsiString;         /// N�mero do fax:
    fEMAIL: AnsiString;       /// Endere�o do correio eletr�nico:
    fCOD_MUN: integer;        /// C�digo do munic�pio, conforme tabela IBGE:
  public
    property NOME: AnsiString read FNOME write FNOME;
    property CPF: AnsiString read FCPF write FCPF;
    property CRC: AnsiString read FCRC write FCRC;
    property CNPJ: AnsiString read FCNPJ write FCNPJ;
    property CEP: AnsiString read FCEP write FCEP;
    property ENDERECO: AnsiString read FENDERECO write FENDERECO;
    property NUM: AnsiString read FNUM write FNUM;
    property COMPL: AnsiString read FCOMPL write FCOMPL;
    property BAIRRO: AnsiString read FBAIRRO write FBAIRRO;
    property FONE: AnsiString read FFONE write FFONE;
    property FAX: AnsiString read FFAX write FFAX;
    property EMAIL: AnsiString read FEMAIL write FEMAIL;
    property COD_MUN: integer read FCOD_MUN write FCOD_MUN;
  end;

  /// Registro 0150 - TABELA DE CADASTRO DO PARTICIPANTE

  TRegistro0150 = class(TPersistent)
  private
    fCOD_PART: AnsiString;    /// C�digo de identifica��o do participante:
    fNOME: AnsiString;        /// Nome pessoal ou empresarial:
    fCOD_PAIS: AnsiString;    /// C�digo do pa�s do participante:
    fCNPJ: AnsiString;        /// CNPJ do participante:
    fCPF: AnsiString;         /// CPF do participante na unidade da federa��o do destinat�rio:
    fIE: AnsiString;          /// Inscri��o Estadual do participante:
    fCOD_MUN: integer;        /// C�digo do munic�pio:
    fSUFRAMA: AnsiString;     /// N�mero de inscri��o na Suframa:
    fENDERECO: AnsiString;    /// Logradouro e endere�o do im�vel:
    fNUM: AnsiString;         /// N�mero do im�vel:
    fCOMPL: AnsiString;       /// Dados complementares do endere�o:
    fBAIRRO: AnsiString;      /// Bairro em que o im�vel est� situado:

    FRegistro0175: TRegistro0175List;  /// BLOCO C - Lista de Registro0175 (FILHO)
  public
    constructor Create; virtual; /// Create
    destructor Destroy; override; /// Destroy

    property COD_PART: AnsiString read FCOD_PART write FCOD_PART;
    property NOME: AnsiString read FNOME write FNOME;
    property COD_PAIS: AnsiString read FCOD_PAIS write FCOD_PAIS;
    property CNPJ: AnsiString read FCNPJ write FCNPJ;
    property CPF: AnsiString read FCPF write FCPF;
    property IE: AnsiString read FIE write FIE;
    property COD_MUN: integer read FCOD_MUN write FCOD_MUN;
    property SUFRAMA: AnsiString read FSUFRAMA write FSUFRAMA;
    property ENDERECO: AnsiString read FENDERECO write FENDERECO;
    property NUM: AnsiString read FNUM write FNUM;
    property COMPL: AnsiString read FCOMPL write FCOMPL;
    property BAIRRO: AnsiString read FBAIRRO write FBAIRRO;
    /// Registros FILHOS
    property Registro0175: TRegistro0175List read FRegistro0175 write FRegistro0175;
  end;

  /// Registro 0150 - Lista

  TRegistro0150List = class(TList)
  private
    function GetItem(Index: Integer): TRegistro0150;
    procedure SetItem(Index: Integer; const Value: TRegistro0150);
  public
    destructor Destroy; override;
    function New: TRegistro0150;
    function LocalizaRegistro(pCOD_PART: AnsiString): boolean;
    property Items[Index: Integer]: TRegistro0150 read GetItem write SetItem;
  end;

  /// Registro 0175 - ALTERA��O DA TABELA DE CADASTRO DE PARTICIPANTE

  TRegistro0175 = class(TPersistent)
  private
    fDT_ALT: TDateTime;      /// Data de altera��o do cadastro:
    fNR_CAMPO: AnsiString;       /// N�mero do campo alterado (Somente campos 03 a 13):
    fCONT_ANT: AnsiString;       /// Conte�do anterior do campo:
  public
    property DT_ALT: TDateTime read FDT_ALT write FDT_ALT;
    property NR_CAMPO: AnsiString read FNR_CAMPO write FNR_CAMPO;
    property CONT_ANT: AnsiString read FCONT_ANT write FCONT_ANT;
  end;

  /// Registro 0175 - Lista

  TRegistro0175List = class(TList)
  private
    function GetItem(Index: Integer): TRegistro0175;
    procedure SetItem(Index: Integer; const Value: TRegistro0175);
  public
    destructor Destroy; override;
    function New: TRegistro0175;
    property Items[Index: Integer]: TRegistro0175 read GetItem write SetItem;
  end;

  /// Registro 0190 - IDENTIFICA��O DAS UNIDADES DE MEDIDA

  TRegistro0190 = class(TPersistent)
  private
    fUNID: AnsiString;        /// C�digo da unidade de medida:
    fDESCR: AnsiString;       /// Descri��o da unidade de medida:
  public
    property UNID: AnsiString read FUNID write FUNID;
    property DESCR: AnsiString read FDESCR write FDESCR;
  end;

  /// Registro 0190 - Lista

  TRegistro0190List = class(TList)
  private
    function GetItem(Index: Integer): TRegistro0190;
    procedure SetItem(Index: Integer; const Value: TRegistro0190);
  public
    destructor Destroy; override;
    function New: TRegistro0190;
    function LocalizaRegistro(pUNID: AnsiString): boolean;
    property Items[Index: Integer]: TRegistro0190 read GetItem write SetItem;
  end;

  /// Registro 0200 - TABELA DE IDENTIFICA��O DO ITEM (PRODUTO E SERVI�OS)

  TRegistro0200 = class(TPersistent)
  private
    fCOD_ITEM: AnsiString;       /// C�digo do item:
    fDESCR_ITEM: AnsiString;     /// Descri��o do item:
    fCOD_BARRA: AnsiString;      /// C�digo de barra do produto, se houver:
    fCOD_ANT_ITEM: AnsiString;   /// C�digo anterior do item (ultima apresentado):
    fUNID_INV: AnsiString;       /// Unidade de medida do estoque:
    fTIPO_ITEM: AnsiString;      /// Tipo do item - Atividades Industriais, Comerciais e Servi�os: 00 - Mercadoria para Revenda, 01 - Mat�ria-Prima,  02 - Embalagem, 03 - Produto em Processo, 04 - Produto Acabado, 05 - Subproduto, 06 - Produto Intermedi�rio, 07 - Material de Uso e Consumo, 08 - Ativo Imobilizado, 09 - Servi�os, 10 - Outros insumos, 99 - Outras
    fCOD_NCM: AnsiString;        /// C�digo da Nomenclatura Comum do Mercosul:
    fEX_IPI: AnsiString;         /// C�digo EX, conforme a TIPI:
    fCOD_GEN: AnsiString;        /// C�digo g�nero item, tabela indicada item 4.2.1:
    fCOD_LST: AnsiString;        /// C�digo servi�o Anexo I - Lei n�116/03:
    fALIQ_ICMS: Currency;      /// Al�quota ICMS aplic�vel (opera��es internas):

    FRegistro0205: TRegistro0205List;  /// BLOCO C - Lista de Registro0205 (FILHO)
    FRegistro0206: TRegistro0206List;  /// BLOCO C - Lista de Registro0206 (FILHO)
    FRegistro0220: TRegistro0220List;  /// BLOCO C - Lista de Registro0220 (FILHO)
  public
    constructor Create; virtual; /// Create
    destructor Destroy; override; /// Destroy

    property COD_ITEM: AnsiString read FCOD_ITEM write FCOD_ITEM;
    property DESCR_ITEM: AnsiString read FDESCR_ITEM write FDESCR_ITEM;
    property COD_BARRA: AnsiString read FCOD_BARRA write FCOD_BARRA;
    property COD_ANT_ITEM: AnsiString read FCOD_ANT_ITEM write FCOD_ANT_ITEM;
    property UNID_INV: AnsiString read FUNID_INV write FUNID_INV;
    property TIPO_ITEM: AnsiString read FTIPO_ITEM write FTIPO_ITEM;
    property COD_NCM: AnsiString read FCOD_NCM write FCOD_NCM;
    property EX_IPI: AnsiString read FEX_IPI write FEX_IPI;
    property COD_GEN: AnsiString read FCOD_GEN write FCOD_GEN;
    property COD_LST: AnsiString read FCOD_LST write FCOD_LST;
    property ALIQ_ICMS: Currency read FALIQ_ICMS write FALIQ_ICMS;
    /// Registros FILHOS
    property Registro0205: TRegistro0205List read FRegistro0205 write FRegistro0205;
    property Registro0206: TRegistro0206List read FRegistro0206 write FRegistro0206;
    property Registro0220: TRegistro0220List read FRegistro0220 write FRegistro0220;
  end;

  /// Registro 0200 - Lista

  TRegistro0200List = class(TList)
  private
    function GetItem(Index: Integer): TRegistro0200;
    procedure SetItem(Index: Integer; const Value: TRegistro0200);
  public
    destructor Destroy; override;
    function New: TRegistro0200;
    function LocalizaRegistro(pCOD_ITEM: AnsiString): boolean;
    property Items[Index: Integer]: TRegistro0200 read GetItem write SetItem;
  end;

  /// Registro 0205 - C�DIGO ANTERIOR DO ITEM

  TRegistro0205 = class(TPersistent)
  private
    fDESCR_ANT_ITEM: AnsiString;    /// Descri��o anterior do item:
    fDT_INI: TDateTime;             /// Data inicial de utiliza��o do c�digo:
    fDT_FIN: TDateTime;             /// Data final de utiliza��o do c�digo:
  public
    property DESCR_ANT_ITEM: AnsiString read FDESCR_ANT_ITEM write FDESCR_ANT_ITEM;
    property DT_INI: TDateTime read FDT_INI write FDT_INI;
    property DT_FIN: TDateTime read FDT_FIN write FDT_FIN;
  end;

  /// Registro 0205 - Lista

  TRegistro0205List = class(TList)
  private
    function GetItem(Index: Integer): TRegistro0205;
    procedure SetItem(Index: Integer; const Value: TRegistro0205);
  public
    destructor Destroy; override;
    function New: TRegistro0205;
    property Items[Index: Integer]: TRegistro0205 read GetItem write SetItem;
  end;

  /// Registro 0206 - C�DIGO DE PRODUTO CONFORME TABELA ANP (COMBUST�VEIS)

  TRegistro0206 = class(TPersistent)
  private
    fCOD_COMB: AnsiString;       /// C�digo do combust�vel, conforme tabela publicada pela ANP:
  public
    property COD_COMB: AnsiString read FCOD_COMB write FCOD_COMB;
  end;

  /// Registro 0206 - Lista

  TRegistro0206List = class(TList)
  private
    function GetItem(Index: Integer): TRegistro0206;
    procedure SetItem(Index: Integer; const Value: TRegistro0206);
  public
    destructor Destroy; override;
    function New: TRegistro0206;
    property Items[Index: Integer]: TRegistro0206 read GetItem write SetItem;
  end;

  /// Registro 0220 - FATORES DE CONVERS�O DE UNIDADES

  TRegistro0220 = class(TPersistent)
  private
    fUNID_CONV: AnsiString;  /// Unidade comercial a ser convertida na unidade de estoque, referida em 0200:
    fFAT_CONV: Double;       /// Fator de convers�o:
  public
    property UNID_CONV: AnsiString read FUNID_CONV write FUNID_CONV;
    property FAT_CONV: Double read FFAT_CONV write FFAT_CONV;
  end;

  /// Registro 0220 - Lista

  TRegistro0220List = class(TList)
  private
    function GetItem(Index: Integer): TRegistro0220;
    procedure SetItem(Index: Integer; const Value: TRegistro0220);
  public
    destructor Destroy; override;
    function New: TRegistro0220;
    property Items[Index: Integer]: TRegistro0220 read GetItem write SetItem;
  end;

  /// Registro 0400 - TABELA DE NATUREZA DA OPERA��O/PRESTA��O

  TRegistro0400 = class(TPersistent)
  private
    fCOD_NAT: AnsiString;        /// C�digo da natureza:
    fDESCR_NAT: AnsiString;      /// Descri��o da natureza:
  public
    property COD_NAT: AnsiString read FCOD_NAT write FCOD_NAT;
    property DESCR_NAT: AnsiString read FDESCR_NAT write FDESCR_NAT;
  end;

  /// Registro 0400 - Lista

  TRegistro0400List = class(TList)
  private
    function GetItem(Index: Integer): TRegistro0400;
    procedure SetItem(Index: Integer; const Value: TRegistro0400);
  public
    destructor Destroy; override;
    function New: TRegistro0400;
    function LocalizaRegistro(pCOD_NAT: AnsiString): boolean;
    property Items[Index: Integer]: TRegistro0400 read GetItem write SetItem;
  end;

  /// Registro 0450 - TABELA DE INFORMA��O COMPLEMENTAR/OBSERVA��O

  TRegistro0450 = class(TPersistent)
  private
    fCOD_INF: AnsiString;     /// C�digo da informa��o complementar do documento fiscal:
    fTXT: AnsiString;         /// Texto livre:
  public
    property COD_INF: AnsiString read FCOD_INF write FCOD_INF;
    property TXT: AnsiString read FTXT write FTXT;
  end;

  /// Registro 0450 - Lista

  TRegistro0450List = class(TList)
  private
    function GetItem(Index: Integer): TRegistro0450;
    procedure SetItem(Index: Integer; const Value: TRegistro0450);
  public
    destructor Destroy; override;
    function New: TRegistro0450;
    property Items[Index: Integer]: TRegistro0450 read GetItem write SetItem;
  end;

  /// Registro 0460 - TABELA DE OBSERVA��ES DO LAN�AMENTO FISCAL

  TRegistro0460 = class(TPersistent)
  private
    fCOD_OBS: AnsiString;     /// C�digo da Observa��o do lan�amento fiscal:
    fTXT: AnsiString;         /// Descri��o da observa��o vinculada ao lan�amento fiscal:
  public
    property COD_OBS: AnsiString read FCOD_OBS write FCOD_OBS;
    property TXT: AnsiString read FTXT write FTXT;
  end;

  /// Registro 0460 - Lista

  TRegistro0460List = class(TList)
  private
    function GetItem(Index: Integer): TRegistro0460;
    procedure SetItem(Index: Integer; const Value: TRegistro0460);
  public
    destructor Destroy; override;
    function New: TRegistro0460;
    property Items[Index: Integer]: TRegistro0460 read GetItem write SetItem;
  end;

  /// Registro 0500 - TABELA DE PLANO DE CONTAS CONT�BEIS
  TRegistro0500 = class(TPersistent)
  private
    fDT_ALT     : TDateTime;        // Data da inclus�o/altera��o
    fCOD_NAT_CC : AnsiString;       // C�digo da natureza da conta/grupo de contas
    fIND_CTA    : AnsiString;       // Indicador do tipo de conta:  S - Sint�tica ou A - Anal�tica
    fNIVEL      : AnsiString;       // N�vel da conta anal�tica/grupo de contas
    fCOD_CTA    : AnsiString;       // C�digo da conta anal�tica/grupo de conta
    fNOME_CTA   : AnsiString;       // Nome da conta anal�tica/grupo de contas
  public
    property DT_ALT: TDateTime read FDT_ALT write FDT_ALT;
    property COD_NAT_CC: AnsiString read FCOD_NAT_CC write FCOD_NAT_CC;
    property IND_CTA: AnsiString read FIND_CTA write FIND_CTA;
    property NIVEL: AnsiString read FNIVEL write FNIVEL;
    property COD_CTA: AnsiString read FCOD_CTA write FCOD_CTA;
    property NOME_CTA: AnsiString read FNOME_CTA write FNOME_CTA;
  end;

  /// Registro 0500 - Lista
  TRegistro0500List = class(TList)
  private
    function GetItem(Index: Integer): TRegistro0500;
    procedure SetItem(Index: Integer; const Value: TRegistro0500);
  public
    destructor Destroy; override;
    function New: TRegistro0500;
    property Items[Index: Integer]: TRegistro0500 read GetItem write SetItem;
  end;

  /// Registro 0600 - CENTRO DE CUSTOS
  TRegistro0600 = class(TPersistent)
  private
    fDT_ALT     : TDateTime;        // Data da inclus�o/altera��o
    fCOD_CCUS   : AnsiString;       // C�digo do centro de custos.
    fCCUS       : AnsiString;       // Nome do centro de custos.
  public
    property DT_ALT: TDateTime read FDT_ALT write FDT_ALT;
    property COD_CCUS: AnsiString read FCOD_CCUS write FCOD_CCUS;
    property CCUS: AnsiString read FCCUS write FCCUS;
  end;

  /// Registro 0600 - Lista
  TRegistro0600List = class(TList)
  private
    function GetItem(Index: Integer): TRegistro0600;
    procedure SetItem(Index: Integer; const Value: TRegistro0600);
  public
    destructor Destroy; override;
    function New: TRegistro0600;
    property Items[Index: Integer]: TRegistro0600 read GetItem write SetItem;
  end;

  /// Registro 0990 - ENCERRAMENTO DO BLOCO 0

  TRegistro0990 = class(TPersistent)
  private
    fQTD_LIN_0: Integer; /// Quantidade total de linhas do Bloco 0
  public
    property QTD_LIN_0: Integer read fQTD_LIN_0 write fQTD_LIN_0;
  end;

implementation

{* TRegistro0015List *}

destructor TRegistro0015List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistro0015List.GetItem(Index: Integer): TRegistro0015;
begin
  Result := TRegistro0015(Inherited Items[Index]);
end;

function TRegistro0015List.New: TRegistro0015;
begin
  Result := TRegistro0015.Create;
  Add(Result);
end;

procedure TRegistro0015List.SetItem(Index: Integer; const Value: TRegistro0015);
begin
  Put(Index, Value);
end;

{ TRegistro0150List }

destructor TRegistro0150List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistro0150List.GetItem(Index: Integer): TRegistro0150;
begin
  Result := TRegistro0150(Inherited Items[Index]);
end;

function TRegistro0150List.LocalizaRegistro(pCOD_PART: AnsiString): boolean;
var
intFor: integer;
begin
   Result := false;
   for intFor := 0 to Self.Count - 1 do
   begin
      if Self.Items[intFor].COD_PART = pCOD_PART then
      begin
         Result := true;
         Break;
      end;
   end;
end;

function TRegistro0150List.New: TRegistro0150;
begin
  Result := TRegistro0150.Create;
  Add(Result);
end;

procedure TRegistro0150List.SetItem(Index: Integer; const Value: TRegistro0150);
begin
  Put(Index, Value);
end;

{ TRegistro0175List }

destructor TRegistro0175List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistro0175List.GetItem(Index: Integer): TRegistro0175;
begin
  Result := TRegistro0175(Inherited Items[Index]);
end;

function TRegistro0175List.New: TRegistro0175;
begin
  Result := TRegistro0175.Create;
  Add(Result);
end;

procedure TRegistro0175List.SetItem(Index: Integer; const Value: TRegistro0175);
begin
  Put(Index, Value);
end;

{ TRegistro0190List }

destructor TRegistro0190List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistro0190List.GetItem(Index: Integer): TRegistro0190;
begin
  Result := TRegistro0190(Inherited Items[Index]);
end;

function TRegistro0190List.LocalizaRegistro(pUNID: AnsiString): boolean;
var
intFor: integer;
begin
   Result := false;
   for intFor := 0 to Self.Count - 1 do
   begin
      if Self.Items[intFor].UNID = pUNID then
      begin
         Result := true;
         Break;
      end;
   end;
end;

function TRegistro0190List.New: TRegistro0190;
begin
  Result := TRegistro0190.Create;
  Add(Result);
end;

procedure TRegistro0190List.SetItem(Index: Integer; const Value: TRegistro0190);
begin
  Put(Index, Value);
end;

{ TRegistro0200List }

destructor TRegistro0200List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistro0200List.GetItem(Index: Integer): TRegistro0200;
begin
  Result := TRegistro0200(Inherited Items[Index]);
end;

function TRegistro0200List.LocalizaRegistro(pCOD_ITEM: AnsiString): boolean;
var
intFor: integer;
begin
   Result := false;
   for intFor := 0 to Self.Count - 1 do
   begin
      if Self.Items[intFor].COD_ITEM = pCOD_ITEM then
      begin
         Result := true;
         Break;
      end;
   end;
end;

function TRegistro0200List.New: TRegistro0200;
begin
  Result := TRegistro0200.Create;
  Add(Result);
end;

procedure TRegistro0200List.SetItem(Index: Integer; const Value: TRegistro0200);
begin
  Put(Index, Value);
end;

{ TRegistro0205List }

destructor TRegistro0205List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistro0205List.GetItem(Index: Integer): TRegistro0205;
begin
  Result := TRegistro0205(Inherited Items[Index]);
end;

function TRegistro0205List.New: TRegistro0205;
begin
  Result := TRegistro0205.Create;
  Add(Result);
end;

procedure TRegistro0205List.SetItem(Index: Integer; const Value: TRegistro0205);
begin
  Put(Index, Value);
end;

{ TRegistro0206List }

destructor TRegistro0206List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistro0206List.GetItem(Index: Integer): TRegistro0206;
begin
  Result := TRegistro0206(Inherited Items[Index]);
end;

function TRegistro0206List.New: TRegistro0206;
begin
  Result := TRegistro0206.Create;
  Add(Result);
end;

procedure TRegistro0206List.SetItem(Index: Integer; const Value: TRegistro0206);
begin
  Put(Index, Value);
end;

{ TRegistro0220List }

destructor TRegistro0220List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistro0220List.GetItem(Index: Integer): TRegistro0220;
begin
  Result := TRegistro0220(Inherited Items[Index]);
end;

function TRegistro0220List.New: TRegistro0220;
begin
  Result := TRegistro0220.Create;
  Add(Result);
end;

procedure TRegistro0220List.SetItem(Index: Integer; const Value: TRegistro0220);
begin
  Put(Index, Value);
end;

{ TRegistro0400List }

destructor TRegistro0400List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistro0400List.GetItem(Index: Integer): TRegistro0400;
begin
  Result := TRegistro0400(Inherited Items[Index]);
end;

function TRegistro0400List.LocalizaRegistro(pCOD_NAT: AnsiString): boolean;
var
intFor: integer;
begin
   Result := false;
   for intFor := 0 to Self.Count - 1 do
   begin
      if Self.Items[intFor].COD_NAT = pCOD_NAT then
      begin
         Result := true;
         Break;
      end;
   end;
end;

function TRegistro0400List.New: TRegistro0400;
begin
  Result := TRegistro0400.Create;
  Add(Result);
end;

procedure TRegistro0400List.SetItem(Index: Integer; const Value: TRegistro0400);
begin
  Put(Index, Value);
end;

{ TRegistro0450List }

destructor TRegistro0450List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistro0450List.GetItem(Index: Integer): TRegistro0450;
begin
  Result := TRegistro0450(Inherited Items[Index]);
end;

function TRegistro0450List.New: TRegistro0450;
begin
  Result := TRegistro0450.Create;
  Add(Result);
end;

procedure TRegistro0450List.SetItem(Index: Integer; const Value: TRegistro0450);
begin
  Put(Index, Value);
end;

{ TRegistro0460List }

destructor TRegistro0460List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistro0460List.GetItem(Index: Integer): TRegistro0460;
begin
  Result := TRegistro0460(inherited Items[Index]);
end;

function TRegistro0460List.New: TRegistro0460;
begin
  Result := TRegistro0460.Create;
  Add(Result);
end;

procedure TRegistro0460List.SetItem(Index: Integer; const Value: TRegistro0460);
begin
  Put(Index, Value);
end;

{ TRegistro0150 }

constructor TRegistro0150.Create;
begin
  FRegistro0175 := TRegistro0175List.Create;
end;

destructor TRegistro0150.Destroy;
begin
  FRegistro0175.Free;
  inherited;
end;

{ TRegistro0200 }

constructor TRegistro0200.Create;
begin
   FRegistro0205 := TRegistro0205List.Create;
   FRegistro0206 := TRegistro0206List.Create;
   FRegistro0220 := TRegistro0220List.Create;
end;

destructor TRegistro0200.Destroy;
begin
  FRegistro0205.Free;
  FRegistro0206.Free;
  FRegistro0220.Free;
  inherited;
end;

{ TRegistro0500List }

destructor TRegistro0500List.Destroy;
var
  intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistro0500List.GetItem(Index: Integer): TRegistro0500;
begin
  Result := TRegistro0500(inherited Items[Index]);
end;

function TRegistro0500List.New: TRegistro0500;
begin
  Result := TRegistro0500.Create;
  Add(Result);
end;

procedure TRegistro0500List.SetItem(Index: Integer; const Value: TRegistro0500);
begin
  Put(Index, Value);
end;

{ TRegistro0600List }

destructor TRegistro0600List.Destroy;
var
  intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistro0600List.GetItem(Index: Integer): TRegistro0600;
begin
  Result := TRegistro0600(inherited Items[Index]);
end;

function TRegistro0600List.New: TRegistro0600;
begin
  Result := TRegistro0600.Create;
  Add(Result);
end;

procedure TRegistro0600List.SetItem(Index: Integer; const Value: TRegistro0600);
begin
  Put(Index, Value);
end;

end.
