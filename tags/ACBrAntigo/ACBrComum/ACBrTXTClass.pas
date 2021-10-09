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

unit ACBrTXTClass;

interface

uses SysUtils, Classes, DateUtils, Math;

type
  TErrorEvent = procedure(const MsnError: AnsiString) of object;

  TACBrTXTClass = class
  private
    FOnError: TErrorEvent;
    FDelimitador: String;     /// Caracter delimitador de campos
    FTrimString: boolean;     /// Retorna a string sem espa�os em branco iniciais e finais
    FCurMascara: String;      /// Mascara para valores tipo currency

    FListaMUN: TStringList;

    procedure AssignError(MsnError: String);
  public
    function RFill(Value: String; Size: Integer = 0; Caracter: Char = ' '): String; overload;
    function LFill(Value: String; Size: Integer = 0; Caracter: Char = '0'): String; overload;
    function DFill(Value: Double;
                   Decimal: Integer = 2;
                   Nulo: Boolean = false): String;
    function LFill(Value: Currency;
                   Size: Integer;
                   Decimal: Integer = 2;
                   Nulo: Boolean = false;
                   Caracter: Char = '0'): String; overload;
    function LFill(Value: Integer; Size: Integer; Nulo: Boolean = false; Caracter: Char = '0'): String; overload;
    function LFill(Value: TDateTime; Mask: String = 'ddmmyyyy'): String; overload;
    ///
    procedure Check(Condicao: Boolean; const Msg: String); overload;
    procedure Check(Condicao: Boolean; Msg: String; Fmt: array of const); overload;
    ///
    property Delimitador: String read FDelimitador write FDelimitador;
    property TrimString: boolean read FTrimString write FTrimString;
    property CurMascara: String read FCurMascara write FCurMascara;
    property OnError: TErrorEvent read FOnError write FOnError;
  end;

implementation

(* TACBrTXTClass *)

procedure TACBrTXTClass.Check(Condicao: Boolean; const Msg: String);
begin
  if not Condicao then AssignError(Msg);
end;

procedure TACBrTXTClass.Check(Condicao: Boolean; Msg: String; Fmt: array of const);
begin
  Check(Condicao, Format(Msg, Fmt));
end;

function TACBrTXTClass.RFill(Value: String; Size: Integer = 0; Caracter: Char = ' '): String;
begin
  /// Se a propriedade TrimString = true, Result retorna sem espa�os em branco
  /// iniciais e finais.
  if FTrimString then
     Result := Trim(Result);

  if (Size > 0) and (Length(Value) > Size) then
     Result := Copy(Value, 1, Size)
  else
     Result := Value + StringOfChar(Caracter, Size - Length(Value));

  Result := FDelimitador + Result;
end;

function TACBrTXTClass.LFill(Value: String; Size: Integer = 0; Caracter: Char = '0'): String;
begin
  /// Se a propriedade TrimString = true, Result retorna sem espa�os em branco
  /// iniciais e finais.
  if FTrimString then
     Result := Trim(Result);

  if (Size > 0) and (Length(Value) > Size) then
     Result := Copy(Value, 1, Size)
  else
     Result := StringOfChar(Caracter, Size - length(Value)) + Value;

  Result := FDelimitador + Result;
end;

function TACBrTXTClass.LFill(Value: Currency;
                        Size: Integer;
                        Decimal: Integer = 2;
                        Nulo: Boolean = false;
                        Caracter: Char = '0'): String;
var
intFor, intP: Integer;
begin
  /// Se o parametro Nulo = true e Value = 0, ser� retornado '|'
  if (Nulo) and (Value = 0) then
  begin
     Result := FDelimitador;
     Exit;
  end;
  intP := 1;
  for intFor := 1 to Decimal do
  begin
     intP := intP * 10;
  end;
  if FCurMascara <> '' then
     Result := FDelimitador + FormatCurr(FCurMascara, Value)
  else
     Result := LFill(Trunc(Value * intP), Size, Nulo, Caracter);
end;

function TACBrTXTClass.DFill(Value: Double;
                        Decimal: Integer = 2;
                        Nulo: Boolean = false): String;
begin
  /// Se o parametro Nulo = true e Value = 0, ser� retornado '|'
  if (Nulo) and (Value = 0) then
  begin
     Result := FDelimitador;
     Exit;
  end;
  Result := FDelimitador + CurrToStr(RoundTo(Value, -1 * Decimal));
end;

function TACBrTXTClass.LFill(Value: Integer; Size: Integer; Nulo: Boolean = false; Caracter: Char = '0'): String;
begin
  /// Se o parametro Nulo = true e Value = 0, ser� retornado '|'
  if (Nulo) and (Value = 0) then
  begin
     Result := FDelimitador;
     Exit;
  end;
  Result := LFill(IntToStr(Value), Size, Caracter);
end;

function TACBrTXTClass.LFill(Value: TDateTime; Mask: String = 'ddmmyyyy'): String;
begin
  /// Se o parametro Value = 0, ser� retornado '|'
  if (Value = 0) then
  begin
     Result := FDelimitador;
     Exit;
  end;
  Result := FDelimitador + FormatDateTime(Mask, Value);
end;

procedure TACBrTXTClass.AssignError(MsnError: String);
begin
  if Assigned(FOnError) then FOnError(MsnError);
end;

end.
