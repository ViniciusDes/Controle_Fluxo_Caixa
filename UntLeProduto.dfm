object MainmFormLeProduto: TMainmFormLeProduto
  Left = 0
  Top = 0
  ClientHeight = 438
  ClientWidth = 542
  Caption = 'Etica Mobile 1.18.1'
  OnShow = UnimFormShow
  TitleButtons = <>
  OnAjaxEvent = UnimFormAjaxEvent
  OnCreate = UnimFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  ScrollPosition = 0
  ScrollHeight = 47
  PlatformData = {}
  object edBarcode: TUnimEdit
    Left = 0
    Top = 0
    Width = 542
    Height = 59
    Hint = ''
    Align = alTop
    Text = ''
    ParentFont = False
    Font.Height = -27
    Font.Style = [fsBold]
    TabOrder = 0
    OnExit = edBarcodeExit
  end
  object btScan: TUnimButton
    Left = 0
    Top = 59
    Width = 542
    Height = 47
    Hint = ''
    Align = alTop
    Caption = 'Ler Codigo de Barras'
    ClientEvents.ExtEvents.Strings = (
      'tap=function tap(sender, e, eOpts)'#13#10'{'#13#10'  getScan();'#13#10'}')
    ScreenMask.Color = 16744448
    Font.Style = [fsBold]
  end
  object UnimLabel1: TUnimLabel
    Left = 4
    Top = 109
    Width = 81
    Height = 29
    Hint = ''
    AutoSize = False
    Caption = 'Codigo:'
    ParentFont = False
    Font.Style = [fsBold]
  end
  object UnimLabelCodigo: TUnimLabel
    Left = 123
    Top = 109
    Width = 81
    Height = 29
    Hint = ''
    AutoSize = False
    Caption = ''
    ParentFont = False
    Font.Style = [fsBold]
  end
  object UnimLabel2: TUnimLabel
    Left = 2
    Top = 144
    Width = 109
    Height = 29
    Hint = ''
    AutoSize = False
    Caption = 'Descri'#231#227'o:'
    ParentFont = False
    Font.Style = [fsBold]
  end
  object UnimLabelDescricao: TUnimLabel
    Left = 117
    Top = 144
    Width = 394
    Height = 42
    Hint = ''
    AutoSize = False
    Caption = ''
    ParentFont = False
    Font.Style = [fsBold]
  end
  object UnimTabPanelPreco: TUnimTabPanel
    Left = 0
    Top = 192
    Width = 534
    Height = 192
    Hint = ''
    ActivePage = UnimTabSheet2
    object UnimTabSheet1: TUnimTabSheet
      Left = 4
      Top = 51
      Width = 526
      Height = 137
      Hint = ''
      Caption = 'Pre'#231'o'
      object UnimLabel5: TUnimLabel
        Left = 2
        Top = 22
        Width = 144
        Height = 29
        Hint = ''
        AutoSize = False
        Caption = 'Pre'#231'o Custo:'
        ParentFont = False
        Font.Style = [fsBold]
      end
      object UnimLabelPrecoCusto: TUnimLabel
        Left = 144
        Top = 22
        Width = 60
        Height = 29
        Hint = ''
        AutoSize = False
        Caption = ''
        ParentFont = False
        Font.Style = [fsBold]
      end
      object UnimEditPrecoCusto: TUnimEdit
        Left = 208
        Top = 15
        Width = 148
        Height = 36
        Hint = ''
        ClientEvents.UniEvents.Strings = (
          
            'afterCreate=function afterCreate(sender) {'#13#10'    Ext.onReady(func' +
            'tion() {'#13#10'        sender.element.down('#39'.x-input-number'#39').on("key' +
            'down", function(e) {'#13#10'            var event = e.event;'#13#10'        ' +
            '    if (event.keyCode == 46 || event.keyCode == 8 || event.keyCo' +
            'de == 9 || event.keyCode == 27 || event.keyCode == 13 ||'#13#10'      ' +
            '          (event.keyCode == 65 && event.ctrlKey === true) ||'#13#10'  ' +
            '              (event.keyCode >= 35 && event.keyCode <= 39)) {'#13#10' ' +
            '               return;'#13#10'            } else {'#13#10'                if' +
            ' (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) &' +
            '& (event.keyCode < 96 || event.keyCode > 105)) {'#13#10'              ' +
            '      event.preventDefault();'#13#10'                }'#13#10'            }'#13 +
            #10'        })'#13#10'    })'#13#10'}')
        Text = ''
        ParentFont = False
        TabOrder = 2
      end
      object UnimLabel4: TUnimLabel
        Left = 3
        Top = 69
        Width = 143
        Height = 29
        Hint = ''
        AutoSize = False
        Caption = 'Pre'#231'o Venda:'
        ParentFont = False
        Font.Style = [fsBold]
      end
      object UnimLabelPrecoVenda: TUnimLabel
        Left = 144
        Top = 69
        Width = 62
        Height = 29
        Hint = ''
        AutoSize = False
        Caption = ''
        ParentFont = False
        Font.Style = [fsBold]
      end
      object UnimEditPrecoVenda: TUnimEdit
        Left = 208
        Top = 62
        Width = 148
        Height = 36
        Hint = ''
        ClientEvents.UniEvents.Strings = (
          
            'afterCreate=function afterCreate(sender) {'#13#10'    Ext.onReady(func' +
            'tion() {'#13#10'        sender.element.down('#39'.x-input-number'#39').on("key' +
            'down", function(e) {'#13#10'            var event = e.event;'#13#10'        ' +
            '    if (event.keyCode == 46 || event.keyCode == 8 || event.keyCo' +
            'de == 9 || event.keyCode == 27 || event.keyCode == 13 ||'#13#10'      ' +
            '          (event.keyCode == 65 && event.ctrlKey === true) ||'#13#10'  ' +
            '              (event.keyCode >= 35 && event.keyCode <= 39)) {'#13#10' ' +
            '               return;'#13#10'            } else {'#13#10'                if' +
            ' (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) &' +
            '& (event.keyCode < 96 || event.keyCode > 105)) {'#13#10'              ' +
            '      event.preventDefault();'#13#10'                }'#13#10'            }'#13 +
            #10'        })'#13#10'    })'#13#10'}')
        Text = ''
        ParentFont = False
        TabOrder = 5
      end
    end
    object UnimTabSheet2: TUnimTabSheet
      Left = 4
      Top = 51
      Width = 526
      Height = 137
      Hint = ''
      Caption = 'Estoque'
      object UnimLabel3: TUnimLabel
        Left = 2
        Top = 26
        Width = 167
        Height = 29
        Hint = ''
        AutoSize = False
        Caption = 'Estoque Atual:'
        ParentFont = False
        Font.Style = [fsBold]
      end
      object UnimLabelEstoqueAtual: TUnimLabel
        Left = 174
        Top = 27
        Width = 60
        Height = 29
        Hint = ''
        AutoSize = False
        Caption = ''
        ParentFont = False
        Font.Style = [fsBold]
      end
      object UnimEditEstoque: TUnimEdit
        Left = 240
        Top = 22
        Width = 116
        Height = 36
        Hint = ''
        ClientEvents.UniEvents.Strings = (
          
            'afterCreate=function afterCreate(sender) {'#13#10'    Ext.onReady(func' +
            'tion() {'#13#10'        sender.element.down('#39'.x-input-number'#39').on("key' +
            'down", function(e) {'#13#10'            var event = e.event;'#13#10'        ' +
            '    if (event.keyCode == 46 || event.keyCode == 8 || event.keyCo' +
            'de == 9 || event.keyCode == 27 || event.keyCode == 13 ||'#13#10'      ' +
            '          (event.keyCode == 65 && event.ctrlKey === true) ||'#13#10'  ' +
            '              (event.keyCode >= 35 && event.keyCode <= 39)) {'#13#10' ' +
            '               return;'#13#10'            } else {'#13#10'                if' +
            ' (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) &' +
            '& (event.keyCode < 96 || event.keyCode > 105)) {'#13#10'              ' +
            '      event.preventDefault();'#13#10'                }'#13#10'            }'#13 +
            #10'        })'#13#10'    })'#13#10'}')
        Text = ''
        ParentFont = False
        TabOrder = 2
      end
      object UnimLabel6: TUnimLabel
        Left = 0
        Top = 78
        Width = 185
        Height = 29
        Hint = ''
        AutoSize = False
        Caption = 'Estoque Minimo:'
        ParentFont = False
        Font.Style = [fsBold]
      end
      object UnimEditEstoqueMin: TUnimEdit
        Left = 239
        Top = 70
        Width = 118
        Height = 36
        Hint = ''
        ClientEvents.UniEvents.Strings = (
          
            'afterCreate=function afterCreate(sender) {'#13#10'    Ext.onReady(func' +
            'tion() {'#13#10'        sender.element.down('#39'.x-input-number'#39').on("key' +
            'down", function(e) {'#13#10'            var event = e.event;'#13#10'        ' +
            '    if (event.keyCode == 46 || event.keyCode == 8 || event.keyCo' +
            'de == 9 || event.keyCode == 27 || event.keyCode == 13 ||'#13#10'      ' +
            '          (event.keyCode == 65 && event.ctrlKey === true) ||'#13#10'  ' +
            '              (event.keyCode >= 35 && event.keyCode <= 39)) {'#13#10' ' +
            '               return;'#13#10'            } else {'#13#10'                if' +
            ' (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) &' +
            '& (event.keyCode < 96 || event.keyCode > 105)) {'#13#10'              ' +
            '      event.preventDefault();'#13#10'                }'#13#10'            }'#13 +
            #10'        })'#13#10'    })'#13#10'}')
        Text = ''
        ParentFont = False
        TabOrder = 4
      end
      object UnimLabelEstoqueMinimo: TUnimLabel
        Left = 181
        Top = 74
        Width = 51
        Height = 29
        Hint = ''
        AutoSize = False
        Caption = ''
        ParentFont = False
        Font.Style = [fsBold]
      end
    end
  end
  object UnimButton1: TUnimButton
    Left = 0
    Top = 389
    Width = 289
    Height = 51
    Hint = ''
    Margins.Bottom = 4
    Caption = 'Gravar'
    OnClick = UnimButton1Click
  end
  object DataSourceProdutos: TDataSource
    Enabled = False
    Left = 392
    Top = 144
  end
  object DataSourceMovimentoEst: TDataSource
    Enabled = False
    Left = 440
    Top = 144
  end
end
