{$I ACBr.inc}

unit ACBrTEFDQuatroS;

interface

uses
  Classes, SysUtils, ACBrTEFDClass;

const
  CACBrTEFDQuatroS_ArqTemp   = 'C:\GestaoCard\TEF\req\intpos.tmp' ;
  CACBrTEFDQuatroS_ArqReq    = 'C:\GestaoCard\TEF\req\intpos.001';
  CACBrTEFDQuatroS_ArqResp   = 'C:\GestaoCard\TEF\res\intpos.001';
  CACBrTEFDQuatroS_ArqSTS    = 'C:\GestaoCard\TEF\res\intpos.sts';
  CACBrTEFDQuatroS_GPExeName = 'C:\GestaoCard\TEF\Vendas_Card_TEF.exe';

type
   { TACBrTEFDDial }

   TACBrTEFDQuatroS = class( TACBrTEFDClassTXT )
   private
   public
     constructor Create( AOwner : TComponent ) ; override ;
     procedure VerificaAtivo; override;
   end;

implementation

Uses dateutils, ACBrUtil, ACBrTEFD;

{ TACBrTEFDClass }

constructor TACBrTEFDQuatroS.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);

  ArqReq    := CACBrTEFDQuatroS_ArqReq ;
  ArqResp   := CACBrTEFDQuatroS_ArqResp ;
  ArqSTS    := CACBrTEFDQuatroS_ArqSTS ;
  ArqTemp   := CACBrTEFDQuatroS_ArqTemp ;
  GPExeName := CACBrTEFDQuatroS_GPExeName ;
  fpTipo    := gpQuatroS;
  Name      := 'QuatroS' ;
end;

procedure TACBrTEFDQuatroS.VerificaAtivo;
begin
  {}
end;

end.

