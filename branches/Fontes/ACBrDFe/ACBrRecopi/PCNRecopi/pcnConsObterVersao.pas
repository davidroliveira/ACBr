{$I ACBr.inc}

unit pcnConsObterVersao;

interface

uses
  Classes, SysUtils, pcnConversao, pcnGerador;

type

  { TConsObterVersao }

  TConsObterVersao= class(TPersistent)
  private
    FGerador: TGerador;
    FtpAmb: TpcnTipoAmbiente;
  public
    constructor Create;
    destructor Destroy; override;
    function GeraXML: Boolean;
    function ObterNomeArquivo: String;
  published
    property Gerador: TGerador read FGerador write FGerador;
    property tpAmb  : TpcnTipoAmbiente read FtpAmb write FtpAmb;
  end;

implementation

uses
  pcnAuxiliar, ACBrRecopi;

{ TConsObterVersao }

constructor TConsObterVersao.Create;
begin
  FGerador := TGerador.Create;
end;

destructor TConsObterVersao.Destroy;
begin
  FGerador.Free;
  inherited;
end;

function TConsObterVersao.GeraXML: Boolean;
begin
  Gerador.ArquivoFormatoXML:='';
  Gerador.Opcoes.TagVaziaNoFormatoResumido := False;
  Gerador.wCampo(tcStr, '', 'ObterVersao', 1, 1, 1, '', '', True, 'xmlns="'+ACBRRECOPI_NAMESPACE+'"');
  Result := (Gerador.ListaDeAlertas.Count = 0);
end;

function TConsObterVersao.ObterNomeArquivo: String;
var
  DataHora: TDateTime;
  Year, Month, Day, Hour, Min, Sec, Milli: Word;
  AAAAMMDDTHHMMSS: string;
begin
  Datahora:=now;
  DecodeTime(DataHora, Hour, Min, Sec, Milli);
  DecodeDate(DataHora, Year, Month, Day);
  AAAAMMDDTHHMMSS := IntToStrZero(Year, 4) + IntToStrZero(Month, 2) + IntToStrZero(Day, 2) +
    IntToStrZero(Hour, 2) + IntToStrZero(Min, 2) + IntToStrZero(Sec, 2);
  Result := AAAAMMDDTHHMMSS + '-obt-ver.xml';
end;

end.

