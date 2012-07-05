unit untLocalizarProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untProto02, StdCtrls, Buttons, DB, Grids, DBGrids, ADODB,
  ExtCtrls, PngBitBtn, ZAbstractRODataset, ZDataset;

type
  TfrmLocalizarProdutos = class(TfrmProto02)
    grdProdutos: TDBGrid;
    dsProdutos: TDataSource;
    Bevel2: TBevel;
    Shape1: TShape;
    Shape3: TShape;
    lblCodigo: TLabel;
    lblQtde: TLabel;
    lblNome: TLabel;
    edtQtde: TEdit;
    qProdutos: TZReadOnlyQuery;
    Bevel1: TBevel;
    Timer1: TTimer;

    procedure QueryAfterScroll(DataSet: TDataSet);
    procedure Localizar;

    procedure edtLocalizarChange(Sender: TObject);
    procedure edtQtdeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdProdutosKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure grdProdutosDblClick(Sender: TObject);

  private
    { Private declarations }
    BufferLocalizar: string;

  public
    sCod_Prod: string;

  end;

var
  frmLocalizarProdutos: TfrmLocalizarProdutos;

implementation

uses untDM;

{$R *.dfm}

{ TODO : Buscar produtos ao digitar algo dentro da grade }

// -----------------------------------------------------------------------------

procedure TfrmLocalizarProdutos.FormShow(Sender: TObject);
begin
   inherited;
   MudaEstadoBtnOk(false);
end;

// -----------------------------------------------------------------------------

procedure TfrmLocalizarProdutos.QueryAfterScroll(DataSet: TDataSet);
begin
  inherited;

  lblNome.Caption := qProdutos.FieldByName('nome').AsString;
end;

// -----------------------------------------------------------------------------

procedure TfrmLocalizarProdutos.edtLocalizarChange(Sender: TObject);
begin
  inherited;

//   if not qryProdutos.Bof then
//      qryProdutos.FindFirst;

{   if ( edtLocalizar.Text <> '' ) then
      qryProdutos.Locate('nome',edtLocalizar.Text,[loPartialKey]);
}
end;

// -----------------------------------------------------------------------------

procedure TfrmLocalizarProdutos.edtQtdeChange(Sender: TObject);
begin
//  inherited;
  MudaEstadoBtnOk( ( edtQtde.Text <> '' ) );
end;

procedure TfrmLocalizarProdutos.grdProdutosKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key in ['a'..'z', 'A'..'Z', '0'..'9']) then
  begin
     BufferLocalizar := BufferLocalizar + UpperCase(Key);
     Timer1.Enabled := true;
     Localizar;
  end
  else begin
    BufferLocalizar := '';
    Timer1.Enabled := false;
  end;
end;

procedure TfrmLocalizarProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  BufferLocalizar := '';
end;

procedure TfrmLocalizarProdutos.Timer1Timer(Sender: TObject);
begin
  BufferLocalizar := '';
  Timer1.Enabled := false;
end;

procedure TfrmLocalizarProdutos.Localizar;
begin
  qProdutos.FindFirst;
  qProdutos.Locate('nome', BufferLocalizar, [loPartialKey]);
end;

procedure TfrmLocalizarProdutos.grdProdutosDblClick(Sender: TObject);
begin
  inherited;
  edtQtde.Text := '1';
  ModalResult := mrOk;
end;

end.
