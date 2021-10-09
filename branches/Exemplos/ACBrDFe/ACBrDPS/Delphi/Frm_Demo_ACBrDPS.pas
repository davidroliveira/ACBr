unit Frm_Demo_ACBrDPS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, ShellAPI, ACBrBase, ACBrDFe, ACBrDPS, Spin, ExtCtrls,
  StdCtrls, Buttons, ComCtrls, OleCtrls, SHDocVw, ACBrMail, ACBrUtil,
  pcnConversao, ACBrDPSDADPSClass, ACBrDFeReport;

type
  Tfrm_DemoACBrDPS = class(TForm)
    ACBrDPS1: TACBrDPS;
    OpenDialog1: TOpenDialog;
    Panel2: TPanel;
    Panel3: TPanel;
    PageControl3: TPageControl;
    tsDPS: TTabSheet;
    btnImprimir: TButton;
    btnConsultar: TButton;
    btnValidarXML: TButton;
    btnStatusServ: TButton;
    btnCancDPS: TButton;
    btnCriarEnviar: TButton;
    btnGerarDPS: TButton;
    btnGerarPDF: TButton;
    btnEnviarEmail: TButton;
    btnConsultarChave: TButton;
    btnCancelarChave: TButton;
    btnAdicionarProtDPS: TButton;
    btnCarregarXMLEnviar: TButton;
    btnValidarAssinatura: TButton;
    btnImprimirEvento: TButton;
    btnEnviarEvento: TButton;
    btnDistribuicaoDFe: TButton;
    btnValidarRegrasNegocio: TButton;
    pgRespostas: TPageControl;
    TabSheet5: TTabSheet;
    MemoResp: TMemo;
    TabSheet6: TTabSheet;
    WBResposta: TWebBrowser;
    TabSheet8: TTabSheet;
    memoLog: TMemo;
    TabSheet9: TTabSheet;
    trvwDPS: TTreeView;
    TabSheet10: TTabSheet;
    memoRespWS: TMemo;
    Dados: TTabSheet;
    MemoDados: TMemo;
    Panel1: TPanel;
    lblColaborador: TLabel;
    lblPatrocinador: TLabel;
    lblDoar1: TLabel;
    lblDoar2: TLabel;
    btnSalvarConfig: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    PageControl4: TPageControl;
    TabSheet3: TTabSheet;
    lSSLLib: TLabel;
    lCryptLib: TLabel;
    lHttpLib: TLabel;
    lXmlSign: TLabel;
    gbCertificado: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    sbtnCaminhoCert: TSpeedButton;
    Label25: TLabel;
    sbtnGetCert: TSpeedButton;
    sbtnListaCert: TSpeedButton;
    edtCaminho: TEdit;
    edtSenha: TEdit;
    edtNumSerie: TEdit;
    btnValidadeData: TButton;
    btnNumSerie: TButton;
    btnSubjectName: TButton;
    btnCNPJ: TButton;
    btnIssuerName: TButton;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    btnSHA_RSA: TButton;
    cbAssinar: TCheckBox;
    btnHTTPS: TButton;
    btnX509: TButton;
    cbSSLLib: TComboBox;
    cbCryptLib: TComboBox;
    cbHttpLib: TComboBox;
    cbXmlSignLib: TComboBox;
    TabSheet4: TTabSheet;
    GroupBox3: TGroupBox;
    sbtnPathSalvar: TSpeedButton;
    Label29: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label42: TLabel;
    spPathSchemas: TSpeedButton;
    edtPathLogs: TEdit;
    ckSalvar: TCheckBox;
    cbFormaEmissao: TComboBox;
    cbxAtualizarXML: TCheckBox;
    cbxExibirErroSchema: TCheckBox;
    edtFormatoAlerta: TEdit;
    cbxRetirarAcentos: TCheckBox;
    cbVersaoDF: TComboBox;
    edtPathSchemas: TEdit;
    TabSheet7: TTabSheet;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    lTimeOut: TLabel;
    lSSLLib1: TLabel;
    cbxVisualizar: TCheckBox;
    cbUF: TComboBox;
    rgTipoAmb: TRadioGroup;
    cbxSalvarSOAP: TCheckBox;
    seTimeOut: TSpinEdit;
    cbSSLType: TComboBox;
    gbProxy: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtProxyHost: TEdit;
    edtProxyPorta: TEdit;
    edtProxyUser: TEdit;
    edtProxySenha: TEdit;
    gbxRetornoEnvio: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    cbxAjustarAut: TCheckBox;
    edtTentativas: TEdit;
    edtIntervalo: TEdit;
    edtAguardar: TEdit;
    TabSheet12: TTabSheet;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    edtEmitCNPJ: TEdit;
    edtEmitIE: TEdit;
    edtEmitRazao: TEdit;
    edtEmitFantasia: TEdit;
    edtEmitFone: TEdit;
    edtEmitCEP: TEdit;
    edtEmitLogradouro: TEdit;
    edtEmitNumero: TEdit;
    edtEmitComp: TEdit;
    edtEmitBairro: TEdit;
    edtEmitCodCidade: TEdit;
    edtEmitCidade: TEdit;
    edtEmitUF: TEdit;
    TabSheet13: TTabSheet;
    sbPathDPS: TSpeedButton;
    Label35: TLabel;
    Label47: TLabel;
    sbPathEvento: TSpeedButton;
    cbxSalvarArqs: TCheckBox;
    cbxPastaMensal: TCheckBox;
    cbxAdicionaLiteral: TCheckBox;
    cbxEmissaoPathDPS: TCheckBox;
    cbxSalvaPathEvento: TCheckBox;
    cbxSepararPorCNPJ: TCheckBox;
    edtPathDPS: TEdit;
    edtPathEvento: TEdit;
    cbxSepararPorModelo: TCheckBox;
    TabSheet2: TTabSheet;
    Label7: TLabel;
    sbtnLogoMarca: TSpeedButton;
    edtLogoMarca: TEdit;
    rgTipoDADPS: TRadioGroup;
    TabSheet14: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    edtSmtpHost: TEdit;
    edtSmtpPort: TEdit;
    edtSmtpUser: TEdit;
    edtSmtpPass: TEdit;
    edtEmailAssunto: TEdit;
    cbEmailSSL: TCheckBox;
    mmEmailMsg: TMemo;
    ACBrMail1: TACBrMail;
    GroupBox2: TGroupBox;
    Label30: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    btSerial: TBitBtn;
    cbxModeloPosPrinter: TComboBox;
    cbxPorta: TComboBox;
    cbxPagCodigo: TComboBox;
    seColunas: TSpinEdit;
    seEspLinhas: TSpinEdit;
    seLinhasPular: TSpinEdit;

    procedure sbtnCaminhoCertClick(Sender: TObject);
    procedure sbtnLogoMarcaClick(Sender: TObject);
    procedure sbtnPathSalvarClick(Sender: TObject);
    procedure PathClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarConfigClick(Sender: TObject);
    procedure btnStatusServClick(Sender: TObject);
    procedure btnCriarEnviarClick(Sender: TObject);
    procedure btnGerarDPSClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnConsultarChaveClick(Sender: TObject);
    procedure btnValidarRegrasNegocioClick(Sender: TObject);
    procedure btnCancDPSClick(Sender: TObject);
    procedure btnCancelarChaveClick(Sender: TObject);
    procedure btnValidarXMLClick(Sender: TObject);
    procedure btnGerarPDFClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnEnviarEmailClick(Sender: TObject);
    procedure btnAdicionarProtDPSClick(Sender: TObject);
    procedure btnCarregarXMLEnviarClick(Sender: TObject);
    procedure btnValidarAssinaturaClick(Sender: TObject);
    procedure btnImprimirEventoClick(Sender: TObject);
    procedure btnEnviarEventoClick(Sender: TObject);
    procedure btnDistribuicaoDFeClick(Sender: TObject);
    procedure sbtnGetCertClick(Sender: TObject);
    procedure sbPathDPSClick(Sender: TObject);
    procedure sbPathEventoClick(Sender: TObject);
    procedure spPathSchemasClick(Sender: TObject);
    procedure btnValidadeDataClick(Sender: TObject);
    procedure btnNumSerieClick(Sender: TObject);
    procedure btnSubjectNameClick(Sender: TObject);
    procedure btnCNPJClick(Sender: TObject);
    procedure btnSHA_RSAClick(Sender: TObject);
    procedure btnHTTPSClick(Sender: TObject);
    procedure btnX509Click(Sender: TObject);
    procedure btnIssuerNameClick(Sender: TObject);
    procedure sbtnListaCertClick(Sender: TObject);
    procedure cbSSLLibChange(Sender: TObject);
    procedure cbCryptLibChange(Sender: TObject);
    procedure cbHttpLibChange(Sender: TObject);
    procedure cbXmlSignLibChange(Sender: TObject);
    procedure cbSSLTypeChange(Sender: TObject);
    procedure ACBrDPS1StatusChange(Sender: TObject);
    procedure ACBrDPS1GerarLog(const ALogLine: String;
      var Tratado: Boolean);
    procedure lblColaboradorClick(Sender: TObject);
    procedure lblPatrocinadorClick(Sender: TObject);
    procedure lblDoar1Click(Sender: TObject);
    procedure lblDoar2Click(Sender: TObject);
    procedure lblMouseEnter(Sender: TObject);
    procedure lblMouseLeave(Sender: TObject);
    procedure btSerialClick(Sender: TObject);
  private
    { Private declarations }
    procedure GravarConfiguracao;
    procedure LerConfiguracao;
    procedure AtualizaSSLLibsCombo;
    procedure GerarDPS(NumDPS : String);
    procedure LoadXML(RetWS: String; MyWebBrowser: TWebBrowser);
    procedure PrepararImpressao;
  public
    { Public declarations }
  end;

var
  frm_DemoACBrDPS: Tfrm_DemoACBrDPS;

implementation

uses
  strutils, math, TypInfo, DateUtils, Grids, synacode, blcksock, FileCtrl,
  ufrmStatus, Unit2, ACBrDFeConfiguracoes, ACBrDFeSSL, ACBrDFeOpenSSL,
  pcnConversaoDPS, ACBrDPSNotas, ConfiguraSerial;

const
  SELDIRHELP = 1000;

{$R *.dfm}

{ Tfrm_DemoACBrDPS }

procedure Tfrm_DemoACBrDPS.AtualizaSSLLibsCombo;
begin
  cbSSLLib.ItemIndex := Integer( ACBrDPS1.Configuracoes.Geral.SSLLib );
  cbCryptLib.ItemIndex := Integer( ACBrDPS1.Configuracoes.Geral.SSLCryptLib );
  cbHttpLib.ItemIndex := Integer( ACBrDPS1.Configuracoes.Geral.SSLHttpLib );
  cbXmlSignLib.ItemIndex := Integer( ACBrDPS1.Configuracoes.Geral.SSLXmlSignLib );

  cbSSLType.Enabled := (ACBrDPS1.Configuracoes.Geral.SSLHttpLib in [httpWinHttp, httpOpenSSL]);
end;

procedure Tfrm_DemoACBrDPS.GerarDPS(NumDPS: String);
Begin
  with ACBrDPS1.Notas.Add.DPS do
  begin
    Versao := 1.00;

    with infDPS do
    begin
      // TpcnTipoAmbiente = (taProducao, taHomologacao);
      case rgTipoAmb.ItemIndex of
        0: tpAmb := taProducao;
        1: tpAmb := taHomologacao;
      end;

      dhEmi    := Now;
      verAplic := '1.0.0.0'; //Versão do seu sistema
      serie    := 1;
      nDPS     := StrToIntDef(NumDPS, 0);
      dCompet  := Date;
      tpEmit   := tePrestador;

      // Grupo subst é opcional
//      subst.chSubstda := 'chave de acesso da NFS-e a ser substituida';
//      subst.cMotivo   := cmOutros;
//      subst.xMotivo   := 'Descrição do motivo';

      // Prestador
      prest.CNPJCPF := edtEmitCNPJ.Text;
      prest.IM      := '123';
      prest.xNome   := edtEmitRazao.Text;

      // se o prestador for do Brasil informar as linhas abaixo
      prest.enderNac.xLgr    := edtEmitLogradouro.Text;
      prest.enderNac.Nro     := edtEmitNumero.Text;
      prest.enderNac.xCpl    := edtEmitComp.Text;
      prest.enderNac.xBairro := edtEmitBairro.Text;
      prest.enderNac.cMun    := StrToInt(edtEmitCodCidade.Text);
      prest.enderNac.UF      := edtEmitUF.Text;
      prest.enderNac.CEP     := StrToIntDef(edtEmitCEP.Text, 0);

      // Se o prestador for do exterior informar as linhas abaixo
//      prest.enderExt.cPais     := 'XX';
//      prest.enderExt.xEnderExt := 'Endereço completo do prestador';

      prest.fone  := edtEmitFone.Text;
      prest.email := 'endereco@provedor.com.br';

      // Tomador
      toma.CNPJCPF := '60889128000180';
      toma.IM      := '456';
      toma.xNome   := 'Nome do Tomador';

      // se o tomador for do Brasil informar as linhas abaixo
      toma.enderNac.xLgr    := 'Logrador';
      toma.enderNac.Nro     := '123';
      toma.enderNac.xCpl    := 'Complemento';
      toma.enderNac.xBairro := 'Bairro';
      toma.enderNac.cMun    := StrToInt(edtEmitCodCidade.Text);
      toma.enderNac.UF      := edtEmitUF.Text;
      toma.enderNac.CEP     := StrToIntDef('00000000', 0);

      // Se o tomador for do exterior informar as linhas abaixo
//      toma.enderExt.cPais     := 'XX';
//      toma.enderExt.xEnderExt := 'Endereço completo do tomador';

      toma.fone    := '1622334455';
      toma.email   := 'endereco@provedor.com.br';

      // Grupo interm é opcional
      // Identico ao toma

      // Serviço
      // ser o serviço for realizado no Brasil informar a linha abaixo
      serv.cMunPrestacao := StrToInt(edtEmitCodCidade.Text);

      // se o serviço for realizado fora do Brasil informar a linha abaixo
//      serv.cPaisPrestacao := 'XX';

      serv.cTribNac    := 123456;
      serv.cTribMun    := 123;
      serv.xDescServ   := 'Descricao do servico';
      serv.cNBS        := '';
      serv.vReceb      := 500;
      serv.vServ       := 500;
      serv.vDescIncond := 0;
      serv.vDescCond   := 0;

      // Grupo comExt é opcional

      // Grupo pedagio é opcional

      // Grupo atvEvento é opcinal

      // Grupo obra é opcional

      // Grupo dedRed é opcional

      // Grupo trib
      trib.opSimpNac    := toMEEPP;
      trib.opLimMEI     := toNenhum;
      trib.opLimSimpNac := toNenhum;

      trib.issqn.regEspTrib  := retNenhum;
      trib.issqn.exigISSQN   := exigNaoIncidencia;
      trib.issqn.nBMIsenc    := '';
      trib.issqn.vInfoBM     := 0;
      trib.issqn.nProcesso   := '';
      trib.issqn.tpImunidade := tiNenhum;
      trib.issqn.pAliq       := 2.00;
      trib.issqn.tpRetISSQN  := trRetidoTomador;

      // Grupo trib.outros é opcional

      // Grupo trib.totTrib
      trib.totTrib.vTotTrib.vTotTribFed := 1;
      trib.totTrib.vTotTrib.vTotTribEst := 0;
      trib.totTrib.vTotTrib.vTotTribMun := 0;
    end;
  end;

  ACBrDPS1.Notas.GerarDPS;
end;

procedure Tfrm_DemoACBrDPS.GravarConfiguracao;
var
  IniFile: String;
  Ini: TIniFile;
  StreamMemo: TMemoryStream;
begin
  IniFile := ChangeFileExt( Application.ExeName, '.ini');

  Ini := TIniFile.Create( IniFile );
  try
    Ini.WriteInteger( 'Certificado', 'SSLLib',     cbSSLLib.ItemIndex);
    Ini.WriteInteger( 'Certificado', 'CryptLib',   cbCryptLib.ItemIndex);
    Ini.WriteInteger( 'Certificado', 'HttpLib',    cbHttpLib.ItemIndex);
    Ini.WriteInteger( 'Certificado', 'XmlSignLib', cbXmlSignLib.ItemIndex);
    Ini.WriteString(  'Certificado', 'Caminho',    edtCaminho.Text);
    Ini.WriteString(  'Certificado', 'Senha',      edtSenha.Text);
    Ini.WriteString(  'Certificado', 'NumSerie',   edtNumSerie.Text);

    Ini.WriteBool(    'Geral', 'AtualizarXML',     ckSalvar.Checked);
    Ini.WriteBool(    'Geral', 'ExibirErroSchema', ckSalvar.Checked);
    Ini.WriteString(  'Geral', 'FormatoAlerta',    edtFormatoAlerta.Text);
    Ini.WriteInteger( 'Geral', 'FormaEmissao',     cbFormaEmissao.ItemIndex);
    Ini.WriteInteger( 'Geral', 'VersaoDF',         cbVersaoDF.ItemIndex);
    Ini.WriteBool(    'Geral', 'RetirarAcentos',   cbxRetirarAcentos.Checked);
    Ini.WriteBool(    'Geral', 'Salvar',           ckSalvar.Checked);
    Ini.WriteString(  'Geral', 'PathSalvar',       edtPathLogs.Text);
    Ini.WriteString(  'Geral', 'PathSchemas',      edtPathSchemas.Text);

    Ini.WriteString(  'WebService', 'UF',         cbUF.Text);
    Ini.WriteInteger( 'WebService', 'Ambiente',   rgTipoAmb.ItemIndex);
    Ini.WriteBool(    'WebService', 'Visualizar', cbxVisualizar.Checked);
    Ini.WriteBool(    'WebService', 'SalvarSOAP', cbxSalvarSOAP.Checked);
    Ini.WriteBool(    'WebService', 'AjustarAut', cbxAjustarAut.Checked);
    Ini.WriteString(  'WebService', 'Aguardar',   edtAguardar.Text);
    Ini.WriteString(  'WebService', 'Tentativas', edtTentativas.Text);
    Ini.WriteString(  'WebService', 'Intervalo',  edtIntervalo.Text);
    Ini.WriteInteger( 'WebService', 'TimeOut',    seTimeOut.Value);
    Ini.WriteInteger( 'WebService', 'SSLType',    cbSSLType.ItemIndex);

    Ini.WriteString( 'Proxy', 'Host',  edtProxyHost.Text);
    Ini.WriteString( 'Proxy', 'Porta', edtProxyPorta.Text);
    Ini.WriteString( 'Proxy', 'User',  edtProxyUser.Text);
    Ini.WriteString( 'Proxy', 'Pass',  edtProxySenha.Text);

    Ini.WriteBool(   'Arquivos', 'Salvar',           cbxSalvarArqs.Checked);
    Ini.WriteBool(   'Arquivos', 'PastaMensal',      cbxPastaMensal.Checked);
    Ini.WriteBool(   'Arquivos', 'AddLiteral',       cbxAdicionaLiteral.Checked);
    Ini.WriteBool(   'Arquivos', 'EmissaoPathDPS',   cbxEmissaoPathDPS.Checked);
    Ini.WriteBool(   'Arquivos', 'SalvarPathEvento', cbxSalvaPathEvento.Checked);
    Ini.WriteBool(   'Arquivos', 'SepararPorCNPJ',   cbxSepararPorCNPJ.Checked);
    Ini.WriteBool(   'Arquivos', 'SepararPorModelo', cbxSepararPorModelo.Checked);
    Ini.WriteString( 'Arquivos', 'PathDPS',          edtPathDPS.Text);
    Ini.WriteString( 'Arquivos', 'PathEvento',       edtPathEvento.Text);

    Ini.WriteString( 'Emitente', 'CNPJ',        edtEmitCNPJ.Text);
    Ini.WriteString( 'Emitente', 'IE',          edtEmitIE.Text);
    Ini.WriteString( 'Emitente', 'RazaoSocial', edtEmitRazao.Text);
    Ini.WriteString( 'Emitente', 'Fantasia',    edtEmitFantasia.Text);
    Ini.WriteString( 'Emitente', 'Fone',        edtEmitFone.Text);
    Ini.WriteString( 'Emitente', 'CEP',         edtEmitCEP.Text);
    Ini.WriteString( 'Emitente', 'Logradouro',  edtEmitLogradouro.Text);
    Ini.WriteString( 'Emitente', 'Numero',      edtEmitNumero.Text);
    Ini.WriteString( 'Emitente', 'Complemento', edtEmitComp.Text);
    Ini.WriteString( 'Emitente', 'Bairro',      edtEmitBairro.Text);
    Ini.WriteString( 'Emitente', 'CodCidade',   edtEmitCodCidade.Text);
    Ini.WriteString( 'Emitente', 'Cidade',      edtEmitCidade.Text);
    Ini.WriteString( 'Emitente', 'UF',          edtEmitUF.Text);

    Ini.WriteString( 'Email', 'Host',    edtSmtpHost.Text);
    Ini.WriteString( 'Email', 'Port',    edtSmtpPort.Text);
    Ini.WriteString( 'Email', 'User',    edtSmtpUser.Text);
    Ini.WriteString( 'Email', 'Pass',    edtSmtpPass.Text);
    Ini.WriteString( 'Email', 'Assunto', edtEmailAssunto.Text);
    Ini.WriteBool(   'Email', 'SSL',     cbEmailSSL.Checked );

    StreamMemo := TMemoryStream.Create;
    mmEmailMsg.Lines.SaveToStream(StreamMemo);
    StreamMemo.Seek(0,soFromBeginning);
    Ini.WriteBinaryStream( 'Email', 'Mensagem', StreamMemo);
    StreamMemo.Free;

    Ini.WriteInteger( 'DADPS', 'Tipo',      rgTipoDaDPS.ItemIndex);
    Ini.WriteString(  'DADPS', 'LogoMarca', edtLogoMarca.Text);
    {
    INI.WriteInteger( 'PosPrinter', 'Modelo',            cbxModeloPosPrinter.ItemIndex);
    INI.WriteString(  'PosPrinter', 'Porta',             cbxPorta.Text);
    INI.WriteInteger( 'PosPrinter', 'PaginaDeCodigo',    cbxPagCodigo.ItemIndex);
    INI.WriteString(  'PosPrinter', 'ParamsString',      ACBrPosPrinter1.Device.ParamsString);
    INI.WriteInteger( 'PosPrinter', 'Colunas',           seColunas.Value);
    INI.WriteInteger( 'PosPrinter', 'EspacoLinhas',      seEspLinhas.Value);
    INI.WriteInteger( 'PosPrinter', 'LinhasEntreCupons', seLinhasPular.Value);
    }
  finally
    Ini.Free;
  end;
end;

procedure Tfrm_DemoACBrDPS.LerConfiguracao;
var
  IniFile: String;
  Ini: TIniFile;
  Ok: Boolean;
  StreamMemo: TMemoryStream;
begin
  IniFile := ChangeFileExt( Application.ExeName, '.ini');
  Ini := TIniFile.Create( IniFile );

  try
    cbSSLLib.ItemIndex     := Ini.ReadInteger( 'Certificado', 'SSLLib',     0);
    cbCryptLib.ItemIndex   := Ini.ReadInteger( 'Certificado', 'CryptLib',   0);
    cbHttpLib.ItemIndex    := Ini.ReadInteger( 'Certificado', 'HttpLib',    0);
    cbXmlSignLib.ItemIndex := Ini.ReadInteger( 'Certificado', 'XmlSignLib', 0);
    edtCaminho.Text        := Ini.ReadString(  'Certificado', 'Caminho',    '');
    edtSenha.Text          := Ini.ReadString(  'Certificado', 'Senha',      '');
    edtNumSerie.Text       := Ini.ReadString(  'Certificado', 'NumSerie',   '');

    ACBrDPS1.Configuracoes.Certificados.ArquivoPFX  := edtCaminho.Text;
    ACBrDPS1.Configuracoes.Certificados.Senha       := edtSenha.Text;
    ACBrDPS1.Configuracoes.Certificados.NumeroSerie := edtNumSerie.Text;

    cbxAtualizarXML.Checked     := Ini.ReadBool(    'Geral', 'AtualizarXML',     True);
    cbxExibirErroSchema.Checked := Ini.ReadBool(    'Geral', 'ExibirErroSchema', True);
    edtFormatoAlerta.Text       := Ini.ReadString(  'Geral', 'FormatoAlerta',    'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.');
    cbFormaEmissao.ItemIndex    := Ini.ReadInteger( 'Geral', 'FormaEmissao',     0);
    cbVersaoDF.ItemIndex        := Ini.ReadInteger( 'Geral', 'VersaoDF',         0);
    ckSalvar.Checked            := Ini.ReadBool(    'Geral', 'Salvar',           True);
    cbxRetirarAcentos.Checked   := Ini.ReadBool(    'Geral', 'RetirarAcentos',   True);
    edtPathLogs.Text            := Ini.ReadString(  'Geral', 'PathSalvar',       PathWithDelim(ExtractFilePath(Application.ExeName))+'Logs');
    edtPathSchemas.Text         := Ini.ReadString(  'Geral', 'PathSchemas',      PathWithDelim(ExtractFilePath(Application.ExeName))+'Schemas\'+GetEnumName(TypeInfo(TVersaoDPS), integer(cbVersaoDF.ItemIndex) ));

    ACBrDPS1.SSL.DescarregarCertificado;

    with ACBrDPS1.Configuracoes.Geral do
    begin
      SSLLib        := TSSLLib(cbSSLLib.ItemIndex);
      SSLCryptLib   := TSSLCryptLib(cbCryptLib.ItemIndex);
      SSLHttpLib    := TSSLHttpLib(cbHttpLib.ItemIndex);
      SSLXmlSignLib := TSSLXmlSignLib(cbXmlSignLib.ItemIndex);

      AtualizaSSLLibsCombo;

      ExibirErroSchema := cbxExibirErroSchema.Checked;
      RetirarAcentos   := cbxRetirarAcentos.Checked;
      FormatoAlerta    := edtFormatoAlerta.Text;
      FormaEmissao     := TpcnTipoEmissao(cbFormaEmissao.ItemIndex);
      VersaoDF         := TVersaoDPS(cbVersaoDF.ItemIndex);
      Salvar           := ckSalvar.Checked;
    end;

    cbUF.ItemIndex := cbUF.Items.IndexOf(Ini.ReadString( 'WebService', 'UF', 'SP'));

    rgTipoAmb.ItemIndex   := Ini.ReadInteger( 'WebService', 'Ambiente',   0);
    cbxVisualizar.Checked := Ini.ReadBool(    'WebService', 'Visualizar', False);
    cbxSalvarSOAP.Checked := Ini.ReadBool(    'WebService', 'SalvarSOAP', False);
    cbxAjustarAut.Checked := Ini.ReadBool(    'WebService', 'AjustarAut', False);
    edtAguardar.Text      := Ini.ReadString(  'WebService', 'Aguardar',   '0');
    edtTentativas.Text    := Ini.ReadString(  'WebService', 'Tentativas', '5');
    edtIntervalo.Text     := Ini.ReadString(  'WebService', 'Intervalo',  '0');
    seTimeOut.Value       := Ini.ReadInteger( 'WebService', 'TimeOut',    5000);
    cbSSLType.ItemIndex   := Ini.ReadInteger( 'WebService', 'SSLType',    0);

    edtProxyHost.Text  := Ini.ReadString( 'Proxy', 'Host',  '');
    edtProxyPorta.Text := Ini.ReadString( 'Proxy', 'Porta', '');
    edtProxyUser.Text  := Ini.ReadString( 'Proxy', 'User',  '');
    edtProxySenha.Text := Ini.ReadString( 'Proxy', 'Pass',  '');

    with ACBrDPS1.Configuracoes.WebServices do
    begin
      UF         := cbUF.Text;
      Ambiente   := StrToTpAmb(Ok,IntToStr(rgTipoAmb.ItemIndex+1));
      Visualizar := cbxVisualizar.Checked;
      Salvar     := cbxSalvarSOAP.Checked;

      AjustaAguardaConsultaRet := cbxAjustarAut.Checked;

      if NaoEstaVazio(edtAguardar.Text)then
        AguardarConsultaRet := ifThen(StrToInt(edtAguardar.Text)<1000,StrToInt(edtAguardar.Text)*1000,StrToInt(edtAguardar.Text))
      else
        edtAguardar.Text := IntToStr(AguardarConsultaRet);

      if NaoEstaVazio(edtTentativas.Text) then
        Tentativas := StrToInt(edtTentativas.Text)
      else
        edtTentativas.Text := IntToStr(Tentativas);

      if NaoEstaVazio(edtIntervalo.Text) then
        IntervaloTentativas := ifThen(StrToInt(edtIntervalo.Text)<1000,StrToInt(edtIntervalo.Text)*1000,StrToInt(edtIntervalo.Text))
      else
        edtIntervalo.Text := IntToStr(ACBrDPS1.Configuracoes.WebServices.IntervaloTentativas);

      TimeOut   := seTimeOut.Value;
      ProxyHost := edtProxyHost.Text;
      ProxyPort := edtProxyPorta.Text;
      ProxyUser := edtProxyUser.Text;
      ProxyPass := edtProxySenha.Text;
    end;

    ACBrDPS1.SSL.SSLType := TSSLType( cbSSLType.ItemIndex );

    cbxSalvarArqs.Checked       := Ini.ReadBool(   'Arquivos', 'Salvar',           false);
    cbxPastaMensal.Checked      := Ini.ReadBool(   'Arquivos', 'PastaMensal',      false);
    cbxAdicionaLiteral.Checked  := Ini.ReadBool(   'Arquivos', 'AddLiteral',       false);
    cbxEmissaoPathDPS.Checked   := Ini.ReadBool(   'Arquivos', 'EmissaoPathDPS',   false);
    cbxSalvaPathEvento.Checked  := Ini.ReadBool(   'Arquivos', 'SalvarPathEvento', false);
    cbxSepararPorCNPJ.Checked   := Ini.ReadBool(   'Arquivos', 'SepararPorCNPJ',   false);
    cbxSepararPorModelo.Checked := Ini.ReadBool(   'Arquivos', 'SepararPorModelo', false);
    edtPathDPS.Text             := Ini.ReadString( 'Arquivos', 'PathDPS',          '');
    edtPathEvento.Text          := Ini.ReadString( 'Arquivos', 'PathEvento',       '');

    with ACBrDPS1.Configuracoes.Arquivos do
    begin
      Salvar            := cbxSalvarArqs.Checked;
      SepararPorMes     := cbxPastaMensal.Checked;
      AdicionarLiteral  := cbxAdicionaLiteral.Checked;
      EmissaoPathDPS    := cbxEmissaoPathDPS.Checked;
      SalvarEvento      := cbxSalvaPathEvento.Checked;
      SepararPorCNPJ    := cbxSepararPorCNPJ.Checked;
      SepararPorModelo  := cbxSepararPorModelo.Checked;
      PathSalvar        := edtPathLogs.Text;
      PathSchemas       := edtPathSchemas.Text;
      PathDPS           := edtPathDPS.Text;
      PathEvento        := edtPathEvento.Text;
    end;

    edtEmitCNPJ.Text       := Ini.ReadString( 'Emitente', 'CNPJ',        '');
    edtEmitIE.Text         := Ini.ReadString( 'Emitente', 'IE',          '');
    edtEmitRazao.Text      := Ini.ReadString( 'Emitente', 'RazaoSocial', '');
    edtEmitFantasia.Text   := Ini.ReadString( 'Emitente', 'Fantasia',    '');
    edtEmitFone.Text       := Ini.ReadString( 'Emitente', 'Fone',        '');
    edtEmitCEP.Text        := Ini.ReadString( 'Emitente', 'CEP',         '');
    edtEmitLogradouro.Text := Ini.ReadString( 'Emitente', 'Logradouro',  '');
    edtEmitNumero.Text     := Ini.ReadString( 'Emitente', 'Numero',      '');
    edtEmitComp.Text       := Ini.ReadString( 'Emitente', 'Complemento', '');
    edtEmitBairro.Text     := Ini.ReadString( 'Emitente', 'Bairro',      '');
    edtEmitCodCidade.Text  := Ini.ReadString( 'Emitente', 'CodCidade',   '');
    edtEmitCidade.Text     := Ini.ReadString( 'Emitente', 'Cidade',      '');
    edtEmitUF.Text         := Ini.ReadString( 'Emitente', 'UF',          '');

    edtSmtpHost.Text     := Ini.ReadString( 'Email', 'Host',    '');
    edtSmtpPort.Text     := Ini.ReadString( 'Email', 'Port',    '');
    edtSmtpUser.Text     := Ini.ReadString( 'Email', 'User',    '');
    edtSmtpPass.Text     := Ini.ReadString( 'Email', 'Pass',    '');
    edtEmailAssunto.Text := Ini.ReadString( 'Email', 'Assunto', '');
    cbEmailSSL.Checked   := Ini.ReadBool(   'Email', 'SSL',     False);

    StreamMemo := TMemoryStream.Create;
    Ini.ReadBinaryStream( 'Email', 'Mensagem', StreamMemo);
    mmEmailMsg.Lines.LoadFromStream(StreamMemo);
    StreamMemo.Free;

    rgTipoDaDPS.ItemIndex := Ini.ReadInteger( 'DADPS', 'Tipo',      0);
    edtLogoMarca.Text     := Ini.ReadString(  'DADPS', 'LogoMarca', '');

    {
    cbxModeloPosPrinter.ItemIndex := INI.ReadInteger( 'PosPrinter', 'Modelo',            Integer(ACBrPosPrinter1.Modelo));
    cbxPorta.Text                 := INI.ReadString(  'PosPrinter', 'Porta',             ACBrPosPrinter1.Porta);
    cbxPagCodigo.ItemIndex        := INI.ReadInteger( 'PosPrinter', 'PaginaDeCodigo',    Integer(ACBrPosPrinter1.PaginaDeCodigo));
    seColunas.Value               := INI.ReadInteger( 'PosPrinter', 'Colunas',           ACBrPosPrinter1.ColunasFonteNormal);
    seEspLinhas.Value             := INI.ReadInteger( 'PosPrinter', 'EspacoLinhas',      ACBrPosPrinter1.EspacoEntreLinhas);
    seLinhasPular.Value           := INI.ReadInteger( 'PosPrinter', 'LinhasEntreCupons', ACBrPosPrinter1.LinhasEntreCupons);

    ACBrPosPrinter1.Device.ParamsString := INI.ReadString( 'PosPrinter', 'ParamsString', '');
    }

    if ACBrDPS1.DADPS <> nil then
    begin
      ACBrDPS1.DADPS.TipoDADPS := StrToTpImp(OK,IntToStr(rgTipoDaDPS.ItemIndex+1));
      ACBrDPS1.DADPS.Logo      := edtLogoMarca.Text;
    end;
  finally
     Ini.Free;
  end;
end;

procedure Tfrm_DemoACBrDPS.LoadXML(RetWS: String;
  MyWebBrowser: TWebBrowser);
begin
  ACBrUtil.WriteToTXT( PathWithDelim(ExtractFileDir(application.ExeName)) + 'temp.xml',
                        ACBrUtil.ConverteXMLtoUTF8( RetWS ), False, False);
  MyWebBrowser.Navigate(PathWithDelim(ExtractFileDir(application.ExeName)) + 'temp.xml');

  if ACBrDPS1.Notas.Count > 0 then
    MemoResp.Lines.Add('Empresa: '+ACBrDPS1.Notas.Items[0].DPS.infDPS.prest.xNome);
end;

procedure Tfrm_DemoACBrDPS.PathClick(Sender: TObject);
var
  Dir: string;
begin
  if Length(TEdit(Sender).Text) <= 0 then
    Dir := ExtractFileDir(application.ExeName)
  else
    Dir := TEdit(Sender).Text;

  if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt], SELDIRHELP) then
    TEdit(Sender).Text := Dir;
end;

procedure Tfrm_DemoACBrDPS.sbtnCaminhoCertClick(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione o Certificado';
  OpenDialog1.DefaultExt := '*.pfx';
  OpenDialog1.Filter := 'Arquivos PFX (*.pfx)|*.pfx|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ExtractFileDir(application.ExeName);

  if OpenDialog1.Execute then
    edtCaminho.Text := OpenDialog1.FileName;
end;

procedure Tfrm_DemoACBrDPS.sbtnLogoMarcaClick(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione o Logo';
  OpenDialog1.DefaultExt := '*.bmp';
  OpenDialog1.Filter := 'Arquivos BMP (*.bmp)|*.bmp|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ExtractFileDir(application.ExeName);

  if OpenDialog1.Execute then
    edtLogoMarca.Text := OpenDialog1.FileName;
end;

procedure Tfrm_DemoACBrDPS.sbtnPathSalvarClick(Sender: TObject);
begin
  PathClick(edtPathLogs);
end;

procedure Tfrm_DemoACBrDPS.FormCreate(Sender: TObject);
var
  T: TSSLLib;
  I: TpcnTipoEmissao;
  K: TVersaoDPS;
  U: TSSLCryptLib;
  V: TSSLHttpLib;
  X: TSSLXmlSignLib;
  Y: TSSLType;
//  N: TACBrPosPrinterModelo;
//  O: TACBrPosPaginaCodigo;
begin
  cbSSLLib.Items.Clear;
  for T := Low(TSSLLib) to High(TSSLLib) do
    cbSSLLib.Items.Add( GetEnumName(TypeInfo(TSSLLib), integer(T) ) );
  cbSSLLib.ItemIndex := 0;

  cbCryptLib.Items.Clear;
  for U := Low(TSSLCryptLib) to High(TSSLCryptLib) do
    cbCryptLib.Items.Add( GetEnumName(TypeInfo(TSSLCryptLib), integer(U) ) );
  cbCryptLib.ItemIndex := 0;

  cbHttpLib.Items.Clear;
  for V := Low(TSSLHttpLib) to High(TSSLHttpLib) do
    cbHttpLib.Items.Add( GetEnumName(TypeInfo(TSSLHttpLib), integer(V) ) );
  cbHttpLib.ItemIndex := 0;

  cbXmlSignLib.Items.Clear;
  for X := Low(TSSLXmlSignLib) to High(TSSLXmlSignLib) do
    cbXmlSignLib.Items.Add( GetEnumName(TypeInfo(TSSLXmlSignLib), integer(X) ) );
  cbXmlSignLib.ItemIndex := 0;

  cbSSLType.Items.Clear;
  for Y := Low(TSSLType) to High(TSSLType) do
    cbSSLType.Items.Add( GetEnumName(TypeInfo(TSSLType), integer(Y) ) );
  cbSSLType.ItemIndex := 0;

  cbFormaEmissao.Items.Clear;
  for I := Low(TpcnTipoEmissao) to High(TpcnTipoEmissao) do
     cbFormaEmissao.Items.Add( GetEnumName(TypeInfo(TpcnTipoEmissao), integer(I) ) );
  cbFormaEmissao.Items[0] := 'teNormal';
  cbFormaEmissao.ItemIndex := 0;

  cbVersaoDF.Items.Clear;
  for K := Low(TVersaoDPS) to High(TVersaoDPS) do
     cbVersaoDF.Items.Add( GetEnumName(TypeInfo(TVersaoDPS), integer(K) ) );
  cbVersaoDF.Items[0] := 've100';
  cbVersaoDF.ItemIndex := 0;
  (*
  cbxModeloPosPrinter.Items.Clear ;
  for N := Low(TACBrPosPrinterModelo) to High(TACBrPosPrinterModelo) do
    cbxModeloPosPrinter.Items.Add( GetEnumName(TypeInfo(TACBrPosPrinterModelo), integer(N) ) ) ;

  cbxPagCodigo.Items.Clear ;
  For O := Low(TACBrPosPaginaCodigo) to High(TACBrPosPaginaCodigo) do
     cbxPagCodigo.Items.Add( GetEnumName(TypeInfo(TACBrPosPaginaCodigo), integer(O) ) ) ;


  cbxPorta.Items.Clear;
  ACBrPosPrinter1.Device.AcharPortasSeriais( cbxPorta.Items );

  cbxPorta.Items.Add('LPT1');
  cbxPorta.Items.Add('LPT2');
  cbxPorta.Items.Add('/dev/ttyS0');
  cbxPorta.Items.Add('/dev/ttyS1');
  cbxPorta.Items.Add('/dev/ttyUSB0');
  cbxPorta.Items.Add('/dev/ttyUSB1');
  cbxPorta.Items.Add('\\localhost\Epson');
  cbxPorta.Items.Add('c:\temp\ecf.txt');
  cbxPorta.Items.Add('/tmp/ecf.txt');
  *)
  LerConfiguracao;
  PageControl3.ActivePage := tsDPS;
  pgRespostas.ActivePageIndex := 2;

  ACBrDPS1.Configuracoes.WebServices.Salvar := true;
end;

procedure Tfrm_DemoACBrDPS.btnSalvarConfigClick(Sender: TObject);
begin
  GravarConfiguracao;
  LerConfiguracao;
end;

procedure Tfrm_DemoACBrDPS.btnStatusServClick(Sender: TObject);
begin
  ACBrDPS1.WebServices.StatusServico.Executar;

  MemoResp.Lines.Text := ACBrDPS1.WebServices.StatusServico.RetWS;
  memoRespWS.Lines.Text := ACBrDPS1.WebServices.StatusServico.RetornoWS;
  LoadXML(ACBrDPS1.WebServices.StatusServico.RetornoWS, WBResposta);

  pgRespostas.ActivePageIndex := 1;

  MemoDados.Lines.Add('');
  MemoDados.Lines.Add('Status Serviço');
  MemoDados.Lines.Add('tpAmb: '    +TpAmbToStr(ACBrDPS1.WebServices.StatusServico.tpAmb));
  MemoDados.Lines.Add('verAplic: ' +ACBrDPS1.WebServices.StatusServico.verAplic);
  MemoDados.Lines.Add('cStat: '    +IntToStr(ACBrDPS1.WebServices.StatusServico.cStat));
  MemoDados.Lines.Add('xMotivo: '  +ACBrDPS1.WebServices.StatusServico.xMotivo);
  MemoDados.Lines.Add('cUF: '      +IntToStr(ACBrDPS1.WebServices.StatusServico.cUF));
  MemoDados.Lines.Add('dhRecbto: ' +DateTimeToStr(ACBrDPS1.WebServices.StatusServico.dhRecbto));
  MemoDados.Lines.Add('tMed: '     +IntToStr(ACBrDPS1.WebServices.StatusServico.TMed));
  MemoDados.Lines.Add('dhRetorno: '+DateTimeToStr(ACBrDPS1.WebServices.StatusServico.dhRetorno));
  MemoDados.Lines.Add('xObs: '     +ACBrDPS1.WebServices.StatusServico.xObs);
end;

procedure Tfrm_DemoACBrDPS.btnCriarEnviarClick(Sender: TObject);
var
  vAux, vNumLote: String;
begin
  if not(InputQuery('WebServices Enviar', 'Numero do Nota', vAux)) then
    exit;

  if not(InputQuery('WebServices Enviar', 'Numero do Lote', vNumLote)) then
    exit;

  vNumLote := OnlyNumber(vNumLote);

  if Trim(vNumLote) = '' then
  begin
    MessageDlg('Número do Lote inválido.',mtError,[mbok],0);
    exit;
  end;

  ACBrDPS1.Notas.Clear;

  ACBrDPS1.Configuracoes.Geral.VersaoDF :=  TVersaoDPS(cbVersaoDF.ItemIndex);
  GerarDPS(vAux);

  ACBrDPS1.Notas.GerarDPS;

  ACBrDPS1.Enviar(vNumLote, True);

  MemoResp.Lines.Text := ACBrDPS1.WebServices.Enviar.RetWS;
  memoRespWS.Lines.Text := ACBrDPS1.WebServices.Enviar.RetornoWS;
  LoadXML(ACBrDPS1.WebServices.Enviar.RetornoWS, WBResposta);

  pgRespostas.ActivePageIndex := 1;

  MemoDados.Lines.Add('');
  MemoDados.Lines.Add('Envio DPS');
  MemoDados.Lines.Add('tpAmb: '+ TpAmbToStr(ACBrDPS1.WebServices.Enviar.TpAmb));
  MemoDados.Lines.Add('verAplic: '+ ACBrDPS1.WebServices.Enviar.verAplic);
  MemoDados.Lines.Add('cStat: '+ IntToStr(ACBrDPS1.WebServices.Enviar.cStat));
  MemoDados.Lines.Add('cUF: '+ IntToStr(ACBrDPS1.WebServices.Enviar.cUF));
  MemoDados.Lines.Add('xMotivo: '+ ACBrDPS1.WebServices.Enviar.xMotivo);
  MemoDados.Lines.Add('Protocolo: '+ ACBrDPS1.WebServices.Enviar.DPSRetorno.ProtDPS.Items[0].nProt);

  ACBrDPS1.Notas.Clear;
end;

procedure Tfrm_DemoACBrDPS.btnGerarDPSClick(Sender: TObject);
var
  vAux: String;
begin
  if not(InputQuery('WebServices Enviar', 'Numero do Nota', vAux)) then
    exit;

  ACBrDPS1.Notas.Clear;

  GerarDPS(vAux);

  ACBrDPS1.Notas.Assinar;

  ACBrDPS1.Notas.Items[0].GravarXML();

  ACBrDPS1.Notas.Validar;

  ShowMessage('Arquivo gerado em: '+ACBrDPS1.Notas.Items[0].NomeArq);
  MemoDados.Lines.Add('Arquivo gerado em: '+ACBrDPS1.Notas.Items[0].NomeArq);
  MemoResp.Lines.LoadFromFile(ACBrDPS1.Notas.Items[0].NomeArq);
  LoadXML(MemoResp.Text, WBResposta);
  pgRespostas.ActivePageIndex := 1;
end;

procedure Tfrm_DemoACBrDPS.btnConsultarClick(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione o DPS';
  OpenDialog1.DefaultExt := '*-DPS.xml';
  OpenDialog1.Filter := 'Arquivos DPS (*-DPS.xml)|*-DPS.xml|Arquivos XML (*.xml)|*.xml|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ACBrDPS1.Configuracoes.Arquivos.PathSalvar;

  if OpenDialog1.Execute then
  begin
    ACBrDPS1.Notas.Clear;
    ACBrDPS1.Notas.LoadFromFile(OpenDialog1.FileName, False);
    ACBrDPS1.Consultar;
    ShowMessage(ACBrDPS1.WebServices.Consulta.Protocolo);
    MemoResp.Lines.Text := ACBrDPS1.WebServices.Consulta.RetWS;
    memoRespWS.Lines.Text := ACBrDPS1.WebServices.Consulta.RetornoWS;
    LoadXML(ACBrDPS1.WebServices.Consulta.RetornoWS, WBResposta);
  end;
end;

procedure Tfrm_DemoACBrDPS.btnConsultarChaveClick(Sender: TObject);
var
  vChave: String;
begin
  if not(InputQuery('WebServices Consultar', 'Chave da DPS:', vChave)) then
    exit;

  ACBrDPS1.Notas.Clear;
  ACBrDPS1.WebServices.Consulta.DPSChave := vChave;
  ACBrDPS1.WebServices.Consulta.Executar;

  MemoResp.Lines.Text := ACBrDPS1.WebServices.Consulta.RetWS;
  memoRespWS.Lines.Text := ACBrDPS1.WebServices.Consulta.RetornoWS;
  LoadXML(ACBrDPS1.WebServices.Consulta.RetornoWS, WBResposta);
end;

procedure Tfrm_DemoACBrDPS.btnValidarRegrasNegocioClick(Sender: TObject);
var
  Msg, Tempo: String;
  Inicio: TDateTime;
  Ok: Boolean;
begin
  OpenDialog1.Title := 'Selecione o DPS';
  OpenDialog1.DefaultExt := '*-DPS.xml';
  OpenDialog1.Filter := 'Arquivos DPS (*-DPS.xml)|*-DPS.xml|Arquivos XML (*.xml)|*.xml|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ACBrDPS1.Configuracoes.Arquivos.PathSalvar;

  if OpenDialog1.Execute then
  begin
    ACBrDPS1.Notas.Clear;
    ACBrDPS1.Notas.LoadFromFile(OpenDialog1.FileName, False);
    Inicio := Now;
    Ok := ACBrDPS1.Notas.ValidarRegrasdeNegocios(Msg);
    Tempo := FormatDateTime('hh:nn:ss:zzz', Now - Inicio);

    if not Ok then
    begin
      MemoDados.Lines.Add('Erro: '+Msg);
      ShowMessage('Erros encontrados'+ sLineBreak + 'Tempo: '+Tempo);
    end
    else
      ShowMessage('Tudo OK'+sLineBreak + 'Tempo: '+Tempo);
  end;
end;

procedure Tfrm_DemoACBrDPS.btnCancDPSClick(Sender: TObject);
var
  idLote, vAux: String;
begin
  OpenDialog1.Title := 'Selecione o DPS';
  OpenDialog1.DefaultExt := '*-DPS.xml';
  OpenDialog1.Filter := 'Arquivos DPS (*-DPS.xml)|*-DPS.xml|Arquivos XML (*.xml)|*.xml|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ACBrDPS1.Configuracoes.Arquivos.PathSalvar;

  if OpenDialog1.Execute then
  begin
    ACBrDPS1.Notas.Clear;
    ACBrDPS1.Notas.LoadFromFile(OpenDialog1.FileName, False);

    idLote := '1';
    if not(InputQuery('WebServices Eventos: Cancelamento', 'Identificador de controle do Lote de envio do Evento', idLote)) then
       exit;

    if not(InputQuery('WebServices Eventos: Cancelamento', 'Justificativa', vAux)) then
       exit;

    (*
    ACBrDPS1.EventoDPS.Evento.Clear;
    ACBrDPS1.EventoDPS.idLote := StrToInt(idLote);
    with ACBrDPS1.EventoDPS.Evento.Add do
    begin
     infEvento.dhEvento := now;
     infEvento.tpEvento := teCancelamento;
     infEvento.detEvento.xJust := vAux;
    end;
    ACBrDPS1.EnviarEvento(StrToInt(idLote));
    *)

    MemoResp.Lines.Text := ACBrDPS1.WebServices.EnvEvento.RetWS;
    memoRespWS.Lines.Text := ACBrDPS1.WebServices.EnvEvento.RetornoWS;
    LoadXML(ACBrDPS1.WebServices.EnvEvento.RetornoWS, WBResposta);
    ShowMessage(IntToStr(ACBrDPS1.WebServices.EnvEvento.cStat));
//    ShowMessage(ACBrDPS1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetinfEvento.nProt);
  end;
end;

procedure Tfrm_DemoACBrDPS.btnCancelarChaveClick(Sender: TObject);
var
  Chave, idLote, CNPJ, Protocolo, Justificativa: string;
begin
  if not(InputQuery('WebServices Eventos: Cancelamento', 'Chave da BP-e', Chave)) then
    exit;
  Chave := Trim(OnlyNumber(Chave));

  idLote := '1';
  if not(InputQuery('WebServices Eventos: Cancelamento', 'Identificador de controle do Lote de envio do Evento', idLote)) then
    exit;

  CNPJ := copy(Chave,7,14);
  if not(InputQuery('WebServices Eventos: Cancelamento', 'CNPJ ou o CPF do autor do Evento', CNPJ)) then
    exit;

  Protocolo:='';
  if not(InputQuery('WebServices Eventos: Cancelamento', 'Protocolo de Autorização', Protocolo)) then
    exit;

  Justificativa := 'Justificativa do Cancelamento';
  if not(InputQuery('WebServices Eventos: Cancelamento', 'Justificativa do Cancelamento', Justificativa)) then
    exit;

  (*
  ACBrDPS1.EventoDPS.Evento.Clear;
  with ACBrDPS1.EventoDPS.Evento.Add do
   begin
     infEvento.chDPS := Chave;
     infEvento.CNPJ   := CNPJ;
     infEvento.dhEvento := now;
     infEvento.tpEvento := teCancelamento;
     infEvento.detEvento.xJust := Justificativa;
     infEvento.detEvento.nProt := Protocolo;
   end;
  ACBrDPS1.EnviarEvento(StrToInt(idLote));
  *)

  MemoResp.Lines.Text := ACBrDPS1.WebServices.EnvEvento.RetWS;
  memoRespWS.Lines.Text := ACBrDPS1.WebServices.EnvEvento.RetornoWS;
  LoadXML(ACBrDPS1.WebServices.EnvEvento.RetornoWS, WBResposta);
end;

procedure Tfrm_DemoACBrDPS.btnValidarXMLClick(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione o DPS';
  OpenDialog1.DefaultExt := '*-DPS.xml';
  OpenDialog1.Filter := 'Arquivos DPS (*-DPS.xml)|*-DPS.xml|Arquivos XML (*.xml)|*.xml|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ACBrDPS1.Configuracoes.Arquivos.PathSalvar;

// Sugestão de configuração para apresentação de mensagem mais amigável ao usuário final
  ACBrDPS1.Configuracoes.Geral.ExibirErroSchema := False;
  ACBrDPS1.Configuracoes.Geral.FormatoAlerta := 'Campo:%DESCRICAO% - %MSG%';

  if OpenDialog1.Execute then
  begin
    ACBrDPS1.Notas.Clear;
    ACBrDPS1.Notas.LoadFromFile(OpenDialog1.FileName, False);
    try
      ACBrDPS1.Notas.Validar;

      if ACBrDPS1.Notas.Items[0].Alertas <> '' then
        MemoDados.Lines.Add('Alertas: '+ACBrDPS1.Notas.Items[0].Alertas);

      ShowMessage('Nota de Passagem Eletrônico Valido');
    except
      on E: Exception do
      begin
        pgRespostas.ActivePage := Dados;
        MemoDados.Lines.Add('Exception: '+E.Message);
        MemoDados.Lines.Add('Erro: '+ACBrDPS1.Notas.Items[0].ErroValidacao);
        MemoDados.Lines.Add('Erro Completo: '+ACBrDPS1.Notas.Items[0].ErroValidacaoCompleto);
      end;
    end;
  end;
end;

procedure Tfrm_DemoACBrDPS.btnGerarPDFClick(Sender: TObject);
var
  CarregarMaisXML: Boolean;
begin
	CarregarMaisXML := true;
  OpenDialog1.Title := 'Selecione o DPS';
  OpenDialog1.DefaultExt := '*-DPS.xml';
  OpenDialog1.Filter := 'Arquivos DPS (*-DPS.xml)|*-DPS.xml|Arquivos XML (*.xml)|*.xml|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ACBrDPS1.Configuracoes.Arquivos.PathSalvar;
  ACBrDPS1.Notas.Clear;

  while CarregarMaisXML do
  begin
    if OpenDialog1.Execute then
      ACBrDPS1.Notas.LoadFromFile(OpenDialog1.FileName, False);

    CarregarMaisXML := MessageDlg('Carregar mais Notas?', mtConfirmation, [mbYes, mbNo], 0) = mrYes;
  end;

  ACBrDPS1.Notas.ImprimirPDF;
end;

procedure Tfrm_DemoACBrDPS.btnImprimirClick(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione o DPS';
  OpenDialog1.DefaultExt := '*-DPS.xml';
  OpenDialog1.Filter := 'Arquivos DPS (*-DPS.xml)|*-DPS.xml|Arquivos XML (*.xml)|*.xml|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ACBrDPS1.Configuracoes.Arquivos.PathSalvar;

  if OpenDialog1.Execute then
  begin
    PrepararImpressao;

    ACBrDPS1.Notas.Clear;
    ACBrDPS1.Notas.LoadFromFile(OpenDialog1.FileName, False);
    ACBrDPS1.Notas.Imprimir;
  end;
end;

procedure Tfrm_DemoACBrDPS.btnEnviarEmailClick(Sender: TObject);
var
  Para: String;
  CC: Tstrings;
begin
  if not(InputQuery('Enviar Email', 'Email de destino', Para)) then
    exit;

  OpenDialog1.Title := 'Selecione o DPS';
  OpenDialog1.DefaultExt := '*-DPS.xml';
  OpenDialog1.Filter := 'Arquivos DPS (*-DPS.xml)|*-DPS.xml|Arquivos XML (*.xml)|*.xml|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ACBrDPS1.Configuracoes.Arquivos.PathSalvar;

  if OpenDialog1.Execute then
  begin
    ACBrDPS1.Notas.Clear;
    ACBrDPS1.Notas.LoadFromFile(OpenDialog1.FileName, False);
    CC:=TstringList.Create;
    try
      CC.Add('andrefmoraes@gmail.com'); //especifique um email valido
      CC.Add('anfm@zipmail.com.br');    //especifique um email valido

      ACBrMail1.Host := edtSmtpHost.Text;
      ACBrMail1.Port := edtSmtpPort.Text;
      ACBrMail1.Username := edtSmtpUser.Text;
      ACBrMail1.Password := edtSmtpPass.Text;
      ACBrMail1.From := edtSmtpUser.Text;
      ACBrMail1.SetSSL := cbEmailSSL.Checked; // SSL - Conexao Segura
      ACBrMail1.SetTLS := cbEmailSSL.Checked; // Auto TLS
      ACBrMail1.ReadingConfirmation := False; //Pede confirmação de leitura do email
      ACBrMail1.UseThread := False;           //Aguarda Envio do Email(não usa thread)
      ACBrMail1.FromName := 'Projeto ACBr - ACBrDPS';

      ACBrDPS1.Notas.Items[0].EnviarEmail( Para, edtEmailAssunto.Text,
                                               mmEmailMsg.Lines
                                               , True  // Enviar PDF junto
                                               , CC    // Lista com emails que serão enviado cópias - TStrings
                                               , nil); // Lista de anexos - TStrings
    finally
      CC.Free;
    end;
  end;
end;

procedure Tfrm_DemoACBrDPS.btnAdicionarProtDPSClick(Sender: TObject);
var
  NomeArq: String;
begin
  OpenDialog1.Title := 'Selecione o DPS';
  OpenDialog1.DefaultExt := '*-DPS.xml';
  OpenDialog1.Filter := 'Arquivos DPS (*-DPS.xml)|*-DPS.xml|Arquivos XML (*.xml)|*.xml|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ACBrDPS1.Configuracoes.Arquivos.PathSalvar;

  if OpenDialog1.Execute then
  begin
    ACBrDPS1.Notas.Clear;
    ACBrDPS1.Notas.LoadFromFile(OpenDialog1.FileName, False);
    ACBrDPS1.Consultar;
    ShowMessage(ACBrDPS1.WebServices.Consulta.Protocolo);
    MemoResp.Lines.Text := ACBrDPS1.WebServices.Consulta.RetWS;
    memoRespWS.Lines.Text := ACBrDPS1.WebServices.Consulta.RetornoWS;
    LoadXML(ACBrDPS1.WebServices.Consulta.RetornoWS, WBResposta);
    NomeArq := OpenDialog1.FileName;

    if pos(UpperCase('-DPS.xml'),UpperCase(NomeArq)) > 0 then
      NomeArq := StringReplace(NomeArq, '-DPS.xml', '-procDPS.xml',[rfIgnoreCase]);

    ACBrDPS1.Notas.Items[0].GravarXML(NomeArq);
    ShowMessage('Arquivo gravado em: '+NomeArq);
    memoLog.Lines.Add('Arquivo gravado em: '+NomeArq);
  end;
end;

procedure Tfrm_DemoACBrDPS.btnCarregarXMLEnviarClick(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione o DPS';
  OpenDialog1.DefaultExt := '*-DPS.xml';
  OpenDialog1.Filter := 'Arquivos DPS (*-DPS.xml)|*-DPS.xml|Arquivos XML (*.xml)|*.xml|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ACBrDPS1.Configuracoes.Arquivos.PathSalvar;

  if OpenDialog1.Execute then
  begin
    ACBrDPS1.Notas.Clear;
    ACBrDPS1.Notas.LoadFromFile(OpenDialog1.FileName, False);

    ACBrDPS1.Enviar(1, True);

    MemoResp.Lines.Text := ACBrDPS1.WebServices.Enviar.RetWS;
    memoRespWS.Lines.Text := ACBrDPS1.WebServices.Enviar.RetornoWS;
    LoadXML(ACBrDPS1.WebServices.Enviar.RetornoWS, WBResposta);

    MemoDados.Lines.Add('');
    MemoDados.Lines.Add('Envio DPS');
    MemoDados.Lines.Add('tpAmb: '+ TpAmbToStr(ACBrDPS1.WebServices.Enviar.TpAmb));
    MemoDados.Lines.Add('verAplic: '+ ACBrDPS1.WebServices.Enviar.verAplic);
    MemoDados.Lines.Add('cStat: '+ IntToStr(ACBrDPS1.WebServices.Enviar.cStat));
    MemoDados.Lines.Add('cUF: '+ IntToStr(ACBrDPS1.WebServices.Enviar.cUF));
    MemoDados.Lines.Add('xMotivo: '+ ACBrDPS1.WebServices.Enviar.xMotivo);
    MemoDados.Lines.Add('Protocolo: '+ ACBrDPS1.WebServices.Enviar.DPSRetorno.ProtDPS.Items[0].nProt);
  end;
end;

procedure Tfrm_DemoACBrDPS.btnValidarAssinaturaClick(Sender: TObject);
var
  Msg: String;
begin
  OpenDialog1.Title := 'Selecione o DPS';
  OpenDialog1.DefaultExt := '*-DPS.xml';
  OpenDialog1.Filter := 'Arquivos DPS (*-DPS.xml)|*-DPS.xml|Arquivos XML (*.xml)|*.xml|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ACBrDPS1.Configuracoes.Arquivos.PathSalvar;

  if OpenDialog1.Execute then
  begin
    ACBrDPS1.Notas.Clear;
    ACBrDPS1.Notas.LoadFromFile(OpenDialog1.FileName, False);
    pgRespostas.ActivePageIndex := 0;
    MemoResp.Lines.Add('');
    MemoResp.Lines.Add('');

    if not ACBrDPS1.Notas.VerificarAssinatura(Msg) then
      MemoResp.Lines.Add('Erro: '+Msg)
    else
    begin
      MemoResp.Lines.Add('OK: Assinatura Válida');
//      ACBrDPS1.SSL.CarregarCertificadoPublico( ACBrDPS1.Notas[0].DPS.signature.X509Certificate );
      MemoResp.Lines.Add('Assinado por: '+ ACBrDPS1.SSL.CertRazaoSocial);
      MemoResp.Lines.Add('CNPJ: '+ ACBrDPS1.SSL.CertCNPJ);
      MemoResp.Lines.Add('Num.Série: '+ ACBrDPS1.SSL.CertNumeroSerie);

      ShowMessage('ASSINATURA VÁLIDA');
    end;
  end;
end;

procedure Tfrm_DemoACBrDPS.btnImprimirEventoClick(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione o DPS';
  OpenDialog1.DefaultExt := '*.xml';
  OpenDialog1.Filter := 'Arquivos XML (*.xml)|*.xml|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ACBrDPS1.Configuracoes.Arquivos.PathSalvar;

  if OpenDialog1.Execute then
  begin
    ACBrDPS1.Notas.Clear;
    ACBrDPS1.Notas.LoadFromFile(OpenDialog1.FileName, False);
  end;

  OpenDialog1.Title := 'Selecione o Evento';
  OpenDialog1.DefaultExt := '*.xml';
  OpenDialog1.Filter := 'Arquivos XML (*.xml)|*.xml|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ACBrDPS1.Configuracoes.Arquivos.PathSalvar;

  if OpenDialog1.Execute then
  begin
//    ACBrDPS1.EventoDPS.Evento.Clear;
    ACBrDPS1.EventoDPS.LerXML(OpenDialog1.FileName) ;
    ACBrDPS1.ImprimirEvento;
  end;
end;

procedure Tfrm_DemoACBrDPS.btnEnviarEventoClick(Sender: TObject);
var
  Para: String;
  CC, Evento: Tstrings;
begin
  if not(InputQuery('Enviar Email', 'Email de destino', Para)) then
    exit;

  OpenDialog1.Title := 'Selecione o DPS';
  OpenDialog1.DefaultExt := '*.xml';
  OpenDialog1.Filter := 'Arquivos XML (*.xml)|*.xml|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ACBrDPS1.Configuracoes.Arquivos.PathSalvar;

  if OpenDialog1.Execute then
  begin
    ACBrDPS1.Notas.Clear;
    ACBrDPS1.Notas.LoadFromFile(OpenDialog1.FileName, False);
  end;

  OpenDialog1.Title := 'Selecione ao Evento';
  OpenDialog1.DefaultExt := '*.xml';
  OpenDialog1.Filter := 'Arquivos XML (*.xml)|*.xml|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ACBrDPS1.Configuracoes.Arquivos.PathSalvar;

  if OpenDialog1.Execute then
  begin
    Evento := TStringList.Create;
    Evento.Clear;
    Evento.Add(OpenDialog1.FileName);
//    ACBrDPS1.EventoDPS.Evento.Clear;
    ACBrDPS1.EventoDPS.LerXML(OpenDialog1.FileName);
    CC:=TstringList.Create;
    CC.Add('andrefmoraes@gmail.com'); //especifique um email valido
    CC.Add('anfm@zipmail.com.br');    //especifique um email valido

    ACBrDPS1.EnviarEmailEvento(Para,
                               edtEmailAssunto.Text,
                               mmEmailMsg.Lines,
                               CC,
                               Evento,
                               nil);
    CC.Free;
    Evento.Free;
  end;
end;

procedure Tfrm_DemoACBrDPS.btnDistribuicaoDFeClick(Sender: TObject);
var
  cUFAutor, CNPJ, ultNSU, ANSU: string;
begin
  cUFAutor := '';
  if not(InputQuery('WebServices Distribuição Documentos Fiscais', 'Código da UF do Autor', cUFAutor)) then
    exit;

  CNPJ := '';
  if not(InputQuery('WebServices Distribuição Documentos Fiscais', 'CNPJ/CPF do interessado no DF-e', CNPJ)) then
    exit;

  ultNSU := '';
  if not(InputQuery('WebServices Distribuição Documentos Fiscais', 'Último NSU recebido pelo ator', ultNSU)) then
    exit;

  ANSU := '';
  if not(InputQuery('WebServices Distribuição Documentos Fiscais', 'NSU específico', ANSU)) then
    exit;

  ACBrDPS1.DistribuicaoDFe(StrToInt(cUFAutor),CNPJ,ultNSU,ANSU);

  MemoResp.Lines.Text := ACBrDPS1.WebServices.DistribuicaoDFe.RetWS;
  memoRespWS.Lines.Text := ACBrDPS1.WebServices.DistribuicaoDFe.RetornoWS;

  LoadXML(ACBrDPS1.WebServices.DistribuicaoDFe.RetWS, WBResposta);
end;

procedure Tfrm_DemoACBrDPS.sbtnGetCertClick(Sender: TObject);
begin
  edtNumSerie.Text := ACBrDPS1.SSL.SelecionarCertificado;
end;

procedure Tfrm_DemoACBrDPS.sbPathDPSClick(Sender: TObject);
begin
  PathClick(edtPathDPS);
end;

procedure Tfrm_DemoACBrDPS.sbPathEventoClick(Sender: TObject);
begin
  PathClick(edtPathEvento);
end;

procedure Tfrm_DemoACBrDPS.spPathSchemasClick(Sender: TObject);
begin
  PathClick(edtPathSchemas);
end;

procedure Tfrm_DemoACBrDPS.btnValidadeDataClick(Sender: TObject);
begin
  ShowMessage( FormatDateBr(ACBrDPS1.SSL.CertDataVenc) );
end;

procedure Tfrm_DemoACBrDPS.btnNumSerieClick(Sender: TObject);
begin
  ShowMessage( ACBrDPS1.SSL.CertNumeroSerie );
end;

procedure Tfrm_DemoACBrDPS.btnSubjectNameClick(Sender: TObject);
begin
  ShowMessage( ACBrDPS1.SSL.CertSubjectName + sLineBreak + sLineBreak +
               'Razão Social: '+ACBrDPS1.SSL.CertRazaoSocial);
end;

procedure Tfrm_DemoACBrDPS.btnCNPJClick(Sender: TObject);
begin
  ShowMessage( ACBrDPS1.SSL.CertCNPJ );
end;

procedure Tfrm_DemoACBrDPS.btnSHA_RSAClick(Sender: TObject);
var
  Ahash: AnsiString;
begin
  Ahash := ACBrDPS1.SSL.CalcHash(Edit1.Text, dgstSHA256, outBase64, cbAssinar.Checked);
  MemoResp.Lines.Add( Ahash );
  pgRespostas.ActivePageIndex := 0;
end;

procedure Tfrm_DemoACBrDPS.btnHTTPSClick(Sender: TObject);
var
  Acao: String;
  OldUseCert: Boolean;
begin
  Acao := '<?xml version="1.0" encoding="UTF-8" standalone="no"?>'+
     '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" '+
     'xmlns:cli="http://cliente.bean.master.sigep.bsb.correios.com.br/"> '+
     ' <soapenv:Header/>'+
     ' <soapenv:Body>' +
     ' <cli:consultaCEP>' +
     ' <cep>18270-170</cep>' +
     ' </cli:consultaCEP>' +
     ' </soapenv:Body>' +
     ' </soapenv:Envelope>';

  OldUseCert := ACBrDPS1.SSL.UseCertificateHTTP;
  ACBrDPS1.SSL.UseCertificateHTTP := False;
  try
    MemoResp.Lines.Text := ACBrDPS1.SSL.Enviar(Acao, 'https://apps.correios.com.br/SigepMasterJPA/AtendeClienteService/AtendeCliente?wsdl', '');
  finally
    ACBrDPS1.SSL.UseCertificateHTTP := OldUseCert;
  end;
  pgRespostas.ActivePageIndex := 0;
end;

procedure Tfrm_DemoACBrDPS.btnX509Click(Sender: TObject);
begin
  with ACBrDPS1.SSL do
  begin
    CarregarCertificadoPublico(MemoDados.Lines.Text);
    MemoResp.Lines.Add(CertIssuerName);
    MemoResp.Lines.Add(CertRazaoSocial);
    MemoResp.Lines.Add(CertCNPJ);
    MemoResp.Lines.Add(CertSubjectName);
    MemoResp.Lines.Add(CertNumeroSerie);
    pgRespostas.ActivePageIndex := 0;
  end;
end;

procedure Tfrm_DemoACBrDPS.btnIssuerNameClick(Sender: TObject);
begin
  ShowMessage( ACBrDPS1.SSL.CertIssuerName + sLineBreak + sLineBreak +
              'Certificadora: '+ACBrDPS1.SSL.CertCertificadora);
end;

procedure Tfrm_DemoACBrDPS.sbtnListaCertClick(Sender: TObject);
var
  I: Integer;
  ASerie: String;
  AddRow: Boolean;
begin
  frSelecionarCertificado := TfrSelecionarCertificado.Create(Self);
  try
    ACBrDPS1.SSL.LerCertificadosStore;
    AddRow := False;

    with frSelecionarCertificado.StringGrid1 do
    begin
      ColWidths[0] := 220;
      ColWidths[1] := 250;
      ColWidths[2] := 120;
      ColWidths[3] := 80;
      ColWidths[4] := 150;
      Cells[ 0, 0 ] := 'Num.Série';
      Cells[ 1, 0 ] := 'Razão Social';
      Cells[ 2, 0 ] := 'CNPJ';
      Cells[ 3, 0 ] := 'Validade';
      Cells[ 4, 0 ] := 'Certificadora';
    end;

    for I := 0 to ACBrDPS1.SSL.ListaCertificados.Count-1 do
    begin
      with ACBrDPS1.SSL.ListaCertificados[I] do
      begin
        ASerie := NumeroSerie;
        if (CNPJ <> '') then
        begin
          with frSelecionarCertificado.StringGrid1 do
          begin
            if Addrow then
              RowCount := RowCount + 1;

            Cells[ 0, RowCount-1] := NumeroSerie;
            Cells[ 1, RowCount-1] := RazaoSocial;
            Cells[ 2, RowCount-1] := CNPJ;
            Cells[ 3, RowCount-1] := FormatDateBr(DataVenc);
            Cells[ 4, RowCount-1] := Certificadora;

            AddRow := True;
          end;
        end;
      end;
    end;

    frSelecionarCertificado.ShowModal;

    if frSelecionarCertificado.ModalResult = mrOK then
      edtNumSerie.Text := frSelecionarCertificado.StringGrid1.Cells[ 0,
                            frSelecionarCertificado.StringGrid1.Row];
  finally
     frSelecionarCertificado.Free;
  end;
end;

procedure Tfrm_DemoACBrDPS.cbSSLLibChange(Sender: TObject);
begin
  try
    if cbSSLLib.ItemIndex <> -1 then
      ACBrDPS1.Configuracoes.Geral.SSLLib := TSSLLib(cbSSLLib.ItemIndex);
  finally
    AtualizaSSLLibsCombo;
  end;
end;

procedure Tfrm_DemoACBrDPS.cbCryptLibChange(Sender: TObject);
begin
  try
    if cbCryptLib.ItemIndex <> -1 then
      ACBrDPS1.Configuracoes.Geral.SSLCryptLib := TSSLCryptLib(cbCryptLib.ItemIndex);
  finally
    AtualizaSSLLibsCombo;
  end;
end;

procedure Tfrm_DemoACBrDPS.cbHttpLibChange(Sender: TObject);
begin
  try
    if cbHttpLib.ItemIndex <> -1 then
      ACBrDPS1.Configuracoes.Geral.SSLHttpLib := TSSLHttpLib(cbHttpLib.ItemIndex);
  finally
    AtualizaSSLLibsCombo;
  end;
end;

procedure Tfrm_DemoACBrDPS.cbXmlSignLibChange(Sender: TObject);
begin
  try
    if cbXmlSignLib.ItemIndex <> -1 then
      ACBrDPS1.Configuracoes.Geral.SSLXmlSignLib := TSSLXmlSignLib(cbXmlSignLib.ItemIndex);
  finally
    AtualizaSSLLibsCombo;
  end;
end;

procedure Tfrm_DemoACBrDPS.cbSSLTypeChange(Sender: TObject);
begin
  if cbSSLType.ItemIndex <> -1 then
    ACBrDPS1.SSL.SSLType := TSSLType(cbSSLType.ItemIndex);
end;

procedure Tfrm_DemoACBrDPS.ACBrDPS1StatusChange(Sender: TObject);
begin
  case ACBrDPS1.Status of
    stIdleDPS:
      begin
        if ( frmStatus <> nil ) then
          frmStatus.Hide;
      end;

    stDPSStatusServico:
      begin
        if ( frmStatus = nil ) then
          frmStatus := TfrmStatus.Create(Application);

        frmStatus.lblStatus.Caption := 'Verificando Status do servico...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;

    stDPSRecepcao:
      begin
        if ( frmStatus = nil ) then
          frmStatus := TfrmStatus.Create(Application);

        frmStatus.lblStatus.Caption := 'Enviando dados da DPS...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;

    stDPSRetRecepcao:
      begin
        if ( frmStatus = nil ) then
          frmStatus := TfrmStatus.Create(Application);

        frmStatus.lblStatus.Caption := 'Recebendo dados da DPS...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;

    stDPSConsulta:
      begin
        if ( frmStatus = nil ) then
          frmStatus := TfrmStatus.Create(Application);

        frmStatus.lblStatus.Caption := 'Consultando DPS...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;

    stDPSEmail:
      begin
        if ( frmStatus = nil ) then
          frmStatus := TfrmStatus.Create(Application);

        frmStatus.lblStatus.Caption := 'Enviando Email...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;

    stDPSEvento:
      begin
        if ( frmStatus = nil ) then
          frmStatus := TfrmStatus.Create(Application);

        frmStatus.lblStatus.Caption := 'Enviando Evento...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
  end;
  Application.ProcessMessages;
end;

procedure Tfrm_DemoACBrDPS.ACBrDPS1GerarLog(const ALogLine: String;
  var Tratado: Boolean);
begin
   memoLog.Lines.Add(ALogLine);
end;

procedure Tfrm_DemoACBrDPS.lblColaboradorClick(Sender: TObject);
begin
  OpenURL('http://acbr.sourceforge.net/drupal/?q=node/5');
end;

procedure Tfrm_DemoACBrDPS.lblPatrocinadorClick(Sender: TObject);
begin
  OpenURL('http://acbr.sourceforge.net/drupal/?q=node/35');
end;

procedure Tfrm_DemoACBrDPS.lblDoar1Click(Sender: TObject);
begin
  OpenURL('http://acbr.sourceforge.net/drupal/?q=node/14');
end;

procedure Tfrm_DemoACBrDPS.lblDoar2Click(Sender: TObject);
begin
  OpenURL('http://acbr.sourceforge.net/drupal/?q=node/14');
end;

procedure Tfrm_DemoACBrDPS.lblMouseEnter(Sender: TObject);
begin
   TLabel(Sender).Font.Style := [fsBold,fsUnderline];
end;

procedure Tfrm_DemoACBrDPS.lblMouseLeave(Sender: TObject);
begin
   TLabel(Sender).Font.Style := [fsBold];
end;

procedure Tfrm_DemoACBrDPS.btSerialClick(Sender: TObject);
begin
  {
  frConfiguraSerial := TfrConfiguraSerial.Create(self);

  try
    frConfiguraSerial.Device.Porta        := ACBrPosPrinter1.Device.Porta;
    frConfiguraSerial.cmbPortaSerial.Text := cbxPorta.Text;
    frConfiguraSerial.Device.ParamsString := ACBrPosPrinter1.Device.ParamsString;

    if frConfiguraSerial.ShowModal = mrOk then
    begin
      cbxPorta.Text := frConfiguraSerial.Device.Porta;
      ACBrPosPrinter1.Device.ParamsString := frConfiguraSerial.Device.ParamsString;
    end;
  finally
     FreeAndNil( frConfiguraSerial );
  end;
  }
end;

procedure Tfrm_DemoACBrDPS.PrepararImpressao;
begin
  (*
  ACBrPosPrinter1.Desativar;

  ACBrPosPrinter1.Modelo         := TACBrPosPrinterModelo( cbxModeloPosPrinter.ItemIndex );
  ACBrPosPrinter1.PaginaDeCodigo := TACBrPosPaginaCodigo( cbxPagCodigo.ItemIndex );
  ACBrPosPrinter1.Porta          := cbxPorta.Text;

  ACBrPosPrinter1.ColunasFonteNormal := seColunas.Value;
  ACBrPosPrinter1.LinhasEntreCupons  := seLinhasPular.Value;
  ACBrPosPrinter1.EspacoEntreLinhas  := seEspLinhas.Value;

  ACBrDPSDADPSESCPOS1.ImprimeQRCode     := True;
  ACBrDPSDADPSESCPOS1.ImprimeEmUmaLinha := cbImprimir1Linha.Checked;
  *)
end;

end.
