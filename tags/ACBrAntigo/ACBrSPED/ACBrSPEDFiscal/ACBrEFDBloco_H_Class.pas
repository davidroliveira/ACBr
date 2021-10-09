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

unit ACBrEFDBloco_H_Class;

interface

uses SysUtils, Classes, DateUtils, ACBrSped, ACBrEFDBlocos, ACBrEFDBloco_H;

type
  /// TBLOCO_H -
  TBloco_H = class(TACBrSPED)
  private
    FRegistroH001: TRegistroH001;      /// BLOCO H - RegistroH001
    FRegistroH990: TRegistroH990;      /// BLOCO H - RegistroH990

    FRegistroH005Count: Integer;
    FRegistroH010Count: Integer;

    function WriteRegistroH005(RegH001: TRegistroH001): String;
    function WriteRegistroH010(RegH005: TRegistroH005): String;

    procedure CriaRegistros;
    procedure LiberaRegistros;
  public
    constructor Create;           /// Create
    destructor Destroy; override; /// Destroy
    procedure LimpaRegistros;

    function RegistroH001New: TRegistroH001;
    function RegistroH005New: TRegistroH005;
    function RegistroH010New: TRegistroH010;

    function WriteRegistroH001: String;
    function WriteRegistroH990: String;

    property RegistroH001: TRegistroH001 read FRegistroH001 write FRegistroH001;
    property RegistroH990: TRegistroH990 read FRegistroH990 write FRegistroH990;

    property RegistroH005Count: Integer read FRegistroH005Count write FRegistroH005Count;
    property RegistroH010Count: Integer read FRegistroH010Count write FRegistroH010Count;
  end;

implementation

{ TBloco_H }

constructor TBloco_H.Create;
begin
  CriaRegistros;
end;

destructor TBloco_H.Destroy;
begin
  LiberaRegistros;
  inherited;
end;

procedure TBloco_H.CriaRegistros;
begin
  FRegistroH001 := TRegistroH001.Create;
  FRegistroH990 := TRegistroH990.Create;

  FRegistroH005Count := 0;
  FRegistroH010Count := 0;

  FRegistroH990.QTD_LIN_H := 0;
end;

procedure TBloco_H.LiberaRegistros;
begin
  FRegistroH001.Free;
  FRegistroH990.Free;
end;

procedure TBloco_H.LimpaRegistros;
begin
  /// Limpa os Registros
  LiberaRegistros;
  /// Recriar os Registros Limpos
  CriaRegistros;
end;

function TBloco_H.RegistroH001New: TRegistroH001;
begin
   Result := FRegistroH001;
end;

function TBloco_H.RegistroH005New: TRegistroH005;
begin
   Result := FRegistroH001.RegistroH005.New;
end;

function TBloco_H.RegistroH010New: TRegistroH010;
begin
   Result := FRegistroH001.RegistroH005.Items[FRegistroH001.RegistroH005.Count -1].RegistroH010.New;
end;

function TBloco_H.WriteRegistroH001: String;
var
strRegistroH001: string;
begin
  Result := '';

  if Assigned(RegistroH001) then
  begin
     with RegistroH001 do
     begin
        strRegistroH001 := strRegistroH001 + LFill( 'H001' ) +
                                             LFill( Integer(IND_MOV), 0 ) +
                                             Delimitador +
                                             #13#10;
        ///
        if IND_MOV = imComDados then
        begin
           strRegistroH001 := strRegistroH001 +
                              WriteRegistroH005(FRegistroH001);
        end;
     end;
     ///
     RegistroH990.QTD_LIN_H := RegistroH990.QTD_LIN_H + 1;
  end;
  Result := strRegistroH001;
end;

function TBloco_H.WriteRegistroH005(RegH001: TRegistroH001): String;
var
intFor: integer;
strRegistroH005: String;
begin
  strRegistroH005 := '';

  if Assigned( RegH001.RegistroH005 ) then
  begin
     for intFor := 0 to RegH001.RegistroH005.Count - 1 do
     begin
        with RegH001.RegistroH005.Items[intFor] do
        begin
          strRegistroH005 := strRegistroH005 + LFill('H005') +
                                               LFill( DT_INV ) +
                                               LFill( VL_INV, 0) +
                                               Delimitador +
                                               #13#10;
        end;
        /// Registros FILHOS
        strRegistroH005 := strRegistroH005 +
                           WriteRegistroH010( RegH001.RegistroH005.Items[intFor] );

        RegistroH990.QTD_LIN_H := RegistroH990.QTD_LIN_H + 1;
     end;
     /// Variav�l para armazenar a quantidade de registro do tipo.
     FRegistroH005Count := FRegistroH005Count + RegH001.RegistroH005.Count;
  end;
  Result := strRegistroH005;
end;

function TBloco_H.WriteRegistroH010(RegH005: TRegistroH005): String;
var
intFor: integer;
strRegistroH010: String;
begin
  strRegistroH010 := '';

  if Assigned( RegH005.RegistroH010 ) then
  begin
     for intFor := 0 to RegH005.RegistroH010.Count - 1 do
     begin
        with RegH005.RegistroH010.Items[intFor] do
        begin
          strRegistroH010 := strRegistroH010 + LFill('H010') +
                                               LFill( COD_ITEM ) +
                                               LFill( UNID ) +
                                               LFill( QTD, 0, 3 ) +
                                               LFill( VL_UNIT, 0, 6 ) +
                                               LFill( VL_ITEM, 0, 2 ) +
                                               LFill( Integer(IND_PROP), 0 ) +
                                               LFill( COD_PART ) +
                                               LFill( TXT_COMPL ) +
                                               LFill( COD_CTA ) +
                                               Delimitador +
                                               #13#10;
        end;
        RegistroH990.QTD_LIN_H := RegistroH990.QTD_LIN_H + 1;
     end;
     /// Variav�l para armazenar a quantidade de registro do tipo.
     FRegistroH010Count := FRegistroH010Count + RegH005.RegistroH010.Count;
  end;
  Result := strRegistroH010;
end;

function TBloco_H.WriteRegistroH990: String;
begin
  Result := '';

  if Assigned(RegistroH990) then
  begin
     with RegistroH990 do
     begin
       QTD_LIN_H := QTD_LIN_H + 1;
       ///
       Result := LFill('H990') +
                 LFill(QTD_LIN_H,0) +
                 Delimitador +
                 #13#10;
     end;
  end;
end;

end.
