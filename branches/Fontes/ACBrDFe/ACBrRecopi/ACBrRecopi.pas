{$I ACBr.inc}

unit ACBrRecopi;

interface

uses
  Classes, SysUtils, ACBrDFe, ACBrDFeException, ACBrDFeConfiguracoes
  , ACBrRecopiConfiguracoes
  , ACBrRecopiRecopis
  , ACBrRecopiWebServices
  , ACBrUtil;

const
  ACBRRECOPI_VERSAO = '1.6.0';
  ACBRRECOPI_NAMESPACE = 'http://www.fazenda.sp.gov.br/';

type

  EACBrRecopiException = class(EACBrDFeException);

  { TACBrRecopi }

  TACBrRecopi = class(TACBrDFe)
  private
    FWebServices: TACBrRecopiWebServices;
    function GetConfiguracoes: TConfiguracoesRecopi;
    procedure SetConfiguracoes(const Value: TConfiguracoesRecopi);
  protected
    function CreateConfiguracoes: TConfiguracoes; override;
    function GetAbout: String; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property WebServices: TACBrRecopiWebServices read FWebServices write FWebServices;
  published
    property Configuracoes: TConfiguracoesRecopi read GetConfiguracoes Write SetConfiguracoes;
  end;

implementation

{ TACBrRecopi }

function TACBrRecopi.GetConfiguracoes: TConfiguracoesRecopi;
begin
  Result := TConfiguracoesRecopi(FPConfiguracoes);
end;

procedure TACBrRecopi.SetConfiguracoes(const Value: TConfiguracoesRecopi);
begin
  FPConfiguracoes := Value;
end;

function TACBrRecopi.CreateConfiguracoes: TConfiguracoes;
begin
  Result:=inherited CreateConfiguracoes;
end;

function TACBrRecopi.GetAbout: String;
begin
  Result:= 'ACBrRecopi Ver: ' + ACBRRECOPI_VERSAO;;
end;

constructor TACBrRecopi.Create(AOwner: TComponent);
begin
  inherited;
  FWebServices:= TACBrRecopiWebServices.Create(Self);
end;

destructor TACBrRecopi.Destroy;
begin
  FWebServices.Free;
  inherited;
end;

end.

