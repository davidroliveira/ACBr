{******************************************************************************}
{ Projeto: ACBr Monitor                                                        }
{  Executavel multiplataforma que faz uso do conjunto de componentes ACBr para }
{ criar uma interface de comunicação com equipamentos de automacao comercial.  }
{                                                                              }
{ Direitos Autorais Reservados (c) 2006 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
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
program ACBrMonitorConsole;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Classes,
  IniFiles,
  ACBrBase,
  ACBrECF,
  ACBrECFNaoFiscal,
  IdStack,
  UtilUnit,
  ACBrMonitorConsoleDM in 'ACBrMonitorConsoleDM.pas' {dm: TDataModule};

Var I : Integer;
    ArqINI : String ;
    Ini    : TIniFile ;

begin
  { ---------------- Inicializando as variaveis ---------------- }
  TRY
    dm := Tdm.Create(nil);

    writeln('Bem vindo ao ACBrMonitorConsole '+Versao+' - ACBr: '+ACBR_VERSAO ) ;
    writeln('') ;

    try
       { Lendo o arquivo INI. Se houver erro, dispara exception }
       dm.LerIni ;

       { Ajustando o tamanho do arquivo de LOG }
       try
          dm.AjustaLinhasLog ;
       except
          on E : Exception do
             WriteLn( E.Message ) ;
       end ;

       { Ativando comunicacao TCP/IP } 
       dm.TcpServer.Active := dm.IsTCP ;
       WriteLn('ACBr Monitor Ver.'+Versao);
       WriteLn('Aguardando comandos ACBr');

       { Exibindo estado atual e finalizando a inicializacao }
       try
          if dm.IsTCP then
           begin
             if dm.TcpServer.Active then
             begin
                try
                   WriteLn( 'Endereço: '+dm.TcpServer.LocalName ) ;
                   For I := 0 to IdStack.GStack.LocalAddresses.Count-1 do
                      WriteLn( IdStack.GStack.LocalAddresses[I] ) ;
                except
                end ;
                WriteLn( 'Porta: ['+IntToStr(dm.TcpServer.DefaultPort)+']') ;
             end ;
           end
          else
           begin
             WriteLn( 'Monitorando TXT em: '+dm.ArqEntTXT);
             WriteLn( 'Respostas gravadas em:'+dm.ArqSaiTXT);
           end ;

          if dm.GravarLog then
             WriteLn( 'Log de comandos será gravado em: '+dm.ArqLogTXT) ;

          { Se for NAO fiscal, desliga o AVISO antes de ativar }
          if dm.ACBrECF1.Modelo = ecfNaoFiscal then
          begin
             ArqIni := (dm.ACBrECF1.ECF as TACBrECFNaoFiscal).NomeArqINI ;
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
             WriteLn( E.Message ) ;
       end ;

       { Loop INFINTO, esperando arquivo TXT }
       repeat
          if FileExists( dm.ArqEntTXT ) then  { Existe arquivo para ler ? }
          begin
             try
               dm.ComandosAProcessar.LoadFromFile( dm.ArqEntTXT );
               DeleteFile( dm.ArqEntTXT );
             except
               { Ignora Exceçoes na Tentativa de Leitura o Deleçao }
             end ;

             dm.Processar ;
          end;

          Sleep( dm.Intervalo ) ;
          
       until False ;

    finally
       dm.ACBrECF1.Desativar ;
       dm.ACBrCHQ1.Desativar ;
       dm.ACBrGAV1.Desativar ;
       dm.ACBrDIS1.Desativar ;
       dm.ACBrLCB1.Desativar ;

       dm.TcpServer.OnDisconnect := nil ;
       dm.TCPServer.Active       := False ;    { Desliga TCP }

       dm.Free ;
    end ;
  EXCEPT
    On E : Exception do
    begin
       if dm.GravarLog then
          GravaArqResp(dm.ArqLogTXT, 'Exception: ' + E.Message);
          
       raise ;
    end ;
  END ;

end.

