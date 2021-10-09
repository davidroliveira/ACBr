program QECFTeste;

uses
  QForms,
  QECFTeste1 in 'QECFTeste1.pas' {Form1},
  QVendeItem in 'QVendeItem.pas' {frVendeItem},
  QRelatorio in 'QRelatorio.pas' {frRelatorio},
  QEfetuaPagamento in 'QEfetuaPagamento.pas' {frPagamento};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrVendeItem, frVendeItem);
  Application.CreateForm(TfrRelatorio, frRelatorio);
  Application.CreateForm(TfrPagamento, frPagamento);
  Application.Run;
end.
