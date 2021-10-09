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

unit pcnConsSitDPS;

interface

uses
  SysUtils, Classes, pcnConversao, pcnGerador, pcnConsts, pcnDPSConsts;

type

  TConsSitDPS = class
  private
    FGerador: TGerador;
    FtpAmb: TpcnTipoAmbiente;
    FchDPS: String;
    FVersao: String;
  public
    constructor Create;
    destructor Destroy; override;
    function GerarXML: Boolean;
  published
    property Gerador: TGerador       read FGerador write FGerador;
    property tpAmb: TpcnTipoAmbiente read FtpAmb   write FtpAmb;
    property chDPS: String           read FchDPS   write FchDPS;
    property Versao: String          read FVersao  write FVersao;
  end;

implementation

uses
  ACBrUtil;

{ TConsSitDPS }

constructor TConsSitDPS.Create;
begin
  FGerador := TGerador.Create;
end;

destructor TConsSitDPS.Destroy;
begin
  FGerador.Free;
  inherited;
end;

function TConsSitDPS.GerarXML: Boolean;
begin
  Gerador.ArquivoFormatoXML := '';
  (*
  Gerador.wGrupo('consSitDPS ' + NAME_SPACE_DPS + ' versao="' + Versao + '"');
  Gerador.wCampo(tcStr, 'CP03', 'tpAmb', 01, 01, 1, tpAmbToStr(FtpAmb), DSC_TPAMB);
  Gerador.wCampo(tcStr, 'CP04', 'xServ', 09, 09, 1, 'CONSULTAR', DSC_XSERV);
  Gerador.wCampo(tcEsp, 'CP05', 'chDPS', 44, 44, 1, FchDPS, DSC_CHDPS);
  Gerador.wGrupo('/consSitDPS');
  *)
  Result := (Gerador.ListaDeAlertas.Count = 0);
end;

end.

