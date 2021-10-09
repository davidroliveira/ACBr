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

unit ACBrEFDBloco_E_Class;

interface

uses SysUtils, Classes, DateUtils, ACBrSped, ACBrEFDBloco_E, ACBrEFDBlocos;

type
  /// TBLOCO_E -
  TBloco_E = class(TACBrSPED)
  private
    FRegistroE001: TRegistroE001;      /// BLOCO E - RegistroE001
    FRegistroE990: TRegistroE990;      /// BLOCO E - RegistroE990

    FRegistroE100Count: Integer;
    FRegistroE110Count: Integer;
    FRegistroE111Count: Integer;
    FRegistroE112Count: Integer;
    FRegistroE113Count: Integer;
    FRegistroE115Count: Integer;
    FRegistroE116Count: Integer;
    FRegistroE200Count: Integer;
    FRegistroE210Count: Integer;
    FRegistroE220Count: Integer;
    FRegistroE230Count: Integer;
    FRegistroE240Count: Integer;
    FRegistroE250Count: Integer;
    FRegistroE500Count: Integer;
    FRegistroE510Count: Integer;
    FRegistroE520Count: Integer;
    FRegistroE530Count: Integer;

    function WriteRegistroE100(RegE001: TRegistroE001): String;
    function WriteRegistroE110(RegE100: TRegistroE100): String;
    function WriteRegistroE111(RegE110: TRegistroE110): String;
    function WriteRegistroE112(RegE111: TRegistroE111): String;
    function WriteRegistroE113(RegE111: TRegistroE111): String;
    function WriteRegistroE115(RegE110: TRegistroE110): String;
    function WriteRegistroE116(RegE110: TRegistroE110): String;
    function WriteRegistroE200(RegE001: TRegistroE001): String;
    function WriteRegistroE210(RegE200: TRegistroE200): String;
    function WriteRegistroE220(RegE210: TRegistroE210): String;
    function WriteRegistroE230(RegE220: TRegistroE220): String;
    function WriteRegistroE240(RegE220: TRegistroE220): String;
    function WriteRegistroE250(RegE210: TRegistroE210): String;
    function WriteRegistroE500(RegE001: TRegistroE001): String;
    function WriteRegistroE510(RegE500: TRegistroE500): String;
    function WriteRegistroE520(RegE500: TRegistroE500): String;
    function WriteRegistroE530(RegE520: TRegistroE520): String;

    procedure CriaRegistros;
    procedure LiberaRegistros;
  public
    constructor Create;           /// Create
    destructor Destroy; override; /// Destroy
    procedure LimpaRegistros;

    function RegistroE001New: TRegistroE001;
    function RegistroE100New: TRegistroE100;
    function RegistroE110New: TRegistroE110;
    function RegistroE111New: TRegistroE111;
    function RegistroE112New: TRegistroE112;
    function RegistroE113New: TRegistroE113;
    function RegistroE115New: TRegistroE115;
    function RegistroE116New: TRegistroE116;
    function RegistroE200New: TRegistroE200;
    function RegistroE210New: TRegistroE210;
    function RegistroE220New: TRegistroE220;
    function RegistroE230New: TRegistroE230;
    function RegistroE240New: TRegistroE240;
    function RegistroE250New: TRegistroE250;
    function RegistroE500New: TRegistroE500;
    function RegistroE510New: TRegistroE510;
    function RegistroE520New: TRegistroE520;
    function RegistroE530New: TRegistroE530;

    function WriteRegistroE001: String;
    function WriteRegistroE990: String;

    property RegistroE001: TRegistroE001 read FRegistroE001 write FRegistroE001;
    property RegistroE990: TRegistroE990 read FRegistroE990 write FRegistroE990;

    property RegistroE100Count: Integer read FRegistroE100Count write FRegistroE100Count;
    property RegistroE110Count: Integer read FRegistroE110Count write FRegistroE110Count;
    property RegistroE111Count: Integer read FRegistroE111Count write FRegistroE111Count;
    property RegistroE112Count: Integer read FRegistroE112Count write FRegistroE112Count;
    property RegistroE113Count: Integer read FRegistroE113Count write FRegistroE113Count;
    property RegistroE115Count: Integer read FRegistroE115Count write FRegistroE115Count;
    property RegistroE116Count: Integer read FRegistroE116Count write FRegistroE116Count;
    property RegistroE200Count: Integer read FRegistroE200Count write FRegistroE200Count;
    property RegistroE210Count: Integer read FRegistroE210Count write FRegistroE210Count;
    property RegistroE220Count: Integer read FRegistroE220Count write FRegistroE220Count;
    property RegistroE230Count: Integer read FRegistroE230Count write FRegistroE230Count;
    property RegistroE240Count: Integer read FRegistroE240Count write FRegistroE240Count;
    property RegistroE250Count: Integer read FRegistroE250Count write FRegistroE250Count;
    property RegistroE500Count: Integer read FRegistroE500Count write FRegistroE500Count;
    property RegistroE510Count: Integer read FRegistroE510Count write FRegistroE510Count;
    property RegistroE520Count: Integer read FRegistroE520Count write FRegistroE520Count;
    property RegistroE530Count: Integer read FRegistroE530Count write FRegistroE530Count;
  end;

implementation

{ TBloco_E }

constructor TBloco_E.Create;
begin
  CriaRegistros;
end;

destructor TBloco_E.Destroy;
begin
  LiberaRegistros;
  inherited;
end;

procedure TBloco_E.CriaRegistros;
begin
  FRegistroE001 := TRegistroE001.Create;
  FRegistroE990 := TRegistroE990.Create;

  RegistroE100Count := 0;
  RegistroE110Count := 0;
  RegistroE111Count := 0;
  RegistroE112Count := 0;
  RegistroE113Count := 0;
  RegistroE115Count := 0;
  RegistroE116Count := 0;
  RegistroE200Count := 0;
  RegistroE210Count := 0;
  RegistroE220Count := 0;
  RegistroE230Count := 0;
  RegistroE240Count := 0;
  RegistroE250Count := 0;
  RegistroE500Count := 0;
  RegistroE510Count := 0;
  RegistroE520Count := 0;
  RegistroE530Count := 0;

  FRegistroE990.QTD_LIN_E := 0;
end;

procedure TBloco_E.LiberaRegistros;
begin
  FRegistroE001.Free;
  FRegistroE990.Free;
end;

procedure TBloco_E.LimpaRegistros;
begin
  /// Limpa os Registros
  LiberaRegistros;
  /// Recriar os Registros Limpos
  CriaRegistros;
end;

function TBloco_E.RegistroE001New: TRegistroE001;
begin
   Result := FRegistroE001;
end;

function TBloco_E.RegistroE100New: TRegistroE100;
begin
   Result := FRegistroE001.RegistroE100;
end;

function TBloco_E.RegistroE110New: TRegistroE110;
begin
   Result := FRegistroE001.RegistroE100.RegistroE110;
end;

function TBloco_E.RegistroE111New: TRegistroE111;
begin
   Result := FRegistroE001.RegistroE100.RegistroE110.RegistroE111.New;
end;

function TBloco_E.RegistroE112New: TRegistroE112;
var
E111Count: integer;
begin
   E111Count := FRegistroE001.RegistroE100.RegistroE110.RegistroE111.Count -1;
   Result    := FRegistroE001.RegistroE100.RegistroE110.RegistroE111.Items[E111Count].RegistroE112.New;
end;

function TBloco_E.RegistroE113New: TRegistroE113;
var
E111Count: integer;
begin
   E111Count := FRegistroE001.RegistroE100.RegistroE110.RegistroE111.Count -1;
   Result    := FRegistroE001.RegistroE100.RegistroE110.RegistroE111.Items[E111Count].RegistroE113.New;
end;

function TBloco_E.RegistroE115New: TRegistroE115;
begin
   Result := FRegistroE001.RegistroE100.RegistroE110.RegistroE115.New;
end;

function TBloco_E.RegistroE116New: TRegistroE116;
begin
   Result := FRegistroE001.RegistroE100.RegistroE110.RegistroE116.New;
end;

function TBloco_E.RegistroE200New: TRegistroE200;
begin
   Result := FRegistroE001.RegistroE200.New;
end;

function TBloco_E.RegistroE210New: TRegistroE210;
begin
   Result := FRegistroE001.RegistroE200.Items[FRegistroE001.RegistroE200.Count -1].RegistroE210.New;
end;

function TBloco_E.RegistroE220New: TRegistroE220;
var
E200Count: integer;
E210Count: integer;
begin
   E200Count := FRegistroE001.RegistroE200.Count -1;
   E210Count := FRegistroE001.RegistroE200.Items[E200Count].RegistroE210.Count -1;
   //
   Result := FRegistroE001.RegistroE200.Items[E200Count].RegistroE210.Items[E210Count].RegistroE220.New;
end;

function TBloco_E.RegistroE230New: TRegistroE230;
var
E200Count: integer;
E210Count: integer;
E220Count: integer;
begin
   E200Count := FRegistroE001.RegistroE200.Count -1;
   E210Count := FRegistroE001.RegistroE200.Items[E200Count].RegistroE210.Count -1;
   E220Count := FRegistroE001.RegistroE200.Items[E200Count].RegistroE210.Items[E210Count].RegistroE220.Count -1;
   //
   Result := FRegistroE001.RegistroE200.Items[E200Count].RegistroE210.Items[E210Count].RegistroE220.Items[E220Count].RegistroE230.New;
end;

function TBloco_E.RegistroE240New: TRegistroE240;
var
E200Count: integer;
E210Count: integer;
E220Count: integer;
begin
   E200Count := FRegistroE001.RegistroE200.Count -1;
   E210Count := FRegistroE001.RegistroE200.Items[E200Count].RegistroE210.Count -1;
   E220Count := FRegistroE001.RegistroE200.Items[E200Count].RegistroE210.Items[E210Count].RegistroE220.Count -1;
   //
   Result := FRegistroE001.RegistroE200.Items[E200Count].RegistroE210.Items[E210Count].RegistroE220.Items[E220Count].RegistroE240.New;
end;

function TBloco_E.RegistroE250New: TRegistroE250;
var
E200Count: integer;
E210Count: integer;
begin
   E200Count := FRegistroE001.RegistroE200.Count -1;
   E210Count := FRegistroE001.RegistroE200.Items[E200Count].RegistroE210.Count -1;
   //
   Result := FRegistroE001.RegistroE200.Items[E200Count].RegistroE210.Items[E210Count].RegistroE250.New;
end;

function TBloco_E.RegistroE500New: TRegistroE500;
begin
   Result := FRegistroE001.RegistroE500.New;
end;

function TBloco_E.RegistroE510New: TRegistroE510;
begin
   Result := FRegistroE001.RegistroE500.Items[FRegistroE001.RegistroE500.Count -1].RegistroE510.New;
end;

function TBloco_E.RegistroE520New: TRegistroE520;
begin
   Result := FRegistroE001.RegistroE500.Items[FRegistroE001.RegistroE500.Count -1].RegistroE520.New;
end;

function TBloco_E.RegistroE530New: TRegistroE530;
var
E500Count: integer;
E520Count: integer;
begin
   E500Count := FRegistroE001.RegistroE500.Count -1;
   E520Count := FRegistroE001.RegistroE500.Items[E500Count].RegistroE520.Count -1;
   //
   Result := FRegistroE001.RegistroE500.Items[E500Count].RegistroE520.Items[E520Count].RegistroE530.New;
end;

function TBloco_E.WriteRegistroE001: String;
var
strRegistroE001: String;
begin
  Result := '';

  if Assigned(FRegistroE001) then
  begin
     with FRegistroE001 do
     begin
        strRegistroE001 := strRegistroE001 + LFill( 'E001' ) +
                                             LFill( Integer(IND_MOV), 0 ) +
                                             Delimitador +
                                             #13#10;
        ///
        if IND_MOV = imComDados then
        begin
           strRegistroE001 := strRegistroE001 +
                              WriteRegistroE100(FRegistroE001) +
                              WriteRegistroE200(FRegistroE001) +
                              WriteRegistroE500(FRegistroE001);
        end;
     end;
     RegistroE990.QTD_LIN_E := RegistroE990.QTD_LIN_E + 1;
  end;
  Result := strRegistroE001;
end;

function TBloco_E.WriteRegistroE100(RegE001: TRegistroE001): String;
var
strRegistroE100: String;
begin
  Result := '';

  if Assigned(RegE001.RegistroE100) then
  begin
     with RegE001.RegistroE100 do
     begin
       strRegistroE100 := strRegistroE100 +
                          LFill('E100') +
                          LFill(DT_INI) +
                          LFill(DT_FIN) +
                          Delimitador +
                          #13#10;
     end;
     strRegistroE100 := strRegistroE100 +
                        WriteRegistroE110(RegE001.RegistroE100);
     ///
     RegistroE990.QTD_LIN_E := RegistroE990.QTD_LIN_E + 1;
  end;
  Result := strRegistroE100;
end;

function TBloco_E.WriteRegistroE110(RegE100: TRegistroE100): String;
var
strRegistroE110: String;
begin
  Result := '';

  if Assigned(RegE100.RegistroE110) then
  begin
     with RegE100.RegistroE110 do
     begin
       strRegistroE110 :=  strRegistroE110 +
                           LFill('E110') +
                           LFill(VL_TOT_DEBITOS,0) +
                           LFill(VL_AJ_DEBITOS,0) +
                           LFill(VL_TOT_AJ_DEBITOS,0) +
                           LFill(VL_ESTORNOS_CRED,0) +
                           LFill(VL_TOT_CREDITOS,0) +
                           LFill(VL_AJ_CREDITOS,0) +
                           LFill(VL_TOT_AJ_CREDITOS,0) +
                           LFill(VL_ESTORNOS_DEB,0) +
                           LFill(VL_SLD_CREDOR_ANT,0) +
                           LFill(VL_SLD_APURADO,0) +
                           LFill(VL_TOT_DED,0) +
                           LFill(VL_ICMS_RECOLHER,0) +
                           LFill(VL_SLD_CREDOR_TRANSPORTAR,0) +
                           LFill(DEB_ESP,0) +
                           Delimitador +
                           #13#10;
     end;
     strRegistroE110 := strRegistroE110 +
                        WriteRegistroE111(RegE100.RegistroE110) +
                        WriteRegistroE115(RegE100.RegistroE110) +
                        WriteRegistroE116(RegE100.RegistroE110);
     ///
     RegistroE990.QTD_LIN_E := RegistroE990.QTD_LIN_E + 1;
  end;
  Result := strRegistroE110;
end;

function TBloco_E.WriteRegistroE111(RegE110: TRegistroE110): String;
var
intFor: integer;
strRegistroE111: String;
begin
  strRegistroE111 := '';

  if Assigned( RegE110.RegistroE111 ) then
  begin
     for intFor := 0 to RegE110.RegistroE111.Count - 1 do
     begin
        with RegE110.RegistroE111.Items[intFor] do
        begin
          strRegistroE111 := strRegistroE111 + LFill('E111') +
                                               LFill( COD_AJ_APUR ) +
                                               LFill( DESCR_COMPL_AJ ) +
                                               LFill( VL_AJ_APUR,0 ) +
                                               Delimitador +
                                               #13#10;
        end;
        strRegistroE111 := strRegistroE111 +
                           WriteRegistroE112(RegE110.RegistroE111.Items[intFor]) +
                           WriteRegistroE113(RegE110.RegistroE111.Items[intFor]);
        ///
        RegistroE990.QTD_LIN_E := RegistroE990.QTD_LIN_E + 1;
     end;
     /// Variav�l para armazenar a quantidade de registro do tipo.
     FRegistroE111Count := FRegistroE111Count + RegE110.RegistroE111.Count;
  end;
  Result := strRegistroE111;
end;

function TBloco_E.WriteRegistroE112(RegE111: TRegistroE111): String;
var
intFor: integer;
intIND_PROC: integer;
strRegistroE112: String;
begin
  strRegistroE112 := '';

  if Assigned( RegE111.RegistroE112 ) then
  begin
     for intFor := 0 to RegE111.RegistroE112.Count - 1 do
     begin
        with RegE111.RegistroE112.Items[intFor] do
        begin
          case IND_PROC of
           opSefaz:           intIND_PROC := 0;
           opJusticaFederal:  intIND_PROC := 1;
           opJusticaEstadual: intIND_PROC := 2;
           opSecexRFB:        intIND_PROC := 3;
           opOutros:          intIND_PROC := 9;
          end;
          strRegistroE112 := strRegistroE112 + LFill('E112') +
                                               LFill( NUM_DA ) +
                                               LFill( NUM_PROC ) +
                                               LFill( intIND_PROC, 0 ) +
                                               LFill( PROC ) +
                                               LFill( TXT_COMPL ) +
                                               Delimitador +
                                               #13#10;
        end;
        RegistroE990.QTD_LIN_E := RegistroE990.QTD_LIN_E + 1;
     end;
     /// Variav�l para armazenar a quantidade de registro do tipo.
     FRegistroE112Count := FRegistroE112Count + RegE111.RegistroE112.Count;
  end;
  Result := strRegistroE112;
end;

function TBloco_E.WriteRegistroE113(RegE111: TRegistroE111): String;
var
intFor: integer;
strRegistroE113: String;
begin
  strRegistroE113 := '';

  if Assigned( RegE111.RegistroE113 ) then
  begin
     for intFor := 0 to RegE111.RegistroE113.Count - 1 do
     begin
        with RegE111.RegistroE113.Items[intFor] do
        begin
          strRegistroE113 := strRegistroE113 + LFill('E113') +
                                               LFill( COD_PART ) +
                                               LFill( COD_MOD ) +
                                               LFill( SER ) +
                                               LFill( SUB ) +
                                               LFill( NUM_DOC ) +
                                               LFill( DT_DOC ) +
                                               LFill( CHV_NFE ) +
                                               LFill( COD_ITEM ) +
                                               LFill( VL_AJ_ITEM,0 ) +
                                               Delimitador +
                                               #13#10;
        end;
        RegistroE990.QTD_LIN_E := RegistroE990.QTD_LIN_E + 1;
     end;
     /// Variav�l para armazenar a quantidade de registro do tipo.
     FRegistroE113Count := FRegistroE113Count + RegE111.RegistroE113.Count;
  end;
  Result := strRegistroE113;
end;

function TBloco_E.WriteRegistroE115(RegE110: TRegistroE110): String;
var
intFor: integer;
strRegistroE115: String;
begin
  strRegistroE115 := '';

  if Assigned( RegE110.RegistroE115 ) then
  begin
     for intFor := 0 to RegE110.RegistroE115.Count - 1 do
     begin
        with RegE110.RegistroE115.Items[intFor] do
        begin
          strRegistroE115 := strRegistroE115 + LFill('E115') +
                                               LFill( COD_INF_ADIC ) +
                                               LFill( VL_INF_ADIC,0 ) +
                                               LFill( DESCR_COMPL_AJ ) +
                                               Delimitador +
                                               #13#10;
        end;
        RegistroE990.QTD_LIN_E := RegistroE990.QTD_LIN_E + 1;
     end;
     /// Variav�l para armazenar a quantidade de registro do tipo.
     FRegistroE115Count := FRegistroE115Count + RegE110.RegistroE115.Count;
  end;
  Result := strRegistroE115;
end;

function TBloco_E.WriteRegistroE116(RegE110: TRegistroE110): String;
var
intFor: integer;
strIND_PROC: string;
strRegistroE116: string;
begin
  strRegistroE116 := '';

  if Assigned( RegE110.RegistroE116 ) then
  begin
     for intFor := 0 to RegE110.RegistroE116.Count - 1 do
     begin
        with RegE110.RegistroE116.Items[intFor] do
        begin
          case IND_PROC of
           opSefaz:           strIND_PROC := '0';
           opJusticaFederal:  strIND_PROC := '1';
           opJusticaEstadual: strIND_PROC := '2';
           opSecexRFB:        strIND_PROC := '3';
           opOutros:          strIND_PROC := '9';
           opNenhum:          strIND_PROC := '';
          end;
          strRegistroE116 := strRegistroE116 + LFill('E116') +
                                               LFill( COD_OR ) +
                                               LFill( VL_OR,0 ) +
                                               LFill( DT_VCTO ) +
                                               LFill( COD_REC ) +
                                               LFill( NUM_PROC ) +
                                               LFill( strIND_PROC ) +
                                               LFill( PROC ) +
                                               LFill( TXT_COMPL ) +
                                               Delimitador +
                                               #13#10;
        end;
        RegistroE990.QTD_LIN_E := RegistroE990.QTD_LIN_E + 1;
     end;
     /// Variav�l para armazenar a quantidade de registro do tipo.
     FRegistroE116Count := FRegistroE116Count + RegE110.RegistroE116.Count;
  end;
  Result := strRegistroE116;
end;

function TBloco_E.WriteRegistroE200(RegE001: TRegistroE001): String;
var
intFor: integer;
strRegistroE200: String;
begin
  strRegistroE200 := '';

  if Assigned( RegE001.RegistroE200 ) then
  begin
     for intFor := 0 to RegE001.RegistroE200.Count - 1 do
     begin
        with RegE001.RegistroE200.Items[intFor] do
        begin
          strRegistroE200 := strRegistroE200 + LFill('E200') +
                                               LFill( UF ) +
                                               LFill( DT_INI ) +
                                               LFill( DT_FIN ) +
                                               Delimitador +
                                               #13#10;
        end;
        /// Registros FILHOS
        strRegistroE200 := strRegistroE200 +
                           WriteRegistroE210(RegE001.RegistroE200.Items[intFor]);
        //
        RegistroE990.QTD_LIN_E := RegistroE990.QTD_LIN_E + 1;
     end;
     /// Variav�l para armazenar a quantidade de registro do tipo.
     FRegistroE200Count := FRegistroE200Count + RegE001.RegistroE200.Count;
  end;
  Result := strRegistroE200;
end;

function TBloco_E.WriteRegistroE210(RegE200: TRegistroE200): String;
var
intFor: integer;
strRegistroE210: String;
begin
  strRegistroE210 := '';

  if Assigned( RegE200.RegistroE210 ) then
  begin
     for intFor := 0 to RegE200.RegistroE210.Count - 1 do
     begin
        with RegE200.RegistroE210.Items[intFor] do
        begin
          strRegistroE210 := strRegistroE210 + LFill('E210') +
                                               LFill( Integer(IND_MOV_ST), 0 ) +
                                               LFill( VL_SLD_CRED_ANT_ST,0 ) +
                                               LFill( VL_DEVOL_ST, 0 ) +
                                               LFill( VL_RESSARC_ST, 0 ) +
                                               LFill( VL_OUT_CRED_ST, 0 ) +
                                               LFill( VL_AJ_CREDITOS_ST, 0 ) +
                                               LFill( VL_RETENCAO_ST, 0 ) +
                                               LFill( VL_OUT_DEB_ST, 0 ) +
                                               LFill( VL_AJ_DEBITOS_ST, 0 ) +
                                               LFill( VL_SLD_DEV_ANT_ST, 0 ) +
                                               LFill( VL_DEDUCOES_ST, 0 ) +
                                               LFill( VL_ICMS_RECOL_ST, 0 ) +
                                               LFill( VL_SLD_CRED_ST_TRANSPORTAR, 0 ) +
                                               LFill( DEB_ESP_ST, 0 ) +
                                               Delimitador +
                                               #13#10;
        end;
        /// Registros FILHOS
        strRegistroE210 := strRegistroE210 +
                           WriteRegistroE220(RegE200.RegistroE210.Items[intFor]) +
                           WriteRegistroE250(RegE200.RegistroE210.Items[intFor]);
        ///
        RegistroE990.QTD_LIN_E := RegistroE990.QTD_LIN_E + 1;
     end;
     /// Variav�l para armazenar a quantidade de registro do tipo.
     FRegistroE210Count := FRegistroE210Count + RegE200.RegistroE210.Count;
  end;
  Result := strRegistroE210;
end;

function TBloco_E.WriteRegistroE220(RegE210: TRegistroE210): String;
var
intFor: integer;
strRegistroE220: String;
begin
  strRegistroE220 := '';

  if Assigned( RegE210.RegistroE220 ) then
  begin
     for intFor := 0 to RegE210.RegistroE220.Count - 1 do
     begin
        with RegE210.RegistroE220.Items[intFor] do
        begin
          strRegistroE220 := strRegistroE220 + LFill('E220') +
                                               LFill( COD_AJ_APUR ) +
                                               LFill( DESCR_COMPL_AJ ) +
                                               LFill( VL_AJ_APUR,0 ) +
                                               Delimitador +
                                               #13#10;
        end;
        /// Registros FILHOS
        strRegistroE220 := strRegistroE220 +
                           WriteRegistroE230(RegE210.RegistroE220.Items[intFor]) +
                           WriteRegistroE240(RegE210.RegistroE220.Items[intFor]);
        //
        RegistroE990.QTD_LIN_E := RegistroE990.QTD_LIN_E + 1;
     end;
     /// Variav�l para armazenar a quantidade de registro do tipo.
     FRegistroE220Count := FRegistroE220Count + RegE210.RegistroE220.Count;
  end;
  Result := strRegistroE220;
end;

function TBloco_E.WriteRegistroE230(RegE220: TRegistroE220): String;
var
intFor: integer;
intIND_PROC: integer;
strRegistroE230: String;
begin
  strRegistroE230 := '';

  if Assigned( RegE220.RegistroE230 ) then
  begin
     for intFor := 0 to RegE220.RegistroE230.Count - 1 do
     begin
        with RegE220.RegistroE230.Items[intFor] do
        begin
          case IND_PROC of
           opSefaz:           intIND_PROC := 0;
           opJusticaFederal:  intIND_PROC := 1;
           opJusticaEstadual: intIND_PROC := 2;
           opSecexRFB:        intIND_PROC := 3;
           opOutros:          intIND_PROC := 9;
          end;
          strRegistroE230 := strRegistroE230 + LFill('E230') +
                                               LFill( NUM_DA ) +
                                               LFill( NUM_PROC ) +
                                               LFill( intIND_PROC, 0 ) +
                                               LFill( PROC ) +
                                               LFill( TXT_COMPL ) +
                                               Delimitador +
                                               #13#10;
        end;
        RegistroE990.QTD_LIN_E := RegistroE990.QTD_LIN_E + 1;
     end;
     /// Variav�l para armazenar a quantidade de registro do tipo.
     FRegistroE230Count := FRegistroE230Count + RegE220.RegistroE230.Count;
  end;
  Result := strRegistroE230;
end;

function TBloco_E.WriteRegistroE240(RegE220: TRegistroE220): String;
var
intFor: integer;
strRegistroE240: String;
begin
  strRegistroE240 := '';

  if Assigned( RegE220.RegistroE240 ) then
  begin
     for intFor := 0 to RegE220.RegistroE240.Count - 1 do
     begin
        with RegE220.RegistroE240.Items[intFor] do
        begin
          strRegistroE240 := strRegistroE240 + LFill('E240') +
                                               LFill( COD_PART ) +
                                               LFill( COD_MOD ) +
                                               LFill( SER ) +
                                               LFill( SUB ) +
                                               LFill( NUM_DOC ) +
                                               LFill( DT_DOC ) +
                                               LFill( CHV_NFE ) +
                                               LFill( COD_ITEM ) +
                                               LFill( VL_AJ_ITEM,0 ) +
                                               Delimitador +
                                               #13#10;
        end;
        RegistroE990.QTD_LIN_E := RegistroE990.QTD_LIN_E + 1;
     end;
     /// Variav�l para armazenar a quantidade de registro do tipo.
     FRegistroE240Count := FRegistroE240Count + RegE220.RegistroE240.Count;
  end;
  Result := strRegistroE240;
end;

function TBloco_E.WriteRegistroE250(RegE210: TRegistroE210): String;
var
intFor: integer;
strIND_PROC: string;
strRegistroE250: string;
begin
  strRegistroE250 := '';

  if Assigned( RegE210.RegistroE250 ) then
  begin
     for intFor := 0 to RegE210.RegistroE250.Count - 1 do
     begin
        with RegE210.RegistroE250.Items[intFor] do
        begin
          case IND_PROC of
           opSefaz:           strIND_PROC := '0';
           opJusticaFederal:  strIND_PROC := '1';
           opJusticaEstadual: strIND_PROC := '2';
           opSecexRFB:        strIND_PROC := '3';
           opOutros:          strIND_PROC := '9';
           opNenhum:          strIND_PROC := '';
          end;
          strRegistroE250 := strRegistroE250 + LFill('E250') +
                                               LFill( COD_OR ) +
                                               LFill( VL_OR,0 ) +
                                               LFill( DT_VCTO ) +
                                               LFill( COD_REC ) +
                                               LFill( NUM_PROC ) +
                                               LFill( strIND_PROC ) +
                                               LFill( PROC ) +
                                               LFill( TXT_COMPL ) +
                                               Delimitador +
                                               #13#10;
        end;
        RegistroE990.QTD_LIN_E := RegistroE990.QTD_LIN_E + 1;
     end;
     /// Variav�l para armazenar a quantidade de registro do tipo.
     FRegistroE250Count := FRegistroE250Count + RegE210.RegistroE250.Count;
  end;
  Result := strRegistroE250;
end;

function TBloco_E.WriteRegistroE500(RegE001: TRegistroE001): String;
var
intFor: integer;
strRegistroE500: String;
begin
  strRegistroE500 := '';

  if Assigned( RegE001.RegistroE500 ) then
  begin
     for intFor := 0 to RegE001.RegistroE500.Count - 1 do
     begin
        with RegE001.RegistroE500.Items[intFor] do
        begin
          strRegistroE500 := strRegistroE500 + LFill('E500') +
                                               LFill( Integer(IND_APUR), 0 ) +
                                               LFill( DT_INI ) +
                                               LFill( DT_FIN ) +
                                               Delimitador +
                                               #13#10;
        end;
        /// Registros FILHOS
        strRegistroE500 := strRegistroE500 +
                           WriteRegistroE510(RegE001.RegistroE500.Items[intFor]) +
                           WriteRegistroE520(RegE001.RegistroE500.Items[intFor]);
        ///
        RegistroE990.QTD_LIN_E := RegistroE990.QTD_LIN_E + 1;
     end;
     /// Variav�l para armazenar a quantidade de registro do tipo.
     FRegistroE500Count := FRegistroE500Count + RegE001.RegistroE500.Count;
  end;
  Result := strRegistroE500;
end;

function TBloco_E.WriteRegistroE510(RegE500: TRegistroE500): String;
var
intFor: integer;
//strCST_IPI: String;
strRegistroE510: String;
begin
  strRegistroE510 := '';

  if Assigned( RegE500.RegistroE510 ) then
  begin
     for intFor := 0 to RegE500.RegistroE510.Count - 1 do
     begin
        with RegE500.RegistroE510.Items[intFor] do
        begin
{
          case CST_IPI of
           ipiEntradaRecuperacaoCredito: strCST_IPI := '00';
           ipiEntradaTributradaZero:     strCST_IPI := '01';
           ipiEntradaIsenta:             strCST_IPI := '02';
           ipiEntradaNaoTributada:       strCST_IPI := '03';
           ipiEntradaImune:              strCST_IPI := '04';
           ipiEntradaComSuspensao:       strCST_IPI := '05';
           ipiOutrasEntradas:            strCST_IPI := '49';
           ipiSaidaTributada:            strCST_IPI := '50';
           ipiSaidaTributadaZero:        strCST_IPI := '51';
           ipiSaidaIsenta:               strCST_IPI := '52';
           ipiSaidaNaoTributada:         strCST_IPI := '53';
           ipiSaidaImune:                strCST_IPI := '54';
           ipiSaidaComSuspensao:         strCST_IPI := '55';
           ipiOutrasSaidas:              strCST_IPI := '99';
          end;
}
          strRegistroE510 := strRegistroE510 + LFill('E510') +
                                               LFill( CFOP,4 ) +
//                                               LFill( strCST_IPI ) +
                                               LFill( CST_IPI ) +
                                               LFill( VL_CONT_IPI,0 ) +
                                               LFill( VL_BC_IPI,0 ) +
                                               LFill( VL_IPI,0 ) +
                                               Delimitador +
                                               #13#10;
        end;
        RegistroE990.QTD_LIN_E := RegistroE990.QTD_LIN_E + 1;
     end;
     /// Variav�l para armazenar a quantidade de registro do tipo.
     FRegistroE510Count := FRegistroE510Count + RegE500.RegistroE510.Count;
  end;
  Result := strRegistroE510;
end;

function TBloco_E.WriteRegistroE520(RegE500: TRegistroE500): String;
var
intFor: integer;
strRegistroE520: String;
begin
  strRegistroE520 := '';

  if Assigned( RegE500.RegistroE520 ) then
  begin
     for intFor := 0 to RegE500.RegistroE520.Count - 1 do
     begin
        with RegE500.RegistroE520.Items[intFor] do
        begin
          strRegistroE520 := strRegistroE520 + LFill('E520') +
                                               LFill( VL_SD_ANT_IPI,0 ) +
                                               LFill( VL_DEB_IPI,0 ) +
                                               LFill( VL_CRED_IPI,0 ) +
                                               LFill( VL_OD_IPI,0 ) +
                                               LFill( VL_OC_IPI,0 ) +
                                               LFill( VL_SC_IPI,0 ) +
                                               LFill( VL_SD_IPI,0 ) +
                                               Delimitador +
                                               #13#10;
        end;
        /// Registros FILHOS
        strRegistroE520 := strRegistroE520;
                           WriteRegistroE530(RegE500.RegistroE520.Items[intFor]);
        //
        RegistroE990.QTD_LIN_E := RegistroE990.QTD_LIN_E + 1;
     end;
     /// Variav�l para armazenar a quantidade de registro do tipo.
     FRegistroE520Count := FRegistroE520Count + RegE500.RegistroE520.Count;
  end;
  Result := strRegistroE520;
end;

function TBloco_E.WriteRegistroE530(RegE520: TRegistroE520): String;
var
intFor: integer;
intIND_DOC: integer;
strRegistroE530: String;
begin
  strRegistroE530 := '';

  if Assigned( RegE520.RegistroE530 ) then
  begin
     for intFor := 0 to RegE520.RegistroE530.Count - 1 do
     begin
        with RegE520.RegistroE530.Items[intFor] do
        begin
          case IND_DOC of
           odPorcessoJudicial: intIND_DOC := 0;
           odProcessoAdminist: intIND_DOC := 1;
           odPerDcomp:         intIND_DOC := 2;
           odOutros:           intIND_DOC := 9;
          end;
          strRegistroE530 := strRegistroE530 + LFill('E530') +
                                               LFill( Integer(IND_AJ), 0 ) +
                                               LFill( VL_AJ,0 ) +
                                               LFill( COD_AJ ) +
                                               LFill( intIND_DOC, 0 ) +
                                               LFill( NUM_DOC ) +
                                               LFill( DESCR_AJ ) +
                                               Delimitador +
                                               #13#10;
        end;
        RegistroE990.QTD_LIN_E := RegistroE990.QTD_LIN_E + 1;
     end;
     /// Variav�l para armazenar a quantidade de registro do tipo.
     FRegistroE530Count := FRegistroE530Count + RegE520.RegistroE530.Count;
  end;
  Result := strRegistroE530;
end;

function TBloco_E.WriteRegistroE990: String;
begin
  Result := '';

  if Assigned(RegistroE990) then
  begin
     with RegistroE990 do
     begin
       QTD_LIN_E := QTD_LIN_E + 1;
       ///
       Result := LFill('E990') +
                 LFill(QTD_LIN_E,0) +
                 Delimitador +
                 #13#10;
     end;
  end;
end;

end.
