unit wTerminalTCP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uACBrTERTcp, ACBrTerTcpClass,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type

  TGuiThread = class(TThread)
    private
      procedure DoMsg;
    protected
      procedure Execute;override;
    public
      Memo:TMemo;
      Texto:string;
  end;


  TForm2 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FTerClass: TTerminalClass;
    procedure ReprogramaTerminais;
  public
    { Public declarations }
    procedure msg(txt: string);
    procedure TERConecta(terClass: TACBrTERtcpClass; pIP: String;
      cliPorta: integer; var Terminal: integer);
    procedure TERFinalizaConecta(terClass: TACBrTERtcpClass; pIP: String;
      Terminal: integer);
    procedure TERDesConecta(terClass: TACBrTERtcpClass; pIP: String;
      Terminal: integer; porta: integer);
    procedure TERRecebe(terClass: TACBrTERtcpClass; pTexto: string; pIP: String;
      cliPorta: integer; Terminal: integer);
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}


procedure TForm2.Button1Click(Sender: TObject);
begin
  if FTerClass.ativo then
  begin
    FTerClass.Destivar;
    Button1.caption := 'Ligar';
    msg('Desligou');
  end
  else
  begin
    Memo1.Lines.Clear;
    ReprogramaTerminais;
    FTerClass.Ativar;
    Button1.caption := 'Desligar';
    msg('Ligou');
  end;
end;

procedure TForm2.ReprogramaTerminais;
begin

  FTerClass.Destivar;
  FTerClass.Limpar;
  FTerClass.porta := strToIntDef(Edit1.Text, 1001);

  FTerClass.OnTERConecta := TERConecta;
  FTerClass.OnTERFinaliza  := TERFinalizaConecta;
  FTerClass.OnTERDesConecta := TERDesConecta;
  FTerClass.OnTERRecebe := TERRecebe;
  FTerClass.onMsg := Msg;

  // Pega uma tabela interna e reprograma os ip e terminais validos
  // cada terminal deve ser programado aqui..
  // fornecer a classe que contem os passos do programa (herança de TTerminalAbstract);
  // nTerm e IP não podem ser repetidos;
  // utiliza combinção de nTerm e IP para diferenciar IPs e Comutadoras;
  // quando é um comutadora, o terminal envia o seu número - sendo todos os terminais no mesmo IP
  // quando o terminal é TCP, cada terminal tem um IP diferente.
  FTerClass.AdicionaTerminal(1, '127.0.0.1', terWilborTCP, TTerminalConsulta);

end;

procedure TForm2.TERConecta(terClass: TACBrTERtcpClass; pIP: String;
  cliPorta: integer; var Terminal: integer);
begin
  msg('Iniciando: '+pIP);
end;

procedure TForm2.TERDesConecta(terClass: TACBrTERtcpClass; pIP: String;
  Terminal, porta: integer);
begin
   msg('Desconectou: '+pIP);
end;

procedure TForm2.TERFinalizaConecta(terClass: TACBrTERtcpClass; pIP: String;
  Terminal: integer);
begin
    msg('Finalizou: '+pIP);
end;

procedure TForm2.TERRecebe(terClass: TACBrTERtcpClass; pTexto, pIP: String;
  cliPorta, Terminal: integer);
begin

end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  FTerClass := TTerminalClass.create(self);
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  FTerClass.free;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  FTerClass.InitTerm;
end;

procedure TForm2.msg(txt: string);
begin
// http://delphi.about.com/od/kbthread/a/thread-gui.htm
    with TGuiThread.Create(true) do
    try
      Memo :=memo1;
      texto := txt;
      execute;
    finally
    end;
end;

{ TGuiThread }

procedure TGuiThread.DoMsg;
begin
  while memo.Lines.Count>50 do
       memo.Lines.Delete(0);
  memo.Lines.Add(texto);

end;

procedure TGuiThread.Execute;
begin
  //inherited;
  FreeOnTerminate := true;
  Synchronize(DoMsg);

end;

end.
