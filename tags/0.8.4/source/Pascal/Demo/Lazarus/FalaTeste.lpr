program FalaTeste;

{$mode objfpc}{$H+}

uses
  Interfaces, // this includes the LCL widgetset
  Forms
  { add your units here }, FalaTeste1;

begin
  Application.Title:='project1';
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.


