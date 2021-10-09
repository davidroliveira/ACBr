object Form1: TForm1
  Left = 331
  Top = 143
  Width = 548
  Height = 416
  Caption = 'Form1'
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
  object Bevel2: TBevel
    Left = 0
    Top = 80
    Width = 241
    Height = 65
  end
  object Bevel1: TBevel
    Left = 0
    Top = 160
    Width = 241
    Height = 137
  end
  object Label1: TLabel
    Left = 107
    Top = 8
    Width = 10
    Height = 13
    Caption = 'IP'
    Enabled = False
  end
  object Label2: TLabel
    Left = 91
    Top = 38
    Width = 26
    Height = 13
    Caption = 'Porta'
    Enabled = False
  end
  object Label3: TLabel
    Left = 136
    Top = 88
    Width = 19
    Height = 13
    Caption = 'bico'
  end
  object Label4: TLabel
    Left = 176
    Top = 88
    Width = 49
    Height = 13
    Caption = 'Pre'#231'o Unit'
  end
  object Label5: TLabel
    Left = 208
    Top = 200
    Width = 19
    Height = 13
    Caption = 'bico'
  end
  object lblStatus: TLabel
    Left = 88
    Top = 56
    Width = 30
    Height = 13
    Caption = 'status'
  end
  object Label6: TLabel
    Left = 176
    Top = 200
    Width = 20
    Height = 19
    Caption = 'TT'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 176
    Top = 128
    Width = 51
    Height = 13
    Caption = 'Valor Total'
  end
  object Label8: TLabel
    Left = 136
    Top = 128
    Width = 19
    Height = 13
    Caption = 'bico'
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 65
    Height = 17
    Caption = 'Conecta'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 128
    Top = 8
    Width = 113
    Height = 21
    Enabled = False
    TabOrder = 1
    Text = '127.0.0.1'
  end
  object Edit2: TEdit
    Left = 128
    Top = 35
    Width = 113
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object Edit3: TEdit
    Left = 176
    Top = 102
    Width = 57
    Height = 21
    TabOrder = 3
    Text = '2,75'
  end
  object Button2: TButton
    Left = 8
    Top = 84
    Width = 105
    Height = 25
    Caption = 'Altera Pre'#231'o bico'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Edit4: TEdit
    Left = 136
    Top = 102
    Width = 33
    Height = 21
    TabOrder = 5
    Text = '1'
  end
  object Button3: TButton
    Left = 8
    Top = 31
    Width = 65
    Height = 18
    Caption = 'Disconecta'
    TabOrder = 6
    OnClick = Button3Click
  end
  object Memo1: TMemo
    Left = 248
    Top = 40
    Width = 289
    Height = 345
    ScrollBars = ssBoth
    TabOrder = 7
  end
  object Button4: TButton
    Left = 8
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Bloqueia Bico'
    TabOrder = 8
    OnClick = Button4Click
  end
  object Edit5: TEdit
    Left = 208
    Top = 219
    Width = 25
    Height = 21
    TabOrder = 9
    Text = '1'
  end
  object Button5: TButton
    Left = 88
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Autoriza Bico'
    TabOrder = 10
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 168
    Top = 168
    Width = 41
    Height = 25
    Caption = 'Status'
    TabOrder = 11
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 288
    Top = 8
    Width = 73
    Height = 25
    Caption = 'Ajusta Relogio'
    TabOrder = 12
    OnClick = Button7Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 448
    Top = 8
    Width = 73
    Height = 21
    Date = 40236.450674907400000000
    Time = 40236.450674907400000000
    Kind = dtkTime
    ParentShowHint = False
    ShowHint = False
    TabOrder = 13
  end
  object Button8: TButton
    Left = 8
    Top = 200
    Width = 121
    Height = 25
    Caption = 'Abastc em andamento'
    TabOrder = 14
    OnClick = Button8Click
  end
  object DateTimePicker2: TDateTimePicker
    Left = 368
    Top = 8
    Width = 81
    Height = 21
    Date = 40236.455809097220000000
    Time = 40236.455809097220000000
    TabOrder = 15
  end
  object Button9: TButton
    Left = 8
    Top = 56
    Width = 65
    Height = 17
    Caption = 'Status Com'
    TabOrder = 16
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 8
    Top = 312
    Width = 161
    Height = 25
    Caption = 'LeAbastecimentosPendentes'
    TabOrder = 17
    OnClick = Button10Click
  end
  object Button11: TButton
    Left = 8
    Top = 112
    Width = 105
    Height = 25
    Caption = 'PredeterminaValor'
    TabOrder = 18
    OnClick = Button11Click
  end
  object Button12: TButton
    Left = 136
    Top = 200
    Width = 33
    Height = 25
    Caption = 'timer'
    TabOrder = 19
    OnClick = Button12Click
  end
  object Button13: TButton
    Left = 8
    Top = 232
    Width = 145
    Height = 25
    Caption = 'Abastcmntos em andamnto'
    Enabled = False
    TabOrder = 20
  end
  object LeEncerranteBico: TButton
    Left = 8
    Top = 264
    Width = 105
    Height = 25
    Caption = 'LeEncerranteBico'
    TabOrder = 21
    OnClick = LeEncerranteBicoClick
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 176
    Top = 224
  end
end
