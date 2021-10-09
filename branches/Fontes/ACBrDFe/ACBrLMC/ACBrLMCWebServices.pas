{******************************************************************************}
{ Projeto: Componente ACBrLMC                                                 }
{  Biblioteca multiplataforma de componentes Delphi                            }
{                                                                              }
{  Você pode obter a última versão desse arquivo na pagina do Projeto ACBr     }
{ Componentes localizado em http://www.sourceforge.net/projects/acbr           }
{                                                                              }
{                                                                              }
{  Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }
{                                                                              }
{  Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU      }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto}
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,  }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Você também pode obter uma copia da licença em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Simões de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Praça Anita Costa, 34 - Tatuí - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{*******************************************************************************
|* Historico
|*
|* 20/07/2015: Italo Jurisato Junior
|*  - Doação do componente para o Projeto ACBr
*******************************************************************************}

{$I ACBr.inc}

unit ACBrLMCWebServices;

interface

uses
  Classes, SysUtils,
  ACBrDFe, ACBrDFeWebService,
  pcnAuxiliar, pcnConversao, plmcConversao,
  plmcLMC, plmcProcLMC, plmcRetEnvLMC,
  ACBrLMCLivros, ACBrLMCConfiguracoes;

const
  CURL_WSDL = 'http://www.fazenda.pr.gov.br/wsdl/sefaws/';
//  INTERNET_OPTION_CLIENT_CERT_CONTEXT = 84;

type

  { TLMCWebService }

  TLMCWebService = class(TDFeWebService)
  private
  protected
    FPStatus: TStatusACBrLMC;
    FPLayout: TLayOutLMC;
    FPConfiguracoesLMC: TConfiguracoesLMC;

    function ExtrairModeloChaveAcesso(AChaveLMC: String): String;

  protected
    procedure InicializarServico; override;
    procedure DefinirURL; override;
    function GerarVersaoDadosSoap: String; override;
    procedure FinalizarServico; override;
    function GetUrlWsd: String; override;

  public
    constructor Create(AOwner: TACBrDFe); override;
    procedure Clear; override;

    property Status: TStatusACBrLMC read FPStatus;
    property Layout: TLayOutLMC read FPLayout;
  end;

  { TLMCStatusServico }

  TLMCStatusServico = class(TLMCWebService)
  private
    Fversao: String;
    FtpAmb: TpcnTipoAmbiente;
    FverAplic: String;
    FcStat: integer;
    FxMotivo: String;
    FcUF: integer;
    FdhRecbto: TDateTime;
    FTMed: integer;
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
    property cStat: integer read FcStat;
    property xMotivo: String read FxMotivo;
    property cUF: integer read FcUF;
    property dhRecbto: TDateTime read FdhRecbto;
    property TMed: integer read FTMed;
    property dhRetorno: TDateTime read FdhRetorno;
    property xObs: String read FxObs;
  end;

  { TLMCAutorizacao }

  TLMCAutorizacao = class(TLMCWebService)
  private
    FLote: String;
    FRecibo: String;
    FLivros: TLivros;
    Fversao: String;
    FTpAmb: TpcnTipoAmbiente;
    FverAplic: String;
    FcStat: integer;
    FcUF: integer;
    FxMotivo: String;
    FdhRecbto: TDateTime;
    FTMed: integer;

    FLMCRetorno: TretEnvLMC;

    function GetLote: String;
    function GetRecibo: String;
  protected
    procedure DefinirURL; override;
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;

    function GerarMsgLog: String; override;
    function GerarPrefixoArquivo: String; override;
  public
    constructor Create(AOwner: TACBrDFe; ALivros: TLivros);
      reintroduce; overload;
    destructor Destroy; override;
    procedure Clear; override;

    property Recibo: String read GetRecibo;
    property versao: String read Fversao;
    property TpAmb: TpcnTipoAmbiente read FTpAmb;
    property verAplic: String read FverAplic;
    property cStat: integer read FcStat;
    property cUF: integer read FcUF;
    property xMotivo: String read FxMotivo;
    property dhRecbto: TDateTime read FdhRecbto;
    property TMed: integer read FTMed;
    property Lote: String read GetLote write FLote;
  end;

  { TLMCConsulta }

  TLMCConsulta = class(TLMCWebService)
  private
    FOwner: TACBrDFe;
    FLivros: TLivros;

    FLMCChave: String;
    FProtocolo: String;
    FDhRecbto: TDateTime;
    FXMotivo: String;
    Fversao: String;
    FTpAmb: TpcnTipoAmbiente;
    FverAplic: String;
    FcStat: integer;
    FcUF: integer;
    FRetLMCDFe: String;

    FprotLMC: TProcLMC;
//    FprocEventoLMC: TRetEventoLMCCollection;

    procedure SetLMCChave(AValue: String);
  protected
    procedure DefinirURL; override;
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;

    function GerarMsgLog: String; override;
    function GerarPrefixoArquivo: String; override;
  public
    constructor Create(AOwner: TACBrDFe; ALivros: TLivros); reintroduce; overload;
    destructor Destroy; override;
    procedure Clear; override;

    property LMCChave: String read FLMCChave write SetLMCChave;
    property Protocolo: String read FProtocolo write FProtocolo;
    property DhRecbto: TDateTime read FDhRecbto write FDhRecbto;
    property XMotivo: String read FXMotivo write FXMotivo;
    property versao: String read Fversao;
    property TpAmb: TpcnTipoAmbiente read FTpAmb;
    property verAplic: String read FverAplic;
    property cStat: integer read FcStat;
    property cUF: integer read FcUF;
    property RetLMCDFe: String read FRetLMCDFe;

    property protLMC: TProcLMC read FprotLMC;
//    property procEventoLMC: TRetEventoLMCCollection read FprocEventoLMC;
  end;

 { TLMCEnvioWebService }

  TLMCEnvioWebService = class(TLMCWebService)
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
    function Executar: Boolean; override;
    procedure Clear; override;

    property XMLEnvio: String read FXMLEnvio write FXMLEnvio;
    property URLEnvio: String read FPURLEnvio write FPURLEnvio;
    property SoapActionEnvio: String read FSoapActionEnvio write FSoapActionEnvio;
  end;

  { TWebServices }

  TWebServices = class
  private
    FACBrLMC: TACBrDFe;
    FStatusServico: TLMCStatusServico;
    FEnviar: TLMCAutorizacao;
    FConsulta: TLMCConsulta;
    FEnvioWebService: TLMCEnvioWebService;
  public
    constructor Create(AOwner: TACBrDFe); overload;
    destructor Destroy; override;

    function Envia(ALote: integer): Boolean; overload;
    function Envia(ALote: String): Boolean; overload;

    property ACBrLMC: TACBrDFe read FACBrLMC write FACBrLMC;
    property StatusServico: TLMCStatusServico read FStatusServico write FStatusServico;
    property Enviar: TLMCAutorizacao read FEnviar write FEnviar;
    property Consulta: TLMCConsulta read FConsulta write FConsulta;
    property EnvioWebService: TLMCEnvioWebService read FEnvioWebService write FEnvioWebService;
  end;

implementation

uses
  StrUtils, Math,
  ACBrUtil, ACBrLMC,
  pcnGerador, pcnLeitor,
  plmcConsStatServ, plmcRetConsStatServ, plmcLMCW;

{ TLMCWebService }

constructor TLMCWebService.Create(AOwner: TACBrDFe);
begin
  inherited Create(AOwner);

  FPConfiguracoesLMC := TConfiguracoesLMC(FPConfiguracoes);
  FPLayout := LayLMCStatusServico;
  FPStatus := stLMCIdle;

  FPHeaderElement := '';
  FPBodyElement := '';
end;

procedure TLMCWebService.Clear;
begin
  inherited Clear;

  FPStatus := stLMCIdle;
  FPDFeOwner.SSL.UseCertificateHTTP := True;
end;

function TLMCWebService.ExtrairModeloChaveAcesso(AChaveLMC: String): String;
begin
  AChaveLMC := OnlyNumber(AChaveLMC);
  if ValidarChave('LMC' + AChaveLMC) then
    Result := copy(AChaveLMC, 21, 2)
  else
    Result := '';
end;

procedure TLMCWebService.InicializarServico;
begin
  { Sobrescrever apenas se necessário }
  inherited InicializarServico;

  TACBrLMC(FPDFeOwner).SetStatus(FPStatus);
end;

procedure TLMCWebService.DefinirURL;
var
  Versao: Double;
begin
  { sobrescrever apenas se necessário.
    Você também pode mudar apenas o valor de "FLayoutServico" na classe
    filha e chamar: Inherited;     }

  Versao := 0;
  FPVersaoServico := '';
  FPURL := '';

  TACBrLMC(FPDFeOwner).LerServicoDeParams(FPLayout, Versao, FPURL);
  FPVersaoServico := FloatToString(Versao, '.', '0.00');
end;


function TLMCWebService.GerarVersaoDadosSoap: String;
begin
  { Sobrescrever apenas se necessário }

  if EstaVazio(FPVersaoServico) then
    FPVersaoServico := TACBrLMC(FPDFeOwner).LerVersaoDeParams(FPLayout);

  Result := '<versaoDados>' + FPVersaoServico + '</versaoDados>';
end;

procedure TLMCWebService.FinalizarServico;
begin
  { Sobrescrever apenas se necessário }

  TACBrLMC(FPDFeOwner).SetStatus(stLMCIdle);
end;

function TLMCWebService.GetUrlWsd: String;
begin
  Result := CURL_WSDL;
end;

{ TLMCStatusServico }

procedure TLMCStatusServico.Clear;
begin
  inherited Clear;

  FPStatus := stLMCStatusServico;
  FPLayout := LayLMCStatusServico;
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

  if Assigned(FPConfiguracoesLMC) then
  begin
    FtpAmb := FPConfiguracoesLMC.WebServices.Ambiente;
    FcUF := FPConfiguracoesLMC.WebServices.UFCodigo;
  end
end;

procedure TLMCStatusServico.DefinirServicoEAction;
begin
  FPServico := GetUrlWsd + 'lmcStatusServico';
  FPSoapAction := FPServico; // + '/LMCStatusServicoMDF';
end;

procedure TLMCStatusServico.DefinirDadosMsg;
var
  ConsStatServ: TConsStatServ;
begin
  ConsStatServ := TConsStatServ.Create;
  try
    ConsStatServ.TpAmb := FPConfiguracoesLMC.WebServices.Ambiente;
    ConsStatServ.CUF := FPConfiguracoesLMC.WebServices.UFCodigo;

    ConsStatServ.Versao := FPVersaoServico;
    ConsStatServ.GerarXML;

    // Atribuindo o XML para propriedade interna //
    FPDadosMsg := ConsStatServ.Gerador.ArquivoFormatoXML;
  finally
    ConsStatServ.Free;
  end;
end;

function TLMCStatusServico.TratarResposta: Boolean;
var
  LMCRetorno: TRetConsStatServ;
begin
  FPRetWS := SeparaDados(FPRetornoWS, 'lmcStatusServicoResult');

  LMCRetorno := TRetConsStatServ.Create;
  try
    LMCRetorno.Leitor.Arquivo := ParseText(FPRetWS);
    LMCRetorno.LerXml;

    Fversao := LMCRetorno.versao;
    FtpAmb := LMCRetorno.tpAmb;
    FverAplic := LMCRetorno.verAplic;
    FcStat := LMCRetorno.cStat;
    FxMotivo := LMCRetorno.xMotivo;
    FcUF := LMCRetorno.cUF;
    FdhRecbto := LMCRetorno.dhRecbto;
    FTMed := LMCRetorno.TMed;
    FdhRetorno := LMCRetorno.dhRetorno;
    FxObs := LMCRetorno.xObs;
    FPMsg := FxMotivo + LineBreak + FxObs;

    if FPConfiguracoesLMC.WebServices.AjustaAguardaConsultaRet then
      FPConfiguracoesLMC.WebServices.AguardarConsultaRet := FTMed * 1000;

    Result := (FcStat = 107);

  finally
    LMCRetorno.Free;
  end;
end;

function TLMCStatusServico.GerarMsgLog: String;
begin
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
end;

function TLMCStatusServico.GerarMsgErro(E: Exception): String;
begin
  Result := ACBrStr('WebService Consulta Status serviço:' + LineBreak +
                    '- Inativo ou Inoperante tente novamente.');
end;

{ TLMCAutorizacao }

constructor TLMCAutorizacao.Create(AOwner: TACBrDFe; ALivros: TLivros);
begin
  inherited Create(AOwner);

  FLivros := ALivros;
end;

destructor TLMCAutorizacao.Destroy;
begin
  if Assigned(FLMCRetorno) then
    FLMCRetorno.Free;

  inherited Destroy;
end;

procedure TLMCAutorizacao.Clear;
begin
  inherited Clear;

  FPStatus := stLMCAutorizacao;
  FPLayout := LayLMCAutorizacao;
  FPArqEnv := 'env-lot';
  FPArqResp := 'rec';

  FPHeaderElement := '';
  FPBodyElement := 'lmcAutorizacao';

  if Assigned(FPConfiguracoesLMC) then
  begin
    FtpAmb := FPConfiguracoesLMC.WebServices.Ambiente;
    FcUF := FPConfiguracoesLMC.WebServices.UFCodigo;
  end;

  if Assigned(FLMCRetorno) then
    FLMCRetorno.Free;

  FLMCRetorno := TretEnvLMC.Create;
end;

function TLMCAutorizacao.GetLote: String;
begin
  Result := Trim(FLote);
end;

function TLMCAutorizacao.GetRecibo: String;
begin
  Result := Trim(FRecibo);
end;

procedure TLMCAutorizacao.DefinirURL;
begin
  FPLayout := LayLMCAutorizacao;

  inherited DefinirURL;
end;

procedure TLMCAutorizacao.DefinirServicoEAction;
begin
  FPServico := GetUrlWsd + 'lmcAutorizacao';
  FPSoapAction := FPServico; // + '/LMCAutorizacaoLote';
end;

procedure TLMCAutorizacao.DefinirDadosMsg;
var
  I: integer;
  vLMC: String;
begin
  vLMC := '';
  for I := 0 to FLivros.Count - 1 do
    vLMC := vLMC + '<livroCombustivel' + RetornarConteudoEntre(
      FLivros.Items[I].XMLAssinado, '<livroCombustivel', '</livroCombustivel>') + '</livroCombustivel>';

  FPDadosMsg := '<xmlDados>' +
                 '<autorizacao ' + NAME_SPACE_LMC + '>' + vLMC + '</autorizacao>' +
                '</xmlDados>';

  // Lote tem mais de 500kb ? //
  if Length(FPDadosMsg) > (500 * 1024) then
    GerarException(ACBrStr('Tamanho do XML de Dados superior a 500 Kbytes. Tamanho atual: ' +
      IntToStr(trunc(Length(FPDadosMsg) / 1024)) + ' Kbytes'));

  FRecibo := '';
end;

function TLMCAutorizacao.TratarResposta: Boolean;
var
  I: integer;
  chLMC, NomeArquivo: String;
  AProcLMC: TProcLMC;
begin
  FPRetWS := SeparaDados(FPRetornoWS, 'lmcAutorizacaoResult');

//  FLMCRetorno := TretEnvLMC.Create;

  FLMCRetorno.Leitor.Arquivo := ParseText(FPRetWS);
  FLMCRetorno.LerXml;

  Fversao := FLMCRetorno.versao;
  FTpAmb := FLMCRetorno.TpAmb;
//  FverAplic := FLMCRetorno.verAplic;
  FcStat := FLMCRetorno.cStat;
  FxMotivo := FLMCRetorno.xMotivo;
//  FdhRecbto := FLMCRetorno.infRec.dhRecbto;
//  FTMed := FLMCRetorno.infRec.tMed;
//  FcUF := FLMCRetorno.cUF;
  FPMsg := FLMCRetorno.xMotivo;
//  FRecibo := FLMCRetorno.infRec.nRec;

  Result := (FLMCRetorno.CStat = 103);
end;

function TLMCAutorizacao.GerarMsgLog: String;
begin
  Result := Format(ACBrStr('Versão Layout: %s ' + LineBreak +
                           'Ambiente: %s ' + LineBreak +
                           'Versão Aplicativo: %s ' + LineBreak +
                           'Status Código: %s ' + LineBreak +
                           'Status Descrição: %s ' + LineBreak +
                           'UF: %s ' + sLineBreak +
                           'Recibo: %s ' + LineBreak {+
                           'Recebimento: %s ' + LineBreak +
                           'Tempo Médio: %s ' + LineBreak}),
                   [FLMCRetorno.versao,
                    TpAmbToStr(FLMCRetorno.TpAmb),
                    '', //FLMCRetorno.verAplic,
                    IntToStr(FLMCRetorno.cStat),
                    FLMCRetorno.xMotivo,
                    '', //CodigoParaUF(FLMCRetorno.cUF),
                    '' {, //FLMCRetorno.infRec.nRec,
                    IfThen(FLMCRetorno.InfRec.dhRecbto = 0, '',
                           FormatDateTimeBr(FLMCRetorno.InfRec.dhRecbto)),
                    IntToStr(FLMCRetorno.InfRec.TMed)}]);
end;

function TLMCAutorizacao.GerarPrefixoArquivo: String;
begin
  Result := Lote;
end;

{ TLMCConsulta }

constructor TLMCConsulta.Create(AOwner: TACBrDFe; ALivros: TLivros);
begin
  inherited Create(AOwner);

  FOwner := AOwner;
  FLivros := ALivros;
end;

destructor TLMCConsulta.Destroy;
begin
  FprotLMC.Free;
//  FprocEventoLMC.Free;

  inherited Destroy;
end;

procedure TLMCConsulta.Clear;
begin
  inherited;

  FPStatus := stLMCConsulta;
  FPLayout := LayLMCConsulta;
  FPArqEnv := 'ped-sit';
  FPArqResp := 'sit';

  FverAplic := '';
  FcStat := 0;
  FxMotivo := '';
  FProtocolo := '';
  FDhRecbto := 0;
  Fversao := '';

  if Assigned(FPConfiguracoesLMC) then
  begin
    FtpAmb := FPConfiguracoesLMC.WebServices.Ambiente;
    FcUF := FPConfiguracoesLMC.WebServices.UFCodigo;
  end;

  if Assigned(FprotLMC) then
    FprotLMC.Free;

//  if Assigned(FprocEventoLMC) then
//    FprocEventoLMC.Free;

  FprotLMC := TProcLMC.Create;
//  FprocEventoLMC := TRetEventoLMCCollection.Create(FOwner);
end;

procedure TLMCConsulta.SetLMCChave(AValue: String);
var
  NumChave: String;
begin
  if FLMCChave = AValue then Exit;
  NumChave := OnlyNumber(AValue);

  if not ValidarChave(NumChave) then
     raise EACBrLMCException.Create('Chave "' + AValue + '" inválida.');

  FLMCChave := NumChave;
end;

procedure TLMCConsulta.DefinirURL;
var
  VerServ: Double;
  Modelo, xUF: String;
  ok: Boolean;
begin
  FPVersaoServico := '';
  FPURL  := '';
  Modelo := 'LMC';

  if FLivros.Count > 0 then
  begin
    FTpAmb  := FLivros.Items[0].LMC.infLMC.tpAmb;
    VerServ := FLivros.Items[0].LMC.infLMC.Versao;
  end
  else
  begin
    FTpAmb  := FPConfiguracoesLMC.WebServices.Ambiente;
    VerServ := VersaoLMCToDbl(FPConfiguracoesLMC.Geral.VersaoDF);
  end;

  xUF := 'PR';

  TACBrLMC(FPDFeOwner).LerServicoDeParams(
    Modelo,
    xUF,
    FTpAmb,
    LayOutToServico(FPLayout),
    VerServ,
    FPURL
  );

  FPVersaoServico := FloatToString(VerServ, '.', '0.00');
end;

procedure TLMCConsulta.DefinirServicoEAction;
begin
  FPServico := GetUrlWsd + 'lmcConsulta';
  FPSoapAction := FPServico; // + '/LMCConsultaMDF';
end;

procedure TLMCConsulta.DefinirDadosMsg;
var
//  ConsSitLMC: TConsSitLMC;
  OK: Boolean;
begin
  OK := False;
  (*
  ConsSitLMC := TConsSitLMC.Create;
  try
    ConsSitLMC.TpAmb := FPConfiguracoesLMC.WebServices.Ambiente;
    ConsSitLMC.chLMC := FLMCChave;

    ConsSitLMC.Versao := FPVersaoServico;
    ConsSitLMC.GerarXML;

    FPDadosMsg := ConsSitLMC.Gerador.ArquivoFormatoXML;
  finally
    ConsSitLMC.Free;
  end;
  *)
end;

function TLMCConsulta.TratarResposta: Boolean;
var
//  LMCRetorno: TRetConsSitLMC;
  MDFCancelado, Atualiza: Boolean;
  aEventos, aMsg, NomeArquivo, aLMC, aLMCDFe: String;
  AProcLMC: TProcLMC;
  I, J, K, Inicio, Fim: Integer;
  LocLMCW: TLMCW;
begin
(*
  LMCRetorno := TRetConsSitLMC.Create;

  try
    FPRetWS := SeparaDados(FPRetornoWS, 'lmcConsultaResult');

    LMCRetorno.Leitor.Arquivo := ParseText(FPRetWS);
    LMCRetorno.LerXML;

    MDFCancelado := False;
    aEventos := '';

    // <retConsSitLMC> - Retorno da consulta da situação da NF-e
    // Este é o status oficial da NF-e
    Fversao := LMCRetorno.versao;
    FTpAmb := LMCRetorno.tpAmb;
    FverAplic := LMCRetorno.verAplic;
    FcStat := LMCRetorno.cStat;
    FXMotivo := LMCRetorno.xMotivo;
    FcUF := LMCRetorno.cUF;
    FLMCChave := LMCRetorno.chLMC;
    FPMsg := FXMotivo;

    // <protLMC> - Retorno dos dados do ENVIO da NF-e
    // Considerá-los apenas se não existir nenhum evento de cancelamento (110111)
    FprotLMC.PathLMC := LMCRetorno.protLMC.PathLMC;
    FprotLMC.PathRetConsReciLMC := LMCRetorno.protLMC.PathRetConsReciLMC;
    FprotLMC.PathRetConsSitLMC := LMCRetorno.protLMC.PathRetConsSitLMC;
    FprotLMC.PathRetConsSitLMC := LMCRetorno.protLMC.PathRetConsSitLMC;
    FprotLMC.tpAmb := LMCRetorno.protLMC.tpAmb;
    FprotLMC.verAplic := LMCRetorno.protLMC.verAplic;
    FprotLMC.chLMC := LMCRetorno.protLMC.chLMC;
    FprotLMC.dhRecbto := LMCRetorno.protLMC.dhRecbto;
    FprotLMC.nProt := LMCRetorno.protLMC.nProt;
    FprotLMC.digVal := LMCRetorno.protLMC.digVal;
    FprotLMC.cStat := LMCRetorno.protLMC.cStat;
    FprotLMC.xMotivo := LMCRetorno.protLMC.xMotivo;

    if Assigned(LMCRetorno.procEventoLMC) and (LMCRetorno.procEventoLMC.Count > 0) then
    begin
      aEventos := '=====================================================' +
        LineBreak + '================== Eventos da MDF-e ==================' +
        LineBreak + '=====================================================' +
        LineBreak + '' + LineBreak + 'Quantidade total de eventos: ' +
        IntToStr(LMCRetorno.procEventoLMC.Count);

      FprocEventoLMC.Clear;
      for I := 0 to LMCRetorno.procEventoLMC.Count - 1 do
      begin
        with FprocEventoLMC.Add.RetEventoLMC do
        begin
          idLote := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.idLote;
          tpAmb := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.tpAmb;
          verAplic := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.verAplic;
          cOrgao := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.cOrgao;
          cStat := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.cStat;
          xMotivo := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.xMotivo;
          XML := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.XML;

          Infevento.ID              := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.InfEvento.ID;
          Infevento.tpAmb           := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.InfEvento.tpAmb;
          InfEvento.CNPJ            := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.InfEvento.CNPJ;
          InfEvento.chLMC          := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.InfEvento.chLMC;
          InfEvento.dhEvento        := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.InfEvento.dhEvento;
          InfEvento.TpEvento        := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.InfEvento.TpEvento;
          InfEvento.nSeqEvento      := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.InfEvento.nSeqEvento;
          InfEvento.VersaoEvento    := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.InfEvento.VersaoEvento;
          InfEvento.DetEvento.nProt := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.InfEvento.DetEvento.nProt;
          InfEvento.DetEvento.xJust := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.InfEvento.DetEvento.xJust;
          InfEvento.DetEvento.xNome := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.InfEvento.DetEvento.xNome;
          InfEvento.DetEvento.CPF   := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.InfEvento.DetEvento.CPF;

          retEvento.Clear;
          for J := 0 to LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.retEvento.Count-1 do
          begin
            with retEvento.Add.RetInfEvento do
            begin
              Id          := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.retEvento.Items[j].RetInfEvento.Id;
              tpAmb       := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.retEvento.Items[j].RetInfEvento.tpAmb;
              verAplic    := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.retEvento.Items[j].RetInfEvento.verAplic;
              cOrgao      := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.retEvento.Items[j].RetInfEvento.cOrgao;
              cStat       := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.retEvento.Items[j].RetInfEvento.cStat;
              xMotivo     := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.retEvento.Items[j].RetInfEvento.xMotivo;
              chLMC      := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.retEvento.Items[j].RetInfEvento.chLMC;
              tpEvento    := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.retEvento.Items[j].RetInfEvento.tpEvento;
              xEvento     := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.retEvento.Items[j].RetInfEvento.xEvento;
              nSeqEvento  := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.retEvento.Items[j].RetInfEvento.nSeqEvento;
              CNPJDest    := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.retEvento.Items[j].RetInfEvento.CNPJDest;
              emailDest   := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.retEvento.Items[j].RetInfEvento.emailDest;
              dhRegEvento := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.retEvento.Items[j].RetInfEvento.dhRegEvento;
              nProt       := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.retEvento.Items[j].RetInfEvento.nProt;
              XML         := LMCRetorno.procEventoLMC.Items[I].RetEventoLMC.retEvento.Items[j].RetInfEvento.XML;
            end;
          end;
        end;

        with LMCRetorno.procEventoLMC.Items[I].RetEventoLMC do
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
                     [IntToStr(InfEvento.nSeqEvento),
                      TpEventoToStr(InfEvento.TpEvento),
                      InfEvento.DescEvento,
                      IntToStr(retEvento.Items[J].RetInfEvento.cStat),
                      retEvento.Items[J].RetInfEvento.xMotivo,
                      retEvento.Items[J].RetInfEvento.nProt,
                      FormatDateTimeBr(retEvento.Items[J].RetInfEvento.dhRegEvento)]);

            if retEvento.Items[J].RetInfEvento.tpEvento = teCancelamento then
            begin
              MDFCancelado := True;
              FProtocolo := retEvento.Items[J].RetInfEvento.nProt;
              FDhRecbto := retEvento.Items[J].RetInfEvento.dhRegEvento;
              FPMsg := retEvento.Items[J].RetInfEvento.xMotivo;
            end;
          end;
        end;
      end;
    end;

    if not MDFCancelado then
    begin
      FProtocolo := LMCRetorno.protLMC.nProt;
      FDhRecbto := LMCRetorno.protLMC.dhRecbto;
      FPMsg := LMCRetorno.protLMC.xMotivo;
    end;

    //TODO: Verificar porque monta "aMsg", pois ela não está sendo usada em lugar nenhum
    aMsg := GerarMsgLog;
    if aEventos <> '' then
      aMsg := aMsg + sLineBreak + aEventos;

    Result := (LMCRetorno.CStat in [100, 101, 110, 150, 151, 155]);

    NomeArquivo := PathWithDelim(FPConfiguracoesLMC.Arquivos.PathSalvar) + FLMCChave;

    for i := 0 to TACBrLMC(FPDFeOwner).Livros.Count - 1 do
    begin
      with TACBrLMC(FPDFeOwner).Livros.Items[i] do
      begin
        if (OnlyNumber(FLMCChave) = NumID) then
        begin
          Atualiza := True;
          if (LMCRetorno.CStat in [101, 151, 155]) then
            Atualiza := False;

          // Atualiza o Status da LMC interna //
          LMC.procLMC.cStat := LMCRetorno.cStat;

          if Atualiza then
          begin
            if (FPConfiguracoesLMC.Geral.ValidarDigest) and
              (LMCRetorno.protLMC.digVal <> '') and
              (LMC.signature.DigestValue <> LMCRetorno.protLMC.digVal) then
            begin
              raise EACBrLMCException.Create('DigestValue do documento ' +
                NumID + ' não confere.');
            end;

            LMC.procLMC.tpAmb := LMCRetorno.tpAmb;
            LMC.procLMC.verAplic := LMCRetorno.verAplic;
            LMC.procLMC.chLMC := LMCRetorno.chLMC;
            LMC.procLMC.dhRecbto := FDhRecbto;
            LMC.procLMC.nProt := FProtocolo;
            LMC.procLMC.digVal := LMCRetorno.protLMC.digVal;
            LMC.procLMC.cStat := LMCRetorno.cStat;
            LMC.procLMC.xMotivo := LMCRetorno.xMotivo;

            if FileExists(NomeArquivo + '-LMC.xml') or NaoEstaVazio(NomeArq) then
            begin
              AProcLMC := TProcLMC.Create;
              try
                if NaoEstaVazio(NomeArq) then
                  AProcLMC.PathLMC := NomeArq
                else
                  AProcLMC.PathLMC := NomeArquivo + '-LMC.xml';

                AProcLMC.PathRetConsSitLMC := NomeArquivo + '-sit.xml';

                AProcLMC.Versao :=
                    TACBrLMC(FPDFeOwner).LerVersaoDeParams(LayLMCAutorizacao);

                AProcLMC.GerarXML;

                aLMC := AProcLMC.Gerador.ArquivoFormatoXML;

                if NaoEstaVazio(AProcLMC.Gerador.ArquivoFormatoXML) then
                  AProcLMC.Gerador.SalvarArquivo(AProcLMC.PathLMC);

                FRetLMCDFe := '';

                if (NaoEstaVazio(aLMC)) and
                   (NaoEstaVazio(SeparaDados(FPRetWS, 'procEventoLMC'))) then
                begin
                  Inicio := Pos('<procEventoLMC', FPRetWS);
                  Fim    := Pos('</retConsSitLMC', FPRetWS) - 1;

                  aEventos := Copy(FPRetWS, Inicio, Fim - Inicio + 1);

                  aLMCDFe := '<?xml version="1.0" encoding="UTF-8" ?>' +
                              '<LMCDFe>' +
                               '<procLMC versao="' + FVersao + '">' +
                                 SeparaDados(aLMC, 'LMCProc') +
                               '</procLMC>' +
                               '<procEventoLMC versao="' + FVersao + '">' +
                                 aEventos +
                               '</procEventoLMC>' +
                              '</LMCDFe>';

                  FRetLMCDFe := aLMCDFe;
                end;

              finally
                AProcLMC.Free;
              end;
            end
            else begin
             LocLMCW := TLMCW.Create(TACBrLMC(FPDFeOwner).Livros.Items[i].LMC);
             try
               LocLMCW.GerarXML;

               aLMC := LocLMCW.Gerador.ArquivoFormatoXML;

               FRetLMCDFe := '';

               if (NaoEstaVazio(aLMC)) and
                  (NaoEstaVazio(SeparaDados(FPRetWS, 'procEventoLMC'))) then
                begin
                  Inicio := Pos('<procEventoLMC', FPRetWS);
                  Fim    := Pos('</retConsSitLMC', FPRetWS) -1;

                  aEventos := Copy(FPRetWS, Inicio, Fim - Inicio + 1);

                  aLMCDFe := '<?xml version="1.0" encoding="UTF-8" ?>' +
                              '<LMCDFe>' +
                               '<procLMC versao="' + FVersao + '">' +
                                 SeparaDados(aLMC, 'LMCProc') +
                               '</procLMC>' +
                               '<procEventoLMC versao="' + FVersao + '">' +
                                 aEventos +
                               '</procEventoLMC>' +
                              '</LMCDFe>';

                  FRetLMCDFe := aLMCDFe;
                end;
             finally
               LocLMCW.Free;
             end;
            end;

            if FPConfiguracoesLMC.Arquivos.Salvar then
            begin
              if FPConfiguracoesLMC.Arquivos.SalvarApenasLMCProcessados then
              begin
                if Processado then
                  GravarXML();
              end
              else
                GravarXML();
            end;
          end;

          break;
        end;
      end;
    end;

    if (TACBrLMC(FPDFeOwner).Livros.Count <= 0) then
    begin
      if FPConfiguracoesLMC.Arquivos.Salvar then
      begin
        if FileExists(NomeArquivo + '-LMC.xml') then
        begin
          AProcLMC := TProcLMC.Create;
          try
            AProcLMC.PathLMC := NomeArquivo + '-LMC.xml';
            AProcLMC.PathRetConsSitLMC := NomeArquivo + '-sit.xml';

            AProcLMC.Versao := TACBrLMC(FPDFeOwner).LerVersaoDeParams(LayLMCAutorizacao);

            AProcLMC.GerarXML;

            aLMC := AProcLMC.Gerador.ArquivoFormatoXML;

            if NaoEstaVazio(AProcLMC.Gerador.ArquivoFormatoXML) then
              AProcLMC.Gerador.SalvarArquivo(AProcLMC.PathLMC);

            if (NaoEstaVazio(aLMC)) and
               (NaoEstaVazio(SeparaDados(FPRetWS, 'procEventoLMC'))) then
            begin
              Inicio := Pos('<procEventoLMC', FPRetWS);
              Fim    := Pos('</retConsSitLMC', FPRetWS) -1;

              aEventos := Copy(FPRetWS, Inicio, Fim - Inicio + 1);

              aLMCDFe := '<?xml version="1.0" encoding="UTF-8" ?>' +
                          '<LMCDFe>' +
                           '<procLMC versao="' + FVersao + '">' +
                             SeparaDados(aLMC, 'LMCProc') +
                           '</procLMC>' +
                           '<procEventoLMC versao="' + FVersao + '">' +
                             aEventos +
                           '</procEventoLMC>' +
                          '</LMCDFe>';

              FRetLMCDFe := aLMCDFe;
            end;

          finally
            AProcLMC.Free;
          end;
        end;
      end;
    end;
  finally
    LMCRetorno.Free;
  end;
*)
end;

function TLMCConsulta.GerarMsgLog: String;
begin
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
                   [Fversao, FLMCChave, TpAmbToStr(FTpAmb), FverAplic,
                    IntToStr(FcStat), FXMotivo, CodigoParaUF(FcUF), FLMCChave,
                    FormatDateTimeBr(FDhRecbto), FProtocolo, FprotLMC.digVal]);
end;

function TLMCConsulta.GerarPrefixoArquivo: String;
begin
  Result := Trim(FLMCChave);
end;

{ TLMCEnvioWebService }

constructor TLMCEnvioWebService.Create(AOwner: TACBrDFe);
begin
  inherited Create(AOwner);

  FPStatus := stLMCEnvioWebService;
end;

destructor TLMCEnvioWebService.Destroy;
begin
  inherited Destroy;
end;

function TLMCEnvioWebService.Executar: Boolean;
begin
  Result := inherited Executar;
end;

procedure TLMCEnvioWebService.Clear;
begin
  inherited Clear;

  FVersao := '';
end;

procedure TLMCEnvioWebService.DefinirURL;
begin
  FPURL := FPURLEnvio;
end;

procedure TLMCEnvioWebService.DefinirServicoEAction;
begin
  FPServico := FPSoapAction;
end;

procedure TLMCEnvioWebService.DefinirDadosMsg;
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

function TLMCEnvioWebService.TratarResposta: Boolean;
begin
  FPRetWS := SeparaDados(FPRetornoWS, 'soap:Body');
  Result := True;
end;

function TLMCEnvioWebService.GerarMsgErro(E: Exception): String;
begin
  Result := ACBrStr('WebService: '+FPServico + LineBreak +
                    '- Inativo ou Inoperante tente novamente.');
end;

function TLMCEnvioWebService.GerarVersaoDadosSoap: String;
begin
  Result := '<versaoDados>' + FVersao + '</versaoDados>';
end;

{ TWebServices }

constructor TWebServices.Create(AOwner: TACBrDFe);
begin
  FACBrLMC := TACBrLMC(AOwner);

  FStatusServico := TLMCStatusServico.Create(FACBrLMC);
  FEnviar := TLMCAutorizacao.Create(FACBrLMC, TACBrLMC(FACBrLMC).Livros);
//  FRetorno := TLMCRetAutorizacao.Create(FACBrLMC, TACBrLMC(FACBrLMC).Livros);
//  FRecibo := TLMCRecibo.Create(FACBrLMC);
  FConsulta := TLMCConsulta.Create(FACBrLMC, TACBrLMC(FACBrLMC).Livros);
  FEnvioWebService := TLMCEnvioWebService.Create(FACBrLMC);
end;

destructor TWebServices.Destroy;
begin
  FStatusServico.Free;
  FEnviar.Free;
//  FRetorno.Free;
  FConsulta.Free;
  FEnvioWebService.Free;

  inherited Destroy;
end;

function TWebServices.Envia(ALote: integer): Boolean;
begin
  Result := Envia(IntToStr(ALote));
end;

function TWebServices.Envia(ALote: String): Boolean;
begin
  FEnviar.FLote := ALote;

  if not Enviar.Executar then
    Enviar.GerarException( Enviar.Msg );

  Result := True;
end;

end.
