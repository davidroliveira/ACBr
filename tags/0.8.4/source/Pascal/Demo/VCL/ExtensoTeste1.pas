{$I ACBr.inc}

unit ExtensoTeste1;

interface

uses
  SysUtils,
 {$IFDEF Delphi6_UP} Types, Variants, {$ELSE} Windows,{$ENDIF}
  Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ACBrBase, ACBrExtenso;

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

{$R *.dfm}

procedure TfrExtenso.bExtensoClick(Sender: TObject);
begin
  ACBrExtenso1.Valor := StrToFloat( edValor.Text ) ;
  mExtenso.Text := ACBrExtenso1.Texto ; 
end;

procedure TfrExtenso.edValorKeyPress(Sender: TObject; var Key: Char);
begin
  if not ( Key in ['0'..'9',',','.',#13,#8] ) then
     Key := #0
  else
     if Key in [',','.'] then
        Key := DecimalSeparator ;
end;

end.
