inherited frmApartamentos: TfrmApartamentos
  Left = 152
  Top = 101
  Caption = 'Apartamentos'
  ClientHeight = 355
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
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 14
  object Shape1: TShape [0]
    Left = 8
    Top = 185
    Width = 467
    Height = 36
    Brush.Color = clSilver
  end
  object lblCodigo: TLabel [1]
    Left = 18
    Top = 195
    Width = 49
    Height = 14
    Caption = 'C'#243'digo:'
    Transparent = True
  end
  object lblCodigoNum: TLabel [2]
    Left = 97
    Top = 195
    Width = 5
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Shape3: TShape [3]
    Left = 8
    Top = 220
    Width = 467
    Height = 38
    Brush.Color = clInfoBk
  end
  object lblNome: TLabel [4]
    Left = 18
    Top = 232
    Width = 35
    Height = 14
    Caption = 'Apto:'
    Transparent = True
  end
  object Shape4: TShape [5]
    Left = 8
    Top = 256
    Width = 467
    Height = 37
    Brush.Color = clInfoBk
  end
  object lblQtde: TLabel [6]
    Left = 18
    Top = 266
    Width = 35
    Height = 14
    Caption = 'Tipo:'
    Transparent = True
  end
  inherited btnNovo: TBmsXPButton
    Left = 23
    Top = 317
    ExplicitLeft = 23
    ExplicitTop = 317
  end
  object cmbTipo: TComboBox [9]
    Left = 94
    Top = 263
    Width = 243
    Height = 19
    BevelInner = bvNone
    BevelOuter = bvNone
    Color = clInfoBk
    Ctl3D = False
    Enabled = False
    ItemHeight = 0
    ParentCtl3D = False
    TabOrder = 6
  end
  object edtNome: TEdit [10]
    Left = 97
    Top = 233
    Width = 354
    Height = 18
    TabStop = False
    BorderStyle = bsNone
    Color = clInfoBk
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 50
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
  end
  inherited btnAlterar: TBmsXPButton
    Left = 111
    Top = 317
    ExplicitLeft = 111
    ExplicitTop = 317
  end
  inherited btnExcluir: TBmsXPButton
    Left = 200
    Top = 317
    ExplicitLeft = 200
    ExplicitTop = 317
  end
  inherited btnFechar: TBmsXPButton
    Left = 375
    Top = 317
    ExplicitLeft = 375
    ExplicitTop = 317
  end
  inherited grd01: TDBGrid
    Top = 60
    Height = 118
    Columns = <
      item
        Expanded = False
        FieldName = 'codigo'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AP.nome'
        Title.Caption = 'Apartamento'
        Width = 185
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TI.nome'
        Title.Caption = 'Tipo'
        Width = 162
        Visible = True
      end>
  end
  inherited ds01: TDataSource
    Left = 376
    Top = 135
  end
  inherited qry01: TZQuery
    SQL.Strings = (
      
        'SELECT AP.codigo, AP.nome, TI.nome FROM apartamentos AP, tipos_a' +
        'pto TI'
      'WHERE AP.cod_tipo_apto=TI.codigo')
    Left = 344
    Top = 135
  end
  object qryTipos: TADOQuery
    Connection = dmPrincipal.conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT codigo, nome FROM tipos_apto')
    Left = 344
    Top = 104
  end
end
