unit Sobre;

interface

uses
  SysUtils, Types, Classes, Variants, QTypes, QGraphics, QControls, QForms,
  QDialogs, QStdCtrls, QExtCtrls, QButtons, Qt;

type
  TfrmSobre = class(TForm)
    Timer1: TTimer;
    lVersao: TLabel;
    lDesenvolvedores: TLabel;
    lACBr: TLabel;
    BitBtn1: TBitBtn;
    lNome: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    lColaboradores: TLabel;
    bAjuda: TBitBtn;
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure lACBrClick(Sender: TObject);
    procedure lDesenvolvedoresClick(Sender: TObject);
    procedure bAjudaClick(Sender: TObject);
    procedure FormShortCut(Key: Integer; Shift: TShiftState;
      var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation
Uses ACBrUtil ;

{$R *.xfm}

procedure TfrmSobre.FormCreate(Sender: TObject);
begin
  ClientHeight := 218 ;
end;

procedure TfrmSobre.Timer1Timer(Sender: TObject);
Var I : Integer ;
begin
  Update ;
  For I := 0 to ControlCount -1 do
  begin
     if Controls[I] is TLabel then
     begin
        with Controls[I] as TLabel do
        begin
           Top := Top - 1 ;

           if Top <= -20 then
              Top := Parent.Height + 1
        end ;
     end ;
  end ;

  Application.ProcessMessages ;
end;

procedure TfrmSobre.BitBtn1Click(Sender: TObject);
begin
  Timer1.Enabled := false ;
  close ;
end;

procedure TfrmSobre.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Timer1.Enabled := false ;
  CanClose       := true ;
end;

procedure TfrmSobre.lACBrClick(Sender: TObject);
begin
  OpenURL( 'http://acbr.sf.net' );
end;

procedure TfrmSobre.lDesenvolvedoresClick(Sender: TObject);
begin
  OpenURL('www.djsystem.com.br');
end;

procedure TfrmSobre.bAjudaClick(Sender: TObject);
begin
  OpenURL('file:///'+ExtractFilePath(Application.ExeName)+'ManualACBrMonitor.html');
end;

procedure TfrmSobre.FormShortCut(Key: Integer; Shift: TShiftState;
  var Handled: Boolean);
begin
  if (Key = Key_Help) or (Key = Key_F1) then
     bAjuda.Click ;
end;

end.
