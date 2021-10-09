{$I ACBr.inc}

unit pcnRecopi;


interface

uses
  Classes, SysUtils, pcnConversaoRecopi, contnrs;

type

  TListaSolicitacao = class;

  { TNF }

  TNF = class
  private
    FDataEmissao: TDateTime;
    FDataEntrada: TDateTime;
    FDataSaida: TDateTime;
    FNumero: Integer;
    FSerie: Integer;
    FValor: Real;
  published
    property Numero: Integer read FNumero write FNumero;
    property Serie: Integer read FSerie write FSerie;
    property DataEmissao: TDateTime read FDataEmissao write FDataEmissao;
    property DataEntrada: TDateTime read FDataEntrada write FDataEntrada;
    property DataSaida: TDateTime read FDataSaida write FDataSaida;
    property Valor: Real read FValor write FValor;
  end;

  { TNFEntrada }

  TNFEntrada = class
  private
    FDataEntrada: TDateTime;
  published
    property DataEntrada: TDateTime read FDataEntrada write FDataEntrada;
  end;


  { TItemPapel }

  TItemPapel = class
  private
    FCodigoPapel: String;
    FCodigoPapelFinal: String;
    FISBNISSNTitulo: String;
    FPerda: Real;
    FQuantidade: Real;
    FTipoPublicacao: TpcnTipoPublicacao;
    FTiragem: String;
  published
    property CodigoPapel: String read FCodigoPapel write FCodigoPapel;
    property Quantidade: Real read FQuantidade write FQuantidade;
    property Perda: Real read FPerda write FPerda;
    property CodigoPapelFinal: String read FCodigoPapelFinal write FCodigoPapelFinal;
    property TipoPublicacao: TpcnTipoPublicacao read FTipoPublicacao write FTipoPublicacao;
    property ISBNISSNTitulo: String read FISBNISSNTitulo write FISBNISSNTitulo;
    property Tiragem: String read FTiragem write FTiragem;
  end;

  { TListaItemPapel }

  TListaItemPapel = class(TObjectList)
  protected
    function GetObjects(Index: Integer): TItemPapel;
    procedure SetObjects(Index: Integer; AValue: TItemPapel);
    procedure Insert(Index: Integer; Obj: TItemPapel);
  public
    function Add(Obj: TItemPapel): Integer;
    property Objects[Index: Integer]: TItemPapel read GetObjects write SetObjects; default;
  end;

  { TListaSolicitacao }

  TListaSolicitacao = class(TPersistent)
  private
    FIdInterno: String;
    FListaItens: TListaItemPapel;
    FNF: TNF;
    FTipoOperacao: TpcnTipoOperacao;
    FCNPJOrigem: String;
    FCNPJOrigemUF: String;
    FCNPJDestino: String;
    FCNPJDestinoUF: String;
    FCFOP: String;
    FImportacao: Boolean;
    FOrdemJudicial: Boolean;
    FNumeroDI: String;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property IdInterno: String read FIdInterno write FIdInterno;
    property TipoOperacao: TpcnTipoOperacao read FTipoOperacao write FTipoOperacao;
    property CNPJOrigem: String read FCNPJOrigem write FCNPJOrigem;
    property CNPJOrigemUF: String read FCNPJOrigemUF write FCNPJOrigemUF;
    property CNPJDestino: String read FCNPJDestino write FCNPJDestino;
    property CNPJDestinoUF: String read FCNPJDestinoUF write FCNPJDestinoUF;
    property CFOP: String read FCFOP write FCFOP;
    property Importacao: Boolean read FImportacao write FImportacao;
    property OrdemJudicial: Boolean read FOrdemJudicial write FOrdemJudicial;
    property NumeroDI: String read FNumeroDI write FNumeroDI;
    property ListaItens: TListaItemPapel read FListaItens write FListaItens;
    property NF: TNF read FNF write FNF;
  end;

  { TInclusaoNF }

  TInclusaoNF = class(TPersistent)
  private
    FCodigoControle: String;
    FNF: TNF;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property CodigoControle: String read FCodigoControle write FCodigoControle;
    property NF: TNF read FNF write FNF;
  end;

  { TConfirmaSolicitacao }

  TConfirmaSolicitacao = class(TPersistent)
  private
    FCodigoControle: String;
    FIdRemessa: String;
    FJustificativa: String;
    FListaItens: TListaItemPapel;
    FNFComplementar: TNF;
    FNFEntrada: TNFEntrada;
    FStatusSolicitacao: TpcnStatusSolicitacao;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property CodigoControle: String read FCodigoControle write FCodigoControle;
    property StatusSolicitacao: TpcnStatusSolicitacao read FStatusSolicitacao write FStatusSolicitacao;
    property IdRemessa: String read FIdRemessa write FIdRemessa;
    property Justificativa: String read FJustificativa write FJustificativa;
    property ListaItens: TListaItemPapel read FListaItens write FListaItens;
    property NFComplementar: TNF read FNFComplementar write FNFComplementar;
    property NFEntrada: TNFEntrada read FNFEntrada write FNFEntrada;
  end;

  { TControleEstoque }

  TControleEstoque = class(TPersistent)
  private
    FCNPJ: String;
    FCNPJUF: String;
    FDataReferencia: TDateTime;
    FJustificativa: String;
    FListaItens: TListaItemPapel;
    FTipoDeclaracao: TpcnTipoDeclaracao;
    FTipoInforme: TpcnTipoInforme;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property CNPJ: String read FCNPJ write FCNPJ;
    property CNPJUF: String read FCNPJUF write FCNPJUF;
    property TipoInforme: TpcnTipoInforme read FTipoInforme write FTipoInforme;
    property DataReferencia: TDateTime read FDataReferencia write FDataReferencia;
    property TipoDeclaracao: TpcnTipoDeclaracao read FTipoDeclaracao write FTipoDeclaracao;
    property Justificativa: String read FJustificativa write FJustificativa;
    property ListaItens: TListaItemPapel read FListaItens write FListaItens;
  end;


implementation

{ TControleEstoque }

constructor TControleEstoque.Create;
begin
  inherited Create;
  FListaItens := TListaItemPapel.Create;
end;

destructor TControleEstoque.Destroy;
begin
  FListaItens.Free;
  inherited Destroy;
end;

procedure TControleEstoque.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
end;

{ TConfirmaSolicitacao }

constructor TConfirmaSolicitacao.Create;
begin
  inherited Create;
  FListaItens:= TListaItemPapel.Create;
  FNFComplementar:= TNF.Create;
  FNFEntrada:= TNFEntrada.Create;
end;

destructor TConfirmaSolicitacao.Destroy;
begin
  FNFEntrada.Free;
  FListaItens.Free;
  FNFComplementar.Free;
  inherited Destroy;
end;

procedure TConfirmaSolicitacao.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
end;

{ TInclusaoNF }

constructor TInclusaoNF.Create;
begin
  inherited Create;
  FNF := TNF.Create;
end;

destructor TInclusaoNF.Destroy;
begin
  FNF.Free;
  inherited Destroy;
end;

procedure TInclusaoNF.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
end;

{ TListaItemPapel }

function TListaItemPapel.GetObjects(Index: Integer): TItemPapel;
begin
  Result := inherited GetItem(Index) as TItemPapel;
end;

procedure TListaItemPapel.SetObjects(Index: Integer; AValue: TItemPapel);
begin
  inherited SetItem(Index, AValue)
end;

procedure TListaItemPapel.Insert(Index: Integer; Obj: TItemPapel);
begin
   inherited Insert(Index, Obj);
end;

function TListaItemPapel.Add(Obj: TItemPapel): Integer;
begin
  Result := inherited Add(Obj);
end;

{ TListaSolicitacao }

constructor TListaSolicitacao.Create;
begin
  inherited Create;
  FNF := TNF.Create;
  FListaItens:= TListaItemPapel.Create;
end;

destructor TListaSolicitacao.Destroy;
begin
  FNF.Free;
  FListaItens.Free;
  inherited Destroy;
end;

procedure TListaSolicitacao.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
end;

end.

