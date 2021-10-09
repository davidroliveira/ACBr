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

unit pcnEventoDPS;

interface

uses
  SysUtils, Classes,
  pcnConversao, pcnConversaoDPS;

type

  { TDetEvento }

  TDetEvento = class(TObject)
  private
    FxDesc: String;
    FcJustCanc: TcJustCanc;
    FcMotivo: TcMotivo;
    FxMotivo: String;
    FchSubstituta: String;
  public
    property xDesc: String         read FxDesc        write FxDesc;
    // Usado para o cancelamento
    property cJustCanc: TcJustCanc read FcJustCanc    write FcJustCanc;
    // Usado para o cancelamento por substituição
    property cMotivo: TcMotivo     read FcMotivo      write FcMotivo;
    property xMotivo: String       read FxMotivo      write FxMotivo;
    property chSubstituta: String  read FchSubstituta write FchSubstituta;
  end;

  { TInfEvento }

  TInfEvento = class(TObject)
  private
    FId: String;
    FtpAmb: TpcnTipoAmbiente;
    FverAplic: String;
    FdhEvento: TDateTime;
    FCNPJCPF: String;
    FchNFSe: String;
    FnPedRegEvento: Integer;
    FTpEvento: TtpEvento;
    FDetEvento: TDetEvento;
    FcOrgao: Integer;

    function getcOrgao: Integer;
  public
    constructor Create;
    destructor Destroy; override;

    property Id: String              read FId            write FId;
    property tpAmb: TpcnTipoAmbiente read FtpAmb         write FtpAmb;
    property verAplic: String        read FverAplic      write FverAplic;
    property dhEvento: TDateTime     read FdhEvento      write FdhEvento;
    property CNPJCPF: String         read FCNPJCPF       write FCNPJCPF;
    property chNFSe: String          read FchNFSe        write FchNFSe;
    property nPedRegEvento: Integer  read FnPedRegEvento write FnPedRegEvento;
    property tpEvento: TtpEvento     read FTpEvento       write FTpEvento;
    property detEvento: TDetEvento   read FDetEvento      write FDetEvento;
    property cOrgao: Integer         read getcOrgao       write FcOrgao;
  end;

implementation

{ TInfEvento }

constructor TInfEvento.Create;
begin
  inherited Create;

  FDetEvento := TDetEvento.Create;
end;

destructor TInfEvento.Destroy;
begin
  FDetEvento.Free;

  inherited;
end;

function TInfEvento.getcOrgao: Integer;
//  (AC,AL,AP,AM,BA,CE,DF,ES,GO,MA,MT,MS,MG,PA,PB,PR,PE,PI,RJ,RN,RS,RO,RR,SC,SP,SE,TO);
//  (12,27,16,13,29,23,53,32,52,21,51,50,31,15,25,41,26,22,33,24,43,11,14,42,35,28,17);
begin
  if FcOrgao <> 0 then
    Result := FcOrgao
  else
    Result := StrToIntDef(copy(FchNFSe, 1, 2), 0);
end;

end.
