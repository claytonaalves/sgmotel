unit untProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untPadrao01, DB, ADODB, Grids, DBGrids, ExtCtrls, StdCtrls,
  Buttons, ActnList, BmsXPButton, XiPanel, AdvEdit, BmsXPLabel, Menus,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZSqlUpdate, ComCtrls, uProduto,
  ImgList, XiButton;

type
  // --------------------------------------
  TfrmProdutos = class(TfrmPadrao01)
    mnuPopUp: TPopupMenu;
    mnuOrdenarPor: TMenuItem;
    mnuAlterar: TMenuItem;
    mnuExcluir: TMenuItem;
    N1: TMenuItem;
    mnuLocalizarPor: TMenuItem;
    Cdigo2: TMenuItem;
    Nome2: TMenuItem;
    mnuFiltrarPor: TMenuItem;
    imgDownArrow: TImage;
    fldCodigo: TXiPanel;
    fldNome: TXiPanel;
    fldEstoque: TXiPanel;
    fldValor: TXiPanel;
    fldTipo: TXiPanel;
    Shape1: TShape;
    Shape4: TShape;
    lblT01: TLabel;
    Shape2: TShape;

    procedure Proc_Novo(Sender: TObject); override;
    procedure Proc_Alterar(Sender: TObject); override;
    procedure Proc_Excluir(Sender: TObject); override;
    procedure Proc_Gravar(Sender: TObject); override;

    procedure CarregaComboTipos;
    procedure qry01AfterScroll(DataSet: TDataSet); override;
    procedure ADOQueryAfterOpen(DataSet: TDataSet); override;
    procedure EditsChange(Sender: TObject); override;
    procedure edtLocalizarChange(Sender: TObject); override;

    procedure mnuFiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fldValorClick(Sender: TObject);
    procedure GridCabecalhoClick(Sender: TObject);

  private
    { Private declarations }
    ProdutoSelecionado: TProduto;

    ColunaSelecionada: TColunaSelecionada;

  public
    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;

implementation

uses untDM;

{$R *.dfm}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

procedure TfrmProdutos.FormCreate(Sender: TObject);
begin

   { Se o sistema apresentar erro ao entrar na opcao de produtos
     basta definir o parametro Active da qry01 como false }

   ProdutoSelecionado := TProduto.Create(Self);

   ColunaSelecionada := TColunaSelecionada.Create;
   ColunaSelecionada.Cabecalho := fldNome;
   ColunaSelecionada.Coluna := grd01.Columns[1];
   ColunaSelecionada.OrdenaPor := 'nome';
   ColunaSelecionada.Sentido := 0;
   
   inherited;
end;

// -----------------------------------------------------------------------------
// Procedimento executado ao se clicar no botao NOVO
//
// Prepara o formulario (limpa) para receber os dados do Novo Produto.
// Configura o procedimento de checagem de Campos
// -----------------------------------------------------------------------------

procedure TfrmProdutos.Proc_Novo(Sender: TObject);
begin
   edtCodigo.Text := '---';

   // Limpa os Edits
   edtNome.Clear;
   edtQtde.Clear;
   edtEstMin.Clear;
   edtUnidade.Clear;
   edtValor.Clear;

   inherited;  // Sempre usar

   cmbTipo.SetFocus;

end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

procedure TfrmProdutos.Proc_Alterar(Sender: TObject);
begin
   inherited;
   cmbTipo.SetFocus;
end;

// -----------------------------------------------------------------------------
// Procedimento executado ao se clicar no botao EXCLUIR
//
// Exclui o produto selecionado
// -----------------------------------------------------------------------------

procedure TfrmProdutos.Proc_Excluir(Sender: TObject);
begin
   if MessageBox(0, 'Apagar o produto selecionado?', 'Atenção!', MB_YESNO + MB_ICONERROR) = ID_YES then
      ProdutoSelecionado.Excluir;
end;

// -----------------------------------------------------------------------------
// Procedimento executado ao se clicar no botao OK apos uma Inclusao ou
// alteracao.
//
// Insere ou Altera o cadastro de um Produto.
// -----------------------------------------------------------------------------

procedure TfrmProdutos.Proc_Gravar(Sender: TObject);
var
   ProdutoEditado: TProduto;

begin
   ProdutoEditado := TProduto.Create(self);

   ProdutoEditado.Id := ProdutoSelecionado.Id;
   
   ProdutoEditado.Nome := edtNome.Text;
   ProdutoEditado.Estoque := edtQtde.Text;
   ProdutoEditado.EstoqMin := edtEstMin.Text;
   ProdutoEditado.Unidade := edtUnidade.Text;
   ProdutoEditado.Valor := edtValor.Text;
   ProdutoEditado.Tipo.Nome := cmbTipo.Text;

   case MododeGravacao of
      mInclusao  : ProdutoEditado.GravaInsercao;
      mAlteracao : ProdutoEditado.GravaEdicao;
   end;

   ProdutoEditado.Free;

   AtivaQuery;

   inherited;

   // Localiza o registro Inserido ou Alterado
   qry01.FindFirst;
   qry01.Locate('nome', ProdutoEditado.Nome, [loPartialKey]);

end;

// -----------------------------------------------------------------------------
// Procedimento executado apos a abertura da Query (consulta de dados no Banco
// de dados).
//
// Limpa os dados dos EDITS caso nao haja nenhum registro na tabela
// -----------------------------------------------------------------------------

procedure TfrmProdutos.ADOQueryAfterOpen(DataSet: TDataSet);
begin
  inherited;
  // Se houver registros, formata os campos
  if ( DataSet.RecordCount > 0 ) then begin
    with DataSet do begin
      TNumericField(Fields[5]).DisplayFormat := '#,##0.00';
      TNumericField(Fields[0]).DisplayFormat := '0000';
    end;
    CarregaComboTipos;

  end

  // Senao limpa os EDITS
  else begin
    edtNome.Clear;
    edtQtde.Clear;
    edtEstMin.Clear;
    edtUnidade.Clear;
    edtValor.Clear;
  end;

end;

// -----------------------------------------------------------------------------
// Procedimento executado apos percorrer entre os registros da tabela
//
// Atualiza as informacoes dos EDITS com as do registro atualmente selecionado.
// -----------------------------------------------------------------------------

procedure TfrmProdutos.qry01AfterScroll(DataSet: TDataSet);
begin
   inherited;

   // Preenche a estrutura PRODUTO
   ProdutoSelecionado.Id        := grd01.Fields[0].Text;
   ProdutoSelecionado.Tipo.Nome := qry01.FieldByName('tipo_produto').AsString;
   ProdutoSelecionado.Nome      := qry01.FieldByName('nome').AsString;
   ProdutoSelecionado.Estoque   := qry01.FieldByName('quantidade').AsString;
   ProdutoSelecionado.EstoqMin  := qry01.FieldByName('estoq_min').AsString;
   ProdutoSelecionado.Unidade   := qry01.FieldByName('unidade').AsString;
   ProdutoSelecionado.Valor     := grd01.Fields[4].Text;

   // Preenche os TEdits e o Combo de tipos
   edtCodigo.Text  := ProdutoSelecionado.Id;
   edtNome.Text    := ProdutoSelecionado.Nome;
   edtQtde.Text    := ProdutoSelecionado.Estoque;
   edtEstMin.Text  := ProdutoSelecionado.EstoqMin;
   edtUnidade.Text := ProdutoSelecionado.Unidade;
   edtValor.Text   := ProdutoSelecionado.Valor;
   cmbTipo.Text    := ProdutoSelecionado.Tipo.Nome;

end;

procedure TfrmProdutos.GridCabecalhoClick(Sender: TObject);
begin
  inherited;
   imgDownArrow.Parent := TXiPanel(Sender);
   imgDownArrow.Top := 5;
   imgDownArrow.Left := TXiPanel(Sender).Width - 20;
   imgDownArrow.Visible := true;
   imgDownArrow.

   // Restaura a Coluna Atualmente Selecionada
   ColunaSelecionada.Cabecalho.ColorGrad := $00DAE0DE;
   ColunaSelecionada.Coluna.Color := clWindow;

   // Configura nova Coluna
   ColunaSelecionada.Cabecalho := TXiPanel(Sender);
   ColunaSelecionada.Cabecalho.ColorGrad := clSilver;
   ColunaSelecionada.Coluna := grd01.Columns[TXiPanel(Sender).Tag];
   ColunaSelecionada.Coluna.Color := $00F0F0F0;
   ColunaSelecionada.OrdenaPor := 'codigo';
   ColunaSelecionada.Sentido := 0;

   

end;

procedure TfrmProdutos.fldValorClick(Sender: TObject);
begin
  inherited;

   qry01.SortedFields := 'VALOR DESC';
end;

// -----------------------------------------------------------------------------
// Procedimento executado a cada tecla pressionada nos EDITS
//
// Habilita ou desabilita o botao OK de acordo com a condicao especificada
// -----------------------------------------------------------------------------

procedure TfrmProdutos.EditsChange(Sender: TObject);
begin

   // Habilita o botao OK somente se os EDITS:
   // edtNome, edtQtde, edtValor tiverem algum conteudo
   btnAlterar.Enabled := ( ( edtNome.Text <> '' ) and
                           ( edtQtde.Text <> '' ) and
                           ( edtValor.Text <> '' ) and
                           ( edtUnidade.Text <> '' ) and
                           ( edtEstMin.Text <> '' ) and
                           ( cmbTipo.Text <> '' ) );

end;

// -----------------------------------------------------------------------------
// Procedimento executado ao se digitar na EDIT de localizacao
//
// Localiza na tabela o registro digitado.
// -----------------------------------------------------------------------------

procedure TfrmProdutos.edtLocalizarChange(Sender: TObject);
begin
   qry01.FindFirst;

   if ( edtLocalizar.Text <> '' ) then
      qry01.Locate('nome', edtLocalizar.Text, [loCaseInsensitive,loPartialKey]);
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

procedure TfrmProdutos.CarregaComboTipos;
var
   qry: TZQuery;
   I: integer;

begin
   cmbTipo.Clear;
   mnuFiltrarPor.Clear;

   qry := TZQuery.Create(self);

   qry.Connection := dmPrincipal.ZConn;
   qry.SQL.Text := 'SELECT * FROM produtos_tipos';
   qry.Open;

   if ( qry.RecordCount > 0 ) then
   begin
     for I := 0 to qry.RecordCount - 1 do
     begin
        cmbTipo.Items.Add(qry.FieldByName('nome').AsString);

        mnuFiltrarPor.Insert(I, TMenuItem.Create(mnuFiltrarPor));
        mnuFiltrarPor.Items[I].Caption := qry.FieldByName('nome').AsString;
        mnuFiltrarPor.Items[I].RadioItem := true;
        mnuFiltrarPor.Items[I].OnClick := mnuFiltrarClick;

        qry.Next;
     end;
   end;

   qry.Close;
   qry.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmProdutos.mnuFiltrarClick(Sender: TObject);
begin
   qry01.Filter := 'tipo LIKE ' + TMenuItem(Sender).Caption;
   qry01.Filtered := true;
end;

end.
