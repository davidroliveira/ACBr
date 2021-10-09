unit QLCBTeste1;

interface

uses SysUtils, Types, Classes, Variants,
 {$ifdef MSWINDOWS} Windows, {$endif}
 {$ifdef LINUX} Libc, {$endif}
    QForms, QStdCtrls, QControls, QExtCtrls, QDialogs, ACBrLCB, ACBrBase ;

type
  TForm1 = class(TForm)
    ACBrLCB1: TACBrLCB;
    mProdutos: TMemo;
    Label1: TLabel;
    cbFila: TCheckBox;
    edIntervalo: TEdit;
    Label3: TLabel;
    cbxPorta: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    edSufixo: TEdit;
    mFila: TMemo;
    Label6: TLabel;
    Button1: TButton;
    cbExcluirSufixo: TCheckBox;
    Label2: TLabel;
    edAtraso: TEdit;
    pAtraso: TPanel;
    bApagarFila: TButton;
    bLerFila: TButton;
    lUltimaLeitura: TLabel;
    bAtivar: TButton;
    procedure ACBrLCB1LeCodigo(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cbxPortaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edSufixoChange(Sender: TObject);
    procedure edIntervaloChange(Sender: TObject);
    procedure cbFilaClick(Sender: TObject);
    procedure cbExcluirSufixoClick(Sender: TObject);
    procedure bApagarFilaClick(Sender: TObject);
    procedure bLerFilaClick(Sender: TObject);
    procedure ACBrLCB1LeFila(Sender: TObject);
    procedure bAtivarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Function Converte( cmd : String) : String;
    procedure Vende ;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses DateUtils;

{$R *.xfm}

function TForm1.Converte(cmd: String): String;
var A : Integer ;
begin
  Result := '' ;
  For A := 1 to length( cmd ) do
  begin
     if not (cmd[A] in ['A'..'Z','a'..'z','0'..'9',
                        ' ','.',',','/','?','<','>',';',':',']','[','{','}',
                        '\','|','=','+','-','_',')','(','*','&','^','%','$',
                        '#','@','!','~',']' ]) then
        Result := Result + '#' + IntToStr(ord( cmd[A] )) + ' '
     else
        Result := Result + cmd[A] + ' ';
  end ;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
{$ifdef MSWINDOWS}  Show : Integer;{$endif}
ConnectCommand : PChar;
Command : String ;
begin
  {$ifdef LINUX}
     Command := './QEmulaLCB' ;
     ConnectCommand := PChar(Command + ' &');
     Libc.system(ConnectCommand);
  {$endif}
  {$ifdef MSWINDOWS}
     Command := 'QEmulaLCB.EXE' ;
     ConnectCommand := PChar(Command);
     Show := sw_ShowNormal;
     winexec(ConnectCommand, Show);
  {$endif}
end;

procedure TForm1.cbxPortaChange(Sender: TObject);
begin
  ACBrLCB1.Desativar ;
  ACBrLCB1.Porta := cbxPorta.Text ;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  cbxPorta.Text    := ACBrLCB1.Porta ;
  edIntervalo.Text := IntToStr(ACBrLCB1.Intervalo) ;
  edSufixo.Text    := ACBrLCB1.Sufixo ;
  cbFila.Checked   := ACBrLCB1.UsarFila ;
  cbExcluirSufixo.Checked := ACBrLCB1.ExcluirSufixo ;

  cbFilaClick( Sender );
end;

procedure TForm1.edSufixoChange(Sender: TObject);
begin
  ACBrLCB1.Sufixo := edSufixo.Text ;
end;

procedure TForm1.edIntervaloChange(Sender: TObject);
Var Intervalo : Integer ; 
begin
  Intervalo := StrToIntDef(edIntervalo.Text,0) ;
  ACBrLCB1.Intervalo := Intervalo ;
  if Intervalo > 0 then
   begin
//     ACBrLCB1.Ativar ;
     mProdutos.Lines.Add('Ativado - Lendo a cada: '+IntToStr( Intervalo )+
                         ' milisegundos' ) ;
   end
  else
     mProdutos.Lines.Add('Desativado') ;
end;

procedure TForm1.cbFilaClick(Sender: TObject);
begin
  ACBrLCB1.UsarFila   := cbFila.Checked ;
  edSufixo.Text       := ACBrLCB1.Sufixo ;
  bLerFila.Enabled    := ACBrLCB1.UsarFila ;
  bApagarFila.Enabled := ACBrLCB1.UsarFila ;
end;

procedure TForm1.cbExcluirSufixoClick(Sender: TObject);
begin
  ACBrLCB1.ExcluirSufixo := cbExcluirSufixo.Checked ;
end;

procedure TForm1.bApagarFilaClick(Sender: TObject);
begin
  if MessageDlg('Apagar a fila ?',mtConfirmation,mbYesNoCancel,0) = mrYes then
  begin
     ACBrLCB1.ApagarFila ;
     mFila.Lines.Assign( ACBrLCB1.Fila );
  end ;
end;

procedure TForm1.bLerFilaClick(Sender: TObject);
begin
  ACBrLCB1.LerFila ;
  ACBrLCB1LeCodigo( Sender );
end;

procedure TForm1.ACBrLCB1LeCodigo(Sender: TObject);
begin
  lUltimaLeitura.Caption := Converte( ACBrLCB1.UltimaLeitura ) ;

  if not ACBrLCB1.UsarFila then
     Vende
  else
     mFila.Lines.Assign( ACBrLCB1.Fila );
end;

procedure TForm1.ACBrLCB1LeFila(Sender: TObject);
begin
  mFila.Lines.Assign( ACBrLCB1.Fila );
  Vende ;
end;

procedure TForm1.Vende;
Var Atraso : Integer ;
begin
  mProdutos.Lines.Add( 'Cód: '+ACBrLCB1.UltimoCodigo ) ;

  Atraso := StrToIntDef(edAtraso.Text,0) ;
  if Atraso > 0 then
  begin
     pAtraso.Caption := 'Ultimo código lido: '+sLineBreak+ACBrLCB1.UltimoCodigo ;
     pAtraso.Visible := true ;
     Application.ProcessMessages ;
     Sleep( Atraso );
     pAtraso.Visible := false ;
  end ;

end;

procedure TForm1.bAtivarClick(Sender: TObject);
begin
  ACBrLCB1.Ativar ;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ACBrLCB1.Desativar ;
end;

end.
