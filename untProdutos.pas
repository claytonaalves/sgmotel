unit untProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untPadrao01, DB, ADODB, Grids, DBGrids, ExtCtrls, StdCtrls,
  Buttons, ActnList, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  PngBitBtn, ImgList, PngImageList;

type
  TfrmProdutos = class(TfrmPadrao01)
    Shape1: TShape;
    sh1: TShape;
    lbl1: TLabel;
    sh2: TShape;
    lbl2: TLabel;
    lblCodigoNum: TLabel;
    lbl3: TLabel;
    sh4: TShape;
    lbl4: TLabel;
    edtNome: TEdit;
    edtQtde: TEdit;
    edtValor: TEdit;
    lblCodigo: TLabel;
    sh3: TShape;
    Label1: TLabel;
    edtEstoqueMin: TEdit;

    procedure Gravar; override;
    procedure Excluir_Click(Sender: TObject); override;

    procedure ModoEdicao; override;
    procedure ModoConsulta; override;

    procedure Localizar; override;
    procedure EditsChange(Sender: TObject); override;

    procedure QueryAfterOpen(DataSet: TDataSet); override;
    procedure zqueryAfterScroll(DataSet: TDataSet); override;

    procedure EditsOnExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;

const
  AEdits: Array[0..3] of string=('Nome','Qtde','EstoqueMin','Valor');

implementation

uses untDM;

{$R *.dfm}

procedure TfrmProdutos.ModoEdicao;
var i: integer;
begin
  inherited;

  if lNovoRegistro then
    lblCodigo.Caption := '';

  // Reabilita os Edits permitindo edicao e TabStop
  for i := 0 to 3 do
  begin
    with TEdit(FindComponent('edt'+AEdits[i])) do
    begin
      ReadOnly := false;
      Tabstop := true;
      Color := clWindow;
      OnChange := EditsChange;
      if lNovoRegistro then
        Clear
    end;
  end;

  sh1.Brush.Color := clWindow;
  sh2.Brush.Color := clWindow;
  sh3.Brush.Color := clWindow;
  sh4.Brush.Color := clWindow;

  edtNome.SetFocus;
end;

procedure TfrmProdutos.ModoConsulta;
var i: integer;
begin
  inherited;

  for i := 0 to 3 do
  begin
    with TEdit(FindComponent('edt'+AEdits[i])) do
    begin
      OnChange := nil;
      ReadOnly := true;
      Tabstop := false;
      Color := COR_INATIVA;
    end;
  end;

  sh1.Brush.Color := COR_INATIVA;
  sh2.Brush.Color := COR_INATIVA;
  sh3.Brush.Color := COR_INATIVA;
  sh4.Brush.Color := COR_INATIVA;
end;

procedure TfrmProdutos.Excluir_Click(Sender: TObject);
begin
  if MessageBox(0, 'Quer realmente excluir o produto selecionado ?',
               'Atenção!', MB_YESNO + MB_ICONERROR) = ID_YES then
  begin
    dmPrincipal.zconn.ExecuteDirect('DELETE FROM produtos WHERE id=' +
                                   zquery.FieldByName('id').AsString);
    AtivaQuery;
  end;
end;

procedure TfrmProdutos.Gravar;
var sql, nome: string;
begin
  nome := edtNome.Text; // Armazena o nome pra usar na busca apos a gravacao

  if lNovoRegistro then begin
    sql := 'INSERT INTO produtos (nome,quantidade,estoque_minimo,valor) ' +
           'VALUES ("%s","%s","%s",%0.2f)';
    sql := Format(sql, [edtNome.Text,
                        edtQtde.Text,
                        edtEstoqueMin.Text,
                        StrToFloat(edtValor.Text)]);
  end
  else begin
    sql := 'UPDATE produtos SET nome="%s", quantidade=%s, estoque_minimo=%s, ' +
           'valor=%0.2f WHERE id=%d';
    sql := Format(sql, [edtNome.Text,
                        edtQtde.Text,
                        edtEstoqueMin.Text,
                        StrToFloat(edtValor.Text),
                        zquery.FieldByName('id').AsInteger]);
  end;

  dmPrincipal.zconn.ExecuteDirect(sql);
  AtivaQuery;
  // Localiza o registro na grade
  zquery.Locate('nome', nome, [loPartialKey]);
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

procedure TfrmProdutos.QueryAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if DataSet.RecordCount=0 then
  begin
    lblCodigo.Caption := '';
    edtNome.Clear;
    edtQtde.Clear;
    edtEstoqueMin.Clear;
    edtValor.Clear;
    // with DataSet do TNumericField(Fields[3]).DisplayFormat := '#,##0.00'
  end;
end;

procedure TfrmProdutos.zqueryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  lblCodigo.Caption := zquery.FieldByName('id').AsString;
  edtNome.Text := zquery.FieldByName('nome').AsString;
  edtQtde.Text := zquery.FieldByName('quantidade').AsString;
  edtEstoqueMin.Text := zquery.FieldByName('estoque_minimo').AsString;
  edtValor.Text := zquery.FieldByName('valor').AsString;;
end;

procedure TfrmProdutos.EditsChange(Sender: TObject);
begin
  btGravar.Enabled := ( edtNome.Text <> '' );
end;

procedure TfrmProdutos.Localizar;
begin
  zquery.FindFirst;
  zquery.Locate('nome', BufferLocalizar, [loPartialKey]);
end;

procedure TfrmProdutos.EditsOnExit(Sender: TObject);
begin
  inherited;

  if TEdit(Sender).Text='' then
    TEdit(Sender).Text := '0';
end;

end.
