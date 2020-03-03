program APP_FINANCEIRO;



uses
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  UntTelaPrincipal in 'UntTelaPrincipal.pas' {UnimFormPrincipal: TUnimForm},
  UntPrincipalEscolha in 'UntPrincipalEscolha.pas' {FrmPrincipalEscolha: TUnimForm},
  UntSangriaSuprimento in 'UntSangriaSuprimento.pas' {FrmSangriaSuprimento: TUnimForm},
  UnitLanc in 'UnitLanc.pas' {FrmLancamentos: TUnimForm},
  Unit1 in 'Unit1.pas' {UniMainModule1: TUniGUIMainModule},
  UntLancPlanos in 'UntLancPlanos.pas' {FrmLancPlanos: TUnimForm},
  UntGridPlanos in 'UntGridPlanos.pas' {FrmGridPlanos: TUnimForm},
  UntRelatorio in 'UntRelatorio.pas' {FrmRelatorio: TUnimForm},
  Mainm in 'Mainm.pas' {MainmFormLogin: TUnimForm};

begin
  ReportMemoryLeaksOnShutdown := false;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Title := 'CAIXA MOBILE';
 // Application.CreateForm(TMainmFormLogin, MainmFormLogin): main;
//  Application.CreateForm(TMainmFormLogin, MainmFormLogin);
  Application.Run;
end.
