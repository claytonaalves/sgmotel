unit untLancamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untProto01, BmsXPButton, Grids, DBGrids, ExtCtrls, StdCtrls,
  XiPanel;

type
  TfrmLancamentos = class(TfrmProto01)
    XiPanel1: TXiPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    lblValor_Apto: TLabel;
    Label11: TLabel;
    lbl01: TLabel;
    lblApto: TLabel;
    lbl02: TLabel;
    lblTipo: TLabel;
    lbl04: TLabel;
    lblEntrada: TLabel;
    lbl03: TLabel;
    Label13: TLabel;
    lblTranscorrido: TLabel;
    lblVeiculo: TLabel;
    Label14: TLabel;
    Shape2: TShape;
    Shape3: TShape;
    Shape1: TShape;
    Label15: TLabel;
    Label17: TLabel;
    Shape5: TShape;
    Shape6: TShape;
    grdMov_Produtos: TDBGrid;
    btnOk: TBmsXPButton;
    btnCancelar: TBmsXPButton;
    BmsXPButton1: TBmsXPButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLancamentos: TfrmLancamentos;

implementation

{$R *.dfm}

end.
