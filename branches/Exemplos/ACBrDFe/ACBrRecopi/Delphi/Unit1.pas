unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ACBrBase, ACBrDFe, ACBrRecopi, Buttons, TypInfo,
  ACBrDFeSSL, ACBrUtil, IniFiles, pcnConversao, ACBrRecopiWebServices, Unit2,
  blcksock, FileCtrl, pcnRecopi, pcnConversaoRecopi;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    lSSLLib: TLabel;
    lCryptLib: TLabel;
    lHttpLib: TLabel;
    lXmlSign: TLabel;
    cbXmlSignLib: TComboBox;
    cbHttpLib: TComboBox;
    cbCryptLib: TComboBox;
    cbSSLLib: TComboBox;
    Memo1: TMemo;
    Button15: TButton;
    Button14: TButton;
    Label3: TLabel;
    edtPathSchemas: TEdit;
    sbtnCaminhoCert1: TSpeedButton;
    edtPathLogs: TEdit;
    sbtnCaminhoCert2: TSpeedButton;
    Label4: TLabel;
    lSSLLib1: TLabel;
    cbSSLType: TComboBox;
    OpenDialog1: TOpenDialog;
    ACBrRecopi1: TACBrRecopi;
    RadioGroup1: TRadioGroup;
    GroupBox1: TGroupBox;
    Button12: TButton;
    Button13: TButton;
    Button7: TButton;
    Button9: TButton;
    Button11: TButton;
    Button10: TButton;
    Button8: TButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    edtCaminho: TEdit;
    sbtnCaminhoCert: TSpeedButton;
    Label2: TLabel;
    edtNumSerie: TEdit;
    Label25: TLabel;
    sbtnGetCert1: TSpeedButton;
    sbtnGetCert: TSpeedButton;
    edtSenha: TEdit;
    procedure Button6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure sbtnCaminhoCertClick(Sender: TObject);
    procedure sbtnGetCert1Click(Sender: TObject);
    procedure sbtnGetCertClick(Sender: TObject);
    procedure sbtnCaminhoCert1Click(Sender: TObject);
    procedure sbtnCaminhoCert2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PathClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { private declarations }
    procedure GravaConfiguracao;
    procedure LerConfiguracao;
    procedure AtualizaSSLLibsCombo;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

const
  SELDIRHELP = 1000;

{$R *.dfm}

procedure TForm1.Button6Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  LerConfiguracao;
  ACBrRecopi1.WebServices.ObeterVersao.Executar;
  Memo1.Lines.Add(ACBrRecopi1.WebServices.ObeterVersao.Versao);
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
  LerConfiguracao;
  ACBrRecopi1.WebServices.ConsultaPublica.CNPJ:={'23183669000161'} '62261086000163';
  ACBrRecopi1.WebServices.ConsultaPublica.UF:='SP';
  ACBrRecopi1.WebServices.ConsultaPublica.Executar;
  Memo1.Lines.Add(ACBrRecopi1.WebServices.ConsultaPublica.Retorno);
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
  GravaConfiguracao;
  LerConfiguracao;
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  ACBrRecopi1.SSL.CarregarCertificado;
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  ACBrRecopi1.SSL.DescarregarCertificado;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  ShowMessage( ACBrRecopi1.SSL.CertSubjectName + sLineBreak + sLineBreak +
               'Razão Social: '+ACBrRecopi1.SSL.CertRazaoSocial);
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  ShowMessage( ACBrRecopi1.SSL.CertCNPJ );
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  ShowMessage( ACBrRecopi1.SSL.CertIssuerName);
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  ShowMessage( ACBrRecopi1.SSL.CertNumeroSerie );
  edtNumSerie.Text:=ACBrRecopi1.SSL.CertNumeroSerie;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  ShowMessage( FormatDateBr(ACBrRecopi1.SSL.CertDataVenc) );
end;

procedure TForm1.sbtnCaminhoCertClick(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione o Certificado';
  OpenDialog1.DefaultExt := '*.pfx';
  OpenDialog1.Filter := 'Arquivos PFX (*.pfx)|*.pfx|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ExtractFileDir(application.ExeName);
  if OpenDialog1.Execute then
  begin
    edtCaminho.Text := OpenDialog1.FileName;
  end;
  GravaConfiguracao;
  LerConfiguracao;
end;

procedure TForm1.sbtnGetCert1Click(Sender: TObject);
var
  I: Integer;
begin
  frSelecionarCertificado := TfrSelecionarCertificado.Create(Self);
  try
    ACBrRecopi1.SSL.LerCertificadosStore;

    For I := 0 to ACBrRecopi1.SSL.ListaCertificados.Count-1 do
    begin
      with ACBrRecopi1.SSL.ListaCertificados[I] do
      begin
        if (CNPJ <> '') then
        begin
          with frSelecionarCertificado.StringGrid1 do
          begin
            RowCount := RowCount + 1;
            Cells[ 0, RowCount-1] := NumeroSerie;
            Cells[ 1, RowCount-1] := RazaoSocial;
            Cells[ 2, RowCount-1] := CNPJ;
            Cells[ 3, RowCount-1] := FormatDateBr(DataVenc);
            Cells[ 4, RowCount-1] := Certificadora;
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

  GravaConfiguracao;
  LerConfiguracao;

end;

procedure TForm1.sbtnGetCertClick(Sender: TObject);
begin
  edtNumSerie.Text := ACBrRecopi1.SSL.SelecionarCertificado;

  GravaConfiguracao;
  LerConfiguracao;
end;

procedure TForm1.sbtnCaminhoCert1Click(Sender: TObject);
begin
  PathClick(edtPathSchemas);
end;

procedure TForm1.sbtnCaminhoCert2Click(Sender: TObject);
begin
  PathClick(edtPathSchemas);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  T: TSSLLib;
  U: TSSLCryptLib;
  V: TSSLHttpLib;
  X: TSSLXmlSignLib;
  Y: TSSLType;
begin

  cbSSLLib.Items.Clear ;
  For T := Low(TSSLLib) to High(TSSLLib) do
    cbSSLLib.Items.Add( GetEnumName(TypeInfo(TSSLLib), integer(T) ) ) ;
  cbSSLLib.ItemIndex := 0 ;

  cbCryptLib.Items.Clear ;
  For U := Low(TSSLCryptLib) to High(TSSLCryptLib) do
    cbCryptLib.Items.Add( GetEnumName(TypeInfo(TSSLCryptLib), integer(U) ) ) ;
  cbCryptLib.ItemIndex := 0 ;

  cbHttpLib.Items.Clear ;
  For V := Low(TSSLHttpLib) to High(TSSLHttpLib) do
    cbHttpLib.Items.Add( GetEnumName(TypeInfo(TSSLHttpLib), integer(V) ) ) ;
  cbHttpLib.ItemIndex := 0 ;

  cbXmlSignLib.Items.Clear ;
  For X := Low(TSSLXmlSignLib) to High(TSSLXmlSignLib) do
    cbXmlSignLib.Items.Add( GetEnumName(TypeInfo(TSSLXmlSignLib), integer(X) ) ) ;
  cbXmlSignLib.ItemIndex := 0 ;

  cbSSLType.Items.Clear ;
  For Y := Low(TSSLType) to High(TSSLType) do
    cbSSLType.Items.Add( GetEnumName(TypeInfo(TSSLType), integer(Y) ) ) ;
  cbSSLType.ItemIndex := 0 ;

  LerConfiguracao;
  
end;

procedure TForm1.AtualizaSSLLibsCombo;
begin
  cbSSLLib.ItemIndex := Integer( ACBrRecopi1.Configuracoes.Geral.SSLLib );
  cbCryptLib.ItemIndex := Integer( ACBrRecopi1.Configuracoes.Geral.SSLCryptLib );
  cbHttpLib.ItemIndex := Integer( ACBrRecopi1.Configuracoes.Geral.SSLHttpLib );
  cbXmlSignLib.ItemIndex := Integer( ACBrRecopi1.Configuracoes.Geral.SSLXmlSignLib );
  cbSSLType.Enabled := (ACBrRecopi1.Configuracoes.Geral.SSLHttpLib in [httpWinHttp, httpOpenSSL]) ;
end;

procedure TForm1.GravaConfiguracao;
var
  IniFile: String;
  Ini: TIniFile;
begin
  IniFile := ChangeFileExt('/tmp/configrecopi', '.ini') ;

  Ini := TIniFile.Create( IniFile );
  try
    Ini.WriteInteger( 'Certificado','SSLLib' , cbSSLLib.ItemIndex) ;
    Ini.WriteInteger( 'Certificado','CryptLib' , cbCryptLib.ItemIndex) ;
    Ini.WriteInteger( 'Certificado','HttpLib' , cbHttpLib.ItemIndex) ;
    Ini.WriteInteger( 'Certificado','XmlSignLib' , cbXmlSignLib.ItemIndex) ;
    Ini.WriteInteger( 'Certificado','XmlSignLib' , cbXmlSignLib.ItemIndex) ;
    Ini.WriteInteger( 'WebService','SSLType' , cbSSLType.ItemIndex) ;
    Ini.WriteInteger( 'WebService','Ambiente'  ,RadioGroup1.ItemIndex) ;
    Ini.WriteString( 'Certificado','Caminho' ,edtCaminho.Text) ;
    Ini.WriteString( 'Certificado','Senha'   ,edtSenha.Text) ;
    Ini.WriteString( 'Certificado','NumSerie',edtNumSerie.Text) ;
    Ini.WriteString( 'Geral','PathSchemas'  ,edtPathSchemas.Text) ;
    Ini.WriteString( 'Geral','PathSalvar'  ,edtPathLogs.Text) ;
  finally
    Ini.Free ;
  end;

end;

procedure TForm1.LerConfiguracao;
var
  IniFile: String ;
  Ini: TIniFile ;
  ok: Boolean;
begin
  IniFile := ChangeFileExt('/tmp/configrecopi', '.ini') ;

  Ini := TIniFile.Create( IniFile );
  try
    cbSSLLib.ItemIndex:= Ini.ReadInteger( 'Certificado','SSLLib' ,0) ;
    cbCryptLib.ItemIndex:= Ini.ReadInteger( 'Certificado','CryptLib' , 0) ;
    cbHttpLib.ItemIndex:= Ini.ReadInteger( 'Certificado','HttpLib' , 0) ;
    cbXmlSignLib.ItemIndex:= Ini.ReadInteger( 'Certificado','XmlSignLib' , 0) ;
    edtCaminho.Text:= Ini.ReadString( 'Certificado','Caminho' ,'') ;
    edtSenha.Text:= Ini.ReadString( 'Certificado','Senha'   ,'') ;
    edtNumSerie.Text:= Ini.ReadString( 'Certificado','NumSerie','') ;
    edtPathSchemas.Text  := Ini.ReadString( 'Geral','PathSchemas'  , '') ;
    edtPathLogs.Text     := Ini.ReadString( 'Geral','PathSalvar'  , '') ;
    cbSSLType.ItemIndex    := Ini.ReadInteger( 'WebService','SSLType' , 0) ;
    RadioGroup1.ItemIndex   := Ini.ReadInteger( 'WebService','Ambiente'  ,0) ;
    with ACBrRecopi1.Configuracoes.Geral do
     begin
       SSLLib                := TSSLLib(cbSSLLib.ItemIndex);
       SSLCryptLib           := TSSLCryptLib(cbCryptLib.ItemIndex);
       SSLHttpLib            := TSSLHttpLib(cbHttpLib.ItemIndex);
       SSLXmlSignLib         := TSSLXmlSignLib(cbXmlSignLib.ItemIndex);

       AtualizaSSLLibsCombo;
     end;
    ACBrRecopi1.Configuracoes.Certificados.ArquivoPFX  := edtCaminho.Text;
    ACBrRecopi1.Configuracoes.Certificados.Senha       := edtSenha.Text;
    ACBrRecopi1.Configuracoes.Certificados.NumeroSerie := edtNumSerie.Text;

    ACBrRecopi1.Configuracoes.Arquivos.Salvar:=True;
    ACBrRecopi1.Configuracoes.Arquivos.PathSalvar:= edtPathLogs.Text;
    ACBrRecopi1.Configuracoes.Arquivos.PathSchemas:= edtPathSchemas.Text;

    ACBrRecopi1.Configuracoes.WebServices.Salvar:=True;
    ACBrRecopi1.Configuracoes.WebServices.AjustaAguardaConsultaRet:=True;
    ACBrRecopi1.Configuracoes.WebServices.AguardarConsultaRet:=5000;
    ACBrRecopi1.Configuracoes.WebServices.Ambiente:= StrToTpAmb(Ok,IntToStr(RadioGroup1.ItemIndex+1));
    ACBrRecopi1.SSL.SSLType := TSSLType( cbSSLType.ItemIndex );
    ACBrRecopi1.SSL.CarregarCertificado;
  finally
    Ini.Free ;
  end;

end;

procedure TForm1.PathClick(Sender: TObject);
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

procedure TForm1.Button2Click(Sender: TObject);
var
  oItemPapel: TItemPapel;
  oListaSolicitacao: TListaSolicitacao;
begin
  LerConfiguracao;
  oListaSolicitacao := TListaSolicitacao.Create;
  with oListaSolicitacao do
    begin
      CFOP:='5101';
      CNPJDestino:='23183669000161';
      CNPJDestinoUF:='SP';
      CNPJOrigem:='62261086000163';
      CNPJOrigemUF:='SP';
      Importacao:=False;
      OrdemJudicial:=False;
      NumeroDI:='';
      NF.DataEmissao:=Now;
      NF.DataEntrada:=Now;
      NF.DataSaida:=Now;
      NF.Numero:=1;
      NF.Serie:=1;
      NF.Valor:=1;
      oItemPapel := TItemPapel.Create;
      oItemPapel.CodigoPapel:='1';
      oItemPapel.Quantidade:=1;
      ListaItens.Add(oItemPapel);
      oItemPapel := TItemPapel.Create;
      oItemPapel.CodigoPapel:='2';
      oItemPapel.Quantidade:=2;
      ListaItens.Add(oItemPapel);
    end;
  ACBrRecopi1.WebServices.PedidoSolicitacao.ListaSolicitacao := oListaSolicitacao;
  ACBrRecopi1.WebServices.PedidoSolicitacao.Executar;
  Memo1.Lines.Add(ACBrRecopi1.WebServices.PedidoSolicitacao.Retorno);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  oInclusaoNF: TInclusaoNF;
begin
  LerConfiguracao;
  oInclusaoNF := TInclusaoNF.Create;
  with oInclusaoNF do
    begin
      CodigoControle:='1';
      NF.DataEmissao:=Now;
      NF.DataEntrada:=Now;
      NF.DataSaida:=Now;
      NF.Numero:=1;
      NF.Serie:=1;
      NF.Valor:=1;
    end;
  ACBrRecopi1.WebServices.PedidoInclusaoNF.InclusaoNF := oInclusaoNF;
  ACBrRecopi1.WebServices.PedidoInclusaoNF.Executar;
  Memo1.Lines.Add(ACBrRecopi1.WebServices.PedidoInclusaoNF.Retorno);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  oItemPapel: TItemPapel;
  oControleEstoque: TControleEstoque;
begin
  LerConfiguracao;
  oControleEstoque := TControleEstoque.Create;
  with oControleEstoque do
    begin
      CNPJ:='1234567890991';
      CNPJUF:='SP';
      TipoInforme:=tiEstoque;
      DataReferencia:=Now;
      TipoDeclaracao:=tdNova;
      Justificativa:='Justificativa';
      oItemPapel := TItemPapel.Create;
      oItemPapel.CodigoPapel:='1';
      oItemPapel.Quantidade:=1;
      oItemPapel.CodigoPapelFinal:='1';
      oItemPapel.TipoPublicacao:=tpLivro;
      oItemPapel.ISBNISSNTitulo:='isbn 1';
      oItemPapel.Tiragem:='tiragem 1';
      ListaItens.Add(oItemPapel);
      oItemPapel := TItemPapel.Create;
      oItemPapel.CodigoPapel:='2';
      oItemPapel.Quantidade:=2;
      oItemPapel.CodigoPapelFinal:='2';
      oItemPapel.TipoPublicacao:=tpJornal;
      oItemPapel.ISBNISSNTitulo:='isbn 2';
      oItemPapel.Tiragem:='tiragem 2';
      ListaItens.Add(oItemPapel);
    end;
  ACBrRecopi1.WebServices.ControleEstoque.ControleEstoque := oControleEstoque;
  ACBrRecopi1.WebServices.ControleEstoque.Executar;
  Memo1.Lines.Add(ACBrRecopi1.WebServices.ControleEstoque.Retorno);
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  oItemPapel: TItemPapel;
  oConfirmaSolicitacao: TConfirmaSolicitacao;
begin
  LerConfiguracao;
  oConfirmaSolicitacao := TConfirmaSolicitacao.Create;
  with oConfirmaSolicitacao do
    begin
      CodigoControle:='1';
      StatusSolicitacao:=tsAceite;
      NFEntrada.DataEntrada:=Now;
      NFComplementar.DataEmissao:=Now;
      NFComplementar.DataEntrada:=Now;
      NFComplementar.DataSaida:=Now;
      NFComplementar.Numero:=1;
      NFComplementar.Serie:=1;
      NFComplementar.Valor:=1;
      oItemPapel := TItemPapel.Create;
      oItemPapel.CodigoPapel:='1';
      oItemPapel.Quantidade:=1;
      oItemPapel.Perda:=1;
      ListaItens.Add(oItemPapel);
      oItemPapel := TItemPapel.Create;
      oItemPapel.CodigoPapel:='2';
      oItemPapel.Quantidade:=2;
      oItemPapel.Perda:=2;
      IdRemessa:='ID4';
      ListaItens.Add(oItemPapel);
    end;
  ACBrRecopi1.WebServices.PedidoConfirmacao.ConfirmaSolicitacao := oConfirmaSolicitacao;
  ACBrRecopi1.WebServices.PedidoConfirmacao.Executar;
  Memo1.Lines.Add(ACBrRecopi1.WebServices.PedidoConfirmacao.Retorno);

end;

end.
