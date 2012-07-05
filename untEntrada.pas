unit untEntrada;

interface

uses
  Windows, Messages, SysUtils, StrUtils, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untProto02, StdCtrls, ExtCtrls, Buttons, PngBitBtn, Mask;

type
  TfrmEntrada = class(TfrmProto02)
    Shape1: TShape;
    lbl01: TLabel;
    Shape3: TShape;
    lbl03: TLabel;
    Bevel1: TBevel;
    lblApto: TLabel;
    lbl02: TLabel;
    lblTipo: TLabel;
    Shape2: TShape;
    lbl04: TLabel;
    edtVeiculo: TEdit;
    Shape4: TShape;
    Shape5: TShape;
    Label1: TLabel;
    edtHora: TMaskEdit;
    edtData: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);

    procedure EditsChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sSaidaPrev: string;

  end;

var
  frmEntrada: TfrmEntrada;

implementation

uses untDM;

{$R *.dfm}

// -----------------------------------------------------------------------------

procedure TfrmEntrada.FormCreate(Sender: TObject);
begin
  inherited;
  edtData.Text := FormatDateTime('dd/mm/yyyy', Date);
  edtHora.Text := TimeToStr(Time);
end;

// -----------------------------------------------------------------------------

procedure TfrmEntrada.btnOkClick(Sender: TObject);
const sql = 'INSERT INTO movimentacao (apartamento,tipo,entrada,veiculo,aberto_por) VALUES ("%s","%s","%s","%s","%s")';
var
  apto, tipo, entrada, veiculo, aberto_por, sql_query: string;
  dt_entrada: TDateTime;
begin
  apto := lblApto.Caption;
  tipo := lblTipo.Caption;
  veiculo := edtVeiculo.Text;
  aberto_por := operador;

  dt_entrada := StrToDateTime(edtData.Text+' '+edtHora.Text);
  entrada := FormatDateTime('yyyy-mm-dd hh:nn:ss', dt_entrada);

  sql_query := Format(sql, [apto, tipo, entrada, veiculo, aberto_por]);
  dmPrincipal.zconn.ExecuteDirect(sql_query);
  ModalResult := mrOk;
end;

procedure TfrmEntrada.EditsChange(Sender: TObject);
begin
  MudaEstadoBtnOk((edtVeiculo.Text<>'') and (edtHora.Text<>'') and (edtData.Text<>''));
end;

end.
