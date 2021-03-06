{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera??o com equipa- }
{ mentos de Automa??o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados(c)2007  Jo?o Carvalho - SIGData Solu??es em TI  }
{                                                                              }
{ Colaboradores nesse arquivo: Daniel Simoes de Almeida                        }
{                                                                              }
{  Voc? pode obter a ?ltima vers?o desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{  Esta biblioteca ? software livre; voc? pode redistribu?-la e/ou modific?-la }
{ sob os termos da Licen?a P?blica Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a vers?o 2.1 da Licen?a, ou (a seu crit?rio) }
{ qualquer vers?o posterior.                                                   }
{                                                                              }
{  Esta biblioteca ? distribu?da na expectativa de que seja ?til, por?m, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia impl?cita de COMERCIABILIDADE OU      }
{ ADEQUA??O A UMA FINALIDADE ESPEC?FICA. Consulte a Licen?a P?blica Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICEN?A.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Voc? deve ter recebido uma c?pia da Licen?a P?blica Geral Menor do GNU junto}
{ com esta biblioteca; se n?o, escreva para a Free Software Foundation, Inc.,  }
{ no endere?o 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Voc? tamb?m pode obter uma copia da licen?a em:                              }
{ http://www.opensource.org/licenses/gpl-license.php                           }
{                                                                              }
{ Daniel Sim?es de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Pra?a Anita Costa, 34 - Tatu? - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{******************************************************************************
|* Historico
|*
|* 09/06/2008:  Jo?o Carvalho - SIGData Solu??es em TI
|* - Primeira Versao: Cria?ao e Distribui?ao da Primeira Versao
******************************************************************************}

{$I ACBr.inc}

unit ACBrConsts;

interface

{$IFNDEF COMPILER6_UP}
Uses ACBrD5, Windows ;
{$ENDIF}

const
  {* Unit ACBrBase *}
  ACBR_VERSAO = '0.9.0b';
  CR = #13 ;      { Carriage Return, retorno de carro }
  LF = #10 ;      { Line Feed, Pulo de Linha }
  FF = #12 ;      { Form Feed, Pulo de Pagina }
  cTimeout = 3 ;  { Tempo PADRAO para msg de falha de comunicacao }

  cACBrDeviceAtivarPortaException    = 'Porta n?o definida' ;
  cACBrDeviceAtivarException         = 'Erro abrindo: %s ' + sLineBreak +' %s ' ;
  cACBrDeviceSetBaudException        = 'Valor deve estar na faixa de 50 a 4000000.'+#10+
                                       'Normalmente os equipamentos Seriais utilizam: 9600' ;
  cACBrDeviceSetDataException        = 'Valor deve estar na faixa de 5 a 8.'+#10+
                                       'Normalmente os equipamentos Seriais utilizam: 7 ou 8' ;
  cACBrDeviceSetPortaException       = 'N?o ? poss?vel mudar a Porta com o Dispositivo Ativo' ;
  cACBrDeviceEnviaStrThreadException = 'Erro gravando em: %s ' ;


  {* Unit ACBrECFClass *}
  cACBrTempoInicioMsg                  = 3 ;  { Tempo para iniciar a exibi?ao da mensagem Aguardando a Resposta da Impressora' }
  cACBrMsgAguardando                   = 'Aguardando a resposta da Impressora: %d segundos' ;
  cACBrMsgTrabalhando                  = 'Impressora est? trabalhando' ;
  cACBrMsgPoucoPapel                   = 30 ; {Exibe alerta de Pouco Papel somente a cada 30 segundos}
  cACBrMsgRelatorio                    = 'Imprimindo %s  %d? Via ' ;
  cACBrPausaRelatorio                  = 5 ;
  cACBrMsgPausaRelatorio               = 'Destaque a %d? via, <ENTER> proxima, %d seg.';
  cACBrLinhasEntreCupons               = 7 ;
  cACBrMaxLinhasBuffer                 = 0 ;
  cACBrIntervaloAposComando            = 100 ; { Tempo em milisegundos a esperar apos o termino de EnviaComando }
  cACBrECFAliquotaSetTipoException     = 'Valores v?lidos para TACBrECFAliquota.Tipo: "T" - ICMS ou "S" - ISS' ;
  cACBrECFConsumidorCPFCNPJException   = 'CPF/CNPJ N?o informado' ;
  cACBrECFConsumidorNomeException      = 'Para informar o Endere?o ? necess?rio informar o Nome' ;
  cACBrECFClassCreateException         = 'Essa Classe deve ser instanciada por TACBrECF' ;
  cACBrECFNaoInicializadoException     = 'Componente ACBrECF n?o est? Ativo' ;
  cACBrECFOcupadoException             = 'Componente ACBrECF ocupado' + sLineBreak +
                                         'Aguardando resposta do comando anterior' ;
  cACBrECFSemRespostaException         = 'Impressora %s n?o est? respondendo' ;
  cACBrECFCmdSemRespostaException      = 'Comandos n?o est?o sendo enviados para Impressora %s ' ;
  cACBrECFEnviaCmdSemRespostaException = 'Erro ao enviar comandos para a Impressora %s ' ;
  cACBrECFDoOnMsgSemRespostaRetentar   = 'A impressora %s n?o est? repondendo.' ;
  cACBrECFVerificaFimLeituraException  = 'Erro Function VerificaFimLeitura n?o implementada em %s ' ;
  cACBrECFVerificaEmLinhaMsgRetentar   = 'A impressora %s n?o est? pronta.' ;
  cACBrECFVerificaEmLinhaException     = 'Impressora %s n?o est? em linha' ;
  cACBrECFPodeAbrirCupomRequerX        = 'A impressora %s requer Leitura X todo inicio de dia.'+#10+
                                         ' Imprima uma Leitura X para poder vender' ;
  cACBrECFPodeAbrirCupomRequerZ        = 'Redu??o Z de dia anterior n?o emitida.'+#10+
                                         ' Imprima uma Redu??o Z para poder vender' ;
  cACBrECFPodeAbrirCupomBloqueada      = 'Redu?ao Z de hoje j? emitida, ECF bloqueado at? as 00:00' ;
  cACBrECFPodeAbrirCupomCFAberto       = 'Cupom Fiscal aberto' ;
  cACBrECFPodeAbrirCupomNaoAtivada     = 'Impressora nao foi Inicializada (Ativo = false)' ;
  cACBrECFPodeAbrirCupomEstado         = 'Estado da impressora %s  ? '+sLineBreak+' %s (n?o ? Livre) ' ;
  cACBrECFAbreGavetaException          = 'A Impressora %s n?o manipula Gavetas' ;
  cACBrECFImpactoAgulhasException      = 'A Impressora %s n?o permite ajustar o Impacto das Agulhas' ;
  cACBrECFImprimeChequeException       = 'Rotina de Impress?o de Cheques n?o implementada para '+
                                         'Impressora %s ';
  cACBrECFLeituraCMC7Exception         = 'Rotina de Leitura de CMC7 de Cheques n?o implementada para '+
                                         'Impressora %s ';
  cACBrECFAchaCNFException             = 'N?o existe nenhum Comprovante N?o Fiscal '+
                                         'cadastrado como: "%s" ' ;
  cACBrECFAchaFPGException             = 'N?o existe nenhuma Forma de Pagamento '+
                                         'cadastrada como: "%s" ' ;
  cACBrECFCMDInvalidoException         = 'Procedure: %s '+ sLineBreak +
                                         ' n?o implementada para a Impressora: %s'+sLineBreak + sLineBreak +
                                         'Ajude no desenvolvimento do ACBrECF. '+ sLineBreak+
                                         'Acesse nosso Forum em: http://acbr.sf.net/' ;
  cACBrECFDoOnMsgPoucoPapel            = 'Detectado pouco papel' ;
  cACBrECFDoOnMsgRetentar              = 'Deseja tentar novamente ?' ;
  cACBrECFAchaICMSAliquotaInvalida     = 'Aliquota inv?lida: ' ;
  cACBrECFAchaICMSCMDInvalido          = 'Aliquota n?o encontrada: ' ;
  cACBrECFAbrindoRelatorioGerencial    = 'Abrindo Relat?rio Gerencial, aguarde %d seg' ;
  cACBrECFFechandoRelatorioGerencial   = 'Fechando Relat?rio Gerencial' ;
  cACBrECFFormMsgDoProcedureException  = 'Erro. Chamada recurssiva de FormMsgDoProcedure' ;


  {* Unit ACBrECF *}
  cACBrECFSetModeloException             = 'N?o ? poss?vel mudar o Modelo com o ECF Ativo' ;
  cACBrECFModeloNaoDefinidoException     = 'Modelo n?o definido' ;
  cACBrECFModeloBuscaPortaException      = 'Modelo: %s n?o consegue efetuar busca autom?tica de Porta'+sLineBreak+
                                           'Favor definir a Porta Ex: (COM1, LPT1, /dev/lp0, etc)' ;
  cACBrECFMsgDoAcharPorta                = 'Procurando por ECF: %s na porta: %s ' ;
  cACBrECFSetDecimaisPrecoException      = 'Valor de DecimaisPreco deve estar entre 0-3' ;
  cACBrECFSetDecimaisQtdException        = 'Valor de DecimaisQtd deve estar entre 0-4' ;
  cACBrECFVendeItemQtdeException         = 'Quantidade deve ser superior a 0.' ;
  cACBrECFVendeItemValorUnitException    = 'Valor Unitario deve ser superior a 0.' ;
  cACBrECFVendeItemDescAcreException     = 'ValorDescontoAcrescimo n?o pode ser negativo' ;
  cACBrECFVendeItemAliqICMSException     = 'Aliquota de ICMS n?o pode ser vazia.' ;
  cACBrECFAchaFPGIndiceException         = 'Forma de Pagamento: %s inv?lida' ;
  cACBrECFFPGPermiteVinculadoException   = 'Forma de Pagamento: %s '+#10+
                                           'n?o permite Cupom Vinculado' ;
  cACBrECFRegistraItemNaoFiscalException = 'Comprovante n?o fiscal: %s inv?lido' ;
  cACBrECFSetRFDException                = 'N?o ? poss?vel mudar ACBrECF.RFD com o componente ativo' ;

implementation

end.
