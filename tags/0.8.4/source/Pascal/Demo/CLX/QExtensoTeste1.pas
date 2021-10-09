unit QExtensoTeste1;

interface

uses
  SysUtils, Types, Classes, Variants, QTypes, QGraphics, QControls, QForms, 
  QDialogs, QStdCtrls, ACBrBase, ACBrExtenso;

type
  TfrExtenso = class(TForm)
    edValor: TEdit;
    Label1: TLabel;
    bExtenso: TButton;
    mExtenso: TMemo;
    ACBrExtenso1: TACBrExtenso;
    procedure bExtensoClick(Sender: TObject);
    procedure edValorKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frExtenso: TfrExtenso;

implementation

{$R *.xfm}

procedure TfrExtenso.bExtensoClick(Sender: TObject);
begin
  ACBrExtenso1.Valor := StrToFloat( edValor.Text ) ;
  mExtenso.Text := ACBrExtenso1.Texto ; 
end;

procedure TfrExtenso.edValorKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in [',','.'] then
     Key := DecimalSeparator ;
end;

end.
