object frVendeItem: TfrVendeItem
  Left = 358
  Top = 267
  Width = 349
  Height = 264
  HorzScrollBar.Range = 329
  VertScrollBar.Range = 225
  ActiveControl = edCodigo
  BorderStyle = bsSingle
  Caption = 'Vende Item'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 33
    Height = 13
    Caption = '&C'#243'digo'
    FocusControl = edCodigo
  end
  object Label2: TLabel
    Left = 9
    Top = 56
    Width = 48
    Height = 13
    Caption = '&Descri'#231#227'o'
    FocusControl = edDescricao
  end
  object Label3: TLabel
    Left = 40
    Top = 88
    Width = 17
    Height = 13
    Caption = '&Qtd'
  end
  object Label4: TLabel
    Left = 168
    Top = 88
    Width = 67
    Height = 13
    Caption = '&Pre'#231'o Unit'#225'rio'
    FocusControl = edPrecoUnita
  end
  object Label5: TLabel
    Left = 159
    Top = 120
    Width = 76
    Height = 13
    Caption = '&Valor Aliq. ICMS'
    FocusControl = edICMS
  end
  object Label6: TLabel
    Left = 15
    Top = 152
    Width = 42
    Height = 13
    Caption = '&Desc (%)'
    FocusControl = edDesconto
  end
  object Label7: TLabel
    Left = 17
    Top = 120
    Width = 40
    Height = 13
    Caption = '&Unidade'
    FocusControl = edUN
  end
  object Label8: TLabel
    Left = 192
    Top = 136
    Width = 47
    Height = 13
    Caption = 'II = Isento'
  end
  object Label9: TLabel
    Left = 192
    Top = 152
    Width = 100
    Height = 13
    Caption = 'NN = Nao Incidencia'
  end
  object Label10: TLabel
    Left = 192
    Top = 168
    Width = 129
    Height = 13
    Caption = 'FF = Substitui'#231'ao Tribut'#225'ria'
  end
  object edCodigo: TEdit
    Left = 64
    Top = 16
    Width = 101
    Height = 21
    Cursor = crIBeam
    TabOrder = 0
    Text = '111222333'
  end
  object edDescricao: TEdit
    Left = 64
    Top = 48
    Width = 265
    Height = 21
    Cursor = crIBeam
    TabOrder = 1
    Text = 'TESTE DE PRODUTO'
  end
  object edPrecoUnita: TEdit
    Left = 240
    Top = 80
    Width = 89
    Height = 21
    Cursor = crIBeam
    TabOrder = 3
    Text = '1'
    OnKeyPress = edQtdKeyPress
  end
  object edICMS: TEdit
    Left = 240
    Top = 112
    Width = 89
    Height = 21
    Cursor = crIBeam
    TabOrder = 5
    Text = 'NN'
    OnKeyPress = edQtdKeyPress
  end
  object edDesconto: TEdit
    Left = 64
    Top = 144
    Width = 81
    Height = 21
    Cursor = crIBeam
    TabOrder = 6
    Text = '0'
    OnKeyPress = edQtdKeyPress
  end
  object edUN: TEdit
    Left = 64
    Top = 112
    Width = 81
    Height = 21
    Cursor = crIBeam
    TabOrder = 4
    Text = 'UN'
  end
  object Button1: TButton
    Left = 64
    Top = 196
    Width = 75
    Height = 25
    Caption = '&Imprimir'
    Default = True
    TabOrder = 7
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 203
    Top = 196
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Fechar'
    ModalResult = 2
    TabOrder = 8
    OnClick = Button2Click
  end
  object edQtd: TEdit
    Left = 64
    Top = 80
    Width = 81
    Height = 21
    Cursor = crIBeam
    TabOrder = 2
    Text = '1'
    OnKeyPress = edQtdKeyPress
  end
end
