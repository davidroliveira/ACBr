{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para interação com equipa- }
{ mentos de Automação Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2004   Gabriel Rodrigo Frones               }
{                                                                              }
{ Colaboradores nesse arquivo:            Daniel Simões de Almeida            }
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
|* 24/08/2011: Vanderlei Aparecido Silva    vanderlei@storeware.com.br
|*  - Primeira Versao ACBrTERtcpVT100 - Interface Terminal Com Protocolo VT100
|
******************************************************************************}

{$I ACBr.inc}

unit ACBrTERtcpVT100;

interface

Uses ACBrTERtcpClass,
     Classes, ExtCtrls;

type
   TACBrTERtcpVT100 = class(TACBrTERtcpClass)
    Public
        function EncodeString(cod:TACBrTERDecodeString):string;override;
        function DecodeString(texto:string):TACBrTERDecodeString;override;

        function FormataString(Terminal: Integer; CMD: string; Texto: string;
          CMDFinal: string = ''):string; virtual;
        Constructor Create( AOwner: TComponent );override;
        Procedure LeBalanca(  Terminal : integer = 0  ); Override;
        Procedure EnviaString( pTexto : String;cliPorta:integer; Terminal : integer = 0 ); Override;

        Procedure EnviaParalela( Texto:string; ACliPorta: integer; Terminal : integer = 0 ); override;
        procedure EnviaSerial( Texto:string; ACliPorta: integer; Terminal: integer = 0 ); override;
        procedure EnviaAcionamento(cmd:string; terminal:integer=0); override;

        Procedure EnviaRotacao( Texto : String; Linha : integer = 1; Terminal : integer = 0 ); Override;
        Procedure LimpaTela( Terminal : integer = 0; cliPorta:integer=0 ); Override;
        Procedure PosicionaCursor( pLinha, pColuna : integer; Terminal : integer = 0; cliPorta:integer=0 ); Override;
        Procedure BackSpace( Terminal : integer = 0 ); Override;
   end;


implementation

Uses ACBrTERtcp, ACBrUtil, Math,
     {$IFDEF COMPILER6_UP} DateUtils, StrUtils {$ELSE} ACBrD5, Windows{$ENDIF},
     SysUtils ;

{ TACBrTERtcpVT100 }

procedure TACBrTERtcpVT100.BackSpace(Terminal: integer);
begin
  EnviaString(chr(16)+' '+chr(16),Terminal);
end;

constructor TACBrTERtcpVT100.Create(AOwner: TComponent);
begin
  inherited Create( AOwner );
  TipoTerminal := terTerminalTCP;
  fpModeloStr := 'VT100';
  fpModelo := terVT100;
end;

function TACBrTERtcpVT100.DecodeString(texto: string): TACBrTERDecodeString;
begin
   result.Texto := Texto;
end;

function TACBrTERtcpVT100.EncodeString(cod: TACBrTERDecodeString): string;
begin
  if Trim(cod.Comando) = '' then
    result := Cod.Texto
  else
    result := #27 + cod.Comando + Cod.Texto + Cod.EncerraCMD;
end;

procedure TACBrTERtcpVT100.EnviaAcionamento(cmd: string; terminal: integer);
begin
  {inherited;}
end;

procedure TACBrTERtcpVT100.EnviaParalela(Texto: string; ACliPorta: integer; Terminal: integer);
begin
  EnviaTCPString(GetIp(Terminal),ACliPorta, FormataString(Terminal,
    '[?24l' + #27 + '[5i', Texto, #27 + '[4i'));
end;

procedure TACBrTERtcpVT100.EnviaRotacao(Texto: String; Linha,
  Terminal: integer);
begin
  {inherited;}
end;

procedure TACBrTERtcpVT100.EnviaSerial(Texto: string; ACliPorta: integer; Terminal: integer);
begin
//  inherited;
  EnviaTCPString(GetIp(Terminal),ACliPorta, FormataString(Terminal,
    '[?24h' + #27 + '[5i', Texto, #27 + '[4i'));

end;

procedure TACBrTERtcpVT100.EnviaString(pTexto: String;cliPorta:integer; Terminal: integer);
begin
  inherited;
  EnviaTCPString(GetIP(Terminal),0, FormataString(Terminal, '', pTexto));
end;

function TACBrTERtcpVT100.FormataString(Terminal: Integer; CMD,
  Texto: string; CMDFinal: string = ''): string;
var
  LCod: TACBrTERDecodeString;
begin
   LCod.Terminal := terminal;
   LCod.Comando := cmd;
   LCod.Texto := texto;
   LCod.EncerraCMD := CMDFinal;
   Result := EncodeString(LCod);
end;

procedure TACBrTERtcpVT100.LeBalanca(Terminal: integer);
begin
   EnviaTCPString(GetIp(Terminal),0,FormataString(Terminal,
     '[?24h' + #27 + '[5i' + Chr(05) + #27 + '[4i', '')); //Porta Serial 0
     {'[?24r' + #27 + '[5i' + Chr(05) + #27 + '[4i', '')); //Porta Serial 1}
end;

procedure TACBrTERtcpVT100.LimpaTela(Terminal: integer=0; cliPorta:integer=0);
begin
  inherited;
  EnviaTCPString(GetIp(Terminal),cliPorta, FormataString(Terminal, '[H'#27, '[H', #27'[J'));
end;

procedure TACBrTERtcpVT100.PosicionaCursor(pLinha, pColuna:integer; Terminal: integer=0; cliPorta:integer=0);
begin
  inherited;
  EnviaTCPString(GetIp(Terminal),cliPorta, FormataString(Terminal,
    '[', FormatFloat('00', pLinha + 1) + ';' + FormatFloat('00', pColuna + 1), 'H'));
end;

end.
