{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para interação com equipa- }
{ mentos de Automação Comercial utilizados no Brasil                           }

{ Direitos Autorais Reservados (c) 2004 Daniel Simoes de Almeida               }

{ Colaboradores nesse arquivo:                                                 }

{  Você pode obter a última versão desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }

{  Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }

{  Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU      }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)              }

{  Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto}
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,  }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Você também pode obter uma copia da licença em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }

{ Daniel Simões de Almeida - daniel@projetoacbr.com.br - www.projetoacbr.com.br}
{       Rua Coronel Aureliano de Camargo, 963 - Tatuí - SP - 18270-170         }
{******************************************************************************}

{******************************************************************************
|* Historico
|*
|* 21/11/2009: Daniel Simoes de Almeida
|*  - Primeira Versao: Criaçao e Distribuiçao da Primeira Versao
******************************************************************************}

{$I ACBr.inc}

unit ACBrTEFDDisc;

interface

uses
  Classes, SysUtils, ACBrTEFDClass;

const
  CACBrTEFDDisc_ArqTemp   = 'C:\TEF_Disc\req\intpos.tmp' ;
  CACBrTEFDDisc_ArqReq    = 'C:\TEF_Disc\req\intpos.001' ;
  CACBrTEFDDisc_ArqResp   = 'C:\TEF_Disc\resp\intpos.001' ;
  CACBrTEFDDisc_ArqSTS    = 'C:\TEF_Disc\resp\intpos.sts' ;
  CACBrTEFDDisc_GPExeName = 'C:\TEF_Disc\tef_Disc.exe' ;


type
   { TACBrTEFDDisc }

   TACBrTEFDDisc = class( TACBrTEFDClassTXT )
   private
   public
     constructor Create( AOwner : TComponent ) ; override ;
   end;

implementation

Uses dateutils;

{ TACBrTEFDClass }

constructor TACBrTEFDDisc.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);

  ArqReq    := CACBrTEFDDisc_ArqReq ;
  ArqResp   := CACBrTEFDDisc_ArqResp ;
  ArqSTS    := CACBrTEFDDisc_ArqSTS ;
  ArqTemp   := CACBrTEFDDisc_ArqTemp ;
  GPExeName := CACBrTEFDDisc_GPExeName ;
  fpTipo    := gpTefDisc;
  Name      := 'TEF_Disc' ;
end;

end.

