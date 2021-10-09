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

