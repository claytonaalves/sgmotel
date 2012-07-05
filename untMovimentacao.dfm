inherited frmMovimentacao: TfrmMovimentacao
  Left = 188
  Top = 111
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Movimenta'#231#245'es'
  ClientHeight = 546
  ClientWidth = 911
  Icon.Data = {
    0000010001001010000001001800680300001600000028000000100000002000
    0000010018000000000040030000000000000000000000000000000000000000
    000000000000007CB57F00000000000000000000000000000000000000000000
    000000000000000000000000000000000000000095C59861A7666BAE6F4F9953
    0000000000000000000000000000000000000000000000000000000000000000
    000000007EBC82B7DEBB67AC6C75B67A4F985283B88600000000000000000000
    0000000000000000000000000000000000ABD3AE9CCDA06FB2738DC792AADCAF
    76B67B519B5577B77B67A76A0000000000000000000000000000000000000000
    007BBB8077B77C91CB97ABDEB19CD7A2AADDB077B77C60AC65AED8B28BC4917D
    B480000000000000000000000000AFD6B27FBD8497CE9CADDFB36FB37496D59D
    9DD8A3AADDB078B87C72BA76C3E7C8B2DAB56DBA72569E590000000000007BBB
    808EC893AFDFB5A1DAA798D79F97D69E7EC08382C187ABDDB079B97D63AE67C4
    E7C8C1E4C4B9E0BE4F9A530000000000007DBB828FC894B0E0B6A2DAA87FC185
    A4D0A7DDEEDF80B883ABDEB17AB97F569F5AC4E7C878B87CA3CAA50000000000
    0000000080BD8490C995B0E0B685C28AF7FCF895C297DDEEDF82C287ABDEB17B
    BA7F58A05C59A15D00000000000000000000000000000083BF8791CA96B1E0B6
    D9F3DDF7FCF8A4D0A77EC0849FD9A5ACDEB27BBB8059A15D0000000000000000
    0000000000000000000084C18A92CB97B1E1B685C38A80C18599D7A098D79F9F
    D9A5ACDFB27DBB815EA36200000000000000000000000000000000000086C28B
    93CC98B1E1B7A3DBA99BD8A273B477AFDFB487C38C65AA690000000000000000
    0000000000000000000000000000000087C28C94CC99B2E2B7A3DCAAB0E0B68C
    C6926EB173000000000000000000000000000000000000000000000000000000
    00000088C38D94CD9AB3E2B793CB9877B77C0000000000000000000000000000
    0000000000000000000000000000000000000000000089C48F96CD9B80BE8500
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000008BC590000000000000000000000000000000000000EFFF
    0000C3FF0000C0FF0000803F0000800F0000000300000001000080010000C003
    0000E0030000F0010000F8030000FC070000FE0F0000FF1F0000FFBF0000}
  OldCreateOrder = True
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Shape13: TShape
    Left = 505
    Top = 2
    Width = 401
    Height = 541
  end
  object Shape2: TShape
    Left = 5
    Top = 2
    Width = 494
    Height = 38
  end
  object Label3: TLabel
    Left = 18
    Top = 13
    Width = 99
    Height = 17
    Caption = 'Selecione M'#234's:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object DBGrid1: TDBGrid
    Left = 5
    Top = 39
    Width = 494
    Height = 504
    Ctl3D = False
    DataSource = DataSource1
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'data_sai'
        Title.Caption = 'Data'
        Width = 177
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Apto'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'veiculo'
        Title.Caption = 'Ve'#237'culo'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'desconto'
        Title.Caption = 'Desconto'
        Width = 65
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'consumo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Total pago'
        Width = 71
        Visible = True
      end>
  end
  object Memo1: TMemo
    Left = 519
    Top = 8
    Width = 377
    Height = 525
    BorderStyle = bsNone
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      '--------------------------------------------------'
      '           A.M. LOCACAO DE APARTAMENTOS'
      ''
      '--------------------------------------------------'
      'Doc/emi: 013619      10/03/2007      Dp: 8481000-2'
      'Vend...: GENIVALDO'
      '--------------------------------------------------'
      'Codigo.: 88888-0'
      'Cliente: * CONSUMIDOR'
      'Fantas.:'
      'Fone...:'
      'Enderec:'
      'Cidade.: ALTA FLORESTA                 UF: MT'
      'Veiculo: MOTO'
      '--------------------------------------------------'
      'Descricao                    Quant    Unit   Total'
      '--------------------------------------------------'
      'AGUA MINERAL                   1      2,00    2,00'
      'SUITE MOMENTO 2 HORAS          1     50,00   50,00'
      ''
      ''
      '--------------------------------------------------'
      'Apto..: 022 Hora Entrada: 21:11  Hora Saida: 21:26'
      '--------------------------------------------------'
      'Total bruto..........: 52,00'
      'Total desconto (0,00):  0,00'
      'Liquido a pagar .....: 52,00'
      ''
      '--------------------------------------------------'
      '           VCware - Sistemas de Automacao')
    ParentCtl3D = False
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object ComboBox1: TComboBox
    Left = 123
    Top = 9
    Width = 145
    Height = 25
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ItemHeight = 17
    ItemIndex = 0
    ParentFont = False
    TabOrder = 2
    Text = 'JANEIRO'
    Items.Strings = (
      'JANEIRO'
      'FEVEREIRO'
      'MAR'#199'O'
      'ABRIL'
      'MAIO'
      'JUNHO'
      'JULHO'
      'AGOSTO'
      'SETEMBRO'
      'OUTUBRO'
      'NOVEMBRO'
      'DEZEMBRO')
  end
  object DataSource1: TDataSource
    DataSet = ZReadOnlyQuery1
    Left = 16
    Top = 504
  end
  object ZReadOnlyQuery1: TZReadOnlyQuery
    SQL.Strings = (
      
        'SELECT FL.data_sai, AP.nome, FL.entrada, FL.saida, FL.consumo, F' +
        'L.desconto, FL.veiculo'
      'FROM movimento_fluxo FL, apartamentos AP'
      'WHERE FL.cod_apto=AP.codigo')
    Params = <>
    Left = 48
    Top = 504
  end
end
