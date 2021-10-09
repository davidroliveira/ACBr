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
|* 14/03/2009: Dulcemar P. Zilli
|*  - Complementa��o Emitente, IEST, IM, CNAE 
******************************************************************************}
unit ACBrNFeEmitente;

interface

uses
  Classes, ACBrNFeEndereco, ACBrNFeTypes;

type

  TNome = Class(TPersistent)
  private
    FRazaoSocial: String;
    FFantasia: String;
    procedure SetRazaoSocial(AValue: String);
    procedure SetFantasia(AValue: String);
  public

  published
    property RazaoSocial: String read FRazaoSocial write SetRazaoSocial;
    property Fantasia: String read FFantasia write SetFantasia;
  end;

  TEmitente = Class(TPersistent)
  private
    FNome : TNome;
    FEndereco: TEndereco;
    FCNPJ : String;
    FIE : String;
    FIM: String;
    FIEST: String;
    FCNAE: String;
    procedure SetCNPJ(AValue: String);
    procedure SetCNAE(const Value: String);
    procedure SetIEST(const Value: String);
    procedure SetIM(const Value: String);
  public
    constructor Create;
    destructor Destroy; override;

  published
    property Nome : TNome read FNome write FNome;
    property Endereco : TEndereco read FEndereco write FEndereco;
    property CNPJ : String read FCNPJ write SetCNPJ;
    property IE : String read FIE write FIE;
    property IEST: String read FIEST write SetIEST;
    property IM: String read FIM write SetIM;
    property CNAE: String read FCNAE write SetCNAE;
  end;

implementation

uses ACBrNFeUtil, ACBrNFeNotasFiscais;

{ TEmitente }

constructor TEmitente.Create;
begin
  FNome     := TNome.Create;
  FEndereco := TEndereco.Create;
end;

destructor TEmitente.Destroy;
begin
  FNome.Free;
  FEndereco.Free;
  inherited;
end;

procedure TEmitente.SetCNAE(const Value: String);
begin
  FCNAE := Value;
end;

procedure TEmitente.SetCNPJ(AValue: String);
begin
  FCNPJ := NotaUtil.LimpaNumero(AValue);
end;

procedure TEmitente.SetIEST(const Value: String);
begin
  FIEST := Value;
end;

procedure TEmitente.SetIM(const Value: String);
begin
  FIM := Value;
end;

{ TNome }

procedure TNome.SetFantasia(AValue: String);
begin
  FFantasia := NotaUtil.TrataString(AValue, 60);
end;

procedure TNome.SetRazaoSocial(AValue: String);
begin
  FRazaoSocial := NotaUtil.TrataString(AValue, 60);
end;

end.
