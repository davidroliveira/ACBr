{******************************************************************************}
{ Projeto: ACBr Monitor                                                        }
{  Executavel multiplataforma que faz uso do conjunto de componentes ACBr para }
{ criar uma interface de comunicação com equipamentos de automacao comercial.  }
{                                                                              }
{ Direitos Autorais Reservados (c) 2006 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:     2005 Fábio Rogério Baía                     }
{                                                                              }
{  Você pode obter a última versão desse arquivo na página do Projeto ACBr     }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{ Daniel Simões de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Praça Anita Costa, 34 - Tatuí - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{******************************************************************************
|* Historico ACBr Monitor
|*
|* 07/03/2005: Primeiros Esboços
|*    Fabio Rogerio Baia
|* 24/03/2005: Migraçao para CLX
|*    Daniel Simoes de Almeida
******************************************************************************}
{$DEFINE VisualCLX}
{$I ACBr.inc}

unit ACBrMonitor1;
interface

uses
  SysUtils, Classes, QForms, QTrayIcon, QStyle, Qt, 
  ACBrBase, ACBrECF, ACBrECFClass, ACBrDIS, ACBrGAV, ACBrCHQ, ACBrLCB,  { Unit do ACBr }
  IdBaseComponent, IdComponent, IdTCPServer, QExtCtrls, QMenus, QTypes,
  QImgList, QStdCtrls, QComCtrls, QControls, QButtons ;

const
   Versao = '0.4a' ;
   Estados : array[TACBrECFEstado] of string =
             ('Não Inicializada', 'Desconhecido', 'Livre', 'Venda',
              'Pagamento', 'Relatório', 'Bloqueada', 'Requer Z', 'Requer X' );
   Objetos = '"ECF","CHQ","GAV","DIS","ACBR"' ;  { Objetos suportados nos Comandos }
   BufferResposta = 1000 ;                { Maximo de Linhas no MemoResposta }

type
TACBrCmd = class
  private
    fsParams : TStringList ;
    fsComando: String;
    fsObjeto : String;
    fsMetodo : String;
    fsResposta: String;
    procedure SetComando(const Value: String);

  public
    constructor Create;
    destructor Destroy; override ;

    function Params( Index : Integer) : String ;

    property Comando : String      read fsComando write SetComando ;
    property Objeto  : String      read fsObjeto ;
    property Metodo  : String      read fsMetodo ;
    property Resposta: String      read fsResposta write fsResposta ;
  end;

type
  TFrmACBrMonitor = class(TForm)
    ACBrECF1: TACBrECF;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    ACBrCHQ1: TACBrCHQ;
    ACBrGAV1: TACBrGAV;
    ACBrDIS1: TACBrDIS;
    pmTray: TPopupMenu;
    Restaurar1: TMenuItem;
    Encerrar1: TMenuItem;
    Ocultar1: TMenuItem;
    N1: TMenuItem;
    pBotoes: TPanel;
    btMinimizar: TBitBtn;
    bConfig: TBitBtn;
    ACBrLCB1: TACBrLCB;
    pPrincipal: TPanel;
    pCmd: TPanel;
    mCmd: TMemo;
    pTopCmd: TPanel;
    pRespostas: TPanel;
    mResp: TMemo;
    pTopRespostas: TPanel;
    Splitter1: TSplitter;
    pConfig: TPanel;
    PageControl1: TPageControl;
    tsMonitor: TTabSheet;
    cbLog: TCheckBox;
    Label4: TLabel;
    edArqLog: TEdit;
    cbSenha: TCheckBox;
    Label3: TLabel;
    edSenha: TEdit;
    gbTCP: TGroupBox;
    Label5: TLabel;
    edPortaTCP: TEdit;
    gbTXT: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    edEntTXT: TEdit;
    edSaiTXT: TEdit;
    rbTCP: TRadioButton;
    rbTXT: TRadioButton;
    tsECF: TTabSheet;
    Label8: TLabel;
    cbECFModelo: TComboBox;
    Label9: TLabel;
    cbECFPorta: TComboBox;
    Label10: TLabel;
    edECFTimeout: TEdit;
    chECFArredondaPorQtd: TCheckBox;
    bECFTestar: TBitBtn;
    bECFLeituraX: TBitBtn;
    bECFAtivar: TBitBtn;
    tsCHQ: TTabSheet;
    Label12: TLabel;
    cbCHQModelo: TComboBox;
    Label13: TLabel;
    cbCHQPorta: TComboBox;
    bCHQTestar: TBitBtn;
    chCHQVerForm: TCheckBox;
    tsGAV: TTabSheet;
    Label15: TLabel;
    cbGAVModelo: TComboBox;
    Label16: TLabel;
    cbGAVPorta: TComboBox;
    bGAVAbrir: TBitBtn;
    bGAVEstado: TBitBtn;
    Label14: TLabel;
    lGAVEstado: TLabel;
    Label21: TLabel;
    tsDIS: TTabSheet;
    Label17: TLabel;
    cbDISPorta: TComboBox;
    Label18: TLabel;
    cbDISModelo: TComboBox;
    Label19: TLabel;
    edDISIntervalo: TEdit;
    Label20: TLabel;
    edDISPassos: TEdit;
    bDISTestar: TBitBtn;
    bDISLimpar: TBitBtn;
    tsLCB: TTabSheet;
    cbLCBPorta: TComboBox;
    edLCBIntervalo: TEdit;
    chLCBExcluirSufixo: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label22: TLabel;
    bLCBAtivar: TBitBtn;
    Label23: TLabel;
    edLCBPreExcluir: TEdit;
    lLCBCodigoLido: TLabel;
    Label25: TLabel;
    lsndkey32: TLabel;
    bCancelar: TBitBtn;
    Timer1: TTimer;
    TcpServer: TIdTCPServer;
    chECFDescrGrande: TCheckBox;
    Label24: TLabel;
    edIntervalo: TEdit;
    cbLCBSufixoSndKey32: TComboBox;
    cbLCBSufixoLeitor: TComboBox;
    cbGAVStrAbre: TComboBox;
    bExecECFTeste: TBitBtn;
    Bevel1: TBevel;
    Label11: TLabel;
    edConexoesTCP: TEdit;
    cbComandos: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ACBrECF1MsgAguarde(Mensagem: String);
    procedure ACBrECF1MsgPoucoPapel(Sender: TObject);
    procedure ACBrECF1AguardandoRespostaChange(Sender: TObject);
    procedure bConfigClick(Sender: TObject);
    procedure cbLogClick(Sender: TObject);
    procedure cbSenhaClick(Sender: TObject);
    procedure edOnlyNumbers(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure bECFTestarClick(Sender: TObject);
    procedure bECFLeituraXClick(Sender: TObject);
    procedure bECFAtivarClick(Sender: TObject);
    procedure tsECFShow(Sender: TObject);
    procedure Ocultar1Click(Sender: TObject);
    procedure Restaurar1Click(Sender: TObject);
    procedure Encerrar1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbGAVModeloChange(Sender: TObject);
    procedure cbGAVPortaChange(Sender: TObject);
    procedure bGAVEstadoClick(Sender: TObject);
    procedure bGAVAbrirClick(Sender: TObject);
    procedure cbDISModeloChange(Sender: TObject);
    procedure cbDISPortaChange(Sender: TObject);
    procedure edDISIntervaloChange(Sender: TObject);
    procedure edDISPassosChange(Sender: TObject);
    procedure bDISLimparClick(Sender: TObject);
    procedure bDISTestarClick(Sender: TObject);
    procedure btMinimizarClick(Sender: TObject);
    procedure rbTCPTXTClick(Sender: TObject);
    procedure cbCHQModeloChange(Sender: TObject);
    procedure cbCHQPortaChange(Sender: TObject);
    procedure cbECFModeloChange(Sender: TObject);
    procedure cbECFPortaChange(Sender: TObject);
    procedure chECFArredondaPorQtdClick(Sender: TObject);
    procedure edECFTimeoutChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bCancelarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DoACBrTimer(Sender: TObject);
    procedure TcpServerExecute(AThread: TIdPeerThread);
    procedure TCPServerConnect(AThread: TIdPeerThread);
    procedure TCPServerDisconnect(AThread: TIdPeerThread);
    procedure chECFDescrGrandeClick(Sender: TObject);
    procedure bCHQTestarClick(Sender: TObject);
    procedure cbLCBPortaChange(Sender: TObject);
    procedure edLCBIntervaloChange(Sender: TObject);
    procedure bLCBAtivarClick(Sender: TObject);
    procedure edLCBSufLeituraKeyPress(Sender: TObject; var Key: Char);
    procedure chLCBExcluirSufixoClick(Sender: TObject);
    procedure edLCBPreExcluirChange(Sender: TObject);
    procedure ACBrLCB1LeCodigo(Sender: TObject);
    procedure AumentaTempoHint(Sender: TObject);
    procedure DiminuiTempoHint(Sender: TObject);
    procedure cbLCBSufixoLeitorChange(Sender: TObject);
    procedure pBotoesClick(Sender: TObject);
    procedure FormShortCut(Key: Integer; Shift: TShiftState;
      var Handled: Boolean);
    procedure cbGAVStrAbreChange(Sender: TObject);
    procedure bExecECFTesteClick(Sender: TObject);
  private
    TrayIcon  : TTrayIcon ;
    ACBrMonitorINI : string;
    Inicio  : Boolean ;
    ArqSaiTXT, ArqEntTXT, ArqLogTXT : String ;
    Cmd : TACBrCmd ;
    Conexao : TIdPeerThread ;

    procedure Inicializar ;
    procedure EscondeConfig ;
    procedure ExibeConfig ;
    procedure LerIni ;
    procedure SalvarIni ;

    Procedure Processar ;
    Procedure Resposta(Comando, Resposta : string);
    Procedure GravaArqResp(ArqTXT, Retorno : string);

    function AcertaPath( APath : String ) : String ;
    Function Converte( cmd : String) : String;
    procedure DoACBr(Cmd: TACBrCmd);
  public
    procedure AvaliaEstadoTsECF;
  end;

var
  FrmACBrMonitor: TFrmACBrMonitor;

implementation

uses IniFiles, StrUtils, TypInfo, IdStack, QDialogs, DoECFUnit
    {$IFDEF MSWINDOWS},sndkey32{$ENDIF},
     ACBrECFNaoFiscal, ACBrUtil , Math, Sobre;
{$R *.xfm}

{----------------------------------- TACBrCmd ---------------------------------}
constructor TACBrCmd.Create;
begin
  fsParams := TStringList.Create ;
end;

destructor TACBrCmd.Destroy;
begin
  fsParams.Free ;
  inherited Destroy ;
end;

function TACBrCmd.Params(Index: Integer): String;
begin
  if Index > fsParams.Count-1 then
     Result := ''
  else
     Result := fsParams[Index] ;
end;

procedure TACBrCmd.SetComando(const Value: String);
Var P,PaI,PaF,Pv : Integer ;
    wComando, wParam, wProxChar : String ;
begin
  fsMetodo   := '' ;
  fsObjeto   := '' ;
  fsResposta := '' ;
  fsParams.Clear ;

  fsComando := Value ;
  wComando  := Value ;

  { Achando o Objeto }
  P := pos('.',wComando) ;
  if P = 0 then
     raise Exception.Create('Objeto nao definido') ;

  fsObjeto := UpperCase( Trim(copy(fsComando,1,P-1)) ) ;
  if pos('"'+fsObjeto+'"', Objetos) = 0 then
     raise Exception.Create('Objeto inválido: '+fsObjeto+sLineBreak+
                            ' Permitidos: '+Objetos ) ;

  wComando := copy(wComando, P+1, Length(wComando) ) ;

  { Achando o Metodo }
  P := pos('(',wComando) ;
  if P = 0 then
  begin
     { Verificando se é uma atribuição a propriedade Ex: "Ativo := true"
       Se for transforma em "SetAtivo(True)"  }
     P := pos(':=',wComando) ;
     if P > 0 then
      begin
         wComando := 'Set'+Trim(copy(wComando,1,P-1))+'('+
                           Trim(copy(wComando,1,P+2))+')' ;
         P := pos('(',wComando) ;
      end
     else
        P := Length( wComando ) + 1 ;
  end ;

  fsMetodo := LowerCase( Trim(copy(wComando,1,P-1)) ) ;
  if fsMetodo = '' then
     raise Exception.Create('Metodo não informado') ;

  { Tem Parameteros ? }
  wComando := copy(wComando, P+1, Length(wComando) ) ;
  while Length(wComando) > 0 do
  begin
     PaI := pos('"',wComando) ;
     Pv  := pos(',',wComando) ;  { Procurando o Fim do parametro }
     if Pv = 0 then
        Pv := pos(')',wComando) ;
     if Pv = 0 then
        Pv := Length( wComando ) + 1;

     if (PaI <> 0) and (PaI < Pv) then  { Tem aspas no Inicio do Comando }
      begin                             { Entao procure a proxima Aspas }
       { Verificando se a aspas é seguida de ',' ou ')' ou fim do comando
          Se não for, então a aspas não é um delimitador de String e sim
          faz parte do texto da String }
        PaF := PaI ;
        wProxChar := ' ' ;
        while (PaF <> 0) and
           (wProxChar <> '') and (pos(wProxChar, ',)') = 0) do
        begin
           if wProxChar = '"' then
              Inc( PaF ) ;
           PaF := PaF + Pos('"',copy(wComando, PaF+1, Length(Wcomando)) ) ;
           wProxChar := copy(Trim(copy(wComando, PaF+1 , Length(Wcomando))),1,1) ;
        end ;

        if PaF = 0 then
           raise Exception.Create('Parametro Inválido. String não terminada');

        wParam := copy(wComando, PaI+1 , PaF-PaI-1 ) ;
        Pv := PaI + PaF + 1 ;
      end
     else
        wParam := copy(wComando, 1, Pv-1 ) ;

     { convertendo as antigas aspas duplas, que agora são #255 para " }
     wParam := StringReplace(wParam,'""','"',[rfReplaceAll]) ;

     fsParams.Add(wParam) ;
     wComando := copy(wComando, Pv+1, Length( wComando ) ) ;
  end ;
end;

{-------------------------------- TFrmACBrMonitor -----------------------------}
procedure TFrmACBrMonitor.FormCreate(Sender: TObject);
Var MemStream : TMemoryStream ;
    I : TACBrECFModelo ;
begin
  mResp.Clear ;
  mCmd.Clear ;
  Cmd       := TACBrCmd.Create ;
  Inicio    := true ;
  ArqSaiTXT := '' ;
  ArqEntTXT := '' ;
  ArqLogTXT := '' ;
  Conexao   := nil ;

  cbECFModelo.Items.Clear ;
  cbECFModelo.Items.Add('Procurar') ;
  I := Low( TACBrECFModelo ) ;
  while I <= High( TACBrECFModelo ) do
  begin
     cbECFModelo.Items.Add(GetEnumName(TypeInfo(TACBrECFModelo),Integer(I))) ;
     Inc(I) ;
  end ;
  AvaliaEstadoTsECF ;

  { Criando TrayIcon, e copiando Icone do Form }
  MemStream := TMemoryStream.Create;
  try
     Icon.SaveToStream(MemStream);
     TrayIcon := TTrayIcon.Create(self);
     with TrayIcon do
     begin
        Icon.LoadFromStream(MemStream);
        PopupMenu   := pmTray ;
        ToolTip     := 'ACBrMonitor '+ Versao +
                        {$IFDEF LINUX}#10{$ELSE}#13{$ENDIF}+
                       'ACBr: '+ACBR_VERSAO ;
        OnDblClick  := Restaurar1Click ;
        OnClick     := Restaurar1Click ;
        ShowToolTip := true ;
        Masked      := true ;
        AutoShow    := true ;
        Visible     := true ;
     end ;
  finally
     MemStream.Free ;
  end ;

  Caption := 'ACBrMonitor '+ Versao + ' - ACBr: '+ACBR_VERSAO ;
  PageControl1.ActivePageIndex := 0 ;
  lsndkey32.Hint := cbLCBSufixoSndKey32.Hint ;

  {$IFDEF LINUX}
  { SndKey32.pas só funciona no Windows pois usa a API  "keybd_event" }
  tsLCB.Enabled := False ;
  {$ENDIF}

  Application.Style.DefaultStyle := dsPlatinum ;
  Application.OnMinimize         := Ocultar1Click ;
  Application.OnRestore          := Restaurar1Click ;
  Application.Title              := Caption ;
  Application.HintHidePause      := 5000 ;

  Timer1.Enabled := True ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.FormDestroy(Sender: TObject);
begin
  Timer1.Enabled := false ;
  Cmd.Free ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.FormShow(Sender: TObject);
begin
  TrayIcon.Show ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := True ;

  if pConfig.Visible then
  begin
     MessageDlg('Por favor <b>Salve</b> ou <b>Cancele</b> as configurações '+
                'efetuadas antes de fechar o programa',
                 mtWarning,[mbOk],0 ) ;
     CanClose := false ;
  end ;

  if CanClose then
     CanClose := ( MessageDlg('Deseja realmente encerrar o <b>ACBrMonitor</b> ?',
                    mtConfirmation,[mbNo,mbYes] ,0 ) = mrYes );
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ACBrECF1.Desativar ;
  ACBrCHQ1.Desativar ;
  ACBrGAV1.Desativar ;
  ACBrDIS1.Desativar ;
  ACBrLCB1.Desativar ;

  Timer1.Enabled := False ;    { Desliga TXT }
  TcpServer.OnDisconnect := nil ;
  TCPServer.Active       := False ;    { Desliga TCP }
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.TCPServerConnect(AThread: TIdPeerThread);
begin
  sleep(100);
  conexao := AThread;
  mCmd.Lines.Clear ;
  Resposta('','ACBr Monitor Ver.ACBrMonitor '+ Versao + ' - ACBr: '+ACBR_VERSAO +sLineBreak +
              'Conectado em: '+FormatDateTime('dd/mm/yy hh:nn:ss', now )+sLineBreak+
              'Máquina: '+AThread.Connection.Socket.Binding.PeerIP+sLineBreak+
              'Esperando por comandos.');
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.TcpServerExecute(AThread: TIdPeerThread);
begin
  { Le o que foi enviado atravez da conexao TCP }
  mCmd.Lines.Add(trim(AThread.Connection.ReadLn()));
  Conexao := AThread ;
  Processar ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.TCPServerDisconnect(AThread: TIdPeerThread);
begin
  mResp.Lines.Add('ALERTA: Fim da Conexão com: '+
                   AThread.Connection.Socket.Binding.PeerIP+
                  ' em: '+FormatDateTime('dd/mm/yy hh:nn:ss', now ) )
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.Restaurar1Click(Sender: TObject);
begin
  Application.ShowMainForm := true ;
  Visible := true ;
  {$IFDEF LINUX}
  WindowState := wsNormal ;
  {$ENDIF}
  Application.Restore ;
  Application.BringToFront ;
  Application.ProcessMessages ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.Ocultar1Click(Sender: TObject);
begin
  TrayIcon.Visible := false ;

//  if WindowState <> wsMinimized then
//     WindowState := wsMinimized ;
  Visible := false ;
  Application.ShowMainForm := false ;

  TrayIcon.Visible := true ;
  Application.ProcessMessages ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.Encerrar1Click(Sender: TObject);
begin
  close ;
end;

{------------------------- Procedures de Uso Interno --------------------------}
procedure TFrmACBrMonitor.Inicializar;
Var Ini    : TIniFile ;
    Txt, ArqIni : String ;
    A : Integer ;
begin
  Timer1.Enabled := false ;
  Inicio         := false ;
  ACBrMonitorINI := ExtractFilePath(Application.ExeName)+ 'ACBrMonitor.ini';

  if not FileExists( ACBrMonitorINI ) then //verifica se o arq. de config existe
  begin                                    //se nao existir vai para as configs
    MessageDlg('Bem vindo ao ACBrMonitor',
               'Bem vindo ao <font color=blue><b>ACBrMonitor</b></font>,<br><br>'+
               'Por favor configure o <font color=blue><b>ACBrMonitor</b></font>, '+
               'informando o <b>Método de Monitoramento</b>, e a configuração '+
               'dos <b>Equipamentos de Automação</b> ligados a essa máquina.'+
               '<br><br><font color=red><b>IMPORTANTE:</b></font> Após configurar o '+
               'Método de Monitoramento o <font color=blue><b>ACBrMonitor</b></font>'+
               ' deve ser <b>reiniciado</b>',mtInformation,[mbok],0) ;
    bConfig.Click ;
    exit ;
  end;

  LerIni;
  while not Visible do
  begin
     Application.ProcessMessages ;
     sleep(200) ;
  end ;

  EscondeConfig ;
  Application.Minimize ;

  bConfig.Enabled  := true ;
  Timer1.Interval  := StrToIntDef( edIntervalo.Text, 100) ;
  Timer1.Enabled   := rbTXT.Checked ;
  TcpServer.Active := rbTCP.Checked ;

  mResp.Lines.Add('ACBr Monitor Ver.'+Versao);
  mResp.Lines.Add('Aguardando comandos ACBr');

  if rbTCP.Checked then
   begin
     mResp.Lines.Add('Escutando TCP em:');
     Txt := 'Endereço: '+TcpServer.LocalName ;
     For A := 0 to IdStack.GStack.LocalAddresses.Count-1 do
        Txt := Txt + '   ' + IdStack.GStack.LocalAddresses[A] ;

     mResp.Lines.Add(Txt) ;
     mResp.Lines.Add( 'Porta: ['+IntToStr(TcpServer.DefaultPort)+']') ;
   end
  else
   begin
     mResp.Lines.Add('Monitorando TXT em: '+ArqEntTXT);
     mResp.Lines.Add('Respostas gravadas em:'+ArqSaiTXT);
   end ;

   if cbLog.Checked then
      mResp.Lines.Add('Log de comandos será gravado em: '+ArqLogTXT) ;

   { Se for NAO fiscal, desliga o AVISO antes de ativar }
   if ACBrECF1.Modelo = ecfNaoFiscal then
   begin
      ArqIni := (ACBrECF1.ECF as TACBrECFNaoFiscal).NomeArqINI ;
      Ini := TIniFile.Create( ArqIni ) ;
      try
        Ini.WriteString('Variaveis','Aviso_Legal','NAO');
     finally
        Ini.Free ;
     end ;
  end ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.LerIni ;
var Ini : TIniFile;
begin
  Ini := TIniFile.Create( ACBrMonitorINI ) ;

  try
     { Parametros do Monitor }
     rbTCP.Checked      := Ini.ReadBool('ACBrMonitor','Modo_TCP',false);
     rbTXT.Checked      := Ini.ReadBool('ACBrMonitor','Modo_TXT',false);
     edPortaTCP.Text    := IntToStr(Ini.ReadInteger('ACBrMonitor','TCP_Porta',3434));
     edConexoesTCP.Text := IntToStr(Ini.ReadInteger('ACBrMonitor','Conexoes_Simultaneas',1));
     edEntTXT.Text      := Ini.ReadString('ACBrMonitor','TXT_Entrada','ENT.TXT');
     edSaiTXT.Text      := Ini.ReadString('ACBrMonitor','TXT_Saida','SAI.TXT');
     edIntervalo.Text   := Ini.ReadString('ACBrMonitor','Intervalo','100');
     cbSenha.Checked    := Ini.ReadBool('ACBrMonitor','Protegido',false);
     edSenha.Text       := Ini.ReadString('ACBrMonitor','Senha','');
     cbLog.Checked      := Ini.ReadBool('ACBrMonitor','Gravar_Log',false);
     edArqLog.Text      := Ini.ReadString('ACBrMonitor','Arquivo_Log','LOG.TXT');
     cbComandos.Checked := Ini.ReadBool('ACBrMonitor','Comandos_Remotos',false);

     ArqEntTXT := AcertaPath( edEntTXT.Text ) ;
     ArqSaiTXT := AcertaPath( edSaiTXT.Text ) ;
     ArqLogTXT := AcertaPath( edArqLog.Text ) ;

     TcpServer.DefaultPort    := StrToInt( edPortaTCP.Text ) ;
     TcpServer.MaxConnections := StrToInt( edConexoesTCP.Text ) ;
     TcpServer.MaxConnectionReply.Text.Add( 'Pedido de conexão negado.') ;
     TcpServer.MaxConnectionReply.Text.Add(
        'Número máximo de conexões ('+edConexoesTCP.Text+') já atingido' ) ;

     { Parametros do ECF }
     cbECFPorta.Text       := Ini.ReadString('ECF','Porta','Procurar');
     cbECFModelo.ItemIndex := Ini.ReadInteger('ECF','Modelo',0)+1;
     cbECFModeloChange(Self);
     edECFTimeout.Text     := IntToStr(Ini.ReadInteger('ECF','Timeout',3));
     chECFArredondaPorQtd.Checked := Ini.ReadBool('ECF','ArredondamentoPorQtd',false);
     chECFDescrGrande.Checked := Ini.ReadBool('ECF','DescricaoGrande',True);

     { Parametros do CHQ }
     cbCHQPorta.Text       := Ini.ReadString('CHQ','Porta','');
     cbCHQModelo.ItemIndex := Ini.ReadInteger('CHQ','Modelo',0);
     cbCHQModeloChange(Self);
     chCHQVerForm.Checked  := Ini.ReadBool('CHQ','VerificaFormulario',false);

     { Parametros do GAV }
     cbGAVPorta.Text       := Ini.ReadString('GAV','Porta','');
     cbGAVModelo.ItemIndex := Ini.ReadInteger('GAV','Modelo',0);
     cbGAVModeloChange(Self);
     cbGAVStrAbre.Text     := Ini.ReadString('GAV','StringAbertura','');

     { Parametros do DIS }
     cbDISPorta.Text       := Ini.ReadString('DIS','Porta','');
     cbDISModelo.ItemIndex := Ini.ReadInteger('DIS','Modelo',0);
     cbDISModeloChange(Self);
     edDISIntervalo.Text   := IntToStr(Ini.ReadInteger('DIS','Intervalo',300));
     edDISPassos.Text      := IntToStr(Ini.ReadInteger('DIS','Passos',1));

     { Parametros do LCB }
     cbLCBPorta.Text       := Ini.ReadString('LCB','Porta','Sem Leitor');
     cbLCBPortaChange(Self);
     edLCBIntervalo.Text   := IntToStr(Ini.ReadInteger('LCB','Intervalo',100));
     cbLCBSufixoLeitor.Text:= Ini.ReadString('LCB','SufixoLeitor','#13');
     chLCBExcluirSufixo.Checked := Ini.ReadBool('LCB','ExcluirSufixo',false) ;
     edLCBPreExcluir.Text  := Ini.ReadString('LCB','PrefixoAExcluir','');
     cbLCBSufixoSndKey32.Text := Ini.ReadString('LCB','SufixoIncluir','') ;

  finally
     Ini.Free ;
  end ;

  with ACBrECF1 do
  begin
     Desativar ;
     Modelo               := TACBrECFModelo( Max(cbECFModelo.ItemIndex-1,0) ) ;
     Porta                := cbECFPorta.Text ;
     TimeOut              := StrToIntDef(edECFTimeout.Text,3) ;
     ArredondaPorQtd      := chECFArredondaPorQtd.Checked ;
     DescricaoGrande      := chECFDescrGrande.Checked ;
     BloqueiaMouseTeclado := False ;
     ExibeMensagem        := False ;
  end ;

  with ACBrCHQ1 do
  begin
     Desativar ;
     Modelo := TACBrCHQModelo( cbCHQModelo.ItemIndex ) ;
     Porta  := cbCHQPorta.Text ;
  end ;

  with ACBrGAV1 do
  begin
     Desativar ;
     StrComando := cbGAVStrAbre.Text ;
     Modelo     := TACBrGAVModelo( cbGAVModelo.ItemIndex ) ;
     Porta      := cbGAVPorta.Text ;
  end ;

  with ACBrDIS1 do
  begin
     Desativar ;
     Intervalo := StrToIntDef(edDISIntervalo.Text,0) ;
     Passos    := StrToIntDef(edDISPassos.Text,1) ;
     Modelo    := TACBrDISModelo( cbDISModelo.ItemIndex ) ;
     Porta     := cbDISPorta.Text ;
  end ;

  with ACBrLCB1 do
  begin
     Desativar ;
     Porta           := cbLCBPorta.Text ;
     Intervalo       := StrToIntDef(edLCBIntervalo.Text,100) ;
     Sufixo          := cbLCBSufixoLeitor.Text ;
     ExcluirSufixo   := chLCBExcluirSufixo.Checked ;
     PrefixoAExcluir := edLCBPreExcluir.Text ;

     { SndKey32.pas só funciona no Windows pois usa a API  "keybd_event" }
     if ACBrLCB1.Porta <> 'Sem Leitor' then
        ACBrLCB1.Ativar ;
  end ;


end;

procedure TFrmACBrMonitor.SalvarIni;
var Ini : TIniFile;
    OldMonitoraTXT, OldMonitoraTCP : Boolean ;
begin
  Ini := TIniFile.Create( ACBrMonitorINI ) ;
  try
     // Verificando se modificou o Modo de Monitoramento //
     OldMonitoraTCP := Ini.ReadBool('ACBrMonitor','Modo_TCP',false) ;
     OldMonitoraTXT := Ini.ReadBool('ACBrMonitor','Modo_TXT',false) ;

     // Parametros do Monitor //
     Ini.WriteBool('ACBrMonitor','Modo_TCP',rbTCP.Checked);
     Ini.WriteBool('ACBrMonitor','Modo_TXT',rbTXT.Checked);
     Ini.WriteInteger('ACBrMonitor','TCP_Porta',StrToIntDef(edPortaTCP.Text,3434));
     Ini.WriteInteger('ACBrMonitor','Conexoes_Simultaneas',StrToIntDef(edConexoesTCP.Text,1));
     Ini.WriteString('ACBrMonitor','TXT_Entrada',edEntTXT.Text);
     Ini.WriteString('ACBrMonitor','TXT_Saida',edSaiTXT.Text);
     Ini.WriteString('ACBrMonitor','Intervalo',edIntervalo.Text);
     Ini.WriteBool('ACBrMonitor','Protegido',cbSenha.Checked);
     Ini.WriteString('ACBrMonitor','Senha',edSenha.Text);
     Ini.WriteBool('ACBrMonitor','Gravar_Log',cbLog.Checked);
     Ini.WriteString('ACBrMonitor','Arquivo_Log',edArqLog.Text);
     Ini.WriteBool('ACBrMonitor','Comandos_Remotos',cbComandos.Checked);

     // Parametros do ECF //
     Ini.WriteInteger('ECF','Modelo',max(cbECFModelo.ItemIndex-1,0));
     Ini.WriteString('ECF','Porta',cbECFPorta.Text);
     Ini.WriteInteger('ECF','Timeout',StrToIntDef(edECFTimeout.Text,3));
     Ini.WriteBool('ECF','ArredondamentoPorQtd',chECFArredondaPorQtd.Checked);
     Ini.WriteBool('ECF','DescricaoGrande',chECFDescrGrande.Checked);

     { Parametros do CHQ }
     Ini.WriteInteger('CHQ','Modelo',cbCHQModelo.ItemIndex);
     Ini.WriteString('CHQ','Porta',cbCHQPorta.Text);
     Ini.WriteBool('CHQ','VerificaFormulario',chCHQVerForm.Checked);

     { Parametros do GAV }
     Ini.WriteInteger('GAV','Modelo',cbGAVModelo.ItemIndex);
     Ini.WriteString('GAV','Porta',cbGAVPorta.Text);
     Ini.WriteString('GAV','StringAbertura',cbGAVStrAbre.Text);

     { Parametros do DIS }
     Ini.WriteInteger('DIS','Modelo',cbDISModelo.ItemIndex);
     Ini.WriteString('DIS','Porta',cbDISPorta.Text);
     Ini.WriteInteger('DIS','Intervalo',StrToIntDef(edDISIntervalo.Text,300));
     Ini.WriteInteger('DIS','Passos',StrToIntDef(edDISPassos.Text,1));

     { Parametros do LCB }
     Ini.WriteString('LCB','Porta',cbLCBPorta.Text);
     Ini.WriteInteger('LCB','Intervalo',StrToIntDef(edLCBIntervalo.Text,100));
     Ini.WriteString('LCB','SufixoLeitor',cbLCBSufixoLeitor.Text);
     Ini.WriteBool('LCB','ExcluirSufixo',chLCBExcluirSufixo.Checked ) ;
     Ini.WriteString('LCB','PrefixoAExcluir',edLCBPreExcluir.Text);
     Ini.WriteString('LCB','SufixoIncluir',cbLCBSufixoSndKey32.Text) ;
  finally
     Ini.Free ;
  end ;

  if (OldMonitoraTXT <> rbTXT.Checked) or (OldMonitoraTCP <> rbTCP.Checked) then
  begin
     MessageDlg('ACBrMonitor',
                'O Método de Monitoramento do <b>ACBrMonitor</b> foi modificado'+
                '<br><br>Será necessário reinicar o <b>ACBrMonitor</b>',
                mtInformation, [mbOk],0) ;
     Application.Terminate ;
  end ;
end;


{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.EscondeConfig;
begin
  pConfig.Visible := False ;

  bConfig.Caption     := '&Configurar' ;
  bConfig.Glyph       := nil ;
  ImageList1.GetBitmap(11,bConfig.Glyph);
  bCancelar.Visible   := false ;
  btMinimizar.Visible := true ;
  Application.ProcessMessages ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.ExibeConfig;
Var Senha : String ;
    SenhaOk : Boolean ;
begin
  SenhaOk := false ;
  if cbSenha.Checked then
   begin
     Senha := '' ;
     if InputQuery('Configuração','Digite a Senha de Configuração',Senha) then
        SenhaOk := (Senha = edSenha.Text)
   end
  else
     SenhaOk := true ;

  if not SenhaOk then exit ;

  pConfig.Visible := true ;

  bConfig.Caption     := '&Salvar' ;
  bConfig.Glyph       := nil ;
  ImageList1.GetBitmap(12,bConfig.Glyph);
  bCancelar.Visible   := true ;
  btMinimizar.Visible := false ;
  Application.ProcessMessages ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.Processar;
var
  Linha : string;
begin
  while mCmd.Lines.Count > 0 do
  begin
     Application.ProcessMessages ;

     Linha := Trim( mCmd.Lines[0] );
     mCmd.Lines.Delete(0);

     if Linha <> '' then
        try
           if pos('.',Linha) = 0 then              { Comandos do ACBrMonitor }
              Linha := 'ACBR.'+Linha ;

           Cmd.Comando := Linha ;

           if Cmd.Objeto = 'ECF' then
              DoECF( Cmd )
           else if Cmd.Objeto = 'ACBR' then
              DoACBr( Cmd ) ; {
           else if Cmd.Objeto = 'CHQ' then
              DoCHQ( Cmd )
           else if Cmd.Objeto = 'GAV' then
              DoGAV( Cmd )
           else if Cmd.Objeto = 'DIS' then
              DoDIS( Cmd );  }

           Resposta(Linha, 'OK: '+Cmd.Resposta );
        except
           on E : Exception do
              Resposta(Linha, 'ERRO: '+E.Message );
        end ;
  end ;
end;

procedure TFrmACBrMonitor.DoACBr( Cmd : TACBrCmd ) ;
Var AltTab : Boolean ;
begin
  if Cmd.Metodo = 'run' then
   begin
     if not cbComandos.Checked then
        raise Exception.Create('Comandos Remotos não são permitidos');
        
     if Cmd.Params(0) = '' then
        raise Exception.Create('Linha de comando não informada');

     AltTab := StrToBoolDef(Cmd.Params(4),False) ; { Envia ALT-TAB quando Terminar ?}
     RunCommand( Cmd.Params(0),                       { Linha de comando }
                 Cmd.Params(1),                       { Parametros adicionais }
                 StrToBoolDef(Cmd.Params(2),False) or AltTab , { Aguarda termino execuçao ? }
                 StrToIntDef(Cmd.Params(3),1));
     {$IFDEF MSWINDOWS}
     if AltTab then
        SendKeys(pchar('%{TAB}'), False);
     {$ENDIF}
   end

  else if pos(Cmd.Metodo, 'exit|bye|fim|sair') > 0 then         {fecha conexao}
   begin
     Cmd.Resposta := 'Obrigado por usar o ACBrMonitor' ;
     mCmd.Lines.Clear;

     if Assigned( Conexao ) then
        if Assigned( Conexao.Connection ) then
           Conexao.Connection.Disconnect ;
   end

  ELSE
     raise Exception.Create('Comando inválido ('+ copy(Cmd.Comando,6,length(Cmd.Comando))+')') ;
end ;

{------------------------------------------------------------------------------}
Procedure TFrmACBrMonitor.Resposta(Comando, Resposta : string );
begin
  if rbTCP.Checked then
  begin
     if Assigned( Conexao ) then
     begin
        if Assigned( Conexao.Connection ) then
        begin
           Conexao.Connection.WriteLn(Resposta) ;
           Conexao.Connection.Write(#3) ;
        end;
     end ;
  end ;

  if rbTXT.Checked then
     GravaArqResp(ArqSaiTXT, Resposta);

  mResp.Lines.BeginUpdate ;
  mResp.Lines.Add( Comando + sLineBreak + Resposta ) ;
  while mResp.Lines.Count > BufferResposta do
     mResp.Lines.Delete(0) ;
  mResp.Lines.EndUpdate ;

  if cbLog.Checked then
     GravaArqResp(ArqLogTXT, Comando + sLineBreak + Resposta);
end;

{------------------------------------------------------------------------------}
Procedure TFrmACBrMonitor.GravaArqResp(ArqTXT, Retorno : string);
var
  Arq : textfile;
begin
  AssignFile( Arq, ArqTXT) ;
  try
     if not FileExists(ArqTXT) then
        Rewrite( Arq ) 
     else
        Append( Arq ) ;

     Writeln( Arq, Retorno ) ;

//     Flush( Arq ) ;
  finally
     {$I-}
     try
        CloseFile( Arq ) ;
     except
     end ;
     {$I+}
  end ;
end;

{------------------------------------------------------------------------------}
function TFrmACBrMonitor.AcertaPath(APath : String): String;
begin
  Result := trim(APath) ;
  if pos(PathDelim, APath) = 0 then
     Result := ExtractFilePath( Application.ExeName ) + APath ;
end;

{------------------------------------------------------------------------------}
function TFrmACBrMonitor.Converte(cmd: String): String;
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

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.btMinimizarClick(Sender: TObject);
begin
  Ocultar1Click( Sender );
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.bCancelarClick(Sender: TObject);
begin
  EscondeConfig ;
  LerIni ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.bConfigClick(Sender: TObject);
begin
  if pConfig.Visible then
   begin
     EscondeConfig ;
     SalvarIni ;
     LerIni ; { Para as alteraçoes fazerem efeito }
   end
  else
     ExibeConfig ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.rbTCPTXTClick(Sender: TObject);
begin
  gbTCP.Enabled := rbTCP.Checked ;
  gbTXT.Enabled := rbTXT.Checked ;

  if rbTXT.Checked then
   begin
     if edENTTXT.Text = '' then
        edENTTXT.Text := 'ENT.TXT' ;

     if edSAITXT.Text = '' then
        edSAITXT.Text := 'SAI.TXT' ;
   end
  else
   begin
     if edPortaTCP.Text = '' then
        edPortaTCP.Text := '3434' ;

     if edConexoesTCP.Text = '' then
        edConexoesTCP.Text := '1' ;
   end ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.cbSenhaClick(Sender: TObject);
begin
  edSenha.Enabled := cbSenha.Checked ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.cbLogClick(Sender: TObject);
begin
  edArqLog.Enabled := cbLog.Checked ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.edOnlyNumbers(Sender: TObject;
  var Key: Char);
begin
  if not ( Key in ['0'..'9',#13,#8] ) then
     Key := #0 ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.ACBrECF1MsgAguarde(Mensagem: String);
begin
  StatusBar1.Panels[2].Text :=
     StringReplace( Mensagem, sLineBreak, ' ',[rfReplaceAll]) ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.ACBrECF1MsgPoucoPapel(Sender: TObject);
begin
  StatusBar1.Panels[2].Text := 'ATENÇAO. Pouco papel'
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.ACBrECF1AguardandoRespostaChange(Sender: TObject);
begin
  if ACBrECF1.AguardandoResposta then
     StatusBar1.Panels[1].Text := 'Processando...'
  else
     StatusBar1.Panels[1].Text := '' ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.DoACBrTimer(Sender: TObject);
var SL : TStringList ;
begin
  Timer1.Enabled := false;

  if Inicio then
  begin
     Inicializar ;
     exit;
  end ;

  try
     if FileExists( ArqEntTXT ) then  { Existe arquivo para ler ? }
     begin
       { Lendo em StringList temporário para nao apagar comandos nao processados }
       SL := TStringList.Create ;
       try
          try
             SL.LoadFromFile( ArqEntTXT );
             DeleteFile( ArqEntTXT );
          except
             { Ignora Exceçoes na Tentativa de Leitura o Deleçao }
          end ;
          mCmd.Lines.AddStrings( SL );
       finally
          SL.Free ;
       end ;
     end;

     Processar ;
  finally
     Timer1.Enabled := True;
  end ;
end;

{---------------------------------- ACBrECF -----------------------------------}
{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.tsECFShow(Sender: TObject);
begin
   AvaliaEstadoTsECF ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.cbECFModeloChange(Sender: TObject);
begin
  try
     if ACBrECF1.Ativo then
        bECFAtivar.Click ;

      ACBrECF1.Modelo := TACBrECFModelo( Max(cbECFModelo.ItemIndex -1,0) )
  finally
     if cbECFModelo.Text <> 'Procurar' then
        cbECFModelo.ItemIndex := Integer( ACBrECF1.Modelo )+1 ;
     cbECFPorta.Text := ACBrECF1.Porta ;
  end ;

  AvaliaEstadoTsECF ;
end;

procedure TFrmACBrMonitor.AvaliaEstadoTsECF ;
begin
  bECFAtivar.Enabled           := ((ACBrECF1.Modelo <> ecfNenhum) or
                                   (cbECFModelo.Text = 'Procurar')   );
  chECFArredondaPorQtd.Enabled := bECFAtivar.Enabled ;
  chECFDescrGrande.Enabled     := bECFAtivar.Enabled ;
  cbECFPorta.Enabled           := bECFAtivar.Enabled ;
  edECFTimeout.Enabled         := bECFAtivar.Enabled ;
  
  bECFTestar.Enabled   := ACBrECF1.Ativo ;
  bECFLeituraX.Enabled := ACBrECF1.Ativo ;

  bECFAtivar.Glyph := nil ;
  if ACBrECF1.Ativo then
   begin
     bECFAtivar.Caption := '&Desativar' ;
     ImageList1.GetBitmap(6,bECFAtivar.Glyph);
   end
  else
   begin
     bECFAtivar.Caption := '&Ativar' ;
     ImageList1.GetBitmap(5,bECFAtivar.Glyph);
   end ;
end ;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.cbECFPortaChange(Sender: TObject);
begin
  try
     if ACBrECF1.Ativo then
        bECFAtivar.Click ;
        
    ACBrECF1.Porta := cbECFPorta.Text ;
  finally
     cbECFPorta.Text := ACBrECF1.Porta ;
  end ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.edECFTimeoutChange(Sender: TObject);
begin
  ACBrECF1.TimeOut := StrToIntDef(edECFTimeout.Text, ACBrECF1.TimeOut ) ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.chECFArredondaPorQtdClick(Sender: TObject);
begin
  ACBrECF1.ArredondaPorQtd := chECFArredondaPorQtd.Checked ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.chECFDescrGrandeClick(Sender: TObject);
begin
  ACBrECF1.DescricaoGrande := chECFDescrGrande.Checked ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.bECFAtivarClick(Sender: TObject);
begin
  if bECFAtivar.Caption = '&Ativar' then
   begin
     try
        if cbECFModelo.ItemIndex = 0 then
           if not ACBrECF1.AcharECF(true,False) then
           begin
              MessageDlg('Nenhum ECF encontrado.',mtInformation,[mbOk],0) ;
              exit ;
           end ;

        ACBrECF1.Ativar ;
     finally
        cbECFModelo.ItemIndex := Integer(ACBrECF1.Modelo)+1 ;
        cbECFPorta.Text       := ACBrECF1.Porta ;
     end ;
   end
  else
     ACBrECF1.Desativar ;

  AvaliaEstadoTsECF ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.bECFTestarClick(Sender: TObject);
begin
  ACBrECF1.TestarDialog ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.bECFLeituraXClick(Sender: TObject);
var wAtivo : Boolean ;
begin
  wAtivo := ACBrECF1.Ativo ;

  try
     ACBrECF1.Ativar ;
     ACBrECF1.LeituraX ;
  finally
     ACBrECF1.Ativo := wAtivo ;
  end ;
end;

{------------------------------------ ACBrCHQ ---------------------------------}
procedure TFrmACBrMonitor.cbCHQPortaChange(Sender: TObject);
begin
  if ACBrCHQ1.Modelo <> chqImpressoraECF then
  begin
     Try
        ACBrCHQ1.Desativar ;
        ACBrCHQ1.Porta := cbCHQPorta.Text ;
     finally
        cbCHQPorta.Text := ACBrCHQ1.Porta ;
     end ;
  end ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.bCHQTestarClick(Sender: TObject);
var wAtivo : Boolean ;
begin
  wAtivo := ACBrCHQ1.Ativo ;

  try
     ACBrCHQ1.Ativar ;
     ACBrCHQ1.Banco     := '001' ;
     ACBrCHQ1.Cidade    := 'Nome da sua Cidade'  ; 
     ACBrCHQ1.Favorecido:= 'Nome do Favorecido'  ;
     ACBrCHQ1.Observacao:= 'Texto de Observacao' ;
     ACBrCHQ1.Valor     := 123456.12 ;   
     ACBrCHQ1.ImprimirCheque ;
  finally
     ACBrCHQ1.Ativo := wAtivo ;
  end ;
end;

{------------------------------------ ACBrGAV ---------------------------------}
procedure TFrmACBrMonitor.cbGAVPortaChange(Sender: TObject);
begin
  if ACBrGAV1.Modelo <> gavImpressoraECF then
  begin
     Try
        ACBrGAV1.Desativar ;
        ACBrGAV1.Porta := cbGAVPorta.Text ;
     finally
        cbGAVPorta.Text := ACBrGAV1.Porta ;
     end ;
  end ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.cbGAVStrAbreChange(Sender: TObject);
begin
  ACBrGAV1.StrComando := cbGAVStrAbre.Text ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.bGAVEstadoClick(Sender: TObject);
begin
  if not ACBrGAV1.Ativo then
     ACBrGAV1.Ativar ;

  if ACBrGAV1.GavetaAberta then
     lGAVEstado.Caption := 'Aberta'
  else
     lGAVEstado.Caption := 'Fechada' ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.bGAVAbrirClick(Sender: TObject);
begin
  ACBrGAV1.AbreGaveta ;
  bGAVEstado.Click ;
end;

{------------------------------------ ACBrDIS ---------------------------------}
procedure TFrmACBrMonitor.cbDISPortaChange(Sender: TObject);
begin
  Try
     ACBrDIS1.Desativar ;
     ACBrDIS1.Porta := cbDISPorta.Text ;
  finally
     cbDISPorta.Text := ACBrDIS1.Porta ;
  end ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.edDISIntervaloChange(Sender: TObject);
begin
  ACBrDIS1.Intervalo := StrToIntDef( edDISIntervalo.Text, 0) ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.edDISPassosChange(Sender: TObject);
begin
  ACBrDIS1.Passos := StrToIntDef( edDISPassos.Text, 0) ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.bDISLimparClick(Sender: TObject);
begin
  ACBrDIS1.LimparDisplay ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.bDISTestarClick(Sender: TObject);
begin
  ACBrDIS1.Ativar ;
  ACBrDIS1.ExibirLinha(1,'Projeto ACBr'      ,efeDireita_Esquerda) ;
  ACBrDIS1.ExibirLinha(2,'http://acbr.sf.net',efeEsquerda_Direita) ;
end;

{------------------------------------ ACBrLCB ---------------------------------}
procedure TFrmACBrMonitor.cbLCBPortaChange(Sender: TObject);
begin
  Try
     ACBrLCB1.Desativar ;
     ACBrLCB1.Porta := cbLCBPorta.Text ;
  finally
     cbLCBPorta.Text := ACBrLCB1.Porta ;
  end ;

  bLCBAtivar.Enabled := ((cbLCBPorta.Text <> 'Sem Leitor') and
                         (cbLCBPorta.ItemIndex > 0)            ) ;
  cbLCBSufixoSndKey32.Enabled := bLCBAtivar.Enabled ;
  cbLCBSufixoLeitor.Enabled   := bLCBAtivar.Enabled ;
  edLCBPreExcluir.Enabled     := bLCBAtivar.Enabled ;
  chLCBExcluirSufixo.Enabled  := bLCBAtivar.Enabled ;
  edLCBIntervalo.Enabled      := bLCBAtivar.Enabled ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.edLCBIntervaloChange(Sender: TObject);
begin
  ACBrLCB1.Intervalo := StrToIntDef( edLCBIntervalo.Text, 0 ) ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.bLCBAtivarClick(Sender: TObject);
begin
  ACBrLCB1.Ativar ;
  edLCBIntervalo.Text := IntToStr( ACBrLCB1.Intervalo ) ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.cbLCBSufixoLeitorChange(Sender: TObject);
begin
  ACBrLCB1.Sufixo := cbLCBSufixoLeitor.Text ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.edLCBSufLeituraKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not ( Key in ['0'..'9','#',',',#13,#8] ) then
     Key := #0 ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.chLCBExcluirSufixoClick(Sender: TObject);
begin
  ACBrLCB1.ExcluirSufixo := chLCBExcluirSufixo.Checked ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.edLCBPreExcluirChange(Sender: TObject);
begin
  ACBrLCB1.PrefixoAExcluir := edLCBPreExcluir.Text ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.AumentaTempoHint(Sender: TObject);
begin
  Application.HintHidePause := 15000 ;
end;

procedure TFrmACBrMonitor.DiminuiTempoHint(Sender: TObject);
begin
  Application.HintHidePause := 5000 ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.ACBrLCB1LeCodigo(Sender: TObject);
Var Codigo : String ;
begin
  lLCBCodigoLido.Caption := Converte( ACBrLCB1.UltimaLeitura ) ;

  Codigo := ACBrLCB1.UltimoCodigo ;
  mResp.Lines.Add(ACBrLCB1.UltimoCodigo) ;

  Codigo := Codigo + Trim(cbLCBSufixoSndKey32.Text) ;

  {$IFDEF MSWINDOWS}
  SendKeys( pchar(Codigo) , True ) ;
  {$ENDIF}
  {$IFDEF LINUX}
//  RunCommand('echo',Codigo+' > /dev/stdin',true) ;
  {$ENDIF}
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.cbCHQModeloChange(Sender: TObject);
begin
  try
     ACBrCHQ1.Desativar ;
     ACBrCHQ1.Modelo := TACBrCHQModelo( cbCHQModelo.ItemIndex ) ;

     if ACBrCHQ1.Modelo = chqImpressoraECF then
        ACBrCHQ1.ECF       := ACBrECF1 ;
  finally
     cbCHQModelo.ItemIndex := Integer( ACBrCHQ1.Modelo ) ;
     cbCHQPorta.Text       := ACBrCHQ1.Porta ;
  end ;

  bCHQTestar.Enabled   := (ACBrCHQ1.Modelo <> chqNenhuma) ;
  cbCHQPorta.Enabled   := bCHQTestar.Enabled and (ACBrCHQ1.Modelo <> chqImpressoraECF) ;
  chCHQVerForm.Enabled := bCHQTestar.Enabled ;
end ;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.cbGAVModeloChange(Sender: TObject);
begin
  try
     ACBrGAV1.Desativar ;
     ACBrGAV1.Modelo := TACBrGAVModelo( cbGAVModelo.ItemIndex ) ;

     if ACBrGAV1.Modelo = gavImpressoraECF then
        ACBrGAV1.ECF := ACBrECF1 ;
  finally
     cbGAVModelo.ItemIndex := Integer( ACBrGAV1.Modelo ) ;
     cbGAVPorta.Text       := ACBrGAV1.Porta ;
  end ;

  bGAVEstado.Enabled   := (ACBrGAV1.Modelo <> gavNenhuma) ;
  bGAVAbrir.Enabled    := bGAVEstado.Enabled ;
  cbGAVPorta.Enabled   := bGAVEstado.Enabled and (ACBrGAV1.Modelo <> gavImpressoraECF) ;
  cbGAVStrAbre.Enabled := (ACBrGAV1.Modelo = gavImpressoraComum) ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.cbDISModeloChange(Sender: TObject);
begin
  try
     ACBrDIS1.Desativar ;
     ACBrDIS1.Modelo := TACBrDISModelo( cbDISModelo.ItemIndex ) ;
  finally
     cbDISModelo.ItemIndex := Integer( ACBrDIS1.Modelo ) ;
     cbDISPorta.Text       := ACBrDIS1.Porta ;
  end ;

  bDISTestar.Enabled     := (ACBrDIS1.Modelo <> disNenhum) ;
  bDISLimpar.Enabled     := bDISTestar.Enabled ;
  edDISPassos.Enabled    := bDISTestar.Enabled ;
  edDISIntervalo.Enabled := bDISTestar.Enabled ;
  cbDISPorta.Enabled     := bDISTestar.Enabled and (ACBrDIS1.Modelo <> disGertecTeclado) ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.FormShortCut(Key: Integer; Shift: TShiftState;
  var Handled: Boolean);
begin
  if (Key = Key_Help) or (Key = Key_F1) then
     pBotoesClick(self) ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.pBotoesClick(Sender: TObject);
begin
  frmSobre := TfrmSobre.Create( self );
  try
     frmSobre.lVersao.Caption := 'Ver: '+Versao ;
     frmSobre.ShowModal ;
  finally
     FreeAndNil(frmSobre) ;
  end ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.bExecECFTesteClick(Sender: TObject);
Var Arquivo : String ;
    OldAtivo: Boolean ;
begin
  OldAtivo := ACBrECF1.Ativo ;
  try
     ACBrECF1.Desativar ;
    {$IFDEF LINUX}
       Arquivo := 'QECFTeste' ;
    {$ELSE}
       Arquivo := 'QECFTeste.exe' ;
    {$ENDIF}

    Arquivo := ExtractFilePath( Application.ExeName ) + Arquivo ;

    if not FileExists( Arquivo ) then
       MessageDlg('Programa: <b>'+Arquivo+ '</b> não encontrado.',mtError,[mbOk],0)
    else
       RunCommand(Arquivo,'',true) ;
  finally
     ACBrECF1.Ativo := OldAtivo ;
  end ;

  AvaliaEstadoTsECF ;
end;

end.

