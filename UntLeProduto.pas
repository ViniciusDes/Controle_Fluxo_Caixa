unit untLeProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIRegClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniButton, unimButton, uniGUIBaseClasses, uniEdit, unimEdit, Data.DBXFirebird,
  Data.FMTBcd, uniLabel, uniDBText, Data.SqlExpr, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniDBEdit, unimDBEdit, uniDBNavigator, unimDBNavigator,
  unimLabel, unimMenu, uniPanel, uniPageControl, unimTabPanel, unimPanel,
  unimFieldSet;

type
  TMainmFormLeProduto = class(TUnimForm)
    edBarcode: TUnimEdit;
    btScan: TUnimButton;
    DataSourceProdutos: TDataSource;
    UnimLabel1: TUnimLabel;
    UnimLabel2: TUnimLabel;
    UnimLabelCodigo: TUnimLabel;
    UnimLabelDescricao: TUnimLabel;
    UnimButton1: TUnimButton;
    UnimTabPanelPreco: TUnimTabPanel;
    UnimTabSheet1: TUnimTabSheet;
    UnimTabSheet2: TUnimTabSheet;
    UnimLabel5: TUnimLabel;
    UnimLabelPrecoCusto: TUnimLabel;
    UnimEditPrecoCusto: TUnimEdit;
    UnimLabel4: TUnimLabel;
    UnimLabelPrecoVenda: TUnimLabel;
    UnimEditPrecoVenda: TUnimEdit;
    UnimLabel3: TUnimLabel;
    UnimLabelEstoqueAtual: TUnimLabel;
    DataSourceMovimentoEst: TDataSource;
    UnimEditEstoque: TUnimEdit;
    UnimLabel6: TUnimLabel;
    UnimEditEstoqueMin: TUnimEdit;
    UnimLabelEstoqueMinimo: TUnimLabel;

    procedure UnimFormAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
    procedure UnimFormShow(Sender: TObject);
    procedure UnimFormCreate(Sender: TObject);
    procedure UnimButton1Click(Sender: TObject);
    procedure LocalizaProduto(sCodigoEan:string);
    procedure edBarcodeExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainmFormLeProduto: TMainmFormLeProduto;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, dmConexao;

function MainmFormLeProduto: TMainmFormLeProduto;
begin
  Result := TMainmFormLeProduto(UniMainModule.GetFormInstance(TMainmFormLeProduto));
end;

procedure TMainmFormLeProduto.edBarcodeExit(Sender: TObject);
begin
   LocalizaProduto(edBarcode.Text);
end;

procedure TMainmFormLeProduto.LocalizaProduto(sCodigoEan: string);
begin
  if trim(sCodigoEan) <> '' then
    begin
      edBarcode.Caption := 'Localizando .';



     DataSourceProdutos.DataSet := DataModuleConexao.ClientDataSetProdutos;
     edBarcode.Caption := 'Localizando ..';

     DataSourceMovimentoEst.DataSet := DataModuleConexao.ClientDataSetMovimentoEst;
     edBarcode.Caption := 'Localizando ...';

     if DataModuleConexao.Dados_Produto(edBarcode.Text) then
     begin

      edBarcode.Caption := 'Encontrado.';

      UnimLabelDescricao.Text := DataSourceProdutos.DataSet.FieldByName('DESCRICAO').AsString;
      UnimLabelCodigo.Text := DataSourceProdutos.DataSet.FieldByName('EAN13').AsString;
      UnimLabelPrecoVenda.Text := FormatFloat('0.00',DataSourceProdutos.DataSet.FieldByName('PRECO_VENDA').AsCurrency);
      UnimLabelEstoqueAtual.Text := FormatFloat('0.000',DataSourceProdutos.DataSet.FieldByName('ESTOQUE').AsCurrency);
      UnimLabelPrecoCusto.Text := FormatFloat('0.000',DataSourceProdutos.DataSet.FieldByName('PRECO_COMPRA').AsCurrency);
      UnimLabelEstoqueMinimo.Text := FormatFloat('0.000',DataSourceProdutos.DataSet.FieldByName('ESTOQUE_MINIMO').AsCurrency);

     DataSourceProdutos.DataSet.Edit;
     end
     else
     begin
      showmessage('Produto '+edBarcode.Text+' não encontrado');
      edBarcode.Text := '';
      edBarcode.SetFocus;
     end;
  end;

end;

procedure TMainmFormLeProduto.UnimButton1Click(Sender: TObject);
 VAR
  fPrecoVenda,fPreCusto,fEstoque,fEstoqueMinimo:double;
begin

 if DataModuleConexao.Dados_Produto(UnimLabelCodigo.Text) then
 BEGIN
  DataSourceProdutos.DataSet.Edit;


  if TRIM(UnimEditPrecoCusto.Text) <> '' then
  BEGIN

    try

     fPreCusto :=  StrToFloat(UnimEditPrecoCusto.Text);

    except
     ShowMessage('Não foi informado um valor válido! '+UnimEditPrecoCusto.Text );
     UnimEditPrecoCusto.SetFocus;
     abort;
    end;
  END;


  if TRIM(UnimEditPrecoVenda.Text) <> '' then
  BEGIN


   try
   fPrecoVenda :=  StrToFloat(UnimEditPrecoVenda.Text);

   except
   ShowMessage('Não foi informado um valor válido! '+UnimEditPrecoVenda.Text );
   UnimEditPrecoVenda.SetFocus;
   Abort;
   end;
  END;

  if TRIM(UnimEditEstoque.Text) <> '' then
  BEGIN

     try

     fEstoque :=  StrToFloat(UnimEditEstoque.Text);

    except
     ShowMessage('Não foi informado um valor válido! '+UnimEditEstoque.Text );
     UnimEditEstoque.SetFocus;
     abort;
    end;
  END;


  if TRIM(UnimEditEstoqueMin.Text) <> '' then
  BEGIN

     try

     fEstoqueMinimo :=  StrToFloat(UnimEditEstoqueMin.Text);

    except
     ShowMessage('Não foi informado um valor válido! '+UnimEditEstoqueMin.Text );
     UnimEditEstoqueMin.SetFocus;
     abort;
    end;
  END;




  if (trim(UnimEditPrecoVenda.Text) <> '')
  or (trim(UnimEditEstoque.Text)  <> '')
  or (trim(UnimEditEstoqueMin.Text)  <> '')
  or (trim(UnimEditPrecoCusto.Text)  <> '') then
  begin

    try

     if (trim(UnimEditPrecoCusto.Text) <> '') then
      DataSourceProdutos.DataSet.FieldByName('PRECO_COMPRA').AsCurrency :=  fPreCusto  ;

     if (trim(UnimEditPrecoVenda.Text) <> '') then
     begin

      DataSourceProdutos.DataSet.FieldByName('PRECO_VENDA').AsCurrency :=  fPrecoVenda  ;
      DataSourceProdutos.DataSet.FieldByName('DATA_ULT_ALTERACAO').AsDateTime :=  DATE  ;
      DataSourceProdutos.DataSet.FieldByName('HORA_ULT_ALTERACAO').AsDateTime :=  TIME ;

     end;

     if  (trim(UnimEditEstoque.Text)  <> '')  then
     begin
        DataSourceMovimentoEst.DataSet.Open;
        DataSourceMovimentoEst.DataSet.Append;
        DataSourceMovimentoEst.DataSet.FieldByName('ID').AsInteger := DataModuleConexao.GenID('MOVIMENTO_EST');

        DataSourceMovimentoEst.DataSet.FieldByName('IDPRODUTO').AsInteger := DataSourceProdutos.DataSet.FieldByName('ID').AsInteger;

        DataSourceMovimentoEst.DataSet.FieldByName('IDEMPRESA').AsInteger := 3;
        DataSourceMovimentoEst.DataSet.FieldByName('VINCULO').AsString := 'APP';
        DataSourceMovimentoEst.DataSet.FieldByName('ORIGEM').AsINTEGER := 1;
        DataSourceMovimentoEst.DataSet.FieldByName('QUANTIDADE').AsFloat := DataSourceProdutos.DataSet.FieldByName('ESTOQUE').AsFloat - fEstoque;
        if fEstoque > DataSourceProdutos.DataSet.FieldByName('ESTOQUE').AsFloat then
        DataSourceMovimentoEst.DataSet.FieldByName('QUANTIDADE').AsFloat :=DataSourceMovimentoEst.DataSet.FieldByName('QUANTIDADE').AsFloat *-1;

        DataSourceMovimentoEst.DataSet.FieldByName('ESTOQUE_ANTERIOR').AsFloat := StrToFloat(UnimLabelEstoqueAtual.Text);
        DataSourceMovimentoEst.DataSet.FieldByName('ESTOQUE_ATUAL').AsFloat := StrToFloat(UnimEditEstoque.Text);
        DataSourceMovimentoEst.DataSet.FieldByName('EAN13').AsSTRING := DataSourceProdutos.DataSet.FieldByName('EAN13').AsString;
        DataSourceMovimentoEst.DataSet.FieldByName('DATA').AsDateTime :=  DATE;
        DataSourceMovimentoEst.DataSet.FieldByName('HORA').AsDateTime :=  TIME;

        DataSourceMovimentoEst.DataSet.Post;
        DataModuleConexao.Grava_Dados(DataSourceMovimentoEst.DataSet);


        DataSourceProdutos.DataSet.FieldByName('ESTOQUE').AsCurrency :=  fEstoque ;


     end;

     if  (trim(UnimEditEstoqueMin.Text)  <> '')  then
     begin
      DataSourceProdutos.DataSet.FieldByName('ESTOQUE_MINIMO').AsCurrency :=  fEstoqueMinimo ;
     end;

    FINALLY
     DataSourceProdutos.DataSet.Post;
     DataModuleConexao.Grava_Dados(DataSourceProdutos.DataSet);

     ShowMessage('Alterado com Sucesso. ');
     DataModuleConexao.Dados_Produto('0');
     edBarcode.Text                := '';
     UnimEditEstoqueMin.Text       := '';
     UnimLabelEstoqueMinimo.Text   := '';
     UnimEditPrecoVenda.Text       := '';
     UnimLabelDescricao.Text       := '';
     UnimLabelCodigo.Text          := '';
     UnimLabelPrecoVenda.Text      := '';
     UnimLabelEstoqueAtual.Text    := '';
     UnimLabelPrecoCusto.Text      := '';
     UnimEditPrecoCusto.Text       := '';
     UnimEditEstoque.Text          := '';

    end;
  end;

 END

end;

procedure TMainmFormLeProduto.UnimFormAjaxEvent(Sender: TComponent; EventName: string;
  Params: TUniStrings);
begin

 if EventName='BARCODE' then begin
  edBarcode.Text:=Params['value'].value;

 if edBarcode.Text <> '' then
 begin

   LocalizaProduto(edBarcode.Text);


 end;

end

end;

procedure TMainmFormLeProduto.UnimFormCreate(Sender: TObject);
begin
  //DataSourceProdutos.DataSet := DataModuleConexao.ClientDataSetProdutos;
  //DataModuleConexao.Dados_Produto('00000');

  Application.ProcessMessages;

end;

procedure TMainmFormLeProduto.UnimFormShow(Sender: TObject);
begin
 //Application.CreateForm(TDataModuleConexao,DataModuleConexao);

 DataSourceProdutos.DataSet := DataModuleConexao.ClientDataSetProdutos;
// DataSourceProdutos.DataSet.Open;

//MainmForm.CloseModal;
//untLoginForm.UnimLoginForm1.ShowModalN;




end;

initialization
  RegisterAppFormClass(TMainmFormLeProduto);

end.
