{$I ACBr.inc}

unit ACBrRecopiWebServices;

interface

uses
  Classes, SysUtils, ACBrDFe, ACBrDFeWebService, ACBrUtil, pcnConversao, pcnRecopi,
  ACBrRecopiConfiguracoes;

type

  { TWebServiceRecopi }

  TWebServiceRecopi = class(TDFeWebService)
  private
    FErroDescricao: String;
    FErroGeralDescricao: String;
    FErroGeralStatus: String;
    FErroStatus: String;
  protected
    FPConfiguracoesRecopi: TConfiguracoesRecopi;

    procedure InicializarServico; override;
    procedure DefinirURL; override;
    procedure DefinirServicoEAction; override;
    procedure FinalizarServico; override;
  public
    constructor Create(AOwner: TACBrDFe); override;
    procedure Clear; override;
  published
    property ErroStatus: String read FErroStatus;
    property ErroDescricao: String read FErroDescricao;
    property ErroGeralStatus: String read FErroGeralStatus;
    property ErroGeralDescricao: String read FErroGeralDescricao;
  end;

  { TObterVersao }

  TObterVersao = class(TWebServiceRecopi)
  private
    FVersao: String;
  protected
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;
  public
    procedure Clear; override;
  published
    property Versao: String read FVersao;
  end;

  { TConsultaPublica }

  TConsultaPublica = class(TWebServiceRecopi)
  private
    FCNPJ: String;
    FRetorno: String;
    FUF: String;
  protected
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;
    procedure DefinirURL; override;
  public
    constructor Create(AOwner: TACBrDFe); override;
    procedure Clear; override;
  published
    property Retorno: String read FRetorno;
    property CNPJ: String read FCNPJ write FCNPJ;
    property UF: String read FUF write FUF;
  end;

  { TPedidoSolicitacao }

  TPedidoSolicitacao = class(TWebServiceRecopi)
  private
    FListaSolicitacao: TListaSolicitacao;
    FRetorno: String;
  protected
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;
  public
    procedure Clear; override;
  published
    property Retorno: String read FRetorno;
    property ListaSolicitacao: TListaSolicitacao read FListaSolicitacao write FListaSolicitacao;
  end;


  { TPedidoInclusaoNF }

  TPedidoInclusaoNF = class(TWebServiceRecopi)
  private
    FInclusaoNF: TInclusaoNF;
    FRetorno: String;
  protected
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;
  public
    procedure Clear; override;
  published
    property Retorno: String read FRetorno;
    property InclusaoNF: TInclusaoNF read FInclusaoNF write FInclusaoNF;
  end;

  { TPedidoConfirmacao }

  TPedidoConfirmacao = class(TWebServiceRecopi)
  private
    FConfirmaSolicitacao: TConfirmaSolicitacao;
    FRetorno: String;
  protected
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;
  public
    procedure Clear; override;
  published
    property Retorno: String read FRetorno;
    property ConfirmaSolicitacao: TConfirmaSolicitacao read FConfirmaSolicitacao write FConfirmaSolicitacao;
  end;

  { TListaControleEstoque }

  TListaControleEstoque = class(TWebServiceRecopi)
  private
    FControleEstoque: TControleEstoque;
    FRetorno: String;
  protected
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;
  public
    procedure Clear; override;
  published
    property Retorno: String read FRetorno;
    property ControleEstoque: TControleEstoque read FControleEstoque write FControleEstoque;
  end;


  { TACBrRecopiWebServices }

  TACBrRecopiWebServices = class
  private
    FACBrRecopi: TACBrDFe;
    FPedidoConfirmacao: TPedidoConfirmacao;
    FConsultaPublica: TConsultaPublica;
    FControleEstoque: TListaControleEstoque;
    FObeterVersao: TObterVersao;
    FPedidoInclusaoNF: TPedidoInclusaoNF;
    FPedidoSolicitacao: TPedidoSolicitacao;
  public
    constructor Create(AOwner: TACBrDFe); overload;
    destructor Destroy; override;
    property ACBrRecopi: TACBrDFe read FACBrRecopi write FACBrRecopi;
    property ObeterVersao: TObterVersao read FObeterVersao write FObeterVersao;
    property ConsultaPublica: TConsultaPublica read FConsultaPublica write FConsultaPublica;
    property PedidoSolicitacao: TPedidoSolicitacao read FPedidoSolicitacao write FPedidoSolicitacao;
    property PedidoInclusaoNF: TPedidoInclusaoNF read FPedidoInclusaoNF write FPedidoInclusaoNF;
    property ControleEstoque: TListaControleEstoque read FControleEstoque write FControleEstoque;
    property PedidoConfirmacao: TPedidoConfirmacao read FPedidoConfirmacao write FPedidoConfirmacao;
  end;


implementation

uses
  ACBrRecopi,
  pcnRetConsObterVersao, pcnConsObterVersao,
  pcnConsConsultaPublica, pcnRetConsConsultaPublica,
  pcnConsPedidoSolicitacao, pcnRetPedidoSolicitacao,
  pcnConsInclusaoNF, pcnRetInclusaoNF,
  pcnConsPedidoConfirmacao, pcnRetPedidoConfirmacao,
  pcnConsControleEstoque, pcnRetControleEstoque;

{ TListaControleEstoque }

procedure TListaControleEstoque.DefinirServicoEAction;
begin
  inherited DefinirServicoEAction;
  FPBodyElement := 'ControlarEstoque';
  FPSoapAction := ACBRRECOPI_NAMESPACE + FPBodyElement;
end;

procedure TListaControleEstoque.DefinirDadosMsg;
var
  ConsControleEstoque: TConsControleEstoque;
begin
  ConsControleEstoque:= TConsControleEstoque.Create;
  ConsControleEstoque.Gerador.Opcoes.TagVaziaNoFormatoResumido:=False;
  try
    AjustarOpcoes(ConsControleEstoque.Gerador.Opcoes);
    ConsControleEstoque.ControleEstoque:=FControleEstoque;
    ConsControleEstoque.GeraXML;
    FPDadosMsg:=ConsControleEstoque.Gerador.ArquivoFormatoXML;
    AssinarXML(FPDadosMsg, 'ListaControleEstoque', '',
    'Erro ao assinar o Lote de Controle de Estoque');
    FPDadosMsg:='<xmlControlesEstoque>'+FPDadosMsg+'</xmlControlesEstoque>';
  finally
    ConsControleEstoque.Free;
  end;
end;

function TListaControleEstoque.TratarResposta: Boolean;
var
  RecopiRetorno: TRetornoConsControleEstoque;
begin

  RecopiRetorno := TRetornoConsControleEstoque.Create;
  try
    RecopiRetorno.Leitor.Arquivo:=ParseText(FPRetWS);
    RecopiRetorno.LerXML;
    FRetorno:=RecopiRetorno.Retorno;
  finally
    RecopiRetorno.Free;
  end;

  FPRetWS := Trim(ParseText(SeparaDados(FPRetornoWS, 'ControlarEstoqueResponse')));
  Result := True;
end;

procedure TListaControleEstoque.Clear;
begin
  inherited Clear;
end;

{ TPedidoConfirmacao }

procedure TPedidoConfirmacao.DefinirServicoEAction;
begin
  inherited DefinirServicoEAction;
  FPBodyElement := 'ConfirmarOperacaoLote';
  FPSoapAction := ACBRRECOPI_NAMESPACE + FPBodyElement;
end;

procedure TPedidoConfirmacao.DefinirDadosMsg;
var
  ConsPedidoConfirmacao: TConsPedidoConfirmacao;
begin
  ConsPedidoConfirmacao:= TConsPedidoConfirmacao.Create;
  ConsPedidoConfirmacao.Gerador.Opcoes.TagVaziaNoFormatoResumido:=False;
  try
    AjustarOpcoes(ConsPedidoConfirmacao.Gerador.Opcoes);
    ConsPedidoConfirmacao.PedidoConfirmacao:=FConfirmaSolicitacao;
    ConsPedidoConfirmacao.GeraXML;
    FPDadosMsg:=ConsPedidoConfirmacao.Gerador.ArquivoFormatoXML;
    AssinarXML(FPDadosMsg, 'ListaConfirmacoes', '',
    'Erro ao assinar o Lote de Confirmação da Operação');
    FPDadosMsg:='<xmlConfirmacoes>'+FPDadosMsg+'</xmlConfirmacoes>';
  finally
    ConsPedidoConfirmacao.Free;
  end;
end;

function TPedidoConfirmacao.TratarResposta: Boolean;
var
  RecopiRetorno: TRetornoConsPedidoConfirmacao;
begin

  RecopiRetorno := TRetornoConsPedidoConfirmacao.Create;
  try
    RecopiRetorno.Leitor.Arquivo:=ParseText(FPRetWS);
    RecopiRetorno.LerXML;
    FRetorno:=RecopiRetorno.Retorno;
  finally
    RecopiRetorno.Free;
  end;

  FPRetWS := Trim(ParseText(SeparaDados(FPRetornoWS, 'ConfirmarOperacaoLoteResponse')));
  Result := True;
end;

procedure TPedidoConfirmacao.Clear;
begin
  inherited Clear;
end;

{ TPedidoInclusaoNF }

procedure TPedidoInclusaoNF.DefinirServicoEAction;
begin
  inherited DefinirServicoEAction;
  FPBodyElement := 'AtualizarNFLote';
  FPSoapAction := ACBRRECOPI_NAMESPACE + FPBodyElement;
end;

procedure TPedidoInclusaoNF.DefinirDadosMsg;
var
  ConsInclusaoNF: TConsInclusaoNF;
begin
  ConsInclusaoNF:= TConsInclusaoNF.Create;
  ConsInclusaoNF.Gerador.Opcoes.TagVaziaNoFormatoResumido:=False;
  try
    AjustarOpcoes(ConsInclusaoNF.Gerador.Opcoes);
    ConsInclusaoNF.InclusaoNF:=FInclusaoNF;
    ConsInclusaoNF.GeraXML;
    FPDadosMsg:=ConsInclusaoNF.Gerador.ArquivoFormatoXML;
    AssinarXML(FPDadosMsg, 'ListaInclusoesNF', '',
    'Erro ao assinar o Lote de Atualizar NF');
    FPDadosMsg := '<xmlInfoNF>'+FPDadosMsg+'</xmlInfoNF>';
  finally
    ConsInclusaoNF.Free;
  end;
end;

function TPedidoInclusaoNF.TratarResposta: Boolean;
var
  RecopiRetorno: TRetornoInclusaoNF;
begin

  RecopiRetorno := TRetornoInclusaoNF.Create;
  try
    RecopiRetorno.Leitor.Arquivo:=ParseText(FPRetWS);
    RecopiRetorno.LerXML;
    FRetorno:=RecopiRetorno.Retorno;
  finally
    RecopiRetorno.Free;
  end;

  FPRetWS := Trim(ParseText(SeparaDados(FPRetornoWS, 'AtualizarNFLoteResponse')));
  Result := True;
end;

procedure TPedidoInclusaoNF.Clear;
begin
  inherited Clear;
end;

{ TPedidoSolicitacao }

procedure TPedidoSolicitacao.DefinirServicoEAction;
begin
  inherited;
  FPBodyElement := 'SolicitarOperacaoLote';
  FPSoapAction := ACBRRECOPI_NAMESPACE + FPBodyElement;
end;

procedure TPedidoSolicitacao.DefinirDadosMsg;
var
  ConsPedidoSolicitacao: TConsPedidoSolicitacao;
begin
  ConsPedidoSolicitacao:= TConsPedidoSolicitacao.Create;
  ConsPedidoSolicitacao.Gerador.Opcoes.TagVaziaNoFormatoResumido:=False;
  try
    AjustarOpcoes(ConsPedidoSolicitacao.Gerador.Opcoes);
    ConsPedidoSolicitacao.PedidoSolicitacao:=FListaSolicitacao;
    ConsPedidoSolicitacao.GeraXML;
    FPDadosMsg:=ConsPedidoSolicitacao.Gerador.ArquivoFormatoXML;
    AssinarXML(FPDadosMsg, 'ListaSolicitacoes', '',
    'Erro ao assinar Lista Solicitacoes do RECOPI');
    FPDadosMsg:='<xmlPedidos>'+FPDadosMsg+'</xmlPedidos>';
  finally
    ConsPedidoSolicitacao.Free;
  end;
end;

function TPedidoSolicitacao.TratarResposta: Boolean;
var
  RecopiRetorno: TRetornoConsPedidoSolicitacao;
begin

  RecopiRetorno := TRetornoConsPedidoSolicitacao.Create;
  try
    RecopiRetorno.Leitor.Arquivo:=ParseText(FPRetWS);
    RecopiRetorno.LerXML;
    FRetorno:=RecopiRetorno.Retorno;
  finally
    RecopiRetorno.Free;
  end;

  FPRetWS := Trim(ParseText(SeparaDados(FPRetornoWS, 'SolicitarOperacaoLoteResponse')));
  Result := True;
end;

procedure TPedidoSolicitacao.Clear;
begin
  inherited Clear;
end;

{ TConsultaPublica }

procedure TConsultaPublica.DefinirServicoEAction;
begin
  inherited;
  FPBodyElement := 'ConsultaPublica';
  FPSoapAction := ACBRRECOPI_NAMESPACE + FPBodyElement;
end;

procedure TConsultaPublica.DefinirDadosMsg;
var
  ConsConsultaPublica: TConsConsultaPublica;
begin
  ConsConsultaPublica:= TConsConsultaPublica.Create;
  try
    AjustarOpcoes(ConsConsultaPublica.Gerador.Opcoes);
    ConsConsultaPublica.Gerador.Opcoes.TagVaziaNoFormatoResumido:=False;
    ConsConsultaPublica.CNPJ:=FCNPJ;
    ConsConsultaPublica.UF:=FUF;
    ConsConsultaPublica.GeraXML;
    FPDadosMsg := ConsConsultaPublica.Gerador.ArquivoFormatoXML;
    AssinarXML(FPDadosMsg, 'ListaConsultaPublica', '',
    'Erro ao assinar Consulta Publica do RECOPI');
    FPDadosMsg:='<xmlConsultaPublica>'+FPDadosMsg+'</xmlConsultaPublica>';
  finally
    ConsConsultaPublica.Free;
  end;

end;

function TConsultaPublica.TratarResposta: Boolean;
var
  RecopiRetorno: TRetornoConsConsultaPublica;
begin
  RecopiRetorno := TRetornoConsConsultaPublica.Create;
  try
    RecopiRetorno.Leitor.Arquivo:=ParseText(FPRetWS);
    RecopiRetorno.LerXML;
    FRetorno:=RecopiRetorno.Retorno;
  finally
    RecopiRetorno.Free;
  end;

  FPRetWS := Trim(ParseText(SeparaDados(FPRetornoWS, 'ConsultaPublicaResponse')));
  Result := True;
end;

procedure TConsultaPublica.DefinirURL;
begin
  inherited DefinirURL;
  //FPURL:=FPURL + '?op=ConsultaPublica';
end;

constructor TConsultaPublica.Create(AOwner: TACBrDFe);
begin
  inherited;

end;

procedure TConsultaPublica.Clear;
begin
  inherited Clear;
end;

{ TACBrRecopi_WebServices }

constructor TACBrRecopiWebServices.Create(AOwner: TACBrDFe);
begin
  FObeterVersao := TObterVersao.Create(AOwner);
  FConsultaPublica := TConsultaPublica.Create(AOwner);
  FPedidoSolicitacao := TPedidoSolicitacao.Create(AOwner);
  FPedidoInclusaoNF := TPedidoInclusaoNF.Create(AOwner);
  FControleEstoque := TListaControleEstoque.Create(AOwner);
  FPedidoConfirmacao := TPedidoConfirmacao.Create(AOwner);
end;

destructor TACBrRecopiWebServices.Destroy;
begin
  FObeterVersao.Free;
  FConsultaPublica.Free;
  FPedidoSolicitacao.Free;
  FPedidoInclusaoNF.Free;
  FControleEstoque.Free;
  FPedidoConfirmacao.Free;
  inherited Destroy;
end;

{ TObterVersao }

procedure TObterVersao.DefinirServicoEAction;
begin
  inherited;
  FPBodyElement := 'ObterVersao';
  FPSoapAction  := ACBRRECOPI_NAMESPACE + FPBodyElement;
end;

procedure TObterVersao.DefinirDadosMsg;
var
  ConsObterVersao: TConsObterVersao;
begin
  ConsObterVersao:= TConsObterVersao.Create;
  try
    AjustarOpcoes(ConsObterVersao.Gerador.Opcoes);
    ConsObterVersao.GeraXML;
    FPDadosMsg := ConsObterVersao.Gerador.ArquivoFormatoXML;
    AssinarXML(FPDadosMsg, 'ObterVersao', '',
    'Erro ao assinar Consulta Publica do RECOPI');
  finally
    ConsObterVersao.Free;
  end;

end;

function TObterVersao.TratarResposta: Boolean;
var
  RecopiRetorno: TRetornoConsObterVersao;
begin
  RecopiRetorno := TRetornoConsObterVersao.Create;
  try
    RecopiRetorno.Leitor.Arquivo:=ParseText(FPRetornoWS);
    RecopiRetorno.LerXML;
    FVersao:=RecopiRetorno.Versao;
  finally
    RecopiRetorno.Free;
  end;
  Result := True;
end;

procedure TObterVersao.Clear;
begin
  inherited Clear;
end;

{ TWebServiceRecopi }

procedure TWebServiceRecopi.InicializarServico;
begin
  inherited InicializarServico;
end;

procedure TWebServiceRecopi.DefinirURL;
begin
  if FPConfiguracoesRecopi.WebServices.Ambiente = taProducao then
    FPURL := 'https://webservices.fazenda.sp.gov.br/recopiws/recopi.asmx'
  else
    FPURL := 'https://webhomolog2.fazenda.sp.gov.br/RecopiNacionalWS/RECOPI.asmx';
end;

procedure TWebServiceRecopi.DefinirServicoEAction;
begin
  FPServico:= ACBRRECOPI_NAMESPACE;
end;

procedure TWebServiceRecopi.FinalizarServico;
begin
  inherited FinalizarServico;
end;

constructor TWebServiceRecopi.Create(AOwner: TACBrDFe);
begin
  inherited Create(AOwner);
  FPConfiguracoesRecopi := TConfiguracoesRecopi(FPConfiguracoes);
  FPHeaderElement := '';
  FPArqEnv:='Recopi-env';
  FPArqResp:='Recopi-resp';

  FPSoapVersion := 'soap';
  FPSoapEnvelopeAtributtes :=
    'xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" ' +
    'xmlns:xsd="http://www.w3.org/2001/XMLSchema" ' +
    'xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"';

  FPMimeType := 'text/xml; charset=utf-8';  // Vazio, usarÃ¡ por default: 'application/soap+xml'

end;

procedure TWebServiceRecopi.Clear;
begin
  inherited Clear;
  FPDFeOwner.SSL.UseCertificateHTTP := True;
end;

end.

