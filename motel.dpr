program motel;



uses
  Forms,
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
  untResumo in 'untResumo.pas' {frmResumo},
  untEntrada in 'untEntrada.pas' {frmEntrada},
  untFechamento in 'untFechamento.pas' {frmFechamento},
  untMovimentacao in 'untMovimentacao.pas' {frmMovimentacao},
  untLogin in 'untLogin.pas' {frmLogin},
  untClasses in 'untClasses.pas',
  untConfApto in 'untConfApto.pas' {frmConfApto},
  untLancamentos in 'untLancamentos.pas' {frmLancamentos},
  untClassTiposApto in 'untClassTiposApto.pas',
  uProduto in 'uProduto.pas',
  uProdutos_INFO in 'uProdutos_INFO.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'SGM';
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TForm1, Form1);
  //Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
