unit Unit1; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, Buttons,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    bFormatar1: TButton;
    bValidar1: TButton;
    cbTipoDocto1: TComboBox;
    edComple1: TEdit;
    edDocto1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure bFormatar1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form1: TForm1; 

implementation

{ TForm1 }

procedure TForm1.bFormatar1Click(Sender: TObject);
begin

end;

initialization
  {$I unit1.lrs}

end.

