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

unit pcnDPSR;

interface

uses
  SysUtils, Classes,
  pcnConversao, pcnLeitor, pcnDPS;

type

{ TDPSR }

  TDPSR = class(TObject)
  private
    FLeitor: TLeitor;
    FDPS: TDPS;
  public
    constructor Create(AOwner: TDPS);
    destructor Destroy; override;

    function LerXml: Boolean;

    property Leitor: TLeitor read FLeitor write FLeitor;
    property DPS: TDPS       read FDPS    write FDPS;
  end;

{ TNFSeR }

  TNFSeR = class(TObject)
  private
    FLeitor: TLeitor;
    FNFSe: TNFSe;
  public
    constructor Create(AOwner: TNFSe);
    destructor Destroy; override;

    function LerXml: Boolean;

    property Leitor: TLeitor read FLeitor write FLeitor;
    property NFSe: TNFSe     read FNFSe    write FNFSe;
  end;

implementation

uses
  pcnConversaoDPS,
  ACBrUtil;

{ TDPSR }

constructor TDPSR.Create(AOwner: TDPS);
begin
  inherited Create;

  FLeitor := TLeitor.Create;
  FDPS    := AOwner;
end;

destructor TDPSR.Destroy;
begin
  FLeitor.Free;

  inherited Destroy;
end;

function TDPSR.LerXml: Boolean;
var
  ok: Boolean;
  i: Integer;
  VersaoDPS, Aspas: String;
begin
  Leitor.Grupo := Leitor.Arquivo;

  if Pos('versao="', Leitor.Arquivo) <> 0 then
    Aspas := '"'
   else
    Aspas := '''';

  DPS.infDPS.Id := Leitor.rAtributo('Id=', 'infDPS');
  if OnlyNumber(DPS.infDPS.Id) = '' then
    raise Exception.Create('Não encontrei o atributo: Id');

  VersaoDPS := Leitor.rAtributo('versao=', 'DPS');
  if StringToFloatDef(VersaoDPS, -1) = -1 then
    raise Exception.Create('Não encontrei o atributo: versao');

  DPS.Versao := StringToFloat(VersaoDPS);

  with DPS.infDPS do
  begin
    if Leitor.rExtrai(1, 'infDPS') <> '' then
    begin
      tpAmb    := StrToTpAmb(ok, Leitor.rCampo(tcStr, 'tpAmb'));
      dhEmi    := Leitor.rCampo(tcDatHor, 'dhEmi');
      verAplic := Leitor.rCampo(tcStr, 'verAplic');
      serie    := Leitor.rCampo(tcInt, 'serie');
      nDPS     := Leitor.rCampo(tcInt, 'nDPS');
      dCompet  := Leitor.rCampo(tcDat, 'dCompet');
      tpEmit   := StrTotpEmit(ok, Leitor.rCampo(tcStr, 'tpEmit'));

      if Leitor.rExtrai(2, 'subst') <> '' then
      begin
        subst.chSubstda := Leitor.rCampo(tcStr, 'chSubstda');
        subst.cMotivo   := StrTocMotivo(ok, Leitor.rCampo(tcStr, 'cMotivo'));
        subst.xMotivo   := Leitor.rCampo(tcStr, 'xMotivo');
      end;

      with prest do
      begin
        if Leitor.rExtrai(2, 'prest') <> '' then
        begin
          CNPJCPF := Leitor.rCampoCNPJCPF;
          NIF     := Leitor.rCampo(tcStr, 'NIF');
          IM      := Leitor.rCampo(tcStr, 'IM');
          xNome   := Leitor.rCampo(tcStr, 'xNome');
          fone    := Leitor.rCampo(tcStr, 'fone');
          email   := Leitor.rCampo(tcStr, 'email');

          if Leitor.rExtrai(3, 'enderNac') <> '' then
          begin
            enderNac.xLgr    := Leitor.rCampo(tcStr, 'xLgr');
            enderNac.nro     := Leitor.rCampo(tcStr, 'nro');
            enderNac.xCpl    := Leitor.rCampo(tcStr, 'xCpl');
            enderNac.xBairro := Leitor.rCampo(tcStr, 'xBairro');
            enderNac.cMun    := Leitor.rCampo(tcInt, 'cMun');
            enderNac.UF      := Leitor.rCampo(tcStr, 'UF');
            enderNac.CEP     := Leitor.rCampo(tcInt, 'CEP');
          end;

          if Leitor.rExtrai(3, 'enderExt') <> '' then
          begin
            enderExt.cPais     := Leitor.rCampo(tcStr, 'cPais');
            enderExt.xEnderExt := Leitor.rCampo(tcStr, 'xEnderExt');
          end;
        end;
      end;

      with toma do
      begin
        if Leitor.rExtrai(2, 'toma') <> '' then
        begin
          CNPJCPF := Leitor.rCampoCNPJCPF;
          NIF     := Leitor.rCampo(tcStr, 'NIF');
          IM      := Leitor.rCampo(tcStr, 'IM');
          xNome   := Leitor.rCampo(tcStr, 'xNome');
          fone    := Leitor.rCampo(tcStr, 'fone');
          email   := Leitor.rCampo(tcStr, 'email');

          if Leitor.rExtrai(3, 'enderNac') <> '' then
          begin
            enderNac.xLgr    := Leitor.rCampo(tcStr, 'xLgr');
            enderNac.nro     := Leitor.rCampo(tcStr, 'nro');
            enderNac.xCpl    := Leitor.rCampo(tcStr, 'xCpl');
            enderNac.xBairro := Leitor.rCampo(tcStr, 'xBairro');
            enderNac.cMun    := Leitor.rCampo(tcInt, 'cMun');
            enderNac.UF      := Leitor.rCampo(tcStr, 'UF');
            enderNac.CEP     := Leitor.rCampo(tcInt, 'CEP');
          end;

          if Leitor.rExtrai(3, 'enderExt') <> '' then
          begin
            enderExt.cPais     := Leitor.rCampo(tcStr, 'cPais');
            enderExt.xEnderExt := Leitor.rCampo(tcStr, 'xEnderExt');
          end;
        end;
      end;

      with interm do
      begin
        if Leitor.rExtrai(2, 'interm') <> '' then
        begin
          CNPJCPF := Leitor.rCampoCNPJCPF;
          NIF     := Leitor.rCampo(tcStr, 'NIF');
          IM      := Leitor.rCampo(tcStr, 'IM');
          xNome   := Leitor.rCampo(tcStr, 'xNome');
          fone    := Leitor.rCampo(tcStr, 'fone');
          email   := Leitor.rCampo(tcStr, 'email');

          if Leitor.rExtrai(3, 'enderNac') <> '' then
          begin
            enderNac.xLgr    := Leitor.rCampo(tcStr, 'xLgr');
            enderNac.nro     := Leitor.rCampo(tcStr, 'nro');
            enderNac.xCpl    := Leitor.rCampo(tcStr, 'xCpl');
            enderNac.xBairro := Leitor.rCampo(tcStr, 'xBairro');
            enderNac.cMun    := Leitor.rCampo(tcInt, 'cMun');
            enderNac.UF      := Leitor.rCampo(tcStr, 'UF');
            enderNac.CEP     := Leitor.rCampo(tcInt, 'CEP');
          end;

          if Leitor.rExtrai(3, 'enderExt') <> '' then
          begin
            enderExt.cPais     := Leitor.rCampo(tcStr, 'cPais');
            enderExt.xEnderExt := Leitor.rCampo(tcStr, 'xEnderExt');
          end;
        end;
      end;

      with serv do
      begin
        if Leitor.rExtrai(2, 'serv') <> '' then
        begin
          cMunPrestacao  := Leitor.rCampo(tcInt, 'cMunPrestacao');
          cPaisPrestacao := Leitor.rCampo(tcStr, 'cPaisPrestacao');
          cTribNac       := Leitor.rCampo(tcInt, 'cTribNac');
          cTribMun       := Leitor.rCampo(tcInt, 'cTribMun');
          xDescServ      := Leitor.rCampo(tcStr, 'xDescServ');
          cNBS           := Leitor.rCampo(tcStr, 'cNBS');
          vReceb         := Leitor.rCampo(tcDe2, 'vReceb');
          vServ          := Leitor.rCampo(tcDe2, 'vServ');
          vDescIncond    := Leitor.rCampo(tcDe2, 'vDescIncond');
          vDescCond      := Leitor.rCampo(tcDe2, 'vDescCond');
          idDocTec       := Leitor.rCampo(tcStr, 'idDocTec');
          docRef         := Leitor.rCampo(tcStr, 'docRef');
          xInfComp       := Leitor.rCampo(tcStr, 'xInfComp');

          if Leitor.rExtrai(3, 'comExt') <> '' then
          begin
            comExt.dtIniPrest  := Leitor.rCampo(tcDat, 'dtIniPrest');
            comExt.dtFimPrest  := Leitor.rCampo(tcDat, 'dtFimPrest');
            comExt.mdPrestacao := StrTomdPrestacao(ok, Leitor.rCampo(tcStr, 'mdPrestacao'));
            comExt.tpMoeda     := Leitor.rCampo(tcInt, 'tpMoeda');
            comExt.vServMoeda  := Leitor.rCampo(tcDe2, 'vServMoeda');
            comExt.enquadRVS   := StrToEnquadRVS(ok, Leitor.rCampo(tcStr, 'enquadRVS'));
            comExt.enquadRPC   := StrToEnquadRPC(ok, Leitor.rCampo(tcStr, 'enquadRPC'));
            comExt.movTempBens := StrTomovTempBens(ok, Leitor.rCampo(tcStr, 'movTempBens'));
            comExt.nDI         := Leitor.rCampo(tcStr, 'nDI');
            comExt.nRE         := Leitor.rCampo(tcStr, 'nRE');
            comExt.mdic        := Leitor.rCampo(tcInt, 'mdic');
          end;

          if Leitor.rExtrai(3, 'pedagio') <> '' then
          begin
            pedagio.placa   := Leitor.rCampo(tcStr, 'placa');
            pedagio.nEixos  := Leitor.rCampo(tcInt, 'nEixos');
            pedagio.sentido := Leitor.rCampo(tcInt, 'sentido');
          end;

          if Leitor.rExtrai(3, 'atvEvento') <> '' then
          begin
            atvEvento.desc  := Leitor.rCampo(tcStr, 'desc');
            atvEvento.dtIni := Leitor.rCampo(tcDat, 'dtIni');
            atvEvento.dtFim := Leitor.rCampo(tcDat, 'dtFim');
            atvEvento.id    := Leitor.rCampo(tcStr, 'id');

            if Leitor.rExtrai(4, 'ender') <> '' then
            begin
              atvEvento.ender.xLgr    := Leitor.rCampo(tcStr, 'xLgr');
              atvEvento.ender.nro     := Leitor.rCampo(tcStr, 'nro');
              atvEvento.ender.xCpl    := Leitor.rCampo(tcStr, 'xCpl');
              atvEvento.ender.xBairro := Leitor.rCampo(tcStr, 'xBairro');
              atvEvento.ender.cMun    := Leitor.rCampo(tcInt, 'cMun');
              atvEvento.ender.UF      := Leitor.rCampo(tcStr, 'UF');
              atvEvento.ender.CEP     := Leitor.rCampo(tcInt, 'CEP');
            end;
          end;

          if Leitor.rExtrai(3, 'obra') <> '' then
          begin
            obra.cObra        := Leitor.rCampo(tcStr, 'cObra');
            obra.inscImobFisc := Leitor.rCampo(tcStr, 'inscImobFisc');

            if Leitor.rExtrai(4, 'ender') <> '' then
            begin
              obra.ender.xLgr    := Leitor.rCampo(tcStr, 'xLgr');
              obra.ender.nro     := Leitor.rCampo(tcStr, 'nro');
              obra.ender.xCpl    := Leitor.rCampo(tcStr, 'xCpl');
              obra.ender.xBairro := Leitor.rCampo(tcStr, 'xBairro');
              obra.ender.cMun    := Leitor.rCampo(tcInt, 'cMun');
              obra.ender.UF      := Leitor.rCampo(tcStr, 'UF');
              obra.ender.CEP     := Leitor.rCampo(tcInt, 'CEP');
            end;
          end;

          if Leitor.rExtrai(3, 'dedRed') <> '' then
          begin
            dedRed.vDR := Leitor.rCampo(tcDe2, 'vDR');
            dedRed.pDR := Leitor.rCampo(tcDe2, 'pDR');

            i := 0;

            with dedRed do
            begin
              documento.Clear;
              while Leitor.rExtrai(4, 'documento', '', i + 1) <> '' do
              begin
                documento.New;
                documento[i].chNFSe     := Leitor.rCampo(tcStr, 'chNFSe');
                documento[i].chNFe      := Leitor.rCampo(tcStr, 'chNFe');
                documento[i].outDocFisc := Leitor.rCampo(tcStr, 'outDocFisc');
                documento[i].outDoc     := Leitor.rCampo(tcStr, 'outDoc');
                documento[i].tipo       := StrToIdeDedRed(ok, Leitor.rCampo(tcStr, 'tipo'));
                documento[i].xDescOut   := Leitor.rCampo(tcStr, 'xDescOut');
                documento[i].dEmiDoc    := Leitor.rCampo(tcDat, 'dEmiDoc');

                documento[i].vDedutivelRedutivel := Leitor.rCampo(tcDe2, 'vDedutivelRedutivel');
                documento[i].vDeducaoReducao     := Leitor.rCampo(tcDe2, 'vDeducaoReducao');

                if Leitor.rExtrai(5, 'outNotaeMun') <> '' then
                begin
                  documento[i].outNotaeMun.cMunNota := Leitor.rCampo(tcInt, 'cMunNota');
                  documento[i].outNotaeMun.nNota    := Leitor.rCampo(tcStr, 'nNota');
                  documento[i].outNotaeMun.cvNota   := Leitor.rCampo(tcStr, 'cvNota');
                end;

                if Leitor.rExtrai(5, 'NFNFS') <> '' then
                begin
                  documento[i].NFNFS.nNFS     := Leitor.rCampo(tcInt, 'nNFS');
                  documento[i].NFNFS.modNFS   := Leitor.rCampo(tcStr, 'modNFS');
                  documento[i].NFNFS.serieNFS := Leitor.rCampo(tcStr, 'serieNFS');
                end;

                with documento[i].forne do
                begin
                  if Leitor.rExtrai(5, 'forne') <> '' then
                  begin
                    CNPJCPF := Leitor.rCampoCNPJCPF;
                    NIF     := Leitor.rCampo(tcStr, 'NIF');
                    IM      := Leitor.rCampo(tcStr, 'IM');
                    xNome   := Leitor.rCampo(tcStr, 'xNome');
                    fone    := Leitor.rCampo(tcStr, 'fone');
                    email   := Leitor.rCampo(tcStr, 'email');

                    if Leitor.rExtrai(6, 'enderNac') <> '' then
                    begin
                      enderNac.xLgr    := Leitor.rCampo(tcStr, 'xLgr');
                      enderNac.nro     := Leitor.rCampo(tcStr, 'nro');
                      enderNac.xCpl    := Leitor.rCampo(tcStr, 'xCpl');
                      enderNac.xBairro := Leitor.rCampo(tcStr, 'xBairro');
                      enderNac.cMun    := Leitor.rCampo(tcInt, 'cMun');
                      enderNac.UF      := Leitor.rCampo(tcStr, 'UF');
                      enderNac.CEP     := Leitor.rCampo(tcInt, 'CEP');
                    end;

                    if Leitor.rExtrai(6, 'enderExt') <> '' then
                    begin
                      enderExt.cPais     := Leitor.rCampo(tcStr, 'cPais');
                      enderExt.xEnderExt := Leitor.rCampo(tcStr, 'xEnderExt');
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;

      with trib do
      begin
        if Leitor.rExtrai(2, 'trib') <> '' then
        begin
          opSimpNac    := StrToopSimpNac(ok, Leitor.rCampo(tcStr, 'opSimpNac'));
          opLimMEI     := StrToopSNLimUltrap(ok, Leitor.rCampo(tcStr, 'opLimMEI'));
          opLimSimpNac := StrToopSNLimUltrap(ok, Leitor.rCampo(tcStr, 'opLimSimpNac'));

          if Leitor.rExtrai(3, 'issqn') <> '' then
          begin
            issqn.regEspTrib  := StrToregEspTrib(ok, Leitor.rCampo(tcStr, 'regEspTrib'));
            issqn.exigISSQN   := StrToexigISSQN(ok, Leitor.rCampo(tcStr, 'exigISSQN'));
            issqn.nBMIsenc    := Leitor.rCampo(tcStr, 'nBMIsenc');
            issqn.vInfoBM     := Leitor.rCampo(tcDe2, 'vInfoBM');
            issqn.nProcesso   := Leitor.rCampo(tcStr, 'nProcesso');
            issqn.tpImunidade := StrTotpImunidade(ok, Leitor.rCampo(tcStr, 'tpImunidade'));
            issqn.pAliq       := Leitor.rCampo(tcDe2, 'pAliq');
            issqn.tpRetISSQN  := StrTotpRetISSQN(ok, Leitor.rCampo(tcStr, 'tpRetISSQN'));
          end;

          if Leitor.rExtrai(3, 'outros') <> '' then
          begin
            outros.vRetCP   := Leitor.rCampo(tcDe2, 'vRetCP');
            outros.vRetIRRF := Leitor.rCampo(tcDe2, 'vRetIRRF');
            outros.vRetCSLL := Leitor.rCampo(tcDe2, 'vRetCSLL');

            if Leitor.rExtrai(4, 'piscofins') <> '' then
            begin
              outros.piscofins.CST          := StrToCST(ok, Leitor.rCampo(tcStr, 'CST'));
              outros.piscofins.vBCPisCofins := Leitor.rCampo(tcDe2, 'vBCPisCofins');
              outros.piscofins.pAliqPis     := Leitor.rCampo(tcDe2, 'pAliqPis');
              outros.piscofins.pAliqCofins  := Leitor.rCampo(tcDe2, 'pAliqCofins');
              outros.piscofins.vPis         := Leitor.rCampo(tcDe2, 'vPis');
              outros.piscofins.vCofins      := Leitor.rCampo(tcDe2, 'vCofins');

              outros.piscofins.tpRetPisCofins := StrTotpRetPisCofins(ok, Leitor.rCampo(tcStr, 'tpRetPisCofins'));
            end;
          end;

          if Leitor.rExtrai(3, 'totTrib') <> '' then
          begin
            totTrib.indTotTrib := StrToindTotTrib(ok, Leitor.rCampo(tcStr, 'indTotTrib'));
            totTrib.pTotTribSN := Leitor.rCampo(tcDe2, 'pTotTribSN');

            if Leitor.rExtrai(4, 'vTotTrib') <> '' then
            begin
              totTrib.vTotTrib.vTotTribFed := Leitor.rCampo(tcDe2, 'vTotTribFed');
              totTrib.vTotTrib.vTotTribEst := Leitor.rCampo(tcDe2, 'vTotTribEst');
              totTrib.vTotTrib.vTotTribMun := Leitor.rCampo(tcDe2, 'vTotTribMun');
            end;

            if Leitor.rExtrai(4, 'pTotTrib') <> '' then
            begin
              totTrib.pTotTrib.pTotTribFed := Leitor.rCampo(tcDe2, 'pTotTribFed');
              totTrib.pTotTrib.pTotTribEst := Leitor.rCampo(tcDe2, 'pTotTribEst');
              totTrib.pTotTrib.pTotTribMun := Leitor.rCampo(tcDe2, 'pTotTribMun');
            end;
          end;
        end;
      end;
    end;
  end;

  leitor.Grupo := Leitor.Arquivo;

  DPS.Signature.URI             := Leitor.rAtributo('Reference URI=');
  DPS.Signature.DigestValue     := Leitor.rCampo(tcStr, 'DigestValue');
  DPS.Signature.SignatureValue  := Leitor.rCampo(tcStr, 'SignatureValue');
  DPS.Signature.X509Certificate := Leitor.rCampo(tcStr, 'X509Certificate');

  Result := true;
end;

{ TNFSeR }

constructor TNFSeR.Create(AOwner: TNFSe);
begin
  inherited Create;

  FLeitor := TLeitor.Create;
  FNFSe   := AOwner;
end;

destructor TNFSeR.Destroy;
begin
  FLeitor.Free;

  inherited Destroy;
end;

function TNFSeR.LerXml: Boolean;
var
  ok: Boolean;
  i: Integer;
  VersaoNFSe, Aspas, XmlNFSe, XmlDPS: String;
  FDPS: TDPS;
  FDPSRet: TDPSR;
begin
  XmlNFSe := Leitor.Arquivo;
  Leitor.Grupo := XmlNFSe;

  if Pos('versao="', Leitor.Arquivo) <> 0 then
    Aspas := '"'
   else
    Aspas := '''';

  NFSe.infNFSe.Id := Leitor.rAtributo('Id=', 'infNFSe');
  if OnlyNumber(NFSe.infNFSe.Id) = '' then
    raise Exception.Create('Não encontrei o atributo: Id');

  VersaoNFSe := Leitor.rAtributo('versao=', 'NFSe');
  if StringToFloatDef(VersaoNFSe, -1) = -1 then
    raise Exception.Create('Não encontrei o atributo: versao');

  NFSe.Versao := StringToFloat(VersaoNFSe);

  with NFSe.infNFSe do
  begin
    if Leitor.rExtrai(1, 'infNFSe') <> '' then
    begin
      cMunEmi   := Leitor.rCampo(tcInt, 'cMunEmi');
      xMunEmi   := Leitor.rCampo(tcStr, 'xMunEmi');
      cMunIncid := Leitor.rCampo(tcInt, 'cMunIncid');
      xMunIncid := Leitor.rCampo(tcStr, 'xMunIncid');
      nNFSe     := Leitor.rCampo(tcInt, 'nNFSe');
      xTribNac  := Leitor.rCampo(tcStr, 'xTribNac');
      xTribMun  := Leitor.rCampo(tcStr, 'xTribMun');
      xNBS      := Leitor.rCampo(tcStr, 'xNBS');
      verAplic  := Leitor.rCampo(tcStr, 'verAplic');
      ambGer    := StrToAmbienteGerador(ok, Leitor.rCampo(tcStr, 'ambGer'));
      tpEmis    := StrTotpEmis(ok, Leitor.rCampo(tcStr, 'tpEmis'));
      procEmi   := StrTotpProc(ok, Leitor.rCampo(tcStr, 'procEmi'));
      cStat     := Leitor.rCampo(tcInt, 'cStat');
      xMotivo   := cStatToxMotivo(cStat);
      dhProc    := Leitor.rCampo(tcDatHor, 'dhProc');

      with emit do
      begin
        if Leitor.rExtrai(2, 'emit') <> '' then
        begin
          CNPJCPF := Leitor.rCampoCNPJCPF;
          xNome   := Leitor.rCampo(tcStr, 'xNome');
          xFant   := Leitor.rCampo(tcStr, 'xFant');
          fone    := Leitor.rCampo(tcStr, 'fone');
          email   := Leitor.rCampo(tcStr, 'email');

          if Leitor.rExtrai(3, 'enderNac') <> '' then
          begin
            enderNac.xLgr    := Leitor.rCampo(tcStr, 'xLgr');
            enderNac.nro     := Leitor.rCampo(tcStr, 'nro');
            enderNac.xCpl    := Leitor.rCampo(tcStr, 'xCpl');
            enderNac.xBairro := Leitor.rCampo(tcStr, 'xBairro');
            enderNac.cMun    := Leitor.rCampo(tcInt, 'cMun');
            enderNac.UF      := Leitor.rCampo(tcStr, 'UF');
            enderNac.CEP     := Leitor.rCampo(tcInt, 'CEP');
          end;

          if Leitor.rExtrai(3, 'enderExt') <> '' then
          begin
            enderExt.cPais     := Leitor.rCampo(tcStr, 'cPais');
            enderExt.xEnderExt := Leitor.rCampo(tcStr, 'xEnderExt');
          end;
        end;
      end;

      with valores do
      begin
        if Leitor.rExtrai(2, 'valores') <> '' then
        begin
          vCalcDR    := Leitor.rCampo(tcDe2, 'vCalcDR');
          pRedBCBM   := Leitor.rCampo(tcDe2, 'pRedBCBM');
          vCalcBM    := Leitor.rCampo(tcDe2, 'vCalcBM');
          vBC        := Leitor.rCampo(tcDe2, 'vBC');
          pAliqAplic := Leitor.rCampo(tcDe2, 'pAliqAplic');
          vISSQN     := Leitor.rCampo(tcDe2, 'vISSQN');
          vTotalRet  := Leitor.rCampo(tcDe2, 'vTotalRet');
          vLiq       := Leitor.rCampo(tcDe2, 'vLiq');
          xOutInf    := Leitor.rCampo(tcStr, 'xOutInf');
        end;
      end;

      with DPS do
      begin
        XmlDPS := Leitor.rExtrai(2, 'DPS');

        if XmlDPS <> '' then
        begin
          Leitor.Arquivo := XmlDPS;

          FDPS := TDPS.Create;
          FDPSRet := TDPSR.Create(FDPS);

          try
            Result := FDPSRet.LerXml;

            infDPS.Id := FDPSRet.DPS.infDPS.Id;

            Versao := FDPSRet.DPS.Versao;

            with DPS.infDPS do
            begin
              tpAmb    := FDPSRet.DPS.infDPS.tpAmb;
              dhEmi    := FDPSRet.DPS.infDPS.dhEmi;
              verAplic := FDPSRet.DPS.infDPS.verAplic;
              serie    := FDPSRet.DPS.infDPS.serie;
              nDPS     := FDPSRet.DPS.infDPS.nDPS;
              dCompet  := FDPSRet.DPS.infDPS.dCompet;
              tpEmit   := FDPSRet.DPS.infDPS.tpEmit;

              subst.chSubstda := FDPSRet.DPS.infDPS.subst.chSubstda;
              subst.cMotivo   := FDPSRet.DPS.infDPS.subst.cMotivo;
              subst.xMotivo   := FDPSRet.DPS.infDPS.subst.xMotivo;

              with prest do
              begin
                CNPJCPF := FDPSRet.DPS.infDPS.prest.CNPJCPF;
                NIF     := FDPSRet.DPS.infDPS.prest.NIF;
                IM      := FDPSRet.DPS.infDPS.prest.IM;
                xNome   := FDPSRet.DPS.infDPS.prest.xNome;
                fone    := FDPSRet.DPS.infDPS.prest.fone;
                email   := FDPSRet.DPS.infDPS.prest.email;

                enderNac.xLgr    := FDPSRet.DPS.infDPS.prest.enderNac.xLgr;
                enderNac.nro     := FDPSRet.DPS.infDPS.prest.enderNac.nro;
                enderNac.xCpl    := FDPSRet.DPS.infDPS.prest.enderNac.xCpl;
                enderNac.xBairro := FDPSRet.DPS.infDPS.prest.enderNac.xBairro;
                enderNac.cMun    := FDPSRet.DPS.infDPS.prest.enderNac.cMun;
                enderNac.UF      := FDPSRet.DPS.infDPS.prest.enderNac.UF;
                enderNac.CEP     := FDPSRet.DPS.infDPS.prest.enderNac.CEP;

                enderExt.cPais     := FDPSRet.DPS.infDPS.prest.enderExt.cPais;
                enderExt.xEnderExt := FDPSRet.DPS.infDPS.prest.enderExt.xEnderExt;
              end;

              with toma do
              begin
                CNPJCPF := FDPSRet.DPS.infDPS.toma.CNPJCPF;
                NIF     := FDPSRet.DPS.infDPS.toma.NIF;
                IM      := FDPSRet.DPS.infDPS.toma.IM;
                xNome   := FDPSRet.DPS.infDPS.toma.xNome;
                fone    := FDPSRet.DPS.infDPS.toma.fone;
                email   := FDPSRet.DPS.infDPS.toma.email;

                enderNac.xLgr    := FDPSRet.DPS.infDPS.toma.enderNac.xLgr;
                enderNac.nro     := FDPSRet.DPS.infDPS.toma.enderNac.nro;
                enderNac.xCpl    := FDPSRet.DPS.infDPS.toma.enderNac.xCpl;
                enderNac.xBairro := FDPSRet.DPS.infDPS.toma.enderNac.xBairro;
                enderNac.cMun    := FDPSRet.DPS.infDPS.toma.enderNac.cMun;
                enderNac.UF      := FDPSRet.DPS.infDPS.toma.enderNac.UF;
                enderNac.CEP     := FDPSRet.DPS.infDPS.toma.enderNac.CEP;

                enderExt.cPais     := FDPSRet.DPS.infDPS.toma.enderExt.cPais;
                enderExt.xEnderExt := FDPSRet.DPS.infDPS.toma.enderExt.xEnderExt;
              end;

              with interm do
              begin
                CNPJCPF := FDPSRet.DPS.infDPS.interm.CNPJCPF;
                NIF     := FDPSRet.DPS.infDPS.interm.NIF;
                IM      := FDPSRet.DPS.infDPS.interm.IM;
                xNome   := FDPSRet.DPS.infDPS.interm.xNome;
                fone    := FDPSRet.DPS.infDPS.interm.fone;
                email   := FDPSRet.DPS.infDPS.interm.email;

                enderNac.xLgr    := FDPSRet.DPS.infDPS.interm.enderNac.xLgr;
                enderNac.nro     := FDPSRet.DPS.infDPS.interm.enderNac.nro;
                enderNac.xCpl    := FDPSRet.DPS.infDPS.interm.enderNac.xCpl;
                enderNac.xBairro := FDPSRet.DPS.infDPS.interm.enderNac.xBairro;
                enderNac.cMun    := FDPSRet.DPS.infDPS.interm.enderNac.cMun;
                enderNac.UF      := FDPSRet.DPS.infDPS.interm.enderNac.UF;
                enderNac.CEP     := FDPSRet.DPS.infDPS.interm.enderNac.CEP;

                enderExt.cPais     := FDPSRet.DPS.infDPS.interm.enderExt.cPais;
                enderExt.xEnderExt := FDPSRet.DPS.infDPS.interm.enderExt.xEnderExt;
              end;

              with serv do
              begin
                cMunPrestacao  := FDPSRet.DPS.infDPS.serv.cMunPrestacao;
                cPaisPrestacao := FDPSRet.DPS.infDPS.serv.cPaisPrestacao;
                cTribNac       := FDPSRet.DPS.infDPS.serv.cTribNac;
                cTribMun       := FDPSRet.DPS.infDPS.serv.cTribMun;
                xDescServ      := FDPSRet.DPS.infDPS.serv.xDescServ;
                cNBS           := FDPSRet.DPS.infDPS.serv.cNBS;
                vReceb         := FDPSRet.DPS.infDPS.serv.vReceb;
                vServ          := FDPSRet.DPS.infDPS.serv.vServ;
                vDescIncond    := FDPSRet.DPS.infDPS.serv.vDescIncond;
                vDescCond      := FDPSRet.DPS.infDPS.serv.vDescCond;
                idDocTec       := FDPSRet.DPS.infDPS.serv.idDocTec;
                docRef         := FDPSRet.DPS.infDPS.serv.docRef;
                xInfComp       := FDPSRet.DPS.infDPS.serv.xInfComp;

                comExt.dtIniPrest  := FDPSRet.DPS.infDPS.serv.comExt.dtIniPrest;
                comExt.dtFimPrest  := FDPSRet.DPS.infDPS.serv.comExt.dtFimPrest;
                comExt.mdPrestacao := FDPSRet.DPS.infDPS.serv.comExt.mdPrestacao;
                comExt.tpMoeda     := FDPSRet.DPS.infDPS.serv.comExt.tpMoeda;
                comExt.vServMoeda  := FDPSRet.DPS.infDPS.serv.comExt.vServMoeda;
                comExt.enquadRVS   := FDPSRet.DPS.infDPS.serv.comExt.enquadRVS;
                comExt.enquadRPC   := FDPSRet.DPS.infDPS.serv.comExt.enquadRPC;
                comExt.movTempBens := FDPSRet.DPS.infDPS.serv.comExt.movTempBens;
                comExt.nDI         := FDPSRet.DPS.infDPS.serv.comExt.nDI;
                comExt.nRE         := FDPSRet.DPS.infDPS.serv.comExt.nRE;
                comExt.mdic        := FDPSRet.DPS.infDPS.serv.comExt.mdic;

                pedagio.placa   := FDPSRet.DPS.infDPS.serv.pedagio.placa;
                pedagio.nEixos  := FDPSRet.DPS.infDPS.serv.pedagio.nEixos;
                pedagio.sentido := FDPSRet.DPS.infDPS.serv.pedagio.sentido;

                atvEvento.desc  := FDPSRet.DPS.infDPS.serv.atvEvento.desc;
                atvEvento.dtIni := FDPSRet.DPS.infDPS.serv.atvEvento.dtIni;
                atvEvento.dtFim := FDPSRet.DPS.infDPS.serv.atvEvento.dtFim;
                atvEvento.id    := FDPSRet.DPS.infDPS.serv.atvEvento.id;

                atvEvento.ender.xLgr    := FDPSRet.DPS.infDPS.serv.atvEvento.ender.xLgr;
                atvEvento.ender.nro     := FDPSRet.DPS.infDPS.serv.atvEvento.ender.nro;
                atvEvento.ender.xCpl    := FDPSRet.DPS.infDPS.serv.atvEvento.ender.xCpl;
                atvEvento.ender.xBairro := FDPSRet.DPS.infDPS.serv.atvEvento.ender.xBairro;
                atvEvento.ender.cMun    := FDPSRet.DPS.infDPS.serv.atvEvento.ender.cMun;
                atvEvento.ender.UF      := FDPSRet.DPS.infDPS.serv.atvEvento.ender.UF;
                atvEvento.ender.CEP     := FDPSRet.DPS.infDPS.serv.atvEvento.ender.CEP;

                obra.cObra        := FDPSRet.DPS.infDPS.serv.obra.cObra;
                obra.inscImobFisc := FDPSRet.DPS.infDPS.serv.obra.inscImobFisc;

                obra.ender.xLgr    := FDPSRet.DPS.infDPS.serv.obra.ender.xLgr;
                obra.ender.nro     := FDPSRet.DPS.infDPS.serv.obra.ender.nro;
                obra.ender.xCpl    := FDPSRet.DPS.infDPS.serv.obra.ender.xCpl;
                obra.ender.xBairro := FDPSRet.DPS.infDPS.serv.obra.ender.xBairro;
                obra.ender.cMun    := FDPSRet.DPS.infDPS.serv.obra.ender.cMun;
                obra.ender.UF      := FDPSRet.DPS.infDPS.serv.obra.ender.UF;
                obra.ender.CEP     := FDPSRet.DPS.infDPS.serv.obra.ender.CEP;

                dedRed.vDR := FDPSRet.DPS.infDPS.serv.dedRed.vDR;
                dedRed.vDR := FDPSRet.DPS.infDPS.serv.dedRed.vDR;

                with dedRed do
                begin
                  if FDPSRet.DPS.infDPS.serv.dedRed.documento.Count > 0 then
                  begin
                    documento.Clear;
                    for i := 0 to FDPSRet.DPS.infDPS.serv.dedRed.documento.Count -1 do
                    begin
                      documento.New;
                      documento[i].chNFSe     := FDPSRet.DPS.infDPS.serv.dedRed.documento[i].chNFSe;
                      documento[i].chNFe      := FDPSRet.DPS.infDPS.serv.dedRed.documento[i].chNFe;
                      documento[i].outDocFisc := FDPSRet.DPS.infDPS.serv.dedRed.documento[i].outDocFisc;
                      documento[i].outDoc     := FDPSRet.DPS.infDPS.serv.dedRed.documento[i].outDoc;
                      documento[i].tipo       := FDPSRet.DPS.infDPS.serv.dedRed.documento[i].tipo;
                      documento[i].xDescOut   := FDPSRet.DPS.infDPS.serv.dedRed.documento[i].xDescOut;
                      documento[i].dEmiDoc    := FDPSRet.DPS.infDPS.serv.dedRed.documento[i].dEmiDoc;

                      documento[i].vDedutivelRedutivel := FDPSRet.DPS.infDPS.serv.dedRed.documento[i].vDedutivelRedutivel;
                      documento[i].vDeducaoReducao     := FDPSRet.DPS.infDPS.serv.dedRed.documento[i].vDeducaoReducao;

                      documento[i].outNotaeMun.cMunNota := FDPSRet.DPS.infDPS.serv.dedRed.documento[i].outNotaeMun.cMunNota;
                      documento[i].outNotaeMun.nNota    := FDPSRet.DPS.infDPS.serv.dedRed.documento[i].outNotaeMun.nNota;
                      documento[i].outNotaeMun.cvNota   := FDPSRet.DPS.infDPS.serv.dedRed.documento[i].outNotaeMun.cvNota;

                      documento[i].NFNFS.nNFS     := FDPSRet.DPS.infDPS.serv.dedRed.documento[i].NFNFS.nNFS;
                      documento[i].NFNFS.modNFS   := FDPSRet.DPS.infDPS.serv.dedRed.documento[i].NFNFS.modNFS;
                      documento[i].NFNFS.serieNFS := FDPSRet.DPS.infDPS.serv.dedRed.documento[i].NFNFS.serieNFS;

                      with documento[i].forne do
                      begin
                        CNPJCPF := FDPSRet.DPS.infDPS.serv.dedRed.documento[i].forne.CNPJCPF;
                        NIF     := FDPSRet.DPS.infDPS.serv.dedRed.documento[i].forne.NIF;
                        IM      := FDPSRet.DPS.infDPS.serv.dedRed.documento[i].forne.IM;
                        xNome   := FDPSRet.DPS.infDPS.serv.dedRed.documento[i].forne.xNome;
                        fone    := FDPSRet.DPS.infDPS.serv.dedRed.documento[i].forne.fone;
                        email   := FDPSRet.DPS.infDPS.serv.dedRed.documento[i].forne.email;

                        enderNac.xLgr    := FDPSRet.DPS.infDPS.serv.dedRed.documento[i].forne.enderNac.xLgr;
                        enderNac.nro     := FDPSRet.DPS.infDPS.serv.dedRed.documento[i].forne.enderNac.nro;
                        enderNac.xCpl    := FDPSRet.DPS.infDPS.serv.dedRed.documento[i].forne.enderNac.xCpl;
                        enderNac.xBairro := FDPSRet.DPS.infDPS.serv.dedRed.documento[i].forne.enderNac.xBairro;
                        enderNac.cMun    := FDPSRet.DPS.infDPS.serv.dedRed.documento[i].forne.enderNac.cMun;
                        enderNac.UF      := FDPSRet.DPS.infDPS.serv.dedRed.documento[i].forne.enderNac.UF;
                        enderNac.CEP     := FDPSRet.DPS.infDPS.serv.dedRed.documento[i].forne.enderNac.CEP;

                        enderExt.cPais     := FDPSRet.DPS.infDPS.serv.dedRed.documento[i].forne.enderExt.cPais;
                        enderExt.xEnderExt := FDPSRet.DPS.infDPS.serv.dedRed.documento[i].forne.enderExt.xEnderExt;

                      end;
                    end;
                  end;
                end;
              end;

              with trib do
              begin
                opSimpNac    := FDPSRet.DPS.infDPS.trib.opSimpNac;
                opLimMEI     := FDPSRet.DPS.infDPS.trib.opLimMEI;
                opLimSimpNac := FDPSRet.DPS.infDPS.trib.opLimSimpNac;

                issqn.regEspTrib  := FDPSRet.DPS.infDPS.trib.issqn.regEspTrib;
                issqn.exigISSQN   := FDPSRet.DPS.infDPS.trib.issqn.exigISSQN;
                issqn.nBMIsenc    := FDPSRet.DPS.infDPS.trib.issqn.nBMIsenc;
                issqn.vInfoBM     := FDPSRet.DPS.infDPS.trib.issqn.vInfoBM;
                issqn.nProcesso   := FDPSRet.DPS.infDPS.trib.issqn.nProcesso;
                issqn.tpImunidade := FDPSRet.DPS.infDPS.trib.issqn.tpImunidade;
                issqn.pAliq       := FDPSRet.DPS.infDPS.trib.issqn.pAliq;
                issqn.tpRetISSQN  := FDPSRet.DPS.infDPS.trib.issqn.tpRetISSQN;

                outros.vRetCP   := FDPSRet.DPS.infDPS.trib.outros.vRetCP;
                outros.vRetIRRF := FDPSRet.DPS.infDPS.trib.outros.vRetIRRF;
                outros.vRetCSLL := FDPSRet.DPS.infDPS.trib.outros.vRetCSLL;

                outros.piscofins.CST          := FDPSRet.DPS.infDPS.trib.outros.piscofins.CST;
                outros.piscofins.vBCPisCofins := FDPSRet.DPS.infDPS.trib.outros.piscofins.vBCPisCofins;
                outros.piscofins.pAliqPis     := FDPSRet.DPS.infDPS.trib.outros.piscofins.pAliqPis;
                outros.piscofins.pAliqCofins  := FDPSRet.DPS.infDPS.trib.outros.piscofins.pAliqCofins;
                outros.piscofins.vPis         := FDPSRet.DPS.infDPS.trib.outros.piscofins.vPis;
                outros.piscofins.vCofins      := FDPSRet.DPS.infDPS.trib.outros.piscofins.vCofins;

                outros.piscofins.tpRetPisCofins := FDPSRet.DPS.infDPS.trib.outros.piscofins.tpRetPisCofins;

                totTrib.indTotTrib := FDPSRet.DPS.infDPS.trib.totTrib.indTotTrib;
                totTrib.pTotTribSN := FDPSRet.DPS.infDPS.trib.totTrib.pTotTribSN;

                totTrib.vTotTrib.vTotTribFed := FDPSRet.DPS.infDPS.trib.totTrib.vTotTrib.vTotTribFed;
                totTrib.vTotTrib.vTotTribEst := FDPSRet.DPS.infDPS.trib.totTrib.vTotTrib.vTotTribEst;
                totTrib.vTotTrib.vTotTribMun := FDPSRet.DPS.infDPS.trib.totTrib.vTotTrib.vTotTribMun;

                totTrib.pTotTrib.pTotTribFed := FDPSRet.DPS.infDPS.trib.totTrib.pTotTrib.pTotTribFed;
                totTrib.pTotTrib.pTotTribEst := FDPSRet.DPS.infDPS.trib.totTrib.pTotTrib.pTotTribEst;
                totTrib.pTotTrib.pTotTribMun := FDPSRet.DPS.infDPS.trib.totTrib.pTotTrib.pTotTribMun;
              end;
            end;

            Signature.URI             := FDPSRet.DPS.Signature.URI;
            Signature.DigestValue     := FDPSRet.DPS.Signature.DigestValue;
            Signature.SignatureValue  := FDPSRet.DPS.Signature.SignatureValue;
            Signature.X509Certificate := FDPSRet.DPS.Signature.X509Certificate;
          finally
            FDPSRet.Free;
           end;
        end;
      end;
    end;
  end;

  leitor.Grupo := XmlNFSe;

  NFSe.Signature.URI             := Leitor.rAtributo('Reference URI=');
  NFSe.Signature.DigestValue     := Leitor.rCampo(tcStr, 'DigestValue');
  NFSe.Signature.SignatureValue  := Leitor.rCampo(tcStr, 'SignatureValue');
  NFSe.Signature.X509Certificate := Leitor.rCampo(tcStr, 'X509Certificate');

  Result := true;
end;

end.

