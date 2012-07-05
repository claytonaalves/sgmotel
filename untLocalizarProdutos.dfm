inherited frmLocalizarProdutos: TfrmLocalizarProdutos
  Left = 695
  Top = 114
  Caption = 'Localizar Produto (Alterar esta janela)'
  ClientHeight = 328
  ClientWidth = 470
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
  ExplicitWidth = 476
  ExplicitHeight = 361
  PixelsPerInch = 96
  TextHeight = 13
  object XiPanel1: TXiPanel [0]
    Left = 0
    Top = 0
    Width = 473
    Height = 329
    ColorFace = clWhite
    ColorGrad = 14344414
    ColorLight = 8224125
    ColorDark = 6447714
    ColorScheme = csSilver
    FillDirection = fdVertical
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Lucida Console'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    UseDockManager = True
    object lbl04: TLabel
      Left = 16
      Top = 241
      Width = 140
      Height = 11
      Caption = 'Quantidade a lan'#231'ar:'
      Transparent = True
    end
    object Shape1: TShape
      Left = 16
      Top = 270
      Width = 440
      Height = 1
      Pen.Color = 8224125
    end
    object grdMov_Produtos: TDBGrid
      Left = 16
      Top = 40
      Width = 440
      Height = 168
      Ctl3D = False
      DataSource = dsProdutos
      Options = [dgTitles, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Lucida Console'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'nome'
          Title.Caption = 'Produto'
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'qtde'
          Title.Caption = 'Qtd'
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor'
          Title.Caption = 'Unt.'
          Width = 60
          Visible = True
        end>
    end
    object edtLocalizar: TEdit
      Left = 16
      Top = 210
      Width = 440
      Height = 17
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      OnChange = edtLocalizarChange
      OnKeyPress = EditsKeyPress
    end
    object fldCodigo: TXiPanel
      Left = 16
      Top = 14
      Width = 100
      Height = 26
      ColorFace = clWhite
      ColorGrad = 14344414
      ColorLight = clSilver
      ColorDark = clSilver
      ColorScheme = csCustom
      FillDirection = fdVertical
      Alignment = taLeftJustify
      Caption = ' C'#243'digo'
      TabOrder = 2
      UseDockManager = True
    end
    object XiPanel3: TXiPanel
      Left = 356
      Top = 14
      Width = 100
      Height = 26
      ColorFace = clWhite
      ColorGrad = 14344414
      ColorLight = clSilver
      ColorDark = clSilver
      ColorScheme = csCustom
      FillDirection = fdVertical
      Alignment = taLeftJustify
      Caption = ' Valor'
      TabOrder = 3
      UseDockManager = True
    end
    object fldNome: TXiPanel
      Tag = 1
      Left = 115
      Top = 14
      Width = 242
      Height = 26
      ColorFace = clWhite
      ColorGrad = clSilver
      ColorLight = clSilver
      ColorDark = clSilver
      ColorScheme = csCustom
      FillDirection = fdVertical
      Alignment = taLeftJustify
      Caption = ' Nome'
      TabOrder = 4
      UseDockManager = True
    end
    object AdvEdit3: TAdvEdit
      Tag = 1
      Left = 162
      Top = 233
      Width = 83
      Height = 22
      TabStop = False
      BevelKind = bkTile
      BorderStyle = bsNone
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      Text = '150'
      Alignment = taRightJustify
      ColorOnEnter = clBtnFace
      TabOnEnter = True
      ValueType = vtNumbers
    end
  end
  inherited btnOk: TBmsXPButton
    Left = 296
    Top = 285
    Width = 80
    Caption = 'Lan'#231'ar'
    Enabled = False
    ExplicitLeft = 296
    ExplicitTop = 285
    ExplicitWidth = 80
  end
  inherited btnCancelar: TBmsXPButton
    Left = 378
    Top = 285
    Width = 80
    Caption = 'Fechar'
    ExplicitLeft = 378
    ExplicitTop = 285
    ExplicitWidth = 80
  end
  object qryProdutos: TADOQuery
    Connection = dmPrincipal.conn
    CursorType = ctStatic
    AfterOpen = qryProdutosAfterOpen
    AfterScroll = qryProdutosAfterScroll
    Parameters = <>
    SQL.Strings = (
      'SELECT nome, qtde, valor FROM produtos')
    Left = 272
    Top = 104
  end
  object dsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 240
    Top = 104
  end
end
