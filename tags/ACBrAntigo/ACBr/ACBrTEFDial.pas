{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2007   Maicon da Silva Evangeslista         }
{                                                                              }
{ Colaboradores nesse arquivo:            Daniel Sim�es de Almeida             }
{                                                                              }
{   C�digo original por Valdir Stiebe Junior-valdir@dype.com.br-outubro/2006   }
{   Componente finalizado por Maicon da Silva Evangeslista-maiconsi@hotmail.com}
{  em julho/2007...                                                            }
{                                                                              }
{                                                                              }
{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{  Esta biblioteca � software livre; voc� pode redistribu�-la e/ou modific�-la }
{ sob os termos da Licen�a P�blica Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a vers�o 2.1 da Licen�a, ou (a seu crit�rio) }
{ qualquer vers�o posterior.                                                   }
{                                                                              }
{  Esta biblioteca � distribu�da na expectativa de que seja �til, por�m, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia impl�cita de COMERCIABILIDADE OU      }
{ ADEQUA��O A UMA FINALIDADE ESPEC�FICA. Consulte a Licen�a P�blica Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICEN�A.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral Menor do GNU junto}
{ com esta biblioteca; se n�o, escreva para a Free Software Foundation, Inc.,  }
{ no endere�o 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Voc� tamb�m pode obter uma copia da licen�a em:                              }
{ http://www.opensource.org/licenses/gpl-license.php                           }
{                                                                              }
{ Maicon da Silva Evangelista  -  maiconsi@hotmail.com                         }
{              Rua Marechal Rondon, 866 - Luc�lia - SP - 17780-000             }
{                                                                              }
{******************************************************************************}

{******************************************************************************
|* Historico
|*
|* 20/07/2007: Maicon da Silva Evangelista
|*  - Inicio do desenvolvimento
|* 03/04/2008: Jhony Alceu Pereira (JhonyStein)
|*  - Inclusao do valor da propriedade RespTempDataFileName
|* 17/04/2008: Jhony Alceu Pereira (JhonyStein)
|*  - Correcao nas declaracoes ciclicas dos uses
|* 03/07/2008: Maicon da Silva Evangelista
|*  - Alterado a pasta de destino do arquivo de backup "fpRespTempDataFileName"
|*    pois como � um backup deve ficar em uma pasta diferente da "Resp"
|*  - Criado o Looping para ativa��o do GP, mas com o modulo da redecard ainda
|*    esta apresentando um erro de "solicita��o (10)"
*******************************************************************************}

{$I ACBr.inc}
unit ACBrTEFDial;

interface
uses ACBrTEFClass, ACBrUtil, Classes, SysUtils
     {$IFDEF COMPILER6_UP}
       ,DateUtils, StrUtils
     {$ELSE}
       ,ACBrD5, FileCtrl
     {$ENDIF}
     {$IFDEF VisualCLX}
       ,Qt, QControls, QForms, QGraphics, QDialogs, QExtCtrls
     {$ELSE}
       ,Contnrs, Controls, Forms, Graphics, Dialogs, ExtCtrls, Windows
     {$ENDIF} ;

type TACBrTEFDial = class( TACBrTEFClass )
   public
      constructor Create(AOwner: TComponent) ; 
      procedure Ativar ; Override;

end ;

implementation

uses ACBrTEF;

{ TACBrTEFDial }
constructor TACBrTEFDial.Create(AOwner: TComponent);
begin
   fpTipoStr             := 'TEF Dial' ;
   fpBaseDir             := 'C:\TEF_DIAL\';
   fpReqTempFileName     := BaseDir + 'REQ\IntPos.tmp';
   fpReqFileName         := BaseDir + 'REQ\IntPos.001';
   fpRespFileName        := BaseDir + 'RESP\IntPos.Sts';
   fpRespDataFileName    := BaseDir + 'RESP\IntPos.001';
   fpRespTempDataFileName:= 'C:\ACBrTEFResp.tmp';

   inherited Create( AOwner );
end;

procedure TACBrTEFDial.Ativar;
begin
   if not DirectoryExists(ExtractFilePath(RespTempDataFileName)) then
      ForceDirectories(ExtractFilePath(RespTempDataFileName));

   if (not GPAtivo) then
   begin
      If fpAtivarGP then
      begin
         If MessageDlg(RS_INACTIVETEF + #10#13 + 'Posso tentar ativar o GP agora ?', mtConfirmation, mbOKCancel, 0) = 1 then
         begin
            RunCommand(fpBaseDir+'tef_dial.exe', '', False, 0);
            Ativar;
         end;
      end
      else
         raise Exception.Create(ACBrStr(RS_INACTIVETEF));
   end;
   VerificaTransacaoPendente;
   fpAtivo := True;
end;

end.
