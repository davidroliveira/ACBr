{******************************************************************************}
{ Projeto: ACBr Monitor                                                        }
{  Executavel multiplataforma que faz uso do conjunto de componentes ACBr para }
{ criar uma interface de comunica��o com equipamentos de automacao comercial.  }
{                                                                              }
{ Direitos Autorais Reservados (c) 2006 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Voc� pode obter a �ltima vers�o desse arquivo na p�gina do Projeto ACBr     }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{  Este programa � software livre; voc� pode redistribu�-lo e/ou modific�-lo   }
{ sob os termos da Licen�a P�blica Geral GNU, conforme publicada pela Free     }
{ Software Foundation; tanto a vers�o 2 da Licen�a como (a seu crit�rio)       }
{ qualquer vers�o mais nova.                                                   }
{                                                                              }
{  Este programa � distribu�do na expectativa de ser �til, mas SEM NENHUMA     }
{ GARANTIA; nem mesmo a garantia impl�cita de COMERCIALIZA��O OU DE ADEQUA��O A}
{ QUALQUER PROP�SITO EM PARTICULAR. Consulte a Licen�a P�blica Geral GNU para  }
{ obter mais detalhes. (Arquivo LICENCA.TXT ou LICENSE.TXT)                    }
{                                                                              }
{  Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral GNU junto com este}
{ programa; se n�o, escreva para a Free Software Foundation, Inc., 59 Temple   }
{ Place, Suite 330, Boston, MA 02111-1307, USA. Voc� tamb�m pode obter uma     }
{ copia da licen�a em:  http://www.opensource.org/licenses/gpl-license.php     }
{                                                                              }
{ Daniel Sim�es de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Pra�a Anita Costa, 34 - Tatu� - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}
unit ACBrMonitorConsoleDM;

interface

uses
  SysUtils, IdBaseComponent, IdComponent, IdTCPServer, Classes,
  ACBrLCB, ACBrDIS, ACBrGAV, ACBrGAVClass, ACBrBase, ACBrCHQ, ACBrECF,
  CmdUnit ;

const
   Versao = '0.1a' ;

type
  Tdm = class(TDataModule)
    TcpServer: TIdTCPServer;
    ACBrCHQ1: TACBrCHQ;
    ACBrGAV1: TACBrGAV;
    ACBrDIS1: TACBrDIS;
    ACBrLCB1: TACBrLCB;
    procedure TcpServerConnect(AThread: TIdPeerThread);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure TcpServerDisconnect(AThread: TIdPeerThread);
    procedure TcpServerExecute(AThread: TIdPeerThread);
  private
    fsDisWorking: Boolean;
    fsOldIntervaloLCB:Integer ;
    
    procedure SetDisWorking(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Conexao  : TIdPeerThread ;
    ACBrECF1 : TACBrECF ;
    Cmd : TACBrCmd ;
    ComandosAProcessar : TStringList ;
    ArqSaiTXT, ArqSaiTMP, ArqEntTXT, ArqLogTXT : String ;
    Intervalo, LinhasLog : Integer ;
    PermiteComandos, VerificaCheque, GravarLog, IsTCP, IsTXT : Boolean ;
    SufixoAAnexar : String ;

    property DISWorking : Boolean read fsDisWorking write SetDisWorking ;

    procedure LerIni;
    procedure CriarIniDefault;
    procedure AjustaLinhasLog;
    procedure Processar;
    procedure Resposta(Comando, Resposta: string);

    procedure ACBrECF1MsgPoucoPapel(Sender: TObject);
  end;

var
  dm: Tdm;

implementation
Uses IniFiles, UtilUnit,
     DoACBrUnit, DoECFUnit, DoGAVUnit, DoCHQUnit, DoDISUnit, DoLCBUnit ;

{$R *.xfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  { Cria o ECF manualmente para n�o causar erros nas propriedades CONSOLE }
  ACBrECF1  := TACBrECF.Create(Self);
  Cmd       := TACBrCmd.Create ;
  ComandosAProcessar := TStringList.Create ;

  ArqSaiTXT := '' ;
  ArqSaiTMP := '' ;
  ArqEntTXT := '' ;
  ArqLogTXT := '' ;
  Conexao   := nil ;
  fsOldIntervaloLCB:=0 ;
  DISWorking:= false ;
end;

procedure Tdm.DataModuleDestroy(Sender: TObject);
begin
  ACBrECF1.Free ;
  Cmd.Free ;
  ComandosAProcessar.Free ;
end;


procedure Tdm.TcpServerConnect(AThread: TIdPeerThread);
begin
  sleep(100);
  Conexao := AThread;
  Resposta('','ACBrMonitorConsole Ver. '+ Versao + ' - ACBr: '+ACBR_VERSAO +sLineBreak +
              'Conectado em: '+FormatDateTime('dd/mm/yy hh:nn:ss', now )+sLineBreak+
              'M�quina: '+AThread.Connection.Socket.Binding.PeerIP+sLineBreak+
              'Esperando por comandos.');
end;

procedure Tdm.TcpServerDisconnect(AThread: TIdPeerThread);
begin
  WriteLn('ALERTA: Fim da Conex�o com: '+
          AThread.Connection.Socket.Binding.PeerIP+
          ' em: '+FormatDateTime('dd/mm/yy hh:nn:ss', now ) )
end;

procedure Tdm.TcpServerExecute(AThread: TIdPeerThread);
Var Cmd : String ;
begin
  { Le o que foi enviado atravez da conexao TCP }
  Cmd := trim(AThread.Connection.ReadLn()) ;
  if Cmd <> '' then
  begin
     Conexao := AThread ;
     ComandosAProcessar.Text := Cmd  ;
     
     { precisa do Synchronize, pois "Processar" atualiza controles visuais }
//     AThread.Synchronize( Processar );
     Processar ;
  end ;
end;

procedure Tdm.ACBrECF1MsgPoucoPapel(Sender: TObject);
begin
  Writeln( 'ATEN�AO. Pouco papel' ) ;
end;

procedure Tdm.AjustaLinhasLog ;
Var LogNew, LogOld : TStringList ;
    I : Integer ;
begin
  if (LinhasLog <= 0) or (not GravarLog) or
     (not FileExists( ArqLogTXT )) then
     exit ;

  LogOld := TStringList.Create ;
  try
     LogOld.LoadFromFile( ArqLogTXT );
     if LogOld.Count > LinhasLog then
     begin
        WriteLn('Ajustando o tamanho do arquivo: '+ArqLogTXT) ;
        WriteLn('Numero de Linhas atual: '+IntToStr(LogOld.Count) ) ;
        WriteLn('Reduzindo para: '+IntToStr(LinhasLog)+ ' linhas' );

        { Se for muito grande � mais r�pido copiar para outra lista do que Deletar }
        if (LogOld.Count - LinhasLog) > LinhasLog then
         begin
           LogNew := TStringList.Create ;
           try
              LogNew.Clear ;

              For I := LinhasLog downto 1 do
                 LogNew.Add(LogOld[ LogOld.Count - I ] ) ;

              LogNew.SaveToFile( ArqLogTXT );
           finally
              LogNew.Free ;
           end ;
         end
        else
         begin
           { Existe alguma maneira mais r�pida de fazer isso ??? }
           LogOld.BeginUpdate ;
           while LogOld.Count > LinhasLog do
              LogOld.Delete(0) ;
           LogOld.EndUpdate ;
           LogOld.SaveToFile( ArqLogTXT );
         end ;
     end ;
  finally
     LogOld.Free ;
  end ;
end ;

procedure Tdm.LerIni ;
Var ACBrMonitorINI : string;
    Ini : TIniFile ;
begin
  { ---------------- Inicializando o ACBrMonitorConsole ---------------- }
  ACBrMonitorINI := ExtractFilePath( ParamStr(0) )+ 'ACBrMonitor.ini';

  if not FileExists( ACBrMonitorINI ) then
     CriarIniDefault ;

  { ---------------- Lendo o arquivo INI ---------------- }
  Ini := TIniFile.Create( ACBrMonitorINI ) ;
  try
     IsTCP := Ini.ReadBool('ACBrMonitor','Modo_TCP',false);
     IsTXT := not IsTCP ;

    with dm.TcpServer do
    begin
       DefaultPort    := Ini.ReadInteger('ACBrMonitor','TCP_Porta',3434);
       MaxConnections := Ini.ReadInteger('ACBrMonitor','Conexoes_Simultaneas',1);
       MaxConnectionReply.Text.Add( 'Pedido de conex�o negado.') ;
       MaxConnectionReply.Text.Add( 'N�mero m�ximo de conex�es ('+IntToStr(MaxConnections)+') j� atingido' ) ;
    end ;

    ArqEntTXT := AcertaPath( Ini.ReadString('ACBrMonitor','TXT_Entrada','ENT.TXT') ) ;
    ArqSaiTXT := AcertaPath( Ini.ReadString('ACBrMonitor','TXT_Saida','SAI.TXT') ) ;
    ArqSaiTMP := ChangeFileExt( ArqSaiTXT, '.tmp' ) ;
    ArqLogTXT := AcertaPath( Ini.ReadString('ACBrMonitor','Arquivo_Log','LOG.TXT') ) ;

    Intervalo := Ini.ReadInteger('ACBrMonitor','Intervalo',50);

    GravarLog := Ini.ReadBool('ACBrMonitor','Gravar_Log',false) and ( ArqLogTXT <> '' ) ;
    LinhasLog := Ini.ReadInteger('ACBrMonitor','Linhas_Log',0);

    PermiteComandos := Ini.ReadBool('ACBrMonitor','Comandos_Remotos',false);

    with ACBrECF1 do
    begin
       Desativar ;
       Modelo               := TACBrECFModelo( Ini.ReadInteger('ECF','Modelo',0) ) ;
       Porta                := Ini.ReadString('ECF','Porta','Procurar');
       TimeOut              := Ini.ReadInteger('ECF','Timeout',3);
       ArredondaPorQtd      := Ini.ReadBool('ECF','ArredondamentoPorQtd',false);
       DescricaoGrande      := Ini.ReadBool('ECF','DescricaoGrande',True);
       GavetaSinalInvertido := Ini.ReadBool('ECF','GavetaSinalInvertido',false);
       BloqueiaMouseTeclado := False ;
       ExibeMensagem        := False ;
       ReTentar             := False ;
       OnMsgPoucoPapel      := ACBrECF1MsgPoucoPapel ;
    end ;

    with ACBrCHQ1 do
    begin
       Desativar ;
       Modelo  := TACBrCHQModelo( Ini.ReadInteger('CHQ','Modelo',0) ) ;
       Porta   := Ini.ReadString('CHQ','Porta','');
       Favorecido := Ini.ReadString('CHQ','Favorecido','');
       Cidade     := Ini.ReadString('CHQ','Cidade','');
       VerificaCheque := Ini.ReadBool('CHQ','VerificaFormulario',false);
       if Ini.ReadString('CHQ','PathBemafiINI','') <> '' then
       begin
          try
             ArquivoBemaFiINI := Ini.ReadString('CHQ','PathBemafiINI','');
             WriteLn( 'Arquivo de Cheques: '+ArquivoBemaFiINI + ' lido com sucesso.') ;
          except
             on E : Exception do
                WriteLn( E.Message );
          end ;
       end ;
    end ;

    with ACBrGAV1 do
    begin
       Desativar ;
       StrComando         := Ini.ReadString('GAV','StringAbertura','');
       AberturaIntervalo  := Ini.ReadInteger('GAV','AberturaIntervalo',
          AberturaIntervalo);
       AberturaAntecipada := TACBrGAVAberturaAntecipada(
          Ini.ReadInteger('GAV','AcaoAberturaAntecipada',1) ) ;
       Modelo     := TACBrGAVModelo( Ini.ReadInteger('GAV','Modelo',0) ) ;
       Porta      := Ini.ReadString('GAV','Porta','');
       Ativo      := (pos('serial',LowerCase(ModeloStr)) > 0) ;
    end ;

    with ACBrDIS1 do
    begin
       Desativar ;
       Intervalo := Ini.ReadInteger('DIS','Intervalo',300) ;
       Passos    := Ini.ReadInteger('DIS','Passos',1) ;
       Modelo    := TACBrDISModelo( Ini.ReadInteger('DIS','Modelo',0) ) ;
       Porta     := Ini.ReadString('DIS','Porta','');
    end ;

    with ACBrLCB1 do
    begin
       Desativar ;
       Porta           := Ini.ReadString('LCB','Porta','Sem Leitor');
       Intervalo       := Ini.ReadInteger('LCB','Intervalo',100);
       fsOldIntervaloLCB:=Intervalo ;
       Sufixo          := Ini.ReadString('LCB','SufixoLeitor','#13');
       ExcluirSufixo   := Ini.ReadBool('LCB','ExcluirSufixo',false) ;
       PrefixoAExcluir := Ini.ReadString('LCB','PrefixoAExcluir','');
       UsarFila        := not Ini.ReadBool('LCB','Teclado',True) ;
       SufixoAAnexar   := Ini.ReadString('LCB','SufixoIncluir','') ;
       Device.ParamsString:= Ini.ReadString('LCB','Device','') ;

       if (Porta <> 'Sem Leitor') and (Porta <> '') then
          Ativar ;
    end ;
 finally
    Ini.Free ;
 end ;
end ;

Procedure Tdm.Processar ;
var
  Linha : string;
begin
  while ComandosAProcessar.Count > 0 do
  begin
     Linha := Trim( ComandosAProcessar[0] );
     ComandosAProcessar.Delete(0);

     if Linha <> '' then
     begin
        WriteLn( 'Processando: '+Linha ) ;

        try
           if pos('.',Linha) = 0 then              { Comandos do ACBrMonitor }
              Linha := 'ACBR.'+Linha ;

           Cmd.Comando := Linha ;

           if Cmd.Objeto = 'ECF' then
              DoECF( Cmd )
           else if Cmd.Objeto = 'ACBR' then
              DoACBr( Cmd )
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
     end ;
  end ;
end ;

Procedure Tdm.Resposta(Comando, Resposta : string);
begin
  if IsTCP then
  begin
     if Assigned( dm.Conexao ) then
     begin
        if Assigned( dm.Conexao.Connection ) then
        begin
           dm.Conexao.Connection.WriteLn(Resposta) ;
           dm.Conexao.Connection.Write(#3) ;
        end;
     end ;
  end ;

  if IsTXT then
  begin
     { Primeiro salva em Tempor�rio para que a grava��o de todos os Bytes ocorra
       antes que a aplica��o controladora do ACBrMonitor tente ler o arquivo de
       Resposta incompleto }
     DeleteFile( ArqSaiTMP ) ;

     if FileExists(ArqSaiTXT) then
        RenameFile(ArqSaiTXT, ArqSaiTMP) ; { GravaArqResp faz append se arq. existir }

     GravaArqResp(ArqSaiTMP, Resposta);
     RenameFile(ArqSaiTMP, ArqSaiTXT) ;
  end ;


  WriteLn( Comando + sLineBreak + Resposta ) ;

  if GravarLog then
     GravaArqResp(ArqLogTXT, Comando + sLineBreak + Resposta);
end ;


procedure Tdm.CriarIniDefault;
Var Memo : TStringList ;
begin

  Memo := TStringList.Create ;
  try
     Memo.Clear ;

     Memo.Add('******************************************************************************'+sLineBreak+
              '* Projeto: ACBr Monitor Console                                              *'+sLineBreak+
              '*                                                                            *'+sLineBreak+
              '* Direitos Autorais Reservados (c) 2006 Daniel Simoes de Almeida             *'+sLineBreak+
              '*                                                                            *'+sLineBreak+
              '*  Voc� pode obter a �ltima vers�o desse arquivo na p�gina do Projeto ACBr   *'+sLineBreak+
              '* Componentes localizado em      http://www.sourceforge.net/projects/acbr    *'+sLineBreak+
              '*                                                                            *'+sLineBreak+
              '* Daniel Sim�es de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br*'+sLineBreak+
              '*              Pra�a Anita Costa, 34 - Tatu� - SP - 18270-410                *'+sLineBreak+
              '******************************************************************************'+sLineBreak+sLineBreak );

     Memo.Add('******************************************************************************'+sLineBreak+
              '*   Para maiores expli�oes sobre esse arquivo execute o programa ACBrMonitor *'+sLineBreak+
              '* e clique em CONFIGURAR                                                     *'+sLineBreak+
              '*                                                                            *'+sLineBreak+
              '* Valores Boleanos use: 0 = False, 1 = True                                  *'+sLineBreak+
              '*                                                                            *'+sLineBreak+
              '* Modelos de ECF:                                                            *'+sLineBreak+
              '*   0 = ecfNenhum,    1 = ecfNaoFiscal, 2 = ecfBematech, 3 = ecfSweda,       *'+sLineBreak+
              '*   4 = ecfDaruma,    5 = ecfSchalter,  6 = ecfMecaf,    7 = ecfYanco,       *'+sLineBreak+
              '*   8 = ecfDataRegis, 9 = ecfUrano,     10=ecfICash,     11=ecfQuattro,      *'+sLineBreak+
              '*   12= ecfFiscNET                                                           *'+sLineBreak+
              '*                                                                            *'+sLineBreak+
              '* Modelos de CHQ                                                             *'+sLineBreak+
              '*   0 = chqNenhuma,   1 = chqImpressoraECF,  2 = chqImpressoraComum,         *'+sLineBreak+
              '*   3 = chqBematech,  4 = chqChronos,        5 = chqSchalter,                *'+sLineBreak+
              '*   6 = chqPerto,     7 = chqSotomaq,        8 = chqUrano                    *'+sLineBreak+
              '*                                                                            *'+sLineBreak+
              '* Modelos de GAV                                                             *'+sLineBreak+
              '*   0 = gavNenhuma,       1 = gavSerialMenno,    2 = gavSerialGerbo,         *'+sLineBreak+
              '*   3 = gavImpressoraECF, 4 = gavImpressoraComum                             *'+sLineBreak+
              '*                                                                            *'+sLineBreak+
              '*   AberturaAntecipada = ( 0 = aaIgnorar , 1 = aaException, 2 = aaAguardar ) *'+sLineBreak+
              '*                                                                            *'+sLineBreak+
              '* Modelos de DIS                                                             *'+sLineBreak+
              '*   0 = disNenhum,        1 = disGertecSerial,   2 = disGertecTeclado,       *'+sLineBreak+
              '*   3 = disKeytecTeclado                                                     *'+sLineBreak+
              '*                                                                            *'+sLineBreak+
              '*                                                                            *'+sLineBreak+
              '******************************************************************************'+sLineBreak+sLineBreak ) ;

     Memo.Add('[ACBrMonitor]'+sLineBreak+
              'Modo_TCP=1'+sLineBreak+
              'Modo_TXT=0'+sLineBreak+
              'TCP_Porta=3434'+sLineBreak+
              'Conexoes_Simultaneas=1'+sLineBreak+
              'TXT_Entrada=ENT.TXT'+sLineBreak+
              'TXT_Saida=SAI.TXT'+sLineBreak+
              'Intervalo=10'+sLineBreak+
              'Protegido=0'+sLineBreak+
              'Senha='+sLineBreak+
              'Gravar_Log=1'+sLineBreak+
              'Arquivo_Log=LOG.TXT'+sLineBreak+
              'Linhas_Log=50000'+sLineBreak+
              'Comandos_Remotos=0'+sLineBreak+sLineBreak ) ;

     Memo.Add('[ECF]'+sLineBreak+
              'Modelo=0'+sLineBreak+
              'Porta=COM1'+sLineBreak+
              'Timeout=5'+sLineBreak+
              'ArredondamentoPorQtd=0'+sLineBreak+
              'DescricaoGrande=0'+sLineBreak+
              'GavetaSinalInvertido=0'+sLineBreak+
              'IntervaloAposComando=100'+sLineBreak+sLineBreak ) ;

     Memo.Add('[CHQ]'+sLineBreak+
              'Modelo=0'+sLineBreak+
              'Porta='+sLineBreak+
              'VerificaFormulario=0'+sLineBreak+
              'Favorecido=Daniel Simoes de Almeida'+sLineBreak+
              'Cidade=Tatui - SP'+sLineBreak+
              'PathBemafiINI='+sLineBreak+sLineBreak ) ;

     Memo.Add('[GAV]'+sLineBreak+
              'Modelo=0'+sLineBreak+
              'Porta='+sLineBreak+
              'StringAbertura=#027,v,#140 | Bematech'+sLineBreak+
              'AberturaIntervalo=300'+sLineBreak+
              'AcaoAberturaAntecipada=2'+sLineBreak+sLineBreak ) ;

     Memo.Add('[DIS]'+sLineBreak+
              'Modelo=0'+sLineBreak+
              'Porta='+sLineBreak+
              'Intervalo=300'+sLineBreak+
              'Passos=1'+sLineBreak+sLineBreak ) ;
              
     Memo.Add('[LCB]'+sLineBreak+
              'Porta='+sLineBreak+
              'Intervalo=100'+sLineBreak+
              'SufixoLeitor=#13'+sLineBreak+
              'ExcluirSufixo=0'+sLineBreak+
              'PrefixoAExcluir='+sLineBreak+
              'SufixoIncluir='+sLineBreak+
              'Teclado=1'+sLineBreak+
              'Device='+sLineBreak+sLineBreak );

     Memo.SaveToFile(ExtractFilePath( ParamStr(0) )+ 'ACBrMonitor.ini');
  finally
     Memo.Free ;
  end ;

  Raise Exception.Create( 'Arquivo "ACBrMonitor.ini" n�o encontrado.'+sLineBreak+
     'Arquivo "ACBrMonitor.ini" foi criado utilizando valores padr�es'+sLineBreak+
     'Edite o arquivo "ACBrMonitor.ini" ou execute o programa ACBrMonitor'+sLineBreak+
     'para configura-lo corretamente' ) ;
end;

procedure Tdm.SetDisWorking(const Value: Boolean);
begin
  if ACBrLCB1.Ativo then
     if Value then
      begin
        fsOldIntervaloLCB  := ACBrLCB1.Intervalo ;
        ACBrLCB1.Intervalo := 0 ;
      end
     else
        ACBrLCB1.Intervalo := fsOldIntervaloLCB ;

  fsDisWorking := Value;
end;

end.



