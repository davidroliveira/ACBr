program TerminalTCP;

uses
  Vcl.Forms,
  wTerminalTCP in 'wTerminalTCP.pas' {Form2},
  uACBrTERTcp in 'uACBrTERTcp.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
