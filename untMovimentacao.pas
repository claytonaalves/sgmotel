unit untMovimentacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untProto01, StdCtrls, Buttons, Grids, DBGrids, DB, ADODB,
  ComCtrls, ExtCtrls, PngBitBtn, ZAbstractRODataset, ZDataset;

type
  TfrmMovimentacao = class(TfrmProto01)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Shape13: TShape;
    Memo1: TMemo;
    Shape2: TShape;
    Label3: TLabel;
    ZReadOnlyQuery1: TZReadOnlyQuery;
    ComboBox1: TComboBox;
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

end.
