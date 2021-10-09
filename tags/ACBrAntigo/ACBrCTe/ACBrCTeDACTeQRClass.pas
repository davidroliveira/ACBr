{******************************************************************************}
{ Projeto: Componente ACBrNFe                                                  }
{  Biblioteca multiplataforma de componentes Delphi para emiss�o de Nota Fiscal}
{ eletr�nica - NFe - http://www.nfe.fazenda.gov.br                          }
{                                                                              }
{ Direitos Autorais Reservados (c) 2008 Wemerson Souto                         }
{                                       Daniel Simoes de Almeida               }
{                                       Andr� Ferreira de Moraes               }
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

{******************************************************************************
|* Historico
|* 11/12/2009: Emerson Crema
|*  - Implementado fqrDACTeQRRetrato.ProtocoloNFE( sProt ).
|* 16/12/2008: Wemerson Souto
|*  - Doa��o do componente para o Projeto ACBr
|* 20/08/2009: Caique Rodrigues
|*  - Doa��o units para gera��o do DANFe via QuickReport
******************************************************************************}

{$I ACBr.inc}

unit ACBrCTeDACTeQRClass;

interface

uses Forms, SysUtils, Classes,
  ACBrCTeDACTeClass, ACBrCTeDACTeQRRetrato, pcteCTe, pcnConversao;

type
  TACBrCTeDACTeQR = class(TACBrCTeDACTeClass)
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ImprimirDACTe(CTe: TCTe = nil); override;
    procedure ImprimirDACTePDF(CTe: TCTe = nil); override;
  end;

implementation

uses ACBrCTe, ACBrNFeUtil, ACBrUtil, StrUtils, Dialogs;

constructor TACBrCTeDACTeQR.Create(AOwner: TComponent);
begin
  inherited create(AOwner);
end;

destructor TACBrCTeDACTeQR.Destroy;
begin
  inherited Destroy;
end;

procedure TACBrCTeDACTeQR.ImprimirDACTe(CTe: TCTe = nil);
var
  i                 : Integer;
  frmDACTeQRRetrato : TfrmDACTeQRRetrato;
  sProt             : string;
begin
  frmDACTeQRRetrato := TfrmDACTeQRRetrato.Create(Self);
  sProt := TACBrCTe(ACBrCTe).DACTe.ProtocoloCTe;
  frmDACTeQRRetrato.ProtocoloCTe(sProt);

  if CTe = nil then
  begin
    for i := 0 to TACBrCTe(ACBrCTe).Conhecimentos.Count - 1 do
      frmDACTeQRRetrato.Imprimir(TACBrCTe(ACBrCTe).Conhecimentos.Items[i].CTe
                                    , Logo
                                    , Email
                                    , ImprimirHoraSaida
                                    , ImprimirHoraSaida_Hora
                                    , false
                                    , Fax
                                    , NumCopias
                                    , Sistema
                                    , Site
                                    , Usuario
                                    , MostrarPreview
                                    , MargemSuperior
                                    , MargemInferior
                                    , MargemEsquerda
                                    , MargemDireita);
  end
  else
    frmDACTeQRRetrato.Imprimir(CTe
                                , Logo
                                , Email
                                , ImprimirHoraSaida
                                , ImprimirHoraSaida_Hora
                                , False
                                , Fax
                                , NumCopias
                                , Sistema
                                , Site
                                , Usuario
                                , MostrarPreview
                                , MargemSuperior
                                , MargemInferior
                                , MargemEsquerda
                                , MargemDireita);

  frmDACTeQRRetrato.Free;
end;

procedure TACBrCTeDACTeQR.ImprimirDACTePDF(CTe: TCTe = nil);
var
  NomeArq: string;
  i : Integer;
  frmDACTeQRRetrato : TfrmDACTeQRRetrato;
  sProt     : String ;
begin
    frmDACTeQRRetrato := TfrmDACTeQRRetrato.Create(Self);

    sProt := TACBrCTe(ACBrCTe).DACTe.ProtocoloCTe ;
    frmDACTeQRRetrato.ProtocoloCTe( sProt ) ;
  if CTe = nil then
   begin
     for i:= 0 to TACBrCTe(ACBrCTe).Conhecimentos.Count-1 do
      begin
        NomeArq := StringReplace(TACBrCTe(ACBrCTe).Conhecimentos.Items[i].CTe.infCTe.ID,'CTe', '', [rfIgnoreCase]);
        NomeArq := PathWithDelim(Self.PathPDF)+NomeArq+'.pdf';

        frmDACTeQRRetrato.SavePDF(  NomeArq
                                    ,TACBrCTe(ACBrCTe).Conhecimentos.Items[i].CTe
                                    , Logo
                                    , Email
                                    , ImprimirHoraSaida
                                    , ImprimirHoraSaida_Hora
                                    , false
                                    , Fax
                                    , NumCopias
                                    , Sistema
                                    , Site
                                    , Usuario
                                    , MargemSuperior
                                    , MargemInferior
                                    , MargemEsquerda
                                    , MargemDireita);
      end;
   end
  else
  begin
     NomeArq := StringReplace(CTe.infCTe.ID,'CTe', '', [rfIgnoreCase]);
     NomeArq := PathWithDelim(Self.PathPDF)+NomeArq+'.pdf';
     frmDACTeQRRetrato.SavePDF( NomeArq
                                , CTe
                                , Logo
                                , Email
                                , ImprimirHoraSaida
                                , ImprimirHoraSaida_Hora
                                , False
                                , Fax
                                , NumCopias
                                , Sistema
                                , Site
                                , Usuario
                                , MargemSuperior
                                , MargemInferior
                                , MargemEsquerda
                                , MargemDireita);
  end;

  frmDACTeQRRetrato.Free;

end;

end.

