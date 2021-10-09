{$I ACBr.inc}

unit pcnRetConsObterVersao;

interface

uses
  Classes, SysUtils, pcnLeitor, pcnConversao;

type

  { TRetornoConsObterVersao }

  TRetornoConsObterVersao = class(TPersistent)
  private
    FLeitor: TLeitor;
    FVersao: String;
  public
    constructor Create;
    destructor Destroy; override;
    function LerXML: Boolean;
  published
    property Leitor: TLeitor read FLeitor write FLeitor;
    property Versao: String read FVersao write FVersao;
  end;

implementation

{ TRetornoConsObterVersao }

constructor TRetornoConsObterVersao.Create;
begin
  FLeitor := TLeitor.Create;
end;

destructor TRetornoConsObterVersao.Destroy;
begin
  FLeitor.Free;
  inherited;
end;

function TRetornoConsObterVersao.LerXML: Boolean;
begin
  Result := False;
  try
    Leitor.Grupo:= Leitor.Arquivo;
    if Leitor.rExtrai(1, 'ObterVersaoResponse') <> '' then
      begin
        FVersao:=Leitor.rCampo(tcStr, 'ObterVersaoResult');
        Result := True;
      end;
  except
  end;
end;

end.

