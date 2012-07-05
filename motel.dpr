program motel;

uses
  Forms,
  Controls,
  SysUtils,
  dialogs,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  untDM in 'untDM.pas' {dmPrincipal: TDataModule},
  untPadrao01 in 'untPadrao01.pas' {frmPadrao01},
  untProdutos in 'untProdutos.pas' {frmProdutos},
  untTiposApto in 'untTiposApto.pas' {frmTiposApto},
  untFuncionarios in 'untFuncionarios.pas' {frmFuncionarios},
  untApartamentos in 'untApartamentos.pas' {frmApartamentos},
  untProto01 in 'untProto01.pas' {frmProto01},
  untProto02 in 'untProto02.pas' {frmProto02},
  untLocalizarProdutos in 'untLocalizarProdutos.pas' {frmLocalizarProdutos},
  untEntrada in 'untEntrada.pas' {frmEntrada},
  untFechamento in 'untFechamento.pas' {frmFechamento},
  untMovimentacao in 'untMovimentacao.pas' {frmMovimentacao},
  uLogin in 'uLogin.pas' {frmLogin},
  ClasseMae in 'ClasseMae.pas',
  funcionarios in 'funcionarios.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'SGM';
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  {
  frmLogin := TFrmLogin.Create(Application);
  frmLogin.ShowModal;

  if operador='' then
    Application.Terminate;
}
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
