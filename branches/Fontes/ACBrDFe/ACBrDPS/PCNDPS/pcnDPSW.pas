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

unit pcnDPSW;

interface

uses
  SysUtils, Classes,
  pcnGerador, pcnConversao, pcnDPS, pcnDPSConsts;

type

  { TGeradorOpcoes }

  TGeradorOpcoes = class(TPersistent)
  private
    FAjustarTagNro: Boolean;
    FGerarTXTSimultaneamente: Boolean;
    FGerarTagAssinatura: TpcnTagAssinatura;
    FValidarInscricoes: Boolean;
    FValidarListaServicos: Boolean;
  published
    property AjustarTagNro: Boolean read FAjustarTagNro;
    property GerarTXTSimultaneamente: Boolean read FGerarTXTSimultaneamente write FGerarTXTSimultaneamente;
    property GerarTagAssinatura: TpcnTagAssinatura read FGerarTagAssinatura write FGerarTagAssinatura;
    property ValidarInscricoes: Boolean read FValidarInscricoes write FValidarInscricoes;
    property ValidarListaServicos: Boolean read FValidarListaServicos write FValidarListaServicos;
  end;

  { TDPSW }

  TDPSW = class(TPersistent)
  private
    FGerador: TGerador;
    FDPS: TDPS;
    FOpcoes: TGeradorOpcoes;

    Versao: String;

    function GerarChaveDPS(AcMun: Integer; ACNPJCPF: string;
                           ASerie, ANumero: Integer): String;

    procedure GerarInfDPS;
    procedure GerarSubstituicao;
    procedure GerarPrestador;
    procedure GerarTomador;
    procedure GerarIntermediario;
    procedure GerarServico;
    procedure GerarComExt;
    procedure GerarPedagio;
    procedure GerarAtvEvento;
    procedure GerarObra;
    procedure GerarDedRed;
    procedure GerarTributacao;

  public
    constructor Create(AOwner: TDPS);
    destructor Destroy; override;

    function GerarXml: Boolean;
  published
    property Gerador: TGerador      read FGerador write FGerador;
    property DPS: TDPS              read FDPS     write FDPS;
    property Opcoes: TGeradorOpcoes read FOpcoes  write FOpcoes;
  end;

implementation

uses
  pcnConversaoDPS, pcnAuxiliar,
  ACBrDFeUtil, pcnConsts, ACBrUtil;

{ TDPSW }

constructor TDPSW.Create(AOwner: TDPS);
begin
  FDPS := AOwner;

  FGerador := TGerador.Create;
  FGerador.FIgnorarTagNivel := '|?xml version|DPS xmlns|infDPS versao|obsCont|obsFisco|';

  FOpcoes := TGeradorOpcoes.Create;
  FOpcoes.FAjustarTagNro := True;
  FOpcoes.FGerarTXTSimultaneamente := False;
  FOpcoes.FGerarTagAssinatura := taSomenteSeAssinada;
  FOpcoes.FValidarInscricoes := False;
  FOpcoes.FValidarListaServicos := False;
end;

destructor TDPSW.Destroy;
begin
  FGerador.Free;
  FOpcoes.Free;
  inherited Destroy;
end;

function TDPSW.GerarChaveDPS(AcMun: Integer; ACNPJCPF: string; ASerie,
  ANumero: Integer): String;
var
  cMun, vSerie, vNumero, vCNPJ, tpInsc: String;
begin
  {
  A regra de formação do identificador de 44 posições da DPS é:
  "ID" + Cód.Mun (7) + Tipo de Inscrição Federal (1) +
  Inscrição Federal (14 - CPF completar com 000 à esquerda) + Série DPS (5)+
  Núm. DPS (15)
  }
  cMun  := Poem_Zeros(AcMun, 7);
  vCNPJ := OnlyNumber(ACNPJCPF);

  if Length(vCNPJ) = 11 then
    tpInsc := '2'
  else
    tpInsc := '1';

  vCNPJ   := PadLeft(vCNPJ, 14, '0');
  vSerie  := Poem_Zeros(ASerie, 5);
  vNumero := Poem_Zeros(ANumero, 15);

  Result := cMun + tpInsc + vCNPJ + vSerie + vNumero;
end;

function TDPSW.GerarXml: Boolean;
var
  chave: String;
  Gerar: Boolean;
  xProtDPS : String;
begin
  Gerador.ListaDeAlertas.Clear;
  // Carrega Layout que sera utilizado para gera o txt
  Gerador.LayoutArquivoTXT.Clear;

  Versao := Copy(DPS.VersaoStr, 9, 4);

  chave := GerarChaveDPS(DPS.infDPS.prest.enderNac.cMun,
                         DPS.infDPS.prest.CNPJCPF,
                         DPS.infDPS.serie,
                         DPS.infDPS.nDPS);

  DPS.infDPS.Id := 'ID' + chave;

  Gerador.ArquivoFormatoXML := '';
  Gerador.ArquivoFormatoTXT := '';

  {$IfDef FPC}
   Gerador.wGrupo(ENCODING_UTF8, '', False);
  {$EndIf}

  Gerador.wGrupo('DPS ' + DPS.VersaoStr + ' ' + NAME_SPACE_DPS);

  GerarInfDPS;

  if FOpcoes.GerarTagAssinatura <> taNunca then
  begin
    Gerar := true;

    if FOpcoes.GerarTagAssinatura = taSomenteSeAssinada then
      Gerar := ((DPS.Signature.DigestValue <> '') and
                (DPS.Signature.SignatureValue <> '') and
                (DPS.Signature.X509Certificate <> ''));

    if FOpcoes.GerarTagAssinatura = taSomenteParaNaoAssinada then
      Gerar := ((DPS.Signature.DigestValue = '') and
                (DPS.Signature.SignatureValue = '') and
                (DPS.Signature.X509Certificate = ''));

    if Gerar then
    begin
      FDPS.Signature.URI := '#ID' + OnlyNumber(DPS.infDPS.Id);
      FDPS.Signature.Gerador.Opcoes.IdentarXML := Gerador.Opcoes.IdentarXML;
      FDPS.Signature.GerarXML;
      Gerador.ArquivoFormatoXML := Gerador.ArquivoFormatoXML + FDPS.Signature.Gerador.ArquivoFormatoXML;
    end;
  end;

  Gerador.wGrupo('/DPS');

  Gerador.gtAjustarRegistros(DPS.infDPS.Id);

  Result := (Gerador.ListaDeAlertas.Count = 0);
end;

procedure TDPSW.GerarInfDPS;
begin
  with DPS.infDPS do
  begin
    Gerador.wGrupo('infDPS Id="' + ID + '"');

    Gerador.wCampo(tcStr, '#005', 'tpAmb   ', 01, 01, 1, tpAmbToStr(tpAmb), DSC_TPAMB);
    Gerador.wCampo(tcStr, '#006', 'dhEmi   ', 25, 25, 1, DateTimeTodh(dhEmi) +
                                    GetUTC(prest.enderNac.UF, dhEmi), DSC_DEMI);
    Gerador.wCampo(tcStr, '#007', 'verAplic', 01, 20, 1, verAplic, DSC_VERAPLIC);
    Gerador.wCampo(tcInt, '#008', 'serie   ', 05, 05, 1, serie, DSC_SERIE);
    Gerador.wCampo(tcStr, '#009', 'nDPS    ', 15, 15, 1, nDPS, DSC_NDPS);
    Gerador.wCampo(tcDat, '#010', 'dCompet ', 10, 10, 1, dCompet, DSC_DCOMPET);
    Gerador.wCampo(tcStr, '#011', 'tpEmit  ', 01, 01, 1, tpEmitToStr(tpEmit), DSC_TPEMIT);
  end;

  GerarSubstituicao;
  GerarPrestador;
  GerarTomador;
  GerarIntermediario;
  GerarServico;
  GerarTributacao;

  Gerador.wGrupo('/infDPS');
end;

procedure TDPSW.GerarSubstituicao;
begin
  // Grupo Opcional
  with DPS.infDPS.subst do
  begin
    if (chSubstda <> '') then
    begin
      Gerador.wGrupo('subst');

      Gerador.wCampo(tcStr, '#013', 'chSubstda', 50, 050, 1, chSubstda, DSC_CHSUBSTDA);
      Gerador.wCampo(tcStr, '#014', 'cMotivo  ', 01, 001, 1, cMotivoToStr(cMotivo), DSC_CMOTIVO);
      Gerador.wCampo(tcStr, '#015', 'xMotivo  ', 15, 255, 0, xMotivo, DSC_XMOTIVO);

      Gerador.wGrupo('/subst');
    end;
  end;
end;

procedure TDPSW.GerarPrestador;
begin
  Gerador.wGrupo('prest');

  with DPS.infDPS.prest do
  begin
    if NIF = '' then
      Gerador.wCampoCNPJ('#017', CNPJCPF, CODIGO_BRASIL, True)
    else
      Gerador.wCampo(tcStr, '#019', 'NIF', 01, 40, 1, OnlyNumber(NIF), DSC_NIF);

    Gerador.wCampo(tcStr, '#020', 'IM   ', 01, 015, 0, IM, DSC_IM);
    Gerador.wCampo(tcStr, '#021', 'xNome', 01, 150, 1, xNome, DSC_XNOME);

    if enderExt.xEnderExt = '' then
    begin
      Gerador.wGrupo('enderNac');

      Gerador.wCampo(tcStr, '#023', 'xLgr   ', 01, 255, 1, enderNac.xLgr, DSC_XLGR);
      Gerador.wCampo(tcStr, '#024', 'nro    ', 01, 060, 1, ExecutarAjusteTagNro(FOpcoes.FAjustarTagNro, enderNac.nro), DSC_NRO);
      Gerador.wCampo(tcStr, '#025', 'xCpl   ', 01, 156, 0, enderNac.xCpl, DSC_XCPL);
      Gerador.wCampo(tcStr, '#026', 'xBairro', 01, 060, 1, enderNac.xBairro, DSC_XBAIRRO);
      Gerador.wCampo(tcInt, '#027', 'cMun   ', 07, 007, 1, enderNac.cMun, DSC_CMUN);

      if not ValidarMunicipio(enderNac.cMun) then
        Gerador.wAlerta('#027', 'cMun', DSC_CMUN, ERR_MSG_INVALIDO);

      Gerador.wCampo(tcStr, '#028', 'UF', 02, 02, 1, enderNac.UF, DSC_UF);

      if not ValidarUF(enderNac.UF) then
        Gerador.wAlerta('#028', 'UF', DSC_UF, ERR_MSG_INVALIDO);

      Gerador.wCampo(tcInt, '#029', 'CEP', 08, 08, 1, enderNac.CEP, DSC_CEP);

      Gerador.wGrupo('/enderNac');
    end
    else
    begin
      Gerador.wGrupo('enderExt');

      Gerador.wCampo(tcStr, '#031', 'cPais    ', 02, 002, 1, enderExt.cPais, DSC_CPAIS);
      Gerador.wCampo(tcStr, '#032', 'xEnderExt', 01, 255, 1, enderExt.xEnderExt, DSC_XLGR);

      Gerador.wGrupo('/enderExt');
    end;

    Gerador.wCampo(tcStr, '#033', 'fone ', 06, 20, 0, OnlyNumber(fone), DSC_FONE);
    Gerador.wCampo(tcStr, '#034', 'email', 01, 80, 0, Email, DSC_EMAIL);
  end;

  Gerador.wGrupo('/prest');
end;

procedure TDPSW.GerarTomador;
begin
  // Grupo Opcional
  with DPS.infDPS.toma do
  begin
    if (CNPJCPF <> '') or (NIF <> '') then
    begin
      Gerador.wGrupo('toma');

      if NIF = '' then
        Gerador.wCampoCNPJ('#036', CNPJCPF, CODIGO_BRASIL, True)
      else
        Gerador.wCampo(tcStr, '#038', 'NIF', 01, 40, 1, OnlyNumber(NIF), DSC_NIF);

      Gerador.wCampo(tcStr, '#039', 'IM   ', 01, 015, 0, IM, DSC_IM);
      Gerador.wCampo(tcStr, '#040', 'xNome', 01, 150, 0, xNome, DSC_XNOME);

      if enderExt.xEnderExt = '' then
      begin
        Gerador.wGrupo('enderNac');

        Gerador.wCampo(tcStr, '#042', 'xLgr   ', 01, 255, 1, enderNac.xLgr, DSC_XLGR);
        Gerador.wCampo(tcStr, '#043', 'nro    ', 01, 060, 1, ExecutarAjusteTagNro(FOpcoes.FAjustarTagNro, enderNac.nro), DSC_NRO);
        Gerador.wCampo(tcStr, '#044', 'xCpl   ', 01, 156, 0, enderNac.xCpl, DSC_XCPL);
        Gerador.wCampo(tcStr, '#045', 'xBairro', 01, 060, 1, enderNac.xBairro, DSC_XBAIRRO);
        Gerador.wCampo(tcInt, '#046', 'cMun   ', 07, 007, 1, enderNac.cMun, DSC_CMUN);

        if not ValidarMunicipio(enderNac.cMun) then
          Gerador.wAlerta('#046', 'cMun', DSC_CMUN, ERR_MSG_INVALIDO);

        Gerador.wCampo(tcStr, '#047', 'UF', 02, 02, 1, enderNac.UF, DSC_UF);

        if not ValidarUF(enderNac.UF) then
          Gerador.wAlerta('#047', 'UF', DSC_UF, ERR_MSG_INVALIDO);

        Gerador.wCampo(tcInt, '#048', 'CEP', 08, 08, 1, enderNac.CEP, DSC_CEP);

        Gerador.wGrupo('/enderNac');
      end
      else
      begin
        Gerador.wGrupo('enderExt');

        Gerador.wCampo(tcStr, '#050', 'cPais    ', 02, 002, 1, enderExt.cPais, DSC_CPAIS);
        Gerador.wCampo(tcStr, '#051', 'xEnderExt', 01, 255, 1, enderExt.xEnderExt, DSC_XLGR);

        Gerador.wGrupo('/enderExt');
      end;

      Gerador.wCampo(tcStr, '#052', 'fone ', 06, 20, 0, OnlyNumber(fone), DSC_FONE);
      Gerador.wCampo(tcStr, '#053', 'email', 01, 80, 0, Email, DSC_EMAIL);

      Gerador.wGrupo('/toma');
    end;
  end;
end;

procedure TDPSW.GerarIntermediario;
begin
  // Grupo Opcional
  with DPS.infDPS.interm do
  begin
    if (CNPJCPF <> '') or (NIF <> '') then
    begin
      Gerador.wGrupo('interm');

      if NIF = '' then
        Gerador.wCampoCNPJ('#055', CNPJCPF, CODIGO_BRASIL, True)
      else
        Gerador.wCampo(tcStr, '#057', 'NIF', 01, 40, 1, OnlyNumber(NIF), DSC_NIF);

      Gerador.wCampo(tcStr, '#058', 'IM   ', 01, 015, 0, IM, DSC_IM);
      Gerador.wCampo(tcStr, '#059', 'xNome', 01, 150, 1, xNome, DSC_XNOME);

      if enderExt.xEnderExt = '' then
      begin
        Gerador.wGrupo('enderNac');

        Gerador.wCampo(tcStr, '#061', 'xLgr   ', 01, 255, 1, enderNac.xLgr, DSC_XLGR);
        Gerador.wCampo(tcStr, '#062', 'nro    ', 01, 060, 1, ExecutarAjusteTagNro(FOpcoes.FAjustarTagNro, enderNac.nro), DSC_NRO);
        Gerador.wCampo(tcStr, '#063', 'xCpl   ', 01, 156, 0, enderNac.xCpl, DSC_XCPL);
        Gerador.wCampo(tcStr, '#064', 'xBairro', 01, 060, 1, enderNac.xBairro, DSC_XBAIRRO);
        Gerador.wCampo(tcInt, '#065', 'cMun   ', 07, 007, 1, enderNac.cMun, DSC_CMUN);

        if not ValidarMunicipio(enderNac.cMun) then
          Gerador.wAlerta('#065', 'cMun', DSC_CMUN, ERR_MSG_INVALIDO);

        Gerador.wCampo(tcStr, '#066', 'UF', 02, 02, 1, enderNac.UF, DSC_UF);

        if not ValidarUF(enderNac.UF) then
          Gerador.wAlerta('#066', 'UF', DSC_UF, ERR_MSG_INVALIDO);

        Gerador.wCampo(tcInt, '#067', 'CEP', 08, 08, 1, enderNac.CEP, DSC_CEP);

        Gerador.wGrupo('/enderNac');
      end
      else
      begin
        Gerador.wGrupo('enderExt');

        Gerador.wCampo(tcStr, '#069', 'cPais    ', 02, 002, 1, enderExt.cPais, DSC_CPAIS);
        Gerador.wCampo(tcStr, '#070', 'xEnderExt', 01, 255, 1, enderExt.xEnderExt, DSC_XLGR);

        Gerador.wGrupo('/enderExt');
      end;

      Gerador.wCampo(tcStr, '#071', 'fone ', 06, 20, 0, OnlyNumber(fone), DSC_FONE);
      Gerador.wCampo(tcStr, '#072', 'email', 01, 80, 0, Email, DSC_EMAIL);

      Gerador.wGrupo('/interm');
    end;
  end;
end;

procedure TDPSW.GerarServico;
begin
  Gerador.wGrupo('serv');

  with DPS.infDPS.serv do
  begin
    if cMunPrestacao <> 0 then
      Gerador.wCampo(tcInt, '#074', 'cMunPrestacao ', 07, 07, 1, cMunPrestacao, DSC_CMUNPRESTACAO)
    else
      Gerador.wCampo(tcStr, '#075', 'cPaisPrestacao', 02, 02, 1, cPaisPrestacao, DSC_CPAISPRESTACAO);

    Gerador.wCampo(tcInt, '#076', 'cTribNac', 01, 06, 1, cTribNac, DSC_CTRIBNAC);
    Gerador.wCampo(tcInt, '#077', 'cTribMun', 01, 03, 0, cTribMun, DSC_CTRIBMUN);

    Gerador.wCampo(tcStr, '#078', 'xDescServ', 01, 2000, 1, xDescServ, DSC_XDESCSERV);

    Gerador.wCampo(tcStr, '#079', 'cNBS', 01, 09, 0, cNBS, DSC_CNBS);

    Gerador.wCampo(tcDe2, '#080', 'vReceb     ', 00, 15, 0, vReceb, DSC_VRECEB);
    Gerador.wCampo(tcDe2, '#081', 'vServ      ', 00, 15, 1, vServ, DSC_VSERV);
    Gerador.wCampo(tcDe2, '#082', 'vDescIncond', 00, 15, 0, vDescIncond, DSC_VDESCINCOND);
    Gerador.wCampo(tcDe2, '#083', 'vDescCond  ', 00, 15, 0, vDescCond, DSC_VDESCCOND);

    GerarComExt;
    GerarPedagio;
    GerarAtvEvento;
    GerarObra;

    Gerador.wCampo(tcStr, '#124', 'idDocTec', 01, 040, 0, idDocTec, DSC_IDDOCTEC);
    Gerador.wCampo(tcStr, '#125', 'docRef  ', 01, 255, 0, docRef, DSC_DOCREF);

    Gerador.wCampo(tcStr, '#126', 'xInfComp', 01, 2000, 0, xInfComp, DSC_XINFCOMP);

    GerarDedRed;
  end;

  Gerador.wGrupo('/serv');
end;

procedure TDPSW.GerarComExt;
begin
  // Grupo Opcional
  with DPS.infDPS.serv.comExt do
  begin
    if dtIniPrest > 0 then
    begin
      Gerador.wGrupo('comExt');

      Gerador.wCampo(tcDat, '#085', 'dtIniPrest ', 10, 10, 1, dtIniPrest, DSC_DTINI);
      Gerador.wCampo(tcDat, '#086', 'dtFimPrest ', 10, 10, 1, dtFimPrest, DSC_DTFIM);
      Gerador.wCampo(tcStr, '#087', 'mdPrestacao', 01, 01, 1, mdPrestacaoToStr(mdPrestacao), DSC_MDPRESTACAO);
      Gerador.wCampo(tcInt, '#088', 'tpMoeda    ', 03, 03, 1, tpMoeda, DSC_TPMOEDA);
      Gerador.wCampo(tcDe2, '#089', 'vServMoeda ', 00, 15, 0, vServMoeda, DSC_VSERVMOEDA);
      Gerador.wCampo(tcStr, '#090', 'enquadRVS  ', 01, 01, 1, enquadRVSToStr(enquadRVS), DSC_ENQUADRVS);
      Gerador.wCampo(tcStr, '#091', 'enquadRPC  ', 01, 01, 1, enquadRPCToStr(enquadRPC), DSC_ENQUADRPC);
      Gerador.wCampo(tcStr, '#092', 'movTempBens', 01, 01, 1, movTempBensToStr(movTempBens), DSC_MOVTEMPBENS);
      Gerador.wCampo(tcStr, '#093', 'nDI        ', 01, 12, 1, nDI, DSC_NDI);
      Gerador.wCampo(tcStr, '#094', 'nRE        ', 01, 12, 1, nRE, DSC_NRE);
      Gerador.wCampo(tcInt, '#095', 'mdic       ', 01, 01, 1, mdic, DSC_MDIC);

      Gerador.wGrupo('/comExt');
    end;
  end;
end;

procedure TDPSW.GerarPedagio;
begin
  // Grupo Opcional
  with DPS.infDPS.serv.pedagio do
  begin
    if placa <> '' then
    begin
      Gerador.wGrupo('pedagio');

      Gerador.wCampo(tcStr, '#097', 'placa  ', 07, 07, 1, placa, DSC_PLACA);
      Gerador.wCampo(tcInt, '#098', 'nEixos ', 02, 02, 1, nEixos, DSC_NEIXOS);
      Gerador.wCampo(tcInt, '#099', 'sentido', 03, 03, 1, sentido, DSC_SENTIDO);

      Gerador.wGrupo('/pedagio');
    end;
  end;
end;

procedure TDPSW.GerarAtvEvento;
begin
  // Grupo Opcional
  with DPS.infDPS.serv.atvEvento do
  begin
    if desc <> '' then
    begin
      Gerador.wGrupo('atvEvento');

      Gerador.wCampo(tcStr, '#101', 'desc ', 01, 255, 1, desc, DSC_DESC);
      Gerador.wCampo(tcDat, '#102', 'dtIni', 10, 010, 1, dtIni, DSC_DTINI);
      Gerador.wCampo(tcDat, '#103', 'dtFim', 10, 010, 1, dtFim, DSC_DTFIM);

      if id <> '' then
        Gerador.wCampo(tcStr, '#104', 'id   ', 01, 030, 1, id, DSC_ID)
      else
      begin
        Gerador.wGrupo('ender');

        Gerador.wCampo(tcStr, '#106', 'xLgr   ', 01, 255, 1, ender.xLgr, DSC_XLGR);
        Gerador.wCampo(tcStr, '#107', 'nro    ', 01, 060, 1, ExecutarAjusteTagNro(FOpcoes.FAjustarTagNro, ender.nro), DSC_NRO);
        Gerador.wCampo(tcStr, '#108', 'xCpl   ', 01, 156, 0, ender.xCpl, DSC_XCPL);
        Gerador.wCampo(tcStr, '#109', 'xBairro', 01, 060, 1, ender.xBairro, DSC_XBAIRRO);
        Gerador.wCampo(tcInt, '#110', 'cMun   ', 07, 007, 1, ender.cMun, DSC_CMUN);

        if not ValidarMunicipio(ender.cMun) then
          Gerador.wAlerta('#110', 'cMun', DSC_CMUN, ERR_MSG_INVALIDO);

        Gerador.wCampo(tcStr, '#111', 'UF', 02, 02, 1, ender.UF, DSC_UF);

        if not ValidarUF(ender.UF) then
          Gerador.wAlerta('#111', 'UF', DSC_UF, ERR_MSG_INVALIDO);

        Gerador.wCampo(tcInt, '#112', 'CEP', 08, 08, 1, ender.CEP, DSC_CEP);

        Gerador.wGrupo('/ender');
      end;

      Gerador.wGrupo('/atvEvento');
    end;
  end;
end;

procedure TDPSW.GerarObra;
begin
  // Grupo Opcional
  with DPS.infDPS.serv.obra do
  begin
    if (cObra <> '') or (inscImobFisc <> '') then
    begin
      Gerador.wGrupo('obra');

      Gerador.wCampo(tcStr, '#114', 'cObra       ', 01, 30, 0, cObra, DSC_COBRA);
      Gerador.wCampo(tcStr, '#115', 'inscImobFisc', 01, 30, 0, inscImobFisc, DSC_INSCIMOBFISC);

      if ender.xLgr <> '' then
      begin
        Gerador.wGrupo('ender');

        Gerador.wCampo(tcStr, '#117', 'xLgr   ', 01, 255, 1, ender.xLgr, DSC_XLGR);
        Gerador.wCampo(tcStr, '#118', 'nro    ', 01, 060, 1, ExecutarAjusteTagNro(FOpcoes.FAjustarTagNro, ender.nro), DSC_NRO);
        Gerador.wCampo(tcStr, '#119', 'xCpl   ', 01, 156, 0, ender.xCpl, DSC_XCPL);
        Gerador.wCampo(tcStr, '#120', 'xBairro', 01, 060, 1, ender.xBairro, DSC_XBAIRRO);
        Gerador.wCampo(tcInt, '#121', 'cMun   ', 07, 007, 1, ender.cMun, DSC_CMUN);

        if not ValidarMunicipio(ender.cMun) then
          Gerador.wAlerta('#121', 'cMun', DSC_CMUN, ERR_MSG_INVALIDO);

        Gerador.wCampo(tcStr, '#122', 'UF', 02, 02, 1, ender.UF, DSC_UF);

        if not ValidarUF(ender.UF) then
          Gerador.wAlerta('#122', 'UF', DSC_UF, ERR_MSG_INVALIDO);

        Gerador.wCampo(tcInt, '#123', 'CEP', 08, 08, 1, ender.CEP, DSC_CEP);

        Gerador.wGrupo('/ender');
      end;

      Gerador.wGrupo('/obra');
    end;
  end;
end;

procedure TDPSW.GerarDedRed;
var
  i: Integer;
begin
  // Grupo Opcional
  with DPS.infDPS.serv.dedRed do
  begin
    if vDR > 0 then
    begin
      Gerador.wGrupo('dedRed');

      Gerador.wCampo(tcDe2, '#128', 'vDR', 00, 15, 0, vDR, DSC_VDR);
      Gerador.wCampo(tcDe2, '#129', 'pDR', 00, 05, 0, pDR, DSC_PDR);

      if documento.Count > 0 then
      begin
        for i := 0 to documento.Count -1 do
        begin
          Gerador.wGrupo('documento');

          with documento.Items[i] do
          begin
            if chNFSe <> '' then
              Gerador.wCampo(tcStr, '#131', 'chNFSe', 50, 50, 1, chNFSe, DSC_CHNFSE);

            if chNFe <> '' then
              Gerador.wCampo(tcStr, '#132', 'chNFe ', 44, 44, 1, chNFe, DSC_CHNFE);

            if outNotaeMun.cMunNota > 0 then
            begin
              Gerador.wGrupo('outNotaeMun');

              Gerador.wCampo(tcInt, '#134', 'cMunNota', 07, 07, 1, outNotaeMun.cMunNota, DSC_CMUNNOTA);
              Gerador.wCampo(tcStr, '#135', 'nNota   ', 01, 15, 1, outNotaeMun.nNota, DSC_NNOTA);
              Gerador.wCampo(tcStr, '#136', 'cvNota  ', 01, 09, 1, outNotaeMun.cvNota, DSC_CVNOTA);

              Gerador.wGrupo('/outNotaeMun');
            end;

            if NFNFS.nNFS > 0 then
            begin
              Gerador.wGrupo('NFNFS');

              Gerador.wCampo(tcInt, '#138', 'nNFS    ', 01, 07, 1, NFNFS.nNFS, DSC_NNFS);
              Gerador.wCampo(tcStr, '#139', 'modNFS  ', 01, 15, 1, NFNFS.modNFS, DSC_MODNFS);
              Gerador.wCampo(tcStr, '#140', 'serieNFS', 01, 09, 1, NFNFS.serieNFS, DSC_SERIENFS);

              Gerador.wGrupo('/NFNFS');
            end;

            if outDocFisc <> '' then
              Gerador.wCampo(tcStr, '#141', 'outDocFisc', 01, 255, 1, outDocFisc, DSC_OUTDOCFISC);

            if outDoc <> '' then
              Gerador.wCampo(tcStr, '#142', 'outDoc', 01, 255, 1, outDoc, DSC_OUTDOC);

  //        Gerador.wCampo(tcStr, '#143', 'ideDedRed', 01, 01, 1, IdeDedRedToStr(ideDedRed), DSC_IDEDEFRED);
            Gerador.wCampo(tcStr, '#143', 'tipo    ', 01, 001, 1, IdeDedRedToStr(tipo), DSC_IDEDEFRED);
            Gerador.wCampo(tcStr, '#144', 'xDescOut', 01, 150, 0, xDescOut, DSC_XDESCOUT);
            Gerador.wCampo(tcDat, '#145', 'dEmiDoc ', 10, 010, 1, dEmiDoc, DSC_DEMI);

            Gerador.wCampo(tcDe2, '#146', 'vDedutivelRedutivel', 0, 15, 1, vDedutivelRedutivel, DSC_VDEDRED);
            Gerador.wCampo(tcDe2, '#147', 'vDeducaoReducao    ', 0, 15, 1, vDeducaoReducao, DSC_VDEDUCREDUC);

            with forne do
            begin
              if xNome <> '' then
              begin
                Gerador.wGrupo('forne');

                if NIF = '' then
                  Gerador.wCampoCNPJ('#149', CNPJCPF, CODIGO_BRASIL, True)
                else
                  Gerador.wCampo(tcStr, '#151', 'NIF', 01, 40, 1, OnlyNumber(NIF), DSC_NIF);

                Gerador.wCampo(tcStr, '#152', 'IM   ', 01, 015, 0, IM, DSC_IM);
                Gerador.wCampo(tcStr, '#153', 'xNome', 01, 150, 1, xNome, DSC_XNOME);

                if enderExt.xEnderExt = '' then
                begin
                  Gerador.wGrupo('enderNac');

                  Gerador.wCampo(tcStr, '#155', 'xLgr   ', 01, 255, 1, enderNac.xLgr, DSC_XLGR);
                  Gerador.wCampo(tcStr, '#156', 'nro    ', 01, 060, 1, ExecutarAjusteTagNro(FOpcoes.FAjustarTagNro, enderNac.nro), DSC_NRO);
                  Gerador.wCampo(tcStr, '#157', 'xCpl   ', 01, 156, 0, enderNac.xCpl, DSC_XCPL);
                  Gerador.wCampo(tcStr, '#158', 'xBairro', 01, 060, 1, enderNac.xBairro, DSC_XBAIRRO);
                  Gerador.wCampo(tcInt, '#159', 'cMun   ', 07, 007, 1, enderNac.cMun, DSC_CMUN);

                  if not ValidarMunicipio(enderNac.cMun) then
                    Gerador.wAlerta('#159', 'cMun', DSC_CMUN, ERR_MSG_INVALIDO);

                  Gerador.wCampo(tcStr, '#160', 'UF', 02, 02, 1, enderNac.UF, DSC_UF);

                  if not ValidarUF(enderNac.UF) then
                    Gerador.wAlerta('#160', 'UF', DSC_UF, ERR_MSG_INVALIDO);

                  Gerador.wCampo(tcInt, '#161', 'CEP', 08, 08, 1, enderNac.CEP, DSC_CEP);

                  Gerador.wGrupo('/enderNac');
                end
                else
                begin
                  Gerador.wGrupo('enderExt');

                  Gerador.wCampo(tcStr, '#163', 'cPais    ', 02, 002, 1, enderExt.cPais, DSC_CPAIS);
                  Gerador.wCampo(tcStr, '#164', 'xEnderExt', 01, 255, 1, enderExt.xEnderExt, DSC_XLGR);

                  Gerador.wGrupo('/enderExt');
                end;

                Gerador.wCampo(tcStr, '#165', 'fone ', 06, 20, 0, OnlyNumber(fone), DSC_FONE);
                Gerador.wCampo(tcStr, '#166', 'email', 01, 80, 0, Email, DSC_EMAIL);

                Gerador.wGrupo('/forne');
              end;
            end;
          end;

          Gerador.wGrupo('/documento');
        end;
      end;

      Gerador.wGrupo('/dedRed');
    end;
  end;
end;

procedure TDPSW.GerarTributacao;
begin
  Gerador.wGrupo('trib');

  with DPS.infDPS.trib do
  begin
    Gerador.wCampo(tcStr, '#168', 'opSimpNac   ', 01, 01, 1, opSimpNacToStr(opSimpNac), DSC_OPSIMPNAC);

    if opLimMEI <> toNenhum then
      Gerador.wCampo(tcStr, '#169', 'opLimMEI    ', 01, 01, 0, opSNLimUltrapToStr(opLimMEI), DSC_OPLIMMEI);

    if opLimSimpNac <> toNenhum then
      Gerador.wCampo(tcStr, '#170', 'opLimSimpNac', 01, 01, 0, opSNLimUltrapToStr(opLimSimpNac), DSC_OPLIMSIMPNAC);

    if issqn.gerarISSQN then
    begin
      Gerador.wGrupo('issqn');

      Gerador.wCampo(tcStr, '#172', 'regEspTrib ', 01, 01, 1, regEspTribToStr(issqn.regEspTrib), DSC_REGESPTRIB);
      Gerador.wCampo(tcStr, '#173', 'exigISSQN  ', 01, 01, 1, exigISSQNToStr(issqn.exigISSQN), DSC_EXIGISSQN);
      Gerador.wCampo(tcStr, '#174', 'nBMIsenc   ', 01, 09, 0, issqn.nBMIsenc, DSC_NBMISENC);
      Gerador.wCampo(tcDe2, '#175', 'vInfoBM    ', 01, 15, 0, issqn.vInfoBM, DSC_VINFOBM);
      Gerador.wCampo(tcStr, '#176', 'nProcesso  ', 01, 30, 0, issqn.nProcesso, DSC_NPROCESSO);

      if issqn.tpImunidade <> tiNenhum then
        Gerador.wCampo(tcStr, '#177', 'tpImunidade', 01, 01, 1, tpImunidadeToStr(issqn.tpImunidade), DSC_TPIMUNIDADE);

      Gerador.wCampo(tcDe2, '#178', 'pAliq     ', 01, 03, 0, issqn.pAliq, DSC_PALIQUOTA);
      Gerador.wCampo(tcStr, '#179', 'tpRetISSQN', 01, 01, 1, tpRetISSQNToStr(issqn.tpRetISSQN), DSC_TPRETISSQN);

      Gerador.wGrupo('/issqn');
    end;

    if (outros.vRetCP > 0) or (outros.vRetIRRF > 0) or (outros.vRetCSLL > 0) or
       (outros.piscofins.vBCPisCofins > 0) then
    begin
      Gerador.wGrupo('outros');

      with outros.piscofins do
      begin
        if vBCPisCofins > 0 then
        begin
          Gerador.wGrupo('piscofins');

          Gerador.wCampo(tcStr, '#181', 'CST         ', 01, 01, 1, CSTToStr(CST), DSC_CST);
          Gerador.wCampo(tcDe2, '#183', 'vBCPisCofins', 01, 15, 1, vBCPisCofins, DSC_VBCPISCOFINS);
          Gerador.wCampo(tcDe2, '#184', 'pAliqPis    ', 01, 04, 1, pAliqPis, DSC_PALIPIS);
          Gerador.wCampo(tcDe2, '#185', 'pAliqCofins ', 01, 04, 1, pAliqCofins, DSC_PALICOFINS);
          Gerador.wCampo(tcDe2, '#186', 'vPis        ', 01, 15, 1, vPis, DSC_VPIS);
          Gerador.wCampo(tcDe2, '#187', 'vCofins     ', 01, 15, 1, vCofins, DSC_VCOFINS);

          Gerador.wCampo(tcStr, '#188', 'tpRetPisCofins', 01, 01, 1, tpRetPisCofinsToStr(tpRetPisCofins), DSC_TPRETPISCOFINS);

          Gerador.wGrupo('/piscofins');
        end;
      end;

      Gerador.wCampo(tcDe2, '#189', 'vRetCP  ', 01, 15, 0, outros.vRetCP, DSC_VRETCP);
      Gerador.wCampo(tcDe2, '#190', 'vRetIRRF', 01, 15, 0, outros.vRetIRRF, DSC_VRETIRRF);
      Gerador.wCampo(tcDe2, '#191', 'vRetCSLL', 01, 15, 0, outros.vRetCSLL, DSC_VRETCSLL);

      Gerador.wGrupo('/outros');
    end;

    Gerador.wGrupo('totTrib');

    with totTrib do
    begin
      if vTotTrib.vTotTribFed > 0 then
      begin
        Gerador.wGrupo('vTotTrib');

        Gerador.wCampo(tcDe2, '#194', 'vTotTribFed', 01, 15, 1, vTotTrib.vTotTribFed, DSC_VTOTTRIBFED);
        Gerador.wCampo(tcDe2, '#195', 'vTotTribEst', 01, 15, 1, vTotTrib.vTotTribEst, DSC_VTOTTRIBEST);
        Gerador.wCampo(tcDe2, '#196', 'vTotTribMun', 01, 15, 1, vTotTrib.vTotTribMun, DSC_VTOTTRIBMUN);

        Gerador.wGrupo('/vTotTrib');
      end
      else
      begin
        if pTotTrib.pTotTribFed > 0 then
        begin
          Gerador.wGrupo('pTotTrib');

          Gerador.wCampo(tcDe2, '#198', 'pTotTribFed', 01, 15, 1, pTotTrib.pTotTribFed, DSC_PTOTTRIBFED);
          Gerador.wCampo(tcDe2, '#199', 'pTotTribEst', 01, 15, 1, pTotTrib.pTotTribEst, DSC_PTOTTRIBEST);
          Gerador.wCampo(tcDe2, '#200', 'pTotTribMun', 01, 15, 1, pTotTrib.pTotTribMun, DSC_PTOTTRIBMUN);

          Gerador.wGrupo('/pTotTrib');
        end
        else
        begin
          if pTotTribSN >0 then
            Gerador.wCampo(tcDe2, '#202', 'pTotTribSN', 01, 04, 0, pTotTribSN, DSC_PTOTTRIBSN)
          else
            Gerador.wCampo(tcDe2, '#201', 'indTotTrib', 01, 01, 0, '0', '');
        end;
      end;
    end;

    Gerador.wGrupo('/totTrib');
  end;

  Gerador.wGrupo('/trib');
end;

end.

