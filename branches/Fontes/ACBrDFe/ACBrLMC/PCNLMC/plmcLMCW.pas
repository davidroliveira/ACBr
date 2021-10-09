{******************************************************************************}
{ Projeto: Componente ACBrLMC                                                  }
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

unit plmcLMCW;

interface

uses
  SysUtils, Classes,
  pcnAuxiliar, pcnConversao, pcnGerador,
  plmcConversao, plmcLMC, ACBrUtil;

type

  TGeradorOpcoes = class;

  TLMCW = class(TPersistent)
  private
    FGerador: TGerador;
    FLMC: TLMC;
    FOpcoes: TGeradorOpcoes;
    FVersaoDF: TVersaoLMC;
    procedure GerarInfLMC;       // Nivel 0
    procedure GerarEmit;         // Nivel 1
    procedure GerarMovimento;    // Nivel 1
    procedure GerarInfMovimento; // Nivel 2
    procedure GerarVolRecebido(i: Integer);  // Nivel 3
    procedure GerarVolVendido(i: Integer);   // Nivel 3

    procedure AjustarMunicipioUF(var xUF: String; var xMun: String; var cMun: Integer; cPais: Integer; vxUF, vxMun: String; vcMun: Integer);
    function ObterNomeMunicipio(const xMun, xUF: String; const cMun: Integer): String;
  public
    constructor Create(AOwner: TLMC);
    destructor Destroy; override;
    function GerarXml: boolean;
    function ObterNomeArquivo: String;
  published
    property Gerador: TGerador      read FGerador  write FGerador;
    property LMC: TLMC              read FLMC      write FLMC;
    property Opcoes: TGeradorOpcoes read FOpcoes   write FOpcoes;
    property VersaoDF: TVersaoLMC   read FVersaoDF write FVersaoDF;
  end;

  TGeradorOpcoes = class(TPersistent)
  private
    FAjustarTagNro: boolean;
    FNormatizarMunicipios: boolean;
    FGerarTagAssinatura: TpcnTagAssinatura;
    FPathArquivoMunicipios: String;
    FValidarInscricoes: boolean;
    FValidarListaServicos: boolean;
  published
    property AjustarTagNro: boolean                read FAjustarTagNro         write FAjustarTagNro;
    property NormatizarMunicipios: boolean         read FNormatizarMunicipios  write FNormatizarMunicipios;
    property GerarTagAssinatura: TpcnTagAssinatura read FGerarTagAssinatura    write FGerarTagAssinatura;
    property PathArquivoMunicipios: String         read FPathArquivoMunicipios write FPathArquivoMunicipios;
    property ValidarInscricoes: boolean            read FValidarInscricoes     write FValidarInscricoes;
    property ValidarListaServicos: boolean         read FValidarListaServicos  write FValidarListaServicos;
  end;

const
  DSC_CNUMERICO = 'Código Numérico';
  DSC_VOLESTOQUEABERTURA = 'Volume do estoque de abertura';
  DSC_VOLESTOQUEFECHAMENTO = 'Volume do estoque de fechamento';
  DSC_VALVENDADIABOMBA = 'Valor total de vendas do combustível no dia';
  DSC_VALACUMULADOMES = 'Valor acumulado das vendas do combustível no mês';
  DSC_OBSERVACOES = 'Observaçoes';
  DSC_DNF = 'Data de emissão do Documento Fiscal';
  DSC_VOLVOLUME = 'Volume Recebido';
  DSC_XTANQUE = 'Tanque';
  DSC_NRBICO = 'Número do Bico';
  DSC_VOLFECHAMENTO = 'Volume de fechamento do dia';
  DSC_VOLABERTURA = 'Volume de abertura do dia';
  DSC_VOLAFERICOES = 'Aferições realizadas no dia';

implementation

{ TLMCW }

constructor TLMCW.Create(AOwner: TLMC);
begin
  FLMC := AOwner;

  FGerador                  := TGerador.Create;
  FGerador.FIgnorarTagNivel := '|?xml version|livroCombustivel xmlns|infLivroCombustivel versao|';

  FOpcoes                       := TGeradorOpcoes.Create;
  FOpcoes.FAjustarTagNro        := True;
  FOpcoes.FNormatizarMunicipios := False;
  FOpcoes.FGerarTagAssinatura   := taSomenteSeAssinada;
  FOpcoes.FValidarInscricoes    := False;
  FOpcoes.FValidarListaServicos := False;
end;

destructor TLMCW.Destroy;
begin
  FGerador.Free;
  FOpcoes.Free;
  inherited Destroy;
end;

function TLMCW.ObterNomeArquivo: String;
begin
  Result := OnlyNumber(LMC.infLMC.Id) + '-LMC.xml';
end;

function TLMCW.GerarXml: boolean;
var
  chave: AnsiString;
  Gerar: boolean;
  xProtLMC: String;
begin
  chave := '';

  if not GerarChaveLMC(Chave, LMC.infLMC.movimento.dEmissao,
                       LMC.infLMC.emit.CNPJ,
                       LMC.infLMC.cNumerico) then
    Gerador.wAlerta('#001', 'infLivroCombustivel', DSC_CHAVE, ERR_MSG_GERAR_CHAVE);

  chave := 'LMC' + chave;

  LMC.infLMC.Id  := chave;
  LMC.infLMC.cDV := RetornarDigito(LMC.infLMC.Id);

  // Carrega Layout que sera utilizado para gera o txt
  Gerador.LayoutArquivoTXT.Clear;
  Gerador.ArquivoFormatoXML := '';
  Gerador.ArquivoFormatoTXT := '';

  Gerador.wGrupo(ENCODING_UTF8, '', False);

  if LMC.procLMC.nProt <> ''
   then Gerador.wGrupo('LMCProc ' + LMC.infLMC.VersaoStr + ' ' + NAME_SPACE_LMC, '');

  Gerador.wGrupo('livroCombustivel ' + NAME_SPACE_LMC);
  Gerador.wGrupo('infLivroCombustivel ' + LMC.infLMC.VersaoStr + ' Id="' + LMC.infLMC.Id + '"');
  GerarInfLMC;
  Gerador.wGrupo('/infLivroCombustivel');

  if FOpcoes.GerarTagAssinatura <> taNunca then
  begin
    Gerar := true;
    if FOpcoes.GerarTagAssinatura = taSomenteSeAssinada then
      Gerar := ((LMC.signature.DigestValue <> '') and (LMC.signature.SignatureValue <> '') and (LMC.signature.X509Certificate <> ''));
    if FOpcoes.GerarTagAssinatura = taSomenteParaNaoAssinada then
      Gerar := ((LMC.signature.DigestValue = '') and (LMC.signature.SignatureValue = '') and (LMC.signature.X509Certificate = ''));
    if Gerar then
    begin
      FLMC.signature.URI := OnlyNumber(LMC.infLMC.ID);
      FLMC.signature.Gerador.Opcoes.IdentarXML := Gerador.Opcoes.IdentarXML;
      FLMC.signature.GerarXML;
      Gerador.ArquivoFormatoXML := Gerador.ArquivoFormatoXML + FLMC.signature.Gerador.ArquivoFormatoXML;
    end;
  end;
  Gerador.wGrupo('/livroCombustivel');

  if LMC.procLMC.nProt <> '' then
   begin
     xProtLMC :=
           '<protLivroCombustivel ' + LMC.infLMC.VersaoStr + '>' +
             '<infProt>'+
               '<tpAmb>'+TpAmbToStr(LMC.procLMC.tpAmb)+'</tpAmb>'+
               '<verAplic>'+LMC.procLMC.verAplic+'</verAplic>'+
               '<chLMC>'+LMC.procLMC.chLMC+'</chLMC>'+
               '<dhRecbto>'+FormatDateTime('yyyy-mm-dd"T"hh:nn:ss',LMC.procLMC.dhRecbto)+'</dhRecbto>'+
               '<nProt>'+LMC.procLMC.nProt+'</nProt>'+
               '<digVal>'+LMC.procLMC.digVal+'</digVal>'+
               '<cStat>'+IntToStr(LMC.procLMC.cStat)+'</cStat>'+
               '<xMotivo>'+LMC.procLMC.xMotivo+'</xMotivo>'+
             '</infProt>'+
           '</protLivroCombustivel>';

     Gerador.wTexto(xProtLMC);
     Gerador.wGrupo('/LMCProc');
   end;

  Gerador.gtAjustarRegistros(LMC.infLMC.Id);

  Result := (Gerador.ListaDeAlertas.Count = 0);
end;

procedure TLMCW.GerarInfLMC;
begin
  Gerador.wCampo(tcStr, 'AP106', 'tpAmb    ', 01, 01, 1, tpAmbToStr(LMC.infLMC.tpAmb), DSC_TPAMB);
  Gerador.wCampo(tcStr, 'AP107', 'cNumerico', 05, 05, 1, IntToStrZero(LMC.infLMC.cNumerico, 5), DSC_CNUMERICO);
  Gerador.wCampo(tcInt, 'AP108', 'cDV      ', 01, 01, 1, LMC.infLMC.cDV, DSC_CDV);

  GerarEmit;
  GerarMovimento;
end;

procedure TLMCW.GerarEmit;
begin
  Gerador.wGrupo('emit', 'AP109');
  Gerador.wCampo(tcStr, 'AP110', 'IE   ', 02, 14, 1, OnlyNumber(LMC.infLMC.emit.IE), DSC_IE);
  if (FOpcoes.ValidarInscricoes)
   then if not ValidarIE(LMC.infLMC.Emit.IE, 'PR') then
         Gerador.wAlerta('AP110', 'IE', DSC_IE, ERR_MSG_INVALIDO);
  Gerador.wCampoCNPJ('AP111', LMC.infLMC.Emit.CNPJ, CODIGO_BRASIL, True);
  Gerador.wCampo(tcStr, 'AP112', 'xNome', 02, 60, 1, LMC.infLMC.Emit.xNome, DSC_XNOME);
  Gerador.wGrupo('/emit');
end;

procedure TLMCW.GerarMovimento;
begin
  Gerador.wGrupo('movimento dEmissao="'+ FormatDateTime('YYYY-MM-DD', LMC.infLMC.movimento.dEmissao) + '"', 'AP113');

  GerarInfMovimento;
  Gerador.wGrupo('/movimento');
end;

procedure TLMCW.GerarInfMovimento;
var
  i: Integer;
begin
  for i := 0 to LMC.infLMC.movimento.infMovimento.Count - 1 do
  begin
    Gerador.wGrupo('infMovimento nrProduto="' + idProdutoToStr(LMC.infLMC.movimento.infMovimento[i].nrProduto) + '"', 'AP115');
    Gerador.wCampo(tcDe3, 'AP117', 'volEstoqueAbertura', 1, 11, 1, LMC.infLMC.movimento.infMovimento[i].volEstoqueAbertura, DSC_VOLESTOQUEABERTURA);

    GerarVolRecebido(i);
    GerarVolVendido(i);

    Gerador.wCampo(tcDe3, 'AP130', 'volEstoqueFechamento', 1, 11, 1, LMC.infLMC.movimento.infMovimento[i].volEstoqueFechamento, DSC_VOLESTOQUEFECHAMENTO);
    Gerador.wCampo(tcDe2, 'AP131', 'valVendasDiaBomba', 1, 15, 1, LMC.infLMC.movimento.infMovimento[i].valVendasDiaBomba, DSC_VALVENDADIABOMBA);
    Gerador.wCampo(tcDe2, 'AP132', 'valAcumuladoMes', 1, 15, 1, LMC.infLMC.movimento.infMovimento[i].valAcumuladoMes, DSC_VALACUMULADOMES);
    Gerador.wCampo(tcStr, 'AP133', 'observacoes', 1, 500, 0, LMC.infLMC.movimento.infMovimento[i].observacoes, DSC_OBSERVACOES);
    Gerador.wGrupo('/infMovimento');
  end;
  if LMC.infLMC.movimento.infMovimento.Count > 999 then
   Gerador.wAlerta('AP115', 'infMovimento', '', ERR_MSG_MAIOR_MAXIMO + '999');
end;

procedure TLMCW.GerarVolRecebido(i: Integer);
var
  j: Integer;
begin
  for j := 0 to LMC.infLMC.movimento.infMovimento[i].volumeRecebido.Count - 1 do
  begin
    Gerador.wGrupo('volumeRecebido', 'AP118');
    Gerador.wCampoCNPJ('AP119', LMC.infLMC.movimento.infMovimento[i].volumeRecebido[j].CNPJ, CODIGO_BRASIL, True);
    Gerador.wCampo(tcInt, 'AP120', 'nNF', 01, 08, 1, LMC.infLMC.movimento.infMovimento[i].volumeRecebido[j].nNF, DSC_NNF);
    Gerador.wCampo(tcDat, 'AP121', 'dNF', 10, 10, 1, LMC.infLMC.movimento.infMovimento[i].volumeRecebido[j].dNF, DSC_DNF);
    Gerador.wCampo(tcDe3, 'AP122', 'volVolume', 01, 11, 1, LMC.infLMC.movimento.infMovimento[i].volumeRecebido[j].volVolume, DSC_VOLVOLUME);
    Gerador.wCampo(tcStr, 'AP123', 'xTanque', 01, 05, 1, LMC.infLMC.movimento.infMovimento[i].volumeRecebido[j].xTanque, DSC_XTANQUE);
    Gerador.wGrupo('/volumeRecebido');
  end;
  if LMC.infLMC.movimento.infMovimento[i].volumeRecebido.Count > 999 then
   Gerador.wAlerta('AP118', 'volumeRecebido', '', ERR_MSG_MAIOR_MAXIMO + '999');
end;

procedure TLMCW.GerarVolVendido(i: Integer);
var
  j: Integer;
begin
  for j := 0 to LMC.infLMC.movimento.infMovimento[i].volumeVendido.Count - 1 do
  begin
    Gerador.wGrupo('volumeVendido', 'AP124');
    Gerador.wCampo(tcStr, 'AP125', 'xTanque', 01, 05, 1, LMC.infLMC.movimento.infMovimento[i].volumeVendido[j].xTanque, DSC_XTANQUE);
    Gerador.wCampo(tcInt, 'AP126', 'nrBico', 01, 03, 1, LMC.infLMC.movimento.infMovimento[i].volumeVendido[j].nrBico, DSC_NRBICO);
    Gerador.wCampo(tcDe3, 'AP127', 'volFechamento', 01, 11, 1, LMC.infLMC.movimento.infMovimento[i].volumeVendido[j].volFechamento, DSC_VOLFECHAMENTO);
    Gerador.wCampo(tcDe3, 'AP128', 'volAbertura', 01, 11, 1, LMC.infLMC.movimento.infMovimento[i].volumeVendido[j].volAbertura, DSC_VOLABERTURA);
    Gerador.wCampo(tcDe3, 'AP129', 'volAfericoes', 01, 11, 1, LMC.infLMC.movimento.infMovimento[i].volumeVendido[j].volAfericoes, DSC_VOLAFERICOES);
    Gerador.wGrupo('/volumeVendido');
  end;
  if LMC.infLMC.movimento.infMovimento[i].volumeVendido.Count > 999 then
   Gerador.wAlerta('AP124', 'volumeVendido', '', ERR_MSG_MAIOR_MAXIMO + '999');
end;

procedure TLMCW.AjustarMunicipioUF(var xUF, xMun: String;
  var cMun: Integer; cPais: Integer; vxUF, vxMun: String; vcMun: Integer);
var
  PaisBrasil: boolean;
begin
  PaisBrasil := cPais = CODIGO_BRASIL;

//  cMun := IIf(PaisBrasil, vcMun, CMUN_EXTERIOR);
//  xMun := IIf(PaisBrasil, vxMun, XMUN_EXTERIOR);
//  xUF  := IIf(PaisBrasil, vxUF, UF_EXTERIOR);
  
  xMun := ObterNomeMunicipio(xMun, xUF, cMun);
end;

function TLMCW.ObterNomeMunicipio(const xMun, xUF: String;
  const cMun: Integer): String;
var
  i: Integer;
  PathArquivo, Codigo: String;
  List: TStringList;
begin
  result := '';
  (*
  if (FOpcoes.NormatizarMunicipios) and (cMun <> CMUN_EXTERIOR) then
  begin
    PathArquivo := FOpcoes.FPathArquivoMunicipios + 'MunIBGE-UF' + InttoStr(UFparaCodigo(xUF)) + '.txt';
    if FileExists(PathArquivo) then
    begin
      List := TStringList.Create;
      try
        List.LoadFromFile(PathArquivo);
        Codigo := IntToStr(cMun);
        i := 0;
        while (i < list.count) and (result = '') do
        begin
          if pos(Codigo, List[i]) > 0 then
            result := Trim(StringReplace(list[i], codigo, '', []));
          inc(i);
        end;
      finally
        List.free;
      end;
    end;
  end;
*)  
  if result = '' then
    result := xMun;
end;

end.

