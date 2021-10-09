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
|* C�digo original por Valdir Stiebe Junior - valdir@dype.com.br - outubro/2007
|*
|* 03/04/2008: Jhony Alceu Pereira (JhonyStein)
|*  - Ao fechar a janela as vezes ela continuava na mem�ria
*******************************************************************************}
{$I ACBr.inc}
unit frm_TimedMessage;

interface

uses
  {$IFDEF MSWINDOWS}
  Windows,
  {$ENDIF}
  {$IFDEF FPC}
  LResources,
  {$ENDIF}
  Messages, SysUtils,
  Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls ;

type
  TfrmTimedMessage = class(TForm)
    Timer: TTimer;
    btnOK: TButton;
    lblMessage: TLabel;
    procedure TimerTimer(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    Freeing: Boolean;
    FTimeout: Integer;
    FStartTime: TDateTime;
    procedure DoFree;
  public
    constructor Create(AOwner: TComponent); override;
    class procedure ShowMessage(AMessage: string; ATimeInSeconds: Integer = 0; ACaption: string = '');
    property StartTime: TDateTime read FStartTime write FStartTime;
    property Timeout: Integer read FTimeout write FTimeout;
  end;

implementation

Uses {$IFDEF COMPILER6_UP}
       DateUtils 
     {$ELSE}
       ACBrD5
     {$ENDIF} ;

{$IFNDEF FPC}
{$R *.dfm}
{$ENDIF}

{ TfrmTimedMessage }

constructor TfrmTimedMessage.Create(AOwner: TComponent);
begin
  //PopupParent := Application.MainForm;
  inherited;
  Freeing := False;
  Timer.Enabled := False;
  Timer.Interval := 500; // meio segundo, hardcoded mesmo, est� mais do que bom
end;

class procedure TfrmTimedMessage.ShowMessage(AMessage: string;
  ATimeInSeconds: Integer; ACaption: string);
begin
   with Self.Create(nil) do
   begin
      FTimeout := ATimeInSeconds;
      
      if Trim(ACaption) = '' then
         Caption := Application.Title
      else
         Caption := ACaption;

      lblMessage.Caption := AMessage;
      StartTime := Now;

      if ATimeInSeconds = 0 then
         ShowModal
      else
      begin
         btnOK.Visible := False;
         Show;
      end;

      if not Freeing then
      begin
         Application.ProcessMessages;
         BringToFront;
         if FTimeout > 0 then
            Timer.Enabled := True;
      end;
   end;
end;

procedure TfrmTimedMessage.TimerTimer(Sender: TObject);
begin
  Application.ProcessMessages;
  Caption := Format('Aten��o - %d s', [Timeout - SecondsBetween(StartTime, Now)]);
  if SecondsBetween(StartTime, Now) >= Timeout then
    DoFree;
end;

procedure TfrmTimedMessage.btnOKClick(Sender: TObject);
begin
  Timer.Enabled := False;
  DoFree;
end;

procedure TfrmTimedMessage.DoFree;
begin
  if not Freeing then
  begin
    Freeing := True;
    ModalResult := mrOk;
    Timer.Enabled := False;
    btnOK.Enabled := False;
    Self.Hide;
    Self.Close;
  end;
end;

procedure TfrmTimedMessage.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmTimedMessage.FormShow(Sender: TObject);
begin
   Application.BringToFront;
end;

{$IFDEF FPC}
initialization
  {$I frm_timedmessage.lrs}
{$ENDIF}

end.

