{$I ACBr.inc}

unit ACBrRecopiConfiguracoes;

interface

uses
  Classes, SysUtils, ACBrDFeConfiguracoes, pcnConversao;

type

  { TGeralConfRecopi }

  TGeralConfRecopi = class(TGeralConf)
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Assign(DeGeralConf: TGeralConf); reintroduce; override;
  end;

  TArquivosConfRecopi = class(TArquivosConf);

  { TConfiguracoesRecopi }

  TConfiguracoesRecopi = class(TConfiguracoes)
  private
    function GetArquivos: TArquivosConfRecopi;
    function GetGeral: TGeralConfRecopi;
  protected
    procedure CreateGeralConf; override;
    procedure CreateArquivosConf; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Assign(DeConfiguracoesRecopi: TConfiguracoesRecopi); overload;
  published
    property Geral: TGeralConfRecopi read GetGeral;
    property Arquivos: TArquivosConfRecopi read GetArquivos;
    property WebServices;
    property Certificados;
  end;

implementation

{ TGeralConfRecopi }

constructor TGeralConfRecopi.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TGeralConfRecopi.Destroy;
begin
  inherited Destroy;
end;

procedure TGeralConfRecopi.Assign(DeGeralConf: TGeralConf);
begin
  inherited Assign(DeGeralConf);
end;

{ TConfiguracoesRecopi }

function TConfiguracoesRecopi.GetArquivos: TArquivosConfRecopi;
begin
  Result := TArquivosConfRecopi(FPArquivos);
end;

function TConfiguracoesRecopi.GetGeral: TGeralConfRecopi;
begin
  Result := TGeralConfRecopi(FPGeral);
end;

procedure TConfiguracoesRecopi.CreateGeralConf;
begin
  FPGeral := TGeralConfRecopi.Create(Self);
end;

procedure TConfiguracoesRecopi.CreateArquivosConf;
begin
  FPArquivos := TArquivosConfRecopi.Create(Self);
end;

constructor TConfiguracoesRecopi.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  WebServices.ResourceName:='ACBrRecopi';
end;

procedure TConfiguracoesRecopi.Assign(
  DeConfiguracoesRecopi: TConfiguracoesRecopi);
begin
  Geral.Assign(DeConfiguracoesRecopi.Geral);
  WebServices.Assign(DeConfiguracoesRecopi.WebServices);
  Certificados.Assign(DeConfiguracoesRecopi.Certificados);
  Arquivos.Assign(DeConfiguracoesRecopi.Arquivos);
end;

end.

