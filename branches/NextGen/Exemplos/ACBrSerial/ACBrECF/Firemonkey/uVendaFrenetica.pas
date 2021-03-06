unit uVendaFrenetica;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, ACBrBase, ACBrLCB, FMX.StdCtrls, FMX.Edit,
  FMX.Controls.Presentation;

type
  TFrVendaFrenetica = class(TForm)
    lblInfo: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    edCodProduto: TEdit;
    chkProcessMessages: TCheckBox;
    chkNaoExibirMsgs: TCheckBox;
    btnCancelarCupom: TButton;
    btnFechaCupom: TButton;
    btnSair: TButton;
    TimerVendeItem: TTimer;
    ACBrLCB1: TACBrLCB;
    procedure edCodProdutoKeyPress(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure TimerVendeItemTimer(Sender: TObject);
    procedure ACBrLCB1LeCodigo(Sender: TObject);
    procedure VendeItem(CodBarras: String);
    procedure btnCancelarCupomClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnFechaCupomClick(Sender: TObject);
    procedure chkProcessMessagesClick(Sender: TObject);
  private
    { Private declarations }
    FVendendo: Boolean;
    procedure AbrirCupom;
  public
    { Public declarations }
  end;

var
  FrVendaFrenetica: TFrVendaFrenetica;

implementation
   uses ECFTeste1, ACBrDevice;
{$R *.fmx}

procedure TFrVendaFrenetica.edCodProdutoKeyPress(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
Var
  CodBarras: String;
begin
  if (KeyChar = #13) or (KeyChar = #10) then // ENTER (CR) ou LF
  begin
    CodBarras := Trim(edCodProduto.Text);

    //Adiciona o produto a lista de produtos a serem processados
    ACBrLCB1.Fila.Add(CodBarras);

    // Zera o Edit, preparando para uma nova venda rapidamente
    edCodProduto.Text := '';
    edCodProduto.SetFocus;

    // Liga o Timer responsável por efetuar as vendas
    TimerVendeItem.Enabled := True;
  end;
end;


procedure TFrVendaFrenetica.TimerVendeItemTimer(Sender: TObject);
Var
  CodBarras: String;
begin
  TimerVendeItem.Enabled := False;
  try
    // Verifica se o ACBrECF está ocupado, Se estiver năo vende, tentará novamente no próximo evento do Timer //
    // FVendendo é liga no inicio de VendeItem e desligada no Final

    if not(FVendendo or Form1.ACBrECF1.AguardandoResposta) then
    begin
      CodBarras := ACBrLCB1.LerFila;
      VendeItem(CodBarras);
    end;
  finally
    TimerVendeItem.Enabled := (ACBrLCB1.Fila.Count > 0);
  end;
end;

procedure TFrVendaFrenetica.ACBrLCB1LeCodigo(Sender: TObject);
begin
  TimerVendeItem.Enabled := True
end;

procedure TFrVendaFrenetica.VendeItem(CodBarras: String);
begin
  FVendendo := True;

  try
    if Trim(CodBarras) = '' then
      Exit;

    if (Form1.ACBrECF1.Estado in [estLivre]) then
    begin
      AbrirCupom;
    end;

    Form1.ACBrECF1.VendeItem(CodBarras, 'DESCRICAO DO PRODUTO', 'NN', 1, 1.5, 0, 'UN', '$');

    Form1.mResp.Lines.Add('Vende Item: Cod:'+ CodBarras+
                          ' Desc: DESCRICAO DO PRODUTO'+
                          ' Aliq: NN' +
                          ' Qtd: 1' +
                          ' Preço: 1.50' +
                          ' Desc: 0' +
                          ' Un: UN' +
                          ' Desc: $');
    Form1.AtualizaMemos;
  finally
    edCodProduto.SetFocus;
    FVendendo := False;
  end;
end;

procedure TFrVendaFrenetica.btnCancelarCupomClick(Sender: TObject);
begin
  try
    btnFechaCupom.Enabled := False;
    btnCancelarCupom.Enabled := False;

    Form1.ACBrECF1.CancelaCupom;
    Form1.mResp.Lines.Add('CancelaCupom');
    Form1.AtualizaMemos;

    edCodProduto.SetFocus;
  Finally
    btnFechaCupom.Enabled := True;
    btnCancelarCupom.Enabled := True;
  end;
end;

procedure TFrVendaFrenetica.FormShow(Sender: TObject);
begin

  if not(Form1.ACBrECF1.Ativo) then
  begin
    MessageDlg('ECF năo Ativo.', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOk], 0);
  end;

  // Opcionalmente diminuir o IntervaloAposComando;
  //form1.ACBrECF1.IntervaloAposComando := 0;

  edCodProduto.SetFocus;
end;

procedure TFrVendaFrenetica.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrVendaFrenetica.btnFechaCupomClick(Sender: TObject);
begin
  btnFechaCupom.Enabled := False;
  btnCancelarCupom.Enabled := False;

  try
    Form1.ACBrECF1.SubtotalizaCupom(0, '');
    Form1.mResp.Lines.Add('Subtotalizado Cupom');

    Form1.ACBrECF1.EfetuaPagamento(Form1.ACBrECF1.FormasPagamento[0].Indice,
      (Form1.ACBrECF1.Subtotal - Form1.ACBrECF1.TotalPago), 'ZERANDO SALDO A PAGAR RESTANTE');
    Form1.mResp.Lines.Add('Efetuado Pagamento');

    Form1.ACBrECF1.FechaCupom('TESTE DE CUPOM');
    Form1.mResp.Lines.Add('Finalizado Cupom Fiscal');

    edCodProduto.SetFocus;
  Finally
    btnFechaCupom.Enabled := True;
    btnCancelarCupom.Enabled := True;
  end;
end;

procedure TFrVendaFrenetica.chkProcessMessagesClick(Sender: TObject);
begin
  Form1.ACBrECF1.Device.ProcessMessages := chkProcessMessages.Ischecked;
end;

procedure TFrVendaFrenetica.AbrirCupom;
var
  b: Boolean;
begin
  b := Form1.ACBrECF1.ExibeMensagem;
  if (chkNaoExibirMsgs.Ischecked) and (b) then
    Form1.ACBrECF1.ExibeMensagem := False;
  Form1.ACBrECF1.AbreCupom();
  if (chkNaoExibirMsgs.Ischecked) and (b) then
    Form1.ACBrECF1.ExibeMensagem := True;
end;


end.
