{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para interação com equipa- }
{ mentos de Automação Comercial utilizados no Brasil                           }

{ Direitos Autorais Reservados (c) 2018 Daniel Simoes de Almeida               }

{ Colaboradores nesse arquivo: Italo Jurisato Junior                           }

{  Você pode obter a última versão desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }

{  Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }

{  Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU      }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)              }

{  Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto}
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,  }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Você também pode obter uma copia da licença em:                              }
{ http://www.opensource.org/licenses/gpl-license.php                           }

{ Daniel Simões de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{        Rua Cel.Aureliano de Camargo, 973 - Tatuí - SP - 18270-170            }

{******************************************************************************}

unit ACBrLibMailDataModule;

{$mode delphi}

interface

uses
  Classes, SysUtils, FileUtil, ACBrLibConfig, syncobjs, ACBrMail;

type

  { TLibMailDM }

  TLibMailDM = class(TDataModule)
    ACBrMail1: TACBrMail;

    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FLock: TCriticalSection;

  public
    procedure AplicarConfiguracoes;
    procedure GravarLog(AMsg: String; NivelLog: TNivelLog; Traduzir: Boolean = False);
    procedure Travar;
    procedure Destravar;
  end;

implementation

uses
  ACBrUtil,
  ACBrLibMailConfig, ACBrLibComum, ACBrLibMailClass;

{$R *.lfm}

{ TLibMailDM }

procedure TLibMailDM.DataModuleCreate(Sender: TObject);
begin
  FLock := TCriticalSection.Create;
end;

procedure TLibMailDM.DataModuleDestroy(Sender: TObject);
begin
  FLock.Destroy;
end;

procedure TLibMailDM.AplicarConfiguracoes;
var
  pLibConfig: TLibMailConfig;
begin
  pLibConfig := TLibMailConfig(TACBrLibMail(pLib).Config);

  with ACBrMail1 do
  begin
    Attempts := pLibConfig.Email.Tentativas;
    SetTLS := pLibConfig.Email.TLS;
    DefaultCharset := pLibConfig.Email.Codificacao;
    From := pLibConfig.Email.Conta;
    FromName := pLibConfig.Email.Nome;
    SetSSL := pLibConfig.Email.SSL;
    Host := pLibConfig.Email.Servidor;
    IDECharset := pLibConfig.Email.Codificacao;
    IsHTML := pLibConfig.Email.IsHTML;
    Password := pLibConfig.Email.Senha;
    Port := IntToStr(pLibConfig.Email.Porta);
    Priority := pLibConfig.Email.Priority;
    ReadingConfirmation := pLibConfig.Email.Confirmacao;
    DeliveryConfirmation := pLibConfig.Email.ConfirmacaoEntrega;
    TimeOut := pLibConfig.Email.TimeOut;
    Username := pLibConfig.Email.Usuario;
    UseThread := pLibConfig.Email.SegundoPlano;
  end;
end;

procedure TLibMailDM.GravarLog(AMsg: String; NivelLog: TNivelLog;
  Traduzir: Boolean);
begin
  if Assigned(pLib) then
    pLib.GravarLog(AMsg, NivelLog, Traduzir);
end;

procedure TLibMailDM.Travar;
begin
  GravarLog('Travar', logParanoico);
  FLock.Acquire;
end;

procedure TLibMailDM.Destravar;
begin
  GravarLog('Destravar', logParanoico);
  FLock.Release;
end;

end.

