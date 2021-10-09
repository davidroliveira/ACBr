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
|*
|* 16/12/2008: Wemerson Souto
|*  - Doa��o do componente para o Projeto ACBr
|* 20/08/2009: Caique Rodrigues
|*  - Doa��o units para gera��o do Danfe via QuickReport
|* 18/03/2010: Andr� R. Langner
|*  - Acr�scimo dos par�metros "FEmail", "FResumoCanhoto", "FFax", "FNumCopias",
|*    "FSistema", "FSite", "FUsuario", "FImprimeHoraSaida", "FHoraSaida",
|*    nas Class procedures "Imprimir" e "SavePDF"
|*  - Habilitada a funcionalidade da procedure "SavePDF";
******************************************************************************}
{$I ACBr.inc}
unit ACBrNFeDANFeQR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls,
  {$IFDEF QReport_PDF}
     QRPDFFilt,
     // Incluido por Italo em 13/01/2011
     QRPrntr,
  {$ENDIF}
  ACBrNFeQRCodeBar, pcnNFe, ACBrNFe, ACBrNFeUtil, pcnConversao;

type
  TfqrDANFeQR = class(TForm)
    QRNFe: TQuickRep;
  private
    { Private declarations }
  protected
    //BarCode : TBarCode128c ;
    FACBrNFe            : TACBrNFe;
    FNFe                : TNFe;
    FLogo               : String;
    FEmail              : String;
    FImprimeHoraSaida   : Boolean;
    FHoraSaida          : String;
    FResumoCanhoto      : Boolean;
    FFax                : String;
    FNumCopias          : Integer;
    FSistema            : String;
    FSite               : String;
    FUsuario            : String;
    AfterPreview        : Boolean ;
    ChangedPos          : Boolean ;
    FSemValorFiscal     : Boolean ;
    FMargemSuperior     : double;
    FMargemInferior     : double;
    FMargemEsquerda     : double;
    FMargemDireita      : double;
    FCasasDecimais_VCom : Integer;
    FCasasDecimais_Qcom : Integer;

    procedure qrlSemValorFiscalPrint(sender: TObject; var Value: String);
    procedure SetBarCodeImage ( ACode : String ; QRImage : TQRImage ) ;
  public
    { Public declarations }
    class procedure Imprimir(ANFe                : TNFe;
                             ALogo               : String       = '';
                             AEmail              : String       = '';
                             AImprimeHoraSaida   : Boolean      = False;
                             AHoraSaida          : String       = '';
                             AResumoCanhoto      : Boolean      = False;
                             AFax                : String       = '';
                             ANumCopias          : Integer      = 1;
                             ASistema            : String       = '';
                             ASite               : String       = '';
                             AUsuario            : String       = '' ;
                             APreview            : Boolean      = True;
                             AMargemSuperior     : Double       = 0.8;
                             AMargemInferior     : Double       = 0.8;
                             AMargemEsquerda     : Double       = 0.6;
                             AMargemDireita      : Double       = 0.51;
                             ACasasDecimais_VCom : integer       = 2;
                             ACasasDecimais_Qcom : integer       = 2);

    class procedure SavePDF(AFile: String;
                            ANFe                : TNFe;
                            ALogo               : String    = '';
                            AEmail              : String    = '';
                            AImprimeHoraSaida   : Boolean   = False;
                            AHoraSaida          : String    = '';
                            AResumoCanhoto      : Boolean   = False;
                            AFax                : String    = '';
                            ANumCopias          : Integer   = 1;
                            ASistema            : String    = '';
                            ASite               : String    = '';
                            AUsuario            : String    = '';
                            AMargemSuperior     : Double    = 0.8;
                            AMargemInferior     : Double    = 0.8;
                            AMargemEsquerda     : Double    = 0.6;
                            AMargemDireita      : Double    = 0.51;
                            ACasasDecimais_VCom : integer    = 2;
                            ACasasDecimais_Qcom : integer    = 2);

  end;


implementation

uses MaskUtils ;

{$R *.dfm}

class procedure TfqrDANFeQR.Imprimir(ANFe               : TNFe;
                                    ALogo               : String    = '';
                                    AEmail              : String    = '';
                                    AImprimeHoraSaida   : Boolean   = False;
                                    AHoraSaida          : String    = '';
                                    AResumoCanhoto      : Boolean   = False;
                                    AFax                : String    = '';
                                    ANumCopias          : Integer   = 1;
                                    ASistema            : String    = '';
                                    ASite               : String    = '';
                                    AUsuario            : String    = '' ;
                                    APreview            : Boolean   = True;
                                    AMargemSuperior     : Double    = 0.8;
                                    AMargemInferior     : Double    = 0.8;
                                    AMargemEsquerda     : Double    = 0.6;
                                    AMargemDireita      : Double    = 0.51;
                                    ACasasDecimais_VCom : integer    = 2;
                                    ACasasDecimais_Qcom : integer    = 2);
begin
  with Create ( nil ) do
     try
        FNFe                := ANFe;
        FLogo               := ALogo;
        FEmail              := AEmail;
        FImprimeHoraSaida   := AImprimeHoraSaida;
        FHoraSaida          := AHoraSaida;
        FResumoCanhoto      := AResumoCanhoto;
        FFax                := AFax;
        FNumCopias          := ANumCopias;
        FSistema            := ASistema;
        FSite               := ASite;
        FUsuario            := AUsuario;
        FMargemSuperior     := AMargemSuperior;
        FMargemInferior     := AMargemInferior;
        FMargemEsquerda     := AMargemEsquerda;
        FMargemDireita      := AMargemDireita;
        FCasasDecimais_VCom := ACasasDecimais_VCom;
        FCasasDecimais_Qcom := ACasasDecimais_Qcom;

        if APreview then
        begin
           // Incluido por Italo em 13/01/2011
          {$IFDEF QReport_PDF}
            QRNFe.PrevShowSearch      := False;
            QRNFe.PrevShowThumbs      := False;
            QRNFe.PreviewInitialState := wsMaximized;
            QRNFe.PrevInitialZoom     := qrZoomToWidth;
          {$ENDIF}

            QRNFe.Prepare;
            QRNFe.Preview;
        end else
           begin
              AfterPreview := True ;
              QRNFe.Prepare;
              QRNFe.Print ;
           end ;
     finally
        Free ;
     end ;
end;

class procedure TfqrDANFeQR.SavePDF(AFile               : String;
                                    ANFe                : TNFe;
                                    ALogo               : String    = '';
                                    AEmail              : String    = '';
                                    AImprimeHoraSaida   : Boolean   = False;
                                    AHoraSaida          : String    = '';
                                    AResumoCanhoto      : Boolean   = False;
                                    AFax                : String    = '';
                                    ANumCopias          : Integer   = 1;
                                    ASistema            : String    = '';
                                    ASite               : String    = '';
                                    AUsuario            : String    = '';
                                    AMargemSuperior     : Double    = 0.8;
                                    AMargemInferior     : Double    = 0.8;
                                    AMargemEsquerda     : Double    = 0.6;
                                    AMargemDireita      : Double    = 0.51;
                                    ACasasDecimais_VCom : integer    = 2;
                                    ACasasDecimais_Qcom : integer    = 2);
{$IFDEF QReport_PDF}
var
  qf : TQRPDFDocumentFilter;
  i  : integer;
{$ENDIF}
begin
{$IFDEF QReport_PDF}
  with Create ( nil ) do
     try
        FNFe                := ANFe;
        FLogo               := ALogo;
        FEmail              := AEmail;
        FImprimeHoraSaida   := AImprimeHoraSaida;
        FHoraSaida          := AHoraSaida;
        FResumoCanhoto      := AResumoCanhoto;
        FFax                := AFax;
        FNumCopias          := ANumCopias;
        FSistema            := ASistema;
        FSite               := ASite;
        FUsuario            := AUsuario;
        FMargemSuperior     := AMargemSuperior;
        FMargemInferior     := AMargemInferior;
        FMargemEsquerda     := AMargemEsquerda;
        FMargemDireita      := AMargemDireita;
        FCasasDecimais_VCom := ACasasDecimais_VCom;
        FCasasDecimais_Qcom := ACasasDecimais_Qcom;

        For i := 0 to ComponentCount -1 do
          begin
            if (Components[i] is TQRShape) and (TQRShape(Components[i]).Shape = qrsRoundRect) then
              begin
                TQRShape(Components[i]).Shape := qrsRectangle;
                TQRShape(Components[i]).Pen.Width := 1;
              end;
          end;
        AfterPreview := True ;
        QRNFe.Prepare;
        qf := TQRPDFDocumentFilter.Create(AFile) ;
        qf.CompressionOn := False;
        QRNFe.QRPrinter.ExportToFilter( qf );
        qf.Free;
     finally
        Free;
     end ;
{$ENDIF}
end;

procedure TfqrDANFeQR.qrlSemValorFiscalPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  if FSemValorFiscal then
     Value := '' ;
end;

procedure TfqrDANFeQR.SetBarCodeImage(ACode: String; QRImage: TQRImage);
var
 b : TBarCode128c ;
begin
   b := TBarCode128c.Create;
//      Width  := QRImage.Width ;
   b.Code := ACode ;
   b.PaintCodeToCanvas( ACode, QRImage.Canvas, QRImage.ClientRect );
   b.free ;
end;

end.
