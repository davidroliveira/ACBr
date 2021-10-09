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

unit plmcLMCR;

interface

uses
  SysUtils, Classes,
{$IFNDEF VER130}
  Variants,
{$ENDIF}
  pcnAuxiliar, pcnConversao, pcnLeitor,
  plmcConversao, plmcLMC, ACBrUtil;

type

  TLMCR = class(TPersistent)
  private
    FLeitor: TLeitor;
    FLMC: TLMC;
  public
    constructor Create(AOwner: TLMC);
    destructor Destroy; override;
    function LerXml: Boolean;
  published
    property Leitor: TLeitor read FLeitor write FLeitor;
    property LMC: TLMC       read FLMC    write FLMC;
  end;

implementation

{ TLMCR }

constructor TLMCR.Create(AOwner: TLMC);
begin
  FLeitor := TLeitor.Create;
  FLMC := AOwner;
end;

destructor TLMCR.Destroy;
begin
  FLeitor.Free;
  inherited Destroy;
end;

function TLMCR.LerXml: Boolean;
var
  ok: Boolean;
  {i, j,} i01, i02, i03, i04, i05: Integer;
begin
  Leitor.Grupo := Leitor.Arquivo;

  LMC.infLMC.ID := Leitor.rAtributo('Id=');
  if OnlyNumber(LMC.infLMC.ID) = '' then
    raise Exception.Create('Não encontrei o atributo: Id');

  if Leitor.rExtrai(1, 'infLivroCombustivel') <> '' then
  begin
    LMC.infLMC.tpAmb       := StrToTpAmb(ok, Leitor.rCampo(tcStr, 'tpAmb'));
    LMC.infLMC.cNumerico   := Leitor.rCampo(tcStr, 'cNumerico');
    LMC.infLMC.cDV         := Leitor.rCampo(tcInt, 'cDV');

    if Leitor.rExtrai(2, 'emit') <> '' then
    begin
      LMC.infLMC.emit.IE    := Leitor.rCampo(tcStr, 'IE');
      LMC.infLMC.emit.CNPJ  := Leitor.rCampo(tcStr, 'CNPJ');
      LMC.infLMC.emit.xNome := Leitor.rCampo(tcStr, 'xNome');
    end;

    if Leitor.rExtrai(2, 'movimento') <> '' then
    begin
      LMC.infLMC.movimento.dEmissao := Leitor.rCampo(tcDat, 'dEmissao');

      i01 := 0;
      while Leitor.rExtrai(3, 'infMovimento', '', i01 + 1) <> '' do
      begin
        LMC.infLMC.movimento.infMovimento.Add;
        LMC.infLMC.movimento.infMovimento[i01].nrProduto := StrToidProduto(Ok, Leitor.rAtributo('nrProduto='));
        LMC.infLMC.movimento.infMovimento[i01].volEstoqueAbertura := Leitor.rCampo(tcDe3, 'volEstoqueAbertura');
        
        LMC.infLMC.movimento.infMovimento[i01].volEstoqueFechamento := Leitor.rCampo(tcDe3, 'volEstoqueFechamento');
        LMC.infLMC.movimento.infMovimento[i01].valVendasDiaBomba := Leitor.rCampo(tcDe2, 'valVendasDiaBomba');
        LMC.infLMC.movimento.infMovimento[i01].valAcumuladoMes := Leitor.rCampo(tcDe2, 'valAcumuladoMes');
        LMC.infLMC.movimento.infMovimento[i01].observacoes := Leitor.rCampo(tcStr, 'observacoes');

        i02 := 0;
        while Leitor.rExtrai(4, 'volumeRecebido', '', i02 + 1) <> '' do
        begin
          LMC.infLMC.movimento.infMovimento[i01].volumeRecebido.Add;
          LMC.infLMC.movimento.infMovimento[i01].volumeRecebido[i02].CNPJ := Leitor.rCampo(tcStr, 'CNPJ');
          LMC.infLMC.movimento.infMovimento[i01].volumeRecebido[i02].nNF := Leitor.rCampo(tcInt, 'nNF');
          LMC.infLMC.movimento.infMovimento[i01].volumeRecebido[i02].dNF := Leitor.rCampo(tcDat, 'dNF');
          LMC.infLMC.movimento.infMovimento[i01].volumeRecebido[i02].volVolume := Leitor.rCampo(tcDe3, 'volVolume');
          LMC.infLMC.movimento.infMovimento[i01].volumeRecebido[i02].xTanque := Leitor.rCampo(tcStr, 'xTanque');
          inc(i02);
        end;

        i02 := 0;
        while Leitor.rExtrai(4, 'volumeVendido', '', i02 + 1) <> '' do
        begin
          LMC.infLMC.movimento.infMovimento[i01].volumeVendido.Add;
          LMC.infLMC.movimento.infMovimento[i01].volumeVendido[i02].xTanque := Leitor.rCampo(tcStr, 'xTanque');
          LMC.infLMC.movimento.infMovimento[i01].volumeVendido[i02].nrBico := Leitor.rCampo(tcInt, 'nrBico');
          LMC.infLMC.movimento.infMovimento[i01].volumeVendido[i02].volFechamento := Leitor.rCampo(tcDe3, 'volFechamento');
          LMC.infLMC.movimento.infMovimento[i01].volumeVendido[i02].volAbertura := Leitor.rCampo(tcDe3, 'volAbertura');
          LMC.infLMC.movimento.infMovimento[i01].volumeVendido[i02].volAfericoes := Leitor.rCampo(tcDe3, 'volAfericoes');
          inc(i02);
        end;

        inc(i01);
      end;

    end;
  end;

  (* Grupo da TAG <signature> *************************************************)

  leitor.Grupo := Leitor.Arquivo;

  LMC.signature.URI             := Leitor.rAtributo('Reference URI=');
  LMC.signature.DigestValue     := Leitor.rCampo(tcStr, 'DigestValue');
  LMC.signature.SignatureValue  := Leitor.rCampo(tcStr, 'SignatureValue');
  LMC.signature.X509Certificate := Leitor.rCampo(tcStr, 'X509Certificate');

  (* Grupo da TAG <protLivroCombustivel> **************************************)
  if Leitor.rExtrai(1, 'protLivroCombustivel') <> '' then
  begin
    LMC.procLMC.tpAmb    := StrToTpAmb(ok, Leitor.rCampo(tcStr, 'tpAmb'));
    LMC.procLMC.verAplic := Leitor.rCampo(tcStr, 'verAplic');
    LMC.procLMC.chLMC    := Leitor.rCampo(tcStr, 'chLMC');
    LMC.procLMC.dhRecbto := Leitor.rCampo(tcDatHor, 'dhRecbto');
    LMC.procLMC.nProt    := Leitor.rCampo(tcStr, 'nProt');
    LMC.procLMC.digVal   := Leitor.rCampo(tcStr, 'digVal');
    LMC.procLMC.cStat    := Leitor.rCampo(tcInt, 'cStat');
    LMC.procLMC.xMotivo  := Leitor.rCampo(tcStr, 'xMotivo');
  end;

  Result := True;
end;

end.

