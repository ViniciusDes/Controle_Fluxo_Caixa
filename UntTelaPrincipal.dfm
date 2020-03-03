object UnimFormPrincipal: TUnimFormPrincipal
  Left = 0
  Top = 0
  ClientHeight = 480
  ClientWidth = 364
  Caption = 'CAIXA DIARIO'
  OnShow = UnimFormShow
  BorderIcons = [biSystemMenu, biMaximize]
  TitleButtons = <>
  OnCreate = UnimFormCreate
  OnClose = UnimFormClose
  PixelsPerInch = 96
  TextHeight = 13
  ScrollPosition = 0
  ScrollHeight = 47
  PlatformData = {}
  object UnimDatePicker2: TUnimDatePicker
    Left = 202
    Top = 8
    Width = 153
    Height = 47
    Hint = ''
    DateFormat = 'dd/MM/yyyy'
    Date = 43508.000000000000000000
    OnKeyUp = UnimDatePicker1KeyUp
  end
  object UnimDatePicker1: TUnimDatePicker
    Left = 8
    Top = 8
    Width = 153
    Height = 47
    Hint = ''
    DateFormat = 'dd/MM/yyyy'
    Date = 43508.000000000000000000
    OnKeyUp = UnimDatePicker1KeyUp
  end
  object UnimLabel5: TUnimLabel
    Left = 178
    Top = 16
    Width = 18
    Height = 23
    Hint = ''
    AutoSize = False
    Caption = #192
    ParentFont = False
    Font.Height = -15
    Font.Style = [fsBold]
  end
  object UnimLabel1: TUnimLabel
    Left = 8
    Top = 58
    Width = 82
    Height = 17
    Hint = ''
    AutoSize = False
    Caption = 'CONTAS:'
    ParentFont = False
    Font.Color = clBlue
    Font.Height = -15
    Font.Style = [fsBold]
  end
  object UnimSelect1: TUnimSelect
    Left = 8
    Top = 81
    Width = 181
    Height = 36
    Hint = ''
    TabOrder = 12
  end
  object ChecTodas: TUnimCheckBox
    Left = 8
    Top = 123
    Width = 151
    Height = 27
    Hint = ''
    FieldLabel = 'TODAS:'
    FieldLabelFont.Color = clBlue
    FieldLabelFont.Height = -15
    FieldLabelFont.Style = [fsBold]
    Caption = 'TODAS:'
    OnClick = ChecTodasClick
  end
  object UnimButton1: TUnimButton
    Left = 8
    Top = 184
    Width = 348
    Height = 37
    Hint = ''
    Caption = 'Atualizar'
    Font.Color = clBlue
    Font.Height = -16
    OnClick = UnimButton1Click
  end
  object UnimLabel2: TUnimLabel
    Left = 159
    Top = 227
    Width = 82
    Height = 23
    Hint = ''
    AutoSize = False
    Caption = 'SALDOS:'
    ParentFont = False
    Font.Color = clBlue
    Font.Height = -15
    Font.Style = [fsBold]
  end
  object EditSaldoReceita: TUnimEdit
    Left = 8
    Top = 256
    Width = 145
    Height = 41
    Hint = ''
    Text = ''
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object UnimLabel6: TUnimLabel
    Left = 159
    Top = 267
    Width = 146
    Height = 23
    Hint = ''
    AutoSize = False
    Caption = 'RECEITAS/ENTRADA'
    ParentFont = False
    Font.Height = -15
  end
  object EditSaldoSaida: TUnimEdit
    Left = 8
    Top = 328
    Width = 145
    Height = 41
    Hint = ''
    Text = ''
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object UnimLabel7: TUnimLabel
    Left = 159
    Top = 338
    Width = 146
    Height = 23
    Hint = ''
    AutoSize = False
    Caption = 'DESPESAS/SAIDA'
    ParentFont = False
    Font.Height = -15
  end
  object EditSaldoReal: TUnimEdit
    Left = 8
    Top = 393
    Width = 145
    Height = 41
    Hint = ''
    Text = ''
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object UnimLabel8: TUnimLabel
    Left = 159
    Top = 411
    Width = 138
    Height = 23
    Hint = ''
    AutoSize = False
    Caption = 'VALOR REAL'
    ParentFont = False
    Font.Height = -15
  end
  object UnimBitBtn1: TUnimBitBtn
    Left = 8
    Top = 440
    Width = 348
    Height = 37
    Hint = ''
    Caption = 'Resumo totalizador'
    Font.Color = clBlue
    Font.Height = -16
    OnClick = UnimBitBtn1Click
  end
  object SQLQuery1: TSQLQuery
    DataSource = DataSource1
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'select * from conta_movimento'
      '')
    Left = 216
    Top = 80
    object SQLQuery1ID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object SQLQuery1DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
    object SQLQuery1EMPRESA: TIntegerField
      FieldName = 'EMPRESA'
      Required = True
    end
    object SQLQuery1SALDO: TFloatField
      FieldName = 'SALDO'
    end
    object SQLQuery1NAO_EXIBIR_REL: TStringField
      FieldName = 'NAO_EXIBIR_REL'
      FixedChar = True
      Size = 1
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLQuery1
    Left = 280
    Top = 72
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 384
    Top = 104
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 336
    Top = 72
  end
  object QueryMov: TSQLQuery
    DataSource = DataSourceMov
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from caixa_Mov'
      'where data_mov = current_date')
    Left = 216
    Top = 136
    object QueryMovID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object QueryMovID_CAIXA: TIntegerField
      FieldName = 'ID_CAIXA'
      Required = True
    end
    object QueryMovDATA_MOV: TSQLTimeStampField
      FieldName = 'DATA_MOV'
    end
    object QueryMovHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 50
    end
    object QueryMovORIGEM: TStringField
      FieldName = 'ORIGEM'
      Size = 40
    end
    object QueryMovDC: TStringField
      FieldName = 'DC'
      FixedChar = True
      Size = 1
    end
    object QueryMovVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object QueryMovIDFUNC: TIntegerField
      FieldName = 'IDFUNC'
      Required = True
    end
    object QueryMovSALDO_ANTERIOR: TFloatField
      FieldName = 'SALDO_ANTERIOR'
    end
    object QueryMovIDPLANO: TIntegerField
      FieldName = 'IDPLANO'
    end
    object QueryMovIDSUBPLANO: TIntegerField
      FieldName = 'IDSUBPLANO'
    end
    object QueryMovDESC_SUBPLANO: TStringField
      FieldName = 'DESC_SUBPLANO'
      Size = 40
    end
    object QueryMovSALDO_POSTERIOR: TFloatField
      FieldName = 'SALDO_POSTERIOR'
    end
    object QueryMovHORA_MOV: TSQLTimeStampField
      FieldName = 'HORA_MOV'
    end
  end
  object providerMov: TDataSetProvider
    DataSet = QueryMov
    Left = 272
    Top = 136
  end
  object DataSourceMov: TDataSource
    DataSet = DataSetMov
    Left = 384
    Top = 168
  end
  object DataSetMov: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'providerMov'
    Left = 336
    Top = 136
    object DataSetMovID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object DataSetMovID_CAIXA: TIntegerField
      FieldName = 'ID_CAIXA'
      Required = True
    end
    object DataSetMovDATA_MOV: TSQLTimeStampField
      FieldName = 'DATA_MOV'
    end
    object DataSetMovHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 50
    end
    object DataSetMovORIGEM: TStringField
      FieldName = 'ORIGEM'
      Size = 40
    end
    object DataSetMovDC: TStringField
      FieldName = 'DC'
      FixedChar = True
      Size = 1
    end
    object DataSetMovVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object DataSetMovIDFUNC: TIntegerField
      FieldName = 'IDFUNC'
      Required = True
    end
    object DataSetMovSALDO_ANTERIOR: TFloatField
      FieldName = 'SALDO_ANTERIOR'
    end
    object DataSetMovIDPLANO: TIntegerField
      FieldName = 'IDPLANO'
    end
    object DataSetMovIDSUBPLANO: TIntegerField
      FieldName = 'IDSUBPLANO'
    end
    object DataSetMovDESC_SUBPLANO: TStringField
      FieldName = 'DESC_SUBPLANO'
      Size = 40
    end
    object DataSetMovSALDO_POSTERIOR: TFloatField
      FieldName = 'SALDO_POSTERIOR'
    end
    object DataSetMovHORA_MOV: TSQLTimeStampField
      FieldName = 'HORA_MOV'
    end
  end
end
