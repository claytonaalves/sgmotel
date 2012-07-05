unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZAbstractRODataset, ZAbstractDataset, ZDataset, StrUtils,
  StdCtrls, ExtCtrls, Buttons, PngBitBtn;

type
  TfrmLogin = class(TForm)
    btnCancelar: TPngBitBtn;
    btnOk: TPngBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Shape1: TShape;
    Bevel1: TBevel;
    Image1: TImage;
    Label3: TLabel;
    cmbUsuario: TComboBox;
    edtSenha: TEdit;

    procedure btnOkClick(Sender: TObject);
    procedure cmbUsuarioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    
  private
    { Private declarations }
    lista_senhas: TStringList;
    tentativas: byte;

  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses untDM, untPrincipal;

{$R *.dfm}

// -----------------------------------------------------------------------------
// Retorna o primeiro nome em "nome"
// Ex:
//   nome = Joao da silva
//   retorna joao
//
function PegaNomeOperador(nome: string): string;
var n: integer;
begin
  n := Pos(' ', nome)-1;
  if n<=0 then
    n := Length(nome);

  Result := MidStr(nome, 0, n);
end;

// -----------------------------------------------------------------------------

procedure TfrmLogin.FormCreate(Sender: TObject);
var
  qryAux: TZReadOnlyQuery;
  nome, senha: string;
begin
  inherited;

  tentativas := 3;
  lista_senhas := TStringList.Create;

  qryAux := TZReadOnlyQuery.Create(Self);
  qryAux.Connection := dmPrincipal.zconn;
  qryAux.SQL.Text := 'SELECT nome, senha FROM funcionarios';
  qryAux.Open;

  while not qryAux.Eof do
  begin
    nome := qryAux.Fields[0].AsString;
    senha := qryAux.Fields[1].AsString;

    cmbUsuario.Items.Add(nome);
    lista_senhas.Add(nome+'='+senha);
    qryAux.Next;
  end;
  cmbUsuario.Items.Add(master);
  lista_senhas.Add(master+'='+master);
end;

procedure TfrmLogin.btnOkClick(Sender: TObject);
var senha: string;
begin
  if edtSenha.Text = lista_senhas.Values[cmbUsuario.Text] then
  begin
    operador := PegaNomeOperador(cmbUsuario.Text);
    ModalResult := mrOk;
    exit;
  end
  else begin
    MessageBox(0, 'Senha incorreta!', 'Atenção!', MB_OK + MB_ICONERROR);
    dec(tentativas);
    if tentativas=0 then
    begin
      ModalResult := mrAbort;
      exit;
    end;
  end;
end;

procedure TfrmLogin.cmbUsuarioClick(Sender: TObject);
begin
  inherited;
  edtSenha.SetFocus;
end;

end.
