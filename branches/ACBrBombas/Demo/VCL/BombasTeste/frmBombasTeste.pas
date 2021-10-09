unit frmBombasTeste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    Edit4: TEdit;
    Button3: TButton;
    Memo1: TMemo;
    Label3: TLabel;
    Label4: TLabel;
    Button4: TButton;
    Edit5: TEdit;
    Label5: TLabel;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    DateTimePicker1: TDateTimePicker;
    Button8: TButton;
    DateTimePicker2: TDateTimePicker;
    Button9: TButton;
    lblStatus: TLabel;
    Button10: TButton;
    Button11: TButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Button12: TButton;
    Timer1: TTimer;
    Button13: TButton;
    Label6: TLabel;
    LeEncerranteBico: TButton;
    Label7: TLabel;
    Label8: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure LeEncerranteBicoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses ACBrBombas,ACBrBombasclass;

{$R *.dfm}
var
  Bomba: TACBrBombas;

procedure TForm1.Button1Click(Sender: TObject);
begin
  bomba.TipoConexao := tcDLLTCPIP;
//  Bomba.IPConcentrador := Edit1.Text;
//  bomba.PortaIP := Edit2.Text;
  bomba.Ativar;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  bomba.AlteraPrecoBico(strtoint(edit4.Text),strtofloat(edit3.Text))
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  bomba.Desativar;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  bomba := TACBrBombas.Create(self);

  bomba.Modelo := bombaCompanytec;

  DateTimePicker1.DateTime := now;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  bomba.BloquearBico(strtoint(edit5.Text));
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  bomba.AutorizaBico(strtoint(edit5.Text))
end;

procedure TForm1.Button6Click(Sender: TObject);
var
  status:TStatusBicoBomba;
begin
  bomba.LeStatusBico(strtoint(edit5.Text),status);

  case status of
    sbbLivre: memo1.Lines.Add('sbbLivre');
    sbbBloqueada: memo1.Lines.Add('sbbBloqueada');
    sbbAbastecimentoConcluido: memo1.Lines.Add('sbbAbastecimentoConcluido');
    sbbOcupada: memo1.Lines.Add('sbbOcupada');
    sbbEmFalha: memo1.Lines.Add('sbbEmFalha');
    sbbAbastInterrompido: memo1.Lines.Add('sbbAbastInterrompido');
  end;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  DateTimePicker1.Date := DateTimePicker2.Date;
  bomba.AjustaRelogio(DateTimePicker1.DateTime);
end;

procedure TForm1.Button8Click(Sender: TObject);
var
  Volume,Valor: Real;
begin
  bomba.LeAbastecimentoemAndamentoBico(strtoint(edit5.Text),Volume,Valor);
  memo1.Lines.add('bico: '+edit5.Text+
                    ' Valor: '+floattostr(valor)+
                    ' Volume: '+floattostr(volume));
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  case Bomba.StatusComunicacao of
    0: lblStatus.Caption := '0';
    1: lblStatus.Caption := '1'; //company connectado
    else lblStatus.Caption := 'else'; //error?
  end;
end;

procedure TForm1.Button10Click(Sender: TObject);
var
  listaAbast: TListaAbastecimentos;
  i:integer;
begin
  bomba.LeAbastecimentosPendentes(listaAbast);
  for i := 0 to high(listaAbast) do
  begin
    memo1.Lines.Add('Abastecimento:  '+
        ' Bico '+ listaAbast[i-1].Bico +
        ' Hora '+ TimeToStr(listaAbast[i-1].Hora) +
        ' Data '+ DateToStr(listaAbast[i-1].Data) +
        ' PrecoUnitario '+ floattostr(listaAbast[i-1].PrecoUnitario) +
        ' Litros '+ floattostr(listaAbast[i-1].Litros) +
        ' ValorTotal '+ floattostr(listaAbast[i-1].ValorTotal) +
        ' Encerrante '+ floattostr(listaAbast[i-1].Encerrante) +
        ' VirgulaPrecoUnitario '+ inttostr(listaAbast[i-1].VirgulaPrecoUnitario) +
        ' VirgulaLitros '+ inttostr(listaAbast[i-1].VirgulaLitros) +
        ';');
  end;

end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  bomba.PredeterminaAbastecimentoemValorBico(strtoint(edit4.Text),strtofloat(edit3.Text));
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Button8.Click;  
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  Timer1.Enabled := not Timer1.Enabled;
  if Timer1.Enabled then label6.Font.Color := clBlue
  else label6.Font.Color := clred;
end;

procedure TForm1.LeEncerranteBicoClick(Sender: TObject);
var
  dadosEncerrante: Encerrante;
begin
  bomba.LeEncerrantesBico(strtoint(Edit5.Text), dadosEncerrante);
end;

end.
