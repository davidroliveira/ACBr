{$I ACBr.inc}

unit pcnConsInclusaoNF;

interface

uses
  Classes, SysUtils, pcnConversao, pcnGerador, pcnRecopi;

type

  { TConsInclusaoNF }

  TConsInclusaoNF= class(TPersistent)
  private
    FInclusaoNF: TInclusaoNF;
    FGerador: TGerador;
  public
    constructor Create;
    destructor Destroy; override;
    function GeraXML: Boolean;
    function ObterNomeArquivo: String;
  published
    property InclusaoNF: TInclusaoNF read FInclusaoNF write FInclusaoNF;
    property Gerador: TGerador read FGerador write FGerador;
  end;

implementation

uses
  pcnAuxiliar;

{ TConsInclusaoNF }

constructor TConsInclusaoNF.Create;
begin
  inherited Create;
  FGerador := TGerador.Create;
end;

destructor TConsInclusaoNF.Destroy;
begin
  FGerador.Free;
  inherited Destroy;
end;

function TConsInclusaoNF.GeraXML: Boolean;
begin
  Gerador.ArquivoFormatoXML:='';
  Gerador.wGrupo('ListaInclusoesNF');
  Gerador.wGrupo('InclusoesNF');
  Gerador.wCampo(tcStr, '', 'CodigoControle', 1, 20, 1, FInclusaoNF.CodigoControle);
  Gerador.wGrupo('NF');
  Gerador.wCampo(tcInt, '', 'Numero', 1, 10, 1, FInclusaoNF.NF.Numero);
  Gerador.wCampo(tcInt, '', 'Serie', 1, 10, 1, FInclusaoNF.NF.Serie);
  Gerador.wCampo(tcDat, '', 'DataEmissao', 1, 10, 1, FInclusaoNF.NF.DataEmissao);
  Gerador.wCampo(tcDat, '', 'DataEntrada', 1, 10, 1, FInclusaoNF.NF.DataEntrada);
  Gerador.wCampo(tcDat, '', 'DataSaida', 1, 10, 1, FInclusaoNF.NF.DataSaida);
  Gerador.wCampo(tcDe2, '', 'Valor', 1, 15, 1, FInclusaoNF.NF.Valor);
  Gerador.wGrupo('/NF');
  Gerador.wGrupo('/InclusoesNF');
  Gerador.wGrupo('/ListaInclusoesNF');
  Result := (Gerador.ListaDeAlertas.Count = 0);
end;

function TConsInclusaoNF.ObterNomeArquivo: String;
var
  DataHora: TDateTime;
  Year, Month, Day, Hour, Min, Sec, Milli: Word;
  AAAAMMDDTHHMMSS: string;
begin
  Datahora:=now;
  DecodeTime(DataHora, Hour, Min, Sec, Milli);
  DecodeDate(DataHora, Year, Month, Day);
  AAAAMMDDTHHMMSS := IntToStrZero(Year, 4) + IntToStrZero(Month, 2) + IntToStrZero(Day, 2) +
    IntToStrZero(Hour, 2) + IntToStrZero(Min, 2) + IntToStrZero(Sec, 2);
  Result := AAAAMMDDTHHMMSS + '-inc-nf.xml';
end;

end.

