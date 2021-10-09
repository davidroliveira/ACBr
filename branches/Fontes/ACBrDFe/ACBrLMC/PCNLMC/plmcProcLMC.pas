{******************************************************************************}
{ Projeto: Componente ACBrLMC                                                 }
{  Biblioteca multiplataforma de componentes Delphi                            }
{                                                                              }
{  Você pode obter a última versão desse arquivo na pagina do Projeto ACBr     }
{ Componentes localizado em http://www.sourceforge.net/projects/acbr           }
{                                                                              }
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

{*******************************************************************************
|* Historico
|*
|* 20/07/2015: Italo Jurisato Junior
|*  - Doação do componente para o Projeto ACBr
*******************************************************************************}

{$I ACBr.inc}

unit plmcProcLMC;

interface

uses
  SysUtils, Classes,
  pcnAuxiliar, pcnConversao, pcnGerador, pcnLeitor, plmcConversao;

type

  TPcnPadraoNomeProcLMC = (tpnPublico, tpnPrivado);

  TProcLMC = class(TPersistent)
  private
    FGerador: TGerador;
    FPathLMC: String;
    FPathRetConsReciLMC: String;
    FPathRetConsSitLMC: String;
    FtpAmb: TpcnTipoAmbiente;
    FverAplic: String;
    FchLMC: String;
    FdhRecbto: TDateTime;
    FnProt: String;
    FdigVal: String;
    FcStat: Integer;
    FxMotivo: String;
    FVersao: String;
    FXML_LMC: String;
    FXML_prot: String;
  public
    constructor Create;
    destructor Destroy; override;
    function GerarXML: boolean;
    function ObterNomeArquivo(const PadraoNome: TPcnPadraoNomeProcLMC = tpnPrivado): String;
  published
    property Gerador: TGerador          read FGerador            write FGerador;
    property PathLMC: String            read FPathLMC            write FPathLMC;
    property PathRetConsReciLMC: String read FPathRetConsReciLMC write FPathRetConsReciLMC;
    property PathRetConsSitLMC: String  read FPathRetConsSitLMC  write FPathRetConsSitLMC;
    property tpAmb: TpcnTipoAmbiente    read FtpAmb              write FtpAmb;
    property verAplic: String           read FverAplic           write FverAplic;
    property chLMC: String              read FchLMC              write FchLMC;
    property dhRecbto: TDateTime        read FdhRecbto           write FdhRecbto;
    property nProt: String              read FnProt              write FnProt;
    property digVal: String             read FdigVal             write FdigVal;
    property cStat: Integer             read FcStat              write FcStat;
    property xMotivo: String            read FxMotivo            write FxMotivo;
    property Versao: String             read FVersao             write FVersao;
    // Usando na Montagem do LMCProc
    property XML_LMC: String            read FXML_LMC            write FXML_LMC;
    property XML_prot: String           read FXML_prot           write FXML_prot;
  end;

implementation

{ TProcLMC }

constructor TProcLMC.Create;
begin
  FGerador := TGerador.Create;
end;

destructor TProcLMC.Destroy;
begin
  FGerador.Free;
  inherited;
end;

function TProcLMC.ObterNomeArquivo(const PadraoNome: TPcnPadraoNomeProcLMC = tpnPrivado): String;
var
  s: String;
begin
  Result := FchLMC + '-procLMC.xml';
  if PadraoNome = tpnPublico then
  begin
    s := '00' + Versao;
    Result := FnProt + '_v' + copy(s, length(s) - 4, 5) + '-procLMC.xml';
  end;
end;

function TProcLMC.GerarXML: boolean;

function PreencherTAG(const TAG: String; Texto: String): String;
begin
  result := '<' + TAG + '>' + RetornarConteudoEntre(Texto, '<' + TAG + '>', '</' + TAG + '>') + '</' + TAG + '>';
end;

var
  XMLLMC: TStringList;
  XMLinfProt: TStringList;
  XMLinfProt2: TStringList;
  wCstat: String;
  xProtLMC: String;
  LocLeitor: TLeitor;
  i: Integer;
  ProtLido: Boolean; // Protocolo lido do Arquivo
begin
  XMLLMC := TStringList.Create;
  XMLinfProt := TStringList.Create;
  XMLinfProt2 := TStringList.Create;
  Gerador.ListaDeAlertas.Clear;

  try
    if (FXML_LMC = '') and (FXML_prot = '') then
    begin
      ProtLido := False;
      xProtLMC := '';
      FnProt := '';

      // Arquivo LMC
      if not FileExists(FPathLMC) then
        Gerador.wAlerta('XR04', 'LMC', 'LMC', ERR_MSG_ARQUIVO_NAO_ENCONTRADO)
      else
        XMLLMC.LoadFromFile(FPathLMC);

      FchLMC := RetornarConteudoEntre(XMLLMC.Text, 'Id="LMC', '"');
      if trim(FchLMC) = '' then
        Gerador.wAlerta('XR01', 'ID/LMC', 'Numero da chave do LMC', ERR_MSG_VAZIO);

      if (FPathRetConsReciLMC = '') and (FPathRetConsSitLMC = '') then
      begin
        if (FchLMC = '') and (FnProt = '') then
          Gerador.wAlerta('XR06', 'RECIBO/SITUAÇÃO', 'RECIBO/SITUAÇÃO', ERR_MSG_ARQUIVO_NAO_ENCONTRADO)
        else
          ProtLido := True;
      end;

      // Gerar arquivo pelo Recibo do LMC
      if (FPathRetConsReciLMC <> '') and (FPathRetConsSitLMC = '') and (not ProtLido) then
      begin
        if not FileExists(FPathRetConsReciLMC) then
          Gerador.wAlerta('XR06', 'PROTOCOLO', 'PROTOCOLO', ERR_MSG_ARQUIVO_NAO_ENCONTRADO)
        else begin
          I := 0;
          LocLeitor := TLeitor.Create;
          try
            LocLeitor.CarregarArquivo(FPathRetConsReciLMC);
            while LocLeitor.rExtrai(1, 'protLivroCombustivel', '', i + 1) <> '' do
            begin
              if LocLeitor.rCampo(tcStr, 'chLMC') = FchLMC then
                FnProt := LocLeitor.rCampo(tcStr, 'nProt');
              if trim(FnProt) = '' then
                Gerador.wAlerta('XR01', 'PROTOCOLO/LMC', 'Numero do protocolo', ERR_MSG_VAZIO)
              else begin
                xProtLMC := LocLeitor.rExtrai(1, 'protLivroCombustivel', '', i + 1);
                Gerador.ListaDeAlertas.Clear;
                break;
              end;
              I := I + 1;
            end;
          finally
            LocLeitor.Free;
          end;
        end;
      end;

      // Gerar arquivo pelo arquivo de consulta da situação do LMC
      if (FPathRetConsReciLMC = '') and (FPathRetConsSitLMC <> '') and (not ProtLido) then
      begin
        if not FileExists(FPathRetConsSitLMC) then
          Gerador.wAlerta('XR06', 'SITUAÇÃO', 'SITUAÇÃO', ERR_MSG_ARQUIVO_NAO_ENCONTRADO)
        else begin
          XMLinfProt.LoadFromFile(FPathRetConsSitLMC);

          wCstat:=RetornarConteudoEntre(XMLinfProt.text, '<cStat>', '</cStat>');
          if trim(wCstat) = '101' then
            XMLinfProt2.Text:=RetornarConteudoEntre(XMLinfProt.text, '<infCanc', '</infCanc>')
          else
            XMLinfProt2.Text:=RetornarConteudoEntre(XMLinfProt.text, '<infProt', '</infProt>');

          xProtLMC := '<protLivroCombustivel versao="' + Versao + '">' +
                       '<infProt>' +
                         PreencherTAG('tpAmb', XMLinfProt.text) +
                         PreencherTAG('verAplic', XMLinfProt.text) +
                         PreencherTAG('chLMC', XMLinfProt.text) +
                         PreencherTAG('dhRecbto', XMLinfProt2.text) +
                         PreencherTAG('nProt', XMLinfProt2.text) +
                         PreencherTAG('digVal', XMLinfProt.text) +
                         PreencherTAG('cStat', XMLinfProt.text) +
                         PreencherTAG('xMotivo', XMLinfProt.text) +
                       '</infProt>' +
                      '</protLivroCombustivel>';
        end;
      end;

      if ProtLido then
      begin
        xProtLMC := '<protLivroCombustivel versao="' + Versao + '">' +
                     '<infProt>' +
                      '<tpAmb>'+TpAmbToStr(FtpAmb)+'</tpAmb>'+
                      '<verAplic>'+FverAplic+'</verAplic>'+
                      '<chLMC>'+FchLMC+'</chLMC>'+
                      '<dhRecbto>'+FormatDateTime('yyyy-mm-dd"T"hh:nn:ss',FdhRecbto)+'</dhRecbto>'+
                      '<nProt>'+FnProt+'</nProt>'+
                      '<digVal>'+FdigVal+'</digVal>'+
                      '<cStat>'+IntToStr(FcStat)+'</cStat>'+
                      '<xMotivo>'+FxMotivo+'</xMotivo>'+
                     '</infProt>'+
                    '</protLivroCombustivel>';
      end;

      FXML_LMC := XMLLMC.Text;
      FXML_prot := xProtLMC;
    end;

    // Gerar arquivo
    if (Gerador.ListaDeAlertas.Count = 0) and
       (FXML_LMC <> '') and (FXML_prot <> '') then
    begin
      Gerador.ArquivoFormatoXML := '';
      Gerador.wGrupo(ENCODING_UTF8, '', False);
      Gerador.wGrupo('LMCProc versao="' + Versao + '" ' + NAME_SPACE_LMC, '');
      Gerador.wTexto('<LMC xmlns' + RetornarConteudoEntre(FXML_LMC, '<LMC xmlns', '</LMC>') + '</LMC>');
      Gerador.wTexto(FXML_prot);
      Gerador.wGrupo('/LMCProc');
    end;

    Result := (Gerador.ListaDeAlertas.Count = 0);

  finally
    XMLLMC.Free;
    XMLinfProt.Free;
    XMLinfProt2.Free;
  end;
end;

end.

