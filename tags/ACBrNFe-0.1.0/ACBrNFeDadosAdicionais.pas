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
|* 11/03/2009: Dulcemar P. Zilli
|*  - Inclusao Observa��es Fisco
******************************************************************************}
unit ACBrNFeDadosAdicionais;

interface

uses
  Classes, SysUtils;

type

  Informacao = class(TCollectionItem)
  private
    FCampo: String;
    FTexto: String;
    procedure SetCampo(AValue: String);
    procedure SetTexto(AValue: String);
  published
    property Campo: String read FCampo write SetCampo;
    property Texto: String read FTexto write SetTexto;
  end;

  TInformacoes = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): Informacao;
    procedure SetItem(Index: Integer; const Value: Informacao);
  public
    function  Add: Informacao;
    function Insert(Index: Integer): Informacao;
    property Items[Index: Integer]: Informacao read GetItem  write SetItem;
    function GetNamePath: string; override;
  end;


  Fisco = class(TCollectionItem)
  private
    FTexto: String;
    FCampo: String;
    procedure SetCampo(const Value: String);
    procedure SetTexto(const Value: String);
  published
    property Campo: String read FCampo write SetCampo;
    property Texto: String read FTexto write SetTexto;
  end;

  TFisco = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): Fisco;
    procedure SetItem(Index: Integer; const Value: Fisco);
  public
    function  Add: Fisco;
    function Insert(Index: Integer): Fisco;
    property Items[Index: Integer]: Fisco read GetItem  write SetItem;
    function GetNamePath: string; override;
  end;


  TDadosAdicionais = class(TComponent)
  private
    FComplemento: String;
    FInformacoes: TInformacoes;
    FObsFisco: TFisco;
    procedure SetComplemento(AValue: String);
    procedure SetObsFisco(const Value: TFisco);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Complemento: String read FComplemento write SetComplemento;
    property Informacoes: TInformacoes read FInformacoes write FInformacoes;
    property ObsFisco: TFisco read FObsFisco write SetObsFisco;
  end;

implementation

uses ACBrNFeUtil;

{ TInformacoes }

function TInformacoes.Add: Informacao;
begin
  if Self.Count > 10 then
    raise Exception.Create('Numero m�ximo de Informa��es atingido(10)!');
  Result := Informacao(inherited Add);
end;

function TInformacoes.GetItem(Index: Integer): Informacao;
begin
  Result := Informacao(inherited Items[Index]);
end;

function TInformacoes.GetNamePath: string;
begin
  Result := 'Informacao';
end;

function TInformacoes.Insert(Index: Integer): Informacao;
begin
  Result := Informacao(inherited Insert(Index));
end;

procedure TInformacoes.SetItem(Index: Integer; const Value: Informacao);
begin
  Items[Index].Assign(Value);
end;

{ TDadosAdicionais }

constructor TDadosAdicionais.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FInformacoes := TInformacoes.Create(self , Informacao);
  FObsFisco := TFisco.Create(self , Fisco);
end;

destructor TDadosAdicionais.Destroy;
begin
  FInformacoes.Free;
  FObsFisco.Free;
  inherited;
end;

procedure TDadosAdicionais.SetComplemento(AValue: String);
begin
  FComplemento := NotaUtil.TrataString(AValue);
end;

procedure TDadosAdicionais.SetObsFisco(const Value: TFisco);
begin
  FObsFisco := Value;
end;

{ Informacao }

procedure Informacao.SetCampo(AValue: String);
begin
  FCampo := NotaUtil.TrataString(AValue, 20);
end;

procedure Informacao.SetTexto(AValue: String);
begin
  FTexto := NotaUtil.TrataString(AValue, 60);
end;

{ Fisco }

procedure Fisco.SetCampo(const Value: String);
begin
  FCampo := Value;
end;

procedure Fisco.SetTexto(const Value: String);
begin
  FTexto := Value;
end;

{ TFisco }

function TFisco.Add: Fisco;
begin
  if Self.Count > 10 then
    raise Exception.Create('Numero m�ximo de Informa��es atingido(10)!');
  Result := Fisco(inherited Add);
end;

function TFisco.GetItem(Index: Integer): Fisco;
begin
  Result := Fisco(inherited Items[Index]);
end;

function TFisco.GetNamePath: string;
begin
  Result := 'Fisco';
end;

function TFisco.Insert(Index: Integer): Fisco;
begin
  Result := Fisco(inherited Insert(Index));
end;

procedure TFisco.SetItem(Index: Integer; const Value: Fisco);
begin
  Items[Index].Assign(Value);
end;

end.
