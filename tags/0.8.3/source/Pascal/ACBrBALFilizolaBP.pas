{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para interação com equipa- }
{ mentos de Automação Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2004 Fabio Farias                           }
{                                       Daniel Simoes de Almeida               }
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
|* 04/10/2005: Fabio Farias
|*  - Primeira Versao ACBrBALFilizolaBP
******************************************************************************}

{$I ACBr.inc}

unit ACBrBALFilizolaBP;

interface
uses ACBrBALClass,
     Classes;

type

  TACBrBALFilizolaBP = class( TACBrBALClass )
  public
    constructor Create(AOwner: TComponent);
    function LePeso( MillisecTimeOut : Integer = 3000) :Double; override;
    procedure LeSerial( MillisecTimeOut : Integer = 500) ; override ;
  end ;

implementation
Uses ACBrBAL,
     {$IFDEF Delphi6_UP} DateUtils, StrUtils {$ELSE} ACBrD5, Windows{$ENDIF},
     SysUtils ;

{ TACBrBALGertecSerial }

constructor TACBrBALFilizolaBP.Create(AOwner: TComponent);
begin
  inherited Create( AOwner );

  fpModeloStr := 'Filizola-BP' ;
end;

function TACBrBALFilizolaBP.LePeso( MillisecTimeOut : Integer) : Double;
Var TempoFinal : TDateTime ;
begin
  { A Filizola pode responder com Instavel inicalmente, mas depois ela poderia
    estabilizar... Portanto o Loop abaixo tenta ler um Peso válido até o limite
    de tempo estabelecido em "MilliSecTimeOut" ser atingido ou um Peso valido
    retornado }
  Result     := 0 ;
  TempoFinal := IncMilliSecond(now,MillisecTimeOut) ;

  while (Result <= 0) and (TempoFinal > now) do
  begin
     fpDevice.Serial.Purge ;
     fpDevice.EnviaString( #05 );      { Envia comando solicitando o Peso }
     sleep(200) ;
     MillisecTimeOut := MilliSecondsBetween(now,TempoFinal) ;

     LeSerial( MillisecTimeOut );

     Result := fpUltimoPesoLido ;
  end ;
end;

procedure TACBrBALFilizolaBP.LeSerial( MillisecTimeOut : Integer) ;
Var Resposta : String ;
begin
  fpUltimoPesoLido := 0 ;
  fpUltimaResposta := '' ;

  Try
     fpUltimaResposta := fpDevice.Serial.RecvPacket( MillisecTimeOut );

     Resposta := Copy(fpUltimaResposta,2,Length(fpUltimaResposta)-2); { Retira STX, ETX }

     try
        fpUltimoPesoLido := StrToFloat(Resposta) / 1000 ;
     except
       if Resposta = '|||||' then        { Instavel }
          fpUltimoPesoLido := -1
       else if Resposta = 'NNNNN' then   { Peso Negativo }
          fpUltimoPesoLido := -2
       else if Resposta = 'SSSSS' then   { Sobrecarga de Peso }
          fpUltimoPesoLido := -10 ;
     end;
  except
     { Peso não foi recebido (TimeOut) }
  end ;
end;

end.
