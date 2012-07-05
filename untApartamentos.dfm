inherited frmApartamentos: TfrmApartamentos
  Left = 589
  Top = 181
  Caption = 'Apartamentos'
  ClientHeight = 370
  ClientWidth = 377
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
  PixelsPerInch = 96
  TextHeight = 13
  inherited bvl1: TBevel
    Left = 5
    Top = 329
    Width = 366
  end
  object sh1: TShape [1]
    Left = 5
    Top = 254
    Width = 367
    Height = 35
    Brush.Color = 15790320
  end
  object Label1: TLabel [2]
    Left = 10
    Top = 257
    Width = 37
    Height = 13
    Caption = 'Numero'
    Transparent = True
  end
  object sh2: TShape [3]
    Left = 5
    Top = 288
    Width = 367
    Height = 35
    Brush.Color = 15790320
  end
  object Label2: TLabel [4]
    Left = 10
    Top = 291
    Width = 21
    Height = 13
    Caption = 'Tipo'
    Transparent = True
  end
  inherited bvl2: TBevel
    Left = 5
    Top = 246
    Width = 366
  end
  inherited grd01: TDBGrid
    Width = 366
    Height = 237
    Columns = <
      item
        Expanded = False
        FieldName = 'apartamento'
        Title.Caption = 'Apartamento'
        Width = 154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tipo'
        Title.Caption = 'Tipo'
        Width = 187
        Visible = True
      end>
  end
  inherited btNovo: TPngBitBtn
    Left = 6
    Top = 336
  end
  inherited btAlterar: TPngBitBtn
    Left = 94
    Top = 336
  end
  inherited btExcluir: TPngBitBtn
    Left = 182
    Top = 336
  end
  inherited btFechar: TPngBitBtn
    Left = 270
    Top = 336
  end
  inherited btGravar: TPngBitBtn
    Left = 198
    Top = 335
  end
  inherited btCancelar: TPngBitBtn
    Left = 286
    Top = 335
  end
  object edtNome: TEdit [13]
    Left = 20
    Top = 272
    Width = 325
    Height = 16
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
    MaxLength = 3
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
    Text = '01'
    OnChange = EditsChange
    OnKeyPress = EditsJustNumbers_KeyPress
  end
  object cmbTipo: TComboBox [14]
    Left = 48
    Top = 295
    Width = 305
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemHeight = 13
    Sorted = True
    TabOrder = 8
    OnChange = EditsChange
  end
  inherited ds01: TDataSource
    Top = 199
  end
  inherited zquery: TZQuery
    SQL.Strings = (
      'SELECT ap.nome as apartamento, tp.nome as tipo, ap.id_tipo_apto'
      'FROM apartamentos ap '
      'LEFT JOIN apartamentos_tipos tp on ap.id_tipo_apto=tp.id;'
      'ORDER BY ap.nome')
    Top = 200
  end
  inherited Timer1: TTimer
    Top = 160
  end
end
