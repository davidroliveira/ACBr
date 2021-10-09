{******************************************************************************}
{ Projeto: Componente ACBrCTe                                                  }
{  Biblioteca multiplataforma de componentes Delphi para emiss�o de Conhecimen-}
{ to de Transporte eletr�nico - CTe - http://www.cte.fazenda.gov.br            }
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
|*
|* 16/12/2008: Wemerson Souto
|*  - Doa��o do componente para o Projeto ACBr
|* 20/08/2009: Caique Rodrigues
|*  - Doa��o units para gera��o do DACTe via QuickReport
|* 06/04/2010: Italo Jurisato Junior
|*  - Acr�scimo dos par�metros "FEmail", "FResumoCanhoto", "FFax", "FNumCopias",
|*    "FSistema", "FUsuario", "FImprimeHoraSaida", "FHoraSaida",
|*    "FMargemSuperior", "FMargemInferior", "FMargemEsquerda", "FMargemDireita",
|*    nas Class procedures "Imprimir" e "SavePDF"
|*  - Habilitada a funcionalidade da procedure "SavePDF";
******************************************************************************}
{$I ACBr.inc}
unit ACBrCTeDACTeQR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt,
  QRCtrls, ACBrCTeQRCodeBar, pcteCTe, ACBrCTe
  {, QRPDFFilt Decomentar para usar PDF};

type
  TfrmDACTeQR = class(TForm)
    QRCTe: TQuickRep;
  private

  protected
    //BarCode : TBarCode128c ;
    FACBrCTe            : TACBrCTe;
    FCTe                : TCTe;
    FLogo               : String;
    FEmail              : String;
    FImprimeHoraSaida   : Boolean;
    FHoraSaida          : String;
    FResumoCanhoto      : Boolean;
    FFax                : String;
    FNumCopias          : Integer;
    FSistema            : String;
    FUrl                : String;
    FUsuario            : String;
    AfterPreview        : Boolean ;
    ChangedPos          : Boolean ;
    FSemValorFiscal     : Boolean ;
    FMargemSuperior     : double;
    FMargemInferior     : double;
    FMargemEsquerda     : double;
    FMargemDireita      : double;
    procedure qrlSemValorFiscalPrint(sender: TObject; var Value: string);
    procedure SetBarCodeImage(ACode: string; QRImage: TQRImage);
  public
    class procedure Imprimir(ACTe                : TCTe;
                             ALogo               : String    = '';
                             AEmail              : String    = '';
                             AImprimeHoraSaida   : Boolean   = False;
                             AHoraSaida          : String    = '';
                             AResumoCanhoto      : Boolean   = False;
                             AFax                : String    = '';
                             ANumCopias          : Integer   = 1;
                             ASistema            : String    = '';
                             AUrl                : String    = '';
                             AUsuario            : String    = '' ;
                             APreview            : Boolean   = True;
                             AMargemSuperior     : Double    = 0.8;
                             AMargemInferior     : Double    = 0.8;
                             AMargemEsquerda     : Double    = 0.6;
                             AMargemDireita      : Double    = 0.51);

    class procedure SavePDF(AFile: String;
                            ACTe                : TCTe;
                            ALogo               : String    = '';
                            AEmail              : String    = '';
                            AImprimeHoraSaida   : Boolean   = False;
                            AHoraSaida          : String    = '';
                            AResumoCanhoto      : Boolean   = False;
                            AFax                : String    = '';
                            ANumCopias          : Integer   = 1;
                            ASistema            : String    = '';
                            AUrl                : String    = '';
                            AUsuario            : String    = '';
                            AMargemSuperior     : Double    = 0.8;
                            AMargemInferior     : Double    = 0.8;
                            AMargemEsquerda     : Double    = 0.6;
                            AMargemDireita      : Double    = 0.51);

  end;

implementation

uses MaskUtils;

{$R *.dfm}

class procedure TfrmDACTeQR.Imprimir(ACTe               : TCTe;
                                    ALogo               : String    = '';
                                    AEmail              : String    = '';
                                    AImprimeHoraSaida   : Boolean   = False;
                                    AHoraSaida          : String    = '';
                                    AResumoCanhoto      : Boolean   = False;
                                    AFax                : String    = '';
                                    ANumCopias          : Integer   = 1;
                                    ASistema            : String    = '';
                                    AUrl                : String    = '';
                                    AUsuario            : String    = '' ;
                                    APreview            : Boolean   = True;
                                    AMargemSuperior     : Double    = 0.8;
                                    AMargemInferior     : Double    = 0.8;
                                    AMargemEsquerda     : Double    = 0.6;
                                    AMargemDireita      : Double    = 0.51);
begin
  with Create ( nil ) do
     try
        FCTe                := ACTe;
        FLogo               := ALogo;
        FEmail              := AEmail;
        FImprimeHoraSaida   := AImprimeHoraSaida;
        FHoraSaida          := AHoraSaida;
        FResumoCanhoto      := AResumoCanhoto;
        FFax                := AFax;
        FNumCopias          := ANumCopias;
        FSistema            := ASistema;
        FUrl                := AUrl;
        FUsuario            := AUsuario;
        FMargemSuperior     := AMargemSuperior;
        FMargemInferior     := AMargemInferior;
        FMargemEsquerda     := AMargemEsquerda;
        FMargemDireita      := AMargemDireita;

        if APreview then
        begin
            QRCTe.Prepare;
            QRCTe.Preview;
        end else
           begin
              AfterPreview := True ;
              QRCTe.Prepare;
              QRCTe.Print ;
           end ;
     finally
        Free ;
     end ;
end;

class procedure TfrmDACTeQR.SavePDF(AFile               : String;
                                    ACTe                : TCTe;
                                    ALogo               : String    = '';
                                    AEmail              : String    = '';
                                    AImprimeHoraSaida   : Boolean   = False;
                                    AHoraSaida          : String    = '';
                                    AResumoCanhoto      : Boolean   = False;
                                    AFax                : String    = '';
                                    ANumCopias          : Integer   = 1;
                                    ASistema            : String    = '';
                                    AUrl                : String    = '';
                                    AUsuario            : String    = '';
                                    AMargemSuperior     : Double    = 0.8;
                                    AMargemInferior     : Double    = 0.8;
                                    AMargemEsquerda     : Double    = 0.6;
                                    AMargemDireita      : Double    = 0.51);
Var
  i : Integer;
  // qf : TQRPDFDocumentFilter;
begin
  {Descomentar para usar PDF}
{  with Create ( nil ) do
     try
        FCTe                := ACTe;
        FLogo               := ALogo;
        FEmail              := AEmail;
        FImprimeHoraSaida   := AImprimeHoraSaida;
        FHoraSaida          := AHoraSaida;
        FResumoCanhoto      := AResumoCanhoto;
        FFax                := AFax;
        FNumCopias          := ANumCopias;
        FSistema            := ASistema;
        FUrl                := AUrl;
        FUsuario            := AUsuario;
        FMargemSuperior     := AMargemSuperior;
        FMargemInferior     := AMargemInferior;
        FMargemEsquerda     := AMargemEsquerda;
        FMargemDireita      := AMargemDireita;

        For i := 0 to ComponentCount -1 do
          begin
            if (Components[i] is TQRShape) and (TQRShape(Components[i]).Shape = qrsRoundRect) then
              begin
                TQRShape(Components[i]).Shape := qrsRectangle;
                TQRShape(Components[i]).Pen.Width := 1;
              end;
          end;
        AfterPreview := True ;
        QRCTe.Prepare;
        qf := TQRPDFDocumentFilter.Create(AFile) ;
        qf.CompressionOn := False;
        qf.SetDocumentInfo( 'TurboCode CTe/CTe Integrator', 'www.turbocode.com.br', 'CTe', 'DACTe'  );
        QRCTe.QRPrinter.ExportToFilter( qf );
        qf.Free;
     finally
        Free;
     end ;}
end;

procedure TfrmDACTeQR.qrlSemValorFiscalPrint(sender: TObject;  var Value: string);
begin
  inherited;

  if FSemValorFiscal then
    Value := '';
end;

procedure TfrmDACTeQR.SetBarCodeImage(ACode: string; QRImage: TQRImage);
var
  b : TBarCode128c;
begin
  b := TBarCode128c.Create;
  //      Width  := QRImage.Width ;
  b.Code := ACode;
  b.PaintCodeToCanvas(ACode, QRImage.Canvas, QRImage.ClientRect);
  b.free;
end;

end.

