{******************************************************************************}
{ Projeto: Componente ACBrNFe                                                  }
{  Biblioteca multiplataforma de componentes Delphi para emiss�o de Nota Fiscal}
{ eletr�nica - NFe - http://www.nfe.fazenda.gov.br                          }
{                                                                              }
{ Direitos Autorais Reservados (c) 2008 Wemerson Souto                         }
{                                       Daniel Simoes de Almeida               }
{                                       Andr� Ferreira de Moraes               }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
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

{******************************************************************************
|* Historico
|*
|* 16/12/2008: Wemerson Souto
|*  - Doa��o do componente para o Projeto ACBr
******************************************************************************}
unit ACBrNFeDestinatario;

interface

uses
  Classes, ACBrNFeEndereco;

type

  TDestinatario = class(TPersistent)
  private
    FCNPJCPF : String;
    FNomeRazao : String;
    FEndereco : TEndereco;
    FIE : String;
    FISUF: String;
    procedure SetCNPJCPF(AValue: String);
    procedure SetNomeRazao(AValue: String);
  public
    constructor Create;
    destructor Destroy; override;

  published
    property CNPJCPF : String read FCNPJCPF write SetCNPJCPF;
    property NomeRazao : String read FNomeRazao write SetNomeRazao;
    property Endereco : TEndereco read FEndereco write FEndereco;
    property IE : String read FIE write FIE;
    property ISUF : String read FISUF write FISUF;
  end;

implementation

uses ACBrNFeUtil;

{ TDestinatario }

constructor TDestinatario.Create;
begin
  FEndereco := TEndereco.Create;
end;

destructor TDestinatario.Destroy;
begin
  FEndereco.Free;
  inherited;
end;

procedure TDestinatario.SetCNPJCPF(AValue: String);
begin
  FCNPJCPF := NotaUtil.LimpaNumero(AValue);
end;

procedure TDestinatario.SetNomeRazao(AValue: String);
begin
  FNomeRazao := NotaUtil.TrataString(AValue, 60);
end;

end.
