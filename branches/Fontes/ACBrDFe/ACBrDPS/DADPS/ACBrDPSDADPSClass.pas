{******************************************************************************}
{ Projeto: Componente ACBrDPS                                                  }
{  Biblioteca multiplataforma de componentes Delphi para emiss�o de Bilhete de }
{ Passagem Eletr�nica - DPS                                                    }
{                                                                              }
{ Direitos Autorais Reservados (c) 2017                                        }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do Projeto ACBr     }
{ Componentes localizado em http://www.sourceforge.net/projects/acbr           }
{                                                                              }
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
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Sim�es de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Pra�a Anita Costa, 34 - Tatu� - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{*******************************************************************************
|* Historico
|*
|* 20/06/2017: Italo Jurisato Junior
|*  - Doa��o do componente para o Projeto ACBr
*******************************************************************************}

{$I ACBr.inc}

unit ACBrDPSDADPSClass;

interface

uses
  SysUtils, Classes, ACBrBase,
  pcnDPS, pcnConversao, ACBrDFeReport;

type

  { TACBrDPSDADPSClass }
   {$IFDEF RTL230_UP}
  [ComponentPlatformsAttribute(pidWin32 or pidWin64)]
  {$ENDIF RTL230_UP}
  TACBrDPSDADPSClass = class( TACBrDFeReport )
  private
    procedure SetDPS(const Value: TComponent);
    procedure ErroAbstract(NomeProcedure: String);

  protected
   function GetSeparadorPathPDF(const aInitialPath: String): String; override;

  protected
    FACBrDPS: TComponent;
    FTipoDADPS: TpcnTipoImpressao;
    FProtocolo: String;
    FCancelada: Boolean;
    FViaConsumidor: Boolean;
    FImprimeNomeFantasia: Boolean;

    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure ImprimirDADPS(DPS: TDPS = nil); virtual;
    procedure ImprimirDADPSCancelado(DPS: TDPS = nil); virtual;
    procedure ImprimirDADPSResumido(DPS: TDPS = nil); virtual;
    procedure ImprimirDADPSPDF(DPS: TDPS = nil); virtual;
    procedure ImprimirDADPSResumidoPDF(DPS: TDPS = nil); virtual;
    procedure ImprimirEVENTO(DPS: TDPS = nil); virtual;
    procedure ImprimirEVENTOPDF(DPS: TDPS = nil); virtual;

  published
    property ACBrDPS: TComponent                     read FACBrDPS                        write SetDPS;
    property TipoDADPS: TpcnTipoImpressao            read FTipoDADPS                      write FTipoDADPS;
    property Protocolo: String                       read FProtocolo                      write FProtocolo;
    property Cancelada: Boolean                      read FCancelada                      write FCancelada;
    property ViaConsumidor: Boolean                  read FViaConsumidor                  write FViaConsumidor;
    property ImprimeNomeFantasia: Boolean            read FImprimeNomeFantasia            write FImprimeNomeFantasia;
  end;

implementation

uses
  ACBrDPS, ACBrUtil;

//DADPS CLASS
constructor TACBrDPSDADPSClass.Create(AOwner: TComponent);
begin
  inherited create( AOwner );

  FACBrDPS    := nil;

  FProtocolo    := '';
  FCancelada := False;
  FViaConsumidor := True;
  FImprimeNomeFantasia := False;
end;

destructor TACBrDPSDADPSClass.Destroy;
begin

  inherited Destroy;
end;

procedure TACBrDPSDADPSClass.ImprimirDADPS(DPS : TDPS = nil);
begin
  ErroAbstract('ImprimirDADPS');
end;

procedure TACBrDPSDADPSClass.ImprimirDADPSCancelado(DPS: TDPS);
begin
  ErroAbstract('ImprimirDADPSCancelado');
end;

procedure TACBrDPSDADPSClass.ImprimirDADPSResumido(DPS : TDPS = nil);
begin
  ErroAbstract('ImprimirDADPSResumido');
end;

procedure TACBrDPSDADPSClass.ImprimirDADPSPDF(DPS : TDPS = nil);
begin
  ErroAbstract('ImprimirDADPSPDF');
end;

procedure TACBrDPSDADPSClass.ImprimirDADPSResumidoPDF(DPS: TDPS);
begin
  ErroAbstract('ImprimirDADPSResumidoPDF');
end;

procedure TACBrDPSDADPSClass.ImprimirEVENTO(DPS: TDPS);
begin
  ErroAbstract('ImprimirEVENTO');
end;

procedure TACBrDPSDADPSClass.ImprimirEVENTOPDF(DPS: TDPS);
begin
  ErroAbstract('ImprimirEVENTOPDF');
end;

procedure TACBrDPSDADPSClass.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);

  if (Operation = opRemove) and (FACBrDPS <> nil) and (AComponent is TACBrDPS) then
    FACBrDPS := nil;
end;

procedure TACBrDPSDADPSClass.SetDPS(const Value: TComponent);
  Var OldValue : TACBrDPS;
begin
  (*
  if Value <> FACBrDPS then
  begin
    if Value <> nil then
      if not (Value is TACBrDPS) then
        raise EACBrDPSException.Create('ACBrDADPS.DPS deve ser do tipo TACBrDPS');

    if Assigned(FACBrDPS) then
      FACBrDPS.RemoveFreeNotification(Self);

    OldValue := TACBrDPS(FACBrDPS);   // Usa outra variavel para evitar Loop Infinito
    FACBrDPS := Value;                 // na remo��o da associa��o dos componentes

    if Assigned(OldValue) then
      if Assigned(OldValue.DADPS) then
        OldValue.DADPS := nil;

    if Value <> nil then
    begin
      Value.FreeNotification(self);
      TACBrDPS(Value).DADPS := self;
    end;

  end;
  *)
end;

procedure TACBrDPSDADPSClass.ErroAbstract(NomeProcedure: String);
begin
  raise EACBrDPSException.Create(NomeProcedure + ' n�o implementado em: ' + ClassName);
end;

function TACBrDPSDADPSClass.GetSeparadorPathPDF(const aInitialPath: String): String;
var
  dhEmissao: TDateTime;
  DescricaoModelo: String;
  ADPS: TDPS;
begin
  Result := aInitialPath;
  (*
  if Assigned(ACBrDPS) then  // Se tem o componente ACBrDPS
  begin
    if TACBrDPS(ACBrDPS).Bilhetes.Count > 0 then  // Se tem algum Bilhete carregado
    begin
      ADPS := TACBrDPS(ACBrDPS).Bilhetes.Items[0].DPS;
      if TACBrDPS(ACBrDPS).Configuracoes.Arquivos.EmissaoPathDPS then
        dhEmissao := ADPS.Ide.dhEmi
      else
        dhEmissao := Now;

      DescricaoModelo := 'DPS';
      Result := TACBrDPS(FACBrDPS).Configuracoes.Arquivos.GetPath(
                         Result,
                         DescricaoModelo,
                         ADPS.Emit.CNPJ,
                         dhEmissao,
                         DescricaoModelo);
    end;
  end;
  *)
end;

end.
