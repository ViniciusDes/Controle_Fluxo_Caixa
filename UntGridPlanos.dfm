object FrmGridPlanos: TFrmGridPlanos
  Left = 0
  Top = 0
  ClientHeight = 315
  ClientWidth = 342
  Caption = 'Planos e SubPlanos'
  TitleButtons = <>
  OnCreate = UnimFormCreate
  OnClose = UnimFormClose
  PixelsPerInch = 96
  TextHeight = 13
  ScrollPosition = 0
  ScrollHeight = 47
  PlatformData = {}
  object UnimLabel1: TUnimLabel
    Left = 89
    Top = 8
    Width = 169
    Height = 23
    Hint = ''
    AutoSize = False
    Caption = 'Selecione o Plano'
    ParentFont = False
    Font.Color = clBlue
  end
  object UnimSelect1: TUnimSelect
    Left = 49
    Top = 37
    Width = 225
    Height = 73
    Hint = ''
    TabOrder = 4
    OnCloseUp = UnimSelect1CloseUp
    OnExit = UnimSelect1Exit
  end
  object UnimLabel2: TUnimLabel
    Left = 72
    Top = 104
    Width = 202
    Height = 23
    Hint = ''
    AutoSize = False
    Caption = 'Selecione o Subplano'
    ParentFont = False
    Font.Color = clBlue
  end
  object UnimSelect2: TUnimSelect
    Left = 49
    Top = 133
    Width = 225
    Height = 41
    Hint = ''
    TabOrder = 5
    OnExit = UnimSelect2Exit
  end
  object BtnConfirmatr: TUnimBitBtn
    Left = 89
    Top = 237
    Width = 144
    Height = 47
    Hint = ''
    Caption = 'Confirmar'
    Font.Color = clBlue
    OnClick = BtnConfirmatrClick
  end
  object UnimDBEdit1: TUnimDBEdit
    Left = -111
    Top = 347
    Width = 225
    Height = 47
    Hint = ''
    Visible = False
    ReadOnly = True
    TabOrder = 0
  end
  object UnimDBEdit2: TUnimDBEdit
    Left = -111
    Top = 400
    Width = 225
    Height = 47
    Hint = ''
    Visible = False
    ReadOnly = True
    TabOrder = 1
  end
  object QueryPlanos: TSQLQuery
    DataSource = SourcePlanos
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * FROM PLANO'
      '')
    Left = 88
    Top = 392
    object QueryPlanosID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object QueryPlanosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object QueryPlanosATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QueryPlanosTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
  end
  object ProviderPlanos: TDataSetProvider
    DataSet = QueryPlanos
    Left = 152
    Top = 392
  end
  object DataSetPlanos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'ProviderPlanos'
    Left = 216
    Top = 392
    object DataSetPlanosID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object DataSetPlanosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object DataSetPlanosATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object DataSetPlanosTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
  end
  object SourcePlanos: TDataSource
    DataSet = DataSetPlanos
    Left = 280
    Top = 392
  end
  object QuerySubplano: TSQLQuery
    DataSource = SourceSubplano
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * FROM Subplano'
      '')
    Left = 88
    Top = 440
    object QuerySubplanoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object QuerySubplanoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 40
    end
    object QuerySubplanoID_PLANO: TIntegerField
      FieldName = 'ID_PLANO'
      Required = True
    end
    object QuerySubplanoATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object ProviderSubplano: TDataSetProvider
    DataSet = QuerySubplano
    Left = 152
    Top = 440
  end
  object DataSetSubplano: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'ProviderPlanos'
    Left = 216
    Top = 440
    object IntegerField2: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object StringField4: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object StringField5: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object StringField6: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
  end
  object SourceSubplano: TDataSource
    DataSet = DataSetSubplano
    Left = 280
    Top = 440
  end
  object SQLQuery1: TSQLQuery
    DataSource = SourceSubplano
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'Psub'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      
        ' select subplano.descricao from subplano where subplano.id_plano' +
        ' = :Psub')
    Left = 232
    Top = 336
    object SQLQuery1DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 40
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'ProviderPlanos'
    Left = 296
    Top = 336
    object IntegerField1: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object StringField2: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object StringField3: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
  end
end
