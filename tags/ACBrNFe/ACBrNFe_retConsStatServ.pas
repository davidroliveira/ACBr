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
|*  - Atualiza��o para pacote Pl_005c
******************************************************************************}

{**************************************************************}
{                                                              }
{                       XML Data Binding                       }
{                                                              }
{         Generated on: 13/03/2009 11:32:12                    }
{       Generated from: .\PL_005c\retConsStatServ_v1.07.xsd   }
{                                                              }
{**************************************************************}

unit ACBrNFe_retConsStatServ;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLTRetConsStatServ = interface;

{ IXMLTRetConsStatServ }

  IXMLTRetConsStatServ = interface(IXMLNode)
    ['{868A9253-0434-431A-9856-9D4AE12145A3}']
    { Property Accessors }
    function Get_Versao: WideString;
    function Get_TpAmb: WideString;
    function Get_VerAplic: WideString;
    function Get_CStat: WideString;
    function Get_XMotivo: WideString;
    function Get_CUF: WideString;
    function Get_DhRecbto: WideString;
    function Get_TMed: WideString;
    function Get_DhRetorno: WideString;
    function Get_XObs: WideString;
    procedure Set_Versao(Value: WideString);
    procedure Set_TpAmb(Value: WideString);
    procedure Set_VerAplic(Value: WideString);
    procedure Set_CStat(Value: WideString);
    procedure Set_XMotivo(Value: WideString);
    procedure Set_CUF(Value: WideString);
    procedure Set_DhRecbto(Value: WideString);
    procedure Set_TMed(Value: WideString);
    procedure Set_DhRetorno(Value: WideString);
    procedure Set_XObs(Value: WideString);
    { Methods & Properties }
    property Versao: WideString read Get_Versao write Set_Versao;
    property TpAmb: WideString read Get_TpAmb write Set_TpAmb;
    property VerAplic: WideString read Get_VerAplic write Set_VerAplic;
    property CStat: WideString read Get_CStat write Set_CStat;
    property XMotivo: WideString read Get_XMotivo write Set_XMotivo;
    property CUF: WideString read Get_CUF write Set_CUF;
    property DhRecbto: WideString read Get_DhRecbto write Set_DhRecbto;
    property TMed: WideString read Get_TMed write Set_TMed;
    property DhRetorno: WideString read Get_DhRetorno write Set_DhRetorno;
    property XObs: WideString read Get_XObs write Set_XObs;
  end;

{ Forward Decls }

  TXMLTRetConsStatServ = class;

{ TXMLTRetConsStatServ }

  TXMLTRetConsStatServ = class(TXMLNode, IXMLTRetConsStatServ)
  protected
    { IXMLTRetConsStatServ }
    function Get_Versao: WideString;
    function Get_TpAmb: WideString;
    function Get_VerAplic: WideString;
    function Get_CStat: WideString;
    function Get_XMotivo: WideString;
    function Get_CUF: WideString;
    function Get_DhRecbto: WideString;
    function Get_TMed: WideString;
    function Get_DhRetorno: WideString;
    function Get_XObs: WideString;
    procedure Set_Versao(Value: WideString);
    procedure Set_TpAmb(Value: WideString);
    procedure Set_VerAplic(Value: WideString);
    procedure Set_CStat(Value: WideString);
    procedure Set_XMotivo(Value: WideString);
    procedure Set_CUF(Value: WideString);
    procedure Set_DhRecbto(Value: WideString);
    procedure Set_TMed(Value: WideString);
    procedure Set_DhRetorno(Value: WideString);
    procedure Set_XObs(Value: WideString);
  end;

{ Global Functions }

function GetretConsStatServ(Doc: IXMLDocument): IXMLTRetConsStatServ;
function LoadretConsStatServ(const FileName: WideString): IXMLTRetConsStatServ;
function NewretConsStatServ: IXMLTRetConsStatServ;

const
  TargetNamespace = 'http://www.portalfiscal.inf.br/nfe';

implementation

{ Global Functions }

function GetretConsStatServ(Doc: IXMLDocument): IXMLTRetConsStatServ;
begin
  Result := Doc.GetDocBinding('retConsStatServ', TXMLTRetConsStatServ, TargetNamespace) as IXMLTRetConsStatServ;
end;

function LoadretConsStatServ(const FileName: WideString): IXMLTRetConsStatServ;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('retConsStatServ', TXMLTRetConsStatServ, TargetNamespace) as IXMLTRetConsStatServ;
end;

function NewretConsStatServ: IXMLTRetConsStatServ;
begin
  Result := NewXMLDocument.GetDocBinding('retConsStatServ', TXMLTRetConsStatServ, TargetNamespace) as IXMLTRetConsStatServ;
end;

{ TXMLTRetConsStatServ }

function TXMLTRetConsStatServ.Get_Versao: WideString;
begin
  Result := AttributeNodes['versao'].Text;
end;

procedure TXMLTRetConsStatServ.Set_Versao(Value: WideString);
begin
  SetAttribute('versao', Value);
end;

function TXMLTRetConsStatServ.Get_TpAmb: WideString;
begin
  Result := ChildNodes['tpAmb'].Text;
end;

procedure TXMLTRetConsStatServ.Set_TpAmb(Value: WideString);
begin
  ChildNodes['tpAmb'].NodeValue := Value;
end;

function TXMLTRetConsStatServ.Get_VerAplic: WideString;
begin
  Result := ChildNodes['verAplic'].Text;
end;

procedure TXMLTRetConsStatServ.Set_VerAplic(Value: WideString);
begin
  ChildNodes['verAplic'].NodeValue := Value;
end;

function TXMLTRetConsStatServ.Get_CStat: WideString;
begin
  Result := ChildNodes['cStat'].Text;
end;

procedure TXMLTRetConsStatServ.Set_CStat(Value: WideString);
begin
  ChildNodes['cStat'].NodeValue := Value;
end;

function TXMLTRetConsStatServ.Get_XMotivo: WideString;
begin
  Result := ChildNodes['xMotivo'].Text;
end;

procedure TXMLTRetConsStatServ.Set_XMotivo(Value: WideString);
begin
  ChildNodes['xMotivo'].NodeValue := Value;
end;

function TXMLTRetConsStatServ.Get_CUF: WideString;
begin
  Result := ChildNodes['cUF'].Text;
end;

procedure TXMLTRetConsStatServ.Set_CUF(Value: WideString);
begin
  ChildNodes['cUF'].NodeValue := Value;
end;

function TXMLTRetConsStatServ.Get_DhRecbto: WideString;
begin
  Result := ChildNodes['dhRecbto'].Text;
end;

procedure TXMLTRetConsStatServ.Set_DhRecbto(Value: WideString);
begin
  ChildNodes['dhRecbto'].NodeValue := Value;
end;

function TXMLTRetConsStatServ.Get_TMed: WideString;
begin
  Result := ChildNodes['tMed'].Text;
end;

procedure TXMLTRetConsStatServ.Set_TMed(Value: WideString);
begin
  ChildNodes['tMed'].NodeValue := Value;
end;

function TXMLTRetConsStatServ.Get_DhRetorno: WideString;
begin
  Result := ChildNodes['dhRetorno'].Text;
end;

procedure TXMLTRetConsStatServ.Set_DhRetorno(Value: WideString);
begin
  ChildNodes['dhRetorno'].NodeValue := Value;
end;

function TXMLTRetConsStatServ.Get_XObs: WideString;
begin
  Result := ChildNodes['xObs'].Text;
end;

procedure TXMLTRetConsStatServ.Set_XObs(Value: WideString);
begin
  ChildNodes['xObs'].NodeValue := Value;
end;

end. 