unit uConfig;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Spin, Buttons, ComCtrls;

type

  { TfrmConfig }

  TfrmConfig = class(TForm)
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    lblTempoContingencia: TLabel;
    lblPendenteEnvio: TLabel;
    Panel1: TPanel;
    spinReenvio: TSpinEdit;
    spinNormal: TSpinEdit;
    spinReenvio1: TSpinEdit;
    spinReenvio3: TSpinEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  frmConfig: TfrmConfig;

implementation

uses
  uDemoPDV;

{$R *.lfm}

{ TfrmConfig }

procedure TfrmConfig.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction:=cafree;
  frmConfig:=nil;
end;

procedure TfrmConfig.BitBtn1Click(Sender: TObject);
begin
  if Bitbtn1.Caption = 'Ativar On-Line' then
  begin
    if frmDemoPDV.StatusServicoNFe then
    begin
      frmDemoPDV.LigarOffLine(False);
    end;
  end
  else
  begin
    frmDemoPDV.LigarOffLine(True);
  end;
end;

end.

