unit UntLancamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm;

type
  TFrmlancamentoss = class(TUnimForm)
    procedure UnimFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  uniGUIApplication;

{$R *.dfm}


procedure TFrmlancamentoss.UnimFormCreate(Sender: TObject);
begin
  showmessage('ok');
end;

end.
