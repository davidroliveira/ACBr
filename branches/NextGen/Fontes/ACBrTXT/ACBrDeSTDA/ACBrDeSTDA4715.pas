{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera??o com equipa- }
{ mentos de Automa??o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2015   Jo?o Pedro R Costa                   }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
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
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Hw Sistemas e Computadores Ltda -  contato@hwsistemas.com.br                 }
{ www.hwsistemas.com.br - joaopedro@hwsistemas.com.br                          }
{              Rua Mogno, 236 - Governado Valadares - MG - 35065-019           }
{                                                                              }
{******************************************************************************}

unit ACBrDeSTDA4715;

interface

uses SysUtils, Classes, DateUtils, ACBrTXTClass;

type
  TWriteRegistroEvent = procedure(var ALinha: AnsiString) of object;

  EACBrDeSTDAException = class(Exception);

  { TACBrDeSTDA4715 }

  TACBrDeSTDA4715 = class(TACBrTXTClass)
  private
    FDT_INI: TDateTime;  /// Data inicial das informa??es contidas no arquivo
    FDT_FIN: TDateTime;  /// Data final das informa??es contidas no arquivo
    FGravado: Boolean;
  public
    property DT_INI : TDateTime read FDT_INI  write FDT_INI;
    property DT_FIN : TDateTime read FDT_FIN  write FDT_FIN;
    property Gravado: Boolean   read FGravado write FGravado ;
  end;

implementation

end.
