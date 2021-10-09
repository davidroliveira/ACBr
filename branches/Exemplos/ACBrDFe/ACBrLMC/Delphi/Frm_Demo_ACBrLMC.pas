{$I ACBr.inc}

unit Frm_Demo_ACBrLMC;

interface

uses
  IniFiles, ShellAPI,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, OleCtrls, SHDocVw, StdCtrls, Buttons, ExtCtrls,
  ACBrMail, ACBrBase, ACBrDFe, ACBrLMC;

type
  TfrmDemo_ACBrLMC = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    sbtnCaminhoCert: TSpeedButton;
    Label25: TLabel;
    sbtnGetCert: TSpeedButton;
    edtCaminho: TEdit;
    edtSenha: TEdit;
    edtNumSerie: TEdit;
    TabSheet2: TTabSheet;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    sbtnLogoMarca: TSpeedButton;
    sbtnPathSalvar: TSpeedButton;
    edtLogoMarca: TEdit;
    edtPathLogs: TEdit;
    ckSalvar: TCheckBox;
    rgTipoDALMC: TRadioGroup;
    rgFormaEmissao: TRadioGroup;
    TabSheet3: TTabSheet;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    ckVisualizar: TCheckBox;
    cbUF: TComboBox;
    rgTipoAmb: TRadioGroup;
    gbProxy: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtProxyHost: TEdit;
    edtProxyPorta: TEdit;
    edtProxyUser: TEdit;
    edtProxySenha: TEdit;
    TabSheet4: TTabSheet;
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
    TabSheet7: TTabSheet;
    GroupBox5: TGroupBox;
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
    btnSalvarConfig: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    btnConsultar: TButton;
    btnValidarXML: TButton;
    btnStatusServ: TButton;
    btnCriarEnviar: TButton;
    btnGerarLMC: TButton;
    btnEnviarEmail: TButton;
    btnConsultarChave: TButton;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    MemoResp: TMemo;
    TabSheet6: TTabSheet;
    WBResposta: TWebBrowser;
    TabSheet8: TTabSheet;
    memoLog: TMemo;
    TabSheet9: TTabSheet;
    trvwLMC: TTreeView;
    TabSheet10: TTabSheet;
    memoRespWS: TMemo;
    Dados: TTabSheet;
    MemoDados: TMemo;
    OpenDialog1: TOpenDialog;
    ACBrLMC1: TACBrLMC;
    ACBrMail1: TACBrMail;
    Label29: TLabel;
    edtPathSchemas: TEdit;
    sbtnPathSchemas: TSpeedButton;

    procedure sbtnCaminhoCertClick(Sender: TObject);
    procedure sbtnGetCertClick(Sender: TObject);
    procedure sbtnLogoMarcaClick(Sender: TObject);
    procedure sbtnPathSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarConfigClick(Sender: TObject);
    procedure lblColaboradorClick(Sender: TObject);
    procedure lblPatrocinadorClick(Sender: TObject);
    procedure lblDoar1Click(Sender: TObject);
    procedure btnStatusServClick(Sender: TObject);
    procedure btnCriarEnviarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnConsultarChaveClick(Sender: TObject);
    procedure btnGerarLMCClick(Sender: TObject);
    procedure btnValidarXMLClick(Sender: TObject);
    procedure btnEnviarEmailClick(Sender: TObject);
    procedure sbtnPathSchemasClick(Sender: TObject);
    procedure ACBrLMC1GerarLog(const ALogLine: String;
      var Tratado: Boolean);
    procedure ACBrLMC1StatusChange(Sender: TObject);

  private
    { Private declarations }
    procedure GravarConfiguracao;
    procedure LerConfiguracao;
    procedure LoadXML(MyMemo: TMemo; MyWebBrowser: TWebBrowser);

    procedure AlimentarComponente(NumLMC : String);
  public
    { Public declarations }
  end;

var
  frmDemo_ACBrLMC: TfrmDemo_ACBrLMC;

implementation

uses
  FileCtrl, DateUtils, pcnConversao, plmcConversao,
  ufrmStatus;

const
  SELDIRHELP = 1000;

{$R *.dfm}

procedure TfrmDemo_ACBrLMC.GravarConfiguracao;
var
 IniFile    : String;
 Ini        : TIniFile;
 StreamMemo : TMemoryStream;
begin
 IniFile := ChangeFileExt( Application.ExeName, '.ini');

 Ini := TIniFile.Create( IniFile );
 try
  Ini.WriteString( 'Certificado','Caminho' ,edtCaminho.Text);
  Ini.WriteString( 'Certificado','Senha'   ,edtSenha.Text);
  Ini.WriteString( 'Certificado','NumSerie',edtNumSerie.Text);

  Ini.WriteInteger( 'Geral','FormaEmissao',rgFormaEmissao.ItemIndex);
  Ini.WriteString( 'Geral','LogoMarca'   ,edtLogoMarca.Text);
  Ini.WriteBool(   'Geral','Salvar'      ,ckSalvar.Checked);
  Ini.WriteString( 'Geral','PathSalvar'  ,edtPathLogs.Text);
  Ini.WriteString( 'Geral','PathSchemas' ,edtPathSchemas.Text);

  Ini.WriteString( 'WebService','UF'        ,cbUF.Text);
  Ini.WriteInteger( 'WebService','Ambiente'  ,rgTipoAmb.ItemIndex);
  Ini.WriteBool(   'WebService','Visualizar',ckVisualizar.Checked);

  Ini.WriteString( 'Proxy','Host'   ,edtProxyHost.Text);
  Ini.WriteString( 'Proxy','Porta'  ,edtProxyPorta.Text);
  Ini.WriteString( 'Proxy','User'   ,edtProxyUser.Text);
  Ini.WriteString( 'Proxy','Pass'   ,edtProxySenha.Text);

  Ini.WriteString( 'Emitente','CNPJ'       ,edtEmitCNPJ.Text);
  Ini.WriteString( 'Emitente','IE'         ,edtEmitIE.Text);
  Ini.WriteString( 'Emitente','RazaoSocial',edtEmitRazao.Text);
  Ini.WriteString( 'Emitente','Fantasia'   ,edtEmitFantasia.Text);
  Ini.WriteString( 'Emitente','Fone'       ,edtEmitFone.Text);
  Ini.WriteString( 'Emitente','CEP'        ,edtEmitCEP.Text);
  Ini.WriteString( 'Emitente','Logradouro' ,edtEmitLogradouro.Text);
  Ini.WriteString( 'Emitente','Numero'     ,edtEmitNumero.Text);
  Ini.WriteString( 'Emitente','Complemento',edtEmitComp.Text);
  Ini.WriteString( 'Emitente','Bairro'     ,edtEmitBairro.Text);
  Ini.WriteString( 'Emitente','CodCidade'  ,edtEmitCodCidade.Text);
  Ini.WriteString( 'Emitente','Cidade'     ,edtEmitCidade.Text);
  Ini.WriteString( 'Emitente','UF'         ,edtEmitUF.Text);

  Ini.WriteString( 'Email','Host'    ,edtSmtpHost.Text);
  Ini.WriteString( 'Email','Port'    ,edtSmtpPort.Text);
  Ini.WriteString( 'Email','User'    ,edtSmtpUser.Text);
  Ini.WriteString( 'Email','Pass'    ,edtSmtpPass.Text);
  Ini.WriteString( 'Email','Assunto' ,edtEmailAssunto.Text);
  Ini.WriteBool(   'Email','SSL'     ,cbEmailSSL.Checked );

  StreamMemo := TMemoryStream.Create;
  mmEmailMsg.Lines.SaveToStream(StreamMemo);
  StreamMemo.Seek(0,soFromBeginning);
  Ini.WriteBinaryStream( 'Email','Mensagem',StreamMemo);

  StreamMemo.Free;
 finally
  Ini.Free;
 end;
end;

procedure TfrmDemo_ACBrLMC.LerConfiguracao;
var
 IniFile, PathMensal: String;
 Ini: TIniFile;
 Ok: Boolean;
 StreamMemo: TMemoryStream;
begin
 IniFile := ChangeFileExt( Application.ExeName, '.ini');

 Ini := TIniFile.Create( IniFile );
 try
  {$IFDEF ACBrLMCOpenSSL}
   edtCaminho.Text  := Ini.ReadString( 'Certificado','Caminho' ,'');
   edtSenha.Text    := Ini.ReadString( 'Certificado','Senha'   ,'');
   ACBrLMC1.Configuracoes.Certificados.Certificado  := edtCaminho.Text;
   ACBrLMC1.Configuracoes.Certificados.Senha        := edtSenha.Text;
   edtNumSerie.Visible := False;
   Label25.Visible     := False;
   sbtnGetCert.Visible := False;
  {$ELSE}
   edtNumSerie.Text := Ini.ReadString( 'Certificado','NumSerie','');
   ACBrLMC1.Configuracoes.Certificados.NumeroSerie := edtNumSerie.Text;

   Label1.Caption := 'Informe o número de série do certificado'#13+
                     'Disponível no Internet Explorer no menu'#13+
                     'Ferramentas - Opções da Internet - Conteúdo '#13+
                     'Certificados - Exibir - Detalhes - '#13+
                     'Número do certificado';
   Label2.Visible     := False;
   edtCaminho.Visible := False;
   edtSenha.Visible   := False;
   sbtnCaminhoCert.Visible := False;
  {$ENDIF}

  rgFormaEmissao.ItemIndex := Ini.ReadInteger('Geral','FormaEmissao',0);
  ckSalvar.Checked         := Ini.ReadBool(   'Geral','Salvar'      ,True);
  edtPathLogs.Text         := Ini.ReadString( 'Geral','PathSalvar'  ,'');
  edtPathSchemas.Text      := Ini.ReadString( 'Geral','PathSchemas' ,'');

  case rgFormaEmissao.ItemIndex of
   0: ACBrLMC1.Configuracoes.Geral.FormaEmissao := teNormal;
   1: ACBrLMC1.Configuracoes.Geral.FormaEmissao := teDPEC; // o mesmo que EPEC
   2: ACBrLMC1.Configuracoes.Geral.FormaEmissao := teFSDA;
   3: ACBrLMC1.Configuracoes.Geral.FormaEmissao := teSVCRS;
   4: ACBrLMC1.Configuracoes.Geral.FormaEmissao := tESVCSP;
  end;

  ACBrLMC1.Configuracoes.Certificados.VerificarValidade :=True;

  ACBrLMC1.Configuracoes.Arquivos.AdicionarLiteral := True;
  ACBrLMC1.Configuracoes.Arquivos.EmissaoPathLMC   := True;
  ACBrLMC1.Configuracoes.Arquivos.SepararPorMes    := True;
  ACBrLMC1.Configuracoes.Arquivos.SepararPorCNPJ   := False;
  ACBrLMC1.Configuracoes.Arquivos.PathLMC          := edtPathLogs.Text;
  ACBrLMC1.Configuracoes.Arquivos.PathSchemas      := edtPathSchemas.Text;

  ACBrLMC1.Configuracoes.Geral.Salvar := ckSalvar.Checked;

  PathMensal := ACBrLMC1.Configuracoes.Arquivos.GetPathLMC(0);

  ACBrLMC1.Configuracoes.Arquivos.PathSalvar := PathMensal;
  ACBrLMC1.Configuracoes.Arquivos.Salvar     := True;

  cbUF.ItemIndex       := cbUF.Items.IndexOf(Ini.ReadString('WebService','UF','SP'));
  rgTipoAmb.ItemIndex  := Ini.ReadInteger('WebService','Ambiente'  ,0);
  ckVisualizar.Checked :=Ini.ReadBool(    'WebService','Visualizar',False);
  ACBrLMC1.Configuracoes.WebServices.UF         := cbUF.Text;
  ACBrLMC1.Configuracoes.WebServices.Ambiente   := StrToTpAmb(Ok,IntToStr(rgTipoAmb.ItemIndex+1));
  ACBrLMC1.Configuracoes.WebServices.Visualizar := ckVisualizar.Checked;

  edtProxyHost.Text  := Ini.ReadString( 'Proxy','Host'   ,'');
  edtProxyPorta.Text := Ini.ReadString( 'Proxy','Porta'  ,'');
  edtProxyUser.Text  := Ini.ReadString( 'Proxy','User'   ,'');
  edtProxySenha.Text := Ini.ReadString( 'Proxy','Pass'   ,'');
  ACBrLMC1.Configuracoes.WebServices.ProxyHost := edtProxyHost.Text;
  ACBrLMC1.Configuracoes.WebServices.ProxyPort := edtProxyPorta.Text;
  ACBrLMC1.Configuracoes.WebServices.ProxyUser := edtProxyUser.Text;
  ACBrLMC1.Configuracoes.WebServices.ProxyPass := edtProxySenha.Text;

  rgTipoDALMC.ItemIndex := Ini.ReadInteger( 'Geral','DALMC'       ,0);
  edtLogoMarca.Text     := Ini.ReadString( 'Geral','LogoMarca'   ,'');
  (*
  if ACBrLMC1.DALMC <> nil then
   begin
    ACBrLMC1.DALMC.TipoDALMC    := StrToTpImp(OK,IntToStr(rgTipoDaLMC.ItemIndex+1));
    ACBrLMC1.DALMC.Logo         := edtLogoMarca.Text;
    ACBrLMC1.DALMC.PathPDF      := edtPathLogs.Text;
    ACBrLMC1.DALMC.TamanhoPapel := tpA4_2vias;
   end;
  *)
  edtEmitCNPJ.Text       := Ini.ReadString( 'Emitente','CNPJ'       ,'');
  edtEmitIE.Text         := Ini.ReadString( 'Emitente','IE'         ,'');
  edtEmitRazao.Text      := Ini.ReadString( 'Emitente','RazaoSocial','');
  edtEmitFantasia.Text   := Ini.ReadString( 'Emitente','Fantasia'   ,'');
  edtEmitFone.Text       := Ini.ReadString( 'Emitente','Fone'       ,'');
  edtEmitCEP.Text        := Ini.ReadString( 'Emitente','CEP'        ,'');
  edtEmitLogradouro.Text := Ini.ReadString( 'Emitente','Logradouro' ,'');
  edtEmitNumero.Text     := Ini.ReadString( 'Emitente','Numero'     ,'');
  edtEmitComp.Text       := Ini.ReadString( 'Emitente','Complemento','');
  edtEmitBairro.Text     := Ini.ReadString( 'Emitente','Bairro'     ,'');
  edtEmitCodCidade.Text  := Ini.ReadString( 'Emitente','CodCidade'  ,'');
  edtEmitCidade.Text     := Ini.ReadString( 'Emitente','Cidade'     ,'');
  edtEmitUF.Text         := Ini.ReadString( 'Emitente','UF'         ,'');

  edtSmtpHost.Text      := Ini.ReadString( 'Email','Host'   ,'');
  edtSmtpPort.Text      := Ini.ReadString( 'Email','Port'   ,'');
  edtSmtpUser.Text      := Ini.ReadString( 'Email','User'   ,'');
  edtSmtpPass.Text      := Ini.ReadString( 'Email','Pass'   ,'');
  edtEmailAssunto.Text  := Ini.ReadString( 'Email','Assunto','');
  cbEmailSSL.Checked    := Ini.ReadBool(   'Email','SSL'    ,False);

  StreamMemo := TMemoryStream.Create;
  Ini.ReadBinaryStream( 'Email','Mensagem',StreamMemo);
  mmEmailMsg.Lines.LoadFromStream(StreamMemo);
  StreamMemo.Free;

  ACBrLMC1.MAIL.Host := edtSmtpHost.Text;
  ACBrLMC1.MAIL.Port := edtSmtpPort.Text;
  ACBrLMC1.MAIL.Username := edtSmtpUser.Text;
  ACBrLMC1.MAIL.Password := edtSmtpPass.Text;
  ACBrLMC1.MAIL.SetSSL   := cbEmailSSL.Checked;
  ACBrLMC1.MAIL.ReadingConfirmation := False;

 finally
  Ini.Free;
 end;
end;

procedure TfrmDemo_ACBrLMC.LoadXML(MyMemo: TMemo; MyWebBrowser: TWebBrowser);
begin
  MyMemo.Lines.SaveToFile(ExtractFileDir(application.ExeName)+'temp.xml');
  MyWebBrowser.Navigate(ExtractFileDir(application.ExeName)+'temp.xml');
end;

procedure TfrmDemo_ACBrLMC.AlimentarComponente(NumLMC: String);
begin

  // O código abaixo é um mero exemplo de preenchimento dos dados

  with ACBrLMC1.Livros.Add.LMC do
  begin
    infLMC.versao := 1.0;
    // TpcnTipoAmbiente = (taProducao, taHomologacao);
    case rgTipoAmb.ItemIndex of
      0: infLMC.tpAmb:=taProducao;
      1: infLMC.tpAmb:=taHomologacao;
    end;
    infLMC.cNumerico := StrToIntDef(NumLMC, 1);

    infLMC.emit.IE := edtEmitIE.Text;
    infLMC.emit.CNPJ := edtEmitCNPJ.Text;
    infLMC.emit.xNome := edtEmitRazao.Text;

    infLMC.movimento.dEmissao := Date;

    with infLMC.movimento.infMovimento.Add do
    begin
//  TidProduto     = (idEtanolAditivado, idEtanolComum, idGasolinaAditivada,
//                    idGasolinaComum, idGasolinaPremium, idDieselA,
//                    idDieselB, idDieselBAditivado, idDieselBS10,
//                    idDieselBS10Aditicado, idQuerosene);

      nrProduto := idEtanolComum;
      volEstoqueAbertura := 25000;

      with volumeRecebido.Add do
      begin
        CNPJ := edtEmitCNPJ.Text; // '00000000000000';
        nNF := 1;
        dNF := Date;
        volVolume := 15000;
        xTanque := '001';
      end;

      with volumeVendido.Add do
      begin
        xTanque := '001';
        nrBico := 1;
        VolFechamento := 20000;
        volAbertura := 40000;
        volAfericoes := 500;
      end;

      volEstoqueFechamento := 20000;
      valVendasDiaBomba := 25000;
      valAcumuladoMes := 120000;
      observacoes := 'teste';
    end;
  end;
end;

procedure TfrmDemo_ACBrLMC.sbtnCaminhoCertClick(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione o Certificado';
  OpenDialog1.DefaultExt := '*.pfx';
  OpenDialog1.Filter := 'Arquivos PFX (*.pfx)|*.pfx|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ExtractFileDir(application.ExeName);

  if OpenDialog1.Execute then
    edtCaminho.Text := OpenDialog1.FileName;
end;

procedure TfrmDemo_ACBrLMC.sbtnGetCertClick(Sender: TObject);
begin
  edtNumSerie.Text := ACBrLMC1.SSL.SelecionarCertificado;
end;

procedure TfrmDemo_ACBrLMC.sbtnLogoMarcaClick(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione o Logo';
  OpenDialog1.DefaultExt := '*.bmp';
  OpenDialog1.Filter := 'Arquivos BMP (*.bmp)|*.bmp|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ExtractFileDir(application.ExeName);

  if OpenDialog1.Execute then
    edtLogoMarca.Text := OpenDialog1.FileName;
end;

procedure TfrmDemo_ACBrLMC.sbtnPathSalvarClick(Sender: TObject);
var
  Dir : string;
begin
  if Length(edtPathLogs.Text) <= 0 then
    Dir := ExtractFileDir(application.ExeName)
  else
    Dir := edtPathLogs.Text;

  if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt], SELDIRHELP) then
    edtPathLogs.Text := Dir;
end;

procedure TfrmDemo_ACBrLMC.FormCreate(Sender: TObject);
begin
  LerConfiguracao;
end;

procedure TfrmDemo_ACBrLMC.btnSalvarConfigClick(Sender: TObject);
begin
  GravarConfiguracao;
  LerConfiguracao;
end;

procedure TfrmDemo_ACBrLMC.lblColaboradorClick(Sender: TObject);
begin
  ShellExecute(0, Nil, 'http://acbr.sourceforge.net/drupal/?q=node/5', Nil, Nil, SW_NORMAL);
end;

procedure TfrmDemo_ACBrLMC.lblPatrocinadorClick(Sender: TObject);
begin
  ShellExecute(0, Nil, 'http://acbr.sourceforge.net/drupal/?q=node/35', Nil, Nil, SW_NORMAL);
end;

procedure TfrmDemo_ACBrLMC.lblDoar1Click(Sender: TObject);
begin
  ShellExecute(0, Nil, 'http://acbr.sourceforge.net/drupal/?q=node/14', Nil, Nil, SW_NORMAL);
end;

procedure TfrmDemo_ACBrLMC.btnStatusServClick(Sender: TObject);
begin
(*
 ACBrLMC1.WebServices.StatusServico.Executar;
 MemoResp.Lines.Text := UTF8Encode(ACBrLMC1.WebServices.StatusServico.RetWS);
 memoRespWS.Lines.Text := UTF8Encode(ACBrLMC1.WebServices.StatusServico.RetWS);
 LoadXML(MemoResp, WBResposta);

 PageControl2.ActivePageIndex := 5;
 MemoDados.Lines.Add('');
 MemoDados.Lines.Add('Status Serviço');
 MemoDados.Lines.Add('tpAmb: '    +TpAmbToStr(ACBrLMC1.WebServices.StatusServico.tpAmb));
 MemoDados.Lines.Add('verAplic: ' +ACBrLMC1.WebServices.StatusServico.verAplic);
 MemoDados.Lines.Add('cStat: '    +IntToStr(ACBrLMC1.WebServices.StatusServico.cStat));
 MemoDados.Lines.Add('xMotivo: '  +ACBrLMC1.WebServices.StatusServico.xMotivo);
 MemoDados.Lines.Add('cUF: '      +IntToStr(ACBrLMC1.WebServices.StatusServico.cUF));
 MemoDados.Lines.Add('dhRecbto: ' +DateTimeToStr(ACBrLMC1.WebServices.StatusServico.dhRecbto));
 MemoDados.Lines.Add('tMed: '     +IntToStr(ACBrLMC1.WebServices.StatusServico.TMed));
 MemoDados.Lines.Add('dhRetorno: '+DateTimeToStr(ACBrLMC1.WebServices.StatusServico.dhRetorno));
 MemoDados.Lines.Add('xObs: '     +ACBrLMC1.WebServices.StatusServico.xObs);
*)
end;

procedure TfrmDemo_ACBrLMC.btnGerarLMCClick(Sender: TObject);
var
  vAux: String;
begin
  if not(InputQuery('WebServices Enviar', 'Numero do Livro', vAux)) then
    exit;

  ACBrLMC1.Livros.Clear;
  AlimentarComponente(vAux);
  ACBrLMC1.Livros.Items[0].GravarXML('','');

  ShowMessage('Arquivo gerado em: '+ACBrLMC1.Livros.Items[0].NomeArq);
  MemoDados.Lines.Add('Arquivo gerado em: '+ACBrLMC1.Livros.Items[0].NomeArq);
  MemoResp.Lines.LoadFromFile(ACBrLMC1.Livros.Items[0].NomeArq);

  LoadXML(MemoResp, WBResposta);
  PageControl2.ActivePageIndex := 1;
end;

procedure TfrmDemo_ACBrLMC.btnCriarEnviarClick(Sender: TObject);
var
  vAux, vNumLote: String;
begin
  if not(InputQuery('WebServices Enviar', 'Numero do Livro', vAux)) then
    exit;

  if not(InputQuery('WebServices Enviar', 'Numero do Lote', vNumLote)) then
    exit;

  ACBrLMC1.Livros.Clear;
  AlimentarComponente(vAux);
  ACBrLMC1.Enviar(StrToInt(vNumLote));

  MemoResp.Lines.Text   := UTF8Encode(ACBrLMC1.WebServices.Enviar.RetWS);
  memoRespWS.Lines.Text := UTF8Encode(ACBrLMC1.WebServices.Enviar.RetWS);
  LoadXML(MemoResp, WBResposta);

  PageControl2.ActivePageIndex := 5;
  MemoDados.Lines.Add('');
  MemoDados.Lines.Add('Envio LMC');
  MemoDados.Lines.Add('tpAmb: '+ TpAmbToStr(ACBrLMC1.WebServices.Enviar.TpAmb));
  MemoDados.Lines.Add('verAplic: '+ ACBrLMC1.WebServices.Enviar.verAplic);
  MemoDados.Lines.Add('cStat: '+ IntToStr(ACBrLMC1.WebServices.Enviar.cStat));
  MemoDados.Lines.Add('cUF: '+ IntToStr(ACBrLMC1.WebServices.Enviar.cUF));
  MemoDados.Lines.Add('xMotivo: '+ ACBrLMC1.WebServices.Enviar.xMotivo);
  MemoDados.Lines.Add('xMsg: '+ ACBrLMC1.WebServices.Enviar.Msg);
  MemoDados.Lines.Add('Recibo: '+ ACBrLMC1.WebServices.Enviar.Recibo);
//  MemoDados.Lines.Add('Protocolo: '+ ACBrLMC1.WebServices.Enviar.Protocolo);

  ACBrLMC1.Livros.Clear;
end;

procedure TfrmDemo_ACBrLMC.btnConsultarClick(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione o LMC';
  OpenDialog1.DefaultExt := '*-LMC.xml';
  OpenDialog1.Filter := 'Arquivos LMC (*-LMC.xml)|*-LMC.xml|Arquivos XML (*.xml)|*.xml|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ACBrLMC1.Configuracoes.Arquivos.PathSalvar;

  if OpenDialog1.Execute then
  begin
  (*
    ACBrLMC1.Livros.Clear;
    ACBrLMC1.Livros.LoadFromFile(OpenDialog1.FileName);
    ACBrLMC1.Consultar;

    ShowMessage(ACBrLMC1.WebServices.Consulta.Protocolo);
    MemoResp.Lines.Text := UTF8Encode(ACBrLMC1.WebServices.Consulta.RetWS);
    memoRespWS.Lines.Text := UTF8Encode(ACBrLMC1.WebServices.Consulta.RetWS);

    // Retorno do XML completo: LMC + Eventos vinculados
    MemoDados.Lines.Text :=  UTF8Encode(ACBrLMC1.WebServices.Consulta.RetLMCDFe);
   *)
    LoadXML(MemoResp, WBResposta);
  end;
end;

procedure TfrmDemo_ACBrLMC.btnConsultarChaveClick(Sender: TObject);
var
  vChave: String;
begin
  if not(InputQuery('WebServices Consultar', 'Chave do LMC:', vChave)) then
    exit;
  (*
  ACBrLMC1.WebServices.Consulta.LMCChave := vChave;
  ACBrLMC1.WebServices.Consulta.Executar;

  MemoResp.Lines.Text :=  UTF8Encode(ACBrLMC1.WebServices.Consulta.RetWS);
  memoRespWS.Lines.Text :=  UTF8Encode(ACBrLMC1.WebServices.Consulta.RetornoWS);
  *)
  LoadXML(MemoResp, WBResposta);
end;

procedure TfrmDemo_ACBrLMC.btnValidarXMLClick(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione o LMC';
  OpenDialog1.DefaultExt := '*-LMC.xml';
  OpenDialog1.Filter := 'Arquivos LMC (*-LMC.xml)|*-LMC.xml|Arquivos XML (*.xml)|*.xml|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ACBrLMC1.Configuracoes.Arquivos.PathSalvar;

  if OpenDialog1.Execute then
  begin
    ACBrLMC1.Livros.Clear;
    ACBrLMC1.Livros.LoadFromFile(OpenDialog1.FileName);
    ACBrLMC1.Livros.Validar;
    showmessage('Livro de Movimentação de Combustivel Valido');
  end;
end;

procedure TfrmDemo_ACBrLMC.btnEnviarEmailClick(Sender: TObject);
var
  Para: String;
  CC: Tstrings;
begin
  if not(InputQuery('Enviar Email', 'Email de destino', Para)) then
    exit;

  OpenDialog1.Title := 'Selecione o LMC';
  OpenDialog1.DefaultExt := '*-LMC.xml';
  OpenDialog1.Filter := 'Arquivos LMC (*-LMC.xml)|*-LMC.xml|Arquivos XML (*.xml)|*.xml|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ACBrLMC1.Configuracoes.Arquivos.PathSalvar;

  if OpenDialog1.Execute then
  begin
    ACBrLMC1.Livros.Clear;
    ACBrLMC1.Livros.LoadFromFile(OpenDialog1.FileName);
    CC:=TstringList.Create;
    CC.Add('email_1@provedor.com'); //especifique um email válido
    CC.Add('email_2@provedor.com.br'); //especifique um email válido

    ACBrLMC1.Livros.Items[0].EnviarEmail(Para
                                       , edtEmailAssunto.Text
                                       , mmEmailMsg.Lines
                                       , False //Enviar PDF junto
                                       , nil //Lista com emails que serão enviado cópias - TStrings
                                       , nil // Lista de anexos - TStrings
                                        );
    CC.Free;
  end;
end;

procedure TfrmDemo_ACBrLMC.sbtnPathSchemasClick(Sender: TObject);
var
  Dir : string;
begin
  if Length(edtPathLogs.Text) <= 0 then
    Dir := ExtractFileDir(application.ExeName)
  else
    Dir := edtPathSchemas.Text;

  if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt],SELDIRHELP) then
    edtPathSchemas.Text := Dir;
end;

procedure TfrmDemo_ACBrLMC.ACBrLMC1GerarLog(const ALogLine: String;
  var Tratado: Boolean);
begin
  memoLog.Lines.Add(ALogLine);
end;

procedure TfrmDemo_ACBrLMC.ACBrLMC1StatusChange(Sender: TObject);
begin
  case ACBrLMC1.Status of
    stLMCIdle : if ( frmStatus <> nil ) then frmStatus.Hide;

    stLMCStatusServico : begin
                           if ( frmStatus = nil ) then
                             frmStatus := TfrmStatus.Create(Application);
                           frmStatus.lblStatus.Caption := 'Verificando Status do servico...';
                           frmStatus.Show;
                           frmStatus.BringToFront;
                         end;
    stLMCAutorizacao : begin
                         if ( frmStatus = nil ) then
                           frmStatus := TfrmStatus.Create(Application);
                         frmStatus.lblStatus.Caption := 'Enviando dados do LMC...';
                         frmStatus.Show;
                         frmStatus.BringToFront;
                       end;
    stLMCRetAutorizacao : begin
                            if ( frmStatus = nil ) then
                              frmStatus := TfrmStatus.Create(Application);
                            frmStatus.lblStatus.Caption := 'Recebendo dados do LMC...';
                            frmStatus.Show;
                            frmStatus.BringToFront;
                          end;
    stLMCConsulta : begin
                      if ( frmStatus = nil ) then
                        frmStatus := TfrmStatus.Create(Application);
                      frmStatus.lblStatus.Caption := 'Consultando LMC...';
                      frmStatus.Show;
                      frmStatus.BringToFront;
                    end;
    stLMCEmail : begin
                   if ( frmStatus = nil ) then
                     frmStatus := TfrmStatus.Create(Application);
                   frmStatus.lblStatus.Caption := 'Enviando Email...';
                   frmStatus.Show;
                   frmStatus.BringToFront;
                 end;
  end;

  Application.ProcessMessages;
end;

end.
