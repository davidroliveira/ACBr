program AcbrBoletoDemo;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, ACBrBoletoW_BancoBrasil, lazreport, ACBr_Boleto, uDemo,
  ACBr_BoletoFC_LazReport, ACBr_BoletoFC_Fortes, ACBrBoletoRet_BancoBrasil;

{$R *.res}

begin
  Application.Initialize;
   Application.CreateForm ( TfrmDemo, frmDemo ) ;
  Application.Run;
end.

