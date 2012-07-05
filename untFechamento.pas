unit untFechamento;

interface

uses
  Windows, Messages, SysUtils, StrUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untProto02, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB,
  Math, PngBitBtn, ZAbstractRODataset, ZDataset, Mask, DateUtils,
  ZSqlProcessor;

type
  TTipo = record
    nome,
    descricao: string;
    tempo: integer;
    valor: real;
  end;

  TMovimentacao = record
    id: integer;
    Apartamento: string;
    Tipo: TTipo;
    Entrada: string;
    Saida: string;
    Veiculo: string;
    AbertoPor: string;
    FechadoPor: string;
    TotalMomento: real;
    TotalConsumo: real;
    Desconto: real;
    TotalGeral: real;

    Transcorrido: string;
  end;

  TfrmFechamento = class(TfrmProto02)
    Shape6: TShape;
    Label2: TLabel;
    lblConsumo: TLabel;
    Shape7: TShape;
    Label3: TLabel;
    Shape9: TShape;
    Label4: TLabel;
    lblMomCobrado: TLabel;
    Shape10: TShape;
    Label6: TLabel;
    edtDesconto: TEdit;
    Shape5: TShape;
    lbl01: TLabel;
    Shape2: TShape;
    lblApto: TLabel;
    lblTipo: TLabel;
    Shape3: TShape;
    lbl04: TLabel;
    Label1: TLabel;
    Shape8: TShape;
    lbl03: TLabel;
    Shape4: TShape;
    Label5: TLabel;
    lblTranscorrido: TLabel;
    lblVeiculo: TLabel;
    Shape11: TShape;
    Label7: TLabel;
    edtPago: TEdit;
    mmoTicket: TMemo;
    Shape13: TShape;
    lblEntrada: TLabel;
    edtTotal: TEdit;
    Bevel1: TBevel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Shape1: TShape;
    Label8: TLabel;
    lblTroco: TLabel;
    Shape12: TShape;
    Label9: TLabel;
    Label11: TLabel;
    edtSaida: TMaskEdit;
    edtValMom: TEdit;
    qMov: TZReadOnlyQuery;
    qConsumo: TZReadOnlyQuery;
    qValMom: TZReadOnlyQuery;
    Shape14: TShape;
    Label10: TLabel;
    lblValor1Mom: TLabel;
    Shape15: TShape;
    Label13: TLabel;
    edtQtdeMom: TEdit;

    procedure FormShow(Sender: TObject);

    procedure AtualizaFormulario;
    procedure btnOkClick(Sender: TObject);
    procedure edtDescontoChange(Sender: TObject);
    procedure edtPagoChange(Sender: TObject);

    procedure PegaMovimentacao;
    procedure PreencheTicket;
    procedure edtValMomExit(Sender: TObject);
    procedure edtQtdeMomExit(Sender: TObject);

  private
    { Private declarations }
    tipo: TTipo;

    Desconto,
    Total: real;
    NumMomentos: integer; // Numero de momentos

  public
    { Public declarations }
    movimento: TMovimentacao;

  end;

const
  cJustif = #27#97#51;
  cEject  = #12;
  cCRLF   = #13#10;

{
  cJustif     = #27#97#51;
  cEject      = #12;

  // Tamanho da fonte
  c10cpi      = #18;
  c12cpi      = #27#77;
  c17cpi      = #15;
  cIExpandido = #14;
  cFExpandido = #20;

  //Formatação da fonte
  cINegrito   = #27#71;
  cFNegrito   = #27#72;
  cIItalico   = #27#52;
  cFItalico   = #27#53;
  cCRLF       = #13#10;
}

var
  frmFechamento: TfrmFechamento;

implementation

uses untDM;

{$R *.dfm}

// -----------------------------------------------------------------------------

procedure TfrmFechamento.FormShow(Sender: TObject);
begin
  inherited;
  PegaMovimentacao;
end;

// -----------------------------------------------------------------------------

procedure TfrmFechamento.PegaMovimentacao;
var
  data1, data2: TDateTime;
  minTranscorrido: integer;
  qryAux: TZReadOnlyQuery;

begin
  qryAux := TZReadOnlyQuery.Create(Self);
  qryAux.Connection := dmPrincipal.zconn;

  // Abre as queries
  qMov.ParamByName('id').AsInteger := movimento.id;
  qMov.Open;

  qConsumo.ParamByName('id').AsInteger := movimento.id;
  qConsumo.Open;

  qValMom.ParamByName('nome_tipo').AsString := qMov.FieldByName('tipo').AsString;
  qValMom.Open;

  data1 := qMov.FieldByName('entrada').AsDateTime;
  data2 := Now;

  movimento.apartamento := qMov.FieldByName('apartamento').AsString;
  movimento.entrada := qMov.FieldByName('entrada').AsString;
  movimento.saida := DateTimeToStr(Now);
  movimento.veiculo := qMov.FieldByName('veiculo').AsString;
  movimento.Transcorrido := diff(data1, data2);

  // Calcula qual momento sera cobrado
  minTranscorrido := MinutesBetween(data2, data1);

  repeat
    tipo.tempo := qValMom.FieldByName('tempo').AsInteger;
    tipo.descricao := qValMom.FieldByName('descricao').AsString;
    tipo.valor := qValMom.FieldByName('valor').AsFloat;

    if not (minTranscorrido > tipo.tempo) then
      break
    else
      qValMom.Next;
  until qValMom.Eof;

  NumMomentos := 1;
  if minTranscorrido > tipo.tempo then
    NumMomentos := (minTranscorrido div tipo.tempo) + 1;

  movimento.TotalMomento := tipo.valor * NumMomentos;

  // Calcula total consumo
  qryAux.SQL.Text := 'SELECT SUM(quantidade*valor_unitario) AS total '+
                     'FROM movimentacao_consumo WHERE id_movimentacao=:id';
  qryAux.ParamByName('id').AsInteger := movimento.id;
  qryAux.Open;

  movimento.TotalConsumo := qryAux.FieldByName('total').AsFloat;
  movimento.TotalGeral := movimento.TotalMomento + movimento.TotalConsumo;

  AtualizaFormulario;
end;

// -----------------------------------------------------------------------------

procedure TfrmFechamento.btnOkClick(Sender: TObject);
var
   sCod_Prod, sCod_Fluxo, Texto: string;
   sImpVeiculo: string;
   iEstoque, iQtde, iCod_Fluxo: integer;
   F: TextFile;

begin
  inherited;
{
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
}

   // =====================================================
   // Prepara pra atualizar a tabela "movimento_fluxo"
   // =====================================================

{   sCod_Apto := QuotedStr(sCod_Apto);
   sData_Ent := QuotedStr(LeftStr(sData_Ent,10));
   sData_Sai := QuotedStr(FormatDateTime('dd/mm/yyyy',Date()));
   sEntrada  := QuotedStr(LeftStr(sEntrada,5));
//   sSaida    := QuotedStr(LeftStr(edtHoraSaida.Text,5));
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

{   qryMov_Fluxo.Active := false;
   qryMov_Fluxo.SQL.Clear;
   qryMov_Fluxo.SQL.Text := 'SELECT codigo FROM movimento_fluxo ORDER BY codigo';
   qryMov_Fluxo.Open;

   qryMov_Fluxo.FindLast;

   sCod_Fluxo := QuotedStr(qryMov_Fluxo.Fields[0].Text);
   iCod_Fluxo := qryMov_Fluxo.Fields[0].Value;

   qryMov_Fluxo.Active := false;
}

   // =====================================================
   // Atualiza a tabela "movimento_produto"
   // Seta o campo 'ativo' para false, indicando que este
   // produto nao esta mais ativo
   //
   // Essa tabela contem a listagem de produtos consumidos
   // pelos apartamentos
   // =====================================================
{
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
    // Texto := '' +
    '--------------------------------------------------' + cCRLF +
    '           A.M. LOCACAO DE APARTAMENTOS           ' + cCRLF +
    '--------------------------------------------------' + cCRLF +
    'Doc/emi: ' + format('%.6d', [iCod_Fluxo]) + '      ' + MidStr(sData_Sai,2,10) + '      Dp: 0000000-0' + cCRLF +
    'Vend...: *********                                ' + cCRLF +
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

{
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
    Texto := Texto + 'Apto..: ' + format('%.3d', [StrToInt(lblApto.Caption)]) + ' Hora Entrada: ' + lblEntrada.Caption + '  Hora Saida: ' + edtHoraSaida.Text + cCRLF;
    Texto := Texto + '--------------------------------------------------' + cCRLF;
    Texto := Texto + 'Total bruto..........: ' + Format('%m', [cTotal]) + cCRLF;
    Texto := Texto + 'Total desconto (0,00): ' + Format('%m', [cDesc]) + cCRLF;
    Texto := Texto + 'Liquido a pagar .....: ' + lblTotal.Caption + cCRLF;
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
}
end;

// -----------------------------------------------------------------------------

procedure TfrmFechamento.edtDescontoChange(Sender: TObject);
begin
  if ( edtDesconto.Text <> '' ) then
  begin
    // edtDesconto2.Enabled := false;
    //cDesc := (StrToCurr(edtDesconto.Text)/100) * cTotal;
    //cTotalDesc := cTotal - cDesc;

    // lblTotal.Caption := Format('%m', [cTotalDesc]);
  end
  else
  begin
    // edtDesconto2.Enabled := true;

    //cTotalDesc := 0;
    //cDesc := 0;
    // lblTotal.Caption := Format('%m', [cTotal]);
   end;
end;

// -----------------------------------------------------------------------------

procedure TfrmFechamento.edtPagoChange(Sender: TObject);
begin
{
  if ( edtDesconto2.Text <> '' ) then begin
    edtDesconto.Enabled := false;
    cDesc := StrToCurr(edtDesconto2.Text);

    if cDesc > cTotal then
    begin
       MessageBox(0,'O Desconto não pode ser maior que o valor Total!','Atenção!',0);
       edtDesconto2.Text := '0';
    end
    else begin
       cTotalDesc := cTotal - cDesc;
       // lblTotal.Caption := Format('%m', [cTotalDesc]);
    end;
   end
   else begin
      edtDesconto.Enabled := true;
      cTotalDesc := 0;
      cDesc := 0;
//      lblTotal.Caption := Format('%m', [cTotal]);

   end;
}
end;

// -----------------------------------------------------------------------------
// Criado em 19/10/2009
procedure TfrmFechamento.PreencheTicket;
var txt: string;
begin
  //mmoTicket.Lines.Add(#27 + 'x' + #0 + #15 + cCRLF); // isso aqui vai so na impressao

  mmoTicket.Clear;
  mmoTicket.Lines.Add('--------------------------------------------------');
  mmoTicket.Lines.Add('           A.M. LOCACAO DE APARTAMENTOS           ');
  mmoTicket.Lines.Add('--------------------------------------------------');
  mmoTicket.Lines.Add('Doc/emi: ' + format('%.6d', [movimento.id]) + '      ' + MidStr(movimento.Saida,1,10) + '      Dp: 0000000-0');
  mmoTicket.Lines.Add('Vend...: *********                                ');
  mmoTicket.Lines.Add('--------------------------------------------------');
  mmoTicket.Lines.Add('Codigo.: 00000-0                                  ');
  mmoTicket.Lines.Add('Cliente: * CONSUMIDOR                             ');
  mmoTicket.Lines.Add('Fantas.:                                          ');
  mmoTicket.Lines.Add('Fone...:                                          ');
  mmoTicket.Lines.Add('Enderec:                                          ');
  mmoTicket.Lines.Add('Cidade.: ALTA FLORESTA                 UF: MT     ');
  mmoTicket.Lines.Add('Veiculo: ' + movimento.Veiculo);
  mmoTicket.Lines.Add('--------------------------------------------------');
  mmoTicket.Lines.Add('Descricao                    Quant    Unit   Total');
  mmoTicket.Lines.Add('--------------------------------------------------');

  qConsumo.First;
  while not qConsumo.Eof do
  begin
    with qConsumo do
    begin
      txt := '';
      txt := LeftStr(FieldByName('produto').Text + '                              ',31);
      txt := txt + LeftStr(FieldByName('quantidade').Text + '       ', 4);
      txt := txt + RightStr('       ' + Format('%0.2f', [FieldByName('valor_unitario').AsFloat]), 7) + ' ';
      txt := txt + RightStr('       ' + Format('%0.2f',[FieldByName('total').AsFloat]), 7);
      mmoTicket.Lines.Add(txt);
      Next;
    end;
  end;

  txt := movimento.Tipo.nome + ' MOMENTO 2 HORAS          ' +
         Format('%-3d',[NumMomentos]) +
         Format('%8n',[movimento.Tipo.valor]) +
         Format('%8n',[movimento.TotalConsumo]);

  mmoTicket.Lines.Add(txt);

  mmoTicket.Lines.Add('');
  mmoTicket.Lines.Add('--------------------------------------------------');
  mmoTicket.Lines.Add('Apto..: ' + format('%.3d', [StrToInt(movimento.Apartamento)]) +
                      ' Hora Entrada: ' + MidStr(movimento.Entrada, 12, 5) +
                      '  Hora Saida: ' + MidStr(movimento.Saida, 12, 5));

  mmoTicket.Lines.Add('--------------------------------------------------');
  mmoTicket.Lines.Add('Total bruto..........: ' + Format('%m', [movimento.TotalGeral]));
  mmoTicket.Lines.Add('Total desconto (0,00): ' + Format('%m', [Desconto]));
  mmoTicket.Lines.Add('Liquido a pagar .....: ' + Format('%m', [Total]));
  mmoTicket.Lines.Add('');
  mmoTicket.Lines.Add('--------------------------------------------------');
  mmoTicket.Lines.Add('           CAA - Aplicativos de Automacao         ');
end;

procedure TfrmFechamento.edtValMomExit(Sender: TObject);
begin
  movimento.TotalMomento := StrToFloat(edtValMom.Text);
  movimento.TotalGeral := movimento.TotalMomento + movimento.TotalConsumo;

  AtualizaFormulario;
end;

procedure TfrmFechamento.edtQtdeMomExit(Sender: TObject);
begin
  NumMomentos := StrToInt(edtQtdeMom.Text);
  movimento.TotalMomento := movimento.Tipo.valor * NumMomentos;
  movimento.TotalGeral := movimento.TotalMomento + movimento.TotalConsumo;

  AtualizaFormulario;
end;

procedure TfrmFechamento.AtualizaFormulario;
begin
  lblApto.Caption := movimento.Apartamento;
  lblTipo.Caption := movimento.Tipo.nome;
  lblEntrada.Caption := movimento.Entrada;
  edtSaida.Text := movimento.Saida;
  lblTranscorrido.Caption := movimento.Transcorrido;
  lblVeiculo.Caption := movimento.Veiculo;

  lblMomCobrado.Caption := movimento.Tipo.descricao;
  lblValor1Mom.Caption := Format('%0.2f', [movimento.Tipo.valor]);
  edtQtdeMom.text := inttostr(NumMomentos);
  edtValMom.Text := Format('%0.2f', [movimento.TotalMomento]);
  lblConsumo.Caption := 'R$ ' + Format('%0.2f', [movimento.TotalConsumo]);

  edtTotal.Text := Format('%0.2f', [movimento.TotalGeral]);

  PreencheTicket;
end;

end.
