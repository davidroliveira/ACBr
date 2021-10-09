program ECFTeste;

uses
  Forms,
  ECFTeste1 in 'ECFTeste1.pas' {Form1},
  VendeItem in 'VendeItem.pas' {frVendeItem},
  EfetuaPagamento in 'EfetuaPagamento.pas' {frPagamento},
  Relatorio in 'Relatorio.pas' {frRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrVendeItem, frVendeItem);
  Application.CreateForm(TfrPagamento, frPagamento);
  Application.CreateForm(TfrRelatorio, frRelatorio);
  Application.Run;
end.
