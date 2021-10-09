{******************************************************************************}
{ Projeto: Componente ACBrLMC                                                 }
{  Biblioteca multiplataforma de componentes Delphi                            }
{                                                                              }
{  Você pode obter a última versão desse arquivo na pagina do Projeto ACBr     }
{ Componentes localizado em http://www.sourceforge.net/projects/acbr           }
{                                                                              }
{                                                                              }
{  Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }
{                                                                              }
{  Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU      }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto}
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,  }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Você também pode obter uma copia da licença em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Simões de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Praça Anita Costa, 34 - Tatuí - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{*******************************************************************************
|* Historico
|*
|* 20/07/2015: Italo Jurisato Junior
|*  - Doação do componente para o Projeto ACBr
*******************************************************************************}

{$I ACBr.inc}

unit ACBrLMCLivros;

interface

uses
  Classes, SysUtils, Dialogs, Forms, StrUtils,
  ACBrLMCConfiguracoes, ACBrDFeUtil,
  plmcLMC, plmcLMCR, plmcLMCW, pcnConversao, pcnAuxiliar, pcnLeitor;

type

  { Livro }

  Livro = class(TCollectionItem)
  private
    FLMC: TLMC;
    FLMCW: TLMCW;
    FLMCR: TLMCR;

    FXML: String;
    FXMLAssinado: String;
    FXMLOriginal: String;
    FAlertas: String;
    FErroValidacao: String;
    FErroValidacaoCompleto: String;
    FErroRegrasdeNegocios: String;
    FNomeArq: String;

    function GetConfirmado: Boolean;
    function GetProcessado: Boolean;

    function GetMsg: String;
    function GetNumID: String;
    function GetXMLAssinado: String;
    procedure SetXML(AValue: String);
    procedure SetXMLOriginal(AValue: String);
    function ValidarConcatChave: Boolean;
    function CalcularNomeArquivo: String;
    function CalcularPathArquivo: String;
    function CalcularNomeArquivoCompleto(NomeArquivo: String = '';
      PathArquivo: String = ''): String;
  public
    constructor Create(Collection2: TCollection); override;
    destructor Destroy; override;

    procedure Assinar;
    procedure Validar;
    function VerificarAssinatura: Boolean;
    function ValidarRegrasdeNegocios: Boolean;

    function LerXML(AXML: AnsiString): Boolean;

    function GerarXML: String;
    function GravarXML(NomeArquivo: String = ''; PathArquivo: String = ''): Boolean;

    function GravarStream(AStream: TStream): Boolean;

    procedure EnviarEmail(sPara, sAssunto: String; sMensagem: TStrings = nil;
      EnviaPDF: Boolean = True; sCC: TStrings = nil; Anexos: TStrings = nil);

    property NomeArq: String read FNomeArq write FNomeArq;

    property LMC: TLMC read FLMC;

    // Atribuir a "XML", faz o componente transferir os dados lido para as propriedades internas e "XMLAssinado"
    property XML: String         read FXMLOriginal   write SetXML;
    // Atribuir a "XMLOriginal", reflete em XMLAssinado, se existir a tag de assinatura
    property XMLOriginal: String read FXMLOriginal   write SetXMLOriginal;
    property XMLAssinado: String read GetXMLAssinado write FXMLAssinado;
    property Confirmado: Boolean read GetConfirmado;
    property Processado: Boolean read GetProcessado;
    property Msg: String read GetMsg;
    property NumID: String read GetNumID;

    property Alertas: String read FAlertas;
    property ErroValidacao: String read FErroValidacao;
    property ErroValidacaoCompleto: String read FErroValidacaoCompleto;
    property ErroRegrasdeNegocios: String read FErroRegrasdeNegocios;
  end;

  { TLivros }

  TLivros = class(TOwnedCollection)
  private
    FACBrLMC: TComponent;
    FConfiguracoes: TConfiguracoesLMC;

    function GetItem(Index: integer): Livro;
    procedure SetItem(Index: integer; const Value: Livro);

  public
    constructor Create(AOwner: TPersistent; ItemClass: TCollectionItemClass);

    procedure GerarLMC;
    procedure Assinar;
    procedure Validar;
    function VerificarAssinatura(out Erros: String): Boolean;
    function ValidarRegrasdeNegocios(out Erros: String): Boolean;

    function Add: Livro;
    function Insert(Index: integer): Livro;

    property Items[Index: integer]: Livro read GetItem write SetItem; default;

    function GetNamePath: String; override;
    // Incluido o Parametro AGerarLMC que determina se após carregar os dados do LMC
    // para o componente, será gerado ou não novamente o XML do LMC.
    function LoadFromFile(CaminhoArquivo: String; AGerarLMC: Boolean = True): Boolean;
    function LoadFromStream(AStream: TStringStream; AGerarLMC: Boolean = True): Boolean;
    function LoadFromString(AXMLString: String; AGerarLMC: Boolean = True): Boolean;
    function GravarXML(PathNomeArquivo: String = ''): Boolean;

    property ACBrLMC: TComponent read FACBrLMC;
  end;

implementation

uses
  ACBrLMC, ACBrUtil, plmcConversao, synautil;

{ Livro }

constructor Livro.Create(Collection2: TCollection);
begin
  inherited Create(Collection2);
  FLMC := TLMC.Create;
  FLMCW := TLMCW.Create(FLMC);
  FLMCR := TLMCR.Create(FLMC);

  with TACBrLMC(TLivros(Collection).ACBrLMC) do
  begin
    FLMC.infLMC.Versao := VersaoLMCToDbl(Configuracoes.Geral.VersaoDF);
    LMC.infLMC.tpAmb := Configuracoes.WebServices.Ambiente;
  end;
end;

destructor Livro.Destroy;
begin
  FLMCW.Free;
  FLMCR.Free;
  FLMC.Free;
  inherited Destroy;
end;

procedure Livro.Assinar;
var
  XMLStr: String;
  XMLUTF8: AnsiString;
  Leitor: TLeitor;
begin
  TACBrLMC(TLivros(Collection).ACBrLMC).SSL.ValidarCNPJCertificado( LMC.infLMC.Emit.CNPJ );

  // Gera novamente, para processar propriedades que podem ter sido modificadas
  XMLStr := GerarXML;

  // XML já deve estar em UTF8, para poder ser assinado //
  XMLUTF8 := ConverteXMLtoUTF8(XMLStr);

  with TACBrLMC(TLivros(Collection).ACBrLMC) do
  begin
    FXMLAssinado := SSL.Assinar(String(XMLUTF8), 'livroCombustivel', 'infLivroCombustivel');
    FXMLOriginal := FXMLAssinado;

    Leitor := TLeitor.Create;
    try
      leitor.Grupo := XMLAssinado;
      LMC.signature.URI := Leitor.rAtributo('Reference URI=');
      LMC.signature.DigestValue := Leitor.rCampo(tcStr, 'DigestValue');
      LMC.signature.SignatureValue := Leitor.rCampo(tcStr, 'SignatureValue');
      LMC.signature.X509Certificate := Leitor.rCampo(tcStr, 'X509Certificate');
    finally
      Leitor.Free;
    end;

    if Configuracoes.Arquivos.Salvar then
    begin
      if NaoEstaVazio(NomeArq) then
        Gravar(NomeArq, FXMLAssinado)
      else
        Gravar(CalcularNomeArquivoCompleto(), FXMLAssinado);
    end;
  end;
end;

procedure Livro.Validar;
var
  Erro, AXML: String;
  LMCEhValida: Boolean;
  ALayout: TLayOutLMC;
begin
  AXML := XMLAssinado;

  with TACBrLMC(TLivros(Collection).ACBrLMC) do
  begin
    ALayout := LayLMCAutorizacao;

    LMCEhValida := SSL.Validar(AXML, GerarNomeArqSchema(ALayout, FLMC.infLMC.Versao), Erro);

    if not LMCEhValida then
    begin
      FErroValidacao := ACBrStr('Falha na validação dos dados do Livro: ') +
                                 LMC.infLMC.Id + sLineBreak + FAlertas;
      FErroValidacaoCompleto := FErroValidacao + sLineBreak + Erro;

      raise EACBrLMCException.CreateDef(
        IfThen(Configuracoes.Geral.ExibirErroSchema, ErroValidacaoCompleto,
        ErroValidacao));
    end;
  end;
end;

function Livro.VerificarAssinatura: Boolean;
var
  Erro, AXML: String;
  AssEhValida: Boolean;
begin
  AXML := XMLAssinado;

  with TACBrLMC(TLivros(Collection).ACBrLMC) do
  begin
    AssEhValida := SSL.VerificarAssinatura(AXML, Erro, 'infLivroCombustivel');

    if not AssEhValida then
    begin
      FErroValidacao := ACBrStr('Falha na validação da assinatura do Livro: ') +
        LMC.infLMC.Id + sLineBreak + Erro;
    end;
  end;

  Result := AssEhValida;
end;

function Livro.ValidarRegrasdeNegocios: Boolean;
var
  Erros: String;

  procedure AdicionaErro(const Erro: String);
  begin
    Erros := Erros + Erro + sLineBreak;
  end;

begin
  with TACBrLMC(TLivros(Collection).ACBrLMC) do
  begin
    Erros := '';

    if not ValidarConcatChave then  //A03-10
      AdicionaErro(
        '502-Rejeição: Erro na Chave de Acesso - Campo Id não corresponde à concatenação dos campos correspondentes');

  end;

  Result := EstaVazio(Erros);

  if not Result then
  begin
    Erros := ACBrStr('Erro(s) nas Regras de negócios do Livro: '+
                     LMC.infLMC.Id + sLineBreak +
                     Erros);
  end;

  FErroRegrasdeNegocios := Erros;
end;

function Livro.LerXML(AXML: AnsiString): Boolean;
begin
  Result := False;
  FLMCR.Leitor.Arquivo := AXML;
  FLMCR.LerXml;

  XMLOriginal := string(AXML);

  Result := True;
end;

function Livro.GravarXML(NomeArquivo: String; PathArquivo: String): Boolean;
begin
  if EstaVazio(FXMLOriginal) then
    GerarXML;

  FNomeArq := CalcularNomeArquivoCompleto(NomeArquivo, PathArquivo);

  Result := TACBrLMC(TLivros(Collection).ACBrLMC).Gravar(FNomeArq, FXMLOriginal);
end;

function Livro.GravarStream(AStream: TStream): Boolean;
begin
  Result := False;
  if EstaVazio(FXMLOriginal) then
    GerarXML;

  AStream.Size := 0;
  WriteStrToStream(AStream, AnsiString(FXMLOriginal));
  Result := True;
end;

procedure Livro.EnviarEmail(sPara, sAssunto: String; sMensagem: TStrings;
  EnviaPDF: Boolean; sCC: TStrings; Anexos: TStrings);
var
//  NomeArq : String;
  AnexosEmail:TStrings;
  StreamLMC : TMemoryStream;
begin
  if not Assigned(TACBrLMC(TLivros(Collection).ACBrLMC).MAIL) then
    raise EACBrLMCException.Create('Componente ACBrMail não associado');

  AnexosEmail := TStringList.Create;
  StreamLMC := TMemoryStream.Create;
  try
    AnexosEmail.Clear;
    if Assigned(Anexos) then
      AnexosEmail.Assign(Anexos);

    with TACBrLMC(TLivros(Collection).ACBrLMC) do
    begin
      GravarStream(StreamLMC);
      (*
      if (EnviaPDF) then
      begin
        if Assigned(DALMC) then
        begin
          DALMC.ImprimirDALMCPDF(FLMC);
          NomeArq := PathWithDelim(DALMC.PathPDF) + NumID + '-LMC.pdf';
          AnexosEmail.Add(NomeArq);
        end;
      end;
      *)
      EnviarEmail( sPara, sAssunto, sMensagem, sCC, AnexosEmail, StreamLMC,
                   NumID + '-LMC.xml');
    end;
  finally
    AnexosEmail.Free;
    StreamLMC.Free;
  end;
end;

function Livro.GerarXML: String;
var
  IdAnterior : String;
begin
  with TACBrLMC(TLivros(Collection).ACBrLMC) do
  begin
    IdAnterior := LMC.infLMC.ID;
    FLMCW.Gerador.Opcoes.FormatoAlerta  := Configuracoes.Geral.FormatoAlerta;
    FLMCW.Gerador.Opcoes.RetirarAcentos := Configuracoes.Geral.RetirarAcentos;
    FLMCW.Gerador.Opcoes.RetirarEspacos := Configuracoes.Geral.RetirarEspacos;
    pcnAuxiliar.TimeZoneConf.Assign( Configuracoes.WebServices.TimeZoneConf );
  end;

  FLMCW.GerarXml;
  XMLOriginal := FLMCW.Gerador.ArquivoFormatoXML;

  // XML gerado pode ter nova Chave e ID, então devemos calcular novamente
  // o nome do arquivo, mantendo o PATH do arquivo carregado
  if (NaoEstaVazio(FNomeArq) and (IdAnterior <> FLMC.infLMC.ID)) then
    FNomeArq := CalcularNomeArquivoCompleto('', ExtractFilePath(FNomeArq));

  FAlertas := ACBrStr( FLMCW.Gerador.ListaDeAlertas.Text );
  Result := FXMLOriginal;
end;

function Livro.CalcularNomeArquivo: String;
var
  xID: String;
begin
  xID := Self.NumID;

  if EstaVazio(xID) then
    raise EACBrLMCException.Create('ID Inválido. Impossível Salvar XML');

  Result := xID + '-LMC.xml';
end;

function Livro.CalcularPathArquivo: String;
var
  Data: TDateTime;
begin
  with TACBrLMC(TLivros(Collection).ACBrLMC) do
  begin
    if Configuracoes.Arquivos.EmissaoPathLMC then
      Data := FLMC.infLMC.movimento.dEmissao
    else
      Data := Now;

    Result := PathWithDelim(Configuracoes.Arquivos.GetPathLMC(Data, FLMC.infLMC.emit.CNPJ));
  end;
end;

function Livro.CalcularNomeArquivoCompleto(NomeArquivo: String;
  PathArquivo: String): String;
begin
  if EstaVazio(NomeArquivo) then
    NomeArquivo := CalcularNomeArquivo;

  if EstaVazio(PathArquivo) then
    PathArquivo := CalcularPathArquivo
  else
    PathArquivo := PathWithDelim(PathArquivo);

  Result := PathArquivo + NomeArquivo;
end;

function Livro.ValidarConcatChave: Boolean;
var
  wAno, wMes, wDia: word;
begin
  DecodeDate(LMC.infLMC.movimento.dEmissao, wAno, wMes, wDia);
  Result := not
    ((Copy(LMC.infLMC.Id , 04, 04) <> FormatFloat('0000', wAno)) or
     (Copy(LMC.infLMC.Id , 08, 02) <> FormatFloat('00', wMes)) or
     (Copy(LMC.infLMC.Id , 10, 02) <> FormatFloat('00', wDia)) or
     (Copy(LMC.infLMC.Id , 12, 14) <> PadLeft(OnlyNumber(LMC.infLMC.Emit.CNPJ), 14, '0')) or
     (Copy(LMC.infLMC.Id , 26, 05) <> IntToStrZero(LMC.infLMC.cNumerico, 5)));
end;

function Livro.GetConfirmado: Boolean;
begin
  Result := TACBrLMC(TLivros(Collection).ACBrLMC).cStatConfirmado(
    FLMC.procLMC.cStat);
end;

function Livro.GetProcessado: Boolean;
begin
  Result := TACBrLMC(TLivros(Collection).ACBrLMC).cStatProcessado(
    FLMC.procLMC.cStat);
end;

function Livro.GetMsg: String;
begin
  Result := FLMC.procLMC.xMotivo;
end;

function Livro.GetNumID: String;
begin
  Result := Trim(OnlyNumber(LMC.infLMC.ID));
end;

function Livro.GetXMLAssinado: String;
begin
  if EstaVazio(FXMLAssinado) then
    Assinar;

  Result := FXMLAssinado;
end;

procedure Livro.SetXML(AValue: String);
begin
  LerXML(AValue);
end;

procedure Livro.SetXMLOriginal(AValue: String);
begin
  FXMLOriginal := AValue;

  if XmlEstaAssinado(FXMLOriginal) then
    FXMLAssinado := FXMLOriginal
  else
    FXMLAssinado := '';
end;

{ TLivros }

constructor TLivros.Create(AOwner: TPersistent; ItemClass: TCollectionItemClass);
begin
  if not (AOwner is TACBrLMC) then
    raise EACBrLMCException.Create('AOwner deve ser do tipo TACBrLMC');

  inherited;

  FACBrLMC := TACBrLMC(AOwner);
  FConfiguracoes := TACBrLMC(FACBrLMC).Configuracoes;
end;

function TLivros.Add: Livro;
begin
  Result := Livro(inherited Add);
end;

procedure TLivros.Assinar;
var
  i: integer;
begin
  for i := 0 to Self.Count - 1 do
    Self.Items[i].Assinar;
end;

procedure TLivros.GerarLMC;
var
  i: integer;
begin
  for i := 0 to Self.Count - 1 do
    Self.Items[i].GerarXML;
end;

function TLivros.GetItem(Index: integer): Livro;
begin
  Result := Livro(inherited Items[Index]);
end;

function TLivros.GetNamePath: String;
begin
  Result := 'Livro';
end;

function TLivros.Insert(Index: integer): Livro;
begin
  Result := Livro(inherited Insert(Index));
end;

procedure TLivros.SetItem(Index: integer; const Value: Livro);
begin
  Items[Index].Assign(Value);
end;

procedure TLivros.Validar;
var
  i: integer;
begin
  for i := 0 to Self.Count - 1 do
    Self.Items[i].Validar;   // Dispara exception em caso de erro
end;

function TLivros.VerificarAssinatura(out Erros: String): Boolean;
var
  i: integer;
begin
  Result := True;
  Erros := '';

  for i := 0 to Self.Count - 1 do
  begin
    if not Self.Items[i].VerificarAssinatura then
    begin
      Result := False;
      Erros := Erros + Self.Items[i].ErroValidacao + sLineBreak;
    end;
  end;
end;

function TLivros.ValidarRegrasdeNegocios(out Erros: String): Boolean;
var
  i: integer;
begin
  Result := True;
  Erros := '';

  for i := 0 to Self.Count - 1 do
  begin
    if not Self.Items[i].ValidarRegrasdeNegocios then
    begin
      Result := False;
      Erros := Erros + Self.Items[i].ErroRegrasdeNegocios + sLineBreak;
    end;
  end;
end;

function TLivros.LoadFromFile(CaminhoArquivo: String;
  AGerarLMC: Boolean = True): Boolean;
var
  XMLStr: String;
  XMLUTF8: AnsiString;
  i, l: integer;
  MS: TMemoryStream;
begin
  Result := False;

  MS := TMemoryStream.Create;
  try
    MS.LoadFromFile(CaminhoArquivo);
    XMLUTF8 := ReadStrFromStream(MS, MS.Size);
  finally
    MS.Free;
  end;

  l := Self.Count; // Indice do último livro já existente

  // Converte de UTF8 para a String nativa da IDE //
  XMLStr := DecodeToString(XMLUTF8, True);
  Result := LoadFromString(XMLStr, AGerarLMC);

  if Result then
  begin
    // Atribui Nome do arquivo a novos livros inseridos //
    for i := l to Self.Count - 1 do
      Self.Items[i].NomeArq := CaminhoArquivo;
  end;
end;

function TLivros.LoadFromStream(AStream: TStringStream;
  AGerarLMC: Boolean = True): Boolean;
var
  AXML: AnsiString;
begin
  Result := False;
  AStream.Position := 0;
  AXML := ReadStrFromStream(AStream, AStream.Size);

  Result := Self.LoadFromString(String(AXML), AGerarLMC);
end;

function TLivros.LoadFromString(AXMLString: String;
  AGerarLMC: Boolean = True): Boolean;
var
  AXML: AnsiString;
  P, N: integer;

  function PosLMC: integer;
  begin
    Result := pos('</LMC>', AXMLString);
  end;

begin
  N := PosLMC;
  while N > 0 do
  begin
    P := pos('</LMCProc>', AXMLString);
    if P > 0 then
    begin
      AXML := copy(AXMLString, 1, P + 5);
      AXMLString := Trim(copy(AXMLString, P + 10, length(AXMLString)));
    end
    else
    begin
      AXML := copy(AXMLString, 1, N + 5);
      AXMLString := Trim(copy(AXMLString, N + 6, length(AXMLString)));
    end;

    with Self.Add do
    begin
      LerXML(AXML);

      if AGerarLMC then // Recalcula o XML
        GerarXML;
    end;

    N := PosLMC;
  end;

  Result := Self.Count > 0;
end;

function TLivros.GravarXML(PathNomeArquivo: String): Boolean;
var
  i: integer;
  NomeArq, PathArq : String;
begin
  Result := True;
  i := 0;
  while Result and (i < Self.Count) do
  begin
    PathArq := ExtractFilePath(PathNomeArquivo);
    NomeArq := ExtractFileName(PathNomeArquivo);
    Result := Self.Items[i].GravarXML(NomeArq, PathArq);
    Inc(i);
  end;
end;

end.
