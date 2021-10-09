{ **************************************************************************** }
{ Projeto: Componentes ACBr                                                    }
{ Biblioteca multiplataforma de componentes Delphi para intera��o com equipa-  }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2009 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:   Italo Jurisato Junior                         }
{                                                                              }
{ Voc� pode obter a �ltima vers�o desse arquivo na pagina do  Projeto ACBr     }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{ Esta biblioteca � software livre; voc� pode redistribu�-la e/ou modific�-la  }
{ sob os termos da Licen�a P�blica Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a vers�o 2.1 da Licen�a, ou (a seu crit�rio) }
{ qualquer vers�o posterior.                                                   }
{                                                                              }
{ Esta biblioteca � distribu�da na expectativa de que seja �til, por�m, SEM    }
{ NENHUMA GARANTIA; nem mesmo a garantia impl�cita de COMERCIABILIDADE OU      }
{ ADEQUA��O A UMA FINALIDADE ESPEC�FICA. Consulte a Licen�a P�blica Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICEN�A.TXT ou LICENSE.TXT)              }
{                                                                              }
{ Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral Menor do GNU junto }
{ com esta biblioteca; se n�o, escreva para a Free Software Foundation, Inc.,  }
{ no endere�o 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Voc� tamb�m pode obter uma copia da licen�a em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Sim�es de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{ Pra�a Anita Costa, 34 - Tatu� - SP - 18270-410                               }
{                                                                              }
{ **************************************************************************** }

{*******************************************************************************
|* Historico
|*
|* 20/06/2017: Italo Jurisato Junior
|*  - Doa��o do componente para o Projeto ACBr
*******************************************************************************}

{$I ACBr.inc}

unit pcnRetEnvEventoDPS;

interface

uses
  SysUtils, Classes,
  pcnConversao, pcnLeitor, pcnConversaoDPS, pcnEventoDPS, pcnSignature;

type
  { TRetEventoDPS }

  TRetEventoDPS = class(TObject)
  private
    FLeitor: TLeitor;
    FId: String;
    FnSeqEvento: Integer;
    FverAplic: String;
    FambGer: TAmbienteGerador;
    FcStat: Integer;
    FxMotivo: string;
    FdhProc: TDateTime;
    FpedRegEvento: TInfEvento;
    FSignature: Tsignature;
    FXML: string;
  public
    constructor Create;
    destructor Destroy; override;
    function LerXml: Boolean;

    property Leitor: TLeitor          read FLeitor       write FLeitor;
    property Id: string               read FId           write FId;
    property nSeqEvento: Integer      read FnSeqEvento   write FnSeqEvento;
    property verAplic: String         read FverAplic     write FverAplic;
    property ambGer: TAmbienteGerador read FambGer       write FambGer;
    property cStat: Integer           read FcStat        write FcStat;
    property xMotivo: string          read FxMotivo      write FxMotivo;
    property dhProc: TDateTime        read FdhProc       write FdhProc;
    property pedRegEvento: TInfEvento read FpedRegEvento write FpedRegEvento;
    property Signature: TSignature    read FSignature    write FSignature;
    property XML: string              read FXML          write FXML;
  end;

implementation

{ TRetEventoDPS }

constructor TRetEventoDPS.Create;
begin
  FLeitor := TLeitor.Create;
  FpedRegEvento := TInfEvento.Create;
  FSignature := TSignature.Create;
end;

destructor TRetEventoDPS.Destroy;
begin
  FLeitor.Free;
  FpedRegEvento.Free;
  Fsignature.Free;

  inherited;
end;

function TRetEventoDPS.LerXml: Boolean;
var
  ok: Boolean;
begin
  try
    XML := Leitor.Arquivo;

    if (Leitor.rExtrai(1, 'evento') <> '') then
    begin
      Id         := Leitor.rAtributo('Id', 'evento');
      nSeqEvento := Leitor.rCampo(tcInt, 'nSeqEvento');
      verAplic   := Leitor.rCampo(tcStr, 'verAplic');
      ambGer     := StrToAmbienteGerador(ok, Leitor.rCampo(tcStr, 'ambGer'));
      cStat      := Leitor.rCampo(tcInt, 'cStat');
      xMotivo    := cStatToxMotivo(cStat);
      dhProc     := Leitor.rCampo(tcDatHor, 'dhProc');

      if Leitor.rExtrai(2, 'pedRegEvento') <> '' then
      begin
        pedRegEvento.Id       := Leitor.rAtributo('Id', 'pedRegEvento');
        pedRegEvento.tpAmb    := StrToTpAmb(ok, Leitor.rCampo(tcStr, 'tpAmb'));
        pedRegEvento.verAplic := Leitor.rCampo(tcStr, 'verAplic');
        pedRegEvento.dhEvento := Leitor.rCampo(tcDatHor, 'dhEvento');
        pedRegEvento.CNPJCPF  := Leitor.rCampo(tcStr, 'CNPJAutor');

        if pedRegEvento.CNPJCPF = '' then
          pedRegEvento.CNPJCPF := Leitor.rCampo(tcStr, 'CPFAutor');

        pedRegEvento.chNFSe        := Leitor.rCampo(tcStr, 'chNFSe');
        pedRegEvento.nPedRegEvento := Leitor.rCampo(tcInt, 'nPedRegEvento');

        if Leitor.rExtrai(3, 'e11101') <> '' then
        begin
          pedRegEvento.detEvento.xDesc     := Leitor.rCampo(tcStr, 'xDesc');
          pedRegEvento.detEvento.cJustCanc := StrTocJustCanc(ok, Leitor.rCampo(tcStr, 'cJustCanc'));
          pedRegEvento.detEvento.xMotivo   := Leitor.rCampo(tcStr, 'xMotivo');
        end;

        if Leitor.rExtrai(3, 'e12102') <> '' then
        begin
          pedRegEvento.detEvento.xDesc        := Leitor.rCampo(tcStr, 'xDesc');
          pedRegEvento.detEvento.cMotivo      := StrTocMotivo(ok, Leitor.rCampo(tcStr, 'cMotivo'));
          pedRegEvento.detEvento.xMotivo      := Leitor.rCampo(tcStr, 'xMotivo');
          pedRegEvento.detEvento.chSubstituta := Leitor.rCampo(tcStr, 'chSubstituta');
        end;
      end;

      if Leitor.rExtrai(2, 'Signature') <> '' then
      begin
        signature.URI             := Leitor.rAtributo('Reference URI=');
        signature.DigestValue     := Leitor.rCampo(tcStr, 'DigestValue');
        signature.SignatureValue  := Leitor.rCampo(tcStr, 'SignatureValue');
        signature.X509Certificate := Leitor.rCampo(tcStr, 'X509Certificate');
      end;

      Result := True;
    end;
  except
    Result := False;
  end;
end;

end.
