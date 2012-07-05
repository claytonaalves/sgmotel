unit untFuncionarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untPadrao01,StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  PngBitBtn, ZAbstractRODataset, ZDataset, ZAbstractDataset, DB;

type
  TfrmFuncionarios = class(TfrmPadrao01)
    edtNome: TEdit;
    edtEndereco: TEdit;
    edtTelefone: TEdit;
    edtSenha: TEdit;
    lblNome: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    sh1: TShape;
    sh2: TShape;
    sh3: TShape;
    sh4: TShape;

    procedure Gravar; override;
    procedure Excluir_Click(Sender: TObject); override;

    procedure ModoEdicao; override;
    procedure ModoConsulta; override;

    procedure Localizar; override;
    procedure EditsChange(Sender: TObject);

    procedure QueryAfterOpen(DataSet: TDataSet);
    procedure zqueryAfterScroll(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFuncionarios: TfrmFuncionarios;

implementation

uses untDM;

{$R *.dfm}

// Prepara os Edits do Form para Edicao
procedure TfrmFuncionarios.ModoEdicao;
begin
  inherited;
  
  if lNovoRegistro then
  begin
    edtNome.Clear;
    edtEndereco.Clear;
    edtTelefone.Clear;
    edtSenha.Clear;
  end;

  // Reabilita os Edits permitindo edicao e TabStop
  edtNome.ReadOnly := false;
  edtEndereco.ReadOnly := false;
  edtTelefone.ReadOnly := false;
  edtSenha.ReadOnly := false;

  edtNome.TabStop := true;
  edtEndereco.TabStop := true;
  edtTelefone.TabStop := true;
  edtSenha.TabStop := true;

  // Ativa o evento OnChange dos Edits
  edtNome.OnChange := EditsChange;
  edtEndereco.OnChange := EditsChange;
  edtTelefone.OnChange := EditsChange;
  edtSenha.OnChange := EditsChange;

  edtNome.Color := clWindow;
  edtEndereco.Color := clWindow;
  edtTelefone.Color := clWindow;
  edtSenha.Color := clWindow;

  sh1.Brush.Color := clWindow;
  sh2.Brush.Color := clWindow;
  sh3.Brush.Color := clWindow;
  sh4.Brush.Color := clWindow;

  edtNome.SetFocus;
end;

procedure TfrmFuncionarios.ModoConsulta;
begin
  inherited;

  // Desativa o evento OnChange dos Edits
  edtNome.OnChange := nil;
  edtEndereco.OnChange := nil;
  edtTelefone.OnChange := nil;
  edtSenha.OnChange := nil;

  // Configura os Edits para somente leitura
  edtNome.ReadOnly := true;
  edtEndereco.ReadOnly := true;
  edtTelefone.ReadOnly := true;
  edtSenha.ReadOnly := true;

  edtNome.TabStop := false;
  edtEndereco.TabStop := false;
  edtTelefone.TabStop := false;
  edtSenha.TabStop := false;

  edtNome.Color := COR_INATIVA;
  edtEndereco.Color := COR_INATIVA;
  edtTelefone.Color := COR_INATIVA;
  edtSenha.Color := COR_INATIVA;

  sh1.Brush.Color := COR_INATIVA;
  sh2.Brush.Color := COR_INATIVA;
  sh3.Brush.Color := COR_INATIVA;
  sh4.Brush.Color := COR_INATIVA;
end;

procedure TfrmFuncionarios.Excluir_Click(Sender: TObject);
begin
   if MessageBox(0, 'Quer realmente excluir o funcionario selecionado ?',
                 'Atenção!', MB_YESNO + MB_ICONERROR) = ID_YES then
   begin
     dmPrincipal.zconn.ExecuteDirect('DELETE FROM funcionarios WHERE id=' +
                                     zquery.FieldByName('id').AsString);
     AtivaQuery;
   end;
end;

procedure TfrmFuncionarios.Gravar;
var sql, nome: string;
begin
  nome := edtNome.Text;

  if lNovoRegistro then begin
    sql := 'INSERT INTO funcionarios (nome,endereco,telefone,senha) ' +
           'VALUES ("%s","%s","%s","%s")';
    sql := Format(sql, [edtNome.Text,
                        edtEndereco.Text,
                        edtTelefone.Text,
                        edtSenha.Text]);
  end
  else begin
    sql := 'UPDATE funcionarios SET nome="%s", endereco="%s", telefone="%s",' +
           ' senha="%s" WHERE id=%d';
    sql := Format(sql, [edtNome.Text,
                        edtEndereco.Text,
                        edtTelefone.Text,
                        edtSenha.Text,
                        zquery.FieldByName('id').AsInteger]);
  end;

  dmPrincipal.zconn.ExecuteDirect(sql);
  AtivaQuery;

  // Localiza o registro na grade
  zquery.Locate('nome', nome, [loPartialKey]);
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

procedure TfrmFuncionarios.EditsChange(Sender: TObject);
begin
   btGravar.Enabled := (( edtNome.Text <> '' ) and ( edtSenha.Text <> '' ));
end;

procedure TfrmFuncionarios.zqueryAfterScroll(DataSet: TDataSet);
begin
  edtNome.Text := zquery.FieldByName('nome').AsString;
  edtEndereco.Text := zquery.FieldByName('endereco').AsString;
  edtTelefone.Text := zquery.FieldByName('telefone').AsString;
  edtSenha.Text := zquery.FieldByName('senha').AsString;
end;

procedure TfrmFuncionarios.QueryAfterOpen(DataSet: TDataSet);
begin
   inherited;

   if DataSet.RecordCount=0 then begin
      edtNome.Clear;
      edtEndereco.Clear;
      edtTelefone.Clear;
      edtSenha.Clear;
   end;
end;

procedure TfrmFuncionarios.Localizar;
begin
  zquery.FindFirst;
  zquery.Locate('nome', BufferLocalizar, [loPartialKey]);
end;

end.
