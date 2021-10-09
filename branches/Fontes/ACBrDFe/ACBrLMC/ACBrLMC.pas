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

unit ACBrLMC;

interface

uses
  Classes, SysUtils,
  ACBrDFe, ACBrDFeConfiguracoes,
  ACBrLMCConfiguracoes, ACBrLMCWebServices, ACBrLMCLivros,
  ACBrDFeException,
  plmcLMC, pcnConversao, plmcConversao,
  ACBrUtil;

const
  ACBRLMC_VERSAO = '2.0.0a';
  ACBRLMC_NAMESPACE = 'http://www.fazenda.pr.gov.br/sefaws';
  ACBRLMC_CErroAmbienteDiferente = 'Ambiente do XML (tpAmb) é diferente do '+
               'configurado no Componente (Configuracoes.WebServices.Ambiente)';

type
  EACBrLMCException = class(EACBrDFeException);

  TACBrLMC = class(TACBrDFe)
  private
    FLivros: TLivros;
    FStatus: TStatusACBrLMC;
    FWebServices: TWebServices;

    function GetConfiguracoes: TConfiguracoesLMC;
    procedure SetConfiguracoes(AValue: TConfiguracoesLMC);
  protected
    function CreateConfiguracoes: TConfiguracoes; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    function GetAbout: String; override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure EnviarEmail(sPara, sAssunto: String;
      sMensagem: TStrings = nil; sCC: TStrings = nil; Anexos: TStrings = nil;
      StreamLMC: TStream = nil; NomeArq: String = ''); override;

    function Enviar(ALote: integer; Imprimir: Boolean = True): Boolean; overload;
    function Enviar(ALote: String; Imprimir: Boolean = True): Boolean; overload;

    function GetNomeModeloDFe: String; override;
    function GetNameSpaceURI: String; override;

    function cStatConfirmado(AValue: integer): Boolean;
    function cStatProcessado(AValue: integer): Boolean;

    function Cancelamento(AJustificativa: WideString; ALote: integer = 0): Boolean;
    function Consultar: Boolean;

    function NomeServicoToNomeSchema(const NomeServico: String): String; override;
    procedure LerServicoDeParams(LayOutServico: TLayOutLMC; var Versao: Double;
      var URL: String); reintroduce; overload;
    function LerVersaoDeParams(LayOutServico: TLayOutLMC): String; reintroduce; overload;

    function IdentificaSchema(const AXML: String): TSchemaLMC;

    function GerarNomeArqSchema(const ALayOut: TLayOutLMC; VersaoServico: Double): String;

    function GerarChaveContingencia(FLMC: TLMC): String;

    property WebServices: TWebServices read FWebServices write FWebServices;
    property Livros: TLivros read FLivros write FLivros;
    property Status: TStatusACBrLMC read FStatus;

    procedure SetStatus(const stNewStatus: TStatusACBrLMC);

  published
    property Configuracoes: TConfiguracoesLMC read GetConfiguracoes write SetConfiguracoes;
  end;

implementation

uses
  strutils, dateutils,
  pcnAuxiliar, synacode;

{$IFDEF FPC}
 {$IFDEF CPU64}
  {$R ACBrLMCServicos.res}  // Dificuldades de compilar Recurso em 64 bits
 {$ELSE}
  {$R ACBrLMCServicos.rc}
 {$ENDIF}
{$ELSE}
 {$R ACBrLMCServicos.res}
{$ENDIF}

{ TACBrLMC }

constructor TACBrLMC.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FLivros := TLivros.Create(Self, Livro);
  FWebServices := TWebServices.Create(Self);
end;

destructor TACBrLMC.Destroy;
begin
  FLivros.Free;
  FWebServices.Free;

  inherited;
end;

procedure TACBrLMC.EnviarEmail(sPara, sAssunto: String; sMensagem: TStrings;
  sCC: TStrings; Anexos: TStrings; StreamLMC: TStream; NomeArq: String);
begin
  SetStatus( stLMCEmail );

  try
    inherited EnviarEmail(sPara, sAssunto, sMensagem, sCC, Anexos, StreamLMC, NomeArq);
  finally
    SetStatus( stLMCIdle );
  end;
end;

procedure TACBrLMC.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  {
  if (Operation = opRemove) and (FDALMC <> nil) and
     (AComponent is TACBrLMCDALMCClass) then
    FDALMC := nil;
 }
end;

function TACBrLMC.GetAbout: String;
begin
  Result := 'ACBrLMC Ver: ' + ACBRLMC_VERSAO;
end;

function TACBrLMC.CreateConfiguracoes: TConfiguracoes;
begin
  Result := TConfiguracoesLMC.Create(Self);
end;

function TACBrLMC.GetNomeModeloDFe: String;
begin
  Result := 'LMC';
end;

function TACBrLMC.GetNameSpaceURI: String;
begin
  Result := ACBRLMC_NAMESPACE;
end;

function TACBrLMC.cStatConfirmado(AValue: integer): Boolean;
begin
  case AValue of
    100, 150: Result := True;
    else
      Result := False;
  end;
end;

function TACBrLMC.cStatProcessado(AValue: integer): Boolean;
begin
  case AValue of
    100, 110, 150, 301, 302: Result := True;
    else
      Result := False;
  end;
end;

function TACBrLMC.IdentificaSchema(const AXML: String): TSchemaLMC;
var
 lTipoEvento: TpcnTpEvento;
 I: Integer;
 Ok: Boolean;
begin
(*
  Result := schLMC;

  I := pos('<infLMC', AXML);
  if I = 0 then
  begin
    I := pos('<infEvento', AXML);
    if I > 0 then
    begin
      lTipoEvento := StrToTpEvento(Ok, Trim(RetornarConteudoEntre(AXML, '<tpEvento>', '</tpEvento>')));

      case lTipoEvento of
        teCancelamento: Result := schevCancLMC;
        teEncerramento: Result := schevEncLMC;
        else Result := schevIncCondutorLMC;
      end;
    end;
  end;
*)
end;

function TACBrLMC.GerarNomeArqSchema(const ALayOut: TLayOutLMC;
  VersaoServico: Double): String;
var
  NomeServico, NomeSchema, ArqSchema: String;
  Versao: Double;
begin
  // Procura por Versão na pasta de Schemas //
  NomeServico := LayOutToServico(ALayOut);
  NomeSchema := NomeServicoToNomeSchema(NomeServico);
  ArqSchema := '';
  if NaoEstaVazio(NomeSchema) then
  begin
    Versao := VersaoServico;
    AchaArquivoSchema( NomeSchema, Versao, ArqSchema );
  end;

  Result := ArqSchema;
end;

function TACBrLMC.GerarChaveContingencia(FLMC: TLMC): String;

  function GerarDigito_Contigencia(out Digito: integer; chave: String): Boolean;
  var
    i, j: integer;
  const
    PESO = '43298765432987654329876543298765432';
  begin
    // Manual Integracao Contribuinte v2.02a - Página: 70 //
    chave := OnlyNumber(chave);
    j := 0;
    Digito := 0;
    Result := True;
    try
      for i := 1 to 35 do
        j := j + StrToInt(copy(chave, i, 1)) * StrToInt(copy(PESO, i, 1));
      Digito := 11 - (j mod 11);
      if (j mod 11) < 2 then
        Digito := 0;
    except
      Result := False;
    end;
    if length(chave) <> 35 then
      Result := False;
  end;

var
  wchave: String;
//  Digito: integer;
begin
  wchave := '';

  Result := wchave;
end;

function TACBrLMC.GetConfiguracoes: TConfiguracoesLMC;
begin
  Result := TConfiguracoesLMC(FPConfiguracoes);
end;

procedure TACBrLMC.SetConfiguracoes(AValue: TConfiguracoesLMC);
begin
  FPConfiguracoes := AValue;
end;

function TACBrLMC.LerVersaoDeParams(LayOutServico: TLayOutLMC): String;
var
  Versao: Double;
begin
  Versao := LerVersaoDeParams(GetNomeModeloDFe, Configuracoes.WebServices.UF,
    Configuracoes.WebServices.Ambiente, LayOutToServico(LayOutServico),
    VersaoLMCToDbl(Configuracoes.Geral.VersaoDF));

  Result := FloatToString(Versao, '.', '0.00');
end;

function TACBrLMC.NomeServicoToNomeSchema(const NomeServico: String): String;
Var
  ok: Boolean;
  ALayout: TLayOutLMC;
begin
  ALayout := ServicoToLayOut(ok, NomeServico);
  if ok then
    Result := SchemaLMCToStr( LayOutToSchema( ALayout ) )
  else
    Result := '';
end;

procedure TACBrLMC.LerServicoDeParams(LayOutServico: TLayOutLMC;
  var Versao: Double; var URL: String);
begin
  Versao := VersaoLMCToDbl(Configuracoes.Geral.VersaoDF);
  URL := '';
  LerServicoDeParams(GetNomeModeloDFe, Configuracoes.WebServices.UF,
    Configuracoes.WebServices.Ambiente, LayOutToServico(LayOutServico),
    Versao, URL);
end;

procedure TACBrLMC.SetStatus(const stNewStatus: TStatusACBrLMC);
begin
  if stNewStatus <> FStatus then
  begin
    FStatus := stNewStatus;
    if Assigned(OnStatusChange) then
      OnStatusChange(Self);
  end;
end;

function TACBrLMC.Cancelamento(AJustificativa: WideString; ALote: integer = 0): Boolean;
var
  i: integer;
begin
(*
  if Self.Livros.Count = 0 then
    GerarException(ACBrStr('ERRO: Nenhum Livro Informado!'));

  for i := 0 to self.Livros.Count - 1 do
  begin
    Self.WebServices.Consulta.LMCChave :=
      OnlyNumber(self.Livros.Items[i].LMC.infLMC.ID);

    if not Self.WebServices.Consulta.Executar then
      raise Exception.Create(Self.WebServices.Consulta.Msg);

    Self.EventoLMC.Evento.Clear;
    with Self.EventoLMC.Evento.Add do
    begin
      infEvento.CNPJ := copy(OnlyNumber(Self.WebServices.Consulta.LMCChave), 7, 14);
      infEvento.cOrgao := StrToIntDef(
        copy(OnlyNumber(Self.WebServices.Consulta.LMCChave), 1, 2), 0);
      infEvento.dhEvento := now;
      infEvento.tpEvento := teCancelamento;
      infEvento.chLMC := Self.WebServices.Consulta.LMCChave;
      infEvento.detEvento.nProt := Self.WebServices.Consulta.Protocolo;
      infEvento.detEvento.xJust := AJustificativa;
    end;

    try
      Self.EnviarEvento(ALote);
    except
      raise Exception.Create(Self.WebServices.EnvEvento.EventoRetorno.xMotivo);
    end;
  end;
*)
  Result := True;
end;

function TACBrLMC.Consultar: Boolean;
var
 i: Integer;
begin
(*
  if Self.Livros.Count = 0 then
    GerarException(ACBrStr('ERRO: Nenhum Livro Informado!'));

  for i := 0 to Self.Livros.Count - 1 do
  begin
    WebServices.Consulta.LMCChave :=
      OnlyNumber(self.Livros.Items[i].LMC.infLMC.ID);
    WebServices.Consulta.Executar;
  end;
*)
  Result := True;
end;

function TACBrLMC.Enviar(ALote: Integer; Imprimir:Boolean = True): Boolean;
begin
  Result := Enviar(IntToStr(ALote), Imprimir);
end;

function TACBrLMC.Enviar(ALote: String; Imprimir:Boolean = True): Boolean;
var
 i: Integer;
begin
  if Livros.Count <= 0 then
    GerarException(ACBrStr('ERRO: Nenhum MDF-e adicionado ao Lote'));

  if Livros.Count > 1 then
    GerarException(ACBrStr('ERRO: Conjunto de MDF-e transmitidos (máximo de 1 MDF-e)' +
      ' excedido. Quantidade atual: ' + IntToStr(Livros.Count)));

  Livros.Assinar;
  Livros.Validar;

  Result := WebServices.Envia(ALote);
(*
  if DALMC <> nil then
  begin
    for i := 0 to Livros.Count - 1 do
    begin
      if Livros.Items[i].Confirmado and Imprimir then
      begin
        Livros.Items[i].Imprimir;
      end;
    end;
  end;
*)
end;

end.
