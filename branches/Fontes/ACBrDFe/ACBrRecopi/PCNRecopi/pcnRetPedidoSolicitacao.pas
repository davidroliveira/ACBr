{$I ACBr.inc}

unit pcnRetPedidoSolicitacao;

interface

uses
  Classes, SysUtils, pcnLeitor, pcnConversao;

type

  { TRetornoConsPedidoSolicitacao }

  TRetornoConsPedidoSolicitacao = class(TPersistent)
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

{ TRetornoConsPedidoSolicitacao }

constructor TRetornoConsPedidoSolicitacao.Create;
begin
  FLeitor := TLeitor.Create;
end;

destructor TRetornoConsPedidoSolicitacao.Destroy;
begin
  FLeitor.Free;
  inherited Destroy;
end;

function TRetornoConsPedidoSolicitacao.LerXML: Boolean;
begin
  Result := False;
  try
    Leitor.Grupo:= Leitor.Arquivo;
    if Leitor.rExtrai(1, 'SolicitarOperacaoLoteResponse') <> '' then
      begin
        FRetorno:=Leitor.rCampo(tcStr, 'SolicitarOperacaoLoteResult');
        Result := True;
      end;
  except
  end;

end;

end.

