object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 242
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 56
    Width = 26
    Height = 13
    Caption = 'Porta'
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 88
    Width = 121
    Height = 137
    Caption = 'Terminal'
    Items.Strings = (
      'vt100')
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 447
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 1
    ExplicitLeft = 288
    ExplicitTop = 56
    ExplicitWidth = 185
    object Button1: TButton
      Left = 16
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Ligar'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object Edit1: TEdit
    Left = 48
    Top = 53
    Width = 81
    Height = 21
    TabOrder = 2
    Text = '1001'
  end
  object Memo1: TMemo
    Left = 135
    Top = 53
    Width = 304
    Height = 172
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
end
