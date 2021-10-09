{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para interação com equipa- }
{ mentos de Automação Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2004 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Você pode obter a última versão desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{  Algumas funçoes dessa Unit foram extraidas de outras Bibliotecas, veja no   }
{ cabeçalho das Funçoes no código abaixo a origem das informaçoes, e autores...}
{                                                                              }
{  Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }
{                                                                              }
{  Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU      }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto}
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,  }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Você também pode obter uma copia da licença em:                              }
{ http://www.opensource.org/licenses/gpl-license.php                           }
{                                                                              }
{ Daniel Simões de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Praça Anita Costa, 34 - Tatuí - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{******************************************************************************
|* Historico
|*
|* 30/06/2004:  Daniel Simoes de Almeida
|*   Funçoes auxiliares separadas do código do componentes
|* 19/12/2004:  Daniel Simoes de Almeida
|*   Adcionada a procedure DeleteFiles e a Funçao CopyFileTo
|* 15/07/2005:  Daniel Simoes de Almeida
|*   Rotina TiraAcentos() modificada para permitir os chars #13 e #10
|* 09/12/2005:  Daniel Simoes de Almeida
|*   Funções StringToAsc e AscToSTring movidas de ACBrECFNaoFiscal.pas para
|*   ACBrUtil.pas
|* 09/12/2005:  Daniel Simoes de Almeida
|*   Adicionada função FunctionDetect (LibName, FuncName: String;
|*                                    var LibPointer: Pointer): boolean;
|*   Funções InPort e OutPort agora suportam a DLL inpout32.dll, que permite
|*   acesso direto a portas no XP /NT / 98  http://www.logix4u.net/inpout32.htm
|* 05/03/2006:  Daniel Simoes de Almeida
|* +  StringToDateTime( DateTimeString : String ) : TDateTime ;
|* +  StringToDateTimeDef( DateTimeString : String ; DefaultValue : TDateTime )
|*         : TDateTime ;
|* 23/05/2006:  Daniel Simoes de Almeida
|*   - Adicionada a função:  PosLast(const SubStr, S: string): Integer;
|*     que retorna a última posição de SubStr dentro da String S, ou 0 se não
|*     encontrar a SubStr dentro de S
******************************************************************************}

{$I ACBr.inc}
{$ifdef FPC}
  {$DEFINE INC_FPC_D5}
{$ENDIF}
{$IFNDEF Delphi6_UP}
  {$DEFINE INC_FPC_D5}
{$ENDIF}

{$DEFINE INC_FunctionDetect}
{$IFDEF LINUX}
   {$IFDEF FPC}
      {$UNDEF INC_FunctionDetect}
   {$ENDIF}
{$ENDIF}

unit ACBrUtil;

interface
Uses SysUtils, Math, Classes,
    {$IFDEF Delphi6_UP} StrUtils, {$ELSE} ACBrD5, FileCtrl, {$ENDIF}
    {$ifdef MSWINDOWS}
      Windows, ShellAPI
    {$else}
      {$IFNDEF FPC}
        Libc
      {$else}
        unix
      {$endif}
    {$endif} ;

function TruncFix( X : Real ) : Integer ;

function TestBit(const Value: Byte; const Bit: Byte): Boolean;

function padL(AString : string; nLen : Integer; Caracter : Char = ' ') : String;
function padR(AString : string; nLen : Integer; Caracter : Char = ' ') : String;
function padC(AString : string; nLen : Integer; Caracter : Char = ' ') : String;
function padS(AString : string; nLen : Integer; Separador : String;
   Caracter : Char = ' ') : String ;

{ PosEx, retirada de StrUtils.pas do D7, para compatibilizar com o Delphi 6
  (que nao possui essa funçao) }
function PosEx(const SubStr, S: string; Offset: Cardinal = 1): Integer;

{$ifdef INC_FPC_D5}
  type TRoundToRange = -37..37;
  function RoundTo(const AValue: Double; const ADigit: TRoundToRange): Double;

  { IfThens retirada de Math.pas do D7, para compatibilizar com o Delphi 5 e FPC
  (que nao possuem essas funçao) }
  function IfThen(AValue: Boolean; const ATrue: Integer; const AFalse: Integer = 0): Integer; overload;
  function IfThen(AValue: Boolean; const ATrue: Int64; const AFalse: Int64 = 0): Int64; overload;
  function IfThen(AValue: Boolean; const ATrue: Double; const AFalse: Double = 0.0): Double; overload;

  { IfThens retirada de StrUtils.pas do D7, para compatibilizar com o Delphi 5 e FPC
  (que nao possuem essas funçao) }
  function IfThen(AValue: Boolean; const ATrue: string;
    AFalse: string = ''): string; overload;
{$endif}

function PosAt(const SubStr, S: string; Ocorrencia : Cardinal = 1): Integer;
function PosLast(const SubStr, S: string): Integer;
function CountStr(AString, SubStr : string ) : Integer ;
Function Poem_Zeros(Texto : String; Tamanho : Integer) : String;
Function IntToStrZero(NumInteiro, Tamanho : Integer) : String;

Function StringToFloat( NumString : String ) : Double ;
Function StringToFloatDef( NumString : String ; DefaultValue : Double ) : Double ;
Function StringToDateTime( DateTimeString : String ) : TDateTime ;
Function StringToDateTimeDef( DateTimeString : String ; DefaultValue : TDateTime ) : TDateTime ;

function StrIsAlpha(const S: String): Boolean;
function StrIsAlphaNum(const S: String): Boolean;
function StrIsNumber(const S: String): Boolean;
function CharIsAlpha(const C: Char): Boolean;
function CharIsAlphaNum(const C: Char): Boolean;
function CharIsNum(const C: Char): Boolean;
function OnlyNumber(const Value: string): String;
function OnlyAlpha(const Value: string): String;
function OnlyAlphaNum(const Value: string): String;
function StrIsIP(const Value: string): Boolean;

function TiraAcentos( AString : String ) : String ;
function TiraAcento( AChar : Char ) : Char ;
function TraduzComando( AString : String ) : String ;
Function StringToAsc( AString : String ) : String ;
Function AscToString( AString : String ) : String ;

function InPort(PortAddr:word): byte;
procedure OutPort(PortAddr: word; Databyte: byte);

function StrCrypt(AString, StrChave: string): string;
function SomaAscII(AString : string): Integer;

Function FilesExists(FileMask: string) : Boolean ;
Procedure DeleteFiles(FileMask: string)  ;
function CopyFileTo(AFromFileName, AToFileName : String;
   const AFailIfExists : Boolean = false) : Boolean;
Procedure CopyFilesToDir(FileMask: string; ToDirName : String;
   const ForceDirectory : Boolean = False)  ;
procedure RunCommand(Command: String; Params: String = ''; Wait : Boolean = false;
   WindowState : Word = 5);
procedure OpenURL( URL : String ) ;
{$IFDEF INC_FunctionDetect}
function FunctionDetect (LibName, FuncName: String; var LibPointer: Pointer): boolean;
{$ENDIF}

implementation
{$IFDEF MSWINDOWS}
var xInp32 : function (wAddr: word): byte; stdcall;
var xOut32 : function (wAddr: word; bOut: byte): byte; stdcall;
{$ENDIF}

{-----------------------------------------------------------------------------
 Corrige, bug da função Trunc.
 Deve calcular Trunc somente com variaveis e nunca com Expressoes, caso contrá-
 rio o resultado pode não ser o esperado.
 -----------------------------------------------------------------------------}
function TruncFix( X : Real ) : Integer ;
Var ADouble : Double ;
begin
  ADouble := RoundTo( X * 10 ,-1) ;
  ADouble := Trunc( ADouble ) / 10;
  Result  := Trunc( ADouble ) ;
end ;

{-----------------------------------------------------------------------------
 *** Extraido de JclLogic.pas  - Project JEDI Code Library (JCL) ***
 Retorna True se o nBit está ativo (ligado) dentro do valor Value. Inicia em 0
 ---------------------------------------------------------------------------- }
function TestBit(const Value: Byte; const Bit: Byte): Boolean;
begin
  Result := (Value and (1 shl (Bit mod 8))) <> 0;
end;

{-----------------------------------------------------------------------------
  Completa <AString> com <Caracter> a direita, até o tamanho <nLen>, Alinhando
  a <AString> a Esquerda. Se <AString> for maior que <nLen>, ela será truncada
 ---------------------------------------------------------------------------- }
function padL(AString : string; nLen : Integer; Caracter : Char) : String ;
begin
  Result := copy(AString,1,nLen) ;
  Result := Result + StringOfChar(Caracter, (nLen - Length(Result))) ;
end ;

{-----------------------------------------------------------------------------
  Completa <AString> com <Caracter> a esquerda, até o tamanho <nLen>, Alinhando
  a <AString> a Direita. Se <AString> for maior que <nLen>, ela será truncada 
 ---------------------------------------------------------------------------- }
function padR(AString : string; nLen : Integer; Caracter : Char) : String ;
begin
  Result := copy(AString,1,nLen) ;
  Result := StringOfChar(Caracter, (nLen - Length(Result))) + Result ;
end ;

{-----------------------------------------------------------------------------
 Completa <AString> Centralizando, preenchendo com <Caracter> a esquerda e direita
 ---------------------------------------------------------------------------- }
function padC(AString : string; nLen : Integer; Caracter : Char) : String ;
Var nCharLeft : Integer ;
    D : Double ;
begin
  Result    := copy(AString,1,nLen) ;
  D         := (nLen - Length( Result )) / 2 ;
  nCharLeft := Trunc( D ) ;
  Result    := padL( StringOfChar(Caracter, nCharLeft)+Result, nLen, Caracter) ;
end ;

{-----------------------------------------------------------------------------
  Ajusta a <AString> com o tamanho de <nLen> inserindo espaços no meio,
  substituindo <Separador> por n X <Caracter>  (Justificado)
 ---------------------------------------------------------------------------- }
function padS(AString : string; nLen : Integer; Separador : String;
   Caracter : Char = ' ') : String ;
var StuffStr : String ;
    nSep, nCharSep, nResto, nFeito, Ini : Integer ;
    D : Double ;
begin
  Result := copy(AString,1,nLen) ;
  if Separador = Caracter then  { Troca Separador, senao fica em loop infinito }
  begin
     Result   := StringReplace( Result,Separador,#255,[rfReplaceAll]) ;
     Separador:= #255 ;
  end ;

  nSep   := CountStr( Result, Separador ) ;

  if nSep < 1 then
  begin
     Result := PadL(Result, nLen, Caracter ) ;
     exit ;
  end ;

  Result   := Trim( Result ) ;
  D        := (nLen - (Length(Result)-nSep)) / nSep ;
  nCharSep := Trunc( D ) ;
  nResto   := nLen - ( (Length(Result)-nSep) + (nCharSep*nSep) ) ;
  nFeito   := nSep ;
  StuffStr := StringOfChar( Caracter, nCharSep ) ;

  Ini := Pos( Separador, Result ) ;
  while Ini > 0 do
  begin
     Result := StuffString(Result, Ini, length(Separador),
                 StuffStr + ifthen(nFeito <= nResto, Caracter, '' ) );

     nFeito := nFeito - 1 ;
     Ini := Pos( Separador, Result ) ;
  end ;
end ;

{-----------------------------------------------------------------------------
  Retorna quantas ocorrencias de <SubStr> existem em <AString> 
 ---------------------------------------------------------------------------- }
function CountStr(AString, SubStr : string ) : Integer ;
Var ini : Integer ;
begin
  result := 0 ;
  if SubStr = '' then exit ;

  ini := Pos( SubStr, AString ) ;
  while ini > 0 do
  begin
     Result := Result + 1 ;
     ini    := PosEx( SubStr, AString, ini + 1 ) ;
  end ;
end ;

{$ifdef INC_FPC_D5}
function RoundTo(const AValue: Double; const ADigit: TRoundToRange): Double;
var
  LFactor: Double;
begin
  LFactor := IntPower(10, ADigit);
  Result := Round(AValue / LFactor) * LFactor;
end;
function IfThen(AValue: Boolean; const ATrue: Integer; const AFalse: Integer): Integer;
begin
  if AValue then
    Result := ATrue
  else
    Result := AFalse;
end;

function IfThen(AValue: Boolean; const ATrue: Int64; const AFalse: Int64): Int64;
begin
  if AValue then
    Result := ATrue
  else
    Result := AFalse;
end;

function IfThen(AValue: Boolean; const ATrue: Double; const AFalse: Double): Double;
begin
  if AValue then
    Result := ATrue
  else
    Result := AFalse;
end;

function IfThen(AValue: Boolean; const ATrue: string;
  AFalse: string = ''): string;
begin
  if AValue then
    Result := ATrue
  else
    Result := AFalse;
end;

{$endif}

{-----------------------------------------------------------------------------
 *** PosEx, retirada de StrUtils.pas do Borland Delphi ***
  para compatibilizar com o Delphi 6  (que nao possui essa funçao)
 ---------------------------------------------------------------------------- }
function PosEx(const SubStr, S: string; Offset: Cardinal = 1): Integer;
var
  I,X: Integer;
  Len, LenSubStr: Integer;
begin
  if Offset = 1 then
    Result := Pos(SubStr, S)
  else
  begin
    I := Offset;
    LenSubStr := Length(SubStr);
    Len := Length(S) - LenSubStr + 1;
    while I <= Len do
    begin
      if S[I] = SubStr[1] then
      begin
        X := 1;
        while (X < LenSubStr) and (S[I + X] = SubStr[X + 1]) do
          Inc(X);
        if (X = LenSubStr) then
        begin
          Result := I;
          exit;
        end;
      end;
      Inc(I);
    end;
    Result := 0;
  end;
end;

{-----------------------------------------------------------------------------
  Acha a e-nesima "Ocorrencia" de "SubStr" em "S"
 ---------------------------------------------------------------------------- }
function PosAt(const SubStr, S: string; Ocorrencia : Cardinal = 1): Integer;
Var Count : Cardinal ;
begin
  Result := Pos( SubStr, S) ;
  Count  := 1 ;
  while (Count < Ocorrencia) and (Result > 0) do
  begin
     Result := PosEx( SubStr, S, Result+1) ;
     Count  := Count + 1 ;
  end ;
end ;

{-----------------------------------------------------------------------------
  Acha a Ultima "Ocorrencia" de "SubStr" em "S"
 ---------------------------------------------------------------------------- }
function PosLast(const SubStr, S: string ): Integer;
Var P : Integer ;
begin
  Result := 0 ;
  P := Pos( SubStr, S) ;
  while P <> 0 do
  begin
     Result := P ;
     P := PosEx( SubStr, S, P+1) ;
  end ;
end ;

{-----------------------------------------------------------------------------
  Insere ZEROS (0) a esquerda de <Texto> até completar <Tamanho> 
 ---------------------------------------------------------------------------- }
Function Poem_Zeros(Texto : String; Tamanho : Integer) : String;
begin
  Result := PadR(Trim(Texto),Tamanho,'0') ;
end ;

{-----------------------------------------------------------------------------
  Transforma <NumInteiro> em String, preenchendo com Zeros a Esquerda até
  atingiros digitos de <Tamnho>
 ---------------------------------------------------------------------------- }
Function IntToStrZero(NumInteiro, Tamanho : Integer) : String;
begin
  Result := '' ;
  try
     Result := IntToStr( NumInteiro ) ;
     Result := Poem_Zeros( Result, Tamanho) ;
  except
  end ;
end ;

{-----------------------------------------------------------------------------
  Converte uma <NumString> para Double, semelhante ao StrToFloatDef, mas
  verifica se a virgula é '.' ou ',' efetuando a conversão se necessário
  Se não for possivel converter, retorna <DefaultValue>
 ---------------------------------------------------------------------------- }
Function StringToFloatDef( NumString : String ; DefaultValue : Double ) : Double ;
begin
  try
     Result := StringToFloat( NumString ) ;
  except
     Result := DefaultValue ;
  end ;
end ;

{-----------------------------------------------------------------------------
  Converte uma <NumString> para Double, semelhante ao StrToFloat, mas
  verifica se a virgula é '.' ou ',' efetuando a conversão se necessário
  Se não for possivel converter, retorna <DefaultValue>
 ---------------------------------------------------------------------------- }
Function StringToFloat( NumString : String ) : Double ;
begin
  if DecimalSeparator <> '.' then
     NumString := StringReplace(NumString,'.',DecimalSeparator,[rfReplaceAll]) ;

  if DecimalSeparator <> ',' then
     NumString := StringReplace(NumString,',',DecimalSeparator,[rfReplaceAll]) ;

  Result := StrToFloat(NumString)
end ;

{-----------------------------------------------------------------------------
  Converte uma <DateTimeString> para TDateTime, semelhante ao StrToDateTimeDef,
  mas verifica se o seprador da Data é compativo com o S.O., efetuando a
  conversão se necessário. Se não for possivel converter, retorna <DefaultValue>
 ---------------------------------------------------------------------------- }
Function StringToDateTimeDef( DateTimeString : String ;
   DefaultValue : TDateTime ) : TDateTime ;
begin
  try
     Result := StringToDateTime( DateTimeString ) ;
  except
     Result := DefaultValue ;
  end ;
end ;

{-----------------------------------------------------------------------------
  Converte uma <DateTimeString> para TDateTime, semelhante ao StrToDateTimeDef,
  mas verifica se o seprador da Data é compativo com o S.O., efetuando a
  conversão se necessário. Se não for possivel converter, retorna <DefaultValue>
 ---------------------------------------------------------------------------- }
Function StringToDateTime( DateTimeString : String ) : TDateTime ;
begin
   Result := StrToDateTime(
                StringReplace(DateTimeString,'/',DateSeparator, [rfReplaceAll]) )
end ;

{-----------------------------------------------------------------------------
 *** Extraido de JclStrings.pas  - Project JEDI Code Library (JCL) ***
  Retorna <True> se <S> contem apenas caracteres Alpha maiusculo/minuscula
 ---------------------------------------------------------------------------- }
function StrIsAlpha(const S: String): Boolean;
Var A : Integer ;
begin
  Result := true ;
  A      := 1 ;
  while Result and ( A <= Length( S ) )  do
  begin
     Result := CharIsAlpha( S[A] ) ;
     Inc(A) ;
  end;
end ;

{-----------------------------------------------------------------------------
 *** Extraido de JclStrings.pas  - Project JEDI Code Library (JCL) ***
  Retorna <True> se <S> contem apenas caracteres Numericos
 ---------------------------------------------------------------------------- }
function StrIsNumber(const S: String): Boolean;
Var A : Integer ;
begin
  Result := true ;
  A      := 1 ;
  while Result and ( A <= Length( S ) )  do
  begin
     Result := CharIsNum( S[A] ) ;
     Inc(A) ;
  end;
end ;

{-----------------------------------------------------------------------------
 *** Extraido de JclStrings.pas  - Project JEDI Code Library (JCL) ***
  Retorna <True> se <S> contem apenas caracteres Alpha maiusculo/minuscula
  ou Numericos
 ---------------------------------------------------------------------------- }
function StrIsAlphaNum(const S: String): Boolean;
Var A : Integer ;
begin
  Result := true ;
  A      := 1 ;
  while Result and ( A <= Length( S ) )  do
  begin
     Result := CharIsAlphaNum( S[A] ) ;
     Inc(A) ;
  end;
end ;

{-----------------------------------------------------------------------------
 *** Extraido de JclStrings.pas  - Project JEDI Code Library (JCL) ***
  Retorna <True> se <C> é Alpha maiusculo/minusculo 
 ---------------------------------------------------------------------------- }
function CharIsAlpha(const C: Char): Boolean;
begin
  Result := ( C in ['A'..'Z','a'..'z'] ) ;
end ;

{-----------------------------------------------------------------------------
 *** Extraido de JclStrings.pas  - Project JEDI Code Library (JCL) ***
  Retorna <True> se <C> é Númerico 
 ---------------------------------------------------------------------------- }
function CharIsNum(const C: Char): Boolean;
begin
  Result := ( C in ['0'..'9'] ) ;
end ;

{-----------------------------------------------------------------------------
 *** Extraido de JclStrings.pas  - Project JEDI Code Library (JCL) ***
  Retorna <True> se <C> é Alpha maiusculo/minusculo ou Numerico
 ---------------------------------------------------------------------------- }
function CharIsAlphaNum(const C: Char): Boolean;
begin
  Result := ( CharIsAlpha( C ) or CharIsNum( C ) );
end ;

{-----------------------------------------------------------------------------
  Retorna uma String apenas com os char Numericos contidos em <Value>
 ---------------------------------------------------------------------------- }
function OnlyNumber(const Value: string): String;
Var I : Integer ;
begin
  Result := '' ;
  For I := 1 to Length( Value ) do
  begin
     if CharIsNum( Value[I] ) then
        Result := Result + Value[I] ;
  end;
end ;

{-----------------------------------------------------------------------------
  Retorna uma String apenas com os char Alpha contidos em <Value>
 ---------------------------------------------------------------------------- }
function OnlyAlpha(const Value: string): String;
Var I : Integer ;
begin
  Result := '' ;
  For I := 1 to Length( Value ) do
  begin
     if CharIsAlpha( Value[I] ) then
        Result := Result + Value[I] ;
  end;
end ;
{-----------------------------------------------------------------------------
  Retorna uma String apenas com os char Alpha-Numericos contidos em <Value>
 ---------------------------------------------------------------------------- }
function OnlyAlphaNum(const Value: string): String;
Var I : Integer ;
begin
  Result := '' ;
  For I := 1 to Length( Value ) do
  begin
     if CharIsAlphaNum( Value[I] ) then
        Result := Result + Value[I] ;
  end;
end ;

{-----------------------------------------------------------------------------
 ** Baseada em "IsIp" de synautil.pas - Synapse http://www.ararat.cz/synapse/ **
  Retorna <True> se <Value> é um IP Valido
 ---------------------------------------------------------------------------- }
function StrIsIP(const Value: string): Boolean;
var
  TempIP : string;
  function ByteIsOk(const Value: string): Boolean;
  var
    x: integer;
  begin
    x := StrToIntDef(Value, -1);
    Result := (x >= 0) and (x < 256);
    // X may be in correct range, but value still may not be correct value!
    // i.e. "$80"
    if Result then
       Result := StrIsNumber( Value ) ;
  end;

  function Fetch(var Value: string; const Delimiter: string): string;
  var
    p : Integer ;
  begin
    p := pos(Delimiter,Value) ;
    Result := copy(Value, 1, p-1);
    Value  := copy(Value, p+1, Length(Value)); 
  end;
begin
  TempIP := Value;
  Result := False;
  if not ByteIsOk(Fetch(TempIP, '.')) then
    Exit;
  if not ByteIsOk(Fetch(TempIP, '.')) then
    Exit;
  if not ByteIsOk(Fetch(TempIP, '.')) then
    Exit;
  if ByteIsOk(TempIP) then
    Result := True;
end;

{-----------------------------------------------------------------------------
  Substitui todos os caracteres acentuados por compativeis.  
 ---------------------------------------------------------------------------- }
function TiraAcentos( AString : String ) : String ;
Var A : Integer ;
    Letra : Char ;
begin
  Result := '' ;
  For A := 1 to Length( AString ) do
  begin
     Letra := TiraAcento( AString[A] ) ;
     if not (Letra in [#32..#126,#13,#10]) then    {Letras / numeros / pontos / sinais}
        Letra := ' ' ;
     Result := Result + Letra ;
  end
end ;

{-----------------------------------------------------------------------------
  Substitui caracter acentuado por compativel
 ---------------------------------------------------------------------------- }
function TiraAcento( AChar : Char ) : Char ;
begin
  case AChar of
    'à','á','ã','ä','â' : Result := 'a' ;
    'À','Á','Ã','Ä','Â' : Result := 'A' ;
    'è','é',    'ë','ê' : Result := 'e' ;
    'È','É',    'Ë','Ê' : Result := 'E' ;
    'ì','í',    'ï','î' : Result := 'i' ;
    'Ì','Í',    'Ï','Î' : Result := 'I' ;
    'ò','ó','õ','ö','ô' : Result := 'o' ;
    'Ò','Ó','Õ','Ö','Ô' : Result := 'O' ;
    'ù','ú',    'ü','û' : Result := 'u' ;
    'Ù','Ú',    'Ü','Û' : Result := 'U' ;
    'ç'                 : Result := 'c' ;
    'Ç'                 : Result := 'C' ;
    'ñ'                 : Result := 'n' ;
    'Ñ'                 : Result := 'N' ;
  else
    Result := AChar ;
  end;
end ;

{-----------------------------------------------------------------------------
  Traduz Strings do Tipo '#13,v,#10', substituindo #nn por chr(nn). Ignora todo
   texto apos a String ' | '
 ---------------------------------------------------------------------------- }
function TraduzComando( AString : String ) : String ;
Var A : Integer ;
begin
  A := pos(' | ',AString) ;
  if A > 0 then
     AString := copy(AString,1,A-1) ;   { removendo texto apos ' | ' }

  Result := AscToString( AString ) ;
end ;

{-----------------------------------------------------------------------------
  Traduz Strings do Tipo chr(13)+chr(10) para uma representação que possa ser
   lida por AscToString Ex: '#13,#10'
 ---------------------------------------------------------------------------- }
function StringToAsc(AString: String): String;
Var A : Integer ;
begin
  Result := '' ;
  For A := 1 to Length( AString ) do
     Result := Result + '#'+IntToStr( Ord( AString[A] ) )+',' ;

  Result := copy(Result,1, Length( Result )-1 ) ;
end;

{-----------------------------------------------------------------------------
  Traduz Strings do Tipo '#13,v,#10', substituindo #nn por chr(nn).
  Usar , para separar um campo do outro... No exemplo acima o resultado seria
  chr(13)+'v'+chr(10) 
 ---------------------------------------------------------------------------- }
function AscToString(AString: String): String;
Var A : Integer ;
    Token : String ;
    C : Char ;
begin
  AString := Trim( AString ) ;
  Result  := '' ;
  A       := 1  ;
  Token   := '' ;

  while A <= length( AString ) + 1 do
  begin
     if A > length( AString ) then
        C := ','
     else
        C := AString[A] ;

     if (C = ',') and (Length( Token ) >= 1) then
      begin
        if Token[1] = '#' then
        try
           Token := chr( StrToInt( copy(Token,2,length(Token)) ) ) ;
        except
        end ;

        Result := Result + Token ;
        Token := '' ;
      end
     else
        Token := Token + C ;

     A := A + 1 ;
  end ;
end;

{-----------------------------------------------------------------------------
 Retorna a String <AString> encriptada por <StrChave>.
 Use a mesma chave para Encriptar e Desencriptar
 ---------------------------------------------------------------------------- }
function StrCrypt(AString, StrChave: string): string;
var
  i, TamanhoString, pos, PosLetra, TamanhoChave: Integer;
begin
  Result        := AString;
  TamanhoString := Length(AString);
  TamanhoChave  := Length(StrChave);

  for i := 1 to TamanhoString do
  begin
     pos := (i mod TamanhoChave);
     if pos = 0 then
        pos := TamanhoChave;

     posLetra := ord(Result[i]) xor ord(StrChave[pos]);
     if posLetra = 0 then
        posLetra := ord(Result[i]);

     Result[i] := chr(posLetra);
  end;
end ;

{-----------------------------------------------------------------------------
 Retorna a soma dos Valores ASCII de todos os char de <AString>
 -----------------------------------------------------------------------------}
function SomaAscII(AString : string): Integer;
Var A , TamanhoString : Integer ;
begin
  Result        := 0 ;
  TamanhoString := Length(AString);
  
  For A := 1 to TamanhoString do
     Result := Result + ord( AString[A] ) ;
end ;

{-----------------------------------------------------------------------------
 Lê 1 byte de uma porta de Hardware
 Nota: - Essa funçao funciona normalmente em Win9x,
        - XP /NT /2000, deve-se usar um device driver que permita acesso direto
          a porta do Hardware a ser acessado (consulte o fabricante do Hardware)
        - Linux: é necessário ser ROOT para acessar /dev/port
          (use: su  ou  chmod u+s SeuPrograma )
 ---------------------------------------------------------------------------- }
{$WARNINGS OFF}
function InPort(PortAddr:word): byte;
{$IFDEF LINUX}
var Buffer : Pointer ;
    FDevice : String ;
    N : Integer ;
    FHandle : Integer ;
{$ENDIF}
begin
{$IFDEF MSWINDOWS}
  if Assigned( xInp32 ) then
     Result := xInp32(PortAddr)
  else
    asm
        mov dx,PortAddr ;
        in al,dx
        mov Result,al
     end;
{$ELSE}
  FDevice := '/dev/port' ;
  Buffer  := @Result ;

  FHandle := FileOpen(FDevice, fmOpenRead);
  if FHandle <= 0 then
     raise Exception.Create('Erro abrindo:  '+FDevice+#10+#10+
                            'Você deve ter direito de Leitura nesse diretório.');
  try
     N := FileSeek( FHandle, PortAddr, 0 )  ;
     if N <= 0 then
        raise Exception.Create('Erro ao acessar a porta: '+IntToStr(PortAddr));


     N := FileRead(FHandle, Buffer^, 1) ;
     if N <= 0 then
        raise Exception.Create('Erro ao ler a porta: '+IntToStr(PortAddr));
  finally
     FileClose( FHandle );
  end ;
  sleep(5) ;
{$ENDIF}
end ;
{$WARNINGS ON}

{-----------------------------------------------------------------------------
 Envia 1 byte para uma porta de Hardware 
 Nota: - Essa funçao funciona normalmente em Win9x,
        - XP /NT /2000, deve-se usar um device driver que permita acesso direto
          a porta do Hardware a ser acessado (consulte o fabricante do Hardware)
        - Linux: é necessário ser ROOT para acessar /dev/port
          (use: su  ou  chmod u+s SeuPrograma ) 
 ---------------------------------------------------------------------------- }
procedure OutPort(PortAddr: word; Databyte: byte);
{$IFDEF LINUX}
var Buffer : Pointer ;
    FDevice : String ;
    N : Integer ;
    FHandle : Integer ;
{$ENDIF}
begin
{$IFDEF MSWINDOWS}
  if Assigned( xOut32 ) then
     xOut32(PortAddr, Databyte)
  else
     asm
        mov al, Databyte
        mov dx,PortAddr
        out dx,al
     end;
{$ELSE}
  Buffer := @Databyte ;
  FDevice := '/dev/port' ;

  FHandle := FileOpen(FDevice, fmOpenWrite);
  if FHandle <= 0 then
     raise Exception.Create('Erro abrindo:  '+FDevice+#10+#10+
                            'Você deve ter direito de Escrita nesse diretório.');
  try
     N := FileSeek( FHandle, PortAddr, 0 )  ;
     if N <= 0 then
        raise Exception.Create('Erro ao acessar a porta: '+IntToStr(PortAddr));

     N := FileWrite(Fhandle, Buffer^, 1) ;
     if N <= 0 then
        raise Exception.Create('Erro ao escrever na porta: '+IntToStr(PortAddr));
  finally
     FileClose( FHandle );
  end ;
  sleep(5) ;
{$ENDIF}
end ;

{-----------------------------------------------------------------------------
  Semelhante a FileExists, mas permite uso de mascaras Ex:(*.BAK, TEST*.PX, etc)
 ---------------------------------------------------------------------------- }
Function FilesExists(FileMask: string) : Boolean ;
var SearchRec : TSearchRec ;
    RetFind   : Integer ;
    LastFile  : string ;
begin
  LastFile := '' ;
  Result   := false ;
  RetFind  := SysUtils.FindFirst(FileMask, faAnyFile, SearchRec) ;
  try
     while (not Result) and (RetFind = 0) and (LastFile <> SearchRec.Name) do
     begin
        LastFile := SearchRec.Name ;
        Result   := (pos(LastFile, '..') = 0) ;   { ignora . e .. }
        SysUtils.FindNext(SearchRec) ;
     end ;
  finally
     SysUtils.FindClose(SearchRec) ;
  end ;
end ;

{-----------------------------------------------------------------------------
  Semelhante a DeleteFile, mas permite uso de mascaras Ex:(*.BAK, TEST*.PX, etc)
  Gera Exceção se não conseguir apagar algum dos arquivos.
 ---------------------------------------------------------------------------- }
Procedure DeleteFiles(FileMask: string)  ;
var SearchRec : TSearchRec ;
    RetFind   : Integer ;
    LastFile  : string ;
    Path      : String ;
begin
  LastFile := '' ;
  Path     := ExtractFilePath(FileMask) ;
  RetFind  := SysUtils.FindFirst(FileMask, faAnyFile, SearchRec);
  try
     while (RetFind = 0) and (LastFile <> SearchRec.Name) do
     begin
        LastFile := SearchRec.Name ;

        if pos(LastFile, '..') = 0 then    { ignora . e .. }
        begin
           if not SysUtils.DeleteFile(Path + LastFile) then
             raise Exception.Create('Erro ao apagar: ' + Path + LastFile);
        end ;

        SysUtils.FindNext(SearchRec) ;
     end ;
  finally
     SysUtils.FindClose(SearchRec) ;
  end ;
end ;

{-----------------------------------------------------------------------------
 *** CopyFileTo Extraida de idGlobals.pas - INDY ***
 Copia arquivo "AFromFilename" para "AToFilename".  Retorna true se OK
 Nao copia, e retorna false se o destino "AToFilename" já existir e
   "AFailIfExists"  for true
 ---------------------------------------------------------------------------- }
function CopyFileTo(AFromFileName, AToFileName : String;
   const AFailIfExists : Boolean) : Boolean;
{$IFNDEF MSWINDOWS}
var LStream : TStream;
{$ENDIF}
begin
  {$IFDEF MSWINDOWS}
    Result := CopyFile(PChar(AFromFileName), PChar(AToFileName), AFailIfExists);
  {$ELSE}
    if FileExists(AToFileName) and AFailIfExists then
       Result := False
    else
     begin
       LStream := TFileStream.Create(AFromFileName, fmOpenRead or fmShareDenyWrite);
       try
          with TFileStream.Create(AToFileName, fmCreate) do
             try
                CopyFrom(LStream, 0);
             finally
                Free;
             end;
       finally
          FreeAndNil(LStream);
       end;
       Result := True;
     end;
  {$ENDIF}
end;

{-----------------------------------------------------------------------------
  Copia todos os arquivos especificados na mascara <FileMask> para o diretório
  <ToDirName>   Gera Exceção se não conseguir copiar algum dos arquivos.
 ---------------------------------------------------------------------------- }
Procedure CopyFilesToDir(FileMask: string; ToDirName : String;
   const ForceDirectory : Boolean)  ;
var SearchRec : TSearchRec ;
    RetFind   : Integer ;
    LastFile  : string ;
    Path      : String ;
begin
  ToDirName := Trim(ToDirName) ;
  FileMask  := Trim(FileMask) ;
  
  if ToDirName = '' then
     raise Exception.Create('Diretório destino não especificado') ;

  if RightStr(ToDirName,1) <> PathDelim then   { Tem delimitador no final ? }
     ToDirName := ToDirName + PathDelim ;

  if not DirectoryExists(ToDirName) then
  begin
     if not ForceDirectory then
        raise Exception.Create('Diretório ('+ToDirName+') não existente.')
     else
      begin
        ForceDirectories( ToDirName ) ;  { Tenta criar o diretório }
        if not DirectoryExists( ToDirName ) then
           raise Exception.Create( 'Não foi possivel criar o diretório' + sLineBreak +
                                   ToDirName);
      end ;
  end ;

  LastFile := '' ;
  Path     := ExtractFilePath(FileMask) ;
  RetFind  := SysUtils.FindFirst(FileMask, faAnyFile, SearchRec);
  try
     while (RetFind = 0) and (LastFile <> SearchRec.Name) do
     begin
        LastFile := SearchRec.Name ;

        if pos(LastFile, '..') = 0 then    { ignora . e .. }
        begin
           if not CopyFileTo(Path + LastFile, ToDirName + LastFile) then
             raise Exception.Create('Erro ao Copiar o arquivo ('+
                  Path + LastFile + ') para o diretório ('+ToDirName+')') ;
        end ;

        SysUtils.FindNext(SearchRec) ;
     end ;
  finally
     SysUtils.FindClose(SearchRec) ;
  end ;
end ;

{-----------------------------------------------------------------------------
 - Executa programa Externo descrito em "Command", adcionando os Parametros
   "Params" na linha de comando
 - Se "Wait" for true para a execução da aplicação para esperar a conclusao do
   programa externo executado por "Command"
 - WindowState apenas é utilizado na plataforma Windows
 ---------------------------------------------------------------------------- }
procedure RunCommand(Command: String; Params: String; Wait : Boolean;
   WindowState : Word);
var
  {$ifdef MSWINDOWS}
  SUInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  Executed : Boolean ;
  PCharStr : PChar ;
  {$endif}
  ConnectCommand : PChar;
begin
  {$ifdef LINUX}
     Command := Trim(Command + ' ' + Params) ;
     if not Wait then
        Command := Command + ' &' ;  { & = Rodar em BackGround }
     {$IFNDEF FPC}
       ConnectCommand := PChar(Command);
       Libc.system(ConnectCommand);
     {$ELSE}
       Shell(Command)
     {$ENDIF}
  {$endif}
  {$ifdef MSWINDOWS}
     Command  := Trim(Command) ;
     PCharStr := PChar(Trim(Params)) ;
     if Length(PCharStr) = 0 then
        PCharStr := nil ;

     if not Wait then
        ShellExecute(0,'open',PChar(Command),PCharStr, nil, WindowState )
//        winexec(ConnectCommand, WindowState)
     else
      begin
        ConnectCommand := PChar(Trim(Command + ' ' + Params));
        PCharStr := PChar(ExtractFilePath(Command)) ;
        if Length(PCharStr) = 0 then
           PCharStr := nil ;
        FillChar(SUInfo, SizeOf(SUInfo), #0);
        with SUInfo do
        begin
           cb          := SizeOf(SUInfo);
           dwFlags     := STARTF_USESHOWWINDOW;
           wShowWindow := WindowState;
        end;

        Executed := CreateProcess(nil, ConnectCommand, nil, nil, false,
                    CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
                    PCharStr, SUInfo, ProcInfo);

        try
           { Aguarda até ser finalizado }
           if Executed then
              WaitForSingleObject(ProcInfo.hProcess, INFINITE);
        finally
           { Libera os Handles }
           CloseHandle(ProcInfo.hProcess);
           CloseHandle(ProcInfo.hThread);
        end;
      end;
  {$endif}
end;

procedure OpenURL( URL : String ) ;
{$IFDEF LINUX}
  Var BrowserName : String ;
{$ENDIF}
begin
 {$IFDEF MSWINDOWS}
   RunCommand(URL);
 {$ENDIF}
 {$IFDEF LINUX}
   BrowserName := GetEnvironmentVariable('BROWSER') ;
   if BrowserName = '' then
      BrowserName := 'konqueror' ;

   RunCommand(BrowserName, URL);
 {$ENDIF}
end ;

{$IFDEF INC_FunctionDetect}
{-----------------------------------------------------------------------------
  Tenta carregar a Biblioteca (DLL) <LibName> e veirica se a função <FuncName>
  existe na DLL. Se existir, retorna ponteiro para a DLL em <LibPointer>
  Veja Exempo de uso em InPort e OutPort (logo acima)
  ( Função encontrada na Internet - Autor desconhecido )
 -----------------------------------------------------------------------------}
function FunctionDetect (LibName, FuncName: String; var LibPointer: Pointer): boolean;
var LibHandle: tHandle;
begin
 Result := false;
 LibPointer := NIL;
  if LoadLibrary(PChar(LibName)) = 0 then
     exit;                                 { não consegiu ler a DLL }

  LibHandle := GetModuleHandle(PChar(LibName));  { Pega o handle da DLL }
  if LibHandle <> 0 then                    { Se 0 não pegou o Handle, falhou }
  begin
     LibPointer := GetProcAddress(LibHandle, PChar(FuncName));{Procura a função}
     if LibPointer <> NIL then
        Result := true;
  end;
end;
{$ENDIF}

(*  *** Exemplo de complo bloquear Mouse / Teclado com a FunctionDetect ***

procedure TForm1.Button1Click(Sender: TObject);
var xBlockInput : function (Block: BOOL): BOOL; stdcall;
begin
 if FunctionDetect ('USER32.DLL', 'BlockInput', @xBlockInput) then
 begin
  xBlockInput (True);  // Disable Keyboard & mouse
   Sleep(10000);       // Wait for for 10 Secounds
  xBlockInput (False); // Enable  Keyboard & mouse
 end;
end;
*)

initialization
{$IFDEF MSWINDOWS}
  if not FunctionDetect('inpout32.dll','Inp32',@xInp32) then
     xInp32 := NIL ;

  if not FunctionDetect('inpout32.dll','Out32',@xOut32) then
     xOut32 := NIL ;
{$ENDIF}

end.


