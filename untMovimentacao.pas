unit untMovimentacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untProto01, StdCtrls, Buttons, Grids, DBGrids, DB, ADODB;

type
  TfrmMovimentacao = class(TfrmProto01)
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    DBGrid1: TDBGrid;
    btnCancelar: TBitBtn;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    procedure ADOQuery1AfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMovimentacao: TfrmMovimentacao;

implementation

uses untDM;

{$R *.dfm}

procedure TfrmMovimentacao.ADOQuery1AfterOpen(DataSet: TDataSet);
begin
   inherited;

   if ( DataSet.RecordCount > 0 ) then begin

      with DataSet do begin
         TNumericField(Fields[4]).DisplayFormat := '#,##0.00';
         TNumericField(Fields[5]).DisplayFormat := '#,##0.00';
      end;

   end;

end;

end.
