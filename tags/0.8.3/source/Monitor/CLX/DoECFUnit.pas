{******************************************************************************}
{ Projeto: ACBr Monitor                                                        }
{  Executavel multiplataforma que faz uso do conjunto de componentes ACBr para }
{ criar uma interface de comunicação com equipamentos de automacao comercial.  }
{                                                                              }
{ Direitos Autorais Reservados (c) 2004 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Você pode obter a última versão desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{  Este é software livre; você pode redistribuí-lo e/ou modificá-lo            }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }
{                                                                              }
{  Este software é distribuído na expectativa de que seja útil, porém, SEM     }
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

{$DEFINE VisualCLX}
{$I ACBr.inc}

unit DoECFUnit ;

interface
Uses ACBrMonitor1 ;

Procedure DoECF( Cmd : TACBrCmd ) ;
Function PegaAliquotas : String ;

implementation
uses ACBrECF, ACBrUtil, SysUtils;

Procedure DoECF( Cmd : TACBrCmd ) ;
begin
  with FrmACBrMonitor.ACBrECF1 do
  begin
     try
        if Cmd.Metodo = 'ativar' then  { Ativa o ecf }
           Ativar

        else if Cmd.Metodo = 'desativar' then 
           Desativar

        else if Cmd.Metodo = 'ativo' then
           Cmd.Resposta := BoolToStr(Ativo) 

        else if Cmd.Metodo = 'colunas' then
           Cmd.Resposta := IntToStr( Colunas )

        else if Cmd.Metodo = 'comandoenviado' then
           Cmd.Resposta := ComandoEnviado

        else if Cmd.Metodo = 'respostacomando' then
           Cmd.Resposta := RespostaComando

        else if Cmd.Metodo = 'modelostr' then
           Cmd.Resposta := ModeloStr

        else if Cmd.Metodo = 'datahora' then
           Cmd.Resposta := FormatDateTime('dd/mm/yy hh:nn:ss', DataHora )

        else if Cmd.Metodo = 'numcupom' then
           Cmd.Resposta := NumCupom

        else if Cmd.Metodo = 'numloja' then
           Cmd.Resposta := NumLoja

        else if Cmd.Metodo = 'numcro' then
           Cmd.Resposta := NumCRO

        else if Cmd.Metodo = 'numecf' then
           Cmd.Resposta := NumECF

        else if Cmd.Metodo = 'numserie' then
           Cmd.Resposta := NumSerie

        else if Cmd.Metodo = 'numversao' then
           Cmd.Resposta := NumVersao

        else if (Cmd.Metodo = 'aliquotas') or
                (Cmd.Metodo = 'carregaaliquotas') then
           Cmd.Resposta := PegaAliquotas

        else if Cmd.Metodo = 'programaaliquota' then
            ProgramaAliquota( StringToFloatDef( Cmd.Params(0),0 ), {% Aliquota }
                              padL(Cmd.Params(1),1,'T')[1],  { Tipo: char(T, S)}
                              Cmd.Params(2) )                        { Posicao }

        else if Cmd.Metodo = 'testapodeabrircupom' then
           TestaPodeAbrirCupom

        else if Cmd.Metodo = 'abrecupom' then
           AbreCupom( Cmd.Params(0) )

        else if Cmd.Metodo = 'vendeitem' then
           VendeItem( Cmd.Params(0), Cmd.Params(1),Cmd.Params(2),{Cod,Desc,Aliq}
                      StringToFloatDef( Cmd.Params(3),0),                { Qtd }
                      StringToFloatDef( Cmd.Params(4),0),             { P.Unit }
                      StringToFloatDef( Cmd.Params(5),0),           { Descondo }
                      Cmd.Params(6) )                                     { Un }

        else if Cmd.Metodo = 'subtotalizacupom' then
           SubtotalizaCupom( StringToFloatDef( Cmd.Params(0),0) ) 

        else if Cmd.Metodo = 'efetuapagamento' then
           EfetuaPagamento( Cmd.Params(0),                 { CodFormaPagamento }
                            StringToFloatDef( Cmd.Params(1),0),        { Valor }
                            Cmd.Params(2),                        { Observacao }
                            StrToBoolDef( Cmd.Params(3),false)){ Imp.Vinculado }

        else if Cmd.Metodo = 'fechacupom' then
           FechaCupom( Cmd.Params(0) ) 

        else if Cmd.Metodo = 'cancelacupom' then
           CancelaCupom

        else if Cmd.Metodo = 'leiturax' then
           LeituraX

        else if Cmd.Metodo = 'reducaoz' then
           ReducaoZ( StrToDateTimeDef( Cmd.Params(0), now ) )

        else
           raise Exception.Create('Comando inválido ('+Cmd.Comando+')') ;

     finally
        if Length( Cmd.Resposta ) = 0 then
           Cmd.Resposta := RespostaComando ;
     end ;
  end ;
end ;

Function PegaAliquotas : String ;
Var I : Integer ;
begin
  Result := '' ;
  with FrmACBrMonitor.ACBrECF1 do
  begin
     if Aliquotas.Count < 1 then
        CarregaAliquotas ;
        
     for I := 0 to Aliquotas.Count -1 do
        Result := Result + '("'+Aliquotas[I].Indice +'","'+
                  FloatToStr(  Aliquotas[I].Aliquota ) + '","'+
                  Aliquotas[I].Tipo + '");' ;

     if Result <> '' then
        Result := '{' + copy(Result,1,Length(Result)-1) + '}' ;
  end ;
end ;
end.

