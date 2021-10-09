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
|* 13/03/2009: Dulcemar P. Zilli
|*  - Atualiza��o para Pacote Pl_005c
******************************************************************************}

{*******************************************************}
{                                                       }
{                   XML Data Binding                    }
{                                                       }
{         Generated on: 13/03/2009 11:07:47             }
{       Generated from: .\PL_005c\cabecMsg_v1.02.xsd   }
{                                                       }
{*******************************************************}

unit ACBrNFe_cabecMsg;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLCabecMsg = interface;

{ IXMLCabecMsg }

  IXMLCabecMsg = interface(IXMLNode)
    ['{00BBE9D2-757D-443D-B7C3-67A4AF851EC4}']
    { Property Accessors }
    function Get_Versao: WideString;
    function Get_VersaoDados: WideString;
    procedure Set_Versao(Value: WideString);
    procedure Set_VersaoDados(Value: WideString);
    { Methods & Properties }
    property Versao: WideString read Get_Versao write Set_Versao;
    property VersaoDados: WideString read Get_VersaoDados write Set_VersaoDados;
  end;

{ Forward Decls }

  TXMLCabecMsg = class;

{ TXMLCabecMsg }

  TXMLCabecMsg = class(TXMLNode, IXMLCabecMsg)
  protected
    { IXMLCabecMsg }
    function Get_Versao: WideString;
    function Get_VersaoDados: WideString;
    procedure Set_Versao(Value: WideString);
    procedure Set_VersaoDados(Value: WideString);
  end;

{ Global Functions }

function GetcabecMsg(Doc: IXMLDocument): IXMLCabecMsg;
function LoadcabecMsg(const FileName: WideString): IXMLCabecMsg;
function NewcabecMsg: IXMLCabecMsg;

const
  TargetNamespace = 'http://www.portalfiscal.inf.br/nfe';

implementation

{ Global Functions }

function GetcabecMsg(Doc: IXMLDocument): IXMLCabecMsg;
begin
  Result := Doc.GetDocBinding('cabecMsg', TXMLCabecMsg, TargetNamespace) as IXMLCabecMsg;
end;

function LoadcabecMsg(const FileName: WideString): IXMLCabecMsg;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('cabecMsg', TXMLCabecMsg, TargetNamespace) as IXMLCabecMsg;
end;

function NewcabecMsg: IXMLCabecMsg;
begin
  Result := NewXMLDocument.GetDocBinding('cabecMsg', TXMLCabecMsg, TargetNamespace) as IXMLCabecMsg;
end;

{ TXMLCabecMsg }

function TXMLCabecMsg.Get_Versao: WideString;
begin
  Result := AttributeNodes['versao'].Text;
end;

procedure TXMLCabecMsg.Set_Versao(Value: WideString);
begin
  SetAttribute('versao', Value);
end;

function TXMLCabecMsg.Get_VersaoDados: WideString;
begin
  Result := ChildNodes['versaoDados'].Text;
end;

procedure TXMLCabecMsg.Set_VersaoDados(Value: WideString);
begin
  ChildNodes['versaoDados'].NodeValue := Value;
end;

end.
