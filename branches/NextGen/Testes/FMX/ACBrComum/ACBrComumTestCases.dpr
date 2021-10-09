program ACBrComumTestCases;

{$IF CompilerVersion<>32}
 {.$DEFINE USECONSOLE}
 {.$DEFINE TESTINSIGHT}

 {$IFNDEF TESTINSIGHT}
  {.$DEFINE USECONSOLE}
 {$ENDIF}
{$ENDIF}

{$IFDEF USECONSOLE}
 {$APPTYPE CONSOLE}
{$ENDIF}

{$STRONGLINKTYPES ON}

uses
 SysUtils,
  {$IFDEF TESTINSIGHT}
   TestInsight.DUnitX,
  {$ENDIF }
  {$IF CompilerVersion>28}
   {$IFDEF USECONSOLE}
    DUnitX.Loggers.Console,
    DUnitX.AutoDetect.Console,
   {$ELSE}
    FMX.Forms,
    {$IfDef ANDROID}
     DUNitX.Loggers.MobileGUI,
    {$Else}
     DUNitX.Loggers.GUIX,
    {$ENDIF }
   {$ENDIF }
   {$IF CompilerVersion>30}
    DUnitX.TestRunner, DUnitX.TestFramework,
    DUnitX.Loggers.XML.NUnit,
   {$ELSE}
    DUnitX.Loggers.DUnitX.TestRunner,
   {$ENDIF }
  {$ELSE}
   DUnitTestRunner,
   GUITestRunner,
  {$ENDIF}
  DUnitX.DUnitCompatibility,
  acbrutiltest in '..\..\FPCUnit\ACBrComum\acbrutiltest.pas';

{$R *.res}

{$IfNDef USECONSOLE}
begin
  Application.Initialize;
  {$IfDef ANDROID}
   Application.CreateForm(TMobileGUITestRunner, MobileGUITestRunner);
  {$Else}
   Application.CreateForm(TGUIXTestRunner, GUIXTestRunner);
  {$EndIf}
  Application.Run;

{$Else}
var
  runner : ITestRunner;
  results : IRunResults;
  logger : ITestLogger;
  nunitLogger : ITestLogger;
begin
  ReportMemoryLeaksOnShutdown:=True;
  //NeverSleepOnMMThreadContention:=True;

{$IFDEF TESTINSIGHT}
  TestInsight.DUnitX.RunRegisteredTests;
  exit;
{$ENDIF}
  try
    //Check command line options, will exit if invalid
    TDUnitX.CheckCommandLine;
    //Create the test runner
    runner := TDUnitX.CreateRunner;
    //Tell the runner to use RTTI to find Fixtures
    runner.UseRTTI := True;
    //tell the runner how we will log things
    //Log to the console window

    {$IFDEF USECONSOLE}
    logger := TDUnitXConsoleLogger.Create(true);
    {$ELSE}
    logger := TGUIXTestRunner.Create(nil);
    {$ENDIF}

    //logger := TGUIXTestRunner.Create(nil);
    runner.AddLogger(logger);
    //Generate an NUnit compatible XML File
    nunitLogger := TDUnitXXMLNUnitFileLogger.Create(TDUnitX.Options.XMLOutputFile);
    runner.AddLogger(nunitLogger);
    runner.FailsOnNoAsserts := False; //When true, Assertions must be made during tests;

    //Run tests
    results := runner.Execute;
    if not results.AllPassed then
      System.ExitCode := EXIT_ERRORS;

    {$IFNDEF CI}
    //We don't want this happening when running under CI.
    if TDUnitX.Options.ExitBehavior = TDUnitXExitBehavior.Pause then
    begin
      System.Write('Done.. press <Enter> key to quit.');
      System.Readln;
    end;
    {$ENDIF}
  except
    on E: Exception do
      System.Writeln(E.ClassName, ': ', E.Message);
  end;
{$ENDIF}

end.
