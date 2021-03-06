{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera??o com equipa- }
{ mentos de Automa??o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2009   Isaque Pinheiro                      }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Voc? pode obter a ?ltima vers?o desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{  Esta biblioteca ? software livre; voc? pode redistribu?-la e/ou modific?-la }
{ sob os termos da Licen?a P?blica Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a vers?o 2.1 da Licen?a, ou (a seu crit?rio) }
{ qualquer vers?o posterior.                                                   }
{                                                                              }
{  Esta biblioteca ? distribu?da na expectativa de que seja ?til, por?m, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia impl?cita de COMERCIABILIDADE OU      }
{ ADEQUA??O A UMA FINALIDADE ESPEC?FICA. Consulte a Licen?a P?blica Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICEN?A.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Voc? deve ter recebido uma c?pia da Licen?a P?blica Geral Menor do GNU junto}
{ com esta biblioteca; se n?o, escreva para a Free Software Foundation, Inc.,  }
{ no endere?o 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Voc? tamb?m pode obter uma copia da licen?a em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Sim?es de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Pra?a Anita Costa, 34 - Tatu? - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{******************************************************************************
|* Historico
|*
|* 10/04/2009: Isaque Pinheiro
|*  - Cria??o e distribui??o da Primeira Versao
*******************************************************************************}

unit ACBrPAF_E;

interface

uses
  SysUtils, Classes, DateUtils, ACBrPAFRegistros;

type
  /// REGISTRO TIPO E1 - IDENTIFICA??O DO ESTABELECIMENTO USU?RIO DO PAF-ECF

  TRegistroE1 = class(TRegistroX1)
  end;

  /// REGISTRO TIPO E2 - RELA??O DAS MERCADORIAS EM ESTOQUE

  TRegistroE2 = class(TPersistent)
  private
    fCOD_MERC: string;     /// C?digo da mercadoria ou produto cadastrado na tabela a que se refere o requisito XI
    fDESC_MERC: string;    /// Descri??o da mercadoria ou produto cadastrada na tabela a que se refere o requisito XI
    fUN_MED: string;       /// Unidade de medida cadastrada na tabela a que se refere o requisito XI
    fQTDE_EST: currency;   /// Quantidade da mercadoria ou produto constante no estoque, com duas casas decimais.
    fDT_EST: TDateTime;    /// Data de emiss?o do DAV
  public
    property COD_MERC: string read FCOD_MERC write FCOD_MERC;
    property DESC_MERC: string read FDESC_MERC write FDESC_MERC;
    property UN_MED: string read FUN_MED write FUN_MED;
    property QTDE_EST: currency read FQTDE_EST write FQTDE_EST;
    property DT_EST: TDateTime read FDT_EST write FDT_EST;
  end;

  /// REGISTRO E2 - Lista

  TRegistroE2List = class(TList)
  private
    function GetItem(Index: Integer): TRegistroE2;
    procedure SetItem(Index: Integer; const Value: TRegistroE2);
  public
    destructor Destroy; override;
    function New: TRegistroE2;
    property Items[Index: Integer]: TRegistroE2 read GetItem write SetItem;
  end;

  /// REGISTRO TIPO E9 - TOTALIZA??O DO ARQUIVO

  TRegistroE9 = class(TRegistroX9)
  end;

implementation

(* TRegistroE2List *)

destructor TRegistroE2List.Destroy;
var
intFor: integer;
begin
  for intFor := 0 to Count - 1 do Items[intFor].Free;
  inherited;
end;

function TRegistroE2List.GetItem(Index: Integer): TRegistroE2;
begin
  Result := TRegistroE2(inherited Items[Index]);
end;

function TRegistroE2List.New: TRegistroE2;
begin
  Result := TRegistroE2.Create;
  Add(Result);
end;

procedure TRegistroE2List.SetItem(Index: Integer; const Value: TRegistroE2);
begin
  Put(Index, Value);
end;

end.
