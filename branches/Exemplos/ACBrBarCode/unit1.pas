unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LR_Class, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Buttons, Menus, ComCtrls, ExtCtrls, ACBrBarCode;

type

  { TForm1 }

  TForm1 = class(TForm)
    ACBrBarCode1: TACBrBarCode;
    ComboBox1: TComboBox;
    edtNumeracao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    procedure ComboBox1Change(Sender: TObject);
    procedure edtNumeracaoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

uses AJBarcode;

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

  Label1.Caption := 'Selecione um tipo de '+ inttostr(ComboBox1.Items.Count)+' tipos';
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  ShowMessage('Exemplo de como utilizar '+#13+
  'o componente AcbrCodBar'+#13+'Desenvolvido por:'+#13+
  '    Marcos Aurélio C. G. Alcântara');
end;

procedure TForm1.ToolButton1Click(Sender: TObject);
begin
// Image1.Picture. := ACBrBarCode1.Canvas.;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
   case ComboBox1.ItemIndex of
       0  : ACBrBarCode1.Typ := bcCode_2_5_interleaved;
       1  : ACBrBarCode1.Typ := bcCode_2_5_industrial;
       2  : ACBrBarCode1.Typ := bcCode_2_5_matrix;
       3  : ACBrBarCode1.Typ := bcCode39;
       4  : ACBrBarCode1.Typ := bcCode39Extended;
       5  : ACBrBarCode1.Typ := bcCode128A;
       6  : ACBrBarCode1.Typ := bcCode128B;
       7  : ACBrBarCode1.Typ := bcCode128C;
       8  : ACBrBarCode1.Typ := bcCode93;
       9  : ACBrBarCode1.Typ := bcCode93Extended;
       10 : ACBrBarCode1.Typ := bcCodeMSI;
       11 : ACBrBarCode1.Typ := bcCodePostNet;
       12 : ACBrBarCode1.Typ := bcCodeCodaBar;
       13 : ACBrBarCode1.Typ := bcCodeEAN8;
       14 : ACBrBarCode1.Typ := bcCodeEAN13;
       15 : ACBrBarCode1.Typ := bcCodeUPC_A;
       16 : ACBrBarCode1.Typ := bcCodeUPC_E0;
       17 : ACBrBarCode1.Typ := bcCodeUPC_E1;
       18 : ACBrBarCode1.Typ := bcCodeUPC_Supp2;    { UPC 2 digit supplemental }
       19 : ACBrBarCode1.Typ := bcCodeUPC_Supp5;    { UPC 5 digit supplemental }
       20 : ACBrBarCode1.Typ := bcCodeEAN128A;
       21 : ACBrBarCode1.Typ := bcCodeEAN128B;
       22 : ACBrBarCode1.Typ := bcCodeEAN128C;
   end;
 ACBrBarCode1.Text := edtNumeracao.Text;

end;

procedure TForm1.edtNumeracaoChange(Sender: TObject);
begin
 ACBrBarCode1.Text := edtNumeracao.Text;
end;

end.

