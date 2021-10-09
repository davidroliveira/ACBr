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

unit pcnEnvEventoDPS;

interface

uses
  SysUtils, Classes,
  pcnConversao, pcnGerador, pcnConsts,
  pcnEventoDPS, pcnDPSConsts, pcnSignature;

type
  { TEventoDPS }

  TEventoDPS = class(TObject)
  private
    FGerador: TGerador;
    FidLote: Integer;
    FEvento: TInfEvento;
    FVersao: String;
    FSignature: TSignature;

    function GerarChaveDPS(AChave, ACNPJCPF: string; ANumPedido: Integer): String;
    function ValidarChaveNFSe(AChave: string): Boolean;
  public
    constructor Create;
    destructor Destroy; override;

    function GerarXML: Boolean;
    function LerXML(const CaminhoArquivo: String): Boolean;
    function LerXMLFromString(const AXML: String): Boolean;
    function LerFromIni(const AIniString: String): Boolean;

    property Gerador: TGerador     read FGerador   write FGerador;
    property idLote: Integer       read FidLote    write FidLote;
    property Evento: TInfEvento    read FEvento    write FEvento;
    property Versao: String        read FVersao    write FVersao;
    property Signature: TSignature read FSignature write FSignature;
  end;

implementation

uses
  IniFiles,
  pcnAuxiliar, pcnRetEnvEventoDPS, pcnConversaoDPS,
  ACBrUtil, ACBrDFeUtil;

{ TEventoDPS }

constructor TEventoDPS.Create;
begin
  inherited Create;

  FGerador := TGerador.Create;
  FEvento  := TInfEvento.Create;
  FSignature := TSignature.Create;
end;

destructor TEventoDPS.Destroy;
begin
  FGerador.Free;
  FEvento.Free;
  FSignature.Free;

  inherited;
end;

function TEventoDPS.GerarChaveDPS(AChave, ACNPJCPF: string;
  ANumPedido: Integer): String;
var
  vNumPed, vCNPJ, tpInsc: String;
begin
  {
  A regra de formação do identificador de 44 posições da DPS é:
  "ID" + Chave (50) + Tipo de Inscrição Federal (1) +
  Inscrição Federal (14 - CPF completar com 000 à esquerda) +
  Numero do Pedido (5)
  }
  vCNPJ := OnlyNumber(ACNPJCPF);

  if Length(vCNPJ) = 11 then
    tpInsc := '2'
  else
    tpInsc := '1';

  vCNPJ   := PadLeft(vCNPJ, 14, '0');
  vNumPed := Poem_Zeros(ANumPedido, 3);

  Result := AChave + tpInsc + vCNPJ + vNumPed;
end;

function TEventoDPS.ValidarChaveNFSe(AChave: string): Boolean;
begin
  Result := True;
end;

function TEventoDPS.GerarXML: Boolean;
var
  i: Integer;
  chave, sDoc: String;
begin
  Gerador.ArquivoFormatoXML := '';

  Gerador.wGrupo('pedRegEvento versao="' + Versao + '" ' + NAME_SPACE_DPS);

  chave := GerarChaveDPS(Evento.chNFSe,
                         Evento.CNPJCPF,
                         Evento.nPedRegEvento);

  Evento.Id := 'ID' + chave;

  if Length(Evento.Id) < 70 then
    Gerador.wAlerta('004', 'Id', '', 'Id do Evento inválido');

  Gerador.wGrupo('infPedReg Id="' + Evento.Id + '"');

  Gerador.wCampo(tcStr, '005', 'tpAmb   ', 01, 01, 1, TpAmbToStr(Evento.tpAmb), DSC_TPAMB);
  Gerador.wCampo(tcStr, '006', 'verAplic', 01, 20, 1, Evento.verAplic, DSC_VERAPLIC);
  Gerador.wCampo(tcStr, '007', 'dhEvento', 01, 50, 1, FormatDateTime('yyyy-mm-dd"T"hh:nn:ss', Evento.dhEvento) +
                                                           GetUTC(CodigoParaUF(Evento.cOrgao), Evento.dhEvento));

  sDoc := OnlyNumber(Evento.CNPJCPF);

  case Length( sDoc ) of
    14: begin
          Gerador.wCampo(tcStr, '008', 'CNPJAutor', 14, 14, 1, sDoc , DSC_CNPJ);

          if not ValidarCNPJ( sDoc ) then
            Gerador.wAlerta('008', 'CNPJAutor', DSC_CNPJ, ERR_MSG_INVALIDO);
        end;
    11: begin
          Gerador.wCampo(tcStr, '009', 'CPFAutor', 11, 11, 1, sDoc, DSC_CPF);

          if not ValidarCPF( sDoc ) then
            Gerador.wAlerta('009', 'CPFAutor', DSC_CPF, ERR_MSG_INVALIDO);
        end;
  end;

  Gerador.wCampo(tcStr, '010', 'chNFSe', 50, 50, 1, Evento.chNFSe, DSC_CHAVE);

  if not ValidarChaveNFSe(Evento.chNFSe) then
    Gerador.wAlerta('010', 'chNFSe', '', 'Chave de DPS inválida');

  Gerador.wCampo(tcInt, '011', 'nPedRegEvento', 03, 03, 1, Evento.nPedRegEvento);

  case Evento.tpEvento of
    teCancelamento:
      begin
        Gerador.wGrupo('e11101', '012');
        Gerador.wCampo(tcStr, '013', 'xDesc  ', 05, 060, 1, 'Cancelamento de NFS-e');
        Gerador.wCampo(tcStr, '014', 'cMotivo', 01, 001, 1, cJustCancToStr(Evento.detEvento.cJustCanc));
        Gerador.wCampo(tcStr, '015', 'xMotivo', 15, 255, 1, Evento.detEvento.xMotivo);
        Gerador.wGrupo('/e11101');
      end;

    teCancSubst:
      begin
        Gerador.wGrupo('e12102', '016');
        Gerador.wCampo(tcStr, '017', 'xDesc  ', 05, 060, 1, 'Cancelamento de NFS-e por Substituicao');
        Gerador.wCampo(tcStr, '018', 'cMotivo', 01, 001, 1, cMotivoToStr(Evento.detEvento.cMotivo));
        Gerador.wCampo(tcStr, '019', 'xMotivo', 15, 255, 1, Evento.detEvento.xMotivo);
        Gerador.wCampo(tcStr, '020', 'chSubstituta', 50, 50, 1, Evento.detEvento.chSubstituta, DSC_CHAVE);

        if not ValidarChaveNFSe(Evento.detEvento.chSubstituta) then
          Gerador.wAlerta('020', 'chSubstituta', '', 'Chave de DPS inválida');

        Gerador.wGrupo('/e12102');
      end;
  end;

  Gerador.wGrupo('/infPedReg');

  Gerador.wGrupo('/pedRegEvento');

  Result := (Gerador.ListaDeAlertas.Count = 0);
end;

function TEventoDPS.LerXML(const CaminhoArquivo: String): Boolean;
var
  ArqEvento    : TStringList;
begin
  ArqEvento := TStringList.Create;
  try
     ArqEvento.LoadFromFile(CaminhoArquivo);
     Result := LerXMLFromString(ArqEvento.Text);
  finally
     ArqEvento.Free;
  end;
end;

function TEventoDPS.LerXMLFromString(const AXML: String): Boolean;
var
  RetEventoDPS: TRetEventoDPS;
begin
  RetEventoDPS := TRetEventoDPS.Create;
  try
    RetEventoDPS.Leitor.Arquivo := AXML;
    Result := RetEventoDPS.LerXml;
    with FEvento do
    begin
      Id            := RetEventoDPS.pedRegEvento.Id;
      tpAmb         := RetEventoDPS.pedRegEvento.tpAmb;
      verAplic      := RetEventoDPS.pedRegEvento.verAplic;
      dhEvento      := RetEventoDPS.pedRegEvento.dhEvento;
      CNPJCPF       := RetEventoDPS.pedRegEvento.CNPJCPF;
      chNFSe        := RetEventoDPS.pedRegEvento.chNFSe;
      nPedRegEvento := RetEventoDPS.pedRegEvento.nPedRegEvento;

      detEvento.xDesc        := RetEventoDPS.pedRegEvento.detEvento.xDesc;
      detEvento.cJustCanc    := RetEventoDPS.pedRegEvento.detEvento.cJustCanc;
      detEvento.cMotivo      := RetEventoDPS.pedRegEvento.detEvento.cMotivo;
      detEvento.xMotivo      := RetEventoDPS.pedRegEvento.detEvento.xMotivo;
      detEvento.chSubstituta := RetEventoDPS.pedRegEvento.detEvento.chSubstituta;

      Signature.URI             := RetEventoDPS.Signature.URI;
      Signature.DigestValue     := RetEventoDPS.Signature.DigestValue;
      Signature.SignatureValue  := RetEventoDPS.Signature.SignatureValue;
      Signature.X509Certificate := RetEventoDPS.Signature.X509Certificate;
    end;
  finally
     RetEventoDPS.Free;
  end;
end;

function TEventoDPS.LerFromIni(const AIniString: String): Boolean;
var
  INIRec: TMemIniFile;
  sSecao, sFim: String;
  ok: Boolean;
  I: Integer;
begin
  Result := False;
//  Self.Evento.Clear;
  (*
  INIRec := TMemIniFile.Create('');
  try
    LerIniArquivoOuString(AIniString, INIRec);

    idLote := INIRec.ReadInteger('EVENTO', 'idLote', 0);

    I := 1;
    while true do
    begin
      sSecao := 'EVENTO'+IntToStrZero(I,3);
      sFim   := INIRec.ReadString(sSecao, 'chCTe', 'FIM');
      if (sFim = 'FIM') or (Length(sFim) <= 0) then
        break;

      with Self.Evento.Add do
      begin
        infEvento.chDPS              := INIRec.ReadString(sSecao, 'chDPS', '');
        infEvento.cOrgao             := INIRec.ReadInteger(sSecao, 'cOrgao', 0);
        infEvento.CNPJ               := INIRec.ReadString(sSecao, 'CNPJ', '');
        infEvento.dhEvento           := StringToDateTime(INIRec.ReadString(sSecao, 'dhEvento', ''));
        infEvento.tpEvento           := StrToTpEvento(ok,INIRec.ReadString(sSecao, 'tpEvento', ''));
        infEvento.nSeqEvento         := INIRec.ReadInteger(sSecao, 'nSeqEvento', 1);
        infEvento.detEvento.xCondUso := '';
        infEvento.detEvento.xJust    := INIRec.ReadString(sSecao, 'xJust', '');
        infEvento.detEvento.nProt    := INIRec.ReadString(sSecao, 'nProt', '');
      end;
      Inc(I);
    end;

    Result := True;
  finally
     INIRec.Free;
  end;
  *)
end;

end.
