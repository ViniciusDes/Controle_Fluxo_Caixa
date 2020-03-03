unit UnitLeProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm;

type
  TUnimForm2 = class(TUnimForm)
  private
    { Private declarations }
  public
  procedure LocalizaProduto(sCodigoEan:string);
    { Public declarations }
  end;

function UnimForm2: TUnimForm2;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function UnimForm2: TUnimForm2;
begin
  Result := TUnimForm2(UniMainModule.GetFormInstance(TUnimForm2));
end;

end.
