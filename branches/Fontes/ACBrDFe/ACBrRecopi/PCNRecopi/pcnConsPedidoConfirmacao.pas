{$I ACBr.inc}

unit pcnConsPedidoConfirmacao;

interface

uses
  Classes, SysUtils, pcnGerador, pcnRecopi, pcnConversaoRecopi, pcnConversao,
  pcnAuxiliar;

type


  { TConsPedidoConfirmacao }

  TConsPedidoConfirmacao = class(TPersistent)
  private
    FGerador: TGerador;
    FPedidoConfirmacao: TConfirmaSolicitacao;
  public
    constructor Create;
    destructor Destroy; override;
    function GeraXML: Boolean;
    function ObterNomeArquivo: String;
  published
    property Gerador: TGerador read FGerador write FGerador;
    property PedidoConfirmacao: TConfirmaSolicitacao read FPedidoConfirmacao write FPedidoConfirmacao;
  end;


implementation

{ TConsPedidoConfirmacao }

constructor TConsPedidoConfirmacao.Create;
begin
  inherited Create;
  FGerador := TGerador.Create;
end;

destructor TConsPedidoConfirmacao.Destroy;
begin
  FGerador.Free;
  inherited Destroy;
end;

function TConsPedidoConfirmacao.GeraXML: Boolean;
var
  i: Integer;
begin
  Gerador.ArquivoFormatoXML:='';
  Gerador.wGrupo('ListaConfirmacoes');
  Gerador.wGrupo('Confirmacao');
  Gerador.wCampo(tcStr, '', 'CodigoControle', 1, 10, 1, FPedidoConfirmacao.CodigoControle);
  Gerador.wCampo(tcStr, '', 'StatusSolicitacao', 1, 30, 1, tpStatusSolicitacaoToStr(FPedidoConfirmacao.StatusSolicitacao));
  Gerador.wGrupo('NFEntrada');
  Gerador.wCampo(tcDat, '', 'DataEntrada', 1, 10, 1, FPedidoConfirmacao.NFEntrada.DataEntrada);
  Gerador.wGrupo('/NFEntrada');
  Gerador.wGrupo('NFComplementar');
  Gerador.wCampo(tcInt, '', 'Numero', 1, 10, 1, FPedidoConfirmacao.NFComplementar.Numero);
  Gerador.wCampo(tcInt, '', 'Serie', 1, 10, 1, FPedidoConfirmacao.NFComplementar.Serie);
  Gerador.wCampo(tcDat, '', 'DataEmissao', 1, 10, 1, FPedidoConfirmacao.NFComplementar.DataEmissao);
  Gerador.wCampo(tcDat, '', 'DataEntrada', 1, 10, 1, FPedidoConfirmacao.NFComplementar.DataEntrada);
  Gerador.wCampo(tcDat, '', 'DataSaida', 1, 10, 1, FPedidoConfirmacao.NFComplementar.DataSaida);
  Gerador.wCampo(tcDe2, '', 'Valor', 1, 15, 1, FPedidoConfirmacao.NFComplementar.Valor);
  Gerador.wGrupo('/NFComplementar');
  Gerador.wGrupo('ListaItens');
  for i:= 0 to FPedidoConfirmacao.ListaItens.Count -1 do
    begin
      Gerador.wGrupo('ItemPapel');
      Gerador.wCampo(tcInt, '', 'CodigoPapel', 1, 20, 1, TItemPapel(FPedidoConfirmacao.ListaItens.Items[i]).CodigoPapel);
      Gerador.wCampo(tcDe2, '', 'Quantidade', 1, 20, 1, TItemPapel(FPedidoConfirmacao.ListaItens.Items[i]).Quantidade);
      Gerador.wGrupo('/ItemPapel');
    end;
  Gerador.wGrupo('/ListaItens');
  Gerador.wCampo(tcStr, '', 'IdRemessa', 1, 30, 1, FPedidoConfirmacao.IdRemessa);
  Gerador.wCampo(tcStr, '', 'Justificativa', 1, 30, 1, FPedidoConfirmacao.Justificativa);
  Gerador.wGrupo('/Confirmacao');
  Gerador.wGrupo('/ListaConfirmacoes');
  Result := (Gerador.ListaDeAlertas.Count = 0);
end;

function TConsPedidoConfirmacao.ObterNomeArquivo: String;
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
  Result := AAAAMMDDTHHMMSS + '-ped-con.xml';
end;

end.

