{******************************************************************************}
{ Projeto: Componente ACBrNFe                                                  }
{  Biblioteca multiplataforma de componentes Delphi para emiss�o de Nota Fiscal}
{ eletr�nica - NFe - http://www.nfe.fazenda.gov.br                          }
{                                                                              }
{ Direitos Autorais Reservados (c) 2008 Wemerson Souto                         }
{                                       Daniel Simoes de Almeida               }
{                                       Andr� Ferreira de Moraes               }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do Projeto ACBr     }
{ Componentes localizado em http://www.sourceforge.net/projects/acbr           }
{                                                                              }
{                                                                              }
{  Esta biblioteca � software livre; voc� pode redistribu�-la e/ou modific�-la }
{ sob os termos da Licen�a P�blica Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a vers�o 2.1 da Licen�a, ou (a seu crit�rio) }
{ qualquer vers�o posterior.                                                   }
{                                                                              }
{  Esta biblioteca � distribu�da na expectativa de que seja �til, por�m, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia impl�cita de COMERCIABILIDADE OU      }
{ ADEQUA��O A UMA FINALIDADE ESPEC�FICA. Consulte a Licen�a P�blica Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICEN�A.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral Menor do GNU junto}
{ com esta biblioteca; se n�o, escreva para a Free Software Foundation, Inc.,  }
{ no endere�o 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Voc� tamb�m pode obter uma copia da licen�a em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Sim�es de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Pra�a Anita Costa, 34 - Tatu� - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{******************************************************************************
|* Historico
|*
|* 16/12/2008: Wemerson Souto
|*  - Doa��o do componente para o Projeto ACBr
|* 09/03/2009: Dulcemar P. Zilli
|*  - Incluido IPI e II
|* 23/04/2009: Dulcemar P. Zilli
|*  - Alterada Tabela Unidades da Federa��o, incluida EX p/ oper. com exterior
******************************************************************************}
unit ACBrNFeConst;

interface

uses
  Classes;

const
  NfVersao        = '1.0.0.0';
  NFecabMsg       = '1.02';
  NFeconsStatServ = '1.07';
  NFenviNFe       = '1.10';
  NFeconsReciNFe  = '1.10';
  NFeconsSitNFe   = '1.07';
  NFecancNFe      = '1.07';
  NFeinutNFe      = '1.07';

  ColTitulo      = 0;
  ColImprimir    = 1;
  ColLinha       = 2;
  ColColuna      = 3;
  ColTamanho     = 4;
  ColAlinhamento = 5;
  ColName        = 6;

  ColDadoProdutoTitulo      = 0;
  ColDadoProdutoImprimir    = 1;
  ColDadoProdutoColuna      = 2;
  ColDadoProdutoTamanho     = 3;
  ColDadoProdutoAlinhamento = 4;
  ColDadoProdutoName        = 5;

  LineBreak = #13#10;

  NFeCSTICMS: array[0..10] of String = ('00','10','20','30','40','41','50','51','60','70','90');
  NFeSituacaoTributariaICMS: array[0..10] of String =
  ('ICMS 00 - Tributada integramente',
   'ICMS 10 - Tributada com cobran�a do ICMS por substitui��o tribut�ria',
   'ICMS 20 - Com redu��o na Base de c�lculo',
   'ICMS 30 - Isenta ou n�o tributada e com cobran�a do ICMS por substitui��o tribut�ria',
   'ICMS 40 - Isenta',
   'ICMS 41 - N�o tributada',
   'ICMS 50 - Suspens�o',
   'ICMS 51 - Deferimento',
   'ICMS 60 - Cobrado anteriormente por substitui��o tribut�ria',
   'ICMS 70 - Com redu��o da base de c�lculo e cobran�a do ICMS por substitui��o tribut�ria',
   'ICMS 90 - Outras');

  NFeCSTPIS: array[0..8] of String = ('01','02','03','04','06','07','08','09','99');
  NFeSituacaoTributariaPIS: array[0..8] of String =
  ('01 - Opera��o Tribut�vel - Base de C�culo  = Valor da Opera��o Al�quota Normal(Cumulativo/N�o Cumulativo)',
   '02 - Opera��o Tribut�vel - Base de C�culo  = Valor da Opera��o (Al�quota Diferenciada)',
   '03 - Opera��o Tribut�vel - Base de C�culo  = Quantidade Vendida x Al�quota por Unidade de Produto',
   '04 - Opera��o Tribut�vel - Tributa��o Monof�sica - (Al�quota Zero)',
   '06 - Opera��o Tribut�vel - Al�quota Zero',
   '07 - Opera��o Isenta da Contribui��o',
   '08 - Opera��o sem Incid�ncia da Contribui��o',
   '09 - Opera��o com Suspens�o da Contribui��o',
   '99 - Outras Opera��es');

  NFeCSTCOFINS: array[0..8] of String = ('01','02','03','04','06','07','08','09','99');
  NFeSituacaoTributariaCOFINS: array[0..8] of String =
  ('01 - Opera��o Tribut�vel - Base de C�culo  = Valor da Opera��o Al�quota Normal(Cumulativo/N�o Cumulativo)',
   '02 - Opera��o Tribut�vel - Base de C�culo  = Valor da Opera��o (Al�quota Diferenciada)',
   '03 - Opera��o Tribut�vel - Base de C�culo  = Quantidade Vendida x Al�quota por Unidade de Produto',
   '04 - Opera��o Tribut�vel - Tributa��o Monof�sica - (Al�quota Zero)',
   '06 - Opera��o Tribut�vel - Al�quota Zero',
   '07 - Opera��o Isenta da Contribui��o',
   '08 - Opera��o sem Incid�ncia da Contribui��o',
   '09 - Opera��o com Suspens�o da Contribui��o',
   '99 - Outras Opera��es');

  NFeUF: array[0..27] of String =
  ('AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT','MS','MG','PA',
   'PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO','EX');
  NFeUFCodigo: array[0..27] of Integer =
  (12,27,16,13,29,23,53,32,52,21,51,50,31,15,25,41,26,22,33,24,43,11,14,42,35,28,17,99);

  NFeAmbiente: array[0..1] of String =
  ('Producao','Teste');
  NFeAmbienteCodigo: array[0..1] of Integer =
  (1,2);

  NFeFormaEmissao: array[0..2] of String =
  ('Normal on-line','Contingencia off-line','Contingencia SCAN');
  NFeFormaEmissaoCodigo: array[0..2] of Integer =
  (1,2,3);

  NFeOrigemMercadoria: array[0..2] of String =
  ('0 - Nacional','1 - Estrangeira - Importa��o direta','2 - Estrangeira - Adquirida no mercado interno');
  NFeOrigemMercadoriaCodigo: array[0..2] of Integer =
  (0,1,2);

  NFeModalidadeICMS: array[0..3] of String =
  ('0 - Margem Valor Agregado(%)','1 - Pauta(Valor)','2 - Pre�o Tabelado M�x.(Valor)','3 - Valor da Opera��o');
  NFeModalidadeICMSCodigo: array[0..3] of Integer =
  (0,1,2,3);

  NFeModalidadeICMSST: array[0..5] of String =
  ('0 - Pre�o tabelado ou m�ximo sugerido','1 - Lista Negativa(Valor)','2 - Lista Positiva(Valor)',
   '3 - Lista Neutra(Valor)','4 - Margem Valor Agregado(%)','5 - Pauta(Valor)');
  NFeModalidadeICMSSTCodigo: array[0..5] of Integer =
  (0,1,2,3,4,5);

  NFeDANFE: array[0..1] of String =
  ('Retrato','Paisagem');
  NFeDANFECodigo: array[0..1] of Integer =
  (1,2);

  NFeXSDPath = '\Schemas\nfe_v1.10.xsd';
  NFePathReport = '\Report\NotaFiscalEletronica.rav';

  NFeCSTIPI: array[0..13] of String = ('00','01','02','03','04','05','49','50','51','52','53','54','55','99');
  NFeSituacaoTributariaIPI: array[0..13] of String =
  ('00 - Entrada com recupera��o de cr�dito',
   '01-Entrada tributada com al�quota zero',
   '02-Entrada isenta',
   '03-Entrada n�o-tributada',
   '04-Entrada imune',
   '05-Entrada com suspens�o',
   '49-Outras entradas',
   '50-Sa�da tributada',
   '51-Sa�da tributada com al�quota zero',
   '52-Sa�da isenta',
   '53-Sa�da n�o-tributada',
   '54-Sa�da imune',
   '55-Sa�da com suspens�o',
   '99-Outras sa�das');
   
implementation

end.
