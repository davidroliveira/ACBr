{ **************************************************************************** }
{ Projeto: Componentes ACBr                                                    }
{ Biblioteca multiplataforma de componentes Delphi para interação com equipa-  }
{ mentos de Automação Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2009 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:   Italo Jurisato Junior                         }
{                                                                              }
{ Você pode obter a última versão desse arquivo na pagina do  Projeto ACBr     }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{ Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la  }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }
{                                                                              }
{ Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM    }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU      }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)              }
{                                                                              }
{ Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto }
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,  }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Você também pode obter uma copia da licença em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Simões de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{ Praça Anita Costa, 34 - Tatuí - SP - 18270-410                               }
{                                                                              }
{ **************************************************************************** }

{*******************************************************************************
|* Historico
|*
|* 20/06/2017: Italo Jurisato Junior
|*  - Doação do componente para o Projeto ACBr
*******************************************************************************}

{$I ACBr.inc}

unit pcnDPSConsts;

interface

uses
  SysUtils;

const
  NAME_SPACE_DPS = 'xmlns="http://www.sped.fazenda.gov.br/nfse"';

  DSC_VERAPLIC = 'Versão da Aplicação';
  DSC_NDPS = 'Numero do DPS';
  DSC_DCOMPET = 'Data da Competencia';
  DSC_TPEMIT = 'Tipo de Emitente';
  DSC_NIF = 'Número de Identificação Fiscal';
  DSC_CHSUBSTDA = 'Chave Substituida';
  DSC_CMOTIVO = 'Código do Motivo';
  DSC_XMOTIVO = 'Descrição do Motivo';
  DSC_CMUNPRESTACAO = 'Código do Municipio da Prestação do Serviço';
  DSC_CPAISPRESTACAO = 'Código do Pais da Prestação do Serviço';
  DSC_CTRIBNAC = 'Código de Tributação Nacional';
  DSC_CTRIBMUN = 'Código de Tributação Municipal';
  DSC_XDESCSERV = 'Descrição do Serviço';
  DSC_CNBS = 'Código NBS';
  DSC_VRECEB = 'Valor Recebido';
  DSC_VSERV = 'Valor do Serviço';
  DSC_IDDOCTEC = 'Identificador de Documento';
  DSC_DOCREF = 'Documento de Referencia';
  DSC_XINFCOMP = 'Informações Complementares';
  DSC_DTINI = 'Data de Inicio';
  DSC_DTFIM = 'Data de Fim';
  DSC_MDPRESTACAO = 'Modo de Prestação';
  DSC_TPMOEDA = 'Tipo de Moeda';
  DSC_VSERVMOEDA = 'Valor do Serviço Prestado';
  DSC_ENQUADRVS = 'Enquadramento RVS';
  DSC_ENQUADRPC = 'Enquadramento RPC';
  DSC_MOVTEMPBENS = 'Movimentação temporaria de Bens';
  DSC_NDI = 'Numero da Declaração de Importação';
  DSC_NRE = 'Numero do Registro de Exportação';
  DSC_MDIC = 'Indicador Disponibilizada ao MDIC';
  DSC_NEIXOS = 'Numero de Eixos';
  DSC_SENTIDO = 'Orientação de passagem do veículo';
  DSC_DESC = 'Descrição do Evento';
  DSC_ID = 'Código Identificador de Evento';
  DSC_COBRA = 'Código da Obra';
  DSC_INSCIMOBFISC = 'Inscrição Imobiliária Fiscal';
  DSC_VDR = 'Valor da Dedução';
  DSC_PDR = 'Percentual da Dedução';
  DSC_CHNFSE = 'Chave da NFS-e';
  DSC_CHNFE = 'Chave da NF-e';
  DSC_CMUNNOTA = 'Código do Municipio emissor da nota';
  DSC_NNOTA = 'Numero da nota';
  DSC_CVNOTA = 'Código de Verificação da nota';
  DSC_NNFS = 'Numero da Nota Fiscal';
  DSC_MODNFS = 'Modelo da Nota Fiscal';
  DSC_SERIENFS = 'Serie da Nota Fiscal';
  DSC_OUTDOCFISC = 'Numero de Documento Fiscal';
  DSC_OUTDOC = 'Numero de Documento não Fiscal';
  DSC_IDEDEFRED = 'Identificação da Dedução/Redução';
  DSC_XDESCOUT = 'Descrição da Dedução/Redução';
  DSC_VDEDRED = 'Valor Dedutivel/Redutivel';
  DSC_VDEDUCREDUC = 'Calor da Dedução/Redução';
  DSC_OPSIMPNAC = 'Situação perante o Simples Nacional';
  DSC_OPLIMMEI = 'Opção para MEI';
  DSC_OPLIMSIMPNAC = 'Opção para Simples Nacional';
  DSC_REGESPTRIB = 'Regimes Especiais de Tributação';
  DSC_EXIGISSQN = 'Exigibilidade do ISSQN';
  DSC_NBMISENC = 'Identificação da Lei';
  DSC_VINFOBM = 'Valor Informado para redução de BC';
  DSC_TPIMUNIDADE = 'Tipo de Imunidade';
  DSC_PALIQUOTA = 'Percentual de Aliquota';
  DSC_TPRETISSQN = 'Tipo de Retenção do ISSQN';
  DSC_VBCPISCOFINS = 'Valor da BC do Pis Cofins';
  DSC_PALIPIS = 'Percentual da Aliquota do PIS';
  DSC_PALICOFINS = 'Percentual da Aliquota do COFINS';
  DSC_TPRETPISCOFINS = 'Tipo de Retenção do Pis Cofins';
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

