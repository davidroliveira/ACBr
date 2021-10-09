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

unit ACBrPAF_D_Class;

interface

uses SysUtils, Classes, DateUtils, ACBrTXTClass, ACBrPAFRegistros, ACBrPAF_D;

type
  /// TACBrPAF_D -
  TPAF_D = class(TACBrTXTClass)
  private
    FRegistroD1: TRegistroD1;       /// FRegistroD1
    FRegistroD2: TRegistroD2List;   /// Lista de FRegistroD2
    FRegistroD9: TRegistroD9;       /// FRegistroD9
  protected
  public
    constructor Create; /// Create
    destructor Destroy; override; /// Destroy

    function WriteRegistroD1: String;
    function WriteRegistroD2: String;
    function WriteRegistroD9: String;

    property RegistroD1: TRegistroD1 read FRegistroD1 write FRegistroD1;
    property RegistroD2: TRegistroD2List read FRegistroD2 write FRegistroD2;
    property RegistroD9: TRegistroD9 read FRegistroD9 write FRegistroD9;
  end;

implementation

uses ACBrSPEDUtils;

{ TPAF_D }

constructor TPAF_D.Create;
begin
  FRegistroD1  := TRegistroD1.Create;
  FRegistroD2  := TRegistroD2List.Create;
  FRegistroD9  := TRegistroD9.Create;

  FRegistroD9.TOT_REG := 0;
end;

destructor TPAF_D.Destroy;
begin
  FRegistroD1.Free;
  FRegistroD2.Free;
  FRegistroD9.Free;
  inherited;
end;

function TPAF_D.WriteRegistroD1: String;
begin
   if Assigned(FRegistroD1) then
   begin
      with FRegistroD1 do
      begin
        Check(funChecaCNPJ(CNPJ), '(D1) ESTABELECIMENTO: O CNPJ "%s" digitado � inv�lido!', [CNPJ]);
        Check(funChecaIE(IE, UF), '(D1) ESTABELECIMENTO: A Inscri��o Estadual "%s" digitada � inv�lida!', [IE]);
        ///
        Result := LFill('D1') +
                  LFill(CNPJ, 14) +
                  RFill(IE, 14) +
                  RFill(IM, 14) +
                  RFill(RAZAOSOCIAL, 50) +
                  #13#10;
      end;
   end;
end;

function TPAF_D.WriteRegistroD2: String;
var
intFor: integer;
strRegistroD2: String;
begin
  strRegistroD2 := '';

  if Assigned(FRegistroD2) then
  begin
     for intFor := 0 to FRegistroD2.Count - 1 do
     begin
        with FRegistroD2.Items[intFor] do
        begin
          Check(funChecaCNPJ(FRegistroD1.CNPJ), '(D2) DAV EMITIDOS: O CNPJ "%s" digitado � inv�lido!', [FRegistroD1.CNPJ]);
          ///
          strRegistroD2 := strRegistroD2 + LFill('D2') +
                                           LFill(FRegistroD1.CNPJ, 14) +
                                           RFill(NUM_FAB, 20) +
                                           RFill(MF_ADICIONAL, 1) +
                                           RFill(TIPO_ECF, 7) +
                                           RFill(MARCA_ECF, 20) +
                                           RFill(MODELO_ECF, 20) +
                                           RFill(COO, 6) +
                                           RFill(NUM_DAV, 13) +
                                           LFill(DT_DAV, 'yyyymmdd') +
                                           RFill(TIT_DAV, 30) +
                                           LFill(VLT_DAV, 8, 2) +
//                                           RFill(CCF, 6) +
                                           #13#10;
        end;
        ///
        FRegistroD9.TOT_REG := FRegistroD9.TOT_REG + 1;
     end;
     Result := strRegistroD2;
  end;
end;

function TPAF_D.WriteRegistroD9: String;
begin
   if Assigned(FRegistroD9) then
   begin
      with FRegistroD9 do
      begin
        Check(funChecaCNPJ(FRegistroD1.CNPJ),            '(D9) TOTALIZA��O: O CNPJ "%s" digitado � inv�lido!', [FRegistroD1.CNPJ]);
        Check(funChecaIE(FRegistroD1.IE, FRegistroD1.UF), '(D9) TOTALIZA��O: A Inscri��o Estadual "%s" digitada � inv�lida!', [FRegistroD1.IE]);
        ///
        Result := LFill('D9') +
                  LFill(FRegistroD1.CNPJ, 14) +
                  LFill(FRegistroD1.IE, 14) +
                  LFill(TOT_REG, 6, 0) +
                  #13#10;
      end;
   end;
end;

end.
