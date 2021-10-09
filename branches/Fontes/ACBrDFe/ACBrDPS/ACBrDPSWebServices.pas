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

{*******************************************************************************
|* Historico
|*
|* 20/06/2017: Italo Jurisato Junior
|*  - Doação do componente para o Projeto ACBr
*******************************************************************************}

{$I ACBr.inc}

unit ACBrDPSWebServices;

interface

uses
  Classes, SysUtils, dateutils, blcksock, synacode,
  ACBrDFe, ACBrDFeUtil, ACBrDFeWebService,
  pcnAuxiliar, pcnConversao, pcnDPS, pcnConversaoDPS, pcnProcDPS,
  pcnEnvEventoDPS, pcnRetEnvEventoDPS, pcnRetConsSitDPS, pcnDistDFeInt,
  pcnRetDistDFeInt, pcnRetEnvDPS, ACBrDPSNotas, ACBrDPSConfiguracoes;

type

  { TDPSWebService }

  TDPSWebService = class(TDFeWebService)
  private
    FOldSSLType: TSSLType;
    FOldHeaderElement: String;
  protected
    FPStatus: TStatusACBrDPS;
    FPLayout: TLayOutDPS;
    FPConfiguracoesDPS: TConfiguracoesDPS;

  protected
    procedure InicializarServico; override;
    procedure DefinirURL; override;
    function GerarVersaoDadosSoap: String; override;
    procedure FinalizarServico; override;

  public
    constructor Create(AOwner: TACBrDFe); override;
    procedure Clear; override;

    property Status: TStatusACBrDPS read FPStatus;
    property Layout: TLayOutDPS read FPLayout;
  end;

  { TDPSStatusServico }

  TDPSStatusServico = class(TDPSWebService)
  private
    Fversao: String;
    FtpAmb: TpcnTipoAmbiente;
    FverAplic: String;
    FcStat: Integer;
    FxMotivo: String;
    FcUF: Integer;
    FdhRecbto: TDateTime;
    FTMed: Integer;
    FdhRetorno: TDateTime;
    FxObs: String;
  protected
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;

    function GerarMsgLog: String; override;
    function GerarMsgErro(E: Exception): String; override;
  public
    procedure Clear; override;

    property versao: String read Fversao;
    property tpAmb: TpcnTipoAmbiente read FtpAmb;
    property verAplic: String read FverAplic;
    property cStat: Integer read FcStat;
    property xMotivo: String read FxMotivo;
    property cUF: Integer read FcUF;
    property dhRecbto: TDateTime read FdhRecbto;
    property TMed: Integer read FTMed;
    property dhRetorno: TDateTime read FdhRetorno;
    property xObs: String read FxObs;
  end;

  { TDPSRecepcao }

  TDPSRecepcao = class(TDPSWebService)
  private
    FLote: String;
    FNotas: TNotas;
    Fversao: String;
    FTpAmb: TpcnTipoAmbiente;
    FverAplic: String;
    FcStat: Integer;
    FcUF: Integer;
    FxMotivo: String;
    FdhRecbto: TDateTime;
    FTMed: Integer;
    FMsgUnZip: String;
    FVersaoDF: TVersaoDPS;

    FDPSRetorno: TretEnvDPS;

    function GetLote: String;
  protected
    procedure InicializarServico; override;
    procedure DefinirURL; override;
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    procedure SalvarEnvio; override;
    function TratarResposta: Boolean; override;

    function GerarMsgLog: String; override;
    function GerarPrefixoArquivo: String; override;
  public
    constructor Create(AOwner: TACBrDFe; ANotas: TNotas);
      reintroduce; overload;
    destructor Destroy; override;
    procedure Clear; override;

    property versao: String read Fversao;
    property TpAmb: TpcnTipoAmbiente read FTpAmb;
    property verAplic: String read FverAplic;
    property cStat: Integer read FcStat;
    property cUF: Integer read FcUF;
    property xMotivo: String read FxMotivo;
    property dhRecbto: TDateTime read FdhRecbto;
    property TMed: Integer read FTMed;
    property Lote: String read GetLote write FLote;
    property MsgUnZip: String read FMsgUnZip write FMsgUnZip;

    property DPSRetorno: TretEnvDPS read FDPSRetorno;
  end;

  { TDPSConsulta }

  TDPSConsulta = class(TDPSWebService)
  private
    FOwner: TACBrDFe;
    FDPSChave: String;
    FNotas: TNotas;
    FProtocolo: String;
    FDhRecbto: TDateTime;
    FXMotivo: String;
    Fversao: String;
    FTpAmb: TpcnTipoAmbiente;
    FverAplic: String;
    FcStat: Integer;
    FcUF: Integer;
    FRetDPSDFe: String;

    FprotDPS: TProcDPS;
//    FprocEventoDPS: TRetEventoDPSCollection;
    
    procedure SetDPSChave(AValue: String);
  protected
    procedure DefinirURL; override;
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function GerarUFSoap: String; override;
    function TratarResposta: Boolean; override;

    function GerarMsgLog: String; override;
    function GerarPrefixoArquivo: String; override;
  public
    constructor Create(AOwner: TACBrDFe; ANotas: TNotas);
      reintroduce; overload;
    destructor Destroy; override;
    procedure Clear; override;

    property DPSChave: String read FDPSChave write SetDPSChave;
    property Protocolo: String read FProtocolo;
    property DhRecbto: TDateTime read FDhRecbto;
    property XMotivo: String read FXMotivo;
    property versao: String read Fversao;
    property TpAmb: TpcnTipoAmbiente read FTpAmb;
    property verAplic: String read FverAplic;
    property cStat: Integer read FcStat;
    property cUF: Integer read FcUF;
    property RetDPSDFe: String read FRetDPSDFe;

    property protDPS: TProcDPS read FprotDPS;
//    property procEventoDPS: TRetEventoDPSCollection read FprocEventoDPS;
  end;

  { TDPSEnvEvento }

  TDPSEnvEvento = class(TDPSWebService)
  private
    FidLote: Integer;
    FEvento: TEventoDPS;
    FcStat: Integer;
    FxMotivo: String;
    FTpAmb: TpcnTipoAmbiente;
    FCNPJ: String;

    FEventoRetorno: TRetEventoDPS;

    function GerarPathEvento(const ACNPJ: String = ''): String;
  protected
    procedure DefinirURL; override;
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    procedure SalvarEnvio; override;
    function TratarResposta: Boolean; override;
    procedure SalvarResposta; override;

    function GerarMsgLog: String; override;
    function GerarPrefixoArquivo: String; override;
  public
    constructor Create(AOwner: TACBrDFe; AEvento: TEventoDPS); reintroduce; overload;
    destructor Destroy; override;
    procedure Clear; override;

    property idLote: Integer read FidLote write FidLote;
    property cStat: Integer read FcStat;
    property xMotivo: String read FxMotivo;
    property TpAmb: TpcnTipoAmbiente read FTpAmb;

    property EventoRetorno: TRetEventoDPS read FEventoRetorno;
  end;

  { TDistribuicaoDFe }

  TDistribuicaoDFe = class(TDPSWebService)
  private
    FcUFAutor: Integer;
    FCNPJCPF: String;
    FultNSU: String;
    FNSU: String;
    FchDPS: String;
    FNomeArq: String;
    FlistaArqs: TStringList;

    FretDistDFeInt: TretDistDFeInt;

    function GerarPathDistribuicao(AItem :TdocZipCollectionItem): String;
  protected
    procedure DefinirURL; override;
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;

    function GerarMsgLog: String; override;
    function GerarMsgErro(E: Exception): String; override;
  public
    constructor Create(AOwner: TACBrDFe); override;
    destructor Destroy; override;
    procedure Clear; override;

    property cUFAutor: Integer read FcUFAutor write FcUFAutor;
    property CNPJCPF: String read FCNPJCPF write FCNPJCPF;
    property ultNSU: String read FultNSU write FultNSU;
    property NSU: String read FNSU write FNSU;
    property chDPS: String read FchDPS write FchDPS;
    property NomeArq: String read FNomeArq;
    property ListaArqs: TStringList read FlistaArqs;

    property retDistDFeInt: TretDistDFeInt read FretDistDFeInt;
  end;

  { TDPSEnvioWebService }

  TDPSEnvioWebService = class(TDPSWebService)
  private
    FXMLEnvio: String;
    FPURLEnvio: String;
    FVersao: String;
    FSoapActionEnvio: String;
  protected
    procedure DefinirURL; override;
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;

    function GerarMsgErro(E: Exception): String; override;
    function GerarVersaoDadosSoap: String; override;
  public
    constructor Create(AOwner: TACBrDFe); override;
    destructor Destroy; override;
    procedure Clear; override;

    function Executar: Boolean; override;

    property Versao: String read FVersao;
    property XMLEnvio: String read FXMLEnvio write FXMLEnvio;
    property URLEnvio: String read FPURLEnvio write FPURLEnvio;
    property SoapActionEnvio: String read FSoapActionEnvio write FSoapActionEnvio;
  end;

  { TWebServices }

  TWebServices = class
  private
    FACBrDPS: TACBrDFe;
    FStatusServico: TDPSStatusServico;
    FEnviar: TDPSRecepcao;
    FConsulta: TDPSConsulta;
    FEnvEvento: TDPSEnvEvento;
    FDistribuicaoDFe: TDistribuicaoDFe;
    FEnvioWebService: TDPSEnvioWebService;
  public
    constructor Create(AOwner: TACBrDFe); overload;
    destructor Destroy; override;

    function Envia(ALote: Integer): Boolean; overload;
    function Envia(ALote: String): Boolean; overload;

    property ACBrDPS: TACBrDFe read FACBrDPS write FACBrDPS;
    property StatusServico: TDPSStatusServico read FStatusServico write FStatusServico;
    property Enviar: TDPSRecepcao read FEnviar write FEnviar;
    property Consulta: TDPSConsulta read FConsulta write FConsulta;
    property EnvEvento: TDPSEnvEvento read FEnvEvento write FEnvEvento;
    property DistribuicaoDFe: TDistribuicaoDFe
      read FDistribuicaoDFe write FDistribuicaoDFe;
    property EnvioWebService: TDPSEnvioWebService
      read FEnvioWebService write FEnvioWebService;
  end;

implementation

uses
  StrUtils, Math,
  ACBrUtil, ACBrCompress, ACBrDPS,
  pcnGerador, pcnLeitor, pcnConsStatServ, pcnRetConsStatServ,
  pcnConsSitDPS;

{ TDPSWebService }

constructor TDPSWebService.Create(AOwner: TACBrDFe);
begin
  inherited Create(AOwner);

  FPConfiguracoesDPS := TConfiguracoesDPS(FPConfiguracoes);
  FPLayout := LayDPSStatusServico;

  FPBodyElement := 'DPSDadosMsg';
end;

procedure TDPSWebService.Clear;
begin
  inherited Clear;

  FPStatus := stIdleDPS;
  FPDFeOwner.SSL.UseCertificateHTTP := True;
end;

procedure TDPSWebService.InicializarServico;
begin
  { Sobrescrever apenas se necessário }
  inherited InicializarServico;

  FOldSSLType := FPDFeOwner.SSL.SSLType;
  FOldHeaderElement := FPHeaderElement;
  FPDFeOwner.SSL.SSLType := LT_TLSv1_2;
  FPHeaderElement := '';

  TACBrDPS(FPDFeOwner).SetStatus(FPStatus);
end;

procedure TDPSWebService.DefinirURL;
var
  Versao: Double;
begin
  { sobrescrever apenas se necessário.
    Você também pode mudar apenas o valor de "FLayoutServico" na classe
    filha e chamar: Inherited;     }

  Versao := 0;
  FPVersaoServico := '';
  FPURL := '';

  TACBrDPS(FPDFeOwner).LerServicoDeParams(FPLayout, Versao, FPURL);
  FPVersaoServico := FloatToString(Versao, '.', '0.00');
end;


function TDPSWebService.GerarVersaoDadosSoap: String;
begin
  { Sobrescrever apenas se necessário }

  if EstaVazio(FPVersaoServico) then
    FPVersaoServico := TACBrDPS(FPDFeOwner).LerVersaoDeParams(FPLayout);

  Result := '<versaoDados>' + FPVersaoServico + '</versaoDados>';
end;

procedure TDPSWebService.FinalizarServico;
begin
  { Sobrescrever apenas se necessário }

  // Retornar configurações anteriores
  FPDFeOwner.SSL.SSLType := FOldSSLType;
  FPHeaderElement := FOldHeaderElement;

  TACBrDPS(FPDFeOwner).SetStatus(stIdleDPS);
end;

{ TDPSStatusServico }

procedure TDPSStatusServico.Clear;
begin
  inherited Clear;

  FPStatus := stDPSStatusServico;
  FPLayout := LayDPSStatusServico;
  FPArqEnv := 'ped-sta';
  FPArqResp := 'sta';

  Fversao := '';
  FverAplic := '';
  FcStat := 0;
  FxMotivo := '';
  FdhRecbto := 0;
  FTMed := 0;
  FdhRetorno := 0;
  FxObs := '';

  if Assigned(FPConfiguracoesDPS) then
  begin
    FtpAmb := FPConfiguracoesDPS.WebServices.Ambiente;
    FcUF := FPConfiguracoesDPS.WebServices.UFCodigo;
  end
end;

procedure TDPSStatusServico.DefinirServicoEAction;
begin
  FPServico := GetUrlWsd + 'DPSStatusServico';
  FPSoapAction := FPServico + '/DPSStatusServicoBP';
end;

procedure TDPSStatusServico.DefinirDadosMsg;
var
  ConsStatServ: TConsStatServ;
begin
//  ConsStatServ := TConsStatServ.Create(FPVersaoServico, NAME_SPACE_DPS,
//                                       'DPS', False);
  try
    ConsStatServ.TpAmb := FPConfiguracoesDPS.WebServices.Ambiente;
    ConsStatServ.CUF := FPConfiguracoesDPS.WebServices.UFCodigo;

    AjustarOpcoes( ConsStatServ.Gerador.Opcoes );
    ConsStatServ.GerarXML;

    // Atribuindo o XML para propriedade interna //
    FPDadosMsg := ConsStatServ.Gerador.ArquivoFormatoXML;
  finally
    ConsStatServ.Free;
  end;
end;

function TDPSStatusServico.TratarResposta: Boolean;
var
  DPSRetorno: TRetConsStatServ;
begin
  FPRetWS := SeparaDadosArray(['DPSResultMsg', 'DPSStatusServicoBPResult'], FPRetornoWS );

  DPSRetorno := TRetConsStatServ.Create('DPS');
  try
    DPSRetorno.Leitor.Arquivo := ParseText(FPRetWS);
    DPSRetorno.LerXml;

    Fversao := DPSRetorno.versao;
    FtpAmb := DPSRetorno.tpAmb;
    FverAplic := DPSRetorno.verAplic;
    FcStat := DPSRetorno.cStat;
    FxMotivo := DPSRetorno.xMotivo;
    FcUF := DPSRetorno.cUF;
    { WebService do RS retorna horário de verão mesmo pros estados que não
      adotam esse horário, ao utilizar esta hora para basear a emissão do Nota
      acontece o erro. }
    if (pos('svrs.rs.gov.br', FPURL) > 0) and
       (MinutesBetween(DPSRetorno.dhRecbto, Now) > 50) and
       (not IsHorarioDeVerao(CUFtoUF(FcUF), DPSRetorno.dhRecbto)) then
      FdhRecbto:= IncHour(DPSRetorno.dhRecbto, -1)
    else
      FdhRecbto := DPSRetorno.dhRecbto;

    FTMed := DPSRetorno.TMed;
    FdhRetorno := DPSRetorno.dhRetorno;
    FxObs := DPSRetorno.xObs;
    FPMsg := FxMotivo + LineBreak + FxObs;

    if FPConfiguracoesDPS.WebServices.AjustaAguardaConsultaRet then
      FPConfiguracoesDPS.WebServices.AguardarConsultaRet := FTMed * 1000;

    Result := (FcStat = 107);

  finally
    DPSRetorno.Free;
  end;
end;

function TDPSStatusServico.GerarMsgLog: String;
begin
  {(*}
  Result := Format(ACBrStr('Versão Layout: %s ' + LineBreak +
                           'Ambiente: %s' + LineBreak +
                           'Versão Aplicativo: %s ' + LineBreak +
                           'Status Código: %s' + LineBreak +
                           'Status Descrição: %s' + LineBreak +
                           'UF: %s' + LineBreak +
                           'Recebimento: %s' + LineBreak +
                           'Tempo Médio: %s' + LineBreak +
                           'Retorno: %s' + LineBreak +
                           'Observação: %s' + LineBreak),
                   [Fversao, TpAmbToStr(FtpAmb), FverAplic, IntToStr(FcStat),
                    FxMotivo, CodigoParaUF(FcUF),
                    IfThen(FdhRecbto = 0, '', FormatDateTimeBr(FdhRecbto)),
                    IntToStr(FTMed),
                    IfThen(FdhRetorno = 0, '', FormatDateTimeBr(FdhRetorno)),
                    FxObs]);
  {*)}
end;

function TDPSStatusServico.GerarMsgErro(E: Exception): String;
begin
  Result := ACBrStr('WebService Consulta Status serviço:' + LineBreak +
                    '- Inativo ou Inoperante tente novamente.');
end;

{ TDPSRecepcao }

constructor TDPSRecepcao.Create(AOwner: TACBrDFe; ANotas: TNotas);
begin
  inherited Create(AOwner);

  FNotas := ANotas;
end;

destructor TDPSRecepcao.Destroy;
begin
  FDPSRetorno.Free;

  inherited Destroy;
end;

procedure TDPSRecepcao.Clear;
begin
  inherited Clear;

  FPStatus := stDPSRecepcao;
  FPLayout := LayDPSRecepcao;
  FPArqEnv := 'env-lot';
  FPArqResp := 'rec';

  Fversao := '';
  FTMed := 0;
  FverAplic := '';
  FcStat    := 0;
  FxMotivo  := '';
  FdhRecbto := 0;

  if Assigned(FPConfiguracoesDPS) then
  begin
    FtpAmb := FPConfiguracoesDPS.WebServices.Ambiente;
    FcUF := FPConfiguracoesDPS.WebServices.UFCodigo;
  end;

  if Assigned(FDPSRetorno) then
    FDPSRetorno.Free;

  FDPSRetorno := TretEnvDPS.Create;
end;

function TDPSRecepcao.GetLote: String;
begin
  Result := Trim(FLote);
end;

procedure TDPSRecepcao.InicializarServico;
var
  ok: Boolean;
begin
  if FNotas.Count > 0 then    // Tem DPS ? Se SIM, use as informações do XML
    FVersaoDF := DblToVersaoDPS(ok, FNotas.Items[0].DPS.Versao)
  else
    FVersaoDF := FPConfiguracoesDPS.Geral.VersaoDF;

  inherited InicializarServico;
end;

procedure TDPSRecepcao.DefinirURL;
var
  xUF: String;
  VerServ: Double;
begin
  if FNotas.Count > 0 then    // Tem DPS ? Se SIM, use as informações do XML
  begin
    FcUF := UFtoCUF(FNotas.Items[0].DPS.infDPS.prest.enderNac.UF);

    if FPConfiguracoesDPS.WebServices.Ambiente <> FNotas.Items[0].DPS.infDPS.tpAmb then
      raise EACBrDPSException.Create( ACBRDPS_CErroAmbienteDiferente );
  end
  else
  begin     // Se não tem DPS, use as configurações do componente
    FcUF := FPConfiguracoesDPS.WebServices.UFCodigo;
  end;

  VerServ := VersaoDPSToDbl(FVersaoDF);
  FTpAmb  := FPConfiguracoesDPS.WebServices.Ambiente;
  FPVersaoServico := '';
  FPURL := '';

  FPLayout := LayDPSRecepcao;

  // Configuração correta ao enviar para o SVC
  case FPConfiguracoesDPS.Geral.FormaEmissao of
    teSVCAN: xUF := 'SVC-AN';
    teSVCRS: xUF := 'SVC-RS';
  else
    xUF := CUFtoUF(FcUF);
  end;

  TACBrDPS(FPDFeOwner).LerServicoDeParams(
    ModeloDF,
    xUF,
    FTpAmb,
    LayOutDPSToServico(FPLayout),
    VerServ,
    FPURL
  );

  FPVersaoServico := FloatToString(VerServ, '.', '0.00');
end;

procedure TDPSRecepcao.DefinirServicoEAction;
begin
  FPServico := GetUrlWsd + 'DPSRecepcao';

  if FPConfiguracoesDPS.WebServices.UFCodigo in [31, 52] then
    FPSoapAction := FPServico + '/DPSRecepcao'
  else
    FPSoapAction := FPServico;
end;

procedure TDPSRecepcao.DefinirDadosMsg;
begin
  // No envio só podemos ter apena UM BP-e, pois o seu processamento é síncrono
  if FNotas.Count > 1 then
    GerarException(ACBrStr('ERRO: Conjunto de BP-e transmitidos (máximo de 1 BP-e)' +
             ' excedido. Quantidade atual: ' + IntToStr(FNotas.Count)));

  if FNotas.Count > 0 then
    FPDadosMsg := '<DPS' +
       RetornarConteudoEntre(FNotas.Items[0].XMLAssinado, '<DPS', '</DPS>') +
       '</DPS>';

  FMsgUnZip := FPDadosMsg;

  FPDadosMsg := EncodeBase64(GZipCompress(FPDadosMsg));

  // Lote tem mais de 500kb ? //
  if Length(FPDadosMsg) > (500 * 1024) then
    GerarException(ACBrStr('Tamanho do XML de Dados superior a 500 Kbytes. Tamanho atual: ' +
      IntToStr(trunc(Length(FPDadosMsg) / 1024)) + ' Kbytes'));
end;

procedure TDPSRecepcao.SalvarEnvio;
var
  Prefixo, ArqEnv: String;
  IsUTF8: Boolean;
begin
  if FPArqEnv = '' then
    exit;

  Prefixo := GerarPrefixoArquivo;

  if FPConfiguracoes.Geral.Salvar then
  begin
    ArqEnv := Prefixo + '-' + FPArqEnv + '.xml';

    IsUTF8  := XmlEstaAssinado(FMsgUnZip);
    FPDFeOwner.Gravar(ArqEnv, FMsgUnZip, '', IsUTF8);
  end;

  if FPConfiguracoes.WebServices.Salvar then
  begin
    ArqEnv := Prefixo + '-' + FPArqEnv + '-soap.xml';

    IsUTF8  := XmlEstaAssinado(FPEnvelopeSoap);
    FPDFeOwner.Gravar(ArqEnv, FPEnvelopeSoap, '', IsUTF8);
  end;
end;

function TDPSRecepcao.TratarResposta: Boolean;
var
  I: Integer;
  chDPS, NomeXMLSalvo: String;
  AProcDPS: TProcDPS;
  SalvarXML: Boolean;
begin
  FPRetWS := SeparaDadosArray(['DPSResultMsg', 'DPSRecepcaoResult'], FPRetornoWS );

  FDPSRetorno.Leitor.Arquivo := ParseText(FPRetWS);
  FDPSRetorno.LerXml;

  Fversao   := FDPSRetorno.versao;
  FTpAmb    := FDPSRetorno.TpAmb;
  FverAplic := FDPSRetorno.verAplic;
  FcUF      := FDPSRetorno.cUF;
  FcStat    := FDPSRetorno.cStat;
  FPMsg     := FDPSRetorno.xMotivo;
  FxMotivo  := FDPSRetorno.xMotivo;

  if FDPSRetorno.ProtDPS.Count > 0 then
  begin
    chDPS    := FDPSRetorno.ProtDPS[0].chDPS;
    FcStat   := FDPSRetorno.protDPS[0].cStat;
    FPMsg    := FDPSRetorno.protDPS[0].xMotivo;
    FxMotivo := FDPSRetorno.protDPS[0].xMotivo;
  end;

  // Verificar se o BP-e foi autorizado com sucesso
  Result := (FDPSRetorno.cStat = 100) and
      (TACBrDPS(FPDFeOwner).CstatProcessado(FDPSRetorno.protDPS[0].cStat));

  if Result then
  begin
    for I := 0 to TACBrDPS(FPDFeOwner).Notas.Count - 1 do
    begin
      with TACBrDPS(FPDFeOwner).Notas.Items[I] do
      begin
        if OnlyNumber(chDPS) = NumID then
        begin
         (*
          if (FPConfiguracoesDPS.Geral.ValidarDigest) and
             (FDPSRetorno.protDPS[0].digVal <> '') and
             (DPS.signature.DigestValue <> FDPSRetorno.protDPS[0].digVal) then
            raise EACBrDPSException.Create('DigestValue do documento ' + NumID + ' não confere.');

          DPS.procDPS.cStat    := FDPSRetorno.protDPS[0].cStat;
          DPS.procDPS.tpAmb    := FDPSRetorno.tpAmb;
          DPS.procDPS.verAplic := FDPSRetorno.verAplic;
          DPS.procDPS.chDPS    := FDPSRetorno.ProtDPS[0].chDPS;
          DPS.procDPS.dhRecbto := FDPSRetorno.protDPS[0].dhRecbto;
          DPS.procDPS.nProt    := FDPSRetorno.ProtDPS[0].nProt;
          DPS.procDPS.digVal   := FDPSRetorno.protDPS[0].digVal;
          DPS.procDPS.xMotivo  := FDPSRetorno.protDPS[0].xMotivo;
          *)
          AProcDPS := TProcDPS.Create;
          try
            // Processando em UTF8, para poder gravar arquivo corretamente //
            AProcDPS.XML_DPS := RemoverDeclaracaoXML(XMLAssinado);
            AProcDPS.XML_Prot := FDPSRetorno.ProtDPS[0].XMLprotDPS;
            AProcDPS.Versao := FPVersaoServico;
            AjustarOpcoes( AProcDPS.Gerador.Opcoes );
            AProcDPS.GerarXML;

            XMLOriginal := AProcDPS.Gerador.ArquivoFormatoXML;

            if FPConfiguracoesDPS.Arquivos.Salvar then
            begin
              SalvarXML := (not FPConfiguracoesDPS.Arquivos.SalvarApenasDPSProcessadas) or
                             Processada;

              // Salva o XML do BP-e assinado e protocolado
              if SalvarXML then
              begin
                NomeXMLSalvo := '';
                if NaoEstaVazio(NomeArq) and FileExists(NomeArq) then
                begin
                  FPDFeOwner.Gravar( NomeArq, XMLOriginal ); // Atualiza o XML carregado
                  NomeXMLSalvo := NomeArq;
                end;

                if (NomeXMLSalvo <> CalcularNomeArquivoCompleto()) then
                  GravarXML; // Salva na pasta baseado nas configurações do PathDPS
              end;
            end;
          finally
            AProcDPS.Free;
          end;

          Break;
        end;
      end;
    end;
  end;
end;

function TDPSRecepcao.GerarMsgLog: String;
begin
  {(*}
    Result := Format(ACBrStr('Versão Layout: %s ' + LineBreak +
                             'Ambiente: %s ' + LineBreak +
                             'Versão Aplicativo: %s ' + LineBreak +
                             'Status Código: %s ' + LineBreak +
                             'Status Descrição: %s ' + LineBreak +
                             'UF: %s '),
                     [FDPSRetorno.versao,
                      TpAmbToStr(FDPSRetorno.TpAmb),
                      FDPSRetorno.verAplic,
                      IntToStr(FDPSRetorno.cStat),
                      FDPSRetorno.xMotivo,
                      CodigoParaUF(FDPSRetorno.cUF)]);
  {*)}
end;

function TDPSRecepcao.GerarPrefixoArquivo: String;
begin
  Result := Lote;
  FPArqResp := 'pro-lot';
end;

{ TDPSConsulta }

constructor TDPSConsulta.Create(AOwner: TACBrDFe; ANotas: TNotas);
begin
  inherited Create(AOwner);

  FOwner := AOwner;
  FNotas := ANotas;
end;

destructor TDPSConsulta.Destroy;
begin
  FprotDPS.Free;
//  FprocEventoDPS.Free;

  inherited Destroy;
end;

procedure TDPSConsulta.Clear;
begin
  inherited Clear;

  FPStatus := stDPSConsulta;
  FPLayout := LayDPSConsulta;
  FPArqEnv := 'ped-sit';
  FPArqResp := 'sit';

  FverAplic := '';
  FcStat := 0;
  FxMotivo := '';
  FProtocolo := '';
  FDhRecbto := 0;
  Fversao := '';
  FRetDPSDFe := '';

  if Assigned(FPConfiguracoesDPS) then
  begin
    FtpAmb := FPConfiguracoesDPS.WebServices.Ambiente;
    FcUF := FPConfiguracoesDPS.WebServices.UFCodigo;
  end;

  if Assigned(FprotDPS) then
    FprotDPS.Free;

//  if Assigned(FprocEventoDPS) then
//    FprocEventoDPS.Free;

  FprotDPS := TProcDPS.Create;
//  FprocEventoDPS := TRetEventoDPSCollection.Create(FOwner);
end;

procedure TDPSConsulta.SetDPSChave(AValue: String);
var
  NumChave: String;
begin
  if FDPSChave = AValue then Exit;
  NumChave := OnlyNumber(AValue);

  if not ValidarChave(NumChave) then
     raise EACBrDPSException.Create('Chave "' + AValue + '" inválida.');

  FDPSChave := NumChave;
end;

procedure TDPSConsulta.DefinirURL;
var
  VerServ: Double;
  xUF: String;
begin
  FPVersaoServico := '';
  FPURL   := '';
  FcUF    := ExtrairUFChaveAcesso(FDPSChave);
  VerServ := VersaoDPSToDbl(FPConfiguracoesDPS.Geral.VersaoDF);

  if FNotas.Count > 0 then
    FTpAmb  := FNotas.Items[0].DPS.infDPS.tpAmb
  else
    FTpAmb  := FPConfiguracoesDPS.WebServices.Ambiente;

  // Se o Nota foi enviado para o SVC a consulta tem que ser realizada no SVC e
  // não na SEFAZ-Autorizadora
  case FPConfiguracoesDPS.Geral.FormaEmissao of
    teSVCAN: xUF := 'SVC-AN';
    teSVCRS: xUF := 'SVC-RS';
  else
    xUF := CUFtoUF(FcUF);
  end;

  TACBrDPS(FPDFeOwner).LerServicoDeParams(
    ModeloDF,
    xUF,
    FTpAmb,
    LayOutDPSToServico(FPLayout),
    VerServ,
    FPURL
  );

  FPVersaoServico := FloatToString(VerServ, '.', '0.00');
end;

procedure TDPSConsulta.DefinirServicoEAction;
begin
  FPServico := GetUrlWsd + 'DPSConsulta';
  FPSoapAction := FPServico + '/DPSConsultaBP';
end;

procedure TDPSConsulta.DefinirDadosMsg;
var
  ConsSitDPS: TConsSitDPS;
begin
  ConsSitDPS := TConsSitDPS.Create;
  try
    ConsSitDPS.TpAmb := FTpAmb;
    ConsSitDPS.chDPS := FDPSChave;
    ConsSitDPS.Versao := FPVersaoServico;
    AjustarOpcoes( ConsSitDPS.Gerador.Opcoes );
    ConsSitDPS.GerarXML;

    FPDadosMsg := ConsSitDPS.Gerador.ArquivoFormatoXML;
  finally
    ConsSitDPS.Free;
  end;
end;

function TDPSConsulta.GerarUFSoap: String;
begin
  Result := '<cUF>' + IntToStr(FcUF) + '</cUF>';
end;

function TDPSConsulta.TratarResposta: Boolean;
var
  DPSRetorno: TRetConsSitDPS;
  SalvarXML, BPCancelado, Atualiza: Boolean;
  aEventos, sPathDPS, NomeXMLSalvo: String;
  AProcDPS: TProcDPS;
  I, J, Inicio, Fim: Integer;
  dhEmissao: TDateTime;
begin
  DPSRetorno := TRetConsSitDPS.Create;
  try
    FPRetWS := SeparaDadosArray(['DPSResultMsg', 'DPSConsultaBPResult'], FPRetornoWS );

    DPSRetorno.Leitor.Arquivo := ParseText(FPRetWS);
    DPSRetorno.LerXML;

    BPCancelado := False;
    aEventos := '';

    // <retConsSitDPS> - Retorno da consulta da situação do BP-e
    // Este é o status oficial do BP-e
    Fversao := DPSRetorno.versao;
    FTpAmb := DPSRetorno.tpAmb;
    FverAplic := DPSRetorno.verAplic;
    FcStat := DPSRetorno.cStat;
    FXMotivo := DPSRetorno.xMotivo;
    FcUF := DPSRetorno.cUF;
    FPMsg := FXMotivo;

    // <protDPS> - Retorno dos dados do ENVIO do BP-e
    // Considerá-los apenas se não existir nenhum evento de cancelamento (110111)
    FprotDPS.PathDPS := DPSRetorno.protDPS.PathDPS;
    FprotDPS.PathRetConsReciDPS := DPSRetorno.protDPS.PathRetConsReciDPS;
    FprotDPS.PathRetConsSitDPS := DPSRetorno.protDPS.PathRetConsSitDPS;
    FprotDPS.PathRetConsSitDPS := DPSRetorno.protDPS.PathRetConsSitDPS;
    FprotDPS.tpAmb := DPSRetorno.protDPS.tpAmb;
    FprotDPS.verAplic := DPSRetorno.protDPS.verAplic;
    FprotDPS.chDPS := DPSRetorno.protDPS.chDPS;
    FprotDPS.dhRecbto := DPSRetorno.protDPS.dhRecbto;
    FprotDPS.nProt := DPSRetorno.protDPS.nProt;
    FprotDPS.digVal := DPSRetorno.protDPS.digVal;
    FprotDPS.cStat := DPSRetorno.protDPS.cStat;
    FprotDPS.xMotivo := DPSRetorno.protDPS.xMotivo;

    (*
    if Assigned(DPSRetorno.procEventoDPS) and (DPSRetorno.procEventoDPS.Count > 0) then
    begin
      aEventos := '=====================================================' +
        LineBreak + '================== Eventos do BP-e ==================' +
        LineBreak + '=====================================================' +
        LineBreak + '' + LineBreak + 'Quantidade total de eventos: ' +
        IntToStr(DPSRetorno.procEventoDPS.Count);

      FprocEventoDPS.Clear;
      for I := 0 to DPSRetorno.procEventoDPS.Count - 1 do
      begin
        with FprocEventoDPS.Add.RetEventoDPS do
        begin
          idLote := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.idLote;
          tpAmb := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.tpAmb;
          verAplic := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.verAplic;
          cOrgao := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.cOrgao;
          cStat := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.cStat;
          xMotivo := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.xMotivo;
          XML := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.XML;

          infEvento.ID := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.infEvento.ID;
          infEvento.tpAmb := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.infEvento.tpAmb;
          infEvento.CNPJ := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.infEvento.CNPJ;
          infEvento.chDPS := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.infEvento.chDPS;
          infEvento.dhEvento := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.infEvento.dhEvento;
          infEvento.TpEvento := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.infEvento.TpEvento;
          infEvento.nSeqEvento := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.infEvento.nSeqEvento;
          infEvento.VersaoEvento := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.infEvento.VersaoEvento;
          infEvento.DetEvento.xCorrecao := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.infEvento.DetEvento.xCorrecao;
          infEvento.DetEvento.xCondUso := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.infEvento.DetEvento.xCondUso;
          infEvento.DetEvento.nProt := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.infEvento.DetEvento.nProt;
          infEvento.DetEvento.xJust := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.infEvento.DetEvento.xJust;

          retEvento.Clear;
          for J := 0 to DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.retEvento.Count-1 do
          begin
            with retEvento.Add.RetinfEvento do
            begin
              Id := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.retEvento.Items[J].RetinfEvento.Id;
              tpAmb := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.retEvento.Items[J].RetinfEvento.tpAmb;
              verAplic := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.retEvento.Items[J].RetinfEvento.verAplic;
              cOrgao := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.retEvento.Items[J].RetinfEvento.cOrgao;
              cStat := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.retEvento.Items[J].RetinfEvento.cStat;
              xMotivo := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.retEvento.Items[J].RetinfEvento.xMotivo;
              chDPS := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.retEvento.Items[J].RetinfEvento.chDPS;
              tpEvento := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.retEvento.Items[J].RetinfEvento.tpEvento;
              xEvento := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.retEvento.Items[J].RetinfEvento.xEvento;
              nSeqEvento := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.retEvento.Items[J].RetinfEvento.nSeqEvento;
              CNPJDest := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.retEvento.Items[J].RetinfEvento.CNPJDest;
              emailDest := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.retEvento.Items[J].RetinfEvento.emailDest;
              dhRegEvento := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.retEvento.Items[J].RetinfEvento.dhRegEvento;
              nProt := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.retEvento.Items[J].RetinfEvento.nProt;
              XML := DPSRetorno.procEventoDPS.Items[I].RetEventoDPS.retEvento.Items[J].RetinfEvento.XML;
            end;
          end;
        end;

        with DPSRetorno.procEventoDPS.Items[I].RetEventoDPS do
        begin
          for j := 0 to retEvento.Count -1 do
          begin
            aEventos := aEventos + LineBreak + LineBreak +
              Format(ACBrStr('Número de sequência: %s ' + LineBreak +
                             'Código do evento: %s ' + LineBreak +
                             'Descrição do evento: %s ' + LineBreak +
                             'Status do evento: %s ' + LineBreak +
                             'Descrição do status: %s ' + LineBreak +
                             'Protocolo: %s ' + LineBreak +
                             'Data/Hora do registro: %s '),
                     [IntToStr(infEvento.nSeqEvento),
                      TpEventoToStr(infEvento.TpEvento),
                      infEvento.DescEvento,
                      IntToStr(retEvento.Items[J].RetinfEvento.cStat),
                      retEvento.Items[J].RetinfEvento.xMotivo,
                      retEvento.Items[J].RetinfEvento.nProt,
                      FormatDateTimeBr(retEvento.Items[J].RetinfEvento.dhRegEvento)]);

            if retEvento.Items[J].RetinfEvento.tpEvento = teCancelamento then
            begin
              BPCancelado := True;
              FProtocolo := retEvento.Items[J].RetinfEvento.nProt;
              FDhRecbto := retEvento.Items[J].RetinfEvento.dhRegEvento;
              FPMsg := retEvento.Items[J].RetinfEvento.xMotivo;
            end;
          end;
        end;
      end;
    end;
    *)

    if (not BPCancelado) and (NaoEstaVazio(DPSRetorno.protDPS.nProt))  then
    begin
      FProtocolo := DPSRetorno.protDPS.nProt;
      FDhRecbto := DPSRetorno.protDPS.dhRecbto;
      FPMsg := DPSRetorno.protDPS.xMotivo;
    end;

    with TACBrDPS(FPDFeOwner) do
    begin
      Result := CstatProcessado(DPSRetorno.CStat) or
                CstatCancelada(DPSRetorno.CStat);
    end;

    for i := 0 to TACBrDPS(FPDFeOwner).Notas.Count - 1 do
    begin
      with TACBrDPS(FPDFeOwner).Notas.Items[i] do
      begin
        if (OnlyNumber(FDPSChave) = NumID) then
        begin
          Atualiza := (NaoEstaVazio(DPSRetorno.XMLprotDPS));
          if Atualiza and TACBrDPS(FPDFeOwner).CstatCancelada(DPSRetorno.CStat) then
            Atualiza := False;
          (*
          if (FPConfiguracoesDPS.Geral.ValidarDigest) and
            (DPSRetorno.protDPS.digVal <> '') and (DPS.signature.DigestValue <> '') and
            (UpperCase(DPS.signature.DigestValue) <> UpperCase(DPSRetorno.protDPS.digVal)) then
          begin
            raise EACBrDPSException.Create('DigestValue do documento ' +
              NumID + ' não confere.');
          end;

          // Atualiza o Status do DPS interna //
          DPS.procDPS.cStat := DPSRetorno.cStat;
          *)
          if Atualiza then
          begin
           (*
            DPS.procDPS.tpAmb := DPSRetorno.tpAmb;
            DPS.procDPS.verAplic := DPSRetorno.verAplic;
//            DPS.procDPS.chDPS := DPSRetorno.chDPS;
            DPS.procDPS.dhRecbto := FDhRecbto;
            DPS.procDPS.nProt := FProtocolo;
            DPS.procDPS.digVal := DPSRetorno.protDPS.digVal;
            DPS.procDPS.cStat := DPSRetorno.cStat;
            DPS.procDPS.xMotivo := DPSRetorno.xMotivo;
            *)
            // O código abaixo é bem mais rápido que "GerarXML" (acima)...
            AProcDPS := TProcDPS.Create;
            try
              AProcDPS.XML_DPS := RemoverDeclaracaoXML(XMLOriginal);
              AProcDPS.XML_Prot := DPSRetorno.XMLprotDPS;
              AProcDPS.Versao := FPVersaoServico;
              AjustarOpcoes( AProcDPS.Gerador.Opcoes );
              AProcDPS.GerarXML;

              XMLOriginal := AProcDPS.Gerador.ArquivoFormatoXML;
            finally
              AProcDPS.Free;
            end;
          end;

          { Se no retorno da consulta constar que o Nota possui eventos vinculados
           será disponibilizado na propriedade FRetDPSDFe, e conforme configurado
           em "ConfiguracoesDPS.Arquivos.Salvar", também será gerado o arquivo:
           <chave>-DPSDFe.xml}

          FRetDPSDFe := '';

          if (NaoEstaVazio(SeparaDados(FPRetWS, 'procEventoDPS'))) then
          begin
            Inicio := Pos('<procEventoDPS', FPRetWS);
            Fim    := Pos('</retConsSitDPS', FPRetWS) -1;

            aEventos := Copy(FPRetWS, Inicio, Fim - Inicio + 1);

            FRetDPSDFe := '<' + ENCODING_UTF8 + '>' +
                          '<DPSDFe>' +
                           '<procDPS versao="' + FVersao + '">' +
                             SeparaDados(XMLOriginal, 'DPSProc') +
                           '</procDPS>' +
                           '<procEventoDPS versao="' + FVersao + '">' +
                             aEventos +
                           '</procEventoDPS>' +
                          '</DPSDFe>';
          end;

          SalvarXML := Result and FPConfiguracoesDPS.Arquivos.Salvar and Atualiza;

          if SalvarXML then
          begin
            // Salva o XML do BP-e assinado, protocolado e com os eventos
            if FPConfiguracoesDPS.Arquivos.EmissaoPathDPS then
              dhEmissao := DPS.infDPS.dhEmi
            else
              dhEmissao := Now;

            sPathDPS := PathWithDelim(FPConfiguracoesDPS.Arquivos.GetPathDPS(dhEmissao, DPS.infDPS.prest.CNPJCPF));

            if (FRetDPSDFe <> '') then
              FPDFeOwner.Gravar( FDPSChave + '-DPSDFe.xml', FRetDPSDFe, sPathDPS);

            if Atualiza then
            begin
              // Salva o XML do BP-e assinado e protocolado
              NomeXMLSalvo := '';
              if NaoEstaVazio(NomeArq) and FileExists(NomeArq) then
              begin
                FPDFeOwner.Gravar( NomeArq, XMLOriginal );  // Atualiza o XML carregado
                NomeXMLSalvo := NomeArq;
              end;

              // Salva na pasta baseado nas configurações do PathDPS
              if (NomeXMLSalvo <> CalcularNomeArquivoCompleto()) then
                GravarXML;
            end;
          end;

          break;
        end;
      end;
    end;
  finally
    DPSRetorno.Free;
  end;
end;

function TDPSConsulta.GerarMsgLog: String;
begin
  {(*}
  Result := Format(ACBrStr('Versão Layout: %s ' + LineBreak +
                           'Identificador: %s ' + LineBreak +
                           'Ambiente: %s ' + LineBreak +
                           'Versão Aplicativo: %s ' + LineBreak +
                           'Status Código: %s ' + LineBreak +
                           'Status Descrição: %s ' + LineBreak +
                           'UF: %s ' + LineBreak +
                           'Chave Acesso: %s ' + LineBreak +
                           'Recebimento: %s ' + LineBreak +
                           'Protocolo: %s ' + LineBreak +
                           'Digest Value: %s ' + LineBreak),
                   [Fversao, FDPSChave, TpAmbToStr(FTpAmb), FverAplic,
                    IntToStr(FcStat), FXMotivo, CodigoParaUF(FcUF), FDPSChave,
                    FormatDateTimeBr(FDhRecbto), FProtocolo, FprotDPS.digVal]);
  {*)}
end;

function TDPSConsulta.GerarPrefixoArquivo: String;
begin
  Result := Trim(FDPSChave);
end;

{ TDPSEnvEvento }

constructor TDPSEnvEvento.Create(AOwner: TACBrDFe; AEvento: TEventoDPS);
begin
  inherited Create(AOwner);

  FEvento := AEvento;
end;

destructor TDPSEnvEvento.Destroy;
begin
  if Assigned(FEventoRetorno) then
    FEventoRetorno.Free;

  inherited;
end;

procedure TDPSEnvEvento.Clear;
begin
  inherited Clear;

  FPStatus := stDPSEvento;
  FPLayout := LayDPSEvento;
  FPArqEnv := 'ped-eve';
  FPArqResp := 'eve';

  FcStat   := 0;
  FxMotivo := '';
  FCNPJ := '';

  if Assigned(FPConfiguracoesDPS) then
    FtpAmb := FPConfiguracoesDPS.WebServices.Ambiente;

  if Assigned(FEventoRetorno) then
    FEventoRetorno.Free;

  FEventoRetorno := TRetEventoDPS.Create;
end;

function TDPSEnvEvento.GerarPathEvento(const ACNPJ: String): String;
begin
(*
  with FEvento.Evento.Items[0].infEvento do
  begin
    Result := FPConfiguracoesDPS.Arquivos.GetPathEvento(tpEvento, ACNPJ);
  end;
  *)
end;

procedure TDPSEnvEvento.DefinirURL;
var
  UF: String;
  VerServ: Double;
begin
  { Verificação necessária pois somente os eventos de Cancelamento e CCe serão tratados pela SEFAZ do estado
    os outros eventos como manifestacao de destinatários serão tratados diretamente pela RFB }

  FPLayout := LayDPSEvento;
  VerServ  := VersaoDPSToDbl(FPConfiguracoesDPS.Geral.VersaoDF);
//  FCNPJ    := FEvento.Evento.Items[0].infEvento.CNPJ;
//  FTpAmb   := FEvento.Evento.Items[0].infEvento.tpAmb;

  // Configuração correta ao enviar para o SVC
  case FPConfiguracoesDPS.Geral.FormaEmissao of
    teSVCAN: UF := 'SVC-AN';
    teSVCRS: UF := 'SVC-RS';
//  else
//    UF := CUFtoUF(ExtrairUFChaveAcesso(FEvento.Evento.Items[0].infEvento.chDPS));
  end;

//  if not (FEvento.Evento.Items[0].infEvento.tpEvento in [teCancelamento, teNaoEmbarque]) then
//  begin
//    FPLayout := LayDPSEventoAN;
//    UF       := 'AN';
//  end;

  FPURL := '';

  TACBrDPS(FPDFeOwner).LerServicoDeParams(
    ModeloDF,
    UF,
    FTpAmb,
    LayOutDPSToServico(FPLayout),
    VerServ,
    FPURL
  );

  FPVersaoServico := FloatToString(VerServ, '.', '0.00');
end;

procedure TDPSEnvEvento.DefinirServicoEAction;
begin
  FPServico := GetUrlWsd + 'DPSRecepcaoEvento';
  FPSoapAction := FPServico + '/DPSRecepcaoEvento';
end;

procedure TDPSEnvEvento.DefinirDadosMsg;
var
  EventoDPS: TEventoDPS;
  I, F: Integer;
  Evento, Eventos, EventosAssinados, AXMLEvento: AnsiString;
  FErroValidacao: String;
  EventoEhValido: Boolean;
  SchemaEventoDPS: TSchemaDPS;
begin
  EventoDPS := TEventoDPS.Create;

  try
    EventoDPS.idLote := FidLote;
    SchemaEventoDPS  := schErro;

    (*
    for I := 0 to FEvento.Evento.Count - 1 do
    begin
      with EventoDPS.Evento.Add do
      begin
        infEvento.tpAmb := FTpAmb;
        infEvento.CNPJ := FEvento.Evento[I].infEvento.CNPJ;
        infEvento.cOrgao := FEvento.Evento[I].infEvento.cOrgao;
        infEvento.chDPS := FEvento.Evento[I].infEvento.chDPS;
        infEvento.dhEvento := FEvento.Evento[I].infEvento.dhEvento;
        infEvento.tpEvento := FEvento.Evento[I].infEvento.tpEvento;
        infEvento.nSeqEvento := FEvento.Evento[I].infEvento.nSeqEvento;
        infEvento.versaoEvento := FEvento.Evento[I].InfEvento.versaoEvento;

        case infEvento.tpEvento of
          teCancelamento: SchemaEventoDPS := schevCancDPS;
          teNaoEmbarque: SchemaEventoDPS := schevNaoEmbDPS;
        end;

        infEvento.detEvento.nProt := FEvento.Evento[I].infEvento.detEvento.nProt;
        infEvento.detEvento.xJust := FEvento.Evento[I].infEvento.detEvento.xJust;
      end;
    end;
    *)

    EventoDPS.Versao := FPVersaoServico;
    AjustarOpcoes( EventoDPS.Gerador.Opcoes );
    EventoDPS.GerarXML;

    Eventos := NativeStringToUTF8( EventoDPS.Gerador.ArquivoFormatoXML );
    EventosAssinados := '';

    // Realiza a assinatura para cada evento
    while Eventos <> '' do
    begin
      F := Pos('</eventoDPS>', Eventos);

      if F > 0 then
      begin
        Evento := Copy(Eventos, 1, F + 12);
        Eventos := Copy(Eventos, F + 13, length(Eventos));

        AssinarXML(Evento, 'eventoDPS', 'infEvento', 'Falha ao assinar o Envio de Evento ');
        EventosAssinados := EventosAssinados + FPDadosMsg;
      end
      else
        Break;
    end;

    // Separa o XML especifico do Evento para ser Validado.
    AXMLEvento := '<' + ENCODING_UTF8 + '>' +
                  SeparaDados(FPDadosMsg, 'detEvento');

    with TACBrDPS(FPDFeOwner) do
    begin
      EventoEhValido := SSL.Validar(FPDadosMsg,
                                    GerarNomeArqSchema(FPLayout,
                                                       StringToFloatDef(FPVersaoServico, 0)),
                                    FPMsg) and
                        SSL.Validar(AXMLEvento,
                                    GerarNomeArqSchemaEvento(SchemaEventoDPS,
                                                             StringToFloatDef(FPVersaoServico, 0)),
                                    FPMsg);
    end;

    if not EventoEhValido then
    begin
      FErroValidacao := ACBrStr('Falha na validação dos dados do Evento: ') +
        FPMsg;

//      raise EACBrDPSException.CreateDef(FErroValidacao);
    end;

//    for I := 0 to FEvento.Evento.Count - 1 do
//      FEvento.Evento[I].infEvento.id := EventoDPS.Evento[I].infEvento.id;
  finally
    EventoDPS.Free;
  end;
end;

function TDPSEnvEvento.TratarResposta: Boolean;
var
  Leitor: TLeitor;
  I, J: Integer;
  NomeArq, PathArq, VersaoEvento, Texto: String;
begin
  FEvento.idLote := idLote;

  FPRetWS := SeparaDadosArray(['DPSResultMsg', 'DPSRecepcaoEventoResult'], FPRetornoWS );

  EventoRetorno.Leitor.Arquivo := ParseText(FPRetWS);
  EventoRetorno.LerXml;

  FcStat := EventoRetorno.cStat;
  FxMotivo := EventoRetorno.xMotivo;
  FPMsg := EventoRetorno.xMotivo;
  FTpAmb := EventoRetorno.pedRegEvento.tpAmb;

  if FcStat =0 then
  begin
  (*
    if EventoRetorno.retEvento.Count > 0 then
    begin
      FcStat   := EventoRetorno.retEvento.Items[0].RetinfEvento.cStat;
      FxMotivo := EventoRetorno.retEvento.Items[0].RetinfEvento.xMotivo;
      FPMsg    := EventoRetorno.retEvento.Items[0].RetinfEvento.xMotivo;
      FTpAmb   := EventoRetorno.retEvento.Items[0].RetinfEvento.tpAmb;

      FEventoRetorno.cStat    := FcStat;
      FEventoRetorno.xMotivo  := FxMotivo;
      FEventoRetorno.xMotivo  := FPMsg;
      FEventoRetorno.tpAmb    := FTpAmb;
      FEventoRetorno.verAplic := EventoRetorno.retEvento.Items[0].RetinfEvento.verAplic;
    end;
    *)
  end;

  // 135 = Evento Registrado e vinculado ao DPS
  Result := (FcStat = 135);

  //gerar arquivo proc de evento
  if Result then
  begin
    Leitor := TLeitor.Create;
    try
      (*
      for I := 0 to FEvento.Evento.Count - 1 do
      begin
        for J := 0 to EventoRetorno.retEvento.Count - 1 do
        begin
          if FEvento.Evento.Items[I].infEvento.chDPS =
            EventoRetorno.retEvento.Items[J].RetinfEvento.chDPS then
          begin
            FEvento.Evento.Items[I].RetinfEvento.tpAmb :=
              EventoRetorno.retEvento.Items[J].RetinfEvento.tpAmb;
            FEvento.Evento.Items[I].RetinfEvento.nProt :=
              EventoRetorno.retEvento.Items[J].RetinfEvento.nProt;
            FEvento.Evento.Items[I].RetinfEvento.dhRegEvento :=
              EventoRetorno.retEvento.Items[J].RetinfEvento.dhRegEvento;
            FEvento.Evento.Items[I].RetinfEvento.cStat :=
              EventoRetorno.retEvento.Items[J].RetinfEvento.cStat;
            FEvento.Evento.Items[I].RetinfEvento.xMotivo :=
              EventoRetorno.retEvento.Items[J].RetinfEvento.xMotivo;

            Texto := '';

            if EventoRetorno.retEvento.Items[J].RetinfEvento.cStat in [135, 136, 155] then
            begin
              VersaoEvento := TACBrDPS(FPDFeOwner).LerVersaoDeParams(LayDPSEvento);

              Leitor.Arquivo := FPDadosMsg;
              Texto := '<procEventoDPS versao="' + VersaoEvento + '" xmlns="' + ACBRDPS_NAMESPACE + '">' +
                        '<eventoDPS versao="' + VersaoEvento + '">' +
                         Leitor.rExtrai(1, 'infEvento', '', I + 1) +
                         '<Signature xmlns="http://www.w3.org/2000/09/xmldsig#">' +
                          Leitor.rExtrai(1, 'SignedInfo', '', I + 1) +
                          Leitor.rExtrai(1, 'SignatureValue', '', I + 1) +
                          Leitor.rExtrai(1, 'KeyInfo', '', I + 1) +
                         '</Signature>'+
                        '</eventoDPS>';

              Leitor.Arquivo := FPRetWS;
              Texto := Texto +
                         '<retEventoDPS versao="' + VersaoEvento + '">' +
                          Leitor.rExtrai(1, 'infEvento', '', J + 1) +
                         '</retEventoDPS>' +
                        '</procEventoDPS>';

              if FPConfiguracoesDPS.Arquivos.Salvar then
              begin
                NomeArq := OnlyNumber(FEvento.Evento.Items[i].infEvento.Id) + '-procEventoDPS.xml';
                PathArq := PathWithDelim(GerarPathEvento(FEvento.Evento.Items[I].infEvento.CNPJ));

                FPDFeOwner.Gravar(NomeArq, Texto, PathArq);
                FEventoRetorno.retEvento.Items[J].RetinfEvento.NomeArquivo := PathArq + NomeArq;
                FEvento.Evento.Items[I].RetinfEvento.NomeArquivo := PathArq + NomeArq;
              end;

              { Converte de UTF8 para a String nativa e Decodificar caracteres HTML Entity }
              Texto := ParseText(Texto);
            end;

            // Se o evento for rejeitado a propriedade XML conterá uma String vazia
            FEventoRetorno.retEvento.Items[J].RetinfEvento.XML := Texto;
            FEvento.Evento.Items[I].RetinfEvento.XML := Texto;

            break;
          end;
        end;
      end;
      *)
    finally
      Leitor.Free;
    end;
  end;
end;

procedure TDPSEnvEvento.SalvarEnvio;
begin
  if ArqEnv = '' then
    exit;

  if FPConfiguracoesDPS.Geral.Salvar then
    FPDFeOwner.Gravar(GerarPrefixoArquivo + '-' + ArqEnv + '.xml',
                      FPDadosMsg, GerarPathEvento(FCNPJ));

  if FPConfiguracoesDPS.WebServices.Salvar then
    FPDFeOwner.Gravar(GerarPrefixoArquivo + '-' + ArqEnv + '-soap.xml',
      FPEnvelopeSoap, GerarPathEvento(FCNPJ));
end;

procedure TDPSEnvEvento.SalvarResposta;
begin
  if ArqResp = '' then
    exit;

  if FPConfiguracoesDPS.Geral.Salvar then
    FPDFeOwner.Gravar(GerarPrefixoArquivo + '-' + ArqResp + '.xml',
                      FPRetWS, GerarPathEvento(FCNPJ));

  if FPConfiguracoesDPS.WebServices.Salvar then
    FPDFeOwner.Gravar(GerarPrefixoArquivo + '-' + ArqResp + '-soap.xml',
      FPRetornoWS, GerarPathEvento(FCNPJ));
end;

function TDPSEnvEvento.GerarMsgLog: String;
var
  aMsg: String;
begin
  {(*}
  aMsg := Format(ACBrStr('Versão Layout: %s ' + LineBreak +
                         'Ambiente: %s ' + LineBreak +
                         'Versão Aplicativo: %s ' + LineBreak +
                         'Status Código: %s ' + LineBreak +
                         'Status Descrição: %s ' + LineBreak),
                         // italo - verAplic
                 [FEventoRetorno.pedRegEvento.verAplic, TpAmbToStr(FEventoRetorno.pedRegEvento.tpAmb),
                  FEventoRetorno.verAplic, IntToStr(FEventoRetorno.cStat),
                  FEventoRetorno.xMotivo]);

//  if FEventoRetorno.retEvento.Count > 0 then
//    aMsg := aMsg + Format(ACBrStr('Recebimento: %s ' + LineBreak),
//       [IfThen(FEventoRetorno.retEvento.Items[0].RetinfEvento.dhRegEvento = 0, '',
//               FormatDateTimeBr(FEventoRetorno.retEvento.Items[0].RetinfEvento.dhRegEvento))]);

  Result := aMsg;
  {*)}
end;

function TDPSEnvEvento.GerarPrefixoArquivo: String;
begin
  Result := IntToStr(FidLote);
end;

{ TDistribuicaoDFe }

constructor TDistribuicaoDFe.Create(AOwner: TACBrDFe);
begin
  inherited Create(AOwner);
end;

destructor TDistribuicaoDFe.Destroy;
begin
  FretDistDFeInt.Free;
  FlistaArqs.Free;

  inherited;
end;

procedure TDistribuicaoDFe.Clear;
begin
  inherited Clear;

  FPStatus := stDistDFeInt;
  FPLayout := LayDistDFeInt;
  FPArqEnv := 'con-dist-dfe';
  FPArqResp := 'dist-dfe';
  FPBodyElement := 'DPSDistDFeInteresse';
  FPHeaderElement := '';

  if Assigned(FretDistDFeInt) then
    FretDistDFeInt.Free;

  FretDistDFeInt := TRetDistDFeInt.Create('DPS');

  if Assigned(FlistaArqs) then
    FlistaArqs.Free;

  FlistaArqs := TStringList.Create;
end;

procedure TDistribuicaoDFe.DefinirURL;
var
  UF : String;
  Versao: Double;
begin
  { Esse método é tratado diretamente pela RFB }

  UF := 'AN';

  Versao := 0;
  FPVersaoServico := '';
  FPURL := '';
  Versao := VersaoDPSToDbl(FPConfiguracoesDPS.Geral.VersaoDF);

  TACBrDPS(FPDFeOwner).LerServicoDeParams(
    TACBrDPS(FPDFeOwner).GetNomeModeloDFe,
    UF ,
    FPConfiguracoesDPS.WebServices.Ambiente,
    LayOutDPSToServico(FPLayout),
    Versao,
    FPURL);

  FPVersaoServico := FloatToString(Versao, '.', '0.00');
end;

procedure TDistribuicaoDFe.DefinirServicoEAction;
begin
  FPServico := GetUrlWsd + 'DPSDistribuicaoDFe';
  FPSoapAction := FPServico + '/DPSDistDFeInteresse';
end;

procedure TDistribuicaoDFe.DefinirDadosMsg;
var
  DistDFeInt: TDistDFeInt;
begin
//  DistDFeInt := TDistDFeInt.Create(FPVersaoServico, NAME_SPACE_DPS,
//                                     'DPSDadosMsg', 'consChDPS', 'chDPS', True);
  try
    DistDFeInt.TpAmb := FPConfiguracoesDPS.WebServices.Ambiente;
    DistDFeInt.cUFAutor := FcUFAutor;
    DistDFeInt.CNPJCPF := FCNPJCPF;
    DistDFeInt.ultNSU := trim(FultNSU);
    DistDFeInt.NSU := trim(FNSU);
    DistDFeInt.Chave := trim(FchDPS);

    AjustarOpcoes( DistDFeInt.Gerador.Opcoes );
    DistDFeInt.GerarXML;

    FPDadosMsg := DistDFeInt.Gerador.ArquivoFormatoXML;
  finally
    DistDFeInt.Free;
  end;
end;

function TDistribuicaoDFe.TratarResposta: Boolean;
var
  I: Integer;
  AXML: String;
begin
  FPRetWS := SeparaDadosArray(['DPSResultMsg', 'DPSDistDFeInteresseResult'], FPRetornoWS );

  // Processando em UTF8, para poder gravar arquivo corretamente //
  FretDistDFeInt.Leitor.Arquivo := FPRetWS;
  FretDistDFeInt.LerXml;

  for I := 0 to FretDistDFeInt.docZip.Count - 1 do
  begin
    AXML := FretDistDFeInt.docZip.Items[I].XML;
    FNomeArq := '';
    if (AXML <> '') then
    begin
      (*
      case FretDistDFeInt.docZip.Items[I].schema of
        schresDPS:
          FNomeArq := FretDistDFeInt.docZip.Items[I].resDFe.chDFe + '-resDPS.xml';

        schresEvento:
          FNomeArq := OnlyNumber(TpEventoToStr(FretDistDFeInt.docZip.Items[I].resEvento.tpEvento) +
                     FretDistDFeInt.docZip.Items[I].resEvento.chDFe +
                     Format('%.2d', [FretDistDFeInt.docZip.Items[I].resEvento.nSeqEvento])) +
                     '-resEventoDPS.xml';

        schprocDPS:
          FNomeArq := FretDistDFeInt.docZip.Items[I].resDFe.chDFe + '-DPS.xml';

        schprocEventoDPS:
          FNomeArq := OnlyNumber(FretDistDFeInt.docZip.Items[I].procEvento.Id) +
                     '-procEventoDPS.xml';
      end;
       *)

      if NaoEstaVazio(NomeArq) then
        FlistaArqs.Add( FNomeArq );

      if (FPConfiguracoesDPS.Arquivos.Salvar) and NaoEstaVazio(FNomeArq) then
      begin
      (*
        if FPConfiguracoesDPS.Arquivos.SalvarEvento then
           if (FretDistDFeInt.docZip.Items[I].schema in [schprocEventoDPS]) then // salvar evento
              FPDFeOwner.Gravar(FNomeArq, AXML, GerarPathDistribuicao(FretDistDFeInt.docZip.Items[I]));

        if (FretDistDFeInt.docZip.Items[I].schema in [schprocDPS]) then
           FPDFeOwner.Gravar(FNomeArq, AXML, GerarPathDistribuicao(FretDistDFeInt.docZip.Items[I]));
      *)
      end;
    end;
  end;

  { Processsa novamente, chamando ParseTXT, para converter de UTF8 para a String
    nativa e Decodificar caracteres HTML Entity }
  FretDistDFeInt.Free;   // Limpando a lista
  FretDistDFeInt := TRetDistDFeInt.Create('DPS');

  FretDistDFeInt.Leitor.Arquivo := ParseText(FPRetWS);
  FretDistDFeInt.LerXml;

  FPMsg := FretDistDFeInt.xMotivo;
  Result := (FretDistDFeInt.CStat = 137) or (FretDistDFeInt.CStat = 138);
end;

function TDistribuicaoDFe.GerarMsgLog: String;
begin
  {(*}
  Result := Format(ACBrStr('Versão Layout: %s ' + LineBreak +
                           'Ambiente: %s ' + LineBreak +
                           'Versão Aplicativo: %s ' + LineBreak +
                           'Status Código: %s ' + LineBreak +
                           'Status Descrição: %s ' + LineBreak +
                           'Resposta: %s ' + LineBreak +
                           'Último NSU: %s ' + LineBreak +
                           'Máximo NSU: %s ' + LineBreak),
                   [FretDistDFeInt.versao, TpAmbToStr(FretDistDFeInt.tpAmb),
                    FretDistDFeInt.verAplic, IntToStr(FretDistDFeInt.cStat),
                    FretDistDFeInt.xMotivo,
                    IfThen(FretDistDFeInt.dhResp = 0, '',
                           FormatDateTimeBr(RetDistDFeInt.dhResp)),
                    FretDistDFeInt.ultNSU, FretDistDFeInt.maxNSU]);
  {*)}
end;

function TDistribuicaoDFe.GerarMsgErro(E: Exception): String;
begin
  Result := ACBrStr('WebService Distribuição de DFe:' + LineBreak +
                    '- Inativo ou Inoperante tente novamente.');
end;

function TDistribuicaoDFe.GerarPathDistribuicao(AItem: TdocZipCollectionItem): String;
var
  Data: TDateTime;
begin
  if FPConfiguracoesDPS.Arquivos.EmissaoPathDPS then
    Data := AItem.resDFe.dhEmi
  else
    Data := Now;

  (*
  case AItem.schema of
    schprocEventoDPS:
      Result := FPConfiguracoesDPS.Arquivos.GetPathEvento(AItem.procEvento.tpEvento,
                                                          AItem.resDFe.CNPJCPF,
                                                          Data);

    schprocDPS:
      Result := FPConfiguracoesDPS.Arquivos.GetPathDownload(AItem.resDFe.xNome,
                                                        AItem.resDFe.CNPJCPF,
                                                        Data);
  end;
    *)
end;

{ TDPSEnvioWebService }

constructor TDPSEnvioWebService.Create(AOwner: TACBrDFe);
begin
  inherited Create(AOwner);

  FPStatus := stEnvioWebService;
end;

destructor TDPSEnvioWebService.Destroy;
begin
  inherited Destroy;
end;

procedure TDPSEnvioWebService.Clear;
begin
  inherited Clear;

  FVersao := '';
end;

function TDPSEnvioWebService.Executar: Boolean;
begin
  Result := inherited Executar;
end;

procedure TDPSEnvioWebService.DefinirURL;
begin
  FPURL := FPURLEnvio;
end;

procedure TDPSEnvioWebService.DefinirServicoEAction;
begin
  FPServico := FPSoapAction;
end;

procedure TDPSEnvioWebService.DefinirDadosMsg;
var
  LeitorXML: TLeitor;
begin
  LeitorXML := TLeitor.Create;
  try
    LeitorXML.Arquivo := FXMLEnvio;
    LeitorXML.Grupo := FXMLEnvio;
    FVersao := LeitorXML.rAtributo('versao')
  finally
    LeitorXML.Free;
  end;

  FPDadosMsg := FXMLEnvio;
end;

function TDPSEnvioWebService.TratarResposta: Boolean;
begin
  FPRetWS := SeparaDados(FPRetornoWS, 'soap:Body');
  Result := True;
end;

function TDPSEnvioWebService.GerarMsgErro(E: Exception): String;
begin
  Result := ACBrStr('WebService: '+FPServico + LineBreak +
                    '- Inativo ou Inoperante tente novamente.');
end;

function TDPSEnvioWebService.GerarVersaoDadosSoap: String;
begin
  Result := '<versaoDados>' + FVersao + '</versaoDados>';
end;

{ TWebServices }

constructor TWebServices.Create(AOwner: TACBrDFe);
begin
  FACBrDPS := TACBrDPS(AOwner);

  FStatusServico := TDPSStatusServico.Create(FACBrDPS);
  FEnviar := TDPSRecepcao.Create(FACBrDPS, TACBrDPS(FACBrDPS).Notas);
  FConsulta := TDPSConsulta.Create(FACBrDPS, TACBrDPS(FACBrDPS).Notas);
  FEnvEvento := TDPSEnvEvento.Create(FACBrDPS, TACBrDPS(FACBrDPS).EventoDPS);
  FDistribuicaoDFe := TDistribuicaoDFe.Create(FACBrDPS);
  FEnvioWebService := TDPSEnvioWebService.Create(FACBrDPS);
end;

destructor TWebServices.Destroy;
begin
  FStatusServico.Free;
  FEnviar.Free;
  FConsulta.Free;
  FEnvEvento.Free;
  FDistribuicaoDFe.Free;
  FEnvioWebService.Free;

  inherited Destroy;
end;

function TWebServices.Envia(ALote: Integer): Boolean;
begin
  Result := Envia(IntToStr(ALote));
end;

function TWebServices.Envia(ALote: String): Boolean;
begin
  FEnviar.Clear;

  FEnviar.Lote := ALote;

  if not Enviar.Executar then
    Enviar.GerarException( Enviar.Msg );

  Result := True;
end;

end.
