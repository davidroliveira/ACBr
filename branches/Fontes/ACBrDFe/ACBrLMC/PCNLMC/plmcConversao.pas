{******************************************************************************}
{ Projeto: Componente ACBrLMC                                                 }
{  Biblioteca multiplataforma de componentes Delphi                            }
{                                                                              }
{  Você pode obter a última versão desse arquivo na pagina do Projeto ACBr     }
{ Componentes localizado em http://www.sourceforge.net/projects/acbr           }
{                                                                              }
{                                                                              }
{  Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }
{                                                                              }
{  Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU      }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto}
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,  }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Você também pode obter uma copia da licença em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Simões de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Praça Anita Costa, 34 - Tatuí - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{*******************************************************************************
|* Historico
|*
|* 20/07/2015: Italo Jurisato Junior
|*  - Doação do componente para o Projeto ACBr
*******************************************************************************}

{$I ACBr.inc}

unit plmcConversao;

interface

uses
  SysUtils, StrUtils, Classes;

type
  TVersaoLMC     = (ve100);

  TLayOutLMC     = (LayLMCAutorizacao, LayLMCRetAutorizacao, LayLMCConsulta,
                    LayLMCStatusServico);

  TSchemaLMC     = (schErro, schlivroCombustivel, schautorizacaoRetorno, schstatusServico);

  TStatusACBrLMC = (stLMCIdle, stLMCAutorizacao, stLMCRetAutorizacao, stLMCEmail,
                    stLMCConsulta, stLMCStatusServico, stLMCEnvioWebService);

  TidProduto     = (idEtanolAditivado, idEtanolComum, idGasolinaAditivada,
                    idGasolinaComum, idGasolinaPremium, idDieselA,
                    idDieselB, idDieselBAditivado, idDieselBS10,
                    idDieselBS10Aditicado, idQuerosene);

const

  NAME_SPACE_LMC  = 'xmlns="http://www.fazenda.pr.gov.br/sefaws"';


function StrToEnumerado(var ok: boolean; const s: string; const AString: array of string;
  const AEnumerados: array of variant): variant;
function EnumeradoToStr(const t: variant; const AString:
  array of string; const AEnumerados: array of variant): variant;

function LayOutToSchema(const t: TLayOutLMC): TSchemaLMC;

function LayOutToServico(const t: TLayOutLMC): String;
function ServicoToLayOut(out ok: Boolean; const s: String): TLayOutLMC;

function SchemaLMCToStr(const t: TSchemaLMC): String;
function StrToSchemaLMC(out ok: Boolean; const s: String): TSchemaLMC;

function StrToVersaoLMC(out ok: Boolean; const s: String): TVersaoLMC;
function VersaoLMCToStr(const t: TVersaoLMC): String;

function DblToVersaoLMC(out ok: Boolean; const d: Double): TVersaoLMC;
function VersaoLMCToDbl(const t: TVersaoLMC): Double;

function idProdutoToStr(const t: TidProduto): String;
function StrToidProduto(var ok: Boolean; const s: String): TidProduto;

function GerarDigitoLMC(out Digito: integer; chave: string): boolean;
function GerarChaveLMC(out chave: AnsiString; const emissao: TDateTime;
                       const CNPJ: String; codigoNumerico: integer): boolean;

implementation

uses
  pcnConversao, typinfo, pcnAuxiliar;

function StrToEnumerado(var ok: boolean; const s: string; const AString:
  array of string; const AEnumerados: array of variant): variant;
var
  i: integer;
begin
  result := -1;
  for i := Low(AString) to High(AString) do
    if AnsiSameText(s, AString[i]) then
      result := AEnumerados[i];
  ok := result <> -1;
  if not ok then
    result := AEnumerados[0];
end;

function EnumeradoToStr(const t: variant; const AString:
  array of string; const AEnumerados: array of variant): variant;
var
  i: integer;
begin
  result := '';
  for i := Low(AEnumerados) to High(AEnumerados) do
    if t = AEnumerados[i] then
      result := AString[i];
end;

function LayOutToSchema(const t: TLayOutLMC): TSchemaLMC;
begin
  case t of
    LayLMCAutorizacao:    Result := schlivroCombustivel;
    LayLMCRetAutorizacao: Result := schautorizacaoRetorno;
    LayLMCConsulta:       Result := schErro;
    LayLMCStatusServico:  Result := schstatusServico;
  else
    Result := schErro;
  end;
end;

function LayOutToServico(const t: TLayOutLMC): String;
begin
  Result := EnumeradoToStr(t,
    ['LMCAutorizacao', 'LMCRetAutorizacao', 'LMCConsulta', 'LMCStatusServico'],
    [LayLMCAutorizacao, LayLMCRetAutorizacao, LayLMCConsulta, LayLMCStatusServico] );
end;

function ServicoToLayOut(out ok: Boolean; const s: String): TLayOutLMC;
begin
  Result := StrToEnumerado(ok, s,
  ['LMCAutorizacao', 'LMCRetAutorizacao', 'LMCConsulta', 'LMCStatusServico'],
  [LayLMCAutorizacao, LayLMCRetAutorizacao, LayLMCConsulta, LayLMCStatusServico] );
end;

function SchemaLMCToStr(const t: TSchemaLMC): String;
begin
  Result := GetEnumName(TypeInfo(TSchemaLMC), Integer( t ) );
  Result := copy(Result, 4, Length(Result)); // Remove prefixo "sch"
end;

function StrToSchemaLMC(out ok: Boolean; const s: String): TSchemaLMC;
var
  P: Integer;
  SchemaStr: String;
begin
  P := pos('_', s);
  if P > 0 then
    SchemaStr := copy(s, 1, P-1)
  else
    SchemaStr := s;

  if LeftStr(SchemaStr, 3) <> 'sch' then
    SchemaStr := 'sch' + SchemaStr;

  Result := TSchemaLMC( GetEnumValue(TypeInfo(TSchemaLMC), SchemaStr ) );
end;

function StrToVersaoLMC(out ok: Boolean; const s: String): TVersaoLMC;
begin
  Result := StrToEnumerado(ok, s, ['1.00'], [ve100]);
end;

function VersaoLMCToStr(const t: TVersaoLMC): String;
begin
  Result := EnumeradoToStr(t, ['1.00'], [ve100]);
end;

function DblToVersaoLMC(out ok: Boolean; const d: Double): TVersaoLMC;
begin
  ok := True;

  if d = 1.0 then
    Result := ve100
  else
  begin
    Result := ve100;
    ok := False;
  end;
end;

function VersaoLMCToDbl(const t: TVersaoLMC): Double;
begin
  case t of
    ve100: Result := 1.0;
  else
    Result := 0;
  end;
end;

function idProdutoToStr(const t: TidProduto): String;
begin
  result := EnumeradoToStr(t,
                           ['1', '2', '3', '4', '5', '6', '7', '8', '9',
                            '10', '11'],
                           [idEtanolAditivado, idEtanolComum, idGasolinaAditivada,
                            idGasolinaComum, idGasolinaPremium, idDieselA,
                            idDieselB, idDieselBAditivado, idDieselBS10,
                            idDieselBS10Aditicado, idQuerosene]);
end;

function StrToidProduto(var ok: Boolean; const s: String): TidProduto;
begin
  result := StrToEnumerado(ok, s,
                           ['1', '2', '3', '4', '5', '6', '7', '8', '9',
                            '10', '11'],
                           [idEtanolAditivado, idEtanolComum, idGasolinaAditivada,
                            idGasolinaComum, idGasolinaPremium, idDieselA,
                            idDieselB, idDieselBAditivado, idDieselBS10,
                            idDieselBS10Aditicado, idQuerosene]);
end;

function GerarDigitoLMC(out Digito: integer; chave: string): boolean;
var
  i, j: integer;
const
  PESO = '4329876543298765432987654329876543298765432';
begin
  // Manual Integracao Contribuinte v2.02a - Página: 70 //
  chave := somenteNumeros(chave);
  j := 0;
  Digito := 0;
  result := True;
  try
    for i := 1 to 25 do
      j := j + StrToInt(copy(chave, i, 1)) * StrToInt(copy(PESO, i, 1));
    Digito := 11 - (j mod 11);
    if (j mod 11) < 2 then
      Digito := 0;
  except
    result := False;
  end;
  if length(chave) <> 43 then
    result := False;
end;

function GerarChaveLMC(out chave: AnsiString; const emissao: TDateTime;
                       const CNPJ: String; codigoNumerico: integer): boolean;
var
  digito: integer;
  wAno, wMes, wDia: Word;
begin
  result := true;
  try
    DecodeDate(emissao, wAno, wMes, wDia);
//    chave := Copy(FormatFloat('0000', wAno), 3, 2) +
    chave := FormatFloat('0000', wAno) +
             FormatFloat('00', wMes) +
             FormatFloat('00', wDia) +
             copy(SomenteNumeros(CNPJ) + '00000000000000', 1, 14) +
             IntToStrZero(codigoNumerico, 5);
    GerarDigitoLMC(digito, chave);
    chave := chave + IntToStr(digito);
  except
    chave := '';
    result := false;
    exit;
  end;
end;

end.

