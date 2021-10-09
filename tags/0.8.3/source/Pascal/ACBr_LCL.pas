{ This file was automatically created by Lazarus. Do not edit!
This source is only used to compile and install the package.
 }

unit ACBr_LCL; 

interface

uses
  ACBrCHQ, ACBrBase, ACBrDIS, ACBrExtenso, ACBrGAV, ACBrLCB, ACBrValidador, 
    ACBrReg, ACBrECF, ACBrTroco, LazarusPackageIntf; 

implementation

procedure Register; 
begin
  RegisterUnit('ACBrReg', @ACBrReg.Register); 
end; 

initialization
  RegisterPackage('ACBr_LCL', @Register); 
end.
