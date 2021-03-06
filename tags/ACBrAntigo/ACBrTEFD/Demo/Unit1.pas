unit Unit1;

{$IFDEF FPC}
 {$mode objfpc}{$H+}
{$ENDIF}

interface

uses
  Classes, SysUtils,
  Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ComCtrls, ACBrECF, ACBrDevice, ACBrTEFD,
  ACBrTEFDClass, ACBrUtil , ACBrTEFDCliSiTef, ACBrBase;

type

  { TForm1 }

  TForm1 = class(TForm)
     ACBrECF1 : TACBrECF;
     ACBrTEFD1 : TACBrTEFD;
     bAbreVendeSubTotaliza1 : TButton;
     bAbreVendeSubTotaliza2 : TButton;
     bAbreVendeSubTotaliza3 : TButton;
     bAbreVendeSubTotaliza4 : TButton;
     bADM : TButton;
     bAtivar : TButton;
     bFechaRelatorio : TButton;
     bFPG : TButton;
     bAtivarGP : TButton;
     bATV : TButton;
     bAbreVendeSubTotaliza : TButton;
     bCNC : TButton;
     bCNF : TButton;
     bCRT : TButton;
     bCHQ : TButton;
     bFechar : TButton;
     bInicializar : TButton;
     bLeituraX : TButton;
     bNCN : TButton;
     bPagamento : TButton;
     bReducaoZ : TButton;
     btSerial : TSpeedButton;
     bCancelarResp : TButton;
     bVendeItem : TButton;
     bSubTotaliza : TButton;
     bCancelar : TButton;
     bAbreCupom : TButton;
     bEstado : TButton;
     cbxGP : TComboBox;
     cbxGP1 : TComboBox;
     cbxModelo : TComboBox;
     cbxPorta : TComboBox;
     ckAutoAtivar : TCheckBox;
     ckAutoEfetuarPagamento : TCheckBox;
     ckAutoFinalizarCupom : TCheckBox;
     ckHIPERTEF : TCheckBox;
     ckMultiplosCartoes : TCheckBox;
     ckMultiplosCartoes1 : TCheckBox;
     ckTEFDIAL : TCheckBox;
     ckTEFDISC : TCheckBox;
     edEsperaSTS : TEdit;
     edFPGCartao : TEdit;
     edFPGCheque : TEdit;
     edEsperaSleep : TEdit;
     edValorECF : TEdit;
     edValorTEF : TEdit;
     gbComandosTEF : TGroupBox;
     gbConfigECF : TGroupBox;
     gbConfigTEF : TGroupBox;
     gbCupomECF : TGroupBox;
     Label1 : TLabel;
     Label10 : TLabel;
     Label11 : TLabel;
     Label2 : TLabel;
     Label3 : TLabel;
     Label4 : TLabel;
     Label5 : TLabel;
     Label6 : TLabel;
     Label7 : TLabel;
     Label8 : TLabel;
     Label9 : TLabel;
     lECFName : TLabel;
     Memo1 : TMemo;
     PageControl1 : TPageControl;
     Panel1 : TPanel;
     Panel2 : TPanel;
     pMensagemOperador : TPanel;
     pMensagemCliente : TPanel;
     pMensagem : TPanel;
     sECF : TShape;
     sHiperTEF : TShape;
     StatusBar1 : TStatusBar;
     sTEFDial : TShape;
     sTEFDisc : TShape;
     tsConfig : TTabSheet;
     tsOperacao : TTabSheet;
    sCliSiTef: TShape;
    ckCliSiTef: TCheckBox;
     procedure ACBrTEFD1AguardaResp(Arquivo : String;
        SegundosTimeOut : Integer; var Interromper : Boolean);
     procedure ACBrTEFD1AntesCancelarTransacao(RespostaPendente: TACBrTEFDResp);{%h-}
     procedure ACBrTEFD1AntesFinalizarRequisicao(Req : TACBrTEFDReq);
     procedure ACBrTEFD1BloqueiaMouseTeclado(Bloqueia : Boolean;
        var Tratado : Boolean);
     procedure ACBrTEFD1ComandaECF(Operacao : TACBrTEFDOperacaoECF;
        Resp : TACBrTEFDResp; var RetornoECF : Integer );{%h-}
     procedure ACBrTEFD1ComandaECFAbreVinculado(COO, IndiceECF : String;
        Valor : Double; var RetornoECF : Integer);
     procedure ACBrTEFD1ComandaECFImprimeVia(
        TipoRelatorio : TACBrTEFDTipoRelatorio; Via : Integer;
        ImagemComprovante : TStringList; var RetornoECF : Integer);
     procedure ACBrTEFD1ComandaECFPagamento(IndiceECF : String; Valor : Double;
        var RetornoECF : Integer);
     procedure ACBrTEFD1DepoisConfirmarTransacoes(
        RespostasPendentes: TACBrTEFDRespostasPendentes);
     procedure ACBrTEFD1ExibeMsg(Operacao : TACBrTEFDOperacaoMensagem;
        Mensagem : String; var AModalResult : TModalResult);
     procedure ACBrTEFD1InfoECF(Operacao : TACBrTEFDInfoECF;
        var RetornoECF : String );
     procedure ACBrTEFD1MudaEstadoReq(EstadoReq : TACBrTEFDReqEstado);
     procedure ACBrTEFD1MudaEstadoResp(EstadoResp : TACBrTEFDRespEstado);
     procedure ACBrTEFD1RestauraFocoAplicacao(var Tratado : Boolean);
     procedure bAbreVendeSubTotaliza1Click(Sender : TObject);
     procedure bAbreVendeSubTotaliza2Click(Sender : TObject);
     procedure bAbreVendeSubTotaliza3Click(Sender : TObject);
     procedure bAbreVendeSubTotaliza4Click(Sender : TObject);
     procedure bCancelarRespClick(Sender : TObject);
     procedure cbxGPChange(Sender : TObject);
     procedure ckCliSiTefChange(Sender : TObject);
     procedure edEsperaSleepChange(Sender : TObject);
     procedure edEsperaSTSChange(Sender : TObject);
     procedure pMensagemOperadorClick(Sender: TObject);
     procedure pMensagemResize(Sender : TObject);
     procedure TrataErros(Sender : TObject; E : Exception);
     procedure bAbreVendeSubTotalizaClick(Sender : TObject);
     procedure bCHQClick(Sender : TObject);
     procedure bCNCClick(Sender : TObject);
     procedure bCNFClick(Sender : TObject);
     procedure bCRTClick(Sender : TObject);
     procedure bEstadoClick(Sender : TObject);
     procedure bFecharClick(Sender : TObject);
     procedure bFPGClick(Sender : TObject);
     procedure bNCNClick(Sender : TObject);
     procedure bPagamentoClick(Sender : TObject);
     procedure bSubTotalizaClick(Sender : TObject);
     procedure bVendeItemClick(Sender : TObject);
     procedure bAbreCupomClick(Sender : TObject);
     procedure bADMClick(Sender : TObject);
     procedure bAtivarGPClick(Sender : TObject);
     procedure bATVClick(Sender : TObject);
     procedure bInicializarClick(Sender : TObject);
     procedure bAtivarClick(Sender : TObject);
     procedure btSerialClick(Sender : TObject);
     procedure bReducaoZClick(Sender : TObject);
     procedure bLeituraXClick(Sender : TObject);
     procedure bFechaRelatorioClick(Sender : TObject);
     procedure bCancelarClick(Sender : TObject);
     procedure cbxModeloChange(Sender : TObject);
     procedure cbxPortaChange(Sender : TObject);
     procedure ckAutoEfetuarPagamentoChange(Sender : TObject);
     procedure ckAutoFinalizarCupomChange(Sender : TObject);
     procedure ckMultiplosCartoesChange(Sender : TObject);
     procedure ckAutoAtivarChange(Sender : TObject);
     procedure ckHIPERTEFChange(Sender : TObject);
     procedure ckTEFDISCChange(Sender : TObject);
     procedure FormCloseQuery(Sender : TObject; var CanClose : boolean);
     procedure FormCreate(Sender : TObject);
     procedure ckTEFDIALChange(Sender : TObject);
     procedure Memo1Change(Sender : TObject);
    procedure ACBrTEFD1CliSiTefObtemCampo(Titulo: String; TamanhoMinimo,
      TamanhoMaximo, TipoCampo: Integer;
      Operacao: TACBrTEFDCliSiTefOperacaoCampo; var Resposta: AnsiString;
      var Digitado, VoltarMenu: Boolean);
    procedure ACBrTEFD1CliSiTefExibeMenu(Titulo: String;
      Opcoes: TStringList; var ItemSelecionado: Integer;
      var VoltarMenu: Boolean);
  private
     fCancelado : Boolean ;

     procedure AvaliaTEFs;
     procedure MostraSaldoRestante;
     procedure VerificaECFAtivo;
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form1 : TForm1; 

implementation

Uses typinfo, dateutils, strutils, ConfiguraSerial, Unit2, Unit3, Unit4, Unit5;

{$IFNDEF FPC}
 {$R *.dfm}
{$ELSE}
 {$R *.lfm}
{$ENDIF}

{ TForm1 }

procedure TForm1.FormCreate(Sender : TObject);
var
   I : TACBrTEFDTipo;
   J : TACBrECFModelo;
begin
  fCancelado := False ;
  Application.OnException := {$IFDEF FPC}@{$ENDIF}TrataErros;

  cbxModelo.Items.Clear ;
  For J := Low(TACBrECFModelo) to High(TACBrECFModelo) do
     cbxModelo.Items.Add( GetEnumName(TypeInfo(TACBrECFModelo), integer(J) ) ) ;
  cbxModelo.Items[0] := 'Procurar' ;
  cbxModelo.ItemIndex := 0 ;

  cbxGP.Items.Clear ;
  For I := Low(TACBrTEFDTipo) to High(TACBrTEFDTipo) do
     cbxGP.Items.Add( GetEnumName(TypeInfo(TACBrTEFDTipo), integer(I) ) ) ;
  cbxGP.Items[0] := 'Todos' ;
  cbxGP.ItemIndex := 0 ;

  cbxGP1.Items.Assign(cbxGP.Items);
  cbxGP1.ItemIndex := 0 ;

  PageControl1.ActivePageIndex := 0 ;
  Memo1.Lines.Clear;

  pMensagem.Visible := False ;
  pMensagem.Align   := alClient ;
end;

procedure TForm1.ckTEFDIALChange(Sender : TObject);
begin
   ACBrTEFD1.TEFDial.Habilitado := ckTEFDIAL.Checked;
end;

procedure TForm1.Memo1Change(Sender : TObject);
begin
  StatusBar1.Panels[0].Text := GetEnumName(TypeInfo(TACBrTEFDTipo), integer(ACBrTEFD1.GPAtual) ) ;
  StatusBar1.Panels[1].Text := '' ;
  StatusBar1.Panels[2].Text := '' ;
end;

procedure TForm1.AvaliaTEFs;
begin
  if ACBrTEFD1.TEFDial.Inicializado then
     sTEFDial.Brush.Color := clLime
  else
     sTEFDial.Brush.Color := clRed ;
  ckTEFDIAL.Checked := ACBrTEFD1.TEFDial.Habilitado;

  if ACBrTEFD1.TEFDisc.Inicializado then
     sTEFDisc.Brush.Color := clLime
  else
     sTEFDisc.Brush.Color := clRed ;
  ckTEFDISC.Checked := ACBrTEFD1.TEFDisc.Habilitado;

  if ACBrTEFD1.TEFHiper.Inicializado then
     sHiperTEF.Brush.Color := clLime
  else
     sHiperTEF.Brush.Color := clRed ;
  ckHIPERTEF.Checked := ACBrTEFD1.TEFHiper.Habilitado;

  if ACBrTEFD1.TEFCliSiTef.Inicializado then
     sCliSiTef.Brush.Color := clLime
  else
     sCliSiTef.Brush.Color := clRed ;
  ckCliSiTef.Checked := ACBrTEFD1.TEFCliSiTef.Habilitado;

  cbxGP.ItemIndex  := Integer( ACBrTEFD1.GPAtual ) ;
  cbxGP1.ItemIndex := cbxGP.ItemIndex ;
end;

procedure TForm1.MostraSaldoRestante;
Var
  Saldo : Double ;
begin
  Saldo := ACBrECF1.Subtotal - ACBrECF1.TotalPago ;
  if not ACBrTEFD1.AutoEfetuarPagamento then
     Saldo := Saldo - ACBrTEFD1.RespostasPendentes.TotalPago;

  Memo1.Lines.Add( 'Saldo Restante: '+FormatFloat('0.00',Saldo)) ;
end;

procedure TForm1.VerificaECFAtivo;
begin
   if not ACBrECF1.Ativo then
      Memo1.Lines.Add( ACBrStr( 'ATEN??O !! O ECF AINDA N?O FOI ATIVADO' ) );
end;

procedure TForm1.bInicializarClick(Sender : TObject);
begin
  if bInicializar.Caption = 'Inicializar' then
   begin
     Memo1.Lines.Add('Inicializando: ' + cbxGP.Text );
     ACBrTEFD1.Inicializar( TACBrTEFDTipo( cbxGP.ItemIndex ) );
     Memo1.Lines.Add('ACBrTEFD.Inicializar Executado' );
     bInicializar.Caption := 'DesInicializar' ;
   end
  else
   begin
     ACBrTEFD1.DesInicializar( TACBrTEFDTipo( cbxGP.ItemIndex ) );
     Memo1.Lines.Add('ACBrTEFD.DesInicializar Executado' );
     bInicializar.Caption := 'Inicializar' ;
   end;

  AvaliaTEFs;
end;

procedure TForm1.bAtivarGPClick(Sender : TObject);
begin
  Memo1.Lines.Add('Ativando GP: ' + cbxGP.Text );
  ACBrTEFD1.AtivarGP( TACBrTEFDTipo( cbxGP.ItemIndex ) );
  Memo1.Lines.Add('ACBrTEFD.AtivarGP Executado' );

  AvaliaTEFs;
end;

procedure TForm1.bAtivarClick(Sender : TObject);
begin
  if bAtivar.Caption = 'Ativar' then
   begin
     try
        ACBrECF1.Porta := cbxPorta.Text ;

        if cbxModelo.ItemIndex = 0 then
           if not ACBrECF1.AcharECF(true,False) then
           begin
              MessageDlg('Nenhum ECF encontrado.',mtInformation,[mbOk],0) ;
              exit ;
           end ;

        ACBrECF1.Ativar ;

        Memo1.Lines.Add( 'Ativar ECF' );
     finally
        cbxModelo.ItemIndex := Integer(ACBrECF1.Modelo) ;
        cbxPorta.Text       := ACBrECF1.Porta ;
        lECFName.Caption    := GetEnumName(TypeInfo(TACBrECFModelo), cbxModelo.ItemIndex ) ;
        if ACBrECF1.Ativo then
         begin
           sECF.Brush.Color := clLime ;
           bAtivar.Caption := 'Desativar' ;
         end
        else
           sECF.Brush.Color := clRed;

        btSerial.Enabled   := not ACBrECF1.Ativo ;
        gbCupomECF.Enabled := ACBrECF1.Ativo ;
     end ;
   end
  else
   begin
     ACBrECF1.Desativar ;
     bAtivar.Caption := 'Ativar' ;
     Memo1.Lines.Add( 'Desativar ECF' );
     sECF.Brush.Color   := clRed;
     gbCupomECF.Enabled := False ;
     btSerial.Enabled   := True ;
   end;
end;

procedure TForm1.btSerialClick(Sender : TObject);
Var
  frConfiguraSerial : TfrConfiguraSerial ;
begin
  frConfiguraSerial := TfrConfiguraSerial.Create(self);

  try
    frConfiguraSerial.Device.Porta        := ACBrECF1.Device.Porta ;
    frConfiguraSerial.cmbPortaSerial.Text := cbxPorta.Text ;
    frConfiguraSerial.Device.ParamsString := ACBrECF1.Device.ParamsString ;

    if frConfiguraSerial.ShowModal = mrOk then
    begin
       cbxPorta.Text                := frConfiguraSerial.Device.Porta ;
       ACBrECF1.Device.ParamsString := frConfiguraSerial.Device.ParamsString ;
    end ;
  finally
     FreeAndNil( frConfiguraSerial ) ;
  end ;
end;

procedure TForm1.bReducaoZClick(Sender : TObject);
begin
  if ACBrECF1.Estado <> estRequerZ then
  begin
     if MessageDlg( ACBrStr( 'A Redu??o Z pode Bloquear o seu ECF at? a 12:00pm'+#10+#10+
                  'Continua assim mesmo ?'),mtWarning,mbYesNoCancel,0) <> mrYes then
        exit ;

     if MessageDlg( ACBrStr('Voc? tem certeza ?'),mtWarning,mbYesNoCancel,0) <> mrYes then
        exit ;
  end ;

   self.Enabled := False ;
   try
      ACBrECF1.ReducaoZ ;
      Memo1.Lines.Add('ACBrECF.ReducaoZ');
   finally
     self.Enabled := True ;
   end;
end;

procedure TForm1.bLeituraXClick(Sender : TObject);
begin
  self.Enabled := False ;
  try
    ACBrECF1.LeituraX;
    Memo1.Lines.Add('ACBrECF.LeituraX');
  finally
    self.Enabled := True ;
  end;
end;

procedure TForm1.bFechaRelatorioClick(Sender : TObject);
begin
   ACBrECF1.FechaRelatorio;
   Memo1.Lines.Add('ACBrECF.FechaRelatorio');
end;

procedure TForm1.bAbreCupomClick(Sender : TObject);
begin
  ACBrECF1.AbreCupom;
  Memo1.Lines.Add('ACBrECF.AbreCupom');
end;

procedure TForm1.bVendeItemClick(Sender : TObject);
Var
  Valor : Double ;
begin
  Valor := StrToFloat(edValorECF.Text);

  try
    bVendeItem.Enabled := False ;
    ACBrECF1.VendeItem('12345','PRODUTO TESTE','NN',1,Valor);
    Memo1.Lines.Add('ACBrECF.VendeItem');
  finally
    bVendeItem.Enabled := True ;
  end;
end;

procedure TForm1.bSubTotalizaClick(Sender : TObject);
begin
  ACBrECF1.SubtotalizaCupom ;
  Memo1.Lines.Add('ACBrECF.SubtotalizaCupom');
  MostraSaldoRestante;
end;

procedure TForm1.bPagamentoClick(Sender : TObject);
Var
  CodFormaPagamento, ValorStr : String;
begin
  CodFormaPagamento := '01' ;
  ValorStr          := '0' ;

  if not InputQuery('Pagamento','Digite o Cod.Forma Pagamento',CodFormaPagamento ) then
     exit ;

  if not InputQuery('Pagamento','Digite o Valor a Pagar',ValorStr ) then
     exit ;

  if StrToFloatDef(ValorStr,0) = 0 then
     exit ;

  ACBrECF1.EfetuaPagamento( CodFormaPagamento, StrToFloat(ValorStr) );
  Memo1.Lines.Add('ACBrECF.EfetuaPagamento');
  MostraSaldoRestante;
end;

procedure TForm1.bFecharClick(Sender : TObject);
begin
   ACBrECF1.FechaCupom('Projeto ACBr|http://acbr.sf.net');
   Memo1.Lines.Add('ACBrECF.FechaCupom');
end;

procedure TForm1.bFPGClick(Sender : TObject);
Var
  A : Integer ;
begin
  ACBrECF1.CarregaFormasPagamento ;

  for A := 0 to ACBrECF1.FormasPagamento.Count -1 do
  begin
     if ACBrECF1.FormasPagamento[A].Descricao <> '' then
        Memo1.Lines.Add( 'Forma Pagto: '+ACBrECF1.FormasPagamento[A].Indice+' -> '+
           ACBrECF1.FormasPagamento[A].Descricao+'  Permite Vinculado: '+
           IfThen( ACBrECF1.FormasPagamento[A].PermiteVinculado,'S','N'));
  end ;
  Memo1.Lines.Add('---------------------------------');
end;

procedure TForm1.bNCNClick(Sender : TObject);
Var
  AForm : TForm3 ;
begin
  VerificaECFAtivo;

  AForm := TForm3.Create(self);

  try
    AForm.IsNCN := True ;
    if AForm.ShowModal = mrOK then
    begin
      Memo1.Lines.Add( ACBrStr('Inicio de NCN - Rede: '+
                       AForm.cbxRede.Text+' NSU: '+AForm.edNSU.Text+
                       ' Finaliza??o: '+AForm.edFinalizacao.Text+
                       ' Valor: '+AForm.edValor.Text ) );
      ACBrTEFD1.NCN( AForm.cbxRede.Text,
                     AForm.edNSU.Text,
                     AForm.edFinalizacao.Text,
                     StrToFloat( AForm.edValor.Text ) );
      Memo1.Lines.Add('NCN executado com sucesso');
    end;
  finally
    AForm.Free ;
  end;
end;

procedure TForm1.bCancelarClick(Sender : TObject);
begin
   ACBrECF1.CancelaCupom;
   Memo1.Lines.Add('ACBrECF.CancelaCupom');
   ACBrTEFD1.CancelarTransacoesPendentes;
   Memo1.Lines.Add('ACBrTEFD1.CancelaTransacoesPendentes');
end;

procedure TForm1.cbxModeloChange(Sender : TObject);
begin
  try
     ACBrECF1.Modelo := TACBrECFModelo( cbxModelo.ItemIndex ) ;
  except
     cbxModelo.ItemIndex := Integer( ACBrECF1.Modelo ) ;
     raise ;
  end ;
end;

procedure TForm1.cbxPortaChange(Sender : TObject);
begin
  try
    ACBrECF1.Porta := cbxPorta.Text ;
  finally
     cbxPorta.Text := ACBrECF1.Porta ;
  end ;
end;

procedure TForm1.ckAutoEfetuarPagamentoChange(Sender : TObject);
begin
  ACBrTEFD1.AutoEfetuarPagamento := ckAutoEfetuarPagamento.Checked;
end;

procedure TForm1.ckAutoFinalizarCupomChange(Sender : TObject);
begin
  ACBrTEFD1.AutoFinalizarCupom := ckAutoFinalizarCupom.Checked;
end;

procedure TForm1.ckMultiplosCartoesChange(Sender : TObject);
begin
  try
    ACBrTEFD1.MultiplosCartoes := TCheckBox(Sender).Checked ;
  finally
    ckMultiplosCartoes.Checked := ACBrTEFD1.MultiplosCartoes ;
  end;
end;

procedure TForm1.ckAutoAtivarChange(Sender : TObject);
begin
   ACBrTEFD1.AutoAtivarGP := ckAutoAtivar.Checked;
end;

procedure TForm1.ckHIPERTEFChange(Sender : TObject);
begin
  ACBrTEFD1.TEFHiper.Habilitado := ckHIPERTEF.Checked;
end;

procedure TForm1.ckTEFDISCChange(Sender : TObject);
begin
  ACBrTEFD1.TEFDisc.Habilitado := ckTEFDISC.Checked;
end;

procedure TForm1.FormCloseQuery(Sender : TObject; var CanClose : boolean);
begin
   CanClose := self.Enabled ;
end;

procedure TForm1.bATVClick(Sender : TObject);
begin
  Memo1.Lines.Add('Inicio de ATV');
  ACBrTEFD1.ATV( TACBrTEFDTipo( cbxGP1.ItemIndex ) );
  Memo1.Lines.Add('ATV executado com sucesso');
end;

procedure TForm1.bADMClick(Sender : TObject);
begin
  VerificaECFAtivo;

  Memo1.Lines.Add('Inicio de ADM');
  ACBrTEFD1.ADM( TACBrTEFDTipo( cbxGP1.ItemIndex ) );
  Memo1.Lines.Add('ADM executado com sucesso');
end;

procedure TForm1.ACBrTEFD1ExibeMsg(Operacao : TACBrTEFDOperacaoMensagem;
   Mensagem : String; var AModalResult : TModalResult);
var
   Fim : TDateTime;
   OldMensagem : String;
begin
  StatusBar1.Panels[1].Text := '' ;
  StatusBar1.Panels[2].Text := '' ;

  case Operacao of

    opmOK :
       AModalResult := MessageDlg( Mensagem, mtInformation, [mbOK], 0);

    opmYesNo :
       AModalResult := MessageDlg( Mensagem, mtConfirmation, [mbYes,mbNo], 0);

    opmExibirMsgOperador, opmRemoverMsgOperador :
         pMensagemOperador.Caption := Mensagem ;

    opmExibirMsgCliente, opmRemoverMsgCliente :
         pMensagemCliente.Caption := Mensagem ;

    opmDestaqueVia :
       begin
         OldMensagem := pMensagemOperador.Caption ;
         try
            pMensagemOperador.Caption := Mensagem ;
            pMensagemOperador.Visible := True ;
            pMensagem.Visible         := True ;

            { Aguardando 3 segundos }
            Fim := IncSecond( now, 3)  ;
            repeat
               sleep(200) ;
               pMensagemOperador.Caption := Mensagem + ' ' + IntToStr(SecondsBetween(Fim,now));
               Application.ProcessMessages;
            until (now > Fim) ;

         finally
            pMensagemOperador.Caption := OldMensagem ;
         end;
       end;
  end;

  pMensagemOperador.Visible := (pMensagemOperador.Caption <> '') ;
  pMensagemCliente.Visible  := (pMensagemCliente.Caption <> '') ;

  pMensagem.Visible := pMensagemOperador.Visible or pMensagemCliente.Visible;
  Application.ProcessMessages;
end;

procedure TForm1.ACBrTEFD1InfoECF(Operacao : TACBrTEFDInfoECF;
   var RetornoECF : String );
begin
   if not ACBrECF1.Ativo then
      ACBrECF1.Ativar;

   case Operacao of
     ineSubTotal :
        RetornoECF := FloatToStr( ACBrECF1.Subtotal-ACBrECF1.TotalPago ) ;

     ineEstadoECF :
       begin
         Case ACBrECF1.Estado of
           estLivre     : RetornoECF := 'L' ;
           estVenda     : RetornoECF := 'V' ;
           estPagamento : RetornoECF := 'P' ;
           estRelatorio : RetornoECF := 'R' ;
         else
           RetornoECF := 'O' ;
         end;
       end;
   end;
end;

procedure TForm1.ACBrTEFD1MudaEstadoReq(EstadoReq : TACBrTEFDReqEstado);
begin
   StatusBar1.Panels[1].Text := GetEnumName(TypeInfo(TACBrTEFDReqEstado), Integer(EstadoReq) ) ;
   fCancelado := False ;
end;

procedure TForm1.ACBrTEFD1MudaEstadoResp(EstadoResp : TACBrTEFDRespEstado);
begin
  StatusBar1.Panels[1].Text := GetEnumName(TypeInfo(TACBrTEFDRespEstado), Integer(EstadoResp) ) ;
  bCancelarResp.Visible     := (EstadoResp = respAguardandoResposta) ;
end;

procedure TForm1.ACBrTEFD1RestauraFocoAplicacao(var Tratado : Boolean);
begin
  Application.BringToFront;

  Tratado := False ;  { Deixa executar o c?digo de Foco do ACBrTEFD }
end;

procedure TForm1.bAbreVendeSubTotaliza1Click(Sender : TObject);
begin
   ACBrTEFD1.CancelarTransacoesPendentes;
end;

procedure TForm1.bAbreVendeSubTotaliza2Click(Sender : TObject);
begin
   ACBrTEFD1.ConfirmarTransacoesPendentes;
end;

procedure TForm1.bAbreVendeSubTotaliza3Click(Sender : TObject);
begin
   ACBrTEFD1.ImprimirTransacoesPendentes;
end;

procedure TForm1.bAbreVendeSubTotaliza4Click(Sender : TObject);
begin
   ACBrTEFD1.FinalizarCupom;
end;

procedure TForm1.bCancelarRespClick(Sender : TObject);
begin
   fCancelado := True ;
end;

procedure TForm1.cbxGPChange(Sender : TObject);
begin
  if not (Sender is TComboBox) then exit ;

  try
    ACBrTEFD1.GPAtual := TACBrTEFDTipo(  TComboBox(Sender).ItemIndex ) ;
  finally
    AvaliaTEFs;
  end;
end;

procedure TForm1.ckCliSiTefChange(Sender : TObject);
begin
  ACBrTEFD1.TEFCliSiTef.Habilitado := ckCliSiTef.Checked;
end;

procedure TForm1.edEsperaSleepChange(Sender : TObject);
begin
   ACBrTEFD1.EsperaSleep := StrToInt(edEsperaSleep.Text);
end;

procedure TForm1.edEsperaSTSChange(Sender : TObject);
begin
   ACBrTEFD1.EsperaSTS := StrToInt(edEsperaSTS.Text);
end;

procedure TForm1.pMensagemOperadorClick(Sender: TObject);
begin
   pMensagem.Visible:= False ;
end;

procedure TForm1.pMensagemResize(Sender : TObject);
begin
   pMensagemCliente.Height := Trunc( pMensagem.Height / 2 ) ;
end;

procedure TForm1.TrataErros(Sender : TObject; E : Exception);
begin
  Memo1.Lines.Add( E.Message );
  StatusBar1.Panels[1].Text := 'Exception' ;
  StatusBar1.Panels[2].Text := StringReplace( E.Message, sLineBreak, ' ', [rfReplaceAll] ) ;
  pMensagem.Visible := False ;
end;

procedure TForm1.bAbreVendeSubTotalizaClick(Sender : TObject);
Var
  Valor : Double ;
begin
  Valor := StrToFloat(edValorECF.Text);

  try
    self.Enabled := False ;
    ACBrECF1.AbreCupom;
    Memo1.Lines.Add('ACBrECF.AbreCupom');

    ACBrECF1.VendeItem('12345','PRODUTO TESTE','NN',1,Valor);
    Memo1.Lines.Add('ACBrECF.VendeItem');

    ACBrECF1.SubtotalizaCupom ;
    Memo1.Lines.Add('ACBrECF.SubtotalizaCupom');
    MostraSaldoRestante;
  finally
    self.Enabled := True ;
  end;
end;

procedure TForm1.bCHQClick(Sender : TObject);
begin
  ACBrTEFD1.CHQ( StrToFloat(edValorTEF.Text) ,edFPGCheque.Text, ACBrECF1.NumCOO);
  MostraSaldoRestante;
end;

procedure TForm1.bCNCClick(Sender : TObject);
Var
  AForm : TForm2 ;
  DT    : TDateTime ;
begin
  VerificaECFAtivo;

  AForm := TForm2.Create(self);

  try
    if AForm.ShowModal = mrOK then
    begin
      DT := EncodeDateTime( StrToInt(copy(AForm.edData.Text,7,4)),
                            StrToInt(copy(AForm.edData.Text,4,2)),
                            StrToInt(copy(AForm.edData.Text,1,2)),
                            StrToInt(copy(AForm.meHora.Text,1,2)),
                            StrToInt(copy(AForm.meHora.Text,4,2)),
                            StrToInt(copy(AForm.meHora.Text,7,2)), 0) ;

      Memo1.Lines.Add( ACBrStr( 'Inicio de CNC - Rede: '+
                       AForm.cbxRede.Text+' NSU: '+AForm.edNSU.Text+
                       ' DataHora: '+DateTimeToStr(DT)+
                       ' Valor: '+AForm.edValor.Text ) );
      ACBrTEFD1.CNC( AForm.cbxRede.Text,
                     AForm.edNSU.Text,
                     DT,
                     StrToFloat( AForm.edValor.Text ) );
      Memo1.Lines.Add('CNC executado com sucesso');

    end;
  finally
    AForm.Free ;
  end;
end;

procedure TForm1.bCNFClick(Sender : TObject);
Var
  AForm : TForm3 ;
begin
  VerificaECFAtivo;

  AForm := TForm3.Create(self);

  try
    AForm.IsNCN := False ;
    if AForm.ShowModal = mrOK then
    begin
      Memo1.Lines.Add( ACBrStr( 'Inicio de CNF - Rede: '+
                       AForm.cbxRede.Text+' NSU: '+AForm.edNSU.Text+
                       ' Finaliza??o: '+AForm.edFinalizacao.Text) );
      ACBrTEFD1.CNF( AForm.cbxRede.Text,
                     AForm.edNSU.Text,
                     AForm.edFinalizacao.Text);
      Memo1.Lines.Add('CNF executado com sucesso');
    end;
  finally
    AForm.Free ;
  end;
end;

procedure TForm1.bCRTClick(Sender : TObject);
begin
   ACBrTEFD1.CRT( StrToFloat(edValorTEF.Text) ,edFPGCartao.Text, ACBrECF1.NumCOO);
   MostraSaldoRestante;
end;

procedure TForm1.bEstadoClick(Sender : TObject);
begin
   Memo1.Lines.Add('Estado: '+GetEnumName(TypeInfo(TACBrECFEstado), Integer(ACBrECF1.Estado) )) ;
end;

procedure TForm1.ACBrTEFD1AguardaResp(Arquivo : String;
   SegundosTimeOut : Integer; var Interromper : Boolean);
begin
   StatusBar1.Panels[2].Text := 'Aguardando: '+Arquivo+' '+IntToStr(SegundosTimeOut) ;
   Application.ProcessMessages;

   if fCancelado then
      Interromper := True ;
end;

procedure TForm1.ACBrTEFD1AntesCancelarTransacao(RespostaPendente: TACBrTEFDResp
   );
var
   Est: TACBrECFEstado;
begin
   Est := ACBrECF1.Estado;

   case Est of
      estVenda, estPagamento :
        ACBrECF1.CancelaCupom;

      estRelatorio :
          ACBrECF1.FechaRelatorio;
   else
      if not ( Est in [estLivre, estDesconhecido, estNaoInicializada] ) then
         ACBrECF1.CorrigeEstadoErro( False ) ;
   end;
end;

procedure TForm1.ACBrTEFD1AntesFinalizarRequisicao(Req : TACBrTEFDReq);
begin
   if Req.Header = 'CRT' then
      Req.GravaInformacao(777,777,'TESTE REDECARD');
   Memo1.Lines.Add('Enviando: '+Req.Header+' ID: '+IntToStr( Req.ID ) );
end;

procedure TForm1.ACBrTEFD1BloqueiaMouseTeclado(Bloqueia : Boolean;
   var Tratado : Boolean);
begin
  self.Enabled := not Bloqueia ;
  Memo1.Lines.Add('BloqueiaMouseTeclado = '+IfThen(Bloqueia,'SIM', 'NAO'));

  Tratado := False ;  { Deixa executar o c?digo de Bloqueio do ACBrTEFD }
end;

procedure TForm1.ACBrTEFD1ComandaECF(Operacao : TACBrTEFDOperacaoECF;
   Resp : TACBrTEFDResp; var RetornoECF : Integer );
begin
  Memo1.Lines.Add('ComandaECF: '+GetEnumName( TypeInfo(TACBrTEFDOperacaoECF),
                                              integer(Operacao) ));
  try
    case Operacao of
      opeAbreGerencial :
          ACBrECF1.AbreRelatorioGerencial ;

      opeCancelaCupom :
          ACBrECF1.CancelaCupom;

      opeFechaCupom :
         ACBrECF1.FechaCupom('Projeto ACBr|http://acbr.sf.net');

      opeSubTotalizaCupom :
         ACBrECF1.SubtotalizaCupom( 0, 'Projeto ACBr|http://acbr.sf.net' );

      opeFechaGerencial, opeFechaVinculado :
        ACBrECF1.FechaRelatorio ;

      opePulaLinhas :
        begin
          ACBrECF1.PulaLinhas( ACBrECF1.LinhasEntreCupons );
          ACBrECF1.CortaPapel( True );
          Sleep(200);
        end;
    end;

    RetornoECF := 1 ;
  except
    RetornoECF := 0 ;
  end;
end;

procedure TForm1.ACBrTEFD1ComandaECFAbreVinculado(COO, IndiceECF : String;
   Valor : Double; var RetornoECF : Integer);
begin
  try
     Memo1.Lines.Add( 'ACBrTEFD1ComandaECFAbreVinculado, COO:'+COO+
        ' IndiceECF: '+IndiceECF+' Valor: '+FormatFloat('0.00',Valor) ) ;
     ACBrECF1.AbreCupomVinculado( COO, IndiceECF, Valor );
     RetornoECF := 1 ;
  except
     RetornoECF := 0 ;
  end;
end;

procedure TForm1.ACBrTEFD1ComandaECFImprimeVia(
   TipoRelatorio : TACBrTEFDTipoRelatorio; Via : Integer;
   ImagemComprovante : TStringList; var RetornoECF : Integer);
begin
  Memo1.Lines.Add( 'ACBrTEFD1ComandaECFImprimeVia, Tipo: '+
     IfThen(TipoRelatorio = trGerencial, 'trGerencial','trVinculado') +
     ' Via: '+IntToStr(Via) );
  Memo1.Lines.AddStrings( ImagemComprovante );

  { *** Se estiver usando ACBrECF... Lembre-se de configurar ***
    ACBrECF1.MaxLinhasBuffer   := 3; // Os homologadores permitem no m?ximo
                                     // Impressao de 3 em 3 linhas
    ACBrECF1.LinhasEntreCupons := 7; // (ajuste conforme o seu ECF)

    NOTA: ACBrECF nao possui comando para imprimir a 2a via do CCD }

  try
     case TipoRelatorio of
       trGerencial :
         ACBrECF1.LinhaRelatorioGerencial( ImagemComprovante.Text ) ;

       trVinculado :
         ACBrECF1.LinhaCupomVinculado( ImagemComprovante.Text )
     end;

     RetornoECF := 1 ;
  except
     RetornoECF := 0 ;
  end;
end;

procedure TForm1.ACBrTEFD1ComandaECFPagamento(IndiceECF : String;
   Valor : Double; var RetornoECF : Integer);
begin
  try
     Memo1.Lines.Add( 'ACBrTEFD1ComandaECFPagamento, IndiceECF: '+IndiceECF+
        ' Valor: '+FormatFloat('0.00',Valor) );
     ACBrECF1.EfetuaPagamento(IndiceECF, Valor);
     RetornoECF := 1 ;
  except
     RetornoECF := 0 ;
  end;
end;

procedure TForm1.ACBrTEFD1DepoisConfirmarTransacoes(
   RespostasPendentes: TACBrTEFDRespostasPendentes);
var
  I : Integer;
begin
  for I := 0 to RespostasPendentes.Count-1  do
  begin
     with RespostasPendentes[I] do
     begin
        Memo1.Lines.Add('Confirmado: '+Header+' ID: '+IntToStr( ID ) );

        Memo1.Lines.Add( 'Rede: '  + Rede +
                         ' NSU: '  + NSU  +
                         ' Valor: '+ FormatFloat('###,###,##0.00',ValorTotal)) ;
        Memo1.Lines.Add('Campo 11: ' + LeInformacao(11,0).AsString );
     end;
  end;
end;

procedure TForm1.ACBrTEFD1CliSiTefObtemCampo(Titulo: String; TamanhoMinimo,
  TamanhoMaximo, TipoCampo: Integer;
  Operacao: TACBrTEFDCliSiTefOperacaoCampo; var Resposta: AnsiString;
  var Digitado, VoltarMenu: Boolean);
Var
  AForm : TForm5 ;
  MR    : TModalResult ;
begin
  AForm := TForm5.Create(self);
  try
    AForm.Panel1.Caption := Titulo;
    AForm.TamanhoMaximo  := TamanhoMaximo;
    AForm.TamanhoMinimo  := TamanhoMinimo;
    AForm.Operacao       := Operacao;
    AForm.TipoCampo      := TipoCampo;
    AForm.Edit1.Text     := Resposta; { Para usar Valores Previamente informados }

    MR := AForm.ShowModal ;

    Digitado   := (MR = mrOK) ;
    VoltarMenu := (MR = mrRetry) ;

    if Digitado then
       Resposta := AForm.Edit1.Text;
  finally
    AForm.Free;
  end;
end;

procedure TForm1.ACBrTEFD1CliSiTefExibeMenu(Titulo: String;
  Opcoes: TStringList; var ItemSelecionado: Integer;
  var VoltarMenu: Boolean);
Var
  AForm : TForm4 ;
  MR    : TModalResult ;
begin
  AForm := TForm4.Create(self);
  try
    AForm.Panel1.Caption := Titulo;
    AForm.ListBox1.Items.AddStrings(Opcoes);

    MR := AForm.ShowModal ;

    VoltarMenu := (MR = mrRetry) ;

    if (MR = mrOK) then
      ItemSelecionado := AForm.ListBox1.ItemIndex;
  finally
    AForm.Free;
  end;
end;

end.

