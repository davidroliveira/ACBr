{******************************************************************************}
{ Projeto: Componente ACBrLMC                                                 }
{  Biblioteca multiplataforma de componentes Delphi                            }
{                                                                              }
{  Você pode obter a última versão desse arquivo na pagina do Projeto ACBr     }
{ Componentes localizado em http://www.sourceforge.net/projects/acbr           }
{                                                                              }
{                                                                              }
{  Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }
{                                                                              }
{  Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU      }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto}
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,  }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Você também pode obter uma copia da licença em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Simões de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Praça Anita Costa, 34 - Tatuí - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{*******************************************************************************
|* Historico
|*
|* 20/07/2015: Italo Jurisato Junior
|*  - Doação do componente para o Projeto ACBr
*******************************************************************************}

{$I ACBr.inc}

unit plmcLMC;

interface

uses
  SysUtils, Classes,
{$IFNDEF VER130}
  Variants,
{$ENDIF}
  pcnConversao, plmcConversao, plmcSignature, plmcProcLMC, pcnGerador;

type

  TLMC = class;

  TinfLMC = class;
  Temit   = class;

  Tmovimento                  = class;
  TinfMovimentoCollection     = class;
  TinfMovimentoCollectionItem = class;

  TvolumeRecebidoCollection     = class;
  TvolumeRecebidoCollectionItem = class;

  TvolumeVendidoCollection     = class;
  TvolumeVendidoCollectionItem = class;

////////////////////////////////////////////////////////////////////////////////

  TLMC = class(TPersistent)
  private
    FinfLMC: TinfLMC;
    FProcLMC: TProcLMC;
    FSignature: TSignature;

  public
    constructor Create;
    destructor Destroy; override;
  published
    property infLMC: TinfLMC       read FinfLMC    write FinfLMC;
    property procLMC: TProcLMC     read FProcLMC   write FProcLMC;
    property signature: Tsignature read Fsignature write Fsignature;
  end;

  TinfLMC = class(TPersistent)
  private
    FId: String;
    FVersao: Double;
    FtpAmb: TpcnTipoAmbiente;
    FcNumerico: Integer;
    FcDV: Integer;
    Femit: Temit;
    Fmovimento: Tmovimento;

    function GetVersaoStr: String;
  public
    constructor Create(AOwner: TLMC);
    destructor Destroy; override;
  published
    property Id: String              read FId        write FId;
    property versao: Double          read FVersao    write FVersao;
    property tpAmb: TpcnTipoAmbiente read FtpAmb     write FtpAmb;
    property cNumerico: Integer      read FcNumerico write FcNumerico;
    property cDV: Integer            read FcDV       write FcDV;
    property VersaoStr: String       read GetVersaoStr;
    property emit: Temit             read Femit      write Femit;
    property movimento: Tmovimento   read Fmovimento write Fmovimento;
  end;

  Temit = class(TPersistent)
  private
    FIE: String;
    FCNPJ: String;
    FxNome: String;
  published
    property IE: String    read FIE    write FIE;
    property CNPJ: String  read FCNPJ  write FCNPJ;
    property xNome: String read FxNome write FxNome;
  end;

  Tmovimento = class(TPersistent)
  private
    FdEmissao: TDateTime;
    FinfMovimento: TinfMovimentoCollection;

    procedure SetinfMovimento(const Value: TinfMovimentoCollection);
  public
    constructor Create; reintroduce;
//    constructor Create(AOwner: TinfLMC);
    destructor Destroy; override;
  published
    property dEmissao: TDateTime                   read FdEmissao     write FdEmissao;
    property infMovimento: TinfMovimentoCollection read FinfMovimento write SetinfMovimento;
  end;

  TinfMovimentoCollection = class(TCollection)
  private
    function GetItem(Index: Integer): TinfMovimentoCollectionItem;
    procedure SetItem(Index: Integer; Value: TinfMovimentoCollectionItem);
  public
    constructor Create(AOwner: Tmovimento);
    function Add: TinfMovimentoCollectionItem;
    property Items[Index: Integer]: TinfMovimentoCollectionItem read GetItem write SetItem; default;
  end;

  TinfMovimentoCollectionItem = class(TCollectionItem)
  private
    FnrProduto: TidProduto;
    FvolEstoqueAbertura: Double;
    FvolumeRecebido: TvolumeRecebidoCollection;
    FvolumeVendido: TvolumeVendidoCollection;
    FvolEstoqueFechamento: Double;
    FvalVendasDiaBomba: Double;
    FvalAcumuladoMes: Double;
    Fobservacoes: String;

    procedure SetvolumeRecebido(const Value: TvolumeRecebidoCollection);
    procedure SetvolumeVendido(const Value: TvolumeVendidoCollection);
  public
    constructor Create; reintroduce;
//    constructor Create(AOwner: Tmovimento);
    destructor Destroy; override;
  published
    property nrProduto: TidProduto                     read FnrProduto            write FnrProduto;
    property volEstoqueAbertura: Double                read FvolEstoqueAbertura   write FvolEstoqueAbertura;
    property volumeRecebido: TvolumeRecebidoCollection read FvolumeRecebido       write SetvolumeRecebido;
    property volumeVendido: TvolumeVendidoCollection   read FvolumeVendido        write SetvolumeVendido;
    property volEstoqueFechamento: Double              read FvolEstoqueFechamento write FvolEstoqueFechamento;
    property valVendasDiaBomba: Double                 read FvalVendasDiaBomba    write FvalVendasDiaBomba;
    property valAcumuladoMes: Double                   read FvalAcumuladoMes      write FvalAcumuladoMes;
    property observacoes: String                       read Fobservacoes          write Fobservacoes;
  end;

  TvolumeRecebidoCollection = class(TCollection)
  private
    function GetItem(Index: Integer): TvolumeRecebidoCollectionItem;
    procedure SetItem(Index: Integer; Value: TvolumeRecebidoCollectionItem);
  public
    constructor Create(AOwner: TinfMovimentoCollectionItem);
    function Add: TvolumeRecebidoCollectionItem;
    property Items[Index: Integer]: TvolumeRecebidoCollectionItem read GetItem write SetItem; default;
  end;

  TvolumeRecebidoCollectionItem = class(TCollectionItem)
  private
    FCNPJ: String;
    FnNF: Integer;
    FdNF: TDateTime;
    FvolVolume: Double;
    FxTanque: String;
  public
    constructor Create; reintroduce;
    destructor Destroy; override;
  published
    property CNPJ: String   read FCNPJ   write FCNPJ;
    property nNF: Integer read FnNF write FnNF;
    property dNF: TDateTime read FdNF write FdNF;
    property volVolume: Double read FvolVolume write FvolVolume;
    property xTanque: String   read FxTanque   write FxTanque;
  end;

  TvolumeVendidoCollection = class(TCollection)
  private
    function GetItem(Index: Integer): TvolumeVendidoCollectionItem;
    procedure SetItem(Index: Integer; Value: TvolumeVendidoCollectionItem);
  public
    constructor Create(AOwner: TinfMovimentoCollectionItem);
    function Add: TvolumeVendidoCollectionItem;
    property Items[Index: Integer]: TvolumeVendidoCollectionItem read GetItem write SetItem; default;
  end;

  TvolumeVendidoCollectionItem = class(TCollectionItem)
  private
    FxTanque: String;
    FnrBico: Integer;
    FvolFechamento: Double;
    FvolAbertura: Double;
    FvolAfericoes: Double;
  public
    constructor Create; reintroduce;
    destructor Destroy; override;
  published
    property xTanque: String   read FxTanque   write FxTanque;
    property nrBico: Integer read FnrBico write FnrBico;
    property volFechamento: Double read FvolFechamento write FvolFechamento;
    property volAbertura: Double read FvolAbertura write FvolAbertura;
    property volAfericoes: Double read FvolAfericoes write FvolAfericoes;
  end;

////////////////////////////////////////////////////////////////////////////////

implementation

Uses
  ACBrUtil;

{ TLMC }

constructor TLMC.Create;
begin
  FinfLMC := TInfLMC.Create(Self);
  FProcLMC := TProcLMC.create;
  Fsignature := Tsignature.create;
end;

destructor TLMC.Destroy;
begin
  FinfLMC.Free;
  FProcLMC.Free;
  Fsignature.Free;

  inherited;
end;

{ TinfLMC }

constructor TinfLMC.Create(AOwner: TLMC);
begin
  Femit := Temit.Create;
  Fmovimento := Tmovimento.Create; //(Self);
end;

destructor TinfLMC.Destroy;
begin
  Femit.Free;
  Fmovimento.Free;

  inherited;
end;

function TinfLMC.GetVersaoStr: String;
begin
  if FVersao <= 0 then
     Result := V1_00
  else
     Result := 'versao="' + FloatToString(FVersao, '.', '#0.00') + '"';
end;

{ Tmovimento }

constructor Tmovimento.Create; //(AOwner: TinfLMC);
begin
  inherited Create;
  FinfMovimento := TinfMovimentoCollection.Create(Self);
end;

destructor Tmovimento.Destroy;
begin
  FinfMovimento.Free;

  inherited;
end;

procedure Tmovimento.SetinfMovimento(const Value: TinfMovimentoCollection);
begin
  FinfMovimento := Value;
end;

{ TinfMovimentoCollection }

function TinfMovimentoCollection.Add: TinfMovimentoCollectionItem;
begin
  Result := TinfMovimentoCollectionItem(inherited Add);
  Result.create;
end;

constructor TinfMovimentoCollection.Create(AOwner: Tmovimento);
begin
  inherited Create(TinfMovimentoCollectionItem);
end;

function TinfMovimentoCollection.GetItem(
  Index: Integer): TinfMovimentoCollectionItem;
begin
  Result := TinfMovimentoCollectionItem(inherited GetItem(Index));
end;

procedure TinfMovimentoCollection.SetItem(Index: Integer;
  Value: TinfMovimentoCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TinfMovimentoCollectionItem }

constructor TinfMovimentoCollectionItem.Create; //(AOwner: Tmovimento);
begin
  FvolumeRecebido := TvolumeRecebidoCollection.Create(Self);
  FvolumeVendido := TvolumeVendidoCollection.Create(Self);
end;

destructor TinfMovimentoCollectionItem.Destroy;
begin
  FvolumeRecebido.Free;
  FvolumeVendido.Free;

  inherited;
end;

procedure TinfMovimentoCollectionItem.SetvolumeRecebido(
  const Value: TvolumeRecebidoCollection);
begin
  FvolumeRecebido := Value;
end;

procedure TinfMovimentoCollectionItem.SetvolumeVendido(
  const Value: TvolumeVendidoCollection);
begin
  FvolumeVendido := Value;
end;

{ TvolumeRecebidoCollection }

function TvolumeRecebidoCollection.Add: TvolumeRecebidoCollectionItem;
begin
  Result := TvolumeRecebidoCollectionItem(inherited Add);
  Result.create;
end;

constructor TvolumeRecebidoCollection.Create(
  AOwner: TinfMovimentoCollectionItem);
begin
  inherited Create(TvolumeRecebidoCollectionItem);
//  FvolumeRecebido := TvolumeRecebidoCollection.Create(Self);
end;

function TvolumeRecebidoCollection.GetItem(
  Index: Integer): TvolumeRecebidoCollectionItem;
begin
  Result := TvolumeRecebidoCollectionItem(inherited GetItem(Index));
end;

procedure TvolumeRecebidoCollection.SetItem(Index: Integer;
  Value: TvolumeRecebidoCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TvolumeRecebidoCollectionItem }

constructor TvolumeRecebidoCollectionItem.Create;
begin

end;

destructor TvolumeRecebidoCollectionItem.Destroy;
begin

  inherited;
end;

{ TvolumeVendidoCollection }

function TvolumeVendidoCollection.Add: TvolumeVendidoCollectionItem;
begin
  Result := TvolumeVendidoCollectionItem(inherited Add);
  Result.create;
end;

constructor TvolumeVendidoCollection.Create(
  AOwner: TinfMovimentoCollectionItem);
begin
  inherited Create(TvolumeVendidoCollectionItem);
//  FvolumeVendido := TvolumeVendidoCollection.Create(Self);
end;

function TvolumeVendidoCollection.GetItem(
  Index: Integer): TvolumeVendidoCollectionItem;
begin
  Result := TvolumeVendidoCollectionItem(inherited GetItem(Index));
end;

procedure TvolumeVendidoCollection.SetItem(Index: Integer;
  Value: TvolumeVendidoCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TvolumeVendidoCollectionItem }

constructor TvolumeVendidoCollectionItem.Create;
begin

end;

destructor TvolumeVendidoCollectionItem.Destroy;
begin

  inherited;
end;

end.

