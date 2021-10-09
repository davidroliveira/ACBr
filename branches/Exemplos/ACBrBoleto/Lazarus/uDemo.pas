unit uDemo; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, EditBtn, ACBrBoleto, ACBrBoletoFCLazReportDm, ACBrBoletoFCFortesFr,
  ExtCtrls, MaskEdit, Buttons, ACBrUtil, ACBrMail, ACBrBoletoConversao;

type

  { TfrmDemo }

  TfrmDemo = class ( TForm )
     ACBrBoleto1: TACBrBoleto;
     ACBrBoletoFCFortes1 : TACBrBoletoFCFortes ;
     ACBrBoletoFCLazReport1 : TACBrBoletoFCLazReport ;
     ACBrMail1: TACBrMail;
     btnGerarRemessa1: TButton;
     btnIncluiBoleto: TButton;
     btnIncluir10Boletos: TButton;
     btnGerarRemessa: TButton;
     btnImprimir: TButton;
     btnZerar: TButton;
     Button1: TButton;
     Button2: TButton;
     Button3: TButton;
     Button4: TButton;
     cbxAceite: TComboBox;
     cbxLayOut : TComboBox ;
     edtInstrucoes1: TEdit;
     edtInstrucoes2: TEdit;
     edtMulta: TEdit;
     edtCEP: TMaskEdit;
     edtCPFCNPJ: TEdit;
     edtDataAbatimento: TDateEdit;
     edtDataDesconto: TDateEdit;
     edtDataProtesto: TDateEdit;
     edtEmail: TEdit;
     edtNossoNro: TEdit;
     edtUF: TEdit;
     edtCidade: TEdit;
     edtBairro: TEdit;
     edtComplemento: TEdit;
     edtNumero: TEdit;
     edtEndereco: TEdit;
     edtNome: TEdit;
     edtCarteira: TEdit;
     edtDataDoc: TDateEdit;
     edtEspecieDoc: TEdit;
     edtEspecieMod: TEdit;
     edtLocalPag: TEdit;
     edtNumeroDoc: TEdit;
     edtValorDoc: TEdit;
     edtMoraJuros: TEdit;
     edtValorAbatimento: TEdit;
     edtValorDesconto: TEdit;
     edtVencimento: TDateEdit;
     edtDataMora: TDateEdit;
     GroupBox1: TGroupBox;
     GroupBox2: TGroupBox;
     GroupBox3: TGroupBox;
     GroupBox4: TGroupBox;
     GroupBox5: TGroupBox;
     Label1: TLabel;
     Label10: TLabel;
     Label11: TLabel;
     Label12: TLabel;
     Label13: TLabel;
     Label14: TLabel;
     Label15 : TLabel ;
     Label16: TLabel;
     Label17: TLabel;
     Label18: TLabel;
     Label19: TLabel;
     Label2: TLabel;
     Label20: TLabel;
     Label21: TLabel;
     Label22: TLabel;
     Label23: TLabel;
     Label24: TLabel;
     Label25: TLabel;
     Label26: TLabel;
     Label27: TLabel;
     Label28: TLabel;
     Label29: TLabel;
     Label3: TLabel;
     Label30: TLabel;
     Label31: TLabel;
     Label4: TLabel;
     Label5: TLabel;
     Label6: TLabel;
     Label7: TLabel;
     Label8: TLabel;
     Label9: TLabel;
     memMensagem: TMemo;
     Panel1: TPanel;
     Panel2: TPanel;
     procedure btnGerarRemessa1Click(Sender: TObject);
     procedure btnGerarRemessaClick ( Sender: TObject ) ;
     procedure btnIncluiBoletoClick ( Sender: TObject ) ;
     procedure btnIncluir10BoletosClick ( Sender: TObject ) ;
     procedure btnImprimirClick ( Sender: TObject ) ;
     procedure btnZerarClick ( Sender: TObject ) ;
     procedure Button1Click ( Sender: TObject ) ;
     procedure Button2Click ( Sender: TObject ) ;
     procedure Button3Click(Sender: TObject);
     procedure Button4Click(Sender: TObject);
     procedure cbxLayOutChange(Sender : TObject) ;
     procedure FormCreate ( Sender: TObject ) ;
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  frmDemo: TfrmDemo;

implementation

Uses typinfo;

{$R *.lfm}

{ TfrmDemo }

procedure TfrmDemo.btnIncluir10BoletosClick ( Sender: TObject ) ;
var
  Titulo    : TACBrTitulo;
  I         : Integer;
  NrTitulos : Integer;
  NrTitulosStr :String;
  Convertido: Boolean;
begin
   NrTitulos    := 10;
   NrTitulosStr := '10';
   Convertido   := true;

   repeat
     InputQuery('Número de Boletos a incluir','',False,NrTitulosStr);
     try
       NrTitulos := StrToInt(NrTitulosStr);
     except
       Convertido:= false;
     end;
   until  Convertido;

   for I := 1 to NrTitulos do
   begin
     Titulo:= ACBrBoleto1.CriarTituloNaLista;

     with Titulo do
     begin
        LocalPagamento    := 'Pagar preferêncialmente nas agências do '+ ACBrBoleto1.Banco.Nome; //MEnsagem exigida pelo bradesco
        Vencimento        := IncMonth(EncodeDate(2010,05,10),I);
        DataDocumento     := EncodeDate(2010,04,10);
        NumeroDocumento   := PadRight(IntToStr(I),6,'0');
        EspecieDoc        := 'DM';
        Aceite            := atSim;
        DataProcessamento := Now;
        Carteira          := 'CSB';
        NossoNumero       := IntToStr(I);//IntToStrZero(I,ACBrBoleto1.Banco.TamanhoMaximoNossoNum);
        ValorDocumento    := 100.10 * (I+0.5);
        Sacado.NomeSacado := 'Jose Luiz Pedroso';
        Sacado.CNPJCPF    := '12345678901';
        Sacado.Logradouro := 'Rua da Consolacao';
        Sacado.Numero     := '100';
        Sacado.Bairro     := 'Vila Esperanca';
        Sacado.Cidade     := 'Tatui';
        Sacado.UF         := 'SP';
        Sacado.CEP        := '18270000';
        ValorAbatimento   := 10;
        DataAbatimento    := Vencimento-5;
        Instrucao1        := '00';
        Instrucao2        := '00';

        //ACBrBoleto1.AdicionarMensagensPadroes(Titulo,Mensagem);
     end;
   end;
end;

procedure TfrmDemo.btnImprimirClick ( Sender: TObject ) ;
var
  Men: TStringList;

begin
   Men := TStringList.Create;
   ACBrBoleto1.Imprimir;
end;

procedure TfrmDemo.btnZerarClick ( Sender: TObject ) ;
begin
   ACBrBoleto1.ListadeBoletos.Clear;
end;

procedure TfrmDemo.FormCreate ( Sender: TObject ) ;
var
  I : TACBrBolLayOut ;
begin
   edtDataDoc.Date    := Now;
   edtVencimento.Date := IncMonth(edtDataDoc.Date,1);
   edtDataMora.Date   := edtVencimento.Date+1;

   cbxLayOut.Items.Clear ;
   For I := Low(TACBrBolLayOut) to High(TACBrBolLayOut) do
      cbxLayOut.Items.Add( GetEnumName(TypeInfo(TACBrBolLayOut), integer(I) ) ) ;

   cbxLayOut.ItemIndex := 0;
end;

procedure TfrmDemo.btnIncluiBoletoClick ( Sender: TObject ) ;
var
  Titulo : TACBrTitulo;
begin
     ACBrBoleto1.Banco.TipoCobranca:= cobBancoDoBrasil;
     ACBrBoleto1.Cedente.Agencia:='1234';
     ACBrBoleto1.Cedente.AgenciaDigito:='7';
     ACBrBoleto1.LayoutRemessa:= c240;

     Titulo := ACBrBoleto1.CriarTituloNaLista;

     with Titulo do
     begin
        Vencimento        := edtVencimento.Date;
        DataDocumento     := edtDataDoc.Date;
        NumeroDocumento   := edtNumeroDoc.Text;
        Carteira          := '17';
        NossoNumero       := edtNossoNro.Text;
        EspecieDoc        := edtEspecieDoc.Text;
        if cbxAceite.ItemIndex = 0 then
           Aceite := atSim
        else
           Aceite := atNao;

        DataProcessamento := Now;

        ValorDocumento    := StrToCurr(edtValorDoc.Text);
        Sacado.NomeSacado := edtNome.Text;
        Sacado.CNPJCPF    := OnlyNumber(edtCPFCNPJ.Text);
        Sacado.Logradouro := edtEndereco.Text;
        Sacado.Numero     := edtNumero.Text;
        Sacado.Bairro     := edtBairro.Text;
        Sacado.Cidade     := edtCidade.Text;
        Sacado.UF         := edtUF.Text;
        Sacado.CEP        := OnlyNumber(edtCEP.Text);
        ValorAbatimento   := StrToCurrDef(edtValorAbatimento.Text,0);
        LocalPagamento    := edtLocalPag.Text+ ' '+ ACBrBoleto1.Banco.Nome;
        ValorMoraJuros    := StrToCurrDef(edtMoraJuros.Text,0);
        ValorDesconto     := StrToCurrDef(edtValorDesconto.Text,0);
        ValorAbatimento   := StrToCurrDef(edtValorAbatimento.Text,0);
        DataMoraJuros     := edtDataMora.Date;
        DataDesconto      := edtDataDesconto.Date;
        DataAbatimento    := edtDataAbatimento.Date;
        DataProtesto      := edtDataProtesto.Date;
        PercentualMulta   := StrToCurrDef(edtMulta.Text,0);
        Mensagem.Text     := memMensagem.Text;
        OcorrenciaOriginal.Tipo  := toRemessaRegistrar;
        CodigoMora:= '2';
        DataMulta:= edtVencimento.Date + 2;

        Sacado.SacadoAvalista.NomeAvalista := edtNome.Text;
        Sacado.SacadoAvalista.CNPJCPF    := OnlyNumber(edtCPFCNPJ.Text);


        QtdePagamentoParcial:= 1;
        TipoPagamento:= tpNao_Aceita_Valor_Divergente;
        PercentualMinPagamento:= 0;
        PercentualMaxPagamento:= 0;
        ValorMinPagamento:=0;
        ValorMaxPagamento:=0;


     end;

end;

procedure TfrmDemo.btnGerarRemessaClick ( Sender: TObject ) ;
begin
   ACBrBoleto1.GerarRemessa( 1 );
end;

procedure TfrmDemo.btnGerarRemessa1Click(Sender: TObject);
var
  SLRemessa: TStringList;
  i: Integer;
begin
   with ACBrBoleto1 do
   begin
     EnviarBoleto;

     if ListaRetornoWeb.Count > 0 then
     begin
       SLRemessa := TStringList.Create;
       try
         for i:= 0 to ListaRetornoWeb.Count -1 do
         begin
           //Ler todos os campos da classe Retorno
            SLRemessa.Add('Cod_Retorno='+ ListaRetornoWeb[i].CodRetorno + sLineBreak +
                        'Msg_Retorno='+ ListaRetornoWeb[i].MsgRetorno + sLineBreak +
                        'Ori_Retorno='+ ListaRetornoWeb[i].OriRetorno + sLineBreak +
                        'HEADER' + sLineBreak +
                        'Versao='+ ListaRetornoWeb[i].Header.Versao + sLineBreak +
                        'Autenticacao=' + ListaRetornoWeb[i].Header.Autenticacao + sLineBreak +
                        'Usuario_Servico=' + ListaRetornoWeb[i].Header.Usuario_Servico + sLineBreak +
                        'Usuario=' + ListaRetornoWeb[i].Header.Usuario + sLineBreak +
                        'Operacao='  + TipoOperacaoToStr(ListaRetornoWeb[i].Header.Operacao) + sLineBreak +
                        'Indice=' + IntToStr(ListaRetornoWeb[i].Header.Indice) + sLineBreak +
                        'Sistema_Origem=' + ListaRetornoWeb[i].Header.Sistema_Origem + sLineBreak +
                        'Agencia=' + IntToStr(ListaRetornoWeb[i].Header.Agencia) + sLineBreak +
                        'ID_Origem=' + ListaRetornoWeb[i].Header.Id_Origem + sLineBreak +
                        'Data_Hora=' +FormatDateTime('dd/mm/yyyy hh:nn:ss',ListaRetornoWeb[i].Header.Data_Hora) + sLineBreak +
                        'ID_Processo=' + ListaRetornoWeb[i].Header.Id_Processo + sLineBreak +
                        'DADOS' + sLineBreak +
                        'Excessao=' +ListaRetornoWeb[i].DadosRet.Excecao + sLineBreak +
                        'CONTROLE_NEGOCIAL' + sLineBreak +
                        'Origem_Retorno=' + ListaRetornoWeb[i].DadosRet.ControleNegocial.OriRetorno + sLineBreak +
                        'NSU=' + ListaRetornoWeb[i].DadosRet.ControleNegocial.NSU + sLineBreak +
                        'Cod_Retorno=' + ListaRetornoWeb[i].DadosRet.ControleNegocial.CodRetorno + sLineBreak +
                        'Msg_Retorno=' + ListaRetornoWeb[i].DadosRet.ControleNegocial.Retorno + sLineBreak +
                        'COMPROVANTE' + sLineBreak +
                        'Data=' +  FormatDateTime('dd/mm/yyyy', ListaRetornoWeb[i].DadosRet.Comprovante.Data) + sLineBreak +
                        'Hora=' +  ListaRetornoWeb[i].DadosRet.Comprovante.Hora + sLineBreak +
                        'ID_BOLETO' + sLineBreak +
                        'Codigo_Barras=' + ListaRetornoWeb[i].DadosRet.IDBoleto.CodBarras + sLineBreak +
                        'Linha_Digitavel=' + ListaRetornoWeb[i].DadosRet.IDBoleto.LinhaDig + sLineBreak +
                        'Nosso_Numero=' + ListaRetornoWeb[i].DadosRet.IDBoleto.NossoNum + sLineBreak +
                        'URL=' + ListaRetornoWeb[i].DadosRet.IDBoleto.URL + sLineBreak +
                        'CONSULTA_BOLETO' + sLineBreak +
                        'Numero_Documento=' + ListaRetornoWeb[i].DadosRet.TituloRet.NumeroDocumento + sLineBreak +
                        'Data_Vencimento=' + FormatDateTime('dd/mm/yyyy',ListaRetornoWeb[i].DadosRet.TituloRet.Vencimento) + sLineBreak +
                        'Valor=' + CurrToStr(ListaRetornoWeb[i].DadosRet.TituloRet.ValorDocumento) + sLineBreak
                         );
         end;

         SLRemessa.SaveToFile( PathWithDelim(ExtractFilePath(Application.ExeName))+'RetornoRegistro.txt' );
       finally
         SLRemessa.Free;
       end;

     end;
     ShowMessage('Retorno Envio gerado em: '+ PathWithDelim(ExtractFilePath(Application.ExeName))+'RetornoRegistro.txt' );

   end;


end;

procedure TfrmDemo.Button1Click ( Sender: TObject ) ;
begin
   //ACBrBoletoFCLazReport1.NomeArquivo := './teste.pdf' ;
   ACBrBoleto1.GerarPDF;
end;

procedure TfrmDemo.Button2Click ( Sender: TObject ) ;
begin
   ACBrBoletoFCLazReport1.NomeArquivo := './teste.html' ;
   ACBrBoleto1.GerarHTML;

end;

procedure TfrmDemo.Button3Click(Sender: TObject);
begin
   ACBrBoleto1.LerRetorno();
end;

procedure TfrmDemo.Button4Click(Sender: TObject);
var
  SL: TStringList;
begin
  SL := TStringList.Create;
  try
    SL.Add('Olá,');
    SL.Add('Atenção, Boleto está em Anexo');
    ACBrBoleto1.EnviarEmail(edtEmail.Text ,'Teste de Envio de Email', SL, True);
  finally
    SL.Free;
  end;
end;

procedure TfrmDemo.cbxLayOutChange(Sender : TObject) ;
begin
  ACBrBoleto1.ACBrBoletoFC.LayOut := TACBrBolLayOut( cbxLayOut.ItemIndex );
end;

end.

