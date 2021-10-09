{ **************************************************************************** }
{ Projeto: Componentes ACBr                                                    }
{ Biblioteca multiplataforma de componentes Delphi para interação com equipa-  }
{ mentos de Automação Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2009 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:   Italo Jurisato Junior                         }
{                                                                              }
{ Você pode obter a última versão desse arquivo na pagina do  Projeto ACBr     }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{ Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la  }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }
{                                                                              }
{ Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM    }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU      }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)              }
{                                                                              }
{ Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto }
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,  }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Você também pode obter uma copia da licença em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Simões de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{ Praça Anita Costa, 34 - Tatuí - SP - 18270-410                               }
{                                                                              }
{ **************************************************************************** }

{*******************************************************************************
|* Historico
|*
|* 20/06/2017: Italo Jurisato Junior
|*  - Doação do componente para o Projeto ACBr
*******************************************************************************}

{$I ACBr.inc}

unit ACBrDPSConfiguracoes;

interface

uses
  Classes, SysUtils, IniFiles,
  ACBrDFeConfiguracoes, pcnConversao, pcnConversaoDPS;

type

  { TGeralConfDPS }

  TGeralConfDPS = class(TGeralConf)
  private
    FVersaoDF: TVersaoDPS;

    procedure SetVersaoDF(const Value: TVersaoDPS);
  public
    constructor Create(AOwner: TConfiguracoes); override;
    procedure Assign(DeGeralConfDPS: TGeralConfDPS); reintroduce;
    procedure GravarIni(const AIni: TCustomIniFile); override;
    procedure LerIni(const AIni: TCustomIniFile); override;

  published
    property VersaoDF: TVersaoDPS read FVersaoDF write SetVersaoDF default ve100;
  end;

  { TDownloadConfDPS }

  TDownloadConfDPS = class(TPersistent)
  private
    FPathDownload: String;
    FSepararPorNome: Boolean;
  public
    Constructor Create;
    procedure Assign(Source: TPersistent); override;
  published
    property PathDownload: String read FPathDownload write FPathDownload;
    property SepararPorNome: Boolean read FSepararPorNome write FSepararPorNome default False;
  end;

  { TArquivosConfDPS }

  TArquivosConfDPS = class(TArquivosConf)
  private
    FEmissaoPathDPS: Boolean;
    FSalvarEvento: Boolean;
    FSalvarApenasDPSProcessadas: Boolean;
    FNormatizarMunicipios: Boolean;
    FPathDPS: String;
    FPathEvento: String;
    FPathArquivoMunicipios: String;
    FDownloadDPS: TDownloadConfDPS;
  public
    constructor Create(AOwner: TConfiguracoes); override;
    destructor Destroy; override;
    procedure Assign(DeArquivosConfDPS: TArquivosConfDPS); reintroduce;
    procedure GravarIni(const AIni: TCustomIniFile); override;
    procedure LerIni(const AIni: TCustomIniFile); override;

    function GetPathDPS(Data: TDateTime = 0; CNPJ: String = ''): String;
    function GetPathEvento(tipoEvento: TpcnTpEvento; CNPJ: String = ''; Data: TDateTime = 0): String;
    function GetPathDownload(xNome: String = ''; CNPJ: String = ''; Data: TDateTime = 0): String;
  published
    property EmissaoPathDPS: Boolean read FEmissaoPathDPS
      write FEmissaoPathDPS default False;
    property SalvarEvento: Boolean read FSalvarEvento
      write FSalvarEvento default False;
    property SalvarApenasDPSProcessadas: Boolean
      read FSalvarApenasDPSProcessadas write FSalvarApenasDPSProcessadas default False;
    property NormatizarMunicipios: boolean read FNormatizarMunicipios
      write FNormatizarMunicipios default False;
    property PathDPS: String read FPathDPS write FPathDPS;
    property PathEvento: String read FPathEvento write FPathEvento;
    property PathArquivoMunicipios: String read FPathArquivoMunicipios write FPathArquivoMunicipios;
    property DownloadDPS: TDownloadConfDPS read FDownloadDPS write FDownloadDPS;
  end;

  { TConfiguracoesDPS }

  TConfiguracoesDPS = class(TConfiguracoes)
  private
    function GetArquivos: TArquivosConfDPS;
    function GetGeral: TGeralConfDPS;
  protected
    procedure CreateGeralConf; override;
    procedure CreateArquivosConf; override;

  public
    constructor Create(AOwner: TComponent); override;
    procedure Assign(DeConfiguracoesDPS: TConfiguracoesDPS); reintroduce;

  published
    property Geral: TGeralConfDPS read GetGeral;
    property Arquivos: TArquivosConfDPS read GetArquivos;
    property WebServices;
    property Certificados;
  end;

implementation

uses
  ACBrUtil, ACBrDPS,
  DateUtils;

{ TConfiguracoesDPS }

constructor TConfiguracoesDPS.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FPSessaoIni := 'DPS';
  WebServices.ResourceName := 'ACBrDPSServicos';
end;

procedure TConfiguracoesDPS.Assign(DeConfiguracoesDPS: TConfiguracoesDPS);
begin
  Geral.Assign(DeConfiguracoesDPS.Geral);
  WebServices.Assign(DeConfiguracoesDPS.WebServices);
  Certificados.Assign(DeConfiguracoesDPS.Certificados);
  Arquivos.Assign(DeConfiguracoesDPS.Arquivos);
end;

function TConfiguracoesDPS.GetArquivos: TArquivosConfDPS;
begin
  Result := TArquivosConfDPS(FPArquivos);
end;

function TConfiguracoesDPS.GetGeral: TGeralConfDPS;
begin
  Result := TGeralConfDPS(FPGeral);
end;

procedure TConfiguracoesDPS.CreateGeralConf;
begin
  FPGeral := TGeralConfDPS.Create(Self);
end;

procedure TConfiguracoesDPS.CreateArquivosConf;
begin
  FPArquivos := TArquivosConfDPS.Create(self);
end;

{ TGeralConfDPS }

constructor TGeralConfDPS.Create(AOwner: TConfiguracoes);
begin
  inherited Create(AOwner);

  FVersaoDF := ve100;
end;

procedure TGeralConfDPS.Assign(DeGeralConfDPS: TGeralConfDPS);
begin
  inherited Assign(DeGeralConfDPS);

  VersaoDF := DeGeralConfDPS.VersaoDF;
end;

procedure TGeralConfDPS.SetVersaoDF(const Value: TVersaoDPS);
begin
  FVersaoDF := Value;
end;

procedure TGeralConfDPS.GravarIni(const AIni: TCustomIniFile);
begin
  inherited GravarIni(AIni);

  AIni.WriteInteger(fpConfiguracoes.SessaoIni, 'VersaoDF', Integer(VersaoDF));
end;

procedure TGeralConfDPS.LerIni(const AIni: TCustomIniFile);
begin
  inherited LerIni(AIni);

  VersaoDF := TVersaoDPS(AIni.ReadInteger(fpConfiguracoes.SessaoIni, 'VersaoDF', Integer(VersaoDF)));
end;

{ TDownloadConfDPS }

procedure TDownloadConfDPS.Assign(Source: TPersistent);
begin
  if Source is TDownloadConfDPS then
  begin
    FPathDownload := TDownloadConfDPS(Source).PathDownload;
    FSepararPorNome := TDownloadConfDPS(Source).SepararPorNome;
  end
  else
    inherited Assign(Source);
end;

constructor TDownloadConfDPS.Create;
begin
  FPathDownload := '';
  FSepararPorNome := False;
end;

{ TArquivosConfDPS }

constructor TArquivosConfDPS.Create(AOwner: TConfiguracoes);
begin
  inherited Create(AOwner);

  FDownloadDPS := TDownloadConfDPS.Create;
  FEmissaoPathDPS := False;
  FSalvarEvento := False;
  FSalvarApenasDPSProcessadas := False;
  FNormatizarMunicipios := False;
  FPathDPS := '';
  FPathEvento := '';
  FPathArquivoMunicipios := '';
end;

destructor TArquivosConfDPS.Destroy;
begin
  FDownloadDPS.Free;

  inherited;
end;

procedure TArquivosConfDPS.Assign(DeArquivosConfDPS: TArquivosConfDPS);
begin
  inherited Assign(DeArquivosConfDPS);

  FEmissaoPathDPS             := DeArquivosConfDPS.EmissaoPathDPS;
  FSalvarEvento               := DeArquivosConfDPS.SalvarEvento;
  FSalvarApenasDPSProcessadas := DeArquivosConfDPS.SalvarApenasDPSProcessadas;
  FNormatizarMunicipios       := DeArquivosConfDPS.NormatizarMunicipios;
  FPathDPS                    := DeArquivosConfDPS.PathDPS;
  FPathEvento                 := DeArquivosConfDPS.PathEvento;
  FPathArquivoMunicipios      := DeArquivosConfDPS.PathArquivoMunicipios;

  FDownloadDPS.Assign(DeArquivosConfDPS.DownloadDPS);
end;

function TArquivosConfDPS.GetPathEvento(tipoEvento: TpcnTpEvento; CNPJ: String;
  Data: TDateTime): String;
var
  Dir: String;
begin
  Dir := GetPath(FPathEvento, 'Evento', CNPJ, Data);

  if AdicionarLiteral then
    Dir := PathWithDelim(Dir) + TpEventoToDescStr(tipoEvento);

  if not DirectoryExists(Dir) then
    ForceDirectories(Dir);

  Result := Dir;
end;

function TArquivosConfDPS.GetPathDPS(Data: TDateTime = 0; CNPJ: String = ''): String;
begin
  Result := GetPath(FPathDPS, ModeloDF, CNPJ, Data, ModeloDF);
end;

function TArquivosConfDPS.GetPathDownload(xNome, CNPJ: String;
  Data: TDateTime): String;
var
  rPathDown: String;
begin
  rPathDown := '';
  if EstaVazio(FDownloadDPS.PathDownload) then
    FDownloadDPS.PathDownload := PathSalvar;

  if (FDownloadDPS.SepararPorNome) and (NaoEstaVazio(xNome)) then
    rPathDown := rPathDown + PathWithDelim(FDownloadDPS.PathDownload) + TiraAcentos(xNome)
  else
    rPathDown := FDownloadDPS.PathDownload;

  Result := GetPath(rPathDown, 'Down', CNPJ, Data);
end;

procedure TArquivosConfDPS.GravarIni(const AIni: TCustomIniFile);
begin
  inherited GravarIni(AIni);

  AIni.WriteBool(fpConfiguracoes.SessaoIni, 'SalvarEvento', SalvarEvento);
  AIni.WriteBool(fpConfiguracoes.SessaoIni, 'SalvarApenasDPSProcessadas', SalvarApenasDPSProcessadas);
  AIni.WriteBool(fpConfiguracoes.SessaoIni, 'EmissaoPathDPS', EmissaoPathDPS);
  AIni.WriteBool(fpConfiguracoes.SessaoIni, 'NormatizarMunicipios', NormatizarMunicipios);
  AIni.WriteString(fpConfiguracoes.SessaoIni, 'PathDPS', PathDPS);
  AIni.WriteString(fpConfiguracoes.SessaoIni, 'PathEvento', PathEvento);
  AIni.WriteString(fpConfiguracoes.SessaoIni, 'PathArquivoMunicipios', PathArquivoMunicipios);
  AIni.WriteString(fpConfiguracoes.SessaoIni, 'Download.PathDownload', DownloadDPS.PathDownload);
  AIni.WriteBool(fpConfiguracoes.SessaoIni, 'Download.SepararPorNome', DownloadDPS.SepararPorNome);
end;

procedure TArquivosConfDPS.LerIni(const AIni: TCustomIniFile);
begin
  inherited LerIni(AIni);

  SalvarEvento := AIni.ReadBool(fpConfiguracoes.SessaoIni, 'SalvarEvento', SalvarEvento);
  SalvarApenasDPSProcessadas := AIni.ReadBool(fpConfiguracoes.SessaoIni, 'SalvarApenasDPSProcessadas', SalvarApenasDPSProcessadas);
  EmissaoPathDPS := AIni.ReadBool(fpConfiguracoes.SessaoIni, 'EmissaoPathDPS', EmissaoPathDPS);
  NormatizarMunicipios := AIni.ReadBool(fpConfiguracoes.SessaoIni, 'NormatizarMunicipios', NormatizarMunicipios);
  PathDPS := AIni.ReadString(fpConfiguracoes.SessaoIni, 'PathDPS', PathDPS);
  PathEvento := AIni.ReadString(fpConfiguracoes.SessaoIni, 'PathEvento', PathEvento);
  PathArquivoMunicipios := AIni.ReadString(fpConfiguracoes.SessaoIni, 'PathArquivoMunicipios', PathArquivoMunicipios);
  DownloadDPS.PathDownload := AIni.ReadString(fpConfiguracoes.SessaoIni, 'Download.PathDownload', DownloadDPS.PathDownload);
  DownloadDPS.SepararPorNome := AIni.ReadBool(fpConfiguracoes.SessaoIni, 'Download.SepararPorNome', DownloadDPS.SepararPorNome);
end;

end.
