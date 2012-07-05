unit untApartamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untPadrao01, DB, ADODB, ActnList, StdCtrls, Buttons, Grids,
  DBGrids, ExtCtrls, ComCtrls, BmsXPButton, XiPanel, AdvEdit, BmsXPLabel,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfrmApartamentos = class(TfrmPadrao01)
    Shape1: TShape;
    lblCodigo: TLabel;
    lblCodigoNum: TLabel;
    Shape3: TShape;
    lblNome: TLabel;
    edtNome: TEdit;
    Shape4: TShape;
    lblQtde: TLabel;
    cmbTipo: TComboBox;
    qryTipos: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure EditsActivate(Sender: TObject);
    procedure EditsDeActivate(Sender: TObject);
    procedure Proc_Novo(Sender: TObject);
    procedure Proc_Excluir(Sender: TObject);
    procedure Proc_Gravar(Sender: TObject);
    procedure ADOQueryAfterOpen(DataSet: TDataSet);
    procedure qry01AfterScroll(DataSet: TDataSet);
    procedure EditsChange(Sender: TObject);
    procedure edtLocalizarChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    slCod_Tipos: TStringList;
    
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
var
   sTipo: string;

begin
   inherited;

   slCod_Tipos := TStringList.Create;

   while (not qryTipos.Eof) do begin

      sTipo := qryTipos.FieldValues['nome'];
      slCod_Tipos.Add(qryTipos.FieldValues['codigo']);

      cmbTipo.Items.Add(sTipo);
      //ComboBox1.Items.Add(slCod_Tipos.Strings[i]); // teste
      qryTipos.Next;

   end;

end;

// -----------------------------------------------------------------------------

procedure TfrmApartamentos.EditsActivate(Sender: TObject);
begin
  inherited;

   // Reabilita os Edits permitindo edicao e TabStop
   edtNome.ReadOnly := false;
   cmbTipo.Enabled := true;

   edtNome.TabStop := true;
   cmbTipo.TabStop := true;

   // Ativa o evento OnChange dos Edits
   edtNome.OnChange := EditsChange;
   cmbTipo.OnChange := EditsChange;

   edtNome.SetFocus;

end;

// -----------------------------------------------------------------------------

procedure TfrmApartamentos.EditsDeActivate(Sender: TObject);
begin
  inherited;

   // Desativa o evento OnChange dos Edits
   edtNome.OnChange := nil;
   cmbTipo.OnChange := nil;

   // Configura os Edits para somente leitura
   edtNome.ReadOnly := true;
   cmbTipo.Enabled := false;

   edtNome.TabStop := false;
   cmbTipo.TabStop := false;

end;

// -----------------------------------------------------------------------------

procedure TfrmApartamentos.Proc_Novo(Sender: TObject);
begin
  inherited;

   // Limpa os Edits
   edtNome.Clear;

   cmbTipo.ItemIndex := 0;

   lblCodigoNum.Caption := 'Indefinido';
end;

// -----------------------------------------------------------------------------

procedure TfrmApartamentos.Proc_Excluir(Sender: TObject);
var
   sCodigo: string;

begin
  inherited;

   if MessageBox(0,'Apagar o Apartamento selecionado?','Atenção!',MB_YESNO + MB_ICONERROR) = ID_YES then begin
      sCodigo := grd01.Fields[0].Text;
      dmPrincipal.conn.Execute('DELETE * FROM apartamentos WHERE codigo=' + sCodigo);
      dmPrincipal.conn.Execute('DELETE * FROM movimento WHERE cod_apto=' + sCodigo);
      AtivaQuery;
   end;

end;

// -----------------------------------------------------------------------------

procedure TfrmApartamentos.Proc_Gravar(Sender: TObject);
var
   sNome, sTipo, sCodigo, sLastCod: string;
   qryAptos: TADOQuery;

begin
   inherited;

   // Pega os valores dos campos Edit
   sNome  := QuotedStr(edtNome.Text);
   sTipo := slCod_Tipos.Strings[cmbTipo.ItemIndex];

   sCodigo := grd01.Fields[0].Text;

//   if lNovoRegistro then begin
//      dmPrincipal.conn.Execute('INSERT INTO apartamentos (nome,cod_tipo_apto) VALUES (' + sNome + ',' + sTipo + ')');
//
//
//      // Pequeno patch pra pegar o codigo do ultimo registro
//      qryAptos := TADOQuery.Create(Self);
//      qryAptos.Connection := dmPrincipal.conn;
//      qryAptos.SQL.Text := 'SELECT codigo FROM apartamentos ORDER BY codigo';
//      qryAptos.Active := true;
//      qryAptos.FindLast;
//      sLastCod := qryAptos.Fields.Fields[0].Text;
//      qryAptos.Active := false;
//      qryAptos.Free;
//
//      dmPrincipal.conn.Execute('INSERT INTO movimento (cod_apto) VALUES (' + sLastCod + ')' );
//   end
//   else
//      dmPrincipal.conn.Execute('UPDATE apartamentos SET nome=' + sNome + ', cod_tipo_apto=' + sTipo + ' WHERE codigo=' + sCodigo);


   AtivaQuery;

   // Localiza o registro Inserido ou Gravado
   qry01.FindFirst;
   qry01.Locate('AP.nome',sNome,[loPartialKey]);
end;

// -----------------------------------------------------------------------------

procedure TfrmApartamentos.ADOQueryAfterOpen(DataSet: TDataSet);
begin
  inherited;
  
   if ( DataSet.RecordCount = 0) then begin
      lblCodigoNum.Caption := '';
      edtNome.Clear;
      cmbTipo.Clear;
   end;

end;

// -----------------------------------------------------------------------------

procedure TfrmApartamentos.qry01AfterScroll(DataSet: TDataSet);
begin
  inherited;

   lblCodigoNum.Caption := grd01.Fields[0].Text;
   edtNome.Text := qry01.Fields[1].Text;
   cmbTipo.Text := qry01.Fields[2].Text;

end;

// -----------------------------------------------------------------------------

procedure TfrmApartamentos.EditsChange(Sender: TObject);
begin

   //CgBtnGravarState( ( edtNome.Text <> '' ) );

end;

// -----------------------------------------------------------------------------

procedure TfrmApartamentos.edtLocalizarChange(Sender: TObject);
begin
  inherited;
   //
end;

procedure TfrmApartamentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   //frmPrincipal.qryMovimento.Active := false;
   //frmPrincipal.qryMovimento.Active := true;

end;

end.
