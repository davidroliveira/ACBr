{$I ACBr.inc}

unit pcnConversaoRecopi;

interface

uses
  Classes, SysUtils;

type

  TpcnTipoOperacao = (toRemessa, toRecebimento, toRemessaIndustrializacao,
     toRecebimentoIndustrializacao, toRemessaArmazenagemGeralDepositoFechado,
     toRecebimentoArmazemGeralDepositoFechado, toInterna, toRemessaInterestadual,
     toEntradaInterestadual, toIndustrializacaoRemessaInterna,
     toIndustrializacaoRemessaInterestadual, toIndustrializacaoRecebimentoInterestadual,
     toArmazemRemessaInterna, toArmazemRemessaInterestadual, toArmazemRecebimentoInterestadual,
     toJudicialRemessa, toJudicialRecebimento, toJudicialArmazemRemessa,
     toJudicialArmazemRecebimento, toJudicialIndustrializacaoRemessa,
     toJudicialIndustrializacaoRecebimento);

  TpcnStatusSolicitacao = (tsAceite, tsAceiteDevolucao, tsCancelamento,
    tsDevolucaoParcial, tsDevolucaoTotal, tsImportacaoFracionada, tsImposto,
    tsRetorno, tsRetornoArmazem, tsRetornoIndustrializacao, tsSemConfirmacao,
    tsSinistro);

  TpcnStatusAnterior = (taFechado, taAberto, taAceito, taFracionado, taDevolvido);

  TpcnTipoInforme = (tiEstoque, tiPapelTributado, tiPapelImune, tiPublicacao,
    tiResiduo, tiTransformacao, tiEnvioIndustrializacao,
    tiRecebimentoIndustrializacao);

  TpcnTipoDeclaracao = (tdNova, tdCorretiva);

  TpcnTipoPublicacao = (tpLivro, tpJornal);

function tpTipoOperacaoToStr(const t: TpcnTipoOperacao): String;
function StrToTpTipoOperacao(out ok: Boolean; const s: String): TpcnTipoOperacao;

function tpStatusSolicitacaoToStr(const t: TpcnStatusSolicitacao): String;
function StrToTpStatusSolicitacao(out ok: Boolean; const s: String): TpcnStatusSolicitacao;

function tpStatusAnteriorToStr(const t: TpcnStatusAnterior): String;
function StrToTpStatusAnterior(out ok: Boolean; const s: String): TpcnStatusAnterior;

function tpTipoInformeToStr(const t: TpcnTipoInforme): String;
function StrToTpTipoInforme(out ok: Boolean; const s: String): TpcnTipoInforme;

function tpTipoDeclaracaoToStr(const t: TpcnTipoDeclaracao): String;
function StrToTpTipoDeclaracao(out ok: Boolean; const s: String): TpcnTipoDeclaracao;

function tpTipoPublicacaoToStr(const t: TpcnTipoPublicacao): String;
function StrToTpTipoPublicacao(out ok: Boolean; const s: String): TpcnTipoPublicacao;

implementation

uses
  typinfo, pcnConversao;

function tpTipoOperacaoToStr(const t: TpcnTipoOperacao): String;
begin
  Result := EnumeradoToStr(t, ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
     '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22',
     '23', '24', '25', '26', '27', '28', '29'], [toRemessa, toRecebimento, toRemessaIndustrializacao,
     toRecebimentoIndustrializacao, toRemessaArmazenagemGeralDepositoFechado,
     toRecebimentoArmazemGeralDepositoFechado, toInterna, toRemessaInterestadual,
     toEntradaInterestadual, toIndustrializacaoRemessaInterna,
     toIndustrializacaoRemessaInterestadual, toIndustrializacaoRecebimentoInterestadual,
     toArmazemRemessaInterna, toArmazemRemessaInterestadual, toArmazemRecebimentoInterestadual,
     toJudicialRemessa, toJudicialRecebimento, toJudicialArmazemRemessa,
     toJudicialArmazemRecebimento, toJudicialIndustrializacaoRemessa,
     toJudicialIndustrializacaoRecebimento]);
end;

function StrToTpTipoOperacao(out ok: Boolean; const s: String
  ): TpcnTipoOperacao;
begin
  Result := StrToEnumerado(ok, s, ['Remessa', 'Recebimento', 'Remessa Industrializacao',
     'Recebimento Industrializacao', 'Remessa Armazenagem Geral E Deposito Fechado',
     'Recebimento Armazem Geral Deposito Fechado', 'Interna', 'Remessa Interestadual',
     'Entrada Interestadual', 'Industrializacao Remessa Interna',
     'Industrializacao Remessa Interestadual', 'Industrializacao Recebimento Interestadual',
     'Armazem Remessa Interna', 'Armazem Remessa Interestadual', 'Armazem Recebimento Interestadual',
     'JudicialRemessa', 'Judicial Recebimento', 'Judicial Armazem Remessa',
     'Judicial Armazem Recebimento', 'Judicial Industrializacao Remessa',
     'Judicial Industrializacao Recebimento'], [toRemessa, toRecebimento, toRemessaIndustrializacao,
     toRecebimentoIndustrializacao, toRemessaArmazenagemGeralDepositoFechado,
     toRecebimentoArmazemGeralDepositoFechado, toInterna, toRemessaInterestadual,
     toEntradaInterestadual, toIndustrializacaoRemessaInterna,
     toIndustrializacaoRemessaInterestadual, toIndustrializacaoRecebimentoInterestadual,
     toArmazemRemessaInterna, toArmazemRemessaInterestadual, toArmazemRecebimentoInterestadual,
     toJudicialRemessa, toJudicialRecebimento, toJudicialArmazemRemessa,
     toJudicialArmazemRecebimento, toJudicialIndustrializacaoRemessa,
     toJudicialIndustrializacaoRecebimento]);
end;

function tpStatusSolicitacaoToStr(const t: TpcnStatusSolicitacao): String;
begin
  Result := EnumeradoToStr(t, ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
    '10', '11', '12', '13', '14', '15'], [tsAceite, tsAceiteDevolucao, tsCancelamento,
    tsDevolucaoParcial, tsDevolucaoTotal, tsImportacaoFracionada, tsImposto,
    tsRetorno, tsRetornoArmazem, tsRetornoIndustrializacao, tsSemConfirmacao,
    tsSinistro]);
end;

function StrToTpStatusSolicitacao(out ok: Boolean; const s: String
  ): TpcnStatusSolicitacao;
begin
  Result := StrToEnumerado(ok, s, ['Aceite', 'Aceite Devolucao', 'Cancelamento',
    'Devolucao Parcial', 'Devolucao Total', 'Importacao Fracionada', 'Imposto',
    'Retorno', 'Retorno Armazem', 'Retorno Industrializacao', 'Sem Confirmacao',
    'Sinistro'], [tsAceite, tsAceiteDevolucao, tsCancelamento,
    tsDevolucaoParcial, tsDevolucaoTotal, tsImportacaoFracionada, tsImposto,
    tsRetorno, tsRetornoArmazem, tsRetornoIndustrializacao, tsSemConfirmacao,
    tsSinistro]);
end;

function tpStatusAnteriorToStr(const t: TpcnStatusAnterior): String;
begin
  Result := EnumeradoToStr(t, ['0', '1', '2', '3', '4'], [taFechado, taAberto, taAceito, taFracionado, taDevolvido]);
end;

function StrToTpStatusAnterior(out ok: Boolean; const s: String
  ): TpcnStatusAnterior;
begin
  Result := StrToEnumerado(ok, s, ['Fechado', 'Aberto', 'Aceito', 'Fracionado', 'Devolvido'], [taFechado, taAberto, taAceito, taFracionado, taDevolvido]);
end;

function tpTipoInformeToStr(const t: TpcnTipoInforme): String;
begin
  Result := EnumeradoToStr(t, ['0', '1', '2', '3', '4', '5', '6', '7'], [tiEstoque, tiPapelTributado, tiPapelImune, tiPublicacao,
    tiResiduo, tiTransformacao, tiEnvioIndustrializacao,
    tiRecebimentoIndustrializacao]);
end;

function StrToTpTipoInforme(out ok: Boolean; const s: String): TpcnTipoInforme;
begin
  Result := StrToEnumerado(ok, s, ['Estoque', 'Papel Tributado', 'Papel Imune', 'Publicacao',
    'Residuo', 'Transformacao', 'Envio Industrializacao',
    'Recebimento Industrializacao'], [tiEstoque, tiPapelTributado, tiPapelImune, tiPublicacao,
    tiResiduo, tiTransformacao, tiEnvioIndustrializacao,
    tiRecebimentoIndustrializacao]);
end;

function tpTipoDeclaracaoToStr(const t: TpcnTipoDeclaracao): String;
begin
  Result := EnumeradoToStr(t, ['0', '1'], [tdNova, tdCorretiva]) ;
end;

function StrToTpTipoDeclaracao(out ok: Boolean; const s: String
  ): TpcnTipoDeclaracao;
begin
  Result := StrToEnumerado(ok, s, ['Nova', 'Corretiva'], [tdNova, tdCorretiva]);
end;

function tpTipoPublicacaoToStr(const t: TpcnTipoPublicacao): String;
begin
  Result := EnumeradoToStr(t, ['0', '1'], [tpLivro, tpJornal]);
end;

function StrToTpTipoPublicacao(out ok: Boolean; const s: String
  ): TpcnTipoPublicacao;
begin
  Result := StrToEnumerado(ok, s, ['Livro', 'Jornal'], [tpLivro, tpJornal]);
end;

end.

