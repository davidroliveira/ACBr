{$I ACBr.inc}

unit ACBrRecopiReg;

interface

uses
  Classes, SysUtils, ACBrRecopi, pcnConversao
  {$IFDEF FPC}
    , LResources, LazarusPackageIntf, PropEdits, ComponentEditors
  {$ELSE}
    {$IFNDEF COMPILER6_UP}
       , DsgnIntf
    {$ELSE}
       , DesignIntf, DesignEditors
    {$ENDIF}
  {$ENDIF}
  ;

procedure Register;

implementation

uses
  ACBrReg, ACBrDFeConfiguracoes, ACBrRecopiConfiguracoes;

{$IFNDEF FPC}
  //{$R ACBrRecopi.dcr}
{$ENDIF}

procedure Register;
begin
 RegisterComponents('ACBrRecopi', [TACBrRecopi]);

 RegisterPropertyEditor(TypeInfo(TCertificadosConf), TConfiguracoes, 'Certificados', TClassProperty);
 RegisterPropertyEditor(TypeInfo(TConfiguracoes), TACBrRecopi, 'Configuracoes', TClassProperty);
 RegisterPropertyEditor(TypeInfo(TWebServicesConf), TConfiguracoes, 'WebServices', TClassProperty);
 RegisterPropertyEditor(TypeInfo(TGeralConfRecopi), TConfiguracoes, 'Geral', TClassProperty);
 RegisterPropertyEditor(TypeInfo(String), TGeralConfRecopi, 'PathSalvar', TACBrDirProperty);
 RegisterPropertyEditor(TypeInfo(TArquivosConfRecopi), TConfiguracoes, 'Arquivos', TClassProperty);
 RegisterPropertyEditor(TypeInfo(String), TArquivosConfRecopi, 'PathRecopi', TACBrDirProperty);

end;

end.

