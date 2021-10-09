inherited frmMDFeDAEventoRLRetrato: TfrmMDFeDAEventoRLRetrato
  Left = 267
  Height = 476
  Top = 214
  Width = 835
  Caption = 'Evento - Retrato'
  ClientHeight = 476
  ClientWidth = 835
  Font.Height = -8
  Font.Name = 'Arial'
  Font.Style = [fsBold]
  inherited RLMDFeEvento: TRLReport
    Left = 32
    Top = 0
    DataSource = Datasource1
    Font.Height = -8
    Font.Name = 'Courier New'
    Margins.LeftMargin = 7
    Margins.TopMargin = 7
    Margins.RightMargin = 7
    Margins.BottomMargin = 7
    BeforePrint = rlEventoBeforePrint
    object rlb_09_Itens: TRLBand[0]
      Left = 26
      Height = 13
      Top = 1021
      Width = 742
      Color = clWhite
      ParentColor = False
      RealBounds.Left = 0
      RealBounds.Top = 0
      RealBounds.Width = 0
      RealBounds.Height = 0
      BeforePrint = rlb_09_ItensBeforePrint
      object rldbtTpDoc2: TRLDBText
        Left = 373
        Height = 13
        Top = 1
        Width = 76
        AutoSize = False
        Color = clWhite
        DataField = 'TIPO_2'
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rldbtTpDoc1: TRLDBText
        Left = 5
        Height = 13
        Top = 1
        Width = 76
        AutoSize = False
        Color = clWhite
        DataField = 'TIPO_1'
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rldbtDocumento2: TRLDBText
        Left = 542
        Height = 13
        Top = 1
        Width = 195
        AutoSize = False
        Color = clWhite
        DataField = 'DOCUMENTO_2'
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rldbtDocumento1: TRLDBText
        Left = 174
        Height = 13
        Top = 1
        Width = 195
        AutoSize = False
        Color = clWhite
        DataField = 'DOCUMENTO_1'
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rldbtCnpjEmitente2: TRLDBText
        Left = 456
        Height = 12
        Top = 1
        Width = 51
        Color = clWhite
        DataField = 'CNPJCPF_2'
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rldbtCnpjEmitente1: TRLDBText
        Left = 88
        Height = 12
        Top = 1
        Width = 51
        Color = clWhite
        DataField = 'CNPJCPF_1'
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
    end
    object rlb_01_Titulo: TRLBand[1]
      Left = 26
      Height = 73
      Top = 26
      Width = 742
      BandType = btTitle
      Color = clWhite
      ParentColor = False
      RealBounds.Left = 0
      RealBounds.Top = 0
      RealBounds.Width = 0
      RealBounds.Height = 0
      BeforePrint = rlb_01_TituloBeforePrint
      object rlShape46: TRLDraw
        Left = 0
        Height = 67
        Top = 0
        Width = 741
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllLinha1: TRLLabel
        Left = 227
        Height = 19
        Top = 2
        Width = 290
        Alignment = taCenter
        Caption = 'CARTA DE CORREÇÃO ELETRÔNICA'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllLinha2: TRLLabel
        Left = 179
        Height = 15
        Top = 24
        Width = 382
        Alignment = taCenter
        Caption = 'Não possui valor fiscal, simples representação da CC-e indicada abaixo.'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllLinha3: TRLLabel
        Left = 47
        Height = 15
        Top = 45
        Width = 646
        Alignment = taCenter
        Caption = 'CONSULTE A AUTENTICIDADE DA CARTA DE CORREÇÃO ELETRÔNICA NO SITE DA SEFAZ AUTORIZADORA.'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
    end
    object rlb_08_HeaderItens: TRLBand[2]
      Left = 26
      Height = 16
      Top = 1053
      Width = 742
      BandType = btColumnFooter
      Color = clWhite
      ParentColor = False
      RealBounds.Left = 0
      RealBounds.Top = 0
      RealBounds.Width = 0
      RealBounds.Height = 0
      BeforePrint = rlb_08_HeaderItensBeforePrint
    end
    object rlb_10_Sistema: TRLBand[3]
      Left = 26
      Height = 19
      Top = 1034
      Width = 742
      AlignToBottom = True
      BandType = btColumnFooter
      Color = clWhite
      ParentColor = False
      RealBounds.Left = 0
      RealBounds.Top = 0
      RealBounds.Width = 0
      RealBounds.Height = 0
      BeforePrint = rlb_10_SistemaBeforePrint
      object rlLabel15: TRLLabel
        Left = 2
        Height = 12
        Top = 0
        Width = 140
        Caption = 'DATA E HORA DA IMPRESSÃO: '
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlSysData1: TRLSystemInfo
        Left = 143
        Height = 12
        Top = 0
        Width = 26
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllblSistema: TRLLabel
        Left = 352
        Height = 13
        Top = 0
        Width = 387
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Desenvolvido por Projeto ACBr - http://acbr.sourceforge.net/'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
    end
    object rlb_05_Evento: TRLBand[4]
      Left = 26
      Height = 120
      Top = 429
      Width = 742
      BandType = btColumnHeader
      Color = clWhite
      ParentColor = False
      RealBounds.Left = 0
      RealBounds.Top = 0
      RealBounds.Width = 0
      RealBounds.Height = 0
      BeforePrint = rlb_05_EventoBeforePrint
      object rlsQuadro01: TRLDraw
        Left = 0
        Height = 113
        Top = 0
        Width = 741
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlsLinhaV01: TRLDraw
        Left = 68
        Height = 33
        Top = 48
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlsLinhaV09: TRLDraw
        Left = 590
        Height = 33
        Top = 15
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlsLinhaV10: TRLDraw
        Left = 43
        Height = 33
        Top = 15
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlsLinhaH04: TRLDraw
        Left = 0
        Height = 1
        Top = 48
        Width = 740
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlLabel2: TRLLabel
        Left = 4
        Height = 8
        Top = 18
        Width = 27
        Caption = 'ORGÃO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllOrgao: TRLLabel
        Left = 4
        Height = 15
        Top = 28
        Width = 38
        Alignment = taCenter
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlLabel78: TRLLabel
        Left = 74
        Height = 8
        Top = 51
        Width = 83
        Caption = 'DESCRIÇÃO DO EVENTO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllDescricaoEvento: TRLLabel
        Left = 74
        Height = 14
        Top = 62
        Width = 92
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllDescricao: TRLLabel
        Left = 414
        Height = 8
        Top = 83
        Width = 54
        Caption = 'N° PROTOCOLO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllProtocolo: TRLLabel
        Left = 414
        Height = 15
        Top = 96
        Width = 322
        Alignment = taCenter
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlShape88: TRLDraw
        Left = 0
        Height = 1
        Top = 80
        Width = 740
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllTituloEvento: TRLLabel
        Left = 6
        Height = 13
        Top = 2
        Width = 203
        Caption = 'CARTA DE CORREÇÃO ELETRÔNICA'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlShape48: TRLDraw
        Left = 0
        Height = 1
        Top = 15
        Width = 740
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlLabel9: TRLLabel
        Left = 50
        Height = 8
        Top = 18
        Width = 37
        Caption = 'AMBIENTE'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllTipoAmbiente: TRLLabel
        Left = 50
        Height = 13
        Top = 28
        Width = 89
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlLabel6: TRLLabel
        Left = 598
        Height = 8
        Top = 18
        Width = 133
        Caption = 'DATA E HORA DE EMISSÃO DO EVENTO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllEmissaoEvento: TRLLabel
        Left = 598
        Height = 14
        Top = 28
        Width = 85
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlLabel28: TRLLabel
        Left = 4
        Height = 8
        Top = 51
        Width = 29
        Caption = 'EVENTO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllTipoEvento: TRLLabel
        Left = 4
        Height = 15
        Top = 62
        Width = 62
        Alignment = taCenter
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlLabel17: TRLLabel
        Left = 598
        Height = 8
        Top = 50
        Width = 82
        Caption = 'SEQUÊNCIA DO EVENTO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllSeqEvento: TRLLabel
        Left = 598
        Height = 14
        Top = 60
        Width = 62
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlShape49: TRLDraw
        Left = 590
        Height = 33
        Top = 48
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlShape50: TRLDraw
        Left = 410
        Height = 33
        Top = 80
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlLabel18: TRLLabel
        Left = 4
        Height = 8
        Top = 83
        Width = 28
        Caption = 'STATUS'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllStatus: TRLLabel
        Left = 4
        Height = 14
        Top = 94
        Width = 40
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
    end
    object rlb_03_Emitente: TRLBand[5]
      Left = 26
      Height = 120
      Top = 189
      Width = 742
      BandType = btColumnHeader
      Color = clWhite
      ParentColor = False
      RealBounds.Left = 0
      RealBounds.Top = 0
      RealBounds.Width = 0
      RealBounds.Height = 0
      BeforePrint = rlb_03_EmitenteBeforePrint
      object rlsQuadro02: TRLDraw
        Left = 0
        Height = 113
        Top = 0
        Width = 741
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlsLinhaH07: TRLDraw
        Left = 1
        Height = 1
        Top = 80
        Width = 740
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlsLinhaH06: TRLDraw
        Left = 1
        Height = 1
        Top = 48
        Width = 740
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllRazaoEmitente: TRLLabel
        Left = 4
        Height = 14
        Top = 30
        Width = 84
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllMunEmitente: TRLLabel
        Left = 4
        Height = 14
        Top = 94
        Width = 77
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllInscEstEmitente: TRLLabel
        Left = 624
        Height = 14
        Top = 94
        Width = 90
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllEnderecoEmitente: TRLLabel
        Left = 4
        Height = 14
        Top = 62
        Width = 99
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllCNPJEmitente: TRLLabel
        Left = 608
        Height = 14
        Top = 30
        Width = 82
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllCEPEmitente: TRLLabel
        Left = 669
        Height = 15
        Top = 62
        Width = 64
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlLabel98: TRLLabel
        Left = 669
        Height = 8
        Top = 52
        Width = 15
        Caption = 'CEP'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlLabel93: TRLLabel
        Left = 624
        Height = 8
        Top = 84
        Width = 78
        Caption = 'INSCRIÇÃO ESTADUAL'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlLabel24: TRLLabel
        Left = 608
        Height = 8
        Top = 19
        Width = 19
        Caption = 'CNPJ'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlLabel22: TRLLabel
        Left = 4
        Height = 8
        Top = 84
        Width = 38
        Caption = 'MUNICÍPIO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlLabel16: TRLLabel
        Left = 4
        Height = 8
        Top = 52
        Width = 39
        Caption = 'ENDEREÇO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlLabel13: TRLLabel
        Left = 4
        Height = 8
        Top = 19
        Width = 79
        Caption = 'NOME / RAZÃO SOCIAL'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlLabel12: TRLLabel
        Left = 6
        Height = 13
        Top = 2
        Width = 55
        Caption = 'EMITENTE'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlShape51: TRLDraw
        Left = 0
        Height = 1
        Top = 15
        Width = 740
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlShape53: TRLDraw
        Left = 604
        Height = 33
        Top = 15
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlShape82: TRLDraw
        Left = 665
        Height = 33
        Top = 48
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlShape99: TRLDraw
        Left = 448
        Height = 33
        Top = 48
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlLabel4: TRLLabel
        Left = 452
        Height = 8
        Top = 52
        Width = 29
        Caption = 'BAIRRO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllBairroEmitente: TRLLabel
        Left = 452
        Height = 14
        Top = 62
        Width = 85
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlShape108: TRLDraw
        Left = 620
        Height = 33
        Top = 80
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlLabel5: TRLLabel
        Left = 452
        Height = 8
        Top = 84
        Width = 40
        Caption = 'FONE / FAX'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllFoneEmitente: TRLLabel
        Left = 452
        Height = 14
        Top = 94
        Width = 79
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlShape109: TRLDraw
        Left = 448
        Height = 33
        Top = 80
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
    end
    object rlb_04_Tomador: TRLBand[6]
      Left = 26
      Height = 120
      Top = 309
      Width = 742
      BandType = btColumnHeader
      Color = clWhite
      ParentColor = False
      RealBounds.Left = 0
      RealBounds.Top = 0
      RealBounds.Width = 0
      RealBounds.Height = 0
      BeforePrint = rlb_04_TomadorBeforePrint
      object rlsQuadro03: TRLDraw
        Left = 0
        Height = 113
        Top = 0
        Width = 741
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlLabel1: TRLLabel
        Left = 6
        Height = 13
        Top = 2
        Width = 138
        Caption = 'TOMADOR DO SERVIÇO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlShape52: TRLDraw
        Left = 0
        Height = 1
        Top = 15
        Width = 740
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlLabel14: TRLLabel
        Left = 4
        Height = 8
        Top = 19
        Width = 79
        Caption = 'NOME / RAZÃO SOCIAL'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllRazaoTomador: TRLLabel
        Left = 4
        Height = 14
        Top = 30
        Width = 84
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlLabel25: TRLLabel
        Left = 4
        Height = 8
        Top = 52
        Width = 39
        Caption = 'ENDEREÇO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllEnderecoTomador: TRLLabel
        Left = 4
        Height = 14
        Top = 62
        Width = 99
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlLabel27: TRLLabel
        Left = 4
        Height = 8
        Top = 84
        Width = 38
        Caption = 'MUNICÍPIO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllMunTomador: TRLLabel
        Left = 4
        Height = 14
        Top = 94
        Width = 77
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlLabel30: TRLLabel
        Left = 608
        Height = 8
        Top = 19
        Width = 38
        Caption = 'CNPJ / CPF'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllCNPJTomador: TRLLabel
        Left = 608
        Height = 14
        Top = 30
        Width = 82
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlLabel32: TRLLabel
        Left = 452
        Height = 8
        Top = 52
        Width = 29
        Caption = 'BAIRRO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllBairroTomador: TRLLabel
        Left = 452
        Height = 14
        Top = 62
        Width = 85
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlLabel35: TRLLabel
        Left = 669
        Height = 8
        Top = 52
        Width = 15
        Caption = 'CEP'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllCEPTomador: TRLLabel
        Left = 669
        Height = 15
        Top = 62
        Width = 64
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlLabel37: TRLLabel
        Left = 452
        Height = 8
        Top = 84
        Width = 40
        Caption = 'FONE / FAX'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllFoneTomador: TRLLabel
        Left = 452
        Height = 14
        Top = 94
        Width = 79
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlLabel40: TRLLabel
        Left = 624
        Height = 8
        Top = 84
        Width = 78
        Caption = 'INSCRIÇÃO ESTADUAL'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllInscEstTomador: TRLLabel
        Left = 624
        Height = 14
        Top = 94
        Width = 90
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlShape7: TRLDraw
        Left = 604
        Height = 33
        Top = 15
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlShape8: TRLDraw
        Left = 1
        Height = 1
        Top = 48
        Width = 740
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlShape9: TRLDraw
        Left = 1
        Height = 1
        Top = 80
        Width = 740
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlShape55: TRLDraw
        Left = 448
        Height = 33
        Top = 48
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlShape56: TRLDraw
        Left = 448
        Height = 33
        Top = 80
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlShape58: TRLDraw
        Left = 665
        Height = 33
        Top = 48
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlShape59: TRLDraw
        Left = 620
        Height = 33
        Top = 80
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
    end
    object rlb_06_Descricao: TRLBand[7]
      Left = 26
      Height = 112
      Top = 549
      Width = 742
      BandType = btColumnHeader
      Color = clWhite
      ParentColor = False
      RealBounds.Left = 0
      RealBounds.Top = 0
      RealBounds.Width = 0
      RealBounds.Height = 0
      BeforePrint = rlb_06_DescricaoBeforePrint
      object rlsQuadro04: TRLDraw
        Left = 0
        Height = 105
        Top = 0
        Width = 741
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmDescricao: TRLMemo
        Left = 5
        Height = 78
        Top = 19
        Width = 732
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Lucida Console'
        Lines.Strings = (
          'rlmCondicoes'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlLabel59: TRLLabel
        Left = 6
        Height = 13
        Top = 2
        Width = 71
        Caption = 'DESCRIÇÃO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllMsgTeste: TRLLabel
        Left = 11
        Height = 31
        Top = 43
        Width = 718
        Alignment = taCenter
        Caption = 'AMBIENTE DE HOMOLOGAÇÃO - SEM VALOR FISCAL'
        Color = clWhite
        Font.Color = clGray
        Font.Height = -27
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlShape5: TRLDraw
        Left = 1
        Height = 1
        Top = 15
        Width = 740
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
    end
    object rlb_07_Correcao: TRLBand[8]
      Left = 26
      Height = 360
      Top = 661
      Width = 742
      BandType = btColumnHeader
      Color = clWhite
      ParentColor = False
      RealBounds.Left = 0
      RealBounds.Top = 0
      RealBounds.Width = 0
      RealBounds.Height = 0
      BeforePrint = rlb_07_CorrecaoBeforePrint
      object rlsQuadro05: TRLDraw
        Left = 0
        Height = 353
        Top = 0
        Width = 741
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlShape18: TRLDraw
        Left = 160
        Height = 338
        Top = 15
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlShape19: TRLDraw
        Left = 270
        Height = 338
        Top = 15
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlShape15: TRLDraw
        Left = 50
        Height = 338
        Top = 15
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmNumItemAlterado: TRLMemo
        Left = 8
        Height = 318
        Top = 27
        Width = 40
        Alignment = taRightJustify
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'Item 1'
          'Item 2'
          'Item 3'
          'Item 4'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmCampoAlterado: TRLMemo
        Left = 164
        Height = 318
        Top = 27
        Width = 100
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'Campo 1'
          'Campo 2'
          'Campo 3'
          'Campo 4'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmValorAlterado: TRLMemo
        Left = 274
        Height = 318
        Top = 27
        Width = 463
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'Valor 1'
          'Valor 2'
          'Valor 3'
          'Valor 4'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmGrupoAlterado: TRLMemo
        Left = 54
        Height = 318
        Top = 27
        Width = 100
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'Grupo 1'
          'Grupo 2'
          'Grupo 3'
          'Grupo 4'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlLabel46: TRLLabel
        Left = 164
        Height = 8
        Top = 18
        Width = 27
        Caption = 'CAMPO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlLabel45: TRLLabel
        Left = 30
        Height = 8
        Top = 18
        Width = 18
        Caption = 'ITEM'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlLabel44: TRLLabel
        Left = 54
        Height = 8
        Top = 18
        Width = 26
        Caption = 'GRUPO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlLabel42: TRLLabel
        Left = 274
        Height = 8
        Top = 18
        Width = 26
        Caption = 'VALOR'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlLabel38: TRLLabel
        Left = 6
        Height = 13
        Top = 2
        Width = 70
        Caption = 'CORREÇÃO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlShape17: TRLDraw
        Left = 1
        Height = 1
        Top = 15
        Width = 740
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
    end
    object rlb_02_Documento: TRLBand[9]
      Left = 26
      Height = 90
      Top = 99
      Width = 742
      BandType = btColumnHeader
      Color = clWhite
      ParentColor = False
      RealBounds.Left = 0
      RealBounds.Top = 0
      RealBounds.Width = 0
      RealBounds.Height = 0
      BeforePrint = rlb_02_DocumentoBeforePrint
      object rlShape10: TRLDraw
        Left = 0
        Height = 81
        Top = 0
        Width = 741
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlLabel65: TRLLabel
        Left = 6
        Height = 13
        Top = 2
        Width = 335
        Caption = 'MANIFESTO ELETRÔNICO DE DOCUMENTOS FISCAIS- MDF-e'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlShape81: TRLDraw
        Left = 1
        Height = 1
        Top = 44
        Width = 368
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlLabel8: TRLLabel
        Left = 5
        Height = 8
        Top = 19
        Width = 32
        Alignment = taCenter
        Caption = 'MODELO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllModelo: TRLLabel
        Left = 6
        Height = 15
        Top = 27
        Width = 30
        Alignment = taCenter
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlLabel21: TRLLabel
        Left = 59
        Height = 8
        Top = 19
        Width = 22
        Alignment = taCenter
        Caption = 'SÉRIE'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllSerie: TRLLabel
        Left = 60
        Height = 15
        Top = 27
        Width = 20
        Alignment = taCenter
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlLabel23: TRLLabel
        Left = 112
        Height = 9
        Top = 19
        Width = 70
        Alignment = taCenter
        AutoSize = False
        Caption = 'NÚMERO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllNumMDFe: TRLLabel
        Left = 110
        Height = 15
        Top = 27
        Width = 72
        Alignment = taRightJustify
        Caption = '999.999.999'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlsLinhaV05: TRLDraw
        Left = 50
        Height = 30
        Top = 15
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlsLinhaV06: TRLDraw
        Left = 100
        Height = 30
        Top = 15
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlsLinhaV08: TRLDraw
        Left = 236
        Height = 30
        Top = 15
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlLabel33: TRLLabel
        Left = 246
        Height = 9
        Top = 19
        Width = 95
        AutoSize = False
        Caption = 'DATA E HORA DE EMISSÃO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllEmissao: TRLLabel
        Left = 246
        Height = 13
        Top = 27
        Width = 58
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlsLinhaV07: TRLDraw
        Left = 368
        Height = 66
        Top = 15
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlLabel74: TRLLabel
        Left = 6
        Height = 11
        Top = 46
        Width = 58
        Caption = 'Chave de acesso'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllChave: TRLLabel
        Left = 6
        Height = 14
        Top = 60
        Width = 356
        Alignment = taCenter
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlShape2: TRLDraw
        Left = 1
        Height = 1
        Top = 15
        Width = 740
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLBarcode1: TRLBarcode
        Left = 375
        Height = 49
        Top = 25
        Width = 87
        Margins.LeftMargin = 1
        Margins.RightMargin = 1
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
    end
  end
end
