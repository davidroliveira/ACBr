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
|* 13/03/2009: Dulcemar P. Zilli
|*  - Incluida Informa��es Reboque
******************************************************************************}
unit ACBrNFeTransportador;

interface

uses
  Classes, ACBrNFeTypes;

type

  Lacre = class(TCollectionItem)
  private
    FLacre: String;
    procedure SetLacre(AValue: String);
  public

  published
    property Lacre: String read FLacre write SetLacre;
  end;

  TLacres = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): Lacre;
    procedure SetItem(Index: Integer; const Value: Lacre);
  public
    function  Add: Lacre;
    function Insert(Index: Integer): Lacre;
    property Items[Index: Integer]: Lacre read GetItem  write SetItem;
    function GetNamePath: string; override;
  end;


  Volume = class(TCollectionItem)
  private
    FQuantidade: Integer;
    FEspecie: String;
    FMarca: String;
    FNumeracao: String;
    FPesoLiquido: Double;
    FPesoBruto: Double;
    FLacres: TLacres;
    procedure SetEspecie(AValue: String);
    procedure SetMarca(AValue: String);
    procedure SetNumeracao(AValue: String);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;

  published
    property Quantidade: Integer read FQuantidade write FQuantidade;
    property Especie: String read FEspecie write SetEspecie;
    property Marca: String read FMarca write SetMarca;
    property Numeracao: String read FNumeracao write SetNumeracao;
    property PesoLiquido: Double read FPesoLiquido write FPesoLiquido;
    property PesoBruto: Double read FPesoBruto write FPesoBruto;
    property Lacres: TLacres read FLacres write FLacres;
  end;

  TVolumes = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): Volume;
    procedure SetItem(Index: Integer; const Value: Volume);
  public
    function  Add: Volume;
    function Insert(Index: Integer): Volume;
    property Items[Index: Integer]: Volume read GetItem  write SetItem;
    function GetNamePath: string; override;
  end;



  TVeiculo = class(TPersistent)
  private
    FPlaca: String;
    FUF: String;
    FRNTC: String;
    procedure SetPlaca(AValue: String);
    procedure SetUF(AValue: String);
    procedure SetRNTC(AValue: String);
  published
    property Placa: String read FPlaca write SetPlaca;
    property UF: String read FUF write SetUF;
    property RNTC: String read FRNTC write SetRNTC;
  end;

  Reboq = class(TCollectionItem)
  private
    FRNTC: String;
    FPlaca: String;
    FUF: String;
    procedure SetPlaca(const Value: String);
    procedure SetRNTC(const Value: String);
    procedure SetUF(const Value: String);
  published
    property Placa: String read FPlaca write SetPlaca;
    property UF: String read FUF write SetUF;
    property RNTC: String read FRNTC write SetRNTC;
  end;

  TReboque = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): Reboq;
    procedure SetItem(Index: Integer; const Value: Reboq);
  public
    function  Add: Reboq;
    function Insert(Index: Integer): Reboq;
    property Items[Index: Integer]: Reboq read GetItem  write SetItem;
    function GetNamePath: string; override;
  end;


  TRetencaoICMS = class(TPersistent)
  private
    FValorServico: Double;
    FValorBase: Double;
    FAliquota: Double;
    FValor: Double;
    FCFOP : Integer;
    FCidade: Integer;
  published
    property ValorServico: Double read FValorServico write FValorServico;
    property ValorBase: Double read FValorBase write FValorBase;
    property Aliquota: Double read FAliquota write FAliquota;
    property Valor: Double read FValor write FValor;
    property CFOP: Integer read FCFOP write FCFOP;
    property Cidade: Integer read FCidade write FCidade;
  end;

  TTransportador = class(TComponent)
  private
    FFretePorConta: TNFeFrete;
    FCnpjCpf : String;
    FNomeRazao : String;
    FIE: String;
    FEndereco : String;
    FCidade : String;
    FUF : String;
    FRetencaoICMS: TRetencaoICMS;
    FVeiculo: TVeiculo;
    FVolumes: TVolumes;
    FReboque: TReboque;
    procedure SetNomeRazao(AValue: String);
    procedure SetCnpjCpf(AValue: String);
    procedure SetEndereco(AValue: String);
    procedure SetCidade(AValue: String);
    procedure SetUF(AValue: String);
    procedure SetReboque(const Value: TReboque);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  published
    property FretePorConta: TNFeFrete read FFretePorConta write FFretePorConta;
    property NomeRazao: String read FNomeRazao write SetNomeRazao;
    property CnpjCpf: String read FCnpjCpf write SetCnpjCpf;
    property Endereco: String read FEndereco write SetEndereco;
    property Cidade: String read FCidade write SetCidade;
    property UF: String read FUF write SetUF;
    property IE: String read FIE write FIE;
    property RetencaoICMS: TRetencaoICMS read FRetencaoICMS write FRetencaoICMS;
    property Veiculo: TVeiculo read FVeiculo write FVeiculo;
    property Volumes: TVolumes read FVolumes write FVolumes;
    property Reboque: TReboque read FReboque write SetReboque;
  end;

implementation

uses ACBrNFe, ACBrNFeUtil, SysUtils;

{ TTransportador }

constructor TTransportador.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFretePorConta := freEmitente;
  FRetencaoICMS  := TRetencaoICMS.Create;
  FVeiculo       := TVeiculo.Create;
  FVolumes       := TVolumes.Create(Self, Volume);
  FReboque       := TReboque.Create(Self, Reboq);

end;

destructor TTransportador.Destroy;
begin
  FRetencaoICMS.Free;
  FVeiculo.Free;
  FVolumes.Free;
  FReboque.Free;

  inherited;
end;

procedure TTransportador.SetCidade(AValue: String);
begin
  FCidade := NotaUtil.TrataString(AValue, 60);
end;

procedure TTransportador.SetCnpjCpf(AValue: String);
begin
  FCnpjCpf := NotaUtil.LimpaNumero(AValue);
end;

procedure TTransportador.SetEndereco(AValue: String);
begin
  FEndereco := NotaUtil.TrataString(AValue, 60);
end;

procedure TTransportador.SetNomeRazao(AValue: String);
begin
  FNomeRazao := NotaUtil.TrataString(AValue, 60);
end;

procedure TTransportador.SetReboque(const Value: TReboque);
begin
  FReboque := Value;
end;

procedure TTransportador.SetUF(AValue: String);
begin
  FUF := UpperCase(NotaUtil.TrataString(AValue, 2));
end;

{ TLacres }

function TLacres.Add: Lacre;
begin
  Result := Lacre(inherited Add);
end;

function TLacres.GetItem(Index: Integer): Lacre;
begin
  Result := Lacre(inherited Items[Index]);
end;

function TLacres.GetNamePath: string;
begin
 Result := 'Lacre';
end;

function TLacres.Insert(Index: Integer): Lacre;
begin
  Result := Lacre(inherited Insert(Index));
end;

procedure TLacres.SetItem(Index: Integer; const Value: Lacre);
begin
  Items[Index].Assign(Value);
end;

{ TVolumes }

function TVolumes.Add: Volume;
begin
  Result := Volume(inherited Add);
end;

function TVolumes.GetItem(Index: Integer): Volume;
begin
  Result := Volume(inherited Items[Index]);
end;

function TVolumes.GetNamePath: string;
begin
 Result := 'Volume';
end;

function TVolumes.Insert(Index: Integer): Volume;
begin
  Result := Volume(inherited Insert(Index));
end;

procedure TVolumes.SetItem(Index: Integer; const Value: Volume);
begin
  Items[Index].Assign(Value);
end;

{ Volume }

constructor Volume.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FLacres := TLacres.Create(Self, Lacre);
end;

destructor Volume.Destroy;
begin
  FLacres.Free;
  inherited;
end;

procedure Volume.SetEspecie(AValue: String);
begin
  FEspecie := NotaUtil.TrataString(AValue, 60);
end;

procedure Volume.SetMarca(AValue: String);
begin
  FMarca := NotaUtil.TrataString(AValue, 60);
end;

procedure Volume.SetNumeracao(AValue: String);
begin
  FNumeracao := NotaUtil.TrataString(AValue, 60);
end;

{ TVeiculo }

procedure TVeiculo.SetPlaca(AValue: String);
begin
  FPlaca := NotaUtil.TrataString(AValue, 8);
end;

procedure TVeiculo.SetRNTC(AValue: String);
begin
  FRNTC := NotaUtil.TrataString(AValue, 20);
end;

procedure TVeiculo.SetUF(AValue: String);
begin
  FUF := UpperCase(NotaUtil.TrataString(AValue, 2));
end;

{ Lacre }

procedure Lacre.SetLacre(AValue: String);
begin
  FLacre := NotaUtil.TrataString(AValue, 60);
end;


{ Reboq }

procedure Reboq.SetPlaca(const Value: String);
begin
  FPlaca := Value;
end;

procedure Reboq.SetRNTC(const Value: String);
begin
  FRNTC := Value;
end;

procedure Reboq.SetUF(const Value: String);
begin
  FUF := Value;
end;

{ TReboque }

function TReboque.Add: Reboq;
begin
  Result := Reboq(inherited Add);
end;

function TReboque.GetItem(Index: Integer): Reboq;
begin
  Result := Reboq(inherited Items[Index]);
end;

function TReboque.GetNamePath: string;
begin
 Result := 'Reboq';
end;

function TReboque.Insert(Index: Integer): Reboq;
begin
  Result := Reboq(inherited Insert(Index));
end;

procedure TReboque.SetItem(Index: Integer; const Value: Reboq);
begin
  Items[Index].Assign(Value);
end;

end.
