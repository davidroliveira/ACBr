{ **************************************************************************** }
{ Projeto: Componentes ACBr                                                    }
{ Biblioteca multiplataforma de componentes Delphi para interação com equipa-  }
{ mentos de Automação Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2009 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:   Italo Jurisato Junior                         }
{                                                                              }
{ Você pode obter a última versão desse arquivo na pagina do  Projeto ACBr     }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{ Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la  }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }
{                                                                              }
{ Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM    }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU      }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)              }
{                                                                              }
{ Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto }
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,  }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Você também pode obter uma copia da licença em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Simões de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{ Praça Anita Costa, 34 - Tatuí - SP - 18270-410                               }
{                                                                              }
{ **************************************************************************** }

{*******************************************************************************
|* Historico
|*
|* 20/06/2017: Italo Jurisato Junior
|*  - Doação do componente para o Projeto ACBr
*******************************************************************************}

{$I ACBr.inc}

unit ACBrDPSNotas;

interface

uses
  Classes, SysUtils, Dialogs, StrUtils,
  ACBrDPSConfiguracoes,
  pcnDPS, pcnDPSR, pcnDPSW, pcnConversao, pcnAuxiliar, pcnLeitor;

type

  { Nota }

  Nota = class(TCollectionItem)
  private
    FDPS: TDPS;
    FDPSW: TDPSW;
    FDPSR: TDPSR;

    FConfiguracoes: TConfiguracoesDPS;
    FXMLAssinado: String;
    FXMLOriginal: String;
    FAlertas: String;
    FErroValidacao: String;
    FErroValidacaoCompleto: String;
    FErroRegrasdeNegocios: String;
    FNomeArq: String;

    function GetConfirmada: Boolean;
    function GetProcessada: Boolean;
    function GetCancelada: Boolean;

    function GetMsg: String;
    function GetNumID: String;
    function GetXMLAssinado: String;
    procedure SetXML(AValue: String);
    procedure SetXMLOriginal(AValue: String);
    function ValidarConcatChave: Boolean;
    function CalcularNomeArquivo: String;
    function CalcularPathArquivo: String;
    function GetcStat: Integer;
  public
    constructor Create(Collection2: TCollection); override;
    destructor Destroy; override;
    procedure Imprimir;
    procedure ImprimirPDF;

    procedure Assinar;
    procedure Validar;
    function VerificarAssinatura: Boolean;
    function ValidarRegrasdeNegocios: Boolean;

    function LerXML(AXML: String): Boolean;
    function LerArqIni(const AIniString: String): Boolean;

    function GerarXML: String;
    function GravarXML(NomeArquivo: String = ''; PathArquivo: String = ''): Boolean;

    function GerarTXT: String;
    function GravarTXT(NomeArquivo: String = ''; PathArquivo: String = ''): Boolean;

    function GravarStream(AStream: TStream): Boolean;

    procedure EnviarEmail(sPara, sAssunto: String; sMensagem: TStrings = nil;
      EnviaPDF: Boolean = True; sCC: TStrings = nil; Anexos: TStrings = nil;
      sReplyTo: TStrings = nil);

    property NomeArq: String read FNomeArq write FNomeArq;
    function CalcularNomeArquivoCompleto(NomeArquivo: String = '';
      PathArquivo: String = ''): String;

    property DPS: TDPS read FDPS;

    // Atribuir a "XML", faz o componente transferir os dados lido para as propriedades internas e "XMLAssinado"
    property XML: String         read FXMLOriginal   write SetXML;
    // Atribuir a "XMLOriginal", reflete em XMLAssinado, se existir a tag de assinatura
    property XMLOriginal: String read FXMLOriginal   write SetXMLOriginal;    // Sempre deve estar em UTF8
    property XMLAssinado: String read GetXMLAssinado write FXMLAssinado;      // Sempre deve estar em UTF8
    property Confirmada: Boolean read GetConfirmada;
    property Processada: Boolean read GetProcessada;
    property Cancelada: Boolean  read GetCancelada;
    property cStat: Integer      read GetcStat;
    property Msg: String         read GetMsg;
    property NumID: String       read GetNumID;

    property Alertas: String               read FAlertas;
    property ErroValidacao: String         read FErroValidacao;
    property ErroValidacaoCompleto: String read FErroValidacaoCompleto;
    property ErroRegrasdeNegocios: String  read FErroRegrasdeNegocios;
  end;

  { TNotas }

  TNotas = class(TOwnedCollection)
  private
    FACBrDPS: TComponent;
    FConfiguracoes: TConfiguracoesDPS;

    function GetItem(Index: integer): Nota;
    procedure SetItem(Index: integer; const Value: Nota);

    procedure VerificarDADPS;
  public
    constructor Create(AOwner: TPersistent; ItemClass: TCollectionItemClass);

    procedure GerarDPS;
    procedure Assinar;
    procedure Validar;
    function VerificarAssinatura(out Erros: String): Boolean;
    function ValidarRegrasdeNegocios(out Erros: String): Boolean;
    procedure Imprimir;
    procedure ImprimirCancelado;
    procedure ImprimirResumido;
    procedure ImprimirPDF;
    procedure ImprimirResumidoPDF;
    function Add: Nota;
    function Insert(Index: integer): Nota;

    property Items[Index: integer]: Nota read GetItem write SetItem; default;

    function GetNamePath: String; override;
    // Incluido o Parametro AGerarDPS que determina se após carregar os dados da DPS
    // para o componente, será gerado ou não novamente o XML da DPS.
    function LoadFromFile(CaminhoArquivo: String; AGerarDPS: Boolean = False): Boolean;
    function LoadFromStream(AStream: TStringStream; AGerarDPS: Boolean = False): Boolean;
    function LoadFromString(AXMLString: String; AGerarDPS: Boolean = False): Boolean;
    function LoadFromIni(AIniString: String): Boolean;

    function GravarXML(PathNomeArquivo: String = ''): Boolean;
    function GravarTXT(PathNomeArquivo: String = ''): Boolean;

    property ACBrDPS: TComponent read FACBrDPS;
  end;

implementation

uses
  dateutils, IniFiles,
  synautil,
  ACBrDPS, ACBrUtil, ACBrDFeUtil, pcnConversaoDPS;

{ Nota }

constructor Nota.Create(Collection2: TCollection);
begin
  inherited Create(Collection2);

  FDPS := TDPS.Create;
  FDPSW := TDPSW.Create(FDPS);
  FDPSR := TDPSR.Create(FDPS);
  FConfiguracoes := TACBrDPS(TNotas(Collection).ACBrDPS).Configuracoes;

  with TACBrDPS(TNotas(Collection).ACBrDPS) do
  begin
//    FDPS.Ide.modelo := 63;
    FDPS.Versao := VersaoDPSToDbl(Configuracoes.Geral.VersaoDF);

//    FDPS.Ide.tpDPS := tbNormal;
    FDPS.infDPS.verAplic := 'ACBrDPS';
    FDPS.infDPS.tpAmb := Configuracoes.WebServices.Ambiente;
//    FDPS.Ide.tpEmis := Configuracoes.Geral.FormaEmissao;
  end;
end;

destructor Nota.Destroy;
begin
  FDPSW.Free;
  FDPSR.Free;
  FDPS.Free;

  inherited Destroy;
end;

procedure Nota.Imprimir;
begin
  with TACBrDPS(TNotas(Collection).ACBrDPS) do
  begin
    if not Assigned(DADPS) then
      raise EACBrDPSException.Create('Componente DADPS não associado.')
    else
      DADPS.ImprimirDADPS(DPS);
  end;
end;

procedure Nota.ImprimirPDF;
begin
  with TACBrDPS(TNotas(Collection).ACBrDPS) do
  begin
    if not Assigned(DADPS) then
      raise EACBrDPSException.Create('Componente DADPS não associado.')
    else
      DADPS.ImprimirDADPSPDF(DPS);
  end;
end;

procedure Nota.Assinar;
var
  XMLStr: String;
  XMLUTF8: AnsiString;
  Leitor: TLeitor;
begin
  with TACBrDPS(TNotas(Collection).ACBrDPS) do
  begin
    if not Assigned(SSL.AntesDeAssinar) then
      SSL.ValidarCNPJCertificado( DPS.infDPS.prest.CNPJCPF );
  end;

  // Gera novamente, para processar propriedades que podem ter sido modificadas
  XMLStr := GerarXML;

  // XML já deve estar em UTF8, para poder ser assinado //
  XMLUTF8 := ConverteXMLtoUTF8(XMLStr);

  with TACBrDPS(TNotas(Collection).ACBrDPS) do
  begin
    FXMLAssinado := SSL.Assinar(String(XMLUTF8), 'DPS', 'infDPS');
    // SSL.Assinar() sempre responde em UTF8...
    FXMLOriginal := FXMLAssinado;

    Leitor := TLeitor.Create;
    try
      leitor.Grupo := FXMLAssinado;
      DPS.signature.URI := Leitor.rAtributo('Reference URI=');
      DPS.signature.DigestValue := Leitor.rCampo(tcStr, 'DigestValue');
      DPS.signature.SignatureValue := Leitor.rCampo(tcStr, 'SignatureValue');
      DPS.signature.X509Certificate := Leitor.rCampo(tcStr, 'X509Certificate');
    finally
      Leitor.Free;
    end;

    with TACBrDPS(TNotas(Collection).ACBrDPS) do
    begin
      GerarXML;
    end;

    if Configuracoes.Arquivos.Salvar and
       (not Configuracoes.Arquivos.SalvarApenasDPSProcessadas) then
    begin
      if NaoEstaVazio(NomeArq) then
        Gravar(NomeArq, FXMLAssinado)
      else
        Gravar(CalcularNomeArquivoCompleto(), FXMLAssinado);
    end;
  end;
end;

procedure Nota.Validar;
var
  Erro, AXML, DeclaracaoXML: String;
  NotaEhValida: Boolean;
  ALayout: TLayOutDPS;
  VerServ: Real;
begin
  AXML := FXMLAssinado;
  if AXML = '' then
    AXML := XMLOriginal;

  with TACBrDPS(TNotas(Collection).ACBrDPS) do
  begin
    VerServ := FDPS.versao;
    ALayout := LayDPSRecepcao;

    // Extraindo apenas os dados da DPS (sem DPSProc)
    DeclaracaoXML := ObtemDeclaracaoXML(AXML);
    AXML := DeclaracaoXML + '<DPS versao' +
            RetornarConteudoEntre(AXML, '<DPS versao', '</DPS>') +
            '</DPS>';

    NotaEhValida := SSL.Validar(AXML, GerarNomeArqSchema(ALayout, VerServ), Erro);

    if not NotaEhValida then
    begin
      FErroValidacao := ACBrStr('Falha na validação dos dados do Nota: ') +
        IntToStr(DPS.infDPS.nDPS) + sLineBreak + FAlertas ;
      FErroValidacaoCompleto := FErroValidacao + sLineBreak + Erro;

      raise EACBrDPSException.CreateDef(
        IfThen(Configuracoes.Geral.ExibirErroSchema, ErroValidacaoCompleto,
        ErroValidacao));
    end;
  end;
end;

function Nota.VerificarAssinatura: Boolean;
var
  Erro, AXML, DeclaracaoXML: String;
  AssEhValida: Boolean;
begin
  AXML := FXMLAssinado;
  if AXML = '' then
    AXML := XMLOriginal;

  with TACBrDPS(TNotas(Collection).ACBrDPS) do
  begin
    // Extraindo apenas os dados do DPS (sem DPSProc)
    DeclaracaoXML := ObtemDeclaracaoXML(AXML);
    AXML := DeclaracaoXML + '<DPS versao' +
            RetornarConteudoEntre(AXML, '<DPS versao', '</DPS>') +
            '</DPS>';

    AssEhValida := SSL.VerificarAssinatura(AXML, Erro, 'infDPS');

    if not AssEhValida then
    begin
      FErroValidacao := ACBrStr('Falha na validação da assinatura do Nota: ') +
        IntToStr(DPS.infDPS.nDPS) + sLineBreak + Erro;
    end;
  end;

  Result := AssEhValida;
end;

function Nota.ValidarRegrasdeNegocios: Boolean;
var
  Erros: String;
  I: Integer;
  Agora: TDateTime;

  procedure GravaLog(AString: String);
  begin
    //DEBUG
   // Log := Log + FormatDateTime('hh:nn:ss:zzz', Now) + ' - ' + AString + sLineBreak;
  end;

  procedure AdicionaErro(const Erro: String);
  begin
    Erros := Erros + Erro + sLineBreak;
  end;

begin
  Agora := Now;
  GravaLog('Inicio da Validação');

  with TACBrDPS(TNotas(Collection).ACBrDPS) do
  begin
    Erros := '';
    (*
    GravaLog('Validar: 701-versão');
    if DPS.infDPS.Versao < 1.00 then
      AdicionaErro('701-Rejeição: Versão inválida');

    for I:=0 to DPS.autXML.Count-1 do
    begin
      GravaLog('Validar: 325-' + IntToStr(I) + '-CPF download');
      if (Length(Trim(OnlyNumber(DPS.autXML[I].CNPJCPF))) <= 11) and
        not ValidarCPF(DPS.autXML[I].CNPJCPF) then
        AdicionaErro('325-Rejeição: CPF autorizado para download inválido');

      GravaLog('Validar: 323-' + IntToStr(I) + '-CNPJ download');
      if (Length(Trim(OnlyNumber(DPS.autXML[I].CNPJCPF))) > 11) and
        not ValidarCNPJ(DPS.autXML[I].CNPJCPF) then
        AdicionaErro('323-Rejeição: CNPJ autorizado para download inválido');
    end;
    *)
  end;

  Result := EstaVazio(Erros);

  if not Result then
  begin
    Erros := ACBrStr('Erro(s) nas Regras de negócios do Nota: ' +
                     IntToStr(DPS.infDPS.nDPS) + sLineBreak + Erros);
  end;

  GravaLog('Fim da Validação. Tempo: ' +
           FormatDateTime('hh:nn:ss:zzz', Now - Agora) + sLineBreak +
           'Erros:' + Erros);

  FErroRegrasdeNegocios := Erros;
end;

function Nota.LerXML(AXML: String): Boolean;
var
  XMLStr: String;
begin
  XMLOriginal := AXML;  // SetXMLOriginal() irá verificar se AXML está em UTF8

  { Verifica se precisa converter "AXML" de UTF8 para a String nativa da IDE.
    Isso é necessário, para que as propriedades fiquem com a acentuação correta }
  XMLStr := ParseText(AXML, True, XmlEhUTF8(AXML));

  FDPSR.Leitor.Arquivo := XMLStr;
  FDPSR.LerXml;

  Result := True;
end;

function Nota.GravarXML(NomeArquivo: String; PathArquivo: String): Boolean;
begin
  if EstaVazio(FXMLOriginal) then
    GerarXML;

  FNomeArq := CalcularNomeArquivoCompleto(NomeArquivo, PathArquivo);

  Result := TACBrDPS(TNotas(Collection).ACBrDPS).Gravar(FNomeArq, FXMLOriginal);
end;

function Nota.GravarTXT(NomeArquivo: String; PathArquivo: String): Boolean;
var
  ATXT: String;
begin
  FNomeArq := CalcularNomeArquivoCompleto(NomeArquivo, PathArquivo);
  ATXT := GerarTXT;
  Result := TACBrDPS(TNotas(Collection).ACBrDPS).Gravar(
    ChangeFileExt(FNomeArq, '.txt'), ATXT);
end;

function Nota.GravarStream(AStream: TStream): Boolean;
begin
  if EstaVazio(FXMLOriginal) then
    GerarXML;

  AStream.Size := 0;
  WriteStrToStream(AStream, AnsiString(FXMLOriginal));
  Result := True;
end;

procedure Nota.EnviarEmail(sPara, sAssunto: String; sMensagem: TStrings;
  EnviaPDF: Boolean; sCC: TStrings; Anexos: TStrings; sReplyTo: TStrings);
var
  NomeArq : String;
  AnexosEmail:TStrings;
  StreamDPS : TMemoryStream;
begin
  if not Assigned(TACBrDPS(TNotas(Collection).ACBrDPS).MAIL) then
    raise EACBrDPSException.Create('Componente ACBrMail não associado');

  AnexosEmail := TStringList.Create;
  StreamDPS := TMemoryStream.Create;
  try
    AnexosEmail.Clear;
    if Assigned(Anexos) then
      AnexosEmail.Assign(Anexos);

    with TACBrDPS(TNotas(Collection).ACBrDPS) do
    begin
      GravarStream(StreamDPS);

      if (EnviaPDF) then
      begin
        if Assigned(DADPS) then
        begin
          DADPS.ImprimirDADPSPDF(FDPS);
          NomeArq := PathWithDelim(DADPS.PathPDF) + NumID + '-DPS.pdf';
          AnexosEmail.Add(NomeArq);
        end;
      end;

      EnviarEmail( sPara, sAssunto, sMensagem, sCC, AnexosEmail, StreamDPS,
                   NumID + '-DPS.xml', sReplyTo);
    end;
  finally
    AnexosEmail.Free;
    StreamDPS.Free;
  end;
end;

function Nota.GerarXML: String;
var
  IdAnterior : String;
begin
  with TACBrDPS(TNotas(Collection).ACBrDPS) do
  begin
    IdAnterior := DPS.infDPS.ID;
    FDPSW.Gerador.Opcoes.FormatoAlerta  := Configuracoes.Geral.FormatoAlerta;
    FDPSW.Gerador.Opcoes.RetirarAcentos := Configuracoes.Geral.RetirarAcentos;
    FDPSW.Gerador.Opcoes.RetirarEspacos := Configuracoes.Geral.RetirarEspacos;
    FDPSW.Gerador.Opcoes.IdentarXML     := Configuracoes.Geral.IdentarXML;
//    FDPSW.Opcoes.NormatizarMunicipios   := Configuracoes.Arquivos.NormatizarMunicipios;
//    FDPSW.Opcoes.PathArquivoMunicipios  := Configuracoes.Arquivos.PathArquivoMunicipios;
    pcnAuxiliar.TimeZoneConf.Assign( Configuracoes.WebServices.TimeZoneConf );
  end;

  FDPSW.Opcoes.GerarTXTSimultaneamente := False;

  FDPSW.GerarXml;
  //DEBUG
  //WriteToTXT('c:\temp\Nota.xml', FDPSW.Gerador.ArquivoFormatoXML, False, False);

  XMLOriginal := FDPSW.Gerador.ArquivoFormatoXML;  // SetXMLOriginal() irá converter para UTF8

  { XML gerado pode ter nova Chave e ID, então devemos calcular novamente o
    nome do arquivo, mantendo o PATH do arquivo carregado }
  if (NaoEstaVazio(FNomeArq) and (IdAnterior <> FDPS.infDPS.ID)) then
    FNomeArq := CalcularNomeArquivoCompleto('', ExtractFilePath(FNomeArq));

  FAlertas := ACBrStr( FDPSW.Gerador.ListaDeAlertas.Text );
  Result := FXMLOriginal;
end;

function Nota.GerarTXT: String;
var
  IdAnterior : String;
begin
  with TACBrDPS(TNotas(Collection).ACBrDPS) do
  begin
    IdAnterior := DPS.infDPS.ID;
    FDPSW.Gerador.Opcoes.FormatoAlerta  := Configuracoes.Geral.FormatoAlerta;
    FDPSW.Gerador.Opcoes.RetirarAcentos := Configuracoes.Geral.RetirarAcentos;
    FDPSW.Gerador.Opcoes.RetirarEspacos := Configuracoes.Geral.RetirarEspacos;
    FDPSW.Gerador.Opcoes.IdentarXML     := Configuracoes.Geral.IdentarXML;
//    FDPSW.Opcoes.NormatizarMunicipios   := Configuracoes.Arquivos.NormatizarMunicipios;
//    FDPSW.Opcoes.PathArquivoMunicipios  := Configuracoes.Arquivos.PathArquivoMunicipios;
  end;

  FDPSW.Opcoes.GerarTXTSimultaneamente := True;

  FDPSW.GerarXml;
  XMLOriginal := FDPSW.Gerador.ArquivoFormatoXML;

  // XML gerado pode ter nova Chave e ID, então devemos calcular novamente o
  // nome do arquivo, mantendo o PATH do arquivo carregado
  if (NaoEstaVazio(FNomeArq) and (IdAnterior <> FDPS.infDPS.ID)) then
    FNomeArq := CalcularNomeArquivoCompleto('', ExtractFilePath(FNomeArq));

  FAlertas := FDPSW.Gerador.ListaDeAlertas.Text;
  Result := FDPSW.Gerador.ArquivoFormatoTXT;
end;

function Nota.CalcularNomeArquivo: String;
var
  xID: String;
  NomeXML: String;
begin
  xID := Self.NumID;

  if EstaVazio(xID) then
    raise EACBrDPSException.Create('ID Inválido. Impossível Salvar XML');

  NomeXML := '-DPS.xml';

  Result := xID + NomeXML;
end;

function Nota.CalcularPathArquivo: String;
var
  Data: TDateTime;
begin
  with TACBrDPS(TNotas(Collection).ACBrDPS) do
  begin
    if Configuracoes.Arquivos.EmissaoPathDPS then
      Data := FDPS.infDPS.dhEmi
    else
      Data := Now;

    Result := PathWithDelim(Configuracoes.Arquivos.GetPathDPS(Data, FDPS.infDPS.prest.CNPJCPF));
  end;
end;

function Nota.CalcularNomeArquivoCompleto(NomeArquivo: String;
  PathArquivo: String): String;
var
  PathNoArquivo: String;
begin
  if EstaVazio(NomeArquivo) then
    NomeArquivo := CalcularNomeArquivo;

  PathNoArquivo := ExtractFilePath(NomeArquivo);
  if EstaVazio(PathNoArquivo) then
  begin
    if EstaVazio(PathArquivo) then
      PathArquivo := CalcularPathArquivo
    else
      PathArquivo := PathWithDelim(PathArquivo);
  end
  else
    PathArquivo := '';

  Result := PathArquivo + NomeArquivo;
end;

function Nota.ValidarConcatChave: Boolean;
var
  chaveDPS: String;
begin
  chaveDPS := OnlyNumber(DPS.infDPS.ID);

  Result := not
    ((Copy(chaveDPS, 01, 07) <> IntToStrZero(DPS.infDPS.prest.enderNac.cMun, 7)) or
     (Copy(chaveDPS, 09, 14) <> PadLeft(OnlyNumber(DPS.infDPS.prest.CNPJCPF), 14, '0')) or
     (Copy(chaveDPS, 23, 05) <> IntToStrZero(DPS.infDPS.serie, 5)) or
     (Copy(chaveDPS, 29, 15) <> IntToStrZero(DPS.infDPS.nDPS, 15)));
end;

function Nota.GetConfirmada: Boolean;
begin
  Result := True;
//  Result := TACBrDPS(TNotas(Collection).ACBrDPS).CstatConfirmada(
//    FDPS.procDPS.cStat);
end;

function Nota.GetcStat: Integer;
begin
  Result := 100;
//  Result := FDPS.procDPS.cStat;
end;

function Nota.GetProcessada: Boolean;
begin
  Result := True;
//  Result := TACBrDPS(TNotas(Collection).ACBrDPS).CstatProcessado(
//    FDPS.procDPS.cStat);
end;

function Nota.GetCancelada: Boolean;
begin
  result := False;
//  Result := TACBrDPS(TNotas(Collection).ACBrDPS).CstatCancelada(
//    FDPS.procDPS.cStat);
end;

function Nota.GetMsg: String;
begin
  Result := '';
//  Result := FDPS.procDPS.xMotivo;
end;

function Nota.GetNumID: String;
begin
  Result := OnlyNumber(DPS.infDPS.ID);
end;

function Nota.GetXMLAssinado: String;
begin
  if EstaVazio(FXMLAssinado) then
    Assinar;

  Result := FXMLAssinado;
end;

procedure Nota.SetXML(AValue: String);
begin
  LerXML(AValue);
end;

procedure Nota.SetXMLOriginal(AValue: String);
var
  XMLUTF8: String;
begin
  { Garante que o XML informado está em UTF8, se ele realmente estiver, nada
    será modificado por "ConverteXMLtoUTF8"  (mantendo-o "original") }
  XMLUTF8 := ConverteXMLtoUTF8(AValue);

  FXMLOriginal := XMLUTF8;

  if XmlEstaAssinado(FXMLOriginal) then
    FXMLAssinado := FXMLOriginal
  else
    FXMLAssinado := '';
end;

function Nota.LerArqIni(const AIniString: String): Boolean;
var
  INIRec: TMemIniFile;
  sSecao, versao, sFim: String;
  OK: Boolean;
  I: Integer;
begin
  Result := False;

  INIRec := TMemIniFile.Create('');
  try
    LerIniArquivoOuString(AIniString, INIRec);

    with FDPS do
    begin
    (*
      infDPS.versao := StringToFloatDef(INIRec.ReadString('infDPS', 'versao', VersaoDPSToStr(FConfiguracoes.Geral.VersaoDF)),0);

      versao := FloatToString(infDPS.versao, '.', '#0.00');
      FConfiguracoes.Geral.VersaoDF := StrToVersaoDPS(OK, versao);

      Ide.tpAmb   := StrToTpAmb(OK, INIRec.ReadString( 'ide', 'tpAmb', TpAmbToStr(FConfiguracoes.WebServices.Ambiente)));
      Ide.modelo  := INIRec.ReadInteger('ide', 'mod', 63);
      Ide.serie   := INIRec.ReadInteger('ide', 'serie', 1);
      Ide.nBP     := INIRec.ReadInteger('ide', 'nBP', 0);
      Ide.cBP     := INIRec.ReadInteger('ide', 'cBP', 0);
      Ide.modal   := StrToModalDPS(OK, INIRec.ReadString('ide', 'modal', '1'));
      Ide.dhEmi   := StringToDateTime(INIRec.ReadString('ide', 'dhEmi', '0'));
      Ide.tpEmis  := StrToTpEmis(OK, INIRec.ReadString('ide', 'tpEmis', IntToStr(FConfiguracoes.Geral.FormaEmissaoCodigo)));
      Ide.verProc := INIRec.ReadString('ide', 'verProc', 'ACBrDPS');
      Ide.tpDPS   := StrTotpDPS(OK,INIRec.ReadString('ide', 'tpDPS', '0'));
      Ide.indPres := StrToPresencaComprador(OK, INIRec.ReadString('ide', 'indPres', '1'));
      Ide.UFIni   := INIRec.ReadString('ide', 'UFIni', '');
      Ide.cMunIni := INIRec.ReadInteger('ide', 'cMunIni', 0);
      Ide.UFFim   := INIRec.ReadString('ide', 'UFFim', '');
      Ide.cMunFim := INIRec.ReadInteger('ide', 'cMunFim', 0);
      Ide.dhCont  := StringToDateTime(INIRec.ReadString('ide', 'dhCont', '0'));
      Ide.xJust   := INIRec.ReadString('ide', 'xJust', '');

      //
      // Seção [emit] Emitente do BP-e
      //
      Emit.CNPJ  := INIRec.ReadString('emit', 'CNPJ', '');
      Emit.IE    := INIRec.ReadString('emit', 'IE', '');
      Emit.IEST  := INIRec.ReadString('emit', 'IEST', '');
      Emit.xNome := INIRec.ReadString('emit', 'xNome', '');
      Emit.xFant := INIRec.ReadString('emit', 'xFant', '');
      Emit.IM    := INIRec.ReadString('emit', 'IM', '');
      Emit.CNAE  := INIRec.ReadString('emit', 'CNAE', '');
      Emit.CRT   := StrToCRT(ok, INIRec.ReadString('emit', 'CRT', '3'));
      Emit.TAR   := INIRec.ReadString('emit', 'TAR', '');

      Emit.enderEmit.xLgr    := INIRec.ReadString('emit', 'xLgr', '');
      Emit.enderEmit.nro     := INIRec.ReadString('emit', 'nro', '');
      Emit.enderEmit.xCpl    := INIRec.ReadString('emit', 'xCpl', '');
      Emit.enderEmit.xBairro := INIRec.ReadString('emit', 'xBairro', '');
      Emit.enderEmit.cMun    := INIRec.ReadInteger('emit', 'cMun', 0);
      Emit.enderEmit.xMun    := INIRec.ReadString('emit', 'xMun', '');
      Emit.enderEmit.CEP     := INIRec.ReadInteger('emit', 'CEP', 0);
      Emit.enderEmit.UF      := INIRec.ReadString('emit', 'UF', '');
      Emit.enderEmit.fone    := INIRec.ReadString('emit', 'fone', '');
      Emit.enderEmit.Email   := INIRec.ReadString('emit', 'Email', '');

      ide.cUF := INIRec.ReadInteger('ide', 'cUF', UFparaCodigo(Emit.enderEmit.UF));

      //
      // Seção [comp] Comprador
      //
      Comp.xNome         := INIRec.ReadString('comp', 'xNome', '');
      Comp.CNPJCPF       := INIRec.ReadString('comp', 'CNPJCPF', '');
      Comp.idEstrangeiro := INIRec.ReadString('comp', 'idEstrangeiro', '');
      Comp.IE            := INIRec.ReadString('comp', 'IE', '');

      Comp.enderComp.xLgr    := INIRec.ReadString('comp', 'xLgr', '');
      Comp.enderComp.nro     := INIRec.ReadString('comp', 'nro', '');
      Comp.enderComp.xCpl    := INIRec.ReadString('comp', 'xCpl', '');
      Comp.enderComp.xBairro := INIRec.ReadString('comp', 'xBairro', '');
      Comp.enderComp.cMun    := INIRec.ReadInteger('comp', 'cMun', 0);
      Comp.enderComp.xMun    := INIRec.ReadString('comp', 'xMun', '');
      Comp.enderComp.CEP     := INIRec.ReadInteger('comp', 'CEP', 0);
      Comp.enderComp.UF      := INIRec.ReadString('comp', 'UF', '');
      Comp.EnderComp.cPais   := INIRec.ReadInteger('comp', 'cPais', 1058);
      Comp.EnderComp.xPais   := INIRec.ReadString('comp', 'xPais', 'BRASIL');
      Comp.enderComp.fone    := INIRec.ReadString('comp', 'fone', '');
      Comp.enderComp.Email   := INIRec.ReadString('comp', 'Email', '');

      //
      // Seção [Agencia] Agência que comercializou o BP-e
      //
      Agencia.xNome := INIRec.ReadString('Agencia', 'xNome', '');
      Agencia.CNPJ  := INIRec.ReadString('Agencia', 'CNPJ', '');

      Agencia.enderAgencia.xLgr    := INIRec.ReadString('Agencia', 'xLgr', '');
      Agencia.enderAgencia.nro     := INIRec.ReadString('Agencia', 'nro', '');
      Agencia.enderAgencia.xCpl    := INIRec.ReadString('Agencia', 'xCpl', '');
      Agencia.enderAgencia.xBairro := INIRec.ReadString('Agencia', 'xBairro', '');
      Agencia.enderAgencia.cMun    := INIRec.ReadInteger('Agencia', 'cMun', 0);
      Agencia.enderAgencia.xMun    := INIRec.ReadString('Agencia', 'xMun', '');
      Agencia.enderAgencia.CEP     := INIRec.ReadInteger('Agencia', 'CEP', 0);
      Agencia.enderAgencia.UF      := INIRec.ReadString('Agencia', 'UF', '');
      Agencia.enderAgencia.fone    := INIRec.ReadString('Agencia', 'fone', '');
      Agencia.enderAgencia.Email   := INIRec.ReadString('Agencia', 'Email', '');

      //
      // Seção [infDPSSub] Informações do BP-e Substituido
      //
      if INIRec.ReadString('infDPSSub', 'chDPS', '') <> '' then
      begin
        with infDPSSub do
        begin
          chDPS := INIRec.ReadString('infDPSSub', 'chDPS', '');
          tpSub := StrTotpSubstituicao(OK, INIRec.ReadString('infDPSSub', 'tpSub', '1'));
        end;
      end;

      //
      // Seção [infPassagem] Informações da Passagem
      //
      infPassagem.cLocOrig   := INIRec.ReadString('infPassagem', 'cLocOrig', '');
      infPassagem.xLocOrig   := INIRec.ReadString('infPassagem', 'xLocOrig', '');
      infPassagem.cLocDest   := INIRec.ReadString('infPassagem', 'cLocDest', '');
      infPassagem.xLocDest   := INIRec.ReadString('infPassagem', 'xLocDest', '');
      infPassagem.dhEmb      := StringToDateTime(INIRec.ReadString('infPassagem', 'dhEmb', '0'));
      infPassagem.dhValidade := StringToDateTime(INIRec.ReadString('infPassagem', 'dhValidade', '0'));

      //
      // Seção [infPassageiro] Informações do Passageiro
      //
      infPassagem.infPassageiro.xNome := INIRec.ReadString('infPassageiro', 'xNome', '');
      infPassagem.infPassageiro.CPF   := INIRec.ReadString('infPassageiro', 'CPF', '');
      infPassagem.infPassageiro.tpDoc := StrTotpDocumento(Ok, INIRec.ReadString('infPassageiro', 'tpDoc', '1'));
      infPassagem.infPassageiro.nDoc  := INIRec.ReadString('infPassageiro', 'nDoc', '');
      infPassagem.infPassageiro.dNasc := StringToDateTime(INIRec.ReadString('infPassageiro', 'dNasc', '0'));
      infPassagem.infPassageiro.fone  := INIRec.ReadString('infPassageiro', 'fone', '');
      infPassagem.infPassageiro.Email := INIRec.ReadString('infPassageiro', 'Email', '');

      //
      // Seção [infViagemxxx] Informações da Viagem
      //
      I := 1;
      while true do
      begin
        sSecao := 'infViagem' + IntToStrZero(I, 3);
        sFim   := INIRec.ReadString(sSecao, 'cPercurso', 'FIM');
        if (sFim = 'FIM') or (Length(sFim) <= 0) then
          break;

        with infViagem.Add do
        begin
          cPercurso    := sFim;
          xPercurso    := INIRec.ReadString(sSecao, 'xPercurso', '');
          tpViagem     := StrTotpViagem(Ok, INIRec.ReadString(sSecao, 'tpViagem', '00'));
          tpServ       := StrTotpServico(Ok, INIRec.ReadString(sSecao, 'tpServ', '1'));
          tpAcomodacao := StrTotpAcomodacao(Ok, INIRec.ReadString(sSecao, 'tpAcomodacao', '1'));
          tpTrecho     := StrTotpTrecho(Ok, INIRec.ReadString(sSecao, 'tpTrecho', '1'));
          dhViagem     := StringToDateTime(INIRec.ReadString(sSecao, 'dhViagem', '0'));
          dhConexao    := StringToDateTime(INIRec.ReadString(sSecao, 'dhConexao', '0'));
          Prefixo      := INIRec.ReadString(sSecao, 'Prefixo', '');
          Poltrona     := INIRec.ReadInteger(sSecao, 'Poltrona', 0);
          Plataforma   := INIRec.ReadString(sSecao, 'Plataforma', '');

          //
          // Informações da Travessia
          //
          if INIRec.ReadString(sSecao, 'tpVeiculo', '') <> '' then
          begin
            with infTravessia do
            begin
              tpVeiculo  := StrTotpVeiculo(Ok, INIRec.ReadString(sSecao, 'tpVeiculo', '01'));
              sitVeiculo := StrToSitVeiculo(Ok, INIRec.ReadString(sSecao, 'sitVeiculo', '01'));
            end;
          end;
        end;

        Inc(I);
      end;

      //
      // Seção [infValorDPS] Informações dos Valores do BP-e
      //
      infValorDPS.vBP        := StringToFloatDef(INIRec.ReadString('infValorDPS', 'vBP', ''), 0);
      infValorDPS.vDesconto  := StringToFloatDef(INIRec.ReadString('infValorDPS', 'vDesconto', ''), 0);
      infValorDPS.vPgto      := StringToFloatDef(INIRec.ReadString('infValorDPS', 'vPgto', ''), 0);
      infValorDPS.vTroco     := StringToFloatDef(INIRec.ReadString('infValorDPS', 'vTroco', ''), 0);
      infValorDPS.tpDesconto := StrTotpDesconto(Ok, INIRec.ReadString('infValorDPS', 'tpDesconto', '01'));
      infValorDPS.xDesconto  := INIRec.ReadString('infValorDPS', 'xDesconto', '');

      //
      // Seção [Compxxx] Componentes do Valor do DPS
      //
      I := 1;
      while true do
      begin
        sSecao := 'Comp' + IntToStrZero(I, 3);
        sFim   := INIRec.ReadString(sSecao, 'tpComp', 'FIM');
        if (sFim = 'FIM') or (Length(sFim) <= 0) then
          break;

        with infValorDPS.Comp.Add do
        begin
          tpComp := StrTotpComponente(Ok, sFim);
          vComp  := StringToFloatDef(INIRec.ReadString(sSecao, 'vComp', ''), 0);
        end;

        Inc(I);
      end;

      //
      // Seção [ICMS] Informacoes relativas aos Impostos
      //
      with Imp do
      begin
        sSecao := 'ICMS';
        sFim   := INIRec.ReadString(sSecao, 'CST', 'FIM');

        if (sFim <> 'FIM') then
        begin
          with ICMS do
          begin
            CST    := StrToCSTICMS(OK, sFim);
            pRedBC := StringToFloatDef(INIRec.ReadString(sSecao, 'pRedBC', ''), 0);
            vBC    := StringToFloatDef(INIRec.ReadString(sSecao, 'vBC', ''), 0);
            pICMS  := StringToFloatDef(INIRec.ReadString(sSecao, 'pICMS', ''), 0);
            vICMS  := StringToFloatDef(INIRec.ReadString(sSecao, 'vICMS', ''), 0);
            vCred  := StringToFloatDef(INIRec.ReadString(sSecao, 'vCred', ''), 0);

            pRedBCOutraUF := StringToFloatDef(INIRec.ReadString(sSecao, 'pRedBCOutraUF', ''), 0);
            vBCOutraUF    := StringToFloatDef(INIRec.ReadString(sSecao, 'vBCOutraUF', ''), 0);
            pICMSOutraUF  := StringToFloatDef(INIRec.ReadString(sSecao, 'pICMSOutraUF', ''), 0);
            vICMSOutraUF  := StringToFloatDef(INIRec.ReadString(sSecao, 'vICMSOutraUF', ''), 0);
          end;

          vTotTrib   := StringToFloatDef(INIRec.ReadString(sSecao, 'vTotTrib', ''), 0);
          infAdFisco := INIRec.ReadString(sSecao, 'infAdFisco', '');
        end;

        if StringToFloatDef(INIRec.ReadString('ICMSUFFim', 'pICMSInterPart', ''), 0) <> 0 then
        begin
          ICMSUFFim.vBCUFFim       := StringToFloatDef(INIRec.ReadString('ICMSUFFim', 'vBCUFFim', ''), 0);
          ICMSUFFim.pFCPUFFim      := StringToFloatDef(INIRec.ReadString('ICMSUFFim', 'pFCPUFFim', ''), 0);
          ICMSUFFim.pICMSUFFim     := StringToFloatDef(INIRec.ReadString('ICMSUFFim', 'pICMSUFFim', ''), 0);
          ICMSUFFim.pICMSInter     := StringToFloatDef(INIRec.ReadString('ICMSUFFim', 'pICMSInter', ''), 0);
          ICMSUFFim.pICMSInterPart := StringToFloatDef(INIRec.ReadString('ICMSUFFim', 'pICMSInterPart', ''), 0);
          ICMSUFFim.vFCPUFFim      := StringToFloatDef(INIRec.ReadString('ICMSUFFim', 'vFCPUFFim', ''), 0);
          ICMSUFFim.vICMSUFFim     := StringToFloatDef(INIRec.ReadString('ICMSUFFim', 'vICMSUFFim', ''), 0);
          ICMSUFFim.vICMSUFIni     := StringToFloatDef(INIRec.ReadString('ICMSUFFim', 'vICMSUFIni', ''), 0);
        end;
      end;

      //
      // Seção [Pagxx] Dados do Pagamento 01-10
      //
      I := 1 ;
      while true do
      begin
        sSecao := 'pag'+IntToStrZero(I,2) ;
        sFim   := INIRec.ReadString(sSecao, 'tpag', 'FIM');
        if (sFim = 'FIM') or (Length(sFim) <= 0) then
          break ;

        with pag.Add do
        begin
          tPag  := StrToFormaPagamento(OK, sFim);
          xPag  := INIRec.ReadString(sSecao, 'xPag', '');
          vPag  := StringToFloatDef(INIRec.ReadString(sSecao, 'vPag', ''), 0);

          tpIntegra := StrTotpIntegra(OK,INIRec.ReadString(sSecao, 'tpIntegra', ''));
          CNPJ      := INIRec.ReadString(sSecao, 'CNPJ', '');
          tBand     := StrToBandeiraCartao(OK, INIRec.ReadString(sSecao, 'tBand', '99'));
          xBand     := INIRec.ReadString(sSecao, 'xBand', '');
          cAut      := INIRec.ReadString(sSecao, 'cAut', '');
          nsuTrans  := INIRec.ReadString(sSecao, 'nsuTrans', '');
          nsuHost   := INIRec.ReadString(sSecao, 'nsuHost', '');
          nParcelas := INIRec.ReadInteger(sSecao, 'nParcelas', 1);
        end;

        Inc(I);
      end;

      //
      // Seção [auxXMLxx] Autorizados para Download do XML do DPS 01-10
      //
      I := 1 ;
      while true do
      begin
        sSecao := 'autXML' + IntToStrZero(I,2) ;
        sFim   := OnlyNumber(INIRec.ReadString(sSecao, 'CNPJCPF', 'FIM'));
        if (sFim = 'FIM') or (Length(sFim) <= 0) then
          break ;

        with autXML.Add do
          CNPJCPF := sFim;

        Inc(I);
      end;

      //
      // Seção [infAdic] Informações Adicionais
      //
      InfAdic.infAdFisco := INIRec.ReadString('infAdic','infAdFisco', '');
      InfAdic.infCpl     := INIRec.ReadString('infAdic','infCpl', '');
    *)
    end;

    GerarXML;

    Result := True;
  finally
     INIRec.Free;
  end;
end;

{ TNotas }

constructor TNotas.Create(AOwner: TPersistent; ItemClass: TCollectionItemClass);
begin
  if not (AOwner is TACBrDPS) then
    raise EACBrDPSException.Create('AOwner deve ser do tipo TACBrDPS');

  inherited;

  FACBrDPS := TACBrDPS(AOwner);
  FConfiguracoes := TACBrDPS(FACBrDPS).Configuracoes;
end;


function TNotas.Add: Nota;
begin
  Result := Nota(inherited Add);
end;

procedure TNotas.Assinar;
var
  i: integer;
begin
  for i := 0 to Self.Count - 1 do
    Self.Items[i].Assinar;
end;

procedure TNotas.GerarDPS;
var
  i: integer;
begin
  for i := 0 to Self.Count - 1 do
    Self.Items[i].GerarXML;
end;

function TNotas.GetItem(Index: integer): Nota;
begin
  Result := Nota(inherited Items[Index]);
end;

function TNotas.GetNamePath: String;
begin
  Result := 'Nota';
end;

procedure TNotas.VerificarDADPS;
begin
  if not Assigned(TACBrDPS(FACBrDPS).DADPS) then
    raise EACBrDPSException.Create('Componente DADPS não associado.');
end;

procedure TNotas.Imprimir;
begin
  VerificarDADPS;
  TACBrDPS(FACBrDPS).DADPS.ImprimirDADPS(nil);
end;

procedure TNotas.ImprimirCancelado;
begin
  VerificarDADPS;
  TACBrDPS(FACBrDPS).DADPS.ImprimirDADPSCancelado(nil);
end;

procedure TNotas.ImprimirResumido;
begin
  VerificarDADPS;
  TACBrDPS(FACBrDPS).DADPS.ImprimirDADPSResumido(nil);
end;

procedure TNotas.ImprimirPDF;
begin
  VerificarDADPS;
  TACBrDPS(FACBrDPS).DADPS.ImprimirDADPSPDF(nil);
end;

procedure TNotas.ImprimirResumidoPDF;
begin
  VerificarDADPS;
  TACBrDPS(FACBrDPS).DADPS.ImprimirDADPSResumidoPDF(nil);
end;

function TNotas.Insert(Index: integer): Nota;
begin
  Result := Nota(inherited Insert(Index));
end;

procedure TNotas.SetItem(Index: integer; const Value: Nota);
begin
  Items[Index].Assign(Value);
end;

procedure TNotas.Validar;
var
  i: integer;
begin
  for i := 0 to Self.Count - 1 do
    Self.Items[i].Validar;   // Dispara exception em caso de erro
end;

function TNotas.VerificarAssinatura(out Erros: String): Boolean;
var
  i: integer;
begin
  Result := True;
  Erros := '';

  if Self.Count < 1 then
  begin
    Erros := 'Nenhum DPS carregado';
    Result := False;
    Exit;
  end;

  for i := 0 to Self.Count - 1 do
  begin
    if not Self.Items[i].VerificarAssinatura then
    begin
      Result := False;
      Erros := Erros + Self.Items[i].ErroValidacao + sLineBreak;
    end;
  end;
end;

function TNotas.ValidarRegrasdeNegocios(out Erros: String): Boolean;
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

function TNotas.LoadFromFile(CaminhoArquivo: String;
  AGerarDPS: Boolean): Boolean;
var
  XMLUTF8: AnsiString;
  i, l: integer;
  MS: TMemoryStream;
begin
  MS := TMemoryStream.Create;
  try
    MS.LoadFromFile(CaminhoArquivo);
    XMLUTF8 := ReadStrFromStream(MS, MS.Size);
  finally
    MS.Free;
  end;

  l := Self.Count; // Indice da última Nota já existente
  Result := LoadFromString(String(XMLUTF8), AGerarDPS);

  if Result then
  begin
    // Atribui Nome do arquivo a novas Notas inseridas //
    for i := l to Self.Count - 1 do
      Self.Items[i].NomeArq := CaminhoArquivo;
  end;
end;

function TNotas.LoadFromStream(AStream: TStringStream;
  AGerarDPS: Boolean): Boolean;
var
  AXML: AnsiString;
begin
  AStream.Position := 0;
  AXML := ReadStrFromStream(AStream, AStream.Size);

  Result := Self.LoadFromString(String(AXML), AGerarDPS);
end;

function TNotas.LoadFromString(AXMLString: String;
  AGerarDPS: Boolean): Boolean;
var
  ADPSXML, XMLStr: AnsiString;
  P, N: integer;

  function PosDPS: integer;
  begin
    Result := pos('</DPS>', XMLStr);
  end;

begin
  // Verifica se precisa Converter de UTF8 para a String nativa da IDE //
  XMLStr := ConverteXMLtoNativeString(AXMLString);

  N := PosDPS;
  while N > 0 do
  begin
    P := pos('</DPSProc>', XMLStr);

    if P <= 0 then
      P := pos('</procDPS>', XMLStr);  // DPS obtida pelo Portal da Receita

    if P > 0 then
    begin
      ADPSXML := copy(XMLStr, 1, P + 10);
      XMLStr := Trim(copy(XMLStr, P + 10, length(XMLStr)));
    end
    else
    begin
      ADPSXML := copy(XMLStr, 1, N + 6);
      XMLStr := Trim(copy(XMLStr, N + 6, length(XMLStr)));
    end;

    with Self.Add do
    begin
      LerXML(ADPSXML);

      if AGerarDPS then // Recalcula o XML
        GerarXML;
    end;

    N := PosDPS;
  end;

  Result := Self.Count > 0;
end;

function TNotas.LoadFromIni(AIniString: String): Boolean;
begin
  with Self.Add do
    LerArqIni(AIniString);

  Result := Self.Count > 0;
end;

function TNotas.GravarXML(PathNomeArquivo: String): Boolean;
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

function TNotas.GravarTXT(PathNomeArquivo: String): Boolean;
var
  SL: TStringList;
  ArqTXT: String;
  I: integer;
begin
  Result := False;
  SL := TStringList.Create;
  try
    SL.Clear;
    for I := 0 to Self.Count - 1 do
    begin
      ArqTXT := Self.Items[I].GerarTXT;
      SL.Add(ArqTXT);
    end;

    if SL.Count > 0 then
    begin
      // Inserindo cabeçalho //
      SL.Insert(0, 'Nota|' + IntToStr(Self.Count));

      // Apagando as linhas em branco //
      i := 0;
      while (i <= SL.Count - 1) do
      begin
        if SL[I] = '' then
          SL.Delete(I)
        else
          Inc(i);
      end;

      if EstaVazio(PathNomeArquivo) then
        PathNomeArquivo := PathWithDelim(
          TACBrDPS(FACBrDPS).Configuracoes.Arquivos.PathSalvar) + 'DPS.TXT';

      SL.SaveToFile(PathNomeArquivo);
      Result := True;
    end;
  finally
    SL.Free;
  end;
end;

end.
