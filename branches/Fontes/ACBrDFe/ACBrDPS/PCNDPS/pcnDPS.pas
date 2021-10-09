{ **************************************************************************** }
{ Projeto: Componentes ACBr                                                    }
{ Biblioteca multiplataforma de componentes Delphi para interação com equipa-  }
{ mentos de Automação Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2009 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:   Italo Jurisato Junior                         }
{                                                                              }
{ Você pode obter a última versão desse arquivo na pagina do  Projeto ACBr     }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{ Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la  }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }
{                                                                              }
{ Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM    }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU      }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)              }
{                                                                              }
{ Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto }
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,  }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Você também pode obter uma copia da licença em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Simões de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{ Praça Anita Costa, 34 - Tatuí - SP - 18270-410                               }
{                                                                              }
{ **************************************************************************** }

{******************************************************************************
|* Historico
|*
|* 29/11/2018: Italo Jurisato Junior
******************************************************************************}

{$I ACBr.inc}

unit pcnDPS;

interface

uses
  SysUtils, Classes, Contnrs,
  pcnConversao, pcnSignature, pcnGerador, pcnConversaoDPS, pcnProcDPS;

type

 { TEnderNac }

  TEnderNac = class(TObject)
  private
    FxLgr: String;
    Fnro: String;
    fxCpl: String;
    FxBairro: String;
    FcMun: Integer;
    FUF: String;
    FCEP: Integer;
  public
    procedure Assign(Source: TEnderNac);
  published
    property xLgr: String    read FxLgr    write FxLgr;
    property nro: String     read Fnro     write Fnro;
    property xCpl: String    read FxCpl    write FxCpl;
    property xBairro: String read FxBairro write FxBairro;
    property cMun: Integer   read FcMun    write FcMun;
    property UF: String      read FUF      write FUF;
    property CEP: Integer    read FCEP     write FCEP;
  end;

  { TEnderExt }

  TEnderExt = class(TObject)
  private
    FcPais: string;
    FxEnderExt: String;
  public
    procedure Assign(Source: TEnderExt);
  published
    property cPais: string     read FcPais     write FcPais;
    property xEnderExt: String read FxEnderExt write FxEnderExt;
  end;
  
  { TInfoAtor }

  TInfoAtor = class(TObject)
  private
    FCNPJCPF: String;
    FNIF: String;
    FIM: String;
    FxNome: String;
    FenderNac: TEnderNac;
    FenderExt: TEnderExt;
    Ffone: String;
    Femail: String;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Assign(Source: TInfoAtor);

    property CNPJCPF: String     read FCNPJCPF  write FCNPJCPF;
    property NIF: String         read FNIF      write FNIF;
    property IM: String          read FIM       write FIM;
    property xNome: String       read FxNome    write FxNome;
    property enderNac: TEnderNac read FenderNac write FenderNac;
    property enderExt: TEnderExt read FenderExt write FenderExt;
    property fone: String        read Ffone     write Ffone;
    property email: String       read Femail    write Femail;
  end;

  { TTribTotalPercent }

  TTribTotalPercent = class(TObject)
  private
    FpTotTribFed: Currency;
    FpTotTribEst: Currency;
    FpTotTribMun: Currency;
  public
    procedure Assign(Source: TTribTotalPercent);

    property pTotTribFed: Currency read FpTotTribFed write FpTotTribFed;
    property pTotTribEst: Currency read FpTotTribEst write FpTotTribEst;
    property pTotTribMun: Currency read FpTotTribMun write FpTotTribMun;
  end;

  { TTribTotalMonet }

  TTribTotalMonet = class(TObject)
  private
    FvTotTribFed: Currency;
    FvTotTribEst: Currency;
    FvTotTribMun: Currency;
  public
    procedure Assign(Source: TTribTotalMonet);

    property vTotTribFed: Currency read FvTotTribFed write FvTotTribFed;
    property vTotTribEst: Currency read FvTotTribEst write FvTotTribEst;
    property vTotTribMun: Currency read FvTotTribMun write FvTotTribMun;
  end;

  { TTribTotal }

  TTribTotal = class(TObject)
  private
    FvTotTrib: TTribTotalMonet;
    FpTotTrib: TTribTotalPercent;
    FindTotTrib: TindTotTrib;
    FpTotTribSN: Currency;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Assign(Source: TTribTotal);

    property vTotTrib: TTribTotalMonet   read FvTotTrib   write FvTotTrib;
    property pTotTrib: TTribTotalPercent read FpTotTrib   write FpTotTrib;
    property indTotTrib: TindTotTrib     read FindTotTrib write FindTotTrib;
    property pTotTribSN: Currency        read FpTotTribSN write FpTotTribSN;
  end;

  { TTribOutrosPisCofins }

  TTribOutrosPisCofins = class(TObject)
  private
    FCST: TCST;
    FvBCPisCofins: Currency;
    FpAliqPis: Currency;
    FpAliqCofins: Currency;
    FvPis: Currency;
    FvCofins: Currency;
    FtpRetPisCofins: TtpRetPisCofins;
  public
    procedure Assign(Source: TTribOutrosPisCofins);

    property CST: TCST                       read FCST            write FCST;
    property vBCPisCofins: Currency          read FvBCPisCofins   write FvBCPisCofins;
    property pAliqPis: Currency              read FpAliqPis       write FpAliqPis;
    property pAliqCofins: Currency           read FpAliqCofins    write FpAliqCofins;
    property vPis: Currency                  read FvPis           write FvPis;
    property vCofins: Currency               read FvCofins        write FvCofins;
    property tpRetPisCofins: TtpRetPisCofins read FtpRetPisCofins write FtpRetPisCofins;
  end;

  { TTribOutros }

  TTribOutros = class(TObject)
  private
    Fpiscofins: TTribOutrosPisCofins;
    FvRetCP: Currency;
    FvRetIRRF: Currency;
    FvRetCSLL: Currency;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Assign(Source: TTribOutros);

    property piscofins: TTribOutrosPisCofins read Fpiscofins write Fpiscofins;
    property vRetCP: Currency                read FvRetCP    write FvRetCP;
    property vRetIRRF: Currency              read FvRetIRRF  write FvRetIRRF;
    property vRetCSLL: Currency              read FvRetCSLL  write FvRetCSLL;
  end;

  { TTribISSQN }

  TTribISSQN = class(TObject)
  private
    FgerarISSQN: Boolean;
    FregEspTrib: TregEspTrib;
    FexigISSQN: TexigISSQN;
    FnBMIsenc: String;
    FvInfoBM: Currency;
    FnProcesso: String;
    FtpImunidade: TtpImunidade;
    FpAliq: Currency;
    FtpRetISSQN: TtpRetISSQN;
  public
    procedure Assign(Source: TTribISSQN);

    property gerarISSQN: Boolean       read FgerarISSQN  write FgerarISSQN;
    property regEspTrib: TregEspTrib   read FregEspTrib  write FregEspTrib;
    property exigISSQN: TexigISSQN     read FexigISSQN   write FexigISSQN;
    property nBMIsenc: String          read FnBMIsenc    write FnBMIsenc;
    property vInfoBM: Currency         read FvInfoBM     write FvInfoBM;
    property nProcesso: String         read FnProcesso   write FnProcesso;
    property tpImunidade: TtpImunidade read FtpImunidade write FtpImunidade;
    property pAliq: Currency           read FpAliq       write FpAliq;
    property tpRetISSQN: TtpRetISSQN   read FtpRetISSQN  write FtpRetISSQN;
  end;

  { TInfoTributacao }

  TInfoTributacao = class(TObject)
  private
    FopSimpNac: TopSimpNac;
    FopLimMEI: TopSNLimUltrap;
    FopLimSimpNac: TopSNLimUltrap;
    Fissqn: TTribISSQN;
    Foutros: TTribOutros;
    FtotTrib: TTribTotal;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Assign(Source: TInfoTributacao);

    property opSimpNac: TopSimpNac        read FopSimpNac    write FopSimpNac;
    property opLimMEI: TopSNLimUltrap     read FopLimMEI     write FopLimMEI;
    property opLimSimpNac: TopSNLimUltrap read FopLimSimpNac write FopLimSimpNac;
    property issqn: TTribISSQN            read Fissqn        write Fissqn;
    property outros: TTribOutros          read Foutros       write Foutros;
    property totTrib: TTribTotal          read FtotTrib      write FtotTrib;
  end;

 { TDocNFNFS }

  TDocNFNFS = class(TObject)
  private
    FnNFS: Integer;
    FmodNFS: String;
    FserieNFS: String;
  public
    procedure Assign(Source: TDocNFNFS);

    property nNFS: Integer    read FnNFS     write FnNFS;
    property modNFS: String   read FmodNFS   write FmodNFS;
    property serieNFS: String read FserieNFS write FserieNFS;
  end;

   { TDocOutNFSe }

  TDocOutNFSe = class(TObject)
  private
    FcMunNota: Integer;
    FnNota: String;
    FcvNota: String;
  public
    procedure Assign(Source: TDocOutNFSe);

    property cMunNota: Integer read FcMunNota write FcMunNota;
    property nNota: String     read FnNota    write FnNota;
    property cvNota: String    read FcvNota   write FcvNota;
  end;

  { TDocDedRedCollectionItem }

  TDocDedRedCollectionItem = class(TObject)
  private
    FchNFSe: String;
    FchNFe: String;
    FoutNotaeMun: TDocOutNFSe;
    FNFNFS: TDocNFNFS;
    FoutDocFisc: String;
    FoutDoc: String;
    Ftipo: TIdeDedRed;
    FxDescOut: String;
    FdEmiDoc: TDateTime;
    FvDedutivelRedutivel: Currency;
    FvDeducaoReducao: Currency;
    Fforne: TInfoAtor;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Assign(Source: TDocDedRedCollectionItem);

    property chNFSe: String                read FchNFSe              write FchNFSe;
    property chNFe: String                 read FchNFe               write FchNFe;
    property outNotaeMun: TDocOutNFSe      read FoutNotaeMun         write FoutNotaeMun;
    property NFNFS: TDocNFNFS              read FNFNFS               write FNFNFS;
    property outDocFisc: String            read FoutDocFisc          write FoutDocFisc;
    property outDoc: String                read FoutDoc              write FoutDoc;
    property tipo: TIdeDedRed              read Ftipo                write Ftipo;
    property xDescOut: String              read FxDescOut            write FxDescOut;
    property dEmiDoc: TDateTime            read FdEmiDoc             write FdEmiDoc;
    property vDedutivelRedutivel: Currency read FvDedutivelRedutivel write FvDedutivelRedutivel;
    property vDeducaoReducao: Currency     read FvDeducaoReducao     write FvDeducaoReducao;
    property forne: TInfoAtor              read Fforne               write Fforne;
  end;

  { TDocDedRedCollection }

  TDocDedRedCollection = class(TObjectList)
  private
    function GetItem(Index: Integer): TDocDedRedCollectionItem;
    procedure SetItem(Index: Integer; Value: TDocDedRedCollectionItem);
  public
    function New: TDocDedRedCollectionItem;
    property Items[Index: Integer]: TDocDedRedCollectionItem read GetItem write SetItem; default;
  end;

  { TInfoDedRed }

  TInfoDedRed = class(TObject)
  private
    FvDR: Currency;
    FpDR: Currency;
    Fdocumento: TDocDedRedCollection;

    procedure Setdocumento(const Value: TDocDedRedCollection);
  public
    constructor Create;
    destructor Destroy; override;

    procedure Assign(Source: TInfoDedRed);

    property vDR: Currency                   read FvDR       write FvDR;
    property pDR: Currency                   read FpDR       write FpDR;
    property documento: TDocDedRedCollection read Fdocumento write Setdocumento;
  end;

  { TInfoObra }

  TInfoObra = class(TObject)
  private
    FcObra: String;
    FinscImobFisc: String;
    Fender: TEnderNac;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Assign(Source: TInfoObra);

    property cObra: String        read FcObra        write FcObra;
    property inscImobFisc: String read FinscImobFisc write FinscImobFisc;
    property ender: TEnderNac     read Fender        write Fender;
  end;

  { TAtvEvento }

  TAtvEvento = class(TObject)
  private
    Fdesc: String;
    FdtIni: TDateTime;
    FdtFim: TDateTime;
    Fid: String;
    Fender: TEnderNac;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Assign(Source: TAtvEvento);

    property desc: String     read Fdesc  write Fdesc;
    property dtIni: TDateTime read FdtIni write FdtIni;
    property dtFim: TDateTime read FdtFim write FdtFim;
    property id: String       read Fid    write Fid;
    property ender: TEnderNac read Fender write Fender;
  end;

  { TPedagio }

  TPedagio = class(TObject)
  private
    Fplaca: String;
    FnEixos: Integer;
    Fsentido: Integer;
  public
    procedure Assign(Source: TPedagio);

    property placa: String    read Fplaca   write Fplaca;
    property nEixos: Integer  read FnEixos  write FnEixos;
    property sentido: Integer read Fsentido write Fsentido;
  end;

  { TComExterior }

  TComExterior = class(TObject)
  private
    FdtIniPrest: TDateTime;
    FdtFimPrest: TDateTime;
    FmdPrestacao: TmdPrestacao;
    FtpMoeda: Integer;
    FvServMoeda: Currency;
    FenquadRVS: TEnquadRVS;
    FenquadRPC: TEnquadRPC;
    FmovTempBens: TMovTempBens;
    FnDI: string;
    FnRE: string;
    Fmdic: Integer;
  public
    procedure Assign(Source: TComExterior);

    property dtIniPrest: TDateTime     read FdtIniPrest  write FdtIniPrest;
    property dtFimPrest: TDateTime     read FdtFimPrest  write FdtFimPrest;
    property mdPrestacao: TmdPrestacao read FmdPrestacao write FmdPrestacao;
    property tpMoeda: Integer          read FtpMoeda     write FtpMoeda;
    property vServMoeda: Currency      read FvServMoeda  write FvServMoeda;
    property enquadRVS: TEnquadRVS     read FenquadRVS   write FenquadRVS;
    property enquadRPC: TEnquadRPC     read FenquadRPC   write FenquadRPC;
    property movTempBens: TMovTempBens read FmovTempBens write FmovTempBens;
    property nDI: string               read FnDI         write FnDI;
    property nRE: string               read FnRE         write FnRE;
    property mdic: Integer             read Fmdic        write Fmdic;
  end;

  { TServPrest }

  TServPrest = class(TObject)
  private
    FcMunPrestacao: Integer;
    FcPaisPrestacao: string;
    FcTribNac: Integer;
    FcTribMun: Integer;
    FxDescServ: String;
    FcNBS: String;
    FvReceb: Currency;
    FvServ: Currency;
    FvDescIncond: Currency;
    FvDescCond: Currency;
    FcomExt: TComExterior;
    Fpedagio: TPedagio;
    FatvEvento: TAtvEvento;
    Fobra: TInfoObra;
    FidDocTec: String;
    FdocRef: String;
    FxInfComp: String;
    FdedRed: TInfoDedRed;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Assign(Source: TServPrest);

    property cMunPrestacao: Integer read FcMunPrestacao  write FcMunPrestacao;
    property cPaisPrestacao: string read FcPaisPrestacao write FcPaisPrestacao;
    property cTribNac: Integer      read FcTribNac       write FcTribNac;
    property cTribMun: Integer      read FcTribMun       write FcTribMun;
    property xDescServ: String      read FxDescServ      write FxDescServ;
    property cNBS: String           read FcNBS           write FcNBS;
    property vReceb: Currency       read FvReceb         write FvReceb;
    property vServ: Currency        read FvServ          write FvServ;
    property vDescIncond: Currency  read FvDescIncond    write FvDescIncond;
    property vDescCond: Currency    read FvDescCond      write FvDescCond;
    property comExt: TComExterior   read FcomExt         write FcomExt;
    property pedagio: TPedagio      read Fpedagio        write Fpedagio;
    property atvEvento: TAtvEvento  read FatvEvento      write FatvEvento;
    property obra: TInfoObra        read Fobra           write Fobra;
    property idDocTec: String       read FidDocTec       write FidDocTec;
    property docRef: String         read FdocRef         write FdocRef;
    property xInfComp: String       read FxInfComp       write FxInfComp;
    property dedRed: TInfoDedRed    read FdedRed         write FdedRed;
  end;

  { TSubstituicao }

  TSubstituicao = class(TObject)
  private
    FchSubstda: String;
    FcMotivo: TcMotivo;
    FxMotivo: String;
  public
    procedure Assign(Source: TSubstituicao);

    property chSubstda: String read FchSubstda write FchSubstda;
    property cMotivo: TcMotivo read FcMotivo   write FcMotivo;
    property xMotivo: String   read FxMotivo   write FxMotivo;
  end;

  { TinfDPS }

  TinfDPS = class(TObject)
  private
    FId: String;
    FtpAmb: TpcnTipoAmbiente;
    FdhEmi: TDateTime;
    FverAplic: String;
    Fserie: Integer;
    FnDPS: Integer;
    FdCompet: TDateTime;
    FtpEmit: TtpEmit;
    Fsubst: TSubstituicao;
    Fprest: TInfoAtor;
    Ftoma: TInfoAtor;
    Finterm: TInfoAtor;
    Fserv: TServPrest;
    Ftrib: TInfoTributacao;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Assign(Source: TinfDPS);

    {
    A regra de formação do identificador de 44 posições da DPS é:
    "ID" + Cód.Mun (7) + Tipo de Inscrição Federal (1) +
    Inscrição Federal (14 - CPF completar com 000 à esquerda) + Série DPS (5)+
    Núm. DPS (15)
    }
    property Id: String               read FId       write FId;

    property tpAmb: TpcnTipoAmbiente  read FtpAmb    write FtpAmb   default taHomologacao;
    property dhEmi: TDateTime         read FdhEmi    write FdhEmi;
    property verAplic: String         read FverAplic write FverAplic;
    property serie: Integer           read Fserie    write Fserie;
    property nDPS: Integer            read FnDPS     write FnDPS;
    property dCompet: TDateTime       read FdCompet  write FdCompet;
    property tpEmit: TtpEmit          read FtpEmit   write FtpEmit;
    property subst: TSubstituicao     read Fsubst    write Fsubst;
    property prest: TInfoAtor         read Fprest    write Fprest;
    property toma: TInfoAtor          read Ftoma     write Ftoma;
    property interm: TInfoAtor        read Finterm   write Finterm;
    property serv: TServPrest         read Fserv     write Fserv;
    property trib: TInfoTributacao    read Ftrib     write Ftrib;
  end;

  { TDPS }

  TDPS = class(TObject)
  private
    Fversao: Real;
    FinfDPS: TinfDPS;
    FSignature: TSignature;

    function GetVersao: Real;
    function GetVersaoStr: String;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Assign(Source: TDPS);

    property versao: Real          read Getversao  write Fversao;
    property infDPS: TinfDPS       read FinfDPS    write FinfDPS;
    property Signature: TSignature read FSignature write FSignature;
    property VersaoStr: String     read GetVersaoStr;
  end;

  {========== Classes da NFS-e }

  { TValoresNFSe }

  TValoresNFSe = class(TObject)
  private
    FvCalcDR: Currency;
    FpRedBCBM: Currency;
    FvCalcBM: Currency;
    FvBC: Currency;
    FpAliqAplic: Currency;
    FvISSQN: Currency;
    FvTotalRet: Currency;
    FvLiq: Currency;
    FxOutInf: String;
  public
    procedure Assign(Source: TValoresNFSe);

    property vCalcDR: Currency    read FvCalcDR    write FvCalcDR;
    property pRedBCBM: Currency   read FpRedBCBM   write FpRedBCBM;
    property vCalcBM: Currency    read FvCalcBM    write FvCalcBM;
    property vBC: Currency        read FvBC        write FvBC;
    property pAliqAplic: Currency read FpAliqAplic write FpAliqAplic;
    property vISSQN: Currency     read FvISSQN     write FvISSQN;
    property vTotalRet: Currency  read FvTotalRet  write FvTotalRet;
    property vLiq: Currency       read FvLiq       write FvLiq;
    property xOutInf: String      read FxOutInf    write FxOutInf;
  end;

  { TEmitente }

  TEmitente = class(TObject)
  private
    FCNPJCPF: String;
    FxNome: String;
    FxFant: String;
    FenderNac: TEnderNac;
    FenderExt: TEnderExt;
    Ffone: String;
    Femail: String;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Assign(Source: TEmitente);

    property CNPJCPF: String     read FCNPJCPF  write FCNPJCPF;
    property xNome: String       read FxNome    write FxNome;
    property xFant: String       read FxFant    write FxFant;
    property enderNac: TEnderNac read FenderNac write FenderNac;
    property enderExt: TEnderExt read FenderExt write FenderExt;
    property fone: String        read Ffone     write Ffone;
    property email: String       read Femail    write Femail;
  end;

  { TInfNFSe }

  TInfNFSe = class(TObject)
  private
    FId: String;

    FcMunEmi: Integer;
    FxMunEmi: String;
    FcMunIncid: Integer;
    FxMunIncid: string;
    FnNFSe: Integer;
    FxTribNac: string;
    FxTribMun: string;
    FxNBS: string;
    FverAplic: string;
    FambGer: TAmbienteGerador;
    FtpEmis: TtpEmis;
    FprocEmi: TtpProc;
    FcStat: Integer;
    FxMotivo: string;
    FdhProc: TDateTime;
    Femit: TEmitente;
    Fvalores: TValoresNFSe;
    FDPS: TDPS;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Assign(Source: TInfNFSe);
    {
     A regra de formação do identificador de 52 posições da NFSe é:
    "ID" + Cód.Mun.(7) + Amb.Ger.(1) + Tipo de Inscrição Federal(1) +
    Inscrição Federal(14) + No.NFS-e(13) + AnoMes Emis.(4) + Cód.Num.(9) + DV(1)
    }
    property Id: String               read FId        write FId;

    property cMunEmi: Integer         read FcMunEmi   write FcMunEmi;
    property xMunEmi: String          read FxMunEmi   write FxMunEmi;
    property cMunIncid: Integer       read FcMunIncid write FcMunIncid;
    property xMunIncid: string        read FxMunIncid write FxMunIncid;
    property nNFSe: Integer           read FnNFSe     write FnNFSe;
    property xTribNac: string         read FxTribNac  write FxTribNac;
    property xTribMun: string         read FxTribMun  write FxTribMun;
    property xNBS: string             read FxNBS      write FxNBS;
    property verAplic: string         read FverAplic  write FverAplic;
    property ambGer: TAmbienteGerador read FambGer    write FambGer;
    property tpEmis: TtpEmis          read FtpEmis    write FtpEmis;
    property procEmi: TtpProc         read FprocEmi   write FprocEmi;
    property cStat: Integer           read FcStat     write FcStat;
    property xMotivo: string          read FxMotivo      write FxMotivo;
    property dhProc: TDateTime        read FdhProc    write FdhProc;
    property emit: TEmitente          read Femit      write Femit;
    property valores: TValoresNFSe    read Fvalores   write Fvalores;
    property DPS: TDPS                read FDPS       write FDPS;
  end;

  { TNFSe }

  TNFSe = class(TObject)
  private
    Fversao: Real;
    FinfNFSe: TInfNFSe;
    FSignature: TSignature;
    function Getversao: Real;
    function GetVersaoStr: String;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Assign(Source: TNFSe);
    procedure SetXMLString(AValue : AnsiString);

    property versao: Real          read Getversao  write Fversao;
    property infNFSe: TInfNFSe     read FinfNFSe write FinfNFSe;
    property Signature: TSignature read FSignature write FSignature;
    property VersaoStr: String     read GetVersaoStr;
  end;

const

  CMUN_EXTERIOR: Integer = 9999999;
  XMUN_EXTERIOR: String = 'EXTERIOR';
  UF_EXTERIOR: String = 'EX';

implementation

uses
  ACBrUtil, pcnDPSR;

{ TNFSe }

procedure TNFSe.Assign(Source: TNFSe);
begin
  versao := Source.versao;

  infNFSe.Assign(Source.infNFSe);

  Signature.Assign(Source.Signature);
end;

constructor TNFSe.Create;
begin
  inherited Create;

  FinfNFSe  := TinfNFSe.Create;
  FSignature := TSignature.create;
end;

destructor TNFSe.Destroy;
begin
  FinfNFSe.Free;
  FSignature.Free;

  inherited Destroy;
end;

function TNFSe.Getversao: Real;
begin
  if Fversao <= 0 then
    Result := 1
  else
    Result := Fversao;
end;

function TNFSe.GetVersaoStr: String;
begin
  if Fversao <= 0 then
    Result := V1_00
  else
    Result := 'versao="' + FloatToString(Fversao, '.', '#0.00') + '"';
end;

procedure TNFSe.SetXMLString(AValue: AnsiString);
//var
//  LocNFSeR : TNFSeR;
begin
  {
  LocNFSeR := TNFSeR.Create(Self);
  try
    LocNFSeR.Leitor.Arquivo := AValue;
    LocNFSeR.LerXml;
  finally
    LocNFSeR.Free
  end;
  }
end;

{ TInfNFSe }

procedure TInfNFSe.Assign(Source: TInfNFSe);
begin
  Id := Source.Id;

  cMunEmi   := Source.cMunEmi;
  xMunEmi   := Source.xMunEmi;
  cMunIncid := Source.cMunIncid;
  xMunIncid := Source.xMunIncid;
  nNFSe     := Source.nNFSe;
  xTribNac  := Source.xTribNac;
  xTribMun  := Source.xTribMun;
  xNBS      := Source.xNBS;
  verAplic  := Source.verAplic;
  ambGer    := Source.ambGer;
  tpEmis    := Source.tpEmis;
  procEmi   := Source.procEmi;
  cStat     := Source.cStat;
  dhProc    := Source.dhProc;

  emit.Assign(Source.emit);
  valores.Assign(Source.valores);
  DPS.Assign(Source.DPS);
end;

constructor TInfNFSe.Create;
begin
  inherited Create;

  Femit    := TEmitente.Create;
  Fvalores := TValoresNFSe.Create;
  FDPS     := TDPS.Create;
end;

destructor TInfNFSe.Destroy;
begin
  Femit.Free;
  Fvalores.Free;
  FDPS.Free;

  inherited Destroy;
end;

{ TEmitente }

procedure TEmitente.Assign(Source: TEmitente);
begin
  CNPJCPF := Source.CNPJCPF;
  xNome   := Source.xNome;
  xFant   := Source.xFant;

  enderNac.Assign(Source.enderNac);
  enderExt.Assign(Source.enderExt);

  fone  := Source.fone;
  email := Source.email;
end;

constructor TEmitente.Create;
begin
  inherited Create;

  FenderNac := TEnderNac.Create;
  FenderExt := TEnderExt.Create;
end;

destructor TEmitente.Destroy;
begin
  FenderNac.Free;
  FenderExt.Free;

  inherited Destroy;
end;

{ TEnderNac }

procedure TEnderNac.Assign(Source: TEnderNac);
begin
  xLgr    := Source.xLgr;
  nro     := Source.nro;
  xCpl    := Source.xCpl;
  xBairro := Source.xBairro;
  cMun    := Source.cMun;
  UF      := Source.UF;
  CEP     := Source.CEP;
end;

{ TEnderExt }

procedure TEnderExt.Assign(Source: TEnderExt);
begin
  cPais     := Source.cPais;
  xEnderExt := Source.xEnderExt;
end;

{ TValoresNFSe }

procedure TValoresNFSe.Assign(Source: TValoresNFSe);
begin
  FvCalcDR    := Source.FvCalcDR;
  FpRedBCBM   := Source.FpRedBCBM;
  FvCalcBM    := Source.FvCalcBM;
  FvBC        := Source.FvBC;
  FpAliqAplic := Source.FpAliqAplic;
  FvISSQN     := Source.FvISSQN;
  FvTotalRet  := Source.FvTotalRet;
  FvLiq       := Source.FvLiq;
  FxOutInf    := Source.FxOutInf;
end;

{ TDPS }

procedure TDPS.Assign(Source: TDPS);
begin
  versao := Source.versao;

  infDPS.Assign(Source.infDPS);
  Signature.Assign(Source.Signature);
end;

constructor TDPS.Create;
begin
  inherited Create;

  FinfDPS    := TinfDPS.Create;
  FSignature := TSignature.Create;

  Fversao := 0;
end;

destructor TDPS.Destroy;
begin
  FinfDPS.Free;
  FSignature.Free;

  inherited Destroy;
end;

function TDPS.GetVersao: Real;
begin
  if Fversao <= 0 then
    Result := 1
  else
    Result := Fversao;
end;

function TDPS.GetVersaoStr: String;
begin
  if Fversao <= 0 then
    Result := V1_00
  else
    Result := 'versao="' + FloatToString(Fversao, '.', '#0.00') + '"';
end;

{ TinfDPS }

procedure TinfDPS.Assign(Source: TinfDPS);
begin
  Id       := Source.Id;
  tpAmb    := Source.tpAmb;
  dhEmi    := Source.dhEmi;
  verAplic := Source.verAplic;
  serie    := Source.serie;
  nDPS     := Source.nDPS;
  dCompet  := Source.dCompet;
  tpEmit   := Source.tpEmit;

  subst.Assign(Source.subst);
  prest.Assign(Source.prest);
  toma.Assign(Source.toma);
  interm.Assign(Source.interm);
  serv.Assign(Source.serv);
  trib.Assign(Source.trib);
end;

constructor TinfDPS.Create;
begin
  inherited Create;

  Fsubst  := TSubstituicao.Create;
  Fprest  := TInfoAtor.Create;
  Ftoma   := TInfoAtor.Create;
  Finterm := TInfoAtor.Create;
  Fserv   := TServPrest.Create;
  Ftrib   := TInfoTributacao.Create;
end;

destructor TinfDPS.Destroy;
begin
  Fsubst.Free;
  Fprest.Free;
  Ftoma.Free;
  Finterm.Free;
  Fserv.Free;
  Ftrib.Free;

  inherited;
end;

{ TSubstituicao }

procedure TSubstituicao.Assign(Source: TSubstituicao);
begin
  chSubstda := Source.chSubstda;
  cMotivo   := Source.cMotivo;
  xMotivo   := Source.xMotivo;
end;

{ TInfoAtor }

procedure TInfoAtor.Assign(Source: TInfoAtor);
begin
  CNPJCPF := Source.CNPJCPF;
  NIF     := Source.NIF;
  IM      := Source.IM;
  xNome   := Source.xNome;

  enderNac.Assign(Source.enderNac);
  enderExt.Assign(Source.enderExt);

  fone  := Source.fone;
  email := Source.email;
end;

constructor TInfoAtor.Create;
begin
  inherited Create;

  FenderNac := TEnderNac.Create;
  FenderExt := TEnderExt.Create;
end;

destructor TInfoAtor.Destroy;
begin
  FenderNac.Free;
  FenderExt.Free;

  inherited Destroy;
end;

{ Tserv }

procedure TServPrest.Assign(Source: TServPrest);
begin
  cMunPrestacao  := Source.cMunPrestacao;
  cPaisPrestacao := Source.cPaisPrestacao;
  cTribNac       := Source.cTribNac;
  cTribMun       := Source.cTribMun;
  xDescServ      := Source.xDescServ;
  cNBS           := Source.cNBS;
  vReceb         := Source.vReceb;
  vServ          := Source.vServ;
  vDescIncond    := Source.vDescIncond;
  vDescCond      := Source.vDescCond;

  comExt.Assign(Source.comExt);
  pedagio.Assign(Source.pedagio);
  atvEvento.Assign(Source.atvEvento);
  obra.Assign(Source.obra);

  idDocTec := Source.idDocTec;
  docRef   := Source.docRef;
  xInfComp := Source.xInfComp;

  dedRed.Assign(Source.dedRed);
end;

constructor TServPrest.Create;
begin
  inherited Create;

  FcomExt    := TComExterior.Create;
  Fpedagio   := TPedagio.Create;
  FatvEvento := TAtvEvento.Create;
  Fobra      := TInfoObra.Create;
  FdedRed    := TInfoDedRed.Create;
end;

destructor TServPrest.Destroy;
begin
  FcomExt.Free;
  Fpedagio.Free;
  FatvEvento.Free;
  Fobra.Free;
  FdedRed.Free;

  inherited Destroy;
end;

{ TComExterior }

procedure TComExterior.Assign(Source: TComExterior);
begin
  dtIniPrest  := Source.dtIniPrest;
  dtFimPrest  := Source.dtFimPrest;
  mdPrestacao := Source.mdPrestacao;
  tpMoeda     := Source.tpMoeda;
  vServMoeda  := Source.vServMoeda;
  enquadRVS   := Source.enquadRVS;
  enquadRPC   := Source.enquadRPC;
  movTempBens := Source.movTempBens;
  nDI         := Source.nDI;
  nRE         := Source.nRE;
  mdic        := Source.mdic;
end;

{ TPedagio }

procedure TPedagio.Assign(Source: TPedagio);
begin
  placa   := Source.placa;
  nEixos  := Source.nEixos;
  sentido := Source.sentido;
end;

{ TAtvEvento }

procedure TAtvEvento.Assign(Source: TAtvEvento);
begin
  desc  := Source.desc;
  dtIni := Source.dtIni;
  dtFim := Source.dtFim;
  id    := Source.id;

  ender.Assign(Source.ender);
end;

constructor TAtvEvento.Create;
begin
  inherited Create;

  Fender := TEnderNac.Create;
end;

destructor TAtvEvento.Destroy;
begin
  Fender.Free;

  inherited Destroy;
end;

{ TInfoObra }

procedure TInfoObra.Assign(Source: TInfoObra);
begin
  cObra        := Source.cObra;
  inscImobFisc := Source.inscImobFisc;

  ender.Assign(Source.ender);
end;

constructor TInfoObra.Create;
begin
  inherited Create;

  Fender := TEnderNac.Create;
end;

destructor TInfoObra.Destroy;
begin
  Fender.Free;

  inherited Destroy;
end;

{ TInfoDedRed }

procedure TInfoDedRed.Assign(Source: TInfoDedRed);
begin
  vDR := Source.vDR;
  pDR := Source.pDR;

  documento.Assign(Source.documento);
end;

constructor TInfoDedRed.Create;
begin
  inherited Create;

  Fdocumento := TDocDedRedCollection.Create;
end;

destructor TInfoDedRed.Destroy;
begin
  Fdocumento.Free;

  inherited Destroy;
end;

procedure TInfoDedRed.Setdocumento(const Value: TDocDedRedCollection);
begin
  Fdocumento := Value;
end;

{ TDocDedRedCollection }

function TDocDedRedCollection.GetItem(Index: Integer): TDocDedRedCollectionItem;
begin
  Result := TDocDedRedCollectionItem(inherited GetItem(Index));
end;

function TDocDedRedCollection.New: TDocDedRedCollectionItem;
begin
  Result := TDocDedRedCollectionItem.Create;
  Self.Add(Result);
end;

procedure TDocDedRedCollection.SetItem(Index: Integer;
  Value: TDocDedRedCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TDocDedRedCollectionItem }

procedure TDocDedRedCollectionItem.Assign(Source: TDocDedRedCollectionItem);
begin
  chNFSe := Source.chNFSe;
  chNFe  := Source.chNFe;

  outNotaeMun.Assign(Source.outNotaeMun);
  NFNFS.Assign(Source.NFNFS);

  outDocFisc          := Source.outDocFisc;
  outDoc              := Source.outDoc;
  tipo                := Source.tipo;
  xDescOut            := Source.xDescOut;
  dEmiDoc             := Source.dEmiDoc;
  vDedutivelRedutivel := Source.vDedutivelRedutivel;
  vDeducaoReducao     := Source.vDeducaoReducao;

  forne.Assign(Source.forne);
end;

constructor TDocDedRedCollectionItem.Create;
begin
  inherited Create;

  FoutNotaeMun := TDocOutNFSe.Create;
  FNFNFS       := TDocNFNFS.Create;
  Fforne       := TInfoAtor.Create;
end;

destructor TDocDedRedCollectionItem.Destroy;
begin
  FoutNotaeMun.Free;
  FNFNFS.Free;
  Fforne.Free;

  inherited Destroy;
end;

{ TDocOutNFSe }

procedure TDocOutNFSe.Assign(Source: TDocOutNFSe);
begin
  cMunNota := Source.cMunNota;
  nNota    := Source.nNota;
  cvNota   := Source.cvNota;
end;

{ TDocNFNFS }

procedure TDocNFNFS.Assign(Source: TDocNFNFS);
begin
  nNFS     := Source.nNFS;
  modNFS   := Source.modNFS;
  serieNFS := Source.serieNFS;
end;

{ TInfoTributacao }

procedure TInfoTributacao.Assign(Source: TInfoTributacao);
begin
  opSimpNac    := Source.opSimpNac;
  opLimMEI     := Source.opLimMEI;
  opLimSimpNac := Source.opLimSimpNac;

  issqn.Assign(Source.issqn);
  outros.Assign(Source.outros);
  totTrib.Assign(Source.totTrib);
end;

constructor TInfoTributacao.Create;
begin
  inherited Create;

  Fissqn   := TTribISSQN.Create;
  Foutros  := TTribOutros.Create;
  FtotTrib := TTribTotal.Create;
end;

destructor TInfoTributacao.Destroy;
begin
  Fissqn.Free;
  Foutros.Free;
  FtotTrib.Free;

  inherited Destroy;
end;

{ TTribISSQN }

procedure TTribISSQN.Assign(Source: TTribISSQN);
begin
  regEspTrib  := Source.regEspTrib;
  exigISSQN   := Source.exigISSQN;
  nBMIsenc    := Source.nBMIsenc;
  vInfoBM     := Source.vInfoBM;
  nProcesso   := Source.nProcesso;
  tpImunidade := Source.tpImunidade;
  pAliq       := Source.pAliq;
  tpRetISSQN  := Source.tpRetISSQN;
end;

{ TTribOutros }

procedure TTribOutros.Assign(Source: TTribOutros);
begin
  piscofins.Assign(Source.piscofins);

  vRetCP   := Source.vRetCP;
  vRetIRRF := Source.vRetIRRF;
  vRetCSLL := Source.vRetCSLL;
end;

constructor TTribOutros.Create;
begin
  inherited Create;

  Fpiscofins := TTribOutrosPisCofins.Create;
end;

destructor TTribOutros.Destroy;
begin
  Fpiscofins.Free;

  inherited Destroy;
end;

{ TTribOutrosPisCofins }

procedure TTribOutrosPisCofins.Assign(Source: TTribOutrosPisCofins);
begin
  CST            := Source.CST;
  vBCPisCofins   := Source.vBCPisCofins;
  pAliqPis       := Source.pAliqPis;
  pAliqCofins    := Source.pAliqCofins;
  vPis           := Source.vPis;
  vCofins        := Source.vCofins;
  tpRetPisCofins := Source.tpRetPisCofins;
end;

{ TTribTotal }

procedure TTribTotal.Assign(Source: TTribTotal);
begin
  vTotTrib.Assign(Source.vTotTrib);
  pTotTrib.Assign(Source.pTotTrib);

  indTotTrib := Source.indTotTrib;
  pTotTribSN := Source.pTotTribSN;
end;

constructor TTribTotal.Create;
begin
  inherited Create;

  FvTotTrib := TTribTotalMonet.Create;
  FpTotTrib := TTribTotalPercent.Create;
end;

destructor TTribTotal.Destroy;
begin
  FvTotTrib.Free;
  FpTotTrib.Free;

  inherited Destroy;
end;

{ TTribTotalMonet }

procedure TTribTotalMonet.Assign(Source: TTribTotalMonet);
begin
  vTotTribFed := Source.vTotTribFed;
  vTotTribEst := Source.vTotTribEst;
  vTotTribMun := Source.vTotTribMun;
end;

{ TTribTotalPercent }

procedure TTribTotalPercent.Assign(Source: TTribTotalPercent);
begin
  pTotTribFed := Source.pTotTribFed;
  pTotTribEst := Source.pTotTribEst;
  pTotTribMun := Source.pTotTribMun;
end;

end.
