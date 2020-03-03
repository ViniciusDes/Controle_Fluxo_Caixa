unit Mainm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIRegClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniGUIBaseClasses, uniEdit, unimEdit, uniButton, unimButton, uniLabel,
  unimLabel, Data.DBXFirebird, Data.FMTBcd, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr, inifiles, uniBitBtn, unimBitBtn;

type
  TMainmFormLogin = class(TUnimForm)
    EditUsuario: TUnimEdit;
    UnimEdit2: TUnimEdit;
    UnimLabel1: TUnimLabel;
    UnimLabel2: TUnimLabel;
    UnimButton2: TUnimButton;
    SQLQuery1: TSQLQuery;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    QueryFunc: TSQLQuery;
    ProviderFunc: TDataSetProvider;
    DataSetFunc: TClientDataSet;
    SourceFunc: TDataSource;
    SQLQuery2: TSQLQuery;
    DataSetProvider2: TDataSetProvider;
    ClientDataSet2: TClientDataSet;
    DataSource2: TDataSource;
    ClientDataSet2ID: TIntegerField;
    ClientDataSet2DESCRICAO: TStringField;
    ClientDataSet2EMPRESA: TIntegerField;
    ClientDataSet2SALDO: TFloatField;
    ClientDataSet2NAO_EXIBIR_REL: TStringField;
    SQLQuery2ID: TIntegerField;
    SQLQuery2DESCRICAO: TStringField;
    SQLQuery2EMPRESA: TIntegerField;
    SQLQuery2SALDO: TFloatField;
    SQLQuery2NAO_EXIBIR_REL: TStringField;
    conexao: TSQLConnection;
    UnimBitBtn2: TUnimBitBtn;
    procedure UnimButton2Click(Sender: TObject);
    procedure LeIni;
    procedure UnimFormCreate(Sender: TObject);
    procedure UnimBitBtn1Click(Sender: TObject);
    procedure UnimBitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
  var
  PidFunc : integer;
    { Public declarations }
  end;

function MainmFormLogin: TMainmFormLogin;

implementation

{$R *.dfm}




uses
  uniGUIVars, MainModule, uniGUIApplication, UntTelaPrincipal, ServerModule, UntPrincipalEscolha;

function MainmFormLogin: TMainmFormLogin;
begin
  Result := TMainmFormLogin(UniMainModule.GetFormInstance(TMainmFormLogin));
end;

procedure TMainmFormLogin.UnimBitBtn1Click(Sender: TObject);
begin
   FrmPrincipalEscolha.ShowModal;
end;


procedure TMainmFormLogin.UnimBitBtn2Click(Sender: TObject);
begin
     SQLQuery1.Active := true;
     SQLQuery2.Active := true ;
     QueryFunc.Active := true  ;
     SQLQuery1.open;
     SQLQuery2.open;


     ClientDataSet1.close;
     ClientDataSet1.Params[0].AsString := editusuario.Text;
     ClientDataSet1.Params[1].AsString := UnimEdit2.Text;

     ClientDataSet1.open;
     if ClientDataSet1.IsEmpty then
     begin
       showmessage('USUARIO OU SENHA INVALIDOS');
     end
     else
     //loop para preencher o select de op��es das contas
     begin
      FrmPrincipalEscolha.ShowModal;
      SQLQuery2.DisableControls;
      SQLQuery2.First;
       while not SQLQuery2.Eof do
         begin
           FrmPrincipalEscolha.UnimSelect1.Items.Add(SQLQuery2.FieldByName('DESCRICAO').AsString);
           SQLQuery2.Next;
         end;
       SQLQuery2.First;
       SQLQuery2.EnableControls;

       EditUsuario.Clear;
       UnimEdit2.Clear;
    end;


end;

procedure TMainmFormLogin.UnimButton2Click(Sender: TObject);
begin
   Application.Destroy;


end;

procedure TMainmFormLogin.UnimFormCreate(Sender: TObject);
begin
  LeIni;

   SQLQuery1.Active := true;
   SQLQuery2.Active := true ;
   QueryFunc.Active := true  ;
   SQLQuery1.open;
   SQLQuery2.open;
   QueryFunc.open;

 end;

procedure TMainmFormLogin.LeIni;
var
  caminho : string;
  ArqIni: TIniFile;

begin

  ArqIni := TIniFile.Create('C:\Ettica\EXEC\config.ini');

  try

    caminho := ArqIni.ReadString('DADOS', 'PATH', caminho);
    Conexao.Params.Values['DataBase'] := caminho;
    Conexao.Connected := true;

  finally

    ArqIni.Free;

  end;

end;

initialization
  RegisterAppFormClass(TMainmFormLogin);

end.
