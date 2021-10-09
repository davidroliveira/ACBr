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

unit ACBrNFeNotasFiscais;

interface

uses
  Classes, Sysutils,
  ACBrNFeDadosProdutos, ACBrNFeEndereco, ACBrNFeValoresTotais,
  ACBrNFeTransportador, ACBrNFeDestinatario, ACBrNFeEmitente,
  ACBrNFeTypes, ACBrNFeXML, ACBrNFeFatura, ACBrNFeDadosAdicionais,
  ACBrNFeIdentificacao;

type

  NotaFiscal = class(TCollectionItem)
  private
    FIdentificacao: TIdentificacao;
    FEmitente: TEmitente;
    FDestinatario: TDestinatario;
    FDadosProdutos: TDadosProdutos;
    FValoresTotais: TValoresTotais;
    FTransportador: TTransportador;
    FFatura: TFatura;
    FDadosAdicionais: TDadosAdicionais;
    FXML: TNotaFiscalXML;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;

    property XML: TNotaFiscalXML read FXML write FXML;
  published
    property Identificacao: TIdentificacao read FIdentificacao write FIdentificacao;
    property Emitente: TEmitente read FEmitente write FEmitente;
    property Destinatario: TDestinatario read FDestinatario write FDestinatario;
    property DadosProdutos: TDadosProdutos read FDadosProdutos write FDadosProdutos;
    property ValoresTotais: TValoresTotais read FValoresTotais write FValoresTotais;
    property Transportador: TTransportador read FTransportador;
    property Fatura: TFatura read FFatura;
    property DadosAdicionais: TDadosAdicionais read FDadosAdicionais;
  end;

  TNotasFiscais = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): NotaFiscal;
    procedure SetItem(Index: Integer; const Value: NotaFiscal);
  protected
    FNotaFiscalEletronica : TPersistent;
  public
    procedure GerarNFe;
    procedure Assinar;
    procedure Valida;
    procedure Imprimir;
    procedure ImprimirPDF;
    function  Add: NotaFiscal;
    function Insert(Index: Integer): NotaFiscal;
    property Items[Index: Integer]: NotaFiscal read GetItem  write SetItem;
    function GetNamePath: string; override;
  end;

implementation

uses ACBrNFe;

{ NotaFiscal }

constructor NotaFiscal.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FIdentificacao    := TIdentificacao.Create;
  FEmitente         := TEmitente.Create;
  FDestinatario     := TDestinatario.Create;
  FDadosProdutos    := TDadosProdutos.Create(DadoProduto);
  FValoresTotais    := TValoresTotais.Create;
  FTransportador    := TTransportador.Create(MyNFe);
  FFatura           := TFatura.Create(MyNFe);
  FDadosAdicionais  := TDadosAdicionais.Create(MyNFe);
  FXML              := TNotaFiscalXML.Create(self, TNotasFiscais(Collection).Owner);
end;

destructor NotaFiscal.Destroy;
begin
  FIdentificacao.Free;
  FEmitente.Free;
  FDestinatario.Free;
  FDadosProdutos.Free;
  FValoresTotais.Free;
  FTransportador.Free;
  FFatura.Free;
  FDadosAdicionais.Free;
  FXML.Free;
  inherited Destroy;
end;

{ TNotasFiscais }

function TNotasFiscais.Add: NotaFiscal;
begin
  Result := NotaFiscal(inherited Add);
end;

procedure TNotasFiscais.Assinar;
var
  i: Integer;
begin
  for i:= 0 to Self.Count-1 do
    Self.Items[i].XML.Assinar
end;

procedure TNotasFiscais.GerarNFe;
var
  i: Integer;
begin
  for i:= 0 to Self.Count-1 do
    Self.Items[i].XML.GerarNFe;
end;

function TNotasFiscais.GetItem(Index: Integer): NotaFiscal;
begin
  Result := NotaFiscal(inherited Items[Index]);
end;

function TNotasFiscais.GetNamePath: string;
begin
 Result := 'NotaFiscal';
end;

procedure TNotasFiscais.Imprimir;
var
  i: Integer;
begin
  for i:= 0 to Self.Count-1 do
    Self.Items[i].XML.Imprimir;
end;

procedure TNotasFiscais.ImprimirPDF;
var
  i: Integer;
begin
  for i:= 0 to Self.Count-1 do
    Self.Items[i].XML.ImprimirPDF;
end;


function TNotasFiscais.Insert(Index: Integer): NotaFiscal;
begin
  Result := NotaFiscal(inherited Insert(Index));
end;

procedure TNotasFiscais.SetItem(Index: Integer; const Value: NotaFiscal);
begin
  Items[Index].Assign(Value);
end;

procedure TNotasFiscais.Valida;
var
  i: Integer;
begin
  for i:= 0 to Self.Count-1 do
    Self.Items[i].XML.Valida;
end;

end.
