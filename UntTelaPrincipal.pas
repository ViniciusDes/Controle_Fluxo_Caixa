unit UntTelaPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  Data.DBXFirebird, Data.FMTBcd, uniDateTimePicker, uniLabel, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, uniButton, uniEdit,
  uniGUIBaseClasses, uniMultiItem, uniComboBox, uniDBComboBox, unimDatePicker,
  uniCheckBox, uniDBCheckBox, unimDBCheckBox, unimEdit, unimButton, unimLabel,
  uniBasicGrid, uniDBGrid, unimDBListGrid, uniDBDateTimePicker, unimDBDatePicker,
  uniDBEdit, unimDBEdit, unimDBGrid, unimSelect, unimDBSelect, unimList,
  unimDBList, uniDBNavigator, unimDBNavigator, unimCheckBox, uniRadioButton,
  unimRadio, uniPageControl,  uniBitBtn, unimBitBtn;

type
  TUnimFormPrincipal = class(TUnimForm)
    UnimLabel1: TUnimLabel;
    UnimButton1: TUnimButton;
    EditSaldoReceita: TUnimEdit;
    UnimLabel2: TUnimLabel;
    SQLQuery1: TSQLQuery;
    DataSetProvider1: TDataSetProvider;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    QueryMov: TSQLQuery;
    providerMov: TDataSetProvider;
    DataSourceMov: TDataSource;
    DataSetMov: TClientDataSet;
    QueryMovID: TIntegerField;
    QueryMovID_CAIXA: TIntegerField;
    QueryMovDATA_MOV: TSQLTimeStampField;
    QueryMovHISTORICO: TStringField;
    QueryMovORIGEM: TStringField;
    QueryMovDC: TStringField;
    QueryMovVALOR: TFloatField;
    QueryMovIDFUNC: TIntegerField;
    QueryMovSALDO_ANTERIOR: TFloatField;
    QueryMovIDPLANO: TIntegerField;
    QueryMovIDSUBPLANO: TIntegerField;
    QueryMovDESC_SUBPLANO: TStringField;
    QueryMovSALDO_POSTERIOR: TFloatField;
    QueryMovHORA_MOV: TSQLTimeStampField;
    DataSetMovID: TIntegerField;
    DataSetMovID_CAIXA: TIntegerField;
    DataSetMovDATA_MOV: TSQLTimeStampField;
    DataSetMovHISTORICO: TStringField;
    DataSetMovORIGEM: TStringField;
    DataSetMovDC: TStringField;
    DataSetMovVALOR: TFloatField;
    DataSetMovIDFUNC: TIntegerField;
    DataSetMovSALDO_ANTERIOR: TFloatField;
    DataSetMovIDPLANO: TIntegerField;
    DataSetMovIDSUBPLANO: TIntegerField;
    DataSetMovDESC_SUBPLANO: TStringField;
    DataSetMovSALDO_POSTERIOR: TFloatField;
    DataSetMovHORA_MOV: TSQLTimeStampField;
    UnimDatePicker1: TUnimDatePicker;
    UnimDatePicker2: TUnimDatePicker;
    UnimLabel5: TUnimLabel;
    ChecTodas: TUnimCheckBox;
    EditSaldoSaida: TUnimEdit;
    EditSaldoReal: TUnimEdit;
    UnimLabel6: TUnimLabel;
    UnimLabel7: TUnimLabel;
    UnimLabel8: TUnimLabel;
    SQLQuery1ID: TIntegerField;
    SQLQuery1DESCRICAO: TStringField;
    SQLQuery1EMPRESA: TIntegerField;
    SQLQuery1SALDO: TFloatField;
    SQLQuery1NAO_EXIBIR_REL: TStringField;
    UnimSelect1: TUnimSelect;
    UnimBitBtn1: TUnimBitBtn;
    procedure UnimButton1Click(Sender: TObject);
    procedure UnimDatePicker1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UnimFormCreate(Sender: TObject);
    procedure UnimFormShow(Sender: TObject);
    procedure UnimFormClose(Sender: TObject; var Action: TCloseAction);
    procedure UnimBitBtn1Click(Sender: TObject);
    procedure ChecTodasClick(Sender: TObject);
  private

    { Private declarations }
  public
  function CalculaContA(nIdConta:integer; dData: Tdate; dData2: tdate): double ;
  function CalculaContADesp(nIdConta:integer; dData: Tdate; dData2: tdate): double ;
  function CalculaTodasContA(dData: Tdate; dData2: tdate): double ;
  function RetornIdCaixa(pidCaixa: string): integer;
  function SomarValor2Valores: double;
  function CalculaTodasContADesp(dData: Tdate; dData2: tdate): double ;
  function SomarValor2ValoresTodas: double;

      { Public declarations }
  end;
   var
   date1 :tdate;
   date2 : TDate;
   valorSaida : double;
   valorSaidaTodas: double;
   valorReceita: double;
   valorReceitaTodas: double;
   descConta: String;
   idconta: integer;
function UnimFormPrincipal: TUnimFormPrincipal;

implementation

{$R *.dfm}

uses MainModule, Mainm, ServerModule, UnitLanc, UntRelatorio;

function UnimFormPrincipal: TUnimFormPrincipal;
begin
  Result := TUnimFormPrincipal(UniMainModule.GetFormInstance(TUnimFormPrincipal));
end;

procedure TUnimFormPrincipal.UnimBitBtn1Click(Sender: TObject);
begin
  if (UnimSelect1.Text = '') and (ChecTodas.Checked = false) then
   begin
     ShowMessage('Selecione uma conta para consulta!');
   end

  else
  begin

  end;
    if ChecTodas.Checked = true then

   begin
   date1 := UnimDatePicker1.Date;
   date2 := UnimDatePicker2.Date;
   descConta := UnimSelect1.Text;
   FrmRelatorio.SQLQuery1.close;
   FrmRelatorio.SQLQuery1.SQL.Clear;
   FrmRelatorio.SQLQuery1.SQL.Add('SELECT caixa_mov.desc_subplano as origem, SUM(valor) as valor, caixa_mov.dc from caixa_mov where caixa_mov.data_mov >= :Pdata1 and caixa_mov.data_mov <= :Pdata2 group by caixa_mov.desc_subplano, caixa_mov.dc');
   FrmRelatorio.SQLQuery1.Params.ParamByName('Pdata1').AsString := (FormatDateTime('dd.mm.yyyy',(date1)));
   FrmRelatorio.SQLQuery1.Params.ParamByName('Pdata2').AsString := (FormatDateTime('dd.mm.yyyy',(date2)));
   FrmRelatorio.SQLQuery1.Open;
   FrmRelatorio.ClientDataSet1.Open;
     FrmRelatorio.ShowModal;
   end
   else

   begin
   date1 := UnimDatePicker1.Date;
   date2 := UnimDatePicker2.Date;
   descConta := UnimSelect1.Text;
   idconta := RetornIdCaixa(DescConta);
   FrmRelatorio.SQLQuery1.close;
   FrmRelatorio.SQLQuery1.SQL.Add('where caixa_mov.data_mov >= :Pdata1 and caixa_mov.data_mov <= :Pdata2 and caixa_mov.id_caixa =:Pid group by caixa_mov.desc_subplano, caixa_mov.dc');
   FrmRelatorio.SQLQuery1.Params.ParamByName('Pdata1').AsString := (FormatDateTime('dd.mm.yyyy',(date1)));
   FrmRelatorio.SQLQuery1.Params.ParamByName('Pdata2').AsString := (FormatDateTime('dd.mm.yyyy',(date2)));
   FrmRelatorio.SQLQuery1.Params.ParamByName('Pid').AsInteger := idconta;
      FrmRelatorio.SQLQuery1.Open;
      FrmRelatorio.ClientDataSet1.Open;
     FrmRelatorio.ShowModal;
   end;


  end;


procedure TUnimFormPrincipal.UnimButton1Click(Sender: TObject);
var
  valor1,valor2,valor3 : double;

begin
  if (UnimSelect1.Text = '') and (ChecTodas.Checked = false) then
   begin
     ShowMessage('Selecione uma conta para consulta!');
   end

   else
 begin
  descConta := UnimSelect1.Text;
  idconta := RetornIdCaixa(DescConta);
   if ChecTodas.Checked then
  begin
    valorReceitaTodas := CalculaTodasContA(UnimDatePicker1.Date, UnimDatePicker2.Date);
    valorSaidaTodas := CalculaTodasContADesp(UnimDatePicker1.Date, UnimDatePicker2.Date);
    EditSaldoReceita.Text := (floattostr(CalculaTodasContA(UnimDatePicker1.Date, UnimDatePicker2.Date)));
    EditSaldoSaida.Text := (floattostr(CalculaTodasContADesp(UnimDatePicker1.Date, UnimDatePicker2.Date)));
    EditSaldoReal.Text := (floattostr(SomarValor2ValoresTodas));
    valor1 := StrToCurr(EditSaldoReceita.Text);
    valor2 := StrToCurr(EditSaldoSaida.Text);
    valor3 := StrToCurr(EditSaldoReal.Text);
        EditSaldoReceita.Text := FormatFloat('#,.##,.###', valor1);
        EditSaldoSaida.Text := FormatFloat('#,.##,.###', valor2);
        EditSaldoReal.Text := FormatFloat('#,.##,.###', valor3);
  end
   else
   begin
    valorReceita := CalculaConta(idconta, UnimDatePicker1.Date, UnimDatePicker2.Date);
    valorSaida := CalculaContADesp(idconta, UnimDatePicker1.Date, UnimDatePicker2.Date);
    EditSaldoReceita.Text := (floattostr(CalculaConta(idconta, UnimDatePicker1.Date, UnimDatePicker2.Date)));
    EditSaldoSaida.Text := (floattostr(CalculaContADesp(idconta, UnimDatePicker1.Date, UnimDatePicker2.Date)));
    EditSaldoReal.Text := (floattostr(SomarValor2Valores));
    valor1 := StrToCurr(EditSaldoReceita.Text);
    valor2 := StrToCurr(EditSaldoSaida.Text);
    valor3 := StrToCurr(EditSaldoReal.Text);
        EditSaldoReceita.Text := FormatFloat('#,.##,.###', valor1);
        EditSaldoSaida.Text := FormatFloat('#,.##,.###', valor2);
        EditSaldoReal.Text := FormatFloat('#,.##,.###', valor3);
   end;
 end;
end;



procedure TUnimFormPrincipal.UnimDatePicker1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
       (FormatDateTime('dd.mm.yyyy', UnimDatePicker1.Date));
end;

procedure TUnimFormPrincipal.UnimFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   ClientDataSet1.close;
   DataSetMov.Close;
   ClientDataSet1.Active := false;
   DataSetMov.Active := false;
end;

procedure TUnimFormPrincipal.UnimFormCreate(Sender: TObject);
begin
   SQLQuery1.SQLConnection := MainmFormLogin.conexao;
   QueryMov.SQLConnection := MainmFormLogin.conexao;
   date1 := date();
   UnimDatePicker1.Date := date1;
   UnimDatePicker2.Date := date1;
end;

procedure TUnimFormPrincipal.UnimFormShow(Sender: TObject);
begin
SQLQuery1.Active := TRUE;
 SQLQuery1.DisableControls;
  SQLQuery1.First;
  while not SQLQuery1.Eof do
  begin
    UnimSelect1.Items.Add(SQLQuery1.FieldByName('DESCRICAO').AsString);
    SQLQuery1.Next;
  end;
   SQLQuery1.First;
   SQLQuery1.EnableControls;
end;

function TUnimFormPrincipal.CalculaContA(nIdConta:integer; dData: tdate; dData2: tDate): double;
  var Q : TSQLQuery;


 begin  //FUNÇÃO CALCULAR CONTA
  Q := TSQLQuery.Create(nil);
    begin

       try
        Q.SQLConnection := MainmFormLogin.conexao;
        Q.SQL.Add('select sum(caixa_mov.valor) from caixa_mov where caixa_mov.id_caixa = :nIdCaixa and caixa_mov.data_mov >= :pData and caixa_mov.data_MOV <= :pData2 and caixa_mov.dc = ''C''');
        q.Params.ParamByName('nIdCaixa').AsString := inttostr(nidconta);
        q.Params.ParamByName('pData').AsString := (FormatDateTime('dd.mm.yyyy',(dData)));
        q.Params.ParamByName('pData2').AsString := (FormatDateTime('dd.mm.yyyy',(dData2)));
        Q.Open;
        Result := Q.FieldByName('SUM').AsFLoat;
       finally
        FreeAndNil(Q);
      end;
     end;

  end;



  function TUnimFormPrincipal.CalculaTodasContA(dData: tdate; dData2: tDate): double;
  var Q : TSQLQuery;


 begin  //FUNÇAO CALCULAR TODAS AS CONTAS
  Q := TSQLQuery.Create(nil);
    begin

       try
        Q.SQLConnection := MainmFormLogin.conexao;
        Q.SQL.Add('select sum(caixa_mov.valor) from caixa_mov where caixa_mov.dc = ''C'' and caixa_mov.data_mov >= :pData and caixa_mov.data_MOV <= :pData2');
        q.Params.ParamByName('pData').AsString := (FormatDateTime('dd.mm.yyyy',(dData)));
        q.Params.ParamByName('pData2').AsString := (FormatDateTime('dd.mm.yyyy',(dData2)));
        Q.Open;
        Result := Q.FieldByName('SUM').Asfloat;
       finally
        FreeAndNil(Q);
      end;
     end;

  end;


 function TUnimFormPrincipal.CalculaContADesp(nIdConta: Integer; dData: TDate; dData2: TDate): double;
  var Q : TSQLQuery;
  begin

    Q := TSQLQuery.Create(nil);
    begin

       try
        Q.SQLConnection := MainmFormLogin.conexao;
        Q.SQL.Add('select sum(caixa_mov.valor) from caixa_mov where caixa_mov.dc = ''D'' and caixa_mov.id_caixa = :nIdCaixa and caixa_mov.data_mov >= :pData and caixa_mov.data_MOV <= :pData2');
        q.Params.ParamByName('nIdCaixa').Asinteger := (nidconta);
        q.Params.ParamByName('pData').AsString := (FormatDateTime('dd.mm.yyyy',(dData)));
        q.Params.ParamByName('pData2').AsString := (FormatDateTime('dd.mm.yyyy',(dData2)));
        Q.Open;
        Result := Q.FieldByName('SUM').Asfloat;
       finally
        FreeAndNil(Q);
      end;
     end;
  end;

 function TUnimFormPrincipal.RetornIdCaixa(pidCaixa: string): Integer;
 var Q: TSQLQuery;
 begin
  Q := TSQLQuery.Create(nil);
    begin
     try
       q.SQLConnection := MainmFormLogin.conexao;
       q.sql.Add('select conta_movimento.id from conta_movimento where conta_movimento.descricao = :nidcaixa');
       q.Params.ParamByName('nidcaixa').AsString := (pidCaixa);
       q.Open;
       result := q.FieldByName('ID').AsInteger;
       finally
        freeandnil(Q);
     end;
    end;

 end;

 function TUnimFormPrincipal.SomarValor2Valores: double;
   var  valor1, valor2, saldototal: double;

  begin
    valor1 := valorReceita;
    valor2 := valorSaida;
    saldototal :=(valor1 - valor2);
    result := saldototal;
  end;

  function TUnimFormPrincipal.CalculaTodasContADesp(dData: Tdate; dData2: tdate): double ;
   var Q : TSQLQuery;
  begin

    Q := TSQLQuery.Create(nil);
    begin

       try
        Q.SQLConnection := MainmFormLogin.conexao;
        Q.SQL.Add('select sum(caixa_mov.valor) from caixa_mov where caixa_mov.dc = ''D'' and caixa_mov.data_mov >= :pData and caixa_mov.data_MOV <= :pData2');
        q.Params.ParamByName('pData').AsString := (FormatDateTime('dd.mm.yyyy',(dData)));
        q.Params.ParamByName('pData2').AsString := (FormatDateTime('dd.mm.yyyy',(dData2)));
        Q.Open;
        Result := Q.FieldByName('SUM').Asfloat;
       finally
        FreeAndNil(Q);
      end;
     end;
  end;

  procedure TUnimFormPrincipal.ChecTodasClick(Sender: TObject);
begin
UnimSelect1.Text := '';
end;

function TUnimFormPrincipal.SomarValor2ValoresTodas: double;
   var  valor1, valor2, saldototal: double;

  begin
    valor1 := valorReceitaTodas;
    valor2 := valorSaidaTodas;
    saldototal :=(valor1 - valor2);
    result := saldototal;
  end;

end.
