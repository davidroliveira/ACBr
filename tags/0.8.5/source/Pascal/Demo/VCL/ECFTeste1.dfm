object Form1: TForm1
  Left = 472
  Top = 144
  Width = 430
  Height = 493
  ActiveControl = cbxModelo
  Caption = 'Teste de Impressora Fiscal'
  Color = clBtnFace
  Constraints.MinHeight = 350
  Constraints.MinWidth = 425
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Pitch = fpVariable
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = True
  Scaled = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 152
    Width = 87
    Height = 13
    Caption = 'Comando Enviado'
  end
  object Label3: TLabel
    Left = 8
    Top = 208
    Width = 50
    Height = 13
    Caption = 'Respostas'
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 38
    Height = 13
    Caption = 'Modelo:'
  end
  object Label4: TLabel
    Left = 112
    Top = 8
    Width = 25
    Height = 13
    Caption = 'Porta'
  end
  object Label5: TLabel
    Left = 207
    Top = 8
    Width = 40
    Height = 13
    Caption = 'TimeOut'
  end
  object Label6: TLabel
    Left = 200
    Top = 56
    Width = 104
    Height = 13
    Caption = 'Mensagem Aguarde...'
  end
  object Label7: TLabel
    Left = 263
    Top = 8
    Width = 41
    Height = 13
    Caption = 'Intervalo'
  end
  object mEnviado: TMemo
    Left = 8
    Top = 168
    Width = 405
    Height = 39
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 9
  end
  object mResp: TMemo
    Left = 0
    Top = 224
    Width = 422
    Height = 194
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Courier'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 10
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 420
    Width = 422
    Height = 19
    Panels = <
      item
        Width = 80
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object cbxModelo: TComboBox
    Left = 8
    Top = 24
    Width = 97
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = cbxModeloChange
    Items.Strings = (
      'Procurar'
      'ecfNaoFiscal'
      'ecfBematech'
      'ecfSweda'
      'ecfDaruma'
      'ecfSchalter'
      'ecfMecaf'
      'ecfYanco'
      'ecfDataRegis'
      'ecfUrano'
      'ecfICash'
      'ecfQuattro')
  end
  object cbxPorta: TComboBox
    Left = 112
    Top = 24
    Width = 81
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Text = 'Procurar'
    OnChange = cbxPortaChange
    Items.Strings = (
      'Procurar'
      'COM1'
      'COM2'
      'COM3'
      'COM4'
      'COM5'
      'COM6'
      'COM7'
      'COM8'
      'COM9'
      'LPT1'
      'LPT2'
      'LPT3')
  end
  object edTimeout: TEdit
    Left = 208
    Top = 24
    Width = 37
    Height = 21
    Cursor = crIBeam
    TabOrder = 2
    Text = '3'
    OnChange = edTimeoutChange
  end
  object chTentar: TCheckBox
    Left = 14
    Top = 52
    Width = 121
    Height = 17
    Caption = 'Tentar Novamente'
    Checked = True
    State = cbChecked
    TabOrder = 4
    OnClick = chTentarClick
  end
  object chBloqueia: TCheckBox
    Left = 14
    Top = 70
    Width = 145
    Height = 17
    Caption = 'Bloqueia Mouse Teclado'
    Checked = True
    State = cbChecked
    TabOrder = 5
    OnClick = chBloqueiaClick
  end
  object chExibeMsg: TCheckBox
    Left = 14
    Top = 89
    Width = 131
    Height = 17
    Caption = 'Exibe Msg Aguarde...'
    Checked = True
    State = cbChecked
    TabOrder = 6
    OnClick = chExibeMsgClick
  end
  object mMsg: TMemo
    Left = 200
    Top = 72
    Width = 213
    Height = 49
    Anchors = [akLeft, akTop, akRight]
    Lines.Strings = (
      'Aguardando o retorno do ECF'
      'Faltam %d segundos para TimeOut')
    ScrollBars = ssVertical
    TabOrder = 8
    OnChange = mMsgChange
  end
  object bAtivar: TButton
    Left = 320
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Ativar'
    TabOrder = 3
    OnClick = bAtivarClick
  end
  object chArredondaPorQtd: TCheckBox
    Left = 14
    Top = 108
    Width = 185
    Height = 17
    Caption = 'Arredondamento por Quantidade'
    TabOrder = 7
    OnClick = chArredondaPorQtdClick
  end
  object chGavetaSinalInvertido: TCheckBox
    Left = 14
    Top = 127
    Width = 187
    Height = 17
    Caption = 'Gaveta Sinal Invertido'
    TabOrder = 12
    OnClick = chGavetaSinalInvertidoClick
  end
  object edIntervaloAposComando: TEdit
    Left = 264
    Top = 24
    Width = 37
    Height = 21
    Cursor = crIBeam
    TabOrder = 13
    Text = '100'
    OnChange = edIntervaloAposComandoChange
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 280
    object Principal1: TMenuItem
      Caption = 'Principal'
      object Ativcar1: TMenuItem
        Caption = 'Ativar'
        OnClick = Ativcar1Click
      end
      object Desativar1: TMenuItem
        Caption = 'Desativar'
        OnClick = Desativar1Click
      end
      object Testar1: TMenuItem
        Caption = 'Testar'
        OnClick = Testar1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Sobre1: TMenuItem
        Caption = 'Sobre ACBr'
        OnClick = Sobre1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
        OnClick = Sair1Click
      end
    end
    object Variaveis1: TMenuItem
      Caption = 'Variaveis'
      object DataHora1: TMenuItem
        Caption = 'Data Hora'
        OnClick = DataHora1Click
      end
      object NumECF1: TMenuItem
        Caption = 'Num ECF'
        OnClick = NumECF1Click
      end
      object NumLoja1: TMenuItem
        Caption = 'Num Loja'
        OnClick = NumLoja1Click
      end
      object NSrie1: TMenuItem
        Caption = 'Num Série'
        OnClick = NSrie1Click
      end
      object NVerso1: TMenuItem
        Caption = 'Num Versão'
        OnClick = NVerso1Click
      end
      object NumCRO1: TMenuItem
        Caption = 'Num CRO'
        OnClick = NumCRO1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object PoucoPapel1: TMenuItem
        Caption = 'Pouco Papel ?'
        OnClick = PoucoPapel1Click
      end
      object Estado1: TMenuItem
        Caption = 'Estado'
        OnClick = Estado1Click
      end
      object HorarioVerao2: TMenuItem
        Caption = 'Horario Verao ?'
        OnClick = HorarioVerao2Click
      end
      object Arredonda1: TMenuItem
        Caption = 'Arredonda ?'
        OnClick = Arredonda1Click
      end
      object MFD1: TMenuItem
        Caption = 'É MFD'
        OnClick = MFD1Click
      end
      object ermica1: TMenuItem
        Caption = 'É Termica'
        OnClick = ermica1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object AliquotasICMS1: TMenuItem
        Caption = 'Carrega Aliquotas (ICMS)'
        OnClick = AliquotasICMS1Click
      end
      object FormasdePagamento1: TMenuItem
        Caption = 'Carrega Formas Pagamento'
        OnClick = FormasdePagamento1Click
      end
      object CarregaComprovantesNAOFiscais1: TMenuItem
        Caption = 'Carrega Comprovantes NAO Fiscais'
        OnClick = CarregaComprovantesNAOFiscais1Click
      end
      object CarregaUnidadesdeMedida1: TMenuItem
        Caption = 'Carrega Unidades de Medida'
        OnClick = CarregaUnidadesdeMedida1Click
      end
      object N18: TMenuItem
        Caption = '-'
      end
      object LerTodasasVariaveis1: TMenuItem
        Caption = 'Ler Todas as Variaveis'
        OnClick = LerTodasasVariaveis1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relatórios'
      object LeituraX1: TMenuItem
        Caption = 'Leitura X'
        OnClick = LeituraX1Click
      end
      object ReduoZ1: TMenuItem
        Caption = 'Redução Z'
        OnClick = ReduoZ1Click
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object RelatorioGerencial1: TMenuItem
        Caption = 'Relatório Gerencial'
        object RelatorioGerencialCompleto1: TMenuItem
          Caption = 'Relatório Gerencial Completo'
          OnClick = RelatorioGerencialCompleto1Click
        end
        object N15: TMenuItem
          Caption = '-'
        end
        object AbreRelatrioGerencial1: TMenuItem
          Caption = 'Abre Relatório Gerencial'
          OnClick = AbreRelatrioGerencial1Click
        end
        object LinhaRelatrio1: TMenuItem
          Caption = 'Imprime Linha Relatório'
          OnClick = LinhaRelatrio1Click
        end
      end
      object CupomVinculado1: TMenuItem
        Caption = 'Cupom Vinculado'
        object CupomVinculadoCompleto1: TMenuItem
          Caption = 'Cupom Vinculado Completo'
          OnClick = CupomVinculadoCompleto1Click
        end
        object N16: TMenuItem
          Caption = '-'
        end
        object AbreCupomVinculado1: TMenuItem
          Caption = 'Abre Cupom Vinculado'
          OnClick = AbreCupomVinculado1Click
        end
        object ImprimeLinhaVinculado1: TMenuItem
          Caption = 'Imprime Linha Vinculado'
          OnClick = ImprimeLinhaVinculado1Click
        end
      end
      object PularLinhas1: TMenuItem
        Caption = 'Pular Linhas'
        OnClick = PularLinhas1Click
      end
      object N17: TMenuItem
        Caption = '-'
      end
      object FechaRelatrio1: TMenuItem
        Caption = 'Fecha Relatório / Vinculado'
        OnClick = FechaRelatrio1Click
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object LeituradeMemoriaFiscal1: TMenuItem
        Caption = 'Leitura de Memoria Fiscal'
        object CapturaporNReduaoZ1: TMenuItem
          Caption = 'Captura por N.ReduçaoZ'
          OnClick = CapturaporNReduaoZ1Click
        end
        object CapturaporPeriodo1: TMenuItem
          Caption = 'Captura por Periodo'
          OnClick = CapturaporPeriodo1Click
        end
        object ImprimeporNReduaoZ1: TMenuItem
          Caption = 'Imprime por N.ReduçaoZ'
          OnClick = ImprimeporNReduaoZ1Click
        end
        object ImprimeporPeriodo1: TMenuItem
          Caption = 'Imprime por Periodo'
          OnClick = ImprimeporPeriodo1Click
        end
      end
    end
    object CopumFiscal1: TMenuItem
      Caption = 'Cupom Fiscal'
      object TestaPodeAbrirCupom1: TMenuItem
        Caption = 'Testa Pode Abrir Cupom'
        OnClick = TestaPodeAbrirCupom1Click
      end
      object AbrirCupom1: TMenuItem
        Caption = 'Abre Cupom'
        OnClick = AbrirCupom1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object VenderItem1: TMenuItem
        Caption = 'Vende Item'
        OnClick = VenderItem1Click
      end
      object CancelarItemVendido1: TMenuItem
        Caption = 'Cancela Item Vendido'
        OnClick = CancelarItemVendido1Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object Sub1: TMenuItem
        Caption = 'SubTotaliza Cupom'
        OnClick = Sub1Click
      end
      object EfetuarPagamento1: TMenuItem
        Caption = 'Efetua Pagamento'
        OnClick = EfetuarPagamento1Click
      end
      object FecharCupom1: TMenuItem
        Caption = 'Fecha Cupom'
        OnClick = FecharCupom1Click
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object CancelaCupom1: TMenuItem
        Caption = 'Cancela Cupom'
        OnClick = CancelaCupom1Click
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object Variveis1: TMenuItem
        Caption = 'Variáveis'
        object NUltimoCupom1: TMenuItem
          Caption = 'Num Cupom'
          OnClick = NUltimoCupom1Click
        end
        object SubTotal1: TMenuItem
          Caption = 'SubTotal'
          OnClick = SubTotal1Click
        end
        object TotalPago1: TMenuItem
          Caption = 'Total Pago'
          OnClick = TotalPago1Click
        end
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object TestedeVelocidade1: TMenuItem
        Caption = 'Teste de Velocidade'
        OnClick = TestedeVelocidade1Click
      end
    end
    object Dispositivos1: TMenuItem
      Caption = 'Dispositivos'
      object Gaveta1: TMenuItem
        Caption = '&Gaveta'
        object AbreGaveta1: TMenuItem
          Caption = 'Abre Gaveta'
          OnClick = AbreGaveta1Click
        end
        object GavetaAberta1: TMenuItem
          Caption = 'Gaveta Aberta ?'
          OnClick = GavetaAberta1Click
        end
      end
      object Cheque1: TMenuItem
        Caption = '&Cheque'
        object ChequePronto1: TMenuItem
          Caption = 'Cheque Pronto ?'
          OnClick = ChequePronto1Click
        end
        object ImprimeCheque1: TMenuItem
          Caption = 'Imprime Cheque'
          OnClick = ImprimeCheque1Click
        end
        object CancelaImpressoCheque1: TMenuItem
          Caption = 'Cancela Impressão Cheque'
          OnClick = CancelaImpressoCheque1Click
        end
      end
    end
    object Utilitrios1: TMenuItem
      Caption = 'Utilitários'
      object ProgramaAliquota1: TMenuItem
        Caption = 'Programa Aliquota'
        OnClick = ProgramaAliquota1Click
      end
      object ProgramaFormadePagamento1: TMenuItem
        Caption = 'Programa Forma de Pagamento'
        OnClick = ProgramaFormadePagamento1Click
      end
      object ProgramaComprovanteNAOFiscal1: TMenuItem
        Caption = 'Programa Comprovante NAO Fiscal'
        OnClick = ProgramaComprovanteNAOFiscal1Click
      end
      object ProgramaUnidadeMedida1: TMenuItem
        Caption = 'Programa Unidade Medida'
        OnClick = ProgramaUnidadeMedida1Click
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object HorarioVerao1: TMenuItem
        Caption = 'Muda Horário Verão'
        OnClick = HorarioVerao1Click
      end
      object MudaArredondamento1: TMenuItem
        Caption = 'Muda Arredondamento'
        OnClick = MudaArredondamento1Click
      end
      object ImpactoAgulhas1: TMenuItem
        Caption = 'Impacto Agulhas'
        OnClick = ImpactoAgulhas1Click
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object CorrigeEstadodeErro1: TMenuItem
        Caption = 'Corrige Estado de Erro'
        OnClick = CorrigeEstadodeErro1Click
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object EnviaComando1: TMenuItem
        Caption = 'Envia Comando'
        OnClick = EnviaComando1Click
      end
    end
  end
  object ACBrECF1: TACBrECF
    Porta = 'procurar'
    DescricaoGrande = True
    MsgAguarde = 'Aguardando a resposta da Impressora: %d segundos'
    MsgRelatorio = 'Imprimindo %s  %dª Via '
    MsgPausaRelatorio = 'Destaque a %dª via, <ENTER> proxima, %d seg.'
    FormMsgFonte.Charset = DEFAULT_CHARSET
    FormMsgFonte.Color = clWhite
    FormMsgFonte.Height = 11
    FormMsgFonte.Name = 'MS Sans Serif'
    FormMsgFonte.Pitch = fpVariable
    FormMsgFonte.Style = [fsBold]
    FormMsgColor = clHighlight
    OnMsgAguarde = ACBrECF1MsgAguarde
    OnAguardandoRespostaChange = ACBrECF1AguardandoRespostaChange
    OnMsgPoucoPapel = ACBrECF1MsgPoucoPapel
    Left = 184
    Top = 264
  end
end
