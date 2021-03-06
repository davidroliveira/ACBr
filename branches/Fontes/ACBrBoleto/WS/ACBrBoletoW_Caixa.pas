{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para interação com equipa- }
{ mentos de Automação Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2020 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:  José M S Junior                                }
{                                                                              }
{  Você pode obter a última versão desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
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
{ Daniel Simões de Almeida - daniel@projetoacbr.com.br - www.projetoacbr.com.br}
{       Rua Coronel Aureliano de Camargo, 963 - Tatuí - SP - 18270-170         }
{******************************************************************************}

{$I ACBr.inc}

unit ACBrBoletoW_Caixa;

interface

uses
  Classes, SysUtils, ACBrBoletoWS, pcnConversao, pcnGerador, ACBrBoletoConversao;

type

  { TBoletoW_Caixa }
  TBoletoW_Caixa  = class(TBoletoWSSOAP)
  protected

    procedure DefinirEnvelopeSoap; override;
    procedure DefinirURL; override;
    procedure DefinirServicoEAction; override;
    procedure DefinirRootElement; override;

    function GerarAutenticacao(Operacao: TOperacao;
                               NossoNumero,
                               CNPJCPFBenef: String;
                               CodBenef: String;
                               Valor: Double;
                               DataVenc: TDateTime): String;

    procedure GerarHeader; override;
    procedure GerarDados; override;

    procedure GerarTitulo;
    procedure GerarJuros;
    procedure GerarPos_Vencimento;
    procedure GerarPagador;
    procedure GerarAvalista;
    procedure GerarMulta;
    procedure GerarDescontos;
    procedure GerarFicha_Compensacao;
    procedure GerarRecibo_Pagador;
    procedure GerarPagamento;

  public
    constructor Create(ABoletoWS: TBoletoWS); override;

    function GerarRemessa: String; override;
    function Enviar: Boolean; override;

  end;

ResourceString
  S_URL = 'https://barramento.caixa.gov.br/sibar/';
  S_SERVICO_MANUTENCAO = 'ManutencaoCobrancaBancaria/Boleto/Externo' ;
  S_SERVICO_CONSULTA = 'ConsultaCobrancaBancaria/Boleto';
  S_NAMESPACE_MANUTENCAO = 'xmlns:manutencaocobrancabancaria="http://caixa.gov.br/sibar/manutencao_cobranca_bancaria/boleto/externo"';
  S_NAMESPACE_CONSULTA = 'xmlns:consultacobrancabancaria="http://caixa.gov.br/sibar/consulta_cobranca_bancaria/boleto"';
  S_NAMESPACE_BASE = 'xmlns:sib="http://caixa.gov.br/sibar"';
  S_SOAP_ATTRIBUTTES = 'xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"';
  S_SISTEMA_ORIGEM  = 'SIGCB';
  S_USUARIO_SERVICO = 'SGCBS02P';


const

  C_MANUTENCAO_COBRANCA_BANCARIA = 'manutencaocobrancabancaria:';
  C_CONSULTA_COBRANCA_BANCARIA = 'consultacobrancabancaria:';
  C_SERVICO_ENTRADA = 'SERVICO_ENTRADA';

implementation

uses
  ACBrUtil, synacode, ACBrBoletoPCNConsts;

{ TBoletoW_Caixa }

procedure TBoletoW_Caixa.DefinirEnvelopeSoap;
var
  Texto: String;
begin
  {$IFDEF FPC}
   Texto := '<' + ENCODING_UTF8 + '>';    // Envelope já está sendo montado em UTF8
  {$ELSE}
   Texto := '';  // Isso forçará a conversão para UTF8, antes do envio
  {$ENDIF}

  FPDadosMsg := RemoverDeclaracaoXML(FPDadosMsg);

  Texto := Texto + '<' + FPSoapVersion + ':Envelope ' + FPSoapEnvelopeAtributtes + '>';
  //Texto := Texto + '<' + FPSoapVersion + ':Header/>';
  Texto := Texto + '<' + FPSoapVersion + ':Body>';
  Texto := Texto + FPDadosMsg;
  Texto := Texto + '</' + FPSoapVersion + ':Body>';
  Texto := Texto + '</' + FPSoapVersion + ':Envelope>';

  FPEnvelopeSoap := Texto;
end;

procedure TBoletoW_Caixa.DefinirURL;
begin
  FPURL := '';
  DefinirServicoEAction;
  FPVersaoServico := Boleto.Configuracoes.WebService.VersaoDF;
end;

procedure TBoletoW_Caixa.DefinirServicoEAction;
var
  Servico, Acao: String;
begin
  Servico  := S_SERVICO_MANUTENCAO;

  case Boleto.Configuracoes.WebService.Operacao of
    tpInclui:   Acao := TipoOperacaoToStr( tpInclui );
    tpAltera:   Acao := TipoOperacaoToStr( tpAltera );
    tpBaixa:    Acao := TipoOperacaoToStr( tpBaixa );
    tpConsulta:
               begin
                 Acao     := TipoOperacaoToStr( tpConsulta );
                 Servico  := S_SERVICO_CONSULTA;
               end;
  end;

  FPServico := S_URL + Servico;
  FPURL := FPServico;
  FPSoapAction := Acao;
end;

procedure TBoletoW_Caixa.DefinirRootElement;
var
  Prefixo, NameSpaceServico, NameSpaceBase: String;
begin
  case Boleto.Configuracoes.WebService.Operacao of
    tpInclui,
    tpAltera,
    tpBaixa:
      begin
        Prefixo := C_MANUTENCAO_COBRANCA_BANCARIA;
        NameSpaceServico := S_NAMESPACE_MANUTENCAO;
      end;

    tpConsulta:
      begin
        Prefixo := C_CONSULTA_COBRANCA_BANCARIA;
        NameSpaceServico := S_NAMESPACE_CONSULTA;
      end;
  end;

  NameSpaceBase := S_NAMESPACE_BASE;

  FPRootElement:= Prefixo + C_SERVICO_ENTRADA + ' ' + NameSpaceServico + ' ' + NameSpaceBase;
  FPCloseRootElement:= Prefixo + C_SERVICO_ENTRADA ;

end;

function TBoletoW_Caixa.GerarAutenticacao(Operacao: TOperacao; NossoNumero,
  CNPJCPFBenef: String; CodBenef: String; Valor: Double; DataVenc: TDateTime
  ): String;
var
  sAutenticacao: string;
begin
  case Operacao of
    tpInclui, tpAltera:
      begin
        sAutenticacao := Format('%7.7d',[StrToInt(CodBenef)]) + NossoNumero
            + FormatDateTime('ddmmyyyy', DataVenc )
            + Format('%15.15d', [StrToInt(OnlyNumber( FloatToStr( Valor)))])
            + FormatFloat(Poem_Zeros('',14),StrToFloat(OnlyNumber(CNPJCPFBenef)));
      end;

    tpBaixa, tpConsulta:
      begin
        sAutenticacao := Format('%7.7d',[StrToInt(CodBenef)]) + NossoNumero
            + Poem_Zeros('',8)
            + Poem_Zeros('',15)
            + FormatFloat(Poem_Zeros('',14),StrToFloat(OnlyNumber(CNPJCPFBenef)));
      end;
  end;

  Result := AsciiToHex(SHA1(sAutenticacao));

end;

procedure TBoletoW_Caixa.GerarHeader;
var
  //sAutenticacao: String;
  sUsuarioServico: String;
begin
  {if Assigned(Titulos) then
  begin
    sAutenticacao := GerarAutenticacao(Boleto.Configuracoes.WebService.Operacao,
                                             Titulos.NossoNumero,
                                             Boleto.Cedente.CNPJCPF,
                                             Boleto.Cedente.CodigoCedente,
                                             Titulos.ValorDocumento,
                                             Titulos.Vencimento);

  end;   }

  if NaoEstaVazio( Boleto.Cedente.CedenteWS.ClientID ) then
    sUsuarioServico:= Boleto.Cedente.CedenteWS.ClientID
  else
    sUsuarioServico:= S_USUARIO_SERVICO;

  with Boleto do
  begin
    Gerador.wGrupo('sib:HEADER');
    Gerador.wCampo(tcStr, '#1', 'VERSAO         ', 01, 10, 1, Boleto.Configuracoes.WebService.VersaoDF, DSC_VERSAODF);
    if Assigned(Titulos) then
      Gerador.wCampo(tcStr, '#2', 'AUTENTICACAO   ', 01, 64, 1, GerarAutenticacao(Boleto.Configuracoes.WebService.Operacao,
                                                                                  Titulos.NossoNumero,
                                                                                  Boleto.Cedente.CNPJCPF,
                                                                                  Boleto.Cedente.CodigoCedente,
                                                                                  Titulos.ValorDocumento,
                                                                                  Titulos.Vencimento), DSC_AUTENTICACAO);
    Gerador.wCampo(tcStr, '#3', 'USUARIO_SERVICO', 01, 08, 1, sUsuarioServico, DSC_USUARIO_SERVICO);
    Gerador.wCampo(tcStr, '#4', 'OPERACAO       ', 01, 50, 1, TipoOperacaoToStr( Boleto.Configuracoes.WebService.Operacao ), DSC_TIPO_SERVICO);
    Gerador.wCampo(tcStr, '#5', 'SISTEMA_ORIGEM ', 01, 05, 1, S_SISTEMA_ORIGEM, DSC_SISTEMA_ORIGEM);
    Gerador.wCampo(tcStr, '#6', 'UNIDADE        ', 01, 04, 1, Cedente.Agencia, DSC_AGENCIA);
    Gerador.wCampo(tcStr, '#7', 'DATA_HORA      ', 14, 14, 1, FormatDateTime('YYYYMMDDHHMMSS', Now), DSC_DATA_HORA);
    Gerador.wGrupo('/sib:HEADER');
  end;

end;

procedure TBoletoW_Caixa.GerarDados;
begin
  if Assigned(Titulos) then
    with Titulos do
    begin
      Gerador.wGrupo('DADOS');

      case Boleto.Configuracoes.WebService.Operacao of
        tpInclui,
        tpAltera:
          begin
            if (Boleto.Configuracoes.WebService.Operacao = tpInclui) then
              Gerador.wGrupo('INCLUI_BOLETO')
            else
              Gerador.wGrupo('ALTERA_BOLETO');

            Gerador.wCampo(tcStr, '#01', 'CODIGO_BENEFICIARIO', 07, 07, 1, Boleto.Cedente.CodigoCedente, DSC_CODIGO_CEDENTE);

            GerarTitulo;

            if (Boleto.Configuracoes.WebService.Operacao = tpInclui) then
              Gerador.wGrupo('/INCLUI_BOLETO')
            else
              Gerador.wGrupo('/ALTERA_BOLETO');
          end;

        tpBaixa,
        tpConsulta:
          begin
            if (Boleto.Configuracoes.WebService.Operacao = tpBaixa) then
              Gerador.wGrupo('BAIXA_BOLETO')
            else
              Gerador.wGrupo('CONSULTA_BOLETO');

            Gerador.wCampo(tcStr, '#01', 'CODIGO_BENEFICIARIO', 07, 07, 1, Boleto.Cedente.CodigoCedente, DSC_CODIGO_CEDENTE);
            Gerador.wCampo(tcStr, '#02', 'NOSSO_NUMERO       ', 17, 17, 1, NossoNumero, DSC_NOSSO_NUMERO);

            if (Boleto.Configuracoes.WebService.Operacao = tpBaixa) then
              Gerador.wGrupo('/BAIXA_BOLETO')
            else
              Gerador.wGrupo('/CONSULTA_BOLETO');
          end;
      end;

      Gerador.wGrupo('/DADOS');
    end;

end;

procedure TBoletoW_Caixa.GerarTitulo;
begin
  if Assigned(Titulos) then
    with Titulos do
    begin
      Gerador.wGrupo('TITULO');
      Gerador.wCampo(tcStr, '#02', 'NOSSO_NUMERO    ', 17, 17, 1, NossoNumero, DSC_NOSSO_NUMERO);
      Gerador.wCampo(tcStr, '#03', 'NUMERO_DOCUMENTO', 11, 11, 1, NumeroDocumento, DSC_NUMERO_DOCUMENTO);
      Gerador.wCampo(tcDat, '#04', 'DATA_VENCIMENTO ', 10, 10, 1, Vencimento, DSC_DATA_VENCIMENTO);
      Gerador.wCampo(tcDe2, '#05', 'VALOR           ', 01, 15, 1, ValorDocumento, DSC_VALOR_DOCUMENTO);
      Gerador.wCampo(tcStr, '#06', 'TIPO_ESPECIE    ', 02, 02, 1, EspecieDoc, DSC_TIPO_ESPECIE);
      Gerador.wCampo(tcStr, '#07', 'FLAG_ACEITE     ', 01, 01, 1, AceiteToStr(Aceite), DSC_ACEITE);

      if (Boleto.Configuracoes.WebService.Operacao = tpInclui) then
        Gerador.wCampo(tcDat, '#08', 'DATA_EMISSAO', 10, 10, 1, DataDocumento, DSC_DATA_DOCUMENTO);

      GerarJuros;

      Gerador.wCampo(tcDe2, '#13', 'VALOR_ABATIMENTO', 01, 15, 1, ValorAbatimento, DSC_VALOR_ABATIMENTO);

      GerarPos_Vencimento;

      if (Boleto.Configuracoes.WebService.Operacao = tpInclui) then
        Gerador.wCampo(tcsTR, '#16', 'CODIGO_MOEDA', 02, 02, 1, '9', DSC_MOEDA);

      GerarPagador;
      GerarAvalista;
      GerarMulta;
      GerarDescontos;

      Gerador.wCampo(tcDe2, '#36', 'VALOR_IOF            ', 01, 15, 0, ValorIOF, DSC_VALOR_IOF);
      Gerador.wCampo(tcStr, '#37', 'IDENTIFICACAO_EMPRESA', 01, 25, 0, NumeroDocumento, DSC_NUMERO_DOCUMENTO);

      GerarFicha_Compensacao;
      GerarRecibo_Pagador;
      GerarPagamento;

      Gerador.wGrupo('/TITULO');
    end;

end;

procedure TBoletoW_Caixa.GerarJuros;
begin
  if Assigned(Titulos) then
    with Titulos do
    begin
      Gerador.wGrupo('JUROS_MORA');
      Gerador.wCampo(tcStr, '#09', 'TIPO', 01, 20, 1, TipoJurosToStr(CodigoMoraJuros), DSC_CODIGO_MORA_JUROS);
      Gerador.wCampo(tcDat, '#10', 'DATA', 10, 10, 1, DataMoraJuros, DSC_DATA_MORA_JUROS);

      if (Integer(CodigoMoraJuros) = 0)  then
        Gerador.wCampo(tcDe2, '#11', 'VALOR     ', 01, 15, 1, ValorMoraJuros, DSC_VALOR_MORA_JUROS)
      else
        Gerador.wCampo(tcDe4, '#12', 'PERCENTUAL', 01, 15, 1, ValorMoraJuros, DSC_VALOR_MORA_JUROS);

      Gerador.wGrupo('/JUROS_MORA');
    end;

end;

procedure TBoletoW_Caixa.GerarPos_Vencimento;
begin
  if Assigned(Titulos) then
    with Titulos do
    begin
      Gerador.wGrupo('POS_VENCIMENTO');
      if (integer(CodigoNegativacao) in [1,2]) then
        Gerador.wCampo(tcStr, '#14', 'ACAO       ', 01, 20, 1, 'PROTESTAR', DSC_CODIGO_NEGATIVACAO)
      else
        Gerador.wCampo(tcStr, '#14', 'ACAO       ', 01, 20, 1, 'DEVOLVER', DSC_CODIGO_NEGATIVACAO);

      Gerador.wCampo(tcInt, '#15', 'NUMERO_DIAS', 03, 03, 1, DiasDeProtesto, DSC_DIAS_PROTESTO);
      Gerador.wGrupo('/POS_VENCIMENTO');
    end;

end;

procedure TBoletoW_Caixa.GerarPagador;
begin
  if Assigned(Titulos) then
    with Titulos.Sacado do
    begin
      Gerador.wGrupo('PAGADOR');

      if (Boleto.Configuracoes.WebService.Operacao = tpInclui) then
        Gerador.wCampoCNPJCPF('#17', '#19', CNPJCPF);

      if (Integer(Pessoa) = 0)  then
        Gerador.wCampo(tcStr, '#18', 'NOME', 01, 40, 1, NomeSacado, DSC_NOME_SACADO)
      else
        Gerador.wCampo(tcStr, '#20', 'RAZAO_SOCIAL', 01, 40, 1, NomeSacado, DSC_NOME_SACADO);

      Gerador.wGrupo('ENDERECO');
      Gerador.wCampo(tcStr, '#21', 'LOGRADOURO', 01, 40, 1, Logradouro, DSC_LOGRADOURO);
      Gerador.wCampo(tcStr, '#22', 'BAIRRO    ', 01, 15, 1, Bairro, DSC_BAIRRO);
      Gerador.wCampo(tcStr, '#23', 'CIDADE    ', 01, 15, 1, Cidade, DSC_CIDADE);
      Gerador.wCampo(tcStr, '#24', 'UF        ', 02, 02, 1, UF, DSC_UF);
      Gerador.wCampo(tcStr, '#25', 'CEP       ', 08, 08, 1, Cep, DSC_CEP);
      Gerador.wGrupo('/ENDERECO');

      Gerador.wGrupo('/PAGADOR');
    end;

end;

procedure TBoletoW_Caixa.GerarAvalista;
begin
  if Assigned(Titulos) then
    with Titulos.Sacado.SacadoAvalista do
    begin
      if NaoEstaVazio(Titulos.Sacado.SacadoAvalista.CNPJCPF) then
      begin
        Gerador.wGrupo('SACADOR_AVALISTA');
        Gerador.wCampoCNPJCPF('#26', '#28', CNPJCPF);

        if (Integer(Pessoa) = 0) then
          Gerador.wCampo(tcStr, '#27', 'NOME', 01, 40, 1, NomeAvalista, DSC_NOME_AVALISTA)
        else
          Gerador.wCampo(tcStr, '#29', 'RAZAO_SOCIAL', 01, 40, 1, NomeAvalista, DSC_NOME_AVALISTA);

        Gerador.wGrupo('/SACADOR_AVALISTA');

      end;
    end;

end;

procedure TBoletoW_Caixa.GerarMulta;
begin
  if Assigned(Titulos) then
    with Titulos do
    begin
      if (PercentualMulta > 0) and (DataMulta > 0) then
      begin
        Gerador.wGrupo('MULTA');
        Gerador.wCampo(tcDat, '#30', 'DATA', 10, 10, 1, DataMulta, DSC_DATA_MULTA);

        if MultaValorFixo then
          Gerador.wCampo(tcDe2, '#31', 'VALOR     ', 01, 15, 1, PercentualMulta, DSC_PERCENTUAL_MULTA)
        else
          Gerador.wCampo(tcDe4, '#32', 'PERCENTUAL', 01, 15, 1, PercentualMulta, DSC_PERCENTUAL_MULTA);

        Gerador.wGrupo('/MULTA');

      end;
    end;

end;

procedure TBoletoW_Caixa.GerarDescontos;
begin
  if Assigned(Titulos) then
    with Titulos do
    begin
      if (ValorDesconto > 0) then
      begin
        Gerador.wGrupo('DESCONTOS');

          Gerador.wGrupo('DESCONTO');
          Gerador.wCampo(tcDat, '#33', 'DATA', 10, 10, 1, DataDesconto, DSC_DATA_DESCONTO);

          if ( Integer(TipoDesconto) <> 1) then
            Gerador.wCampo(tcDe2, '#34', 'VALOR     ', 01, 15, 1, ValorDesconto, DSC_VALOR_DESCONTO)
          else
            Gerador.wCampo(tcDe4, '#35', 'PERCENTUAL', 01, 15, 1, ValorDesconto, DSC_VALOR_DESCONTO);

          Gerador.wGrupo('/DESCONTO');

        if (ValorDesconto2 > 0) then
        begin
           Gerador.wGrupo('DESCONTO');
          Gerador.wCampo(tcDat, '#33', 'DATA', 10, 10, 1, DataDesconto2, DSC_DATA_DESCONTO2);

          if ( Integer(TipoDesconto2) <> 1) then
            Gerador.wCampo(tcDe2, '#34', 'VALOR     ', 01, 15, 1, ValorDesconto2, DSC_VALOR_DESCONTO2)
          else
            Gerador.wCampo(tcDe4, '#35', 'PERCENTUAL', 01, 15, 1, ValorDesconto2, DSC_VALOR_DESCONTO2);

          Gerador.wGrupo('/DESCONTO');

        end;

        Gerador.wGrupo('/DESCONTOS');

      end;
    end;

end;

procedure TBoletoW_Caixa.GerarFicha_Compensacao;
var
  J: Integer;
begin
  if Assigned(Titulos) then
    with Titulos do
    begin
      if (Mensagem.Count > 0) then
      begin
        Gerador.wGrupo('FICHA_COMPENSACAO');
        Gerador.wGrupo('MENSAGENS');

        for J := 0 to Mensagem.Count -1 do
        begin
          Gerador.wCampo(tcStr, '#38', 'MENSAGEM', 01, 40, 0, Mensagem[J], DSC_MENSAGEM);
        end;

        Gerador.wGrupo('/MENSAGENS');
        Gerador.wGrupo('/FICHA_COMPENSACAO');
      end;
    end;

end;

procedure TBoletoW_Caixa.GerarRecibo_Pagador;
begin
  if Assigned(Titulos) then
    with Titulos do
    begin
      if (Instrucao1 <> '') then
      begin
        Gerador.wGrupo('RECIBO_PAGADOR');
        Gerador.wGrupo('MENSAGENS');

        if (Instrucao1 <> '') then
          Gerador.wCampo(tcStr, '#39', 'MENSAGEM', 01, 40, 0, Instrucao1, DSC_INSTRUCAO1);
        if (Instrucao2 <> '') then
          Gerador.wCampo(tcStr, '#39', 'MENSAGEM', 01, 40, 0, Instrucao2, DSC_INSTRUCAO2);
        if (Instrucao3 <> '') then
          Gerador.wCampo(tcStr, '#39', 'MENSAGEM', 01, 40, 0, Instrucao3, DSC_INSTRUCAO3);

        Gerador.wGrupo('/MENSAGENS');
        Gerador.wGrupo('/RECIBO_PAGADOR');

      end;
    end;

end;

procedure TBoletoW_Caixa.GerarPagamento;
begin
  if Assigned(Titulos) then
    with Titulos do
    begin
      Gerador.wGrupo('PAGAMENTO');
      Gerador.wCampo(tcInt, '#40', 'QUANTIDADE_PERMITIDA', 01, 02, 0, QtdePagamentoParcial, DSC_QTDE_PAGAMENTO_PARCIAL);
      Gerador.wCampo(tcStr, '#41', 'TIPO                ', 01, 20, 1, TipoPagamentoToStr(TipoPagamento), DSC_TIPO_PAGAMENTO);

      if (( ValorMinPagamento > 0) or (ValorMaxPagamento > 0) ) then
      begin
        Gerador.wCampo(tcDe2, '#42', 'VALOR_MINIMO', 01, 15, 1, ValorMinPagamento, DSC_VALOR_MIN_PAGAMENTO);
        Gerador.wCampo(tcDe2, '#42', 'VALOR_MAXIMO', 01, 15, 1, ValorMaxPagamento, DSC_VALOR_MAX_PAGAMENTO);
      end
      else
      begin
        Gerador.wCampo(tcDe4, '#42', 'PERCENTUAL_MINIMO', 01, 15, 1, PercentualMinPagamento, DSC_PERCENTUAL_MIN_PAGAMENTO);
        Gerador.wCampo(tcDe4, '#42', 'PERCENTUAL_MAXIMO', 01, 15, 1, PercentualMaxPagamento, DSC_PERCENTUAL_MAX_PAGAMENTO);
      end;

      Gerador.wGrupo('/PAGAMENTO');
    end;

end;

constructor TBoletoW_Caixa.Create(ABoletoWS: TBoletoWS);
begin
  inherited Create(ABoletoWS);

end;

function TBoletoW_Caixa.GerarRemessa: String;
begin
  Result:=inherited GerarRemessa;

end;

function TBoletoW_Caixa.Enviar: Boolean;
begin
  Result:=inherited Enviar;
end;


end.

