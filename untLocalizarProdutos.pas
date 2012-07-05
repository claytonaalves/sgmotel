unit untLocalizarProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untProto02, StdCtrls, Buttons, DB, Grids, DBGrids, ADODB,
  ExtCtrls, BmsXPButton, XiPanel, AdvEdit;

type
  TfrmLocalizarProdutos = class(TfrmProto02)
    qryProdutos: TADOQuery;
    dsProdutos: TDataSource;
    XiPanel1: TXiPanel;
    lbl04: TLabel;
    Shape1: TShape;
    grdMov_Produtos: TDBGrid;
    edtLocalizar: TEdit;
    fldCodigo: TXiPanel;
    XiPanel3: TXiPanel;
    fldNome: TXiPanel;
    AdvEdit3: TAdvEdit;

    procedure qryProdutosAfterScroll(DataSet: TDataSet);
    procedure edtLocalizarChange(Sender: TObject);
    procedure edtQtdeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryProdutosAfterOpen(DataSet: TDataSet);

  private
    { Private declarations }

  public
    sCod_Prod: string;

  end;

var
  frmLocalizarProdutos: TfrmLocalizarProdutos;

implementation

uses untDM;

{$R *.dfm}

// -----------------------------------------------------------------------------

procedure TfrmLocalizarProdutos.FormShow(Sender: TObject);
begin
   inherited;
   MudaEstadoBtnOk(false);
end;

// -----------------------------------------------------------------------------

procedure TfrmLocalizarProdutos.qryProdutosAfterScroll(DataSet: TDataSet);
begin
   inherited;

   //lblNome.Caption := grdProdutos.Fields[1].text;
   sCod_Prod := qryProdutos.Fields[0].Text;

end;

// -----------------------------------------------------------------------------

procedure TfrmLocalizarProdutos.edtLocalizarChange(Sender: TObject);
begin
  inherited;

   if not qryProdutos.Bof then
      qryProdutos.FindFirst;

   if ( edtLocalizar.Text <> '' ) then
      qryProdutos.Locate('nome',edtLocalizar.Text,[loPartialKey]);

end;

// -----------------------------------------------------------------------------

procedure TfrmLocalizarProdutos.edtQtdeChange(Sender: TObject);
begin
  inherited;

   MudaEstadoBtnOk( ( edtQtde.Text <> '' ) );

end;

procedure TfrmLocalizarProdutos.qryProdutosAfterOpen(DataSet: TDataSet);
begin
  inherited;

   if (DataSet.RecordCount > 0) then begin

      with DataSet do begin
         TNumericField(Fields[2]).DisplayFormat := '#,##0.00';
      end;

   end;

end;

end.
