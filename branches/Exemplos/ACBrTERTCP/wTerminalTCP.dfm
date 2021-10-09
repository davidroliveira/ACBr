object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 201
  ClientWidth = 766
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 766
    Height = 65
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 26
      Height = 13
      Caption = 'Porta'
    end
    object Button1: TButton
      Left = 16
      Top = 32
      Width = 102
      Height = 25
      Caption = 'Ligar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 48
      Top = 5
      Width = 70
      Height = 21
      TabOrder = 1
      Text = '1001'
    end
  end
  object Memo1: TMemo
    Left = 8
    Top = 71
    Width = 750
    Height = 114
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
end
