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

unit ACBrEFDBloco_G_Class;

interface

uses SysUtils, Classes, DateUtils, ACBrSped, ACBrEFDBloco_G, ACBrEFDBlocos,
     ACBrEFDBloco_0_Class;

type
  /// TBLOCO_H -
  TBloco_G = class(TACBrSPED)
  private
    FBloco_0: TBloco_0;
    FRegistroG001: TRegistroG001;      /// BLOCO G - RegistroG001
    FRegistroG990: TRegistroG990;      /// BLOCO G - RegistroG990

    FRegistroG110Count: Integer;
    FRegistroG125Count: Integer;
    FRegistroG130Count: Integer;
    FRegistroG140Count: Integer;

    function WriteRegistroG110(RegG001: TRegistroG001): String;
    function WriteRegistroG125(RegG110: TRegistroG110): String;
    function WriteRegistroG130(RegG125: TRegistroG125): String;
    function WriteRegistroG140(RegG130: TRegistroG130): String;

    procedure CriaRegistros;
    procedure LiberaRegistros;
  public
    constructor Create;           /// Create
    destructor Destroy; override; /// Destroy
    procedure LimpaRegistros;

    function RegistroG001New: TRegistroG001;
    function RegistroG110New: TRegistroG110;
    function RegistroG125New: TRegistroG125;
    function RegistroG130New: TRegistroG130;
    function RegistroG140New: TRegistroG140;

    function WriteRegistroG001: String;
    function WriteRegistroG990: String;

    property Bloco_0: TBloco_0 read FBloco_0 write FBloco_0;
    property RegistroG001: TRegistroG001 read FRegistroG001 write FRegistroG001;
    property RegistroG990: TRegistroG990 read FRegistroG990 write FRegistroG990;

    property RegistroG110Count: Integer read FRegistroG110Count write FRegistroG110Count;
    property RegistroG125Count: Integer read FRegistroG125Count write FRegistroG125Count;
    property RegistroG130Count: Integer read FRegistroG130Count write FRegistroG130Count;
    property RegistroG140Count: Integer read FRegistroG140Count write FRegistroG140Count;

  end;

implementation

{ TBloco_G }

constructor TBloco_G.Create;
begin
  CriaRegistros;
end;

destructor TBloco_G.Destroy;
begin
  LiberaRegistros;
  inherited;
end;

procedure TBloco_G.CriaRegistros;
begin
  FRegistroG001 := TRegistroG001.Create;
  FRegistroG990 := TRegistroG990.Create;

  FRegistroG110Count := 0;
  FRegistroG125Count := 0;
  FRegistroG130Count := 0;
  FRegistroG140Count := 0;

  FRegistroG990.QTD_LIN_G := 0;
end;

procedure TBloco_G.LiberaRegistros;
begin
  FRegistroG001.Free;
  FRegistroG990.Free;
end;

procedure TBloco_G.LimpaRegistros;
begin
  FRegistroG990.QTD_LIN_G := 0;
end;

function TBloco_G.RegistroG001New: TRegistroG001;
begin
   Result := FRegistroG001;
end;

function TBloco_G.RegistroG110New: TRegistroG110;
begin
   Result := FRegistroG001.RegistroG110.New;
end;

function TBloco_G.RegistroG125New: TRegistroG125;
var
G110Count: integer;
begin
   G110Count := FRegistroG001.RegistroG110.Count -1;
   //
   Result := FRegistroG001.RegistroG110.Items[G110Count].RegistroG125.New;
end;

function TBloco_G.RegistroG130New: TRegistroG130;
var
G110Count: integer;
G125Count: integer;
begin
   G110Count := FRegistroG001.RegistroG110.Count -1;
   G125Count := FRegistroG001.RegistroG110.Items[G110Count].RegistroG125.Count -1;
   //
   Result := FRegistroG001.RegistroG110.Items[G110Count].RegistroG125.Items[G125Count].RegistroG130.New;
end;

function TBloco_G.RegistroG140New: TRegistroG140;
var
G110Count: integer;
G125Count: integer;
G130Count: integer;
begin
   G110Count := FRegistroG001.RegistroG110.Count -1;
   G125Count := FRegistroG001.RegistroG110.Items[G110Count].RegistroG125.Count -1;
   G130Count := FRegistroG001.RegistroG110.Items[G110Count].RegistroG125.Items[G125Count].RegistroG130.Count -1;
   //
   Result := FRegistroG001.RegistroG110.Items[G110Count].RegistroG125.Items[G125Count].RegistroG130.Items[G130Count].RegistroG140.New;
end;

function TBloco_G.WriteRegistroG001: String;
var
strRegistroG001: String;
begin
  Result := '';

  if Assigned(RegistroG001) then
  begin
     with RegistroG001 do
     begin
        strRegistroG001 :=  strRegistroG001 + LFill( 'G001' ) +
                                              LFill( Integer(IND_MOV), 0 ) +
                                              Delimitador +
                                              #13#10;
        ///
        if IND_MOV = imComDados then
        begin
           strRegistroG001 := strRegistroG001 +
                              WriteRegistroG110(FRegistroG001);
        end;
     end;
     RegistroG990.QTD_LIN_G := RegistroG990.QTD_LIN_G + 1;
  end;
  Result := strRegistroG001;
end;

function TBloco_G.WriteRegistroG110(RegG001: TRegistroG001): String;
var
intFor: integer;
strRegistroG110: String;
begin
  Result := '';

  if Assigned(RegG001.RegistroG110) then
  begin
     for intFor := 0 to RegG001.RegistroG110.Count - 1 do
     begin
        with RegG001.RegistroG110.Items[intFor] do
        begin
           strRegistroG110 := strRegistroG110 +  LFill('G110') +
                                                 LFill( DT_INI) +
                                                 LFill( DT_FIN) +
                                                 LFill( MODO_CIAP ) +
                                                 LFill( SALDO_IN_ICMS, 0, 2 ) +
                                                 LFill( SALDO_FN_ICMS, 0, 2 ) +
                                                 LFill( SOM_PARC, 0, 2 ) +
                                                 LFill( VL_TRIB_EXP, 0, 2 ) +
                                                 LFill( VL_TOTAL, 0, 2 ) +
                                                 DFill( PER_SAI_TRIB, 4 ) +
                                                 LFill( ICMS_APROP, 0, 2 ) +
                                                 Delimitador +
                                                 #13#10;
           ///
           strRegistroG110 := strRegistroG110 +
                              WriteRegistroG125( RegG001.RegistroG110.Items[intFor] );
         end;
        RegistroG990.QTD_LIN_G := RegistroG990.QTD_LIN_G + 1;
     end;
     /// Variav�l para armazenar a quantidade de registro do tipo.
     FRegistroG110Count := FRegistroG110Count + RegG001.RegistroG110.Count;
  end;
  Result := strRegistroG110;
end;

function TBloco_G.WriteRegistroG125(RegG110: TRegistroG110): String;
var
intFor: integer;
strTIPO_MOV: String;
strRegistroG125: String;
begin
  strRegistroG125 := '';

  if Assigned( RegG110.RegistroG125 ) then
  begin
     for intFor := 0 to RegG110.RegistroG125.Count - 1 do
     begin
        with RegG110.RegistroG125.Items[intFor] do
        begin
          case TIPO_MOV of
           mbcSI: strTIPO_MOV := 'SI';
           mbcIM: strTIPO_MOV := 'IM';
           mbcIA: strTIPO_MOV := 'IA';
           mbcCI: strTIPO_MOV := 'CI';
           mbcMC: strTIPO_MOV := 'MC';
           mbcBA: strTIPO_MOV := 'BA';
           mbcAT: strTIPO_MOV := 'AT';
           mbcPE: strTIPO_MOV := 'PE';
           mbcOT: strTIPO_MOV := 'OT';
          end;
          strRegistroG125 := strRegistroG125 + LFill('E111') +
                                               LFill( COD_IND_BEM ) +
                                               LFill( DT_MOV ) +
                                               LFill( strTIPO_MOV ) +
                                               LFill( VL_IMOB_ICMS_OP, 0, 2 ) +
                                               LFill( VL_IMOB_ICMS_ST, 0, 2 ) +
                                               LFill( VL_IMOB_ICMS_FRT, 0, 2 ) +
                                               LFill( VL_IMOB_ICMS_DIF, 0, 2 ) +
                                               LFill( NUM_PARC ,0 ) +
                                               LFill( VL_PARC_PASS, 0, 2 ) +
                                               LFill( VL_PARC_APROP, 0, 2 ) +
                                               Delimitador +
                                               #13#10;
        end;
        /// Registro FILHOS do FILHO
        strRegistroG125 := strRegistroG125 +
                           WriteRegistroG130( RegG110.RegistroG125.Items[intFor]);

        RegistroG990.QTD_LIN_G := RegistroG990.QTD_LIN_G + 1;
     end;
     /// Variav�l para armazenar a quantidade de registro do tipo.
     FRegistroG125Count := FRegistroG125Count + RegG110.RegistroG125.Count;
  end;
  Result := strRegistroG125;
end;

function TBloco_G.WriteRegistroG130(RegG125: TRegistroG125): String;
var
intFor: integer;
strRegistroG130: String;
begin
  strRegistroG130 := '';

  if Assigned( RegG125.RegistroG130 ) then
  begin
     for intFor := 0 to RegG125.RegistroG130.Count - 1 do
     begin
        with RegG125.RegistroG130.Items[intFor] do
        begin
          strRegistroG130 := strRegistroG130 + LFill('E111') +
                                               LFill( Integer(IND_EMIT), 0 ) +
                                               LFill( COD_PART ) +
                                               LFill( COD_MOD ) +
                                               LFill( SERIE ) +
                                               LFill( NUM_DOC ) +
                                               LFill( CHV_NFE_CTE ) +
                                               LFill( DT_DOC ) +
                                               Delimitador +
                                               #13#10;
        end;
        strRegistroG130 := strRegistroG130 +
                           WriteRegistroG140( RegG125.RegistroG130.Items[intFor]);
        RegistroG990.QTD_LIN_G := RegistroG990.QTD_LIN_G + 1;
     end;
     /// Variav�l para armazenar a quantidade de registro do tipo.
     FRegistroG130Count := FRegistroG130Count + RegG125.RegistroG130.Count;
  end;
  Result := strRegistroG130;

end;

function TBloco_G.WriteRegistroG140(RegG130: TRegistroG130): String;
var
intFor: integer;
strRegistroG140: String;
begin
  strRegistroG140 := '';

  if Assigned( RegG130.RegistroG140 ) then
  begin
     for intFor := 0 to RegG130.RegistroG140.Count - 1 do
     begin
        with RegG130.RegistroG140.Items[intFor] do
        begin
          Check(FBloco_0.Registro0001.Registro0200.LocalizaRegistro(COD_ITEM), '(G-G140) ITENS: O c�digo do item "%s" n�o existe no registro 0200!', [COD_ITEM]);

          strRegistroG140 := strRegistroG140 + LFill('E111') +
                                               LFill( NUM_ITEM, 3) +
                                               LFill( COD_ITEM ) +
                                               Delimitador +
                                               #13#10;
        end;
        RegistroG990.QTD_LIN_G := RegistroG990.QTD_LIN_G + 1;
     end;
     FRegistroG140Count := FRegistroG140Count + RegG130.RegistroG140.Count;
  end;
  Result := strRegistroG140;
end;

function TBloco_G.WriteRegistroG990: String;
begin
  Result := '';

  if Assigned(RegistroG990) then
  begin
     with RegistroG990 do
     begin
       QTD_LIN_G := QTD_LIN_G + 1;
       ///
       Result := LFill('G990') +
                 LFill(QTD_LIN_G,0) +
                 Delimitador +
                 #13#10;
     end;
  end;
end;

end.
