unit untLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, BmsXPButton;

type
  TfrmLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtSenha: TEdit;
    qryFuncionarios: TADOQuery;
    cmbFuncionarios: TComboBox;
    btnOk: TBmsXPButton;
    btnCancelar: TBmsXPButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses untDM;

{$R *.dfm}

procedure TfrmLogin.FormCreate(Sender: TObject);
begin

   while not qryFuncionarios.Eof do begin
      cmbFuncionarios.Items.Add(qryFuncionarios.Fields[0].text);
      qryFuncionarios.Next;

   end;

end;

procedure TfrmLogin.Button1Click(Sender: TObject);
var
   sFuncionario, sSenha, sSenha2: string;

begin

   qryFuncionarios.FindFirst;

   sFuncionario := cmbFuncionarios.Text;
   sSenha := edtSenha.Text;

   qryFuncionarios.Locate('nome',sFuncionario,[loPartialKey]);
   sSenha2 := qryFuncionarios.Fields[1].Text;

   if sSenha = sSenha2 then begin
      sOperador := sFuncionario;
      ModalResult := mrOk;
   end
   else
      ModalResult := mrCancel;
   

end;

end.
