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
{  Este programa é software livre; você pode redistribuí-lo e/ou modificá-lo   }
{ sob os termos da Licença Pública Geral GNU, conforme publicada pela Free     }
{ Software Foundation; tanto a versão 2 da Licença como (a seu critério)       }
{ qualquer versão mais nova.                                                   }
{                                                                              }
{  Este programa é distribuído na expectativa de ser útil, mas SEM NENHUMA     }
{ GARANTIA; nem mesmo a garantia implícita de COMERCIALIZAÇÃO OU DE ADEQUAÇÃO A}
{ QUALQUER PROPÓSITO EM PARTICULAR. Consulte a Licença Pública Geral GNU para  }
{ obter mais detalhes. (Arquivo LICENCA.TXT ou LICENSE.TXT)                    }
{                                                                              }
{  Você deve ter recebido uma cópia da Licença Pública Geral GNU junto com este}
{ programa; se não, escreva para a Free Software Foundation, Inc., 59 Temple   }
{ Place, Suite 330, Boston, MA 02111-1307, USA. Você também pode obter uma     }
{ copia da licença em:  http://www.opensource.org/licenses/gpl-license.php     }
{                                                                              }
{ Daniel Simões de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Praça Anita Costa, 34 - Tatuí - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{******************************************************************************
|* Historico ACBr Monitor
|*
|* 07/03/2005: Fabio Rogerio Baia
|*    Primeiros Esboços
|* 24/03/2005: Daniel Simoes de Almeida
|*    Migraçao para CLX
|* 06/02/2006: Daniel Simoes de Almeida
|*    Rotina GravaResposta otimizada para gravação em arquivos TXT
|* 10/07/2006: Daniel Simoes de Almeida
|*   - Corrigido Bug no interpretador de Comandos (na separação de parâmetros ,)
|*   - Melhorias na Interface.
|*   - Adicionada configuração para numero máximo de linhas no LOG. O Arquivo é
|*     ajustado sempre que o ACBrMonitor é iniciado
|*   - Adicionada configuração para Inverter o sinal da Gaveta de Dinheiro
******************************************************************************}
{$DEFINE VisualCLX}
{$I ACBr.inc}

unit ACBrMonitor1;
interface

uses
  SysUtils, Classes, QForms, QStyle, Qt,
  QTrayIcon,                                { Unit para criar icone no Systray }
  CmdUnit, 
  ACBrECF, ACBrECFClass, ACBrDIS, ACBrGAV, ACBrGAVClass, ACBrBase,
  ACBrCHQ, ACBrLCB,                                             { Unit do ACBr }
  QDialogs, IdBaseComponent, IdComponent, IdTCPServer, QExtCtrls,
  QMenus, QTypes, QImgList, QButtons, QStdCtrls, QComCtrls, QControls,
  QGraphics;

const
   Estados : array[TACBrECFEstado] of string =
             ('Não Inicializada', 'Desconhecido', 'Livre', 'Venda',
              'Pagamento', 'Relatório', 'Bloqueada', 'Requer Z', 'Requer X' );
   BufferMemoResposta = 1000 ;                { Maximo de Linhas no MemoResposta }
   Versao = '0.6b' ;

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
    cbSenha: TCheckBox;
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
    chLCBExcluirSufixo: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label22: TLabel;
    bLCBAtivar: TBitBtn;
    Label23: TLabel;
    edLCBPreExcluir: TEdit;
    lLCBCodigoLido: TLabel;
    bCancelar: TBitBtn;
    Timer1: TTimer;
    TcpServer: TIdTCPServer;
    chECFDescrGrande: TCheckBox;
    Label24: TLabel;
    cbLCBSufixoLeitor: TComboBox;
    cbGAVStrAbre: TComboBox;
    bExecECFTeste: TBitBtn;
    Bevel1: TBevel;
    Label11: TLabel;
    cbComandos: TCheckBox;
    sbProcessando: TStatusBar;
    chECFSinalGavetaInvertido: TCheckBox;
    gbSenha: TGroupBox;
    Label3: TLabel;
    edSenha: TEdit;
    gbLog: TGroupBox;
    edLogArq: TEdit;
    Label4: TLabel;
    Label26: TLabel;
    sedIntervalo: TSpinEdit;
    sedLogLinhas: TSpinEdit;
    sedECFTimeout: TSpinEdit;
    sedLCBIntervalo: TSpinEdit;
    sedConexoesTCP: TSpinEdit;
    Label27: TLabel;
    sedGAVIntervaloAbertura: TSpinEdit;
    bGAVAtivar: TBitBtn;
    Label28: TLabel;
    cbGAVAcaoAberturaAntecipada: TComboBox;
    gbCHQDados: TGroupBox;
    Label14: TLabel;
    edCHQFavorecido: TEdit;
    Label29: TLabel;
    edCHQCidade: TEdit;
    edCHQBemafiINI: TEdit;
    Label30: TLabel;
    sbCHQBemafiINI: TSpeedButton;
    OpenDialog1: TOpenDialog;
    bLCBSerial: TBitBtn;
    Bevel2: TBevel;
    lsndkey32: TLabel;
    cbLCBSufixoSndKey32: TComboBox;
    Bevel3: TBevel;
    rbLCBTeclado: TRadioButton;
    rbLCBFila: TRadioButton;
    shpLCB: TShape;
    Label25: TLabel;
    sedECFIntervalo: TSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure ACBrECF1MsgAguarde(Mensagem: String);
    procedure ACBrECF1MsgPoucoPapel(Sender: TObject);
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
    procedure chECFSinalGavetaInvertidoClick(Sender: TObject);
    procedure sedLCBIntervaloChanged(Sender: TObject; NewValue: Integer);
    procedure sedECFTimeoutChanged(Sender: TObject; NewValue: Integer);
    procedure sedGAVIntervaloAberturaChanged(Sender: TObject;
      NewValue: Integer);
    procedure bGAVAtivarClick(Sender: TObject);
    procedure tsGAVShow(Sender: TObject);
    procedure cbGAVAcaoAberturaAntecipadaChange(Sender: TObject);
    procedure edCHQFavorecidoChange(Sender: TObject);
    procedure edCHQCidadeChange(Sender: TObject);
    procedure sbCHQBemafiINIClick(Sender: TObject);
    procedure edCHQBemafiINIExit(Sender: TObject);
    procedure ACBrECF1AguardandoRespostaChange(Sender: TObject);
    procedure bLCBSerialClick(Sender: TObject);
    procedure rbLCBTecladoClick(Sender: TObject);
    procedure tsLCBShow(Sender: TObject);
    procedure sedECFIntervaloChanged(Sender: TObject; NewValue: Integer);
  private
    TrayIcon  : TTrayIcon ;
    ACBrMonitorINI : string;
    Inicio  : Boolean ;
    ArqSaiTXT, ArqSaiTMP, ArqEntTXT, ArqLogTXT : String ;
    Cmd : TACBrCmd ;
    NewLines : String ;
    fsDisWorking: Boolean;

    procedure Inicializar ;
    procedure EscondeConfig ;
    procedure ExibeConfig ;
    procedure LerIni ;
    procedure SalvarIni ;
    procedure AjustaLinhasLog ;

    Procedure Processar ;
    Procedure Resposta(Comando, Resposta : string);

    procedure TrataErros(Sender: TObject; E: Exception);

    procedure SetDisWorking(const Value: Boolean);
  public
    Conexao : TIdPeerThread ;

    property DISWorking : Boolean read fsDisWorking write SetDisWorking ;

    procedure AvaliaEstadoTsECF;
    procedure AvaliaEstadoTsGAV;
    procedure AvaliaEstadoTsLCB;
  end;

var
  FrmACBrMonitor: TFrmACBrMonitor;

implementation

uses IniFiles, StrUtils, TypInfo, IdStack,
     UtilUnit, DoECFUnit, DoGAVUnit, DoCHQUnit, DoDISUnit, DoLCBUnit, DoACBrUnit,
    {$IFDEF MSWINDOWS}sndkey32, {$ENDIF}
     ACBrECFNaoFiscal, ACBrUtil , Math, Sobre, DateUtils, ConfiguraSerial;
{$R *.xfm}

{-------------------------------- TFrmACBrMonitor -----------------------------}
procedure TFrmACBrMonitor.FormCreate(Sender: TObject);
Var MemStream : TMemoryStream ;
    iECF : TACBrECFModelo ;
    iCHQ : TACBrCHQModelo ;
    iDIS : TACBrDISModelo ;
begin
  mResp.Clear ;
  mCmd.Clear ;
  Cmd       := TACBrCmd.Create ;
  Inicio    := true ;
  ArqSaiTXT := '' ;
  ArqSaiTMP := '' ;
  ArqEntTXT := '' ;
  ArqLogTXT := '' ;
  Conexao   := nil ;
  NewLines  := '' ;
  DISWorking:= false ; 

  { Criando lista modelos de ECFs disponiveis }
  cbECFModelo.Items.Clear ;
  cbECFModelo.Items.Add('Procurar') ;
  iECF := Low( TACBrECFModelo ) ;
  while iECF <= High( TACBrECFModelo ) do
  begin
     cbECFModelo.Items.Add(GetEnumName(TypeInfo(TACBrECFModelo),Integer(iECF))) ;
     Inc(iECF) ;
  end ;
  AvaliaEstadoTsECF ;

  AvaliaEstadoTsGAV ;

  AvaliaEstadoTsLCB ;

  { Criando lista modelos de Impres.Cheque disponiveis }
  cbCHQModelo.Items.Clear ;
  iCHQ := Low( TACBrCHQModelo ) ;
  while iCHQ <= High( TACBrCHQModelo ) do
  begin
     cbCHQModelo.Items.Add(GetEnumName(TypeInfo(TACBrCHQModelo),Integer(iCHQ))) ;
     Inc(iCHQ) ;
  end ;

  { Criando lista Displays disponiveis }
  cbDISModelo.Items.Clear ;
  iDIS := Low( TACBrDISModelo ) ;
  while iDIS <= High( TACBrDISModelo ) do
  begin
     cbDISModelo.Items.Add(GetEnumName(TypeInfo(TACBrDISModelo),Integer(iDIS))) ;
     Inc(iDIS) ;
  end ;

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

  Application.Style.DefaultStyle := dsPlatinum ;
  Application.OnException        := TrataErros ;
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
     CanClose := ( MessageDlg('<b>Deseja realmente encerrar o <br>'+
                              '<font color=blue><b>ACBrMonitor</b></font> ?</b>',
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

  Timer1.Enabled := False ;

  TcpServer.OnDisconnect := nil ;
  TCPServer.Active       := False ;    { Desliga TCP }
end;

{-----------------------------------------------------------------------------}
Procedure TFrmACBrMonitor.TrataErros(Sender: TObject; E: Exception);
begin
  mResp.Lines.Add( E.Message );
  if cbLog.Checked then
     GravaArqResp(ArqLogTXT, 'Exception: ' + E.Message);

  StatusBar1.Panels[0].Text := 'Exception' ;
//  MessageDlg( E.Message,mtError,[mbOk],0) ;
end ;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.TCPServerConnect(AThread: TIdPeerThread);
begin
  sleep(100);
  Conexao := AThread;
  mCmd.Lines.Clear ;
  Resposta('','ACBrMonitor Ver. '+ Versao + ' - ACBr: '+ACBR_VERSAO +sLineBreak +
              'Conectado em: '+FormatDateTime('dd/mm/yy hh:nn:ss', now )+sLineBreak+
              'Máquina: '+AThread.Connection.Socket.Binding.PeerIP+sLineBreak+
              'Esperando por comandos.');
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.TcpServerExecute(AThread: TIdPeerThread);
Var Cmd : String ;
begin
  { Le o que foi enviado atravez da conexao TCP }
  Cmd := trim(AThread.Connection.ReadLn()) ;
  if Cmd <> '' then
  begin
     Conexao := AThread ;
     NewLines:= Cmd  ;
     { precisa do Synchronize, pois "Processar" atualiza controles visuais }
     AThread.Synchronize( Processar );
//     Processar ;  
  end ;
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
    ArqIni : String ;
    Txt    : String ;
    Erro   : String ;
    A : Integer ;
begin
  Timer1.Enabled := false ;
  Inicio         := false ;
  Erro           := '' ;
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

  while not Visible do
  begin
     Application.ProcessMessages ;
     sleep(200) ;
  end ;

  try
     LerIni;

     Application.Minimize ;
  except
     on E : Exception do
        Erro := Erro + sLineBreak + E.Message ;
  end ;

  EscondeConfig ;

  try
     AjustaLinhasLog ;  { Diminui / Ajusta o numero de linhas do Log }
  except
     on E : Exception do
        Erro := Erro + sLineBreak +E.Message ;
  end ;

  try
     bConfig.Enabled  := true ;
     Timer1.Interval  := sedIntervalo.Value ;
     Timer1.Enabled   := rbTXT.Checked ;
     TcpServer.Active := rbTCP.Checked ;

     mResp.Lines.Add('ACBr Monitor Ver.'+Versao);
     mResp.Lines.Add('Aguardando comandos ACBr');
  except
     on E : Exception do
        Erro := Erro + sLineBreak + E.Message ;
  end ;

  try
     if rbTCP.Checked then
      begin
        if TcpServer.Active then
        begin
           try
              Txt := 'Endereço: '+TcpServer.LocalName ;
              For A := 0 to IdStack.GStack.LocalAddresses.Count-1 do
                 Txt := Txt + '   ' + IdStack.GStack.LocalAddresses[A] ;
           except
           end ;
           mResp.Lines.Add(Txt) ;
           mResp.Lines.Add( 'Porta: ['+IntToStr(TcpServer.DefaultPort)+']') ;
        end ;
      end
     else
      begin
        mResp.Lines.Add('Monitorando Comandos TXT em: '+ArqEntTXT);
        mResp.Lines.Add('Respostas gravadas em: '+ArqSaiTXT);
      end ;

     if cbLog.Checked then
        mResp.Lines.Add('Log de comandos será gravado em: '+ArqLogTXT) ;

     { Se for NAO fiscal, desliga o AVISO antes de ativar }
     if ACBrECF1.Modelo = ecfNaoFiscal then
     begin
        ArqIni := (ACBrECF1.ECF as TACBrECFNaoFiscal).NomeArqINI ;
        if FileExists( ArqIni ) then
        begin
           Ini := TIniFile.Create( ArqIni ) ;
           try
             Ini.WriteString('Variaveis','Aviso_Legal','NAO');
          finally
             Ini.Free ;
          end ;
        end ;
     end ;
  except
     on E : Exception do
        Erro := Erro + sLineBreak + E.Message ;
  end ;

  if Erro <> '' then
     Raise Exception.Create( Erro );
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.AjustaLinhasLog;
Var LogNew, LogOld : TStringList ;
    I : Integer ;
begin
  if (sedLogLinhas.Value <= 0) or (not cbLog.Checked) or
     (not FileExists( ArqLogTXT )) then
     exit ;

  LogOld := TStringList.Create ;
  try
     LogOld.LoadFromFile( ArqLogTXT );
     if LogOld.Count > sedLogLinhas.Value then
     begin
        mResp.Lines.Add('Ajustando o tamanho do arquivo: '+ArqLogTXT) ;
        mResp.Lines.Add('Numero de Linhas atual: '+IntToStr(LogOld.Count) ) ;
        mResp.Lines.Add('Reduzindo para: '+IntToStr(sedLogLinhas.Value)+ ' linhas' );

        { Se for muito grande é mais rápido copiar para outra lista do que Deletar }
        if (LogOld.Count - sedLogLinhas.Value) > sedLogLinhas.Value then
         begin
           LogNew := TStringList.Create ;
           try
              LogNew.Clear ;

              For I := sedLogLinhas.Value downto 1 do
                 LogNew.Add(LogOld[ LogOld.Count - I ] ) ;

              LogNew.SaveToFile( ArqLogTXT );
           finally
              LogNew.Free ;
           end ;
         end
        else
         begin
           { Existe alguma maneira mais rápida de fazer isso ??? }
           LogOld.BeginUpdate ;
           while LogOld.Count > sedLogLinhas.Value do
              LogOld.Delete(0) ;
           LogOld.EndUpdate ;
           LogOld.SaveToFile( ArqLogTXT );
         end ;
     end ;
  finally
     LogOld.Free ;
  end ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.LerIni ;
var Ini : TIniFile;
    ECFAtivado, CHQAtivado, GAVAtivado, DISAtivado  : Boolean ;
begin
  Ini := TIniFile.Create( ACBrMonitorINI ) ;

  ECFAtivado := ACBrECF1.Ativo ;
  CHQAtivado := ACBrCHQ1.Ativo ;
  GAVAtivado := ACBrGAV1.Ativo ;
  DISAtivado := ACBrDIS1.Ativo ;
  
  try
     { Parametros do Monitor }
     rbTCP.Checked      := Ini.ReadBool('ACBrMonitor','Modo_TCP',false);
     rbTXT.Checked      := Ini.ReadBool('ACBrMonitor','Modo_TXT',false);
     edPortaTCP.Text    := IntToStr(Ini.ReadInteger('ACBrMonitor','TCP_Porta',3434));
     sedConexoesTCP.Value := Ini.ReadInteger('ACBrMonitor','Conexoes_Simultaneas',1);
     edEntTXT.Text      := Ini.ReadString('ACBrMonitor','TXT_Entrada','ENT.TXT');
     edSaiTXT.Text      := Ini.ReadString('ACBrMonitor','TXT_Saida','SAI.TXT');
     sedIntervalo.Value := Ini.ReadInteger('ACBrMonitor','Intervalo',50);
     edSenha.Text       := Ini.ReadString('ACBrMonitor','Senha','');
     cbSenha.Checked    := Ini.ReadBool('ACBrMonitor','Protegido',false) and
                           ( edSenha.Text <> '' );
     edLogArq.Text      := Ini.ReadString('ACBrMonitor','Arquivo_Log','LOG.TXT');
     cbLog.Checked      := Ini.ReadBool('ACBrMonitor','Gravar_Log',false) and
                           ( edLogArq.Text <> '' ) ;
     sedLogLinhas.Value := Ini.ReadInteger('ACBrMonitor','Linhas_Log',0);
     cbComandos.Checked := Ini.ReadBool('ACBrMonitor','Comandos_Remotos',false);

     ArqEntTXT := AcertaPath( edEntTXT.Text ) ;
     ArqSaiTXT := AcertaPath( edSaiTXT.Text ) ;
     ArqSaiTMP := ChangeFileExt( ArqSaiTXT, '.tmp' ) ;
     ArqLogTXT := AcertaPath( edLogArq.Text ) ;

     TcpServer.DefaultPort    := StrToInt( edPortaTCP.Text ) ;
     TcpServer.MaxConnections := sedConexoesTCP.Value ;
     TcpServer.MaxConnectionReply.Text.Add( 'Pedido de conexão negado.') ;
     TcpServer.MaxConnectionReply.Text.Add(
        'Número máximo de conexões ('+sedConexoesTCP.Text+') já atingido' ) ;

     { Parametros do ECF }
     cbECFPorta.Text       := Ini.ReadString('ECF','Porta','Procurar');
     cbECFModelo.ItemIndex := Ini.ReadInteger('ECF','Modelo',0)+1;
     cbECFModeloChange(Self);
     sedECFTimeout.Value   := Ini.ReadInteger('ECF','Timeout',3);
     sedECFIntervalo.Value := Ini.ReadInteger('ECF','IntervaloAposComando',100);
     chECFArredondaPorQtd.Checked := Ini.ReadBool('ECF','ArredondamentoPorQtd',false);
     chECFDescrGrande.Checked     := Ini.ReadBool('ECF','DescricaoGrande',True);
     chECFSinalGavetaInvertido.Checked := Ini.ReadBool('ECF','GavetaSinalInvertido',false);

     { Parametros do CHQ }
     cbCHQPorta.Text       := Ini.ReadString('CHQ','Porta','');
     cbCHQModelo.ItemIndex := Ini.ReadInteger('CHQ','Modelo',0);
     cbCHQModeloChange(Self);
     chCHQVerForm.Checked  := Ini.ReadBool('CHQ','VerificaFormulario',false);
     edCHQFavorecido.Text  := Ini.ReadString('CHQ','Favorecido','');
     edCHQCidade.Text      := Ini.ReadString('CHQ','Cidade','');
     edCHQBemafiINI.Text   := Ini.ReadString('CHQ','PathBemafiINI','');

     { Parametros do GAV }
     cbGAVPorta.Text       := Ini.ReadString('GAV','Porta','');
     cbGAVModelo.ItemIndex := Ini.ReadInteger('GAV','Modelo',0);
     cbGAVModeloChange(Self);
     cbGAVStrAbre.Text     := Ini.ReadString('GAV','StringAbertura','');
     sedGAVIntervaloAbertura.Value := Ini.ReadInteger('GAV','AberturaIntervalo',
        ACBrGAV1.AberturaIntervalo);
     cbGAVAcaoAberturaAntecipada.ItemIndex :=
        Ini.ReadInteger('GAV','AcaoAberturaAntecipada',1);

     { Parametros do DIS }
     cbDISPorta.Text       := Ini.ReadString('DIS','Porta','');
     cbDISModelo.ItemIndex := Ini.ReadInteger('DIS','Modelo',0);
     cbDISModeloChange(Self);
     edDISIntervalo.Text   := IntToStr(Ini.ReadInteger('DIS','Intervalo',300));
     edDISPassos.Text      := IntToStr(Ini.ReadInteger('DIS','Passos',1));

     { Parametros do LCB }
     cbLCBPorta.Text             := Ini.ReadString('LCB','Porta','Sem Leitor');
     cbLCBPortaChange(Self);
     sedLCBIntervalo.Value       := Ini.ReadInteger('LCB','Intervalo',100);
     cbLCBSufixoLeitor.Text      := Ini.ReadString('LCB','SufixoLeitor','#13');
     chLCBExcluirSufixo.Checked  := Ini.ReadBool('LCB','ExcluirSufixo',false) ;
     edLCBPreExcluir.Text        := Ini.ReadString('LCB','PrefixoAExcluir','');
     cbLCBSufixoSndKey32.Text    := Ini.ReadString('LCB','SufixoIncluir','') ;
     rbLCBTeclado.Checked        := Ini.ReadBool('LCB','Teclado',True) ;
     rbLCBFila.Checked           := not rbLCBTeclado.Checked ;
     ACBrLCB1.Device.ParamsString:= Ini.ReadString('LCB','Device','') ;
  finally
     Ini.Free ;
  end ;

  with ACBrECF1 do
  begin
     Desativar ;
     Modelo               := TACBrECFModelo( Max(cbECFModelo.ItemIndex-1,0) ) ;
     Porta                := cbECFPorta.Text ;
     TimeOut              := sedECFTimeout.Value ;
     IntervaloAposComando := sedECFIntervalo.Value ;
     ArredondaPorQtd      := chECFArredondaPorQtd.Checked ;
     DescricaoGrande      := chECFDescrGrande.Checked ;
     GavetaSinalInvertido := chECFSinalGavetaInvertido.Checked ;
     BloqueiaMouseTeclado := False ;
     ExibeMensagem        := False ;
     Ativo                := ECFAtivado ;
  end ;

  with ACBrCHQ1 do
  begin
     Desativar ;
     Modelo  := TACBrCHQModelo( cbCHQModelo.ItemIndex ) ;
     Porta   := cbCHQPorta.Text ;
     Favorecido := edCHQFavorecido.Text ;
     Cidade     := edCHQCidade.Text ;
     if edCHQBemafiINI.Text <> '' then
     begin
        try
           ArquivoBemaFiINI := edCHQBemafiINI.Text ;
           mResp.Lines.Add('Arquivo de Cheques: '+ArquivoBemaFiINI + sLineBreak +
                           ' lido com sucesso.') ;
        except
           on E : Exception do
              mResp.Lines.Add( E.Message );
        end ;
     end ;
     Ativo := CHQAtivado ;
  end ;

  with ACBrGAV1 do
  begin
     Desativar ;
     StrComando := cbGAVStrAbre.Text ;
     AberturaIntervalo  := sedGAVIntervaloAbertura.Value ;
     AberturaAntecipada := TACBrGAVAberturaAntecipada(
                                       cbGAVAcaoAberturaAntecipada.ItemIndex ) ;
     Modelo     := TACBrGAVModelo( cbGAVModelo.ItemIndex ) ;
     Porta      := cbGAVPorta.Text ;
     Ativo      := (GAVAtivado or (pos('serial',LowerCase(ModeloStr)) > 0) );
  end ;

  with ACBrDIS1 do
  begin
     Desativar ;
     Intervalo := StrToIntDef(edDISIntervalo.Text,0) ;
     Passos    := StrToIntDef(edDISPassos.Text,1) ;
     Modelo    := TACBrDISModelo( cbDISModelo.ItemIndex ) ;
     Porta     := cbDISPorta.Text ;
     Ativo     := DISAtivado ;
  end ;

  with ACBrLCB1 do
  begin
     Desativar ;
     Porta           := cbLCBPorta.Text ;
     Intervalo       := sedLCBIntervalo.Value ;
     Sufixo          := cbLCBSufixoLeitor.Text ;
     ExcluirSufixo   := chLCBExcluirSufixo.Checked ;
     PrefixoAExcluir := edLCBPreExcluir.Text ;
     UsarFila        := rbLCBFila.Checked ;

     { SndKey32.pas só funciona no Windows pois usa a API  "keybd_event" }
     if (ACBrLCB1.Porta <> 'Sem Leitor') and (ACBrLCB1.Porta <> '') then
        ACBrLCB1.Ativar ;
  end ;
end;

{------------------------------------------------------------------------------}
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
     Ini.WriteInteger('ACBrMonitor','Conexoes_Simultaneas',sedConexoesTCP.Value);
     Ini.WriteString('ACBrMonitor','TXT_Entrada',edEntTXT.Text);
     Ini.WriteString('ACBrMonitor','TXT_Saida',edSaiTXT.Text);
     Ini.WriteInteger('ACBrMonitor','Intervalo',sedIntervalo.Value);
     Ini.WriteBool('ACBrMonitor','Protegido',cbSenha.Checked);
     Ini.WriteString('ACBrMonitor','Senha',edSenha.Text);
     Ini.WriteBool('ACBrMonitor','Gravar_Log',cbLog.Checked);
     Ini.WriteString('ACBrMonitor','Arquivo_Log',edLogArq.Text);
     Ini.WriteInteger('ACBrMonitor','Linhas_Log',sedLogLinhas.Value);
     Ini.WriteBool('ACBrMonitor','Comandos_Remotos',cbComandos.Checked);

     { Parametros do ECF }
     Ini.WriteInteger('ECF','Modelo',max(cbECFModelo.ItemIndex-1,0));
     Ini.WriteString('ECF','Porta',cbECFPorta.Text);
     Ini.WriteInteger('ECF','Timeout',sedECFTimeout.Value);
     Ini.WriteInteger('ECF','IntervaloAposComando',sedECFIntervalo.Value);
     Ini.WriteBool('ECF','ArredondamentoPorQtd',chECFArredondaPorQtd.Checked);
     Ini.WriteBool('ECF','DescricaoGrande',chECFDescrGrande.Checked);
     Ini.WriteBool('ECF','GavetaSinalInvertido',chECFSinalGavetaInvertido.Checked);

     { Parametros do CHQ }
     Ini.WriteInteger('CHQ','Modelo',cbCHQModelo.ItemIndex);
     Ini.WriteString('CHQ','Porta',cbCHQPorta.Text);
     Ini.WriteBool('CHQ','VerificaFormulario',chCHQVerForm.Checked);
     Ini.WriteString('CHQ','Favorecido',edCHQFavorecido.Text);
     Ini.WriteString('CHQ','Cidade',edCHQCidade.Text);
     Ini.WriteString('CHQ','PathBemafiINI',edCHQBemafiINI.Text);

     { Parametros do GAV }
     Ini.WriteInteger('GAV','Modelo',cbGAVModelo.ItemIndex);
     Ini.WriteString('GAV','Porta',cbGAVPorta.Text);
     Ini.WriteString('GAV','StringAbertura',cbGAVStrAbre.Text);
     Ini.WriteInteger('GAV','AberturaIntervalo',sedGAVIntervaloAbertura.Value);
     Ini.WriteInteger('GAV','AcaoAberturaAntecipada',
        cbGAVAcaoAberturaAntecipada.ItemIndex);

     { Parametros do DIS }
     Ini.WriteInteger('DIS','Modelo',cbDISModelo.ItemIndex);
     Ini.WriteString('DIS','Porta',cbDISPorta.Text);
     Ini.WriteInteger('DIS','Intervalo',StrToIntDef(edDISIntervalo.Text,300));
     Ini.WriteInteger('DIS','Passos',StrToIntDef(edDISPassos.Text,1));

     { Parametros do LCB }
     Ini.WriteString('LCB','Porta',cbLCBPorta.Text);
     Ini.WriteInteger('LCB','Intervalo',sedLCBIntervalo.Value);
     Ini.WriteString('LCB','SufixoLeitor',cbLCBSufixoLeitor.Text);
     Ini.WriteBool('LCB','ExcluirSufixo',chLCBExcluirSufixo.Checked ) ;
     Ini.WriteString('LCB','PrefixoAExcluir',edLCBPreExcluir.Text);
     Ini.WriteString('LCB','SufixoIncluir',cbLCBSufixoSndKey32.Text) ;
     Ini.WriteBool('LCB','Teclado',rbLCBTeclado.Checked) ;
     Ini.WriteString('LCB','Device',ACBrLCB1.Device.ParamsString) ;
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
  if NewLines <> '' then
     mCmd.Lines.Add( NewLines ) ;

  NewLines := '' ;

  while mCmd.Lines.Count > 0 do
  begin
     Application.ProcessMessages ;

     Linha := Trim( mCmd.Lines[0] );
     mCmd.Lines.Delete(0);

     if Linha <> '' then
     begin
        sbProcessando.Panels[1].Text := Linha ;

        try
           if pos('.',Linha) = 0 then              { Comandos do ACBrMonitor }
              Linha := 'ACBR.'+Linha ;

           Cmd.Comando := Linha ;

           if Cmd.Objeto = 'ACBR' then
              DoACBr( Cmd )
           else if Cmd.Objeto = 'ECF' then
              DoECF( Cmd )
           else if Cmd.Objeto = 'GAV' then
              DoGAV( Cmd )
           else if Cmd.Objeto = 'CHQ' then
              DoCHQ( Cmd )
           else if Cmd.Objeto = 'DIS' then
              DoDIS( Cmd )
           else if Cmd.Objeto = 'LCB' then
              DoLCB( Cmd );

           Resposta(Linha, 'OK: '+Cmd.Resposta );
        except
           on E : Exception do
              Resposta(Linha, 'ERRO: '+E.Message );
        end ;

        sbProcessando.Panels[1].Text := '' ;
     end ;
  end ;
end;

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
  begin
     { Primeiro salva em Temporário para que a gravação de todos os Bytes ocorra
       antes que a aplicação controladora do ACBrMonitor tente ler o arquivo de
       Resposta incompleto }
     DeleteFile( ArqSaiTMP ) ;
     
     if FileExists(ArqSaiTXT) then
        RenameFile(ArqSaiTXT, ArqSaiTMP) ; { GravaArqResp faz append se arq. existir }

     GravaArqResp(ArqSaiTMP, Resposta);
     RenameFile(ArqSaiTMP, ArqSaiTXT) ;
  end ;

  mResp.Lines.BeginUpdate ;
  mResp.Lines.Add( Comando + sLineBreak + Resposta ) ;
  while mResp.Lines.Count > BufferMemoResposta do
     mResp.Lines.Delete(0) ;
  mResp.Lines.EndUpdate ;

  if cbLog.Checked then
     GravaArqResp(ArqLogTXT, Comando + sLineBreak + Resposta);
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

     if sedConexoesTCP.Value <= 0 then
        sedConexoesTCP.Value := 1 ;
   end ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.cbSenhaClick(Sender: TObject);
begin
  gbSenha.Enabled := cbSenha.Checked ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.cbLogClick(Sender: TObject);
begin
  gbLog.Enabled := cbLog.Checked ;

  if cbLog.Checked and (edLogArq.Text = '') then
     edLogArq.Text := 'LOG.TXT' ;
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
  StatusBar1.Panels[1].Text :=
     StringReplace( Mensagem, sLineBreak, ' ',[rfReplaceAll]) ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.ACBrECF1MsgPoucoPapel(Sender: TObject);
begin
  StatusBar1.Panels[1].Text := 'ATENÇAO. Pouco papel'
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
  sedECFTimeout.Enabled        := bECFAtivar.Enabled ;
  sedECFIntervalo.Enabled      := bECFAtivar.Enabled ;
  chECFSinalGavetaInvertido.Enabled := bECFAtivar.Enabled ;

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
procedure TFrmACBrMonitor.sedECFTimeoutChanged(Sender: TObject;
  NewValue: Integer);
begin
  ACBrECF1.TimeOut := sedECFTimeout.Value ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.sedECFIntervaloChanged(Sender: TObject;
  NewValue: Integer);
begin
  ACBrECF1.IntervaloAposComando := sedECFIntervalo.Value ;
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
procedure TFrmACBrMonitor.chECFSinalGavetaInvertidoClick(Sender: TObject);
begin
  ACBrECF1.GavetaSinalInvertido := chECFSinalGavetaInvertido.Checked ;
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
procedure TFrmACBrMonitor.edCHQFavorecidoChange(Sender: TObject);
begin
  ACBrCHQ1.Favorecido := edCHQFavorecido.Text ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.edCHQCidadeChange(Sender: TObject);
begin
  ACBrCHQ1.Cidade := edCHQCidade.Text ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.bCHQTestarClick(Sender: TObject);
var wAtivo : Boolean ;
begin
  wAtivo := ACBrCHQ1.Ativo ;

  try
     ACBrCHQ1.Ativar ;
     ACBrCHQ1.Banco     := '001' ;
     ACBrCHQ1.Cidade    := IfThen(edCHQCidade.Text='',
                                    'Nome da sua Cidade',edCHQCidade.Text) ;
     ACBrCHQ1.Favorecido:= IfThen(edCHQFavorecido.Text='',
                                     'Nome do Favorecido', edCHQFavorecido.Text) ;
     ACBrCHQ1.Observacao:= 'Texto de Observacao' ;
     ACBrCHQ1.Valor     := 123456.12 ;
     ACBrCHQ1.ImprimirCheque ;
  finally
     ACBrCHQ1.Ativo := wAtivo ;
  end ;
end;

{------------------------------------ ACBrGAV ---------------------------------}
{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.tsGAVShow(Sender: TObject);
begin
  AvaliaEstadoTsGAV ;
end;

procedure TFrmACBrMonitor.bGAVAtivarClick(Sender: TObject);
begin
  if bGAVAtivar.Caption = '&Ativar' then
     ACBrGAV1.Ativar
  else
     ACBrGAV1.Desativar ;

  AvaliaEstadoTsGAV ;
end;

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

  AvaliaEstadoTsGAV ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.cbGAVStrAbreChange(Sender: TObject);
begin
  ACBrGAV1.StrComando := cbGAVStrAbre.Text ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.sedGAVIntervaloAberturaChanged(Sender: TObject;
  NewValue: Integer);
begin
  ACBrGAV1.AberturaIntervalo := sedGAVIntervaloAbertura.Value ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.cbGAVAcaoAberturaAntecipadaChange(
  Sender: TObject);
begin
  ACBrGAV1.AberturaAntecipada := TACBrGAVAberturaAntecipada(
                                       cbGAVAcaoAberturaAntecipada.ItemIndex ) ;
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
  try
     tsGAV.Enabled := False ;
     lGAVEstado.Caption := 'AGUARDE' ;

     ACBrGAV1.AbreGaveta ;
  finally
     tsGAV.Enabled := True ;
     bGAVEstado.Click ;
  end ;
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
{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.tsLCBShow(Sender: TObject);
begin
  AvaliaEstadoTsLCB ;
end;

procedure TFrmACBrMonitor.cbLCBPortaChange(Sender: TObject);
begin
  Try
     ACBrLCB1.Desativar ;
     ACBrLCB1.Porta := cbLCBPorta.Text ;
  finally
     cbLCBPorta.Text := ACBrLCB1.Porta ;
  end ;

  AvaliaEstadoTsLCB ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.bLCBSerialClick(Sender: TObject);
begin
  ACBrLCB1.Desativar ;
  frConfiguraSerial := TfrConfiguraSerial.Create(self);

  try
    frConfiguraSerial.Device.Porta        := ACBrLCB1.Device.Porta ;
    frConfiguraSerial.cmbPortaSerial.Text := cbLCBPorta.Text ;
    frConfiguraSerial.Device.ParamsString := ACBrLCB1.Device.ParamsString ;

    if frConfiguraSerial.ShowModal = mrOk then
    begin
       cbLCBPorta.Text              := frConfiguraSerial.Device.Porta ;
       ACBrLCB1.Device.ParamsString := frConfiguraSerial.Device.ParamsString ;
    end ;
  finally
     FreeAndNil( frConfiguraSerial ) ;
     AvaliaEstadoTsLCB ;
  end ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.sedLCBIntervaloChanged(Sender: TObject;
  NewValue: Integer);
begin
  ACBrLCB1.Intervalo := sedLCBIntervalo.Value ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.rbLCBTecladoClick(Sender: TObject);
begin
{$IFDEF MSWINDOWS}
  cbLCBSufixoSndKey32.Enabled := rbLCBTeclado.Checked ;
{$ENDIF}
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.bLCBAtivarClick(Sender: TObject);
begin
  sedLCBIntervalo.Value := ACBrLCB1.Intervalo ;
  if bLCBAtivar.Caption = '&Ativar' then
     ACBrLCB1.Ativar
  else
     ACBrLCB1.Desativar ;

  AvaliaEstadoTsLCB ;
end;

procedure TFrmACBrMonitor.AvaliaEstadoTsLCB;
begin
  bLCBAtivar.Enabled := ((cbLCBPorta.Text <> 'Sem Leitor') and
                         (cbLCBPorta.ItemIndex > 0)            ) ;
  cbLCBSufixoSndKey32.Enabled := bLCBAtivar.Enabled ;
  cbLCBSufixoLeitor.Enabled   := bLCBAtivar.Enabled ;
  edLCBPreExcluir.Enabled     := bLCBAtivar.Enabled ;
  chLCBExcluirSufixo.Enabled  := bLCBAtivar.Enabled ;
  sedLCBIntervalo.Enabled     := bLCBAtivar.Enabled ;
  bLCBSerial.Enabled          := bLCBAtivar.Enabled ;
  rbLCBTeclado.Enabled        := bLCBAtivar.Enabled ;
  rbLCBFila.Enabled           := bLCBAtivar.Enabled ;

  bLCBAtivar.Glyph := nil ;
  if ACBrLCB1.Ativo then
   begin
     bLCBAtivar.Caption := '&Desativar' ;
     shpLCB.Color       := clLime ;
     ImageList1.GetBitmap(6,bLCBAtivar.Glyph);
   end
  else
   begin
     bLCBAtivar.Caption := '&Ativar' ;
     shpLCB.Color       := clRed ;
     ImageList1.GetBitmap(5,bLCBAtivar.Glyph);
   end ;
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

  mResp.Lines.Add('LCB -> '+ACBrLCB1.UltimoCodigo) ;

  if rbLCBTeclado.Checked then
  begin
     Codigo := ACBrLCB1.UltimoCodigo ;
     Codigo := Codigo + Trim(cbLCBSufixoSndKey32.Text) ;

     {$IFDEF MSWINDOWS}
     SendKeys( pchar(Codigo) , True ) ;
     {$ENDIF}

     { Alguem sabe como enviar as teclas para o Buffer do KDE ??? }
     {$IFDEF LINUX}
     RunCommand('echo',Codigo+' > /dev/stdin',true) ;
     {$ENDIF}
  end ;
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

  bCHQTestar.Enabled     := (ACBrCHQ1.Modelo <> chqNenhuma) ;
  cbCHQPorta.Enabled     := bCHQTestar.Enabled and (ACBrCHQ1.Modelo <> chqImpressoraECF) ;
  chCHQVerForm.Enabled   := bCHQTestar.Enabled ;
  gbCHQDados.Enabled     := bCHQTestar.Enabled ;
  edCHQBemafiINI.Enabled := bCHQTestar.Enabled ;
  sbCHQBemafiINI.Enabled := bCHQTestar.Enabled ;
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
     sedGAVIntervaloAbertura.Value := ACBrGAV1.AberturaIntervalo ;
  end ;

  AvaliaEstadoTsGAV ;
end;

procedure TFrmACBrMonitor.AvaliaEstadoTsGAV;
begin
  bGAVAtivar.Enabled   := (ACBrGAV1.Modelo <> gavNenhuma) ;
  bGAVEstado.Enabled   := ACBrGAV1.Ativo ;
  bGAVAbrir.Enabled    := bGAVEstado.Enabled ;
  cbGAVPorta.Enabled   := not (ACBrGAV1.Modelo in [gavImpressoraECF, gavNenhuma] ) ;
  cbGAVStrAbre.Enabled := (ACBrGAV1.Modelo = gavImpressoraComum) ;
  sedGAVIntervaloAbertura.Enabled     := bGAVAtivar.Enabled ;
  cbGAVAcaoAberturaAntecipada.Enabled := bGAVAtivar.Enabled ;

  bGAVAtivar.Glyph := nil ;
  if ACBrGAV1.Ativo then
   begin
     bGAVAtivar.Caption := '&Desativar' ;
     ImageList1.GetBitmap(6,bGAVAtivar.Glyph);
   end
  else
   begin
     bGAVAtivar.Caption := '&Ativar' ;
     ImageList1.GetBitmap(5,bGAVAtivar.Glyph);
   end ;
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

procedure TFrmACBrMonitor.sbCHQBemafiINIClick(Sender: TObject);
begin
  OpenDialog1.FileName := edCHQBemafiINI.Text ;

  if OpenDialog1.Execute then
  begin
     edCHQBemafiINI.Text := OpenDialog1.FileName ;
     ACBrCHQ1.ArquivoBemaFiINI := edCHQBemafiINI.Text ;
  end ;
end;

procedure TFrmACBrMonitor.edCHQBemafiINIExit(Sender: TObject);
begin
  ACBrCHQ1.ArquivoBemaFiINI := edCHQBemafiINI.Text ;
end;

procedure TFrmACBrMonitor.ACBrECF1AguardandoRespostaChange(
  Sender: TObject);
begin
  { ECF sendo usado junto LCB, deve desabilitar o LCB enquando o ECF estiver
    ocupado imprimindo, para evitar de enviar códigos na hora indevida, como
    por exemplo, quando o EDIT / GET do Campos código não está com o FOCO }
  if ACBrLCB1.Ativo then
     if ACBrECF1.AguardandoResposta then
        ACBrLCB1.Intervalo := 0
     else
        ACBrLCB1.Intervalo := sedLCBIntervalo.Value ;
end;

procedure TFrmACBrMonitor.SetDisWorking(const Value: Boolean);
begin
  if ACBrLCB1.Ativo then
     if Value then
        ACBrLCB1.Intervalo := 0
     else
        ACBrLCB1.Intervalo := sedLCBIntervalo.Value ;

  fsDisWorking := Value;
end;

end.


