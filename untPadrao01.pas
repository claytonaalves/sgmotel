unit untPadrao01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, ActnList,
  XiPanel, BmsXPButton, AdvEdit, BmsXPLabel, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, XiButton;


type
  TModoForm = (mfConsulta, mfEdicao);
  TModoGravacao = (mInclusao, mAlteracao);

  TColunaSelecionada = class
     public
        Cabecalho: TXiPanel;
        Coluna: TColumn;
        OrdenaPor: ShortString;
        Sentido: byte; // 0 Ascendente, 1 Descendente
  end;

  TfrmPadrao01 = class(TForm)
    ds01: TDataSource;
    qry01: TZQuery;
    XiPanel1: TXiPanel;
    grd01: TDBGrid;
    edtLocalizar: TAdvEdit;
    XiButton1: TXiButton;
    XiButton3: TXiButton;
    XiButton4: TXiButton;
    XiButton2: TXiButton;

    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CgBtnState(lNovo, lAlterar, lExcluir, lImprimir, lFechar: Boolean);

    procedure ADOQueryAfterOpen(DataSet: TDataSet); virtual;
    procedure AtivaQuery;

    procedure EditsChange(Sender: TObject); virtual; abstract;
    procedure edtLocalizarChange(Sender: TObject); virtual; abstract;
    procedure qry01AfterScroll(DataSet: TDataSet); virtual; abstract;


    procedure Proc_Novo(Sender: TObject); virtual;
    procedure Proc_Alterar(Sender: TObject); virtual;
    procedure Proc_Excluir(Sender: TObject); virtual; abstract;
    procedure Proc_Imprimir(Sender: TObject); virtual; abstract;
    procedure Proc_Gravar(Sender: TObject); virtual;
    procedure Proc_Cancelar(Sender: TObject); virtual;

    procedure SelecionaTEdit(Sender: TObject);
    procedure edtLocalizarKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    { Private declarations }
      ModoFormulario: TModoForm;

      procedure PreparaFormParaEdicao;
      procedure PreparaFormParaConsulta;

  public
    { Public declarations }
    MododeGravacao: TModoGravacao;

  end;

var
  frmPadrao01: TfrmPadrao01;

implementation

uses untDM;

{$R *.dfm}

// -----------------------------------------------------------------------------
// Procedimento executado ao se criar o Form
//
// Carrega os Glyphs nos Botoes
// -----------------------------------------------------------------------------

procedure TfrmPadrao01.FormCreate(Sender: TObject);
begin
   qry01.Active := true;

   btnNovo.Glyph := bmpNovo;
   btnAlterar.Glyph := bmpEditar;
   btnExcluir.Glyph := bmpExcluir;
   btnFechar.Glyph := bmpCancel;

   ModoFormulario := mfConsulta;

end;

// -----------------------------------------------------------------------------
// Altera o estado dos botoes inferiores
// -----------------------------------------------------------------------------

procedure TfrmPadrao01.CgBtnState(lNovo, lAlterar, lExcluir, lImprimir, lFechar: Boolean);
begin

   case ModoFormulario of
   mfConsulta:
      begin
         btnNovo.Visible := true;
         btnFechar.Visible := true;

         // Restaura as propriedades do botao ALTERAR
         btnAlterar.Caption := '&Alterar';
         btnAlterar.Glyph := bmpEditar;
         btnAlterar.OnClick := Proc_Alterar;  // Procedimento Virtual

         // Restaura as propriedades do botao EXCLUIR
         btnExcluir.Caption := '&Excluir';
         btnExcluir.Glyph := bmpExcluir;
         btnExcluir.OnClick := Proc_Excluir;  // Procedimento Virtual

         btnNovo.Enabled := lNovo;
         btnAlterar.Enabled := lAlterar;
         btnExcluir.Enabled := lExcluir;
         btnFechar.Enabled := lFechar;
      end;

   mfEdicao:
      begin
         btnNovo.Visible := false;
         btnFechar.Visible := false;

         // Muda o botao ALTERAR para GRAVAR
         btnAlterar.Caption := '&Gravar';
         btnAlterar.Glyph := bmpOk;
         btnAlterar.OnClick := Proc_Gravar;  // Procedimento Virtual

         // Muda o botão EXCLUIR pra CANCELAR
         btnExcluir.Caption := '&Cancelar';
         btnExcluir.Glyph := bmpCancel;
         btnExcluir.OnClick := Proc_Cancelar;  // Procedimento Virtual

         btnAlterar.Enabled := lAlterar;
         btnExcluir.Enabled := lExcluir;
      end;
   end;

end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

procedure TfrmPadrao01.edtLocalizarKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if ( Key = VK_DOWN ) or ( Key = VK_UP ) then
      perform(WM_NEXTDLGCTL, 1, 0);

end;

// -----------------------------------------------------------------------------
// Prepara os Edits do Form para Edicao, permitindo que o usuario edite
// as caixas de texto.
//
// Ativa tambem o procedimento OnChange dos Edits fazendo com que o procedimento
// de inclusao ou alteracao so seja realizado se a condicao determinada
// no procedimento EDITSCHANGE for verdadeira.
//
// Os componentes no formulario setados com a tag 1 serao HABILITADOS ao se realizar
// uma edicao no registro.
// Os componentes setados com a tag no valor 2 serao DESABILITADOS ao se editar
// um registro
//
// Tags:
//
//   1 - Componentes de Edicao
//   2 - Componentes de Localizacao e Filtragem
// -----------------------------------------------------------------------------

procedure TfrmPadrao01.PreparaFormParaEdicao;
var
   iCont: integer;
   Componente: TComponent;

begin
   ModoFormulario := mfEdicao;
   grd01.Color := $00F0F0F0;
   grd01.Options := [dgColLines, dgRowLines, dgTabs];
   grd01.Enabled := false;  // Desabilita o Grid
   CgBtnState(false, false, true, false, false);  // Desabilita os botoes NOVO, EXCLUIR e IMPRIMIR

   // Altera as propriedades dos Edits
   for iCont := 0 to ComponentCount-1 do
   begin
      Componente := Components[iCont];

      if ( Componente.Tag > 0 ) then  // Se a tag do componente for diferente de ZERO
      begin
         if ( Componente is TAdvEdit ) then  // Se o componente for EDIT
         begin
            if ( Componente.Tag = 1 ) then  // Ativar
            begin
               with TAdvEdit(Componente) do
               begin
                  ReadOnly := false;
                  TabStop := true;
                  BevelKind := bkTile;
                  OnChange := EditsChange;

                  Color := clWhite;
                  ColorOnEnter := clInfoBk;
               end; {with}

            end {if}

            else if ( Componente.Tag = 2 ) then  // Desativar
            begin
               with TAdvEdit(Componente) do
               begin
                  Enabled := false;
                  Color := clBtnFace;
                  ColorOnEnter := clBtnFace;
               end;
            end;

         end

         // Se o componente for Label
         else if ( Componente is TBmsXPLabel ) then begin
              if ( Componente.Tag = 2 ) then
                 TBmsXPLabel(Componente).Enabled := false;
         end

         // Se o componente for Combo
         else if ( Componente is TComboBox ) then begin

            // Ativar combo
            if ( Componente.Tag = 1 ) then begin
               with TComboBox(Componente) do begin
                  color := clWindow;
                  enabled := true;
                  TabStop := true;
                  OnChange := EditsChange;
               end;
            end

            // Desativar combo
            else if ( Componente.Tag = 2 ) then begin
               with TComboBox(Componente) do begin
                  color := clBtnFace;
                  Enabled := false;
                  TabStop := false;
               end;
            end;

         end;

      end; {if}

   end; {for}

end;

// -----------------------------------------------------------------------------
//
// -----------------------------------------------------------------------------

procedure TfrmPadrao01.PreparaFormParaConsulta;
var
   iCont: integer;
   Componente: TComponent;
   bCondicao: boolean;

begin

   ModoFormulario := mfConsulta;
   grd01.Color := clWindow;
   grd01.Options := [dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgCancelOnExit, dgRowSelect];
   grd01.Enabled := true;  // Habilita o Grid

   bCondicao := ( qry01.RecordCount > 0 );
   CgBtnState(true, bCondicao, bCondicao, false, true);  // Habilita os botoes NOVO, EXCLUIR e IMPRIMIR

   // Altera as propriedades dos Edits
   for iCont := 0 to ComponentCount-1 do begin
      Componente := Components[iCont];

      // Se a tag do componente for diferente de ZERO
      if ( Componente.Tag > 0 ) then begin

         // Se o componente for EDIT
         if ( Componente is TAdvEdit ) then begin

            // Componentes de Edicao
            if ( Componente.Tag = 1 ) then begin

               with TAdvEdit(Componente) do begin
                  ReadOnly := true;
                  TabStop := false;
                  BevelKind := bkSoft;
                  OnChange := nil;

                  Color := clBtnFace;
                  ColorOnEnter := clBtnFace;
               end; {with}

            end {if}

            // Componentes de Consulta
            else if ( Componente.Tag = 2 ) then
            begin
               with TAdvEdit(Componente) do
               begin
                  Enabled := true;
                  Color := clWindow;
                  ColorOnEnter := clInfoBk;
               end;
            end;

         end

         // Se o componente for Label
         else if ( Componente is TBmsXPLabel ) then begin
              if ( Componente.Tag = 2 ) then
                 TBmsXPLabel(Componente).Enabled := true;
         end

         // Se o componente for Combo
         else if ( Componente is TComboBox ) then begin

            // Combos de Edicao
            if ( Componente.Tag = 1 ) then begin
               with TComboBox(Componente) do begin
                  color := clBtnFace;
//                  enabled := false;
                  Text := ''; // Tira a selecao do combo
                  TabStop := false;
                  OnChange := nil;
               end;
            end

            // Combos de Consulta
            else if ( Componente.Tag = 2 ) then begin
               with TComboBox(Componente) do begin
                  color := clWindow;
                  Enabled := true;
                  TabStop := true;
               end;
            end;

         end;

      end; {if}

   end; {for}

//   edtLocalizar.SetFocus;
   grd01.SetFocus;

end;

// -----------------------------------------------------------------------------
// Procedimento executado ao se clicar no botao NOVO
// -----------------------------------------------------------------------------

procedure TfrmPadrao01.Proc_Novo(Sender: TObject);
begin
   MododeGravacao := mInclusao;
   PreparaFormParaEdicao;
end;

// -----------------------------------------------------------------------------
// Procedimento executado ao se clicar no botao ALTERAR
// -----------------------------------------------------------------------------

procedure TfrmPadrao01.Proc_Alterar(Sender: TObject);
begin
   MododeGravacao := mAlteracao;
   PreparaFormParaEdicao;
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

procedure TfrmPadrao01.Proc_Gravar(Sender: TObject);
begin
   PreparaFormParaConsulta;
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

procedure TfrmPadrao01.Proc_Cancelar(Sender: TObject);
begin
   btnExcluir.SetFocus;  // Evita que o edit ao perder o foco fique com a cor branca
   PreparaFormParaConsulta;
   qry01AfterScroll(qry01);
end;

// -----------------------------------------------------------------------------
// Evento disparado apos a abertura da Query
// -----------------------------------------------------------------------------

procedure TfrmPadrao01.ADOQueryAfterOpen(DataSet: TDataSet);
begin

   // Se houver registros
   if ( DataSet.RecordCount > 0 ) then
   begin
      CgBtnState(True, True, True, True, true);
      grd01.OnDblClick := Proc_Alterar;

      edtLocalizar.ReadOnly := false;
      edtLocalizar.TabStop := true;
   end
   else
   begin
      CgBtnState(True, False, False, False, true);
      grd01.OnDblClick := nil;

      edtLocalizar.ReadOnly := true;
      edtLocalizar.TabStop := false;
   end;
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

procedure TfrmPadrao01.AtivaQuery;
begin
   with qry01 do begin
      Active := False;
      Active := True;
   end;

//   edtLocalizar.SetFocus;

end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

procedure TfrmPadrao01.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if ( key = VK_RETURN ) then
   begin
      Key := 0;

      if not (ActiveControl is TAdvEdit ) and not (ActiveControl is TBmsXPButton) then
         perform(WM_NEXTDLGCTL, 0, 0)
   
   end
   else if ( key = VK_ESCAPE ) then
   begin
      Key := 0;
      if ModoFormulario = mfConsulta then
         ModalResult := mrCancel
      else
         Proc_Cancelar(Self);

   end;

end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

procedure TfrmPadrao01.SelecionaTEdit(Sender: TObject);
begin
    (Sender as TEdit).SelectAll;
end;

end.
