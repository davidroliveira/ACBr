{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para interação com equipa- }
{ mentos de Automação Comercial utilizados no Brasil                           }

{ Direitos Autorais Reservados (c) 2018 Daniel Simoes de Almeida               }

{ Colaboradores nesse arquivo: Rafael Teno Dias                                }

{  Você pode obter a última versão desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }

{  Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }

{  Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU      }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)              }

{  Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto}
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,  }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Você também pode obter uma copia da licença em:                              }
{ http://www.opensource.org/licenses/gpl-license.php                           }

{ Daniel Simões de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{        Rua Cel.Aureliano de Camargo, 973 - Tatuí - SP - 18270-170            }

{******************************************************************************}

{$I ACBr.inc}

unit ACBrLibGNReConsts;

interface

uses
  Classes, SysUtils;

const
  CLibGNReNome = 'ACBrLibGNRe';
  CLibGNReVersao = '0.0.1';

  CSessaoRespConsulta = 'STATUS';
  CSessaoRespEnvio    = 'ENVIO';

  CSessaoGuia = 'Guia';

  CChavePrintDialog = 'PrintDialog';
  CChaveUsarSeparadorPathPDF = 'UsarSeparadorPathPDF';
  CChaveFax = 'Fax';
  CChaveSistema = 'Sistema';
  CChaveSite = 'Site';
  CChaveTamanhoPapel = 'TamanhoPapel';

//  ErrValidacaoGNRe = -11;
//  ErrChaveGNRe = -12;
//  ErrAssinarGNRe = -13;
//  ErrConsulta = -14;
//  ErrCNPJ = -15;
  ErrRetorno = -16;
  ErrEnvio = -17;
//  ErrEnvioEvento = -18;

Resourcestring
  SInfGNReCarregados = '%d GNRe(s) Carregado(s)';

//  SErrChaveInvalida = 'Chave % inválida.';
//  SErrCNPJInvalido = 'CNPJ % inválido.';
//  SErrCNPJCPFInvalido = 'CNPJ/CPF % inválido.';

function SetRetornoGNReCarregados(const NumGNRe: Integer): Integer;

implementation

uses
  ACBrLibComum;

function SetRetornoGNReCarregados(const NumGNRe: Integer): Integer;
begin
  Result := SetRetorno( 0, {NumGNRe,} Format(SInfGNReCarregados, [NumGNRe]));
end;

end.

