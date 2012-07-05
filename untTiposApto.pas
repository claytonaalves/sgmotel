unit untTiposApto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untPadrao01, DB, ADODB, ActnList, StdCtrls, Buttons, Grids,
  DBGrids, ExtCtrls, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  PngBitBtn, ImgList, PngImageList, ComCtrls;

type
  TfrmTiposApto = class(TfrmPadrao01)
    qryMomentos: TZReadOnlyQuery;
    ds2: TDataSource;
    gMomentos: TDBGrid;
    sh5: TShape;
    lblNome: TLabel;
    sh1: TShape;
    sh2: TShape;
    sh3: TShape;
    sh4: TShape;
    edt1: TEdit; // Descricao do tipo
    edt2: TEdit; // Descricao do momento
    edt3: TEdit; // Tempo de estadia
    edt4: TEdit; // Tolerancia
    edt5: TEdit; // Valor
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btAddMomento: TPngBitBtn;
    btRemMomento: TPngBitBtn;

    procedure Gravar; override;
    procedure Excluir_Click(Sender: TObject); override;

    procedure ModoEdicao; override;
    procedure ModoConsulta; override;

    procedure Localizar; override;
    procedure EditsChange(Sender: TObject); override;

    procedure QueryAfterOpen(DataSet: TDataSet); override;
    procedure zqueryAfterScroll(DataSet: TDataSet); override;
    procedure qryMomentosAfterOpen(DataSet: TDataSet);

    procedure EditsExit(Sender: TObject);
    procedure btAddMomentoClick(Sender: TObject);
    procedure Cancelar_Click(Sender: TObject);
    procedure btRemMomentoClick(Sender: TObject);

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    // ----------
    procedure ExcluiMomentosOrfaos;

  private
    { Private declarations }
    qryAux: TZReadOnlyQuery;

  public
    { Public declarations }
  end;

var
  frmTiposApto: TfrmTiposApto;

implementation

uses untDM;

{$R *.dfm}

// -----------------------------------------------------------------------------

procedure TfrmTiposApto.FormCreate(Sender: TObject);
begin
  inherited;
  qryAux := TZReadOnlyQuery.Create(Self);
  qryAux.Connection := dmPrincipal.zconn;
end;

// -----------------------------------------------------------------------------

procedure TfrmTiposApto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  // Exclui os momentos/valores cadastrados se o form estiver no modo de edicao
  if ModoFormulario = mEdicao then
    ExcluiMomentosOrfaos;
end;

// -----------------------------------------------------------------------------

// Procedimento de GRAVACAO ou ATUALIZACAO
procedure TfrmTiposApto.Gravar;
var nome, iden, sql: string;
begin
  nome := edt1.Text;

  if lNovoRegistro then begin
    sql := 'INSERT INTO apartamentos_tipos (nome) VALUES ("%s")';
    sql := Format(sql, [edt1.Text]);
  end
  else begin
    sql := 'UPDATE apartamentos_tipos SET nome="%s" WHERE id=%d';
    sql := Format(sql, [edt1.Text, zquery.FieldByName('id').AsInteger]);
  end;

  // Insere ou altera o Registro (de acordo com a SQL)
  dmPrincipal.zconn.ExecuteDirect(sql);

  if lNovoRegistro then
  begin
    qryAux.Active := false;
    qryAux.SQL.Text := 'SELECT last_insert_rowid() FROM apartamentos_tipos';
    qryAux.Active := true;
    iden := qryAux.Fields[0].AsString;
  end
  else
    iden := zquery.FieldByName('id').AsString;

  dmPrincipal.zconn.ExecuteDirect('UPDATE valores_momentos SET id_tipo=' + iden +
                                  ' WHERE id_tipo=0');

  AtivaQuery;
  // Localiza o registro Inserido ou Gravado
  zquery.Locate('nome', nome, [loPartialKey]);
end;

// -----------------------------------------------------------------------------

procedure TfrmTiposApto.Excluir_Click(Sender: TObject);
const CRLF = #10#13;
var msg, id, nome: string;
begin
  msg := '';
  id := zquery.FieldByName('id').AsString;
  nome := zquery.FieldByName('nome').AsString;

  qryAux.SQL.Text := 'SELECT nome FROM apartamentos WHERE id_tipo_apto=' +
                     zquery.FieldByName('id').AsString;
  qryAux.Active := false;
  qryAux.Active := true;

  if qryAux.RecordCount>0 then
  begin
    msg := 'Ao excluir este tipo, também serão excluidos os seguintes Apartamentos:' +
           CRLF + CRLF;

    repeat
      msg := msg + '- ' + qryAux.Fields[0].AsString + CRLF;
      qryAux.Next;
    until qryAux.Eof;

    msg := msg + CRLF;
  end;

  msg := msg + 'Deseja realmente excluir o tipo selecionado ?';

  if MessageBox(0, PChar(msg), 'Atenção!', MB_YESNO + MB_ICONERROR) = ID_YES then
  begin
    // apagar apartamentos
    dmPrincipal.zconn.ExecuteDirect('DELETE FROM apartamentos WHERE id_tipo_apto='+id);
    // apagar valores_momentos
    dmPrincipal.zconn.ExecuteDirect('DELETE FROM valores_momentos WHERE id_tipo='+id);
    // apagar tipo selecionado
    dmPrincipal.zconn.ExecuteDirect('DELETE FROM apartamentos_tipos WHERE id='+id);
  end;

  AtivaQuery;
  // Localiza o registro na grade
  zquery.Locate('nome', nome, [loPartialKey]);
end;

// -----------------------------------------------------------------------------

procedure TfrmTiposApto.Localizar;
begin
  zquery.FindFirst;
  zquery.Locate('nome', BufferLocalizar, [loPartialKey]);
end;

// -----------------------------------------------------------------------------

procedure TfrmTiposApto.ModoConsulta;
var i: integer;
begin
  inherited;

  for i:= 1 to 5 do
  begin
    with TShape(FindComponent('sh'+inttostr(i))) do
        Brush.Color := COR_INATIVA;

    with TEdit(FindComponent('edt'+inttostr(i))) do
    begin
      OnChange := nil;
      ReadOnly := true;
      Tabstop := false;
      Color := COR_INATIVA;
      Clear;
    end;
  end;

  btAddMomento.TabStop := false;
  btRemMomento.TabStop := false;
  btAddMomento.Enabled := false;
  btRemMomento.Enabled := false;

  qryMomentosAfterOpen(qryMomentos);
end;

// -----------------------------------------------------------------------------

procedure TfrmTiposApto.ModoEdicao;
var i: integer;
begin
  inherited;

  for i:= 1 to 5 do
  begin
    with TShape(FindComponent('sh'+inttostr(i))) do
        Brush.Color := clWindow;

    with TEdit(FindComponent('edt'+inttostr(i))) do
    begin
      ReadOnly := false;
      Tabstop := true;
      Color := clWindow;
      OnChange := EditsChange;
      if lNovoRegistro then
        Clear
    end;
  end;

  if lNovoRegistro then begin
    qryMomentos.SQL.Text := 'SELECT * FROM valores_momentos WHERE id_tipo=0';
    qryMomentos.Active := false;
  end
  else begin
    qryMomentos.SQL.Text := 'SELECT * FROM valores_momentos WHERE id_tipo='+
                   zquery.FieldByName('id').AsString +
                   ' OR id_tipo=0';
    qryMomentos.Active := false;
    qryMomentos.Active := true;
  end;

  btAddMomento.TabStop := true;
  btRemMomento.TabStop := true;

  edt1.SetFocus;
end;

// -----------------------------------------------------------------------------

procedure TfrmTiposApto.QueryAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if DataSet.RecordCount=0 then
  begin
    edt1.Clear;
    edt2.Clear;
    edt3.Clear;
    edt4.Clear;
    edt5.Clear;

    qryMomentos.Active := false;
  end;
end;

// -----------------------------------------------------------------------------

// Preenche os campos do painel detalhe
procedure TfrmTiposApto.zqueryAfterScroll(DataSet: TDataSet);
begin
//  showmessage('executou after scroll');
  edt1.Text := zquery.FieldByName('nome').AsString;
  qryMomentos.SQL.Text := 'SELECT * FROM valores_momentos WHERE id_tipo=' +
                          zquery.FieldByName('id').AsString;
  qryMomentos.Active := false;
  qryMomentos.Active := true;
end;

// -----------------------------------------------------------------------------

// Ao abrir a query de valores dos momentos
procedure TfrmTiposApto.qryMomentosAfterOpen(DataSet: TDataSet);
begin
  if ModoFormulario = mEdicao then
  begin
    // Ativa ou desativa o botão para REMOVER os valores de momento
    btRemMomento.Enabled := (qryMomentos.RecordCount>0);
    gMomentos.Enabled := (qryMomentos.RecordCount>0);
  end
  else begin
    btRemMomento.Enabled := false;
    gMomentos.Enabled := false;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmTiposApto.EditsExit(Sender: TObject);
const VAZIO = '';
var edt: TEdit;
begin
  edt := TEdit(Sender);

  // Descricao do momento
  if edt.Name = 'edt2' then begin
    if edt.Text = VAZIO then edt.Text := 'MOMENTO 2 HORAS'
  end

  // Tempo
  else if edt.Name = 'edt3' then begin
    if edt.Text = VAZIO then edt.Text := '2'
  end

  // Tolerancia
  else if edt.Name = 'edt4' then begin
    if edt.Text = VAZIO then edt.Text := '5'
  end

  // valor
  else if edt.Name = 'edt5' then begin
    if edt.Text = VAZIO then edt.Text := '0'
  end;
end;

// -----------------------------------------------------------------------------

// Grava o novo valor de momento no banco de dados
procedure TfrmTiposApto.btAddMomentoClick(Sender: TObject);
var sql: string;
begin
  sql := 'INSERT INTO valores_momentos (descricao, tempo, tolerancia, valor) ' +
         'VALUES ("%s",%s,%s,%0.2f)';
  sql := Format(sql, [edt2.Text,
                      edt3.Text,
                      edt4.Text,
                      StrToFloat(edt5.Text)]);

  dmPrincipal.zconn.ExecuteDirect(sql);
  qryMomentos.Active := false;
  qryMomentos.Active := true;

  EditsChange(Self);

  edt2.SetFocus;
end;

// -----------------------------------------------------------------------------

// Remove o momento selecionado na gMomentos
procedure TfrmTiposApto.btRemMomentoClick(Sender: TObject);
begin
  dmPrincipal.zconn.ExecuteDirect('DELETE FROM valores_momentos WHERE id=' +
                                  qryMomentos.FieldByName('id').AsString);

  qryMomentos.Active := false;
  qryMomentos.Active := true;

  EditsChange(Self);
end;

// -----------------------------------------------------------------------------

// Sobreescrevendo botao CANCELAR padrao
procedure TfrmTiposApto.Cancelar_Click(Sender: TObject);
begin
  inherited;
  ExcluiMomentosOrfaos;
end;

// -----------------------------------------------------------------------------

procedure TfrmTiposApto.EditsChange(Sender: TObject);
var condicao: boolean;
begin
  btAddMomento.Enabled := ((edt2.Text<>'') and (edt3.Text<>'') and
                           (edt4.Text<>'') and (edt5.Text<>''));

  if qryMomentos.Active then
    condicao := (qryMomentos.RecordCount>0)
  else
    condicao := false;

  btGravar.Enabled := ((edt1.Text <>'') and condicao);
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

procedure TfrmTiposApto.ExcluiMomentosOrfaos;
begin
  dmPrincipal.zconn.ExecuteDirect('DELETE FROM valores_momentos WHERE id_tipo=0');
end;

end.
