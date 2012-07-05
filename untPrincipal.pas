unit untPrincipal;

interface

uses
  Windows, Messages, SysUtils, StrUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGrids, ExtCtrls, DB, ADODB, StdCtrls, Buttons, XiPanel, untClasses;

type
  TfrmPrincipal = class(TForm)
    mnuPrincipal: TMainMenu;
    mnuCadastro: TMenuItem;
    mnuFuncionarios: TMenuItem;
    mnuProdutos: TMenuItem;
    mnuSep01: TMenuItem;
    mnuTiposApto: TMenuItem;
    mnuApartamentos: TMenuItem;
    qryAptos: TADOQuery;
    mnuMovimentacoes: TMenuItem;
    mnuSair: TMenuItem;
    Timer1: TTimer;
    Bevel1: TBevel;
    Panel1: TPanel;
    Label1: TLabel;
    lblHora: TLabel;
    PopupMenu1: TPopupMenu;
    Lanamento1: TMenuItem;
    Label4: TLabel;
    BitBtn1: TBitBtn;

    procedure CriaTabela;
    procedure mnuProdutosClick(Sender: TObject);
    procedure mnuFuncionariosClick(Sender: TObject);
    procedure mnuTiposAptoClick(Sender: TObject);
    procedure mnuApartamentosClick(Sender: TObject);

    procedure MudaStatusBotoes(lEnt, lCon, lSai: boolean);
    procedure btnAberturaClick(Sender: TObject);
    procedure qryAptosAfterScroll(DataSet: TDataSet);
    procedure grdMovimentoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);

    procedure qryAptosAfterOpen(DataSet: TDataSet);
    procedure btnConsumoClick(Sender: TObject);
    procedure btnFechamentoClick(Sender: TObject);
    procedure mnuMovimentacoesClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ConfigurarApto1Click(Sender: TObject);
    procedure XiPanel15MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure Lanamento1Click(Sender: TObject);

    procedure SetaVariaveisApto(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Apto_DuploClique(Sender: TObject);
    procedure mnuSairClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  oApto: array [1..35] of TApto;
  iAptoAtual: integer;


implementation

uses untProdutos, untDM, untFuncionarios, untApartamentos, untTiposApto, untEntrada,
     untFechamento, untMovimentacao, untLogin, untConfApto, untResumo;

{$R *.dfm}

// -----------------------------------------------------------------------------

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin

   //CriaTabela;

   BitBtn1.Glyph := bmpOk;

end;

// =============================================================================

procedure TfrmPrincipal.CriaTabela;
var
   iTopo, iCounter01, iCounter02, i: integer;

begin

   i := 1;

   for iCounter01 := 0 to 8 do begin

      iTopo := 16 + (iCounter01 * 75);

      for iCounter02 := 0 to 4 do begin

         // Cria o Objeto Apto que mostra os paineis na janela
         oApto[i] := TApto.Cria(Self);
         oApto[i].Numero := i;
         oApto[i].Left := 16 + (iCounter02 * 150);
         oApto[i].Top := iTopo;
         //oApto[i].OnMouseMove2 := SetaVariaveisApto;
         oApto[i].OnDuploClique := Apto_DuploClique;
         oApto[i].Visible := true;

         oApto[i].Menu := PopupMenu1;

         // Filtra a Query para o numero do Apto em foco
         qryAptos.Filter := 'numero=' + IntToStr(i);
         qryAptos.Filtered := true;

         // Se o Apto estiver ativo
         if ( qryAptos.FieldByName('situacao').AsString <> 'I' ) then begin

            oApto[i].Situacao := LIVRE;
            oApto[i].Tipo := qryAptos.FieldByName('nome').AsString;

            if ( qryAptos.FieldByName('situacao').AsString = 'O' ) then
               oApto[i].Situacao := OCUPADO;

         end;

         qryAptos.Filter := '';
         qryAptos.Filtered := false;


         i := i + 1;

       end;

   end;

end;

// =============================================================================

procedure TfrmPrincipal.SetaVariaveisApto(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin

   if (Sender is TApto) then begin

      iAptoAtual := TApto(Sender).Numero;

   end;

   label4.Caption := inttostr(iAptoAtual);


end;

// =============================================================================

procedure TfrmPrincipal.mnuProdutosClick(Sender: TObject);
begin

   try
      frmProdutos := TfrmProdutos.Create(Self);
      frmProdutos.ShowModal;
   finally
      frmProdutos.Release;
   end;

   frmProdutos := nil;

end;

// =============================================================================

// =============================================================================

procedure TfrmPrincipal.mnuFuncionariosClick(Sender: TObject);
begin

   try
      frmFuncionarios := TfrmFuncionarios.Create(Self);
      frmFuncionarios.ShowModal;
   finally
      frmFuncionarios.Release;
   end;

   frmFuncionarios := nil;

end;

// =============================================================================

procedure TfrmPrincipal.mnuTiposAptoClick(Sender: TObject);
begin

   try
      frmTiposApto := TfrmTiposApto.Create(Self);
      frmTiposApto.ShowModal;
   finally
      frmTiposApto.Release;
   end;

   frmTiposApto := nil;

end;

// =============================================================================

procedure TfrmPrincipal.mnuApartamentosClick(Sender: TObject);
begin

   try
      frmApartamentos := TfrmApartamentos.Create(Self);
      frmApartamentos.ShowModal;
   finally
      frmApartamentos.Release;
   end;

   frmApartamentos := nil;

   {[if qryMovimento.RecordCount > 0 then begin
      //grdMovimento.DataSource := dsMovimento;
   end; }


end;

// =============================================================================

procedure TfrmPrincipal.MudaStatusBotoes(lEnt, lCon, lSai: boolean);
begin


end;

// =============================================================================

procedure TfrmPrincipal.btnAberturaClick(Sender: TObject);
var
   sData, sEnt, sSai, sCodigo, sSit, sVeic: string;

begin

   {try

      sCodigo := qryMovimento.Fields[0].Text;

      frmEntrada := TfrmEntrada.Create(Self);
      frmEntrada.lblApto.caption := qryMovimento.Fields[2].text;
      frmEntrada.lblTipo.Caption := qryMovimento.Fields[3].Text;

      // Mostra o Form
      if ( frmEntrada.ShowModal = mrOk ) then begin

         // Se o usuario pressionar ENTER
         // pega os dados do FORM e atualiza a tabela "movimento"
         sEnt  := QuotedStr(LeftStr(frmEntrada.edtHora.Text,5));
         sSai  := QuotedStr(frmEntrada.sSaidaPrev);
         sData := QuotedStr(FormatDateTime('dd/mm/yyyy', Date()));
         sVeic := QuotedStr(frmEntrada.edtVeiculo.Text);
         sSit  := 'true';

         dmPrincipal.conn.Execute('UPDATE movimento SET situacao=' + sSit +
                                  ', data_ent=' + sData +
                                  ', entrada=' + sEnt +
                                  ', saida=' + sSai +
                                  ', veiculo=' + sVeic +
                                  ' WHERE codigo=' + sCodigo);

         qryMovimento.Active := false;
         qryMovimento.Active := true;

      end
   finally
      frmEntrada.Release;
   end;

   frmEntrada := nil;}

end;

// =============================================================================

procedure TfrmPrincipal.qryAptosAfterScroll(DataSet: TDataSet);
begin
   {if qryMovimento.FieldValues['situacao'] then
      MudaStatusBotoes(false,true,true)
   else
      MudaStatusBotoes(true,false,false);
   }
end;

// =============================================================================

procedure TfrmPrincipal.grdMovimentoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   sRegionType : String;
   iPosY : Integer;
   iPosX : Integer;
   grdGrid: TDBGrid;

begin
   {
   sRegionType := Column.Field.AsString;
   grdGrid := TDBGrid(Sender);


   // Se for a Coluna Situacao
   if ( Column.FieldName = 'situacao' ) then
   begin

      // Se o campo contiver "true"
      if ( Column.Field.Value ) then begin
         grdGrid.Canvas.TextRect(rect, rect.Left + 4 + 16 + 4, rect.Top + 2, 'Ocupado');

         iPosY := ((rect.Bottom-rect.Top) div 2) - bmpOcupado.Height div 2;
         iPosX := ((16 div 2 ) - bmpOcupado.Width div 2);

         grdGrid.Canvas.Draw(rect.Left + 4 + iPosX, rect.Top + iPosY, bmpOcupado);
      end

      else begin
         grdGrid.Canvas.TextRect(rect, rect.Left + 4 + 16 + 4, rect.Top + 2, 'Livre');

         iPosY := ((rect.Bottom-rect.Top) div 2) - bmpLivre.Height div 2;
         iPosX := ((16 div 2 ) - bmpLivre.Width div 2);

         grdGrid.Canvas.Draw(rect.Left + 4 + iPosX, rect.Top + iPosY, bmpLivre)
      end

   end {if ...}

   //else begin
   //   grdGrid.Canvas.TextRect(rect, rect.Left + 5 , rect.Top + 2, sRegionType);
   //end;


end;

// =============================================================================

procedure TfrmPrincipal.qryAptosAfterOpen(DataSet: TDataSet);
begin

   {if ( qryMovimento.RecordCount > 0 ) then begin

      with DataSet do begin
         TNumericField(Fields[11]).DisplayFormat := '#,##0.00';
         TNumericField(Fields[4]).DisplayFormat := '#,##0.00';
         TNumericField(Fields[7]).DisplayFormat := '#,##0.00';
      end;

      qryMovimento.AfterScroll := qryMovimentoAfterScroll;
      //grdMovimento.DataSource := dsMovimento;

   end;
   }
end;

// =============================================================================

procedure TfrmPrincipal.btnConsumoClick(Sender: TObject);
begin
   {
   try
      frmConsumo := TfrmConsumo.Create(Self);

      frmConsumo.sCod_Movimento := qryMovimento.Fields[0].Text;
      frmConsumo.lblApto.Caption := qryMovimento.Fields[2].Text;
      frmConsumo.lblTipo.Caption := qryMovimento.Fields[3].Text;
      frmConsumo.lblEntrada.Caption := qryMovimento.Fields[5].Text;
      frmConsumo.lblSaida.Caption := qryMovimento.Fields[6].Text;
      frmConsumo.lblVeiculo.Caption := qryMovimento.Fields[8].Text;
      frmConsumo.cValor_Apto := qryMovimento.Fields[4].Value;

      frmConsumo.ShowModal;

   finally
      frmConsumo.Release;
   end;

   frmConsumo := nil;

   qryMovimento.Active := false;
   qryMovimento.Active := true;
   }
end;

// =============================================================================

procedure TfrmPrincipal.btnFechamentoClick(Sender: TObject);
begin
   {
   try
      frmFechamento := TfrmFechamento.Create(Self);

      frmFechamento.sCod_Movimento := qryMovimento.Fields[0].Text;
      frmFechamento.cValor_Apto := qryMovimento.Fields[4].Value;

      frmFechamento.sCod_Apto := qryMovimento.Fields[9].Text;
      frmFechamento.sData_Ent := qryMovimento.Fields[10].Text;
      frmFechamento.sEntrada  := qryMovimento.Fields[5].Text;
      frmFechamento.sVeiculo  := qryMovimento.Fields[8].Text;

      frmFechamento.lblApto.Caption := qryMovimento.Fields[2].Text;
      frmFechamento.lblTipo.Caption := qryMovimento.Fields[3].Text;
      frmFechamento.lblEntrada.Caption := qryMovimento.Fields[5].Text;
      frmFechamento.lblVeiculo.Caption := qryMovimento.Fields[8].Text;

      //frmConsumo.cValor_Apto := qryMovimento.Fields[4].Value;

      if frmFechamento.ShowModal = mrOk then begin
         qryMovimento.Active := false;
         qryMovimento.Active := true;
      end;

   finally
      frmFechamento.Release;
   end;

   frmFechamento := nil;
   }
end;

// =============================================================================

procedure TfrmPrincipal.mnuMovimentacoesClick(Sender: TObject);
begin

   try
      frmMovimentacao := TfrmMovimentacao.Create(Self);
      frmMovimentacao.ShowModal;
   finally
      frmMovimentacao.Release;
   end;

   frmMovimentacao := nil;

end;

// =============================================================================

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
   lblHora.Caption := FormatDateTime('hh:nn:ss', Time());
end;

// =============================================================================

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
   {frmLogin := TFrmLogin.Create(Self);

   try
      if frmLogin.ShowModal <> mrOk then
         Application.Terminate;
   finally
      frmLogin.Release;
   end;

   frmLogin := nil;

   Caption := Caption + sOperador;}
end;

// =============================================================================

procedure TfrmPrincipal.ConfigurarApto1Click(Sender: TObject);
var
   sTest: string;

begin
   sTest := Sender.ClassName;

   Messagebox(0,PChar(sTest),'',0);

end;

// =============================================================================

procedure TfrmPrincipal.XiPanel15MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   PopupMenu1.Items[0].Caption := 'Configurar apto 01';
end;

// =============================================================================
// Evento disparado quando o usuario pressiona
// o menu popup de Configuracoes do apartamento
// =============================================================================

procedure TfrmPrincipal.Lanamento1Click(Sender: TObject);
begin

    // Cria o Form
    frmConfApto := TFrmConfApto.Create(Self);
    frmConfApto.Apto := oApto[iAptoAtual];

    try
       frmConfApto.ShowModal;

    finally
       frmConfApto.Release;
       frmConfApto := nil;

    end;
end;

// =============================================================================

procedure TfrmPrincipal.Apto_DuploClique(Sender: TObject);
begin

   // Gambiarra pro duplo-clique funcionar no TLabel
   if ( Sender is TApto ) then
      iAptoAtual := TApto(Sender).Numero
   else if ( Sender is TLabel ) then begin
      with TLabel(Sender) do begin
          iAptoAtual := TApto(Owner).Numero;
      end;
   end;


   // Se o Apto estiver ATIVO
   if ( oApto[iAptoAtual].Situacao <> INATIVO ) then begin

      // Se o Apto estiver LIVRE
      if ( oApto[iAptoAtual].Situacao = LIVRE ) then begin

         frmEntrada := TfrmEntrada.Create(Self);
         frmEntrada.Apartamento := oApto[iAptoAtual];

         try
            frmEntrada.ShowModal;
         finally
            frmEntrada.Release;
            frmEntrada := nil;
         end;

      end

      // Se o Apto estiver OCUPADO
      else begin

         frmResumo := TFrmResumo.Create(Self);
         frmResumo.Apartamento := oApto[iAptoAtual];

         try
            frmResumo.ShowModal;
         finally
            frmResumo.Release;
            frmResumo := nil;
         end;

      end;

   end;

end;

procedure TfrmPrincipal.mnuSairClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
begin
   Lanamento1Click(self);
end;

end.
