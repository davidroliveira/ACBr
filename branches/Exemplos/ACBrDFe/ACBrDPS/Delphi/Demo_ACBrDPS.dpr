program Demo_ACBrDPS;

uses
  Forms,
  Frm_Demo_ACBrDPS in 'Frm_Demo_ACBrDPS.pas' {frm_DemoACBrDPS},
  ConfiguraSerial in 'configuraserial.pas' {frConfiguraSerial};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrm_DemoACBrDPS, frm_DemoACBrDPS);
  Application.CreateForm(TfrConfiguraSerial, frConfiguraSerial);
  Application.Run;
end.
