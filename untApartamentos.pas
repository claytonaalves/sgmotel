unit untApartamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untPadrao01, DB, StdCtrls, Buttons, Grids,
  DBGrids, ExtCtrls, ComCtrls, PngBitBtn, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TfrmApartamentos = class(TfrmPadrao01)
    sh1: TShape;
    Label1: TLabel;
    edtNome: TEdit;
    sh2: TShape;
    Label2: TLabel;
    cmbTipo: TComboBox;

    procedure Gravar; override;
    procedure Excluir_Click(Sender: TObject); override;

    procedure ModoEdicao; override;
    procedure ModoConsulta; override;

    procedure Localizar; override;
    procedure EditsChange(Sender: TObject); override;

    procedure QueryAfterOpen(DataSet: TDataSet); override;
    procedure zqueryAfterScroll(DataSet: TDataSet); override;

    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    ListaTipos: TStringList;
    qryAux: TZReadOnlyQuery;

  public
    { Public declarations }
  end;

var
  frmApartamentos: TfrmApartamentos;

implementation

uses untDM, untPrincipal;

{$R *.dfm}

// -----------------------------------------------------------------------------

procedure TfrmApartamentos.FormCreate(Sender: TObject);
var id, tipo: string;
begin
  ListaTipos := TStringList.Create;

  qryAux := TZReadOnlyQuery.Create(Self);
  qryAux.Connection := dmPrincipal.zconn;
  qryAux.SQL.Text := 'SELECT id, nome FROM apartamentos_tipos';
  qryAux.Active := true;

  while not qryAux.Eof do begin
    id := qryAux.FieldByName('id').AsString;
    tipo := qryAux.FieldByName('nome').AsString;

    ListaTipos.Add(tipo+'='+id);
    cmbTipo.Items.Add(tipo);
    qryAux.Next;
  end;

  cmbTipo.ItemIndex := 0;

  inherited;
end;

// -----------------------------------------------------------------------------

procedure TfrmApartamentos.EditsChange(Sender: TObject);
begin
  btGravar.Enabled := ((edtNome.Text<>'') and (cmbTipo.Text<>''));
end;

// -----------------------------------------------------------------------------

procedure TfrmApartamentos.Excluir_Click(Sender: TObject);
var apto: string;
begin
  apto := zquery.FieldByName('apartamento').AsString;

  qryAux.SQL.Text := 'SELECT apartamento FROM movimentacao ' +
                     'WHERE apartamento=' + apto + ' AND ativo=1';
  qryAux.Active := false;
  qryAux.Active := true;

  if qryAux.RecordCount>0 then
  begin
{ DONE 1  -cimplementação :
Checar antes se existe algum movimento aberto para o Apto que esta sendo excluido.
Se houver algum movimento aberto pra esse apartamento, não permitir a exclusão dele. }
    ShowMessage('Este apartamento não pode ser excluido!' + #10#13 +
                'Motivo: Existe movimentação aberta para o apartamento ' + apto);
    exit;
  end;

  if MessageBox(0, 'Quer realmente excluir o apartamento selecionado ?',
               'Atenção!', MB_YESNO + MB_ICONERROR) = ID_YES then
  begin
    dmPrincipal.zconn.ExecuteDirect('DELETE FROM apartamentos WHERE id=' +
                                   zquery.FieldByName('id').AsString);
    AtivaQuery;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmApartamentos.Gravar;
var sql, nome, idTipo, id_apto: string;
begin
  nome := FormatFloat('00', StrToFloat(edtNome.Text)); // Armazena o nome pra usar na busca apos a gravacao
  idTipo := ListaTipos.Values[cmbTipo.Text];

  if lNovoRegistro then begin
    sql := 'INSERT INTO apartamentos (nome,id_tipo_apto) VALUES ("%s",%s)';
    sql := Format(sql, [nome, idTipo]);
  end
  else begin
    id_apto := zquery.FieldByName('apartamento').AsString;
    sql := 'UPDATE apartamentos SET nome="%s", id_tipo_apto=%s WHERE nome="%s"';
    sql := Format(sql, [nome, idTipo, id_apto]);
  end;

//  ShowMessage(sql);

  dmPrincipal.zconn.ExecuteDirect(sql);
  AtivaQuery;
  // Localiza o registro na grade
  zquery.Locate('apartamento', nome, [loPartialKey]);
end;

// -----------------------------------------------------------------------------

procedure TfrmApartamentos.ModoConsulta;
begin
  inherited;

  edtNome.ReadOnly := true;
  edtNome.Tabstop := false;
  edtNome.Color := COR_INATIVA;
  edtNome.OnChange := nil;

  cmbTipo.Enabled := false;

  sh1.Brush.Color := COR_INATIVA;
  sh2.Brush.Color := COR_INATIVA;
end;

// -----------------------------------------------------------------------------

procedure TfrmApartamentos.ModoEdicao;
begin
  inherited;

  edtNome.ReadOnly := false;
  edtNome.Tabstop := true;
  edtNome.Color := clWindow;
  edtNome.OnChange := EditsChange;
  if lNovoRegistro then
    edtNome.Clear;

  cmbTipo.Enabled := true;

  sh1.Brush.Color := clWindow;
  sh2.Brush.Color := clWindow;

  edtNome.SetFocus;
end;

// -----------------------------------------------------------------------------

procedure TfrmApartamentos.Localizar;
begin
  zquery.FindFirst;
  zquery.Locate('apartamento', BufferLocalizar, [loPartialKey]);
end;

// -----------------------------------------------------------------------------

procedure TfrmApartamentos.QueryAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if DataSet.RecordCount=0 then
  begin
    edtNome.Clear;
    cmbTipo.Clear;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmApartamentos.zqueryAfterScroll(DataSet: TDataSet);
begin
  edtNome.Text := zquery.FieldByName('apartamento').AsString;
  cmbTipo.ItemIndex := ListaTipos.IndexOfName(zquery.FieldByName('tipo').AsString);
end;

end.
