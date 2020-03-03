object MainmFormLogin: TMainmFormLogin
  AlignWithMargins = True
  Left = 0
  Top = 0
  ClientHeight = 480
  ClientWidth = 320
  Caption = 'FA'#199'A O LOGIN'
  BorderIcons = [biSystemMenu, biMaximize]
  ScreenMask.Message = 'Login'
  ScreenMask.Target = Owner
  ScreenMask.Opacity = 1.000000000000000000
  CloseButton.Text = 'SAIR'
  CloseButton.UI = 'normal'
  CloseButton.IconCls = 'home'
  TitleButtons = <>
  OnCreate = UnimFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  ScrollPosition = 0
  ScrollHeight = 47
  PlatformData = {}
  object UnimLabel1: TUnimLabel
    Left = 112
    Top = 19
    Width = 89
    Height = 23
    Hint = ''
    AutoSize = False
    Caption = 'USUARIO'
    ParentFont = False
    Font.Color = clBlue
  end
  object EditUsuario: TUnimEdit
    Left = 48
    Top = 48
    Width = 225
    Height = 47
    Hint = ''
    Text = ''
    CharCase = ecUpperCase
    ParentFont = False
    TabOrder = 0
  end
  object UnimLabel2: TUnimLabel
    Left = 120
    Top = 101
    Width = 225
    Height = 23
    Hint = ''
    AutoSize = False
    Caption = 'SENHA'
    ParentFont = False
    Font.Color = clBlue
  end
  object UnimEdit2: TUnimEdit
    Left = 48
    Top = 125
    Width = 225
    Height = 47
    Hint = ''
    Text = ''
    PasswordChar = '#'
    ParentFont = False
    TabOrder = 1
  end
  object UnimBitBtn2: TUnimBitBtn
    Left = 48
    Top = 178
    Width = 105
    Height = 47
    Hint = ''
    Caption = 'LOGIN'
    Font.Color = clBlue
    OnClick = UnimBitBtn2Click
  end
  object UnimButton2: TUnimButton
    Left = 159
    Top = 178
    Width = 114
    Height = 47
    Hint = ''
    Caption = 'SAIR'
    Font.Color = clBlue
    OnClick = UnimButton2Click
  end
  object SQLQuery1: TSQLQuery
    DataSource = DataSource1
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftString
        Name = 'PUs'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PSen'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from USUARIOS'
      'where (USUARIO=:PUs ) and (SENHA=:PSen)')
    SQLConnection = conexao
    Left = 76
    Top = 280
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLQuery1
    Left = 140
    Top = 280
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'PUs'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PSen'
        ParamType = ptInput
      end>
    ProviderName = 'DataSetProvider1'
    Left = 200
    Top = 280
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 272
    Top = 280
  end
  object QueryFunc: TSQLQuery
    DataSource = SourceFunc
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'select * from funcionario')
    SQLConnection = conexao
    Left = 80
    Top = 328
  end
  object ProviderFunc: TDataSetProvider
    DataSet = QueryFunc
    Left = 144
    Top = 328
  end
  object DataSetFunc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'ProviderFunc'
    Left = 208
    Top = 328
  end
  object SourceFunc: TDataSource
    DataSet = DataSetFunc
    Left = 272
    Top = 328
  end
  object SQLQuery2: TSQLQuery
    DataSource = DataSource2
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'select * from conta_movimento'
      '')
    SQLConnection = conexao
    Left = 88
    Top = 384
    object SQLQuery2ID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object SQLQuery2DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
    object SQLQuery2EMPRESA: TIntegerField
      FieldName = 'EMPRESA'
      Required = True
    end
    object SQLQuery2SALDO: TFloatField
      FieldName = 'SALDO'
    end
    object SQLQuery2NAO_EXIBIR_REL: TStringField
      FieldName = 'NAO_EXIBIR_REL'
      FixedChar = True
      Size = 1
    end
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = SQLQuery2
    Left = 144
    Top = 384
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider2'
    Left = 208
    Top = 384
    object ClientDataSet2ID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object ClientDataSet2DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
    object ClientDataSet2EMPRESA: TIntegerField
      FieldName = 'EMPRESA'
      Required = True
    end
    object ClientDataSet2SALDO: TFloatField
      FieldName = 'SALDO'
    end
    object ClientDataSet2NAO_EXIBIR_REL: TStringField
      FieldName = 'NAO_EXIBIR_REL'
      FixedChar = True
      Size = 1
    end
  end
  object DataSource2: TDataSource
    DataSet = ClientDataSet2
    Left = 272
    Top = 384
  end
  object conexao: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'Database=C:\ettica\exec\dados\dados.fdb'
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver250.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver250.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=24.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'TrimChar=False'
      'DriverName=Firebird'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    Connected = True
    Left = 16
    Top = 288
  end
end
