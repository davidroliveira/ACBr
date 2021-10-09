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
|* 20/08/2009: Jo�o Paulo
|*  - Doa��o units para gera��o do Danfe via c�digo usando Rave
******************************************************************************}
{$I ACBr.inc}
unit ACBrNFeDANFERaveCB;

interface

uses Forms, SysUtils, Classes,
  RpDefine, RpDevice, RVClass, RVProj, RVCsBars, RVCsStd, RVCsData,
  RvDirectDataView, RVDataField, jpeg,
  ACBrNFeDANFEClass, ACBrDANFeCBRave, pcnNFe, pcnConversao;

type
  TFont=(ftTimes,ftCourier);

  TACBrNFeDANFERaveCB = class( TACBrNFeDANFEClass )
   private
     FTamanhoCampoCodigo: integer;
     FFonte : TFont;
     FEspessuraBorda: Integer;
     FImprimirDetalhamentoEspecifico: Boolean;
   public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ImprimirDANFE(NFE : TNFe = nil); override ;
    procedure ImprimirDANFEPDF(NFE : TNFe = nil); override ;
  published
     property TamanhoCampoCodigo:integer read FTamanhoCampoCodigo write FTamanhoCampoCodigo;
     property Fonte:TFont read FFonte write FFonte;
     property EspessuraBorda:Integer read FEspessuraBorda write FEspessuraBorda;
     property ImprimirDetalhamentoEspecifico:boolean read FImprimirDetalhamentoEspecifico write FImprimirDetalhamentoEspecifico;
  end;

implementation

uses ACBrNFe, ACBrNFeUtil, ACBrUtil, StrUtils, Dialogs;

constructor TACBrNFeDANFERaveCB.Create(AOwner: TComponent);
begin
  inherited create( AOwner );

  FTamanhoCampoCodigo:=0;
  FEspessuraBorda:=2;
  FImprimirDetalhamentoEspecifico:=True;
end;

destructor TACBrNFeDANFERaveCB.Destroy;
begin
  inherited Destroy ;
end;


procedure TACBrNFeDANFERaveCB.ImprimirDANFE(NFE : TNFe = nil);
var
 LogoMarcaEmpresa:TJPEGImage;
begin
    try
      if NotaUtil.NaoEstaVazio(Logo) then
       begin
         LogoMarcaEmpresa:=TJPEGImage.Create;
         LogoMarcaEmpresa.LoadFromFile(Logo);
       end;
      ImprimirDANFeRave(TACBrNFe(ACBrNFe),
                       Site,
                       Email,
                       Fax,
                       Sistema,
                       Usuario,
                       ProtocoloNFe,
                       LogoMarcaEmpresa,
                       NotaUtil.SeSenao((TipoDANFE=tiRetrato),poPortrait,poLandScape),
                       NotaUtil.SeSenao(MostrarPreview,tsPreview,tsPrint),
                       MostrarStatus,
                       NumCopias,
                       Impressora,
                       '',
                       MargemInferior*10,
                       MargemSuperior*10,
                       MargemEsquerda*10,
                       MargemDireita*10,
                       CasasDecimais._qCom,
                       CasasDecimais._vUnCom,
                       CasasDecimais._Mask_qCom,
                       CasasDecimais._Mask_vUnCom,
                       TamanhoCampoCodigo,
                       TamanhoFonte_DemaisCampos,
                       ProdutosPorPagina,
                       EspessuraBorda,
                       ExibirResumoCanhoto,
                       ExibirResumoCanhoto_Texto,
                       ImprimirHoraSaida,
                       ImprimirHoraSaida_Hora,
                       ImprimirDescPorc,
                       ImprimirTotalLiquido,
                       ImprimirDetalhamentoEspecifico,
                       FormularioContinuo,
                       ExpandirLogoMarca,
                       NFE);
    finally
      LogoMarcaEmpresa.Free;
    end;
end;

procedure TACBrNFeDANFERaveCB.ImprimirDANFEPDF(NFE : TNFe = nil);
var
 LogoMarcaEmpresa:TJPEGImage;
 NomeArq : String;
begin
    try
      if NotaUtil.NaoEstaVazio(Logo) then
       begin
         LogoMarcaEmpresa:=TJPEGImage.Create;
         LogoMarcaEmpresa.LoadFromFile(Logo);
       end;

      if NFE = nil then
         NomeArq := StringReplace(TACBrNFe(ACBrNFe).NotasFiscais.Items[0].NFe.infNFe.ID,'NFe', '', [rfIgnoreCase])
      else
         NomeArq := StringReplace(NFE.infNFe.ID,'NFe', '', [rfIgnoreCase]);

      NomeArq := PathWithDelim(Self.PathPDF)+NomeArq+'.pdf';

      ImprimirDANFeRave(TACBrNFe(ACBrNFe),
                       Site,
                       Email,
                       Fax,
                       Sistema,
                       Usuario,
                       ProtocoloNFe,
                       LogoMarcaEmpresa,
                       NotaUtil.SeSenao((TipoDANFE=tiRetrato),poPortrait,poLandScape),
                       tsPDF,
                       MostrarStatus,
                       NumCopias,
                       Impressora,
                       NomeArq,
                       MargemInferior*10,
                       MargemSuperior*10,
                       MargemEsquerda*10,
                       MargemDireita*10,
                       CasasDecimais._qCom,
                       CasasDecimais._vUnCom,
                       CasasDecimais._Mask_qCom,
                       CasasDecimais._Mask_vUnCom,
                       TamanhoCampoCodigo,
                       TamanhoFonte_DemaisCampos,
                       ProdutosPorPagina,
                       EspessuraBorda,
                       ExibirResumoCanhoto,
                       ExibirResumoCanhoto_Texto,
                       ImprimirHoraSaida,
                       ImprimirHoraSaida_Hora,
                       ImprimirDescPorc,
                       ImprimirTotalLiquido,
                       ImprimirDetalhamentoEspecifico,
                       FormularioContinuo,
                       ExpandirLogoMarca,
                       NFE);
    finally
      LogoMarcaEmpresa.Free;
    end;
end;


end.
