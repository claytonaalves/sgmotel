inherited frmTiposApto: TfrmTiposApto
  Left = 523
  Top = 121
  Caption = 'Tipos de Apartamentos'
  ClientHeight = 468
  ClientWidth = 406
  Icon.Data = {
    0000010001001010000001001800680300001600000028000000100000002000
    0000010018000000000040030000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000B7B7B7AEAEAE3071A92C6EA6286BA3
    2468A021669E1D639B1A6199175F97145C94115B936C6C6C6C6C6C0000000000
    000000000000003675AD86B6D883B3D781B2D67DAFD57BADD479ABD376AAD274
    A8D1155D950000000000000000000000000000000000003C79B18BB9DA66A2CE
    62A0CD5F9DCB5B9AC95897C85495C777ABD31960980000000000000000000000
    00000000000000427DB58FBDDC6CA7D067A4CF64A1CD609ECC5C9BCA5999C97B
    ADD41E649C0000000000000000000000000000000000004882BA93C0DD71ABD2
    6DA8D169A5CF66A2CE629FCC5E9CCB7FB0D523679F0000000000000000000000
    000000000000004E86BE98C3DF77AFD573ACD36FA9D26BA7D05BB7E354C2ED81
    B4D7286BA3000000000000000000000000000000000000538AC29CC6E17CB3D7
    79B1D575ADD471ABD25FBAE44BD4FF7CBBE02E6FA70000000000000000000000
    00000000000000598EC6A0C9E382B8D97EB5D87AB2D677AFD573ACD36DABD48C
    BADA3373AB0000000000000000000000000000000000005E91C9A4CCE487BBDB
    84B9DA80B6D87CB3D779B0D574ADD48FBDDC3977AF0000000000000000000000
    000000000000006395CDA8CFE58CBFDD88BDDC85BADB81B7D97EB4D77AB2D694
    C1DD3F7CB40000000000000000000000000000000000006798D0ABD1E790C2DF
    8DC0DE8ABEDC87BBDB83B8DA80B6D899C4E04580B80000000000000000000000
    000000000000006B9BD3AED4E8ABD3E8AAD1E7A8CFE5A5CDE4A2CBE4A0C9E29D
    C7E14B84BC0000000000000000000000000000000000006E9DD56C9BD3699AD2
    6697CF6395CD6093CB5C90C8598EC6558BC35188C00000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    000080010000E0070000E0070000E0070000E0070000E0070000E0070000E007
    0000E0070000E0070000E0070000E0070000E0070000FFFF0000FFFF0000}
  OldCreateOrder = True
  ExplicitWidth = 412
  ExplicitHeight = 493
  PixelsPerInch = 96
  TextHeight = 14
  inherited Bevel1: TBevel
    Width = 396
    ExplicitWidth = 396
  end
  inherited btnNovo: TBmsXPButton
    Left = 14
    Top = 427
    TabOrder = 2
    ExplicitLeft = 14
    ExplicitTop = 427
  end
  inherited btnAlterar: TBmsXPButton
    Left = 110
    Top = 427
    ExplicitLeft = 110
    ExplicitTop = 427
  end
  inherited btnExcluir: TBmsXPButton
    Left = 205
    Top = 427
    TabOrder = 0
    ExplicitLeft = 205
    ExplicitTop = 427
  end
  inherited btnFechar: TBmsXPButton
    Left = 301
    Top = 427
    ExplicitLeft = 301
    ExplicitTop = 427
  end
  inherited grd01: TDBGrid
    Width = 393
    Height = 190
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Width = 300
        Visible = True
      end>
  end
  inherited edtLocalizar: TAdvEdit
    Width = 392
    ExplicitWidth = 392
  end
  object gbDados: TGroupBox [7]
    Left = 5
    Top = 252
    Width = 396
    Height = 164
    Caption = ' Informa'#231#245'es do Tipo de Apartamento: '
    TabOrder = 6
    object BmsXPLabel1: TBmsXPLabel
      Left = 163
      Top = 30
      Width = 93
      Height = 16
      Alignment = taLeftJustify
      Caption = 'Nome do Tipo:'
      AutoSize = True
      Shadow.Color = clWhite
      Shadow.Style = ssBottom
      Shadow.OffSet = 1
      Transparent = True
      Layout = tlCenter
      WordWrap = False
      ShowAccelChar = True
    end
    object BmsXPLabel3: TBmsXPLabel
      Left = 72
      Top = 55
      Width = 184
      Height = 16
      Alignment = taLeftJustify
      Caption = 'Valor do Momento 02 horas:'
      AutoSize = True
      Shadow.Color = clWhite
      Shadow.Style = ssBottom
      Shadow.OffSet = 1
      Transparent = True
      Layout = tlCenter
      WordWrap = False
      ShowAccelChar = True
    end
    object BmsXPLabel4: TBmsXPLabel
      Left = 37
      Top = 80
      Width = 219
      Height = 16
      Alignment = taLeftJustify
      Caption = 'Valor do Momento ap'#243's 03 horas:'
      AutoSize = True
      Shadow.Color = clWhite
      Shadow.Style = ssBottom
      Shadow.OffSet = 1
      Transparent = True
      Layout = tlCenter
      WordWrap = False
      ShowAccelChar = True
    end
    object BmsXPLabel5: TBmsXPLabel
      Left = 37
      Top = 105
      Width = 219
      Height = 16
      Alignment = taLeftJustify
      Caption = 'Valor do momento ap'#243's 04 horas:'
      AutoSize = True
      Shadow.Color = clWhite
      Shadow.Style = ssBottom
      Shadow.OffSet = 1
      Transparent = True
      Layout = tlCenter
      WordWrap = False
      ShowAccelChar = True
    end
    object BmsXPLabel2: TBmsXPLabel
      Left = 93
      Top = 130
      Width = 163
      Height = 16
      Alignment = taLeftJustify
      Caption = 'Di'#225'ria (Ap'#243's 12 horas):'
      AutoSize = True
      Shadow.Color = clWhite
      Shadow.Style = ssBottom
      Shadow.OffSet = 1
      Transparent = True
      Layout = tlCenter
      WordWrap = False
      ShowAccelChar = True
    end
    object AdvEdit2: TAdvEdit
      Tag = 1
      Left = 262
      Top = 52
      Width = 97
      Height = 22
      TabStop = False
      BevelKind = bkSoft
      BiDiMode = bdLeftToRight
      BorderStyle = bsNone
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Alignment = taLeftJustify
      ColorOnEnter = clBtnFace
      TabOnEnter = True
    end
    object AdvEdit3: TAdvEdit
      Tag = 1
      Left = 262
      Top = 77
      Width = 97
      Height = 22
      TabStop = False
      BevelKind = bkSoft
      BiDiMode = bdLeftToRight
      BorderStyle = bsNone
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Alignment = taLeftJustify
      ColorOnEnter = clBtnFace
      TabOnEnter = True
    end
    object AdvEdit1: TAdvEdit
      Tag = 1
      Left = 262
      Top = 27
      Width = 97
      Height = 22
      TabStop = False
      BevelKind = bkSoft
      BiDiMode = bdLeftToRight
      BorderStyle = bsNone
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Alignment = taLeftJustify
      ColorOnEnter = clBtnFace
      TabOnEnter = True
    end
    object AdvEdit4: TAdvEdit
      Tag = 1
      Left = 262
      Top = 102
      Width = 97
      Height = 22
      TabStop = False
      BevelKind = bkSoft
      BiDiMode = bdLeftToRight
      BorderStyle = bsNone
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      Alignment = taLeftJustify
      ColorOnEnter = clBtnFace
      TabOnEnter = True
    end
    object AdvEdit5: TAdvEdit
      Tag = 1
      Left = 262
      Top = 127
      Width = 97
      Height = 22
      TabStop = False
      BevelKind = bkSoft
      BiDiMode = bdLeftToRight
      BorderStyle = bsNone
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      Alignment = taLeftJustify
      ColorOnEnter = clBtnFace
      TabOnEnter = True
    end
  end
  object XiPanel3: TXiPanel [8]
    Left = 5
    Top = 7
    Width = 78
    Height = 26
    ColorFace = clWhite
    ColorGrad = 14344414
    ColorLight = clSilver
    ColorDark = clSilver
    ColorScheme = csCustom
    FillDirection = fdVertical
    Caption = 'C'#243'digo'
    TabOrder = 7
    UseDockManager = True
  end
  object XiPanel4: TXiPanel [9]
    Left = 82
    Top = 7
    Width = 318
    Height = 26
    ColorFace = clWhite
    ColorGrad = 14344414
    ColorLight = clSilver
    ColorDark = clSilver
    ColorScheme = csCustom
    FillDirection = fdVertical
    Caption = 'Tipo'
    TabOrder = 8
    UseDockManager = True
  end
  inherited ds01: TDataSource
    Left = 344
    Top = 108
  end
  inherited qry01: TZQuery
    AutoCalcFields = False
    Active = True
    SQL.Strings = (
      'SELECT * from aptos_tipos')
    Left = 312
    Top = 108
  end
end
