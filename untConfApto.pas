unit untConfApto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untProto02, StdCtrls, ExtCtrls, XiPanel, Buttons, ADODB, untClasses,
  BmsXPButton, DB, AdvEdit, BmsXPLabel;

type
  TfrmConfApto = class(TfrmProto02)
    tblTipos: TADOTable;
    tblTiposid: TAutoIncField;
    tblTiposnome: TWideStringField;
    tblTiposvalor01: TBCDField;
    tblTiposvalor02: TBCDField;
    tblTiposvalor03: TBCDField;
    tblTiposvalor04: TBCDField;
    GroupBox2: TGroupBox;
    BmsXPLabel3: TBmsXPLabel;
    BmsXPLabel4: TBmsXPLabel;
    BmsXPLabel5: TBmsXPLabel;
    BmsXPLabel2: TBmsXPLabel;
    AdvEdit2: TAdvEdit;
    AdvEdit3: TAdvEdit;
    AdvEdit4: TAdvEdit;
    AdvEdit5: TAdvEdit;
    GroupBox1: TGroupBox;
    BmsXPLabel1: TBmsXPLabel;
    BmsXPLabel6: TBmsXPLabel;
    BmsXPLabel7: TBmsXPLabel;
    cmbSituacao: TComboBox;
    AdvEdit1: TAdvEdit;
    cmbTipo: TComboBox;

    procedure FormCreate(Sender: TObject);
    procedure cmbTipoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure cmbSituacaoChange(Sender: TObject);

  private
    { Private declarations }
    sCodTipo: string;

  public
    { Public declarations }
    Apto: TApto;

  end;

var
  frmConfApto: TfrmConfApto;

implementation

uses untDM;

{$R *.dfm}

// =============================================================================

procedure TfrmConfApto.FormCreate(Sender: TObject);
begin
  inherited;

  tblTipos.Active := true;

   while ( not tblTipos.Eof ) do begin
       cmbTipo.Items.Add(tblTipos.FieldByName('nome').AsString);
       tblTipos.Next;
   end;

end;

// =============================================================================

procedure TfrmConfApto.FormShow(Sender: TObject);
begin
  inherited;

//  lblNumApto.Caption := Apto.sNumero;

  // Se o Apto estiver ativo Localiza o tipo no combobox
  if ( Apto.Situacao <> INATIVO ) then begin
     cmbSituacao.ItemIndex := 0;
     cmbSituacaoChange(Self);

     cmbTipo.Text := Apto.Tipo;
     cmbTipoClick(Self);

  end
  else cmbSituacao.ItemIndex := 1;

end;

// =============================================================================

procedure TfrmConfApto.cmbTipoClick(Sender: TObject);
var
   v1, v2, v3, v4: real;

begin
//
//   tblTipos.FindFirst;
//
//   tblTipos.Locate('nome',cmbTipo.Text,[loPartialKey]);
//
//   v1 := StrToFloat(tblTipos.FieldByName('valor01').AsString);
//   v2 := StrToFloat(tblTipos.FieldByName('valor02').AsString);
//   v3 := StrToFloat(tblTipos.FieldByName('valor03').AsString);
//   v4 := StrToFloat(tblTipos.FieldByName('valor04').AsString);
//
//   lblValor01.Caption := 'R$ ' + Trim(format('%10.2f',[v1]));
//   lblValor02.Caption := 'R$ ' + Trim(format('%10.2f',[v2]));
//   lblValor03.Caption := 'R$ ' + Trim(format('%10.2f',[v3]));
//   lblValor04.Caption := 'R$ ' + Trim(format('%10.2f',[v4]));
//
//   sCodTipo := tblTipos.FieldByName('id').AsString;
//
//   btnOk.Enabled := true;
//
end;

// =============================================================================

procedure TfrmConfApto.btnOkClick(Sender: TObject);
var
   lCondicao: boolean;

begin
   inherited;

   // Se ativo
   if ( cmbSituacao.ItemIndex = 0 ) then begin

      dmPrincipal.conn.Execute('UPDATE aptos SET id_tipo='+QuotedStr(sCodTipo)+', situacao='+QuotedStr('L')+' WHERE numero='+IntToStr(Apto.Numero));

      Apto.Situacao := LIVRE;
      Apto.Tipo     := cmbTipo.Text;

   end

   // Se inativo
   else begin
   
      dmPrincipal.conn.Execute('UPDATE aptos SET id_tipo="0", situacao="I" WHERE numero='+IntToStr(Apto.Numero));

      Apto.Situacao := INATIVO;

   end;

   ModalResult := mrOk;

end;

// =============================================================================

procedure TfrmConfApto.cmbSituacaoChange(Sender: TObject);
var
   lCondicao: boolean;

begin
//
//   lCondicao := ( cmbSituacao.ItemIndex = 0 );
//
//   cmbTipo.Enabled := lCondicao;
//
//   if not lCondicao then cmbTipo.Text := '';
//
//   lblValor01.Enabled := lCondicao;
//   lblValor02.Enabled := lCondicao;
//   lblValor03.Enabled := lCondicao;
//   lblValor04.Enabled := lCondicao;
//
//   //lbl000.Enabled := lCondicao;
//   lbl001.Enabled := lCondicao;
//   lbl002.Enabled := lCondicao;
//   lbl003.Enabled := lCondicao;
//   lbl004.Enabled := lCondicao;
//
end;

end.
