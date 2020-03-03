unit dmConexao;

interface

uses
  System.SysUtils, System.Classes,SqlExpr, Data.DBXFirebird, Data.FMTBcd,
  Datasnap.DBClient, Datasnap.Provider, Data.DB,Forms,IniFiles;

type
  TDataModuleConexao = class(TDataModule)
    SQLConnection1: TSQLConnection;
    SQLQueryProdutos: TSQLQuery;
    DataSetProviderProdutos: TDataSetProvider;
    ClientDataSetProdutos: TClientDataSet;
    SQLQueryMovimentoEst: TSQLQuery;
    DataSetProviderMovimentoEst: TDataSetProvider;
    ClientDataSetMovimentoEst: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure LeArqIni;
    procedure DataModuleDestroy(Sender: TObject);
    procedure Grava_Dados(pDataDados: TDataSet);
    procedure IniciaTransacao;
    function GenID(pTabela: String): Integer;
  private
    { Private declarations }
  public
    { Public declarations }
     Transc : TTransactionDesc;
    ConexaoDados : TSQLConnection;
    sPath,sPass,sUser:string;
    ArqIni:TIniFile;
    function Dados_Produto(fEAN13: String): Boolean;
  end;

var
  DataModuleConexao: TDataModuleConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModuleConexao.DataModuleCreate(Sender: TObject);
var
  aux:string;
begin
   try
    // verifica arquivo de configuração de acesso aos dados
    aux := ExtractFilePath(Application.ExeName)+'config.ini';

    LeArqIni;

    // realiza conexao com o banco de dados
    SQLConnection1.Connected := false;

    SQLConnection1.Params.Values['Database']  := sPath;
    SQLConnection1.Params.Values['User_Name'] := sUser;
    SQLConnection1.Params.Values['Password']  := sPass;

    TRY
      SQLConnection1.Connected := true;

    excepT

    END;
    // atribui variavel de controle
    ConexaoDados := SQLConnection1;

    //verifica se tem o banco de dados xml.fdb





  except
   // MessageDlg('Erro ao conectar banco de dados. Verifique!!!', mtWarning, [mbOK], 0);


    Application.Terminate;
  end;
end;


procedure TDataModuleConexao.DataModuleDestroy(Sender: TObject);
begin
SQLConnection1.Connected := false;
end;

procedure TDataModuleConexao.LeArqIni;
begin
  ArqIni    := TIniFile.Create(ExtractFilePath(Application.ExeName)+'config.ini');
  sPath     := ArqINI.ReadString('DADOS','PATH',ExtractFilePath(Application.ExeName)+'Dados\WORKCOM.GDB');
  sUser     := ArqINI.ReadString('DADOS','USUARIO','SYSDBA');
  sPass     := ArqINI.ReadString('DADOS','SENHA','masterkey');

  //sPathXML     := ArqINI.ReadString('DADOS','PATHXML',ExtractFilePath(Application.ExeName)+'Dados\XML.FDB');
 

  ArqIni.Free;
end;


function TDataModuleConexao.Dados_Produto(fEAN13: String): Boolean;
begin
  ClientDataSetProdutos.Close;
  SQLQueryProdutos.Close;
  SQLQueryProdutos.SQL.Clear;
  SQLQueryProdutos.SQL.Add('select * from produtos');
  SQLQueryProdutos.SQL.Add('where produtos.EAN13 = :pEAN13');
//  SQLQueryProdutos.SQL.Add('AND produtos.ATIVO <> "F"');


  //
  ClientDataSetProdutos.FetchParams;
  ClientDataSetProdutos.Params.ParamByName('pEAN13').AsString := fEAN13;
  ClientDataSetProdutos.Open;
  //
  Result := false;
  if ClientDataSetProdutos.RecordCount > 0 then
     Result := true;

end;


procedure TDataModuleConexao.Grava_Dados(pDataDados: TDataSet);
begin

    Randomize;
    IniciaTransacao;
   // IniciaTransacao;


   if TClientDataSet(pDataDados).Active then
   begin
    if TClientDataSet(pDataDados).State in [dsInsert,dsEdit] then
       TClientDataSet(pDataDados).Post;
    if TClientDataSet(pDataDados).ChangeCount > 0 then
       begin
          try
             try
              TClientDataSet(pDataDados).ApplyUpdates(0);
             except
               on e: Exception do
               begin
                //ShowMessage('Erro ao gravar no banco de dados.');
                abort;
               end;
             end;
             ConexaoDados.Commit(Transc);
          except
            // ShowMessage('Erro ao inserir no banco de dados.');
             ConexaoDados.Rollback(Transc);
          end;
       end;
   end;

end;


procedure TDataModuleConexao.IniciaTransacao;
begin
  Transc.TransactionID  := Random(656354561);
  Transc.TransactionID  := Random(756224129);

 // Transc.TransactionID  := 200;

  Transc.IsolationLevel :=  xilREADCOMMITTED;
  ConexaoDados.StartTransaction(Transc);

end;


function TDataModuleConexao.GenID(pTabela: String): Integer;
var Q : TSQLQuery;
begin
  Q := TSQLQuery.Create(nil);
  try
    Q.SQLConnection := ConexaoDados;
    Q.SQL.Add('SELECT GEN_ID('+pTabela+'_ID,1) FROM RDB$DATABASE');
    Q.Open;
    Result := Q.Fields[0].AsInteger;
  finally
    FreeAndNil(Q);
  end;

end;






end.
