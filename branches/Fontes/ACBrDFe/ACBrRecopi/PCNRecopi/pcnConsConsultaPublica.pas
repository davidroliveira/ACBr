{$I ACBr.inc}

unit pcnConsConsultaPublica;

interface

uses
  Classes, SysUtils, pcnConversao, pcnGerador;

type

  { TConsConsultaPublica }

  TConsConsultaPublica = class(TPersistent)
  private
    FCNPJ: String;
    FGerador: TGerador;
    FtpAmb: TpcnTipoAmbiente;
    FUF: String;
  public
    constructor Create;
    destructor Destroy; override;
    function GeraXML: Boolean;
    function ObterNomeArquivo: String;
  published
    property Gerador: TGerador read FGerador write FGerador;
    property tpAmb  : TpcnTipoAmbiente read FtpAmb write FtpAmb;
    property CNPJ   : String read FCNPJ write FCNPJ;
    property UF     : String read FUF write FUF;
  end;

implementation

uses
  pcnAuxiliar, ACBrRecopi;

{ TConsObterVersao }

constructor TConsConsultaPublica.Create;
begin
  FGerador := TGerador.Create;
end;

destructor TConsConsultaPublica.Destroy;
begin
  FGerador.Free;
  inherited;
end;

function TConsConsultaPublica.GeraXML: Boolean;
begin
  Gerador.ArquivoFormatoXML:='';
  Gerador.Opcoes.TagVaziaNoFormatoResumido := False;
  Gerador.wGrupo('ListaConsultaPublica');
  Gerador.wGrupo('ListaEstabelecimentos');
  Gerador.wGrupo('Estabelecimento');
  Gerador.wCampo(tcStr, '', 'CNPJ', 14, 14, 1, FCNPJ);
  Gerador.wCampo(tcStr, '', 'UF', 2, 2, 1, FUF);
  Gerador.wCampo(tcStr, '', 'Retorno', 2, 2, 1, '');
  Gerador.wGrupo('/Estabelecimento');
  Gerador.wGrupo('/ListaEstabelecimentos');
  Gerador.wGrupo('/ListaConsultaPublica');
  Result := (Gerador.ListaDeAlertas.Count = 0);
end;

function TConsConsultaPublica.ObterNomeArquivo: String;
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
  Result := AAAAMMDDTHHMMSS + '-con-pub.xml';
end;

end.

