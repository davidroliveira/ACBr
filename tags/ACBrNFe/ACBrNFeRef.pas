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
|* 04/05/2009: Jo�o Henrique de Souza
|*  - Incluidas informa��es Referentes a NFRef
******************************************************************************}
unit ACBrNFeRef;

interface

uses
  Classes, ACBrNFeTypes,Controls;

type

  TANFRef = Class(TCollectionItem)
  private
    FRefNFe: String;
    FUF: string;
    FAAMM: String;
    FCNPJ: String;
    FModelo: string;
    FSerie: string;
    FnNF: string;
    procedure SetRefNFe(const Value: String);
    procedure SetUF(const Value: String);
    procedure SetAAMM(const Value: String);
    procedure SetCNPJ(const Value: String);
    procedure SetModelo(const Value: String);
    procedure SetSerie(const Value: String);
    procedure SetnNF(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property RefNFe:string read FRefNFe write SetRefNFe;
    property UF:string read FUF write SetUF;
    property AAMM:string read FAAMM write SetAAMM;
    property CNPJ:string read FCNPJ write SetCNPJ;
    property Modelo:string read FModelo write SetModelo;
    property Serie:string read FSerie write SetSerie;
    property nNF:string read FnNF write SetnNF;
  end;

  NFRef = class(TCollection)
  protected
    function GetItem(Index: Integer): TANFRef;
    procedure SetItem(Index: Integer; const Value: TANFRef);
  public
    function  Add: TANFRef;
    function Insert(Index: Integer): TANFRef;
    property Items[Index: Integer]: TANFRef read GetItem  write SetItem;
    //function GetNamePath: string; override;
  end;

  TNFRef = class(Tpersistent)
  private
    FNFRef: NFRef;
    procedure SetNFRef(const Value: NFRef);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property ANFRef : NFRef read FNFRef write SetNFRef;
  end;


implementation

{ TANFRef }

constructor TANFRef.Create;
begin
  inherited Create(Collection);
end;

destructor TANFRef.Destroy;
begin
  inherited;
end;

procedure TANFRef.SetRefNFe(const Value: String);
begin
  FRefNfe := Value;
end;

procedure TANFRef.SetUF(const Value: String);
begin
  FUF := Value;
end;

procedure TANFRef.SetAAMM(const Value: String);
begin
   FAAMM := Value;
end;

procedure TANFRef.SetCNPJ(const Value: String);
begin
   FCNPJ := Value;
end;

procedure TANFRef.SetModelo(const Value: String);
begin
   FModelo := Value;
end;

procedure TANFRef.SetSerie(const Value: String);
begin
   FSerie := Value;
end;

procedure TANFRef.SetnNF(const Value: string);
begin
   FnNF := Value;
end;


{ NFRef }

function NFRef.Add: TANFRef;
begin
  Result := TANFRef(inherited Add);
end;

function NFRef.GetItem(Index: Integer): TANFRef;
begin
  Result := TANFRef(inherited Items[Index]);
end;

function NFRef.Insert(Index: Integer): TANFRef;
begin
  Result := TANFRef(inherited Insert(Index));
end;

procedure NFRef.SetItem(Index: Integer; const Value: TANFRef);
begin
  Items[Index].Assign(Value);
end;

{function NFRef.GetNamePath: string;
begin
  Result := 'ANFRef';
end;}


{ TNFRef }

constructor TNFRef.Create;
begin
  FNFRef := NFRef.Create(TANFRef);
end;

destructor TNFRef.Destroy;
begin
  FNFRef.Free;
  inherited;
end;

procedure TNFRef.SetNFRef(const Value: NFRef);
begin
  FNFRef := Value;
end;

end.

