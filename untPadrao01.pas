unit untPadrao01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, ActnList,
  PngBitBtn, ZAbstractRODataset, ZDataset, ZAbstractDataset, ImgList,
  PngImageList;

type
  TModoFormulario = (mConsulta, mEdicao);

  TfrmPadrao01 = class(TForm)
    grd01: TDBGrid;
    ds01: TDataSource;
    btNovo: TPngBitBtn;
    btAlterar: TPngBitBtn;
    btExcluir: TPngBitBtn;
    zquery: TZQuery;
    btFechar: TPngBitBtn;
    btGravar: TPngBitBtn;
    btCancelar: TPngBitBtn;
    bvl1: TBevel;
    bvl2: TBevel;
    Timer1: TTimer;

    procedure FormCreate(Sender: TObject);

    procedure ModoEdicao; virtual;
    procedure ModoConsulta; virtual;

    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CgBtnGravarState(lCondicao: Boolean);

    procedure AtivaQuery;

    procedure EditsChange(Sender: TObject); virtual; abstract;

    procedure EditsKeyPress(Sender: TObject; var Key: Char);
    procedure EditsJustNumbers_KeyPress(Sender: TObject; var Key: Char);
    procedure EditsCurrNumbers_KeyPress(Sender: TObject; var Key: Char);
    procedure Novo_Click(Sender: TObject);
    procedure Alterar_Click(Sender: TObject);
    procedure Excluir_Click(Sender: TObject); virtual; abstract;
    procedure Cancelar_Click(Sender: TObject);
    procedure Gravar_Click(Sender: TObject);

    procedure QueryAfterOpen(DataSet: TDataSet); virtual;
    procedure zqueryAfterScroll(DataSet: TDataSet); virtual; abstract;

    procedure Gravar; virtual; abstract;

    procedure grd01KeyPress(Sender: TObject; var Key: Char);
    procedure Localizar; virtual; abstract;
    procedure LimpaBufferLocalizar(Sender: TObject);

  private
    //
  public
    BufferLocalizar: string;
    lNovoRegistro: Boolean;
    ModoFormulario: TModoFormulario;
  end;

var
  frmPadrao01: TfrmPadrao01;

const
  COR_ATIVA = clWindow;
  COR_INATIVA = $00F0F0F0;

implementation

uses untDM;

{$R *.dfm}

procedure TfrmPadrao01.AtivaQuery;
begin
  with zquery do begin
    Active := False;
    Active := True;
  end;
end;

// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------
// Os procedimentos daqui pra baixo ja foram testados
// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------

procedure TfrmPadrao01.ModoConsulta;
begin
  ModoFormulario := mConsulta;

  // Altera grid
  grd01.Enabled := true;
  grd01.Color := COR_ATIVA;

  // Deixa os botoes invisiveis
  btNovo.Visible := true;
  btAlterar.Visible := true;
  btExcluir.Visible := true;
  btFechar.Visible := true;

  // Botoes de gravacao
  btGravar.Visible := false;
  btCancelar.Visible := false;
end;

procedure TfrmPadrao01.ModoEdicao;
begin
  ModoFormulario := mEdicao;

  // Altera grid
  grd01.Enabled := false;
  grd01.Color := COR_INATIVA;

  btNovo.Visible := false;
  btAlterar.Visible := false;
  btExcluir.Visible := false;
  btFechar.Visible := false;

  btGravar.Visible := true;
  btCancelar.Visible := true;
end;

procedure TfrmPadrao01.Novo_Click(Sender: TObject);
begin
  lNovoRegistro := true; // True = Novo, False = Alterar
  ModoEdicao; // Chama o procedimento "EditsActivate" definido na classe herdada
end;

procedure TfrmPadrao01.Alterar_Click(Sender: TObject);
begin
  lNovoRegistro := false; // True = Novo, False = Alterar
  ModoEdicao; // Chama o procedimento "EditsActivate" definido na classe herdada
end;

procedure TfrmPadrao01.Cancelar_Click(Sender: TObject);
begin
  ModoConsulta; // Chama o procedimento "EditsActivate" definido na classe herdada
  grd01.SetFocus;
  AtivaQuery;
end;

procedure TfrmPadrao01.Gravar_Click(Sender: TObject);
begin
  Gravar; // Chama procedimento de gravacao no form filho
  ModoConsulta;
end;

// Apos abrir/ativar a query
procedure TfrmPadrao01.QueryAfterOpen(DataSet: TDataSet);
var condicao: boolean;
begin
  condicao := (DataSet.RecordCount > 0);

  btAlterar.Enabled := condicao;
  btExcluir.Enabled := condicao;
  grd01.Enabled := condicao;
end;

// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------
// Nao alterar nada daqui pra baixo
// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------

procedure TfrmPadrao01.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if key = VK_RETURN then perform(WM_NEXTDLGCTL, 0, 0)
   else if key = VK_ESCAPE then ModalResult := mrCancel;
end;

procedure TfrmPadrao01.EditsKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then Key := #0
   else if Key = Chr(27) then Key := #0;
end;

procedure TfrmPadrao01.EditsJustNumbers_KeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in [#8, '0'..'9']) then Key := #0;
end;

procedure TfrmPadrao01.EditsCurrNumbers_KeyPress(Sender: TObject; var Key: Char);
begin
{  if not (Key in [#8, '0'..'9', '-', DecimalSeparator]) then Key := #0
  else if ((Key = DecimalSeparator) or (Key = '-')) and (Pos(Key, (Sender as TEdit).Text) > 0) then Key := #0
  else if (Key = '-') and ((Sender as TEdit).SelStart <> 0) then Key := #0;}

  if Key = ',' then
    Key := '.';

  if not (Key in [#8, '0'..'9', '-', DecimalSeparator]) then
    Key := #0
  else if ((Key = '.') or (Key = '-')) and (Pos(Key, (Sender as TEdit).Text) > 0) then
    Key := #0
  else if (Key = '-') and ((Sender as TEdit).SelStart <> 0) then
    Key := #0;

end;

procedure TfrmPadrao01.grd01KeyPress(Sender: TObject; var Key: Char);
begin
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

// Limpa o buffer de LOCALIZAR
procedure TfrmPadrao01.LimpaBufferLocalizar(Sender: TObject);
begin
  BufferLocalizar := '';
  Timer1.Enabled := false;
end;

procedure TfrmPadrao01.FormCreate(Sender: TObject);
begin
  BufferLocalizar := '';
  zquery.Active := true;
  ModoFormulario := mConsulta;
end;




procedure TfrmPadrao01.CgBtnGravarState(lCondicao: Boolean);
begin
//
end;

end.

