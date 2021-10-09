{******************************************************************************}
{ Projeto: Componente ACBrNFe                                                  }
{  Biblioteca multiplataforma de componentes Delphi para emiss�o de Nota Fiscal}
{ eletr�nica - NFe - http://www.nfe.fazenda.gov.br                          }
{                                                                              }
{ Direitos Autorais Reservados (c) 2008 Wemerson Souto                         }
{                                       Daniel Simoes de Almeida               }
{                                       Andr� Ferreira de Moraes               }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do Projeto ACBr     }
{ Componentes localizado em http://www.sourceforge.net/projects/acbr           }
{                                                                              }
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
|* 16/12/2008: Wemerson Souto
|*  - Doa��o do componente para o Projeto ACBr
|* 10/02/2009: Andr� Ferreira de Moraes
|*  - Adicionado URL de todos os estados
|* 18/02/2009: Andr� Ferreira de Moraes
|*  - Criado Assinatura baseado em c�digo passado por Daniel Sim�es
|*  - Criado Valida��o do XML da NFE baseado em c�digo passado por Daniel Sim�es
******************************************************************************}
unit ACBrNFeUtil;

interface

uses {$IFDEF ACBrNFeCAPICOM}ACBrNFeCAPICOM_TLB, ACBrNFeMSXML2_TLB, {$ENDIF}
  Forms, Classes, StrUtils, ACBrNFeTypes, ACBrNFeConfiguracoes;

{$IFDEF ACBrNFeCAPICOM}
const
  DSIGNS = 'xmlns:ds="http://www.w3.org/2000/09/xmldsig#"';
{$ELSE}
const
 cDTD     = '<!DOCTYPE test [<!ATTLIST infNFe Id ID #IMPLIED>]>' ;
 cDTDCanc = '<!DOCTYPE test [<!ATTLIST infCanc Id ID #IMPLIED>]>' ;
 cDTDInut = '<!DOCTYPE test [<!ATTLIST infInut Id ID #IMPLIED>]>' ;
{$ENDIF}

type
  NotaUtil = class
  private
//(AC,AL,AP,AM,BA,CE,DF,ES,GO,MA,MT,MS,MG,PA,PB,PR,PE,PI,RJ,RN,RS,RO,RR,SC,SP,SE,TO);
//AC,AL,AP,MA,PA,PB,PI,RJ,RN,RR,SC,SE,TO - Estados sem WebServices pr�prios
//Estados Emissores pela Sefaz Virtual RS (Rio Grande do Sul): AC, AL, AM, AP, MS, PB, RJ, RR, SC, SE e TO.
//Estados Emissores pela Sefaz Virtual AN (Ambiente Nacional): CE, ES, MA, PA, PI, PR e RN.
    class function GetURLSVRS(AAmbiente: Integer; ALayOut: TLayOut): WideString;
    class function GetURLSVAN(AAmbiente: Integer; ALayOut: TLayOut): WideString;
    class function GetURLAM(AAmbiente: Integer; ALayOut: TLayOut): WideString;
    class function GetURLBA(AAmbiente: Integer; ALayOut: TLayOut): WideString;
    class function GetURLCE(AAmbiente: Integer; ALayOut: TLayOut): WideString;
    class function GetURLDF(AAmbiente: Integer; ALayOut: TLayOut): WideString;
    class function GetURLES(AAmbiente: Integer; ALayOut: TLayOut): WideString;
    class function GetURLGO(AAmbiente: Integer; ALayOut: TLayOut): WideString;
    class function GetURLMT(AAmbiente: Integer; ALayOut: TLayOut): WideString;
    class function GetURLMS(AAmbiente: Integer; ALayOut: TLayOut): WideString;
    class function GetURLMG(AAmbiente: Integer; ALayOut: TLayOut): WideString;
    class function GetURLPR(AAmbiente: Integer; ALayOut: TLayOut): WideString;
    class function GetURLPE(AAmbiente: Integer; ALayOut: TLayOut): WideString;
    class function GetURLRS(AAmbiente: Integer; ALayOut: TLayOut): WideString;
    class function GetURLRO(AAmbiente: Integer; ALayOut: TLayOut): WideString;
    class function GetURLSP(AAmbiente: Integer; ALayOut: TLayOut): WideString;
  protected

  public
    {$IFNDEF ACBrNFeCAPICOM}
       class Procedure InitXmlSec ;
       class Procedure ShutDownXmlSec ;
    {$ENDIF}   
    class function PosEx(const SubStr, S: AnsiString; Offset: Cardinal = 1): Integer;
    class function PosLast(const SubStr, S: AnsiString ): Integer;
    class function PadE(const AString : string; const nLen : Integer; const Caracter : Char = ' ') : String;
    class function PadD(const AString : string; const nLen : Integer; const Caracter : Char = ' ') : String;
    class function padC(const AString : string; const nLen : Integer; const Caracter : Char = ' ') : String;
    class function SeSenao(ACondicao: Boolean; ATrue, AFalse: Variant) : Variant;
    class function FormatFloat(AValue: Extended; const AFormat: string = '0.00'): String;
    class function Poem_Zeros(const Texto : String; const Tamanho : Integer) : String;overload;
    class function Poem_Zeros(const Valor : Integer; const Tamanho : Integer) : String;overload;
    class function Modulo11(Valor: string): String;
    class function ChaveAcesso(AUF:Integer; ADataEmissao:TDateTime; ACNPJ:String; ASerie:Integer;
                               ANumero,ACodigo: Integer; AModelo:Integer=55): String;
    class function LasString(AString: String): String;
    class function EstaVazio(const AValue: String): Boolean;overload;
    class procedure EstaVazio(const AValue, AMensagem: String);overload;
    class function NaoEstaVazio(AValue: String): Boolean;
    class function EstaZerado(AValue: Double): Boolean;overload;
    class function EstaZerado(AValue: Integer): Boolean;overload;
    class procedure EstaZerado(AValue: Integer; AMensagem: String);overload;
    class function NaoEstaZerado(AValue: Double): Boolean;overload;
    class function NaoEstaZerado(AValue: Integer): Boolean;overload;
    class function LimpaNumero(AValue: String): String;
    class function TrataString(const AValue: String): String;overload;
    class function TrataString(const AValue: String; const ATamanho: Integer): String;overload;
    class function CortaD(const AString: string; const ATamanho: Integer): String;
    class function CortaE(const AString: string; const ATamanho: Integer): String;
    class function FormatDate(const AString: string): String;
    class function TamanhoIgual(const AValue: String; const ATamanho: Integer): Boolean;overload;
    class procedure TamanhoIgual(const AValue: String; const ATamanho: Integer; AMensagem: String);overload;
    class function TamanhoIgual(const AValue: Integer; const ATamanho: Integer): Boolean;overload;
    class procedure TamanhoIgual(const AValue: Integer; const ATamanho: Integer; AMensagem: String);overload;
    class function TamanhoMenor(const AValue: String; const ATamanho: Integer): Boolean;
    class function ValidaUF(const AValue: String): Boolean;overload;
    class procedure ValidaUF(const AValue, AMensagem: String);overload;
    class function ValidaUFCidade(const UF, Cidade: Integer): Boolean;overload;
    class procedure ValidaUFCidade(const UF, Cidade: Integer; Const AMensagem: String);overload;
    class function FormatarCPF(AValue : String ): String;
    class function FormatarCNPJ(AValue : String ): String;
    class function FormatarCEP(AValue : String ): String;
    class function FormatarFone(AValue : String ): String;
    class function FormatarNumeroDocumentoFiscal(AValue : String ): String;
    class function FormatarChaveAcesso(AValue : String ): String;
    class function CodigoToUF(AValue : String): String;
    class function IntToFormaPagamento(AValue : String): String;
    class function IntToFormaEmissao(AValue : String): String;
    class function IntToAmbiente(AValue : String): String;
    class function IntToFinalidadeEmissao(AValue : String): String;
    class function IntToProcessoEmissao(AValue : String): String;
    class function IntToOrigemMercadoria(AValue : String): String;
    class function IntToCSTICMS(AValue : String): String;
    class function IntToModalidadeICMS(AValue : String): String;
    class function IntToModalidadeICMSST(AValue : String): String;
    class function IntToCSTPIS(AValue : String): String;
    class function IntToCSTCOFINS(AValue : String): String;
    class function GetURL(Const AUF, AAmbiente: Integer; ALayOut: TLayOut): WideString;
    class function Valida(Const AXML: AnsiString; var AMsg: WideString): Boolean;
{$IFDEF ACBrNFeCAPICOM}
    class function Assinar(const AXML: AnsiString; Certificado : ICertificate2; out AXMLAssinado, FMensagem: WideString): Boolean;
{$ELSE}
    class function Assinar(const AXML, ArqPFX, PFXSenha: AnsiString; out AXMLAssinado, FMensagem: WideString): Boolean;
{$ENDIF}
    class function StringToFloat(AValue : String ) : Double ;
    class function StringToFloatDef(const AValue: String; const DefaultValue: Double): Double;
    class procedure ConfAmbiente;
    class function PathAplication: String;
    class function ParseText( Texto : AnsiString; Decode : Boolean = True) : AnsiString;
    class function SeparaDados( Texto : AnsiString; Chave : String ) : AnsiString;
  published

  end;

implementation
                                                                 
uses {$IFNDEF ACBrNFeCAPICOM}libxml2, libxmlsec, libxslt, {$ELSE} ComObj, {$ENDIF} Sysutils, ACBrNFeConst;

{ NotaUtil }

{$IFNDEF ACBrNFeCAPICOM}
function sign_file(const Axml: PChar; const key_file: PChar; const senha: PChar): String;
var
  doc: xmlDocPtr;
  node: xmlNodePtr;
  dsigCtx: xmlSecDSigCtxPtr;
  buffer: PChar;
  bufSize: integer;
label done;
begin
    doc := nil;
    node := nil;
    dsigCtx := nil;
    result := '';

    if (Axml = nil) or (key_file = nil) then Exit;

    try
       { load template }
       doc := xmlParseDoc(Axml);
       if ((doc = nil) or (xmlDocGetRootElement(doc) = nil)) then
         raise Exception.Create('Error: unable to parse');

       { find start node }
       node := xmlSecFindNode(xmlDocGetRootElement(doc), PChar(xmlSecNodeSignature), PChar(xmlSecDSigNs));
       if (node = nil) then
         raise Exception.Create('Error: start node not found');

       { create signature context, we don't need keys manager in this example }
       dsigCtx := xmlSecDSigCtxCreate(nil);
       if (dsigCtx = nil) then
         raise Exception.Create('Error :failed to create signature context');

       // { load private key, assuming that there is not password }
       dsigCtx.signKey := xmlSecCryptoAppKeyLoad(key_file, xmlSecKeyDataFormatPkcs12, senha, nil, nil);
       if (dsigCtx.signKey = nil) then
          raise Exception.Create('Error: failed to load private pem key from "' + key_file + '"');

       { set key name to the file name, this is just an example! }
       if (xmlSecKeySetName(dsigCtx.signKey, key_file) < 0) then
         raise Exception.Create('Error: failed to set key name for key from "' + key_file + '"');

       { sign the template }
       if (xmlSecDSigCtxSign(dsigCtx, node) < 0) then
         raise Exception.Create('Error: signature failed');

       { print signed document to stdout }
       // xmlDocDump(stdout, doc);
       // Can't use "stdout" from Delphi, so we'll use xmlDocDumpMemory instead...
       buffer := nil;
       xmlDocDumpMemory(doc, @buffer, @bufSize);
       if (buffer <> nil) then
          { success }
          result := buffer ;
   finally
       { cleanup }
       if (dsigCtx <> nil) then
         xmlSecDSigCtxDestroy(dsigCtx);

       if (doc <> nil) then
         xmlFreeDoc(doc);
   end ;
end;

class Procedure NotaUtil.InitXmlSec ;
begin
    { Init libxml and libxslt libraries }
    xmlInitParser();
    __xmlLoadExtDtdDefaultValue^ := XML_DETECT_IDS or XML_COMPLETE_ATTRS;
    xmlSubstituteEntitiesDefault(1);
    __xmlIndentTreeOutput^ := 1;


    { Init xmlsec library }
    if (xmlSecInit() < 0) then
       raise Exception.Create('Error: xmlsec initialization failed.');

    { Check loaded library version }
    if (xmlSecCheckVersionExt(1, 2, 8, xmlSecCheckVersionABICompatible) <> 1) then
       raise Exception.Create('Error: loaded xmlsec library version is not compatible.');

    (* Load default crypto engine if we are supporting dynamic
     * loading for xmlsec-crypto libraries. Use the crypto library
     * name ("openssl", "nss", etc.) to load corresponding
     * xmlsec-crypto library.
     *)
    if (xmlSecCryptoDLLoadLibrary('openssl') < 0) then
       raise Exception.Create( 'Error: unable to load default xmlsec-crypto library. Make sure'#10 +
                          			'that you have it installed and check shared libraries path'#10 +
                          			'(LD_LIBRARY_PATH) environment variable.');

    { Init crypto library }
    if (xmlSecCryptoAppInit(nil) < 0) then
       raise Exception.Create('Error: crypto initialization failed.');

    { Init xmlsec-crypto library }
    if (xmlSecCryptoInit() < 0) then
       raise Exception.Create('Error: xmlsec-crypto initialization failed.');
end ;

class Procedure NotaUtil.ShutDownXmlSec ;
begin
    { Shutdown xmlsec-crypto library }
    xmlSecCryptoShutdown();

    { Shutdown crypto library }
    xmlSecCryptoAppShutdown();

    { Shutdown xmlsec library }
    xmlSecShutdown();

    { Shutdown libxslt/libxml }
    xsltCleanupGlobals();
    xmlCleanupParser();
end ;
{$ENDIF}

class function NotaUtil.ChaveAcesso(AUF: Integer; ADataEmissao: TDateTime;
  ACNPJ: String; ASerie, ANumero, ACodigo: Integer; AModelo: Integer): String;
var
  vUF, vDataEmissao, vSerie, vNumero,
  vCodigo, vModelo: String;
begin
  vUF          := NotaUtil.Poem_Zeros(AUF, 2);
  vDataEmissao := FormatDateTime('YYMM', ADataEmissao);
  vModelo      := NotaUtil.Poem_Zeros(AModelo, 2);
  vSerie       := NotaUtil.Poem_Zeros(ASerie, 3);
  vNumero      := NotaUtil.Poem_Zeros(ANumero, 9);
  vCodigo      := NotaUtil.Poem_Zeros(ACodigo, 9);

  Result := vUF+vDataEmissao+ACNPJ+vModelo+vSerie+vNumero+vCodigo;
  Result := Result+NotaUtil.Modulo11(Result);
end;

class function NotaUtil.PosEx(const SubStr, S: AnsiString; Offset: Cardinal = 1): Integer;
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

class function NotaUtil.PosLast(const SubStr, S: AnsiString ): Integer;
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


class function NotaUtil.CortaD(const AString: string;
  const ATamanho: Integer): String;
begin
  Result := copy(AString,1,ATamanho);
end;

class function NotaUtil.CortaE(const AString: string;
  const ATamanho: Integer): String;
begin
  Result := AString;
  if Length(AString) > ATamanho then
    Result := copy(AString, Length(AString)-ATamanho+1, length(AString));
end;

class function NotaUtil.EstaVazio(const AValue: String): Boolean;
begin
  Result := (Trim(AValue)='');
end;

class function NotaUtil.EstaZerado(AValue: Double): Boolean;
begin
  Result := (AValue = 0);
end;

class procedure NotaUtil.EstaVazio(const AValue, AMensagem: String);
begin
  if NotaUtil.EstaVazio(AValue) then
    raise Exception.Create(AMensagem);
end;

class function NotaUtil.EstaZerado(AValue: Integer): Boolean;
begin
  Result := (AValue = 0);
end;

class function NotaUtil.FormatDate(const AString: string): String;
var
  vTemp: TDateTime;
  FFormato : TFormatSettings;
begin
  try
    FFormato.DateSeparator   := '-';
    FFormato.ShortDateFormat := 'yyyy-mm-dd';
    vTemp := StrToDate(AString, FFormato);
    Result := DateToStr(vTemp);
  except
    Result := '';
  end;
end;

class function NotaUtil.FormatFloat(AValue: Extended;
  const AFormat: string): string;
var
  vFormato: TFormatSettings;
begin
  vFormato.DecimalSeparator := '.';
  Result := SysUtils.FormatFloat(AFormat, AValue, vFormato);
end;

class function NotaUtil.LasString(AString: String): String;
begin
  Result := Copy(AString, Length(AString), Length(AString));
end;

class function NotaUtil.LimpaNumero(AValue: String): String;
var
  A : Integer ;
begin
  Result := '' ;
  For A := 1 to length(AValue) do
  begin
     if (AValue[A] in ['0'..'9']) then
       Result := Result + AValue[A];
  end ;
end;

class function NotaUtil.Modulo11(Valor: string): string;
var
  Soma: integer;
  Contador, Peso, Digito: integer;
begin
  Soma := 0;
  Peso := 2;
  for Contador := Length(Valor) downto 1 do
  begin
    Soma := Soma + (StrToInt(Valor[Contador]) * Peso);
    if Peso < 9 then
      Peso := Peso + 1
    else
      Peso := 2;
  end;

  Digito := 11 - (Soma mod 11);
  if (Digito > 9) then
    Digito := 0;

  Result := IntToStr(Digito);
end;

class function NotaUtil.NaoEstaVazio(AValue: String): Boolean;
begin
  Result := not(EstaVazio(AValue));
end;

class function NotaUtil.NaoEstaZerado(AValue: Double): Boolean;
begin
  Result := not(EstaZerado(AValue));
end;

class function NotaUtil.NaoEstaZerado(AValue: Integer): Boolean;
begin
  Result := not(EstaZerado(AValue));
end;

class function NotaUtil.padC(const AString: string; const nLen: Integer;
  const Caracter: Char): String;
Var nCharLeft : Integer ;
    D : Double ;
begin
  Result    := copy(AString,1,nLen) ;
  D         := (nLen - Length( Result )) / 2 ;
  nCharLeft := Trunc( D ) ;
  Result    := PadE( StringOfChar(Caracter, nCharLeft)+Result, nLen, Caracter) ;
end ;

class function NotaUtil.PadD(const AString: string; const nLen: Integer;
  const Caracter: Char): String;
begin
  Result := copy(AString,1,nLen) ;
  Result := StringOfChar(Caracter, (nLen - Length(Result))) + Result ;
end;

class function NotaUtil.PadE(const AString: string; const nLen: Integer;
  const Caracter: Char): String;
begin
  Result := copy(AString,1,nLen) ;
  Result := Result + StringOfChar(Caracter, (nLen - Length(Result))) ;
end;

class function NotaUtil.Poem_Zeros(const Texto: String;
  const Tamanho: Integer): String;
begin
  Result := PadD(Trim(Texto),Tamanho,'0') ;
end;

class function NotaUtil.Poem_Zeros(const Valor, Tamanho: Integer): String;
begin
  Result := PadD(IntToStr(Valor), Tamanho, '0') ;
end;

class function NotaUtil.SeSenao(ACondicao: Boolean; ATrue,
  AFalse: Variant): Variant;
begin
  Result := AFalse;
  if ACondicao then
    Result := ATrue;
end;

class function NotaUtil.TrataString(const AValue: String): String;
var
  A : Integer ;
begin
  Result := '' ;
  For A := 1 to length(AValue) do
  begin
    case Ord(AValue[A]) of
      60  : Result := Result + '&lt;';  //<
      62  : Result := Result + '&gt;';  //>
      38  : Result := Result + '&amp;'; //&
      34  : Result := Result + '&quot;';//"
      39  : Result := Result + '&#39;'; //'
      32  : begin          // Retira espa�os duplos
              if ( Ord(AValue[Pred(A)]) <> 32 ) then
                 Result := Result + ' ';
            end;
      193 : Result := Result + 'A';//�
      224 : Result := Result + 'a';//�
      226 : Result := Result + 'a';//�
      234 : Result := Result + 'e';//�
      244 : Result := Result + 'o';//�
      251 : Result := Result + 'u';//�
      227 : Result := Result + 'a';//�
      245 : Result := Result + 'o';//�
      225 : Result := Result + 'a';//�
      233 : Result := Result + 'e';//�
      237 : Result := Result + 'i';//�
      243 : Result := Result + 'o';//�
      250 : Result := Result + 'u';//�
      231 : Result := Result + 'c';//�
      252 : Result := Result + 'u';//�
      192 : Result := Result + 'A';//�
      194 : Result := Result + 'A';//�
      202 : Result := Result + 'E';//�
      212 : Result := Result + 'O';//�
      219 : Result := Result + 'U';//�
      195 : Result := Result + 'A';//�
      213 : Result := Result + 'O';//�
      201 : Result := Result + 'E';//�
      205 : Result := Result + 'I';//�
      211 : Result := Result + 'O';//�
      218 : Result := Result + 'U';//�
      199 : Result := Result + 'C';//�
      220 : Result := Result + 'U';//�
    else
      Result := Result + AValue[A];
    end;
  end;
  Result := Trim(Result);
end;

class function NotaUtil.TrataString(const AValue: String;
  const ATamanho: Integer): String;
begin
  Result := NotaUtil.TrataString(NotaUtil.CortaD(AValue, ATamanho));
end;

class function NotaUtil.TamanhoIgual(const AValue: String;
  const ATamanho: Integer): Boolean;
begin
  Result := (Length(AValue)= ATamanho);
end;

class procedure NotaUtil.TamanhoIgual(const AValue: String;
  const ATamanho: Integer; AMensagem: String);
begin
  if not(NotaUtil.TamanhoIgual(AValue, ATamanho)) then
    raise Exception.Create(AMensagem);
end;

class function NotaUtil.TamanhoIgual(const AValue,
  ATamanho: Integer): Boolean;
begin
  Result := (Length(IntToStr(AValue))= ATamanho);
end;

class procedure NotaUtil.TamanhoIgual(const AValue,
  ATamanho: Integer; AMensagem: String);
begin
  if not(NotaUtil.TamanhoIgual(AValue, ATamanho)) then
    raise Exception.Create(AMensagem);
end;

class function NotaUtil.ValidaUF(const AValue: String): Boolean;
var
 i : integer;
begin
  Result := False;
  for i:= 0 to High(NFeUF) do
  begin
    if NFeUF[i]= UpperCase(AValue) then
    begin
      Result := True;
      break;
    end;
  end;
end;

class procedure NotaUtil.ValidaUF(const AValue, AMensagem: String);
begin
  if not(ValidaUF(AValue)) then
    raise Exception.Create(AMensagem);
end;

class procedure NotaUtil.EstaZerado(AValue: Integer;
  AMensagem: String);
begin
  if NotaUtil.EstaZerado(AValue) then
    raise Exception.Create(AMensagem);
end;

class function NotaUtil.FormatarCPF(AValue: String): String;
begin
  if Length(AValue) = 0 then
     Result := AValue
  else
     Result := copy(AValue,1,3) + '.' + copy(AValue,4 ,3) + '.' +
               copy(AValue,7,3) + '-' + copy(AValue,10,2) ;
end;

class function NotaUtil.FormatarCNPJ(AValue: String): String;
begin
  if Length(AValue) = 0 then
     Result := AValue
  else
     Result := copy(AValue,1,2) + '.' + copy(AValue,3,3) + '.' +
               copy(AValue,6,3) + '/' + copy(AValue,9,4) + '-' + copy(AValue,13,2) ;
end;

class function NotaUtil.FormatarCEP(AValue: String): String;
begin
  Result := copy(AValue,1,5) + '-' + copy(AValue,6,3);
end;

class function NotaUtil.TamanhoMenor(const AValue: String;
  const ATamanho: Integer): Boolean;
begin
  Result := (Length(AValue) < ATamanho);
end;

class function NotaUtil.FormatarFone(AValue: String): String;
begin
  Result := AValue;
  if NotaUtil.NaoEstaVazio(AValue) then
  begin
    AValue := NotaUtil.Poem_Zeros(AValue, 10);
    Result := '('+copy(AValue,1,2) + ')' + copy(AValue,3,8);
  end;
end;

class function NotaUtil.CodigoToUF(AValue: String): String;
var
  i: Integer;
begin
  Result := '';
  for i:= 0 to High(NFeUFCodigo) do
  begin
    if IntToStr(NFeUFCodigo[I]) = AValue then
      Result := NFeUF[I];
  end;
end;

class function NotaUtil.IntToFormaPagamento(AValue: String): String;
begin
  Result := '';
  case StrToInt(AValue) of
   0: Result := 'Pagamento � vista';
   1: Result := 'Pagamento � prazo';
   2: Result := 'outros';
  end;
end;

class function NotaUtil.IntToFormaEmissao(AValue: String): String;
var
  i: Integer;
begin
  Result := '';
  for i:= 0 to High(NFeFormaEmissaoCodigo) do
  begin
    if IntToStr(NFeFormaEmissaoCodigo[I]) = AValue then
      Result := NFeFormaEmissao[I];
  end;
end;


class function NotaUtil.IntToAmbiente(AValue: String): String;
var
  i: Integer;
begin
  Result := '';
  for i:= 0 to High(NFeAmbienteCodigo) do
  begin
    if IntToStr(NFeAmbienteCodigo[I]) = AValue then
      Result := NFeAmbiente[I];
  end;
end;


class function NotaUtil.IntToFinalidadeEmissao(AValue: String): String;
begin
  Result := '';
  case StrToInt(AValue) of
   1: Result := 'Normal';
   2: Result := 'Complementar';
   3: Result := 'Ajuste';
  end;
end;

class function NotaUtil.IntToProcessoEmissao(AValue: String): String;
begin
  Result := '';
  case StrToInt(AValue) of
   0: Result := 'emiss�o de NF-e com aplicativo do contribuinte';
   1: Result := 'emiss�o de NF-e avulsa pelo Fisco';
   2: Result := 'emiss�o de NF-e avulsa, pelo contribuinte com seu certificado digital, atrav�s do site do Fisco';
   3: Result := 'emiss�o de NF-e avulsa pelo contribuinte com aplicativo fornecido pelo Fisco';
  end;
end;

class function NotaUtil.IntToOrigemMercadoria(AValue: String): String;
var
  i: Integer;
begin
  Result := '';
  for i:= 0 to High(NFeOrigemMercadoriaCodigo) do
  begin
    if IntToStr(NFeOrigemMercadoriaCodigo[I]) = AValue then
      Result := NFeOrigemMercadoria[I];
  end;
end;

class function NotaUtil.IntToCSTICMS(AValue: String): String;
var
  i: Integer;
begin
  Result := '';
  for i:= 0 to High(NFeCSTICMS) do
  begin
    if NFeCSTICMS[I] = AValue then
      Result := NFeSituacaoTributariaICMS[I];
  end;
end;

class function NotaUtil.IntToModalidadeICMS(AValue: String): String;
var
  i: Integer;
begin
  Result := '';
  for i:= 0 to High(NFeModalidadeICMSCodigo) do
  begin
    if IntToStr(NFeModalidadeICMSCodigo[I]) = AValue then
      Result := NFeModalidadeICMS[I];
  end;
end;

class function NotaUtil.IntToModalidadeICMSST(AValue: String): String;
var
  i: Integer;
begin
  Result := '';
  for i:= 0 to High(NFeModalidadeICMSSTCodigo) do
  begin
    if IntToStr(NFeModalidadeICMSSTCodigo[I]) = AValue then
      Result := NFeModalidadeICMSST[I];
  end;
end;

class function NotaUtil.IntToCSTPIS(AValue: String): String;
var
  i: Integer;
begin
  Result := '';
  for i:= 0 to High(NFeCSTPIS) do
  begin
    if NFeCSTPIS[I] = AValue then
      Result := NFeSituacaoTributariaPIS[I];
  end;
end;

class function NotaUtil.IntToCSTCOFINS(AValue: String): String;
var
  i: Integer;
begin
  Result := '';
  for i:= 0 to High(NFeCSTCOFINS) do
  begin
    if NFeCSTCOFINS[I] = AValue then
      Result := NFeSituacaoTributariaCOFINS[I];
  end;
end;

class function NotaUtil.FormatarNumeroDocumentoFiscal(
  AValue: String): String;
begin
  AValue := NotaUtil.Poem_Zeros(AValue, 9);
  Result := copy(AValue,1,3) + '.' + copy(AValue,4,3)+ '.'+
            copy(AValue,7,3);
end;

class function NotaUtil.FormatarChaveAcesso(AValue: String): String;
begin
  AValue := NotaUtil.LimpaNumero(AValue);
  Result := copy(AValue,1,2)  + '-' + copy(AValue,3,2) + '/' +
            copy(AValue,5,2)  + '-' + copy(AValue,7,2) + '.' +
            copy(AValue,9,3)  + '.' + copy(AValue,12,3)+ '/' +
            copy(AValue,15,4) + '-' + copy(AValue,19,2)+ '-' +
            copy(AValue,21,2) + '-' + copy(AValue,23,3)+ '-' +
            copy(AValue,26,3) + '.' + copy(AValue,29,3)+ '.' +
            copy(AValue,32,3) + '-' + copy(AValue,35,3)+ '.' +
            copy(AValue,38,3) + '.' + copy(AValue,41,3)+ '-' +
            copy(AValue,44,2);
end;

class function NotaUtil.GetURL(const AUF, AAmbiente: Integer;
  ALayOut: TLayOut): WideString;
begin
//  (AC,AL,AP,AM,BA,CE,DF,ES,GO,MA,MT,MS,MG,PA,PB,PR,PE,PI,RJ,RN,RS,RO,RR,SC,SP,SE,TO);
//  (12,27,16,13,29,23,53,32,52,21,51,50,31,15,25,41,26,22,33,24,43,11,14,42,35,28,17);

  case AUF of
    12: Result := NotaUtil.GetURLSVRS(AAmbiente,ALayOut); //AC
    27: Result := NotaUtil.GetURLSVRS(AAmbiente,ALayOut); //AL
    16: Result := NotaUtil.GetURLSVRS(AAmbiente,ALayOut); //AP
    13: Result := NotaUtil.GetURLAM(AAmbiente,ALayOut); //AM
    29: Result := NotaUtil.GetURLBA(AAmbiente,ALayOut); //BA
    23: Result := NotaUtil.GetURLCE(AAmbiente,ALayOut); //CE
    53: Result := NotaUtil.GetURLDF(AAmbiente,ALayOut); //DF
    32: Result := NotaUtil.GetURLES(AAmbiente,ALayOut); //ES
    52: Result := NotaUtil.GetURLGO(AAmbiente,ALayOut); //GO
    21: Result := NotaUtil.GetURLSVAN(AAmbiente,ALayOut); //MA
    51: Result := NotaUtil.GetURLMT(AAmbiente,ALayOut); //MT
    50: Result := NotaUtil.GetURLMS(AAmbiente,ALayOut); //MS
    31: Result := NotaUtil.GetURLMG(AAmbiente,ALayOut); //MG
    15: Result := NotaUtil.GetURLSVAN(AAmbiente,ALayOut); //PA
    25: Result := NotaUtil.GetURLSVRS(AAmbiente,ALayOut); //PB
    41: Result := NotaUtil.GetURLPR(AAmbiente,ALayOut); //PR
    26: Result := NotaUtil.GetURLPE(AAmbiente,ALayOut); //PE
    22: Result := NotaUtil.GetURLSVAN(AAmbiente,ALayOut); //PI
    33: Result := NotaUtil.GetURLSVRS(AAmbiente,ALayOut); //RJ
    24: Result := NotaUtil.GetURLSVAN(AAmbiente,ALayOut); //RN
    43: Result := NotaUtil.GetURLRS(AAmbiente,ALayOut); //RS
    11: Result := NotaUtil.GetURLRO(AAmbiente,ALayOut); //RO
    14: Result := NotaUtil.GetURLSVRS(AAmbiente,ALayOut); //RR
    42: Result := NotaUtil.GetURLSVRS(AAmbiente,ALayOut); //SC
    35: Result := NotaUtil.GetURLSP(AAmbiente,ALayOut); //SP
    28: Result := NotaUtil.GetURLSVRS(AAmbiente,ALayOut); //SE
    17: Result := NotaUtil.GetURLSVRS(AAmbiente,ALayOut); //TO
  end;
end;

//AC,AL,AP,MA,PA,PB,PI,RJ,RN,RR,SC,SE,TO - Estados sem WebServices pr�prios
//Estados Emissores pela Sefaz Virtual RS (Rio Grande do Sul): AC, AL, AM, AP, MS, PB, RJ, RR, SC, SE e TO.
//Estados Emissores pela Sefaz Virtual AN (Ambiente Nacional): CE, ES, MA, PA, PI, PR e RN.

class function NotaUtil.GetURLSVRS(AAmbiente: Integer;
  ALayOut: TLayOut): WideString;
begin
  case ALayOut of
    LayNfeRecepcao      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefazvirtual.rs.gov.br/ws/nferecepcao/NfeRecepcao.asmx', 'https://homologacao.nfe.sefazvirtual.rs.gov.br/ws/nferecepcao/NfeRecepcao.asmx');
    LayNfeRetRecepcao   : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefazvirtual.rs.gov.br/ws/nferetrecepcao/NfeRetRecepcao.asmx', 'https://homologacao.nfe.sefazvirtual.rs.gov.br/ws/nferetrecepcao/NfeRetRecepcao.asmx');
    LayNfeCancelamento  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefazvirtual.rs.gov.br/ws/nfecancelamento/NfeCancelamento.asmx', 'https://homologacao.nfe.sefazvirtual.rs.gov.br/ws/nfecancelamento/NfeCancelamento.asmx');
    LayNfeInutilizacao  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefazvirtual.rs.gov.br/ws/nfeinutilizacao/NfeInutilizacao.asmx', 'https://homologacao.nfe.sefazvirtual.rs.gov.br/ws/nfeinutilizacao/NfeInutilizacao.asmx');
    LayNfeConsulta      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefazvirtual.rs.gov.br/ws/nfeconsulta/NfeConsulta.asmx', 'https://homologacao.nfe.sefazvirtual.rs.gov.br/ws/nfeconsulta/NfeConsulta.asmx');
    LayNfeStatusServico : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefazvirtual.rs.gov.br/ws/nfestatusservico/NfeStatusServico.asmx', 'https://homologacao.nfe.sefazvirtual.rs.gov.br/ws/nfestatusservico/NfeStatusServico.asmx');
//    LayNfeCadastro      : Result := NotaUtil.SeSenao(AAmbiente=1, '', '');
  end;
end;

class function NotaUtil.GetURLSVAN(AAmbiente: Integer;
  ALayOut: TLayOut): WideString;
begin
  case ALayOut of
    LayNfeRecepcao      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://www.sefazvirtual.fazenda.gov.br/NfeRecepcao/NfeRecepcao.asmx', 'https://hom.nfe.fazenda.gov.br/NfeRecepcao/NfeRecepcao.asmx');
    LayNfeRetRecepcao   : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://www.sefazvirtual.fazenda.gov.br/NFeRetRecepcao/NFeRetRecepcao.asmx', 'https://hom.nfe.fazenda.gov.br/NFeRetRecepcao/NFeRetRecepcao.asmx');
    LayNfeCancelamento  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://www.sefazvirtual.fazenda.gov.br/NFeCancelamento/NFeCancelamento.asmx', 'https://hom.nfe.fazenda.gov.br/NFeCancelamento/NFeCancelamento.asmx');
    LayNfeInutilizacao  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://www.sefazvirtual.fazenda.gov.br/NFeInutilizacao/NFeInutilizacao.asmx', 'https://hom.nfe.fazenda.gov.br/NFeInutilizacao/NFeInutilizacao.asmx');
    LayNfeConsulta      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://www.sefazvirtual.fazenda.gov.br/nfeconsulta/nfeconsulta.asmx', 'https://hom.nfe.fazenda.gov.br/nfeconsulta/nfeconsulta.asmx');
    LayNfeStatusServico : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://www.sefazvirtual.fazenda.gov.br/NFeStatusServico/NFeStatusServico.asmx', 'https://hom.nfe.fazenda.gov.br/NFeStatusServico/NFeStatusServico.asmx');
//    LayNfeCadastro      : Result := NotaUtil.SeSenao(AAmbiente=1, '', '');
  end;
end;

class function NotaUtil.GetURLAM(AAmbiente: Integer;
  ALayOut: TLayOut): WideString;
begin
  case ALayOut of
    LayNfeRecepcao      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.am.gov.br/ws/services/NfeRecepcao', 'https://homnfe.sefaz.am.gov.br/ws/services/NfeRecepcao');
    LayNfeRetRecepcao   : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.am.gov.br/ws/services/NfeRetRecepcao', 'https://homnfe.sefaz.am.gov.br/ws/services/NfeRetRecepcao');
    LayNfeCancelamento  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.am.gov.br/ws/services/NfeCancelamento', 'https://homnfe.sefaz.am.gov.br/ws/services/NfeCancelamento');
    LayNfeInutilizacao  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.am.gov.br/ws/services/NfeInutilizacao', 'https://homnfe.sefaz.am.gov.br/ws/services/NfeInutilizacao');
    LayNfeConsulta      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.am.gov.br/ws/services/NfeConsulta', 'https://homnfe.sefaz.am.gov.br/ws/services/NfeConsulta');
    LayNfeStatusServico : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.am.gov.br/ws/services/NfeStatusServico', 'https://homnfe.sefaz.am.gov.br/ws/services/NfeStatusServico');
//    LayNfeCadastro      : Result := NotaUtil.SeSenao(AAmbiente=1, '', '');
  end;
end;

class function NotaUtil.GetURLBA(AAmbiente: Integer;
  ALayOut: TLayOut): WideString;
begin
  case ALayOut of
    LayNfeRecepcao      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.ba.gov.br/webservices/nfe/NfeRecepcao.asmx', 'https://hnfe.sefaz.ba.gov.br/webservices/nfe/NfeRecepcao.asmx');
    LayNfeRetRecepcao   : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.ba.gov.br/webservices/nfe/NfeRetRecepcao.asmx', 'https://hnfe.sefaz.ba.gov.br/webservices/nfe/NfeRetRecepcao.asmx');
    LayNfeCancelamento  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.ba.gov.br/webservices/nfe/NfeCancelamento.asmx', 'https://hnfe.sefaz.ba.gov.br/webservices/nfe/NfeCancelamento.asmx');
    LayNfeInutilizacao  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.ba.gov.br/webservices/nfe/NfeInutilizacao.asmx', 'https://hnfe.sefaz.ba.gov.br/webservices/nfe/NfeInutilizacao.asmx');
    LayNfeConsulta      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.ba.gov.br/webservices/nfe/NfeConsulta.asmx', 'https://hnfe.sefaz.ba.gov.br/webservices/nfe/NfeConsulta.asmx');
    LayNfeStatusServico : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.ba.gov.br/webservices/nfe/NfeStatusServico.asmx', 'https://hnfe.sefaz.ba.gov.br/webservices/nfe/NfeStatusServico.asmx');
//    LayNfeCadastro      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.ba.gov.br/webservices/nfe/NfeConsulta.asmx', '');
  end;
end;

class function NotaUtil.GetURLCE(AAmbiente: Integer;
  ALayOut: TLayOut): WideString;
begin
  case ALayOut of
    LayNfeRecepcao      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.ce.gov.br/nfe/services/NfeRecepcao', 'https://nfeh.sefaz.ce.gov.br/nfe/services/NfeRecepcao ');
    LayNfeRetRecepcao   : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.ce.gov.br/nfe/services/NfeRetRecepcao', 'https://nfeh.sefaz.ce.gov.br/nfe/services/NfeRetRecepcao');
    LayNfeCancelamento  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.ce.gov.br/nfe/services/NfeCancelamento', 'https://nfeh.sefaz.ce.gov.br/nfe/services/NfeCancelamento');
    LayNfeInutilizacao  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.ce.gov.br/nfe/services/NfeInutilizacao', 'https://nfeh.sefaz.ce.gov.br/nfe/services/NfeInutilizacao');
    LayNfeConsulta      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.ce.gov.br/nfe/services/NfeConsulta', 'https://nfeh.sefaz.ce.gov.br/nfe/services/NfeConsulta');
    LayNfeStatusServico : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.ce.gov.br/nfe/services/NfeStatusServico', 'https://nfeh.sefaz.ce.gov.br/nfe/services/NfeStatusServico');
    LayNfeCadastro      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.ce.gov.br/nfe/services/CadConsultaCadastro', 'https://nfeh.sefaz.ce.gov.br/nfe/services/CadConsultaCadastro');
  end;
end;

class function NotaUtil.GetURLDF(AAmbiente: Integer;
  ALayOut: TLayOut): WideString;
begin
  case ALayOut of
    LayNfeRecepcao      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://dec.fazenda.df.gov.br/nfe/ServiceRecepcao.asmx', 'https://homolog.nfe.fazenda.df.gov.br/nfe/ServiceRecepcao.asmx');
    LayNfeRetRecepcao   : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://dec.fazenda.df.gov.br/nfe/ServiceRetRecepcao.asmx', 'https://homolog.nfe.fazenda.df.gov.br/nfe/ServiceRetRecepcao.asmx');
    LayNfeCancelamento  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://dec.fazenda.df.gov.br/nfe/ServiceCancelamento.asmx', 'https://homolog.nfe.fazenda.df.gov.br/nfe/ServiceCancelamento.asmx');
    LayNfeInutilizacao  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://dec.fazenda.df.gov.br/nfe/ServiceInutilizacao.asmx', 'https://homolog.nfe.fazenda.df.gov.br/nfe/ServiceInutilizacao.asmx');
    LayNfeConsulta      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://dec.fazenda.df.gov.br/nfe/ServiceConsulta.asmx', 'https://homolog.nfe.fazenda.df.gov.br/nfe/ServiceConsulta.asmx');
    LayNfeStatusServico : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://dec.fazenda.df.gov.br/nfe/ServiceStatus.asmx', 'https://homolog.nfe.fazenda.df.gov.br/nfe/ServiceStatus.asmx');
    LayNfeCadastro      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://dec.fazenda.df.gov.br/nfe/ServiceConsultaCadastro.asmx', 'https://homolog.nfe.fazenda.df.gov.br/nfe/ServiceConsultaCadastro.asmx');
  end;
end;

class function NotaUtil.GetURLES(AAmbiente: Integer;
  ALayOut: TLayOut): WideString;
begin
  case ALayOut of
    LayNfeRecepcao      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.es.gov.br/Nfe/services/NfeRecepcao', 'https://hnfe.sefaz.es.gov.br/Nfe/services/NfeRecepcao');
    LayNfeRetRecepcao   : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.es.gov.br/Nfe/services/NfeRetRecepcao', 'https://hnfe.sefaz.es.gov.br/Nfe/services/NfeRetRecepcao');
    LayNfeCancelamento  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.es.gov.br/Nfe/services/NfeCancelamento', 'https://hnfe.sefaz.es.gov.br/Nfe/services/NfeCancelamento');
    LayNfeInutilizacao  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.es.gov.br/Nfe/services/NfeInutilizacao', 'https://hnfe.sefaz.es.gov.br/Nfe/services/NfeInutilizacao');
    LayNfeConsulta      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.es.gov.br/Nfe/services/NfeConsulta', 'https://hnfe.sefaz.es.gov.br/Nfe/services/NfeConsulta');
    LayNfeStatusServico : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.es.gov.br/Nfe/services/NfeStatusServico', 'https://hnfe.sefaz.es.gov.br/Nfe/services/NfeStatusServico');
    LayNfeCadastro      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.es.gov.br/Nfe/services/CadConsultaCadastro', '');
  end;
end;

class function NotaUtil.GetURLGO(AAmbiente: Integer;
  ALayOut: TLayOut): WideString;
begin
  case ALayOut of
    LayNfeRecepcao      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.go.gov.br/nfe/services/NfeRecepcao', 'https://homolog.sefaz.go.gov.br/nfe/services/NfeRecepcao');
    LayNfeRetRecepcao   : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.go.gov.br/nfe/services/NfeRetRecepcao', 'https://homolog.sefaz.go.gov.br/nfe/services/NfeRetRecepcao');
    LayNfeCancelamento  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.go.gov.br/nfe/services/NfeCancelamento', 'https://homolog.sefaz.go.gov.br/nfe/services/NfeCancelamento');
    LayNfeInutilizacao  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.go.gov.br/nfe/services/NfeInutilizacao', 'https://homolog.sefaz.go.gov.br/nfe/services/NfeInutilizacao');
    LayNfeConsulta      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.go.gov.br/nfe/services/NfeConsulta', 'https://homolog.sefaz.go.gov.br/nfe/services/NfeConsulta');
    LayNfeStatusServico : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.go.gov.br/nfe/services/NfeStatusServico', 'https://homolog.sefaz.go.gov.br/nfe/services/NfeStatusServico');
    LayNfeCadastro      : Result := NotaUtil.SeSenao(AAmbiente=1, 'http://nfe.sefaz.go.gov.br/nfe/services/CadConsultaCadastro', 'http://homolog.sefaz.go.gov.br/nfe/services/CadConsultaCadastro');
  end;
end;

class function NotaUtil.GetURLMT(AAmbiente: Integer;
  ALayOut: TLayOut): WideString;
begin
  case ALayOut of
    LayNfeRecepcao      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.mt.gov.br/nfews/NfeRecepcao', 'https://homologacao.sefaz.mt.gov.br/nfews/NfeRecepcao');
    LayNfeRetRecepcao   : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.mt.gov.br/nfews/NfeRetRecepcao', 'https://homologacao.sefaz.mt.gov.br/nfews/NfeRetRecepcao');
    LayNfeCancelamento  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.mt.gov.br/nfews/NfeCancelamento', 'https://homologacao.sefaz.mt.gov.br/nfews/NfeCancelamento');
    LayNfeInutilizacao  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.mt.gov.br/nfews/NfeInutilizacao', 'https://homologacao.sefaz.mt.gov.br/nfews/NfeInutilizacao');
    LayNfeConsulta      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.mt.gov.br/nfews/NfeConsulta', 'https://homologacao.sefaz.mt.gov.br/nfews/NfeConsulta');
    LayNfeStatusServico : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.mt.gov.br/nfews/NfeStatusServico', 'https://homologacao.sefaz.mt.gov.br/nfews/NfeStatusServico');
    LayNfeCadastro      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.mt.gov.br/nfews/CadConsultaCadastro', 'https://homologacao.sefaz.mt.gov.br/nfews/CadConsultaCadastro');
  end;
end;

class function NotaUtil.GetURLMS(AAmbiente: Integer;
  ALayOut: TLayOut): WideString;
begin
  case ALayOut of
    LayNfeRecepcao      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://producao.nfe.ms.gov.br/producao/services/NfeRecepcao', 'https://homologacao.nfe.ms.gov.br/homologacao/services/NfeRecepcao');
    LayNfeRetRecepcao   : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://producao.nfe.ms.gov.br/producao/services/NfeRetRecepcao', 'https://homologacao.nfe.ms.gov.br/homologacao/services/NfeRetRecepcao');
    LayNfeCancelamento  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://producao.nfe.ms.gov.br/producao/services/NfeCancelamento', 'https://homologacao.nfe.ms.gov.br/homologacao/services/NfeCancelamento');
    LayNfeInutilizacao  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://producao.nfe.ms.gov.br/producao/services/NfeInutilizacao', 'https://homologacao.nfe.ms.gov.br/homologacao/services/NfeInutilizacao');
    LayNfeConsulta      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://producao.nfe.ms.gov.br/producao/services/NfeConsulta', 'https://homologacao.nfe.ms.gov.br/homologacao/services/NfeConsulta');
    LayNfeStatusServico : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://producao.nfe.ms.gov.br/producao/services/NfeStatusServico', 'https://homologacao.nfe.ms.gov.br/homologacao/services/NfeStatusServico');
//    LayNfeCadastro      : Result := NotaUtil.SeSenao(AAmbiente=1, '', '');
  end;
end;

class function NotaUtil.GetURLMG(AAmbiente: Integer;
  ALayOut: TLayOut): WideString;
begin
  case ALayOut of
    LayNfeRecepcao      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.fazenda.mg.gov.br/nfe/services/NfeRecepcao', 'https://hnfe.fazenda.mg.gov.br/nfe/services/NfeRecepcao');
    LayNfeRetRecepcao   : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.fazenda.mg.gov.br/nfe/services/NfeRetRecepcao', 'https://hnfe.fazenda.mg.gov.br/nfe/services/NfeRetRecepcao');
    LayNfeCancelamento  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.fazenda.mg.gov.br/nfe/services/NfeCancelamento', 'https://hnfe.fazenda.mg.gov.br/nfe/services/NfeCancelamento');
    LayNfeInutilizacao  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.fazenda.mg.gov.br/nfe/services/NfeInutilizacao', 'https://hnfe.fazenda.mg.gov.br/nfe/services/NfeInutilizacao');
    LayNfeConsulta      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.fazenda.mg.gov.br/nfe/services/NfeConsulta', 'https://hnfe.fazenda.mg.gov.br/nfe/services/NfeConsulta');
    LayNfeStatusServico : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.fazenda.mg.gov.br/nfe/services/NfeStatusServico', 'https://hnfe.fazenda.mg.gov.br/nfe/services/NfeStatusServico');
    LayNfeCadastro      : Result := NotaUtil.SeSenao(AAmbiente=1, '', 'https://hnfe.fazenda.mg.gov.br/nfe/services/CadConsultaCadastro');
  end;
end;

class function NotaUtil.GetURLPR(AAmbiente: Integer;
  ALayOut: TLayOut): WideString;
begin
  case ALayOut of
    LayNfeRecepcao      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.fazenda.pr.gov.br/NFENWebServices/services/nfeRecepcao', 'https://homologacao.nfe.fazenda.pr.gov.br/NFENWebServices/services/nfeRecepcao');
    LayNfeRetRecepcao   : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.fazenda.pr.gov.br/NFENWebServices/services/nfeRetRecepcao', 'https://homologacao.nfe.fazenda.pr.gov.br/NFENWebServices/services/nfeRetRecepcao');
    LayNfeCancelamento  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.fazenda.pr.gov.br/NFENWebServices/services/nfeCancelamentoNF', 'https://homologacao.nfe.fazenda.pr.gov.br/NFENWebServices/services/nfeCancelamentoNF');
    LayNfeInutilizacao  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.fazenda.pr.gov.br/NFENWebServices/services/nfeInutilizacaoNF', 'https://homologacao.nfe.fazenda.pr.gov.br/NFENWebServices/services/nfeInutilizacaoNF');
    LayNfeConsulta      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.fazenda.pr.gov.br/NFENWebServices/services/nfeConsultaNF', 'https://homologacao.nfe.fazenda.pr.gov.br/NFENWebServices/services/nfeConsultaNF');
    LayNfeStatusServico : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.fazenda.pr.gov.br/NFENWebServices/services/nfeStatusServicoNF', 'https://homologacao.nfe.fazenda.pr.gov.br/NFENWebServices/services/nfeStatusServicoNF');
//    LayNfeCadastro      : Result := NotaUtil.SeSenao(AAmbiente=1, '', '');
  end;
end;

class function NotaUtil.GetURLPE(AAmbiente: Integer;
  ALayOut: TLayOut): WideString;
begin
  case ALayOut of
    LayNfeRecepcao      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.pe.gov.br/nfe-service/services/NfeRecepcao', 'https://nfehomolog.sefaz.pe.gov.br/nfe-service/services/NfeRecepcao');
    LayNfeRetRecepcao   : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.pe.gov.br/nfe-service/services/NfeRetRecepcao', 'https://nfehomolog.sefaz.pe.gov.br/nfe-service/services/NfeRetRecepcao');
    LayNfeCancelamento  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.pe.gov.br/nfe-service/services/NfeCancelamento', 'https://nfehomolog.sefaz.pe.gov.br/nfe-service/services/NfeCancelamento');
    LayNfeInutilizacao  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.pe.gov.br/nfe-service/services/NfeInutilizacao', 'https://nfehomolog.sefaz.pe.gov.br/nfe-service/services/NfeInutilizacao');
    LayNfeConsulta      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.pe.gov.br/nfe-service/services/NfeConsulta', 'https://nfehomolog.sefaz.pe.gov.br/nfe-service/services/NfeConsulta');
    LayNfeStatusServico : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.pe.gov.br/nfe-service/services/NfeStatusServico', 'https://nfehomolog.sefaz.pe.gov.br/nfe-service/services/NfeStatusServico');
    LayNfeCadastro      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.pe.gov.br/nfe-service/services/CadConsultaCadastro', 'https://nfehomolog.sefaz.pe.gov.br/nfe-service/services/CadConsultaCadastro');
  end;
end;

class function NotaUtil.GetURLRS(AAmbiente: Integer;
  ALayOut: TLayOut): WideString;
begin
  case ALayOut of
    LayNfeRecepcao      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.rs.gov.br/ws/nferecepcao/NfeRecepcao.asmx', 'https://homologacao.nfe.sefaz.rs.gov.br/ws/nferecepcao/NfeRecepcao.asmx');
    LayNfeRetRecepcao   : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.rs.gov.br/ws/nferetrecepcao/NfeRetRecepcao.asmx', 'https://homologacao.nfe.sefaz.rs.gov.br/ws/nferetrecepcao/NfeRetRecepcao.asmx');
    LayNfeCancelamento  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.rs.gov.br/ws/nfecancelamento/NfeCancelamento.asmx', 'https://homologacao.nfe.sefaz.rs.gov.br/ws/nfecancelamento/NfeCancelamento.asmx');
    LayNfeInutilizacao  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.rs.gov.br/ws/nfeinutilizacao/NfeInutilizacao.asmx', 'https://homologacao.nfe.sefaz.rs.gov.br/ws/nfeinutilizacao/NfeInutilizacao.asmx');
    LayNfeConsulta      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.rs.gov.br/ws/nfeconsulta/NfeConsulta.asmx', 'https://homologacao.nfe.sefaz.rs.gov.br/ws/nfeconsulta/NfeConsulta.asmx');
    LayNfeStatusServico : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.sefaz.rs.gov.br/ws/nfestatusservico/NfeStatusServico.asmx', 'https://homologacao.nfe.sefaz.rs.gov.br/ws/nfestatusservico/NfeStatusServico.asmx');
    LayNfeCadastro      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://sef.sefaz.rs.gov.br/ws/CadConsultaCadastro/CadConsultaCadastro.asmx', '');
  end;
end;

class function NotaUtil.GetURLRO(AAmbiente: Integer;
  ALayOut: TLayOut): WideString;
begin
  case ALayOut of
    LayNfeRecepcao      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://ws.nfe.sefin.ro.gov.br/wsprod/NfeRecepcao', 'https://ws.nfe.sefin.ro.gov.br/ws/NfeRecepcao');
    LayNfeRetRecepcao   : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://ws.nfe.sefin.ro.gov.br/wsprod/NfeRetRecepcao', 'https://ws.nfe.sefin.ro.gov.br/ws/NfeRetRecepcao');
    LayNfeCancelamento  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://ws.nfe.sefin.ro.gov.br/wsprod/NfeCancelamento', 'https://ws.nfe.sefin.ro.gov.br/ws/NfeCancelamento');
    LayNfeInutilizacao  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://ws.nfe.sefin.ro.gov.br/wsprod/NfeInutilizacao', 'https://ws.nfe.sefin.ro.gov.br/ws/NfeInutilizacao');
    LayNfeConsulta      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://ws.nfe.sefin.ro.gov.br/wsprod/NfeConsulta', 'https://ws.nfe.sefin.ro.gov.br/ws/NfeConsulta');
    LayNfeStatusServico : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://ws.nfe.sefin.ro.gov.br/wsprod/NfeStatusServico', 'https://ws.nfe.sefin.ro.gov.br/ws/NfeStatusServico');
    LayNfeCadastro      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://ws.nfe.sefin.ro.gov.br/wsprod/CadConsultaCadastro', 'https://ws.nfe.sefin.ro.gov.br/ws/CadConsultaCadastro');
  end;
end;

class function NotaUtil.GetURLSP(AAmbiente: Integer;
  ALayOut: TLayOut): WideString;
begin
  case ALayOut of
    LayNfeRecepcao      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.fazenda.sp.gov.br/nfeweb/services/nferecepcao.asmx', 'https://homologacao.nfe.fazenda.sp.gov.br/nfeweb/services/nferecepcao.asmx');
    LayNfeRetRecepcao   : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.fazenda.sp.gov.br/nfeweb/services/nferetrecepcao.asmx', 'https://homologacao.nfe.fazenda.sp.gov.br/nfeweb/services/nferetrecepcao.asmx');
    LayNfeCancelamento  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.fazenda.sp.gov.br/nfeweb/services/nfecancelamento.asmx', 'https://homologacao.nfe.fazenda.sp.gov.br/nfeweb/services/nfecancelamento.asmx');
    LayNfeInutilizacao  : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.fazenda.sp.gov.br/nfeweb/services/nfeinutilizacao.asmx', 'https://homologacao.nfe.fazenda.sp.gov.br/nfeweb/services/nfeinutilizacao.asmx');
    LayNfeConsulta      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.fazenda.sp.gov.br/nfeweb/services/nfeconsulta.asmx', 'https://homologacao.nfe.fazenda.sp.gov.br/nfeweb/services/nfeconsulta.asmx');
    LayNfeStatusServico : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.fazenda.sp.gov.br/nfeweb/services/nfestatusservico.asmx', 'https://homologacao.nfe.fazenda.sp.gov.br/nfeweb/services/nfestatusservico.asmx');
    LayNfeCadastro      : Result := NotaUtil.SeSenao(AAmbiente=1, 'https://nfe.fazenda.sp.gov.br/nfeweb/services/cadconsultacadastro.asmx', 'https://homologacao.nfe.fazenda.sp.gov.br/nfeWEB/services/cadconsultacadastro.asmx');
  end;
end;

{$IFDEF ACBrNFeCAPICOM}
function ValidaMSXML(XML: WideString; out Msg: WideString): Boolean;
var
  DOMDocument: IXMLDOMDocument2;
  ParseError: IXMLDOMParseError;
  Schema: XMLSchemaCache;
  Tipo, I : Integer;
begin
  I := pos('<infNFe',XML) ;
  Tipo := 1;
  if I = 0  then
   begin
     I := pos('<infCanc',XML) ;
     Tipo := 2;
     if I = 0 then
      begin
       I := pos('<infInut',XML) ;
       Tipo := 3;
      end;
   end;

  DOMDocument := CoDOMDocument50.Create;
  DOMDocument.async := False;
  DOMDocument.resolveExternals := False;
  DOMDocument.validateOnParse := True;
  DOMDocument.loadXML(XML);

  Schema := CoXMLSchemaCache50.Create;
  if Tipo = 1 then
     Schema.add( 'http://www.portalfiscal.inf.br/nfe', ExtractFileDir(application.ExeName)+'\Schemas\nfe_v1.10.xsd')
  else if Tipo = 2 then
     Schema.add( 'http://www.portalfiscal.inf.br/nfe', ExtractFileDir(application.ExeName)+'\Schemas\cancNFe_v1.07.xsd')
  else if Tipo = 3 then
     Schema.add( 'http://www.portalfiscal.inf.br/nfe', ExtractFileDir(application.ExeName)+'\Schemas\inutNFe_v1.07.xsd');
  DOMDocument.schemas := Schema;
  ParseError := DOMDocument.validate;
  Result := (ParseError.errorCode = 0);
  Msg   := ParseError.reason;

  DOMDocument := nil;
  ParseError := nil;
  Schema := nil;
end;
{$ELSE}
function ValidaLibXML(const AXML: AnsiString;
  var AMsg: WideString): Boolean;
var
 doc, schema_doc : xmlDocPtr;
 parser_ctxt : xmlSchemaParserCtxtPtr;
 schema : xmlSchemaPtr;
 valid_ctxt : xmlSchemaValidCtxtPtr;
 schemError : xmlErrorPtr;
 schema_filename : PChar;

 Tipo, I : Integer;
begin
  I := pos('<infNFe',AXML) ;
  Tipo := 1;
  if I = 0  then
   begin
     I := pos('<infCanc',AXML) ;
     Tipo := 2;
     if I = 0 then
      begin
       I := pos('<infInut',AXML) ;
       Tipo := 3;
      end;
   end;

 if Tipo = 1 then
    schema_filename := pchar(ExtractFileDir(application.ExeName)+'\Schemas\nfe_v1.10.xsd')
 else if Tipo = 2 then
    schema_filename := pchar(ExtractFileDir(application.ExeName)+'\Schemas\cancNFe_v1.07.xsd')
 else if Tipo = 3 then
    schema_filename := pchar(ExtractFileDir(application.ExeName)+'\Schemas\inutNFe_v1.07.xsd');

 doc         := nil;
 schema_doc  := nil;
 parser_ctxt := nil;
 schema      := nil;
 valid_ctxt  := nil;

 doc := xmlParseDoc(Pchar(Axml));
 if ((doc = nil) or (xmlDocGetRootElement(doc) = nil)) then
  begin
    raise Exception.Create('Error: unable to parse');
  end;

 schema_doc  := xmlReadFile(schema_filename, nil, XML_DETECT_IDS);
//  the schema cannot be loaded or is not well-formed
 if (schema_doc = nil) then
  begin
    raise Exception.Create('Error: the schema cannot be loaded or is not well-formed');
  end;

  parser_ctxt  := xmlSchemaNewDocParserCtxt(schema_doc);
// unable to create a parser context for the schema */
    if (parser_ctxt = nil) then
     begin
        xmlFreeDoc(schema_doc);
        raise Exception.Create('Error: unable to create a parser context for the schema');
     end;

   schema := xmlSchemaParse(parser_ctxt);
// the schema itself is not valid
    if (schema = nil) then
     begin
        xmlSchemaFreeParserCtxt(parser_ctxt);
        xmlFreeDoc(schema_doc);
        raise Exception.Create('Error: the schema itself is not valid');
     end;

    valid_ctxt := xmlSchemaNewValidCtxt(schema);
//   unable to create a validation context for the schema */
    if (valid_ctxt = nil) then
     begin
        xmlSchemaFree(schema);
        xmlSchemaFreeParserCtxt(parser_ctxt);
        xmlFreeDoc(schema_doc);
        raise Exception.Create('Error: unable to create a validation context for the schema');
     end;

    if (xmlSchemaValidateDoc(valid_ctxt, doc) <> 0) then
     begin
       schemError := xmlGetLastError();
       raise Exception.Create(IntToStr(schemError.code)+' - '+schemError.message);
     end;

    xmlSchemaFreeValidCtxt(valid_ctxt);
    xmlSchemaFree(schema);
    xmlSchemaFreeParserCtxt(parser_ctxt);
    xmlFreeDoc(schema_doc);
    Result := True;
end;
{$ENDIF}

class function NotaUtil.Valida(const AXML: AnsiString;
  var AMsg: WideString): Boolean;
begin
{$IFDEF ACBrNFeCAPICOM}
  Result := ValidaMSXML(AXML,AMsg);
{$ELSE}
  Result := ValidaLibXML(AXML,AMsg);
{$ENDIF}
end;

{$IFDEF ACBrNFeCAPICOM}
function AssinarMSXML(XML : WideString; Certificado : ICertificate2; out XMLAssinado : WideString): Boolean;
var
 CertStore     : IStore3;
 CertStoreMem  : IStore3;
 PrivateKey    : IPrivateKey;
 Certs         : ICertificates2;
 Cert          : ICertificate2;

 I, J, PosIni, PosFim : Integer;
 URI           : String ;
 Tipo : Integer;

 xmldoc  : IXMLDOMDocument3;
 xmldsig : IXMLDigitalSignature;
 dsigKey   : IXMLDSigKey;
 signedKey : IXMLDSigKey;
begin
   if Pos('<Signature',XML) <= 0 then
    begin
      I := pos('<infNFe',XML) ;
      Tipo := 1;

      if I = 0  then
       begin
         I := pos('<infCanc',XML) ;
         Tipo := 2;
         if I = 0 then
          begin
            I := pos('<infInut',XML) ;
            Tipo := 3;
          end;
       end;

      I := 0;
      I := PosEx('Id=',XML,I+6) ;
      if I = 0 then
         raise Exception.Create('N�o encontrei inicio do URI: Id=') ;
      I := PosEx('"',XML,I+2) ;
      if I = 0 then
         raise Exception.Create('N�o encontrei inicio do URI: aspas inicial') ;
      J := PosEx('"',XML,I+1) ;
      if J = 0 then
         raise Exception.Create('N�o encontrei inicio do URI: aspas final') ;

      URI := copy(XML,I+1,J-I-1) ;

      if Tipo = 1 then
         XML := copy(XML,1,pos('</NFe>',XML)-1)
      else if Tipo = 2 then
         XML := copy(XML,1,pos('</cancNFe>',XML)-1)
      else if Tipo = 3 then
         XML := copy(XML,1,pos('</inutNFe>',XML)-1);

      XML := XML + '<Signature xmlns="http://www.w3.org/2000/09/xmldsig#"><SignedInfo><CanonicalizationMethod Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315"/><SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#rsa-sha1" />';
      XML := XML + '<Reference URI="#'+URI+'">';
      XML := XML + '<Transforms><Transform Algorithm="http://www.w3.org/2000/09/xmldsig#enveloped-signature" /><Transform Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315" /></Transforms><DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1" />';
      XML := XML + '<DigestValue></DigestValue></Reference></SignedInfo><SignatureValue></SignatureValue><KeyInfo></KeyInfo></Signature>';

      if Tipo = 1 then
         XML := XML + '</NFe>'
      else if Tipo = 2 then
         XML := XML + '</cancNFe>'
      else if Tipo = 3 then
         XML := XML + '</inutNFe>';
    end;

   xmldoc := CoDOMDocument50.Create;

   xmldoc.async              := False;
   xmldoc.validateOnParse    := False;
   xmldoc.preserveWhiteSpace := True;

   xmldsig := CoMXDigitalSignature50.Create;

   if (not xmldoc.loadXML(XML) ) then
      raise Exception.Create('N�o foi poss�vel carregar o arquivo: '+XML);

   xmldoc.setProperty('SelectionNamespaces', DSIGNS);

   xmldsig.signature := xmldoc.selectSingleNode('.//ds:Signature');

   if (xmldsig.signature = nil) then
      raise Exception.Create('Falha ao setar assinatura.');

   if (xmldsig.signature = nil) then
      raise Exception.Create('� preciso carregar o template antes de assinar.');

   CertStore := CoStore.Create;
   CertStore.Open(CAPICOM_CURRENT_USER_STORE, 'My', CAPICOM_STORE_OPEN_MAXIMUM_ALLOWED);

   CertStoreMem := CoStore.Create;
   CertStoreMem.Open(CAPICOM_MEMORY_STORE, 'Memoria', CAPICOM_STORE_OPEN_MAXIMUM_ALLOWED);

   Certs := CertStore.Certificates as ICertificates2;
   for i:= 1 to Certs.Count do
   begin
     Cert := IInterface(Certs.Item[i]) as ICertificate2;
     if Cert.SerialNumber = Certificado.SerialNumber then
        CertStoreMem.Add(Cert);
   end;

   OleCheck(IDispatch(Certificado.PrivateKey).QueryInterface(IPrivateKey,PrivateKey));
   xmldsig.store := CertStoreMem;

   dsigKey := xmldsig.createKeyFromCSP(PrivateKey.ProviderType, PrivateKey.ProviderName, PrivateKey.ContainerName, 0);
   if (dsigKey = nil) then
      raise Exception.Create('Erro ao criar a chave do CSP.');

   signedKey := xmldsig.sign(dsigKey, $00000002);
   if (signedKey <> nil) then
    begin
      XMLAssinado := xmldoc.xml;
      XMLAssinado := StringReplace( XMLAssinado, #10, '', [rfReplaceAll] ) ;
      XMLAssinado := StringReplace( XMLAssinado, #13, '', [rfReplaceAll] ) ;
      PosIni := Pos('<SignatureValue>',XMLAssinado)+length('<SignatureValue>');
      XMLAssinado := copy(XMLAssinado,1,PosIni-1)+StringReplace( copy(XMLAssinado,PosIni,length(XMLAssinado)), ' ', '', [rfReplaceAll] ) ;
	  PosIni := Pos('<X509Certificate>',XMLAssinado)-1;
	  PosFim := NotaUtil.PosLast('<X509Certificate>',XMLAssinado);

	  XMLAssinado := copy(XMLAssinado,1,PosIni)+copy(XMLAssinado,PosFim,length(XMLAssinado));
    end
   else
      raise Exception.Create('Assinatura Falhou.');

   dsigKey   := nil;
   signedKey := nil;
   xmldoc    := nil;
   xmldsig   := nil;

   Result := True;
end;
{$ELSE}
function AssinarLibXML(const AXML, ArqPFX, PFXSenha : AnsiString;
  out AXMLAssinado, FMensagem: WideString): Boolean;
 Var I, J, PosIni, PosFim : Integer ;
     URI, AStr, XmlAss : AnsiString ;
     Tipo : Integer; // 1 - NFE 2 - Cancelamento 3 - Inutilizacao
begin
  AStr := AXML ;

  //// Encontrando o URI ////
  I := pos('<infNFe',AStr) ;
  Tipo := 1;

  if I = 0  then
   begin
     I := pos('<infCanc',AStr) ;
     Tipo := 2;
     if I = 0 then
      begin
        I := pos('<infInut',AStr) ;
        Tipo := 3;
      end;
   end;

  if I = 0 then
     raise Exception.Create('N�o encontrei inicio do URI: <infNFe') ;
  I := PosEx('Id=',AStr,I+6) ;
  if I = 0 then
     raise Exception.Create('N�o encontrei inicio do URI: Id=') ;
  I := PosEx('"',AStr,I+2) ;
  if I = 0 then
     raise Exception.Create('N�o encontrei inicio do URI: aspas inicial') ;
  J := PosEx('"',AStr,I+1) ;
  if J = 0 then
     raise Exception.Create('N�o encontrei inicio do URI: aspas final') ;

  URI := copy(AStr,I+1,J-I-1) ;

  //// Adicionando Cabe�alho DTD, necess�rio para xmlsec encontrar o ID ////
  I := pos('?>',AStr) ;

  if I = 0 then
   begin
     if Tipo = 1 then
        AStr := cDTD + Copy(AStr,I,Length(AStr))
     else if Tipo = 2 then
        AStr := cDTDCanc + Copy(AStr,I+2,Length(AStr))
     else if Tipo = 3 then
        AStr := cDTDInut + Copy(AStr,I+2,Length(AStr));
   end
  else
   begin
     if Tipo = 1 then
        AStr := copy(AStr,1,I+1) + cDTD     + Copy(AStr,I+2,Length(AStr))
     else if Tipo = 2 then
        AStr := copy(AStr,1,I+1) + cDTDCanc + Copy(AStr,I+2,Length(AStr))
     else if Tipo = 3 then
        AStr := copy(AStr,1,I+1) + cDTDInut + Copy(AStr,I+2,Length(AStr));
   end;

  //// Inserindo Template da Assinatura digital ////
  if Tipo = 1 then
   begin
     I := pos('</NFe>',AStr) ;
     if I = 0 then
        raise Exception.Create('N�o encontrei final do XML: </NFe>') ;
   end
  else if Tipo = 2 then
   begin
     I := pos('</cancNFe>',AStr) ;
     if I = 0 then
        raise Exception.Create('N�o encontrei final do XML: </cancNFe>') ;
   end
  else if Tipo = 3 then
   begin
     I := pos('</inutNFe>',AStr) ;
     if I = 0 then
        raise Exception.Create('N�o encontrei final do XML: </inutNFe>') ;
   end;


  AStr := copy(AStr,1,I-1) +
         '<Signature xmlns="http://www.w3.org/2000/09/xmldsig#">'+
           '<SignedInfo>'+
             '<CanonicalizationMethod Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315"/>'+
             '<SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#rsa-sha1" />'+
             '<Reference URI="#'+URI+'">'+
               '<Transforms>'+
                 '<Transform Algorithm="http://www.w3.org/2000/09/xmldsig#enveloped-signature" />'+
                 '<Transform Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315" />'+
               '</Transforms>'+
               '<DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1" />'+
               '<DigestValue></DigestValue>'+
             '</Reference>'+
           '</SignedInfo>'+
           '<SignatureValue></SignatureValue>'+
           '<KeyInfo>'+
             '<X509Data>'+
               '<X509Certificate></X509Certificate>'+
             '</X509Data>'+
           '</KeyInfo>'+
         '</Signature>';

  if Tipo = 1 then
     AStr := AStr + '</NFe>'
  else if Tipo = 2 then
     AStr := AStr + '</cancNFe>'
  else if Tipo = 3 then
     AStr := AStr + '</inutNFe>';

  XmlAss := sign_file(PChar(AStr), PChar(ArqPFX), PChar(PFXSenha)) ;

  // Removendo quebras de linha //
  XmlAss := StringReplace( XmlAss, #10, '', [rfReplaceAll] ) ;
  XmlAss := StringReplace( XmlAss, #13, '', [rfReplaceAll] ) ;

  // Removendo DTD //
  if Tipo = 1 then
     XmlAss := StringReplace( XmlAss, cDTD, '', [] )
  else if Tipo = 2 then
     XmlAss := StringReplace( XmlAss, cDTDCanc, '', [] )
  else if Tipo = 3 then
     XmlAss := StringReplace( XmlAss, cDTDInut, '', [] );

  PosIni := Pos('<X509Certificate>',XmlAss)-1;
  PosFim := NotaUtil.PosLast('<X509Certificate>',XmlAss);

  XmlAss := copy(XmlAss,1,PosIni)+copy(XmlAss,PosFim,length(XmlAss));

  AXMLAssinado := XmlAss ;

  Result := True;
end;
{$ENDIF}

{$IFDEF ACBrNFeCAPICOM}
class function NotaUtil.Assinar(const AXML: AnsiString; Certificado : ICertificate2; out AXMLAssinado, FMensagem: WideString): Boolean;
{$ELSE}
class function NotaUtil.Assinar(const AXML, ArqPFX, PFXSenha: AnsiString; out AXMLAssinado, FMensagem: WideString): Boolean;
{$ENDIF}
begin
{$IFDEF ACBrNFeCAPICOM}
  Result := AssinarMSXML(AXML,Certificado,AXMLAssinado);
{$ELSE}
  Result := AssinarLibXML(AXML, ArqPFX, PFXSenha, AXMLAssinado, FMensagem);
{$ENDIF}
end;


class function NotaUtil.ValidaUFCidade(const UF, Cidade: Integer): Boolean;
begin
  Result := (Copy(IntToStr(UF), 1, 2) = Copy(IntToStr(Cidade), 1, 2));
end;

class procedure NotaUtil.ValidaUFCidade(const UF, Cidade: Integer;
  const AMensagem: String);
begin
  if not(ValidaUFCidade(UF,Cidade)) then
    raise Exception.Create(AMensagem);
end;

class function NotaUtil.StringToFloat(AValue: String): Double;
begin
  AValue := Trim( AValue ) ;

  if DecimalSeparator <> '.' then
     AValue := StringReplace(AValue,'.',DecimalSeparator,[rfReplaceAll]) ;

  if DecimalSeparator <> ',' then
     AValue := StringReplace(AValue,',',DecimalSeparator,[rfReplaceAll]) ;

  Result := StrToFloat(AValue)
end ;

class function NotaUtil.StringToFloatDef(const AValue: String;
  const DefaultValue: Double): Double;
begin
  try
     Result := StringToFloat( AValue ) ;
  except
     Result := DefaultValue ;
  end ;
end ;

class procedure NotaUtil.ConfAmbiente;
begin
  DecimalSeparator := ',';
end;

class function NotaUtil.PathAplication: String;
begin
  Result := ExtractFilePath(Application.ExeName);
end;

class function NotaUtil.ParseText( Texto : AnsiString; Decode : Boolean = True) : AnsiString;
begin
  if Decode then
   begin
    Texto := StringReplace(Texto, '&amp;', '&', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&lt;', '<', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&gt;', '>', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&quot;', '"', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&#39;', #39, [rfReplaceAll]);
    Texto := StringReplace(Texto, '&aacute;', '�', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&Aacute;', '�', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&acirc;' , '�', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&Acirc;' , '�', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&atilde;', '�', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&Atilde;', '�', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&agrave;', '�', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&Agrave;', '�', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&eacute;', '�', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&Eacute;', '�', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&ecirc;' , '�', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&Ecirc;' , '�', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&iacute;', '�', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&Iacute;', '�', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&oacute;', '�', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&Oacute;', '�', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&otilde;', '�', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&Otilde;', '�', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&ocirc;' , '�', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&Ocirc;' , '�', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&uacute;', '�', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&Uacute;', '�', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&uuml;'  , '�', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&Uuml;'  , '�', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&ccedil;', '�', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&Ccedil;', '�', [rfReplaceAll]);
    Texto := UTF8Decode(Texto);
   end
  else
   begin
    Texto := StringReplace(Texto, '&', '&amp;', [rfReplaceAll]);
    Texto := StringReplace(Texto, '<', '&lt;', [rfReplaceAll]);
    Texto := StringReplace(Texto, '>', '&gt;', [rfReplaceAll]);
    Texto := StringReplace(Texto, '"', '&quot;', [rfReplaceAll]);
    Texto := StringReplace(Texto, #39, '&#39;', [rfReplaceAll]);
    Texto := UTF8Encode(Texto);
   end;

  Result := Texto;
end;

class function NotaUtil.SeparaDados( Texto : AnsiString; Chave : String ) : AnsiString;
var
  PosIni, PosFim : Integer;
begin
  PosIni := Pos(Chave,Texto)+length(Chave)+1;
  PosFim := Pos('/'+Chave,Texto);

  if (PosIni = 0) or (PosFim = 0) then
   begin
     PosIni := Pos('ns1:'+Chave,Texto)+length(Chave)+5;
     PosFim := Pos('/ns1:'+Chave,Texto);
   end;

  Result := copy(Texto,PosIni,PosFim-(PosIni+1));
end;


end.
