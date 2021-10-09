{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2009   Isaque Pinheiro                      }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
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
|* 10/04/2009: Isaque Pinheiro
|*  - Cria��o e distribui��o da Primeira Versao
*******************************************************************************}

unit ACBrPAF_D;

interface

uses
  SysUtils, Classes, Contnrs, DateUtils, ACBrPAFRegistros;

type
  /// REGISTRO TIPO D1 - IDENTIFICA��O DO ESTABELECIMENTO USU�RIO DO PAF-ECF

  TRegistroD1 = class(TRegistroX1)
  end;

  /// REGISTRO TIPO D2 - RELA��O DOS DAV EMITIDOS:

  TRegistroD2 = class
  private
    fNUM_FAB: string;      /// N� de fabrica��o do ECF
    fMF_ADICIONAL: string; /// Letra indicativa de MF adicional
    fTIPO_ECF: string;     /// Tipo do ECF
    fMARCA_ECF: string;    /// Marca do ECF
    fMODELO_ECF: string;   /// Modelo do ECF
    fCOO: string;          /// Contador de Ordem de Opera��o do documento onde o DAV foi impresso pelo ECF
    fNUM_DAV: string;      /// N�mero do DAV emitido
    fDT_DAV: TDateTime;    /// Data de emiss�o do DAV
    fTIT_DAV: string;      /// T�tulo atribu�do ao DAV de acordo com sua fun��o. Ex: Or�amento, Pedido, etc.
    fVLT_DAV: currency;    /// Valor total do DAV emitido, com duas casas decimais
    fCCF: string;          /// Contador de Cupom Fiscal do documento fiscal vinculado
  public
    property NUM_FAB: string read FNUM_FAB write FNUM_FAB;
    property MF_ADICIONAL: string read FMF_ADICIONAL write FMF_ADICIONAL;
    property TIPO_ECF: string read FTIPO_ECF write FTIPO_ECF;
    property MARCA_ECF: string read FMARCA_ECF write FMARCA_ECF;
    property MODELO_ECF: string read FMODELO_ECF write FMODELO_ECF;
    property COO: string read FCOO write FCOO;
    property NUM_DAV: string read FNUM_DAV write FNUM_DAV;
    property DT_DAV: TDateTime read FDT_DAV write FDT_DAV;
    property TIT_DAV: string read FTIT_DAV write FTIT_DAV;
    property VLT_DAV: currency read FVLT_DAV write FVLT_DAV;
    property CCF: string read FCCF write FCCF;
  end;

  /// REGISTRO D2 - Lista

  TRegistroD2List = class(TObjectList)
  private
    function GetItem(Index: Integer): TRegistroD2;
    procedure SetItem(Index: Integer; const Value: TRegistroD2);
  public
    function New: TRegistroD2;
    property Items[Index: Integer]: TRegistroD2 read GetItem write SetItem;
  end;

  /// REGISTRO TIPO D9 - TOTALIZA��O DO ARQUIVO

  TRegistroD9 = class(TRegistroX9)
  end;

implementation

(* TRegistroD2List *)

function TRegistroD2List.GetItem(Index: Integer): TRegistroD2;
begin
  Result := TRegistroD2(inherited Items[Index]);
end;

function TRegistroD2List.New: TRegistroD2;
begin
  Result := TRegistroD2.Create;
  Add(Result);
end;

procedure TRegistroD2List.SetItem(Index: Integer; const Value: TRegistroD2);
begin
  Put(Index, Value);
end;

end.
