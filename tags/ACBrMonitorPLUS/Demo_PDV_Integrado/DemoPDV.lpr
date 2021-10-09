program DemoPDV;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, pcnConversao, memdslaz, uDemoPDV, IntegracaoConfig, objRetorno, uConfig
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TfrmDemoPDV, frmDemoPDV);
  Application.Run;
end.

