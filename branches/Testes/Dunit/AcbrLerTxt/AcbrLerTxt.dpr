program AcbrLerTxt;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  Forms,
  TestFramework,
  GUITestRunner,
  TextTestRunner,
  pcnConversaoNFe in 'Patch\pcnConversaoNFe.pas',
  pcnNFeRTXT in 'Patch\pcnNFeRTXT.pas',
  pcnLayoutTXT in 'Patch\pcnLayoutTXT.pas',
  pcnNFeW in 'Patch\pcnNFeW.pas',
  TestAcBrLerTxt in '..\..\..\..\Acbr\Testes\Dunit\AcbrLerTxt\TestAcBrLerTxt.pas',
  AcbrLerTxtIni in '..\..\..\..\Acbr\Testes\Dunit\AcbrLerTxt\Fontes\AcbrLerTxtIni.pas',
  IniPersist in '..\..\..\..\Acbr\Testes\Dunit\AcbrLerTxt\Fontes\IniPersist.pas',
  pcnConversao in 'Patch\pcnConversao.pas',
  pcnAuxiliar in '..\..\..\..\Acbr\Fontes\PCNComum\pcnAuxiliar.pas',
  ACBrValidador in '..\..\..\..\Acbr\Fontes\ACBrDiversos\ACBrValidador.pas',
  ACBrUtil in '..\..\..\..\Acbr\Fontes\ACBrComum\ACBrUtil.pas';

{$R *.RES}
begin
  Application.Initialize;
    ReportMemoryLeaksOnShutdown := True;
  if IsConsole then
    TextTestRunner.RunRegisteredTests
  else
    GUITestRunner.RunRegisteredTests;
end.

