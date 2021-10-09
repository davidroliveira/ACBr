object Form1: TForm1
  Left = 238
  Top = 107
  Width = 530
  Height = 283
  HorzScrollBar.Range = 505
  VertScrollBar.Range = 241
  ActiveControl = mProdutos
  AutoScroll = False
  Caption = 'Teste de Leitor de Código de Barras Serial'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 67
    Height = 13
    Caption = 'Última Leitura:'
  end
  object Label3: TLabel
    Left = 166
    Top = 199
    Width = 62
    Height = 13
    Caption = 'Interv.Leitura'
  end
  object Label4: TLabel
    Left = 8
    Top = 199
    Width = 25
    Height = 13
    Caption = 'Porta'
  end
  object Label5: TLabel
    Left = 88
    Top = 199
    Width = 29
    Height = 13
    Caption = 'Sufixo'
  end
  object Label6: TLabel
    Left = 320
    Top = 32
    Width = 80
    Height = 13
    Caption = 'Conteudo da Fila'
  end
  object Label2: TLabel
    Left = 318
    Top = 199
    Width = 132
    Height = 13
    Caption = 'Simular Atraso na Aplicação'
  end
  object lUltimaLeitura: TLabel
    Left = 80
    Top = 8
    Width = 217
    Height = 20
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = 11
    Font.Name = 'MS Sans Serif'
    Font.Pitch = fpVariable
    Font.Style = [fsBold]
    ParentFont = False
  end
  object mProdutos: TMemo
    Left = 8
    Top = 48
    Width = 305
    Height = 145
    Lines.Strings = (
      'SE NAO LEU O CÓDIGO DE BARRAS:'
      ''
      '1 - Verifique se a Porta está correta'
      '2 - Experimente deixar o SUFIXO vazio. Após uma leitura '
      'verifique o Sufixo correto no final de "Ultima Leitura" '
      'IMPORTANTE: Informar o sufixo correto para o '
      'componente '
      'é importante para ler corretamente um código de cada vez.')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object cbFila: TCheckBox
    Left = 239
    Top = 203
    Width = 73
    Height = 17
    Caption = 'Usar Fila'
    TabOrder = 1
    OnClick = cbFilaClick
  end
  object edIntervalo: TEdit
    Left = 168
    Top = 215
    Width = 57
    Height = 21
    Cursor = crIBeam
    TabOrder = 2
    OnChange = edIntervaloChange
  end
  object cbxPorta: TComboBox
    Left = 8
    Top = 215
    Width = 65
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Text = 'COM1'
    OnChange = cbxPortaChange
    Items.Strings = (
      'COM1'
      'COM2'
      'COM3'
      'COM4'
      'COM5'
      'LPT1'
      'LPT2'
      'LPT3')
  end
  object edSufixo: TEdit
    Left = 88
    Top = 215
    Width = 65
    Height = 21
    Cursor = crIBeam
    TabOrder = 6
    OnChange = edSufixoChange
  end
  object mFila: TMemo
    Left = 320
    Top = 48
    Width = 185
    Height = 145
    ScrollBars = ssVertical
    TabOrder = 8
  end
  object Button1: TButton
    Left = 448
    Top = 216
    Width = 57
    Height = 25
    Caption = 'Emulador'
    TabOrder = 11
    OnClick = Button1Click
  end
  object cbExcluirSufixo: TCheckBox
    Left = 239
    Top = 224
    Width = 101
    Height = 17
    Caption = 'Excluir Sufixo'
    Checked = True
    State = cbChecked
    TabOrder = 4
    OnClick = cbExcluirSufixoClick
  end
  object edAtraso: TEdit
    Left = 358
    Top = 215
    Width = 57
    Height = 21
    Cursor = crIBeam
    TabOrder = 5
    OnChange = edIntervaloChange
  end
  object pAtraso: TPanel
    Left = 164
    Top = 102
    Width = 185
    Height = 41
    Caption = 'Simulando Atraso (Impressão)'
    TabOrder = 7
    Visible = False
  end
  object bApagarFila: TButton
    Left = 448
    Top = 6
    Width = 51
    Height = 25
    Caption = 'Apagar'
    TabOrder = 9
    OnClick = bApagarFilaClick
  end
  object bLerFila: TButton
    Left = 384
    Top = 6
    Width = 51
    Height = 25
    Caption = 'Ler Fila'
    TabOrder = 10
    OnClick = bLerFilaClick
  end
  object ACBrLCB1: TACBrLCB
    Porta = 'COM1'
    Sufixo = '#13'
    OnLeCodigo = ACBrLCB1LeCodigo
    OnLeFila = ACBrLCB1LeFila
    Left = 48
    Top = 144
  end
end
