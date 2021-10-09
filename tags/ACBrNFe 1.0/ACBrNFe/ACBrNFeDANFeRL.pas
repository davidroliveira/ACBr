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
|* 20/11/2009: Peterson de Cerqueira Matos
|*             E-mail: peterson161@yahoo.com - Tel: (11) 7197-1474 / 8059-4055
|*  - Componente e Units do QuickReport clonados
|*    e transformados em FORTES REPORT
|* 27/01/2010: Peterson de Cerqueira Matos
|*  - Acr�scimo dos par�metros "ALarguraCodProd" nas Class procedures
|*    "Imprimir" e "SavePDF"
|* 05/02/2010: Peterson de Cerqueira Matos
|*  - Tratamento das propriedades "Email", "ResumoCanhoto", "Fax", "NumCopias",
|*    "Ssitema", "Site", "Usuario" em "ACBrNFeDANFeClass"
|*  - Acr�scimo dos par�metros "AEmail", "AResumoCanhoto", "AFax", "ANumCopias",
|*    "ASsitema", "ASite", "AUsuario" nas Class procedures
|*    "Imprimir" e "SavePDF"
|* 13/02/2010: Peterson de Cerqueira Matos
|*  - Corre��o na exibi��o do 'Preview' para modo 'PREVIEWMODAL'
|* 15/03/2010: Felipe Feltes
|*  - Adequa��o na se��o 'USES' para ser utilizado em CLX
|* 19/03/2010: Peterson de Cerqueira Matos
|*  - Tratamento das propriedades "FormularioContinuo", "ExpandirLogoMarca" e
|*    "MostrarPreview" de "ACBrNFeDANFeClass"
|*  - Acr�scimo dos par�metros "APosCanhoto", "AFormularioContinuo",
|*    "AExpandirLogoMarca" e "AMostrarPreview" nas Class procedures
|*    "Imprimir" e "SavePDF" (esta �ltima sem o "AMostrarPreview")
|* 22/03/2010: Peterson de Cerqueira Matos
|*  - Tratamento das margens em "ACBrNFeDANFeClass"
|*  - Acr�scimo dos par�metros "AMargemSuperior, AMargemInferior,
|*    AMargemEsqurda, AMargemDireita" e "AFonteDANFE"
|* 13/04/2010: Peterson de Cerqueira Matos
|*  - Tratamento das casas decimais em "ACBrNFeDANFeClass"
|*  - Acr�scimo dos par�metros "FCasasDecimaisqCom" e "FCasasDecimaisvUnCom"
******************************************************************************}
{$I ACBr.inc}
unit ACBrNFeDANFeRL;

interface

uses
  SysUtils, Variants, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, Qt,
  {$ELSE}
  Windows, Messages, Graphics, Controls, Forms, Dialogs, ExtCtrls,
  {$ENDIF}
  RLReport, pcnNFe, ACBrNFe, RLFilters, MaskUtils;

type
  TPosCanhoto = (pcCabecalho, pcRodape);
  TFonteDANFE = (fdTimesNewRoman, fdCourierNew, fdArial);
type
  TfrlDANFeRL = class(TForm)
    RLNFe: TRLReport;

  private
    { Private declarations }
  protected
    FACBrNFe: TACBrNFe;
    FNFe: TNFe;
    FLogo: String;
    FMarcaDagua: String;
    FLarguraCodProd: Integer;
    FEmail: String;
    FResumoCanhoto: Boolean;
    FFax: String;
    FNumCopias: Integer;
    FSsitema: String;
    FSite: String;
    FUsuario: String;
    FPosCanhoto: TPosCanhoto;
    FFormularioContinuo: Boolean;
    FExpandirLogoMarca: Boolean;
    FMostrarPreview: Boolean;
    FFonteDANFE: TFonteDANFE;
    FMargemSuperior: Double;
    FMargemInferior: Double;
    FMargemEsquerda: Double;
    FMargemDireita: Double;
    FCasasDecimaisqCom: Integer;
    FCasasDecimaisvUnCom: Integer;

  public
    { Public declarations }
    class procedure Imprimir(ANFe: TNFe; ALogo: String = '';
                    AMarcaDagua: String = ''; ALarguraCodProd: Integer = 54;
                    AEmail: String = ''; AResumoCanhoto: Boolean = False;
                    AFax: String = ''; ANumCopias: Integer = 1;
                    ASistema: String = ''; ASite: String = '';
                    AUsuario: String = '';
                    APosCanhoto: TPosCanhoto = pcCabecalho;
                    AFormularioContinuo: Boolean = False;
                    AExpandirLogoMarca: Boolean = False;
                    AMostrarPreview: Boolean = True;
                    AFonteDANFE: TFonteDANFE = fdTimesNewRoman;
                    AMargemSuperior: Double = 0.7;
                    AMargemInferior: Double = 0.7;
                    AMargemEsquerda: Double = 0.7;
                    AMargemDireita: Double = 0.7;
                    ACasasDecimaisqCom: Integer = 4;
                    ACasasDecimaisvUncCom: Integer = 4);

    class procedure SavePDF(ANFe: TNFe; ALogo: String = '';
                    AMarcaDagua: String = ''; ALarguraCodProd: Integer = 54;
                    AEmail: String = ''; AResumoCanhoto: Boolean = False;
                    AFax: String = ''; ANumCopias: Integer = 1;
                    ASistema: String = ''; ASite: String = '';
                    AUsuario: String = ''; AFile: String = '';
                    APosCanhoto: TPosCanhoto = pcCabecalho;
                    AFormularioContinuo: Boolean = False;
                    AExpandirLogoMarca: Boolean = False;
                    AFonteDANFE: TFonteDANFE = fdTimesNewRoman;
                    AMargemSuperior: Double = 0.7;
                    AMargemInferior: Double = 0.7;
                    AMargemEsquerda: Double = 0.7;
                    AMargemDireita: Double = 0.7;
                    ACasasDecimaisqCom: Integer = 4;
                    ACasasDecimaisvUncCom: Integer = 4);
  end;

implementation

var iCopias: Integer;

{$R *.dfm}

class procedure TfrlDANFeRL.Imprimir(ANFe: TNFe; ALogo: String = '';
                AMarcaDagua: String = ''; ALarguraCodProd: Integer = 54;
                AEmail: String = ''; AResumoCanhoto: Boolean = False;
                AFax: String = ''; ANumCopias: Integer = 1;
                ASistema: String = ''; ASite: String = '';
                AUsuario: String = '';
                APosCanhoto: TPosCanhoto = pcCabecalho;
                AFormularioContinuo: Boolean = False;
                AExpandirLogoMarca: Boolean = False;
                AMostrarPreview: Boolean = True;
                AFonteDANFE: TFonteDANFE = fdTimesNewRoman;
                AMargemSuperior: Double = 0.7;
                AMargemInferior: Double = 0.7;
                AMargemEsquerda: Double = 0.7;
                AMargemDireita: Double = 0.7;
                ACasasDecimaisqCom: Integer = 4;
                ACasasDecimaisvUncCom: Integer = 4);
begin
  with Create ( nil ) do
    try
      FNFe := ANFe;
      FLogo := ALogo;
      FMarcaDagua := AMarcaDagua;
      FLarguraCodProd := ALarguraCodProd;
      FEmail := AEmail;
      FResumoCanhoto := AResumoCanhoto;
      FFax := AFax;
      FNumCopias := ANumCopias;
      FSsitema := ASistema;
      FSite := ASite;
      FUsuario := AUsuario;
      FPosCanhoto := APosCanhoto;
      FFormularioContinuo := AFormularioContinuo;
      FExpandirLogoMarca := AExpandirLogoMarca;
      FMostrarPreview := AMostrarPreview;
      FFonteDANFE := AFonteDANFE;
      FMargemSuperior := AMargemSuperior;
      FMargemInferior := AMargemInferior;
      FMargemEsquerda := AMargemEsquerda;
      FMargemDireita := AMargemDireita;
      FCasasDecimaisqCom := ACasasDecimaisqCom;
      FCasasDecimaisvUnCom := ACasasDecimaisvUncCom;

      for iCopias := 1 to FNumCopias do
        if FMostrarPreview = True then
          RLNFe.PreviewModal
        else
          RLNFe.Print;

    finally
      Free ;
    end ;
end;

class procedure TfrlDANFeRL.SavePDF(ANFe: TNFe; ALogo: String = '';
                    AMarcaDagua: String = ''; ALarguraCodProd: Integer = 54;
                    AEmail: String = ''; AResumoCanhoto: Boolean = False;
                    AFax: String = ''; ANumCopias: Integer = 1;
                    ASistema: String = ''; ASite: String = '';
                    AUsuario: String = '' ; AFile: String = '';
                    APosCanhoto: TPosCanhoto = pcCabecalho;
                    AFormularioContinuo: Boolean = False;
                    AExpandirLogoMarca: Boolean = False;
                    AFonteDANFE: TFonteDANFE = fdTimesNewRoman;
                    AMargemSuperior: Double = 0.7;
                    AMargemInferior: Double = 0.7;
                    AMargemEsquerda: Double = 0.7;
                    AMargemDireita: Double = 0.7;
                    ACasasDecimaisqCom: Integer = 4;
                    ACasasDecimaisvUncCom: Integer = 4);

begin
  with Create ( nil ) do
    try
      FNFe := ANFe;
      FLogo := ALogo;
      FMarcaDagua := AMarcaDagua;
      FLarguraCodProd := ALarguraCodProd;
      FEmail := AEmail;
      FResumoCanhoto := AResumoCanhoto;
      FFax := AFax;
      FNumCopias := ANumCopias;
      FSsitema := ASistema;
      FSite := ASite;
      FUsuario := AUsuario;
      FPosCanhoto := APosCanhoto;
      FFormularioContinuo := AFormularioContinuo;
      FExpandirLogoMarca := AExpandirLogoMarca;
      FFonteDANFE := AFonteDANFE;
      FMargemSuperior := AMargemSuperior;
      FMargemInferior := AMargemInferior;
      FMargemEsquerda := AMargemEsquerda;
      FMargemDireita := AMargemDireita;
      FCasasDecimaisqCom := ACasasDecimaisqCom;
      FCasasDecimaisvUnCom := ACasasDecimaisvUncCom;
      RLNFe.SaveToFile(AFile);
    finally
      Free ;
    end ;
end;

end.
