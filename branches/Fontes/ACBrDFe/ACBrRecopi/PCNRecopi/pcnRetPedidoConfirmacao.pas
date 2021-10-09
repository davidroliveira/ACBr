{$I ACBr.inc}

unit pcnRetPedidoConfirmacao;

interface

uses
  Classes, SysUtils, pcnLeitor, pcnConversao;

type

  { TRetornoConsPedidoConfirmacao }

  TRetornoConsPedidoConfirmacao = class(TPersistent)
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

{ TRetornoConsPedidoConfirmacao }

constructor TRetornoConsPedidoConfirmacao.Create;
begin
  FLeitor := TLeitor.Create;
end;

destructor TRetornoConsPedidoConfirmacao.Destroy;
begin
  FLeitor.Free;
  inherited Destroy;
end;

function TRetornoConsPedidoConfirmacao.LerXML: Boolean;
begin
  Result := False;
  try
    Leitor.Grupo:= Leitor.Arquivo;
    if Leitor.rExtrai(1, 'ConfirmarOperacaoLoteResponse') <> '' then
      begin
        FRetorno:=Leitor.rCampo(tcStr, 'ConfirmarOperacaoLoteResult');
        Result := True;
      end;
  except
  end;

end;

end.

