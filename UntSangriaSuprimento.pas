unit UntSangriaSuprimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  Data.FMTBcd, uniButton, unimButton, uniGUIBaseClasses, uniEdit, uniDBEdit,
  unimDBEdit, Data.DB, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr,
  Data.DBXFirebird, unimEdit, uniBitBtn, unimBitBtn, uniDateTimePicker,
  uniDBDateTimePicker, unimDBDatePicker, UntPrincipalEscolha, MidasLib;

type
  TFrmSangriaSuprimento = class(TUnimForm)
    SQLQuery1: TSQLQuery;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    BtnSalvar: TUnimButton;
    ClientDataSet1ID: TIntegerField;
    ClientDataSet1ID_CAIXA: TIntegerField;
    ClientDataSet1DATA_MOV: TSQLTimeStampField;
    ClientDataSet1HISTORICO: TStringField;
    ClientDataSet1ORIGEM: TStringField;
    ClientDataSet1DC: TStringField;
    ClientDataSet1VALOR: TFloatField;
    ClientDataSet1IDFUNC: TIntegerField;
    ClientDataSet1SALDO_ANTERIOR: TFloatField;
    ClientDataSet1IDPLANO: TIntegerField;
    ClientDataSet1IDSUBPLANO: TIntegerField;
    ClientDataSet1DESC_SUBPLANO: TStringField;
    ClientDataSet1SALDO_POSTERIOR: TFloatField;
    ClientDataSet1HORA_MOV: TSQLTimeStampField;
    BtnInserirSangria: TUnimBitBtn;
    BtnInserirSuprimento: TUnimBitBtn;
    UnimDBEdit1: TUnimDBEdit;
    UnimDBDatePicker1: TUnimDBDatePicker;
    QueryFuncionario: TSQLQuery;
    ProviderFuncionario: TDataSetProvider;
    DataSetFuncionario: TClientDataSet;
    SourceFuncionario: TDataSource;
    DataSetFuncionarioID: TIntegerField;
    DataSetFuncionarioNOME: TStringField;
    DataSetFuncionarioENDERECO: TStringField;
    DataSetFuncionarioNUMERO: TStringField;
    DataSetFuncionarioBAIRRO: TStringField;
    DataSetFuncionarioCIDADE: TStringField;
    DataSetFuncionarioCEP: TStringField;
    DataSetFuncionarioUF: TStringField;
    DataSetFuncionarioTELEFONE: TStringField;
    DataSetFuncionarioTELEFAX: TStringField;
    DataSetFuncionarioCELULAR: TStringField;
    DataSetFuncionarioCNPJ_CPF: TStringField;
    DataSetFuncionarioINSC_RG: TStringField;
    DataSetFuncionarioFILIACAO_PAI: TStringField;
    DataSetFuncionarioFILIACAO_MAE: TStringField;
    DataSetFuncionarioDATA_NASC: TSQLTimeStampField;
    DataSetFuncionarioDATA_ADMISSAO: TSQLTimeStampField;
    DataSetFuncionarioDATA_DEMISSAO: TSQLTimeStampField;
    DataSetFuncionarioSALARIO: TFloatField;
    DataSetFuncionarioCOMISSAO: TStringField;
    DataSetFuncionarioPERC_COMISSAO: TFloatField;
    DataSetFuncionarioATIVO: TStringField;
    DataSetFuncionarioOBSERVACOES: TMemoField;
    DataSetFuncionarioEMAIL: TStringField;
    DataSetFuncionarioTIPO: TIntegerField;
    DataSetFuncionarioTIPO_COM: TIntegerField;
    DataSetFuncionarioCONTA_MOVIMENTO: TIntegerField;
    QueryFuncionarioID: TIntegerField;
    QueryFuncionarioNOME: TStringField;
    QueryFuncionarioENDERECO: TStringField;
    QueryFuncionarioNUMERO: TStringField;
    QueryFuncionarioBAIRRO: TStringField;
    QueryFuncionarioCIDADE: TStringField;
    QueryFuncionarioCEP: TStringField;
    QueryFuncionarioUF: TStringField;
    QueryFuncionarioTELEFONE: TStringField;
    QueryFuncionarioTELEFAX: TStringField;
    QueryFuncionarioCELULAR: TStringField;
    QueryFuncionarioCNPJ_CPF: TStringField;
    QueryFuncionarioINSC_RG: TStringField;
    QueryFuncionarioFILIACAO_PAI: TStringField;
    QueryFuncionarioFILIACAO_MAE: TStringField;
    QueryFuncionarioDATA_NASC: TSQLTimeStampField;
    QueryFuncionarioDATA_ADMISSAO: TSQLTimeStampField;
    QueryFuncionarioDATA_DEMISSAO: TSQLTimeStampField;
    QueryFuncionarioSALARIO: TFloatField;
    QueryFuncionarioCOMISSAO: TStringField;
    QueryFuncionarioPERC_COMISSAO: TFloatField;
    QueryFuncionarioATIVO: TStringField;
    QueryFuncionarioOBSERVACOES: TMemoField;
    QueryFuncionarioEMAIL: TStringField;
    QueryFuncionarioTIPO: TIntegerField;
    QueryFuncionarioTIPO_COM: TIntegerField;
    QueryFuncionarioCONTA_MOVIMENTO: TIntegerField;
    QueryContas: TSQLQuery;
    ProviderContas: TDataSetProvider;
    DataSetContas: TClientDataSet;
    SourceContas: TDataSource;
    DataSetContasID: TIntegerField;
    DataSetContasDESCRICAO: TStringField;
    DataSetContasEMPRESA: TIntegerField;
    DataSetContasSALDO: TFloatField;
    DataSetContasNAO_EXIBIR_REL: TStringField;
    QueryContasID: TIntegerField;
    QueryContasDESCRICAO: TStringField;
    QueryContasEMPRESA: TIntegerField;
    QueryContasSALDO: TFloatField;
    QueryContasNAO_EXIBIR_REL: TStringField;
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnInserirSuprimentoClick(Sender: TObject);
    procedure BtnInserirSangriaClick(Sender: TObject);
    procedure AtualizaSaldo(xSaldo: double; PidConta: integer);
    procedure UnimButton1Click(Sender: TObject);
    procedure UnimFormShow(Sender: TObject);
    procedure AtivaDataSet;
    procedure DesativaDataset;
    procedure UnimFormCreate(Sender: TObject);


  private
  function RetornID(pUs: string): integer;
    { Private declarations }
  public
  function RetornIDFuncionario(pFunc: integer): integer;
  function GenID(pTABELA: String): Integer;
  function RetornIDCaixa(pCx: string): integer;
  function SomarSaldoAnterior(pSaldo: integer): double;
  function SomarSaldoPosterior :double;
  function DebitarSaldo :double;


    { Public declarations }
    var
    TxtConta : string;
    Pidfunc : integer;
    IdUsu: integer;
    dData: TDate;
    IdFunc : integer;
    IdCaixa : integer;
    SaldoA :double;
    RecbesaldoPost : double;
    ValorInf : double;
   // pIdfunc : integer;
   end;

function FrmSangriaSuprimento: TFrmSangriaSuprimento;

implementation

{$R *.dfm}

uses MainModule, uniGUIApplication, Mainm;



function FrmSangriaSuprimento: TFrmSangriaSuprimento;
begin
  Result := TFrmSangriaSuprimento(UniMainModule.GetFormInstance(TFrmSangriaSuprimento));
end;

procedure TFrmSangriaSuprimento.BtnInserirSangriaClick(Sender: TObject);
  VAR auxIdFunc: integer;
begin
    AtivaDataSet;
    ClientDataSet1.Open;
    ClientDataSet1.Insert;
    ClientDataSet1.FieldByName('ID').AsInteger := GenID('CAIXA_MOV'); //id tabela
    ClientDataSet1.FieldByName('ID_CAIXA').AsInteger := RetornIDCaixa(TxtConta);//id conta
        auxIdFunc := RetornIDFuncionario(IdCaixa); //id funcionario
    if (auxIdFunc = 0) then
    begin
       ClientDataSet1.FieldByName('IDFUNC').AsInteger := 99;
    end;

    ClientDataSet1.FieldByName('DC').AsString := 'D';
    ClientDataSet1.FieldByName('HISTORICO').AsString := 'SANGRIA';
    ClientDataSet1.FieldByName('ORIGEM').AsString := 'SANGRIA';
    ClientDataSet1.FieldByName('IDPLANO').asinteger := 99;
    ClientDataSet1.FieldByName('IDSUBPLANO').asinteger := 99;
    ClientDataSet1.FieldByName('DESC_SUBPLANO').asString := 'LANCAMENTOS PDV - SANGRIAS';
    ClientDataSet1.FieldByName('SALDO_ANTERIOR').Asfloat := SomarSaldoAnterior(IdCaixa);
    dData := date();
    UnimDBDatePicker1.Date := dData;
    ClientDataSet1.FieldByName('DATA_MOV').AsDateTime :=  UnimDBDatePicker1.date;
    UnimDBEdit1.Visible := true;
    UnimDBEdit1.SetFocus;
    BtnInserirSangria.Enabled := false;
    BtnSalvar.Enabled := true;
    UnimDBDatePicker1.ReadOnly := true;
    SaldoA := SomarSaldoAnterior(IdCaixa);
    DataSetContas.Open;
    DataSetContas.edit;
end;

procedure TFrmSangriaSuprimento.BtnInserirSuprimentoClick(Sender: TObject);
    var
    auxIdFunc :integer;
begin


    UnimDBEdit1.Visible := true;

   SQLQuery1.Active := true;

  FrmSangriaSuprimento.ClientDataSet1.Active := true;
  ClientDataSet1.Insert;


    UnimDBEdit1.SetFocus;
    ClientDataSet1.FieldByName('ID').AsInteger := GenID('CAIXA_MOV'); //id tabela
    ClientDataSet1.FieldByName('ID_CAIXA').AsInteger := RetornIDCaixa(TxtConta);//id conta
    auxIdFunc := RetornIDFuncionario(IdCaixa); //id funcionario
    if (auxIdFunc = 0) then
    begin
       ClientDataSet1.FieldByName('IDFUNC').AsInteger := 99;
    end;

    ClientDataSet1.FieldByName('DC').AsString := 'C';
    ClientDataSet1.FieldByName('HISTORICO').AsString := 'SUPRIMENTO';
    ClientDataSet1.FieldByName('ORIGEM').AsString := 'SUPRIMENTO';
    ClientDataSet1.FieldByName('IDPLANO').asinteger := 99;
    ClientDataSet1.FieldByName('IDSUBPLANO').asinteger := 98;
    ClientDataSet1.FieldByName('DESC_SUBPLANO').asString := 'LANCAMENTOS PDV - SUPRIMENTOS';
    ClientDataSet1.FieldByName('SALDO_ANTERIOR').AsFloat := SomarSaldoAnterior(IdCaixa);
    dData := date();
    UnimDBDatePicker1.Date := dData;
    ClientDataSet1.FieldByName('DATA_MOV').AsDateTime :=  UnimDBDatePicker1.date;
    BtnInserirSuprimento.Enabled := false;
    BtnSalvar.Enabled := true;
    UnimDBDatePicker1.ReadOnly := true;
 //   DataSetContas.Open;
  //  DataSetContas.edit;
end;

procedure TFrmSangriaSuprimento.BtnSalvarClick(Sender: TObject);
begin
  case  ClientDataSet1.FieldByName('IDSUBPLANO').asinteger of
   98:
    begin
     DataSetContas.Open;
     DataSetContas.edit;
     ClientDataSet1.Open;
     ClientDataSet1.edit;
     ValorInf := (strtofloat(UnimDBEdit1.Text));
     RecbesaldoPost := SomarSaldoPosterior;
     ClientDataSet1.FieldByName('SALDO_POSTERIOR').AsFloat := RecbesaldoPost;
     AtualizaSaldo(RecbesaldoPost, IdCaixa);
     ClientDataSet1.FieldByName('HORA_MOV').AsDateTime := (StrToDateTime(TimeToStr(Time)));
     DataSetContas.post;
     clientdataset1.post;
     clientdataset1.applyupdates(0);
     DataSetContas.applyupdates(0);
     BtnInserirSangria.Enabled := true;
     BtnInserirSuprimento.Enabled := true;
     ShowMessage('Opera��o concluida!');
     FrmSangriaSuprimento.Close;

    end;


   99:
   begin
     DataSetContas.Open;
     DataSetContas.edit;
     ClientDataSet1.Open;
     ClientDataSet1.edit;
     ValorInf := (strtofloat(UnimDBEdit1.Text));
     ClientDataSet1.FieldByName('SALDO_POSTERIOR').AsFloat := DebitarSaldo;
     ClientDataSet1.FieldByName('HORA_MOV').AsDateTime := (StrToDateTime(TimeToStr(Time)));
     AtualizaSaldo(DebitarSaldo, IdCaixa);
     DataSetContas.post;
     clientdataset1.post;
     clientdataset1.applyupdates(0);
     DataSetContas.applyupdates(0);
     BtnInserirSangria.Enabled := true;
     BtnInserirSuprimento.Enabled := true;
     ShowMessage('Opera��o concluida!');
     FrmSangriaSuprimento.Close;

   end;
  end;

end;

 procedure TFrmSangriaSuprimento.UnimButton1Click(Sender: TObject);
begin
  AtualizaSaldo(RecbesaldoPost, IdCaixa);
end;



procedure TFrmSangriaSuprimento.UnimFormCreate(Sender: TObject);
begin
   QueryFuncionario.SQLConnection := MainmFormLogin.conexao;;
   QueryContas.SQLConnection := MainmFormLogin.conexao;
   SQLQuery1.SQLConnection := MainmFormLogin.conexao;;
end;

procedure TFrmSangriaSuprimento.UnimFormShow(Sender: TObject);
begin
   SQLQuery1.SQLConnection := MainmFormLogin.conexao;
   QueryFuncionario.SQLConnection := MainmFormLogin.conexao;
   QueryContas.SQLConnection := MainmFormLogin.conexao;
   TxtConta := FrmPrincipalEscolha.UnimSelect1.Text;
   dData    := date();
   UnimDBDatePicker1.Date := dData;
   RetornID(MainmFormLogin.editusuario.Text);
   IdUsu    := RetornID(MainmFormLogin.editusuario.Text);
   BtnSalvar.Enabled := false;
   IdCaixa  := RetornIDCaixa(TxtConta);
   IdFunc   := RetornIDFuncionario(IdCaixa);
   saldoA   := SomarSaldoAnterior(IdCaixa);

   
end;

function TFrmSangriaSuprimento.RetornID(pUs: string): integer;
  var Q : TSQLQuery;

 begin  //Retornar Id usuario
  Q := TSQLQuery.Create(nil);
    begin

       try
        Q.SQLConnection := MainmFormLogin.Conexao;
        Q.SQL.Add('select usuarios.id from usuarios where usuarios.usuario = :pUsLogado');
        q.Params.ParamByName('pUsLogado').AsString := (pUs);
        Q.Open;
        Result := Q.FieldByName('ID').AsInteger;
       finally

        FreeAndNil(Q);
      end;
     end;

  end;


function TFrmSangriaSuprimento.GenID(pTabela :string):integer;
  var Q: TSqlQuery;
  begin
    Q := TSqlQuery.Create(nil);
    begin
      try
        Q.SQLConnection := MainmFormLogin.conexao;
        Q.Sql.Add('select gen_id('+Ptabela+'_ID,1) FROM RDB$DATABASE');
        Q.OPEN;
        Result := Q.FieldByName('GEN_ID').AsInteger;
      finally
      freeandnil(Q)

      end;
    end;
  end;


     function TFrmSangriaSuprimento.RetornIDFuncionario(pFunc: integer): integer;
  var Q : TSQLQuery;

 begin  //Retornar Id Funcionario
  Q := TSQLQuery.Create(nil);
    begin
      try
        Q.SQLConnection := MainmFormLogin.Conexao;
        Q.SQL.Add('SELECT FUNCIONARIO.id FROM FUNCIONARIO WHERE FUNCIONARIO.conta_movimento = :pFuncLogado');
        q.Params.ParamByName('pFuncLogado').Asfloat := (pFunc);
        Q.Open;
        Result := Q.FieldByName('ID').AsInteger;
       finally
        FreeAndNil(Q);
      end;
     end;
 end;


function TFrmSangriaSuprimento.RetornIDCaixa(pCx: string): integer;
var Q : TSQLQuery;

 begin  //Retornar Id Caixa
  Q := TSQLQuery.Create(nil);
    begin

       try
        Q.SQLConnection := MainmFormLogin.conexao;
        Q.SQL.Add('select conta_movimento.id from conta_movimento where conta_movimento.descricao = :pCaixa');
        q.Params.ParamByName('pCaixa').asstring := (pCx);
        Q.Open;
        Result := Q.FieldByName('ID').AsInteger;
       finally

        FreeAndNil(Q);
      end;
     end;

  end;


function TFrmSangriaSuprimento.SomarSaldoAnterior(pSaldo:integer):double;
var
 Q : TSqlQuery;
 begin
  try
    Q := TSQLQuery.Create(nil);
    Q.SQLConnection := MainmFormLogin.conexao;
    Q.SQL.Add('select conta_movimento.saldo from conta_movimento where conta_movimento.id = :nSaldo');
    Q.Params.ParamByName('nSaldo').AsInteger := (psaldo);
    Q.Open;
     Result := Q.FieldByName('SALDO').AsFloat;
  finally
     FreeAndNil(Q);
  end;
 end;

function TFrmSangriaSuprimento.SomarSaldoPosterior;
var  saldoA, saldoP, saldototal: double;

begin
    saldoA := SomarSaldoAnterior(IdCaixa);
    saldop := ValorInf;
    saldototal :=(saldoA + saldoP);
    result := saldototal;
end;


procedure TFrmSangriaSuprimento.AtualizaSaldo(xSaldo: double; PidConta: integer);
var Q: TSQLQUERY;
begin
 try
    Q := QueryContas;
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('update conta_movimento set conta_movimento.saldo = :pSaldoT where conta_movimento.id = :nIdConta');
    Q.Params.ParamByName('pSaldoT').Asfloat := (xSaldo);
    Q.Params.ParamByName('nIdConta').Asinteger := (pidConta);
    Q.ExecSQL(false);
  finally
   //  Q.Free;
  end;
end;


function TFrmSangriaSuprimento.debitarsaldo;
var  saldoA, saldoP, saldototal: double;

begin
    saldoA := SomarSaldoAnterior(IdCaixa);
    saldop := ValorInf;
    saldototal :=(saldoA - saldoP);
    result := saldototal;
end;

procedure TFrmSangriaSuprimento.AtivaDataSet;
 begin
   ClientDataSet1.Active := true;
   DataSetContas.Active := true;
   DataSetFuncionario.Active := true;
   ClientDataSet1.open;
   DataSetContas.open;
   DataSetFuncionario.open;
 end;

 procedure TFrmSangriaSuprimento.DesativaDataset;
 begin
   ClientDataSet1.close;
   DataSetContas.close;
   DataSetFuncionario.close;
   ClientDataSet1.Active := false;
   DataSetContas.Active := false;
   DataSetFuncionario.Active := false;
 end;
end.
