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

unit ACBrECDBloco_J_Class;

interface

uses SysUtils, Classes, DateUtils, ACBrSped, ACBrECDBloco_J;

type
  /// TBloco_J -
  TBloco_J = class(TACBrSPED)
  private
    FRegistroJ001: TRegistroJ001;      /// BLOCO J - RegistroJ001
    FRegistroJ005: TRegistroJ005List;  /// BLOCO J - Lista de RegistroJ005
    FRegistroJ100: TRegistroJ100List;  /// BLOCO J - Lista de RegistroJ100
    FRegistroJ150: TRegistroJ150List;  /// BLOCO J - Lista de RegistroJ150
    FRegistroJ800: TRegistroJ800List;  /// BLOCO J - Lista de RegistroJ800
    FRegistroJ900: TRegistroJ900;      /// BLOCO J - RegistroJ900
    FRegistroJ930: TRegistroJ930List;  /// BLOCO J - Lista de RegistroJ930
    FRegistroJ990: TRegistroJ990;      /// BLOCO J - FRegistroJ990
  public
    constructor Create(AOwner: TComponent); override; /// Create
    destructor Destroy; override; /// Destroy
    procedure LimpaRegistros;

    function WriteRegistroJ001: AnsiString;
    function WriteRegistroJ005: AnsiString;
    function WriteRegistroJ100: AnsiString;
    function WriteRegistroJ150: AnsiString;
    function WriteRegistroJ800: AnsiString;
    function WriteRegistroJ900: AnsiString;
    function WriteRegistroJ930: AnsiString;
    function WriteRegistroJ990: AnsiString;

    property RegistroJ001: TRegistroJ001     read fRegistroJ001 write fRegistroJ001;
    property RegistroJ005: TRegistroJ005List read fRegistroJ005 write fRegistroJ005;
    property RegistroJ100: TRegistroJ100List read fRegistroJ100 write fRegistroJ100;
    property RegistroJ150: TRegistroJ150List read fRegistroJ150 write fRegistroJ150;
    property RegistroJ800: TRegistroJ800List read fRegistroJ800 write fRegistroJ800;
    property RegistroJ900: TRegistroJ900     read fRegistroJ900 write fRegistroJ900;
    property RegistroJ930: TRegistroJ930List read fRegistroJ930 write fRegistroJ930;
    property RegistroJ990: TRegistroJ990     read fRegistroJ990 write fRegistroJ990;
  end;

implementation

{ TBloco_J }

constructor TBloco_J.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FRegistroJ001 := TRegistroJ001.Create;
  FRegistroJ005 := TRegistroJ005List.Create;
  FRegistroJ100 := TRegistroJ100List.Create;
  FRegistroJ150 := TRegistroJ150List.Create;
  FRegistroJ800 := TRegistroJ800List.Create;
  FRegistroJ900 := TRegistroJ900.Create;
  FRegistroJ930 := TRegistroJ930List.Create;
  FRegistroJ990 := TRegistroJ990.Create;

  FRegistroJ990.QTD_LIN_J := 0;
end;

destructor TBloco_J.Destroy;
begin
  FRegistroJ001.Free;
  FRegistroJ005.Free;
  FRegistroJ100.Free;
  FRegistroJ150.Free;
  FRegistroJ800.Free;
  FRegistroJ900.Free;
  FRegistroJ930.Free;
  FRegistroJ990.Free;
  inherited;
end;

procedure TBloco_J.LimpaRegistros;
begin
  FRegistroJ005.Clear;
  FRegistroJ100.Clear;
  FRegistroJ150.Clear;
  FRegistroJ800.Clear;
  FRegistroJ930.Clear;

  FRegistroJ990.QTD_LIN_J := 0;
end;

function TBloco_J.WriteRegistroJ001: AnsiString;
begin
  Result := '';

  if Assigned(FRegistroJ001) then
  begin
     with FRegistroJ001 do
     begin
       Check(((IND_DAD = 0) or (IND_DAD = 1)), '(J-J001) Na abertura do bloco, deve ser informado o n?mero 0 ou 1!');
       ///
       Result := LFill('J001') +
                 LFill(IND_DAD, 1) +
                 Delimitador +
                 #13#10;
       ///
       FRegistroJ990.QTD_LIN_J := FRegistroJ990.QTD_LIN_J + 1;
     end;
  end;
end;

function TBloco_J.WriteRegistroJ005: AnsiString;
var
intFor: integer;
strRegistroJ005: AnsiString;
begin
  strRegistroJ005 := '';

  if Assigned(FRegistroJ005) then
  begin
     for intFor := 0 to FRegistroJ005.Count - 1 do
     begin
        with FRegistroJ005.Items[intFor] do
        begin
           Check(((ID_DEM = 1) or (ID_DEM = 2)), '(J-J005) Na Identifica??o das demonstra??es, deve ser informado o n?mero 1 ou 2!');
           ///
           strRegistroJ005 :=  strRegistroJ005 + LFill('J005') +
                                                 LFill(DT_INI) +
                                                 LFill(DT_FIN) +
                                                 LFill(ID_DEM, 1) +
                                                 LFill(CAB_DEM) +
                                                 Delimitador +
                                                 #13#10;
        end;
        FRegistroJ990.QTD_LIN_J := FRegistroJ990.QTD_LIN_J + 1;
     end;
  end;
  Result := strRegistroJ005;
end;

function TBloco_J.WriteRegistroJ100: AnsiString;
var
intFor: integer;
strRegistroJ100: AnsiString;
begin
  strRegistroJ100 := '';

  if Assigned(FRegistroJ100) then
  begin
     for intFor := 0 to FRegistroJ100.Count - 1 do
     begin
        with FRegistroJ100.Items[intFor] do
        begin
           Check(((IND_GRP_BAL = '1') or (IND_GRP_BAL = '2')), '(J-J100) No Indicador de grupo do balan?o, deve ser informado o n?mero 1 ou 2!');
           Check(((IND_DC_BAL = 'D') or (IND_DC_BAL = 'C')), '(J-J100) No Indicador da situa??o do saldo, deve ser informado: D ou C!');
           ///
           strRegistroJ100 :=  strRegistroJ100 + LFill('J100') +
                                                 LFill(COD_AGL) +
                                                 LFill(NIVEL_AGL) +
                                                 LFill(IND_GRP_BAL, 1) +
                                                 LFill(DESCR_COD_AGL) +
                                                 LFill(VL_CTA, 19, 2) +
                                                 LFill(IND_DC_BAL, 1) +
                                                 Delimitador +
                                                 #13#10;
        end;
        FRegistroJ990.QTD_LIN_J := FRegistroJ990.QTD_LIN_J + 1;
     end;
  end;
  Result := strRegistroJ100;
end;

function TBloco_J.WriteRegistroJ150: AnsiString;
var
intFor: integer;
strRegistroJ150: AnsiString;
begin
  strRegistroJ150 := '';

  if Assigned(FRegistroJ150) then
  begin
     for intFor := 0 to FRegistroJ150.Count - 1 do
     begin
        with FRegistroJ150.Items[intFor] do
        begin
           Check(((IND_VL = 'D') or (IND_VL = 'R') or (IND_VL = 'P') or (IND_VL = 'N')), '(J-J150) No Indicador da situa??o do valor, deve ser informado: D ou R ou P ou N!');
           ///
           strRegistroJ150 :=  strRegistroJ150 + LFill('J150') +
                                                 LFill(COD_AGL) +
                                                 LFill(NIVEL_AGL) +
                                                 LFill(DESCR_COD_AGL) +
                                                 LFill(VL_CTA, 19, 2) +
                                                 LFill(IND_VL, 1) +
                                                 Delimitador +
                                                 #13#10;
        end;
        FRegistroJ990.QTD_LIN_J := FRegistroJ990.QTD_LIN_J + 1;
     end;
  end;
  Result := strRegistroJ150;
end;

function TBloco_J.WriteRegistroJ800: AnsiString;
var
intFor: integer;
strRegistroJ800: AnsiString;
begin
  strRegistroJ800 := '';

  if Assigned(FRegistroJ800) then
  begin
     for intFor := 0 to FRegistroJ800.Count - 1 do
     begin
        with FRegistroJ800.Items[intFor] do
        begin
           ///
           strRegistroJ800 :=  strRegistroJ800 + LFill('J800') +
                                                 LFill(ARQ_RTF) +
                                                 LFill('J800FIM') +
                                                 Delimitador +
                                                 #13#10;
        end;
        FRegistroJ990.QTD_LIN_J := FRegistroJ990.QTD_LIN_J + 1;
     end;
  end;
  Result := strRegistroJ800;
end;

function TBloco_J.WriteRegistroJ900: AnsiString;
begin
  Result := '';

  if Assigned(FRegistroJ900) then
  begin
     with FRegistroJ900 do
     begin
       ///
       Result := LFill('J900') +
                 LFill('TERMO DE ENCERRAMENTO') +
                 LFill(NUM_ORD) +
                 RFill(NAT_LIVRO, 80) +
                 LFill(NOME) +
//                 LFill(QTD_LIN, 9, false) +
                 LFill('[*******]') +
                 LFill(DT_INI_ESCR) +
                 LFill(DT_FIN_ESCR) +
                 Delimitador +
                 #13#10;
       ///
       FRegistroJ990.QTD_LIN_J := FRegistroJ990.QTD_LIN_J + 1;
     end;
  end;
end;

function TBloco_J.WriteRegistroJ930: AnsiString;
var
intFor: integer;
strRegistroJ930: AnsiString;
begin
  strRegistroJ930 := '';

  if Assigned(FRegistroJ930) then
  begin
     for intFor := 0 to FRegistroJ930.Count - 1 do
     begin
        with FRegistroJ930.Items[intFor] do
        begin
           ///
           strRegistroJ930 :=  strRegistroJ930 + LFill('J930') +
                                                 LFill(IDENT_NOM) +
                                                 LFill(IDENT_CPF) +
                                                 LFill(IDENT_QUALIF) +
                                                 LFill(COD_ASSIN, 3) +
                                                 LFill(IND_CRC, 11) +
                                                 Delimitador +
                                                 #13#10;
        end;
        FRegistroJ990.QTD_LIN_J := FRegistroJ990.QTD_LIN_J + 1;
     end;
  end;
  Result := strRegistroJ930;
end;

function TBloco_J.WriteRegistroJ990: AnsiString;
begin
  Result := '';

  if Assigned(FRegistroJ990) then
  begin
     with FRegistroJ990 do
     begin
       QTD_LIN_J := QTD_LIN_J + 1;
       ///
       Result := LFill('J990') +
                 LFill(QTD_LIN_J, 0) +
                 Delimitador +
                 #13#10;
     end;
  end;
end;

end.
