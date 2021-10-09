{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para interação com equipa- }
{ mentos de Automação Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2004 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Você pode obter a última versão desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{  Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }
{                                                                              }
{  Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU      }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto}
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,  }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Você também pode obter uma copia da licença em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Simões de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Praça Anita Costa, 34 - Tatuí - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{******************************************************************************
|* Historico
|*
|* 04/10/2005: Daniel Simões de Almeida
|*  - Primeira Versao ACBrBALToledo
******************************************************************************}

{$I ACBr.inc}

unit ACBrBALToledo;

interface
uses ACBrBALClass,
     Classes;

type

  TACBrBALToledo = class( TACBrBALClass )
  public
    constructor Create(AOwner: TComponent);
    function LePeso( MillisecTimeOut : Integer = 3000) :Double; override;
    procedure LeSerial( MillisecTimeOut : Integer = 500) ; override ;
  end ;

implementation
Uses ACBrBAL, ACBrUtil,
     {$IFDEF Delphi6_UP} DateUtils, StrUtils {$ELSE} ACBrD5, Windows{$ENDIF},
     SysUtils ;

{ TACBrBALGertecSerial }

constructor TACBrBALToledo.Create(AOwner: TComponent);
begin
  inherited Create( AOwner );

  fpModeloStr := 'Toledo' ;
end;

function TACBrBALToledo.LePeso( MillisecTimeOut : Integer) : Double;
begin
  Result := 0 ;
  fpDevice.Serial.Purge ;
  fpDevice.EnviaString( #05 );      { Envia comando solicitando o Peso }
  sleep(200) ;

  LeSerial( MillisecTimeOut );

  Result := fpUltimoPesoLido ;
end;

procedure TACBrBALToledo.LeSerial(MillisecTimeOut: Integer);
Var
  Resposta : String ;
  Decimais : Integer ;
  St2      : Char ;
begin
  fpUltimoPesoLido := 0 ;
  fpUltimaResposta := '' ;

  Decimais := 1000 ;
  Try
     fpUltimaResposta := fpDevice.Serial.RecvPacket( MillisecTimeOut );

     if Length(fpUltimaResposta) > 8 then  { Protocolo A }
      begin
        St2 := fpUltimaResposta[9] ;
        if TestBit(Ord(St2),3) then   { Bit 3 de ST2 ligado = 2 casas decimais }
           Decimais := 100 ;
        Resposta := Copy(fpUltimaResposta,3,6);
      end
     else if Length(fpUltimaResposta) > 7 then { Protocolo B }
        Resposta := Copy(fpUltimaResposta,3,5)
     else                              { Protocolo C }
        Resposta := Copy(fpUltimaResposta,2,5) ;

     try
        fpUltimoPesoLido := StrToFloat(Resposta) / Decimais ;
     except
     end;
  except
     { Peso não foi recebido (TimeOut) }
  end ;
end;

end.
