object Form1: TForm1
  Left = 482
  Top = 111
  Width = 712
  Height = 554
  Caption = 'Teste do Recopi'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lSSLLib: TLabel
    Left = 430
    Top = 26
    Width = 34
    Height = 13
    Alignment = taRightJustify
    Caption = 'SSLLib'
    Color = clBtnFace
    ParentColor = False
  end
  object lCryptLib: TLabel
    Left = 433
    Top = 53
    Width = 38
    Height = 13
    Alignment = taRightJustify
    Caption = 'CryptLib'
    Color = clBtnFace
    ParentColor = False
  end
  object lHttpLib: TLabel
    Left = 436
    Top = 80
    Width = 34
    Height = 13
    Alignment = taRightJustify
    Caption = 'HttpLib'
    Color = clBtnFace
    ParentColor = False
  end
  object lXmlSign: TLabel
    Left = 413
    Top = 107
    Width = 57
    Height = 13
    Alignment = taRightJustify
    Caption = 'XMLSignLib'
    Color = clBtnFace
    ParentColor = False
  end
  object Label3: TLabel
    Left = 17
    Top = 290
    Width = 122
    Height = 13
    Caption = 'Caminho Schemas / Logs'
    Color = clBtnFace
    ParentColor = False
  end
  object sbtnCaminhoCert1: TSpeedButton
    Left = 246
    Top = 308
    Width = 23
    Height = 24
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
      333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
      0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
      07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
      07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
      0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
      33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
      B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
      3BB33773333773333773B333333B3333333B7333333733333337}
    NumGlyphs = 2
    OnClick = sbtnCaminhoCert1Click
  end
  object sbtnCaminhoCert2: TSpeedButton
    Left = 246
    Top = 342
    Width = 23
    Height = 24
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
      333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
      0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
      07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
      07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
      0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
      33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
      B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
      3BB33773333773333773B333333B3333333B7333333733333337}
    NumGlyphs = 2
    OnClick = sbtnCaminhoCert2Click
  end
  object Label4: TLabel
    Left = 30
    Top = 143
    Width = 44
    Height = 13
    Caption = 'Ambiente'
    Color = clBtnFace
    ParentColor = False
  end
  object lSSLLib1: TLabel
    Left = 426
    Top = 133
    Width = 44
    Height = 13
    Alignment = taRightJustify
    Caption = 'SSLType'
    Color = clBtnFace
    ParentColor = False
  end
  object Button1: TButton
    Left = 20
    Top = 16
    Width = 184
    Height = 25
    Caption = 'Obter Vers'#227'o'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 20
    Top = 43
    Width = 184
    Height = 25
    Caption = 'Lista Solicita'#231#227'o'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 20
    Top = 70
    Width = 184
    Height = 25
    Caption = 'Lista Inclus'#227'o NF'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 210
    Top = 16
    Width = 188
    Height = 25
    Caption = 'Lista Controle de Estoque'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 210
    Top = 43
    Width = 188
    Height = 25
    Caption = 'Lista Confirma'#231#245'es'
    TabOrder = 4
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 210
    Top = 98
    Width = 188
    Height = 25
    Caption = 'Sair'
    TabOrder = 5
    OnClick = Button6Click
  end
  object cbXmlSignLib: TComboBox
    Left = 488
    Top = 100
    Width = 160
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 6
  end
  object cbHttpLib: TComboBox
    Left = 488
    Top = 73
    Width = 160
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 7
  end
  object cbCryptLib: TComboBox
    Left = 488
    Top = 46
    Width = 160
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 8
  end
  object cbSSLLib: TComboBox
    Left = 488
    Top = 19
    Width = 160
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 9
  end
  object Memo1: TMemo
    Left = 0
    Top = 384
    Width = 696
    Height = 132
    Align = alBottom
    ScrollBars = ssBoth
    TabOrder = 10
  end
  object Button15: TButton
    Left = 210
    Top = 70
    Width = 188
    Height = 25
    Caption = 'Gravar Configura'#231#245'es'
    TabOrder = 11
    OnClick = Button15Click
  end
  object Button14: TButton
    Left = 20
    Top = 98
    Width = 184
    Height = 25
    Caption = 'Consulta Publica'
    TabOrder = 12
    OnClick = Button14Click
  end
  object edtPathSchemas: TEdit
    Left = 17
    Top = 309
    Width = 225
    Height = 21
    TabOrder = 13
  end
  object edtPathLogs: TEdit
    Left = 17
    Top = 343
    Width = 225
    Height = 21
    TabOrder = 14
  end
  object cbSSLType: TComboBox
    Left = 488
    Top = 128
    Width = 160
    Height = 21
    Hint = 'Depende de configura'#231#227'o de  SSL.HttpLib'
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 15
  end
  object RadioGroup1: TRadioGroup
    Left = 92
    Top = 131
    Width = 305
    Height = 35
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Homologa'#231#227'o'
      'Produ'#231#227'o')
    TabOrder = 16
  end
  object GroupBox1: TGroupBox
    Left = 24
    Top = 176
    Width = 369
    Height = 105
    Caption = 'Teste de Certificado'
    TabOrder = 17
    object Button12: TButton
      Left = 38
      Top = 25
      Width = 87
      Height = 25
      Caption = 'Carregar'
      TabOrder = 0
      OnClick = Button12Click
    end
    object Button13: TButton
      Left = 38
      Top = 53
      Width = 87
      Height = 25
      Caption = 'Descarregar'
      TabOrder = 1
      OnClick = Button13Click
    end
    object Button7: TButton
      Left = 128
      Top = 14
      Width = 176
      Height = 25
      Caption = 'Subject Name'
      TabOrder = 2
      OnClick = Button7Click
    end
    object Button9: TButton
      Left = 128
      Top = 42
      Width = 86
      Height = 25
      Caption = 'CNPJ'
      TabOrder = 3
      OnClick = Button9Click
    end
    object Button11: TButton
      Left = 216
      Top = 42
      Width = 88
      Height = 25
      Caption = 'Issuer Name'
      TabOrder = 4
      OnClick = Button11Click
    end
    object Button10: TButton
      Left = 128
      Top = 70
      Width = 86
      Height = 25
      Caption = 'Num.S'#233'rie'
      TabOrder = 5
      OnClick = Button10Click
    end
    object Button8: TButton
      Left = 216
      Top = 70
      Width = 88
      Height = 25
      Caption = 'Validade'
      TabOrder = 6
      OnClick = Button8Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 408
    Top = 176
    Width = 273
    Height = 201
    Caption = 'GroupBox2'
    TabOrder = 18
    object Label1: TLabel
      Left = 8
      Top = 0
      Width = 41
      Height = 13
      Caption = 'Caminho'
      Color = clBtnFace
      ParentColor = False
    end
    object sbtnCaminhoCert: TSpeedButton
      Left = 239
      Top = 19
      Width = 24
      Height = 24
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
        07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
        0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      OnClick = sbtnCaminhoCertClick
    end
    object Label2: TLabel
      Left = 8
      Top = 52
      Width = 31
      Height = 13
      Caption = 'Senha'
      Color = clBtnFace
      ParentColor = False
    end
    object Label25: TLabel
      Left = 8
      Top = 110
      Width = 79
      Height = 13
      Caption = 'N'#250'mero de S'#233'rie'
      Color = clBtnFace
      ParentColor = False
    end
    object sbtnGetCert1: TSpeedButton
      Left = 208
      Top = 129
      Width = 23
      Height = 24
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
        07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
        0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      OnClick = sbtnGetCert1Click
    end
    object sbtnGetCert: TSpeedButton
      Left = 235
      Top = 129
      Width = 23
      Height = 24
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
        07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
        0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      OnClick = sbtnGetCertClick
    end
    object edtCaminho: TEdit
      Left = 8
      Top = 19
      Width = 225
      Height = 21
      TabOrder = 0
    end
    object edtNumSerie: TEdit
      Left = 8
      Top = 132
      Width = 193
      Height = 21
      TabOrder = 1
    end
    object edtSenha: TEdit
      Left = 8
      Top = 75
      Width = 225
      Height = 21
      PasswordChar = '*'
      TabOrder = 2
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 48
    Top = 352
  end
  object ACBrRecopi1: TACBrRecopi
    Left = 160
    Top = 360
  end
end
