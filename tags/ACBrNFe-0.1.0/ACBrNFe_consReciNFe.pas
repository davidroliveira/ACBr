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

{**********************************************************}
{                                                          }
{                     XML Data Binding                     }
{                                                          }
{         Generated on: 13/03/2009 11:19:47                }
{       Generated from: .\PL_005c\consReciNFe_v1.10.xsd   }
{                                                          }
{**********************************************************}

unit ACBrNFe_consReciNFe;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLTConsReciNFe = interface;

{ IXMLTConsReciNFe }

  IXMLTConsReciNFe = interface(IXMLNode)
    ['{01DF78DE-A678-406A-9B42-35E5CDFC04CC}']
    { Property Accessors }
    function Get_Versao: WideString;
    function Get_TpAmb: WideString;
    function Get_NRec: WideString;
    procedure Set_Versao(Value: WideString);
    procedure Set_TpAmb(Value: WideString);
    procedure Set_NRec(Value: WideString);
    { Methods & Properties }
    property Versao: WideString read Get_Versao write Set_Versao;
    property TpAmb: WideString read Get_TpAmb write Set_TpAmb;
    property NRec: WideString read Get_NRec write Set_NRec;
  end;

{ Forward Decls }

  TXMLTConsReciNFe = class;

{ TXMLTConsReciNFe }

  TXMLTConsReciNFe = class(TXMLNode, IXMLTConsReciNFe)
  protected
    { IXMLTConsReciNFe }
    function Get_Versao: WideString;
    function Get_TpAmb: WideString;
    function Get_NRec: WideString;
    procedure Set_Versao(Value: WideString);
    procedure Set_TpAmb(Value: WideString);
    procedure Set_NRec(Value: WideString);
  end;

{ Global Functions }

function GetconsReciNFe(Doc: IXMLDocument): IXMLTConsReciNFe;
function LoadconsReciNFe(const FileName: WideString): IXMLTConsReciNFe;
function NewconsReciNFe: IXMLTConsReciNFe;

const
  TargetNamespace = 'http://www.portalfiscal.inf.br/nfe';

implementation

{ Global Functions }

function GetconsReciNFe(Doc: IXMLDocument): IXMLTConsReciNFe;
begin
  Result := Doc.GetDocBinding('consReciNFe', TXMLTConsReciNFe, TargetNamespace) as IXMLTConsReciNFe;
end;

function LoadconsReciNFe(const FileName: WideString): IXMLTConsReciNFe;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('consReciNFe', TXMLTConsReciNFe, TargetNamespace) as IXMLTConsReciNFe;
end;

function NewconsReciNFe: IXMLTConsReciNFe;
begin
  Result := NewXMLDocument.GetDocBinding('consReciNFe', TXMLTConsReciNFe, TargetNamespace) as IXMLTConsReciNFe;
end;

{ TXMLTConsReciNFe }

function TXMLTConsReciNFe.Get_Versao: WideString;
begin
  Result := AttributeNodes['versao'].Text;
end;

procedure TXMLTConsReciNFe.Set_Versao(Value: WideString);
begin
  SetAttribute('versao', Value);
end;

function TXMLTConsReciNFe.Get_TpAmb: WideString;
begin
  Result := ChildNodes['tpAmb'].Text;
end;

procedure TXMLTConsReciNFe.Set_TpAmb(Value: WideString);
begin
  ChildNodes['tpAmb'].NodeValue := Value;
end;

function TXMLTConsReciNFe.Get_NRec: WideString;
begin
  Result := ChildNodes['nRec'].Text;
end;

procedure TXMLTConsReciNFe.Set_NRec(Value: WideString);
begin
  ChildNodes['nRec'].NodeValue := Value;
end;

end. 