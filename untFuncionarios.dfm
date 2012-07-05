inherited frmFuncionarios: TfrmFuncionarios
  Left = 402
  Top = 153
  Caption = 'Funcion'#225'rios'
  ClientHeight = 466
  ClientWidth = 546
  Icon.Data = {
    0000010001001010000001001800680300001600000028000000100000002000
    0000010018000000000040030000000000000000000000000000000000000000
    00000000C08A75CB7034D27E41D37E41D17C41CD7A3FB45F3F00000000000000
    0000000000000000000000000000529CE27185ACC87E59FFBA66FFB761FFB05E
    FFB25DFFB45CDE885787737E4C9BE60000000000000000000000000000003685
    D393ACCCE7AF73FFB85FFEB05FFEA75BFDA055FF974DFD934DB39FA24E96DE00
    0000000000000000000000000000DDC3B5B7755CFDD7B2FFD684FFCA65FFC05E
    FFB456FFA757FFC592D67D5BB7907F0000000000000000000000000000000000
    00DDB29BCF7A5AFFE8C0ADAA86A79E7DA09275F7CA9CE49475C8836500000000
    0000000000000000000000000000000000000000CB9E87707C9673ADE781B1E3
    7DB2E76C98C474552C5CA46459A86859A76756A3645493560000000000000000
    0000000000000073A4D6ACD1F2AED7FDB0D4F592C0E754838979CF9477CE8E76
    CE8F76CE916BB4745A8F5A4C9BE60000000000006B8EB7A7BFDB96C5F1A1D0FB
    96C6F3B6CFE4417AA778CE8F75CD8970CB836ACB7B6AC9796096614E96DE0000
    00000000617EA950699A6380AE7CA6D65573A5435D924467987CD09F77CE9771
    CD8E72CD889DD8AB6DB07088A78B000000000000000000456296415B90415B90
    415B90415B906F8F9E8499937D9489758C7FA4D5B182BF8577AE7B0000000000
    000000000000000000004C6A9B415D924662985779876E7A9473ADE781B1E37D
    B2E76C98C468916A000000000000000000000000000000000000000000000000
    00000000000073A4D6ACD1F2AED7FDB0D4F592C0E77D92AA0000000000000000
    000000000000000000000000000000000000007AA0C5B8D0E796C5F1A1D0FB96
    C6F3B6CFE44B93C7000000000000000000000000000000000000000000000000
    00000079A3C734AEE565B8E68DC8F63BADE61DA7E5319ED70000000000000000
    0000000000000000000000000000000000000000000023A4DF19A6E519A6E519
    A6E519A6E583ABC5000000000000000000000000000000000000000000000000
    000000000000000000319DD51BA5E424A1DF77A6C4000000000000000000C07F
    0000001F0000001F0000001F0000803F0000C0030000E0000000C0000000C000
    0000E0010000F0030000FF030000FE030000FE030000FF030000FF870000}
  OldCreateOrder = True
  ExplicitWidth = 552
  ExplicitHeight = 499
  PixelsPerInch = 96
  TextHeight = 14
  inherited btnNovo: TBmsXPButton
    Left = 84
    Top = 426
    ExplicitLeft = 84
    ExplicitTop = 426
  end
  inherited btnAlterar: TBmsXPButton
    Left = 180
    Top = 426
    ExplicitLeft = 180
    ExplicitTop = 426
  end
  inherited btnExcluir: TBmsXPButton
    Left = 275
    Top = 426
    ExplicitLeft = 275
    ExplicitTop = 426
  end
  inherited btnFechar: TBmsXPButton
    Left = 371
    Top = 426
    ExplicitLeft = 371
    ExplicitTop = 426
  end
  inherited XiPanel1: TXiPanel
    inherited grd01: TDBGrid
      Width = 533
      Height = 190
      Columns = <
        item
          Expanded = False
          FieldName = 'id'
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Width = 240
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cargo'
          Width = 136
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'telefone'
          Width = 87
          Visible = True
        end>
    end
    inherited edtLocalizar: TAdvEdit
      Width = 532
      ExplicitWidth = 532
    end
  end
  object gbDados: TGroupBox [5]
    Left = 5
    Top = 251
    Width = 536
    Height = 164
    Caption = ' Dados do Funcion'#225'rio Selecionado: '
    TabOrder = 5
    object BmsXPLabel1: TBmsXPLabel
      Left = 65
      Top = 30
      Width = 51
      Height = 16
      Alignment = taLeftJustify
      Caption = 'C'#243'digo:'
      AutoSize = True
      Shadow.Color = clWhite
      Shadow.Style = ssBottom
      Shadow.OffSet = 1
      Transparent = True
      Layout = tlCenter
      WordWrap = False
      ShowAccelChar = True
    end
    object lblTipo: TBmsXPLabel
      Left = 253
      Top = 30
      Width = 44
      Height = 16
      Alignment = taLeftJustify
      Caption = 'Cargo:'
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
      Left = 79
      Top = 55
      Width = 37
      Height = 16
      Alignment = taLeftJustify
      Caption = 'Nome:'
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
      Left = 51
      Top = 80
      Width = 65
      Height = 16
      Alignment = taLeftJustify
      Caption = 'Endere'#231'o:'
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
      Left = 51
      Top = 105
      Width = 65
      Height = 16
      Alignment = taLeftJustify
      Caption = 'Telefone:'
      AutoSize = True
      Shadow.Color = clWhite
      Shadow.Style = ssBottom
      Shadow.OffSet = 1
      Transparent = True
      Layout = tlCenter
      WordWrap = False
      ShowAccelChar = True
    end
    object BmsXPLabel6: TBmsXPLabel
      Left = 315
      Top = 130
      Width = 44
      Height = 16
      Alignment = taLeftJustify
      Caption = 'Senha:'
      AutoSize = True
      Shadow.Color = clWhite
      Shadow.Style = ssBottom
      Shadow.OffSet = 1
      Transparent = True
      Layout = tlCenter
      WordWrap = False
      ShowAccelChar = True
    end
    object BmsXPLabel7: TBmsXPLabel
      Left = 301
      Top = 105
      Width = 58
      Height = 16
      Alignment = taLeftJustify
      Caption = 'Celular:'
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
      Left = 65
      Top = 130
      Width = 51
      Height = 16
      Alignment = taLeftJustify
      Caption = 'Acesso:'
      AutoSize = True
      Shadow.Color = clWhite
      Shadow.Style = ssBottom
      Shadow.OffSet = 1
      Transparent = True
      Layout = tlCenter
      WordWrap = False
      ShowAccelChar = True
    end
    object edtCodigo: TAdvEdit
      Left = 122
      Top = 27
      Width = 101
      Height = 22
      TabStop = False
      BevelKind = bkSoft
      BorderStyle = bsNone
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = '000'
      Alignment = taCenter
      ColorOnEnter = clBtnFace
      TabOnEnter = True
      ValueType = vtNumbers
    end
    object cmbCargo: TComboBox
      Tag = 1
      Left = 303
      Top = 27
      Width = 182
      Height = 22
      BevelKind = bkSoft
      Color = clBtnFace
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ItemHeight = 14
      MaxLength = 20
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      TabStop = False
    end
    object edtNome: TAdvEdit
      Tag = 1
      Left = 122
      Top = 52
      Width = 363
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
    object edtEndereco: TAdvEdit
      Tag = 1
      Left = 122
      Top = 77
      Width = 363
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
    object edtTelefone: TAdvEdit
      Tag = 1
      Left = 122
      Top = 102
      Width = 120
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
      Text = '(66) 2222-2222'
      Alignment = taLeftJustify
      ColorOnEnter = clBtnFace
      TabOnEnter = True
    end
    object edtCelular: TAdvEdit
      Tag = 1
      Left = 365
      Top = 102
      Width = 120
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
      TabOrder = 5
      Alignment = taLeftJustify
      ColorOnEnter = clBtnFace
      TabOnEnter = True
    end
    object edtSenha: TAdvEdit
      Tag = 1
      Left = 365
      Top = 127
      Width = 120
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
      TabOrder = 6
      Alignment = taLeftJustify
      ColorOnEnter = clBtnFace
      TabOnEnter = True
    end
    object cmbAcesso: TComboBox
      Tag = 1
      Left = 121
      Top = 127
      Width = 141
      Height = 22
      BevelKind = bkSoft
      Color = clBtnFace
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ItemHeight = 14
      MaxLength = 20
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 7
      TabStop = False
      Items.Strings = (
        'Total'
        'Parcial'
        'Limitado')
    end
  end
  object XiPanel3: TXiPanel [6]
    Left = 5
    Top = 7
    Width = 51
    Height = 26
    ColorFace = clWhite
    ColorGrad = 14344414
    ColorLight = clSilver
    ColorDark = clSilver
    ColorScheme = csCustom
    FillDirection = fdVertical
    Caption = 'C'#243'd.'
    TabOrder = 6
    UseDockManager = True
  end
  object XiPanel4: TXiPanel [7]
    Left = 55
    Top = 7
    Width = 242
    Height = 26
    ColorFace = clWhite
    ColorGrad = 14344414
    ColorLight = clSilver
    ColorDark = clSilver
    ColorScheme = csCustom
    FillDirection = fdVertical
    Caption = 'Nome'
    TabOrder = 8
    UseDockManager = True
  end
  object XiPanel2: TXiPanel [8]
    Left = 433
    Top = 7
    Width = 107
    Height = 26
    ColorFace = clWhite
    ColorGrad = 14344414
    ColorLight = clSilver
    ColorDark = clSilver
    ColorScheme = csCustom
    FillDirection = fdVertical
    Caption = 'Telefone'
    TabOrder = 7
    UseDockManager = True
  end
  inherited ds01: TDataSource
    Left = 344
    Top = 191
  end
  inherited qry01: TZQuery
    Active = True
    SQL.Strings = (
      'SELECT * FROM funcionarios')
    Left = 312
    Top = 191
  end
end
