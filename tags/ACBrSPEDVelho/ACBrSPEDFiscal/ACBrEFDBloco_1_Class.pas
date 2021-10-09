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

unit ACBrEFDBloco_1_Class;

interface

uses SysUtils, Classes, DateUtils, ACBrSped, ACBrEFDBloco_1;

type
  /// TBLOCO_1 -
  TBloco_1 = class(TACBrSPED)
  private
    FRegistro1001: TRegistro1001;      /// BLOCO 1 - Registro1001
    FRegistro1100: TRegistro1100List;  /// BLOCO 1 - Lista de Registro1100
    FRegistro1105: TRegistro1105List;  /// BLOCO 1 - Lista de Registro1105
    FRegistro1110: TRegistro1110List;  /// BLOCO 1 - Lista de Registro1110
    FRegistro1200: TRegistro1200List;  /// BLOCO 1 - Lista de Registro1200
    FRegistro1210: TRegistro1210List;  /// BLOCO 1 - Lista de Registro1210
    FRegistro1300: TRegistro1300List;  /// BLOCO 1 - Lista de Registro1300
    FRegistro1350: TRegistro1350List;  /// BLOCO 1 - Lista de Registro1350
    FRegistro1400: TRegistro1400List;  /// BLOCO 1 - Lista de Registro1400
    FRegistro1500: TRegistro1500List;  /// BLOCO 1 - Lista de Registro1500
    FRegistro1510: TRegistro1510List;  /// BLOCO 1 - Lista de Registro1510
    FRegistro1600: TRegistro1600List;  /// BLOCO 1 - Lista de Registro1600
    FRegistro1700: TRegistro1700List;  /// BLOCO 1 - Lista de Registro1700
    FRegistro1710: TRegistro1710List;  /// BLOCO 1 - Lista de Registro1710
    FRegistro1800: TRegistro1800List;  /// BLOCO 1 - Lista de Registro1800
    FRegistro1990: TRegistro1990;      /// BLOCO 1 - Registro1990

    FRegistro1310Count: Integer;
    FRegistro1320Count: Integer;
    FRegistro1360Count: Integer;
    FRegistro1370Count: Integer;
    FRegistro1710Count: Integer;

    function WriteRegistro1310(Reg1300: TRegistro1300): AnsiString;
    function WriteRegistro1320(Reg1310: TRegistro1310): AnsiString;
    function WriteRegistro1360(Reg1350: TRegistro1350): AnsiString;
    function WriteRegistro1370(Reg1350: TRegistro1350): AnsiString;
    function WriteRegistro1710(Reg1700: TRegistro1700): AnsiString;

    procedure CriaRegistros;
    procedure LiberaRegistros;
  public
    constructor Create(AOwner: TComponent); override; /// Create
    destructor Destroy; override; /// Destroy
    procedure LimpaRegistros;

    function WriteRegistro1001: AnsiString;
    function WriteRegistro1100: AnsiString;
    function WriteRegistro1105: AnsiString;
    function WriteRegistro1110: AnsiString;
    function WriteRegistro1200: AnsiString;
    function WriteRegistro1210: AnsiString;
    function WriteRegistro1300: AnsiString;
    function WriteRegistro1350: AnsiString;
    function WriteRegistro1400: AnsiString;
    function WriteRegistro1500: AnsiString;
    function WriteRegistro1510: AnsiString;
    function WriteRegistro1600: AnsiString;
    function WriteRegistro1700: AnsiString;
    function WriteRegistro1800: AnsiString;
    function WriteRegistro1990: AnsiString;

    property Registro1001: TRegistro1001     read FRegistro1001 write FRegistro1001;
    property Registro1100: TRegistro1100List read FRegistro1100 write FRegistro1100;
    property Registro1105: TRegistro1105List read FRegistro1105 write FRegistro1105;
    property Registro1110: TRegistro1110List read FRegistro1110 write FRegistro1110;
    property Registro1200: TRegistro1200List read FRegistro1200 write FRegistro1200;
    property Registro1210: TRegistro1210List read FRegistro1210 write FRegistro1210;
    property Registro1300: TRegistro1300List read FRegistro1300 write FRegistro1300;
    property Registro1350: TRegistro1350List read FRegistro1350 write FRegistro1350;
    property Registro1400: TRegistro1400List read FRegistro1400 write FRegistro1400;
    property Registro1500: TRegistro1500List read FRegistro1500 write FRegistro1500;
    property Registro1510: TRegistro1510List read FRegistro1510 write FRegistro1510;
    property Registro1600: TRegistro1600List read FRegistro1600 write FRegistro1600;
    property Registro1700: TRegistro1700List read FRegistro1700 write FRegistro1700;
    property Registro1800: TRegistro1800List read FRegistro1800 write FRegistro1800;
    property Registro1990: TRegistro1990 read FRegistro1990 write FRegistro1990;

    property Registro1310Count: Integer read FRegistro1310Count write FRegistro1310Count;
    property Registro1320Count: Integer read FRegistro1320Count write FRegistro1320Count;
    property Registro1360Count: Integer read FRegistro1360Count write FRegistro1360Count;
    property Registro1370Count: Integer read FRegistro1370Count write FRegistro1370Count;
    property Registro1710Count: Integer read FRegistro1710Count write FRegistro1710Count;
  end;

implementation

{ TBloco_1 }

constructor TBloco_1.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  CriaRegistros;
end;

destructor TBloco_1.Destroy;
begin
  LiberaRegistros;
  inherited;
end;

procedure TBloco_1.CriaRegistros;
begin
  FRegistro1001 := TRegistro1001.Create;
  FRegistro1100 := TRegistro1100List.Create;
  FRegistro1105 := TRegistro1105List.Create;
  FRegistro1110 := TRegistro1110List.Create;
  FRegistro1200 := TRegistro1200List.Create;
  FRegistro1210 := TRegistro1210List.Create;
  FRegistro1300 := TRegistro1300List.Create;
  FRegistro1350 := TRegistro1350List.Create;
  FRegistro1400 := TRegistro1400List.Create;
  FRegistro1500 := TRegistro1500List.Create;
  FRegistro1510 := TRegistro1510List.Create;
  FRegistro1600 := TRegistro1600List.Create;
  FRegistro1700 := TRegistro1700List.Create;
  FRegistro1800 := TRegistro1800List.Create;
  FRegistro1990 := TRegistro1990.Create;

  FRegistro1310Count := 0;
  FRegistro1320Count := 0;
  FRegistro1360Count := 0;
  FRegistro1370Count := 0;
  FRegistro1710Count := 0;

  FRegistro1990.QTD_LIN_1 := 0;
end;

procedure TBloco_1.LiberaRegistros;
begin
  FRegistro1001.Free;
  FRegistro1100.Free;
  FRegistro1105.Free;
  FRegistro1110.Free;
  FRegistro1200.Free;
  FRegistro1210.Free;
  FRegistro1300.Free;
  FRegistro1350.Free;
  FRegistro1400.Free;
  FRegistro1500.Free;
  FRegistro1510.Free;
  FRegistro1600.Free;
  FRegistro1700.Free;
  FRegistro1800.Free;
  FRegistro1990.Free;
end;

procedure TBloco_1.LimpaRegistros;
begin
  /// Limpa os Registros
  LiberaRegistros;
  /// Recriar os Registros Limpos
  CriaRegistros;
end;

function TBloco_1.WriteRegistro1001: AnsiString;
begin
  Result := '';

  if Assigned(Registro1001) then
  begin
     with Registro1001 do
     begin
       Check(((IND_MOV = 0) or (IND_MOV = 1)), 'BLOCO 1 - REGISTRO1001: Na abertura do bloco, deve ser informado o n�mero 0 ou 1!');
       ///
       Result := LFill('1001') +
                 LFill(IND_MOV, 0) +
                 Delimitador +
                 #13#10;
       ///
       Registro1990.QTD_LIN_1 := Registro1990.QTD_LIN_1 + 1;
     end;
  end;
end;

function TBloco_1.WriteRegistro1100: AnsiString;
var
intFor: integer;
strRegistro1100: AnsiString;
begin
  strRegistro1100 := '';

  if Assigned( Registro1100 ) then
  begin
     for intFor := 0 to Registro1100.Count - 1 do
     begin
        with Registro1100.Items[intFor] do
        begin
          strRegistro1100 := strRegistro1100 + LFill('1100') +
                                               LFill( IND_DOC ) +
                                               LFill( NRO_DE ) +
                                               LFill( DT_DE ) +
                                               LFill( NAT_EXP ) +
                                               LFill( NRO_RE ) +
                                               LFill( DT_RE ) +
                                               LFill( CHC_EMB ) +
                                               LFill( DT_CHC ) +
                                               LFill( DT_AVB ) +
                                               LFill( TP_CHC ) +
                                               LFill( PAIS ) +
                                               Delimitador +
                                               #13#10;
        end;
       Registro1990.QTD_LIN_1 := Registro1990.QTD_LIN_1 + 1;
     end;
  end;
  Result := strRegistro1100;
end;

function TBloco_1.WriteRegistro1105: AnsiString;
var
intFor: integer;
strRegistro1105: AnsiString;
begin
  strRegistro1105 := '';

  if Assigned( Registro1105 ) then
  begin
     for intFor := 0 to Registro1105.Count - 1 do
     begin
        with Registro1105.Items[intFor] do
        begin
          strRegistro1105 := strRegistro1105 + LFill('1105') +
                                               LFill( COD_MOD ) +
                                               LFill( SERIE ) +
                                               LFill( NUM_DOC ) +
                                               LFill( CHV_NFE ) +
                                               LFill( DT_DOC ) +
                                               LFill( COD_ITEM ) +
                                               Delimitador +
                                               #13#10;
        end;
        Registro1990.QTD_LIN_1 := Registro1990.QTD_LIN_1 + 1;
     end;
  end;
  Result := strRegistro1105;
end;

function TBloco_1.WriteRegistro1110: AnsiString;
var
intFor: integer;
strRegistro1110: AnsiString;
begin
  strRegistro1110 := '';

  if Assigned( Registro1110 ) then
  begin
     for intFor := 0 to Registro1110.Count - 1 do
     begin
        with Registro1110.Items[intFor] do
        begin
          strRegistro1110 := strRegistro1110 + LFill('1110') +
                                               LFill( COD_PART ) +
                                               LFill( COD_MOD ) +
                                               LFill( SER ) +
                                               LFill( NUM_DOC ) +
                                               LFill( DT_DOC ) +
                                               LFill( CHV_NFE ) +
                                               LFill( NR_MEMO ) +
                                               DFill( QTD,3 ) +
                                               LFill( UNID ) +
                                               Delimitador +
                                               #13#10;
        end;
        Registro1990.QTD_LIN_1 := Registro1990.QTD_LIN_1 + 1;
     end;
  end;
  Result := strRegistro1110;
end;

function TBloco_1.WriteRegistro1200: AnsiString;
var
intFor: integer;
strRegistro1200: AnsiString;
begin
  strRegistro1200 := '';

  if Assigned( Registro1200 ) then
  begin
     for intFor := 0 to Registro1200.Count - 1 do
     begin
        with Registro1200.Items[intFor] do
        begin
          strRegistro1200 := strRegistro1200 + LFill('1200') +
                                               LFill( COD_AJ_APUR ) +
                                               LFill( SLD_CRED,0 ) +
                                               LFill( CRED_APR,0 ) +
                                               LFill( CRED_RECEB,0 ) +
                                               LFill( CRED_UTIL,0 ) +
                                               LFill( SLD_CRED_FIM,0 ) +
                                               Delimitador +
                                               #13#10;
        end;
        Registro1990.QTD_LIN_1 := Registro1990.QTD_LIN_1 + 1;
     end;
  end;
  Result := strRegistro1200;
end;

function TBloco_1.WriteRegistro1210: AnsiString;
var
intFor: integer;
strRegistro1210: AnsiString;
begin
  strRegistro1210 := '';

  if Assigned( Registro1210 ) then
  begin
     for intFor := 0 to Registro1210.Count - 1 do
     begin
        with Registro1210.Items[intFor] do
        begin
          strRegistro1210 := strRegistro1210 + LFill('1210') +
                                               LFill( TIPO_UTIL ) +
                                               LFill( NR_DOC ) +
                                               LFill( VL_CRED_UTIL ) +
                                               Delimitador +
                                               #13#10;
        end;
        Registro1990.QTD_LIN_1 := Registro1990.QTD_LIN_1 + 1;
     end;
  end;
  Result := strRegistro1210;
end;

function TBloco_1.WriteRegistro1300: AnsiString;
var
intFor: integer;
strRegistro1300: AnsiString;
begin
  strRegistro1300 := '';

  if Assigned( Registro1300 ) then
  begin
     for intFor := 0 to Registro1300.Count - 1 do
     begin
        with Registro1300.Items[intFor] do
        begin
          strRegistro1300 := strRegistro1300 + LFill('1300') +
                                               LFill( COD_ITEM ) +
                                               LFill( DT_FECH ) +
                                               DFill( ESTQ_ABERT,3 ) +
                                               DFill( VOL_ENTR,3 ) +
                                               DFill( VOL_DISP,3 ) +
                                               DFill( VOL_SAIDAS,3 ) +
                                               DFill( ESTQ_ESCR,3 ) +
                                               DFill( VAL_AJ_PERDA,3 ) +
                                               DFill( VAL_AJ_GANHO,3 ) +
                                               DFill( FECH_FISICO,3 ) +
                                               Delimitador +
                                               #13#10;
        end;
        /// Registro FILHOS
        strRegistro1300 := strRegistro1300 +
                           WriteRegistro1310( Registro1300.Items[intFor] );

        Registro1990.QTD_LIN_1 := Registro1990.QTD_LIN_1 + 1;
     end;
  end;
  Result := strRegistro1300;
end;

function TBloco_1.WriteRegistro1310(Reg1300: TRegistro1300) : AnsiString;
var
intFor: integer;
strRegistro1310: AnsiString;
begin
  strRegistro1310 := '';

  if Assigned( Reg1300.Registro1310 ) then
  begin
     for intFor := 0 to Reg1300.Registro1310.Count - 1 do
     begin
        with Reg1300.Registro1310.Items[intFor] do
        begin
          strRegistro1310 := strRegistro1310 + LFill('1310') +
                                               LFill( NUM_TANQUE ) +
                                               DFill( ESTQ_ABERT,3 ) +
                                               DFill( VOL_ENTR,3 ) +
                                               DFill( VOL_DISP,3 ) +
                                               DFill( VOL_SAIDAS,3 ) +
                                               DFill( ESTQ_ESCR,3 ) +
                                               DFill( VAL_AJ_PERDA,3 ) +
                                               DFill( VAL_AJ_GANHO,3 ) +
                                               DFill( FECH_FISICO,3 ) +
                                               Delimitador +
                                               #13#10;
        end;
        /// Registro FILHOS do FILHO
        strRegistro1310 := strRegistro1310 +
                           WriteRegistro1320( Reg1300.Registro1310.Items[intFor] );

        Registro1990.QTD_LIN_1 := Registro1990.QTD_LIN_1 + 1;
     end;
     /// Variav�l para armazenar a quantidade de registro do tipo.
     FRegistro1310Count := FRegistro1310Count + Reg1300.Registro1310.Count;
  end;
  Result := strRegistro1310;
end;

function TBloco_1.WriteRegistro1320(Reg1310: TRegistro1310): AnsiString;
var
intFor: integer;
strRegistro1320: AnsiString;
begin
  strRegistro1320 := '';

  if Assigned( Reg1310.Registro1320 ) then
  begin
     for intFor := 0 to Reg1310.Registro1320.Count - 1 do
     begin
        with Reg1310.Registro1320.Items[intFor] do
        begin
          strRegistro1320 := strRegistro1320 + LFill('1320') +
                                               LFill( NUM_BICO ) +
                                               LFill( NR_INTERV ) +
                                               LFill( MOT_INTERV ) +
                                               LFill( NOM_INTERV ) +
                                               LFill( CNPJ_INTERV ) +
                                               LFill( CPF_INTERV ) +
                                               DFill( VAL_FECHA,3 ) +
                                               DFill( VAL_ABERT,3 ) +
                                               DFill( VOL_AFERI,3 ) +
                                               DFill( VOL_VENDAS,3 ) +
                                               Delimitador +
                                               #13#10;
        end;
        Registro1990.QTD_LIN_1 := Registro1990.QTD_LIN_1 + 1;
     end;
     /// Variav�l para armazenar a quantidade de registro do tipo.
     FRegistro1320Count := FRegistro1320Count + Reg1310.Registro1320.Count;
  end;
  Result := strRegistro1320;
end;

function TBloco_1.WriteRegistro1350: AnsiString;
var
intFor: integer;
strRegistro1350: AnsiString;
begin
  strRegistro1350 := '';

  if Assigned( Registro1350 ) then
  begin
     for intFor := 0 to Registro1350.Count - 1 do
     begin
        with Registro1350.Items[intFor] do
        begin
          strRegistro1350 := strRegistro1350 + LFill('1350') +
                                               LFill( SERIE ) +
                                               LFill( FABRICANTE ) +
                                               LFill( MODELO ) +
                                               LFill( TIPO_MEDICAO ) +
                                               Delimitador +
                                               #13#10;
        end;
        /// Registro FILHOS do FILHO
        strRegistro1350 := strRegistro1350 +
                           WriteRegistro1360( Registro1350.Items[intFor] ) +
                           WriteRegistro1370( Registro1350.Items[intFor] );

        Registro1990.QTD_LIN_1 := Registro1990.QTD_LIN_1 + 1;
     end;
  end;
  Result := strRegistro1350;
end;

function TBloco_1.WriteRegistro1360(Reg1350: TRegistro1350): AnsiString;
var
intFor: integer;
strRegistro1360: AnsiString;
begin
  strRegistro1360 := '';

  if Assigned( Reg1350.Registro1360 ) then
  begin
     for intFor := 0 to Reg1350.Registro1360.Count - 1 do
     begin
        with Reg1350.Registro1360.Items[intFor] do
        begin
          strRegistro1360 := strRegistro1360 + LFill('1360') +
                                               LFill( NUM_LACRE ) +
                                               LFill( DT_APLICACAO ) +
                                               Delimitador +
                                               #13#10;
        end;
        Registro1990.QTD_LIN_1 := Registro1990.QTD_LIN_1 + 1;
     end;
     /// Variav�l para armazenar a quantidade de registro do tipo.
     FRegistro1360Count := FRegistro1360Count + Reg1350.Registro1360.Count;
  end;
  Result := strRegistro1360;
end;

function TBloco_1.WriteRegistro1370(Reg1350: TRegistro1350): AnsiString;
var
intFor: integer;
strRegistro1370: AnsiString;
begin
  strRegistro1370 := '';

  if Assigned( Reg1350.Registro1370 ) then
  begin
     for intFor := 0 to Reg1350.Registro1370.Count - 1 do
     begin
        with Reg1350.Registro1370.Items[intFor] do
        begin
          strRegistro1370 := strRegistro1370 + LFill('1370') +
                                               LFill( NUM_BICO ) +
                                               LFill( COD_ITEM ) +
                                               LFill( NUM_TANQUE ) +
                                               Delimitador +
                                               #13#10;
        end;
        Registro1990.QTD_LIN_1 := Registro1990.QTD_LIN_1 + 1;
     end;
     /// Variav�l para armazenar a quantidade de registro do tipo.
     FRegistro1370Count := FRegistro1370Count + Reg1350.Registro1370.Count;
  end;
  Result := strRegistro1370;
end;

function TBloco_1.WriteRegistro1400: AnsiString;
var
intFor: integer;
strRegistro1400: AnsiString;
begin
  strRegistro1400 := '';

  if Assigned( Registro1400 ) then
  begin
     for intFor := 0 to Registro1400.Count - 1 do
     begin
        with Registro1400.Items[intFor] do
        begin
          strRegistro1400 := strRegistro1400 + LFill('1400') +
                                               LFill( COD_ITEM ) +
                                               LFill( MUN ) +
                                               LFill( VALOR,0,2 ) +
                                               Delimitador +
                                               #13#10;
        end;
        Registro1990.QTD_LIN_1 := Registro1990.QTD_LIN_1 + 1;
     end;
  end;
  Result := strRegistro1400;
end;

function TBloco_1.WriteRegistro1500: AnsiString;
var
intFor: integer;
strRegistro1500: AnsiString;
begin
  strRegistro1500 := '';

  if Assigned( Registro1500 ) then
  begin
     for intFor := 0 to Registro1500.Count - 1 do
     begin
        with Registro1500.Items[intFor] do
        begin
          strRegistro1500 := strRegistro1500 + LFill('1500') +
                                               LFill( IND_OPER ) +
                                               LFill( IND_EMIT ) +
                                               LFill( COD_PART ) +
                                               LFill( COD_MOD ) +
                                               LFill( COD_SIT ) +
                                               LFill( SER ) +
                                               LFill( SUB ) +
                                               LFill( COD_CONS ) +
                                               LFill( NUM_DOC ) +
                                               LFill( DT_DOC ) +
                                               LFill( DT_E_S ) +
                                               LFill( VL_DESC,0,2 ) +
                                               LFill( VL_DESC,0,2 ) +
                                               LFill( VL_FORN,0,2 ) +
                                               LFill( VL_SERV_NT,0,2 ) +
                                               LFill( VL_TERC,0,2 ) +
                                               LFill( VL_DA,0,2 ) +
                                               LFill( VL_BC_ICMS,0,2 ) +
                                               LFill( VL_ICMS,0,2 ) +
                                               LFill( VL_BC_ICMS_ST,0,2 ) +
                                               LFill( VL_ICMS_ST,0,2 ) +
                                               LFill( COD_INF ) +
                                               LFill( VL_PIS,0,2 ) +
                                               LFill( VL_COFINS,0,2 ) +
                                               LFill( TP_LIGACAO ) +
                                               LFill( COD_GRUPO_TENSAO ) +
                                               Delimitador +
                                               #13#10;
        end;
        Registro1990.QTD_LIN_1 := Registro1990.QTD_LIN_1 + 1;
     end;
  end;
  Result := strRegistro1500;
end;

function TBloco_1.WriteRegistro1510: AnsiString;
var
intFor: integer;
strRegistro1510: AnsiString;
begin
  strRegistro1510 := '';

  if Assigned( Registro1510 ) then
  begin
     for intFor := 0 to Registro1510.Count - 1 do
     begin
        with Registro1510.Items[intFor] do
        begin
          strRegistro1510 := strRegistro1510 + LFill('1510') +
                                               LFill( NUM_ITEM ) +
                                               LFill( COD_ITEM ) +
                                               LFill( COD_CLASS ) +
                                               DFill( QTD,3 ) +
                                               LFill( UNID ) +
                                               LFill( VL_ITEM,0,2 ) +
                                               LFill( VL_DESC,0,2 ) +
                                               LFill( CST_ICMS,3 ) +
                                               LFill( CFOP,4 ) +
                                               LFill( VL_BC_ICMS,0,2 ) +
                                               LFill( ALIQ_ICMS,0,2 ) +
                                               LFill( VL_ICMS,0,2 ) +
                                               LFill( VL_BC_ICMS_ST,0,2 ) +
                                               LFill( ALIQ_ST,0,2 ) +
                                               LFill( VL_ICMS_ST,0,2 ) +
                                               LFill( IND_REC ) +
                                               LFill( COD_PART ) +
                                               LFill( VL_PIS,0,2 ) +
                                               LFill( VL_COFINS,0,2 ) +
                                               LFill( COD_CTA ) +
                                               Delimitador +
                                               #13#10;
        end;
        Registro1990.QTD_LIN_1 := Registro1990.QTD_LIN_1 + 1;
     end;
  end;
  Result := strRegistro1510;
end;

function TBloco_1.WriteRegistro1600: AnsiString;
var
intFor: integer;
strRegistro1600: AnsiString;
begin
  strRegistro1600 := '';

  if Assigned( Registro1600 ) then
  begin
     for intFor := 0 to Registro1600.Count - 1 do
     begin
        with Registro1600.Items[intFor] do
        begin
          strRegistro1600 := strRegistro1600 + LFill('1600') +
                                               LFill( COD_PART ) +
                                               LFill( TOT_CREDITO, 0, 2, True ) +
                                               LFill( TOT_DEBITO, 0, 2, True ) +
                                               Delimitador +
                                               #13#10;
        end;
        Registro1990.QTD_LIN_1 := Registro1990.QTD_LIN_1 + 1;
     end;
  end;
  Result := strRegistro1600;
end;

function TBloco_1.WriteRegistro1700: AnsiString;
var
intFor: integer;
strRegistro1700: AnsiString;
begin
  strRegistro1700 := '';

  if Assigned( Registro1700 ) then
  begin
     for intFor := 0 to Registro1700.Count - 1 do
     begin
        with Registro1700.Items[intFor] do
        begin
          strRegistro1700 := strRegistro1700 + LFill('1700') +
                                               LFill( COD_DISP, 2) +
                                               LFill( COD_MOD, 2) +
                                               LFill( SER, 4 ) +
                                               LFill( SUB, 3) +
                                               LFill( NUM_DOC_INI, 12) +
                                               LFill( NUM_DOC_FIN, 12) +
                                               LFill( NUM_AUT, 60) +
                                               Delimitador +
                                               #13#10;
        end;
        strRegistro1700 := strRegistro1700 +
                           WriteRegistro1710( Registro1700.Items[intFor]);
        Registro1990.QTD_LIN_1 := Registro1990.QTD_LIN_1 + 1;
     end;
  end;
  Result := strRegistro1700;
end;


function TBloco_1.WriteRegistro1710(Reg1700: TRegistro1700): AnsiString;
var
intFor: integer;
strRegistro1710: AnsiString;
begin
  strRegistro1710 := '';

  if Assigned( Reg1700.Registro1710 ) then
  begin
     for intFor := 0 to Reg1700.Registro1710.Count - 1 do
     begin
        with Reg1700.Registro1710.Items[intFor] do
        begin
          strRegistro1710 := strRegistro1710 + LFill('1710') +
                                               LFill( NUM_DOC_INI, 12) +
                                               LFill( NUM_DOC_FIN, 12) +
                                               Delimitador +
                                               #13#10;
        end;
        Registro1990.QTD_LIN_1 := Registro1990.QTD_LIN_1 + 1;
     end;
     FRegistro1710Count := FRegistro1710Count + Reg1700.Registro1710.Count;
  end;
  Result := strRegistro1710;
end;

function TBloco_1.WriteRegistro1800: AnsiString;
var
intFor: integer;
strRegistro1800: AnsiString;
begin
  strRegistro1800 := '';

  if Assigned( Registro1800 ) then
  begin
     for intFor := 0 to Registro1800.Count - 1 do
     begin
        with Registro1800.Items[intFor] do
        begin
          strRegistro1800 := strRegistro1800 + LFill('1800') +
                                               LFill( VL_CARGA, 0, 2, True ) +
                                               LFill( VL_PASS, 0, 2, True ) +
                                               LFill( VL_FAT, 0, 2, True ) +
                                               LFill( IND_RAT, 6, 2, True ) +
                                               LFill( VL_ICMS_ANT, 0, 2, True ) +
                                               LFill( VL_BC_ICMS, 0, 2, True ) +
                                               LFill( VL_ICMS_APUR, 0, 2, True ) +
                                               LFill( VL_BC_ICMS_APUR, 0, 2, True ) +
                                               LFill( VL_DIF, 0, 2, True ) +
                                               Delimitador +
                                               #13#10;
        end;
        Registro1990.QTD_LIN_1 := Registro1990.QTD_LIN_1 + 1;
     end;
  end;
  Result := strRegistro1800;
end;

function TBloco_1.WriteRegistro1990: AnsiString;
begin
  Result := '';

  if Assigned(Registro1990) then
  begin
     with Registro1990 do
     begin
       QTD_LIN_1 := QTD_LIN_1 + 1;
       ///
       Result := LFill('1990') +
                 LFill(QTD_LIN_1,0) +
                 Delimitador +
                 #13#10;
     end;
  end;
end;

end.
