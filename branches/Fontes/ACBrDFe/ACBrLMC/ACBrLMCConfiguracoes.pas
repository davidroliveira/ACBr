{******************************************************************************}
{ Projeto: Componente ACBrLMC                                                 }
{  Biblioteca multiplataforma de componentes Delphi                            }
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

{*******************************************************************************
|* Historico
|*
|* 20/07/2015: Italo Jurisato Junior
|*  - Doa��o do componente para o Projeto ACBr
*******************************************************************************}

{$I ACBr.inc}

unit ACBrLMCConfiguracoes;

interface

uses
  Classes, SysUtils,
  ACBrDFeConfiguracoes, pcnConversao, plmcConversao;

type

  { TGeralConfLMC }

  TGeralConfLMC = class(TGeralConf)
  private
    FVersaoDF: TVersaoLMC;

    procedure SetVersaoDF(const Value: TVersaoLMC);
  public
    constructor Create(AOwner: TConfiguracoes); override;
    procedure Assign(DeGeralConfLMC: TGeralConfLMC); reintroduce;

  published
    property VersaoDF: TVersaoLMC read FVersaoDF write SetVersaoDF default ve100;
  end;

  { TDownloadConfLMC }

  TDownloadConfLMC = class(TPersistent)
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

  { TArquivosConfLMC }

  TArquivosConfLMC = class(TArquivosConf)
  private
    FEmissaoPathLMC: boolean;
    FSalvarApenasLMCProcessados: boolean;
    FPathLMC: String;
    FDownloadLMC: TDownloadConfLMC;
  public
    constructor Create(AOwner: TConfiguracoes); override;
    destructor Destroy; override;
    procedure Assign(DeArquivosConfLMC: TArquivosConfLMC); reintroduce;

    function GetPathLMC(Data: TDateTime = 0; CNPJ: String = ''): String;
    function GetPathDownload(xNome: String = ''; CNPJ: String = ''): String;
  published
    property EmissaoPathLMC: boolean read FEmissaoPathLMC
      write FEmissaoPathLMC default False;
    property SalvarApenasLMCProcessados: boolean
      read FSalvarApenasLMCProcessados write FSalvarApenasLMCProcessados default False;
    property PathLMC: String read FPathLMC write FPathLMC;
    property DownloadLMC: TDownloadConfLMC read FDownloadLMC write FDownloadLMC;
  end;

  { TConfiguracoesLMC }

  TConfiguracoesLMC = class(TConfiguracoes)
  private
    function GetArquivos: TArquivosConfLMC;
    function GetGeral: TGeralConfLMC;
  protected
    procedure CreateGeralConf; override;
    procedure CreateArquivosConf; override;

  public
    constructor Create(AOwner: TComponent); override;
    procedure Assign(DeConfiguracoesLMC: TConfiguracoesLMC); reintroduce;

  published
    property Geral: TGeralConfLMC read GetGeral;
    property Arquivos: TArquivosConfLMC read GetArquivos;
    property WebServices;
    property Certificados;
  end;

implementation

uses
  ACBrUtil, DateUtils;

{ TConfiguracoesLMC }

constructor TConfiguracoesLMC.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  WebServices.ResourceName := 'ACBrLMCServicos';
end;

function TConfiguracoesLMC.GetArquivos: TArquivosConfLMC;
begin
  Result := TArquivosConfLMC(FPArquivos);
end;

function TConfiguracoesLMC.GetGeral: TGeralConfLMC;
begin
  Result := TGeralConfLMC(FPGeral);
end;

procedure TConfiguracoesLMC.CreateGeralConf;
begin
  FPGeral := TGeralConfLMC.Create(Self);
end;

procedure TConfiguracoesLMC.CreateArquivosConf;
begin
  FPArquivos := TArquivosConfLMC.Create(self);
end;

procedure TConfiguracoesLMC.Assign(DeConfiguracoesLMC: TConfiguracoesLMC);
begin
  Geral.Assign(DeConfiguracoesLMC.Geral);
  WebServices.Assign(DeConfiguracoesLMC.WebServices);
  Certificados.Assign(DeConfiguracoesLMC.Certificados);
  Arquivos.Assign(DeConfiguracoesLMC.Arquivos);
end;

{ TGeralConfLMC }

procedure TGeralConfLMC.Assign(DeGeralConfLMC: TGeralConfLMC);
begin
  inherited Assign(DeGeralConfLMC);

  FVersaoDF := DeGeralConfLMC.VersaoDF;
end;

constructor TGeralConfLMC.Create(AOwner: TConfiguracoes);
begin
  inherited Create(AOwner);

  FVersaoDF := ve100;
end;

procedure TGeralConfLMC.SetVersaoDF(const Value: TVersaoLMC);
begin
  FVersaoDF := Value;
end;

{ TArquivosConfLMC }

procedure TArquivosConfLMC.Assign(DeArquivosConfLMC: TArquivosConfLMC);
begin
  inherited Assign(DeArquivosConfLMC);

  FEmissaoPathLMC             := DeArquivosConfLMC.EmissaoPathLMC;
  FSalvarApenasLMCProcessados := DeArquivosConfLMC.SalvarApenasLMCProcessados;
  FPathLMC                    := DeArquivosConfLMC.PathLMC;
  FDownloadLMC.Assign(DeArquivosConfLMC.DownloadLMC);
end;

constructor TArquivosConfLMC.Create(AOwner: TConfiguracoes);
begin
  inherited Create(AOwner);

  FDownloadLMC := TDownloadConfLMC.Create;
  FEmissaoPathLMC := False;
  FSalvarApenasLMCProcessados := False;
  FPathLMC := '';
end;

destructor TArquivosConfLMC.Destroy;
begin
  FDownloadLMC.Free;
  inherited;
end;

function TArquivosConfLMC.GetPathLMC(Data: TDateTime = 0; CNPJ: String = ''): String;
begin
  Result := GetPath(FPathLMC, 'LMC', CNPJ, Data);
end;

function TArquivosConfLMC.GetPathDownload(xNome, CNPJ: String): String;
begin
  if EstaVazio(FDownloadLMC.PathDownload) then
     FDownloadLMC.PathDownload := PathSalvar;

  if FDownloadLMC.SepararPorNome then
     if NaoEstaVazio(xNome) then
        FDownloadLMC.PathDownload := PathWithDelim(FDownloadLMC.PathDownload) + TiraAcentos(xNome);

  Result := GetPath(FDownloadLMC.PathDownload, 'Down', CNPJ);
end;

{ TDownloadConfLMC }

constructor TDownloadConfLMC.Create;
begin
  FPathDownload := '';
  FSepararPorNome := False;
end;

procedure TDownloadConfLMC.Assign(Source: TPersistent);
begin
  if Source is TDownloadConfLMC then
  begin
    FPathDownload := TDownloadConfLMC(Source).PathDownload;
    FSepararPorNome := TDownloadConfLMC(Source).SepararPorNome;
  end
  else
    inherited Assign(Source);
end;

end.
