program BombasTeste;

uses
  Forms,
  frmBombasTeste in 'frmBombasTeste.pas' {Form1},
  ACBrBombas in '..\..\..\ACBrBombas.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
