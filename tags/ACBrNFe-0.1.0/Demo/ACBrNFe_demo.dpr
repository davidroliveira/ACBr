program ACBrNFe_demo;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  ufrmStatus in 'ufrmStatus.pas' {frmStatus};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
