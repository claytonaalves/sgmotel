// =============================================================================
// Usado para inserir Tipos de Aptos
// =============================================================================

unit untTiposApto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untPadrao01, DB, ADODB, ActnList, StdCtrls, Buttons, Grids,
  DBGrids, ExtCtrls, XiPanel, BmsXPButton, untClassTiposApto,
  AdvEdit, ZAbstractRODataset, ZAbstractDataset, ZDataset, BmsXPLabel;

type
  TfrmTiposApto = class(TfrmPadrao01)
    gbDados: TGroupBox;
    BmsXPLabel1: TBmsXPLabel;
    BmsXPLabel3: TBmsXPLabel;
    BmsXPLabel4: TBmsXPLabel;
    BmsXPLabel5: TBmsXPLabel;
    BmsXPLabel2: TBmsXPLabel;
    AdvEdit2: TAdvEdit;
    AdvEdit3: TAdvEdit;
    XiPanel3: TXiPanel;
    XiPanel4: TXiPanel;
    AdvEdit1: TAdvEdit;
    AdvEdit4: TAdvEdit;
    AdvEdit5: TAdvEdit;

    procedure ADOQueryAfterOpen(DataSet: TDataSet);
    procedure qry01AfterScroll(DataSet: TDataSet);

    procedure EditsActivate(Sender: TObject);
    procedure EditsDeActivate(Sender: TObject);

    procedure Proc_Novo(Sender: TObject);
    procedure Proc_Excluir(Sender: TObject);
    procedure Proc_Gravar(Sender: TObject);

    procedure EditsChange(Sender: TObject);
    procedure edtLocalizarChange(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    TipoAptoSelecionado: TTipoApto;

  public
    { Public declarations }
  end;

var
  frmTiposApto: TfrmTiposApto;

implementation

uses untDM;

{$R *.dfm}

// =============================================================================
// =============================================================================

procedure TfrmTiposApto.FormCreate(Sender: TObject);
begin

   TipoAptoSelecionado := TTipoApto.Create;

   // Ativa a Query e dispara o procedimento
   qry01.Active := true;


end;

// =============================================================================
//
// Limpa os TEdits do formulario para realizar um cadastro novo
//
// =============================================================================

procedure TfrmTiposApto.Proc_Novo(Sender: TObject);
begin
   inherited;
   {
   edtNome.Clear;
   edtValor.Clear;
   edtValor2.Clear;
   edtValor3.Clear;
   edtValor4.Clear;
   }
end;

// =============================================================================
//
// Exclui o Tipo de Apartamento atualmente selecionado
//
// Ultima Modificação: 05/07/2007
// Status: Estavel
//
// =============================================================================

procedure TfrmTiposApto.Proc_Excluir(Sender: TObject);
begin

   TipoAptoSelecionado.Excluir;

   AtivaQuery;

end;

// =============================================================================
//
//  Insere ou Atualiza um tipo de Apto
//
// =============================================================================

procedure TfrmTiposApto.Proc_Gravar(Sender: TObject);
var
   TipoApto: TTipoApto;

begin
   inherited;
   {
   TipoApto := TTipoApto.Criar(lNovoRegistro);

   TipoApto.Codigo := qry01.FieldByName('id').AsString;
   TipoApto.Nome   := edtNome.Text;
   TipoApto.Valor1 := edtValor.Text;
   TipoApto.Valor2 := edtValor2.Text;
   TipoApto.Valor3 := edtValor3.Text;
   TipoApto.Valor4 := edtValor4.Text;

   TipoApto.Gravar;

   AtivaQuery;

   // Localiza o registro Inserido ou Gravado
   qry01.FindFirst;
   qry01.Locate('nome', TipoApto.Nome, [loPartialKey]);
   }
end;

// =============================================================================
//
// Evento disparado apos a abertura da Query
//
// Formata as colunas do Grid
//
// =============================================================================

procedure TfrmTiposApto.ADOQueryAfterOpen(DataSet: TDataSet);
begin
  inherited;

   if (DataSet.RecordCount > 0) then begin

      with DataSet do begin
         TNumericField(Fields[2]).DisplayFormat := '#,##0.00';
         TNumericField(Fields[3]).DisplayFormat := '#,##0.00';
         TNumericField(Fields[4]).DisplayFormat := '#,##0.00';
         TNumericField(Fields[5]).DisplayFormat := '#,##0.00';
      end;

   end
   else if ( DataSet.RecordCount = 0) then begin
      {edtNome.Clear;
      edtValor.Clear;
      edtValor2.Clear;
      edtValor3.Clear;
      edtValor4.Clear;}
   end;

end;

// =============================================================================
//
// Evento disparado apos percorrer os Registros
// Preenche os componentes do form com os dados da query
//
// =============================================================================

procedure TfrmTiposApto.qry01AfterScroll(DataSet: TDataSet);
begin
  inherited;

   // Atribui os dados da grade ao Objeto TiposAptoSelecionado
   TipoAptoSelecionado.Codigo := qry01.FieldByName('id').AsString;
   TipoAptoSelecionado.Nome   := qry01.FieldByName('nome').AsString;
   TipoAptoSelecionado.Valor1 := qry01.FieldByName('valor01').AsString;
   TipoAptoSelecionado.Valor2 := qry01.FieldByName('valor02').AsString;
   TipoAptoSelecionado.Valor3 := qry01.FieldByName('valor03').AsString;
   TipoAptoSelecionado.Valor4 := qry01.FieldByName('valor04').AsString;

   // Atualiza os Labels do Formulario com as Informacoes do Registro Selecionado
   {edtNome.Text   := TipoAptoSelecionado.Nome;
   edtValor.Text  := Trim(format('%10.2f',[StrToFloat(TipoAptoSelecionado.Valor1)]));
   edtValor2.Text := Trim(format('%10.2f',[StrToFloat(TipoAptoSelecionado.Valor2)]));
   edtValor3.Text := Trim(format('%10.2f',[StrToFloat(TipoAptoSelecionado.Valor3)]));
   edtValor4.Text := Trim(format('%10.2f',[StrToFloat(TipoAptoSelecionado.Valor4)]));
   }
end;

// =============================================================================
//
// Evento disparado ao mudar o conteudo dos TEdits
// Se os campos edtNome, edtValor, edtValor2, edtValor3 e edtValor4 nao estiverem
// vazios o botão btnNovo sera habilitado
//
// =============================================================================

procedure TfrmTiposApto.EditsChange(Sender: TObject);
begin
   {
   btnNovo.Enabled := ( ( edtNome.Text <> '' ) and
                        ( edtValor.Text <> '' ) and
                        ( edtValor2.Text <> '' ) and
                        ( edtValor3.Text <> '' ) and
                        ( edtValor4.Text <> '' ) );
   }
end;

// =============================================================================
//
// Evento disparado ao mudar o conteudo da caixa "Localizar"
//
// =============================================================================

procedure TfrmTiposApto.edtLocalizarChange(Sender: TObject);
begin

   qry01.FindFirst;

   if ( edtLocalizar.Text <> '' ) then
      qry01.Locate('nome',edtLocalizar.Text,[loPartialKey]);

end;

// =============================================================================

procedure TfrmTiposApto.EditsActivate(Sender: TObject);
begin
   inherited;

   // Reabilita os Edits permitindo edicao e TabStop
   {
   edtNome.ReadOnly := false;
   edtValor.ReadOnly := false;
   edtValor2.ReadOnly := false;
   edtValor3.ReadOnly := false;
   edtValor4.ReadOnly := false;

   edtNome.TabStop := true;
   edtValor.TabStop := true;
   edtValor2.TabStop := true;
   edtValor3.TabStop := true;
   edtValor4.TabStop := true;

   // Ativa o evento OnChange dos Edits
   edtNome.OnChange := EditsChange;
   edtValor.OnChange := EditsChange;
   edtValor2.OnChange := EditsChange;
   edtvalor3.OnChange := EditsChange;
   edtValor4.OnChange := EditsChange;

   edtNome.SetFocus;
   }
end;

// =============================================================================

procedure TfrmTiposApto.EditsDeActivate(Sender: TObject);
begin
   inherited;

   // Desativa o evento OnChange dos Edits
   // Pq o evento continua sendo executado mesmo qdo o TEdit esta inativo
   {
   edtNome.OnChange := nil;
   edtValor.OnChange := FormataTEdit;
   edtValor2.OnChange := FormataTEdit;
   edtvalor3.OnChange := FormataTEdit;
   edtValor4.OnChange := FormataTEdit;

   // Configura os Edits para somente leitura
   edtNome.ReadOnly := true;
   edtValor.ReadOnly := true;
   edtValor2.ReadOnly := true;
   edtValor3.ReadOnly := true;
   edtValor4.ReadOnly := true;

   edtNome.TabStop := false;
   edtValor.TabStop := false;
   edtValor2.TabStop := false;
   edtValor3.TabStop := false;
   edtValor4.TabStop := false;
   }
end;

// =============================================================================

procedure TfrmTiposApto.edtValorExit(Sender: TObject);
begin
  inherited;

  //edtValor2.Text := edtValor.Text;
  //edtValor3.Text := edtValor.Text;
  //edtValor4.Text := edtValor.Text;
end;

end.
