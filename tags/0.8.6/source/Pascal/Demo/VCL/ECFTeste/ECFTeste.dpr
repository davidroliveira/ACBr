program ECFTeste;

uses
  Forms,
  ECFTeste1 in 'ECFTeste1.pas' {Form1},
  VendeItem in 'VendeItem.pas' {frVendeItem},
  Relatorio in 'Relatorio.pas' {frRelatorio},
  EfetuaPagamento in 'EfetuaPagamento.pas' {frPagamento},
  Sobre in 'Sobre.pas' {frSobre};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Teste do Componente ACBrECF (VCL)';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrVendeItem, frVendeItem);
  Application.CreateForm(TfrRelatorio, frRelatorio);
  Application.CreateForm(TfrPagamento, frPagamento);
  Application.Run;
end.
