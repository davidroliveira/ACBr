unit uACBrTERTcp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ACBrTERtcpClass, ACBrTerTCP;


const
    tecla_enter = #13;
    tecla_voltar = #8;
    tecla_delete = #127;
    tecla_tab = #9;

type


   TOnTextoEvent = procedure (texto:string) of object;

  TTerminalClass = class(TComponent)
  private
    { Private declarations }
    FTermConn: TACBrTERtcp;
    FPorta: integer;
    FOnTERConecta: TACBrTERConectaClass;
    FOnTERFinaliza: TACBrTERFinalizaConectaClass;
    FOnTERDesConecta: TACBrTERDesConectaClass;
    FOnTERRecebe: TACBrTERRecebeClass;
    FonMsg: TOnTextoEvent;
    procedure msg(txt: string);
    procedure SetPorta(const Value: integer);
    procedure SetOnTERConecta(const Value: TACBrTERConectaClass);
    procedure SetOnTERFinaliza(const Value: TACBrTERFinalizaConectaClass);
    procedure SetOnTERDesConecta(const Value: TACBrTERDesConectaClass);
    procedure SetOnTERRecebe(const Value: TACBrTERRecebeClass);
    procedure SetonMsg(const Value: TOnTextoEvent);
  protected
    { Public declarations }
    procedure DoACBrTERConectaClass(terClass: TACBrTERtcpClass; pIP: string;
      cliPorta: integer; var nTerminal: integer);
    procedure DoACBrTERRecebeClass(terClass: TACBrTERtcpClass; pTexto: string;
      pIP: string; cliPorta: integer; nTerminal: integer);
    procedure DoACBrTERDesConectaClass(terClass: TACBrTERtcpClass; pIP: string;
      nTerminal: integer; porta: integer);
    procedure DoACBrTERFinalizaConectaClass(terClass: TACBrTERtcpClass;
      pIP: string; nTerminal: integer);
  public
    constructor create(ow: TComponent); override;
    property porta: integer read FPorta write SetPorta;
    procedure InitTerm;
    function AdicionaTerminal(nTerm: integer; ip: string;
      modelo: TACBrTERModelo; progClass: TACBrTerProgramaComumClass)
      : TACBrTERtcpClass;
    procedure Ativar;
    procedure Destivar;
    function Ativo: boolean;
    procedure Limpar;
    property OnTERConecta: TACBrTERConectaClass read FOnTERConecta
      write SetOnTERConecta;
    property OnTERFinaliza: TACBrTERFinalizaConectaClass read FOnTERFinaliza
      write SetOnTERFinaliza;
    property OnTERDesConecta: TACBrTERDesConectaClass read FOnTERDesConecta
      write SetOnTERDesConecta;
    property OnTERRecebe: TACBrTERRecebeClass read FOnTERRecebe
      write SetOnTERRecebe;
    property onMsg:TOnTextoEvent read FonMsg write SetonMsg;
  end;

  // exemplo
  // programa do microterminal - para consulta de produto
  TTerminalConsulta = class(TACBrTerProgramaComum)
  private
    FCodigo: string;
  public
    procedure TelaInicial; override;
    procedure ev_pega_codigo_produto(c: char);
    procedure ev_mostra_dados_produto(c: char);
    procedure ev_mostra_produto_nao_encontrado(c: char);
  end;

implementation

function TTerminalClass.AdicionaTerminal(nTerm: integer; ip: string;
  modelo: TACBrTERModelo; progClass: TACBrTerProgramaComumClass): TACBrTERtcpClass;
begin
  if not assigned(FTermConn) then
    raise exception.create('Não iniciar estrutura de comunicação');
  result := FTermConn.AddTerminal(nTerm, ip, modelo);
  FTermConn.SetProgramaClass(nTerm, ip, progClass);
end;

procedure TTerminalClass.Ativar;
begin
  FTermConn.Ativar;
end;

constructor TTerminalClass.create(ow: TComponent);
begin
  inherited;
  FPorta := 1001;
end;

procedure TTerminalClass.Destivar;
begin
  FTermConn.Desativar;
end;

procedure TTerminalClass.DoACBrTERConectaClass(terClass: TACBrTERtcpClass;
  pIP: string; cliPorta: integer; var nTerminal: integer);

var
  i: integer;
  modelo: TACBrTERModelo;
  term: TACBrTerListaTerminalIP;
begin

  InitTerm;
  i := FTermConn.GetTerminal(pIP);
  term := terClass.FindTerminal(nTerminal);

  if not assigned(term.programa) then
  begin
    // terminal não foi criado para a lista de terminais ativos
    // inicia o programa
    term.programa := term.ProgramaClass.create(self);
    term.programa.nTerm := nTerminal;
    term.programa.pIP := pIP;
    term.programa.cliPorta := cliPorta;
    term.programa.Terminal := terClass;
    term.programa.Init;
  end
  else
  begin // programa ja se encontra na memoria;
     term := terClass.FindTerminal(nTerminal);
    //terClass.ReenviaUltimoTexto(nTerminal, cliPorta);
    //term.Programa.TelaInicial;
  end;

  if assigned(FOnTERConecta) then
    FOnTERConecta(terClass, pIP, cliPorta, nTerminal);

end;

procedure TTerminalClass.DoACBrTERDesConectaClass(terClass: TACBrTERtcpClass;
  pIP: string; nTerminal, porta: integer);
begin
  if assigned(FOnTERDesConecta) then
    FOnTERDesConecta(terClass, pIP, nTerminal, porta);
end;

procedure TTerminalClass.DoACBrTERFinalizaConectaClass
  (terClass: TACBrTERtcpClass; pIP: string; nTerminal: integer);
begin
  if assigned(FOnTERFinaliza) then
    FOnTERFinaliza(terClass, pIP, nTerminal);
end;

procedure TTerminalClass.InitTerm;
begin
  if not assigned(FTermConn) then
  begin
    FTermConn := TACBrTERtcp.create(nil);
    FTermConn.Desativar;
    FTermConn.OnIniciaConectaClass := DoACBrTERConectaClass;
    FTermConn.OnRecebeClass := DoACBrTERRecebeClass;
    FTermConn.OnFinalizaConectaClass := DoACBrTERFinalizaConectaClass;
    FTermConn.OnDesconectaClass := DoACBrTERDesConectaClass;
    FTermConn.porta := intToStr(FPorta);
  end;
end;

procedure TTerminalClass.msg(txt: string);
begin
  // cuidado com tratamento multi-thread - é preciso sincronizar a interface GUI
  // Memo1.Lines.Add(txt);
  if assigned(FOnMsg) then
     FOnMsg(txt);
end;

procedure TTerminalClass.SetonMsg(const Value: TOnTextoEvent);
begin
  FonMsg := Value;
end;

procedure TTerminalClass.SetOnTERConecta(const Value: TACBrTERConectaClass);
begin
  FOnTERConecta := Value;
end;

procedure TTerminalClass.SetOnTERDesConecta(const Value
  : TACBrTERDesConectaClass);
begin
  FOnTERDesConecta := Value;
end;

procedure TTerminalClass.SetOnTERFinaliza(const Value
  : TACBrTERFinalizaConectaClass);
begin
  FOnTERFinaliza := Value;
end;

procedure TTerminalClass.SetOnTERRecebe(const Value: TACBrTERRecebeClass);
begin
  FOnTERRecebe := Value;
end;

procedure TTerminalClass.SetPorta(const Value: integer);
begin
  FPorta := Value;
end;

procedure TTerminalClass.DoACBrTERRecebeClass(terClass: TACBrTERtcpClass;
  pTexto, pIP: string; cliPorta, nTerminal: integer);
var
  term: TACBrTerListaTerminalIP;
var
  i: integer;
begin

  if assigned(FOnTERRecebe) then
    FOnTERRecebe(terClass, pTexto, pIP, cliPorta, nTerminal);

  term := terClass.FindTerminal(nTerminal);
  for i := 1 to length(pTexto) do
    term.programa.RecebeChar(pTexto[i]);

end;

{ TTerminalConsulta }

procedure TTerminalConsulta.ev_mostra_dados_produto(c: char);
begin
  case c of
    #0:
      begin
        DispClear;
        DispEcho('Produto Exemplo');
        DispPos(1, 0);
        DispEcho('Preço Unitário: XXXX');
        OnExecuteEvent := ev_mostra_dados_produto;  // controle de fluxo de dados
      end;
  else
    TelaInicial;
  end;
end;

procedure TTerminalConsulta.ev_mostra_produto_nao_encontrado(c: char);
begin
  case c of
    #0:
      begin
        DispPos(0, 0);
        DispEcho('Produto Não Encontrado');
        OnExecuteEvent := ev_mostra_produto_nao_encontrado; // controle do fluxo
      end;
  else
    TelaInicial;
  end;
end;

procedure TTerminalConsulta.ev_pega_codigo_produto(c: char);
var
  valido: boolean;
  procedure mostrar;
  begin
        DispPos(0, 13);
        DispEcho(copy(FCodigo+'_________________',1,13));
  end;
begin
  case c of
    #0: // é para inicializar a tarefa de pagar o codigo
      begin
        DispClear;
        DispEcho('Cod.Produto: ');
        FCodigo := '';
        mostrar;

        //  !!  importante... para manter controle do fluxo de dados
        OnExecuteEvent := ev_pega_codigo_produto; // marca que as proximas teclas serao tratadas neste procedimento

      end;
    tecla_delete:
      begin
        FCodigo := Copy(FCodigo,1,length(FCodigo)-1);
        mostrar;
      end;
    '0' .. '9':
      begin
        // caracteres aceitos para o codigo
        FCodigo := FCodigo + c;
        mostrar;
      end;
    #13: // enter
      begin
        valido := false;
        // valida os dados digitados
        // ...

        valido := FCodigo = '123';

        if valido then
          ev_mostra_dados_produto(#0)
        else
          ev_mostra_produto_nao_encontrado(#0);

      end;
  end;
end;

procedure TTerminalConsulta.TelaInicial;
begin
  inherited;
  ev_pega_codigo_produto(#0);
end;

{ TTerminalClass }

function TTerminalClass.Ativo: boolean;
begin
  result := FTermConn.Ativo;
end;

procedure TTerminalClass.Limpar;
begin
  FTermConn.Limpar;
end;

end.
