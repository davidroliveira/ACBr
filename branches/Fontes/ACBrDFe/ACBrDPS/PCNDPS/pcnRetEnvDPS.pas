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

unit pcnRetEnvDPS;

interface

uses
  SysUtils, Classes, pcnConversao, pcnLeitor;

type

  TProtDPSCollection     = class;
  TProtDPSCollectionItem = class;

  TretEnvDPS = class(TPersistent)
  private
    Fversao: String;
    FtpAmb: TpcnTipoAmbiente;
    FcStat: Integer;
    FLeitor: TLeitor;
    FcUF: Integer;
    FverAplic: String;
    FxMotivo: String;
    FProtDPS: TProtDPSCollection;

    procedure SetProtDPS(const Value: TProtDPSCollection);
  public
    constructor Create;
    destructor Destroy; override;
    function LerXml: Boolean;
  published
    property Leitor: TLeitor         read FLeitor   write FLeitor;
    property versao: String          read Fversao    write Fversao;
    property tpAmb: TpcnTipoAmbiente read FtpAmb    write FtpAmb;
    property verAplic: String        read FverAplic write FverAplic;
    property cStat: Integer          read FcStat    write FcStat;
    property xMotivo: String         read FxMotivo  write FxMotivo;
    property cUF: Integer            read FcUF      write FcUF;
    property ProtDPS: TProtDPSCollection read FProtDPS  write SetProtDPS;
  end;

  TProtDPSCollection = class(TCollection)
  private
    function GetItem(Index: Integer): TProtDPSCollectionItem;
    procedure SetItem(Index: Integer; Value: TProtDPSCollectionItem);
  public
    constructor Create(AOwner: TretEnvDPS); reintroduce;
    function Add: TProtDPSCollectionItem;
    property Items[Index: Integer]: TProtDPSCollectionItem read GetItem write SetItem; default;
  end;

  TProtDPSCollectionItem = class(TCollectionItem)
  private
    FtpAmb: TpcnTipoAmbiente;
    FverAplic: String;
    FchDPS: String;
    FdhRecbto: TDateTime;
    FnProt: String;
    FdigVal: String;
    FcStat: Integer;
    FxMotivo: String;
    FXMLprotDPS: String;
  published
    property tpAmb: TpcnTipoAmbiente read FtpAmb      write FtpAmb;
    property verAplic: String        read FverAplic   write FverAplic;
    property chDPS: String           read FchDPS      write FchDPS;
    property dhRecbto: TDateTime     read FdhRecbto   write FdhRecbto;
    property nProt: String           read FnProt      write FnProt;
    property digVal: String          read FdigVal     write FdigVal;
    property cStat: Integer          read FcStat      write FcStat;
    property xMotivo: String         read FxMotivo    write FxMotivo;
    property XMLprotDPS: String      read FXMLprotDPS write FXMLprotDPS;
  end;

implementation

{ TretEnvDPS }

constructor TretEnvDPS.Create;
begin
  FLeitor  := TLeitor.Create;
  FProtDPS := TProtDPSCollection.Create(self);
end;

destructor TretEnvDPS.Destroy;
begin
  FLeitor.Free;
  FProtDPS.Free;
  inherited;
end;

procedure TretEnvDPS.SetProtDPS(const Value: TProtDPSCollection);
begin
  FProtDPS := Value;
end;

{ TProtDPSCollection }

constructor TProtDPSCollection.Create(AOwner: TretEnvDPS);
begin
  inherited Create(TProtDPSCollectionItem);
end;

function TProtDPSCollection.Add: TProtDPSCollectionItem;
begin
  Result := TProtDPSCollectionItem(inherited Add);
end;

function TProtDPSCollection.GetItem(Index: Integer): TProtDPSCollectionItem;
begin
  Result := TProtDPSCollectionItem(inherited GetItem(Index));
end;

procedure TProtDPSCollection.SetItem(Index: Integer; Value: TProtDPSCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

function TretEnvDPS.LerXml: Boolean;
var
  ok: Boolean;
  i: Integer;
begin
  Result := False;
  try
    Leitor.Grupo := Leitor.Arquivo;
    if leitor.rExtrai(1, 'retDPS') <> '' then
    begin
      Fversao   := Leitor.rAtributo('versao');
      FtpAmb    := StrToTpAmb(ok, Leitor.rCampo(tcStr, 'tpAmb'));
      FcUF      := Leitor.rCampo(tcInt, 'cUF');
      FverAplic := Leitor.rCampo(tcStr, 'verAplic');
      FcStat    := Leitor.rCampo(tcInt, 'cStat');
      FxMotivo  := Leitor.rCampo(tcStr, 'xMotivo');

      i := 0;
      while (FcStat = 100) and (Leitor.rExtrai(1, 'protDPS', '', i + 1) <> '') do
      begin
        ProtDPS.Add;

        // A propriedade XMLprotDPS contem o XML que traz o resultado do
        // processamento da BP-e.
        ProtDPS[i].XMLprotDPS := Leitor.Grupo;

        if Leitor.rExtrai(2, 'infProt') <> '' then
        begin
          ProtDPS[i].FtpAmb    := StrToTpAmb(ok, Leitor.rCampo(tcStr, 'tpAmb'));
          ProtDPS[i].FverAplic := Leitor.rCampo(tcStr, 'verAplic');
          ProtDPS[i].FchDPS    := Leitor.rCampo(tcStr, 'chDPS');
          ProtDPS[i].FdhRecbto := Leitor.rCampo(tcDatHor, 'dhRecbto');
          ProtDPS[i].FnProt    := Leitor.rCampo(tcStr, 'nProt');
          ProtDPS[i].FdigVal   := Leitor.rCampo(tcStr, 'digVal');
          ProtDPS[i].FcStat    := Leitor.rCampo(tcInt, 'cStat');
          ProtDPS[i].FxMotivo  := Leitor.rCampo(tcStr, 'xMotivo');
        end;
        inc(i);
      end;

      Result := True;
    end;
  except
    Result := false;
  end;
end;

end.

