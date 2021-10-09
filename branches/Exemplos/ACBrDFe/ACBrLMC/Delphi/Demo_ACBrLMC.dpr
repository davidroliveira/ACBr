program Demo_ACBrLMC;

uses
  Forms,
  Frm_Demo_ACBrLMC in 'Frm_Demo_ACBrLMC.pas' {frmDemo_ACBrLMC};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmDemo_ACBrLMC, frmDemo_ACBrLMC);
  Application.Run;
end.
