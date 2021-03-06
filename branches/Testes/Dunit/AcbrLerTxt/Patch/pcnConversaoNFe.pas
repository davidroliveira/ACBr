////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//              PCN - Projeto Cooperar NFe                                    //
//                                                                            //
//   Descri??o: Classes para gera??o/leitura dos arquivos xml da NFe          //
//                                                                            //
//        site: www.projetocooperar.org/nfe                                   //
//       email: projetocooperar@zipmail.com.br                                //
//       forum: http://br.groups.yahoo.com/group/projeto_cooperar_nfe/        //
//     projeto: http://code.google.com/p/projetocooperar/                     //
//         svn: http://projetocooperar.googlecode.com/svn/trunk/              //
//                                                                            //
// Coordena??o: (c) 2009 - Paulo Casagrande                                   //
//                                                                            //
//      Equipe: Vide o arquivo leiame.txt na pasta raiz do projeto            //
//                                                                            //
//      Vers?o: Vide o arquivo leiame.txt na pasta raiz do projeto            //
//                                                                            //
//     Licen?a: GNU Lesser General Public License (GNU LGPL)                  //
//                                                                            //
//              - Este programa ? software livre; voc? pode redistribu?-lo    //
//              e/ou modific?-lo sob os termos da Licen?a P?blica Geral GNU,  //
//              conforme publicada pela Free Software Foundation; tanto a     //
//              vers?o 2 da Licen?a como (a seu crit?rio) qualquer vers?o     //
//              mais nova.                                                    //
//                                                                            //
//              - Este programa ? distribu?do na expectativa de ser ?til,     //
//              mas SEM QUALQUER GARANTIA; sem mesmo a garantia impl?cita de  //
//              COMERCIALIZA??O ou de ADEQUA??O A QUALQUER PROP?SITO EM       //
//              PARTICULAR. Consulte a Licen?a P?blica Geral GNU para obter   //
//              mais detalhes. Voc? deve ter recebido uma c?pia da Licen?a    //
//              P?blica Geral GNU junto com este programa; se n?o, escreva    //
//              para a Free Software Foundation, Inc., 59 Temple Place,       //
//              Suite 330, Boston, MA - 02111-1307, USA ou consulte a         //
//              licen?a oficial em http://www.gnu.org/licenses/gpl.txt        //
//                                                                            //
//    Nota (1): - Esta  licen?a  n?o  concede  o  direito  de  uso  do nome   //
//              "PCN  -  Projeto  Cooperar  NFe", n?o  podendo o mesmo ser    //
//              utilizado sem previa autoriza??o.                             //
//                                                                            //
//    Nota (2): - O uso integral (ou parcial) das units do projeto esta       //
//              condicionado a manuten??o deste cabe?alho junto ao c?digo     //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

{$I ACBr.inc}

unit pcnConversaoNFe;

interface

uses
  SysUtils, StrUtils, Classes;

type

  TpcnTipoNFe = (tnEntrada, tnSaida);
  TpcnFinalidadeNFe = (fnNormal, fnComplementar, fnAjuste, fnDevolucao);

  (* IMPORTANTE - Sempre que alterar um Tipo efetuar a atualiza??o das fun??es de convers?o correspondentes *)
  TLayOut = (LayNfeRecepcao, LayNfeRetRecepcao, LayNfeCancelamento,
    LayNfeInutilizacao, LayNfeConsulta, LayNfeStatusServico,
    LayNfeCadastro, LayNFeCCe, LayNFeEvento, LayNFeEventoAN, LayNFeConsNFeDest,
    LayNFeDownloadNFe, LayNfeAutorizacao, LayNfeRetAutorizacao,
    LayAdministrarCSCNFCe, LayDistDFeInt, LayNFCeEPEC);

  TSchemaNFe = (schErro, schNfe, schcancNFe, schInutNFe, schEnvCCe,
                schEnvEventoCancNFe, schEnvConfRecebto, schEnvEPEC,
                schresNFe, schresEvento, schprocNFe, schprocEventoNFe,
                schconsReciNFe, schconsSitNFe, schconsStatServ, schconsCad,
                schenvEvento, schconsNFeDest, schdownloadNFe, schretEnviNFe,
                schadmCscNFCe, schdistDFeInt, scheventoEPEC);

  TStatusACBrNFe = (stIdle, stNFeStatusServico, stNFeRecepcao, stNFeRetRecepcao,
    stNFeConsulta, stNFeCancelamento, stNFeInutilizacao, stNFeRecibo,
    stNFeCadastro, stNFeEmail, stNFeCCe, stNFeEvento, stConsNFeDest,
    stDownloadNFe, stAdmCSCNFCe, stDistDFeInt, stEnvioWebService);

  TpcnModeloDF = (moNFe, moNFCe);
  TpcnVersaoDF = (ve200, ve300, ve310);
  TpcnIndicadorNFe = (inTodas, inSemManifestacaoComCiencia, inSemManifestacaoSemCiencia);

  TpcnTipoOperacao = (toVendaConcessionaria, toFaturamentoDireto, toVendaDireta, toOutros);
  TpcnCondicaoVeiculo = (cvAcabado, cvInacabado, cvSemiAcabado);
  TpcnTipoArma = (taUsoPermitido, taUsoRestrito);
  TtpIntegra = (tiNaoInformado, tiPagIntegrado, tiPagNaoIntegrado);

  TLayId = (  IdB   ,IdBA   ,IdBA02 ,IdBA03 ,IdBA10 ,IdBA13 ,IdBA14,
              IdBA19,IdBA20 ,IdC    ,IdC02  ,IdC02A ,IdC05  ,IdD,
              IdE   ,IdE02  ,IdE03  ,IdE03A ,IdE05  ,IdF    ,IdF02,
              IdF02A,IdG    ,IdG02  ,IdG02A ,IdGA02 ,IdGA03 ,IdH,
              IdI   ,IdI05a ,IdI05c ,IdI18  ,IdI25  ,IdI50  ,IdI52,
              IdJ   ,IdK    ,IdL    ,IdLA   ,IdLA07 ,IdLB   ,IdL109,
              IdL114,IdL117 ,IdM    ,IdN02  ,IdN03  ,IdN04  ,IdN05,
              IdN06 ,IdN07  ,IdN08  ,IdN09  ,IdN10  ,IdN10A ,IdN10B,
              IdN10C,IdN10D ,idN10E ,IdN10F ,IdN10G ,IdN10H ,IdO,
              IdO07 ,IdO08  ,IdO10  ,IdO11  ,IdP    ,IdQ02  ,IdQ03,
              IdQ04 ,IdQ05  ,IdQ07  ,IdQ10  ,IdR    ,IdR02  ,IdR04,
              IdS02 ,IdS03  ,IdS04  ,IdS05  ,IdS07  ,IdS09  ,IdT,
              IdT02 ,IdT04  ,idNA   ,IdU    ,IdUA   ,IdW02  ,IdW04c,
              IdW04e,IdW04g ,IdW17  ,IdW23  ,IdX    ,IdX03  ,IdX04,
              IdX05 ,IdX11  ,IdX18  ,IdX22  ,IdX26  ,IdX33  ,IdY02,
              IdY07 ,IdYA   ,IdYA04a,IdZ10  ,IdZA   ,IdZB   ,IdZC   ,IdZC04,IdZC10,
              IdZ);


function StringToLayid(const s: String): TLayId;
function LayOutToServico(const t: TLayOut): String;
function ServicoToLayOut(out ok: Boolean; const s: String): TLayOut;

function LayOutToSchema(const t: TLayOut): TSchemaNFe;

function SchemaNFeToStr(const t: TSchemaNFe): String;
function StrToSchemaNFe(out ok: Boolean; const s: String): TSchemaNFe;

function tpNFToStr(const t: TpcnTipoNFe): String;
function StrToTpNF(out ok: Boolean; const s: String): TpcnTipoNFe;

function FinNFeToStr(const t: TpcnFinalidadeNFe): String;
function StrToFinNFe(out ok: Boolean; const s: String): TpcnFinalidadeNFe;

function IndicadorNFeToStr(const t: TpcnIndicadorNFe): String;
function StrToIndicadorNFe(out ok: Boolean; const s: String): TpcnIndicadorNFe;

function ModeloDFToStr(const t: TpcnModeloDF): String;
function StrToModeloDF(out ok: Boolean; const s: String): TpcnModeloDF;
function ModeloDFToPrefixo(const t: TpcnModeloDF): String;

function StrToVersaoDF(out ok: Boolean; const s: String): TpcnVersaoDF;
function VersaoDFToStr(const t: TpcnVersaoDF): String;

function DblToVersaoDF(out ok: Boolean; const d: Real): TpcnVersaoDF;
function VersaoDFToDbl(const t: TpcnVersaoDF): Real;

function tpOPToStr(const t: TpcnTipoOperacao): string;
function StrTotpOP(out ok: boolean; const s: string): TpcnTipoOperacao;

function condVeicToStr(const t: TpcnCondicaoVeiculo): string;
function StrTocondVeic(out ok: boolean; const s: string): TpcnCondicaoVeiculo;

function tpArmaToStr(const t: TpcnTipoArma): string;
function StrTotpArma(out ok: boolean; const s: string): TpcnTipoArma;

function tpIntegraToStr(const t: TtpIntegra): string;
function StrTotpIntegra(out ok: boolean; const s: string): TtpIntegra;

function VeiculosRestricaoStr( const iRestricao :Integer ): String;
function VeiculosCorDENATRANStr( const sCorDENATRAN : String ): String;
function VeiculosCondicaoStr( const condVeic: TpcnCondicaoVeiculo ): String;
function VeiculosVinStr( const sVin: String ): String;
function VeiculosEspecieStr( const iEspecie : Integer ): String;
function VeiculosTipoStr( const iTipoVeic : Integer ): String;
function VeiculosCombustivelStr( const sTpComb : String ): String;
function VeiculosTipoOperStr( const TtpOP : TpcnTipoOperacao ): String;

function ArmaTipoStr( const TtpArma : TpcnTipoArma ): String;

implementation

uses
  pcnConversao, typinfo;

function LayOutToServico(const t: TLayOut): String;
begin
  Result := EnumeradoToStr(t,
    ['NfeRecepcao', 'NfeRetRecepcao', 'NfeCancelamento', 'NfeInutilizacao',
     'NfeConsultaProtocolo', 'NfeStatusServico', 'NfeConsultaCadastro',
     'RecepcaoEvento', 'RecepcaoEvento', 'RecepcaoEvento', 'NfeConsultaDest',
     'NfeDownloadNF', 'NfeAutorizacao', 'NfeRetAutorizacao', 'AdministrarCSCNFCe',
     'NFeDistribuicaoDFe', 'EventoEPEC'],
    [ LayNfeRecepcao, LayNfeRetRecepcao, LayNfeCancelamento, LayNfeInutilizacao,
      LayNfeConsulta, LayNfeStatusServico, LayNfeCadastro,
      LayNFeCCe, LayNFeEvento, LayNFeEventoAN, LayNFeConsNFeDest,
      LayNFeDownloadNFe, LayNfeAutorizacao, LayNfeRetAutorizacao,
      LayAdministrarCSCNFCe, LayDistDFeInt, LayNFCeEPEC ] );
end;

function ServicoToLayOut(out ok: Boolean; const s: String): TLayOut;
begin
  Result := StrToEnumerado(ok, s,
  ['NfeRecepcao', 'NfeRetRecepcao', 'NfeCancelamento', 'NfeInutilizacao',
   'NfeConsultaProtocolo', 'NfeStatusServico', 'NfeConsultaCadastro',
   'RecepcaoEvento', 'RecepcaoEvento', 'RecepcaoEvento', 'NfeConsultaDest',
   'NfeDownloadNF', 'NfeAutorizacao', 'NfeRetAutorizacao', 'AdministrarCSCNFCe',
   'NFeDistribuicaoDFe', 'EventoEPEC'],
  [ LayNfeRecepcao, LayNfeRetRecepcao, LayNfeCancelamento, LayNfeInutilizacao,
    LayNfeConsulta, LayNfeStatusServico, LayNfeCadastro,
    LayNFeCCe, LayNFeEvento, LayNFeEventoAN, LayNFeConsNFeDest,
    LayNFeDownloadNFe, LayNfeAutorizacao, LayNfeRetAutorizacao,
    LayAdministrarCSCNFCe, LayDistDFeInt, LayNFCeEPEC ] );
end;

function LayOutToSchema(const t: TLayOut): TSchemaNFe;
begin
  case t of
    LayNfeRecepcao:       Result := schNfe;
    LayNfeRetRecepcao:    Result := schconsReciNFe;
    LayNfeCancelamento:   Result := schcancNFe;
    LayNfeInutilizacao:   Result := schInutNFe;
    LayNfeConsulta:       Result := schconsSitNFe;
    LayNfeStatusServico:  Result := schconsStatServ;
    LayNfeCadastro:       Result := schconsCad;
    LayNFeCCe,
    LayNFeEvento,
    LayNFeEventoAN:       Result := schenvEvento;
    LayNFeConsNFeDest:    Result := schconsNFeDest;
    LayNFeDownloadNFe:    Result := schdownloadNFe;
    LayNfeAutorizacao:    Result := schNfe;
    LayNfeRetAutorizacao: Result := schretEnviNFe;
    LayAdministrarCSCNFCe: Result := schadmCscNFCe;
    LayDistDFeInt:        Result := schdistDFeInt;
    LayNFCeEPEC:          Result := scheventoEPEC;
  else
    Result := schErro;
  end;
end;

function SchemaNFeToStr(const t: TSchemaNFe): String;
begin
  Result := GetEnumName(TypeInfo(TSchemaNFe), Integer( t ) );
  Result := copy(Result, 4, Length(Result)); // Remove prefixo "sch"
end;

function StrToSchemaNFe(out ok: Boolean; const s: String): TSchemaNFe;
var
  P: Integer;
  SchemaStr: String;
begin
  P := pos('_',s);
  if p > 0 then
    SchemaStr := copy(s,1,P-1)
  else
    SchemaStr := s;

  if LeftStr(SchemaStr,3) <> 'sch' then
    SchemaStr := 'sch'+SchemaStr;

  Result := TSchemaNFe( GetEnumValue(TypeInfo(TSchemaNFe), SchemaStr ) );
end;

// B11 - Tipo do Documento Fiscal **********************************************
function tpNFToStr(const t: TpcnTipoNFe): String;
begin
  Result := EnumeradoToStr(t, ['0', '1'], [tnEntrada, tnSaida]);
end;

function StrToTpNF(out ok: Boolean; const s: String): TpcnTipoNFe;
begin
  Result := StrToEnumerado(ok, s, ['0', '1'], [tnEntrada, tnSaida]);
end;

// B25 - Finalidade de emiss?o da NF-e *****************************************
function FinNFeToStr(const t: TpcnFinalidadeNFe): String;
begin
  Result := EnumeradoToStr(t, ['1', '2', '3', '4'],
    [fnNormal, fnComplementar, fnAjuste, fnDevolucao]);
end;

function StrToFinNFe(out ok: Boolean; const s: String): TpcnFinalidadeNFe;
begin
  Result := StrToEnumerado(ok, s, ['1', '2', '3', '4'],
    [fnNormal, fnComplementar, fnAjuste, fnDevolucao]);
end;

function IndicadorNFeToStr(const t: TpcnIndicadorNFe): String;
begin
  Result := EnumeradoToStr(t, ['0', '1', '2'],
    [inTodas, inSemManifestacaoComCiencia, inSemManifestacaoSemCiencia]);
end;

function StrToIndicadorNFe(out ok: Boolean; const s: String): TpcnIndicadorNFe;
begin
  Result := StrToEnumerado(ok, s, ['0', '1', '2'],
    [inTodas, inSemManifestacaoComCiencia, inSemManifestacaoSemCiencia]);
end;

function ModeloDFToStr(const t: TpcnModeloDF): String;
begin
  Result := EnumeradoToStr(t, ['55', '65'], [moNFe, moNFCe]);
end;

function StrToModeloDF(out ok: Boolean; const s: String): TpcnModeloDF;
begin
  Result := StrToEnumerado(ok, s, ['55', '65'], [moNFe, moNFCe]);
end;

function ModeloDFToPrefixo(const t: TpcnModeloDF): String;
begin
  Case t of
    moNFCe: Result := 'NFCe';
  else
    Result := 'NFe';
  end;
end;

function StrToVersaoDF(out ok: Boolean; const s: String): TpcnVersaoDF;
begin
  Result := StrToEnumerado(ok, s, ['2.00', '3.00', '3.10'], [ve200, ve300, ve310]);
end;

function VersaoDFToStr(const t: TpcnVersaoDF): String;
begin
  Result := EnumeradoToStr(t, ['2.00', '3.00', '3.10'], [ve200, ve300, ve310]);
end;

 function DblToVersaoDF(out ok: Boolean; const d: Real): TpcnVersaoDF;
 begin
   ok := True;

   if (d = 2.0) or (d < 3.0)  then
     Result := ve200
   else if (d >= 3.0) and (d < 3.1) then
     Result := ve300
   else if (d >= 3.10) then
     Result := ve310
   else
   begin
     Result := ve310;
     ok := False;
   end;
 end;

 function VersaoDFToDbl(const t: TpcnVersaoDF): Real;
 begin
   case t of
     ve200: Result := 2.00;
     ve300: Result := 3.00;
     ve310: Result := 3.10;
   else
     Result := 0;
   end;
 end;

// J02 - Tipo da opera??o ******************************************************
 function tpOPToStr(const t: TpcnTipoOperacao): string;
begin
  result := EnumeradoToStr(t, ['1', '2', '3', '0'], [toVendaConcessionaria, toFaturamentoDireto, toVendaDireta, toOutros]);
end;

function StrTotpOP(out ok: boolean; const s: string): TpcnTipoOperacao;
begin
  result := StrToEnumerado(ok, s, ['1', '2', '3', '0'], [toVendaConcessionaria, toFaturamentoDireto, toVendaDireta, toOutros]);
end;

// J22 - Condi??o do Ve?culo ***************************************************
function condVeicToStr(const t: TpcnCondicaoVeiculo): string;
begin
  result := EnumeradoToStr(t, ['1', '2', '3'], [cvAcabado, cvInacabado, cvSemiAcabado]);
end;

function StrTocondVeic(out ok: boolean; const s: string): TpcnCondicaoVeiculo;
begin
  result := StrToEnumerado(ok, s, ['1', '2', '3'], [cvAcabado, cvInacabado, cvSemiAcabado]);
end;

// L02 - Indicador do tipo de arma de fogo *************************************
function tpArmaToStr(const t: TpcnTipoArma): string;
begin
  result := EnumeradoToStr(t, ['0', '1'], [taUsoPermitido, taUsoRestrito]);
end;

function StrTotpArma(out ok: boolean; const s: string): TpcnTipoArma;
begin
  result := StrToEnumerado(ok, s, ['0', '1'], [taUsoPermitido, taUsoRestrito]);
end;

function tpIntegraToStr(const t: TtpIntegra): string;
begin
  result := EnumeradoToStr(t, ['', '1', '2'], [tiNaoInformado, tiPagIntegrado, tiPagNaoIntegrado]);
end;

function StrTotpIntegra(out ok: boolean; const s: string): TtpIntegra;
begin
  result := StrToEnumerado(ok, s, ['', '1', '2'], [tiNaoInformado, tiPagIntegrado, tiPagNaoIntegrado]);
end;

function VeiculosRestricaoStr( const iRestricao : Integer ): String;
begin
  case iRestricao of
    0: result := '0-N?O H?';
    1: result := '1-ALIENA??O FIDUCI?RIA';
    2: result := '2-RESERVA DE DOMIC?LIO';
    3: result := '3-RESERVA DE DOM?NIO';
    4: result := '4-PENHOR DE VE?CULOS';
    9: result := '9-OUTRAS'
    else
      result := IntToStr(iRestricao)+ 'N?O DEFINIDO' ;
  end;
end;


function VeiculosCorDENATRANStr( const sCorDENATRAN : String ): String;
begin
  case StrToIntDef( sCorDENATRAN, 0 ) of
     1: result := '01-AMARELO';
     2: result := '02-AZUL';
     3: result := '03-BEGE';
     4: result := '04-BRANCA';
     5: result := '05-CINZA';
     6: result := '06-DOURADA';
     7: result := '07-GREN?';
     8: result := '08-LARANJA';
     9: result := '09-MARROM';
    10: result := '10-PRATA';
    11: result := '11-PRETA';
    12: result := '12-ROSA';
    13: result := '13-ROXA';
    14: result := '14-VERDE';
    15: result := '15-VERMELHA';
    16: result := '16-FANTASIA'
    else
      result := sCorDENATRAN + 'N?O DEFINIDA' ;
  end;
end;

function VeiculosCondicaoStr( const condVeic: TpcnCondicaoVeiculo ): String;
begin
  case condVeic of
    cvAcabado     : result := '1-ACABADO';
    cvInacabado   : result := '2-INACABADO';
    cvSemiAcabado : result := '3-SEMI-ACABADO';
  end;
end;


function VeiculosVinStr( const sVin: String ): String;
begin
  // Enumerar Vim no futuro ?
  if sVIN = 'R' then
      result := 'R-REMARCADO'
  else
    if sVIN = 'N' then
      result:= 'N-NORMAL'
    else
      result := 'N?O DEFINIDA' ;
end;

function VeiculosEspecieStr( const iEspecie : Integer ): String;
begin
  case iEspecie of
    1: result := '01-PASSAGEIRO';
    2: result := '02-CARGA';
    3: result := '03-MISTO';
    4: result := '04-CORRIDA';
    5: result := '05-TRA??O';
    6: result := '06-ESPECIAL';
    7: result := '07-COLE??O'
    else
      result := IntToStr(iEspecie ) + 'N?O DEFINIDA' ;
    end;
end;

function VeiculosTipoStr( const iTipoVeic : Integer ): String;
begin
  case iTipoVeic of
     1: result := '01-BICICLETA';
     2: result := '02-CICLOMOTOR';
     3: result := '03-MOTONETA';
     4: result := '04-MOTOCICLETA';
     5: result := '05-TRICICLO';
     6: result := '06-AUTOM?VEL';
     7: result := '07-MICROONIBUS';
     8: result := '08-ONIBUS';
     9: result := '09-BONDE';
    10: result := '10-REBOQUE';
    11: result := '11-SEMI-REBOQUE';
    12: result := '12-CHARRETE';
    13: result := '13-CAMIONETA';
    14: result := '14-CAMINH?O';
    15: result := '15-CARRO?A';
    16: result := '16-CARRO DE M?O';
    17: result := '17-CAMINH?O TRATOR';
    18: result := '18-TRATOR DE RODAS';
    19: result := '19-TRATOR DE ESTEIRAS';
    20: result := '20-TRATOR MISTO';
    21: result := '21-QUADRICICLO';
    22: result := '22-CHASSI/PLATAFORMA';
    23: result := '23-CAMINHONETE';
    24: result := '24-SIDE-CAR';
    25: result := '25-UTILIT?RIO';
    26: result := '26-MOTOR-CASA'
    else
      result := IntToStr(iTipoVeic)+'N?O DEFINIDO' ;
    end;
end;

function VeiculosCombustivelStr( const sTpComb : String ): String;
begin
  case StrToIntDef( stpComb, 0) of
     1: result := '01-?LCOOL';
     2: result := '02-GASOLINA';
     3: result := '03-DIESEL';
     4: result := '04-GASOG?NIO';
     5: result := '05-G?S METANO';
     6: result := '06-ELETRICO/F INTERNA';
     7: result := '07-ELETRICO/F EXTERNA';
     8: result := '08-GASOLINA/GNC';
     9: result := '09-?LCOOL/GNC';
    10: result := '10-DIESEL / GNC';
    11: result := '11-VIDE CAMPO OBSERVA??O';
    12: result := '12-?LCOOL/GNV';
    13: result := '13-GASOLINA/GNV';
    14: result := '14-DIESEL/GNV';
    15: result := '15-G?S NATURAL VEICULAR';
    16: result := '16-?LCOOL/GASOLINA';
    17: result := '17-GASOLINA/?LCOOL/GNV';
    18: result := '18-GASOLINA/EL?TRICO'
    else
      result := stpComb +'N?O DEFINIDO' ;
    end;
end;

function VeiculosTipoOperStr( const TtpOP : TpcnTipoOperacao ): String;
begin
  case TtpOP of
    toVendaConcessionaria : result := '1-VENDA CONCESSION?RIA';
    toFaturamentoDireto   : result := '2-FAT. DIRETO CONS. FINAL';
    toVendaDireta         : result := '3-VENDA DIRETA';
    toOutros              : result := '0-OUTROS';
  end;

end;
function ArmaTipoStr( const TtpArma : TpcnTipoArma ): String;
begin
  case TtpArma of
    taUsoPermitido: result := '0-USO PERMITIDO';
    taUsoRestrito : result := '1-USO RESTRITO';
  end;
end;


function StringToLayid(const s: String): TLayId;
begin

  Result := TLayId( AnsiIndexStr( s , [ 'B'   ,'BA'   ,'BA02' ,'BA03' ,'BA10' ,'BA13' ,'BA14',
                                        'BA19','BA20' ,'C'    ,'C02'  ,'C02A' ,'C05'  ,'D',
                                        'E'   ,'E02'  ,'E03'  ,'E03A' ,'E05'  ,'F'    ,'F02',
                                        'F02A','G'    ,'G02'  ,'G02A' ,'GA02' ,'GA03' ,'H',
                                        'I'   ,'I05A' ,'I05C' ,'I18'  ,'I25'  ,'I50'  ,'I52',
                                        'J'   ,'K'    ,'L'    ,'LA'   ,'LA07' ,'LB'   ,'L109',
                                        'L114','L117' ,'M'    ,'N02'  ,'N03'  ,'N04'  ,'N05',
                                        'N06' ,'N07'  ,'N08'  ,'N09'  ,'N10'  ,'N10A' ,'N10B',
                                        'N10C','N10D' ,'N10E' ,'N10F' ,'N10G' ,'N10H' ,'O',
                                        'O07' ,'O08'  ,'O10'  ,'O11'  ,'P'    ,'Q02'  ,'Q03',
                                        'Q04' ,'Q05'  ,'Q07'  ,'Q10'  ,'R'    ,'R02'  ,'R04',
                                        'S02' ,'S03'  ,'S04'  ,'S05'  ,'S07'  ,'S09'  ,'T',
                                        'T02' ,'T04'  ,'NA'   ,'U'    ,'UA'   ,'W02'  ,'W04C',
                                        'W04e','W04g' ,'W17'  ,'W23'  ,'X'    ,'X03'  ,'X04',
                                        'X05' ,'X11'  ,'X18'  ,'X22'  ,'X26'  ,'X33'  ,'Y02',
                                        'Y07' ,'YA'   ,'YA04A','Z10'  ,'ZA'   ,'ZB'   ,'ZC'   ,'ZC04',
                                        'ZC10','Z']));
end;

end.

