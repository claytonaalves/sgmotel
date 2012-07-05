unit untFechamento;

interface

uses
  Windows, Messages, SysUtils, StrUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untProto02, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB,
  ADODB, Math, ComCtrls, BmsXPButton, XiPanel;

type
  TfrmFechamento = class(TfrmProto02)
    qryMov_Produtos: TADOQuery;
    dsMov_Produtos: TDataSource;
    qryProdutos: TADOQuery;
    qryMov_Fluxo: TADOQuery;
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
    Label1: TLabel;
    edtSaida: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edtDesconto: TEdit;
    edtDesconto2: TEdit;
    grdMov_Produtos: TDBGrid;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Shape5: TShape;
    Shape6: TShape;
    Shape4: TShape;

    procedure FormCreate(Sender: TObject);
    procedure AtualizaTranscorrido;
    procedure FormShow(Sender: TObject);
    procedure qryMov_ProdutosAfterOpen(DataSet: TDataSet);
    procedure btnOkClick(Sender: TObject);
    procedure edtDescontoChange(Sender: TObject);
    procedure edtDesconto2Change(Sender: TObject);

    procedure ImprimeTicket;

  private
    { Private declarations }
  public
    { Public declarations }
    sCod_Movimento: string;
    cValor_Apto: currency;

    sCod_Apto, sData_Ent: string;
    sData_Sai, sEntrada : string;
    sConsumo, sVeiculo  : string;
    sSaida, sDesconto   : string;

  end;

var
  frmFechamento: TfrmFechamento;
  cTotal, cTotalDesc, cDesc: currency;
  iMomentos: integer;


implementation

uses untDM;

{$R *.dfm}

// -----------------------------------------------------------------------------

procedure TfrmFechamento.FormCreate(Sender: TObject);
var
   sHora: string;

begin
  inherited;

   cTotal := 0;
   cTotalDesc := 0;
   cDesc := 0;

   // Pega a hora atual
   sHora := LeftStr(TimeToStr(Time),5);
   edtSaida.Text := sHora;

end;

// -----------------------------------------------------------------------------

procedure TfrmFechamento.FormShow(Sender: TObject);
begin
   inherited;

   AtualizaTranscorrido;


   qryMov_Produtos.SQL.Text := 'SELECT M.num_produto, P.codigo, P.nome, M.quantidade, P.valor, (M.quantidade * P.valor) ' +
                               'FROM produtos P, movimento_produtos M ' +
                               'WHERE M.ativo=true AND P.codigo=M.cod_produto AND M.cod_movimento=' + sCod_Movimento;

   qryMov_Produtos.Open;

   cTotal := cTotal + (cValor_Apto * iMomentos);

   lblValor_Apto.Caption := Format('%m', [cValor_Apto]);
   // lblQtdeMomentos.Caption := IntToStr(iMomentos);
   //lblTotal.Caption := Format('%m', [cTotal]);

end;

// -----------------------------------------------------------------------------

procedure TfrmFechamento.AtualizaTranscorrido;
var
   h1, h2, iTrans: integer;
   sHora: string;

begin

   sHora := FormatDateTime('hh:nn', Strtotime(edtSaida.Text));

   h1 := StrToInt(Copy(lblEntrada.Caption,1,2))*60 + StrToInt(Copy(lblEntrada.Caption,4,2));
   h2 := StrToInt(Copy(sHora,1,2))*60 + StrToInt(Copy(sHora,4,2));

   iTrans := h2 - h1;

   iMomentos := Trunc(iTrans / 60);

   if iMomentos = 0 then
      iMomentos := 1;


   lblTranscorrido.Caption := IntToStr(iTrans) + ' minutos';

end;

// -----------------------------------------------------------------------------

procedure TfrmFechamento.qryMov_ProdutosAfterOpen(DataSet: TDataSet);
var
   cConsumo: currency;

begin
   inherited;

   cConsumo := 0;

   if ( DataSet.RecordCount > 0 ) then begin

      with DataSet do begin
         TNumericField(Fields[4]).DisplayFormat := '#,##0.00';
         TNumericField(Fields[5]).DisplayFormat := '#,##0.00';
      end;

      while not DataSet.Eof do begin
         cConsumo := cConsumo + DataSet.Fields[5].Value;
         DataSet.Next;
      end;

      DataSet.FindFirst;

      //lblConsumo.Caption := Format('%m', [cConsumo]);

      cTotal := cConsumo;

   end;

end;

// -----------------------------------------------------------------------------

procedure TfrmFechamento.btnOkClick(Sender: TObject);
const
  cJustif     = #27#97#51;
  cEject      = #12;
  cCRLF = #13#10;

var
   sCod_Prod, sCod_Fluxo, Texto: string;
   sImpVeiculo: string;
   iEstoque, iQtde, iCod_Fluxo: integer;
   F: TextFile;

begin
  inherited;

   // Se tiver produtos na listagem
   if ( qryMov_Produtos.RecordCount > 0 ) then begin

      qryMov_Produtos.FindFirst;

      // Atualiza o Estoque
      while not (qryMov_Produtos.Eof) do begin

         sCod_Prod := qryMov_Produtos.Fields[1].Text;
         iQtde     := StrToInt(qryMov_Produtos.Fields[3].Text);

         qryProdutos.Active := false;
         qryProdutos.SQL.Clear;
         qryProdutos.SQL.Text := 'SELECT quantidade FROM produtos WHERE codigo=' + sCod_Prod;
         qryProdutos.Open;

         iEstoque := qryProdutos.Fields[0].Value - iQtde;

         dmPrincipal.conn.Execute('UPDATE produtos SET quantidade=' + QuotedStr(IntToStr(iEstoque)) + ' WHERE codigo=' + sCod_Prod);

         qryMov_Produtos.Next;

      end;

   end;


   // =====================================================
   // Prepara pra atualizar a tabela "movimento_fluxo"
   // =====================================================

   sCod_Apto := QuotedStr(sCod_Apto);
   sData_Ent := QuotedStr(LeftStr(sData_Ent,10));
   sData_Sai := QuotedStr(FormatDateTime('dd/mm/yyyy',Date()));
   sEntrada  := QuotedStr(LeftStr(sEntrada,5));
   sSaida    := QuotedStr(LeftStr(edtSaida.Text,5));
   sConsumo  := QuotedStr(CurrToStr(cTotal - cDesc));


   sImpVeiculo := sVeiculo;

   sVeiculo  := QuotedStr(sVeiculo);

   sDesconto := '0';

   if ( cTotalDesc > 0 ) then begin
      sDesconto := CurrToStr(cDesc);
   end;

   sDesconto := QuotedStr(sDesconto);


   // MessageBoxA(0,PAnsichar(sCod_Apto + ', ' + sData_Ent + ', ' + sData_Sai + ', ' + sEntrada + ', ' + sSaida + ', ' + sConsumo + ', ' + sDesconto + ',' + sVeiculo),'Data Sai',1);

   // Atualiza a Tabela
   dmPrincipal.conn.Execute('INSERT INTO movimento_fluxo (cod_apto,data_ent,data_sai,entrada,saida,consumo,desconto,veiculo)' +
                            'VALUES (' + sCod_Apto + ',' +
                                         sData_Ent + ',' +
                                         sData_Sai + ',' +
                                         sEntrada  + ',' +
                                         sSaida    + ',' +
                                         sConsumo  + ',' +
                                         sDesconto + ',' +
                                         sVeiculo  + ')');


   // =====================================================
   // Pega o codigo do fluxo que acabou de ser gerado
   // =====================================================

   qryMov_Fluxo.Active := false;
   qryMov_Fluxo.SQL.Clear;
   qryMov_Fluxo.SQL.Text := 'SELECT codigo FROM movimento_fluxo ORDER BY codigo';
   qryMov_Fluxo.Open;

   qryMov_Fluxo.FindLast;

   sCod_Fluxo := QuotedStr(qryMov_Fluxo.Fields[0].Text);
   iCod_Fluxo := qryMov_Fluxo.Fields[0].Value;

   qryMov_Fluxo.Active := false;


   // =====================================================
   // Atualiza a tabela "movimento_produto"
   // Seta o campo 'ativo' para false, indicando que este
   // produto nao esta mais ativo
   //
   // Essa tabela contem a listagem de produtos consumidos
   // pelos apartamentos
   // =====================================================

   dmPrincipal.conn.Execute('UPDATE movimento_produtos SET cod_fluxo=' + sCod_Fluxo + ', ativo=false WHERE cod_movimento=' + sCod_Movimento + ' AND ativo=true');


   // =====================================================
   // Atualiza a tabela "movimento"
   // Essa tabela é a tabela de visualizacao inicial
   // =====================================================

   dmPrincipal.conn.Execute('UPDATE movimento SET situacao=false, ' +
                            'data_ent=' + QuotedStr('') + ',' +
                            'data_sai=' + QuotedStr('') + ',' +
                            'entrada=' + QuotedStr('') + ',' +
                            'saida=' + QuotedStr('') + ',' +
                            'consumo=' + QuotedStr('0') + ',' +
                            'veiculo=' + QuotedStr(' ') +
                            ' WHERE codigo=' + sCod_Movimento);



   // =====================================================
   // Imprime o Ticket
   // =====================================================

    Texto := #27 + 'x' + #0 + #15 + cCRLF +
    //Texto := '' +
    '--------------------------------------------------' + cCRLF +
    '           A.M. LOCACAO DE APARTAMENTOS           ' + cCRLF +
    '--------------------------------------------------' + cCRLF +
    'Doc/emi: ' + format('%.6d', [iCod_Fluxo]) + '      ' + MidStr(sData_Sai,2,10) + '      Dp: 0000000-0' + cCRLF +
    'Vend...: ' + sOperador + cCRLF +
    '--------------------------------------------------' + cCRLF +
    'Codigo.: 00000-0                                  ' + cCRLF +
    'Cliente: * CONSUMIDOR                             ' + cCRLF +
    'Fantas.:                                          ' + cCRLF +
    'Fone...:                                          ' + cCRLF +
    'Enderec:                                          ' + cCRLF +
    'Cidade.: ALTA FLORESTA                 UF: MT     ' + cCRLF +
    'Veiculo: ' + sImpVeiculo + cCRLF +
    '--------------------------------------------------' + cCRLF +
    'Descricao                    Quant    Unit   Total' + cCRLF +
    '--------------------------------------------------' + cCRLF;


    if qryMov_Produtos.RecordCount > 0 then begin

       qryMov_Produtos.FindFirst;

       while not ( qryMov_Produtos.Eof ) do begin
          Texto := Texto + LeftStr(qryMov_Produtos.Fields[2].Text + '                              ',30);
          //Texto := Texto + Format('%-3d', [StrToCurr(qryMov_Produtos.Fields[3].Text)]);
          //Texto := Texto + Format('%8n', [qryMov_Produtos.Fields[4].Value]);
          //Texto := Texto + Format('%8n', [qryMov_Produtos.Fields[5].Value]) + cCRLF;

          Texto := Texto + LeftStr(qryMov_Produtos.Fields[3].Text + '       ',6);
          Texto := Texto + LeftStr(qryMov_Produtos.Fields[4].Text + '        ',8);
          Texto := Texto + LeftStr(qryMov_Produtos.Fields[5].Text + '        ',8);

          Texto := Texto + cCRLF;

          qryMov_Produtos.Next;

       end;

    end;


    Texto := Texto + 'APTO MOMENTO 2 HORAS          ' + Format('%-3d',[iMomentos]) + Format('%8n',[cValor_Apto]) + Format('%8n',[cValor_Apto*iMomentos]) + cCRLF;


    Texto := Texto + '--------------------------------------------------' + cCRLF;
    Texto := Texto + 'Apto..: ' + format('%.3d', [StrToInt(lblApto.Caption)]) + ' Hora Entrada: ' + lblEntrada.Caption + '  Hora Saida: ' + edtSaida.Text + cCRLF;
    Texto := Texto + '--------------------------------------------------' + cCRLF;
    Texto := Texto + 'Total bruto..........: ' + Format('%m', [cTotal]) + cCRLF;
    Texto := Texto + 'Total desconto (0,00): ' + Format('%m', [cDesc]) + cCRLF;
    //Texto := Texto + 'Liquido a pagar .....: ' + lblTotal.Caption + cCRLF;
    Texto := Texto + cCRLF;
    Texto := Texto + '--------------------------------------------------' + cCRLF;
    Texto := Texto + '           VCware - Sistemas de Automacao         ' + cCRLF;


    //MessageBoxA(0,PAnsichar(Texto),'imp',1);


   // =====================================================
   // Imprime
   // =====================================================

   AssignFile(F, 'LPT1');
   Rewrite(F);
   try
    WriteLn(F, cJustif, Texto);
    WriteLn(F, cEject);
   finally
    CloseFile(F);
   end;
   
   // =====================================================
   // =====================================================

   ModalResult := mrOk;

end;

// -----------------------------------------------------------------------------

procedure TfrmFechamento.edtDescontoChange(Sender: TObject);
begin
   inherited;

   if ( edtDesconto.Text <> '' ) then begin

      edtDesconto2.Enabled := false;

      cDesc := (StrToCurr(edtDesconto.Text)/100) * cTotal;
      cTotalDesc := cTotal - cDesc;

      //lblTotal.Caption := Format('%m', [cTotalDesc]);
   end

   else begin

      edtDesconto2.Enabled := true;

      cTotalDesc := 0;
      cDesc := 0;

      //lblTotal.Caption := Format('%m', [cTotal]);

   end;


end;

// -----------------------------------------------------------------------------

procedure TfrmFechamento.edtDesconto2Change(Sender: TObject);
begin
  inherited;

     if ( edtDesconto2.Text <> '' ) then begin

      edtDesconto.Enabled := false;

      cDesc := StrToCurr(edtDesconto2.Text);

      if cDesc > cTotal then begin
         MessageBox(0,'O Desconto não pode ser maior que o valor Total!','Atenção!',0);
         edtDesconto2.Text := '0';

      end

      else begin
         cTotalDesc := cTotal - cDesc;

         //lblTotal.Caption := Format('%m', [cTotalDesc]);
      end;

   end
   else begin

      edtDesconto.Enabled := true;

      cTotalDesc := 0;
      cDesc := 0;

      //lblTotal.Caption := Format('%m', [cTotal]);

   end;

end;

// -----------------------------------------------------------------------------

procedure TfrmFechamento.ImprimeTicket;
const
  cJustif     = #27#97#51;
  cEject      = #12;

  { Tamanho da fonte }
  c10cpi      = #18;
  c12cpi      = #27#77;
  c17cpi      = #15;
  cIExpandido = #14;
  cFExpandido = #20;

  { Formatação da fonte }
  cINegrito   = #27#71;
  cFNegrito   = #27#72;
  cIItalico   = #27#52;
  cFItalico   = #27#53;
  cCRLF       = #13#10;

var
  Texto: string;
  F: TextFile;

begin

    Texto := #27 + 'x' + #0 + #15 +
    cCRLF +
    '--------------------------------------------------' + cCRLF +
    '           A.M. LOCACAO DE APARTAMENTOS           ' + cCRLF +
    '--------------------------------------------------' + cCRLF +
    'Doc/emi: 013619      10/03/2007      Dp: 8481000-2' + cCRLF +
    'Vend...: GENIVALDO                                ' + cCRLF +
    '--------------------------------------------------' + cCRLF +
    'Codigo.: 88888-0                                  ' + cCRLF +
    'Cliente: * CONSUMIDOR                             ' + cCRLF +
    'Fantas.:                                          ' + cCRLF +
    'Fone...:                                          ' + cCRLF +
    'Enderec:                                          ' + cCRLF +
    'Cidade.: ALTA FLORESTA                 UF: MT     ' + cCRLF +
    'Veiculo: MOTO                                     ' + cCRLF +
    '--------------------------------------------------' + cCRLF +
    'Descricao                    Quant    Unit   Total' + cCRLF +
    '--------------------------------------------------' + cCRLF +
    'AGUA MINERAL                   1      2,00    2,00' + cCRLF +
    'SUITE MOMENTO 2 HORAS          1     50,00   50,00' + cCRLF +
    cCRLF +
    '--------------------------------------------------' + cCRLF +
    'Apto..: 022 Hora Entrada: 21:11  Hora Saida: 21:26' + cCRLF +
    '--------------------------------------------------' + cCRLF +
    'Total bruto..........: 52,00                      ' + cCRLF +
    'Total desconto (0,00):  0,00                      ' + cCRLF +
    'Liquido a pagar .....: 52,00                      ' + cCRLF +
    cCRLF +
    '--------------------------------------------------' + cCRLF +
    '           VCware - Sistemas de Automacao         ' + cCRLF;


  AssignFile(F, 'LPT1');
  Rewrite(F);
  try
    WriteLn(F, cJustif, Texto);
    WriteLn(F, cEject);
  finally
    CloseFile(F);
  end;

end;

end.
