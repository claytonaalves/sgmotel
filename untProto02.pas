unit untProto02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untProto01, StdCtrls, Buttons, BmsXPButton;

type
  TfrmProto02 = class(TfrmProto01)
    btnOk: TBmsXPButton;
    btnCancelar: TBmsXPButton;

    procedure MudaEstadoBtnOk(lCondicao: boolean);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    lBtnOkAtivo: boolean;

  public
    { Public declarations }
  end;

var
  frmProto02: TfrmProto02;

implementation

uses untDM;

{$R *.dfm}

{ TfrmProto02 }

// -----------------------------------------------------------------------------

procedure TfrmProto02.FormCreate(Sender: TObject);
begin
   inherited;
   lBtnOkAtivo := false;

end;

// -----------------------------------------------------------------------------

procedure TfrmProto02.MudaEstadoBtnOk(lCondicao: boolean);
begin

   if lCondicao then begin
      if ( not lBtnOkAtivo ) then begin
         btnOk.Glyph := bmpOk;
         btnOk.Font.Color := clWindowText;
         // btnOk.Action := actGravar;
         btnOk.ModalResult := mrOk;
         btnOk.TabStop := true;

         lBtnOkAtivo := true;
      end
   end
   else begin
      if ( lBtnOkAtivo ) then begin
         btnOk.Glyph := bmpOk;
         //btnOk.Action := actNulo;
         btnOk.Font.Color := clGrayText;
         btnOk.ModalResult := mrNone;
         btnOk.TabStop := false;
         lBtnOkAtivo := false;
      end;
   end;
end;


end.
