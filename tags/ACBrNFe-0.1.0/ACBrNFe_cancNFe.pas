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

{******************************************************}
{                                                      }
{                   XML Data Binding                   }
{                                                      }
{         Generated on: 13/03/2009 11:11:32            }
{       Generated from: .\PL_005c\cancNFe_v1.07.xsd   }
{                                                      }
{******************************************************}

unit ACBrNFe_cancNFe;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLTCancNFe = interface;
  IXMLInfCanc = interface;
  IXMLSignatureType = interface;
  IXMLSignedInfoType = interface;
  IXMLCanonicalizationMethod = interface;
  IXMLSignatureMethod = interface;
  IXMLReferenceType = interface;
  IXMLTransformsType = interface;
  IXMLTransformType = interface;
  IXMLDigestMethod = interface;
  IXMLSignatureValueType = interface;
  IXMLKeyInfoType = interface;
  IXMLX509DataType = interface;

{ IXMLTCancNFe }

  IXMLTCancNFe = interface(IXMLNode)
    ['{3AC58DBE-1085-4AC7-99CF-A9A04C6370A2}']
    { Property Accessors }
    function Get_Versao: WideString;
    function Get_InfCanc: IXMLInfCanc;
    function Get_Signature: IXMLSignatureType;
    procedure Set_Versao(Value: WideString);
    { Methods & Properties }
    property Versao: WideString read Get_Versao write Set_Versao;
    property InfCanc: IXMLInfCanc read Get_InfCanc;
    property Signature: IXMLSignatureType read Get_Signature;
  end;

{ IXMLInfCanc }

  IXMLInfCanc = interface(IXMLNode)
    ['{13436E46-7BD6-4519-B277-F92A1E89F699}']
    { Property Accessors }
    function Get_Id: WideString;
    function Get_TpAmb: WideString;
    function Get_XServ: WideString;
    function Get_ChNFe: WideString;
    function Get_NProt: WideString;
    function Get_XJust: WideString;
    procedure Set_Id(Value: WideString);
    procedure Set_TpAmb(Value: WideString);
    procedure Set_XServ(Value: WideString);
    procedure Set_ChNFe(Value: WideString);
    procedure Set_NProt(Value: WideString);
    procedure Set_XJust(Value: WideString);
    { Methods & Properties }
    property Id: WideString read Get_Id write Set_Id;
    property TpAmb: WideString read Get_TpAmb write Set_TpAmb;
    property XServ: WideString read Get_XServ write Set_XServ;
    property ChNFe: WideString read Get_ChNFe write Set_ChNFe;
    property NProt: WideString read Get_NProt write Set_NProt;
    property XJust: WideString read Get_XJust write Set_XJust;
  end;

{ IXMLSignatureType }

  IXMLSignatureType = interface(IXMLNode)
    ['{72E68CE3-6D2D-4009-A7ED-F4983DC80445}']
    { Property Accessors }
    function Get_Id: WideString;
    function Get_SignedInfo: IXMLSignedInfoType;
    function Get_SignatureValue: IXMLSignatureValueType;
    function Get_KeyInfo: IXMLKeyInfoType;
    procedure Set_Id(Value: WideString);
    { Methods & Properties }
    property Id: WideString read Get_Id write Set_Id;
    property SignedInfo: IXMLSignedInfoType read Get_SignedInfo;
    property SignatureValue: IXMLSignatureValueType read Get_SignatureValue;
    property KeyInfo: IXMLKeyInfoType read Get_KeyInfo;
  end;

{ IXMLSignedInfoType }

  IXMLSignedInfoType = interface(IXMLNode)
    ['{6461F8F3-A5E1-4A0A-9836-48B74A516678}']
    { Property Accessors }
    function Get_Id: WideString;
    function Get_CanonicalizationMethod: IXMLCanonicalizationMethod;
    function Get_SignatureMethod: IXMLSignatureMethod;
    function Get_Reference: IXMLReferenceType;
    procedure Set_Id(Value: WideString);
    { Methods & Properties }
    property Id: WideString read Get_Id write Set_Id;
    property CanonicalizationMethod: IXMLCanonicalizationMethod read Get_CanonicalizationMethod;
    property SignatureMethod: IXMLSignatureMethod read Get_SignatureMethod;
    property Reference: IXMLReferenceType read Get_Reference;
  end;

{ IXMLCanonicalizationMethod }

  IXMLCanonicalizationMethod = interface(IXMLNode)
    ['{72DE7676-980C-406E-B936-8DB5EE5E6163}']
    { Property Accessors }
    function Get_Algorithm: WideString;
    procedure Set_Algorithm(Value: WideString);
    { Methods & Properties }
    property Algorithm: WideString read Get_Algorithm write Set_Algorithm;
  end;

{ IXMLSignatureMethod }

  IXMLSignatureMethod = interface(IXMLNode)
    ['{3D83FBB7-9224-480D-9B84-D79F163001AF}']
    { Property Accessors }
    function Get_Algorithm: WideString;
    procedure Set_Algorithm(Value: WideString);
    { Methods & Properties }
    property Algorithm: WideString read Get_Algorithm write Set_Algorithm;
  end;

{ IXMLReferenceType }

  IXMLReferenceType = interface(IXMLNode)
    ['{93FF56C8-F706-4248-859C-F46FA915E398}']
    { Property Accessors }
    function Get_Id: WideString;
    function Get_URI: WideString;
    function Get_Type_: WideString;
    function Get_Transforms: IXMLTransformsType;
    function Get_DigestMethod: IXMLDigestMethod;
    function Get_DigestValue: WideString;
    procedure Set_Id(Value: WideString);
    procedure Set_URI(Value: WideString);
    procedure Set_Type_(Value: WideString);
    procedure Set_DigestValue(Value: WideString);
    { Methods & Properties }
    property Id: WideString read Get_Id write Set_Id;
    property URI: WideString read Get_URI write Set_URI;
    property Type_: WideString read Get_Type_ write Set_Type_;
    property Transforms: IXMLTransformsType read Get_Transforms;
    property DigestMethod: IXMLDigestMethod read Get_DigestMethod;
    property DigestValue: WideString read Get_DigestValue write Set_DigestValue;
  end;

{ IXMLTransformsType }

  IXMLTransformsType = interface(IXMLNodeCollection)
    ['{A5EB6CEB-DED7-471A-9A56-F5AB872B9F33}']
    { Property Accessors }
    function Get_Transform(Index: Integer): IXMLTransformType;
    { Methods & Properties }
    function Add: IXMLTransformType;
    function Insert(const Index: Integer): IXMLTransformType;
    property Transform[Index: Integer]: IXMLTransformType read Get_Transform; default;
  end;

{ IXMLTransformType }

  IXMLTransformType = interface(IXMLNodeCollection)
    ['{085CFAD3-D127-4008-841D-172929819A5F}']
    { Property Accessors }
    function Get_Algorithm: WideString;
    function Get_XPath(Index: Integer): WideString;
    procedure Set_Algorithm(Value: WideString);
    { Methods & Properties }
    function Add(const XPath: WideString): IXMLNode;
    function Insert(const Index: Integer; const XPath: WideString): IXMLNode;
    property Algorithm: WideString read Get_Algorithm write Set_Algorithm;
    property XPath[Index: Integer]: WideString read Get_XPath; default;
  end;

{ IXMLDigestMethod }

  IXMLDigestMethod = interface(IXMLNode)
    ['{854F9761-4FF5-4B22-8554-D475C95E01E1}']
    { Property Accessors }
    function Get_Algorithm: WideString;
    procedure Set_Algorithm(Value: WideString);
    { Methods & Properties }
    property Algorithm: WideString read Get_Algorithm write Set_Algorithm;
  end;

{ IXMLSignatureValueType }

  IXMLSignatureValueType = interface(IXMLNode)
    ['{1D9C1056-693C-46DF-8915-B52DBDB8B814}']
    { Property Accessors }
    function Get_Id: WideString;
    procedure Set_Id(Value: WideString);
    { Methods & Properties }
    property Id: WideString read Get_Id write Set_Id;
  end;

{ IXMLKeyInfoType }

  IXMLKeyInfoType = interface(IXMLNode)
    ['{736BAAB0-0C04-4681-A650-8159D7F96EAB}']
    { Property Accessors }
    function Get_Id: WideString;
    function Get_X509Data: IXMLX509DataType;
    procedure Set_Id(Value: WideString);
    { Methods & Properties }
    property Id: WideString read Get_Id write Set_Id;
    property X509Data: IXMLX509DataType read Get_X509Data;
  end;

{ IXMLX509DataType }

  IXMLX509DataType = interface(IXMLNode)
    ['{B001BE96-8F66-4177-B7ED-054E0A20C3E2}']
    { Property Accessors }
    function Get_X509Certificate: WideString;
    procedure Set_X509Certificate(Value: WideString);
    { Methods & Properties }
    property X509Certificate: WideString read Get_X509Certificate write Set_X509Certificate;
  end;

{ Forward Decls }

  TXMLTCancNFe = class;
  TXMLInfCanc = class;
  TXMLSignatureType = class;
  TXMLSignedInfoType = class;
  TXMLCanonicalizationMethod = class;
  TXMLSignatureMethod = class;
  TXMLReferenceType = class;
  TXMLTransformsType = class;
  TXMLTransformType = class;
  TXMLDigestMethod = class;
  TXMLSignatureValueType = class;
  TXMLKeyInfoType = class;
  TXMLX509DataType = class;

{ TXMLTCancNFe }

  TXMLTCancNFe = class(TXMLNode, IXMLTCancNFe)
  protected
    { IXMLTCancNFe }
    function Get_Versao: WideString;
    function Get_InfCanc: IXMLInfCanc;
    function Get_Signature: IXMLSignatureType;
    procedure Set_Versao(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLInfCanc }

  TXMLInfCanc = class(TXMLNode, IXMLInfCanc)
  protected
    { IXMLInfCanc }
    function Get_Id: WideString;
    function Get_TpAmb: WideString;
    function Get_XServ: WideString;
    function Get_ChNFe: WideString;
    function Get_NProt: WideString;
    function Get_XJust: WideString;
    procedure Set_Id(Value: WideString);
    procedure Set_TpAmb(Value: WideString);
    procedure Set_XServ(Value: WideString);
    procedure Set_ChNFe(Value: WideString);
    procedure Set_NProt(Value: WideString);
    procedure Set_XJust(Value: WideString);
  end;

{ TXMLSignatureType }

  TXMLSignatureType = class(TXMLNode, IXMLSignatureType)
  protected
    { IXMLSignatureType }
    function Get_Id: WideString;
    function Get_SignedInfo: IXMLSignedInfoType;
    function Get_SignatureValue: IXMLSignatureValueType;
    function Get_KeyInfo: IXMLKeyInfoType;
    procedure Set_Id(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLSignedInfoType }

  TXMLSignedInfoType = class(TXMLNode, IXMLSignedInfoType)
  protected
    { IXMLSignedInfoType }
    function Get_Id: WideString;
    function Get_CanonicalizationMethod: IXMLCanonicalizationMethod;
    function Get_SignatureMethod: IXMLSignatureMethod;
    function Get_Reference: IXMLReferenceType;
    procedure Set_Id(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCanonicalizationMethod }

  TXMLCanonicalizationMethod = class(TXMLNode, IXMLCanonicalizationMethod)
  protected
    { IXMLCanonicalizationMethod }
    function Get_Algorithm: WideString;
    procedure Set_Algorithm(Value: WideString);
  end;

{ TXMLSignatureMethod }

  TXMLSignatureMethod = class(TXMLNode, IXMLSignatureMethod)
  protected
    { IXMLSignatureMethod }
    function Get_Algorithm: WideString;
    procedure Set_Algorithm(Value: WideString);
  end;

{ TXMLReferenceType }

  TXMLReferenceType = class(TXMLNode, IXMLReferenceType)
  protected
    { IXMLReferenceType }
    function Get_Id: WideString;
    function Get_URI: WideString;
    function Get_Type_: WideString;
    function Get_Transforms: IXMLTransformsType;
    function Get_DigestMethod: IXMLDigestMethod;
    function Get_DigestValue: WideString;
    procedure Set_Id(Value: WideString);
    procedure Set_URI(Value: WideString);
    procedure Set_Type_(Value: WideString);
    procedure Set_DigestValue(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTransformsType }

  TXMLTransformsType = class(TXMLNodeCollection, IXMLTransformsType)
  protected
    { IXMLTransformsType }
    function Get_Transform(Index: Integer): IXMLTransformType;
    function Add: IXMLTransformType;
    function Insert(const Index: Integer): IXMLTransformType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTransformType }

  TXMLTransformType = class(TXMLNodeCollection, IXMLTransformType)
  protected
    { IXMLTransformType }
    function Get_Algorithm: WideString;
    function Get_XPath(Index: Integer): WideString;
    procedure Set_Algorithm(Value: WideString);
    function Add(const XPath: WideString): IXMLNode;
    function Insert(const Index: Integer; const XPath: WideString): IXMLNode;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDigestMethod }

  TXMLDigestMethod = class(TXMLNode, IXMLDigestMethod)
  protected
    { IXMLDigestMethod }
    function Get_Algorithm: WideString;
    procedure Set_Algorithm(Value: WideString);
  end;

{ TXMLSignatureValueType }

  TXMLSignatureValueType = class(TXMLNode, IXMLSignatureValueType)
  protected
    { IXMLSignatureValueType }
    function Get_Id: WideString;
    procedure Set_Id(Value: WideString);
  end;

{ TXMLKeyInfoType }

  TXMLKeyInfoType = class(TXMLNode, IXMLKeyInfoType)
  protected
    { IXMLKeyInfoType }
    function Get_Id: WideString;
    function Get_X509Data: IXMLX509DataType;
    procedure Set_Id(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLX509DataType }

  TXMLX509DataType = class(TXMLNode, IXMLX509DataType)
  protected
    { IXMLX509DataType }
    function Get_X509Certificate: WideString;
    procedure Set_X509Certificate(Value: WideString);
  end;

{ Global Functions }

function GetcancNFe(Doc: IXMLDocument): IXMLTCancNFe;
function LoadcancNFe(const FileName: WideString): IXMLTCancNFe;
function NewcancNFe: IXMLTCancNFe;

const
  TargetNamespace = 'http://www.portalfiscal.inf.br/nfe';

implementation

{ Global Functions }

function GetcancNFe(Doc: IXMLDocument): IXMLTCancNFe;
begin
  Result := Doc.GetDocBinding('cancNFe', TXMLTCancNFe, TargetNamespace) as IXMLTCancNFe;
end;

function LoadcancNFe(const FileName: WideString): IXMLTCancNFe;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('cancNFe', TXMLTCancNFe, TargetNamespace) as IXMLTCancNFe;
end;

function NewcancNFe: IXMLTCancNFe;
begin
  Result := NewXMLDocument.GetDocBinding('cancNFe', TXMLTCancNFe, TargetNamespace) as IXMLTCancNFe;
end;

{ TXMLTCancNFe }

procedure TXMLTCancNFe.AfterConstruction;
begin
  RegisterChildNode('infCanc', TXMLInfCanc);
  RegisterChildNode('Signature', TXMLSignatureType);
  inherited;
end;

function TXMLTCancNFe.Get_Versao: WideString;
begin
  Result := AttributeNodes['versao'].Text;
end;

procedure TXMLTCancNFe.Set_Versao(Value: WideString);
begin
  SetAttribute('versao', Value);
end;

function TXMLTCancNFe.Get_InfCanc: IXMLInfCanc;
begin
  Result := ChildNodes['infCanc'] as IXMLInfCanc;
end;

function TXMLTCancNFe.Get_Signature: IXMLSignatureType;
begin
  Result := ChildNodes['Signature'] as IXMLSignatureType;
end;

{ TXMLInfCanc }

function TXMLInfCanc.Get_Id: WideString;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLInfCanc.Set_Id(Value: WideString);
begin
  SetAttribute('Id', Value);
end;

function TXMLInfCanc.Get_TpAmb: WideString;
begin
  Result := ChildNodes['tpAmb'].Text;
end;

procedure TXMLInfCanc.Set_TpAmb(Value: WideString);
begin
  ChildNodes['tpAmb'].NodeValue := Value;
end;

function TXMLInfCanc.Get_XServ: WideString;
begin
  Result := ChildNodes['xServ'].Text;
end;

procedure TXMLInfCanc.Set_XServ(Value: WideString);
begin
  ChildNodes['xServ'].NodeValue := Value;
end;

function TXMLInfCanc.Get_ChNFe: WideString;
begin
  Result := ChildNodes['chNFe'].Text;
end;

procedure TXMLInfCanc.Set_ChNFe(Value: WideString);
begin
  ChildNodes['chNFe'].NodeValue := Value;
end;

function TXMLInfCanc.Get_NProt: WideString;
begin
  Result := ChildNodes['nProt'].Text;
end;

procedure TXMLInfCanc.Set_NProt(Value: WideString);
begin
  ChildNodes['nProt'].NodeValue := Value;
end;

function TXMLInfCanc.Get_XJust: WideString;
begin
  Result := ChildNodes['xJust'].Text;
end;

procedure TXMLInfCanc.Set_XJust(Value: WideString);
begin
  ChildNodes['xJust'].NodeValue := Value;
end;

{ TXMLSignatureType }

procedure TXMLSignatureType.AfterConstruction;
begin
  RegisterChildNode('SignedInfo', TXMLSignedInfoType);
  RegisterChildNode('SignatureValue', TXMLSignatureValueType);
  RegisterChildNode('KeyInfo', TXMLKeyInfoType);
  inherited;
end;

function TXMLSignatureType.Get_Id: WideString;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLSignatureType.Set_Id(Value: WideString);
begin
  SetAttribute('Id', Value);
end;

function TXMLSignatureType.Get_SignedInfo: IXMLSignedInfoType;
begin
  Result := ChildNodes['SignedInfo'] as IXMLSignedInfoType;
end;

function TXMLSignatureType.Get_SignatureValue: IXMLSignatureValueType;
begin
  Result := ChildNodes['SignatureValue'] as IXMLSignatureValueType;
end;

function TXMLSignatureType.Get_KeyInfo: IXMLKeyInfoType;
begin
  Result := ChildNodes['KeyInfo'] as IXMLKeyInfoType;
end;

{ TXMLSignedInfoType }

procedure TXMLSignedInfoType.AfterConstruction;
begin
  RegisterChildNode('CanonicalizationMethod', TXMLCanonicalizationMethod);
  RegisterChildNode('SignatureMethod', TXMLSignatureMethod);
  RegisterChildNode('Reference', TXMLReferenceType);
  inherited;
end;

function TXMLSignedInfoType.Get_Id: WideString;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLSignedInfoType.Set_Id(Value: WideString);
begin
  SetAttribute('Id', Value);
end;

function TXMLSignedInfoType.Get_CanonicalizationMethod: IXMLCanonicalizationMethod;
begin
  Result := ChildNodes['CanonicalizationMethod'] as IXMLCanonicalizationMethod;
end;

function TXMLSignedInfoType.Get_SignatureMethod: IXMLSignatureMethod;
begin
  Result := ChildNodes['SignatureMethod'] as IXMLSignatureMethod;
end;

function TXMLSignedInfoType.Get_Reference: IXMLReferenceType;
begin
  Result := ChildNodes['Reference'] as IXMLReferenceType;
end;

{ TXMLCanonicalizationMethod }

function TXMLCanonicalizationMethod.Get_Algorithm: WideString;
begin
  Result := AttributeNodes['Algorithm'].Text;
end;

procedure TXMLCanonicalizationMethod.Set_Algorithm(Value: WideString);
begin
  SetAttribute('Algorithm', Value);
end;

{ TXMLSignatureMethod }

function TXMLSignatureMethod.Get_Algorithm: WideString;
begin
  Result := AttributeNodes['Algorithm'].Text;
end;

procedure TXMLSignatureMethod.Set_Algorithm(Value: WideString);
begin
  SetAttribute('Algorithm', Value);
end;

{ TXMLReferenceType }

procedure TXMLReferenceType.AfterConstruction;
begin
  RegisterChildNode('Transforms', TXMLTransformsType);
  RegisterChildNode('DigestMethod', TXMLDigestMethod);
  inherited;
end;

function TXMLReferenceType.Get_Id: WideString;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLReferenceType.Set_Id(Value: WideString);
begin
  SetAttribute('Id', Value);
end;

function TXMLReferenceType.Get_URI: WideString;
begin
  Result := AttributeNodes['URI'].Text;
end;

procedure TXMLReferenceType.Set_URI(Value: WideString);
begin
  SetAttribute('URI', Value);
end;

function TXMLReferenceType.Get_Type_: WideString;
begin
  Result := AttributeNodes['Type'].Text;
end;

procedure TXMLReferenceType.Set_Type_(Value: WideString);
begin
  SetAttribute('Type', Value);
end;

function TXMLReferenceType.Get_Transforms: IXMLTransformsType;
begin
  Result := ChildNodes['Transforms'] as IXMLTransformsType;
end;

function TXMLReferenceType.Get_DigestMethod: IXMLDigestMethod;
begin
  Result := ChildNodes['DigestMethod'] as IXMLDigestMethod;
end;

function TXMLReferenceType.Get_DigestValue: WideString;
begin
  Result := ChildNodes['DigestValue'].Text;
end;

procedure TXMLReferenceType.Set_DigestValue(Value: WideString);
begin
  ChildNodes['DigestValue'].NodeValue := Value;
end;

{ TXMLTransformsType }

procedure TXMLTransformsType.AfterConstruction;
begin
  RegisterChildNode('Transform', TXMLTransformType);
  ItemTag := 'Transform';
  ItemInterface := IXMLTransformType;
  inherited;
end;

function TXMLTransformsType.Get_Transform(Index: Integer): IXMLTransformType;
begin
  Result := List[Index] as IXMLTransformType;
end;

function TXMLTransformsType.Add: IXMLTransformType;
begin
  Result := AddItem(-1) as IXMLTransformType;
end;

function TXMLTransformsType.Insert(const Index: Integer): IXMLTransformType;
begin
  Result := AddItem(Index) as IXMLTransformType;
end;

{ TXMLTransformType }

procedure TXMLTransformType.AfterConstruction;
begin
  ItemTag := 'XPath';
  ItemInterface := IXMLNode;
  inherited;
end;

function TXMLTransformType.Get_Algorithm: WideString;
begin
  Result := AttributeNodes['Algorithm'].Text;
end;

procedure TXMLTransformType.Set_Algorithm(Value: WideString);
begin
  SetAttribute('Algorithm', Value);
end;

function TXMLTransformType.Get_XPath(Index: Integer): WideString;
begin
  Result := List[Index].Text;
end;

function TXMLTransformType.Add(const XPath: WideString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := XPath;
end;

function TXMLTransformType.Insert(const Index: Integer; const XPath: WideString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := XPath;
end;

{ TXMLDigestMethod }

function TXMLDigestMethod.Get_Algorithm: WideString;
begin
  Result := AttributeNodes['Algorithm'].Text;
end;

procedure TXMLDigestMethod.Set_Algorithm(Value: WideString);
begin
  SetAttribute('Algorithm', Value);
end;

{ TXMLSignatureValueType }

function TXMLSignatureValueType.Get_Id: WideString;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLSignatureValueType.Set_Id(Value: WideString);
begin
  SetAttribute('Id', Value);
end;

{ TXMLKeyInfoType }

procedure TXMLKeyInfoType.AfterConstruction;
begin
  RegisterChildNode('X509Data', TXMLX509DataType);
  inherited;
end;

function TXMLKeyInfoType.Get_Id: WideString;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLKeyInfoType.Set_Id(Value: WideString);
begin
  SetAttribute('Id', Value);
end;

function TXMLKeyInfoType.Get_X509Data: IXMLX509DataType;
begin
  Result := ChildNodes['X509Data'] as IXMLX509DataType;
end;

{ TXMLX509DataType }

function TXMLX509DataType.Get_X509Certificate: WideString;
begin
  Result := ChildNodes['X509Certificate'].Text;
end;

procedure TXMLX509DataType.Set_X509Certificate(Value: WideString);
begin
  ChildNodes['X509Certificate'].NodeValue := Value;
end;

end. 