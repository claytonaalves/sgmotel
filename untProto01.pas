// -----------------------------------------------------------------------------
// Prototipo de formulario com tratamento de teclas
// Keypreview := true;
// Muda Enter para Tab
// -----------------------------------------------------------------------------

unit untProto01;

interface

uses
  Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
   TfrmProto01 = class(TForm)

    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditsCurrNumbers_KeyPress(Sender: TObject; var Key: Char);
    procedure EditsJustNumbers_KeyPress(Sender: TObject; var Key: Char);
    procedure EditsKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProto01: TfrmProto01;

implementation

{$R *.dfm}

// ----------------------------------------------------------------------------

procedure TfrmProto01.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

   if key = VK_RETURN then perform(WM_NEXTDLGCTL, 0, 0)
   else if key = VK_ESCAPE then ModalResult := mrCancel;

end;

// ----------------------------------------------------------------------------

procedure TfrmProto01.EditsKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then Key := #0
   else if Key = Chr(27) then Key := #0;
end;

// -----------------------------------------------------------------------------

procedure TfrmProto01.EditsJustNumbers_KeyPress(Sender: TObject; var Key: Char);
begin

   if not (Key in [#8, '0'..'9']) then Key := #0;

end;

// -----------------------------------------------------------------------------

procedure TfrmProto01.EditsCurrNumbers_KeyPress(Sender: TObject; var Key: Char);
begin

   if not (Key in [#8, '0'..'9', '-', DecimalSeparator]) then Key := #0
   else if ((Key = DecimalSeparator) or (Key = '-')) and (Pos(Key, (Sender as TEdit).Text) > 0) then Key := #0
   else if (Key = '-') and ((Sender as TEdit).SelStart <> 0) then Key := #0;

end;

// -----------------------------------------------------------------------------

end.
