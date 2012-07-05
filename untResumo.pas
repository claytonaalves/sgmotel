unit untResumo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untProto01, Grids, DBGrids, StdCtrls, StrUtils, ExtCtrls, Buttons, DB,
  ADODB, Math, XiPanel, BmsXPButton, untClasses;

type
  TfrmResumo = class(TfrmProto01)
    XiPanel1: TXiPanel;
    Label2: TLabel;
    lblConsumo: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    lblValor_Apto: TLabel;
    lblTotal: TLabel;
    lbl01: TLabel;
    lblApto: TLabel;
    lbl02: TLabel;
    lblTipo: TLabel;
    lbl04: TLabel;
    lblEntrada: TLabel;
    lbl03: TLabel;
    Label5: TLabel;
    lblTranscorrido: TLabel;
    lblVeiculo: TLabel;
    BmsXPButton1: TBmsXPButton;
    BmsXPButton2: TBmsXPButton;
    Label14: TLabel;
    Shape4: TShape;
    Label17: TLabel;
    Shape5: TShape;
    Label4: TLabel;
    Shape6: TShape;
    Shape7: TShape;
    grdMov_Produtos: TDBGrid;
    btnOk: TBmsXPButton;
    btnCancelar: TBmsXPButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtDesconto: TEdit;
    edtDesconto2: TEdit;
    Label6: TLabel;
    Shape2: TShape;
    Shape1: TShape;
    Shape3: TShape;
    Label10: TLabel;

    procedure btnLocProdClick(Sender: TObject);
    procedure qryMov_ProdutosAfterOpen(DataSet: TDataSet);
    procedure btnExcProdClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
    sCod_Movimento: string;
    cValor_Apto: currency;

    Apartamento: TApto;

  end;

var
  frmResumo: TfrmResumo;
  iCounter: currency;


implementation

uses untDM, untLocalizarProdutos;

{$R *.dfm}

// =============================================================================
// =============================================================================

procedure TfrmResumo.FormShow(Sender: TObject);
var
   h1, h2, iTrans, iMin: integer;
   sHora: string;
   fValor: real;

   rRegistro: _RecordSet;

   dTest: TDateTime;

begin
   inherited;

   Caption := 'Informações do Apartamento ' + Apartamento.sNumero;
   lblApto.Caption := Apartamento.sNumero;
   lblTipo.Caption := Apartamento.sNumero;
   lblEntrada.Caption := LeftStr(TimeToStr(Apartamento.Hora_Entrada),5);
   lblTranscorrido.Caption := DateToStr(Date() - Apartamento.Data_Entrada);

   dTest := StrToDateTime(DateToStr(Apartamento.Data_Entrada) + ' ' + TimeToStr(Apartamento.Hora_Entrada));

   //lblTranscorrido.Caption := DateToStr(dTest - );

   rRegistro := dmPrincipal.conn.Execute('SELECT valor01 FROM aptos_tipos WHERE nome="' + Apartamento.Tipo + '"');

   fValor := rRegistro.Fields[0].Value;
   lblValor_Apto.Caption := 'R$ ' + Trim(format('%10.2f',[fValor]));

   // Calcula o tempo decorrido da entrada
   sHora := FormatDateTime('hh:nn', Time());

   h1 := StrToInt(Copy(lblEntrada.Caption,1,2))*60 + StrToInt(Copy(lblEntrada.Caption,4,2));
   h2 := StrToInt(Copy(sHora,1,2))*60 + StrToInt(Copy(sHora,4,2));

   iTrans := h2 - h1;

   //lblTranscorrido.Caption := IntToStr(iTrans) + ' minutos';


   // Seleciona os produtos do Apartamento em questao
   //qryMov_Produtos.SQL.Text := 'SELECT M.num_produto, P.codigo, P.nome, M.quantidade, P.valor, (M.quantidade * P.valor) ' +
   //                            'FROM produtos P, movimento_produtos M ' +
   //                            'WHERE M.ativo=true AND P.codigo=M.cod_produto AND M.cod_movimento=' + sCod_Movimento;

   //qryMov_Produtos.Open;


   //lblValor_Apto.Caption := Format('%m', [cValor_Apto]);
   //lblTotal.Caption := Format('%m', [cValor_Apto + iCounter]);

end;

// -----------------------------------------------------------------------------

procedure TfrmResumo.btnLocProdClick(Sender: TObject);
var
   sNum_Prod, sCod_Prod, sQtde: string;
   i, iEstoque: integer;

begin
  inherited;

   try
      frmLocalizarProdutos := TfrmLocalizarProdutos.Create(Self);

      // Abre a janela para selecionar produto e quantidade
      // Executa o procedimento de insercao caso o usuario tecle
      // Enter
      if ( frmLocalizarProdutos.ShowModal = mrOk) then begin

         i := 1;

         // Pega o codigo do ultimo produto lancado
         //if ( qryMov_Produtos.RecordCount > 0 ) then begin
         //   qryMov_Produtos.FindLast;
         //   i := qryMov_Produtos.Fields[0].Value + 1;
         //end;

         sNum_Prod := QuotedStr(IntToStr(i));
         sCod_Prod := QuotedStr(frmLocalizarProdutos.sCod_Prod);
         sQtde := QuotedStr(frmLocalizarProdutos.edtQtde.Text);

         dmPrincipal.conn.Execute('INSERT INTO movimento_produtos (ativo,cod_movimento,num_produto,cod_produto,quantidade) ' +
                                  'VALUES (' + 'true' + ',' + QuotedStr(sCod_Movimento) + ',' + sNum_Prod + ',' + sCod_Prod + ',' + sQtde + ')');

         //qryMov_Produtos.Active := false;
         //qryMov_Produtos.Active := true;
      end;

   finally
      frmLocalizarProdutos.Release;
   end;

   frmLocalizarProdutos := nil;

end;

// -----------------------------------------------------------------------------

procedure TfrmResumo.btnExcProdClick(Sender: TObject);
var
   sCod_Prod, sNum_Prod: string;

begin
   inherited;

   //sCod_Prod := qryMov_Produtos.Fields[1].Text;
   //sNum_Prod := qryMov_Produtos.Fields[0].Text;

   if MessageBox(0,'Apagar o produto selecionado?','Atenção!',MB_YESNO + MB_ICONERROR) = ID_YES then begin

      // Apaga o Produto selecionado
      dmPrincipal.conn.Execute('DELETE * FROM movimento_produtos WHERE ativo=true AND cod_movimento=' + sCod_Movimento + ' AND num_produto=' + sNum_Prod );

      //qryMov_Produtos.Active := false;
      //qryMov_Produtos.Active := true;

   end;

end;

// -----------------------------------------------------------------------------

procedure TfrmResumo.qryMov_ProdutosAfterOpen(DataSet: TDataSet);
begin
   inherited;

    if (DataSet.RecordCount > 0) then begin
       //btnExcProd.Enabled := true;

      with DataSet do begin
         TNumericField(Fields[4]).DisplayFormat := '#,##0.00';
         TNumericField(Fields[5]).DisplayFormat := '#,##0.00';
      end;

      iCounter := 0;

      while not DataSet.Eof do begin
         iCounter := iCounter + DataSet.Fields[5].Value;
         DataSet.Next;
      end;

      lblConsumo.Caption := Format('%m', [iCounter]);
      lblTotal.Caption := Format('%m', [cValor_Apto + iCounter]);

   end
   else
      //btnExcProd.Enabled := false;


end;

// -----------------------------------------------------------------------------

procedure TfrmResumo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
   //dmPrincipal.conn.Execute('UPDATE movimento SET consumo=' + QuotedStr(lblConsumo.Caption) + ' WHERE codigo=' + sCod_Movimento);

end;

end.
