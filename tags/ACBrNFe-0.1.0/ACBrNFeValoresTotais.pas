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
|*  - Implementa��o Totais ISSQN
|*  - Implementacao Totais Reten��es Tributos
******************************************************************************}
unit ACBrNFeValoresTotais;

interface

uses
  Classes;

type

  TISSQNTOT = Class(Tpersistent)
  private
    FValorServicos:Double;
    FValorBase:Double;
    FValorISSQN:Double;
    FValorPIS: Double;
    FValorCOFINS:Double;
  public
  published
    property ValorServicos:Double read FValorServicos write FValorServicos;
    property ValorBase:Double read FValorBase write FValorBase;
    property ValorISSQN:Double read FValorISSQN write FValorISSQN;
    property ValorPIS: Double read FValorPIS write FValorPIS;
    property ValorCOFINS:Double read FValorCOFINS write FValorCOFINS;
  end;

  TRETTRIB = Class(TPersistent)
  private
    FValorRetidoPIS:Double;
    FValorRetidoCOFINS:Double;
    FValorRetidoCSLL:Double;
    FBaseCalculoIRRF:Double;
    FValorIRRF:Double;
    FValorRetidoINSS:Double;
  published
    property ValorRetidoPIS:Double read FValorRetidoPIS write FValorRetidoPIS;
    property ValorRetidoCOFINS:Double read FValorRetidoCOFINS write FValorRetidoCOFINS;
    property ValorRetidoCSLL:Double read FValorRetidoCSLL write FValorRetidoCSLL;
    property BaseCalculoIRRF:Double read FBaseCalculoIRRF write FBaseCalculoIRRF;
    property ValorIRRF:Double read FValorIRRF write FValorIRRF;
    property ValorRetidoINSS:Double read FValorRetidoINSS write FValorRetidoINSS;
  end;

  TValoresTotais = class(TPersistent)
  private
    FBaseICMS:Double;
    FValorICMS:Double;
    FBaseICMSSubstituicao:Double;
    FValorICMSSubstituicao:Double;
    FValorProduto:Double;
    FValorFrete:Double;
    FValorSeguro:Double;
    FValorDesconto:Double;
    FValorII:Double;
    FValorIPI:Double;
    FValorPIS:Double;
    FValorCOFINS:Double;
    FValorOutrasDespesas:Double;
    FValorNota:Double;
    FISSQNTot: TISSQNTOT;
    FRetencoes: TRETTRIB;
    procedure SetISSQNTOT(const Value: TISSQNTOT);
    procedure SetRetencoes(const Value: TRETTRIB);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property BaseICMS: Double read FBaseICMS write FBaseICMS;
    property ValorICMS: Double read FValorICMS write FValorICMS;
    property BaseICMSSubstituicao: Double read FBaseICMSSubstituicao write FBaseICMSSubstituicao;
    property ValorICMSSubstituicao: Double read FValorICMSSubstituicao write FValorICMSSubstituicao;
    property ValorProduto: Double read FValorProduto write FValorProduto;
    property ValorFrete: Double read FValorFrete write FValorFrete;
    property ValorSeguro: Double read FValorSeguro write FValorSeguro;
    property ValorDesconto: Double read FValorDesconto write FValorDesconto;
    property ValorII: Double read FValorII write FValorII;
    property ValorIPI: Double read FValorIPI write FValorIPI;
    property ValorPIS: Double read FValorPIS write FValorPIS;
    property ValorCOFINS: Double read FValorCOFINS write FValorCOFINS;
    property ValorOutrasDespesas: Double read FValorOutrasDespesas write FValorOutrasDespesas;
    property ValorNota: Double read FValorNota write FValorNota;
    property ISSQNTot: TISSQNTOT read FISSQNTOT write SetISSQNTOT;
    property Retencoes: TRETTRIB read FRetencoes write SetRetencoes;
  end;


implementation

{ TValoresTotais }

constructor TValoresTotais.Create;
begin
  FISSQNTOT  := TISSQNTOT.Create;
  FRetencoes := TRETTRIB.Create;
end;

destructor TValoresTotais.Destroy;
begin
  FISSQNTOT.Free;
  FRetencoes.Free;
  inherited;
end;

procedure TValoresTotais.SetISSQNTOT(const Value: TISSQNTOT);
begin
  FISSQNTOT := Value;
end;

procedure TValoresTotais.SetRetencoes(const Value: TRETTRIB);
begin
  FRetencoes := Value;
end;

end.
