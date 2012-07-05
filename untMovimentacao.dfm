inherited frmMovimentacao: TfrmMovimentacao
  Left = 161
  Top = 27
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Movimenta'#231#245'es'
  ClientHeight = 497
  ClientWidth = 482
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
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 23
    Height = 13
    Caption = 'M'#234's:'
  end
  object Label2: TLabel
    Left = 208
    Top = 16
    Width = 22
    Height = 13
    Caption = 'Ano:'
  end
  object ComboBox1: TComboBox
    Left = 48
    Top = 16
    Width = 145
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 0
    Text = 'Janeiro'
    Items.Strings = (
      'Janeiro'
      'Fevereiro'
      'Mar'#231'o'
      'Abril'
      'Maio'
      'Junho'
      'Julho'
      'Agosto'
      'Setembro'
      'Outubro'
      'Novembro'
      'Dezembro')
  end
  object ComboBox2: TComboBox
    Left = 240
    Top = 16
    Width = 145
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 1
    Text = '2007'
    Items.Strings = (
      '2007'
      '2008'
      '2009'
      '2010'
      '2011'
      '2012'
      '2013'
      '2014'
      '2015')
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 56
    Width = 465
    Height = 385
    DataSource = DataSource1
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
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
        Width = 77
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
        Alignment = taCenter
        Expanded = False
        FieldName = 'entrada'
        Title.Caption = 'Entrada'
        Width = 50
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'saida'
        Title.Caption = 'Sa'#237'da'
        Width = 42
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
      end
      item
        Expanded = False
        FieldName = 'veiculo'
        Title.Caption = 'Ve'#237'culo'
        Width = 82
        Visible = True
      end>
  end
  object btnCancelar: TBitBtn
    Left = 176
    Top = 455
    Width = 130
    Height = 35
    Caption = 'Fechar'
    ModalResult = 2
    TabOrder = 3
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEF4F2EFE1DFDFD4D1DBD3D1DADFDCDFF6F5F4FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F0C3BFCC7872B4514ABB42
      3BC2413AC14E47BD746DB9BEBACEF4F3F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      F2F1EE8B85B63B34C22B25D72D26DB2D26D92D27D92D26DB2C25D9362FC67A74
      B4EAE9E8FFFFFFFFFFFFFFFFFFF1F0EF827CB63029D12E26D92E27D8322CD13C
      36CC3D37CC322BD02D26D82D27D92E27D46E68B4EAE9EAFFFFFFFEFEFEB3AEC9
      342DC82E27D92E27D82D26D65E57AEC3C0D5D2D0E9BAB7E25751C12E27D62E27
      D92F29CE9E9AC3FDFDFDECEAEA5D57BA2C25DB2E27D9403ADD322BDA342DD086
      80BAF5F5F1FFFFFFEDECEF6963C02D26D52D26DB4D46C0DFDDE4CAC8DA3C36C9
      2E28DA3730C9625DC25B56E2332DDA312AD1908BBCEEEDECFFFFFFD1CEE2443E
      C72E28DA362FCEB4B0CDADA9CA3334D22F31DD5956C3C6C3D76F6DCE5A5CE332
      33DC3435D0908DBDF6F4F1F3F2F26C69C02E30DD3031D5928EC2A1A0C83340D6
      3141E1676ABFF1EFF0E0DFED787BD0616DE53443DE3440D58685BAEBE8E57E7D
      BF303FDF3240D98787BFB4B3D2394DD8344DE4555EC5E1DFE4FFFFFFD6D6EA79
      7FD15F72E93951E3384DD88988B46065B9344DE4354BDB9999C8D4D2E2475CD2
      385AE63D56D6A7A4C1FDFCFAFFFFFFE0DFED727ED2617DEA3A5BE63954D73A54
      D43859E63F59D8C1C0D9F5F4F57580C63962E83B64E84B62C9B7B3C1F2F0EEFF
      FFFFDBDBEB7C88CE6283EB3C65E83B64E83A64E96473CAECEBEFFFFFFFC8C7DC
      4767D43E6FEC3E6DEB4B69CF8187B9ADABC2B0AFC27379B1496EDE3F6FEB3E6F
      EC4066DBB5B7D6FFFFFFFFFFFFFBFAFBACADCF466FDB437AF1447AF04177EF41
      71E74172E74176EF447AEF437AF14371E1999ECEF8F7FAFFFFFFFFFFFFFFFFFF
      FAF9FAB5B8DA627FD6487EEA4680F14782F44783F44681F1487EEC5A7CD8A5AA
      D4F7F6FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E4EFABB3DC7589CF61
      7FD1607FD27187D09EA6D5DCDBE9FCFBFCFFFFFFFFFFFFFFFFFF}
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = dmPrincipal.conn
    CursorType = ctStatic
    AfterOpen = ADOQuery1AfterOpen
    Parameters = <>
    SQL.Strings = (
      
        'SELECT FL.data_sai, AP.nome, FL.entrada, FL.saida, FL.consumo, F' +
        'L.desconto, FL.veiculo'
      'FROM movimento_fluxo FL, apartamentos AP'
      'WHERE FL.cod_apto=AP.codigo')
    Left = 424
    Top = 392
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 392
    Top = 392
  end
end
