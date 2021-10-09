{$I ACBr.inc}

unit pcnRetConsConsultaPublica;

interface

uses
  Classes, SysUtils, pcnLeitor, pcnConversao;

type

  { TRetornoConsConsultaPublica }

  TRetornoConsConsultaPublica = class(TPersistent)
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

{ TRetornoConsObterVersao }

constructor TRetornoConsConsultaPublica.Create;
begin
  FLeitor := TLeitor.Create;
end;

destructor TRetornoConsConsultaPublica.Destroy;
begin
  FLeitor.Free;
  inherited;
end;

function TRetornoConsConsultaPublica.LerXML: Boolean;
begin
  Result := False;
  try
    Leitor.Grupo:= Leitor.Arquivo;
    if Leitor.rExtrai(1, 'ConsultaPublicaResponse') <> '' then
      begin
        FRetorno:=Leitor.rCampo(tcStr, 'ConsultaPublicaResult');
        Result := True;
      end;
  except
  end;
end;

end.

