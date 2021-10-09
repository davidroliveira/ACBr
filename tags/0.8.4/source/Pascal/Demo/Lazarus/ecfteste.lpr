program ecfteste;

{$mode objfpc}{$H+}

uses
  Interfaces, // this includes the LCL widgetset
  Forms
  { add your units here }, ecfteste1 , vendeitem, efetuapagamento, relatorio;

begin
  Application.Title:='ECFTeste Lazarus - http://acbr.sf.net';
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrVendeItem, frVendeItem);
  Application.CreateForm(TfrPagamento, frPagamento);
  Application.CreateForm(TfrRelatorio, frRelatorio);
  Application.Run;
end.
