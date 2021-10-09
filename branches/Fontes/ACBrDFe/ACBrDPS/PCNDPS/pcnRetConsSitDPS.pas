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

unit pcnRetConsSitDPS;

interface

uses
  SysUtils, Classes,
  pcnConversao, pcnLeitor, pcnProcDPS, pcnRetEnvEventoDPS;

type

//  TRetEventoDPSCollection     = class;
//  TRetEventoDPSCollectionItem = class;
  TRetConsSitDPS              = class;
  (*
  TRetEventoDPSCollection = class(TCollection)
  private
    function GetItem(Index: Integer): TRetEventoDPSCollectionItem;
    procedure SetItem(Index: Integer; Value: TRetEventoDPSCollectionItem);
  public
    constructor Create(AOwner: TPersistent);
    function Add: TRetEventoDPSCollectionItem;
    property Items[Index: Integer]: TRetEventoDPSCollectionItem read GetItem write SetItem; default;
  end;

  TRetEventoDPSCollectionItem = class(TCollectionItem)
  private
    FRetEventoDPS: TRetEventoDPS;
  public
    constructor Create; reintroduce;
    destructor Destroy; override;
  published
    property RetEventoDPS: TRetEventoDPS read FRetEventoDPS write FRetEventoDPS;
  end;
  *)
  TRetConsSitDPS = class(TPersistent)
  private
    FLeitor: TLeitor;
    Fversao: String;
    FtpAmb: TpcnTipoAmbiente;
    FverAplic: String;
    FcStat: Integer;
    FxMotivo: String;
    FcUF: Integer;
    FprotDPS: TProcDPS;
//    FprocEventoDPS: TRetEventoDPSCollection;
    FXMLprotDPS: String;
  public
    constructor Create;
    destructor Destroy; override;
    function LerXml: Boolean;
  published
    property Leitor: TLeitor                        read FLeitor        write FLeitor;
    property versao: String                         read Fversao        write Fversao;
    property tpAmb: TpcnTipoAmbiente                read FtpAmb         write FtpAmb;
    property verAplic: String                       read FverAplic      write FverAplic;
    property cStat: Integer                         read FcStat         write FcStat;
    property xMotivo: String                        read FxMotivo       write FxMotivo;
    property cUF: Integer                           read FcUF           write FcUF;
    property protDPS: TProcDPS                      read FprotDPS       write FprotDPS;
//    property procEventoDPS: TRetEventoDPSCollection read FprocEventoDPS write FprocEventoDPS;
    property XMLprotDPS: String                     read FXMLprotDPS    write FXMLprotDPS;
  end;

implementation

{ TRetConsSitDPS }

constructor TRetConsSitDPS.Create;
begin
  FLeitor  := TLeitor.Create;
  FprotDPS := TProcDPS.create;
end;

destructor TRetConsSitDPS.Destroy;
begin
  FLeitor.Free;
  FprotDPS.Free;
//  if Assigned(procEventoDPS) then
//    procEventoDPS.Free;

  inherited;
end;

function TRetConsSitDPS.LerXml: Boolean;
var
  ok: Boolean;
  i: Integer;
begin
  Result := False;
  try
    if leitor.rExtrai(1, 'retConsSitDPS') <> '' then
    begin
      Fversao   := Leitor.rAtributo('versao');
      FtpAmb    := StrToTpAmb(ok, leitor.rCampo(tcStr, 'tpAmb'));
      FverAplic := leitor.rCampo(tcStr, 'verAplic');
      FcStat    := leitor.rCampo(tcInt, 'cStat');
      FxMotivo  := leitor.rCampo(tcStr, 'xMotivo');
      FcUF      := leitor.rCampo(tcInt, 'cUF');

      case FcStat of
        100,101,104,110,150,151,155,301,302,303:
           begin
             if (Leitor.rExtrai(1, 'protDPS') <> '') then
             begin
               // A propriedade XMLprotDPS contem o XML que traz o resultado do
               // processamento do BP-e.
               XMLprotDPS := Leitor.Grupo;

               if Leitor.rExtrai(2, 'infProt') <> '' then
               begin
                 protDPS.tpAmb    := StrToTpAmb(ok, Leitor.rCampo(tcStr, 'tpAmb'));
                 protDPS.verAplic := Leitor.rCampo(tcStr, 'verAplic');
                 protDPS.chDPS    := Leitor.rCampo(tcStr, 'chDPS');
                 protDPS.dhRecbto := Leitor.rCampo(tcDatHor, 'dhRecbto');
                 protDPS.nProt    := Leitor.rCampo(tcStr, 'nProt');
                 protDPS.digVal   := Leitor.rCampo(tcStr, 'digVal');
                 protDPS.cStat    := Leitor.rCampo(tcInt, 'cStat');
                 protDPS.xMotivo  := Leitor.rCampo(tcStr, 'xMotivo');
               end;
             end;
           end;
      end;
      (*
      if Assigned(procEventoDPS) then
        procEventoDPS.Free;

      procEventoDPS := TRetEventoDPSCollection.Create(Self);
      i:=0;
      while Leitor.rExtrai(1, 'procEventoDPS', '', i + 1) <> '' do
      begin
        procEventoDPS.Add;
        procEventoDPS.Items[i].RetEventoDPS.Leitor.Arquivo := Leitor.Grupo;
        procEventoDPS.Items[i].RetEventoDPS.XML            := Leitor.Grupo;
        procEventoDPS.Items[i].RetEventoDPS.LerXml;
        inc(i);
      end;
      *)
      Result := True;
    end;
  except
    Result := False;
  end;
end;

(*
{ TRetEventoCollection }

function TRetEventoDPSCollection.Add: TRetEventoDPSCollectionItem;
begin
  Result := TRetEventoDPSCollectionItem(inherited Add);
  Result.create;
end;

constructor TRetEventoDPSCollection.Create(AOwner: TPersistent);
begin
  inherited Create(TRetEventoDPSCollectionItem);
end;

function TRetEventoDPSCollection.GetItem(Index: Integer): TRetEventoDPSCollectionItem;
begin
  Result := TRetEventoDPSCollectionItem(inherited GetItem(Index));
end;

procedure TRetEventoDPSCollection.SetItem(Index: Integer;
  Value: TRetEventoDPSCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TRetEventoCollectionItem }

constructor TRetEventoDPSCollectionItem.Create;
begin
  FRetEventoDPS := TRetEventoDPS.Create;
end;

destructor TRetEventoDPSCollectionItem.Destroy;
begin
  FRetEventoDPS.Free;
  inherited;
end;
*)
end.

