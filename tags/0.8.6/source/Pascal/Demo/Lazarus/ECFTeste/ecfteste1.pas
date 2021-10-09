unit ecfteste1;

{$mode objfpc}{$H+}

interface

uses LResources, Classes, Forms, Menus, StdCtrls, ComCtrls, Controls, StrUtils,
     DateUtils, Types, SysUtils, Graphics, Dialogs, Buttons, ExtCtrls,
   ACBrECF, ACBrBase, ACBrECFClass, ACBrECFBematech, ACBrECFDataRegis , IpHtml,
   ACBrRFD;

type
 TSimpleIpHtml = class(TIpHtml)
  public
    property OnGetImageX;
  end;
  
  { TForm1 }

  TForm1 = class(TForm)
    AbreCupomVinculado1: TMenuItem;
    AbreGaveta1: TMenuItem;
    AbreNoFiscal1: TMenuItem;
    AbreRelatorioGerencial1: TMenuItem;
    AbrirCupom1: TMenuItem;
    Aliquotas1: TMenuItem;
    AliquotasICMS1: TMenuItem;
    Arredonda1: TMenuItem;
    Ativcar1: TMenuItem;
    bAtivar: TButton;
    bBobinaLimpar: TButton;
    bBobinaParams: TButton;
    CancelaCupom1: TMenuItem;
    CancelaImpressoCheque1: TMenuItem;
    CancelaNoFiscal1: TMenuItem;
    CancelarItemVendido1: TMenuItem;
    CapturaporNReduaoZ1: TMenuItem;
    CapturaporPeriodo1: TMenuItem;
    CarregaComprovantesNAOFiscais1: TMenuItem;
    CarregaUnidadesdeMedida1: TMenuItem;
    cbMemoHTML: TCheckBox;
    cbxModelo: TComboBox;
    cbxPorta: TComboBox;
    chArredondaPorQtd: TCheckBox;
    chBloqueia: TCheckBox;
    Cheque1: TMenuItem;
    ChequePronto1: TMenuItem;
    chExibeMsg: TCheckBox;
    chGavetaSinalInvertido: TCheckBox;
    chTentar: TCheckBox;
    CNPJIE1: TMenuItem;
    ComprovantesNaoFiscais1: TMenuItem;
    CopumFiscal1: TMenuItem;
    CorrigeEstadodeErro1: TMenuItem;
    CupomVinculado1: TMenuItem;
    DadosReducaoZ1: TMenuItem;
    DataHora1: TMenuItem;
    Desativar1: TMenuItem;
    Dispositivos1: TMenuItem;
    edIntervaloAposcomando: TEdit;
    edArqLog: TEdit;
    edTimeout: TEdit;
    EfetuaPagamentoNoFiscal1: TMenuItem;
    EfetuarPagamento1: TMenuItem;
    EnviaComando1: TMenuItem;
    Equipamento1: TMenuItem;
    Estado1: TMenuItem;
    FechaNoFiscal1: TMenuItem;
    FecharCupom1: TMenuItem;
    FechaRelatrio1: TMenuItem;
    Flags1: TMenuItem;
    FormasdePagamento1: TMenuItem;
    FormasdePagamento2: TMenuItem;
    Gaveta1: TMenuItem;
    GavetaAberta1: TMenuItem;
    GrandeTotal1: TMenuItem;
    HorarioVerao1: TMenuItem;
    HorarioVerao2: TMenuItem;
    ImpactoAgulhas1: TMenuItem;
    ImprimeCheque1: TMenuItem;
    ImprimeLinhaRelatorio1: TMenuItem;
    ImprimeLinhaVinculado1: TMenuItem;
    ImprimeporNReduaoZ1: TMenuItem;
    ImprimeporPeriodo1: TMenuItem;
    IpHtmlBobina: TIpHtmlPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    LeituradeMemoriaFiscal1: TMenuItem;
    LeituraMFD1: TMenuItem;
    LeituraX1: TMenuItem;
    LerTodasasVariveis1: TMenuItem;
    LerTotaisAliquotas1: TMenuItem;
    LerTotaisComprovanetNaoFiscal1: TMenuItem;
    LerTotaisFormadePagamento1: TMenuItem;
    ListaCupomVinculado1: TMenuItem;
    ListaRelatorioGerencial1: TMenuItem;
    MainMenu1: TMainMenu;
    MapaResumo1: TMenuItem;
    mBobina: TMemo;
    mEnviado: TMemo;
    MFD1: TMenuItem;
    mMsg: TMemo;
    mResp: TMemo;
    MudaArredondamento1: TMenuItem;
    N1: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N2: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    NoFiscal1: TMenuItem;
    NoFiscalCompleto1: TMenuItem;
    NSrie1: TMenuItem;
    NUltimoCupom1: TMenuItem;
    NumCOOInicial1: TMenuItem;
    NumCRO1: TMenuItem;
    NumCRZ1: TMenuItem;
    NumECF1: TMenuItem;
    NumLoja1: TMenuItem;
    NVerso1: TMenuItem;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    PorCOO1: TMenuItem;
    PorPeriodo1: TMenuItem;
    PoucoPapel1: TMenuItem;
    Principal1: TMenuItem;
    ProgramaAliquota1: TMenuItem;
    ProgramaComprovanteNAOFiscal1: TMenuItem;
    ProgramaFormadePagamento1: TMenuItem;
    ProgramaUnidadeMedida1: TMenuItem;
    PularLinhas1: TMenuItem;
    ReduoZ1: TMenuItem;
    RegistraItemNoFiscal1: TMenuItem;
    RelatorioGerencial1: TMenuItem;
    Relatrios1: TMenuItem;
    Sair1: TMenuItem;
    Sobre1: TMenuItem;
    SpeedButton1: TSpeedButton;
    StatusBar1: TStatusBar;
    Sub1: TMenuItem;
    SubTotal1: TMenuItem;
    SubTotalizaNoFiscal1: TMenuItem;
    Termica1: TMenuItem;
    TestaPodeAbrirCupom1: TMenuItem;
    Testar1: TMenuItem;
    TestedeVelocidade1: TMenuItem;
    TotalAcrescimos1: TMenuItem;
    TotalCancelamentos1: TMenuItem;
    TotalDescontos1: TMenuItem;
    TotalIsencao1: TMenuItem;
    TotalNaoTributado1: TMenuItem;
    TotalPago1: TMenuItem;
    TotalSubstituicaoTributaria1: TMenuItem;
    tsRespostas: TTabSheet;
    tsBobina: TTabSheet;
    ACBrECF1: TACBrECF;
    Utilitrios1: TMenuItem;
    Variaveis1: TMenuItem;
    Variveis1: TMenuItem;
    VendaBruta1: TMenuItem;
    VenderItem1: TMenuItem;
    procedure AbreCupomVinculado1Click(Sender: TObject);
    procedure AbreNoFiscal1Click(Sender: TObject);
    procedure AbreRelatorioGerencial1Click(Sender: TObject);
    procedure ACBrECF1BobinaAdicionaLinhas(const Linhas: String;
      const Operacao: String);
    procedure CancelaNoFiscal1Click(Sender: TObject);
    procedure CNPJIE1Click(Sender: TObject);
    procedure DadosReducaoZ1Click(Sender: TObject);
    procedure EfetuaPagamentoNoFiscal1Click(Sender: TObject);
    procedure FechaNoFiscal1Click(Sender: TObject);
    procedure GrandeTotal1Click(Sender: TObject);
    procedure ImprimeLinhaRelatorio1Click(Sender: TObject);
    procedure ImprimeLinhaVinculado1Click(Sender: TObject);
    procedure LerTodasasVariveis1Click(Sender: TObject);
    procedure LerTotaisAliquotas1Click(Sender: TObject);
    procedure LerTotaisComprovanetNaoFiscal1Click(Sender: TObject);
    procedure LerTotaisFormadePagamento1Click(Sender: TObject);
    procedure ListaCupomVinculado1Click(Sender: TObject);
    procedure ListaRelatorioGerencial1Click(Sender: TObject);
    procedure MFD1Click(Sender: TObject);
    procedure NoFiscalCompleto1Click(Sender: TObject);
    procedure NumCOOInicial1Click(Sender: TObject);
    procedure NumCRZ1Click(Sender: TObject);
    procedure PopupNotifier1Close(Sender: TObject; var CloseAction: TCloseAction
      );
    procedure PorCOO1Click(Sender: TObject);
    procedure PorPeriodo1Click(Sender: TObject);
    procedure PularLinhas1Click(Sender: TObject);
    procedure RegistraItemNoFiscal1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure bBobinaLimparClick(Sender: TObject);
    procedure bBobinaParamsClick(Sender: TObject);
    procedure cbMemoHTMLChange(Sender: TObject);
    procedure cbxModeloChange(Sender: TObject);
    procedure chGavetaSinalInvertido1Change(Sender: TObject);
    procedure edIntervaloAposcomandoChange(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure bAtivarClick(Sender: TObject);
    procedure cbxPortaChange(Sender: TObject);
    procedure Ativcar1Click(Sender: TObject);
    procedure Desativar1Click(Sender: TObject);
    procedure chTentarClick(Sender: TObject);
    procedure chBloqueiaClick(Sender: TObject);
    procedure chExibeMsgClick(Sender: TObject);
    procedure edTimeoutChange(Sender: TObject);
    procedure mMsgChange(Sender: TObject);
    procedure SubTotalizaNoFiscal1Click(Sender: TObject);
    procedure Termica1Click(Sender: TObject);
    procedure Testar1Click(Sender: TObject);
    procedure ACBrECF1MsgAguarde(Mensagem : String);
    procedure DataHora1Click(Sender: TObject);
    procedure NumECF1Click(Sender: TObject);
    procedure NSrie1Click(Sender: TObject);
    procedure NVerso1Click(Sender: TObject);
    procedure NumUltimoCupom1Click(Sender: TObject);
    procedure PoucoPapel1Click(Sender: TObject);
    procedure Estado1Click(Sender: TObject);
    procedure LeituraX1Click(Sender: TObject);
    procedure ReduoZ1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure AliquotasICMS1Click(Sender: TObject);
    procedure FormasdePagamento1Click(Sender: TObject);
    procedure AbreGaveta1Click(Sender: TObject);
    procedure GavetaAberta1Click(Sender: TObject);
    procedure ChequePronto1Click(Sender: TObject);
    procedure CancelaImpressoCheque1Click(Sender: TObject);
    procedure HorarioVerao1Click(Sender: TObject);
    procedure ImpactoAgulhas1Click(Sender: TObject);
    procedure TestaPodeAbrirCupom1Click(Sender: TObject);
    procedure NUltimoCupom1Click(Sender: TObject);
    procedure SubTotal1Click(Sender: TObject);
    procedure TotalAcrescimos1Click(Sender: TObject);
    procedure TotalCancelamentos1Click(Sender: TObject);
    procedure TotalDescontos1Click(Sender: TObject);
    procedure TotalIsencao1Click(Sender: TObject);
    procedure TotalNaoTributado1Click(Sender: TObject);
    procedure TotalPago1Click(Sender: TObject);
    procedure AbrirCupom1Click(Sender: TObject);
    procedure CancelaCupom1Click(Sender: TObject);
    procedure TotalSubstituicaoTributaria1Click(Sender: TObject);
    procedure VendaBruta1Click(Sender: TObject);
    procedure VenderItem1Click(Sender: TObject);
    procedure CancelarItemVendido1Click(Sender: TObject);
    procedure Sub1Click(Sender: TObject);
    procedure EfetuarPagamento1Click(Sender: TObject);
    procedure FecharCupom1Click(Sender: TObject);
    procedure EnviaComando1Click(Sender: TObject);
    procedure ACBrECF1AguardandoRespostaChange(Sender: TObject);
    procedure CarregaComprovantesNAOFiscais1Click(Sender: TObject);
    procedure FechaRelatrio1Click(Sender: TObject);
    procedure HorarioVerao2Click(Sender: TObject);
    procedure Arredonda1Click(Sender: TObject);
    procedure MudaArredondamento1Click(Sender: TObject);
    procedure NumLoja1Click(Sender: TObject);
    procedure NumCRO1Click(Sender: TObject);
    procedure TestedeVelocidade1Click(Sender: TObject);
    procedure chArredondaPorQtdClick(Sender: TObject);
    procedure CapturaporNReduaoZ1Click(Sender: TObject);
    procedure ImprimeporNReduaoZ1Click(Sender: TObject);
    procedure CapturaporPeriodo1Click(Sender: TObject);
    procedure ImprimeporPeriodo1Click(Sender: TObject);
    procedure ProgramaAliquota1Click(Sender: TObject);
    procedure ProgramaComprovanteNAOFiscal1Click(Sender: TObject);
    procedure ACBrECF1MsgPoucoPapel(Sender: TObject);
    procedure ProgramaFormadePagamento1Click(Sender: TObject);
    procedure CorrigeEstadodeErro1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ImprimeCheque1Click(Sender: TObject);
    procedure CarregaUnidadesdeMedida1Click(Sender: TObject);
    procedure ProgramaUnidadeMedida1Click(Sender: TObject);
  private
    { Private declarations }
    Function Converte( cmd : String) : String;
    procedure TrataErros(Sender: TObject; E: Exception);

    procedure HTMLGetImageX(Sender: TIpHtmlNode; const URL: string;
      var Picture: TPicture);
    procedure WB_LoadHTML(IpHtmlPanel: TIpHtmlPanel; HTMLCode: string);
  public
    { Public declarations }
    Procedure AtualizaMemos(VerificaEstado : Boolean = true) ;
  end;

const Estados : array[TACBrECFEstado] of string =
  ('Não Inicializada', 'Desconhecido', 'Livre', 'Venda',
   'Pagamento', 'Relatório', 'Bloqueada', 'Requer Z', 'Requer X', 'Não Fiscal' );

var
  Form1: TForm1;

implementation

uses ACBrUtil, Math, vendeitem, efetuapagamento, relatorio, TypInfo;

procedure TForm1.FormCreate(Sender: TObject);
Var I : TACBrECFModelo ;
begin
  cbxModelo.Items.Clear ;
  For I := Low(TACBrECFModelo) to High(TACBrECFModelo) do
     cbxModelo.Items.Add( GetEnumName(TypeInfo(TACBrECFModelo), integer(I) ) ) ;
  cbxModelo.Items[0] := 'Procurar' ;
  cbxModelo.ItemIndex := 0 ;
  cbxPorta.Text := 'Procurar' ;
  
  PageControl1.ActivePage := tsRespostas ;
  
  Application.OnException := @TrataErros ;
  
  if FileExists('ACBrECFMemoParams.ini') then
     ACBrECF1.MemoParams.LoadFromFile('ACBrECFMemoParams.ini');

  cbMemoHTML.Checked := ( ACBrECF1.MemoParams.Values['HTML'] = '1' ) ;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  mMsgChange( Sender );
end;

{-----------------------------------------------------------------------------}
Procedure TForm1.TrataErros(Sender: TObject; E: Exception);
begin
  mResp.Lines.Add( E.Message );
  AtualizaMemos( false ) ;
//  MessageDlg( E.Message,mtError,[mbOk],0) ;
end ;

procedure TForm1.AtualizaMemos(VerificaEstado : Boolean = true) ;
begin
  mEnviado.Text := Converte( ACBrECF1.ComandoEnviado );
  mResp.Lines.Add( Converte( ACBrECF1.RespostaComando) );
  mResp.Lines.Add('- + - + - + - + - + - + - + - + - + - + - + -') ;
  if VerificaEstado then
     try
        StatusBar1.Panels[0].Text :=  Estados[ ACBrECF1.Estado ] ;
        { GetEnumName(TypeInfo(TACBrECFEstado), integer( ACBrECF1.Estado ) ) ;}
     except
     end ;
end;

function TForm1.Converte(cmd: String): String;
var A : Integer ;
begin
  Result := '' ;                                    
  For A := 1 to length( cmd ) do
  begin
     if (Ord(cmd[A]) < 32) or (Ord(cmd[A]) > 127) then
        Result := Result + '#' + IntToStr(ord( cmd[A] ))
     else
        Result := Result + cmd[A] ;
  end ;
end;

procedure TForm1.cbxModeloChange(Sender: TObject);
begin
  try
     ACBrECF1.Modelo := TACBrECFModelo( cbxModelo.ItemIndex ) ;
  except
     cbxModelo.ItemIndex := Integer( ACBrECF1.Modelo ) ;
     raise ;
  end ;
end;

procedure TForm1.cbMemoHTMLChange(Sender: TObject);
begin
  if cbMemoHTML.Checked then
     ACBrECF1.MemoParams.Values['HTML'] := '1'
  else
     ACBrECF1.MemoParams.Values['HTML'] := '0' ;

  IpHtmlBobina.Visible := cbMemoHTML.Checked ;
  mBobina.Visible      := not cbMemoHTML.Checked ;
end;

procedure TForm1.bBobinaParamsClick(Sender: TObject);
begin
  if bBobinaParams.Caption = 'Parametros' then
   begin
     mBobina.Text := ACBrECF1.MemoParams.Text ;
     mBobina.Visible  := True ;
     IpHtmlBobina.Visible  := False ;
     bBobinaParams.Caption := 'Salvar' ;
   end
  else
   begin
     ACBrECF1.MemoParams.Text := mBobina.Text ;
     ACBrECF1.MemoParams.SaveToFile('ACBrECFMemoParams.ini');
     cbMemoHTMLChange(Sender);
     bBobinaParams.Caption := 'Parametros' ;
     bBobinaLimpar.Click ;
   end ;
end;

procedure TForm1.bBobinaLimparClick(Sender: TObject);
begin
  WB_LoadHTML(IpHtmlBobina, '');
  mBobina.Clear ;
  if bBobinaParams.Caption = 'Salvar' then
  begin
     cbMemoHTMLChange(Sender);
     bBobinaParams.Caption := 'Parametros' ;
  end ;
end;

procedure TForm1.ACBrECF1BobinaAdicionaLinhas(const Linhas: String;
  const Operacao: String);
begin
  if bBobinaParams.Caption = 'Salvar' then
  begin
     mBobina.Clear ;
     cbMemoHTMLChange(nil);
     bBobinaParams.Caption := 'Parametros' ;
  end ;

  WB_LoadHTML(IpHtmlBobina, mBobina.Text);
  Application.ProcessMessages ;

  IpHtmlBobina.Scroll(hsaEnd);
end;

procedure TForm1.CancelaNoFiscal1Click(Sender: TObject);
begin
  ACBrECF1.CancelaNaoFiscal ;
  mResp.Lines.Add( 'Cancela Não Fiscal' );
  AtualizaMemos ;
end;

procedure TForm1.AbreRelatorioGerencial1Click(Sender: TObject);
begin
  ACBrECF1.AbreRelatorioGerencial ;
end;

procedure TForm1.AbreCupomVinculado1Click(Sender: TObject);
Var COO, CodFormaPagamento, CodComprovanteNaoFiscal : String;
    sValor : String ;
    dValor : Double ;
begin
  COO := ACBrECF1.NumCupom ;
  CodFormaPagamento := '01' ;
  CodComprovanteNaoFiscal := ' ' ;
  sValor := '0' ;

  if not InputQuery('Abertura de Cupom Vinculado',
                    'Digite o Cod.Forma Pagamento utilizada no cupom anterior',
                    CodFormaPagamento ) then
     exit ;

  if not InputQuery('Abertura de Cupom Vinculado',
                    'Digite o Cod.Comprovante Não Fiscal'+sLineBreak+
                    '(Não é necessário na maioria dos modelos)',
                     CodComprovanteNaoFiscal ) then
     exit ;

  if not InputQuery('Abertura de Cupom Vinculado',
                    'Digite o Valor a vincular no cupom anterior'+sLineBreak+
                    '(Não é necessário em alguns modelos)',
                    sValor ) then
     exit ;


  sValor := StringReplace(StringReplace(sValor,'.',DecimalSeparator,[]),
                                               ',',DecimalSeparator,[]) ;
  dValor := StrToFloatDef(sValor,0) ;
  if dValor = 0 then
     exit ;

  if Trim(CodComprovanteNaoFiscal) <> '' then
     ACBrECF1.AbreCupomVinculado( COO,CodFormaPagamento,CodComprovanteNaoFiscal,
                                  dValor)
  else
     ACBrECF1.AbreCupomVinculado(COO,CodFormaPagamento,dValor) ;
end;

procedure TForm1.AbreNoFiscal1Click(Sender: TObject);
  Var CPF_CNPJ : String ;
begin
  if not InputQuery('Abre Comprovante Não Fiscal',
                    'Se necessário, informe o CPF ou CNPJ do cliente', CPF_CNPJ ) then
     exit ;

  ACBrECF1.AbreNaoFiscal(CPF_CNPJ);
  mResp.Lines.Add( 'Abre Não Fiscal: '+ CPF_CNPJ );
  AtualizaMemos ;
end;

procedure TForm1.CNPJIE1Click(Sender: TObject);
begin
  mResp.Lines.Add( 'CNPJ: ('+ ACBrECF1.CNPJ+')' );
  AtualizaMemos ;
end;

procedure TForm1.DadosReducaoZ1Click(Sender: TObject);
begin
  mResp.Lines.Add( 'Dados da Redução Z' + sLineBreak + ACBrECF1.DadosReducaoZ );
  AtualizaMemos ;
end;

procedure TForm1.EfetuaPagamentoNoFiscal1Click(Sender: TObject);
begin
  frPagamento.Show ;
  frPagamento.TipoCupom := 'N' ;
end;

procedure TForm1.FechaNoFiscal1Click(Sender: TObject);
Var Obs : String ;
begin
  Obs := 'Componentes ACBr|http://acbr.sourceforge.net' ;
  if InputQuery('Fecha Não Fiscal',
                'Se Necessário digite alguma Observaçao (até 8 linhas)'+#10+
                'O sinal | (pipe) será convertido para #10 (quebra de linha)' ,
                Obs ) then
  begin
     Obs := StringReplace(Obs,'|',#10,[rfReplaceAll,rfIgnoreCase]) ;
     ACBrECF1.FechaNaoFiscal( Obs );
     mResp.Lines.Add( 'Fecha Não Fiscal: '+#10+Obs );
     AtualizaMemos ;
  end ;
end;

procedure TForm1.GrandeTotal1Click(Sender: TObject);
begin
  mResp.Lines.Add( 'VendaBruta: ('+ FloatToStr(ACBrECF1.VendaBruta)+')' );
  AtualizaMemos ;
end;

procedure TForm1.ImprimeLinhaRelatorio1Click(Sender: TObject);
var
   Linha :String;
begin
  if not InputQuery('Inpressão de Linha N+O Fiscal',
                    'Digite a linha a imprimir',
                    Linha ) then
     exit ;
  ACBrECF1.LinhaRelatorioGerencial( Linha );
end;

procedure TForm1.ImprimeLinhaVinculado1Click(Sender: TObject);
var
   Linha :String;
begin
  if not InputQuery('Digite a linha a imprimir',
                    '', Linha ) then
     exit ;
  ACBrECF1.LinhaCupomVinculado( Linha );
end;

procedure TForm1.LerTodasasVariveis1Click(Sender: TObject);
begin
  DataHora1.Click ;
  NumECF1.Click ;
  NumLoja1.Click ;
  NSrie1.Click ;
  NVerso1.Click ;
  NumCRO1.Click ;
  NUltimoCupom1.Click ;
  SubTotal1.Click ;
  TotalPago1.Click ;

  PoucoPapel1.Click ;
  HorarioVerao2.Click ;
  Arredonda1.Click ;

  AliquotasICMS1.Click ;
  FormasdePagamento1.Click ;
  CarregaComprovantesNAOFiscais1.Click ;
  CarregaUnidadesdeMedida1.Click ;
end;

procedure TForm1.LerTotaisAliquotas1Click(Sender: TObject);
Var A : Integer ;
begin
  ACBrECF1.LerTotaisAliquota ;

  for A := 0 to ACBrECF1.Aliquotas.Count -1 do
  begin
     mResp.Lines.Add( 'Aliquota: '+ACBrECF1.Aliquotas[A].Indice +' - '+
                      FloatToStr( ACBrECF1.Aliquotas[A].Aliquota ) + ' Tipo: '+
                      ACBrECF1.Aliquotas[A].Tipo+ ' -> '+
                      FloatToStr( ACBrECF1.Aliquotas[A].Total ) );
  end ;
  mResp.Lines.Add('---------------------------------');
end;

procedure TForm1.LerTotaisComprovanetNaoFiscal1Click(Sender: TObject);
var A : Integer ;
begin
  ACBrECF1.LerTotaisComprovanteNaoFiscal ;

  for A := 0 to ACBrECF1.ComprovantesNaoFiscais.Count -1 do
  begin
     if ACBrECF1.ComprovantesNaoFiscais[A].Descricao <> '' then
        mResp.Lines.Add( 'CNF: '+ACBrECF1.ComprovantesNaoFiscais[A].Indice+' - '+
           ACBrECF1.ComprovantesNaoFiscais[A].Descricao+' -> '+
           FloatToStr(ACBrECF1.ComprovantesNaoFiscais[A].Total)) ;
  end ;
  mResp.Lines.Add('---------------------------------');
end;

procedure TForm1.LerTotaisFormadePagamento1Click(Sender: TObject);
var A : Integer ;
begin
  ACBrECF1.LerTotaisFormaPagamento ;

  for A := 0 to ACBrECF1.FormasPagamento.Count -1 do
  begin
     if ACBrECF1.FormasPagamento[A].Descricao <> '' then
        mResp.Lines.Add( 'Forma Pagto: '+ACBrECF1.FormasPagamento[A].Indice+' - '+
           ACBrECF1.FormasPagamento[A].Descricao+'  -> '+
           FloatToStr(ACBrECF1.FormasPagamento[A].Total)) ;
  end ;
  mResp.Lines.Add('---------------------------------');
end;

procedure TForm1.ListaCupomVinculado1Click(Sender: TObject);
begin
  MessageDlg('Para imprimir um Cupom Vinculado você deve ter '+
             'informaçoes dos Pagamentos Efetuados no último Cupom Fiscal',
             mtInformation,[mbOk],0) ;
  frRelatorio.TipoRelatorio := 'V' ;
  frRelatorio.ShowModal ;
end;

procedure TForm1.ListaRelatorioGerencial1Click(Sender: TObject);
begin
  frRelatorio.TipoRelatorio := 'G' ;
  frRelatorio.ShowModal ;
end;

procedure TForm1.MFD1Click(Sender: TObject);
Var Msg : String ;
begin
  If ACBrECF1.MFD then Msg := 'SIM' else Msg := 'NAO' ;
  mResp.Lines.Add( 'É MFD: '+ Msg );
  AtualizaMemos ;
end;

procedure TForm1.NoFiscalCompleto1Click(Sender: TObject);
  Var Valor, CodCNF, CodFPG : String ;
begin
  CodCNF := '01' ;
  CodFPG := '01' ;
  Valor  := '0' ;

  if not InputQuery('Comprovante Não Fiscal Completo',
                    'Entre com o indice do Comprovante Não Fiscal', CodCNF ) then
     exit ;

  if not InputQuery('Comprovante Não Fiscal Completo',
                    'Entre com o Valor do Comprovante Não Fiscal', Valor ) then
     exit ;

  if not InputQuery('Comprovante Não Fiscal Completo',
                    'Entre com o indice da Forma de Pagamento', CodFPG ) then
     exit ;

  ACBrECF1.NaoFiscalCompleto(CodCNF, StrToFloatDef( Valor,0 ), CodFPG,
     'TESTE DE COMPROVANTE NAO FISCAL');
  mResp.Lines.Add( 'Nao Fiscal Completo: '+ CodCNF +' '+ Valor+' '+
                   CodFPG );
  AtualizaMemos ;
end;

procedure TForm1.NumCOOInicial1Click(Sender: TObject);
begin
  mResp.Lines.Add( 'Num NumCOOInicial: ('+ ACBrECF1.NumCOOInicial+')' );
  AtualizaMemos ;
end;

procedure TForm1.NumCRZ1Click(Sender: TObject);
begin
  mResp.Lines.Add( 'Num CRZ: ('+ ACBrECF1.NumCRZ+')' );
  AtualizaMemos ;
end;

procedure TForm1.PopupNotifier1Close(Sender: TObject;
  var CloseAction: TCloseAction);
begin

end;

procedure TForm1.PorCOO1Click(Sender: TObject);
Var Linhas : TStringList ;
    cCOOIni, cCOOFim : String ;
    I, nCOOIni, nCOOFim : Integer ;
begin
  cCOOIni := '0' ;
  cCOOFim := '0' ;

  if not InputQuery('Captura da MFD',
                'Entre com o COO Inicial:', cCOOIni ) then
     exit ;
  nCOOIni := StrToIntDef(cCOOIni,-1) ;
  if nCOOIni < 0 then exit ;

  if not InputQuery('Captura da MFD',
                'Entre com o COO Final:', cCOOFim ) then
     exit ;
  nCOOFim := StrToIntDef(cCOOFim,-1) ;
  if nCOOFim < 0 then exit ;

  Linhas := TStringList.Create ;
  try
     ACBrECF1.LeituraMFDSerial(nCOOIni, nCOOFim, Linhas);

     For I := 0 to Linhas.Count - 1 do
        mResp.Lines.Add(Linhas[I]) ;
  finally
     Linhas.Free ;
  end ;
  mResp.Lines.Add('---------------------------------');
end;

procedure TForm1.PorPeriodo1Click(Sender: TObject);
Var Linhas : TStringList ;
    cDatIni, cDatFim : String ;
    dDatIni, dDatFim : TDateTime ;
    I : Integer ;
begin
  cDatIni := '01/'+FormatDateTime('mm/yy',now) ;
  cDatFim := FormatDateTime('dd/mm/yy',now) ;

  if not InputQuery('Captura da MFD',
                'Entre com o a Data Inicial (DD/MM/AA):', cDatIni ) then
     exit ;
  try
     dDatIni := StrToDateTime( StringReplace(cDatIni,'/', DateSeparator,
                                [rfReplaceAll] ) ) ;
  except
     exit ;
  end ;

  if not InputQuery('Captura da MFD',
                'Entre com o a Data Final (DD/MM/AA):', cDatFim ) then
     exit ;
  try
     dDatFim := StrToDateTime( StringReplace(cDatFim,'/', DateSeparator,
                                [rfReplaceAll] ) ) ;
  except
     exit
  end ;

  Linhas := TStringList.Create ;
  try
     ACBrECF1.LeituraMFDSerial(dDatIni, dDatFim, Linhas);

     For I := 0 to Linhas.Count - 1 do
        mResp.Lines.Add(Linhas[I]) ;
  finally
     Linhas.Free ;
  end ;
  mResp.Lines.Add('---------------------------------');
end;

procedure TForm1.PularLinhas1Click(Sender: TObject);
Var Linhas : String ;
begin
  Linhas := IntToStr( ACBrECF1.LinhasEntreCupons ) ;
  if not InputQuery('Pular Linhas',
                    'Digite o Numero de Linhas a Pular', Linhas ) then
     exit ;

  ACBrECF1.PulaLinhas( StrToIntDef(Linhas,0) ) ;
end;

procedure TForm1.RegistraItemNoFiscal1Click(Sender: TObject);
  Var Valor, CodCNF : String ;
begin
  CodCNF := '01' ;
  Valor  := '0' ;

  if not InputQuery('Registra Item Não Fiscal',
                    'Entre com o indice do Comprovante Não Fiscal', CodCNF ) then
     exit ;

  if not InputQuery('Registra Item Não Fiscal',
                    'Entre com o Valor do Comprovante Não Fiscal', Valor ) then
     exit ;

  ACBrECF1.RegistraItemNaoFiscal(CodCNF, StrToFloatDef(Valor,0),
     'TESTE DE COMPROVANTE NAO FISCAL');
  mResp.Lines.Add( 'Registra Item Nao Fiscal: '+ CodCNF +' '+ Valor );
  AtualizaMemos ;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  OpenURL( ExtractFilePath( Application.ExeName )+edArqLog.Text);
end;

procedure TForm1.chGavetaSinalInvertido1Change(Sender: TObject);
begin
  ACBrECF1.GavetaSinalInvertido := chGavetaSinalInvertido.Checked ;
end;

procedure TForm1.edIntervaloAposcomandoChange(Sender: TObject);
begin
  ACBrECF1.IntervaloAposComando := StrToIntDef(edIntervaloAposcomando.Text, ACBrECF1.IntervaloAposComando ) ;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  DataHora1.Click ;
  NumECF1.Click ;
  NumLoja1.Click ;
  NSrie1.Click ;
  NVerso1.Click ;
  NumCRO1.Click ;
  NUltimoCupom1.Click ;
  SubTotal1.Click ;
  TotalPago1.Click ;

  PoucoPapel1.Click ;
  HorarioVerao2.Click ;
  Arredonda1.Click ;

  AliquotasICMS1.Click ;
  FormasdePagamento1.Click ;
  CarregaComprovantesNAOFiscais1.Click ;
  CarregaUnidadesdeMedida1.Click ;

  Estado1.Click ;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
Var Msg : String ;
begin
  If ACBrECF1.MFD then Msg := 'SIM' else Msg := 'NAO' ;
  mResp.Lines.Add( 'É MFD: '+ Msg );
  AtualizaMemos ;
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
Var Msg : String ;
begin
  If ACBrECF1.Termica then Msg := 'SIM' else Msg := 'NAO' ;
  mResp.Lines.Add( 'É Termica: '+ Msg ) ;
  AtualizaMemos ;
end;

procedure TForm1.Sair1Click(Sender: TObject);
begin
  close ;
end;

procedure TForm1.bAtivarClick(Sender: TObject);
begin
  if bAtivar.Caption = 'Ativar' then
     Ativcar1Click( Sender )
  else
     Desativar1Click( Sender );
end;

procedure TForm1.cbxPortaChange(Sender: TObject);
begin
  try
    ACBrECF1.Porta := cbxPorta.Text ;
  finally
     cbxPorta.Text := ACBrECF1.Porta ;
  end ;
end;

procedure TForm1.Ativcar1Click(Sender: TObject);
begin
  try
     if cbxModelo.ItemIndex = 0 then
        if not ACBrECF1.AcharECF(true,False) then
        begin
           MessageDlg('Nenhum ECF encontrado.',mtInformation,[mbOk],0) ;
           exit ;
        end ;

     ACBrECF1.Ativar ;
     bAtivar.Caption := 'Desativar' ;
     mResp.Lines.Add( 'Ativar' );
     AtualizaMemos ;
  finally
     cbxModelo.ItemIndex := Integer(ACBrECF1.Modelo) ;
     cbxPorta.Text       := ACBrECF1.Porta ;
  end ;
end;

procedure TForm1.Desativar1Click(Sender: TObject);
begin
  ACBrECF1.Desativar ;
  bAtivar.Caption := 'Ativar' ;
  mResp.Lines.Add( 'Desativar' );
  AtualizaMemos ;
end;

procedure TForm1.chTentarClick(Sender: TObject);
begin
  ACBrECF1.ReTentar := chTentar.Checked ;
end;

procedure TForm1.chBloqueiaClick(Sender: TObject);
begin
  ACBrECF1.BloqueiaMouseTeclado := chBloqueia.Checked ;
end;

procedure TForm1.chExibeMsgClick(Sender: TObject);
begin
  ACBrECF1.ExibeMensagem := chExibeMsg.Checked ;
end;

procedure TForm1.chArredondaPorQtdClick(Sender: TObject);
begin
  ACBrECF1.ArredondaPorQtd := chArredondaPorQtd.Checked ;
end;

procedure TForm1.edTimeoutChange(Sender: TObject);
begin
  ACBrECF1.TimeOut := StrToIntDef(edTimeout.Text, ACBrECF1.TimeOut ) ;
end;

procedure TForm1.mMsgChange(Sender: TObject);
Var Msg : String ;
    L : Integer ;
begin
  Msg := '' ;
  For L := 0 to mMsg.Lines.Count - 1 do
  begin
     Msg := Msg + mMsg.Lines[L]+#10
  end ;

  ACBrECF1.MsgAguarde := copy(Msg, 1, Length(Msg)-1 ) ;
end;

procedure TForm1.SubTotalizaNoFiscal1Click(Sender: TObject);
Var Desc : String ;
begin
  Desc := '0' ;

  if InputQuery('Subtotaliza Não Fiscal',
                'Digite Valor negativo para Desconto'+#10+
                'ou Valor Positivo para Acrescimo' , Desc ) then
  begin
     ACBrECF1.SubtotalizaNaoFiscal( StrToFloat(Desc) );
     mResp.Lines.Add( 'Subtotaliza Não Fiscal '+ Desc );
     AtualizaMemos ;
  end ;
end;

procedure TForm1.Termica1Click(Sender: TObject);
Var Msg : String ;
begin
  If ACBrECF1.Termica then Msg := 'SIM' else Msg := 'NAO' ;
  mResp.Lines.Add( 'É Termica: '+Msg ) ;
  AtualizaMemos ;
end;

procedure TForm1.Testar1Click(Sender: TObject);
begin
  ACBrECF1.TestarDialog ;
  AtualizaMemos ;
end;

procedure TForm1.ACBrECF1MsgAguarde(Mensagem : String);
begin
  StatusBar1.Panels[1].Text := StringReplace(Mensagem,#10,' ',[rfReplaceAll]) ;
end;

procedure TForm1.DataHora1Click(Sender: TObject);
begin
  mResp.Lines.Add( 'Data/Hora: '+ DateTimeToStr( ACBrECF1.DataHora ) ) ;
  AtualizaMemos ;
end;

procedure TForm1.NumECF1Click(Sender: TObject);
begin
  mResp.Lines.Add( 'N.ECF: ('+ ACBrECF1.NumECF+')' );
  AtualizaMemos ;
end;

procedure TForm1.NSrie1Click(Sender: TObject);
begin
  mResp.Lines.Add( 'N.Série: ('+ ACBrECF1.NumSerie+')' );
  AtualizaMemos ;
end;

procedure TForm1.NVerso1Click(Sender: TObject);
begin
  mResp.Lines.Add( 'N.Versão: '+ ACBrECF1.NumVersao );
  AtualizaMemos ;
end;

procedure TForm1.NumUltimoCupom1Click(Sender: TObject);
begin
  mResp.Lines.Add( 'N.Último Cupom: ('+ ACBrECF1.NumCupom+')' );
  AtualizaMemos ;
end;

procedure TForm1.PoucoPapel1Click(Sender: TObject);
Var Msg : String ;
begin
 if ACBrECF1.PoucoPapel then Msg := 'SIM' else Msg := 'NAO' ;
 
  mResp.Lines.Add( 'Pouco Papel: '+Msg );
  AtualizaMemos ;
end;

procedure TForm1.Estado1Click(Sender: TObject);
begin
  mResp.Lines.Add( 'Estado: '+ Estados[ ACBrECF1.Estado ] );
  AtualizaMemos ;
end;

procedure TForm1.LeituraX1Click(Sender: TObject);
begin
  ACBrECF1.LeituraX ;
  mResp.Lines.Add( 'Leitura X');
  AtualizaMemos ;
end;

procedure TForm1.ReduoZ1Click(Sender: TObject);
Var Resp : TModalResult ;
begin
  if ACBrECF1.Estado <> estRequerZ then
  begin
     if MessageDlg('A Redução Z pode Bloquear o seu ECF até a 12:00pm'+#10+#10+
                  'Continua assim mesmo ?',mtWarning,mbYesNoCancel,0) <> mrYes then
        exit ;

     if MessageDlg('Você tem certeza ?',mtWarning,mbYesNoCancel,0) <> mrYes then
        exit ;
  end ;

  Resp := MessageDlg('Envia hora atual ?',mtConfirmation,mbYesNoCancel,0) ;

  if Resp = mrYes then
     ACBrECF1.ReducaoZ( now )
  else if Resp = mrNo then
     ACBrECF1.ReducaoZ( )
  else
     exit ;

  mResp.Lines.Add( 'Reduçao Z');
  AtualizaMemos ;
end;

procedure TForm1.Sobre1Click(Sender: TObject);
begin
  ACBrAboutDialog ;
end;

procedure TForm1.AliquotasICMS1Click(Sender: TObject);
var A : Integer ;
begin
  ACBrECF1.CarregaAliquotas ;

  for A := 0 to ACBrECF1.Aliquotas.Count -1 do
  begin
     mResp.Lines.Add( 'Aliquota: '+ACBrECF1.Aliquotas[A].Indice +' -> '+
                      FloatToStr( ACBrECF1.Aliquotas[A].Aliquota ) + ' Tipo: '+
                      ACBrECF1.Aliquotas[A].Tipo );
  end ;
  mResp.Lines.Add('---------------------------------');
end;

procedure TForm1.FormasdePagamento1Click(Sender: TObject);
var A : Integer ;
    Msg : String ;
begin
  ACBrECF1.CarregaFormasPagamento ;

  for A := 0 to ACBrECF1.FormasPagamento.Count -1 do
  begin
     if ACBrECF1.FormasPagamento[A].Descricao <> '' then
     begin
        If ACBrECF1.FormasPagamento[A].PermiteVinculado then Msg := 'S' else Msg := 'N' ;
        mResp.Lines.Add( 'Forma Pagto: '+ACBrECF1.FormasPagamento[A].Indice+' -> '+
           ACBrECF1.FormasPagamento[A].Descricao+'  Permite Vinculado: '+Msg);
     end ;
  end ;
  mResp.Lines.Add('---------------------------------');
end;

procedure TForm1.CarregaComprovantesNAOFiscais1Click(Sender: TObject);
var A : Integer ;
    Msg : String ;
begin
  ACBrECF1.CarregaComprovantesNaoFiscais ;

  for A := 0 to ACBrECF1.ComprovantesNaoFiscais.Count -1 do
  begin
     if ACBrECF1.ComprovantesNaoFiscais[A].Descricao <> '' then
     begin
        If ACBrECF1.ComprovantesNaoFiscais[A].PermiteVinculado then Msg := 'S' else Msg := 'N' ;
        mResp.Lines.Add( 'CNF: '+ACBrECF1.ComprovantesNaoFiscais[A].Indice+' -> '+
           ACBrECF1.ComprovantesNaoFiscais[A].Descricao+'  Permite Vinculado: '+Msg+
           ' - FPG associada: '+ACBrECF1.ComprovantesNaoFiscais[A].FormaPagamento);
     end ;
  end ;
  mResp.Lines.Add('---------------------------------');
end;

procedure TForm1.AbreGaveta1Click(Sender: TObject);
begin
  ACBrECF1.AbreGaveta ;
  mResp.Lines.Add( 'AbreGaveta');
  AtualizaMemos ;
end;

procedure TForm1.GavetaAberta1Click(Sender: TObject);
Var Msg : String ;
begin
  If ACBrECF1.GavetaAberta then Msg := 'SIM' else Msg := 'NAO' ;
  mResp.Lines.Add( 'Gaveta Aberta: '+ Msg );
  AtualizaMemos ;
end;

procedure TForm1.HorarioVerao1Click(Sender: TObject);
begin
  ACBrECF1.MudaHorarioVerao ;
  mResp.Lines.Add( 'MudaHorarioVerao');
  AtualizaMemos ;
end;

procedure TForm1.ImpactoAgulhas1Click(Sender: TObject);
begin
  ACBrECF1.ImpactoAgulhas ;
  mResp.Lines.Add( 'ImpactoAgulhas');
  AtualizaMemos ;
end;

procedure TForm1.TestaPodeAbrirCupom1Click(Sender: TObject);
var Est : String ;
begin

  Est := Estados[ ACBrECF1.Estado ] ;

  try
     ACBrECF1.TestaPodeAbrirCupom ;

     mResp.Lines.Add( 'Pode Abrir Cupom.. OK') ;
  except
     mResp.Lines.Add( 'NAO Pode Abrir Cupom..') ;
     mResp.Lines.Add( 'pois o estado Atual é '+Est) ;
     AtualizaMemos ;

     raise ;
  end ;
  
  AtualizaMemos ;

end;

procedure TForm1.NUltimoCupom1Click(Sender: TObject);
begin
  mResp.Lines.Add( 'Num Ultimo Cupom: '+ ACBrECF1.NumCupom );
  AtualizaMemos ;
end;

procedure TForm1.SubTotal1Click(Sender: TObject);
begin
  mResp.Lines.Add( 'SubTotal: '+  FloatToStr( ACBrECF1.Subtotal ) );
  AtualizaMemos ;
end;

procedure TForm1.TotalAcrescimos1Click(Sender: TObject);
begin
  mResp.Lines.Add( 'TotalAcrescimos: ('+ FloatToStr(ACBrECF1.TotalAcrescimos)+')' );
  AtualizaMemos ;
end;

procedure TForm1.TotalCancelamentos1Click(Sender: TObject);
begin
  mResp.Lines.Add( 'TotalCancelamentos: ('+ FloatToStr(ACBrECF1.TotalCancelamentos)+')' );
  AtualizaMemos ;
end;

procedure TForm1.TotalDescontos1Click(Sender: TObject);
begin
  mResp.Lines.Add( 'TotalDescontos: ('+ FloatToStr(ACBrECF1.TotalDescontos)+')' );
  AtualizaMemos ;
end;

procedure TForm1.TotalIsencao1Click(Sender: TObject);
begin
  mResp.Lines.Add( 'TotalIsencao: ('+ FloatToStr(ACBrECF1.TotalIsencao)+')' );
  AtualizaMemos ;
end;

procedure TForm1.TotalNaoTributado1Click(Sender: TObject);
begin
  mResp.Lines.Add( 'TotalNaoTributado: ('+ FloatToStr(ACBrECF1.TotalNaoTributado)+')' );
  AtualizaMemos ;
end;

procedure TForm1.TotalPago1Click(Sender: TObject);
begin
  mResp.Lines.Add( 'Total Pago: '+  FloatToStr( ACBrECF1.TotalPago ) );
  AtualizaMemos ;
end;

procedure TForm1.AbrirCupom1Click(Sender: TObject);
Var CPF : String ;
begin
  CPF := ' ' ;
  if InputQuery('Abre Cupom','Se necessário, Informe o CPF/CNPJ',CPF) then
  begin
     mBobina.Clear ;
     WB_LoadHTML(IpHtmlBobina, '');

     ACBrECF1.AbreCupom( CPF );
     mResp.Lines.Add( 'AbreCupom' );
     AtualizaMemos ;
  end ;
end;

procedure TForm1.CancelaCupom1Click(Sender: TObject);
begin
  ACBrECF1.CancelaCupom ;
  mResp.Lines.Add( 'CancelaCupom' );
  AtualizaMemos ;
end;

procedure TForm1.TotalSubstituicaoTributaria1Click(Sender: TObject);
begin
  mResp.Lines.Add( 'TotalSubstituicaoTributaria: ('+ FloatToStr(ACBrECF1.TotalSubstituicaoTributaria)+')' );
  AtualizaMemos ;
end;

procedure TForm1.VendaBruta1Click(Sender: TObject);
begin
  mResp.Lines.Add( 'VendaBruta: ('+ FloatToStr(ACBrECF1.VendaBruta)+')' );
  AtualizaMemos ;
end;

procedure TForm1.VenderItem1Click(Sender: TObject);
begin
  frVendeItem.Show ;
end;

procedure TForm1.CancelarItemVendido1Click(Sender: TObject);
Var Item : String ;
begin
  Item := '1' ;
  if InputQuery('Cancelar Item Vendido',
                'Informe o número da Sequencia de Venda', Item ) then
  begin
     ACBrECF1.CancelaItemVendido( StrToIntDef(Item,0) );
     mResp.Lines.Add( 'Cancela Item Vendido: '+Item );
     AtualizaMemos ;
  end ;
end;

procedure TForm1.Sub1Click(Sender: TObject);
Var Desc, Obs : String ;
begin
  Desc := '0' ;
  Obs := '';

  if ACBrECF1.ModeloStr = 'DataRegis' then
     InputQuery('Subtotaliza Cupom',
                'Se Necessário digite alguma Observaçao (até 8 linhas)'+#10+
                'O sinal | (pipe) será convertido para #10 (quebra de linha)'+#10+
                'A Observação também pode ser enviada no metodo FechaCupom' ,
                Obs );

  if InputQuery('Subtotaliza Cupom',
                'Digite Valor negativo para Desconto'+#10+
                'ou Valor Positivo para Acrescimo' , Desc ) then
  begin
     ACBrECF1.SubtotalizaCupom( StrToFloat(Desc), Obs );
     mResp.Lines.Add( 'Subtotaliza Cupom: '+ Desc );
     AtualizaMemos ;
  end ;
end;

procedure TForm1.EfetuarPagamento1Click(Sender: TObject);
begin
  if not (ACBrECF1.Modelo in [ecfDataRegis, ecfFiscNET]) then
     if ACBrECF1.Estado <> estPagamento then
        MessageDlg('Impressora nao está em Estado de Pagamento'+#10+
                   'Primeiro use SubTotaliza Cupom' ,mtWarning,[mbOk],0) ;

  frPagamento.Show ;
  frPagamento.TipoCupom := 'F' ;
end;

procedure TForm1.FecharCupom1Click(Sender: TObject);
Var Obs : String ;
begin
  Obs := 'Componentes ACBr|http://acbr.sourceforge.net' ;
  if InputQuery('Fechar Cupom',
                'Se Necessário digite alguma Observaçao (até 8 linhas)'+#10+
                'O sinal | (pipe) será convertido para #10 (quebra de linha)' ,
                Obs ) then
  begin
     Obs := StringReplace(Obs,'|',#10,[rfReplaceAll,rfIgnoreCase]) ;
     ACBrECF1.FechaCupom( Obs );
     mResp.Lines.Add( 'Fecha Cupom: '+#10+Obs );
     AtualizaMemos ;
  end ;
end;

procedure TForm1.EnviaComando1Click(Sender: TObject);
Var CMD1,CMD2, C : String ;
    A : Integer ;
    T : String ;
begin
  CMD1 := '' ;
  T    := '0'  ;
  if InputQuery('Enviar Comando',
                'Digite o comando de acordo com a Sintaxe da Impressora'+#10+#10+
                'Para Caracteres ASC use #nnn  Ex: #006 = chr(006)'+#10+#10+
                'Exemplo: #006 irá imprimir uma Leitura X na Bematech' ,
                CMD1 ) then
    if (not (ACBrECF1.Modelo = ecfBematech)) or
       InputQuery('Enviar Comando BEMATECH',
                  'Digite o tamanho em Bytes do Retorno esperado'+#10+#10+
                  'NAO adcione os 3 bytes de ACK+ST1+ST2',
                  T ) then
     begin
        CMD2   := '' ;
        A      := 1 ;

        if ACBrECF1.ECF is TACBrECFBematech then
           (ACBrECF1.ECF as TACBrECFBematech).BytesResp := StrToIntDef(T,0) ;


        while A <= length( CMD1 ) do
        begin
           C := copy( CMD1, A, 1) ;

           if C = '#' then
            begin
              CMD2 := CMD2 + chr( StrToIntDef(copy(CMD1,A+1,3),0) ) ;
              A := A + 3 ;
            end
           else
              CMD2 := CMD2 + C ;

           A := A + 1 ;
        end ;

        ACBrECF1.EnviaComando( CMD2 );
        mResp.Lines.Add( 'Envia Comando: '+CMD1 );
        AtualizaMemos ;
     end ;
end;

procedure TForm1.FechaRelatrio1Click(Sender: TObject);
begin
  ACBrECF1.FechaRelatorio ;
end;

procedure TForm1.ACBrECF1AguardandoRespostaChange(Sender: TObject);
begin
  if ACBrECF1.AguardandoResposta then
     StatusBar1.Panels[0].Text := 'Processando...'
  else
     StatusBar1.Panels[0].Text := '' ;
end;

procedure TForm1.HorarioVerao2Click(Sender: TObject);
Var Msg : String ;
begin
  If ACBrECF1.HorarioVerao then Msg := 'SIM' else Msg := 'NAO' ;
  mResp.Lines.Add( 'Horário de Verão: '+ Msg );
  AtualizaMemos ;
end;

procedure TForm1.Arredonda1Click(Sender: TObject);
Var Msg : String ;
begin
  If ACBrECF1.Arredonda then Msg := 'SIM' else Msg := 'NAO' ;
  mResp.Lines.Add( 'Arredondamento: '+ Msg );
  AtualizaMemos ;
end;

procedure TForm1.MudaArredondamento1Click(Sender: TObject);
Var Resp : TModalResult ;
begin
  Resp := MessageDlg('Arredondar ?',mtConfirmation,mbYesNoCancel,0) ;
  if Resp <> mrCancel then
  begin
    ACBrECF1.MudaArredondamento( (Resp = mrYes) ) ;
    mResp.Lines.Add( 'MudaArredondamento');
    AtualizaMemos ;
  end ;
end;

procedure TForm1.NumLoja1Click(Sender: TObject);
begin
  mResp.Lines.Add( 'NUM Loja: ('+ ACBrECF1.NumLoja+')' );
  AtualizaMemos ;
end;

procedure TForm1.NumCRO1Click(Sender: TObject);
begin
  mResp.Lines.Add( 'Num.CRO: ('+ ACBrECF1.NumCRO+')' );
  AtualizaMemos ;
end;

procedure TForm1.TestedeVelocidade1Click(Sender: TObject);
Var cItens : String ;
    nItens, I : Integer ;
    tIni,tFim : TDateTime ;
    Desc      : Double ;
//  Parcela   : Double ;
begin
  ACBrECF1.CarregaFormasPagamento ;
  if ACBrECF1.FormasPagamento.Count < 1 then
     raise Exception.Create('Nenhuma Forma de Pagamento programada no ECF');

  cItens := '10' ;
  if not InputQuery('Teste de Velocidade',
                'Numero de Itens a imprimir:', cItens ) then
     exit ;

  nItens := StrToIntDef(cItens,0) ;
  if nItens < 1 then
     exit ;

  tIni := Now ;
  mResp.Lines.Add('Imprimindo '+cItens+ ' itens.') ;
  mResp.Lines.Add('Iniciando Cupom: '+DateTimeToStr(tIni)) ;
  ACBrECF1.AbreCupom();

  For i := 1 to nItens do
  begin
     ACBrECF1.VendeItem( IntToStrZero(i,6),
                         'DESCRICAO NUM.: '+IntToStrZero(i,6),
                         'NN',i,i/100,0,'UN') ;
    { Aguarda 1 segundo ou até o ECF ficar Em linha novamente }
    ACBrECF1.EmLinha( 1 ) ;
    { Semelhante ao "AguardaImpressao := True", porém é mais rápido, pois no
      método "VerificaFimImpressao" alem de verificado o "EmLinha" também é
      solicitado o Status do ECF }
  end ;

  SubTot := ACBrECF1.Subtotal ;
  Desc   := 0 ;
  if SubTot >= 1  then
     Desc := Frac( SubTot ) * -1 ;
  ACBrECF1.SubtotalizaCupom( Desc );

//  ACBrECF1.AbreGaveta ;

  { Executando todos os Pagamentos disponiveis }
(*  Parcela := max(  RoundTo(ACBrECF1.Subtotal/ACBrECF1.FormasPagamento.Count,-2),
                   0.01) ;
  For i := 1 to ACBrECF1.FormasPagamento.Count - 1 do
     Try
        ACBrECF1.EfetuaPagamento(ACBrECF1.FormasPagamento[i].Indice,  Parcela,
                            'OBSERVACAO PAGAMENTO: '+ IntToStrZero(i+1,2) );
     except
        Break ;
     end ;
*)
  { Efetuando ultimo pagamento no Item 0, deve zerar o Saldo a pagar }
  ACBrECF1.EfetuaPagamento(ACBrECF1.FormasPagamento[0].Indice,
     (ACBrECF1.Subtotal - ACBrECF1.TotalPago), 'ZERANDO SALDO A PAGAR RESTANTE');
     
  ACBrECF1.FechaCupom('TESTE DE CUPOM');
  tFim := Now ;
  mResp.Lines.Add('Finalizado em: '+DateTimeToStr(tFim)) ;
  mResp.Lines.Add('Diferença: '+ FormatFloat('###.##',SecondSpan(tIni,tFim))+' segundos' ) ;
  mResp.Lines.Add('---------------------------------');
end;

procedure TForm1.CapturaporNReduaoZ1Click(Sender: TObject);
Var Linhas : TStringList ;
    cRedIni, cRedFim : String ;
    I, nRedIni, nRedFim : Integer ;
begin
  cRedIni := '0' ;
  cRedFim := '0' ;

  if not InputQuery('Captura da Memoria Fiscal',
                'Entre com o a Reduçao Z Inicial:', cRedIni ) then
     exit ;
  nRedIni := StrToIntDef(cRedIni,-1) ;
  if nRedIni < 0 then exit ;

  if not InputQuery('Captura da Memoria Fiscal',
                'Entre com o a Reduçao Z Final:', cRedFim ) then
     exit ;
  nRedFim := StrToIntDef(cRedFim,-1) ;
  if nRedFim < 0 then exit ;

  Linhas := TStringList.Create ;
  try
     ACBrECF1.LeituraMemoriaFiscalSerial(nRedIni, nRedFim, Linhas);

     For I := 0 to Linhas.Count - 1 do
        mResp.Lines.Add(Linhas[I]) ;
  finally
     Linhas.Free ;
  end ;
  mResp.Lines.Add('---------------------------------');
end;

procedure TForm1.ImprimeporNReduaoZ1Click(Sender: TObject);
Var cRedIni, cRedFim : String ;
    nRedIni, nRedFim : Integer ;
begin
  cRedIni := '0' ;
  cRedFim := '0' ;

  if not InputQuery('Impressão da Memoria Fiscal',
                'Entre com o a Reduçao Z Inicial:', cRedIni ) then
     exit ;
  nRedIni := StrToIntDef(cRedIni,-1) ;
  if nRedIni < 0 then exit ;

  if not InputQuery('Impressão da Memoria Fiscal',
                'Entre com o a Reduçao Z Final:', cRedFim ) then
     exit ;
  nRedFim := StrToIntDef(cRedFim,-1) ;
  if nRedFim < 0 then exit ;

  ACBrECF1.LeituraMemoriaFiscal(nRedIni, nRedFim);
  mResp.Lines.Add('Leitura da Memoria Fiscal por Reduçao');
end;

procedure TForm1.CapturaporPeriodo1Click(Sender: TObject);
Var Linhas : TStringList ;
    cDatIni, cDatFim : String ;
    dDatIni, dDatFim : TDateTime ;
    I : Integer ;
begin
  cDatIni := '01/'+FormatDateTime('mm/yy',now) ;
  cDatFim := FormatDateTime('dd/mm/yy',now) ;

  if not InputQuery('Captura da Memoria Fiscal',
                'Entre com o a Data Inicial (DD/MM/AA):', cDatIni ) then
     exit ;
  try
     dDatIni := StrToDateTime( StringReplace(cDatIni,'/', DateSeparator,
                                [rfReplaceAll] ) ) ;
  except
     exit ;
  end ;

  if not InputQuery('Captura da Memoria Fiscal',
                'Entre com o a Data Final (DD/MM/AA):', cDatFim ) then
     exit ;
  try
     dDatFim := StrToDateTime( StringReplace(cDatFim,'/', DateSeparator,
                                [rfReplaceAll] ) ) ;
  except
     exit
  end ;

  Linhas := TStringList.Create ;
  try
     ACBrECF1.LeituraMemoriaFiscalSerial(dDatIni, dDatFim, Linhas);

     For I := 0 to Linhas.Count - 1 do
        mResp.Lines.Add(Linhas[I]) ;
  finally
     Linhas.Free ;
  end ;
  mResp.Lines.Add('---------------------------------');
end;

procedure TForm1.ImprimeporPeriodo1Click(Sender: TObject);
Var cDatIni, cDatFim : String ;
    dDatIni, dDatFim : TDateTime ;
begin
  cDatIni := '01/'+FormatDateTime('mm/yy',now) ;
  cDatFim := FormatDateTime('dd/mm/yy',now) ;

  if not InputQuery('Captura da Memoria Fiscal',
                'Entre com o a Data Inicial (DD/MM/AA):', cDatIni ) then
     exit ;
  try
     dDatIni := StrToDateTime( StringReplace(cDatIni,'/', DateSeparator,
                                [rfReplaceAll] ) ) ;
  except
     exit ;
  end ;

  if not InputQuery('Captura da Memoria Fiscal',
                'Entre com o a Data Final (DD/MM/AA):', cDatFim ) then
     exit ;
  try
     dDatFim := StrToDateTime( StringReplace(cDatFim,'/', DateSeparator,
                                [rfReplaceAll] ) ) ;
  except
     exit
  end ;

  ACBrECF1.LeituraMemoriaFiscal(dDatIni, dDatFim );
  mResp.Lines.Add('Leitura da Memoria Fiscal por Datas');
end;

procedure TForm1.ProgramaAliquota1Click(Sender: TObject);
Var cAliq : String ;
    nAliq : Double ;
    Tipo  : Char ;
    Resp  : TModalResult ;
begin
  cAliq := '18,00' ;

  if not InputQuery('Programaçao de Aliquotas',
                    'Entre com o valor da Aliquota:', cAliq ) then
     exit ;

  cAliq := StringReplace(StringReplace(cAliq,'.',DecimalSeparator,[]),
                                             ',',DecimalSeparator,[]) ;
  nAliq := StrToFloatDef(cAliq,0) ;
  if nAliq = 0 then
     exit ;

  Resp := MessageDlg('Aliquota do ICMS ?'+sLineBreak+'SIM = ICMS, NAO = ISS',
                mtConfirmation,mbYesNoCancel,0) ;
  case Resp of
    mrCancel : exit ;
    mrYes    : Tipo := 'T' ;
  else ;
    Tipo := 'S' ;
  end;

  if MessageDlg('A aliquota: ['+FloatToStr(nAliq)+'] do Tipo: ['+Tipo+
                '] será programada.'+sLineBreak+sLineBreak+
                'Cuidado a programação de Aliquotas é irreversivel'+sLineBreak+
                'Confirma a operação ?',mtConfirmation,mbYesNoCancel,0) <> mrYes then
     exit ;

  ACBrECF1.ProgramaAliquota(nAliq,Tipo);
  AliquotasICMS1Click(Sender);
end;

procedure TForm1.ProgramaFormadePagamento1Click(Sender: TObject);
Var cDescricao : String ;
    Vinculado  : Boolean ;
    Resp       : TModalResult ;
begin
  cDescricao := 'CARTAO' ;
  Vinculado  := true ;

  if not InputQuery('Programaçao de Formas de Pagamento (FPG)',
                    'Entre com a Descriçao:', cDescricao ) then
     exit ;

  if not (ACBrECF1.Modelo in [ecfBematech, ecfNaoFiscal, ecfMecaf]) then
  begin
     Resp := MessageDlg('Permite Vinculado nessa Forma de Pagamento ?',
                   mtConfirmation,mbYesNoCancel,0) ;
     if Resp = mrCancel then
        exit
     else
        Vinculado := (Resp = mrYes) ;
  end ;

  if MessageDlg('A Forma de Pagamento: ['+cDescricao+'] '+
                'será programada.'+sLineBreak+sLineBreak+
                'Cuidado !! A programação de Formas de Pagamento é irreversivel'+sLineBreak+
                'Confirma a operação ?',mtConfirmation,mbYesNoCancel,0) <> mrYes then
     exit ;

  ACBrECF1.ProgramaFormaPagamento(cDescricao,Vinculado);
  FormasdePagamento1Click(Sender);
end;

procedure TForm1.ProgramaComprovanteNAOFiscal1Click(Sender: TObject);
Var cDescricao, cTipo, Msg : String ;
begin
  cDescricao := 'CARTAO' ;
  cTipo      := '' ;

  if not InputQuery('Programaçao de Comprovantes NAO Fiscais (CNF)',
                    'Entre com a Descriçao:', cDescricao ) then
     exit ;

  case ACBrECF1.Modelo of
    ecfSchalter :
       if not InputQuery('Comprovantes NAO Fiscal '+ACBrECF1.ModeloStr,
                         'Entre com a String do parametro "Tipo".'+sLineBreak+
                         'D - Permite Desconto e Item '+sLineBreak+
                         'A - Permite Acrescimo no Subtotal'+sLineBreak+
                         'C - Permite Cancelamento de Item'+sLineBreak+
                         'P - Obriga forma de Pagamento'+sLineBreak+sLineBreak+
                         'Vnn - Obriga emissao de vinculado na Forma de '+
                         'Pagamento nn'+sLineBreak+sLineBreak+
                         'Se vazio assume Default = "DAC"'+sLineBreak+
                         'Exemplos:  V04 -> Torna a Emissao do Cupom Fiscal '+
                         'Vinculado obrigatória para a Forma de Pagamento 04',
                         cTipo ) then
          exit ;

    ecfDaruma :
       if not InputQuery('Comprovantes NAO Fiscal '+ACBrECF1.ModeloStr,
                         'Entre com a String do parametro "Tipo".'+sLineBreak+
                         'V  Comprovante Vinculado'+sLineBreak+
                         '+  Entrada de Recursos'+sLineBreak+
                         '-  Saida de Recursos'+sLineBreak+sLineBreak+
                         'Se vazio assume Default = "V"'+sLineBreak+
                         'Informe Apenas uma das Opçoes',
                         cTipo ) then
          exit ;

    ecfSweda, ecfQuattro :
       if not InputQuery('Comprovantes NAO Fiscal '+ACBrECF1.ModeloStr,
                         'Entre com a String do parametro "Tipo".'+sLineBreak+
                         '&  Criaçao de um novo Grupo (Titulo)'+sLineBreak+
                         '+  Entrada de Recursos'+sLineBreak+
                         '-  Saida de Recursos'+sLineBreak+sLineBreak+
                         'Se vazio assume Default = "+"'+sLineBreak+
                         'Informe Apenas uma das Opçoes',
                         cTipo ) then
          exit ;

    ecfFiscNET :
       if not InputQuery('Comprovantes NAO Fiscal '+ACBrECF1.ModeloStr,
                         'Entre com a String do parametro "Tipo".'+sLineBreak+
                         '+  Entrada de Recursos'+sLineBreak+
                         '-  Saida de Recursos'+sLineBreak+sLineBreak+
                         'Se vazio assume Default = "+"'+sLineBreak+
                         'Informe Apenas uma das Opçoes',
                         cTipo ) then
          exit ;

  end;

  Msg := '' ;
  If (ACBrECF1.Modelo in [ecfDaruma,ecfSchalter,ecfSweda,ecfQuattro,ecfFiscNET]) then
     Msg := ' do Tipo: ['+cTipo+'] ' ;
  
  if MessageDlg('O Comprovante Nao Fiscal: ['+cDescricao+'] '+ Msg +
                'será programado.'+sLineBreak+sLineBreak+
                'Cuidado a programação de CNFs é irreversivel'+sLineBreak+
                'Confirma a operação ?',mtConfirmation,mbYesNoCancel,0) <> mrYes then
     exit ;

  ACBrECF1.ProgramaComprovanteNaoFiscal(cDescricao,cTipo);
  CarregaComprovantesNAOFiscais1Click(Sender);
end;

procedure TForm1.ACBrECF1MsgPoucoPapel(Sender: TObject);
begin
  mResp.Lines.Add('ATENÇÃO... POUCO PAPEL') ;
end;

procedure TForm1.CorrigeEstadodeErro1Click(Sender: TObject);
begin
  ACBrECF1.CorrigeEstadoErro ;
end;

procedure TForm1.ChequePronto1Click(Sender: TObject);
Var Msg : String ;
begin
  If ACBrECF1.ChequePronto then Msg := 'SIM' else Msg := 'NAO' ;
  mResp.Lines.Add( 'Cheque Pronto: '+ Msg );
  AtualizaMemos ;
end;

procedure TForm1.ImprimeCheque1Click(Sender: TObject);
Var sValor : String ;
    dValor : Double ;
    sBanco, sFavorecido, sCidade : String ;
begin
  sValor      := '10,00' ;
  sBanco      := '001' ;
  sFavorecido := 'Projeto ACBr' ;
  sCidade     := 'Sao Paulo' ;

  if not InputQuery('Impressão de Cheque',
                    'Entre com o valor do Cheque:', sValor ) then
     exit ;

  sValor := StringReplace(StringReplace(sValor,'.',DecimalSeparator,[]),
                                               ',',DecimalSeparator,[]) ;
  dValor := StrToFloatDef(sValor,0) ;
  if dValor = 0 then
     exit ;

  if not InputQuery('Impressão de Cheque',
                    'Entre com o Numero do Banco', sBanco ) then
     exit ;

  if not InputQuery('Impressão de Cheque',
                    'Entre com o Favorecido', sFavorecido ) then
     exit ;

  if not InputQuery('Impressão de Cheque',
                    'Entre com a Cidade', sCidade ) then
     exit ;

  while not ACBrECF1.ChequePronto do
     if (MessageDlg('Favor inserir o cheque e pressionar OK',
          mtConfirmation,[mbOk,mbCancel],0) = mrCancel) then
        exit ;

  ACBrECF1.ImprimeCheque(sBanco,dValor,sFavorecido,sCidade,now,
      'TESTE DE IMPRESSAO DE CHEQUE');

  mResp.Lines.Add('ImprimeCheque Banco:'+sBanco+
                  ' Valor:'+sValor+
                  ' Favorecido:'+sFavorecido+
                  ' Cidade:'+sCidade+
                  ' Data:'+FormatDateTime('dd/mm/yy',now) );
  AtualizaMemos ;
end;

procedure TForm1.CancelaImpressoCheque1Click(Sender: TObject);
begin
  ACBrECF1.CancelaImpressaoCheque ;
  mResp.Lines.Add( 'CancelaImpressaoCheque');
  AtualizaMemos ;
end;


procedure TForm1.CarregaUnidadesdeMedida1Click(Sender: TObject);
var
   A: Integer;
begin
  ACBrECF1.CarregaUnidadesMedida ;

  for A := 0 to ACBrECF1.UnidadesMedida.Count -1 do
  begin
     if ACBrECF1.UnidadesMedida[A].Descricao <> '' then
        mResp.Lines.Add( 'Unid Medida: '+ACBrECF1.UnidadesMedida[A].Indice+' -> '+
           ACBrECF1.UnidadesMedida[A].Descricao);
  end ;
  mResp.Lines.Add('---------------------------------');

end;

procedure TForm1.ProgramaUnidadeMedida1Click(Sender: TObject);
var
   um:String;
begin
  if not InputQuery('Programaçao de Unidades de Medida',
                    'Entre com a Descrição da Unidade de Medida:', um ) then
     exit ;
  if MessageDlg('A Unidade de Medida: ['+um+'] será programada.'+sLineBreak+sLineBreak+
                'Cuidado a programação de Unidades de Medida é irreversivel'+sLineBreak+
                'Confirma a operação ?',mtConfirmation,mbYesNoCancel,0) <> mrYes then
     exit ;
  ACBrECF1.ProgramaUnidadeMedida( um );
end;

procedure TForm1.WB_LoadHTML(IpHtmlPanel: TIpHtmlPanel; HTMLCode: string);
var
  sl: TStringList;
  ms: TMemoryStream;
  NewHTML: TSimpleIpHtml;
begin
  sl := TStringList.Create;
  ms := TMemoryStream.Create;
  NewHTML := TSimpleIpHtml.Create; // Beware: Will be freed automatically by IpHtmlPanel
  try
     sl.Text := HTMLCode;
     sl.SaveToStream(ms);
     ms.Seek(0, 0);

     NewHTML.OnGetImageX:=@HTMLGetImageX;
     NewHTML.LoadFromStream(ms);
     
     IpHtmlPanel.SetHtml(NewHTML);

  finally
     ms.Free;
     sl.Free;
  end;
end;

procedure TForm1.HTMLGetImageX(Sender: TIpHtmlNode; const URL: string;
  var Picture: TPicture);
begin
  Picture := nil;
end;

initialization
   {$I ecfteste1.lrs}

end.


