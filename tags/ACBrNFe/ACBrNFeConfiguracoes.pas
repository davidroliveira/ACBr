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
******************************************************************************}
unit ACBrNFeConfiguracoes;

interface

uses {$IFDEF ACBrNFeCAPICOM} ACBrNFeCAPICOM_TLB, {$ENDIF}
  Classes, Sysutils;


type

  TCertificadosConf = class(TPersistent)
  private
    {$IFDEF ACBrNFeCAPICOM}
       FNumeroSerie: WideString;
    {$ELSE}
       FCertificado: WideString;
       FSenhaCert: WideString;
    {$ENDIF}   
  public
    {$IFDEF ACBrNFeCAPICOM}
       procedure SelecionarCertificado;
       function GetCertificado: ICertificate2;
    {$ENDIF}
  published
    {$IFDEF ACBrNFeCAPICOM}
       property NumeroSerie: WideString read FNumeroSerie write FNumeroSerie;
    {$ELSE}
       property Certificado: WideString read FCertificado write FCertificado;
       property Senha: WideString read FSenhaCert write FSenhaCert;
    {$ENDIF}
  end;

  TWebServicesConf = Class(TPersistent)
  private
    FVisualizar : Boolean;
    FUF: String;
    FUFCodigo: Integer;
    FAmbiente: String;
    FAmbienteCodigo: Integer;
    {$IFNDEF ACBrNFeCAPICOM}
       FProxyHost: String;
       FProxyPort: String;
       FProxyUser: String;
       FProxyPass: String;
    {$ENDIF}   
    procedure SetUF(AValue: String);
    procedure SetAmbiente(AValue: String);
  public
    constructor Create;
  published
    property Visualizar: Boolean read FVisualizar write FVisualizar;
    property UF: String read FUF write SetUF;
    property UFCodigo: Integer read FUFCodigo;
    property Ambiente: String read FAmbiente write SetAmbiente;
    property AmbienteCodigo: Integer read FAmbienteCodigo;
    {$IFNDEF ACBrNFeCAPICOM}
       property ProxyHost: String read FProxyHost write FProxyHost;
       property ProxyPort: String read FProxyPort write FProxyPort;
       property ProxyUser: String read FProxyUser write FProxyUser;
       property ProxyPass: String read FProxyPass write FProxyPass;
    {$ENDIF}   

  end;

  TGeralConf = class(TPersistent)
  private
    FFormaEmissao: String;
    FFormaEmissaoCodigo: Integer;
    FDANFE: String;
    FDANFECodigo: Integer;
    FSalvar: Boolean;
    FPathSalvar: String;
    FLogoMarca: String;
    procedure SetFormaEmissao(AValue: String);
    procedure SetDANFE(AValue: String);
    function GetPathSalvar: String;
  public
    constructor Create;
    function Save(AXMLName: String; AXMLFile: WideString): Boolean;
  published
    property FormaEmissao: String read FFormaEmissao write SetFormaEmissao;
    property FormaEmissaoCodigo: Integer read FFormaEmissaoCodigo;
    property DANFE: String read FDANFE write SetDANFE;
    property DANFECodigo: Integer read FDANFECodigo;
    property Salvar: Boolean read FSalvar write FSalvar;
    property PathSalvar: String read GetPathSalvar write FPathSalvar;
    property LogoMarca: String read FLogoMarca write FLogoMarca;
  end;

  TConfiguracoes = class(TPersistent)
  private
    FGeral: TGeralConf;
    FWebServices: TWebServicesConf;
    FCertificados: TCertificadosConf;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property Geral: TGeralConf read FGeral write FGeral;
    property WebServices: TWebServicesConf read FWebServices write FWebServices;
    property Certificados: TCertificadosConf read FCertificados write FCertificados;
  end;

implementation

uses ACBrNFeConst, ACBrNFeUtil, ACBrNFeDM, ACBrUtil;

{ TConfiguracoes }

constructor TConfiguracoes.Create;
begin
  FGeral        := TGeralConf.Create;
  FWebServices  := TWebServicesConf.Create;
  FCertificados := TCertificadosConf.Create;
end;

destructor TConfiguracoes.Destroy;
begin
  FGeral.Free;
  FWebServices.Free;
  FCertificados.Free;
  inherited;
end;

{ TGeralConf }

constructor TGeralConf.Create;
begin
  FFormaEmissao       := NFeFormaEmissao[0];
  FFormaEmissaoCodigo := NFeFormaEmissaoCodigo[0];
  FDANFE              := NFeDANFE[0];
  FDANFECodigo        := NFeDANFECodigo[0];
  FSalvar             := False;
end;

function TGeralConf.GetPathSalvar: String;
begin
  if NotaUtil.EstaVazio(FPathSalvar) then
    FPathSalvar := NotaUtil.PathAplication;
  Result := FPathSalvar;
end;

function TGeralConf.Save(AXMLName: String; AXMLFile: WideString): Boolean;
var
  vSalvar: TStrings;
begin
  Result := False;
  vSalvar := TStringList.Create;
  try
    try
      vSalvar.Text := AXMLFile;
      ForceDirectories(FPathSalvar);
      vSalvar.SaveToFile(FPathSalvar+PathDelim+AXMLName);
      Result := True;
    except on E: Exception do
      raise Exception.Create('Erro ao salvar .'+E.Message);
    end;
  finally
    vSalvar.Free;
  end;
end;

procedure TGeralConf.SetDANFE(AValue: String);
var
  i: Integer;
begin
  FDANFE := AValue;
  for i:= 0 to High(NFeDANFE) do
  begin
    if NFeDANFE[I] = AValue then
      FDANFECodigo := NFeDANFECodigo[I];
  end;
end;

procedure TGeralConf.SetFormaEmissao(AValue: String);
var
  i: Integer;
begin
  FFormaEmissao := AValue;
  for i:= 0 to High(NFeFormaEmissao) do
  begin
    if NFeFormaEmissao[I] = AValue then
      FFormaEmissaoCodigo := NFeFormaEmissaoCodigo[I];
  end;
end;

{ TWebServicesConf }

constructor TWebServicesConf.Create;
begin
  FUF               := NFeUF[8];
  FUFCodigo         := NFeUFCodigo[8];
  FAmbiente         := NFeAmbiente[1];
  FAmbienteCodigo   := NFeAmbienteCodigo[1];
end;

procedure TWebServicesConf.SetAmbiente(AValue: String);
var
  i: Integer;
begin
  FAmbiente := AValue;
  for i:= 0 to High(NFeAmbiente) do
  begin
    if NFeAmbiente[I] = AValue then
      FAmbienteCodigo := NFeAmbienteCodigo[I];
  end;
end;

procedure TWebServicesConf.SetUF(AValue: String);
var
  i: Integer;
begin
  FUF := AValue;
  for i:= 0 to High(NFeUF) do
  begin
    if NFeUF[I] = AValue then
      FUFCodigo := NFeUFCodigo[I];
  end;
end;

{ TCertificadosConf }

{$IFDEF ACBrNFeCAPICOM}
function TCertificadosConf.GetCertificado: ICertificate2;
var
  Store        : IStore3;
  Certs        : ICertificates2;
  Cert         : ICertificate2;
  i            : Integer;
begin
  Result := nil;
  Store := CoStore.Create;
  Store.Open(CAPICOM_CURRENT_USER_STORE, 'My', CAPICOM_STORE_OPEN_MAXIMUM_ALLOWED);

  Certs := Store.Certificates as ICertificates2;
  for i:= 1 to Certs.Count do
  begin
    Cert := IInterface(Certs.Item[i]) as ICertificate2;
    if Cert.SerialNumber = FNumeroSerie then
    begin
      Result := Cert;
      break;
    end;
  end;

  if not(Assigned(Result)) then
    raise Exception.Create('Certificado Digital n�o encontrado!'#13+
      '  Verique se o n�mero de s�rie foi informado corretamente.');

end;

procedure TCertificadosConf.SelecionarCertificado;
var
  Store        : IStore3;
  Certs        : ICertificates2;
  Certs2       : ICertificates2;
  Cert         : ICertificate2;
begin
  Store := CoStore.Create;
  Store.Open(CAPICOM_CURRENT_USER_STORE, 'My', CAPICOM_STORE_OPEN_MAXIMUM_ALLOWED);

  Certs := Store.Certificates as ICertificates2;
  Certs2 := Certs.Select('Certificado(s) Digital(is) dispon�vel(is)', 'Selecione o Certificado Digital para uso no aplicativo', false);

  if not(Certs2.Count = 0) then
  begin
    Cert := IInterface(Certs2.Item[1]) as ICertificate2;
    FNumeroSerie := Cert.SerialNumber;
  end;
end;
{$ENDIF}

end.
