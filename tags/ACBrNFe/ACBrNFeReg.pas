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
|* 09/03/2009: Dulcemar P.Zilli
|*  - Incluido IPI e II
******************************************************************************}
unit ACBrNFeReg;

interface

uses
  SysUtils, Classes, DesignIntf, DesignEditors;

type

  THRIPICSTProperty = class( TStringProperty )
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues( Proc : TGetStrProc) ; override;
    procedure SetValue(const Value : string); override;
  end;
  THRIPISituacaoTributariaProperty = class( TStringProperty )
  public
    function GetAttributes: TPropertyAttributes; override;
  end;

  THRIICSTProperty = class( TStringProperty )
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues( Proc : TGetStrProc) ; override;
    procedure SetValue(const Value : string); override;
  end;
  THRIISituacaoTributariaProperty = class( TStringProperty )
  public
    function GetAttributes: TPropertyAttributes; override;
  end;

  THRPISSTCSTProperty = class( TStringProperty )
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues( Proc : TGetStrProc) ; override;
    procedure SetValue(const Value : string); override;
  end;
  THRPISSTSituacaoTributariaProperty = class( TStringProperty )
  public
    function GetAttributes: TPropertyAttributes; override;
  end;

  THRCOFINSSTCSTProperty = class( TStringProperty )
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues( Proc : TGetStrProc) ; override;
    procedure SetValue(const Value : string); override;
  end;
  THRCOFINSSTSituacaoTributariaProperty = class( TStringProperty )
  public
    function GetAttributes: TPropertyAttributes; override;
  end;

// Fim Alteracao IPI e II>

  THRPISCSTProperty = class( TStringProperty )
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues( Proc : TGetStrProc) ; override;
    procedure SetValue(const Value : string); override;
  end;
  THRPISSituacaoTributariaProperty = class( TStringProperty )
  public
    function GetAttributes: TPropertyAttributes; override;
  end;

  THRICMSCSTProperty = class( TStringProperty )
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues( Proc : TGetStrProc) ; override;
    procedure SetValue(const Value : string); override;
  end;
  THRICMSSituacaoTributariaProperty = class( TStringProperty )
  public
    function GetAttributes: TPropertyAttributes; override;
  end;

  THRCOFINSCSTProperty = class( TStringProperty )
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues( Proc : TGetStrProc) ; override;
    procedure SetValue(const Value : string); override;
  end;
  THRCOFINSSituacaoTributariaProperty = class( TStringProperty )
  public
    function GetAttributes: TPropertyAttributes; override;
  end;

  THRWEBSERVICEUFProperty = class( TStringProperty )
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues( Proc : TGetStrProc) ; override;
    procedure SetValue(const Value : string); override;
  end;

  THRWEBSERVICEAMBIENTEProperty = class( TStringProperty )
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues( Proc : TGetStrProc) ; override;
    procedure SetValue(const Value : string); override;
  end;

  THRCONFIGURACOESFORMAEMISSAOProperty = class( TStringProperty )
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues( Proc : TGetStrProc) ; override;
  end;

  THRCONFIGURACOESDANFEProperty = class( TStringProperty )
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues( Proc : TGetStrProc) ; override;
    procedure SetValue(const Value : string); override;
  end;

procedure Register;

implementation

uses ACBrNFe, ACBrNFeConst, ACBrNFeDadosProdutos,
     ACBrNFeWebServices, ACBrNFeConfiguracoes;

{$R ACBrNFe.dcr}

procedure Register;
begin
  RegisterComponents('ACBr', [TACBrNFe]);

  RegisterPropertyEditor(TypeInfo(String), TIPI, 'CST',
     THRIPICSTProperty);
  RegisterPropertyEditor(TypeInfo(String), TIPI, 'SituacaoTributaria',
     THRIPISituacaoTributariaProperty);

  RegisterPropertyEditor(TypeInfo(String), TII, 'CST',
     THRIICSTProperty);
  RegisterPropertyEditor(TypeInfo(String), TII, 'SituacaoTributaria',
     THRIISituacaoTributariaProperty);

  RegisterPropertyEditor(TypeInfo(String), TII, 'CST',
     THRPISSTCSTProperty);
  RegisterPropertyEditor(TypeInfo(String), TII, 'SituacaoTributaria',
     THRPISSTSituacaoTributariaProperty);

  RegisterPropertyEditor(TypeInfo(String), TII, 'CST',
     THRCOFINSSTCSTProperty);
  RegisterPropertyEditor(TypeInfo(String), TII, 'SituacaoTributaria',
     THRCOFINSSTSituacaoTributariaProperty);

// Fim Alteracao IPI e II>

  RegisterPropertyEditor(TypeInfo(String), TPIS, 'CST',
     THRPISCSTProperty);
  RegisterPropertyEditor(TypeInfo(String), TPIS, 'SituacaoTributaria',
     THRPISSituacaoTributariaProperty);

  RegisterPropertyEditor(TypeInfo(String), TICMS, 'CST',
     THRICMSCSTProperty);
  RegisterPropertyEditor(TypeInfo(String), TICMS, 'SituacaoTributaria',
     THRICMSSituacaoTributariaProperty);

  RegisterPropertyEditor(TypeInfo(String), TCOFINS, 'CST',
     THRCOFINSCSTProperty);
  RegisterPropertyEditor(TypeInfo(String), TCOFINS, 'SituacaoTributaria',
     THRCOFINSSituacaoTributariaProperty);

  RegisterPropertyEditor(TypeInfo(String), TWebServicesConf, 'UF',
     THRWEBSERVICEUFProperty);

  RegisterPropertyEditor(TypeInfo(String), TWebServicesConf, 'Ambiente',
     THRWEBSERVICEAMBIENTEProperty);

  RegisterPropertyEditor(TypeInfo(String), TGeralConf, 'FormaEmissao',
     THRCONFIGURACOESFORMAEMISSAOProperty);

  RegisterPropertyEditor(TypeInfo(String), TGeralConf, 'DANFE',
     THRCONFIGURACOESDANFEProperty);
end;

{ THRIPICSTProperty }

function THRIPICSTProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paAutoUpdate];
end;

procedure THRIPICSTProperty.GetValues(Proc: TGetStrProc);
var
 i : integer;
begin
  inherited;
  for i:= 0 to High(NFeCSTIPI) do
    Proc(NFeCSTIPI[i]);
end;

procedure THRIPICSTProperty.SetValue(const Value: string);
begin
  inherited;

end;

{ THRIPISituacaoTributariaProperty }

function THRIPISituacaoTributariaProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paReadOnly];
end;

{ THRIICSTProperty }

function THRIICSTProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paAutoUpdate];
end;

procedure THRIICSTProperty.GetValues(Proc: TGetStrProc);
begin
  inherited;
end;

procedure THRIICSTProperty.SetValue(const Value: string);
begin
  inherited;

end;

{ THRIISituacaoTributariaProperty }

function THRIISituacaoTributariaProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paReadOnly];
end;


{ THRPISSTCSTProperty }

function THRPISSTCSTProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paAutoUpdate];
end;

procedure THRPISSTCSTProperty.GetValues(Proc: TGetStrProc);
begin
  inherited;
end;

procedure THRPISSTCSTProperty.SetValue(const Value: string);
begin
  inherited;

end;

{ THRIPISituacaoTributariaProperty }

function THRPISSTSituacaoTributariaProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paReadOnly];
end;


{ THRCOFINSSTCSTProperty }

function THRCOFINSSTCSTProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paAutoUpdate];
end;

procedure THRCOFINSSTCSTProperty.GetValues(Proc: TGetStrProc);
begin
  inherited;
end;

procedure THRCOFINSSTCSTProperty.SetValue(const Value: string);
begin
  inherited;

end;

{ THRCOFINSSTSituacaoTributariaProperty }

function THRCOFINSSTSituacaoTributariaProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paReadOnly];
end;


// Fim Alteracao IPI e II >


{ THRPISCSTProperty }

function THRPISCSTProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paAutoUpdate];
end;

procedure THRPISCSTProperty.GetValues(Proc: TGetStrProc);
var
 i : integer;
begin
  inherited;
  for i:= 0 to High(NFeCSTPIS) do
    Proc(NFeCSTPIS[i]);
end;

procedure THRPISCSTProperty.SetValue(const Value: string);
begin
  inherited;

end;

{ THRPISSituacaoTributariaProperty }

function THRPISSituacaoTributariaProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paReadOnly];
end;

{ THRICMSCSTProperty }

function THRICMSCSTProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paAutoUpdate];
end;

procedure THRICMSCSTProperty.GetValues(Proc: TGetStrProc);
var
 i : integer;
begin
  inherited;
  for i:= 0 to High(NFeCSTICMS) do
    Proc(NFeCSTICMS[i]);
end;

procedure THRICMSCSTProperty.SetValue(const Value: string);
begin
  inherited;

end;

{ THRICMSSituacaoTributariaProperty }

function THRICMSSituacaoTributariaProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paReadOnly];
end;

{ THRCOFINSCSTProperty }

function THRCOFINSCSTProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paAutoUpdate];
end;

procedure THRCOFINSCSTProperty.GetValues(Proc: TGetStrProc);
var
 i : integer;
begin
  inherited;
  for i:= 0 to High(NFeCSTCOFINS) do
    Proc(NFeCSTCOFINS[i]);
end;

procedure THRCOFINSCSTProperty.SetValue(const Value: string);
begin
  inherited;

end;

{ THRCOFINSSituacaoTributariaProperty }

function THRCOFINSSituacaoTributariaProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paReadOnly];
end;

{ THRWEBSERVICEUFProperty }

function THRWEBSERVICEUFProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paAutoUpdate];
end;

procedure THRWEBSERVICEUFProperty.GetValues(Proc: TGetStrProc);
var
 i : integer;
begin
  inherited;
  for i:= 0 to High(NFeUF) do
    Proc(NFeUF[i]);
end;

procedure THRWEBSERVICEUFProperty.SetValue(const Value: string);
begin
  inherited;

end;

{ THRWEBSERVICEAMBIENTEProperty }

function THRWEBSERVICEAMBIENTEProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList];
end;

procedure THRWEBSERVICEAMBIENTEProperty.GetValues(Proc: TGetStrProc);
var
 i : integer;
begin
  inherited;
  for i:= 0 to High(NFeAmbiente) do
    Proc(NFeAmbiente[i]);
end;

procedure THRWEBSERVICEAMBIENTEProperty.SetValue(const Value: string);
begin
  inherited;

end;

{ THRCONFIGURACOESFORMAEMISSAOProperty }

function THRCONFIGURACOESFORMAEMISSAOProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList];
end;

procedure THRCONFIGURACOESFORMAEMISSAOProperty.GetValues(
  Proc: TGetStrProc);
var
 i : integer;
begin
  inherited;
  for i:= 0 to High(NFeFormaEmissao) do
    Proc(NFeFormaEmissao[i]);
end;

{ THRCONFIGURACOESDANFEProperty }

function THRCONFIGURACOESDANFEProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paAutoUpdate];
end;

procedure THRCONFIGURACOESDANFEProperty.GetValues(Proc: TGetStrProc);
var
 i : integer;
begin
  inherited;
  for i:= 0 to High(NFeDANFE) do
    Proc(NFeDANFE[i]);
end;

procedure THRCONFIGURACOESDANFEProperty.SetValue(const Value: string);
begin
  inherited;

end;

end.
