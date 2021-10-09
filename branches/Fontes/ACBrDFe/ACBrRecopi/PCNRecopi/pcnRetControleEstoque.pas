{$I ACBr.inc}

unit pcnRetControleEstoque;

interface

uses
  Classes, SysUtils, pcnLeitor, pcnConversao;

type

  { TRetornoConsControleEstoque }

  TRetornoConsControleEstoque = class(TPersistent)
  private
    FLeitor: TLeitor;
    FRetorno: String;
  public
    constructor Create;
    destructor Destroy; override;
    function LerXML: Boolean;
  published
    property Leitor: TLeitor read FLeitor write FLeitor;
    property Retorno: String read FRetorno write FRetorno;
  end;


implementation

{ TRetornoConsControleEstoque }

constructor TRetornoConsControleEstoque.Create;
begin
  FLeitor := TLeitor.Create;
end;

destructor TRetornoConsControleEstoque.Destroy;
begin
  FLeitor.Free;
  inherited Destroy;
end;

function TRetornoConsControleEstoque.LerXML: Boolean;
begin
  Result := False;
  try
    Leitor.Grupo:= Leitor.Arquivo;
    if Leitor.rExtrai(1, 'ControlarEstoqueResponse') <> '' then
      begin
        FRetorno:=Leitor.rCampo(tcStr, 'ControlarEstoqueResult');
        Result := True;
      end;
  except
  end;

end;

end.

