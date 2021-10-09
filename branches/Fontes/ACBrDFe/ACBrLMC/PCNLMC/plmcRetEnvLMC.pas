{******************************************************************************}
{ Projeto: Componente ACBrLMC                                                 }
{  Biblioteca multiplataforma de componentes Delphi                            }
{                                                                              }
{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do Projeto ACBr     }
{ Componentes localizado em http://www.sourceforge.net/projects/acbr           }
{                                                                              }
{                                                                              }
{  Esta biblioteca � software livre; voc� pode redistribu�-la e/ou modific�-la }
{ sob os termos da Licen�a P�blica Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a vers�o 2.1 da Licen�a, ou (a seu crit�rio) }
{ qualquer vers�o posterior.                                                   }
{                                                                              }
{  Esta biblioteca � distribu�da na expectativa de que seja �til, por�m, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia impl�cita de COMERCIABILIDADE OU      }
{ ADEQUA��O A UMA FINALIDADE ESPEC�FICA. Consulte a Licen�a P�blica Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICEN�A.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral Menor do GNU junto}
{ com esta biblioteca; se n�o, escreva para a Free Software Foundation, Inc.,  }
{ no endere�o 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Voc� tamb�m pode obter uma copia da licen�a em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Sim�es de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Pra�a Anita Costa, 34 - Tatu� - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{*******************************************************************************
|* Historico
|*
|* 20/07/2015: Italo Jurisato Junior
|*  - Doa��o do componente para o Projeto ACBr
*******************************************************************************}

{$I ACBr.inc}

unit plmcRetEnvLMC;

interface
 uses
  SysUtils, Classes,
  pcnAuxiliar, pcnConversao, pcnLeitor;

type

  TInfProt = class
  private
    FCNPJ: String;
    FnProt: String;
    FdigVal: String;
  public
    property CNPJ: String   read FCNPJ   write FCNPJ;
    property nProt: String  read FnProt  write FnProt;
    property digVal: String read FdigVal write FdigVal;
  end;

  TretEnvLMC = class(TPersistent)
  private
    FLeitor: TLeitor;
    Fversao: String;
    FtpAmb: TpcnTipoAmbiente;
    FdhRecbto: TDateTime;
    FcStat: Integer;
    FxMotivo: String;

    FcUF: Integer;
    FverAplic: String;
    FinfProt: TInfProt;
  public
    constructor Create;
    destructor Destroy; override;
    function LerXml: boolean;
  published
    property Leitor: TLeitor         read FLeitor   write FLeitor;
    property versao: String          read Fversao   write Fversao;
    property tpAmb: TpcnTipoAmbiente read FtpAmb    write FtpAmb;
    property dhRecbto: TDateTime     read FdhRecbto write FdhRecbto;
    property cStat: Integer          read FcStat    write FcStat;
    property xMotivo: String         read FxMotivo  write FxMotivo;
    property infProt: TInfProt       read FinfProt  write FinfProt;
  end;

implementation

{ TretEnvLMC }

constructor TretEnvLMC.Create;
begin
  FLeitor := TLeitor.Create;
  FinfProt := TInfProt.Create
end;

destructor TretEnvLMC.Destroy;
begin
  FLeitor.Free;
  FinfProt.Free;
  inherited;
end;

function TretEnvLMC.LerXml: boolean;
var
  ok: Boolean;
begin
  Result := False;
  try
    Leitor.Grupo := Leitor.Arquivo;
    if leitor.rExtrai(1, 'protLivroCombustivel') <> '' then
    begin
      Fversao   := Leitor.rAtributo('versao');

      if leitor.rExtrai(2, 'infProt') <> '' then
      begin
        FtpAmb    := StrToTpAmb(ok, Leitor.rCampo(tcStr, 'tpAmb'));
        FdhRecbto := Leitor.rCampo(tcDatHor, 'dhRecbto');
        FcStat    := Leitor.rCampo(tcInt, 'cStat');
        FxMotivo  := Leitor.rCampo(tcStr, 'xMotivo');

        // Grupo infProt - Dados do Protocolo Status = 100 / 101 / 1001
        infProt.CNPJ   := Leitor.rCampo(tcStr, 'CNPJ');
        infProt.nProt  := Leitor.rCampo(tcStr, 'nProt');
        infProt.digVal := Leitor.rCampo(tcStr, 'digVal');

        Result := True;
      end;
    end;

  except
    Result := False;
  end;
end;

end.

