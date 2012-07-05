unit untEntrada;

interface

uses
  Windows, Messages, SysUtils, StrUtils, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untProto02, StdCtrls, ExtCtrls, Buttons, XiPanel, BmsXPButton, DB, ADODB, untClasses,
  XiButton, AdvEdit;

type
  TfrmEntrada = class(TfrmProto02)
    XiPanel1: TXiPanel;
    lbl06: TLabel;
    lbl03: TLabel;
    lbl01: TLabel;
    lbl02: TLabel;
    lbl04: TLabel;
    lblT01: TLabel;
    Shape4: TShape;
    lblT02: TLabel;
    Shape5: TShape;
    lbl05: TLabel;
    Shape1: TShape;
    XiButton1: TXiButton;
    AdvEdit3: TAdvEdit;
    AdvEdit1: TAdvEdit;
    AdvEdit2: TAdvEdit;
    AdvEdit4: TAdvEdit;
    AdvEdit5: TAdvEdit;
    AdvEdit6: TAdvEdit;

    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
    Apartamento: TApto;

  end;

var
  frmEntrada: TfrmEntrada;

implementation

uses untDM;

{$R *.dfm}

// =============================================================================
// Preenche o form com as informacoes iniciais
// =============================================================================

procedure TfrmEntrada.FormShow(Sender: TObject);
var
   sHora: string;
   fValor: real;

   rRegistro: _RecordSet;

begin
   inherited;

   // Pega o valor do momento do apto atual
   rRegistro := dmPrincipal.conn.Execute('SELECT valor01 FROM aptos_tipos WHERE nome="' + Apartamento.Tipo + '"');

   fValor := rRegistro.Fields[0].Value;
   lblValor_Apto.Caption := 'R$ ' + Trim(format('%10.2f',[fValor]));

   sHora := LeftStr(TimeToStr(Time),5);
   edtData.Text := DateToStr(Date());
   edtHora.Text := sHora;

   lblApto.Caption := Apartamento.sNumero;
   lblTipo.Caption := Apartamento.Tipo;


end;

// =============================================================================
// Grava na tabela 'aptos' a situacao do apto atualmente selecionado, ou seja "OCUPADO"
// Grava na tabela 'movimentos' os dados do apto atual
// =============================================================================

procedure TfrmEntrada.btnOkClick(Sender: TObject);
begin

   inherited;

   Apartamento.Situacao := OCUPADO;
   //Apartamento.dData_Entrada := StrToDate(edtData.Text);
   //Apartamento.dHora_Entrada := StrToTime(edtHora.Text);
   //Apartamento.sVeiculo := edtVeiculo.Text;

   dmPrincipal.conn.Execute('INSERT INTO movimentos (numero_apto, tipo_apto, dt_entrada, hr_entrada, veiculo, status) ' +
                            'VALUES (' + QuotedStr(Apartamento.sNumero) + ',' +
                                         QuotedStr(Apartamento.Tipo) + ',' +
                                         QuotedStr(edtData.Text) + ',' +
                                         QuotedStr(edtHora.Text) + ',' +
                                         QuotedStr(edtVeiculo.Text) + ', true )' );

   ModalResult := mrOk;

end;


end.
