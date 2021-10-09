{$I ACBr.inc}

unit pcnRetInclusaoNF;

interface

uses
  Classes, SysUtils, pcnLeitor, pcnConversao;

type

  { TRetornoInclusaoNF }

  TRetornoInclusaoNF = class(TPersistent)
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

{ TRetornoInclusaoNF }

constructor TRetornoInclusaoNF.Create;
begin
  FLeitor := TLeitor.Create;
end;

destructor TRetornoInclusaoNF.Destroy;
begin
  FLeitor.Free;
  inherited;
end;

function TRetornoInclusaoNF.LerXML: Boolean;
begin
  Result := False;
  try
    Leitor.Grupo:= Leitor.Arquivo;
    if Leitor.rExtrai(1, 'AtualizarNFLoteResponse') <> '' then
      begin
        FRetorno:=Leitor.rCampo(tcStr, 'AtualizarNFLoteResult');
        Result := True;
      end;
  except
  end;
end;

end.

