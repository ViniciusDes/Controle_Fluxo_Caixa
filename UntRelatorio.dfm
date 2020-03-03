object FrmRelatorio: TFrmRelatorio
  Left = 0
  Top = 0
  ClientHeight = 480
  ClientWidth = 436
  Caption = 'FrmRelatorio'
  AlignmentControl = uniAlignmentClient
  DisplayCaption = False
  TitleButtons = <>
  OnCreate = UnimFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  ScrollPosition = 0
  ScrollHeight = 47
  PlatformData = {}
  object EditRelatorio: TUnimEdit
    Left = 0
    Top = 0
    Width = 436
    Height = 47
    Hint = ''
    Align = alTop
    Text = 'Relatorio - caixa di'#225'rio'
    ParentFont = False
    Font.Color = clBlue
    Font.Style = [fsBold]
    ReadOnly = True
    TabOrder = 1
  end
  object EditData: TUnimEdit
    Left = 0
    Top = 47
    Width = 436
    Height = 42
    Hint = ''
    Align = alTop
    Text = ''
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object EditConta: TUnimEdit
    Left = 0
    Top = 89
    Width = 436
    Height = 42
    Hint = ''
    Align = alTop
    Text = 'Contas: '
    ParentFont = False
    Font.Color = clBlue
    Font.Style = [fsBold]
    ReadOnly = True
    TabOrder = 3
  end
  object Dbgrid1: TUnimDBGrid
    AlignWithMargins = True
    Left = 0
    Top = 146
    Width = 529
    Height = 600
    Hint = ''
    DataSource = DataSource1
    CellEditor = True
    Font.Height = -12
    Columns = <
      item
        EditorItems.Strings = (
          'Forma pgto')
        Title.Caption = 'ORIGEM'
        FieldName = 'ORIGEM'
        Width = 230
      end
      item
        Font.Height = -15
        Title.Caption = 'VALOR'
        FieldName = 'VALOR'
        Width = 100
      end
      item
        Title.Caption = 'DC'
        FieldName = 'DC'
        Width = 64
      end>
  end
  object SQLQuery1: TSQLQuery
    DataSource = DataSource1
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT caixa_mov.desc_subplano as origem, SUM(round(valor)) as v' +
        'alor, caixa_mov.dc'
      'from caixa_mov'
      '')
    Left = 280
    Top = 232
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLQuery1
    Left = 336
    Top = 232
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 408
    Top = 232
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 472
    Top = 232
  end
end
