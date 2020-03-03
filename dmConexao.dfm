object DataModuleConexao: TDataModuleConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 261
  Width = 429
  object SQLConnection1: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'Database=database.fdb'
      'Password=masterkey'
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver240.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver240.bpl'
      
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
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    Left = 31
    Top = 30
  end
  object SQLQueryProdutos: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pEan13'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from produtos '
      'where produtos.ean13 = :pEan13')
    SQLConnection = SQLConnection1
    Left = 184
    Top = 24
  end
  object DataSetProviderProdutos: TDataSetProvider
    DataSet = SQLQueryProdutos
    Left = 184
    Top = 63
  end
  object ClientDataSetProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderProdutos'
    Left = 184
    Top = 105
  end
  object SQLQueryMovimentoEst: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from movimento_est')
    SQLConnection = SQLConnection1
    Left = 344
    Top = 24
  end
  object DataSetProviderMovimentoEst: TDataSetProvider
    DataSet = SQLQueryMovimentoEst
    Left = 344
    Top = 61
  end
  object ClientDataSetMovimentoEst: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderMovimentoEst'
    Left = 344
    Top = 101
  end
end
