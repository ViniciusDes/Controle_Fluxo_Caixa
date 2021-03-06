unit UntRelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniButton, uniBitBtn, unimBitBtn, Data.DB, Datasnap.DBClient,
  uniGUIBaseClasses, uniBasicGrid, uniDBGrid, unimDBListGrid, unimDBGrid, Data.SqlExpr,
  Data.FMTBcd, Datasnap.Provider, uniLabel, unimLabel, unimPanel, uniEdit,
  unimEdit;

type
  TFrmRelatorio = class(TUnimForm)
    Dbgrid1: TUnimDBGrid;
    SQLQuery1: TSQLQuery;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    EditData: TUnimEdit;
    EditRelatorio: TUnimEdit;
    EditConta: TUnimEdit;
  //  PROCEDURE FORMATAR;
    function CalculaContA: double;
    procedure UnimFormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FrmRelatorio: TFrmRelatorio;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mainm, UntTelaPrincipal;

function FrmRelatorio: TFrmRelatorio;
begin
  Result := TFrmRelatorio(UniMainModule.GetFormInstance(TFrmRelatorio));
end;

function TFrmRelatorio.CalculaContA: double;
  var Q : TSQLQuery;


 begin  //FUN��O CALCULAR CONTA
  Q := TSQLQuery.Create(nil);
    begin

       try
        Q.SQLConnection := MainmFormLogin.conexao;
        Q.SQL.Add('SELECT caixa_mov.desc_subplano as origem, SUM(valor) as valor from caixa_mov group by caixa_mov.desc_subplano');
        Q.Open;
        Result := Q.FieldByName('desc_subplano, SUM').AsFLoat;
       finally
        FreeAndNil(Q);
      end;
     end;

  end;


procedure TFrmRelatorio.UnimFormCreate(Sender: TObject);
begin
   EditData.Text := 'Periodo ' + (DateToStr(UnimFormPrincipal.UnimDatePicker1.Date)) + ' A ' + (DateToStr(UnimFormPrincipal.UnimDatePicker2.Date));

   EditConta.text := EditConta.text + UnimFormPrincipal.UnimSelect1.Text;
   if UnimFormPrincipal.UnimSelect1.Text = '' then
    begin
       EditConta.Text := EditConta.text + 'Todas'
    end;

     SQLQuery1.SQLConnection := MainmFormLogin.conexao;

 end;

procedure fORMATAR;
 begin

 end;
end.
