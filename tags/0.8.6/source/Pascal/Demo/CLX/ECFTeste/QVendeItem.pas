unit QVendeItem;

interface

uses
  SysUtils, Classes, QTypes, QGraphics, QControls, QForms, 
  QDialogs, QStdCtrls, QMask, QExtCtrls;

type
  TfrVendeItem = class(TForm)
    Label1: TLabel;
    edCodigo: TEdit;
    Label2: TLabel;
    edDescricao: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edICMS: TEdit;
    Label6: TLabel;
    edDesconto: TEdit;
    Label7: TLabel;
    edUN: TEdit;
    Button1: TButton;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edPrecoUnita: TEdit;
    Button2: TButton;
    edQtd: TEdit;
    rbPercentagem: TRadioButton;
    rbValor: TRadioButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure edQtdKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frVendeItem: TfrVendeItem;

implementation

uses QECFTeste1;

{$R *.xfm}

procedure TfrVendeItem.edQtdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in [',','.'] then
     Key := DecimalSeparator ;
end;

procedure TfrVendeItem.Button1Click(Sender: TObject);
Var Desc : Char ;
begin
//  if Form1.ACBrECF1.AguardandoResposta then
//     raise Exception.Create('Aguarde imprimindo Item anterior...') ;

  Button1.Enabled := False ;
  Desc := '%' ;
  if rbValor.Checked then
     Desc := '$' ;

  try
     Form1.ACBrECF1.VendeItem( edCodigo.Text, edDescricao.Text,
                               edICMS.Text, StrToFloatDef( edQtd.Text, 0 ),
                               StrToFloatDef( edPrecoUnita.Text,0 ),
                               StrToFloatDef( edDesconto.Text,0 ), edUN.Text,
                               Desc );
     Form1.mResp.Lines.Add( 'Vende Item: Cod:'+ edCodigo.Text+
                            ' Desc'+ edDescricao.Text+
                            ' Aliq:'+edICMS.Text +
                            ' Qtd:'+edQtd.Text +
                            ' Pre�o:'+edPrecoUnita.Text +
                            ' Desc:'+edDesconto.Text +
                            ' Un:'+edUN.Text +
                            ' Desc:'+Desc );
     Form1.AtualizaMemos ;
  finally
     Button1.Enabled := True ;
  end ;
end;

procedure TfrVendeItem.Button2Click(Sender: TObject);
begin
  close ;
end;

end.
