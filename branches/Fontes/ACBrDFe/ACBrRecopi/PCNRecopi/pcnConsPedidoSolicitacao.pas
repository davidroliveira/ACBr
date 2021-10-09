{$I ACBr.inc}

unit pcnConsPedidoSolicitacao;

interface

uses
  Classes, SysUtils, pcnGerador, pcnRecopi, pcnConversaoRecopi, pcnConversao,
  pcnAuxiliar;

type


  { TConsPedidoSolicitacao }

  TConsPedidoSolicitacao = class(TPersistent)
  private
    FGerador: TGerador;
    FPedidoSolicitacao: TListaSolicitacao;
  public
    constructor Create;
    destructor Destroy; override;
    function GeraXML: Boolean;
    function ObterNomeArquivo: String;
  published
    property Gerador: TGerador read FGerador write FGerador;
    property PedidoSolicitacao: TListaSolicitacao read FPedidoSolicitacao write FPedidoSolicitacao;
  end;


implementation

{ TConsPedidoSolicitacao }

constructor TConsPedidoSolicitacao.Create;
begin
  inherited Create;
  FGerador := TGerador.Create;
end;

destructor TConsPedidoSolicitacao.Destroy;
begin
  FGerador.Free;
  inherited Destroy;
end;

function TConsPedidoSolicitacao.GeraXML: Boolean;
var
  i: Integer;
begin
  Gerador.ArquivoFormatoXML:='';
  Gerador.wGrupo('ListaSolicitacoes xmlns="http://www.fazenda.sp.gov.br/"');
  Gerador.wGrupo('Solicitacao');
  Gerador.wCampo(tcStr, '', 'IdInterno', 1, 10, 1, FPedidoSolicitacao.IdInterno);
  Gerador.wCampo(tcStr, '', 'TipoOperacao', 1, 30, 1, tpTipoOperacaoToStr(FPedidoSolicitacao.TipoOperacao));
  Gerador.wCampo(tcStr, '', 'CNPJOrigem', 14, 14, 1, FPedidoSolicitacao.CNPJOrigem);
  Gerador.wCampo(tcStr, '', 'CNPJOrigemUF', 14, 14, 1, FPedidoSolicitacao.CNPJOrigemUF);
  Gerador.wCampo(tcStr, '', 'CNPJDestino', 14, 14, 1, FPedidoSolicitacao.CNPJDestino);
  Gerador.wCampo(tcStr, '', 'CNPJDestinoUF', 14, 14, 1, FPedidoSolicitacao.CNPJDestinoUF);
  Gerador.wCampo(tcStr, '', 'CFOP', 4, 4, 1, FPedidoSolicitacao.CFOP);
  Gerador.wCampo(tcStr, '', 'Importacao', 4, 5, 1, BoolToStr(FPedidoSolicitacao.Importacao));
  Gerador.wCampo(tcStr, '', 'OrdemJudicial', 4, 5, 1, BoolToStr(FPedidoSolicitacao.OrdemJudicial));
  Gerador.wCampo(tcStr, '', 'NumeroDI', 1, 20, 1, FPedidoSolicitacao.NumeroDI);
  Gerador.wGrupo('ListaItens');
  for i:= 0 to FPedidoSolicitacao.ListaItens.Count -1 do
    begin
      Gerador.wGrupo('ItemPapel');
      Gerador.wCampo(tcInt, '', 'CodigoPapel', 1, 20, 1, TItemPapel(FPedidoSolicitacao.ListaItens.Items[i]).CodigoPapel);
      Gerador.wCampo(tcDe2, '', 'Quantidade', 1, 20, 1, TItemPapel(FPedidoSolicitacao.ListaItens.Items[i]).Quantidade);
      Gerador.wGrupo('/ItemPapel');
    end;
  Gerador.wGrupo('/ListaItens');
  Gerador.wGrupo('NF');
  Gerador.wCampo(tcInt, '', 'Numero', 1, 10, 1, FPedidoSolicitacao.NF.Numero);
  Gerador.wCampo(tcInt, '', 'Serie', 1, 10, 1, FPedidoSolicitacao.NF.Serie);
  Gerador.wCampo(tcDat, '', 'DataEmissao', 1, 10, 1, FPedidoSolicitacao.NF.DataEmissao);
  Gerador.wCampo(tcDat, '', 'DataEntrada', 1, 10, 1, FPedidoSolicitacao.NF.DataEntrada);
  Gerador.wCampo(tcDat, '', 'DataSaida', 1, 10, 1, FPedidoSolicitacao.NF.DataSaida);
  Gerador.wCampo(tcDe2, '', 'Valor', 1, 15, 1, FPedidoSolicitacao.NF.Valor);
  Gerador.wGrupo('/NF');
  Gerador.wGrupo('/Solicitacao');
  Gerador.wGrupo('/ListaSolicitacoes');
  Result := (Gerador.ListaDeAlertas.Count = 0);
end;

function TConsPedidoSolicitacao.ObterNomeArquivo: String;
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
  Result := AAAAMMDDTHHMMSS + '-ped-sol.xml';
end;

end.

