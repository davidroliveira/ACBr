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
{ Esse arquivo usa a classe  SynaSer   Copyright (c)2001-2003, Lukas Gebauer }
{ Project : Ararat Synapse     (Found at URL: http://www.ararat.cz/synapse/) }
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
  |*  - Primeira Versao ACBrTER
  |
  |* 11/05/2011: Marcelo Ferreira (Marcelo-sp)
  |*  - Implemento - Função LeBalanca
  |*
  |* 04/07/2011: Amarildo Lacerda - lacerda@storeware.com.br
  |*  - Inclui suporte para terminal multimarca dentro de um mesmo processo
  |     Permite que terminais de fabricantes diferentes sejam utilizando no memso ambiente.

  Exemplo:
  Criar uma instancia do Servidor de Terminais:
  svr  :=  TACBrTERtcp.create(nil)
  svr.addTerminal (....)  ; para adicionar suporte a um fabricante/IP-terminal.
  Eventos: OnIniciaConectaClass -> disparado quando um terminal tenta se conectar ao servidor
  OnRecebeClass -> dados enviados pelo terminal (do teclado ou outro);
  OnDesConectaClass -> quando o terminal se desconecta do servidor.

  ****************************************************************************** }

{$I ACBr.inc}
Unit ACBrTERtcp;

{$undef INDY}

Interface

Uses Forms, Windows, ACBrBase, {ACBrDevice,} ACBrTERtcpClass, {Units da ACBr}
  SysUtils, {$IFDEF INDY} ACBrTerminalTCPComm, {$ELSE}blcksock, ACBrSocket,
  {$ENDIF}
{$IFDEF VisualCLX} QExtCtrls {$ELSE} ExtCtrls {$ENDIF},
{$IFDEF COMPILER6_UP} Types {$ELSE} Windows {$ENDIF},
  Contnrs, Classes;

Type

  TACBrTERConectaClass = procedure(terClass: TACBrTERtcpClass; pIP: String;
    cliPorta: integer; var Terminal: integer) of object;
  TACBrTERFinalizaConectaClass = procedure(terClass: TACBrTERtcpClass;
    pIP: String; Terminal: integer) of object;
  TACBrTERDesConectaClass = procedure(terClass: TACBrTERtcpClass; pIP: String;
    Terminal: integer; porta: integer) of object;
  TACBrTERRecebeClass = procedure(terClass: TACBrTERtcpClass; pTexto: string;
    pIP: String; cliPorta: integer; Terminal: integer) of object;

  TACBrTERtcp = class;

  TACBrTERFabricantes = class(TList)
  private
    function GetItems(idx: integer): TACBrTERtcpClass;
    procedure SetItems(idx: integer; const Value: TACBrTERtcpClass);
  public
{$IFDEF INDY}
    // fsTCP:TACBrTerminalTCP;
{$ELSE}
    fsTCP: TACBrTCPServer;
{$ENDIF}
    aOwner: TACBrTERtcp;
    function FindTerminal(nTerm: integer; ip: string): TACBrTERtcpClass;
    function GetTer(aip: string): TACBrTERtcpClass; overload;
    function GetTer(nTerm: integer): TACBrTERtcpClass; overload;
    function GetTerminal(aip: string): integer;
    property Items[idx: integer]: TACBrTERtcpClass read GetItems write SetItems;
    function AddTerminal(nTerm: integer; ip: String; pModelo: TACBrTERModelo)
      : TACBrTERtcpClass;
    function CriaModelo(pModelo: TACBrTERModelo): TACBrTERtcpClass;
    procedure EnviaStatus();
  end;

  { Componente ACBrTER }
  TACBrTERtcp = Class(TACBrComponent)
  Private
    fsFabricantes: TACBrTERFabricantes;
    fsPorta: String;
{$IFDEF INDY}
    // fpTCP : TACBrTerminalTCP;
{$ELSE}
    fpTCP: TACBrTCPServer;
{$ENDIF}
    { Propriedades do Componente ACBrTER }
    fsAtivo: Boolean;
    // evento do TCP
    FonRecebeEvent: TACBrTCPServerRecive;
    FOnDesConecta: TACBrTCPServerDesConecta;
    FOnConecta: TACBrTCPServerConecta;

    // eventos da classe terminal
    FOnDesConectaClass: TACBrTERDesConectaClass;
    FOnConectaClass: TACBrTERConectaClass;
    FOnRecebeClass: TACBrTERRecebeClass;
    FTimeoutInicializacao: integer;
    FOnFinalizaConecta: TACBrTERConectaClass;
    FOnFinalizaConectaClass: TACBrTERFinalizaConectaClass;

    Procedure SetPorta(Const Value: String);
    Procedure SetAtivo(Const Value: Boolean);

    Function GetPorta: String;

    function GetTer(ip: string): TACBrTERtcpClass;
    function GetTerminal(ip: string; nTerm: integer): TACBrTERtcpClass;
      overload;
    procedure SetOnConectaClass(const Value: TACBrTERConectaClass);
    procedure SetOnDesConectaClass(const Value: TACBrTERDesConectaClass);
    procedure SetOnRecebeClass(const Value: TACBrTERRecebeClass);
    procedure SetTimeoutInicializacao(const Value: integer);
    procedure SetOnFinalizaConectaClass(const Value
      : TACBrTERFinalizaConectaClass);

    procedure DoACBrTerTCPConectaTCP(const TCPBlockSocket: TTCPBlockSocket;
      var Enviar: AnsiString);
    procedure DoACBrTerTCPDesConectaTCP(const TCPBlockSocket: TTCPBlockSocket;
      Erro: integer; ErroDesc: String);
    procedure DoACBrTerTCPRecebeEventTCP(const TCPBlockSocket: TTCPBlockSocket;
      const Recebido: AnsiString; var Enviar: AnsiString);

  Public
    Constructor Create(aOwner: TComponent); Override;
    Destructor Destroy; Override;

    Procedure Ativar;
    Procedure Desativar;
    Procedure Limpar;
    procedure SetProgramaClass(nTerm: integer; ip: String;
      progClass: TACBrTerProgramaComumClass);
    property Ter[ip: string]: TACBrTERtcpClass read GetTer;
    property Fabricantes: TACBrTERFabricantes read fsFabricantes;
    function GetTerminal(aip: string): integer; overload;
    Property Ativo: Boolean Read fsAtivo Write SetAtivo;
    function AddTerminal(nTerm: integer; ip: String; pModelo: TACBrTERModelo)
      : TACBrTERtcpClass;

    procedure DoIniciaConectaClass(terClass: TACBrTERtcpClass; pIP: String;
      cliPorta: integer; var Terminal: integer); virtual;
    procedure DoFinalizaConectaClass(terClass: TACBrTERtcpClass; pIP: String;
      var Terminal: integer); virtual;
    procedure DoRecebeClass(terClass: TACBrTERtcpClass; pTexto: string;
      pIP: String; cliPorta: integer; Terminal: integer); virtual;
    procedure DoDesConectaClass(terClass: TACBrTERtcpClass; pIP: String;
      Terminal: integer; porta: integer); virtual;

    Procedure EnviaStatus; virtual;

  Published
    Property porta: String Read GetPorta Write SetPorta;
    Property TimeoutInicializacao: integer read FTimeoutInicializacao
      write SetTimeoutInicializacao;

    // para classes que usam protocolo proprietário
    Property OnRecebeClass: TACBrTERRecebeClass read FOnRecebeClass
      write SetOnRecebeClass;
    Property OnIniciaConectaClass: TACBrTERConectaClass read FOnConectaClass
      write SetOnConectaClass;
    property OnFinalizaConectaClass: TACBrTERFinalizaConectaClass
      read FOnFinalizaConectaClass write SetOnFinalizaConectaClass;
    Property OnDesconectaClass: TACBrTERDesConectaClass read FOnDesConectaClass
      write SetOnDesConectaClass;

  End;

procedure sleepIDLE(n: integer);

Implementation

Uses ACBrUtil, ACBrTERtcpVT100, ACBrTERtcpWilbor, // ACBrTERtcpGertec,
  // ACBrTERShellby ,  //ACBrTerScubaFinger,
{$IFDEF COMPILER6_UP} StrUtils {$ELSE} ACBrD5{$ENDIF},
  Math;

procedure sleepIDLE(n: integer);
var
  x: integer;
begin
  x := getTickCount + n;
  while getTickCount < x do
    application.ProcessMessages;
end;

{ TACBrTER }
Constructor TACBrTERtcp.Create(aOwner: TComponent);
Begin
  Inherited Create(aOwner);
{$IFDEF INDY}
  fpTCP := TACBrTerminalTCP.Create(nil);
{$ELSE}
  fpTCP := TACBrTCPServer.Create(nil);
  fpTCP.Terminador := '';
{$ENDIF}
  fpTCP.OnConecta := DoACBrTerTCPConectaTCP;
  fpTCP.OnDesConecta := DoACBrTerTCPDesConectaTCP;
  fpTCP.OnRecebeDados := DoACBrTerTCPRecebeEventTCP;

  fsFabricantes := TACBrTERFabricantes.Create;
  fsFabricantes.fsTCP := fpTCP;
  fsFabricantes.aOwner := self;

  fsAtivo := False;

  { Objetosm para controle da Rotação do Texto nos Terminais }

End;

Destructor TACBrTERtcp.Destroy;
Begin
  Desativar;
  fsFabricantes.fsTCP := nil;
  fsFabricantes.free;
  fpTCP.free;

  Inherited Destroy;
End;

Procedure TACBrTERtcp.SetAtivo(Const Value: Boolean);
Begin
  If Value Then
    Ativar
  Else
    Desativar;
End;

procedure TACBrTERtcp.SetOnConectaClass(const Value: TACBrTERConectaClass);
begin
  FOnConectaClass := Value;
end;

procedure TACBrTERtcp.SetOnDesConectaClass(const Value
  : TACBrTERDesConectaClass);
begin
  FOnDesConectaClass := Value;
end;

procedure TACBrTERtcp.SetOnFinalizaConectaClass(const Value
  : TACBrTERFinalizaConectaClass);
begin
  FOnFinalizaConectaClass := Value;
end;

procedure TACBrTERtcp.SetOnRecebeClass(const Value: TACBrTERRecebeClass);
begin
  FOnRecebeClass := Value;
end;

procedure TACBrTERtcp.SetProgramaClass(nTerm: integer; ip: String;
  progClass: TACBrTerProgramaComumClass);
var tr:TACBrTERtcpClass;
begin
  tr := fsFabricantes.FindTerminal(nTerm,ip);
  if assigned(tr) then
     tr.SetProgramaClass(nTerm,Ip,ProgClass);
end;

function TACBrTERtcp.AddTerminal(nTerm: integer; ip: String;
  pModelo: TACBrTERModelo): TACBrTERtcpClass;
begin
  result := fsFabricantes.AddTerminal(nTerm, ip, pModelo);
end;

Procedure TACBrTERtcp.Ativar;
Begin
  If fsAtivo Then
    Exit;
  fpTCP.Ativar;
  fsAtivo := True;
End;

Procedure TACBrTERtcp.Desativar;
Begin
  If Not fsAtivo Then
    Exit;

  fpTCP.Desativar;
  fsAtivo := False;
End;

Function TACBrTERtcp.GetPorta: String;
Begin
  result := fsPorta;
End;

function TACBrTERtcp.GetTer(ip: string): TACBrTERtcpClass;
begin
  result := fsFabricantes.GetTer(ip);
end;

function TACBrTERtcp.GetTerminal(ip: string; nTerm: integer): TACBrTERtcpClass;
var
  i: integer;
  x: integer;
begin
  result := nil;
  for i := 0 to fsFabricantes.count - 1 do
    with fsFabricantes.Items[i] do
      for x := 0 to Terminais.count - 1 do
      begin
        if (sametext(Terminais.Items[x].ip, ip)) and
          (Terminais.Items[x].Terminal = nTerm) then
        begin
          result := fsFabricantes.Items[i];
          Exit;
        end;
      end;

end;

function TACBrTERtcp.GetTerminal(aip: string): integer;
var
  t: TACBrTERtcpClass;
begin
  result := fsFabricantes.GetTerminal(aip);
end;

procedure TACBrTERtcp.Limpar;
begin
  fpTCP.Desativar;
  fsFabricantes.Clear;

end;

Procedure TACBrTERtcp.SetPorta(Const Value: String);
Begin
  fsPorta := Value;
  if fpTCP <> NIL then
    fpTCP.Port := Value;
End;

procedure TACBrTERtcp.SetTimeoutInicializacao(const Value: integer);
begin
  FTimeoutInicializacao := Value;
end;

procedure TACBrTERtcp.DoACBrTerTCPConectaTCP(const TCPBlockSocket
  : TTCPBlockSocket; var Enviar: AnsiString);
var
  Ater: TACBrTERtcpClass;
  term: integer;
  ip: string;
  k: integer;
  cliPorta: integer;
begin
  TCPBlockSocket.Accept;
  ip := TCPBlockSocket.GetRemoteSinIP;
  cliPorta := TCPBlockSocket.GetRemoteSinPort;

  Ater := Ter[ip];
  term := GetTerminal(ip);
  // cuidado .. comutadora 485.... existe 1 IP para varios terminais.
  if assigned(Ater) then
    Ater.DoConectaClass(ip, cliPorta, term)
  else // nao criou estrutura do terminal ainda...
  begin
    term := 0;
    DoIniciaConectaClass(nil, ip, cliPorta, term);
    if term < 0 then
    begin
      TCPBlockSocket.SendString('Term nao config');
      TCPBlockSocket.CloseSocket;
      Exit;
    end;
    Ater := Ter[ip];
    if (Ater <> nil) and (term >= 0) then
      DoFinalizaConectaClass(Ater, ip, term);

    k := GetTerminal(ip);
    if k < 0 then
    begin
      TCPBlockSocket.SendString('Terminal Desconhecido');
    end;

  end;
end;

procedure TACBrTERtcp.DoACBrTerTCPDesConectaTCP(const TCPBlockSocket
  : TTCPBlockSocket; Erro: integer; ErroDesc: String);
var
  Ter: TACBrTERtcpClass;
  term: integer;
  ip: string;
  porta: integer;
begin
  ip := TCPBlockSocket.GetRemoteSinIP;
  porta := TCPBlockSocket.GetRemoteSinPort;
  Ter := GetTer(ip);
  term := GetTerminal(ip);
  // cuidado .. comutadora 485.... existe 1 IP para varios terminais.
  Ter.DoDesConectaClass(ip, term, porta);
end;

procedure TACBrTERtcp.DoACBrTerTCPRecebeEventTCP(const TCPBlockSocket
  : TTCPBlockSocket; const Recebido: AnsiString; var Enviar: AnsiString);
var
  Ter: TACBrTERtcpClass;
  term: integer;
  ip: string;
begin
  ip := TCPBlockSocket.GetRemoteSinIP;
  Ter := GetTer(ip);
  term := GetTerminal(ip);
  // cuidado .. comutadora 485.... existe 1 IP para varios terminais.

  Ter.DoRecebeClass(Recebido, ip, TCPBlockSocket.GetRemoteSinPort, term);
end;

procedure TACBrTERtcp.DoIniciaConectaClass(terClass: TACBrTERtcpClass;
  pIP: String; cliPorta: integer; var Terminal: integer);
begin
  if assigned(FOnConectaClass) then
    FOnConectaClass(terClass, pIP, cliPorta, Terminal);
end;

procedure TACBrTERtcp.DoDesConectaClass(terClass: TACBrTERtcpClass; pIP: String;
  Terminal: integer; porta: integer);
begin
  if assigned(FOnDesConectaClass) then
    FOnDesConectaClass(terClass, pIP, Terminal, porta);
end;

procedure TACBrTERtcp.DoFinalizaConectaClass(terClass: TACBrTERtcpClass;
  pIP: String; var Terminal: integer);
begin
  if assigned(FOnFinalizaConectaClass) then
    FOnFinalizaConectaClass(terClass, pIP, Terminal);
end;

procedure TACBrTERtcp.DoRecebeClass(terClass: TACBrTERtcpClass;
  pTexto, pIP: String; cliPorta: integer; Terminal: integer);
begin
  if assigned(FOnRecebeClass) then
    FOnRecebeClass(terClass, pTexto, pIP, cliPorta, Terminal);
end;

procedure TACBrTERtcp.EnviaStatus;
var
  i: integer;
begin
  for i := 0 to fsFabricantes.count - 1 do
    fsFabricantes.EnviaStatus;
end;

{ procedure TACBrTERtcp.DoTCPDesConecta(const TCPBlockSocket: TTCPBlockSocket;
  Erro: Integer; ErroDesc: String);
  var ter:TACBrTERtcpClass;
  begin
  ter := fsFabricantes.GetTer( TCPBlockSocket.GetRemoteSinIP );
  if assigned(FOnDesConecta) then
  FOnDesConecta(ter,TCPBlockSocket);
  end;
}

{ procedure TACBrTERtcp.DoTCPRecebe(const TCPBlockSocket: TTCPBlockSocket;
  const Recebido: AnsiString; var Enviar: AnsiString);
  var ter:TACBrTERtcpClass;
  code:TACBrTERDecodeString;
  begin
  ter := fsFabricantes.GetTer( TCPBlockSocket.GetRemoteSinIP );
  code:=ter.DecodeString(recebido);
  code.Terminal := ter.GetTerminal(TCPBlockSocket.GetRemoteSinIP );
  if assigned(FonRecebeEvent) then
  FonRecebeEvent(ter,TCPBlockSocket,code,recebido);
  end;
}

{ TACBrTERFabricantes }

function TACBrTERFabricantes.FindTerminal(nTerm:integer;ip:string):TACBrTERtcpClass;
begin
  result := GetTer(ip);
  if not assigned(result) then
     result := getTer(nTerm);
end;

function TACBrTERFabricantes.AddTerminal(nTerm: integer; ip: String;
  pModelo: TACBrTERModelo): TACBrTERtcpClass;
var
  i: integer;
  achei: integer;

begin
  achei := -1;
  for i := 0 to count - 1 do
    if Items[i].Modelo = pModelo then // checa se o modelo ja foi carregado
    begin
      achei := i;
      break;
    end;
  if achei < 0 then
    result := CriaModelo(pModelo)
  else
  begin
    result := Items[i];
  end;

  result.AddTerminal(ip, nTerm);

end;

function TACBrTERFabricantes.CriaModelo(pModelo: TACBrTERModelo)
  : TACBrTERtcpClass;
begin
  case pModelo of
    terNenhum:
      result := TACBrTERtcpClass.Create(aOwner);
    terWilborTCP:
      result := TACBrTERtcpWilbor.Create(aOwner);
    terWilborComutadoraTCP:
      begin
        result := TACBrTERtcpWilborComutadora.Create(aOwner);
      end;
    // terGertec: Result := TACBrTERtcpGertec.Create(aOwner);
    // terShellby : Result := TACBrTERShellby.Create(AOwner);
    terVT100:
      result := TACBrTERtcpVT100.Create(aOwner);
    // terVT100_ScubaFinger : result := TACBrTERtcpVT100_ScubaFinger.create(AOwner);
  end;
  add(result);
  result.TCP := fsTCP;
end;

procedure TACBrTERFabricantes.EnviaStatus();
var
  i: integer;
begin
  for i := 0 to count - 1 do
    Items[i].EnviaStatusTodos;
end;

function TACBrTERFabricantes.GetItems(idx: integer): TACBrTERtcpClass;
begin
  result := TACBrTERtcpClass(inherited Items[idx]);
end;

function TACBrTERFabricantes.GetTer(nTerm: integer): TACBrTERtcpClass;
var
  i: integer;
begin
  result := nil;
  for i := 0 to count - 1 do
    if Items[i].GetIP(nTerm) <> '' then
    begin
      result := Items[i];
      break;
    end;
end;

function TACBrTERFabricantes.GetTerminal(aip: string): integer;
var
  Ter: TACBrTERtcpClass;
begin
  Ter := GetTer(aip);
  result := -1;
  if Ter <> nil then
    result := Ter.GetTerminal(aip);
end;

function TACBrTERFabricantes.GetTer(aip: string): TACBrTERtcpClass;
var
  i: integer;
begin
  result := nil;
  for i := 0 to count - 1 do
    if Items[i].GetTerminal(aip) >= 0 then
    begin
      result := Items[i];
      break;
    end;
end;

procedure TACBrTERFabricantes.SetItems(idx: integer;
  const Value: TACBrTERtcpClass);
begin
  inherited Items[idx] := Value;
end;

End.
