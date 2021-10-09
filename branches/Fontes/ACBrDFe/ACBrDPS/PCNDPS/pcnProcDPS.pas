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

unit pcnProcDPS;

interface

uses
  SysUtils, Classes, pcnConversao, pcnGerador;

type

  TProcDPS = class(TPersistent)
  private
    FGerador: TGerador;
    FPathDPS: String;
    FPathRetConsReciDPS: String;
    FPathRetConsSitDPS: String;
    FtpAmb: TpcnTipoAmbiente;
    FverAplic: String;
    FchDPS: String;
    FdhRecbto: TDateTime;
    FnProt: String;
    FdigVal: String;
    FcStat: Integer;
    FxMotivo: String;
    FVersao: String;
    // Usando na Montagem do DPSProc
    FXML_DPS: String;
    FXML_prot: String;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    function GerarXML: Boolean;
  published
    property Gerador: TGerador          read FGerador;
    property PathDPS: String            read FPathDPS            write FPathDPS;
    property PathRetConsReciDPS: String read FPathRetConsReciDPS write FPathRetConsReciDPS;
    property PathRetConsSitDPS: String  read FPathRetConsSitDPS  write FPathRetConsSitDPS;
    property tpAmb: TpcnTipoAmbiente    read FtpAmb              write FtpAmb;
    property verAplic: String           read FverAplic           write FverAplic;
    property chDPS: String              read FchDPS              write FchDPS;
    property dhRecbto: TDateTime        read FdhRecbto           write FdhRecbto;
    property nProt: String              read FnProt              write FnProt;
    property digVal: String             read FdigVal             write FdigVal;
    property cStat: Integer             read FcStat              write FcStat;
    property xMotivo: String            read FxMotivo            write FxMotivo;
    property Versao: String             read FVersao             write FVersao;
    // Usando na Montagem do DPSProc
    property XML_DPS: String            read FXML_DPS            write FXML_DPS;
    property XML_prot: String           read FXML_prot           write FXML_prot;
  end;

implementation

uses
  pcnAuxiliar, pcnLeitor, ACBrUtil;

{ TProcDPS }

constructor TProcDPS.Create;
begin
  FGerador := TGerador.Create;
  FnProt   := '';
end;

destructor TProcDPS.Destroy;
begin
  FGerador.Free;
  inherited;
end;

function TProcDPS.GerarXML: Boolean;

  function PreencherTAG(const TAG: String; Texto: String): String;
  begin
    result := '<' + TAG + '>' + RetornarConteudoEntre(Texto, '<' + TAG + '>', '</' + TAG + '>') + '</' + TAG + '>';
  end;

var
  XMLDPS: TStringList;
  XMLinfProt: TStringList;
  XMLinfProt2: TStringList;
  wCstat: String;
  xProtDPS: String;
  nProtLoc: String;
  xUF: String;    
  LocLeitor: TLeitor;
  i: Integer;
  ProtLido: Boolean; //Protocolo lido do arquivo
begin
  XMLDPS      := TStringList.Create;
  XMLinfProt  := TStringList.Create;
  XMLinfProt2 := TStringList.Create;
  Gerador.ListaDeAlertas.Clear;

  try
    if (FXML_DPS = '') and (FXML_prot = '') then
    begin
      ProtLido := False;
      xProtDPS := '';

      // Arquivo DPS
      if not FileExists(FPathDPS) then
        Gerador.wAlerta('XR04', 'DPS', 'DPS', ERR_MSG_ARQUIVO_NAO_ENCONTRADO)
      else
        XMLDPS.LoadFromFile(FPathDPS);

      FchDPS := RetornarConteudoEntre(XMLDPS.Text, 'Id="DPS', '"');

      if trim(FchDPS) = '' then
        Gerador.wAlerta('XR01', 'ID/DPS', 'Numero da chave do DPS', ERR_MSG_VAZIO);

      if (FPathRetConsReciDPS = '') and (FPathRetConsSitDPS = '') then
      begin
        if (FchDPS = '') and (FnProt = '') then
          Gerador.wAlerta('XR06', 'RECIBO/SITUAÇÃO', 'RECIBO/SITUAÇÃO', ERR_MSG_ARQUIVO_NAO_ENCONTRADO)
        else
          ProtLido := True;
      end;

      // Gerar arquivo pelo Recibo da DPS                                       //
      if (FPathRetConsReciDPS <> '') and (FPathRetConsSitDPS = '') and (not ProtLido) then
      begin
        if not FileExists(FPathRetConsReciDPS) then
          Gerador.wAlerta('XR06', 'PROTOCOLO', 'PROTOCOLO', ERR_MSG_ARQUIVO_NAO_ENCONTRADO)
        else
        begin
          I := 0;
          LocLeitor := TLeitor.Create;
          try
            LocLeitor.CarregarArquivo(FPathRetConsReciDPS);
            while LocLeitor.rExtrai(1, 'protDPS', '', i + 1) <> '' do
            begin
              if LocLeitor.rCampo(tcStr, 'chDPS') = FchDPS then
                FnProt := LocLeitor.rCampo(tcStr, 'nProt');

              if trim(FnProt) = '' then
                Gerador.wAlerta('XR01', 'PROTOCOLO/DPS', 'Numero do protocolo', ERR_MSG_VAZIO)
              else
              begin
                xProtDPS := LocLeitor.rExtrai(1, 'protDPS', '', i + 1); // +'</protDPS>';
                Gerador.ListaDeAlertas.Clear;
                break;
              end;

              inc(I);
            end;
          finally
            LocLeitor.Free;
          end;
        end;
      end;

      // Gerar arquivo pelo arquivo de consulta da situação do DPS              //
      if (FPathRetConsReciDPS = '') and (FPathRetConsSitDPS <> '') and (not ProtLido) then
      begin
        if not FileExists(FPathRetConsSitDPS) then
          Gerador.wAlerta('XR06', 'SITUAÇÃO', 'SITUAÇÃO', ERR_MSG_ARQUIVO_NAO_ENCONTRADO)
        else
        begin
          XMLinfProt.LoadFromFile(FPathRetConsSitDPS);

          wCstat := RetornarConteudoEntre(XMLinfProt.text, '<cStat>', '</cStat>');

          if ((trim(wCstat) = '101') or
              (trim(wCstat) = '151') or
              (trim(wCstat) = '155')) then //esta cancelado
            XMLinfProt2.Text := RetornarConteudoEntre(XMLinfProt.text, '<infCanc', '</infCanc>')
          else
            XMLinfProt2.Text := RetornarConteudoEntre(XMLinfProt.text, '<infProt', '</infProt>');

          nProtLoc := RetornarConteudoEntre(XMLinfProt2.text, '<nProt>', '</nProt>');

          xProtDPS := '<protDPS versao="' + Versao + '">' +
                       '<infProt Id="ID'+ nProtLoc +'">' +
                        PreencherTAG('tpAmb', XMLinfProt.text) +
                        PreencherTAG('verAplic', XMLinfProt.text) +
                        PreencherTAG('chDPS', XMLinfProt.text) +
                        PreencherTAG('dhRecbto', XMLinfProt2.text) +
                        PreencherTAG('nProt', XMLinfProt2.text) +
                        PreencherTAG('digVal', XMLinfProt.text) +
                        PreencherTAG('cStat', XMLinfProt.text) +
                        PreencherTAG('xMotivo', XMLinfProt.text) +
                       '</infProt>' +
                      '</protDPS>';
        end;
      end;

      if ProtLido then
      begin
        if Copy(FverAplic, 1, 2) = 'SV' then
          xUF := CodigoParaUF(StrToIntDef(Copy(FchDPS, 1, 2), 0))
        else
          xUF := Copy(FverAplic, 1, 2);

        xProtDPS := '<protDPS versao="' + Versao + '">' +
                     '<infProt Id="' + IIf( Pos('ID', FnProt) > 0, FnProt, 'ID' + FnProt ) + '">' +
                      '<tpAmb>' + TpAmbToStr(FtpAmb) + '</tpAmb>' +
                      '<verAplic>' + FverAplic + '</verAplic>' +
                      '<chDPS>' + FchDPS + '</chDPS>' +
                      '<dhRecbto>' + FormatDateTime('yyyy-mm-dd"T"hh:nn:ss', FdhRecbto) +
                                     GetUTC(xUF, FdhRecbto) + '</dhRecbto>' +
                      '<nProt>' + FnProt + '</nProt>' +
                      '<digVal>' + FdigVal + '</digVal>' +
                      '<cStat>' + IntToStr(FcStat) + '</cStat>' +
                      '<xMotivo>' + FxMotivo + '</xMotivo>' +
                     '</infProt>' +
                    '</protDPS>';
      end;

      FXML_DPS := XMLDPS.Text;
      FXML_prot := xProtDPS;
    end;

    // Gerar arquivo
    if (Gerador.ListaDeAlertas.Count = 0) and
       (FXML_DPS <> '') and (FXML_prot <> '') then
    begin
      Gerador.ArquivoFormatoXML := '';
      Gerador.wGrupo(ENCODING_UTF8, '', False);
//      Gerador.wGrupo('DPSProc versao="' + Versao + '" ' + NAME_SPACE_DPS, '');
      Gerador.wTexto('<DPS xmlns' + RetornarConteudoEntre(FXML_DPS, '<DPS xmlns', '</DPS>') + '</DPS>');
      Gerador.wTexto(FXML_prot);
      Gerador.wGrupo('/DPSProc');
    end;

    Result := (Gerador.ListaDeAlertas.Count = 0);
  finally
    XMLDPS.Free;
    XMLinfProt.Free;
    XMLinfProt2.Free;
  end;
end;

procedure TProcDPS.Assign(Source: TPersistent);
begin
  if Source is TProcDPS then
  begin
    PathDPS := TprocDPS(Source).PathDPS;
    PathRetConsReciDPS := TprocDPS(Source).PathRetConsReciDPS;
    PathRetConsSitDPS := TprocDPS(Source).PathRetConsSitDPS;
    tpAmb := TprocDPS(Source).tpAmb;
    verAplic := TprocDPS(Source).verAplic;
    chDPS := TprocDPS(Source).chDPS;
    dhRecbto := TprocDPS(Source).dhRecbto;
    nProt := TprocDPS(Source).nProt;
    digVal := TprocDPS(Source).digVal;
    cStat := TprocDPS(Source).cStat;
    xMotivo := TprocDPS(Source).xMotivo;
    Versao := TprocDPS(Source).Versao;
    XML_DPS := TprocDPS(Source).XML_DPS;
    XML_prot := TprocDPS(Source).XML_prot;
  end
  else
    inherited;
end;

end.

