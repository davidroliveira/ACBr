{$I ACBr.inc}

unit pcnConsControleEstoque;

interface

uses
  Classes, SysUtils, pcnGerador, pcnRecopi, pcnConversaoRecopi, pcnConversao,
  pcnAuxiliar;

type

  { TConsControleEstoque }

  TConsControleEstoque = class(TPersistent)
  private
    FGerador: TGerador;
    FControleEstoque: TControleEstoque;
  public
    constructor Create;
    destructor Destroy; override;
    function GeraXML: Boolean;
    function ObterNomeArquivo: String;
  published
    property Gerador: TGerador read FGerador write FGerador;
    property ControleEstoque: TControleEstoque read FControleEstoque write FControleEstoque;
  end;


implementation

{ TConsControleEstoque }

constructor TConsControleEstoque.Create;
begin
  inherited Create;
  FGerador := TGerador.Create;
end;

destructor TConsControleEstoque.Destroy;
begin
  FGerador.Free;
  inherited Destroy;
end;

function TConsControleEstoque.GeraXML: Boolean;
var
  i: Integer;
begin
  Gerador.ArquivoFormatoXML:='';
  Gerador.wGrupo('ListaControleEstoque xmlns="http://www.fazenda.sp.gov.br/"');
  Gerador.wGrupo('ControleEstoque');
  Gerador.wCampo(tcStr, '', 'CNPJ', 1, 14, 1, FControleEstoque.CNPJ);
  Gerador.wCampo(tcStr, '', 'CNPJUF', 1, 2, 1, FControleEstoque.CNPJUF);
  Gerador.wCampo(tcStr, '', 'TipoInforme', 1, 14, 1, tpTipoInformeToStr(FControleEstoque.TipoInforme));
  Gerador.wCampo(tcDat, '', 'DataReferencia', 1, 10, 1, FControleEstoque.DataReferencia);
  Gerador.wCampo(tcStr, '', 'TipoDeclaracao', 1, 14, 1, tpTipoDeclaracaoToStr(FControleEstoque.TipoDeclaracao));
  Gerador.wCampo(tcStr, '', 'Justificativa', 1, 50, 1, FControleEstoque.Justificativa);
  Gerador.wGrupo('ListaItens');
  for i:= 0 to FControleEstoque.ListaItens.Count -1 do
    begin
      Gerador.wGrupo('ItemPapel');
      Gerador.wCampo(tcInt, '', 'CodigoPapel', 1, 20, 1, TItemPapel(FControleEstoque.ListaItens.Items[i]).CodigoPapel);
      Gerador.wCampo(tcInt, '', 'CodigoPapelFinal', 1, 20, 1, TItemPapel(FControleEstoque.ListaItens.Items[i]).CodigoPapelFinal);
      Gerador.wCampo(tcDe2, '', 'Quantidade', 1, 20, 1, TItemPapel(FControleEstoque.ListaItens.Items[i]).Quantidade);
      Gerador.wCampo(tcStr, '', 'TipoPulicacao', 1, 30, 1, tpTipoPublicacaoToStr(TItemPapel(FControleEstoque.ListaItens.Items[i]).TipoPublicacao));
      Gerador.wCampo(tcStr, '', 'ISBNISSNTitulo', 1, 20, 1, TItemPapel(FControleEstoque.ListaItens.Items[i]).ISBNISSNTitulo);
      Gerador.wCampo(tcStr, '', 'Tiragem', 1, 20, 1, TItemPapel(FControleEstoque.ListaItens.Items[i]).Tiragem);
      Gerador.wGrupo('/ItemPapel');
    end;
  Gerador.wGrupo('/ListaItens');
  Gerador.wGrupo('/ControleEstoque');
  Gerador.wGrupo('/ListaControleEstoque');
  Result := (Gerador.ListaDeAlertas.Count = 0);
end;

function TConsControleEstoque.ObterNomeArquivo: String;
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
  Result := AAAAMMDDTHHMMSS + '-con-est.xml';
end;

end.

