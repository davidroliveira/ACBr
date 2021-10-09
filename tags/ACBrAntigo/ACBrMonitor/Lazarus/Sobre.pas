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
unit Sobre;

{$mode objfpc}{$H+}

interface

uses
  LResources, LCLType, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type

  { TfrmSobre }

  TfrmSobre = class(TForm)
     Image1: TImage ;
    Timer1: TTimer;
    lVersao: TLabel;
    lDesenvolvedores: TLabel;
    lACBr: TLabel;
    BitBtn1: TBitBtn;
    lNome: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    lColaboradores: TLabel;
    bAjuda: TBitBtn;
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure lACBrClick(Sender: TObject);
    procedure lDesenvolvedoresClick(Sender: TObject);
    procedure bAjudaClick(Sender: TObject);
    procedure FormShortCut(Key: Integer; Shift: TShiftState;
      var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation
Uses ACBrUtil ;

procedure TfrmSobre.FormCreate(Sender: TObject);
begin
  ClientHeight := 218 ;
end;

procedure TfrmSobre.Timer1Timer(Sender: TObject);
Var I : Integer ;
begin
  Update ;
  For I := 0 to ControlCount -1 do
  begin
     if Controls[I] is TLabel then
     begin
        with Controls[I] as TLabel do
        begin
           Top := Top - 1 ;

           if Top <= -20 then
              Top := Parent.Height + 1
        end ;
     end ;
  end ;

  Application.ProcessMessages ;
end;

procedure TfrmSobre.BitBtn1Click(Sender: TObject);
begin
  Timer1.Enabled := false ;
  close ;
end;

procedure TfrmSobre.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Timer1.Enabled := false ;
  CanClose       := true ;
end;

procedure TfrmSobre.lACBrClick(Sender: TObject);
begin
  OpenURL( 'http://acbr.sf.net' );
end;

procedure TfrmSobre.lDesenvolvedoresClick(Sender: TObject);
begin
  OpenURL('www.djsystem.com.br');
end;

procedure TfrmSobre.bAjudaClick(Sender: TObject);
begin
  OpenURL('file:///'+ExtractFilePath(Application.ExeName)+'ManualACBrMonitor.html');
end;

procedure TfrmSobre.FormShortCut(Key: Integer; Shift: TShiftState;
  var Handled: Boolean);
begin
  if (Key = VK_HELP) or (Key = VK_F1) then
     bAjuda.Click ;
end;

initialization
  {$I Sobre.lrs}

end.
