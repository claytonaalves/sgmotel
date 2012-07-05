unit untFuncionarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untPadrao01, DB, ADODB, ActnList, StdCtrls, Buttons, Grids,
  DBGrids, ExtCtrls, BmsXPButton, XiPanel, AdvEdit, BmsXPLabel,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfrmFuncionarios = class(TfrmPadrao01)
    gbDados: TGroupBox;
    XiPanel3: TXiPanel;
    edtCodigo: TAdvEdit;
    BmsXPLabel1: TBmsXPLabel;
    lblTipo: TBmsXPLabel;
    cmbCargo: TComboBox;
    edtNome: TAdvEdit;
    BmsXPLabel3: TBmsXPLabel;
    BmsXPLabel4: TBmsXPLabel;
    BmsXPLabel5: TBmsXPLabel;
    BmsXPLabel6: TBmsXPLabel;
    BmsXPLabel7: TBmsXPLabel;
    edtEndereco: TAdvEdit;
    edtTelefone: TAdvEdit;
    edtCelular: TAdvEdit;
    XiPanel4: TXiPanel;
    XiPanel2: TXiPanel;
    edtSenha: TAdvEdit;
    BmsXPLabel2: TBmsXPLabel;
    cmbAcesso: TComboBox;

    procedure EditsActivate(Sender: TObject);
    procedure EditsDeActivate(Sender: TObject);
    procedure EditsChange(Sender: TObject);

    procedure Proc_Novo(Sender: TObject);
    procedure Proc_Excluir(Sender: TObject);
    procedure Proc_Gravar(Sender: TObject);
    procedure ADOQueryAfterOpen(DataSet: TDataSet);
    procedure qry01AfterScroll(DataSet: TDataSet);
    procedure edtLocalizarChange(Sender: TObject);

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

// -----------------------------------------------------------------------------
// Prepara os Edits do Form para Edicao, permitindo que o usuario edite
// as caixas de texto.
//
// Ativa tambem o procedimento OnChange dos Edits fazendo com que o procedimento
// de inclusao ou alteracao so seja realizado se a condicao determinada
// no procedimento EDITSCHANGE for verdadeira.
// -----------------------------------------------------------------------------

procedure TfrmFuncionarios.EditsActivate(Sender: TObject);
begin
   inherited;

   // Reabilita os Edits permitindo edicao e TabStop
   edtNome.ReadOnly := false;
   edtEndereco.ReadOnly := false;
   edtTelefone.ReadOnly := false;
   edtCelular.ReadOnly := false;
   edtSenha.ReadOnly := false;

   edtNome.TabStop := true;
   edtEndereco.TabStop := true;
   edtTelefone.TabStop := true;
   edtCelular.TabStop := true;
   edtSenha.TabStop := true;

   // Ativa o evento OnChange dos Edits
   edtNome.OnChange := EditsChange;
   edtEndereco.OnChange := EditsChange;
   edtTelefone.OnChange := EditsChange;
   edtCelular.OnChange := EditsChange;
   edtSenha.OnChange := EditsChange;

   edtNome.SetFocus;

end;

// -----------------------------------------------------------------------------
// Prepara os Edits para nao receber Foco apos um procedimento de Inclusao
// ou alteracao.
// -----------------------------------------------------------------------------

procedure TfrmFuncionarios.EditsDeActivate(Sender: TObject);
begin
   inherited;

   // Desativa o evento OnChange dos Edits
   edtNome.OnChange := nil;
   edtEndereco.OnChange := nil;
   edtTelefone.OnChange := nil;
   edtCelular.OnChange := nil;
   edtSenha.OnChange := nil;

   // Configura os Edits para somente leitura
   edtNome.ReadOnly := true;
   edtEndereco.ReadOnly := true;
   edtTelefone.ReadOnly := true;
   edtCelular.ReadOnly := true;
   edtSenha.ReadOnly := true;

   edtNome.TabStop := false;
   edtEndereco.TabStop := false;
   edtTelefone.TabStop := false;
   edtCelular.TabStop := false;
   edtSenha.TabStop := false;

end;

// -----------------------------------------------------------------------------
// Procedimento executado ao se clicar no botao NOVO
//
// Prepara o formulario (limpa) para receber os dados do Funcionario.
// -----------------------------------------------------------------------------

procedure TfrmFuncionarios.Proc_Novo(Sender: TObject);
begin
   inherited;

   edtCodigo.Text := 'Indefinido';

   // Limpa os Edits
   edtNome.Clear;
   edtEndereco.Clear;
   edtTelefone.Clear;
   edtCelular.Clear;
   edtSenha.Clear;

end;

// -----------------------------------------------------------------------------
// Procedimento executado ao se clicar no botao EXCLUIR
// -----------------------------------------------------------------------------

procedure TfrmFuncionarios.Proc_Excluir(Sender: TObject);
begin
   inherited;

   if MessageBox(0,'Apagar o funcionario selecionado?','Atenção!',MB_YESNO + MB_ICONERROR) = ID_YES then begin
      dmPrincipal.conn.Execute('DELETE * FROM funcionarios WHERE codigo=' + qry01.FieldByName('id').AsString);
      AtivaQuery;
   end;

end;

// -----------------------------------------------------------------------------
// Procedimento executado ao se clicar no botao OK
//
// Insere ou Altera o cadastro de um funcionario
// -----------------------------------------------------------------------------

procedure TfrmFuncionarios.Proc_Gravar(Sender: TObject);
var
   sNome_func,
   sEndereco,
   sFone,
   sCelular,
   sCodigo,
   sSenha,
   sSQL: string;

begin
   inherited;

   // Pega os valores dos campos Edit
   sNome_Func := QuotedStr(edtNome.Text);
   sEndereco := QuotedStr(edtEndereco.Text);
   sFone := QuotedStr(edtTelefone.Text);
   sCelular := QuotedStr(edtCelular.Text);
   sSenha := QuotedStr(edtSenha.Text);

   sCodigo := qry01.FieldByName('id').AsString;

   case MododeGravacao of
      mInclusao  : sSQL := 'INSERT INTO funcionarios (nome,endereco,telefone,celular,senha) VALUES (%s,%s,%s,%s,%s)';
      mAlteracao : sSQL := 'UPDATE funcionarios SET nome=%s, endereco=%s, telefone=%s, celular=%s, senha=%s WHERE codigo='+sCodigo;
   end;

   // Executa o comando na base de dados
   dmPrincipal.conn.Execute(Format(sSQL,[sNome_Func, sEndereco, sFone, sCelular, sSenha]));

   // Atualiza a visualizacao
   AtivaQuery;

   // Localiza na tabela o registro Inserido ou Atualizado
   qry01.FindFirst;
   qry01.Locate('nome',sNome_Func,[loPartialKey]);

end;

// -----------------------------------------------------------------------------
// Procedimento executado apos a abertura da Query (consulta de dados no Banco
// de dados).
//
// Limpa os dados dos EDITS caso nao haja nenhum registro na tabela
// -----------------------------------------------------------------------------

procedure TfrmFuncionarios.ADOQueryAfterOpen(DataSet: TDataSet);
begin
   inherited;
   
   if ( DataSet.RecordCount = 0) then begin
      edtCodigo.Clear;
      edtNome.Clear;
      edtEndereco.Clear;
      edtTelefone.Clear;
      edtCelular.Clear;
      edtSenha.Clear;
   end;

end;

// -----------------------------------------------------------------------------
// Procedimento executado apos percorrer entre os registros da tabela
//
// Atualiza as informacoes dos EDITS com as do registro atualmente selecionado.
// -----------------------------------------------------------------------------

procedure TfrmFuncionarios.qry01AfterScroll(DataSet: TDataSet);
begin
  inherited;

   edtCodigo.Text := qry01.FieldByName('id').AsString;
   edtNome.Text := qry01.FieldByName('nome').AsString;
   edtEndereco.Text := qry01.FieldByName('endereco').AsString;
   edtTelefone.Text := qry01.FieldByName('telefone').AsString;
   edtCelular.Text := qry01.FieldByName('celular').AsString;
   edtSenha.Text := qry01.FieldByName('senha').AsString;

end;

// -----------------------------------------------------------------------------
// Procedimento executado a cada tecla pressionada nos EDITS
//
// Habilita ou desabilita o botao OK de acordo com a condicao especificada
// -----------------------------------------------------------------------------

procedure TfrmFuncionarios.EditsChange(Sender: TObject);
begin

   // Pelo menos Nome e Senha devem ser informados
   //CgBtnGravarState( ( edtNome.Text <> '' ) and ( edtSenha.Text <> '' ) );

end;

// -----------------------------------------------------------------------------
// Procedimento executado ao se digitar na EDIT de localizacao
//
// Localiza na tabela o registro digitado.
// -----------------------------------------------------------------------------

procedure TfrmFuncionarios.edtLocalizarChange(Sender: TObject);
begin
   // inherited;

   qry01.FindFirst;

   if ( edtLocalizar.Text <> '' ) then
      qry01.Locate('nome',edtLocalizar.Text,[loPartialKey]);

end;

end.
