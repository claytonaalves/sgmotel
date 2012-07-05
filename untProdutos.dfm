inherited frmProdutos: TfrmProdutos
  Left = 814
  Top = 119
  Caption = 'Produtos'
  ClientHeight = 436
  ClientWidth = 444
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
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited bvl1: TBevel
    Left = 5
    Top = 394
    Width = 433
  end
  inherited bvl2: TBevel
    Left = 5
    Top = 211
    Width = 433
  end
  object Shape1: TShape [2]
    Left = 5
    Top = 219
    Width = 433
    Height = 35
    Brush.Color = 14737632
  end
  object sh1: TShape [3]
    Left = 5
    Top = 253
    Width = 433
    Height = 35
    Brush.Color = 15790320
  end
  object lbl1: TLabel [4]
    Left = 10
    Top = 222
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
    Transparent = True
  end
  object sh2: TShape [5]
    Left = 5
    Top = 285
    Width = 433
    Height = 35
    Brush.Color = 15790320
  end
  object lbl2: TLabel [6]
    Left = 10
    Top = 256
    Width = 28
    Height = 13
    Caption = 'Nome'
    Transparent = True
  end
  object lblCodigoNum: TLabel [7]
    Left = 87
    Top = 229
    Width = 5
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lbl3: TLabel [8]
    Left = 10
    Top = 288
    Width = 55
    Height = 13
    Caption = 'Quantidade'
    Transparent = True
  end
  object sh4: TShape [9]
    Left = 5
    Top = 353
    Width = 433
    Height = 35
    Brush.Color = 15790320
  end
  object lbl4: TLabel [10]
    Left = 10
    Top = 356
    Width = 63
    Height = 13
    Caption = 'Valor Unit'#225'rio'
    Transparent = True
  end
  object lblCodigo: TLabel [11]
    Left = 20
    Top = 237
    Width = 43
    Height = 13
    Caption = 'lblCodigo'
    Transparent = True
  end
  object sh3: TShape [12]
    Left = 5
    Top = 319
    Width = 433
    Height = 35
    Brush.Color = 15790320
  end
  object Label1: TLabel [13]
    Left = 10
    Top = 322
    Width = 76
    Height = 13
    Caption = 'Estoque m'#237'nimo'
    Transparent = True
  end
  inherited grd01: TDBGrid
    Width = 433
    Height = 201
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Caption = 'C'#243'digo'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Width = 197
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantidade'
        Title.Caption = 'Estoque'
        Width = 78
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
        Title.Caption = 'Valor unt.'
        Width = 77
        Visible = True
      end>
  end
  inherited btNovo: TPngBitBtn
    Left = 5
    Top = 402
  end
  inherited btAlterar: TPngBitBtn
    Left = 93
    Top = 402
    TabOrder = 4
  end
  inherited btExcluir: TPngBitBtn
    Left = 181
    Top = 402
    TabOrder = 5
  end
  inherited btFechar: TPngBitBtn
    Left = 269
    Top = 402
    TabOrder = 6
  end
  inherited btGravar: TPngBitBtn
    Left = 263
    Top = 402
    TabOrder = 2
  end
  inherited btCancelar: TPngBitBtn
    Left = 351
    Top = 402
    TabOrder = 3
  end
  object edtNome: TEdit [21]
    Left = 20
    Top = 270
    Width = 405
    Height = 15
    TabStop = False
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = 15790320
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 50
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
  end
  object edtQtde: TEdit [22]
    Left = 20
    Top = 302
    Width = 405
    Height = 15
    TabStop = False
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = 15790320
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 5
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 8
    Text = '01'
    OnExit = EditsOnExit
    OnKeyPress = EditsJustNumbers_KeyPress
  end
  object edtValor: TEdit [23]
    Left = 20
    Top = 370
    Width = 405
    Height = 15
    TabStop = False
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = 15790320
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 20
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 10
    OnExit = EditsOnExit
    OnKeyPress = EditsCurrNumbers_KeyPress
  end
  object edtEstoqueMin: TEdit [24]
    Left = 20
    Top = 336
    Width = 405
    Height = 15
    TabStop = False
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = 15790320
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 5
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 9
    Text = '01'
    OnExit = EditsOnExit
    OnKeyPress = EditsJustNumbers_KeyPress
  end
  inherited ds01: TDataSource
    Left = 56
  end
  inherited zquery: TZQuery
    SQL.Strings = (
      'SELECT * FROM produtos ORDER BY nome')
  end
end
