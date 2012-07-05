unit untPrincipal;

interface

uses
  Windows, Messages, SysUtils, StrUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGrids, ExtCtrls, DB, ADODB, StdCtrls, Buttons,
  ComCtrls, ImgList, PngImageList, PngBitBtn, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    mnuCadastro: TMenuItem;
    mnuFuncionarios: TMenuItem;
    mnuProdutos: TMenuItem;
    N1: TMenuItem;
    mnuTiposApto: TMenuItem;
    mnuApartamentos: TMenuItem;
    dsMovimento: TDataSource;
    mnuMovimentacoes: TMenuItem;
    mnuSair: TMenuItem;
    Timer1: TTimer;
    panelResumo: TPanel;
    Label15: TLabel;
    shpApto: TShape;
    lbl04: TLabel;
    lblEntrada: TLabel;
    lbl03: TLabel;
    Label7: TLabel;
    lblTranscorrido: TLabel;
    lblVeiculo: TLabel;
    lblApto: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Shape6: TShape;
    Label2: TLabel;
    lblConsumo: TLabel;
    gConsumo: TDBGrid;
    StatusBar1: TStatusBar;
    btMaisUm: TPngBitBtn;
    btMenosUm: TPngBitBtn;
    qry: TZQuery;
    Shape2: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape3: TShape;
    Label1: TLabel;
    btAddItem: TPngBitBtn;
    btRemItem: TPngBitBtn;
    panelApartamentos: TPanel;
    grdMovimento: TDBGrid;
    Label5: TLabel;
    lblTipo: TLabel;
    Shape1: TShape;
    Label8: TLabel;
    lblSituacao: TLabel;
    lblAbertoPor: TLabel;
    dsConsumo: TDataSource;
    btnAbertura: TPngBitBtn;
    btnFechamento: TPngBitBtn;
    PngImageList1: TPngImageList;
    Timer2: TTimer;
    qConsumo: TZReadOnlyQuery;

    procedure FormCreate(Sender: TObject);

    // MENUS
    procedure mnuProdutosClick(Sender: TObject);
    procedure mnuSairClick(Sender: TObject);
    procedure mnuFuncionariosClick(Sender: TObject);
    procedure mnuTiposAptoClick(Sender: TObject);
    procedure mnuApartamentosClick(Sender: TObject);
    procedure mnuMovimentacoesClick(Sender: TObject);

    // Botoes
    procedure btnAberturaClick(Sender: TObject);
    procedure btnCancelaAberturaClick(Sender: TObject);

    procedure qryMovimentoAfterScroll(DataSet: TDataSet);
    procedure grdMovimentoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
                                         State: TGridDrawState);

//    procedure btnConsumoClick(Sender: TObject);
    procedure btnFechamentoClick(Sender: TObject);

    procedure qryMovimentoAfterOpen(DataSet: TDataSet);

    procedure Timer1Timer(Sender: TObject);
    procedure btAddItemClick(Sender: TObject);
    procedure btRemItemClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure AtualizaLabelTranscorrido;
    procedure AtivaGridConsumo;
    procedure DesativaGridConsumo;
    procedure qConsumoAfterOpen(DataSet: TDataSet);
    procedure btMaisUmClick(Sender: TObject);
    procedure btMenosUmClick(Sender: TObject);
    procedure grdMovimentoDblClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  untProdutos, untDM, untFuncionarios, untApartamentos, untTiposApto, untEntrada,
  untFechamento, untMovimentacao, untLocalizarProdutos;

{$R *.dfm}

// -----------------------------------------------------------------------------

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  qry.Active := True;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  StatusBar1.Panels[3].Text := 'Operador: ' + operador;
  Timer1.Enabled := true; // Atualiza o relogio da barra de status
end;

// -----------------------------------------------------------------------------

procedure TfrmPrincipal.mnuMovimentacoesClick(Sender: TObject);
begin
  try
    frmMovimentacao := TfrmMovimentacao.Create(Self);
    frmMovimentacao.ShowModal;
  finally
    frmMovimentacao.Release;
    frmMovimentacao := nil;
  end;
end;

procedure TfrmPrincipal.mnuProdutosClick(Sender: TObject);
begin
  try
    frmProdutos := TfrmProdutos.Create(Self);
    frmProdutos.ShowModal;
  finally
    frmProdutos.Release;
    frmProdutos := nil;
  end;
end;

procedure TfrmPrincipal.mnuFuncionariosClick(Sender: TObject);
begin
  try
    frmFuncionarios := TfrmFuncionarios.Create(Self);
    frmFuncionarios.ShowModal;
  finally
    frmFuncionarios.Release;
    frmFuncionarios := nil;
  end;
end;

procedure TfrmPrincipal.mnuTiposAptoClick(Sender: TObject);
begin
  try
    frmTiposApto := TfrmTiposApto.Create(Self);
    frmTiposApto.ShowModal;
  finally
    frmTiposApto.Release;
    frmTiposApto := nil;
  end;

  qry.Active := false;
  qry.Active := true;
end;

// Cadastro de APARTAMENTOS
procedure TfrmPrincipal.mnuApartamentosClick(Sender: TObject);
begin
  try
    frmApartamentos := TfrmApartamentos.Create(Self);
    frmApartamentos.ShowModal;
  finally
    frmApartamentos.Release;
    frmApartamentos := nil;
  end;

// NAO FACO A MENOR IDEIA DO PORQUE DISSO AI ABAIXO:
//   if qry.RecordCount > 0 then begin
//      grdMovimento.DataSource := dsMovimento;
//   end;

  qry.Active := false;
  qry.Active := true;
end;

procedure TfrmPrincipal.mnuSairClick(Sender: TObject);
begin
   Close;
end;

// -----------------------------------------------------------------------------

procedure TfrmPrincipal.btnAberturaClick(Sender: TObject);
var apto: string;
begin
  apto := qry.FieldByName('apartamento').AsString;
  try
    frmEntrada := TfrmEntrada.Create(Self);
    frmEntrada.lblApto.Caption := apto;
    frmEntrada.lblTipo.Caption := qry.FieldByName('tipo').AsString;
    if frmEntrada.ShowModal=mrOk then
    begin
      qry.Active := false;
      qry.Active := true;
      qry.Locate('apartamento', apto, [loPartialKey]);
    end;
  finally
    frmEntrada.Release;
    frmEntrada := nil;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmPrincipal.qryMovimentoAfterScroll(DataSet: TDataSet);
begin
  lblApto.Caption := qry.FieldByName('apartamento').AsString;
  lblTipo.Caption := qry.FieldByName('tipo').AsString;

  // Apartamento OCUPADO
  if qry.FieldByName('ativo').AsInteger > 0 then begin
    lblSituacao.Caption := 'OCUPADO';
    shpApto.Brush.Color := clRed;

    lblEntrada.Caption := qry.FieldByName('entrada').AsString;
    lblVeiculo.Caption := qry.FieldByName('veiculo').AsString;
    lblAbertoPor.Caption := qry.FieldByName('aberto_por').AsString;

    btnAbertura.Caption := 'Cancelar abertura';
    btnAbertura.PngImage := nil;
    btnAbertura.PngImage := PngImageList1.PngImages.Items[0].PngImage;
    btnAbertura.OnClick := btnCancelaAberturaClick;

    btnFechamento.Enabled := true;

    AtivaGridConsumo;
    AtualizaLabelTranscorrido;
  end

  // Apartamento LIVRE
  else begin
    lblSituacao.Caption := 'LIVRE';
    shpApto.Brush.Color := clMoneyGreen;

    lblEntrada.Caption := '---';
    lblVeiculo.Caption := '---';
    lblTranscorrido.Caption := '---';
    lblAbertoPor.Caption := '---';

    btnAbertura.Caption := 'Abertura';
    btnAbertura.PngImage := nil;
    btnAbertura.PngImage := PngImageList1.PngImages.Items[1].PngImage;

    btnAbertura.OnClick := btnAberturaClick;

    btnFechamento.Enabled := false;

    DesativaGridConsumo;
  end;
end;

// -----------------------------------------------------------------------------
// Ativa ou desativa a grid e os botoes de acao, se houver registros
// Atualiza a barra de status
procedure TfrmPrincipal.qryMovimentoAfterOpen(DataSet: TDataSet);
var
  cond: boolean;
  ocupados: integer;
begin
  ocupados := 0;
  cond := (qry.RecordCount > 0);

  grdMovimento.Enabled := cond;
  btnAbertura.Enabled := cond;
  btnFechamento.Enabled := cond;

  // conta quantos aptos estao ocupados
  if cond then
  begin
    repeat
      if qry.FieldByName('ativo').AsInteger > 0 then
        inc(ocupados);

      qry.Next;
    until qry.Eof;

    qry.First;
  end;

  StatusBar1.Panels[0].Text := 'Total apartamentos: ' + IntToStr(qry.RecordCount);
  StatusBar1.Panels[1].Text := 'Ocupados: ' + IntToStr(ocupados);
  StatusBar1.Panels[2].Text := 'Livres: ' + IntToStr(qry.RecordCount-ocupados);

  //TNumericField(DataSet.FieldByName('valor2horas')).DisplayFormat := '#,##0.00'
end;

// -----------------------------------------------------------------------------

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[4].Text := 'Hora atual: ' + FormatDateTime('hh:nn:ss', Time());
end;

// -----------------------------------------------------------------------------

procedure TfrmPrincipal.btnCancelaAberturaClick(Sender: TObject);
{ DONE :
Adicionar opção para cancelamento de um movimento aberto:
- Restaurar os produtos no Estoque
- Desocupar o apartamento }
begin
  if MessageBox(0, 'Cancelar abertura?', 'Atenção!',
                MB_YESNO + MB_ICONERROR)=ID_YES then
  begin
    dmPrincipal.zconn.ExecuteDirect('DELETE FROM movimentacao WHERE id='+qry.FieldByName('ativo').AsString);
    // Atualiza a lista de apartamentos principal
    qry.Active := false;
    qry.Active := true;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmPrincipal.btnFechamentoClick(Sender: TObject);
begin
  try
    frmFechamento := TfrmFechamento.Create(Self);
    frmFechamento.movimento.id := qry.FieldByName('ativo').AsInteger;

    if frmFechamento.ShowModal=mrOk then begin
      qry.Active := false;
      qry.Active := true;
    end;
  finally
    frmFechamento.Release;
    frmFechamento := nil;
  end;
end;

// -----------------------------------------------------------------------------
// Atualiza o label de tempo transcorrido
procedure TfrmPrincipal.Timer2Timer(Sender: TObject);
begin
  AtualizaLabelTranscorrido;
end;

procedure TfrmPrincipal.AtualizaLabelTranscorrido;
var data1, data2: TDateTime;
begin
  if qry.FieldByName('ativo').AsInteger > 0 then
  begin
    data1 := qry.FieldByName('entrada').AsDateTime;
    data2 := Now;

    lblTranscorrido.Caption := diff(data1, data2);
  end;
end;

// -----------------------------------------------------------------------------
procedure TfrmPrincipal.AtivaGridConsumo;
const sql = 'SELECT id, id_produto, produto, quantidade, valor_unitario, '+
            '(valor_unitario*quantidade) as total FROM movimentacao_consumo ' +
            'WHERE id_movimentacao=%s';
var soma_total: real;
begin
  qConsumo.Close;
  // o campo "ativo" eh a ID da movimentacao na tabela "movimentacao"
//  qConsumo.SQL.Text := Format(sql, [qry.FieldByName('ativo').AsString]);
  qConsumo.ParamByName('id_movimentacao').AsString := qry.FieldByName('ativo').AsString;
  qConsumo.Open;

  soma_total := 0;

  if qConsumo.RecordCount>0 then
  begin
    repeat
      soma_total := soma_total + qConsumo.FieldByName('total').AsFloat;
      qConsumo.Next;
    until qConsumo.Eof;
  end;

  lblConsumo.Caption := 'R$ ' + Format('%0.2f', [soma_total]);
end;

procedure TfrmPrincipal.DesativaGridConsumo;
begin
  btAddItem.Enabled := false;
  btRemItem.Enabled := false;
  btMaisUm.Enabled := false;
  btMenosUm.Enabled := false;

  qConsumo.Close;
  gConsumo.Enabled := false;

  lblConsumo.Caption := 'R$ 0.00';
end;

// -----------------------------------------------------------------------------
procedure TfrmPrincipal.qConsumoAfterOpen(DataSet: TDataSet);
var condicao: boolean;
begin
  condicao := (DataSet.RecordCount > 0);

  btAddItem.Enabled := true;
  btRemItem.Enabled := condicao;
  btMaisUm.Enabled := condicao;
  btMenosUm.Enabled := condicao;

  gConsumo.Enabled := condicao;
end;

// -----------------------------------------------------------------------------

// Adiciona novo produto a lista de itens consumidos
procedure TfrmPrincipal.btAddItemClick(Sender: TObject);
const
  sql1 = 'INSERT INTO movimentacao_consumo (' +
         'id_movimentacao, id_produto, produto, quantidade, valor_unitario) ' +
         'VALUES (%s, %s, "%s", %s, %s)';
  sql2 = 'UPDATE movimentacao_consumo SET quantidade=quantidade+%s ' +
         'WHERE id_movimentacao=%s AND id_produto=%s';

var
  id_mov, id_prod, nome_prod, qtde, valor: string;
  produto_ja_existe: boolean;
begin
  frmLocalizarProdutos := TfrmLocalizarProdutos.Create(Self);

  try
    if frmLocalizarProdutos.ShowModal=mrOk then
    begin
      with frmLocalizarProdutos do
      begin
        id_prod   := qProdutos.FieldByName('id').AsString;
        nome_prod := qProdutos.FieldByName('nome').AsString;
        qtde      := edtQtde.Text;
        valor     := qProdutos.FieldByName('valor').AsString;
      end;
    end
    else
      exit;
  finally
    frmLocalizarProdutos.Release;
    frmLocalizarProdutos := nil;
  end;

  id_mov := qry.FieldByName('ativo').AsString;
  produto_ja_existe := false;

  // Verifica se o produto ja exite na query qConsumo
  if qConsumo.RecordCount>0 then
  begin
    qConsumo.First;
    repeat
      if qConsumo.FieldByName('id_produto').AsString=id_prod then
      begin
        produto_ja_existe := true;
        break;
      end;
      qConsumo.Next;
    until qConsumo.Eof;
  end;

  if produto_ja_existe then
    dmPrincipal.zconn.ExecuteDirect(Format(sql2, [qtde, id_mov, id_prod]))
  else
    dmPrincipal.zconn.ExecuteDirect(Format(sql1, [id_mov, id_prod, nome_prod, qtde, valor]));

  AtivaGridConsumo;
end;

// Remove um produto da lista de itens consumidos
procedure TfrmPrincipal.btRemItemClick(Sender: TObject);
begin
  dmPrincipal.zconn.ExecuteDirect(
    'DELETE FROM movimentacao_consumo WHERE id=' +
    qConsumo.FieldByName('id').AsString
  );
  AtivaGridConsumo;
end;

procedure TfrmPrincipal.btMaisUmClick(Sender: TObject);
begin
  dmPrincipal.zconn.ExecuteDirect(
    'UPDATE movimentacao_consumo SET quantidade=quantidade+1 '+
    'WHERE id=' + qConsumo.FieldByName('id').AsString
  );
  AtivaGridConsumo;
end;

procedure TfrmPrincipal.btMenosUmClick(Sender: TObject);
begin
  dmPrincipal.zconn.ExecuteDirect(
    'UPDATE movimentacao_consumo SET quantidade=quantidade-1 '+
    'WHERE id=' + qConsumo.FieldByName('id').AsString
  );
  AtivaGridConsumo;
end;

// -----------------------------------------------------------------------------

procedure TfrmPrincipal.grdMovimentoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   sRegionType : String;
   grdGrid: TDBGrid;
begin
  if qry.RecordCount=0 then
    exit;

  sRegionType := Column.Field.AsString;
  grdGrid := TDBGrid(Sender);

  if qry.FieldByName('ativo').AsInteger>0 then
  begin
    if gdSelected in State then
    begin
      grdGrid.Canvas.Brush.Color := clRed;
      grdGrid.Canvas.Font.Color := clWhite;
    end
    else
    begin
      grdGrid.Canvas.Brush.Color := $00F0E0FF;
      grdGrid.Canvas.Font.Color := clRed;
    end;
  end
  else
  begin
    if gdSelected in State then
      grdGrid.Canvas.Font.Color := clWhite
    else
      grdGrid.Canvas.Font.Color := clGreen
  end;

  grdGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;



procedure TfrmPrincipal.grdMovimentoDblClick(Sender: TObject);
begin
  if qry.FieldByName('ativo').AsInteger > 0 then
    btnFechamentoClick(Self)
  else
    btnAberturaClick(Self);
end;

end.
