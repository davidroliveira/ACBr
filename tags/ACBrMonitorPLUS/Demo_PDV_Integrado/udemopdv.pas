unit uDemoPDV;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BufDataset, db, memds, FileUtil, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, Grids, MaskEdit, DBGrids,
  variants, LCLType, PairSplitter, ACBrSocket, IntegracaoConfig, objRetorno,
  ACBrUtil, ACBrValidador, windows, IniFiles, uConfig, dateutils, syncobjs;

const
  cAbreTagGaveta = '<abre_gaveta>';
  cFechaTagGaveta = '</abre_gaveta>';
  cCFeINI = 'CFe.ini';
  cCFOPpadrao = '5933';
  cCompadrao = 'UND';
  cNCMpadrao = '17049010';
  cCSONpadrao= '500';
  cCSTpadrao= '49';
  cListServ= '21.01';
  vvAliqPadrao= 5.0;
  cLogs='Logs';
  cnfe='-nfe';

type

  { TMyThread }

  TMyThread = class(TThread)
  private
    fStatusText: string;
    procedure ShowStatus;
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: boolean);
  end;

  { TfrmDemoPDV }

  TfrmDemoPDV = class(TForm)
    ACBrTCPServer1: TACBrTCPServer;
    ACBrValidador1: TACBrValidador;
    btnEmitir: TBitBtn;
    btnPagar: TBitBtn;
    btnRegistraVenda: TBitBtn;
    btnCancelaRegistro: TBitBtn;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    edtFone: TEdit;
    edtEmail: TEdit;
    edtCodigo: TEdit;
    edtPagamento: TEdit;
    edtPeso: TEdit;
    edtTroco: TEdit;
    edtTotalVenda3: TEdit;
    edtTotalPago: TEdit;
    edtValor: TEdit;
    edtTotalItem: TEdit;
    edtQtde: TEdit;
    edtCPF: TEdit;
    edtCNPJ: TEdit;
    edtCliente: TEdit;
    edtCEP: TEdit;
    edtNome: TEdit;
    edtDescricao: TEdit;
    edtTotalVenda1: TEdit;
    edtPrecoUnitario: TEdit;
    edtTotalVenda2: TEdit;
    edtAPagarTroco: TEdit;
    IdleTimer1: TIdleTimer;
    Image1: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblTitulo: TLabel;
    MemDataset1: TMemDataset;
    memMonitor: TMemo;
    pageControlPDV: TPageControl;
    pnlLerPeso: TPanel;
    pnlCadastro: TPanel;
    pnlVenda: TPanel;
    pnlInicio: TPanel;
    pnlPDV: TPanel;
    pnlCabecalho: TPanel;
    pnlCentro: TPanel;
    pnlMonitor1: TPanel;
    pnlRodape: TPanel;
    pnlClient: TPanel;
    pnlPagamento: TPanel;
    pnlFinaliza: TPanel;
    rgPagamento: TRadioGroup;
    spbVoltar: TSpeedButton;
    spbProximo: TSpeedButton;
    spbSubirCadastro: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Splitter1: TSplitter;
    StringGrid1: TStringGrid;
    tbsFinaliza: TTabSheet;
    tbsPagamento: TTabSheet;
    tbsVenda: TTabSheet;
    tbsInicio: TTabSheet;
    Timer1: TTimer;
    procedure btnCancelaRegistroClick(Sender: TObject);
    procedure btnEmitirClick(Sender: TObject);
    procedure btnPagarClick(Sender: TObject);
    procedure btnRegistraVendaClick(Sender: TObject);
    procedure edtAPagarTrocoChange(Sender: TObject);
    procedure edtCEPExit(Sender: TObject);
    procedure edtClienteExit(Sender: TObject);
    procedure edtCNPJEnter(Sender: TObject);
    procedure edtCNPJExit(Sender: TObject);
    procedure edtCNPJKeyPress(Sender: TObject; var Key: char);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCPFExit(Sender: TObject);
    procedure edtCPFKeyPress(Sender: TObject; var Key: char);
    procedure edtPesoEnter(Sender: TObject);
    procedure edtPesoExit(Sender: TObject);
    procedure edtPesoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure edtPesoKeyPress(Sender: TObject; var Key: char);
    procedure edtQtdeEnter(Sender: TObject);
    procedure edtQtdeExit(Sender: TObject);
    procedure edtQtdeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure edtQtdeKeyPress(Sender: TObject; var Key: char);
    procedure edtValorEnter(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
    procedure pageControlPDVChange(Sender: TObject);
    procedure rgPagamentoClick(Sender: TObject);
    procedure spbProximoClick(Sender: TObject);
    procedure spbSubirCadastroClick(Sender: TObject);
    procedure spbVoltarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure tbsFinalizaShow(Sender: TObject);
    procedure tbsPagamentoShow(Sender: TObject);
    procedure tbsVendaShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FIntegracaoConfig: TIntegracaoConfig;
    FEnvioOff: Boolean;
    procedure setPage(Sender: TPageControl);
    procedure setNextPage(Sender: TPageControl);
    procedure setBackPage(Sender: TPageControl);
    procedure setPagamento(Sender: TRadioGroup);
    procedure addProduto(cod, qtde, Preco, Descricao, Total: String);
    procedure calcItem(qtde: Double; Preco: Double);
    procedure IniciaRegistro;
    procedure calcPagamento(vlrTotal, vlrPago: Double);
    procedure IniciaVenda;
    procedure MonitoraIntegracao(PathLog: String);
    procedure AtivarObjetosACBr;
    procedure DesAtivarObjetosACBr;
    procedure ConfigEmissaoCFe;
    procedure AtualizaTelaContingencia;


    procedure ConsultaCEP(Cep: String);
    function LerPeso():Double;
    function UltimaLeitura():String;
    procedure EscreverDisplay(linha: Integer= 1; Msg: String= '');
    procedure ESCAbrirGaveta();
    function CriarEnviarCFe():Boolean;
    function EnviarNFe(var AcStat: String; var AMsg: String; const Achave: String):Boolean;
    function CriarNFCe():String;
    function SetFormaEmissao(tp: integer): Boolean;
    function GerarChave(uf, cod, modelo, serie, numero, tpemi, emissao, cnpj: String):String;
    procedure ImprimirExtratoCFe(pathXMLVenda: String);
    function ImprimirDanfe(pathXML: String): Boolean;
    function GerarIniCFe():String;
    function GerarIniNFCe(const AOffLine:Boolean; var AChave: String ):String;
    function ConsultarNFe(Achave: String; var AProt: String):Boolean;
    function InutilizarNFe(Achave: String):Boolean;
    function CancelamentoSubstituicao(Achave, AchaveRef, AProt: String):Boolean;

    function EmissaoOffLine: Boolean;
    procedure AdicionarNFePendente;

    procedure AtualizaBotaoOffLine(OffLine: Boolean);

    function AspasDuplas(Param: String): String;


  public
    function LigarOffLine(Off: Boolean): Boolean;
    function StatusServicoNFe: Boolean;
    property IntegracaoConfig: TIntegracaoConfig read FIntegracaoConfig;
    property EnvioOff: Boolean read FEnvioOff write FEnvioOff;
    procedure EnvioOffLine;

  end;

var
  frmDemoPDV: TfrmDemoPDV;
  Item: Integer;
  TotalVenda: Double;
  TotalPago: Double;
  Troco: Double;

  NFCeAtivo: Boolean;

  BALAtivo: Boolean;
  LCBAtivo: Boolean;
  DISAtivo: Boolean;
  SATAtivo: Boolean;
  ESCAtivo: Boolean;

  lCFversao: String;
  lCFCNPJ: String;
  lCFsignAC: String;
  lCFnumeroCaixa: String;
  lCF_CRT: String;
  lCF_Razao: String;
  lCF_Fantasia: String;
  lCF_Fone: String;
  lCF_CEP: String;
  lCF_Logradouro: String;
  lCF_Numero: String;
  lCF_Complemento: String;
  lCF_Bairro: String;
  lCF_CidadeCod: String;
  lCF_Cidade: String;
  lCF_UF: String;
  lCFEmit_nNF: String;

  lCFEmitCNPJ: String;
  lCFEmitIE: String;
  lCFEmitIM: String;
  lCFEmitindRatISSQN: String;

  lCFEmit_cUF: Integer;
  lCFEmit_natOp: String;
  lCFEmit_indPag: Integer;
  lCFEmit_serie: String;

  lCFEmit_dhEmi: TDateTime;
  lCFEmit_tpNF: String;
  lCFEmit_idDest: Integer;
  lCFEmit_cMunFG: String;
  lCFEmit_indFinal: Integer;
  lCFEmit_indPres: Integer;
  lCFEmit_tpimp: Integer;
  lCFEmit_tpEmis: Integer;
  lCFEmit_tpAmb: Integer;
  lCFEmit_dhCont: TDateTime;
  lCFEmit_xJust: String;

implementation

{$R *.lfm}

{ TMyThread }

procedure TMyThread.ShowStatus;
begin
  frmDemoPDV.Label26.Caption:= fStatusText;
  frmDemoPDV.AtualizaTelaContingencia;
end;

procedure TMyThread.Execute;
var
  newStatus : string;
begin
  fStatusText := 'Enviando Off-Line';
  Synchronize(@Showstatus);

  while (not Terminated) and (true {any condition required}) do
  begin
    newStatus:='Envio Off-Line em Andamento...';
    frmDemoPDV.EnvioOffLine;

    if NewStatus <> fStatusText then begin
      fStatusText := newStatus;
      Synchronize(@Showstatus);
    end;
    Terminate;
  end;
end;

constructor TMyThread.Create(CreateSuspended: boolean);
begin
  FreeOnTerminate := True;
  inherited Create(CreateSuspended);
end;

{ TfrmDemoPDV }

procedure TfrmDemoPDV.pageControlPDVChange(Sender: TObject);
begin
  setPage(pageControlPDV);
end;

procedure TfrmDemoPDV.rgPagamentoClick(Sender: TObject);
begin
  setPagamento(rgPagamento);
end;

procedure TfrmDemoPDV.spbProximoClick(Sender: TObject);
begin
  setNextPage(pageControlPDV);
end;

procedure TfrmDemoPDV.spbSubirCadastroClick(Sender: TObject);
begin
  pnlCadastro.Visible:= False;
end;

procedure TfrmDemoPDV.spbVoltarClick(Sender: TObject);
begin
  setBackPage(pageControlPDV);
end;

procedure TfrmDemoPDV.SpeedButton1Click(Sender: TObject);
begin
  if (StrToFloatDef(edtPeso.text,0) > 0) then
    edtQtde.Text:= FormatFloat('#,##0.00', StrToFloatDef(edtPeso.text,0) );

  edtPeso.Text:= '0,00';
  pnlLerPeso.SendToBack;
  edtQtde.SetFocus;
end;

procedure TfrmDemoPDV.SpeedButton2Click(Sender: TObject);
var
  Ok: String;
  objAtivarBAL: TMetodoAtivar;
begin

  objAtivarBAL:= TMetodoAtivar.Create(obBAL);
  try
    IntegracaoConfig.Executar(Ok, objAtivarBAL, '', 3000);
    if ( copy(Ok,1,3) = cOK) then
      showmessage('Balança ativada! '+ objAtivarBAL.RespostaUnica)
    else
      showmessage('Falha ao ativar Balança! '+ Ok);
  finally
     MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
     objAtivarBAL.Free;
  end;
end;

procedure TfrmDemoPDV.SpeedButton3Click(Sender: TObject);
var
  Ok: String;
  objAtivarLCB: TMetodoAtivar;
begin

  objAtivarLCB:= TMetodoAtivar.Create(obLCB);
  try
    IntegracaoConfig.Executar(Ok, objAtivarLCB, '', 3000);
    if ( copy(Ok,1,3) = cOK) then
      showmessage('Leitor ativado! '+ objAtivarLCB.RespostaUnica)
    else
      showmessage('Falha ao ativar Leitor! '+ Ok);
  finally
     MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
     objAtivarLCB.Free;
  end;
end;

procedure TfrmDemoPDV.SpeedButton4Click(Sender: TObject);
{var
  Ok: String;
  objAtivarDIS: TMetodoAtivar;   }
begin
  frmConfig:= TfrmConfig.Create(Self);
  AtualizaTelaContingencia;
  frmConfig.Show;

  //Ativar Componente Display
  {objAtivarDIS:= TMetodoAtivar.Create(obDIS);
  try
    IntegracaoConfig.Executar(Ok, objAtivarDIS, '', 3000);
    if ( copy(Ok,1,3) = cOK) then
      showmessage('Display ativado! '+ objAtivarDIS.RespostaUnica)
    else
      showmessage('Falha ao ativar Display! '+ Ok);
  finally
     MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
     objAtivarDIS.Free;  }

end;

procedure TfrmDemoPDV.SpeedButton5Click(Sender: TObject);
var
  Ok: String;
  objAtivarESC: TMetodoAtivar;
begin

  objAtivarESC:= TMetodoAtivar.Create(obESCPOS);
  try
    IntegracaoConfig.Executar(Ok, objAtivarESC, '', 3000);
    if ( copy(Ok,1,3) = cOK) then
      showmessage('ESCPOS ativado! '+ objAtivarESC.RespostaUnica)
    else
      showmessage('Falha ao ativar ESCPOS! '+ Ok);
  finally
     MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
     objAtivarESC.Free;
  end;
end;

procedure TfrmDemoPDV.SpeedButton6Click(Sender: TObject);
var
  Ok: String;
  objInicializarSAT: TSATInicializar;
begin

  objInicializarSAT:= TSATInicializar.Create();
  try
    IntegracaoConfig.Executar(Ok, objInicializarSAT, '', 10000);
    if ( copy(Ok,1,3) = cOK) then
      showmessage('SAT Inicializado '+ objInicializarSAT.RespostaUnica)
    else
      showmessage('Falha ao Inicializar SAT! '+ Ok);
  finally
     MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
     objInicializarSAT.Free;
  end;
end;

procedure TfrmDemoPDV.SpeedButton7Click(Sender: TObject);
var
  Ok: String;
  objConsultaStatusOperacional: TSATConsultarStatusOperacional;
begin

  objConsultaStatusOperacional:= TSATConsultarStatusOperacional.Create();
  try
    IntegracaoConfig.Executar(Ok, objConsultaStatusOperacional, '', 3000);
    if ( copy(Ok,1,3) <> cOK) then
      showmessage(objConsultaStatusOperacional.RespostaUnica)
  finally
     MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
     objConsultaStatusOperacional.Free;
  end;
end;

procedure TfrmDemoPDV.tbsFinalizaShow(Sender: TObject);
begin
  EscreverDisplay(1,'Venda Concluída');
end;

procedure TfrmDemoPDV.tbsPagamentoShow(Sender: TObject);
begin
  edtValor.SetFocus;
  EscreverDisplay(1,'Forma Pagamento');
end;

procedure TfrmDemoPDV.tbsVendaShow(Sender: TObject);
begin
  EscreverDisplay(1,'Ler Produto');
  edtCodigo.SetFocus;
end;

procedure TfrmDemoPDV.Timer1Timer(Sender: TObject);
var
  MyThread: TMyThread;
begin
  if (EnvioOff) and (not(IntegracaoConfig.OffLine)) and (IntegracaoConfig.ListaNFePendente.Count > 0) then
  begin
    MyThread := TMyThread.Create(True);
    try
      if not(Assigned(MyThread.FatalException)) then
        MyThread.Start;

    finally
       //MyThread.Terminate;
    end;
  end;
    //EnvioOffLine;
end;

procedure TfrmDemoPDV.FormCreate(Sender: TObject);
begin
  EnvioOff:= True;
  Item:= 0;
  TotalVenda:= 0;
  TotalPago:= 0;
  Troco:= 0;
  frmDemoPDV.Left:= 74;
  frmDemoPDV.Top:= 12;
  pnlCadastro.Visible:= False;
  pnlLerPeso.SendToBack;
  pageControlPDV.TabIndex := 0;
  pageControlPDV.ShowTabs:= False;
  setPage(pageControlPDV);

  BALAtivo:= False;
  LCBAtivo:= False;
  DISAtivo:= False;
  SATAtivo:= False;
  ESCAtivo:= False;
  NFCeAtivo:= False;

  lCFversao:= '';
  lCFCNPJ:= '';
  lCFsignAC:= '';
  lCFnumeroCaixa:= '';

  lCF_CRT:= '';
  lCF_Razao:= '';
  lCF_Fantasia:= '';
  lCF_Fone:= '';
  lCF_CEP:= '';
  lCF_Logradouro:= '';
  lCF_Numero:= '';
  lCF_Complemento:= '';
  lCF_Bairro:= '';
  lCF_CidadeCod:= '';
  lCF_Cidade:= '';
  lCF_UF:= '';

  lCFEmitCNPJ:= '';
  lCFEmitIE:= '';
  lCFEmitIM:= '';
  lCFEmitindRatISSQN:= '';

  lCFEmit_cUF:= 0;
  lCFEmit_natOp:= '';
  lCFEmit_indPag:= 0;
  lCFEmit_serie:= '';
  lCFEmit_nNF:= '';
  lCFEmit_dhEmi:= 0;
  lCFEmit_tpNF:= '';
  lCFEmit_idDest:= 0;
  lCFEmit_cMunFG:= '';
  lCFEmit_indFinal:= 0;
  lCFEmit_indPres:= 0;
  lCFEmit_tpimp:= 0;
  lCFEmit_tpEmis:= 0;
  lCFEmit_tpAmb:= 0;
  lCFEmit_dhCont:= 0;
  lCFEmit_xJust:= '';

  FIntegracaoConfig := TIntegracaoConfig.Create();

  ConfigEmissaoCFe;

  AtivarObjetosACBr;

  EscreverDisplay(1,'Iniciar Venda');

end;

procedure TfrmDemoPDV.FormDestroy(Sender: TObject);
begin
  DesAtivarObjetosACBr;
  FIntegracaoConfig.Free;
end;

procedure TfrmDemoPDV.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F3) and (spbVoltar.Enabled) then
    spbVoltar.Click;

  if (Key = VK_F4) and (spbProximo.Enabled) then
    spbProximo.Click;

  if (Key = VK_F5) and (btnCancelaRegistro.Enabled) then
    btnCancelaRegistro.Click;

  if (Key = VK_F6) and (btnRegistraVenda.Enabled) then
    btnRegistraVenda.Click;

  if (Key = VK_F7) and (btnPagar.Enabled) then
    btnPagar.Click;

  if (Key = VK_F8) and (btnEmitir.Enabled) then
    btnEmitir.Click;

end;

procedure TfrmDemoPDV.FormKeyPress(Sender: TObject; var Key: char);
begin
    if key = #13 then
    begin
      SelectNext(ActiveControl as TWinControl,True,True);
      key:= #0;
    end;
end;

procedure TfrmDemoPDV.FormShow(Sender: TObject);
begin
  edtCNPJ.SetFocus;
end;

procedure TfrmDemoPDV.edtCNPJKeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', #13, #8]) then
  Key := #0;

end;

procedure TfrmDemoPDV.edtCodigoEnter(Sender: TObject);
begin
  if (Trim(edtCodigo.Text) <> '') then
  begin
    edtPrecoUnitario.Text := FloatToStr((Item + 1) * 1.25);
    edtDescricao.Text := 'Produto Teste ' + IntToStr(Item + 1);
    calcItem( StrToFloatDef(edtQtde.Text,1), StrToFloatDef(edtPrecoUnitario.Text,1));
    EscreverDisplay(1, edtCodigo.Text + ' - ' + edtDescricao.Text);
  end;
end;

procedure TfrmDemoPDV.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = VK_F9 then
    edtCodigo.Text:= UltimaLeitura();


end;

procedure TfrmDemoPDV.edtCPFExit(Sender: TObject);
begin
  if (Length(OnlyNumber(edtCPF.text)) > 9) and (Length(OnlyNumber(edtCPF.text)) < 12) then
    begin
      with ACBrValidador1 do
      begin
        AjustarTamanho:= True;
        TipoDocto:= docCPF;
        Documento:= edtCPF.Text;
        edtCPF.Text:= Formatar;
      end
    end
    else
    begin
      with ACBrValidador1 do
      begin
        AjustarTamanho:= True;
        TipoDocto:= docCNPJ;
        Documento:= edtCPF.Text;
        edtCPF.Text:= Formatar;
      end;
    end;


  edtCNPJ.Text:= edtCPF.Text;
end;

procedure TfrmDemoPDV.edtCPFKeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', #13, #8]) then
  Key := #0;
end;

procedure TfrmDemoPDV.edtPesoEnter(Sender: TObject);
begin
  //Realiza chamada componente Balança
  //if (StrToFloatDef(edtPeso.Text,0) = 0 ) then
    //edtPeso.Text:=  FormatFloat('#,###0.000', LerPeso() );
end;

procedure TfrmDemoPDV.edtPesoExit(Sender: TObject);
begin
  if (StrToFloatDef(edtPeso.text,0) > 0) then
  begin
    edtQtde.Text:= FormatFloat('#,###0.000', StrToFloatDef(edtPeso.text,0) );
    edtPeso.Text:= '0,000';
    pnlLerPeso.SendToBack;
    edtQtde.SetFocus;
  end;
end;

procedure TfrmDemoPDV.edtPesoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F9 then
    edtPeso.Text:=  FormatFloat('#,###0.000', LerPeso() );
end;

procedure TfrmDemoPDV.edtPesoKeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', #13, #8, #44]) then
    Key := #0;

end;

procedure TfrmDemoPDV.edtQtdeEnter(Sender: TObject);
begin
  calcItem( StrToFloatDef(edtQtde.Text,1), StrToFloatDef(edtPrecoUnitario.Text,1));
end;

procedure TfrmDemoPDV.edtQtdeExit(Sender: TObject);
begin
  if (StrToFloatDef(edtQtde.Text,0) <= 0) then
  begin
    pnlLerPeso.BringToFront;
    edtPeso.SetFocus;
  end
  else
    calcItem( StrToFloatDef(edtQtde.Text,1), StrToFloatDef(edtPrecoUnitario.Text,1));
end;

procedure TfrmDemoPDV.edtQtdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F9 then
   begin
    pnlLerPeso.BringToFront;
    edtPeso.SetFocus;
  end
end;

procedure TfrmDemoPDV.edtQtdeKeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', #13, #8, #44]) then
    Key := #0;
end;

procedure TfrmDemoPDV.edtValorEnter(Sender: TObject);
begin
  calcPagamento(TotalVenda, StrToFloatDef(edtValor.Text,0));
  edtValor.text := FormatFloat('#,##0.00', StrToFloatDef(edtValor.text,0) );
end;

procedure TfrmDemoPDV.edtValorKeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', #13, #8, #44]) then
    Key := #0;
end;

procedure TfrmDemoPDV.edtCNPJExit(Sender: TObject);
begin
  if (trim(edtCNPJ.Text) <> '') then
  begin
    pnlCadastro.Visible:= True;

    if (Length(OnlyNumber(edtCNPJ.text)) > 9) and (Length(OnlyNumber(edtCNPJ.text)) < 12) then
    begin
      with ACBrValidador1 do
      begin
        AjustarTamanho:= True;
        TipoDocto:= docCPF;
        Documento:= edtCNPJ.Text;
        edtCNPJ.Text:= Formatar;
      end
    end
    else
    begin
      with ACBrValidador1 do
      begin
        AjustarTamanho:= True;
        TipoDocto:= docCNPJ;
        Documento:= edtCNPJ.Text;
        edtCNPJ.Text:= Formatar;
      end;
    end;


    edtcpf.Text:= edtCNPJ.Text;

    edtCPF.SetFocus;
  end;
end;

procedure TfrmDemoPDV.edtClienteExit(Sender: TObject);
begin
  edtNome.Text:= edtCliente.Text;
end;

procedure TfrmDemoPDV.edtCNPJEnter(Sender: TObject);
begin
    EscreverDisplay(1,'CPF Cliente');
end;

procedure TfrmDemoPDV.btnPagarClick(Sender: TObject);
begin
  if (Troco >= 0) and (TotalPago > 0) then
  begin
    spbProximo.Click;
    //ESCAbrirGaveta();
  end
  else
    ShowMessage('Pagamento Incompleto');
end;

procedure TfrmDemoPDV.btnCancelaRegistroClick(Sender: TObject);
begin
  IniciaRegistro;
  edtCodigo.SetFocus;
end;

procedure TfrmDemoPDV.btnEmitirClick(Sender: TObject);
begin

  if CriarEnviarCFe then
  begin
    IniciaVenda;
    pageControlPDV.ActivePageIndex:= 0;
    setPage(pageControlPDV);
  end;
end;

procedure TfrmDemoPDV.btnRegistraVendaClick(Sender: TObject);
begin
if (Trim(edtCodigo.Text) <> '') and (StrToFloatDef(edtQtde.Text,0) > 0) then
  begin
    addProduto(edtCodigo.Text, edtQtde.Text, edtPrecoUnitario.Text, edtDescricao.Text, edtTotalItem.Text);
    Inc(Item);
    TotalVenda:= TotalVenda + StrToFloatDef(edtTotalItem.text,0);
    IniciaRegistro;
    edtCodigo.SetFocus;
  end
  else
    ShowMessage('Produto Inválido');
end;

procedure TfrmDemoPDV.edtAPagarTrocoChange(Sender: TObject);
begin
  if (Troco < 0) then
    edtAPagarTroco.Font.Color:= clRed
  else
    edtAPagarTroco.Font.Color:= clBlack;
end;

procedure TfrmDemoPDV.edtCEPExit(Sender: TObject);
begin
  ConsultaCEP(edtCEP.Text);
end;

procedure TfrmDemoPDV.setPage(Sender: TPageControl);
begin
  spbVoltar.Enabled := True;
  spbProximo.Enabled:= True;
  pnlCadastro.Visible:= False;

  case Sender.TabIndex of
    0: spbVoltar.Enabled := False;
    3: spbProximo.Enabled:= False;
  end;
end;

procedure TfrmDemoPDV.setNextPage(Sender: TPageControl);
begin
  Sender.ActivePageIndex:= (Sender.PageIndex) + 1;
  setPage(Sender);
end;

procedure TfrmDemoPDV.setBackPage(Sender: TPageControl);
begin
  Sender.ActivePageIndex:= (Sender.PageIndex) - 1;
  setPage(Sender);
end;

procedure TfrmDemoPDV.setPagamento(Sender: TRadioGroup);
begin
  case Sender.ItemIndex of
    0: edtPagamento.Text:= Sender.Items.Strings[0];
    1: edtPagamento.Text:= Sender.Items.Strings[1];
    2: edtPagamento.Text:= Sender.Items.Strings[2];
    3: edtPagamento.Text:= Sender.Items.Strings[3];
    else
      edtPagamento.Text:= Sender.Items.Strings[0];
  end;

end;

procedure TfrmDemoPDV.addProduto(cod, qtde, Preco, Descricao, Total: String);
begin
  with MemDataset1 do
  Begin
    if not Active then
      Open;
    Insert;
    FieldByName('Codigo').AsString:= cod;
    FieldByName('qtde').AsString:= qtde;
    FieldByName('Preco').AsString:= Preco;
    FieldByName('Descricao').AsString:= Descricao;
    FieldByName('Total').AsString:= Total;
    Post;
  end;
end;

procedure TfrmDemoPDV.calcItem(qtde: Double; Preco: Double);
var
  TotVenda: String;
  TotItem: String;
begin
  TotItem:= FormatFloat('#,##0.00', (qtde * Preco) );
  TotVenda:= FormatFloat('#,##0.00', (TotalVenda + (qtde * Preco)) );
  edtTotalItem.Text:= TotItem;
  edtTotalVenda1.Text:= TotVenda;
  edtTotalVenda2.Text:= TotVenda;
  edtTotalVenda3.Text:= TotVenda;
end;

procedure TfrmDemoPDV.IniciaRegistro;
begin
  edtCodigo.Clear;
  edtDescricao.clear;
  edtQtde.Text:= '0';
  edtPrecoUnitario.Text:= '0,00';
  edtTotalItem.Text:= '0,00';
  EscreverDisplay(1,'Ler Produto');

end;

procedure TfrmDemoPDV.calcPagamento(vlrTotal, vlrPago: Double);
begin
  if vlrPago > 0 then
  begin
    TotalPago := vlrPago;
    Troco := vlrPago - vlrTotal;
    edtAPagarTroco.Text:= FormatFloat('#,##0.00', Troco );
    edtTotalPago.Text:= FormatFloat('#,##0.00', TotalPago );
    edtTroco.Text:= FormatFloat('#,##0.00', Troco );

    if (Troco > 0 ) then
      EscreverDisplay(1,'Troco: '+ FormatFloat('#,##0.00', Troco ))
    else
      EscreverDisplay(1,'Valor Recebido: '+ FormatFloat('#,##0.00', TotalPago ));
  end;
end;

procedure TfrmDemoPDV.IniciaVenda;
begin
  Item:= 0;
  TotalVenda:= 0;
  TotalPago:= 0;
  Troco:= 0;
  IniciaRegistro;
  edtcnpj.Clear;
  edtNome.Clear;
  edtCPF.Clear;
  edtCliente.Clear;
  edtCEP.Clear;
  edtFone.Clear;
  edtEmail.Clear;
  StringGrid1.Rows[1].Clear;
  edtAPagarTroco.Text:= FormatFloat('#,##0.00', 0 );
  edtValor.Text:= FormatFloat('#,##0.00', 0 );
  edtTotalPago.Text:= FormatFloat('#,##0.00', 0 );
  edtTroco.Text:= FormatFloat('#,##0.00', 0 );
  edtTotalVenda1.Text:= FormatFloat('#,##0.00', 0 );
  edtTotalVenda2.Text:= FormatFloat('#,##0.00', 0 );
  edtTotalVenda3.Text:= FormatFloat('#,##0.00', 0 );
  MemDataset1.close;
  MemDataset1.Clear(False);
  EscreverDisplay(1,'Iniciar Venda');
end;

procedure TfrmDemoPDV.MonitoraIntegracao(PathLog: String);
var
  SL: TStringList;
begin
  memMonitor.Clear;
  if FileExists(PathLog) then
  begin
    SL:= TStringList.Create;
    try
      SL.LoadFromFile(PathLog);
      memMonitor.Lines:= SL;
      SendMessage(memMonitor.Handle, WM_VSCROLL, SB_BOTTOM, 0);
    finally
      SL.Free;
    end;

  end;
end;

procedure TfrmDemoPDV.AtivarObjetosACBr;
//var
  //Ok: String;
  //objAtivarBAL: TMetodoAtivar;
  //objAtivarLCB: TMetodoAtivar;
  //objAtivarDIS: TMetodoAtivar;
  //objAtivarESC: TMetodoAtivar;
  //objInicializarSAT: TSATInicializar;
begin

  {objAtivarBAL:= TMetodoAtivar.Create(obBAL);
  try
    IntegracaoConfig.Executar(Ok, objAtivarBAL, '', 3000);
    BALAtivo:= ( copy(Ok,1,3) = cOK);
  finally
     MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
     objAtivarBAL.Free;
  end; }

  {objAtivarLCB:= TMetodoAtivar.Create(obLCB);
  try
    IntegracaoConfig.Executar(Ok, objAtivarLCB, '', 3000);
    LCBAtivo:= ( copy(Ok,1,3) = cOK);
  finally
     MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
     objAtivarLCB.Free;
  end;}

  {objAtivarDIS:= TMetodoAtivar.Create(obDIS);
  try
    IntegracaoConfig.Executar(Ok, objAtivarDIS, '', 3000);
    DISAtivo:= ( copy(Ok,1,3) = cOK);
  finally
     MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
     objAtivarDIS.Free;
  end;
  DISAtivo:= False;} //Não tem aparelho

  {objAtivarESC:= TMetodoAtivar.Create(obESCPOS);
  try
    IntegracaoConfig.Executar(Ok, objAtivarESC, '', 3000);
    ESCAtivo:= ( copy(Ok,1,3) = cOK);
  finally
     MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
     objAtivarESC.Free;
  end;}

  {objInicializarSAT:= TSATInicializar.Create(obSAT);
  try
    IntegracaoConfig.Executar(Ok, objInicializarSAT, '', 3000);
    SATAtivo:= ( copy(Ok,1,3) = cOK);
  finally
     MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
     objInicializarSAT.Free;
  end;}

  NFCeAtivo:= True;

end;

procedure TfrmDemoPDV.DesAtivarObjetosACBr;
{var
  Ok: String;
  objDesAtivarBAL: TMetodoDesativar;
  objDesAtivarLCB: TMetodoDesAtivar;
  objDesAtivarDIS: TMetodoDesAtivar;
  objDesAtivarESC: TMetodoDesAtivar;
  objDesInicializarSAT: TSATDesInicializar; }
begin

  {objDesAtivarBAL:= TMetodoDesativar.Create(obBAL);
  try
    IntegracaoConfig.Executar(Ok, objDesAtivarBAL, '', 1000);
  finally
     MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
     objDesAtivarBAL.Free;
  end;

  objDesAtivarLCB:= TMetodoDesativar.Create(obLCB);
  try
    IntegracaoConfig.Executar(Ok, objDesAtivarLCB, '', 1000);
  finally
     MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
     objDesAtivarLCB.Free;
  end;

  objDesAtivarDIS:= TMetodoDesativar.Create(obDIS);
  try
    IntegracaoConfig.Executar(Ok, objDesAtivarDIS, '', 1000);
  finally
     MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
     objDesAtivarDIS.Free;
  end;

  objDesAtivarESC:= TMetodoDesativar.Create(obESCPOS);
  try
    IntegracaoConfig.Executar(Ok, objDesAtivarESC, '', 1000);
  finally
     MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
     objDesAtivarESC.Free;
  end;

  objDesInicializarSAT:= TSATDesInicializar.Create(obSAT);
  try
    IntegracaoConfig.Executar(Ok, objDesInicializarSAT, '', 3000);
  finally
     MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
     objDesInicializarSAT.Free;
  end;   }

end;

procedure TfrmDemoPDV.ConfigEmissaoCFe;
begin
  IntegracaoConfig.ParametrizarPathIntegracao(False);

  lCFversao:= '0.07';
  lCFCNPJ:= FIntegracaoConfig.CampoCNPJ;
  lCFsignAC:=  FIntegracaoConfig.CampoSignAC;
  lCFnumeroCaixa:= FIntegracaoConfig.CamponumeroCaixa;
  lCF_CRT:= FIntegracaoConfig.Campo_CRT;
  lCF_Razao:= FIntegracaoConfig.Campo_Razao;
  lCF_Fantasia:= FIntegracaoConfig.Campo_Fantasia;
  lCF_Fone:= FIntegracaoConfig.Campo_Fone;
  lCF_CEP:= FIntegracaoConfig.Campo_CEP;
  lCF_Logradouro:= FIntegracaoConfig.Campo_Logradouro;
  lCF_Numero:= FIntegracaoConfig.Campo_Numero;
  lCF_Complemento:= FIntegracaoConfig.Campo_Complemento;
  lCF_Bairro:= FIntegracaoConfig.Campo_Bairro;
  lCF_CidadeCod:= FIntegracaoConfig.Campo_CidadeCod;
  lCF_Cidade:= FIntegracaoConfig.Campo_Cidade;
  lCF_UF:= FIntegracaoConfig.Campo_UF;

  lCFEmitCNPJ:= FIntegracaoConfig.CampoCNPJEmit;
  lCFEmitIE:= FIntegracaoConfig.CampoIEEmit;
  lCFEmitIM:= FIntegracaoConfig.CampoIMEmit;
  lCFEmitindRatISSQN:= FIntegracaoConfig.CampoindRatISSQNEmit;

  lCFEmit_cUF:= FIntegracaoConfig.Campo_cUF;
  lCFEmit_natOp:= FIntegracaoConfig.Campo_natOp;
  lCFEmit_indPag:= FIntegracaoConfig.Campo_indPag;
  lCFEmit_serie:= FIntegracaoConfig.Campo_serie;
  lCFEmit_nNF:= FIntegracaoConfig.Campo_nNF;
  lCFEmit_dhEmi:= FIntegracaoConfig.Campo_dhEmi;
  lCFEmit_tpNF:= FIntegracaoConfig.Campo_tpNF;
  lCFEmit_idDest:= FIntegracaoConfig.Campo_idDest;
  lCFEmit_cMunFG:= FIntegracaoConfig.Campo_cMunFG;
  lCFEmit_indFinal:= FIntegracaoConfig.Campo_indFinal;
  lCFEmit_indPres:= FIntegracaoConfig.Campo_indPres;
  lCFEmit_tpimp:= FIntegracaoConfig.Campo_tpimp;
  lCFEmit_tpEmis:= FIntegracaoConfig.Campo_tpEmis;
  lCFEmit_tpAmb:= FIntegracaoConfig.Campo_tpAmb;
  lCFEmit_dhCont:= FIntegracaoConfig.Campo_dhCont;
  lCFEmit_xJust:= FIntegracaoConfig.Campo_xJust;

end;

procedure TfrmDemoPDV.AtualizaTelaContingencia;
begin
  if Assigned(frmConfig) then
  begin
    AtualizaBotaoOffLine( IntegracaoConfig.OffLine );
    if IntegracaoConfig.NFCePendente > 0 then
      frmConfig.lblPendenteEnvio.Caption:= FormatFloat('###0', IntegracaoConfig.NFCePendente) + ' - OffLine'
    else
      frmConfig.lblPendenteEnvio.Caption:= '0';

    if IntegracaoConfig.TempoContingencia > 0 then
      frmconfig.lblTempoContingencia.Caption:= FormatFloat('###0',MinuteSpan(IntegracaoConfig.TempoContingencia,now))+ ' - Min.'
    else
      frmconfig.lblTempoContingencia.Caption:= '0';

  end;
end;

function TfrmDemoPDV.EmissaoOffLine: Boolean;
var
  paramPathCFeVenda: String;
  cont: Integer;
begin
  Result:= False;
  paramPathCFeVenda:= '';
  if not(IntegracaoConfig.OffLine) then
  begin
    if LigarOffLine(true) then
    begin
      paramPathCFeVenda:= CriarNFCe();
      if ImprimirDanfe(paramPathCFeVenda) then
      begin
        Result:= True;
        cont:= IntegracaoConfig.NFCePendente + 1;
        IntegracaoConfig.NFCePendente:=  cont;
        if (IntegracaoConfig.TempoContingencia <= 0) then
          IntegracaoConfig.TempoContingencia:= Now;
      end;

    end;
  end
  else
  begin
    paramPathCFeVenda:= CriarNFCe();
    if ImprimirDanfe(paramPathCFeVenda) then
    begin
      Result:= True;
      cont:= IntegracaoConfig.NFCePendente + 1;
      IntegracaoConfig.NFCePendente:= cont;
    end;
  end;

end;

procedure TfrmDemoPDV.AdicionarNFePendente;
var
  NFePendente: TNFePendente;
begin
   NFePendente:= IntegracaoConfig.AdicionarNFePendente;
   with NFePendente do
   begin
      ChavePendente:= IntegracaoConfig.ChavePendente;
      DataHora:= now;
      Erro:= '';
      cStat:= '';
      MsgRetorno:= '';
      ChaveRelacionada:= IntegracaoConfig.ChaveRelacionada;
      chaveCancelada:= False;
      ChaveInutilizada:= False;
      AjusteReenvio:= False;
      Transmitida:= False;
   end;
end;

procedure TfrmDemoPDV.EnvioOffLine;
var
  I: Integer;
  lcStat, lMsg: String;
  lProt: String;
begin
  if (not(IntegracaoConfig.OffLine)) and (IntegracaoConfig.ListaNFePendente.Count > 0) then
  begin
      EnvioOff:= False;
      for I:= 0 to IntegracaoConfig.ListaNFePendente.Count - 1 do
      begin
        lcStat:= '';
        lMsg:= '';
        if (not(IntegracaoConfig.ListaNFePendente[I].AjusteReenvio)) and (not(IntegracaoConfig.ListaNFePendente[I].Transmitida)) then
        begin
          if EnviarNFe(lcStat, lMsg, IntegracaoConfig.ListaNFePendente[I].ChavePendente) then
          begin
            if NaoEstaVazio( IntegracaoConfig.ListaNFePendente[I].ChaveRelacionada ) then
            begin
              if ConsultarNFe(IntegracaoConfig.ListaNFePendente[I].ChaveRelacionada, lProt) then
              begin
                //cancelamento por subst
                if CancelamentoSubstituicao( IntegracaoConfig.ListaNFePendente[I].ChavePendente,
                                            IntegracaoConfig.ListaNFePendente[I].ChaveRelacionada, lProt) then
                  IntegracaoConfig.ListaNFePendente[I].ChaveCancelada:= True;
              end
              else
              begin
                //inutiliza
                if InutilizarNFe(IntegracaoConfig.ListaNFePendente[I].ChaveRelacionada) then
                  IntegracaoConfig.ListaNFePendente[I].ChaveInutilizada:= True;
              end;
            end;
            if (IntegracaoConfig.NFCePendente > 0) then
              IntegracaoConfig.NFCePendente:= IntegracaoConfig.NFCePendente - 1;
            IntegracaoConfig.TempoContingencia:= 0;
            IntegracaoConfig.ListaNFePendente[I].Transmitida:= True;
            AtualizaTelaContingencia;
          end
          else
          begin
            if NaoEstaVazio(lcStat) then
            begin
              IntegracaoConfig.ListaNFePendente[I].cStat:= lcStat;
              IntegracaoConfig.ListaNFePendente[I].MsgRetorno:= lMsg;
              IntegracaoConfig.ListaNFePendente[I].AjusteReenvio:= True;
            end;

          end;

        end;
      end;
      EnvioOff:= True;
  end;
end;

procedure TfrmDemoPDV.AtualizaBotaoOffLine(OffLine: Boolean);
begin
  if not(OffLine) then
  begin
    frmConfig.BitBtn1.Kind:= bkIgnore;
    frmConfig.BitBtn1.Caption:= 'Ativar Off-Line';
    frmConfig.BitBtn1.Tag:= 0;   //on-line
  end
  else
  begin
    frmConfig.BitBtn1.Kind:= bkOK;
    frmConfig.BitBtn1.Caption:= 'Ativar On-Line';
    frmConfig.BitBtn1.Tag:= 1;  //off-line
  end;
end;

//CEP.BuscarPorCEP( "18270170" )
procedure TfrmDemoPDV.ConsultaCEP(Cep: String);
var
  paramCEP: String;
  Ok: String;
  objResp: TCEPResposta;
begin
  paramCEP := AspasDuplas(trim(edtCEP.Text));

  if Length(cep) = 8 then
  begin
    objResp:= TCEPResposta.Create();
    try
     IntegracaoConfig.Executar(Ok, objResp, paramCEP, 5000);
      if ( copy(Ok,1,3) = cOK) then
      Begin
        StringGrid1.Cells[0,1]:=  objResp.Logradouro;
        StringGrid1.Cells[2,1]:=  objResp.Bairro;
        StringGrid1.Cells[3,1]:=  objResp.Complemento;
        StringGrid1.Cells[4,1]:=  objResp.Municipio;
        StringGrid1.Cells[5,1]:=  objResp.UF;
      end
      else
          showmessage('Falha na Consulta CEP! '+ Ok);
    finally
      MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
      objResp.Free;
    end;

  end
  else if Length(cep) > 0 then
    showmessage('CEP Inválido');
end;

//BAL.LePeso( "3000" )
function TfrmDemoPDV.LerPeso(): Double;
var
  paramBAL: String;
  Ok: String;
  objResp: TBALResposta;
  pesoInt: Integer;
begin
  Result:= 0;
  if BALAtivo then
  begin
    paramBAL := AspasDuplas(trim('3000'));

    objResp:= TBALResposta.Create();
    try
      IntegracaoConfig.Executar(Ok, objResp, paramBAL, 3000);
      if ( copy(Ok,1,3) = cOK) then
        Result:= objResp.Peso
      else
        showmessage('Falha na Leitura Balança! '+ Ok);

      if (objResp.Peso < 0) then
      begin
        Result:= 0;
        PesoInt :=  Trunc( objResp.Peso ) ;

        case PesoInt of
         -1 : showmessage('Peso Instável !') ;
         -2 : showmessage('Peso Negativo !') ;
         -10: showmessage('Sobrepeso !') ;
        end;

      end;

    finally
       MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
       objResp.Free;
    end;

  end;

end;

function TfrmDemoPDV.UltimaLeitura(): String;
var
  Ok: String;
  objResp: TLCBResposta;
begin
  Result:= '';
  if LCBAtivo then
  begin
    objResp:= TLCBResposta.Create();
    try
      IntegracaoConfig.Executar(Ok, objResp, '', 3000);
      if ( copy(Ok,1,3) = cOK) then
        Result:= objResp.Codigo
      else
        showmessage('Falha na Leitura Código Barras! '+ Ok);

    finally
       MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
       objResp.Free;
    end;

  end;
end;

procedure TfrmDemoPDV.EscreverDisplay(linha: Integer; Msg: String);
var
  Ok: String;
  objResp: TDISResposta;
  objLimparDisplay: TDISLimparDisplay;
  paramDIS: String;
begin
  if DISAtivo then
  begin
    objLimparDisplay:= TDISLimparDisplay.Create();
    try
      IntegracaoConfig.Executar(Ok, objLimparDisplay, '', 3000);
    finally
       MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
       objLimparDisplay.Free;
    end;

    paramDIS := inttostr(linha) +','+ AspasDuplas(trim(msg));
    objResp:= TDISResposta.Create();
    try
      IntegracaoConfig.Executar(Ok, objResp, paramDIS, 3000);
    finally
       MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
       objResp.Free;
    end;

  end;
    lblTitulo.Caption:= Msg;
    lblTitulo.Refresh;
end;

procedure TfrmDemoPDV.ESCAbrirGaveta();
var
  Ok: String;
  objResp: TESCImprimirLinha;
  paramESC: String;
  objAtivarESC: TMetodoAtivar;
begin
  objAtivarESC:= TMetodoAtivar.Create(obESCPOS);
  try
    IntegracaoConfig.Executar(Ok, objAtivarESC, '', 3000);
    ESCAtivo:= ( copy(Ok,1,3) = cOK);
  finally
     MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
     objAtivarESC.Free;
  end;

  if ESCAtivo then
  begin
    paramESC := AspasDuplas( cAbreTagGaveta + '1' + cFechaTagGaveta );
    objResp:= TESCImprimirLinha.Create();
    try
      IntegracaoConfig.Executar(Ok, objResp, paramESC, 3000);
    finally
       MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
       objResp.Free;
    end;

  end;

end;

function TfrmDemoPDV.CriarEnviarCFe():Boolean;
var
  paramPathCFe: String;
  paramPathCFeVenda: String;
  Ok: String;
  objResp: TSATCriarEnviarCFe;
  objRespNFe: TNFeCriarEnviarNFe;
  lChave: String;
begin
  Result:= False;
  EscreverDisplay(1,'Emitindo Cupom');

  paramPathCFeVenda := '';
  if NFCeAtivo then
  begin
    if not(IntegracaoConfig.OffLine) then
    begin
      //IntegracaoConfig.ChaveRelacionada:= '';
      paramPathCFe := AspasDuplas(GerarIniNFCe(False, lChave)) + ',1,1,1';
      objRespNFe:= TNFeCriarEnviarNFe.Create();
      try
       IntegracaoConfig.Executar(Ok, objRespNFe , paramPathCFe, 30000);
        if ( copy(Ok,1,3) = cOK) and ( objRespNFe.cStat in [100, 150] ) then
          Result:= true
        else
        if ( copy(Ok,1,3) = cOK)  then
        begin
          IntegracaoConfig.Relaciona:= True;
          if EmissaoOffLine then
            Result:= True;
        end
        else
        begin
          IntegracaoConfig.Relaciona:= True;
          if EmissaoOffLine then
          Result:= true;

        end;

      finally
        MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
        objRespNFe.Free;
      end

    end
    else if EmissaoOffLine then
      Result:= True;

  end
  else
  begin
    if SATAtivo then
    begin
      paramPathCFe := GerarIniCFe();
      objResp:= TSATCriarEnviarCFe.Create();
      try
       IntegracaoConfig.Executar(Ok, objResp , AspasDuplas( paramPathCFe ), 30000);
        if ( copy(Ok,1,3) = cOK) and ( copy( objResp.CodigoDeRetorno, 1, 4) = '6000' ) then
        begin
          Result:= true;
          paramPathCFeVenda:=  objResp.Arquivo;
        end
        else
          showmessage('Falha ao Gerar CFe! '+ Ok);
      finally
        MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
        objResp.Free;
      end;
      if NaoEstaVazio(paramPathCFeVenda) then
        ImprimirExtratoCFe(  paramPathCFeVenda ) ;

    end
    else
      showmessage('SAT não inicializado');

  end;


end;

function TfrmDemoPDV.EnviarNFe(var AcStat: String; var AMsg: String; const Achave: String): Boolean;
var
  objRespNFe: TNFeEnviarNFe;
  paramPathNFe: String;
  Ok: String;
begin
  Result:= False;
  paramPathNFe :=  AspasDuplas(PathWithDelim(cPathEntradaDefault) + cLogs + PathDelim + Achave + cnfe + '.xml') +',,,,,1' ;
  objRespNFe:= TNFeEnviarNFe.Create();
  try
    IntegracaoConfig.Executar(Ok, objRespNFe , paramPathNFe, 30000);
    if ( copy(Ok,1,3) = cOK) and ( objRespNFe.cStat in [100, 150] ) then
    begin
      Result:= true;
    end
    else if ( copy(Ok,1,3) = cOK ) then
    begin
      Result:= False;
      AcStat:= IntToStrZero(objRespNFe.cStat,3);
      AMsg:= objRespNFe.xMotivo;
      LigarOffLine(True);
    end
    else
    begin
      Result := False;
      LigarOffLine(True);
    end;

  finally
    MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
    objRespNFe.Free;
  end

end;

function TfrmDemoPDV.CriarNFCe(): String;
var
  paramPathCFe: String;
  Ok, lChave: String;
  objRespNFe: TNFeCriarNFe;
begin
  Result:= '';

    paramPathCFe := AspasDuplas(GerarIniNFCe(True, lChave)) + ',0,1';
    objRespNFe:= TNFeCriarNFe.Create();
    try
     IntegracaoConfig.Executar(Ok, objRespNFe , paramPathCFe, 30000);
      if ( copy(Ok,1,3) = cOK)  then
        Result:= PathWithDelim(cPathEntradaDefault) + cLogs + PathDelim + lChave + cnfe + '.xml'
      else
        showmessage('Falha ao Criar NFCe OFF-Line! '+ Ok);

    finally
      MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
      objRespNFe.Free;
    end;

end;

function TfrmDemoPDV.SetFormaEmissao(tp: integer): Boolean;
var
  Ok: String;
  objRespNFe: TNFeSetFormaEmissao;
begin
  Result := False;
  objRespNFe:= TNFeSetFormaEmissao.Create();
  try
    IntegracaoConfig.Executar(Ok, objRespNFe , inttostr(tp), 30000);
    if ( copy(Ok,1,3) = cOK)  then
      result:= True;

  finally
    MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
    objRespNFe.Free;
  end;
end;

function TfrmDemoPDV.StatusServicoNFe: Boolean;
var
  Ok: String;
  objRespNFe: TNFeStatusServico;
begin
  Result := False;
  objRespNFe:= TNFeStatusServico.Create();
  try
    IntegracaoConfig.Executar(Ok, objRespNFe , '', 30000);
    if ( copy(Ok,1,3) = cOK)  then
      result:= True;

  finally
    MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
    objRespNFe.Free;
  end;

end;

function TfrmDemoPDV.GerarChave(uf, cod, modelo, serie, numero, tpemi, emissao, cnpj: String): String;
var
  Ok: String;
  objResp: TNFeGerarChave;
  paramsPath: String;
begin
    Result:= '';
    paramsPath := AspasDuplas( uf ) + ',' +
                  AspasDuplas( cod ) + ',' +
                  AspasDuplas( modelo ) + ',' +
                  AspasDuplas( serie ) + ',' +
                  AspasDuplas( numero ) + ',' +
                  AspasDuplas( tpemi ) + ',' +
                  AspasDuplas( emissao ) + ',' +
                  AspasDuplas( cnpj );
    objResp:= TNFeGerarChave.Create();
    try
      IntegracaoConfig.Executar(Ok, objResp, paramsPath, 30000, True);
      Result := copy(Ok,5,44);
    finally
       MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
       objResp.Free;
    end;

end;

procedure TfrmDemoPDV.ImprimirExtratoCFe(pathXMLVenda: String);
var
  Ok: String;
  objResp: TSATImprimirExtratoVenda;
  paramsPath: String;
begin
  if FileExists(pathXMLVenda) then
  begin
    paramsPath := AspasDuplas( pathXMLVenda );
    objResp:= TSATImprimirExtratoVenda.Create();
    try
      IntegracaoConfig.Executar(Ok, objResp, paramsPath, 30000);
    finally
       MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
       objResp.Free;
    end;

  end
  else
    showmessage('XML de Venda não localizado em: '+ paramsPath);


end;

function TfrmDemoPDV.ImprimirDanfe(pathXML: String): Boolean;
var
  Ok: String;
  objResp: TNFeImprimirDANFe;
  paramsPath: String;
begin
  Result:= False;
  if FileExists(pathXML) then
  begin
    paramsPath := AspasDuplas( pathXML );
    objResp:= TNFeImprimirDANFe.Create();
    try
      IntegracaoConfig.Executar(Ok, objResp, paramsPath, 30000);
      Result:= True;
    finally
       MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
       objResp.Free;
    end;

    paramsPath := AspasDuplas( pathXML ) + ',,,,,,1' ;
    objResp:= TNFeImprimirDANFe.Create();
    try
      IntegracaoConfig.Executar(Ok, objResp, paramsPath, 30000);
      Result:= True;
    finally
       MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
       objResp.Free;
    end;

  end
  else
    showmessage('XML não localizado em: '+ paramsPath);
end;

function TfrmDemoPDV.GerarIniCFe():String;
var
  lINI: TMemIniFile;
  PathINI: String;
  SL: TStringList;
  vInc: Integer;
  secao: String;
begin
  vInc:= 0;
  secao:= '';
  PathINI:= PathWithDelim(ExtractFilePath(Application.ExeName)) + cCFeINI;

  if FileExists( PathINI ) then
    TryDeleteFile(PathINI, 1000);

  LINI := TMemIniFile.Create('');
  try
    LINI.WriteString( csecaoInfCFe , cCampoversao, lCFversao  );

    LINI.WriteString( csecaoIdentificacao , cCampoCNPJ, lCFCNPJ  );
    LINI.WriteString( csecaoIdentificacao , cCampoSignAC, lCFsignAC  );
    LINI.WriteString( csecaoIdentificacao , cCamponumeroCaixa, lCFnumeroCaixa  );

    LINI.WriteString( csecaoEmitente , cCampoCNPJEmit, lCFEmitCNPJ  );
    LINI.WriteString( csecaoEmitente , cCampoIEEmit, lCFEmitIE  );
    LINI.WriteString( csecaoEmitente , cCampoIMEmit, lCFEmitIM  );
    LINI.WriteString( csecaoEmitente , cCampoindRatISSQNEmit, lCFEmitindRatISSQN  );

    LINI.WriteString( csecaoDestinatario , cCampoCNPJCPFDest, trim(edtCNPJ.Text)  );
    LINI.WriteString( csecaoDestinatario , cCampoNomeDest, trim(edtNome.Text) );

    with MemDataset1 do
    begin
      DisableControls;
      First;

      while not EOF do
      begin
        inc(vInc);

        secao := csecaoProduto + IntToStrZero(vInc, 3);
        LINI.WriteString( secao , cCampocProd, FieldByName('Codigo').AsString  );
        LINI.WriteString( secao , cCampoxProd, FieldByName('Descricao').AsString  );
        LINI.WriteString( secao , cCampoNCM, cNCMPadrao  );
        LINI.WriteString( secao , cCampoCFOP, cCFOPpadrao  );
        LINI.WriteString( secao , cCampouCom, cComPadrao  );
        LINI.WriteString( secao , cCampoCombustivel, '0'  );
        LINI.WriteString( secao , cCampoqCom, FieldByName('Qtde').AsString  );
        LINI.WriteString( secao , cCampovUnCom, FieldByName('Preco').AsString  );
        LINI.WriteString( secao , cCampoindRegra, 'A'  );
        LINI.WriteString( secao , cCampovItem, FieldByName('Preco').AsString  );

        secao := csecaoICMS + IntToStrZero(vInc, 3);
        LINI.WriteString( secao , cCampoOrig, '0'  );
        LINI.WriteString( secao , cCampoCSOSN, cCSONpadrao  );

        secao := csecaoPIS + IntToStrZero(vInc, 3);
        LINI.WriteString( secao , cCampoCST, cCSTpadrao  );

        secao := csecaoCOFINS + IntToStrZero(vInc, 3);
        LINI.WriteString( secao , cCampoCST, cCSTpadrao  );

        Next;
      end;

      EnableControls;
    end;

    LINI.WriteString( csecaoDescAcrEntr , cCampovDescSubtot, '0'  );
    LINI.WriteString( csecaoDescAcrEntr , cCampovAcresSubtot, '0'  );

    LINI.WriteString( csecaoTotal , cCampovalorNota, trim(edtTotalVenda3.Text)  );
    LINI.WriteString( csecaoTotal , cCampovTroco, trim(edtTroco.Text)  );

    secao:= csecaoPagto + IntToStrZero(1, 3);
    LINI.WriteString( secao , cCampocMP, '1'  );
    LINI.WriteString( secao , cCampovMP, trim(edtTotalPago.Text)  );

    SL := TStringList.Create;
    try
      LINI.GetStrings(SL);
      SL.SaveToFile(PathINI);
    finally
      SL.Free;
    end;

  finally
    Result:= PathINI;
    lINI.Free
  end;

end;

function TfrmDemoPDV.GerarIniNFCe(const AOffLine:Boolean; var AChave: String): String;
var
  lINI: TMemIniFile;
  PathINI: String;
  SL: TStringList;
  vInc: Integer;
  vISS, vAliqISS, vTotalItem: Double;
  secao: String;
  lCod: Integer;
  lChave: String;
begin
  Randomize;
  lCod:= Random(99999999);
  vInc:= 0;
  vTotalItem:= 0;
  secao:= '';
  lChave:= '';
  PathINI:= PathWithDelim(ExtractFilePath(Application.ExeName)) + cCFeINI;

  if FileExists( PathINI ) then
    TryDeleteFile(PathINI, 1000);

  ConfigEmissaoCFe;
  LINI := TMemIniFile.Create('');
  try

    LINI.WriteInteger( csecaoIdentificacao , cCampo_cUF, lCFEmit_cUF);
    LINI.WriteString(  csecaoIdentificacao , cCampo_natOp, lCFEmit_natOp);
    LINI.WriteInteger( csecaoIdentificacao , cCampo_indPag, lCFEmit_indPag);
    LINI.WriteString(  csecaoIdentificacao , cCampo_serie, lCFEmit_serie);
    LINI.WriteString(  csecaoIdentificacao , cCampo_cNF, IntToStrZero( lCod, 8) );
    lCFEmit_nNF:= IntToStr(StrToIntDef(lCFEmit_nNF,0) + 1);
    LINI.WriteString(  csecaoIdentificacao , cCampo_nNF, lCFEmit_nNF);
    lCFEmit_dhEmi:= Now;
    LINI.WriteDateTime(csecaoIdentificacao , cCampo_dhEmi, lCFEmit_dhEmi);
    LINI.WriteString(  csecaoIdentificacao , cCampo_tpNF, lCFEmit_tpNF);
    LINI.WriteInteger( csecaoIdentificacao , cCampo_idDest, lCFEmit_idDest);
    LINI.WriteString(  csecaoIdentificacao , cCampo_cMunFG, lCFEmit_cMunFG);
    LINI.WriteInteger( csecaoIdentificacao , cCampo_indFinal, lCFEmit_indFinal);
    LINI.WriteInteger( csecaoIdentificacao , cCampo_indPres, lCFEmit_indPres);
    LINI.WriteInteger( csecaoIdentificacao , cCampo_tpimp, lCFEmit_tpimp);

    LINI.WriteInteger( csecaoIdentificacao , cCampo_tpAmb, lCFEmit_tpAmb);
    if AOffLine then
    begin
      lCFEmit_tpEmis:= 9;
      LINI.WriteDateTime(csecaoIdentificacao , cCampo_dhCont, now);
      LINI.WriteString(  csecaoIdentificacao , cCampo_xJust, lCFEmit_xJust);
      LINI.WriteInteger( csecaoIdentificacao , cCampo_tpEmis, lCFEmit_tpEmis);
    end
    else
    begin
      lCFEmit_tpEmis:= 1;
      LINI.WriteInteger( csecaoIdentificacao , cCampo_tpEmis, lCFEmit_tpEmis);
    end;

    LINI.WriteString( csecaoEmitente , cCampoCNPJEmit, lCFEmitCNPJ  );
    LINI.WriteString( csecaoEmitente , cCampoIEEmit, lCFEmitIE  );
    LINI.WriteString( csecaoEmitente , cCampo_CRT, lCF_CRT  );
    LINI.WriteString( csecaoEmitente , cCampo_Razao, lCF_Razao  );
    LINI.WriteString( csecaoEmitente , cCampo_Fantasia, lCF_Fantasia  );
    LINI.WriteString( csecaoEmitente , cCampo_Fone, lCF_Fone  );
    LINI.WriteString( csecaoEmitente , cCampo_CEP, lCF_CEP  );
    LINI.WriteString( csecaoEmitente , cCampo_Logradouro, lCF_Logradouro  );
    LINI.WriteString( csecaoEmitente , cCampo_Numero, lCF_Numero  );
    LINI.WriteString( csecaoEmitente , cCampo_Complemento, lCF_Complemento  );
    LINI.WriteString( csecaoEmitente , cCampo_Bairro, lCF_Bairro  );
    LINI.WriteString( csecaoEmitente , cCampo_CidadeCod, lCF_CidadeCod  );
    LINI.WriteString( csecaoEmitente , cCampo_Cidade, lCF_Cidade  );
    LINI.WriteString( csecaoEmitente , cCampo_UF, lCF_UF  );

    LINI.WriteString( csecaoDestinatario , cCampoIndIEDest, '9' );
    LINI.WriteString( csecaoDestinatario , cCampoCNPJCPFDest, trim(edtCNPJ.Text)  );
    LINI.WriteString( csecaoDestinatario , cCampoNomeDest, trim(edtNome.Text) );

    vISS:=0;
    vAliqISS:=0;
    with MemDataset1 do
    begin
      DisableControls;
      First;

      while not EOF do
      begin
        inc(vInc);
        vISS:=0;
        vAliqISS:=0;
        vTotalItem:=0;

        secao := csecaoProduto + IntToStrZero(vInc, 3);
        LINI.WriteString( secao , cCampoCFOP, cCFOPpadrao  );
        LINI.WriteString( secao , cCampocProd, FieldByName('Codigo').AsString  );
        LINI.WriteString( secao , cCampoxProd, FieldByName('Descricao').AsString  );
        LINI.WriteString( secao , cCampoNCM, cNCMPadrao  );
        LINI.WriteString( secao , cCampouCom, cComPadrao  );
        LINI.WriteString( secao , cCampoqCom, FieldByName('Qtde').AsString  );
        LINI.WriteString( secao , cCampovUnCom, FieldByName('Preco').AsString  );
        LINI.WriteString( secao , cCampovItem, FieldByName('Preco').AsString  );
        vTotalItem:=  StrToFloatDef(FieldByName('Preco').AsString,0) * StrToFloatDef(FieldByName('Qtde').AsString,0);
        LINI.WriteFloat( secao , cCampovProd, vTotalItem );

        secao := csecaoISSQN + IntToStrZero(vInc, 3);
        vAliqISS:= vvAliqPadrao;
        vISS:= ((StrToFloatDef(FieldByName('Preco').AsString, 0) * vAliqISS ) / 100);
        LINI.WriteString( secao , cCampo_vBC, FieldByName('Preco').AsString  );
        LINI.WriteFloat( secao , cCampo_vAliq, vAliqISS  );
        LINI.WriteFloat( secao , cCampo_vISSQN, vISS  );
        LINI.WriteString( secao , cCampo_cMunFG, lCFEmit_cMunFG  );
        LINI.WriteString( secao , cCampo_cListServ, cListServ  );
        LINI.WriteFloat( secao , cCampo_vISSRet, vISS );
        LINI.WriteString( secao , cCampo_indISS, '1'  );
        LINI.WriteString( secao , cCampo_indIncentivo, '2'  );

        Next;
      end;

      EnableControls;
    end;
    vISS:=0;
    vAliqISS:= vvAliqPadrao;
    vISS:= ((StrToFloatDef(trim(edtTotalVenda3.Text), 0) * vAliqISS ) / 100);

    LINI.WriteString( csecaoTotal , cCampovalorNota, trim(edtTotalVenda3.Text)  );
    LINI.WriteString( csecaoTotal , cCampovBC, trim(edtTotalVenda3.Text)  );

    LINI.WriteString( csecaoISSQNtot , cCampo_vServ, trim(edtTotalVenda3.Text)  );
    LINI.WriteString( csecaoISSQNtot , cCampo_vBC, trim(edtTotalVenda3.Text)  );
    LINI.WriteFloat( csecaoISSQNtot , cCampo_vISS, vISS  );
    LINI.WriteDateTime( csecaoISSQNtot , cCampo_dCompet, Now  );
    LINI.WriteFloat( csecaoISSQNtot , cCampo_vISSRet, vISS  );

    secao:= csecaoTransportador + IntToStrZero(1, 3);
    LINI.WriteString( secao , cCampo_modFrete, '9'  );

    secao:= csecaoPag + IntToStrZero(1, 3);
    LINI.WriteString( secao , cCampo_tPag, '01'  );
    LINI.WriteString( secao , cCampo_vPag, trim(edtTotalPago.Text) );
    if (StrToFloatDef( trim(edtTroco.Text), 0) > 0) then
      LINI.WriteString( secao , cCampovTroco, trim(edtTroco.Text) );

    SL := TStringList.Create;
    try
      LINI.GetStrings(SL);
      SL.SaveToFile(PathINI);

    finally
      SL.Free;
    end;

  finally
    Result:= PathINI;
    lINI.Free;
    IntegracaoConfig.ParametrizarPathIntegracao(True);
    IntegracaoConfig.ChaveRelacionada:= '';
    lChave:= GerarChave(IntToStr(lCFEmit_cUF), IntToStrZero(lCod,8), '65', lCFEmit_serie, lCFEmit_nNF, IntToStr(lCFEmit_tpEmis),
                        DateTimeToStr(lCFEmit_dhEmi), lCFEmitCNPJ);

    AChave:= lChave;
    if AOffLine then
    begin
      if IntegracaoConfig.Relaciona then
        IntegracaoConfig.ChaveRelacionada:= IntegracaoConfig.ChavePendente;
      IntegracaoConfig.Relaciona:= False;
      IntegracaoConfig.ChavePendente:= lChave;
      AdicionarNFePendente;
    end
    else
      IntegracaoConfig.ChavePendente:= lChave;
  end;

end;

function TfrmDemoPDV.ConsultarNFe(Achave: String; var AProt: String): Boolean;
var
  Ok: String;
  objRespNFe: TNFeConsultarNFe;
begin
  Result := False;
  objRespNFe:= TNFeConsultarNFe.Create();
  try
    IntegracaoConfig.Executar(Ok, objRespNFe , AspasDuplas( Achave ), 30000);
    if ( copy(Ok,1,3) = cOK) and ( objRespNFe.cStat in [100, 150] ) then
    begin
      result:= True;
      AProt:= objRespNFe.nProt;
    end;

  finally
    MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
    objRespNFe.Free;
  end;

end;

function TfrmDemoPDV.InutilizarNFe(Achave: String): Boolean;
var
  Ok: String;
  objRespNFe: TNFeInutilizarNFe;
  lparam: String;
begin
  Result := False;
  lparam:= AspasDuplas( Copy(Achave,7,14) ) + ',' +
           AspasDuplas( 'Inutilizacao devido emissao em contingencia' ) + ',' +
           AspasDuplas( Copy(Achave,3,2) ) + ',' +
           AspasDuplas( Copy(Achave,21,2) ) + ',' +
           AspasDuplas( Copy(Achave,23,3) ) + ',' +
           AspasDuplas( Copy(Achave,26,9) ) + ',' +
           AspasDuplas( Copy(Achave,26,9) );
  objRespNFe:= TNFeInutilizarNFe.Create();
  try
    IntegracaoConfig.Executar(Ok, objRespNFe , lparam, 30000);
    if ( copy(Ok,1,3) = cOK) then
      result:= True;

  finally
    MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
    objRespNFe.Free;
  end;

end;

function TfrmDemoPDV.CancelamentoSubstituicao(Achave, AchaveRef, AProt: String): Boolean;
var
  Ok: String;
  objRespNFe: TNFeEnviarEvento;
  ArqIni: String;
begin
  Result := False;
  ArqIni:= '[EVENTO]' + sLineBreak +
           'idLote=1' + sLineBreak +
           '[EVENTO001]' + sLineBreak +
           'cOrgaoAutor=' + Copy(Achave,1,2) + sLineBreak +
           'CNPJ=' + Copy(Achave,7,14) + sLineBreak +
           'chNFe=' + Achave + sLineBreak +
           'dhEvento=' + DateTimeToStr(now) + sLineBreak +
           'tpEvento=110112'+ sLineBreak +
           'verAplic=1.00'+ sLineBreak +
           'nProt='+ AProt + sLineBreak +
           'xJust=Cancelamento devido emissao em contingencia'+ sLineBreak +
           'chNFeRef=' + AchaveRef ;

  objRespNFe:= TNFeEnviarEvento.Create();
  try
    IntegracaoConfig.Executar(Ok, objRespNFe , AspasDuplas(ArqIni), 30000);
    if ( copy(Ok,1,3) = cOK) then
      result:= True;

  finally
    MonitoraIntegracao(IntegracaoConfig.PathLogIntegracao);
    objRespNFe.Free;
  end;

end;

function TfrmDemoPDV.LigarOffLine(Off: Boolean): Boolean;
begin
  Result:= False;
  if off then
  begin
    Result:= SetFormaEmissao(9);
    Timer1.Enabled:= False;
  end
  else
  begin
    Result:= SetFormaEmissao(1);
    Timer1.Enabled:= True;
  end;
  if Assigned(frmConfig) then
    AtualizaBotaoOffLine(Off);
  IntegracaoConfig.ConfigurarOffLine(Off);

end;

function TfrmDemoPDV.AspasDuplas(Param: String): String;
begin
  Result := chr(34) + Param + chr(34);
end;

end.

