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

unit ACBrDPS;

interface

uses
  Classes, SysUtils, ACBrBase,
  ACBrDFe, ACBrDFeException, ACBrDFeConfiguracoes,
  ACBrDPSConfiguracoes, ACBrDPSWebServices, ACBrDPSNotas, ACBrDPSDADPSClass,
  pcnDPS, pcnConversao, pcnConversaoDPS, pcnEnvEventoDPS,
  ACBrUtil;

const
  ACBRDPS_NAMESPACE = 'http://www.portalfiscal.inf.br/DPS';
  ACBRDPS_CErroAmbienteDiferente = 'Ambiente do XML (tpAmb) é diferente do ' +
               'configurado no Componente (Configuracoes.WebServices.Ambiente)';

type
  EACBrDPSException = class(EACBrDFeException);

  { TACBrDPS }
	{$IFDEF RTL230_UP}
  [ComponentPlatformsAttribute(pidWin32 or pidWin64)]
  {$ENDIF RTL230_UP}
  TACBrDPS = class(TACBrDFe)
  private
    FDADPS: TACBrDPSDADPSClass;
    FNotas: TNotas;
    FEventoDPS: TEventoDPS;
    FStatus: TStatusACBrDPS;
    FWebServices: TWebServices;

    function GetConfiguracoes: TConfiguracoesDPS;
    function Distribuicao(AcUFAutor: Integer; ACNPJCPF, AultNSU, ANSU,
      chDPS: String): Boolean;

    procedure SetConfiguracoes(AValue: TConfiguracoesDPS);
    procedure SetDADPS(const Value: TACBrDPSDADPSClass);
  protected
    function CreateConfiguracoes: TConfiguracoes; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    function NomeServicoToNomeSchema(const NomeServico: String): String; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure EnviarEmail(const sPara, sAssunto: String;
      sMensagem: TStrings = nil; sCC: TStrings = nil; Anexos: TStrings = nil;
      StreamDPS: TStream = nil; const NomeArq: String = ''; sReplyTo: TStrings = nil); override;

    function Enviar(ALote: Integer; Imprimir: Boolean = True): Boolean; overload;
    function Enviar(ALote: String; Imprimir: Boolean = True): Boolean; overload;

    function GetNomeModeloDFe: String; override;
    function GetNameSpaceURI: String; override;
    function EhAutorizacao(AVersao: TVersaoDPS; AUFCodigo: Integer): Boolean;

    function CstatConfirmada(AValue: Integer): Boolean;
    function CstatProcessado(AValue: Integer): Boolean;
    function CstatCancelada(AValue: Integer): Boolean;

    function Cancelamento(AJustificativa: String; ALote: Integer = 0): Boolean;
    function Consultar( AChave: String = ''): Boolean;
    function EnviarEvento(idLote: Integer): Boolean;

    procedure LerServicoDeParams(LayOutServico: TLayOutDPS; var Versao: Double;
      var URL: String); reintroduce; overload;
    function LerVersaoDeParams(LayOutServico: TLayOutDPS): String; reintroduce; overload;

    function GetURLConsultaDPS(const CUF: Integer;
      const TipoAmbiente: TpcnTipoAmbiente): String;
    function GetURLQRCode(const CUF: Integer; const TipoAmbiente: TpcnTipoAmbiente;
      const AChaveDPS: String): String;

    function IdentificaSchema(const AXML: String): TSchemaDPS;
    function GerarNomeArqSchema(const ALayOut: TLayOutDPS; VersaoServico: Double): String;
    function GerarNomeArqSchemaEvento(ASchemaEventoDPS: TSchemaDPS; VersaoServico: Double): String;

    property WebServices: TWebServices read FWebServices write FWebServices;
    property Notas: TNotas read FNotas write FNotas;
    property EventoDPS: TEventoDPS read FEventoDPS write FEventoDPS;
    property Status: TStatusACBrDPS read FStatus;

    procedure SetStatus(const stNewStatus: TStatusACBrDPS);
    procedure ImprimirEvento;
    procedure ImprimirEventoPDF;

    function DistribuicaoDFe(AcUFAutor: Integer; ACNPJCPF, AultNSU,
      ANSU: String; AchDPS: String = ''): Boolean;
    function DistribuicaoDFePorUltNSU(AcUFAutor: Integer; ACNPJCPF,
      AultNSU: String): Boolean;
    function DistribuicaoDFePorNSU(AcUFAutor: Integer; ACNPJCPF,
      ANSU: String): Boolean;
    function DistribuicaoDFePorChaveDPS(AcUFAutor: Integer; ACNPJCPF,
      AchDPS: String): Boolean;

    procedure EnviarEmailEvento(sPara, sAssunto: String;
      sMensagem: TStrings = nil; sCC: TStrings = nil; Anexos: TStrings = nil;
      sReplyTo: TStrings = nil);

  published
    property Configuracoes: TConfiguracoesDPS
      read GetConfiguracoes write SetConfiguracoes;
    property DADPS: TACBrDPSDADPSClass read FDADPS write SetDADPS;
  end;

Const
  ModeloDF = 'DPS';
  
implementation

uses
  strutils, dateutils,
  pcnAuxiliar, synacode, ACBrDFeSSL;

{$IFDEF FPC}
 {$IFDEF CPU64}
  {$R ACBrDPSServicos.res}  // Dificuldades de compilar Recurso em 64 bits
 {$ELSE}
  {$R ACBrDPSServicos.rc}
 {$ENDIF}
{$ELSE}
 {$R ACBrDPSServicos.res}
{$ENDIF}

{ TACBrDPS }

constructor TACBrDPS.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FNotas := TNotas.Create(Self, Nota);
  FEventoDPS := TEventoDPS.Create;
  FWebServices := TWebServices.Create(Self);
end;

destructor TACBrDPS.Destroy;
begin
  FNotas.Free;
  FEventoDPS.Free;
  FWebServices.Free;

  inherited;
end;

procedure TACBrDPS.EnviarEmail(const sPara, sAssunto: String; sMensagem: TStrings;
  sCC: TStrings; Anexos: TStrings; StreamDPS: TStream; const NomeArq: String;
  sReplyTo: TStrings);
begin
  SetStatus( stDPSEmail );

  try
    inherited EnviarEmail(sPara, sAssunto, sMensagem, sCC, Anexos, StreamDPS, NomeArq,
      sReplyTo);
  finally
    SetStatus( stIdleDPS );
  end;
end;

procedure TACBrDPS.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);

  if (Operation = opRemove) and (FDADPS <> nil) and
    (AComponent is TACBrDPSDADPSClass) then
    FDADPS := nil;
end;

function TACBrDPS.CreateConfiguracoes: TConfiguracoes;
begin
  Result := TConfiguracoesDPS.Create(Self);
end;

procedure TACBrDPS.SetDADPS(const Value: TACBrDPSDADPSClass);
var
  OldValue: TACBrDPSDADPSClass;
begin
  if Value <> FDADPS then
  begin
    if Assigned(FDADPS) then
      FDADPS.RemoveFreeNotification(Self);

    OldValue := FDADPS;   // Usa outra variavel para evitar Loop Infinito
    FDADPS := Value;    // na remoção da associação dos componentes

    if Assigned(OldValue) then
      if Assigned(OldValue.ACBrDPS) then
        OldValue.ACBrDPS := nil;

    if Value <> nil then
    begin
      Value.FreeNotification(self);
      Value.ACBrDPS := self;
    end;
  end;
end;

function TACBrDPS.GetNomeModeloDFe: String;
begin
  Result := 'DPS';
end;

function TACBrDPS.GetNameSpaceURI: String;
begin
  Result := ACBRDPS_NAMESPACE;
end;

function TACBrDPS.CstatConfirmada(AValue: Integer): Boolean;
begin
  case AValue of
    100, 101, 102: Result := True;
    else
      Result := False;
  end;
end;

function TACBrDPS.CstatProcessado(AValue: Integer): Boolean;
begin
  case AValue of
    100, 101, 102: Result := True;
    else
      Result := False;
  end;
end;

function TACBrDPS.CstatCancelada(AValue: Integer): Boolean;
begin
  case AValue of
    150, 151, 152: Result := True;
    else
      Result := False;
  end;
end;

function TACBrDPS.EhAutorizacao( AVersao: TVersaoDPS; AUFCodigo: Integer ): Boolean;
begin
  Result := True;
end;

function TACBrDPS.IdentificaSchema(const AXML: String): TSchemaDPS;
var
  lTipoEvento: String;
  I: Integer;
begin

  Result := schDPS;
  I := pos('<infDPS', AXML);
  if I = 0 then
  begin
    I := Pos('<infEvento', AXML);
    if I > 0 then
    begin
      lTipoEvento := Trim(RetornarConteudoEntre(AXML, '<tpEvento>', '</tpEvento>'));
      if lTipoEvento = '110111' then
        Result := schevCancDPS // Cancelamento
      else if lTipoEvento = '110115' then
        Result := schevNaoEmbDPS; // Não Embarque
    end;
  end;
end;

function TACBrDPS.GerarNomeArqSchema(const ALayOut: TLayOutDPS;
  VersaoServico: Double): String;
var
  NomeServico, NomeSchema, ArqSchema: String;
  Versao: Double;
begin
  // Procura por Versão na pasta de Schemas //
  NomeServico := LayOutDPSToServico(ALayOut);
  NomeSchema := NomeServicoToNomeSchema(NomeServico);
  ArqSchema := '';
  if NaoEstaVazio(NomeSchema) then
  begin
    Versao := VersaoServico;
    AchaArquivoSchema( NomeSchema, Versao, ArqSchema );
  end;

  Result := ArqSchema;
end;

function TACBrDPS.GerarNomeArqSchemaEvento(ASchemaEventoDPS: TSchemaDPS;
  VersaoServico: Double): String;
begin
  if VersaoServico = 0.0 then
    Result := ''
  else
    Result := PathWithDelim( Configuracoes.Arquivos.PathSchemas ) +
              SchemaDPSToStr(ASchemaEventoDPS) + '_v' +
              FloatToString(VersaoServico, '.', '0.00') + '.xsd';
end;

function TACBrDPS.GetConfiguracoes: TConfiguracoesDPS;
begin
  Result := TConfiguracoesDPS(FPConfiguracoes);
end;

procedure TACBrDPS.SetConfiguracoes(AValue: TConfiguracoesDPS);
begin
  FPConfiguracoes := AValue;
end;

function TACBrDPS.LerVersaoDeParams(LayOutServico: TLayOutDPS): String;
var
  Versao: Double;
begin
  Versao := LerVersaoDeParams(GetNomeModeloDFe, Configuracoes.WebServices.UF,
    Configuracoes.WebServices.Ambiente, LayOutDPSToServico(LayOutServico),
    VersaoDPSToDbl(Configuracoes.Geral.VersaoDF));

  Result := FloatToString(Versao, '.', '0.00');
end;

procedure TACBrDPS.LerServicoDeParams(LayOutServico: TLayOutDPS;
  var Versao: Double; var URL: String);
var
  AUF: String;
begin
  case Configuracoes.Geral.FormaEmissao of
    teNormal: AUF := Configuracoes.WebServices.UF;
    teSVCAN: AUF := 'SVC-AN';
    teSVCRS: AUF := 'SVC-RS';
  else
    AUF := Configuracoes.WebServices.UF;
  end;

  Versao := VersaoDPSToDbl(Configuracoes.Geral.VersaoDF);
  URL := '';
  LerServicoDeParams(GetNomeModeloDFe, AUF,
    Configuracoes.WebServices.Ambiente, LayOutDPSToServico(LayOutServico),
    Versao, URL);
end;

function TACBrDPS.GetURLConsultaDPS(const CUF: Integer;
  const TipoAmbiente: TpcnTipoAmbiente): String;
begin
  Result := LerURLDeParams('DPS', CUFtoUF(CUF), TipoAmbiente, 'URL-ConsultaDPS', 0);
end;

function TACBrDPS.GetURLQRCode(const CUF: Integer;
  const TipoAmbiente: TpcnTipoAmbiente; const AChaveDPS: String): String;
var
  Passo1, Passo2, urlUF, idDPS, tpEmis, sign: String;
begin
  urlUF := LerURLDeParams('DPS', CUFtoUF(CUF), TipoAmbiente, 'URL-QRCode', 0);
  idDPS := OnlyNumber(AChaveDPS);
  tpEmis := Copy(idDPS, 35, 1);

  Passo1 := urlUF;
  if Pos('?', urlUF) = 0 then
    Passo1 := Passo1 + '?';

  Passo1 := Passo1 + 'chDPS=' + idDPS + '&tpAmb=' + TpAmbToStr(TipoAmbiente);
  Result := Passo1;

  if tpEmis <> '1' then
  begin
    // Tipo de Emissão em Contingência
    SSL.CarregarCertificadoSeNecessario;
    sign := SSL.CalcHash(idDPS, dgstSHA1, outBase64, True);
    Passo2 := '&sign='+sign;

    Result := Result + Passo2;
  end;
end;

procedure TACBrDPS.SetStatus(const stNewStatus: TStatusACBrDPS);
begin
  if stNewStatus <> FStatus then
  begin
    FStatus := stNewStatus;
    if Assigned(OnStatusChange) then
      OnStatusChange(Self);
  end;
end;

function TACBrDPS.Cancelamento(AJustificativa: String; ALote: Integer = 0): Boolean;
var
  i: Integer;
begin
  if Notas.Count = 0 then
    GerarException(ACBrStr('ERRO: Nenhum Nota Eletrônico Informado!'));

  for i := 0 to Notas.Count - 1 do
  begin
  (*
    WebServices.Consulta.DPSChave := Notas.Items[i].NumID;

    if not WebServices.Consulta.Executar then
      GerarException(WebServices.Consulta.Msg);

    EventoDPS.Evento.Clear;
    with EventoDPS.Evento.Add do
    begin
      infEvento.CNPJ := copy(OnlyNumber(WebServices.Consulta.DPSChave), 7, 14);
      infEvento.cOrgao := StrToIntDef(copy(OnlyNumber(WebServices.Consulta.DPSChave), 1, 2), 0);
      infEvento.dhEvento := now;
      infEvento.tpEvento := teCancelamento;
      infEvento.chDPS := WebServices.Consulta.DPSChave;
      infEvento.detEvento.nProt := WebServices.Consulta.Protocolo;
      infEvento.detEvento.xJust := AJustificativa;
    end;

    try
      EnviarEvento(ALote);
    except
      GerarException(WebServices.EnvEvento.EventoRetorno.xMotivo);
    end;
    *)
  end;
  Result := True;
end;

function TACBrDPS.Consultar(AChave: String): Boolean;
var
  i: Integer;
begin
  if (Notas.Count = 0) and EstaVazio(AChave) then
    GerarException(ACBrStr('ERRO: Nenhum Nota Eletrônico ou Chave Informada!'));

  if NaoEstaVazio(AChave) then
  begin
    Notas.Clear;
//    WebServices.Consulta.DPSChave := AChave;
    WebServices.Consulta.Executar;
  end
  else
  begin
    for i := 0 to Notas.Count - 1 do
    begin
//      WebServices.Consulta.DPSChave := Notas.Items[i].NumID;
      WebServices.Consulta.Executar;
    end;
  end;

  Result := True;
end;

function TACBrDPS.Enviar(ALote: Integer; Imprimir: Boolean = True): Boolean;
begin
  Result := Enviar(IntToStr(ALote), Imprimir);
end;

function TACBrDPS.Enviar(ALote: String; Imprimir: Boolean = True): Boolean;
var
  i: Integer;
begin
  WebServices.Enviar.Clear;

  if Notas.Count <= 0 then
    GerarException(ACBrStr('ERRO: Nenhuma NF-e adicionada ao Lote'));

  if Notas.Count > 50 then
    GerarException(ACBrStr('ERRO: Conjunto de NF-e transmitidas (máximo de 50 NF-e)' +
      ' excedido. Quantidade atual: ' + IntToStr(Notas.Count)));

  Notas.Assinar;
  Notas.Validar;

  Result := WebServices.Envia(ALote);

  if DADPS <> nil then
  begin
    for i := 0 to Notas.Count - 1 do
    begin
      if Notas.Items[i].Confirmada and Imprimir then
      begin
        Notas.Items[i].Imprimir;
        if (DADPS.ClassName = 'TACBrDPSDADPSRaveCB') then
          Break;
      end;
    end;
  end;
end;

function TACBrDPS.EnviarEvento(idLote: Integer): Boolean;
var
  i, j: Integer;
  chDPS: String;
begin
(*
  if EventoDPS.Evento.Count <= 0 then
    GerarException(ACBrStr('ERRO: Nenhum Evento adicionado ao Lote'));

  if EventoDPS.Evento.Count > 20 then
    GerarException(ACBrStr('ERRO: Conjunto de Eventos transmitidos (máximo de 20) ' +
      'excedido. Quantidade atual: ' + IntToStr(EventoDPS.Evento.Count)));

  WebServices.EnvEvento.idLote := idLote;

  {Atribuir nSeqEvento, CNPJ, Chave e/ou Protocolo quando não especificar}
  for i := 0 to EventoDPS.Evento.Count - 1 do
  begin
    if EventoDPS.Evento.Items[i].infEvento.nSeqEvento = 0 then
      EventoDPS.Evento.Items[i].infEvento.nSeqEvento := 1;

    FEventoDPS.Evento.Items[i].infEvento.tpAmb := Configuracoes.WebServices.Ambiente;

    if Notas.Count > 0 then
    begin
      chDPS := OnlyNumber(EventoDPS.Evento.Items[i].infEvento.chDPS);

      // Se tem a chave da DPS no Evento, procure por ela nos Notas carregados //
      if NaoEstaVazio(chDPS) then
      begin
        For j := 0 to Notas.Count - 1 do
        begin
          if chDPS = Notas.Items[j].NumID then
            Break;
        end ;

        if j = Notas.Count then
          GerarException( ACBrStr('Não existe DPS com a chave [' + chDPS + '] carregada') );
      end
      else
        j := 0;

      if trim(EventoDPS.Evento.Items[i].infEvento.CNPJ) = '' then
        EventoDPS.Evento.Items[i].infEvento.CNPJ := Notas.Items[j].DPS.Emit.CNPJ;

      if chDPS = '' then
        EventoDPS.Evento.Items[i].infEvento.chDPS := Notas.Items[j].NumID;

      if trim(EventoDPS.Evento.Items[i].infEvento.detEvento.nProt) = '' then
      begin
        if EventoDPS.Evento.Items[i].infEvento.tpEvento = teCancelamento then
        begin
          EventoDPS.Evento.Items[i].infEvento.detEvento.nProt := Notas.Items[j].DPS.procDPS.nProt;

          if trim(EventoDPS.Evento.Items[i].infEvento.detEvento.nProt) = '' then
          begin
            WebServices.Consulta.DPSChave := EventoDPS.Evento.Items[i].infEvento.chDPS;

            if not WebServices.Consulta.Executar then
              GerarException(WebServices.Consulta.Msg);

            EventoDPS.Evento.Items[i].infEvento.detEvento.nProt := WebServices.Consulta.Protocolo;
          end;
        end;
      end;
    end;

  end;
  *)
  Result := WebServices.EnvEvento.Executar;

  if not Result then
    GerarException( WebServices.EnvEvento.Msg );
end;

function TACBrDPS.NomeServicoToNomeSchema(const NomeServico: String): String;
Var
  ok: Boolean;
  ALayout: TLayOutDPS;
begin
  ALayout := ServicoToLayOutDPS(ok, NomeServico);
  if ok then
    Result := SchemaDPSToStr( LayOutToSchema( ALayout ) )
  else
    Result := '';
end;

procedure TACBrDPS.ImprimirEvento;
begin
  if not Assigned(DADPS) then
    GerarException('Componente DADPS não associado.')
  else
    DADPS.ImprimirEVENTO(nil);
end;

procedure TACBrDPS.ImprimirEventoPDF;
begin
  if not Assigned(DADPS) then
    GerarException('Componente DADPS não associado.')
  else
    DADPS.ImprimirEVENTOPDF(nil);
end;

function TACBrDPS.Distribuicao(AcUFAutor: Integer; ACNPJCPF, AultNSU, ANSU,
  chDPS: String): Boolean;
begin
  WebServices.DistribuicaoDFe.cUFAutor := AcUFAutor;
  WebServices.DistribuicaoDFe.CNPJCPF := ACNPJCPF;
  WebServices.DistribuicaoDFe.ultNSU := AultNSU;
  WebServices.DistribuicaoDFe.NSU := ANSU;
//  WebServices.DistribuicaoDFe.chDPS := chDPS;

  Result := WebServices.DistribuicaoDFe.Executar;

  if not Result then
    GerarException( WebServices.DistribuicaoDFe.Msg );
end;

function TACBrDPS.DistribuicaoDFe(AcUFAutor: Integer;
  ACNPJCPF, AultNSU, ANSU: String; AchDPS: String = ''): Boolean;
begin
  Result := Distribuicao(AcUFAutor, ACNPJCPF, AultNSU, ANSU, AchDPS);
end;

function TACBrDPS.DistribuicaoDFePorUltNSU(AcUFAutor: Integer; ACNPJCPF,
  AultNSU: String): Boolean;
begin
  Result := Distribuicao(AcUFAutor, ACNPJCPF, AultNSU, '', '');
end;

function TACBrDPS.DistribuicaoDFePorNSU(AcUFAutor: Integer; ACNPJCPF,
  ANSU: String): Boolean;
begin
  Result := Distribuicao(AcUFAutor, ACNPJCPF, '', ANSU, '');
end;

function TACBrDPS.DistribuicaoDFePorChaveDPS(AcUFAutor: Integer; ACNPJCPF,
  AchDPS: String): Boolean;
begin
  Result := Distribuicao(AcUFAutor, ACNPJCPF, '', '', AchDPS);
end;

procedure TACBrDPS.EnviarEmailEvento(sPara, sAssunto: String;
  sMensagem: TStrings; sCC: TStrings; Anexos: TStrings;
  sReplyTo: TStrings);
var
  NomeArq: String;
  AnexosEmail: TStrings;
begin
  AnexosEmail := TStringList.Create;
  try
    AnexosEmail.Clear;

    if Anexos <> nil then
      AnexosEmail.Text := Anexos.Text;

    ImprimirEventoPDF;
//    NomeArq := OnlyNumber(EventoDPS.Evento[0].infEvento.Id);
    NomeArq := PathWithDelim(DADPS.PathPDF) + NomeArq + '-procEventoDPS.pdf';
    AnexosEmail.Add(NomeArq);

    EnviarEmail(sPara, sAssunto, sMensagem, sCC, AnexosEmail, nil, '', sReplyTo);
  finally
    AnexosEmail.Free;
  end;
end;

end.

