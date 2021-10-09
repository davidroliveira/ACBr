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
|* 11/05/2009: Jo�o H. Souza
|*  - Adicionado Notas Fiscais Referenciadas
******************************************************************************}
unit ACBrNFeIdentificacao;

interface

uses
  Classes, Sysutils,
   ACBrNFeTypes, ACBrNFeRef;

type

  TIdentificacao = Class(TPersistent)
  private
    FCodigo: Integer;
    FNaturezaOperacao : String;
    FFormaPagamento: TNFeFormaPagamento;
    FModelo: Integer;
    FSerie: Integer;
    FNumero: Integer;
    FDataEmissao : TDateTime;
    FDataSaida : TDateTime;
    FTipo: TNFeTipo;
    FFinalidade: TNFeFinalidade;
    FNFRef: TNFRef;
    procedure SetNaturezaOperacao(AValue: String);
    procedure SetNFRef(const Value: TNFRef);
  public
    constructor Create;
    destructor Destroy; override;

  published
    property Codigo: Integer read FCodigo write FCodigo;
    property NaturezaOperacao : String read FNaturezaOperacao write SetNaturezaOperacao;
    property FormaPagamento : TNFeFormaPagamento read FFormaPagamento write FFormaPagamento;
    property Modelo: Integer read FModelo write FModelo;
    property Serie: Integer read FSerie write FSerie;
    property Numero: Integer read FNumero write FNumero;
    property DataEmissao : TDateTime read FDataEmissao write FDataEmissao;
    property DataSaida : TDateTime read FDataSaida write FDataSaida;
    property Tipo : TNFeTipo read FTipo write FTipo;
    property Finalidade : TNFeFinalidade read FFinalidade write FFinalidade;
    property NFRef : TNFRef read FNFRef write SetNFRef;
  end;

implementation

uses ACBrNFeUtil, ACBrNFe;

{ TIdentificacao }

constructor TIdentificacao.Create;
begin
  FTipo   := tSaida;
  FModelo := 55;
  FNFRef  := TNFRef.Create;
end;

destructor TIdentificacao.Destroy;
begin
  FNFRef.Free;
  inherited;
end;

procedure TIdentificacao.SetNaturezaOperacao(AValue: String);
begin
  FNaturezaOperacao := NotaUtil.TrataString(AValue, 60);
end;

procedure TIdentificacao.SetNFRef(const Value: TNFRef);
begin
  FNFref := Value;
end;

end.
