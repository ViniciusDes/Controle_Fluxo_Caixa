object FrmPrincipalEscolha: TFrmPrincipalEscolha
  Left = 0
  Top = 0
  ClientHeight = 480
  ClientWidth = 332
  Caption = 'ETICA TECNLOGIA'
  TitleButtons = <>
  PixelsPerInch = 96
  TextHeight = 13
  ScrollPosition = 0
  ScrollHeight = 47
  PlatformData = {}
  object UnimLabel1: TUnimLabel
    Left = 56
    Top = 32
    Width = 241
    Height = 23
    Hint = ''
    AutoSize = False
    Caption = 'Conta a ser man'#237'pulada:'
    ParentFont = False
    Font.Color = clBlue
    Font.Style = [fsUnderline]
  end
  object UnimSelect1: TUnimSelect
    Left = 56
    Top = 61
    Width = 225
    Height = 47
    Hint = ''
    TabOrder = 4
  end
  object UnimButton1: TUnimButton
    Left = 16
    Top = 141
    Width = 304
    Height = 47
    Hint = ''
    Align = alCustom
    Caption = 'Consulta Caixa di'#225'rio'
    Font.Color = clBlue
    OnClick = UnimButton1Click
  end
  object UnimButton4: TUnimButton
    Left = 16
    Top = 202
    Width = 304
    Height = 47
    Hint = ''
    Align = alCustom
    Caption = 'Suprimentos/Sangria'
    Font.Color = clBlue
    OnClick = UnimButton4Click
  end
  object UnimBitBtn1: TUnimBitBtn
    Left = 16
    Top = 264
    Width = 304
    Height = 47
    Hint = ''
    Caption = 'Transf. entre Contas'
    Font.Color = clBlue
    OnClick = UnimBitBtn1Click
  end
  object UnimButton2: TUnimButton
    Left = 20
    Top = 333
    Width = 304
    Height = 47
    Hint = ''
    Align = alCustom
    Caption = 'Lan'#231'amentos '
    Font.Color = clBlue
    OnClick = UnimButton3Click
  end
end
