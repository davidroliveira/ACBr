{******************************************************************************}
{ Projeto: ACBr Monitor                                                        }
{  Executavel multiplataforma que faz uso do conjunto de componentes ACBr para }
{ criar uma interface de comunicação com equipamentos de automacao comercial.  }
{                                                                              }
{ Direitos Autorais Reservados (c) 2004 Daniel Simoes de Almeida               }
{                                  2005 Fábio Rogério Baía                     }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Você pode obter a última versão desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{  Este é software livre; você pode redistribuí-lo e/ou modificá-lo            }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }
{                                                                              }
{  Este software é distribuído na expectativa de que seja útil, porém, SEM     }
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
{ Fábio Rogério Baía  -  rogerio@frbaia.com.br  -  www.frbaia.com.br           }
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
  SysUtils, Classes, QForms, QTrayIcon,
  ACBrBase, ACBrECF, ACBrECFClass, ACBrDIS, ACBrGAV, ACBrCHQ, ACBrLCB,   { Unit do ACBr }
  IdBaseComponent, IdComponent, IdTCPServer, QMenus, QTypes, QImgList,
  QStdCtrls, QComCtrls, QControls, QExtCtrls, QButtons  ;

const
   Versao  = '0.02a' ;
   Estados : array[TACBrECFEstado] of string =
      ('Não Inicializada', 'Desconhecido', 'Livre', 'Venda',
       'Pagamento', 'Relatório', 'Bloqueada', 'Requer Z', 'Requer X' );
   Objetos = '"ECF","CHQ","GAV","DIS"' ;  { Objetos suportados nos Comandos }
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
    btOk: TBitBtn;
    bConfig: TButton;
    TCPServer: TIdTCPServer;
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
    chECFBloqueia: TCheckBox;
    chECFArredondaPorQtd: TCheckBox;
    chECFExibeMsg: TCheckBox;
    chECFTentar: TCheckBox;
    Label11: TLabel;
    mECFMsg: TMemo;
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
    edGAVStrAbre: TEdit;
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
    cbxLCBPorta: TComboBox;
    edLCBSufLeitura: TEdit;
    edLCBIntervalo: TEdit;
    cbLCBExcluirSufixo: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label22: TLabel;
    BitBtn1: TBitBtn;
    Label23: TLabel;
    edLCBPreExcluir: TEdit;
    lLCBCodigoLido: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    edLCBSufINC: TEdit;
    bCancelar: TBitBtn;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure TCPServerExecute(AThread: TIdPeerThread);
    procedure TCPServerConnect(AThread: TIdPeerThread);
    procedure TCPServerDisconnect(AThread: TIdPeerThread);
    procedure ACBrECF1MsgAguarde(Mensagem: String);
    procedure ACBrECF1MsgPoucoPapel(Sender: TObject);
    procedure ACBrECF1AguardandoRespostaChange(Sender: TObject);
    procedure bConfigClick(Sender: TObject);
    procedure cbLogClick(Sender: TObject);
    procedure cbSenhaClick(Sender: TObject);
    procedure edPortaTCPKeyPress(Sender: TObject; var Key: Char);
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
    procedure btOkClick(Sender: TObject);
    procedure edGAVStrAbreChange(Sender: TObject);
    procedure rbTCPTXTClick(Sender: TObject);
    procedure cbCHQModeloChange(Sender: TObject);
    procedure cbCHQPortaChange(Sender: TObject);
    procedure cbECFModeloChange(Sender: TObject);
    procedure cbECFPortaChange(Sender: TObject);
    procedure chECFArredondaPorQtdClick(Sender: TObject);
    procedure chECFBloqueiaClick(Sender: TObject);
    procedure chECFExibeMsgClick(Sender: TObject);
    procedure chECFTentarClick(Sender: TObject);
    procedure edECFTimeoutChange(Sender: TObject);
    procedure mECFMsgChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bCancelarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DoACBrTimer(Sender: TObject);
  private
    Conexao   : TIdPeerThread;
    TrayIcon  : TTrayIcon ;
    ACBrMonitorINI : string;
    Inicio  : Boolean ;
    Working : Boolean ;
    ArqSaiTXT, ArqEntTXT, ArqLogTXT : String ;
    Cmd : TACBrCmd ;

    procedure Inicializar ;
    procedure EscondeConfig ;
    procedure ExibeConfig ;
    procedure LerIni ;
    procedure SalvarIni ;
    procedure Desativar ;

    Procedure Processar ;
    Procedure Resposta(Comando, Resposta : string);
    Procedure GravaArqResp(ArqTXT, Retorno : string);

    function AcertaPath( APath : String ) : String ;
  public
  end;

var
  FrmACBrMonitor: TFrmACBrMonitor;

implementation

uses IniFiles, StrUtils, DoECFUnit (*{$IFDEF MSWINDOWS},sndkey32{$ENDIF}*), QDialogs ;
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
    wComando : string ;
    wParam   : STring ;
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

  { Achando o Metodo }
  wComando := copy(wComando, P+1, Length(wComando) ) ;
  P := pos('(',wComando) ;
  if P = 0 then
  begin
     { Verificando se é uma atribuição a propriedade Ex: "Ativo := true" }
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
     raise Exception.Create('Metodo não definido') ;

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
        PaF := Pos('"',copy(wComando, PaI+1, Length(Wcomando)) ) ;
        if PaF = 0 then
           raise Exception.Create('Parametro Inválido. String não terminada');

        wParam := copy(wComando, PaI+1 , PaF-1 ) ;
        Pv := PaI + PaF + 1 ;
      end
     else
        wParam := copy(wComando, 1, Pv-1 ) ;

     fsParams.Add(wParam) ;
     wComando := copy(wComando, Pv+1, Length( wComando ) ) ;
  end ;
end;

{-------------------------------- TFrmACBrMonitor -----------------------------}
procedure TFrmACBrMonitor.FormCreate(Sender: TObject);
Var MemStream : TMemoryStream ;
begin
  mResp.Clear ;
  mCmd.Clear ;
  Cmd       := TACBrCmd.Create ;
  Inicio    := true ;
  ArqSaiTXT := '' ;
  ArqEntTXT := '' ;
  ArqLogTXT := '' ;

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

  Application.OnMinimize := Ocultar1Click ;
  Application.OnRestore  := Restaurar1Click ;
  Application.Title      := Caption ;

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
  Desativar ;
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
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.Encerrar1Click(Sender: TObject);
begin
  close ;
end;

{------------------------- Procedures de Uso Interno --------------------------}
procedure TFrmACBrMonitor.Inicializar;
begin
  Timer1.Enabled := false ;
  Inicio         := false ;
  ACBrMonitorINI := ExtractFilePath(Application.ExeName)+ 'ACBrMonitor.ini';

  if not FileExists( ACBrMonitorINI ) then //verifica se o arq. de config existe
  begin                                    //se nao existir vai para as configs
    ShowMessage('Arquivos de Configuração não encontrado.'+sLineBreak+sLineBreak+
                'Favor configurar o ACBrMonitor e clicar em Salvar.');
    bConfig.Click ;
  end;

  LerIni;
  EscondeConfig ;
  Application.Minimize ;

  bConfig.Enabled  := true ;
  Timer1.Interval  := 300 ;
  Timer1.Enabled   := rbTXT.Checked ;
  TCPServer.Active := rbTCP.Checked;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.Desativar;
begin
//   if Assigned( Conexao ) then
//      conexao.Connection.Disconnect;

  TCPServer.Active := False ;    { Desliga TCP }
  Timer1.Enabled   := False ;    { Desliga TXT }
  ACBrECF1.Desativar ;
  ACBrCHQ1.Desativar ;
  ACBrGAV1.Desativar ;
  ACBrDIS1.Desativar ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.LerIni ;
var Ini : TIniFile;
begin
  Ini := TIniFile.Create( ACBrMonitorINI ) ;

  try
     { Parametros do Monitor }
     rbTCP.Checked   := Ini.ReadBool('ACBrMonitor','Modo_TCP',false);
     rbTXT.Checked   := Ini.ReadBool('ACBrMonitor','Modo_TXT',false);
     edPortaTCP.Text := IntToStr(Ini.ReadInteger('ACBrMonitor','TCP_Porta',3434));
     edEntTXT.Text   := Ini.ReadString('ACBrMonitor','TXT_Entrada','ENT.TXT');
     edSaiTXT.Text   := Ini.ReadString('ACBrMonitor','TXT_Saida','SAI.TXT');
     cbSenha.Checked := Ini.ReadBool('ACBrMonitor','Protegido',false);
     edSenha.Text    := Ini.ReadString('ACBrMonitor','Senha','');
     cbLog.Checked   := Ini.ReadBool('ACBrMonitor','Gravar_Log',false);
     edArqLog.Text   := Ini.ReadString('ACBrMonitor','Arquivo_Log','LOG.TXT');

     ArqEntTXT := AcertaPath( edEntTXT.Text ) ;
     ArqSaiTXT := AcertaPath( edSaiTXT.Text ) ;
     ArqLogTXT := AcertaPath( edArqLog.Text ) ;

     TCPServer.DefaultPort := StrToInt( edPortaTCP.Text ) ;

     { Parametros do ECF }
     cbECFModelo.ItemIndex := Ini.ReadInteger('ECF','Modelo',0);
     cbECFPorta.Text       := Ini.ReadString('ECF','Porta','Procurar');
     edECFTimeout.Text     := IntToStr(Ini.ReadInteger('ECF','Timeout',3));
     chECFTentar.Checked   := Ini.ReadBool('ECF','TentarNovamente',false);
     chECFBloqueia.Checked := Ini.ReadBool('ECF','BloqueiaMouseTeclado',true);
     chECFExibeMsg.Checked := Ini.ReadBool('ECF','ExibirMsgAguarde',true);
     chECFArredondaPorQtd.Checked := Ini.ReadBool('ECF','ArredondamentoPorQtd',false);
     mECFMsg.Text := Ini.ReadString('ECF','Mensagem',
                     'Aguardando o retorno do ECF'+sLineBreak+
                     ' Faltam %d segundos para TimeOut') ;

     { Parametros do CHQ }
     cbCHQModelo.ItemIndex := Ini.ReadInteger('CHQ','Modelo',0);
     cbCHQPorta.Text       := Ini.ReadString('CHQ','Porta','');
     chCHQVerForm.Checked  := Ini.ReadBool('CHQ','VerificaFormulario',false);

     { Parametros do GAV }
     cbGAVModelo.ItemIndex := Ini.ReadInteger('GAV','Modelo',0);
     cbGAVPorta.Text       := Ini.ReadString('GAV','Porta','');
     edGAVStrAbre.Text     := Ini.ReadString('GAV','StringAbertura','');

     { Parametros do DIS }
     cbDISModelo.ItemIndex := Ini.ReadInteger('DIS','Modelo',0);
     cbDISPorta.Text       := Ini.ReadString('DIS','Porta','');
     edDISIntervalo.Text   := IntToStr(Ini.ReadInteger('DIS','Intervalo',300));
     edDISPassos.Text      := IntToStr(Ini.ReadInteger('DIS','Passos',1));
  finally
     Ini.Free ;
  end ;

  with ACBrECF1 do
  begin
     Desativar ;
     Modelo               := TACBrECFModelo( cbECFModelo.ItemIndex ) ;
     Porta                := cbECFPorta.Text ;
     TimeOut              := StrToIntDef(edECFTimeout.Text,3) ;
     MsgAguarde           := mECFMsg.Text ;
     ReTentar             := chECFTentar.Checked ;
     BloqueiaMouseTeclado := chECFBloqueia.Checked ;
     ExibeMensagem        := chECFExibeMsg.Checked ;
     ArredondaPorQtd      := chECFArredondaPorQtd.Checked ;
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
     StrComando := edGAVStrAbre.Text ;
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
end;

procedure TFrmACBrMonitor.SalvarIni;
var Ini : TIniFile;
begin
  Ini := TIniFile.Create( ACBrMonitorINI ) ;

  try
     // Parametros do Monitor //
     Ini.WriteBool('ACBrMonitor','Modo_TCP',rbTCP.Checked);
     Ini.WriteBool('ACBrMonitor','Modo_TXT',rbTXT.Checked);
     Ini.WriteInteger('ACBrMonitor','TCP_Porta',StrToIntDef(edPortaTCP.Text,3434));
     Ini.WriteString('ACBrMonitor','TXT_Entrada',edEntTXT.Text);
     Ini.WriteString('ACBrMonitor','TXT_Saida',edSaiTXT.Text);
     Ini.WriteBool('ACBrMonitor','Protegido',cbSenha.Checked);
     Ini.WriteString('ACBrMonitor','Senha',edSenha.Text);
     Ini.WriteBool('ACBrMonitor','Gravar_Log',cbLog.Checked);
     Ini.WriteString('ACBrMonitor','Arquivo_Log',edArqLog.Text);

     // Parametros do ECF //
     Ini.WriteInteger('ECF','Modelo',cbECFModelo.ItemIndex);
     Ini.WriteString('ECF','Porta',cbECFPorta.Text);
     Ini.WriteInteger('ECF','Timeout',StrToIntDef(edECFTimeout.Text,3));
     Ini.WriteBool('ECF','TentarNovamente',chECFTentar.Checked);
     Ini.WriteBool('ECF','BloqueiaMouseTeclado',chECFBloqueia.Checked);
     Ini.WriteBool('ECF','ExibirMsgAguarde',chECFExibeMsg.Checked);
     Ini.WriteBool('ECF','ArredondamentoPorQtd',chECFArredondaPorQtd.Checked);
     Ini.WriteString('ECF','Mensagem', mECFMsg.Text ) ;

     { Parametros do CHQ }
     Ini.WriteInteger('CHQ','Modelo',cbCHQModelo.ItemIndex);
     Ini.WriteString('CHQ','Porta',cbCHQPorta.Text);
     Ini.WriteBool('CHQ','VerificaFormulario',chCHQVerForm.Checked);

     { Parametros do GAV }
     Ini.WriteInteger('GAV','Modelo',cbGAVModelo.ItemIndex);
     Ini.WriteString('GAV','Porta',cbGAVPorta.Text);
     Ini.WriteString('GAV','StringAbertura',edGAVStrAbre.Text);

     { Parametros do DIS }
     Ini.WriteInteger('DIS','Modelo',cbDISModelo.ItemIndex);
     Ini.WriteString('DIS','Porta',cbDISPorta.Text);
     Ini.WriteInteger('DIS','Intervalo',StrToIntDef(edDISIntervalo.Text,300));
     Ini.WriteInteger('DIS','Passos',StrToIntDef(edDISPassos.Text,1));
  finally
     Ini.Free ;
  end ;
end;


{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.EscondeConfig;
begin
  pConfig.Visible := False ;

  bConfig.Caption   := 'Configurar >>' ;
  bCancelar.Visible := false ;
  btOk.Visible      := true ;
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

  bConfig.Caption   := '<<  Salvar' ;
  bCancelar.Visible := true ;
  btOk.Visible      := false ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.Processar;
var
  Linha : string;
begin
  if Working then exit ;{ Evita chamadas recursivas disparadas a cada OnChange }

  Working := true ;
  try
     while mCmd.Lines.Count > 0 do
     begin
        Application.ProcessMessages ;

        Linha := Trim( mCmd.Lines[0] );
        mCmd.Lines.Delete(0);

        try
           if pos('.',Linha) = 0 then              { Comandos do ACBrMonitor }
           begin
              Linha := LowerCase( Linha ) ;
              if (Linha = 'exit') or (Linha = 'bye') or (Linha = 'fim') or
                 (Linha = 'sair') then {fecha conexao}
               begin
                 Resposta(Linha, 'Obrigado por usar o ACBrMonitor');
                 Desativar ;
               end
              else
                 raise Exception.Create('Comando inválido: '+Linha) ;

              exit ;
           end ;

           Cmd.Comando := Linha ;

           if Cmd.Objeto = 'ECF' then
              DoECF( Cmd ) ;{
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
  finally
     Working := false ;
  end ;
end;

{------------------------------------------------------------------------------}
Procedure TFrmACBrMonitor.Resposta(Comando, Resposta : string );
begin
  if rbTCP.Checked then
  begin
     if Assigned( conexao ) then
        conexao.Connection.WriteLn(Resposta) ;
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
  if not FileExists(ArqTXT) then
     Rewrite( Arq )
  else
     Append( Arq ) ;

  Writeln( Arq, Retorno ) ;

  Flush( Arq ) ;
  CloseFile( Arq ) ;
end;

{------------------------------------------------------------------------------}
function TFrmACBrMonitor.AcertaPath(APath : String): String;
begin
  Result := trim(APath) ;
  if pos(PathDelim, APath) = 0 then
     Result := ExtractFilePath( Application.ExeName ) + APath ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.btOkClick(Sender: TObject);
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
procedure TFrmACBrMonitor.edPortaTCPKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not ( Key in ['0'..'9',#13,#8] ) then
     Key := #0 ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.ACBrECF1MsgAguarde(Mensagem: String);
begin
  StatusBar1.Panels[2].Text := Mensagem ;
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

       Processar ;
     end;
  finally
     Timer1.Enabled := True;
  end ;
end;

{---------------------------------- ACBrECF -----------------------------------}
{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.tsECFShow(Sender: TObject);
begin
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
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.cbECFModeloChange(Sender: TObject);
begin
  try
     ACBrECF1.Modelo := TACBrECFModelo( cbECFModelo.ItemIndex ) ;
  finally
     cbECFModelo.ItemIndex := Integer( ACBrECF1.Modelo ) ;
  end ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.cbECFPortaChange(Sender: TObject);
begin
  try
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
procedure TFrmACBrMonitor.chECFTentarClick(Sender: TObject);
begin
  ACBrECF1.ReTentar := chECFTentar.Checked ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.chECFBloqueiaClick(Sender: TObject);
begin
  ACBrECF1.BloqueiaMouseTeclado := chECFBloqueia.Checked ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.chECFExibeMsgClick(Sender: TObject);
begin
  ACBrECF1.ExibeMensagem := chECFExibeMsg.Checked ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.chECFArredondaPorQtdClick(Sender: TObject);
begin
  ACBrECF1.ArredondaPorQtd := chECFArredondaPorQtd.Checked ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.mECFMsgChange(Sender: TObject);
Var Msg : String ;
    L : Integer ;
begin
  Msg := '' ;
  For L := 0 to mECFMsg.Lines.Count - 1 do
  begin
     Msg := Msg + mECFMsg.Lines[L]+#10
  end ;

  ACBrECF1.MsgAguarde := copy(Msg, 1, Length(Msg)-1 ) ;
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
        cbECFModelo.ItemIndex := Integer(ACBrECF1.Modelo) ;
        cbECFPorta.Text       := ACBrECF1.Porta ;
     end ;
   end
  else
     ACBrECF1.Desativar ;

  tsECFShow( Sender );
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
     if not ACBrECF1.Ativo then
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
        ACBrCHQ1.Porta := cbCHQPorta.Text ;
     finally
        cbCHQPorta.Text := ACBrCHQ1.Porta ;
     end ;
  end ;
end;

{------------------------------------ ACBrGAV ---------------------------------}
procedure TFrmACBrMonitor.cbGAVPortaChange(Sender: TObject);
begin
  if ACBrGAV1.Modelo <> gavImpressoraECF then
  begin
     Try
        ACBrGAV1.Porta := cbGAVPorta.Text ;
     finally
        cbGAVPorta.Text := ACBrGAV1.Porta ;
     end ;
  end ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.edGAVStrAbreChange(Sender: TObject);
begin
  ACBrGAV1.StrComando := edGAVStrAbre.Text ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.bGAVEstadoClick(Sender: TObject);
begin
  if ACBrGAV1.Ativo then
   begin
     if ACBrGAV1.GavetaAberta then
        lGAVEstado.Caption := 'Aberta'
     else
        lGAVEstado.Caption := 'Fechada' ;
   end
  else
     lGAVEstado.Caption := 'Desconhecido' ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.bGAVAbrirClick(Sender: TObject);
begin
  ACBrGAV1.AbreGaveta ;
end;

{------------------------------------ ACBrDIS ---------------------------------}
procedure TFrmACBrMonitor.cbDISPortaChange(Sender: TObject);
begin
  Try
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
  ACBrDIS1.ExibirLinha(1,'Projeto ACBr'        ,efeDireita_Esquerda) ;
  ACBrDIS1.ExibirLinha(2,'acbr.sourceforge.net',efeEsquerda_Direita) ;
end;

procedure TFrmACBrMonitor.TCPServerExecute(AThread: TIdPeerThread);
begin
  { Le o que foi enviado atravez da conexao TCP }
  mCmd.Lines.Add(trim(Athread.Connection.ReadLn()));
  Processar ;
end;

procedure TFrmACBrMonitor.TCPServerConnect(AThread: TIdPeerThread);
begin
  conexao := AThread;
{  Athread.Connection.WriteLn('ACBr Monitor Ver.'+Versao);
  Athread.Connection.WriteLn('Conectado com sucesso !');
  Athread.Connection.WriteLn('Esperando por comandos.');}
  Resposta('','ACBr Monitor Ver.'+Versao);
  Resposta('','Conectado com sucesso - '+Conexao.Connection.Socket.LocalName);
  Resposta('','Esperando por comandos.');
end;

procedure TFrmACBrMonitor.TCPServerDisconnect(AThread: TIdPeerThread);
begin
  if Assigned( Conexao ) then
     Conexao.Connection.Disconnect;
  mCmd.Lines.Clear;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.cbCHQModeloChange(Sender: TObject);
begin
  try
     ACBrCHQ1.Modelo := TACBrCHQModelo( cbCHQModelo.ItemIndex ) ;

     if ACBrCHQ1.Modelo = chqImpressoraECF then
        ACBrCHQ1.ECF := ACBrECF1 ;
  finally
     cbCHQModelo.ItemIndex := Integer( ACBrCHQ1.Modelo ) ;
     cbCHQPorta.Text       := ACBrCHQ1.Porta ;
  end ;end ;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.cbGAVModeloChange(Sender: TObject);
begin
  try
     ACBrGAV1.Modelo := TACBrGAVModelo( cbGAVModelo.ItemIndex ) ;

     if ACBrGAV1.Modelo = gavImpressoraECF then
        ACBrGAV1.ECF := ACBrECF1 ;
  finally
     cbGAVModelo.ItemIndex := Integer( ACBrGAV1.Modelo ) ;
     cbGAVPorta.Text       := ACBrGAV1.Porta ;
  end ;
end;

{------------------------------------------------------------------------------}
procedure TFrmACBrMonitor.cbDISModeloChange(Sender: TObject);
begin
  try
     ACBrDIS1.Modelo := TACBrDISModelo( cbDISModelo.ItemIndex ) ;
  finally
     cbDISModelo.ItemIndex := Integer( ACBrDIS1.Modelo ) ;
     cbDISPorta.Text       := ACBrDIS1.Porta ;
  end ;
end;

end.


