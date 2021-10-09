{ ****************************************************************************** }
{ Projeto: Componentes ACBr }
{ Biblioteca multiplataforma de componentes Delphi para interação com equipa- }
{ mentos de Automação Comercial utilizados no Brasil }
{ }
{ Direitos Autorais Reservados (c) 2004   Gabriel Rodrigo Frones }
{ }
{ Colaboradores nesse arquivo:            Daniel Simões de Almeida }
{ }
{ Você pode obter a última versão desse arquivo na pagina do  Projeto ACBr }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr }
{ }
{ Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior. }
{ }
{ Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor }
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT) }
{ }
{ Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto }
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc., }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA. }
{ Você também pode obter uma copia da licença em: }
{ http://www.opensource.org/licenses/lgpl-license.php }
{ }
{ Daniel Simões de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br }
{ Praça Anita Costa, 34 - Tatuí - SP - 18270-410 }
{ }
{ ****************************************************************************** }

{ ******************************************************************************
  |* Historico
  |*
  |* 25/10/2005: Gabriel Rodrigo Frones
  |*  - Primeira Versao ACBrTERClass
  |
  |* 11/05/2011: Marcelo Ferreira (Marcelo-sp)
  |*  - Implemento - Função LeBalança
  |
  |* 03/07/2011: Amarildo Lacerda    lacerda@storeware.com.br
  |*  - Implementa suporte para multiplos fabricantes.
  |*    Um novo modelo de terminal deve herdar de TACBrTERtcpClass;
  |* 13/06/2012: Amarildo Lacerda
  |*  - Incluindo controle de SessaoCritica para concorrencia de escrita no terminal
  ****************************************************************************** }

{$I ACBr.inc}
unit ACBrTERtcpClass;

interface

uses // ACBrDevice,    {Units da ACBr}
  forms, Classes, windows, {$IFDEF INDY}ACBrTerminalTCPComm, {$ELSE}blcksock,
  ACBrSocket, {$ENDIF}
{$IFDEF COMPILER6_UP}Types{$ELSE}windows{$ENDIF};

type

  { Classe generica de TERMINAL, nao implementa nenhum modelo especifico, apenas
    declara a Classe. NAO DEVE SER INSTANCIADA. Usada apenas como base para
    as demais Classes de TERMINAL como por exemplo a classe TACBrTERWilbor }

  TACBrTERTipoTerminal = (terComutadoraTCP, terTerminalTCP);
  TACBrTERModelo = (terNenhum, terWilborTCP, terWilborComutadoraTCP, terGertec,
    terShellby, terVT100, terVT100_ScubaFinger);

const
  // FINGER
  F_INIT = 0;
  F_READING = 1;
  F_STOP = 2;
  F_ERRO = 3;
  F_OK = 4;
  F_NOK = 5;
  F_KOK = 6;
  F_EOK = 7;

type

  TOnACBRTerRecebeDadosEvent = procedure(sender: TObject; pDados: string;
    pIP: string; pCliPorta: integer; pTerminal: integer) of object;
  TOnACBRTerFingerEstadoEvent = procedure(sender: TObject; evento: byte;
    pCliPorta, pTerminal: integer) of object;

  TACBrTERtcpClass = class;

  TACBrTerPrograma = class(TComponent)
  public
    Terminal : TACBrTERtcpClass;
    nTerm:Integer;
    cliPorta:Integer;
    pIP:String;
    procedure Init; virtual;
    procedure TelaInicial;virtual;
    procedure RecebeChar(c: char); virtual;
    procedure DoFinger_RecebeImagem(sender: TObject; pImagem, pIP: string;
      cliPorta, Terminal: integer); virtual;
    procedure DoFinger_EstadoEvento(evento: integer;
      cliPorta, Terminal: integer); virtual;
  end;

  TACBrTerFingerPosicaoMensagem = record
    linha: integer;
    coluna: integer;
  end;

  TACBrTERUltimoTexto = record
    linha: integer;
    coluna: integer;
    Texto: string;
    CurPos: integer;
    TextoDisplay: array [0 .. 1024] of char;
  end;

  TACBrTerProgramaComum = class;

  TACBrTerProgramaComumClass = class of TACBrTerProgramaComum;

  TACBrTerListaTerminalIP = class
    IP: string;
    Terminal: integer;
    UltimoTexto: TACBrTERUltimoTexto;
    Programa: TACBrTerPrograma;
    // usao para guarda o objeto do programa que esta em uso no terminal;
    ProgramaClass: TACBrTerProgramaComumClass;
    Finger_Ativo: boolean;
    Finger_RecebendoImagem: boolean;
    Finger_Imagem: string;
    Finger_HabTickCount: cardinal;
    Finger_InitTickCount: cardinal;
    Finger_StopTickCount: cardinal;
  end;

  TACBrTerTerminais = class(TList)
  private
    function GetItems(idx: integer): TACBrTerListaTerminalIP;
    procedure SetItems(idx: integer; const Value: TACBrTerListaTerminalIP);
  public
    function Find(Terminal: integer): integer;
    function FindTerminal(Terminal: integer): TACBrTerListaTerminalIP;
    function Procurar(sIP: string; nTerm: integer): integer;
    function GetPrograma(sIP: string; nTerm: integer): TACBrTerPrograma;
    procedure SetPrograma(sIP: string; nTerm: integer;
      pPrograma: TACBrTerPrograma);
    procedure SetProgramaClass(sIP: string; nTerm: integer;
      progClass: TACBrTerProgramaComumClass);
    property Items[idx: integer]: TACBrTerListaTerminalIP read GetItems
      write SetItems;
  end;

  TACBrTERDecodeString = record
    Terminal: integer;
    // identificador do terminal na lista controle do aplicativo
    Comutadora: boolean; // indica se tem terminais ligados a uma comutadora;
    HTerminal: integer;
    // o numero do terminal identificando o Hardware (na Comutadora)
    Comando: string; // comando
    Texto: string; // texto puro, sem comandos e outros dados;
    EncerraCMD: string; // texto para encerrar comando - Protoc. VT-100
  end;

  TACBrTERtcpClass = class
  private
    FComutadora: boolean;
    FTipoTerminal: TACBrTERTipoTerminal;
    FDisplayNumeroColunas: integer;
    FDisplayNumeroLinhas: integer;
    FFinger_Presente: boolean;
    FFinger_PosicaoMensagem: TACBrTerFingerPosicaoMensagem;
    procedure SetTipoTerminal(const Value: TACBrTERTipoTerminal);
    procedure SetTCPServer(const Value:
      {$IFDEF INDY}TACBrTerminalTCP{$ELSE}TACBrTCPServer{$ENDIF});
    function GetTCPServer:
    {$IFDEF INDY}TACBrTerminalTCP{$ELSE}TACBrTCPServer{$ENDIF};
    procedure SetModelo(const Value: TACBrTERModelo);
    procedure SetComutadora(const Value: boolean);
    procedure SetDisplayNumeroColunas(const Value: integer);
    procedure SetDisplayNumeroLinhas(const Value: integer);
    procedure DesconectarOutraPorta(IP: string; porta: integer);
    procedure SetFinger_PosicaoMensagem(const Value
      : TACBrTerFingerPosicaoMensagem);
  protected
    fpOwner: TComponent;
{$IFDEF INDY}
    fpTCP: TACBrTerminalTCP;
{$ELSE}
    fpTCP: TACBrTCPServer;
{$ENDIF}
    fpModeloStr: string;
    fpTerminais: TACBrTerTerminais;
    fpModelo: TACBrTERModelo;
    procedure SetFinger_Presente(const Value: boolean); virtual;
    function GetFinger_Ativo(Terminal: integer): boolean; virtual;
    procedure SetFinger_Ativo(Terminal: integer; const Value: boolean); virtual;
  public
    procedure Desconectar(IP: string);
    function CheckConnected(IP: string; porta: integer): boolean;
    procedure Lock;
    procedure UnLock;
    procedure DoConectaClass(pIP: string; cliPorta: integer;
      var Terminal: integer); virtual;
    procedure DoRecebeClass(pTexto: string; pIP: string; cliPorta: integer;
      Terminal: integer); virtual;
    procedure DoDesConectaClass(pIP: string; Terminal: integer;
      porta: integer); virtual;
    function GetTCPCount: integer; virtual;

    property Owner: TComponent read fpOwner;
    property DisplayNumeroColunas: integer read FDisplayNumeroColunas
      write SetDisplayNumeroColunas;
    property DisplayNumeroLinhas: integer read FDisplayNumeroLinhas
      write SetDisplayNumeroLinhas;
    function EncodeString(cod: TACBrTERDecodeString): string; virtual;
    function DecodeString(Texto: string): TACBrTERDecodeString; virtual;
    property Comutadora: boolean read FComutadora write SetComutadora;

    function FindTerminal(Terminal: integer): TACBrTerListaTerminalIP; virtual;
    procedure AddTerminal(ipTer: string; NTerminal: integer); virtual;
    procedure RemoveTerminal(ipTer: string); virtual;
    procedure ReenviaUltimoTexto(Terminal: integer; cliPorta: integer); virtual;
    property Terminais: TACBrTerTerminais read fpTerminais;

    function GetIP(NTerminal: integer): string; virtual;
    function GetTerminal(aIp: string): integer; virtual;
    function GetPrograma(pIP: string; nTerm: integer): TACBrTerPrograma;
    procedure SetPrograma(pIP: string; nTerm: integer;
      pPrograma: TACBrTerPrograma);

    procedure SetProgramaClass(nTerm: integer;pIP: string;
      pPrograma: TACBrTerProgramaComumClass);

    property TipoTerminal: TACBrTERTipoTerminal read FTipoTerminal
      write SetTipoTerminal;

    property TCP:
    {$IFDEF INDY}TACBrTerminalTCP{$ELSE}TACBrTCPServer{$ENDIF} read GetTCPServer
      write SetTCPServer;

    procedure EnviaTCPString(IP: string; cliPorta: integer; Texto: string);

    procedure EnviaParalela(Texto: string; ACliPorta: integer;
      Terminal: integer); virtual;
    procedure EnviaSerial(Texto: string; ACliPorta: integer;
      Terminal: integer); virtual;
    procedure EnviaAcionamento(cmd: string; Terminal: integer); virtual;

    constructor Create(AOwner: TComponent); virtual;
    destructor Destroy; override;
    procedure InitAPI; virtual;
    procedure InitCompleto(Terminal: integer; cliPorta: integer); virtual;

    procedure LeBalanca(Terminal: integer); virtual;
    procedure LeSerial(MillisecTimeOut: integer = 500); virtual;
    procedure EnviaString(pTexto: string; cliPorta: integer;
      Terminal: integer); virtual;
    procedure EnviaRotacao(Texto: string; linha: integer;
      Terminal: integer); virtual;
    procedure LimpaTela(Terminal: integer; cliPorta: integer); virtual;
    procedure PosicionaCursor(pLinha, pColuna: integer; Terminal: integer;
      cliPorta: integer); virtual;
    procedure BackSpace(Terminal: integer); virtual;

    // Comando para FINGER
    property Finger_SensorPresente: boolean read FFinger_Presente
      write SetFinger_Presente;
    property Finger_Ativo[Terminal: integer]: boolean read GetFinger_Ativo
      write SetFinger_Ativo;
    procedure Finger_Inicializacao(ACliPorta: integer;
      Terminal: integer); virtual;
    procedure Finger_HabilitaSensor(ACliPorta: integer;
      Terminal: integer); virtual;
    procedure Finger_DesabilitaSensor(ACliPorta: integer;
      Terminal: integer); virtual;
    procedure Finger_PedidoImagem(ACliPorta: integer;
      Terminal: integer); virtual;
    property Finger_PosicaoMensagem: TACBrTerFingerPosicaoMensagem
      read FFinger_PosicaoMensagem write SetFinger_PosicaoMensagem;

    property ModeloStr: string read fpModeloStr;
    property Modelo: TACBrTERModelo read fpModelo write SetModelo;
    procedure EnviaStatus(Terminal: integer); virtual;
    procedure EnviaStatusTodos(); virtual;
  end;

  TOnExecuteEvent = procedure(c: char) of object;

  // os programas que rodam no microterminal devem herdar de TTerminalAbstract;
  TACBrTerProgramaComum = class(TACBrTerPrograma)
  private
    FOnExecuteEvent: TOnExecuteEvent;
    procedure SetOnExecuteEvent(const Value: TOnExecuteEvent);
  public
    constructor Create(own: TComponent); override;

    procedure DispClear;
    procedure DispPos(l, c: integer);
    procedure DispEcho(txt: string);
    procedure EnviaSerial(txt:string);
    procedure EnviaParalela(txt:string);
    procedure EnviaAcionamento(cmd:string);

    property OnExecuteEvent: TOnExecuteEvent read FOnExecuteEvent
      write SetOnExecuteEvent;

    procedure RecebeChar(c: char); override;

  end;

implementation

uses SyncObjs, ACBrTERtcp, ACBrUtil, SysUtils;

{ TACBrTERClass }

var
  FSessaoCritica: TCriticalSection;

  { TProgramaTerminalAbstract }

constructor TACBrTerProgramaComum.Create(own: TComponent);
begin
  inherited;
end;

procedure TACBrTerProgramaComum.DispClear;
begin
   terminal.LimpaTela(nTerm,cliPorta);
   DispPos(0,0);
end;

procedure TACBrTerProgramaComum.DispEcho(txt: string);
begin
  terminal.EnviaString(txt,cliPorta,nTerm);
end;

procedure TACBrTerProgramaComum.DispPos(l, c: integer);
begin
  terminal.PosicionaCursor(l,c,nTerm,cliPorta);
end;

procedure TACBrTerProgramaComum.EnviaAcionamento(cmd: string);
begin
   terminal.EnviaAcionamento(cmd,nTerm);
end;

procedure TACBrTerProgramaComum.EnviaParalela(txt: string);
begin
   terminal.EnviaParalela(txt,cliPorta,nTerm);
end;

procedure TACBrTerProgramaComum.EnviaSerial(txt: string);
begin
  terminal.EnviaSerial(txt,cliPorta,nTerm);
end;



procedure TACBrTerProgramaComum.RecebeChar(c: char);
begin
  if assigned(FOnExecuteEvent) then
    FOnExecuteEvent(c);
end;

procedure TACBrTerProgramaComum.SetOnExecuteEvent(const Value: TOnExecuteEvent);
begin
  FOnExecuteEvent := Value;
end;


constructor TACBrTERtcpClass.Create(AOwner: TComponent);
begin
  if not(AOwner is TACBrTERtcp) then
    raise Exception.Create
      (ACBrStr('Essa Classe deve ser instanciada por TACBrTERTcp'));

  { Criando ponteiro interno para as Propriedade SERIAL de ACBrTER,
    para permitir as Classes Filhas o acesso a essas propriedades do Componente }

  fpOwner := AOwner;

  fpModeloStr := 'Não Definida';
  FDisplayNumeroColunas := 40;
  FDisplayNumeroLinhas := 2;

  fpTerminais := TACBrTerTerminais.Create;
  FFinger_PosicaoMensagem.linha := 0;
  FFinger_PosicaoMensagem.coluna := 1;
end;

procedure TACBrTERtcpClass.Desconectar(IP: string);
var
  i: integer;
  obj: TObject;
  blk: TTCPBlockSocket;
  b: boolean;
  nItens: integer;
begin
  try
    b := false;
    if assigned(fpTCP) and assigned(fpTCP.ThreadList) then
      with fpTCP.ThreadList.LockList do
        try
          nItens := Count;
          for i := 0 to nItens - 1 do
          begin
            obj := Items[i];
            if assigned(obj) then
              try
                with TACBrTCPServerThread(obj) do
                begin
                  blk := TCPBlockSocket;
                  if assigned(blk) then
                    if sameText(blk.GetRemoteSinIP, IP) then
                    begin
                      try
                        b := Active;
                      except
                        try
                          b := false;
                        except
                        end;
                      end;
                      if b then
                      begin
                        blk.CloseSocket;
                      end;
                    end;
                end;
              except // cai neste trecho quando a conexão nao esta mais ativa... deligou o terminal (por exemplo) - Junior
              end;

          end;
        finally
          fpTCP.ThreadList.UnlockList;
        end;
  except
    on e: Exception do
      raise Exception.Create('Desconectar IP: ' + IP + ' | ' + e.message);

  end;
end;

function TACBrTERtcpClass.CheckConnected(IP: string; porta: integer): boolean;
var
  i: integer;
  obj: TObject;
  blk: TTCPBlockSocket;
  // b: boolean;
  nItens: integer;
begin
  try
    result := false;
    if assigned(fpTCP) and assigned(fpTCP.ThreadList) then
      with fpTCP.ThreadList.LockList do
        try
          nItens := Count;
          for i := 0 to nItens - 1 do
          begin
            obj := Items[i];
            if assigned(obj) then
              try
                with TACBrTCPServerThread(obj) do
                begin
                  blk := TCPBlockSocket;
                  if assigned(blk) then
                    if sameText(blk.GetRemoteSinIP, IP) then
                      if (blk.GetRemoteSinPort = porta) or (porta = 0) then
                      begin
                        result := true;
                      end;
                end;
              except // cai neste trecho quando a conexão nao esta mais ativa... deligou o terminal (por exemplo) - Junior
              end;
          end;
        finally
          fpTCP.ThreadList.UnlockList;
        end;
  except
    on e: Exception do
      raise Exception.Create('CheckConnected IP: ' + IP + ' | ' + e.message);

  end;
end;

procedure TACBrTERtcpClass.DesconectarOutraPorta(IP: string; porta: integer);
var
  i: integer;
  obj: TObject;
  blk: TTCPBlockSocket;
  // b: boolean;
  nItens: integer;
begin
  try

    if assigned(fpTCP) and assigned(fpTCP.ThreadList) then
      with fpTCP.ThreadList.LockList do
        try
          nItens := Count;
          for i := 0 to nItens - 1 do
          begin
            obj := Items[i];
            if assigned(obj) then
              try
                with TACBrTCPServerThread(obj) do
                begin
                  blk := TCPBlockSocket;
                  if assigned(blk) then
                    if sameText(blk.GetRemoteSinIP, IP) then
                      if blk.GetRemoteSinPort <> porta then
                      begin
                        blk.CloseSocket;
                      end;
                end;
              except // cai neste trecho quando a conexão nao esta mais ativa... deligou o terminal (por exemplo) - Junior
              end;

          end;
        finally
          fpTCP.ThreadList.UnlockList;
        end;
  except
    on e: Exception do
      raise Exception.Create('Desconectar IP: ' + IP + ' | ' + e.message);

  end;
end;

destructor TACBrTERtcpClass.Destroy;
begin
  FreeAndNil(fpTerminais);
  inherited Destroy;
end;

procedure TACBrTERtcpClass.SetComutadora(const Value: boolean);
begin
  FComutadora := Value;
end;

procedure TACBrTERtcpClass.SetDisplayNumeroColunas(const Value: integer);
begin
  FDisplayNumeroColunas := Value;
end;

procedure TACBrTERtcpClass.SetDisplayNumeroLinhas(const Value: integer);
begin
  FDisplayNumeroLinhas := Value;
end;

procedure TACBrTERtcpClass.SetFinger_Ativo(Terminal: integer;
  const Value: boolean);
var
  rt: TACBrTerListaTerminalIP;
begin
  rt := fpTerminais.FindTerminal(Terminal);
  if assigned(rt) then
  begin
    rt.Finger_Ativo := Value;
    if Value then
      rt.Finger_HabTickCount := gettickCount;
  end;
end;

procedure TACBrTERtcpClass.SetFinger_PosicaoMensagem
  (const Value: TACBrTerFingerPosicaoMensagem);
begin
  FFinger_PosicaoMensagem := Value;
end;

procedure TACBrTERtcpClass.SetFinger_Presente(const Value: boolean);
begin
  FFinger_Presente := Value;
end;

procedure TACBrTERtcpClass.SetModelo(const Value: TACBrTERModelo);
begin
  fpModelo := Value;
end;

procedure TACBrTERtcpClass.SetPrograma(pIP: string; nTerm: integer;
  pPrograma: TACBrTerPrograma);
begin
  fpTerminais.SetPrograma(pIP, nTerm, pPrograma);
end;

procedure TACBrTERtcpClass.SetProgramaClass( nTerm: integer;pIP: string;
  pPrograma: TACBrTerProgramaComumClass);
begin
   Terminais.SetProgramaClass(pIP,nTerm,pPrograma);
end;

procedure TACBrTERtcpClass.SetTCPServer(const Value:
  {$IFDEF INDY}TACBrTerminalTCP{$ELSE}TACBrTCPServer{$ENDIF});
begin
  fpTCP := Value;
end;

procedure TACBrTERtcpClass.SetTipoTerminal(const Value: TACBrTERTipoTerminal);
begin
  FTipoTerminal := Value;
  if Value = terComutadoraTCP then
    Comutadora := true;

end;

procedure TACBrTERtcpClass.UnLock;
begin
  FSessaoCritica.Release;
end;

procedure TACBrTERtcpClass.EnviaTCPString(IP: string; cliPorta: integer;
  Texto: string);
var
  i: integer;
  msg: string;
  obj: TObject;
  blk: TTCPBlockSocket;
  b: boolean;
  nItens: integer;
begin
  { try
    lock;
  }
  try

    msg := 'init';
    if assigned(fpTCP) and assigned(fpTCP.ThreadList) then
      with fpTCP.ThreadList.LockList do
        try
          msg := 'before for loop';
          // for I := Count - 1 downto 0 do
          nItens := Count;
          for i := 0 to nItens - 1 do
          begin
            msg := 'in for loop';

            obj := Items[i];

            if assigned(obj) then
              try
                with TACBrTCPServerThread(obj) do
                begin
                  msg := 'after active';
                  blk := TCPBlockSocket;
                  if assigned(blk) then
                    if cliPorta = 0 then
                      cliPorta := cliPorta + 2 - 2; // debug
                  if (sameText(blk.GetRemoteSinIP, IP) and
                    ((cliPorta = 0) or (cliPorta = blk.GetRemoteSinPort))) then
                  begin
                    msg := 'SendString-blk';
                    msg := 'before active';
                    try
                      b := Active;
                    except
                      try
                        b := false;
                      except
                      end;
                    end;
                    if b then
                    begin
                      blk.SendString(Texto);
                      // Break;
                    end;
                  end;
                end;
              except // cai neste trecho quando a conexão nao esta mais ativa... deligou o terminal (por exemplo) - Junior
              end;

          end;
          msg := 'final';

        finally
          fpTCP.ThreadList.UnlockList;
        end;
  except
    on e: Exception do
      raise Exception.Create('Erro EnviaTCPString <' + msg + '> IP: ' + IP +
        ' | ' + e.message);

  end;
  {
    finally
    unlock;
    end;
  }
end;

function TACBrTERtcpClass.FindTerminal(Terminal: integer)
  : TACBrTerListaTerminalIP;
begin
  result := fpTerminais.FindTerminal(Terminal);
end;

procedure TACBrTERtcpClass.Finger_DesabilitaSensor(ACliPorta: integer;
  Terminal: integer);
begin

end;

procedure TACBrTERtcpClass.Finger_HabilitaSensor(ACliPorta: integer;
  Terminal: integer);
begin

end;

procedure TACBrTERtcpClass.Finger_Inicializacao(ACliPorta: integer;
  Terminal: integer);
begin

end;

procedure TACBrTERtcpClass.Finger_PedidoImagem(ACliPorta: integer;
  Terminal: integer);
begin

end;

function TACBrTERtcpClass.GetFinger_Ativo(Terminal: integer): boolean;
var
  rt: TACBrTerListaTerminalIP;
begin
  result := false;
  rt := fpTerminais.FindTerminal(Terminal);
  if assigned(rt) then
    result := rt.Finger_Ativo;
end;

function TACBrTERtcpClass.GetIP(NTerminal: integer): string;
var
  i: integer;
begin
  result := '';
  for i := fpTerminais.Count - 1 downto 0 do
    if assigned(fpTerminais.Items[i]) then
      with TACBrTerListaTerminalIP(fpTerminais.Items[i]) do
        if Terminal = NTerminal then
        begin
          result := IP;
          exit;
        end;
end;

function TACBrTERtcpClass.GetPrograma(pIP: string; nTerm: integer)
  : TACBrTerPrograma;
begin
  result := fpTerminais.GetPrograma(pIP, nTerm);
end;

function TACBrTERtcpClass.GetTCPCount: integer;
begin
  with fpTCP.ThreadList.LockList do
    try
      result := fpTCP.ThreadList.LockList.Count;
    finally
      fpTCP.ThreadList.UnlockList;
    end;
end;

function TACBrTERtcpClass.GetTCPServer:
{$IFDEF INDY}TACBrTerminalTCP{$ELSE}TACBrTCPServer{$ENDIF};
begin
  result := fpTCP;
end;

function TACBrTERtcpClass.GetTerminal(aIp: string): integer;
var
  i: integer;
begin
  result := -1;
  for i := fpTerminais.Count - 1 downto 0 do
    with TACBrTerListaTerminalIP(fpTerminais.Items[i]) do
      if IP = aIp then
      begin
        result := Terminal;
        exit;
      end;
end;

procedure TACBrTERtcpClass.InitAPI;
begin

end;

procedure TACBrTERtcpClass.InitCompleto(Terminal: integer; cliPorta: integer);
begin
  // LimpaTela(Terminal);
  ReenviaUltimoTexto(Terminal, cliPorta);
end;

procedure TACBrTERtcpClass.AddTerminal(ipTer: string; NTerminal: integer);
var
  i: integer;
  nAchou: integer;
  it: TACBrTerListaTerminalIP;
begin
  nAchou := -1;
  for i := fpTerminais.Count - 1 downto 0 do
    with TACBrTerListaTerminalIP(fpTerminais.Items[i]) do
    begin
      if Terminal = NTerminal then
      begin
        IP := ipTer;
        nAchou := i;
      end;
    end;

  if nAchou < 0 then
  begin
    it := TACBrTerListaTerminalIP.Create;
    it.IP := ipTer;
    it.Terminal := NTerminal;
    fpTerminais.Add(it);
  end;
end;

function TACBrTERtcpClass.DecodeString(Texto: string): TACBrTERDecodeString;
begin
  result.Texto := Texto;
end;

procedure TACBrTERtcpClass.LeSerial(MillisecTimeOut: integer);
begin
  { Deve ser implementada na Classe Filha }
  raise Exception.Create(ACBrStr('Procedure LeSerial não implementada em: ') +
    ModeloStr);
end;

procedure TACBrTERtcpClass.LimpaTela(Terminal: integer; cliPorta: integer);
var
  i: integer;
begin
  try
    i := fpTerminais.Find(Terminal);
    if i >= 0 then
      with fpTerminais.Items[i].UltimoTexto do
      begin
        linha := 0;
        coluna := 1;
        CurPos := 0;
        Texto := '';
        fillchar(TextoDisplay, sizeof(TextoDisplay), ' ');
      end;
  except
    on e: Exception do
      raise Exception.Create('Erro LimpaTela ' + e.message);

  end;

end;

procedure TACBrTERtcpClass.Lock;
begin
  FSessaoCritica.Acquire;
end;

procedure TACBrTERtcpClass.PosicionaCursor(pLinha, pColuna: integer;
  Terminal: integer; cliPorta: integer);
var
  i: integer;
  t: TACBrTERUltimoTexto;
begin

  try
    i := fpTerminais.Find(Terminal);
    if i >= 0 then
    begin
      t := fpTerminais.Items[i].UltimoTexto;
      with fpTerminais.Items[i].UltimoTexto do
      begin
        linha := pLinha;
        coluna := pColuna;
        CurPos := (pLinha * DisplayNumeroColunas) + pColuna;
      end;

    end;
  except
    on e: Exception do
      raise Exception.Create('Erro PosicionaCursor ' + e.message);
  end;
end;

procedure TACBrTERtcpClass.ReenviaUltimoTexto(Terminal: integer;
  cliPorta: integer);
var
  i: integer;
  t: TACBrTERUltimoTexto;
  s: string;
begin
  i := fpTerminais.Find(Terminal);
  if i >= 0 then
  begin
    t := fpTerminais.Items[i].UltimoTexto;
    LimpaTela(Terminal, cliPorta);
    s := '';
    for i := 0 to (DisplayNumeroLinhas * DisplayNumeroColunas) - 1 do
      s := s + t.TextoDisplay[i];
    EnviaString(s, cliPorta, Terminal);
    PosicionaCursor(t.linha, t.coluna, Terminal, cliPorta);
  end;
end;

procedure TACBrTERtcpClass.RemoveTerminal(ipTer: string);
var
  i: integer;
begin
  for i := 0 to fpTerminais.Count - 1 do
    if sameText(fpTerminais.Items[i].IP, ipTer) then
    begin
      fpTerminais.delete(i);
      exit;
    end;

end;

procedure TACBrTERtcpClass.BackSpace(Terminal: integer);
begin
  { Deve ser implementada na Classe Filha }
  raise Exception.Create(ACBrStr('Procedure BackSpace não implementada em: ') +
    ModeloStr);
end;

procedure TACBrTERtcpClass.EnviaSerial(Texto: string; ACliPorta: integer;
  Terminal: integer);
begin
  raise Exception.Create(ACBrStr('Procedure EnviaSerial não implementada em: ')
    + ModeloStr);

end;

procedure TACBrTERtcpClass.EnviaString(pTexto: string; cliPorta: integer;
  Terminal: integer);
var
  i, j: integer;
  function min(a, b: integer): integer;
  begin
    if a < b then
      result := a
    else
      result := b;
  end;

var
  t: TACBrTERUltimoTexto;
begin
  try
    Lock;
    try
      i := fpTerminais.Find(Terminal);
      if i >= 0 then
      begin
        t := fpTerminais.Items[i].UltimoTexto;
        with fpTerminais.Items[i].UltimoTexto do
        begin
          Texto := pTexto;
          for j := 1 to min(1024 - CurPos, length(pTexto)) do
          begin
            TextoDisplay[CurPos] := pTexto[j];
            CurPos := CurPos + 1;
          end;
          coluna := CurPos mod DisplayNumeroColunas;
          linha := ((CurPos - coluna - 1) div DisplayNumeroColunas);
          t := fpTerminais.Items[i].UltimoTexto;
          if coluna <= 0 then
            coluna := 1;
          if linha < 0 then
            linha := 0;
        end;
      end;
    except
      on e: Exception do
        raise Exception.Create('Erro EnviaString ' + e.message);
    end;

  finally
    UnLock;
  end;

end;

function TACBrTERtcpClass.EncodeString(cod: TACBrTERDecodeString): string;
begin

end;

procedure TACBrTERtcpClass.EnviaAcionamento(cmd: string; Terminal: integer);
begin
  raise Exception.Create
    (ACBrStr('Procedure EnviaAcionamento não implementada em: ') + ModeloStr);
end;

procedure TACBrTERtcpClass.EnviaStatus(Terminal: integer);
begin

end;

procedure TACBrTERtcpClass.EnviaStatusTodos;
var
  i: integer;
begin
  for i := fpTerminais.Count - 1 downto 0 do
    EnviaStatus(fpTerminais.Items[i].Terminal);
end;

procedure TACBrTERtcpClass.EnviaParalela(Texto: string; ACliPorta: integer;
  Terminal: integer);
begin
  raise Exception.Create
    (ACBrStr('Procedure EnviaParalela não implementada em: ') + ModeloStr);

end;

procedure TACBrTERtcpClass.EnviaRotacao(Texto: string; linha: integer;
  Terminal: integer);
begin
  { Deve ser implementada na Classe Filha }
  raise Exception.Create(ACBrStr('Procedure EnviaRotacao não implementada em: ')
    + ModeloStr);
end;

procedure TACBrTERtcpClass.LeBalanca(Terminal: integer);
begin
  { Deve ser implementada na Classe Filha }
  raise Exception.Create(ACBrStr('Procedure LeBalanca não implementada em: ') +
    ModeloStr);
end;

{ TACBrTerTerminais }

function TACBrTerTerminais.Find(Terminal: integer): integer;
var
  i: integer;
begin
  result := -1;
  for i := 0 to Count - 1 do
    if Items[i].Terminal = Terminal then
    begin
      result := i;
      exit;
    end;
end;

function TACBrTerTerminais.FindTerminal(Terminal: integer)
  : TACBrTerListaTerminalIP;
var
  i: integer;
begin
  result := nil;
  i := Find(Terminal);
  if i >= 0 then
    result := Items[i];
end;

function TACBrTerTerminais.GetItems(idx: integer): TACBrTerListaTerminalIP;
begin
  result := TACBrTerListaTerminalIP(inherited Items[idx]);
end;

function TACBrTerTerminais.GetPrograma(sIP: string; nTerm: integer)
  : TACBrTerPrograma;
var
  i: integer;
begin
  result := nil;
  i := Procurar(sIP, nTerm);
  if i >= 0 then
    result := Items[i].Programa;
end;

function TACBrTerTerminais.Procurar(sIP: string; nTerm: integer): integer;
var
  i: integer;
begin
  result := -1;
  for i := 0 to Count - 1 do
    with Items[i] do
      if sameText(sIP, IP) then // and (nTerm=Terminal) then
      begin
        result := i;
        exit;
      end;
end;

procedure TACBrTerTerminais.SetItems(idx: integer;
  const Value: TACBrTerListaTerminalIP);
begin
  inherited Items[idx] := Value;
end;

procedure TACBrTerTerminais.SetProgramaClass(sIP: string; nTerm: integer;
  progClass: TACBrTerProgramaComumClass);
var
  i: integer;
begin
  i := Procurar(sIP, nTerm);
  if i >= 0 then
    Items[i].ProgramaClass := progClass;
end;

procedure TACBrTerTerminais.SetPrograma(sIP: string; nTerm: integer;
  pPrograma: TACBrTerPrograma);
var
  i: integer;
begin
  i := Procurar(sIP, nTerm);
  if i >= 0 then
    Items[i].Programa := pPrograma;
end;

procedure TACBrTERtcpClass.DoConectaClass(pIP: string; cliPorta: integer;
  var Terminal: integer);
begin
  DesconectarOutraPorta(pIP, cliPorta);
  // nao deixa o terminal conectar em 2 portas diferentes.
  TACBrTERtcp(fpOwner).DoIniciaConectaClass(self, pIP, cliPorta, Terminal);
  if Terminal < 0 then
  begin
  end
  else
    TACBrTERtcp(fpOwner).DoFinalizaConectaClass(self, pIP, Terminal);
end;

procedure TACBrTERtcpClass.DoDesConectaClass(pIP: string; Terminal: integer;
  porta: integer);
begin
  TACBrTERtcp(fpOwner).DoDesConectaClass(self, pIP, Terminal, porta);
end;

procedure TACBrTERtcpClass.DoRecebeClass(pTexto, pIP: string; cliPorta: integer;
  Terminal: integer);
var
  code: TACBrTERDecodeString;
begin
  code.Terminal := Terminal;
  code.HTerminal := Terminal;
  code.Comando := '';
  code.EncerraCMD := '';
  code.Texto := DecodeString(pTexto).Texto;
  { AL 19/07/13 - estranho .... o retorno mata os dados setados... alterado. }
  TACBrTERtcp(fpOwner).DoRecebeClass(self, code.Texto, pIP, cliPorta,
    code.Terminal);
end;

{ TACBrTerPrograma }

procedure TACBrTerPrograma.DoFinger_EstadoEvento(evento, cliPorta,
  Terminal: integer);
begin

end;

procedure TACBrTerPrograma.DoFinger_RecebeImagem(sender: TObject;
  pImagem, pIP: string; cliPorta, Terminal: integer);
begin

end;

procedure TACBrTerPrograma.Init;
begin
   TelaInicial;
end;

procedure TACBrTerPrograma.RecebeChar(c: char);
begin

end;

procedure TACBrTerPrograma.TelaInicial;
begin

end;

initialization

FSessaoCritica := TCriticalSection.Create;

finalization

FSessaoCritica.free;

end.
