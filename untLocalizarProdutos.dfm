inherited frmLocalizarProdutos: TfrmLocalizarProdutos
  Left = 450
  Top = 221
  Caption = 'Localizar produto'
  ClientHeight = 360
  ClientWidth = 393
  Icon.Data = {
    0000010001001010000001001800680300001600000028000000100000002000
    0000010018000000000040030000000000000000000000000000000000000000
    00000000000000000000000000000000000000000000000000A57E5EB28056AF
    7E52A47A59000000000000000000000000000000000000000000000000000000
    000000A9876AB28158CBAB89D1B495BB8E63B5875AAB774DA380630000000000
    00000000000000000000000000000000AD8057D5BB9FD6BB9ED3B89CD1B394B7
    895DBA8E62B88D61B28156A8764E000000000000000000689A6C63A26A61A169
    B17E52E1CDB8D8C0A5D8C0A7D4BA9DB88C60B78A60B88D61BA8E62B17E520000
    0076A07A66A36C93C0999EC7A471AC78AF7E51E3D0BCDAC3ABD3B89EC7A37DC1
    986FB6895CB78A60BA8E62B18054649F6CA9CDAFA6CCACA2C9A999C59F6BA974
    AE7C4FDCC8B0BF9F81B88D65D1B38FD1B38FBB9066BC9168B78A60B17E5262A1
    69C0DAC5ADD0B3ABCEB19EC8A66DAA76957B7E5A61C85058E34F56E0585FC890
    7884BB9066D1B38FC6A27BA9795060A068C5DEC9B4D4B9A4C9AA81AB9A616DC3
    5058E06668EB9393F46163EA585BE44952DC6063BEA6897FC19A71B89F8B5D9F
    65B9D6BE87BA8F71AC785359DC666AEB9896F49191F3898AF05B5FE75F62E95D
    61E85158E44A55D800000000000065A06C86BA8F99C6A274AD7C4F57E2B4B1F9
    9796F49393F48C8DF05C60E85C61E75D61E85F62E94F57E20000000000000000
    007CB48576AF7E6FAB784E54E1B4B1F99596F5666AEB6F71EC6E72EC5A5CE55C
    61E75F62E95158E20000000000000000000000000000006EA8774C52E0A2A2F4
    6A6CEC6163EA9793F79793F76468E96566EA5C61E74F57E20000000000000000
    00000000000000000000555BDB7C7CF29793F76468E95258E35258E36468E997
    93F77C7CF24E57D90000000000000000000000000000000000000000006E6FEC
    6668EB5F62E97878F07474F05F62E9696BEB6F71EC0000000000000000000000
    000000000000000000000000000000000000006163E35157E25157E25F62E300
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FF87
    0000FE010000FC000000E0000000800000000000000000000000000000000003
    00000003000080030000E0030000F0030000F8070000FE1F0000FFFF0000}
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape [0]
    Left = 5
    Top = 221
    Width = 382
    Height = 35
    Brush.Color = clSilver
  end
  object Shape3: TShape [1]
    Left = 5
    Top = 255
    Width = 382
    Height = 35
  end
  object Bevel2: TBevel [2]
    Left = 5
    Top = 297
    Width = 383
    Height = 3
  end
  object lblCodigo: TLabel [3]
    Left = 14
    Top = 227
    Width = 59
    Height = 18
    Caption = 'Produto:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lblQtde: TLabel [4]
    Left = 35
    Top = 263
    Width = 38
    Height = 18
    Caption = 'Qtde:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lblNome: TLabel [5]
    Left = 106
    Top = 231
    Width = 15
    Height = 19
    Caption = '---'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Bevel1: TBevel [6]
    Left = 5
    Top = 212
    Width = 383
    Height = 3
  end
  inherited btnCancelar: TPngBitBtn
    Left = 190
    Top = 307
    Width = 197
    Height = 48
    Font.Charset = ANSI_CHARSET
    Font.Height = -15
    Font.Name = 'Arial'
    ParentFont = False
    TabOrder = 3
  end
  inherited btnOk: TPngBitBtn
    Left = 6
    Top = 307
    Width = 183
    Height = 48
    Caption = 'Adicionar'
    Font.Charset = ANSI_CHARSET
    Font.Height = -15
    Font.Name = 'Arial'
    ParentFont = False
    TabOrder = 2
  end
  object grdProdutos: TDBGrid
    Left = 5
    Top = 6
    Width = 383
    Height = 199
    Ctl3D = False
    DataSource = dsProdutos
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = grdProdutosDblClick
    OnKeyPress = grdProdutosKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Produto'
        Width = 212
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantidade'
        Title.Caption = 'Estoque'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Valor R$'
        Width = 87
        Visible = True
      end>
  end
  object edtQtde: TEdit
    Left = 90
    Top = 266
    Width = 233
    Height = 17
    BorderStyle = bsNone
    Color = clWhite
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 3
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    OnChange = edtQtdeChange
    OnKeyPress = EditsJustNumbers_KeyPress
  end
  object dsProdutos: TDataSource
    DataSet = qProdutos
    Left = 303
    Top = 153
  end
  object qProdutos: TZReadOnlyQuery
    Connection = dmPrincipal.zconn
    AfterScroll = QueryAfterScroll
    Active = True
    SQL.Strings = (
      'SELECT id, nome, quantidade, valor'
      'FROM produtos'
      'ORDER BY nome')
    Params = <>
    Left = 336
    Top = 152
  end
  object Timer1: TTimer
    Interval = 3000
    OnTimer = Timer1Timer
    Left = 16
    Top = 168
  end
end
