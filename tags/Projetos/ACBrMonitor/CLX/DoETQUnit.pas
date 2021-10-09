{******************************************************************************}
{ Projeto: ACBr Monitor                                                        }
{  Executavel multiplataforma que faz uso do conjunto de componentes ACBr para }
{ criar uma interface de comunica��o com equipamentos de automacao comercial.  }
{                                                                              }
{ Direitos Autorais Reservados (c) 2006 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Voc� pode obter a �ltima vers�o desse arquivo na p�gina do Projeto ACBr     }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{  Este programa � software livre; voc� pode redistribu�-lo e/ou modific�-lo   }
{ sob os termos da Licen�a P�blica Geral GNU, conforme publicada pela Free     }
{ Software Foundation; tanto a vers�o 2 da Licen�a como (a seu crit�rio)       }
{ qualquer vers�o mais nova.                                                   }
{                                                                              }
{  Este programa � distribu�do na expectativa de ser �til, mas SEM NENHUMA     }
{ GARANTIA; nem mesmo a garantia impl�cita de COMERCIALIZA��O OU DE ADEQUA��O A}
{ QUALQUER PROP�SITO EM PARTICULAR. Consulte a Licen�a P�blica Geral GNU para  }
{ obter mais detalhes. (Arquivo LICENCA.TXT ou LICENSE.TXT)                    }
{                                                                              }
{  Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral GNU junto com este}
{ programa; se n�o, escreva para a Free Software Foundation, Inc., 59 Temple   }
{ Place, Suite 330, Boston, MA 02111-1307, USA. Voc� tamb�m pode obter uma     }
{ copia da licen�a em:  http://www.opensource.org/licenses/gpl-license.php     }
{                                                                              }
{ Daniel Sim�es de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Pra�a Anita Costa, 34 - Tatu� - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{$DEFINE VisualCLX}
{$I ACBr.inc}

unit DoETQUnit ;

interface
Uses Classes, TypInfo, SysUtils, CmdUnit,
  {$IFNDEF CONSOLE}ACBrMonitor1 {$ELSE}ACBrMonitorConsoleDM {$ENDIF} ;


Procedure DoETQ( Cmd : TACBrCmd ) ;

implementation
uses ACBrDevice, ACBrETQ, ACBrUtil, StrUtils;

function StrToChr(AStr: string; Pos: Integer): Char;
begin
  AStr   := padL(AStr,1) ;
  Result := AStr[Pos];
end;

Procedure DoETQ( Cmd : TACBrCmd ) ;
begin
  with {$IFNDEF CONSOLE}FrmACBrMonitor.ACBrETQ1 {$ELSE}dm.ACBrETQ1 {$ENDIF} do
  begin
     {$IFNDEF CONSOLE}FrmACBrMonitor.{$ELSE}dm.{$ENDIF}DISWorking := True ;
     try
        if Cmd.Metodo = 'ativar' then  { Ativa o componente ETQ }
           Ativar

        else if Cmd.Metodo = 'desativar' then
           Desativar

        else if Cmd.Metodo = 'ativo' then
           Cmd.Resposta := BoolToStr(Ativo, true)

        else if Cmd.Metodo = 'modelostr' then
           Cmd.Resposta := ModeloStr

        else if Cmd.Metodo = 'modelo' then
           Cmd.Resposta := GetEnumName(TypeInfo(TACBrETQModelo),Integer(Modelo))

        else if Cmd.Metodo = 'porta' then
           Cmd.Resposta := Porta

        else if Cmd.Metodo = 'setporta' then
           Porta := Cmd.Params(0)

        else if Cmd.Metodo = 'temperatura' then
           Cmd.Resposta := IntToStr( Temperatura )

        else if Cmd.Metodo = 'settemperatura' then
           Temperatura := StrToInt( Cmd.Params(0) )

        else if Cmd.Metodo = 'avanco' then
           Cmd.Resposta := IntToStr( Avanco )

        else if Cmd.Metodo = 'setavanco' then
           Avanco := StrToInt( Cmd.Params(0) )

        else if Cmd.Metodo = 'imprimirtexto' then
        begin
           ImprimirTexto(
                         TACBrETQOrientacao(StrToInt(Cmd.Params(0))), { Orientacao }
                         StrToInt(Cmd.Params(1)),                { Fonte }
                         StrToChr(Trim(Cmd.Params(2)),1),        { MultiplicadorH }
                         StrToChr(Trim(Cmd.Params(3)),1),        { MultiplicadorV }
                         StrToInt(Cmd.Params(4)),                { Vertical }
                         StrToInt(Cmd.Params(5)),                { Horizontal }
                         Cmd.Params(6),                          { Texto }
                         StrToInt(Cmd.Params(7))                 { Subfonte }
                         );
        end

        else if Cmd.Metodo = 'imprimirbarras' then
           ImprimirBarras(
                         TACBrETQOrientacao(StrToInt(Cmd.Params(0))), { Orientacao }
                         StrToChr(Trim(Cmd.Params(1)),1),        { TipoBarras }
                         StrToChr(Trim(Cmd.Params(2)),1),        { LarguraBarraLarga }
                         StrToChr(Trim(Cmd.Params(3)),1),        { LarguraBarraFina }
                         StrToInt(Cmd.Params(4)),                { Vertical }
                         StrToInt(Cmd.Params(5)),                { Horizontal }
                         Cmd.Params(6),                          { Texto }
                         StrToInt(Cmd.Params(7)))                { AlturaCodBarras }

        else if Cmd.Metodo = 'imprimirlinha' then
           ImprimirLinha(StrToInt(Cmd.Params(0)),   {Vertical}
                         StrToInt(Cmd.Params(1)),   {Horizontal}
                         StrToInt(Cmd.Params(2)),   {Largura}
                         StrToInt(Cmd.Params(3)))   {Altura}

        else if Cmd.Metodo = 'imprimircaixa' then
           ImprimirCaixa(StrToInt(Cmd.Params(0)),   {Vertical}
                         StrToInt(Cmd.Params(1)),   {Horizontal}
                         StrToInt(Cmd.Params(2)),   {Largura}
                         StrToInt(Cmd.Params(3)),   {Altura}
                         StrToInt(Cmd.Params(4)),   {EspessuraVertical}
                         StrToInt(Cmd.Params(5)))   {EspessuraHorizontal}

        else if Cmd.Metodo = 'imprimir' then
           Imprimir(StrToInt(Cmd.Params(0)),   {Copias}
                    StrToInt(Cmd.Params(1)))   {AvancoEtq}

        ELSE
           raise Exception.Create('Comando inv�lido ('+Cmd.Comando+')') ;

     finally
     {$IFNDEF CONSOLE}FrmACBrMonitor.{$ELSE}dm.{$ENDIF}DISWorking := False ;
     end ;
  end ;
end ;

end.

