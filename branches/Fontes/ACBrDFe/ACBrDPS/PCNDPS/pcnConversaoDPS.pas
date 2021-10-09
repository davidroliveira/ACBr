{ **************************************************************************** }
{ Projeto: Componentes ACBr                                                    }
{ Biblioteca multiplataforma de componentes Delphi para interação com equipa-  }
{ mentos de Automação Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2009 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:   Italo Jurisato Junior                         }
{                                                                              }
{ Você pode obter a última versão desse arquivo na pagina do  Projeto ACBr     }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{ Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la  }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }
{                                                                              }
{ Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM    }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU      }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)              }
{                                                                              }
{ Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto }
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,  }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Você também pode obter uma copia da licença em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Simões de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{ Praça Anita Costa, 34 - Tatuí - SP - 18270-410                               }
{                                                                              }
{ **************************************************************************** }

{*******************************************************************************
|* Historico
|*
|* 20/06/2017: Italo Jurisato Junior
|*  - Doação do componente para o Projeto ACBr
*******************************************************************************}

{$I ACBr.inc}

unit pcnConversaoDPS;

interface

uses
  SysUtils, StrUtils, Classes;

type
  TVersaoDPS = (ve100);

  TStatusACBrDPS = (stIdleDPS, stDPSRecepcao, stDPSRetRecepcao, stDPSConsulta,
                    stDPSStatusServico, stDPSEvento, stDPSEmail,
                    stDistDFeInt, stEnvioWebService);

  TLayOutDPS = (LayDPSRecepcao, LayDPSRetRecepcao, LayDPSConsulta,
                LayDPSStatusServico, LayDPSEvento, LayDPSEventoAN, LayDistDFeInt);

  TSchemaDPS = (schErro, schDPS, schconsSitDPS, schconsStatServ, schEventoDPS,
                schdistDFeInt, schevCancDPS, schevNaoEmbDPS{,
                schresDPS, schresEventoDPS, schprocDPS, schprocEventoDPS});

  TAmbienteGerador = (agPrefeitura, agSistemaNacional);

  TtpEmis = (tePadraoNacional, teProprio);

  TtpProc = (tpWebService, tpFiscoWeb, tpFiscoApp);

  TtpEmit = (tePrestador, teTomador, teIntermediario);

  TcMotivo = (cmEnquadDesenqSimplesNacional, cmImunidadeIsencao,
              cmRejeicaoTomadorIntermediario, cmOutros);

  TmdPrestacao = (mpTransfronteirico, mpConsumoBrasil,
                  mpPresencaComercialExterior, mpMovimentoTempPessoasFisicas);

  TEnquadRVS = (ervsNenhum, ervsACC, ervsACE, ervsBNDESPos, ervsBNDESPre,
                ervsFGE, ervsPROEXEqual, ervsPROEXFinanc);

  TEnquadRPC = (erpcNenhum, erpcBNDESPos, erpcFGE, erpcPROEXEqual,
                erpcPROEXFinanc);

  TMovTempBens = (mtNao, mtVincDeclImport, mtVincDeclExport);

  TIdeDedRed = (idrAlimBebidas, idrMateriais, idrProducaoExterna,
                idrReembolso, idrRepasseConsorciado, idrRepassePlanoSaude,
                idrServicos, idrSubempreitada, idrOutrasDeducoes);

  TopSimpNac = (toNaoOptante, toMEI, toMEEPP);

  TopSNLimUltrap = (toNenhum, toNaoUltrapassado, toUltrapassado);

  TregEspTrib = (retNenhum, retAtoCooperado, retEstimativa, retMEMunicipal,
                 retNotario, retAutonomo, retSociedade);

  TexigISSQN = (exigExigivel, exigImunidade, exigIsencao, exigNaoIncidencia,
                exigExportacao, exigSuspensaDecJudicial, exigSuspensaProcAdm);

  TtpImunidade = (tiPatrimonio, tiTemplos, tiPatrimonioPartido, tiLivros, tiNenhum);

  TtpRetISSQN = (trNaoRetido, trRetidoTomador, trRetidoIntermediario);

  TCST = (cst1, cst2, cst3, cst4, cst5, cst6, cst7, cst8, cst9);

  TtpRetPisCofins = (trpcRetido, trpcNaoRetido);

  TindTotTrib = (indNao);

  TtpEvento = (teCancelamento, teCancSubst);

  TcJustCanc = (jcErroEmissao, jcServicoNaoPrestado, jcOutros);

function cStatToxMotivo(AcStat: Integer): string;

function StrToVersaoDPS(out ok: Boolean; const s: String): TVersaoDPS;
function VersaoDPSToStr(const t: TVersaoDPS): String;
function DblToVersaoDPS(out ok: Boolean; const d: Real): TVersaoDPS;
function VersaoDPSToDbl(const t: TVersaoDPS): Real;

function LayOutToSchema(const t: TLayOutDPS): TSchemaDPS;
function SchemaDPSToStr(const t: TSchemaDPS): String;
function StrToSchemaDPS(out ok: Boolean; const s: String): TSchemaDPS;

function LayOutDPSToServico(const t: TLayOutDPS): String;
function ServicoToLayOutDPS(out ok: Boolean; const s: String): TLayOutDPS;

function AmbienteGeradorToStr(const t: TAmbienteGerador): String;
function StrToAmbienteGerador(out ok: Boolean; const s: String): TAmbienteGerador;

function tpEmisToStr(const t: TtpEmis): String;
function StrTotpEmis(out ok: Boolean; const s: String): TtpEmis;

function tpProcToStr(const t: TtpProc): String;
function StrTotpProc(out ok: Boolean; const s: String): TtpProc;

function tpEmitToStr(const t: TtpEmit): String;
function StrTotpEmit(out ok: Boolean; const s: String): TtpEmit;

function cMotivoToStr(const t: TcMotivo): String;
function StrTocMotivo(out ok: Boolean; const s: String): TcMotivo;

function mdPrestacaoToStr(const t: TmdPrestacao): String;
function StrTomdPrestacao(out ok: Boolean; const s: String): TmdPrestacao;

function EnquadRVSToStr(const t: TEnquadRVS): String;
function StrToEnquadRVS(out ok: Boolean; const s: String): TEnquadRVS;

function EnquadRPCToStr(const t: TEnquadRPC): String;
function StrToEnquadRPC(out ok: Boolean; const s: String): TEnquadRPC;

function MovTempBensToStr(const t: TMovTempBens): String;
function StrToMovTempBens(out ok: Boolean; const s: String): TMovTempBens;

function IdeDedRedToStr(const t: TIdeDedRed): String;
function StrToIdeDedRed(out ok: Boolean; const s: String): TIdeDedRed;

function opSimpNacToStr(const t: TopSimpNac): String;
function StrToopSimpNac(out ok: Boolean; const s: String): TopSimpNac;

function opSNLimUltrapToStr(const t: TopSNLimUltrap): String;
function StrToopSNLimUltrap(out ok: Boolean; const s: String): TopSNLimUltrap;

function regEspTribToStr(const t: TregEspTrib): String;
function StrToregEspTrib(out ok: Boolean; const s: String): TregEspTrib;

function exigISSQNToStr(const t: TexigISSQN): String;
function StrToexigISSQN(out ok: Boolean; const s: String): TexigISSQN;

function tpImunidadeToStr(const t: TtpImunidade): String;
function StrTotpImunidade(out ok: Boolean; const s: String): TtpImunidade;

function tpRetISSQNToStr(const t: TtpRetISSQN): String;
function StrTotpRetISSQN(out ok: Boolean; const s: String): TtpRetISSQN;

function CSTToStr(const t: TCST): String;
function StrToCST(out ok: Boolean; const s: String): TCST;

function tpRetPisCofinsToStr(const t: TtpRetPisCofins): String;
function StrTotpRetPisCofins(out ok: Boolean; const s: String): TtpRetPisCofins;

function indTotTribToStr(const t: TindTotTrib): String;
function StrToindTotTrib(out ok: Boolean; const s: String): TindTotTrib;

function tpEventoToStr(const t: TtpEvento): String;
function StrTotpEvento(out ok: Boolean; const s: String): TtpEvento;

function cJustCancToStr(const t: TcJustCanc): String;
function StrTocJustCanc(out ok: Boolean; const s: String): TcJustCanc;

implementation

uses
  pcnConversao, typinfo;

function cStatToxMotivo(AcStat: Integer): string;
begin
  case AcStat of
    100: Result := 'NFS-e Gerada';
    101: Result := 'NFS-e de Substituição Gerada';
    102: Result := 'NFS-e de Decisão Judicial';
    150: Result := 'Evento registrado e vinculado à NFS-e';
    151: Result := 'Evento registrado, mas não vinculado à NFS-e';
    152: Result := 'Evento dependente de análise fiscal';
  else
    Result := 'cStat não definido';
  end;
end;

function StrToVersaoDPS(out ok: Boolean; const s: String): TVersaoDPS;
begin
  Result := StrToEnumerado(ok, s, ['1.00'], [ve100]);
end;

function VersaoDPSToStr(const t: TVersaoDPS): String;
begin
  Result := EnumeradoToStr(t, ['1.00'], [ve100]);
end;

function DblToVersaoDPS(out ok: Boolean; const d: Real): TVersaoDPS;
begin
  ok := True;

  if (d = 1.0)  then
    Result := ve100
  else
  begin
    Result := ve100;
    ok := False;
  end;
end;

function VersaoDPSToDbl(const t: TVersaoDPS): Real;
begin
  case t of
    ve100: Result := 1.00;
  else
    Result := 0;
  end;
end;

function LayOutToSchema(const t: TLayOutDPS): TSchemaDPS;
begin
  case t of
    LayDPSRecepcao:      Result := schDPS;
    LayDPSConsulta:      Result := schconsSitDPS;
    LayDPSStatusServico: Result := schconsStatServ;
    LayDPSEvento,
    LayDPSEventoAN:      Result := schEventoDPS;
    LayDistDFeInt:       Result := schdistDFeInt;
  else
    Result := schErro;
  end;
end;

function SchemaDPSToStr(const t: TSchemaDPS): String;
begin
  Result := GetEnumName(TypeInfo(TSchemaDPS), Integer( t ) );
  Result := copy(Result, 4, Length(Result)); // Remove prefixo "sch"
end;

function StrToSchemaDPS(out ok: Boolean; const s: String): TSchemaDPS;
var
  P: Integer;
  SchemaStr: String;
begin
  P := pos('_', s);
  if p > 0 then
    SchemaStr := copy(s, 1, P-1)
  else
    SchemaStr := s;

  if LeftStr(SchemaStr, 3) <> 'sch' then
    SchemaStr := 'sch' + SchemaStr;

  Result := TSchemaDPS( GetEnumValue(TypeInfo(TSchemaDPS), SchemaStr ) );
end;

function LayOutDPSToServico(const t: TLayOutDPS): String;
begin
  Result := EnumeradoToStr(t,
    ['DPSRecepcao', 'DPSConsultaProtocolo', 'DPSStatusServico', 'DPSRetRecepcao',
     'DPSRecepcaoEvento', 'DPSRecepcaoEvento', 'DPSDistribuicaoDFe'],
    [ LayDPSRecepcao, LayDPSConsulta, LayDPSStatusServico, LayDPSRetRecepcao,
      LayDPSEvento, LayDPSEventoAN, LayDistDFeInt ] );
end;

function ServicoToLayOutDPS(out ok: Boolean; const s: String): TLayOutDPS;
begin
  Result := StrToEnumerado(ok, s,
    ['DPSRecepcao', 'DPSConsultaProtocolo', 'DPSStatusServico', 'DPSRetRecepcao',
     'DPSRecepcaoEvento', 'DPSRecepcaoEvento', 'DPSDistribuicaoDFe'],
    [ LayDPSRecepcao, LayDPSConsulta, LayDPSStatusServico, LayDPSRetRecepcao,
      LayDPSEvento, LayDPSEventoAN, LayDistDFeInt ] );
end;

function AmbienteGeradorToStr(const t: TAmbienteGerador): String;
begin
  Result := EnumeradoToStr(t, ['1', '2'],
                           [agPrefeitura, agSistemaNacional]);
end;

function StrToAmbienteGerador(out ok: Boolean; const s: String): TAmbienteGerador;
begin
  Result := StrToEnumerado(ok, s, ['1', '2'],
                           [agPrefeitura, agSistemaNacional]);
end;

function tpEmisToStr(const t: TtpEmis): String;
begin
  Result := EnumeradoToStr(t, ['1', '2'],
                           [tePadraoNacional, teProprio]);
end;

function StrTotpEmis(out ok: Boolean; const s: String): TtpEmis;
begin
  Result := StrToEnumerado(ok, s, ['1', '2'],
                           [tePadraoNacional, teProprio]);
end;

function tpProcToStr(const t: TtpProc): String;
begin
  Result := EnumeradoToStr(t, ['1', '2', '3'],
                           [tpWebService, tpFiscoWeb, tpFiscoApp]);
end;

function StrTotpProc(out ok: Boolean; const s: String): TtpProc;
begin
  Result := StrToEnumerado(ok, s, ['1', '2', '3'],
                           [tpWebService, tpFiscoWeb, tpFiscoApp]);
end;

function tpEmitToStr(const t: TtpEmit): String;
begin
  Result := EnumeradoToStr(t, ['1', '2', '3'],
                           [tePrestador, teTomador, teIntermediario]);
end;

function StrTotpEmit(out ok: Boolean; const s: String): TtpEmit;
begin
  Result := StrToEnumerado(ok, s, ['1', '2', '3'],
                           [tePrestador, teTomador, teIntermediario]);
end;

function cMotivoToStr(const t: TcMotivo): String;
begin
  Result := EnumeradoToStr(t, ['1', '2', '3', '9'],
                           [cmEnquadDesenqSimplesNacional, cmImunidadeIsencao,
                            cmRejeicaoTomadorIntermediario, cmOutros]);
end;

function StrTocMotivo(out ok: Boolean; const s: String): TcMotivo;
begin
  Result := StrToEnumerado(ok, s, ['1', '2', '3', '9'],
                           [cmEnquadDesenqSimplesNacional, cmImunidadeIsencao,
                            cmRejeicaoTomadorIntermediario, cmOutros]);
end;

function mdPrestacaoToStr(const t: TmdPrestacao): String;
begin
  result := EnumeradoToStr(t,
                           ['1', '2', '3', '4'],
                           [mpTransfronteirico, mpConsumoBrasil,
                   mpPresencaComercialExterior, mpMovimentoTempPessoasFisicas]);
end;

function StrTomdPrestacao(out ok: Boolean; const s: String): TmdPrestacao;
begin
  result := StrToEnumerado(ok, s,
                           ['1', '2', '3', '4'],
                           [mpTransfronteirico, mpConsumoBrasil,
                   mpPresencaComercialExterior, mpMovimentoTempPessoasFisicas]);
end;

function EnquadRVSToStr(const t: TEnquadRVS): String;
begin
  result := EnumeradoToStr(t,
                           ['0', '1', '2', '3', '4', '5', '6', '7'],
                           [ervsNenhum, ervsACC, ervsACE, ervsBNDESPos,
                            ervsBNDESPre, ervsFGE, ervsPROEXEqual, ervsPROEXFinanc]);
end;

function StrToEnquadRVS(out ok: Boolean; const s: String): TEnquadRVS;
begin
  result := StrToEnumerado(ok, s,
                           ['0', '1', '2', '3', '4', '5', '6', '7'],
                           [ervsNenhum, ervsACC, ervsACE, ervsBNDESPos,
                            ervsBNDESPre, ervsFGE, ervsPROEXEqual, ervsPROEXFinanc]);
end;

function EnquadRPCToStr(const t: TEnquadRPC): String;
begin
  result := EnumeradoToStr(t,
                           ['0', '1', '2', '3', '4'],
                           [erpcNenhum, erpcBNDESPos, erpcFGE, erpcPROEXEqual,
                            erpcPROEXFinanc]);
end;

function StrToEnquadRPC(out ok: Boolean; const s: String): TEnquadRPC;
begin
  result := StrToEnumerado(ok, s,
                           ['0', '1', '2', '3', '4'],
                           [erpcNenhum, erpcBNDESPos, erpcFGE, erpcPROEXEqual,
                            erpcPROEXFinanc]);
end;

function MovTempBensToStr(const t: TMovTempBens): String;
begin
  result := EnumeradoToStr(t,
                           ['1', '2', '3'],
                           [mtNao, mtVincDeclImport, mtVincDeclExport]);
end;

function StrToMovTempBens(out ok: Boolean; const s: String): TMovTempBens;
begin
  result := StrToEnumerado(ok, s,
                           ['1', '2', '3'],
                           [mtNao, mtVincDeclImport, mtVincDeclExport]);
end;

function IdeDedRedToStr(const t: TIdeDedRed): String;
begin
  result := EnumeradoToStr(t,
                           ['1', '2', '3', '4', '5', '6', '7', '8', '99'],
                           [idrAlimBebidas, idrMateriais, idrProducaoExterna,
                      idrReembolso, idrRepasseConsorciado, idrRepassePlanoSaude,
                      idrServicos, idrSubempreitada, idrOutrasDeducoes]);
end;

function StrToIdeDedRed(out ok: Boolean; const s: String): TIdeDedRed;
begin
  result := StrToEnumerado(ok, s,
                           ['1', '2', '3', '4', '5', '6', '7', '8', '99'],
                           [idrAlimBebidas, idrMateriais, idrProducaoExterna,
                      idrReembolso, idrRepasseConsorciado, idrRepassePlanoSaude,
                      idrServicos, idrSubempreitada, idrOutrasDeducoes]);
end;

function opSimpNacToStr(const t: TopSimpNac): String;
begin
  result := EnumeradoToStr(t,
                           ['1', '2', '3'],
                           [toNaoOptante, toMEI, toMEEPP]);
end;

function StrToopSimpNac(out ok: Boolean; const s: String): TopSimpNac;
begin
  result := StrToEnumerado(ok, s,
                           ['1', '2', '3'],
                           [toNaoOptante, toMEI, toMEEPP]);
end;

function opSNLimUltrapToStr(const t: TopSNLimUltrap): String;
begin
  result := EnumeradoToStr(t,
                           ['', '0', '1'],
                           [toNenhum, toNaoUltrapassado, toUltrapassado]);
end;

function StrToopSNLimUltrap(out ok: Boolean; const s: String): TopSNLimUltrap;
begin
  result := StrToEnumerado(ok, s,
                           ['', '0', '1'],
                           [toNenhum, toNaoUltrapassado, toUltrapassado]);
end;

function regEspTribToStr(const t: TregEspTrib): String;
begin
  result := EnumeradoToStr(t,
                           ['0', '1', '2', '3', '4', '5', '6'],
                           [retNenhum, retAtoCooperado, retEstimativa,
                            retMEMunicipal, retNotario, retAutonomo, retSociedade]);
end;

function StrToregEspTrib(out ok: Boolean; const s: String): TregEspTrib;
begin
  result := StrToEnumerado(ok, s,
                           ['0', '1', '2', '3', '4', '5', '6'],
                           [retNenhum, retAtoCooperado, retEstimativa,
                            retMEMunicipal, retNotario, retAutonomo, retSociedade]);
end;

function exigISSQNToStr(const t: TexigISSQN): String;
begin
  result := EnumeradoToStr(t,
                           ['1', '2', '3', '4', '5', '6', '7'],
                           [exigExigivel, exigImunidade, exigIsencao,
                            exigNaoIncidencia, exigExportacao,
                            exigSuspensaDecJudicial, exigSuspensaProcAdm]);
end;

function StrToexigISSQN(out ok: Boolean; const s: String): TexigISSQN;
begin
  result := StrToEnumerado(ok, s,
                           ['1', '2', '3', '4', '5', '6', '7'],
                           [exigExigivel, exigImunidade, exigIsencao,
                            exigNaoIncidencia, exigExportacao,
                            exigSuspensaDecJudicial, exigSuspensaProcAdm]);
end;

function tpImunidadeToStr(const t: TtpImunidade): String;
begin
  result := EnumeradoToStr(t,
                           ['1', '2', '3', '4', ''],
                           [tiPatrimonio, tiTemplos, tiPatrimonioPartido,
                            tiLivros, tiNenhum]);
end;

function StrTotpImunidade(out ok: Boolean; const s: String): TtpImunidade;
begin
  result := StrToEnumerado(ok, s,
                           ['1', '2', '3', '4', ''],
                           [tiPatrimonio, tiTemplos, tiPatrimonioPartido,
                            tiLivros, tiNenhum]);
end;

function tpRetISSQNToStr(const t: TtpRetISSQN): String;
begin
  result := EnumeradoToStr(t,
                           ['1', '2', '3'],
                           [trNaoRetido, trRetidoTomador, trRetidoIntermediario]);
end;

function StrTotpRetISSQN(out ok: Boolean; const s: String): TtpRetISSQN;
begin
  result := StrToEnumerado(ok, s,
                           ['1', '2', '3'],
                           [trNaoRetido, trRetidoTomador, trRetidoIntermediario]);
end;

function CSTToStr(const t: TCST): String;
begin
  result := EnumeradoToStr(t,
                           ['1', '2', '3', '4', '5', '6', '7', '8', '9'],
                           [cst1, cst2, cst3, cst4, cst5, cst6, cst7, cst8, cst9]);
end;

function StrToCST(out ok: Boolean; const s: String): TCST;
begin
  result := StrToEnumerado(ok, s,
                           ['1', '2', '3', '4', '5', '6', '7', '8', '9'],
                           [cst1, cst2, cst3, cst4, cst5, cst6, cst7, cst8, cst9]);
end;

function tpRetPisCofinsToStr(const t: TtpRetPisCofins): String;
begin
  result := EnumeradoToStr(t,
                           ['1', '2'],
                           [trpcRetido, trpcNaoRetido]);
end;

function StrTotpRetPisCofins(out ok: Boolean; const s: String): TtpRetPisCofins;
begin
  result := StrToEnumerado(ok, s,
                           ['1', '2'],
                           [trpcRetido, trpcNaoRetido]);
end;

function indTotTribToStr(const t: TindTotTrib): String;
begin
  result := EnumeradoToStr(t,
                           ['0'],
                           [indNao]);
end;

function StrToindTotTrib(out ok: Boolean; const s: String): TindTotTrib;
begin
  result := StrToEnumerado(ok, s,
                           ['0'],
                           [indNao]);
end;

function tpEventoToStr(const t: TtpEvento): String;
begin
  result := EnumeradoToStr(t,
                           ['e11101', 'e12102'],
                           [teCancelamento, teCancSubst]);
end;

function StrTotpEvento(out ok: Boolean; const s: String): TtpEvento;
begin
  result := StrToEnumerado(ok, s,
                           ['e11101', 'e12102'],
                           [teCancelamento, teCancSubst]);
end;

function cJustCancToStr(const t: TcJustCanc): String;
begin
  result := EnumeradoToStr(t,
                           ['1', '2', '9'],
                           [jcErroEmissao, jcServicoNaoPrestado, jcOutros]);
end;

function StrTocJustCanc(out ok: Boolean; const s: String): TcJustCanc;
begin
  result := StrToEnumerado(ok, s,
                           ['1', '2', '9'],
                           [jcErroEmissao, jcServicoNaoPrestado, jcOutros]);
end;

end.

