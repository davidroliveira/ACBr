{ **************************************************************************** }
{ Projeto: Componentes ACBr                                                    }
{ Biblioteca multiplataforma de componentes Delphi para intera��o com equipa-  }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2009 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:   Italo Jurisato Junior                         }
{                                                                              }
{ Voc� pode obter a �ltima vers�o desse arquivo na pagina do  Projeto ACBr     }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{ Esta biblioteca � software livre; voc� pode redistribu�-la e/ou modific�-la  }
{ sob os termos da Licen�a P�blica Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a vers�o 2.1 da Licen�a, ou (a seu crit�rio) }
{ qualquer vers�o posterior.                                                   }
{                                                                              }
{ Esta biblioteca � distribu�da na expectativa de que seja �til, por�m, SEM    }
{ NENHUMA GARANTIA; nem mesmo a garantia impl�cita de COMERCIABILIDADE OU      }
{ ADEQUA��O A UMA FINALIDADE ESPEC�FICA. Consulte a Licen�a P�blica Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICEN�A.TXT ou LICENSE.TXT)              }
{                                                                              }
{ Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral Menor do GNU junto }
{ com esta biblioteca; se n�o, escreva para a Free Software Foundation, Inc.,  }
{ no endere�o 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Voc� tamb�m pode obter uma copia da licen�a em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Sim�es de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{ Pra�a Anita Costa, 34 - Tatu� - SP - 18270-410                               }
{                                                                              }
{ **************************************************************************** }

{*******************************************************************************
|* Historico
|*
|* 20/06/2017: Italo Jurisato Junior
|*  - Doa��o do componente para o Projeto ACBr
*******************************************************************************}

{$I ACBr.inc}

unit pcnDPSConsts;

interface

uses
  SysUtils;

const
  NAME_SPACE_DPS = 'xmlns="http://www.sped.fazenda.gov.br/nfse"';

  DSC_VERAPLIC = 'Vers�o da Aplica��o';
  DSC_NDPS = 'Numero do DPS';
  DSC_DCOMPET = 'Data da Competencia';
  DSC_TPEMIT = 'Tipo de Emitente';
  DSC_NIF = 'N�mero de Identifica��o Fiscal';
  DSC_CHSUBSTDA = 'Chave Substituida';
  DSC_CMOTIVO = 'C�digo do Motivo';
  DSC_XMOTIVO = 'Descri��o do Motivo';
  DSC_CMUNPRESTACAO = 'C�digo do Municipio da Presta��o do Servi�o';
  DSC_CPAISPRESTACAO = 'C�digo do Pais da Presta��o do Servi�o';
  DSC_CTRIBNAC = 'C�digo de Tributa��o Nacional';
  DSC_CTRIBMUN = 'C�digo de Tributa��o Municipal';
  DSC_XDESCSERV = 'Descri��o do Servi�o';
  DSC_CNBS = 'C�digo NBS';
  DSC_VRECEB = 'Valor Recebido';
  DSC_VSERV = 'Valor do Servi�o';
  DSC_IDDOCTEC = 'Identificador de Documento';
  DSC_DOCREF = 'Documento de Referencia';
  DSC_XINFCOMP = 'Informa��es Complementares';
  DSC_DTINI = 'Data de Inicio';
  DSC_DTFIM = 'Data de Fim';
  DSC_MDPRESTACAO = 'Modo de Presta��o';
  DSC_TPMOEDA = 'Tipo de Moeda';
  DSC_VSERVMOEDA = 'Valor do Servi�o Prestado';
  DSC_ENQUADRVS = 'Enquadramento RVS';
  DSC_ENQUADRPC = 'Enquadramento RPC';
  DSC_MOVTEMPBENS = 'Movimenta��o temporaria de Bens';
  DSC_NDI = 'Numero da Declara��o de Importa��o';
  DSC_NRE = 'Numero do Registro de Exporta��o';
  DSC_MDIC = 'Indicador Disponibilizada ao MDIC';
  DSC_NEIXOS = 'Numero de Eixos';
  DSC_SENTIDO = 'Orienta��o de passagem do ve�culo';
  DSC_DESC = 'Descri��o do Evento';
  DSC_ID = 'C�digo Identificador de Evento';
  DSC_COBRA = 'C�digo da Obra';
  DSC_INSCIMOBFISC = 'Inscri��o Imobili�ria Fiscal';
  DSC_VDR = 'Valor da Dedu��o';
  DSC_PDR = 'Percentual da Dedu��o';
  DSC_CHNFSE = 'Chave da NFS-e';
  DSC_CHNFE = 'Chave da NF-e';
  DSC_CMUNNOTA = 'C�digo do Municipio emissor da nota';
  DSC_NNOTA = 'Numero da nota';
  DSC_CVNOTA = 'C�digo de Verifica��o da nota';
  DSC_NNFS = 'Numero da Nota Fiscal';
  DSC_MODNFS = 'Modelo da Nota Fiscal';
  DSC_SERIENFS = 'Serie da Nota Fiscal';
  DSC_OUTDOCFISC = 'Numero de Documento Fiscal';
  DSC_OUTDOC = 'Numero de Documento n�o Fiscal';
  DSC_IDEDEFRED = 'Identifica��o da Dedu��o/Redu��o';
  DSC_XDESCOUT = 'Descri��o da Dedu��o/Redu��o';
  DSC_VDEDRED = 'Valor Dedutivel/Redutivel';
  DSC_VDEDUCREDUC = 'Calor da Dedu��o/Redu��o';
  DSC_OPSIMPNAC = 'Situa��o perante o Simples Nacional';
  DSC_OPLIMMEI = 'Op��o para MEI';
  DSC_OPLIMSIMPNAC = 'Op��o para Simples Nacional';
  DSC_REGESPTRIB = 'Regimes Especiais de Tributa��o';
  DSC_EXIGISSQN = 'Exigibilidade do ISSQN';
  DSC_NBMISENC = 'Identifica��o da Lei';
  DSC_VINFOBM = 'Valor Informado para redu��o de BC';
  DSC_TPIMUNIDADE = 'Tipo de Imunidade';
  DSC_PALIQUOTA = 'Percentual de Aliquota';
  DSC_TPRETISSQN = 'Tipo de Reten��o do ISSQN';
  DSC_VBCPISCOFINS = 'Valor da BC do Pis Cofins';
  DSC_PALIPIS = 'Percentual da Aliquota do PIS';
  DSC_PALICOFINS = 'Percentual da Aliquota do COFINS';
  DSC_TPRETPISCOFINS = 'Tipo de Reten��o do Pis Cofins';
  DSC_VRETCP = 'Valor do CP';
  DSC_VRETIRRF = 'Valor do IRRF';
  DSC_VRETCSLL = 'Valor do CSLL';
  DSC_VTOTTRIBFED = 'Valor Total Aproximado dos Tributos Federais';
  DSC_VTOTTRIBEST = 'Valor Total Aproximado dos Tributos Estaduais';
  DSC_VTOTTRIBMun = 'Valor Total Aproximado dos Tributos Municipais';
  DSC_PTOTTRIBFED = 'Percentual Aproximado dos Tributos Federais';
  DSC_PTOTTRIBEST = 'Percentual Aproximado dos Tributos Estaduais';
  DSC_PTOTTRIBMun = 'Percentual Aproximado dos Tributos Municipais';
  DSC_PTOTTRIBSN = 'Percentual Aproximado dos Tributos Simples Nacional';

implementation

end.

