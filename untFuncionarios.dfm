inherited frmFuncionarios: TfrmFuncionarios
  Left = 880
  Top = 132
  Caption = 'Funcion'#225'rios'
  ClientHeight = 332
  ClientWidth = 375
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
  PixelsPerInch = 96
  TextHeight = 13
  inherited bvl1: TBevel
    Left = 5
    Top = 289
    Width = 365
  end
  inherited bvl2: TBevel
    Left = 5
    Top = 139
    Width = 365
  end
  object sh1: TShape [2]
    Left = 5
    Top = 147
    Width = 365
    Height = 35
    Brush.Color = 15790320
  end
  object lblNome: TLabel [3]
    Left = 10
    Top = 150
    Width = 28
    Height = 13
    Caption = 'Nome'
    Transparent = True
  end
  object sh2: TShape [4]
    Left = 5
    Top = 181
    Width = 365
    Height = 35
    Brush.Color = 15790320
  end
  object Label1: TLabel [5]
    Left = 10
    Top = 184
    Width = 46
    Height = 13
    Caption = 'Endere'#231'o'
    Transparent = True
  end
  object sh3: TShape [6]
    Left = 5
    Top = 215
    Width = 365
    Height = 35
    Brush.Color = 15790320
  end
  object Label2: TLabel [7]
    Left = 10
    Top = 218
    Width = 42
    Height = 13
    Caption = 'Telefone'
    Transparent = True
  end
  object sh4: TShape [8]
    Left = 5
    Top = 249
    Width = 365
    Height = 35
    Brush.Color = 15790320
  end
  object Label3: TLabel [9]
    Left = 10
    Top = 252
    Width = 31
    Height = 13
    Caption = 'Senha'
    Transparent = True
  end
  inherited grd01: TDBGrid
    Width = 365
    Height = 129
    Columns = <
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Width = 263
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'telefone'
        Title.Caption = 'Telefone'
        Width = 81
        Visible = True
      end>
  end
  inherited btNovo: TPngBitBtn
    Left = 5
    Top = 297
    TabOrder = 5
  end
  inherited btAlterar: TPngBitBtn
    Left = 93
    Top = 297
    TabOrder = 6
  end
  inherited btExcluir: TPngBitBtn
    Left = 181
    Top = 297
    TabOrder = 7
  end
  inherited btFechar: TPngBitBtn
    Left = 269
    Top = 297
    TabOrder = 8
  end
  inherited btGravar: TPngBitBtn
    Left = 194
    Top = 297
    TabOrder = 9
  end
  inherited btCancelar: TPngBitBtn
    Left = 282
    Top = 297
    TabOrder = 10
  end
  object edtNome: TEdit [17]
    Left = 20
    Top = 164
    Width = 334
    Height = 17
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
    TabOrder = 1
  end
  object edtEndereco: TEdit [18]
    Left = 20
    Top = 198
    Width = 334
    Height = 17
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
    MaxLength = 80
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object edtTelefone: TEdit [19]
    Left = 20
    Top = 232
    Width = 334
    Height = 17
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
    MaxLength = 10
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object edtSenha: TEdit [20]
    Left = 20
    Top = 266
    Width = 334
    Height = 17
    TabStop = False
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = 15790320
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 10
    ParentCtl3D = False
    ParentFont = False
    PasswordChar = '*'
    ReadOnly = True
    TabOrder = 4
  end
  inherited ds01: TDataSource
    Left = 312
    Top = 96
  end
  inherited zquery: TZQuery
    Active = True
    SQL.Strings = (
      'SELECT * FROM funcionarios ORDER BY nome')
    Left = 280
    Top = 96
  end
  inherited Timer1: TTimer
    Left = 208
    Top = 96
  end
end
