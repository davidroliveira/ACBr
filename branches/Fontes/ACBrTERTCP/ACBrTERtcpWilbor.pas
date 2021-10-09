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
|* 03/07/2011: Amarildo Lacerda    lacerda@storeware.com.br
|*  - Primeira Versao ACBrTERWilborTCP - Interface Terminal Wilbor TCP / TCPCumutadora
|
******************************************************************************}

{$I ACBr.inc}

Unit ACBrTERtcpWilbor;

Interface

Uses ACBrTERtcpClass,
     Classes, ExtCtrls;


Type
    TACBrTERtcpWilbor = Class( TACBrTERtcpClass )
    private
//    published
    Public
        function EncodeString(cod:TACBrTERDecodeString):string;override;
        function DecodeString(texto:string):TACBrTERDecodeString;override;

        function FormataString(terminal:integer;cmd:string;texto:string):string;virtual;
        Constructor Create( AOwner: TComponent );override;
        Procedure LeBalanca(  Terminal : integer = 0  ); Override;
        Procedure EnviaString( pTexto : String;cliPorta:integer; Terminal : integer = 0 ); Override;

        Procedure EnviaParalela( Texto:string; ACliPorta: integer; Terminal : integer = 0 ); override;
        procedure EnviaSerial( Texto:string; ACliPorta: integer; Terminal: integer = 0 ); override;
        procedure EnviaAcionamento(cmd:string; terminal:integer=0); override;

        Procedure EnviaRotacao( Texto : String; Linha : integer = 1; Terminal : integer = 0 ); Override;
        Procedure LimpaTela( Terminal : integer ; cliPorta:integer ); Override;
        Procedure PosicionaCursor( pLinha, pColuna : integer; Terminal : integer  ; cliPorta:integer); Override;
        Procedure BackSpace( Terminal : integer = 0 ); Override;
    End;

    TACBrTERtcpWilborComutadora = class(TACBrTERtcpWilbor)
      private
        //fpTimerStatus:TTimer;
        procedure DoTimerStatus(sender:TObject);
      public
        procedure DoConectaClass(pIP:String;cliPorta:integer;var Terminal:integer);override;

        Constructor Create( AOwner: TComponent );override;
        Destructor Destroy;override;
        function DecodeString(texto: string): TACBrTERDecodeString;override;
        function EncodeString(cod: TACBrTERDecodeString): string;override;
        function FormataString(terminal:integer;cmd:string;texto:string):string;override;
    end;


Implementation

Uses ACBrTERtcp, ACBrUtil, Math,
     {$IFDEF COMPILER6_UP} DateUtils, StrUtils {$ELSE} ACBrD5, Windows{$ENDIF},
     SysUtils ;

{ TACBrTERWilborTCP }

Constructor TACBrTERtcpWilbor.Create( AOwner: TComponent );
Begin
    Inherited Create( AOwner );
    TipoTerminal := terTerminalTCP;
    fpModeloStr := 'WilborTCP';
    fpModelo := terWilborTCP;
End;


function TACBrTERtcpWilbor.DecodeString(texto: string): TACBrTERDecodeString;
begin
  result.Texto := texto ;//copy(texto,2,length(texto)-2);
end;

Procedure TACBrTERtcpWilbor.LeBalanca(  Terminal : integer = 0 );
//  var PesoOk : string ;
Begin
   EnviaSerial(#5,0,Terminal);
End;


procedure TACBrTERtcpWilbor.EnviaSerial(Texto: string; ACliPorta: integer; Terminal: integer);
begin
   EnviaTCPString(GetIp(Terminal),0,FormataString(Terminal,'S',Texto)  );
end;

Procedure TACBrTERtcpWilbor.EnviaString( pTexto : String;cliPorta:integer; Terminal : integer = 0 );
begin
   inherited;
   try

   EnviaTCPString(GetIP(terminal),cliPorta,FormataString(terminal,'D',pTexto));
   except
     on e:exception do
        raise exception.create('Erro TACBrTERtcpWilbor.EnviaString '+e.message);
   end;
End;

function TACBrTERtcpWilbor.FormataString(terminal:integer;cmd:string;texto: string): string;
var cod:TACBrTERDecodeString;
begin
   cod.Terminal := terminal;
   cod.Comando := cmd;
   cod.Texto := texto;
   result := EncodeString(cod);
end;

function TACBrTERtcpWilbor.EncodeString(cod: TACBrTERDecodeString): string;
begin

   result := #2+cod.comando+cod.texto+#3;

end;

procedure TACBrTERtcpWilbor.EnviaAcionamento(cmd: string; terminal: integer);
begin
    EnviaTCPString(GetIp(Terminal),0,FormataString(Terminal,'G',cmd)  );
end;

procedure TACBrTERtcpWilbor.EnviaParalela(Texto: string; ACliPorta: integer; Terminal: integer);
begin
   EnviaTCPString(GetIp(Terminal),0,FormataString(Terminal,'P',Texto)  );
end;

Procedure TACBrTERtcpWilbor.EnviaRotacao( Texto : String; Linha : integer = 1; Terminal : integer = 0 );
Begin
(*    Dec( Linha );
    Linha := min( max(Linha, 0 ), 1) ;

    If Length( Texto ) <= 40 Then
        Texto := StringOfChar( ' ', 40 ) + Texto;

    TACBrTER( fpOwner ).ListaRotacao.Add( IntToStr( Linha ) + FormatFloat( '00', Terminal ) + Texto );
*)
End;

Procedure TACBrTERtcpWilbor.LimpaTela( Terminal : integer ; cliPorta:integer );
Begin
   inherited;
   EnviaTCPString(getIp(terminal),cliPorta,FormataString(terminal,'L',''));
End;

Procedure TACBrTERtcpWilbor.PosicionaCursor( pLinha, pColuna : integer; Terminal : integer ; cliPorta:integer );
Begin
  inherited;
  EnviaTCPString(GetIp(Terminal),cliPorta,FormataString(Terminal,'C',formatFloat('0',pLinha)+formatFloat('00',pColuna))  );
End;



procedure TACBrTERtcpWilbor.BackSpace( Terminal : integer = 0 );
Begin
    EnviaString(chr(16)+' '+chr(16),Terminal);
End;

{ TACBrTERtcpWilborComutadora }

constructor TACBrTERtcpWilborComutadora.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);
    //fpTimerStatus:=TTimer.create(nil);
    //fpTimerStatus.OnTimer := DoTimerStatus;
    TipoTerminal := terComutadoraTCP;
    fpModeloStr := 'WilborComutadoraTCP';
    fpModelo := terWilborComutadoraTCP;
end;

function TACBrTERtcpWilborComutadora.DecodeString(
  texto: string): TACBrTERDecodeString;
var s:string;
begin
  s := copy(texto,2,length(texto)-2);
  result.Texto:= copy(s,3,length(s));
  result.HTerminal := strToInt(copy(s,1,2));
  result.Terminal := result.HTerminal;
  result.Comutadora := true;
end;

destructor TACBrTERtcpWilborComutadora.Destroy;
begin
  //freeAndNil(fpTimerStatus);
  inherited;
end;

procedure TACBrTERtcpWilborComutadora.DoConectaClass(pIP: String;cliPorta:integer;
  var Terminal: integer);
var i:integer;
    t:integer;
begin
  // a comuntadora trabalha com terminal 1 até o 31  // o terminal 0 representa a comutadora
  for i := 0 to 31 do
  begin  // chama conexao para cada um dos terminais
    t := i;
    TACBrTerTcp( fpOwner ).DoIniciaConectaClass(self,pIP,cliPorta,t );
  end;

  for i := 0 to 31 do
  begin  // chama conexao para cada um dos terminais
    t := i;
    TACBrTERtcp( fpOwner ).DoFinalizaConectaClass(self,pIP,t);
  end;
// fpTimerStatus.Enabled := true;
// EnviaStatusTodos;
end;


procedure TACBrTERtcpWilborComutadora.DoTimerStatus(sender: TObject);
begin
  EnviaStatusTodos;
end;

function TACBrTERtcpWilborComutadora.EncodeString(
  cod: TACBrTERDecodeString): string;
begin
    result := #2+cod.Comando+formatFloat('00',cod.hterminal)+cod.texto+#3;
end;

function TACBrTERtcpWilborComutadora.FormataString(terminal: integer; cmd,
  texto: string): string;
var cod:TACBrTERDecodeString;
begin
   cod.Terminal := terminal;
   cod.HTerminal := terminal;
   cod.Comando := cmd;
   cod.Texto := texto;
   result := EncodeString(cod);
end;

End.
