{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit ACBr_Recopi;

interface

uses
  ACBrRecopi, ACBrRecopiReg, ACBrRecopiWebServices, ACBrRecopiConfiguracoes, 
  pcnConsConsultaPublica, pcnConsObterVersao, pcnRetConsConsultaPublica, 
  pcnRetConsObterVersao, pcnConversaoRecopi, pcnRecopi, 
  pcnConsPedidoSolicitacao, pcnRetPedidoSolicitacao, pcnConsInclusaoNF, 
  pcnRetInclusaoNF, pcnConsPedidoConfirmacao, pcnRetPedidoConfirmacao, 
  pcnConsControleEstoque, pcnRetControleEstoque, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('ACBrRecopiReg', @ACBrRecopiReg.Register);
end;

initialization
  RegisterPackage('ACBr_Recopi', @Register);
end.
