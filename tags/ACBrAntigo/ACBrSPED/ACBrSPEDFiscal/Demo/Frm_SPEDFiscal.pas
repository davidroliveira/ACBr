unit Frm_SPEDFiscal;

{$IFDEF FPC}
{$mode objfpc}{$H+}
{$ENDIF}

interface

uses
{$IFNDEF FPC}
  Windows, Messages,
{$ELSE}
  LResources,
{$ENDIF}
  SysUtils, Variants, Classes, Graphics, Controls, Forms, ACBrEFDBlocos,
  Dialogs, StdCtrls, ACBrSpedFiscal, ExtCtrls, ACBrSped;

type
  TFrmSPEDFiscal = class(TForm)
    btnB_0: TButton;
    edtError: TMemo;
    edtFile: TEdit;
    btnTXT: TButton;
    btnB_1: TButton;
    btnB_C: TButton;
    btnB_D: TButton;
    btnB_E: TButton;
    btnB_H: TButton;
    Label1: TLabel;
    Label2: TLabel;
    edtTXT: TMemo;
    Label3: TLabel;
    Label4: TLabel;
    btnError: TButton;
    ACBrSPEDFiscal1: TACBrSPEDFiscal;
    procedure btnB_0Click(Sender: TObject);
    procedure btnTXTClick(Sender: TObject);
    procedure btnB_1Click(Sender: TObject);
    procedure btnB_CClick(Sender: TObject);
    procedure btnB_DClick(Sender: TObject);
    procedure btnB_EClick(Sender: TObject);
    procedure btnB_HClick(Sender: TObject);
    procedure btnErrorClick(Sender: TObject);
    procedure ACBrSPEDFiscal1Error(const MsnError: AnsiString);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSPEDFiscal: TFrmSPEDFiscal;

implementation

{$IFNDEF FPC}
{$R *.dfm}
{$ENDIF}

procedure TFrmSPEDFiscal.ACBrSPEDFiscal1Error(const MsnError: AnsiString);
begin
   edtError.Lines.Add(MsnError);
end;

procedure TFrmSPEDFiscal.btnB_0Click(Sender: TObject);
var
int0150: integer;
int0175: integer;
int0300: integer;
begin
   // Alimenta o componente com informa��es para gerar todos os registros do
   // Bloco 0.
   with ACBrSpedFiscal1.Bloco_0 do
   begin
      // Dados da Empresa
      with Registro0000New do
      begin
         COD_VER    := vlVersao102;
         COD_FIN    := raOriginal;
         NOME       := 'NOME DA EMPRESA';
         CNPJ       := '';
         CPF        := '00000000000'; // Deve ser uma informa��o valida
         UF         := 'ES';
         IE         := '082260133';
         COD_MUN    := 3200607;
         IM         := '';
         SUFRAMA    := '';
         IND_PERFIL := pfPerfilA; //pfPerfilB;
         IND_ATIV   := atOutros;
      end;
      with Registro0001New do
      begin
//         IND_MOV := imComDados;

         // FILHO - Dados complementares da Empresa
         with Registro0005New do
         begin
            FANTASIA   := 'NOME FANTASSIA';
            CEP        := '29900000';
            ENDERECO   := 'ENDERE�O DA EMPRESA';
            NUM        := 'S/N';
            COMPL      := '';
            BAIRRO     := 'BAIRRO';
            FONE       := '';
            FAX        := '';
            EMAIL      := 'email@email.com.br';
         end;
         // FILHO - Dados do contador.
         with Registro0100New do
         begin
            NOME       := 'NOME DO CONTADOR';
            CPF        := '12345678900'; // Deve ser uma informa��o valida
            CRC        := '123456';
            CNPJ       := '';
            CEP        := '';
            ENDERECO   := '';
            NUM        := '';
            COMPL      := '';
            BAIRRO     := '';
            FONE       := '';
            FAX        := '';
            EMAIL      := '';
            COD_MUN    := 3200607;
         end;
         // FILHO
         for int0150 := 1 to 10 do
         begin
            // 10 Clientes
            with Registro0150New do
            begin
               COD_PART := IntToStr(int0150);
               NOME     := 'NOME DO CLIENTE';
               COD_PAIS := '001';
               CNPJ     := '123456789';
               CPF      := '123456789';
               IE       := '';
               COD_MUN  := 1;
               SUFRAMA  := '';
               ENDERECO := 'ENDERECO';
               NUM      := '';
               COMPL    := 'COMPLEMENTO';
               BAIRRO   := 'BAIRRO';
               //
               // FILHO - 5 Altera��es para cada cliente
               for int0175 := 1 to 5 do
               begin
                  with Registro0175New do
                  begin
                     DT_ALT   := Date + int0175;
                     NR_CAMPO := IntToStr(int0175);
                     CONT_ANT := 'CAMPO ANTERIOR ' + IntToStr(int0175);
                  end;
               end;
            end;
         end;
         // FILHO
         for int0300 := 1 to 10 do
         begin
            // 10 Bens Imobilizados
            with Registro0300New do
            begin
               COD_IND_BEM := FormatFloat('000000', int0300);
               IDENT_MERC  := 1;
               DESCR_ITEM  := 'DESCRI��O DO ITEM';
               COD_PRNC    := '';
               COD_CTA     := '';
               NR_PARC     := 10;
               // FILHO
               with Registro0305New do
               begin
                  COD_CTA_DEPR := '123456';
                  DT_DEPR_INI  := Date;
                  COD_CCUS     := '123';
                  VIDA_UTIL    := 60;
               end;
            end;
         end;
      end;
   end;
   btnB_0.Enabled := false;
end;

procedure TFrmSPEDFiscal.btnTXTClick(Sender: TObject);
begin
   with ACBrSpedFiscal1 do
   begin
      DT_INI := StrToDate('01/07/2009');
      DT_FIN := StrToDate('31/07/2009');
   end;

   // Limpa a lista de erros.
   edtError.Lines.Clear;
   // Informa o pata onde ser� salvo o arquivo TXT.
//   ACBrSpedFiscal1.Path := '.\Arquivo Sped TXT\';

   with ACBrSpedFiscal1 do
   begin
      // M�todo que gera o arquivo TXT.
      SaveFileTXT(edtFile.Text);
   end;
   // Carrega o arquivo TXT no memo.
   edtTXT.Lines.LoadFromFile(ACBrSpedFiscal1.Path + edtFile.Text);
   // Habilita os bot�es
   btnB_0.Enabled := true;
   btnB_1.Enabled := true;
   btnB_C.Enabled := true;
   btnB_D.Enabled := true;
   btnB_E.Enabled := true;
   btnB_H.Enabled := true;
end;

procedure TFrmSPEDFiscal.btnErrorClick(Sender: TObject);
begin
   with ACBrSpedFiscal1 do
   begin
      DT_INI := StrToDate('01/07/2009');
      DT_FIN := StrToDate('01/07/2009');
   end;

   // Limpa a lista de erros.
   edtError.Lines.Clear;

   with ACBrSpedFiscal1 do
   begin
      // M�todo que gera o arquivo TXT.
      SaveFileTXT(edtFile.Text);
   end;
   // Habilita os bot�es
   btnB_0.Enabled := true;
   btnB_1.Enabled := true;
   btnB_C.Enabled := true;
   btnB_D.Enabled := true;
   btnB_E.Enabled := true;
   btnB_H.Enabled := true;
end;

procedure TFrmSPEDFiscal.btnB_1Click(Sender: TObject);
begin
   // Alimenta o componente com informa��es para gerar todos os registros do
   // Bloco 1.
   with ACBrSpedFiscal1.Bloco_1 do
   begin
      with Registro1001New do
      begin
        IND_MOV := imSemDados;
      end;
   end;
   btnB_1.Enabled := false;
end;

procedure TFrmSPEDFiscal.btnB_CClick(Sender: TObject);
var
INotas: Integer;
IItens: Integer;
begin
   // Alimenta o componente com informa��es para gerar todos os registros do
   // Bloco C.
   with ACBrSpedFiscal1.Bloco_C do
   begin
      with RegistroC001New do
      begin
         IND_MOV := imComDados;
         //
         for INotas := 1 to 10 do
         begin
           with RegistroC100New do
           begin
             COD_PART      := '001';
             IND_EMIT      := edEmissaoPropria;
             IND_OPER      := tpEntradaAquisicao;
             COD_MOD       := '';
             COD_SIT       := sdRegular;
             SER           := '';
             NUM_DOC       := FormatFloat('NF000000',INotas);
             CHV_NFE       := '';
             DT_DOC        := Date();
             DT_E_S        := Date();
             VL_DOC        := 0;
             IND_PGTO      := tpSemPagamento;
             VL_DESC       := 0;
             VL_ABAT_NT    := 0;
             VL_MERC       := 0;
             IND_FRT       := tfSemCobrancaFrete;
             VL_SEG        := 0;
             VL_OUT_DA     := 0;
             VL_BC_ICMS    := 0;
             VL_ICMS       := 0;
             VL_BC_ICMS_ST := 0;
             VL_ICMS_ST    := 0;
             VL_IPI        := 0;
             VL_PIS        := 0;
             VL_COFINS     := 0;
             VL_PIS_ST     := 0;
             VL_COFINS_ST  := 0;
             //c170
             for IItens := 1 to 10 do
             begin
               with RegistroC170New do   //Inicio Adicionar os Itens:
               begin
                  NUM_ITEM    := FormatFloat('000', IItens);
                  COD_ITEM    := FormatFloat('000000',StrToInt(NUM_ITEM));
                  DESCR_COMPL := FormatFloat('NF000000',INotas)+' -> ITEM '+COD_ITEM;
                  QTD         := 1;
                  UNID        := 'UN';
                  VL_ITEM     := 0;
                  VL_DESC     := 0;
                  IND_MOV     := mfNao;
                  CST_ICMS    := '001';
                  CFOP        := '1252';
                  COD_NAT     := '64';
                  VL_BC_ICMS  := 0;
                  ALIQ_ICMS   := 0;
                  VL_ICMS     := 0;
                  VL_BC_ICMS_ST := 0;
                  ALIQ_ST       := 0;
                  VL_ICMS_ST    := 0;
                  IND_APUR      := iaMensal;
                  CST_IPI       := '';
                  COD_ENQ       := '';
                  VL_BC_IPI     := 0;
                  ALIQ_IPI      := 0;
                  VL_IPI        := 0;
                  CST_PIS       := '';
                  VL_BC_PIS     := 0;
                  ALIQ_PIS_PERC := 0;
                  QUANT_BC_PIS  := 0;
                  ALIQ_PIS_R    := 0;
                  VL_PIS        := 0;
                  CST_COFINS    := '';
                  VL_BC_COFINS  := 0;
                  ALIQ_COFINS_PERC := 0;
                  QUANT_BC_COFINS  := 0;
                  ALIQ_COFINS_R    := 0;
                  VL_COFINS        := 0;
                  COD_CTA          := '000';
                end; //Fim dos Itens;
             end;
             //c190
             for IItens := 1 to 10 do
             begin
               with RegistroC190New do
               begin
                  CST_ICMS    := '001';
                  CFOP        := '1252';
                  ALIQ_ICMS   := 0;
                  VL_OPR      := 0;
                  VL_BC_ICMS  := 0;
                  VL_ICMS     := 0;
                  VL_BC_ICMS_ST := 0;
                  VL_ICMS_ST    := 0;
                  VL_RED_BC     := 0;
                  VL_IPI        := 0;
                  COD_OBS       := '000';
               end;//Fim dos Itens;
             end;
           end;
           with RegistroC300New do
           begin

           end;
         end;
      end;
   end;
   btnB_C.Enabled := false;
end;

procedure TFrmSPEDFiscal.btnB_DClick(Sender: TObject);
begin
   // Alimenta o componente com informa��es para gerar todos os registros do
   // Bloco D.
//   with ACBrSpedFiscal1.Bloco_D do
//   begin
//      with RegistroD001New do
//      begin
//        IND_MOV := 1;
//      end;
//   end;
   btnB_D.Enabled := false;
end;

procedure TFrmSPEDFiscal.btnB_EClick(Sender: TObject);
begin
   // Alimenta o componente com informa��es para gerar todos os registros do
   // Bloco E.
   with ACBrSpedFiscal1.Bloco_E do
   begin
      // Abertura do Bloco E
      with RegistroE001New do
      begin
//         IND_MOV := imComDados;
         ///
         with RegistroE110New do
         begin
            VL_TOT_DEBITOS := 0;
            VL_AJ_DEBITOS := 0;
            VL_TOT_AJ_DEBITOS := 0;
            VL_ESTORNOS_CRED := 0;
            VL_TOT_CREDITOS := 0;
            VL_AJ_CREDITOS := 0;
            VL_TOT_AJ_CREDITOS := 0;
            VL_ESTORNOS_DEB := 0;
            VL_SLD_CREDOR_ANT := 0;
            VL_SLD_APURADO := 0;
            VL_TOT_DED := 0;
            VL_ICMS_RECOLHER := 0;
            VL_SLD_CREDOR_TRANSPORTAR := 0;
            DEB_ESP := 0;
         end;
      end;
   end;
   btnB_E.Enabled := false;
end;

procedure TFrmSPEDFiscal.btnB_HClick(Sender: TObject);
var
IInvent: integer;
begin
   // Alimenta o componente com informa��es para gerar todos os registros do
   // Bloco H.
   with ACBrSpedFiscal1.Bloco_H do
   begin
      with RegistroH001New do
      begin
//         IND_MOV := imComDados;
         //
         with RegistroH005New do
         begin
            DT_INV := Date;
            VL_INV := 1000;
            // FILHO
            for IInvent := 1 to 10 do
            begin
               with RegistroH010New do
               begin
                  COD_ITEM := FormatFloat('00000000000000', IInvent);
                  UNID := 'UN';
                  QTD  := 1;
                  VL_UNIT := 100;
                  VL_ITEM := 100;
                  IND_PROP := piInformante;
                  COD_PART := '';
                  TXT_COMPL := '';
                  COD_CTA := '';
               end;
            end;
         end;
      end;
   end;
   btnB_H.Enabled := false;
end;

initialization
{$IFDEF FPC}
   {$I Frm_SPEDFiscal.lrs}
{$ENDIF}

end.
