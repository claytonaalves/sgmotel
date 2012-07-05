inherited frmTiposApto: TfrmTiposApto
  Left = 363
  Top = 281
  Caption = 'Tipos de Apartamentos'
  ClientHeight = 262
  ClientWidth = 734
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
  TextHeight = 13
  inherited bvl1: TBevel
    Left = 5
    Top = 220
    Width = 724
  end
  object sh5: TShape [1]
    Left = 286
    Top = 5
    Width = 441
    Height = 35
    Brush.Color = 15790320
  end
  object lblNome: TLabel [2]
    Left = 291
    Top = 8
    Width = 48
    Height = 13
    Caption = 'Descri'#231#227'o'
    Transparent = True
  end
  object sh1: TShape [3]
    Left = 286
    Top = 181
    Width = 152
    Height = 35
    Brush.Color = 15790320
  end
  object Label1: TLabel [4]
    Left = 291
    Top = 184
    Width = 109
    Height = 13
    Caption = 'Descri'#231#227'o do momento'
    Transparent = True
  end
  object sh2: TShape [5]
    Left = 437
    Top = 181
    Width = 83
    Height = 35
    Brush.Color = 15790320
  end
  object Label2: TLabel [6]
    Left = 442
    Top = 184
    Width = 68
    Height = 13
    Caption = 'Tempo (horas)'
    Transparent = True
  end
  object sh3: TShape [7]
    Left = 519
    Top = 181
    Width = 89
    Height = 35
    Brush.Color = 15790320
  end
  object Label3: TLabel [8]
    Left = 524
    Top = 184
    Width = 75
    Height = 13
    Caption = 'Toler'#226'ncia (min)'
    Transparent = True
  end
  object sh4: TShape [9]
    Left = 607
    Top = 181
    Width = 64
    Height = 35
    Brush.Color = 15790320
  end
  object Label4: TLabel [10]
    Left = 612
    Top = 184
    Width = 41
    Height = 13
    Caption = 'Valor R$'
    Transparent = True
  end
  inherited bvl2: TBevel
    Left = 278
    Top = 6
    Width = 3
    Height = 214
  end
  inherited grd01: TDBGrid
    Width = 268
    Height = 211
    Columns = <
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Descri'#231#227'o'
        Width = 247
        Visible = True
      end>
  end
  inherited btNovo: TPngBitBtn
    Left = 5
    Top = 228
    TabOrder = 8
  end
  inherited btAlterar: TPngBitBtn
    Left = 93
    Top = 228
    TabOrder = 9
  end
  inherited btExcluir: TPngBitBtn
    Left = 181
    Top = 228
    TabOrder = 10
  end
  inherited btFechar: TPngBitBtn
    Left = 269
    Top = 228
    TabOrder = 11
  end
  inherited btGravar: TPngBitBtn
    Left = 552
    Top = 228
    TabOrder = 12
  end
  inherited btCancelar: TPngBitBtn
    Left = 640
    Top = 228
    TabOrder = 13
  end
  object gMomentos: TDBGrid [19]
    Left = 286
    Top = 46
    Width = 442
    Height = 128
    TabStop = False
    Color = 15790320
    Ctl3D = True
    DataSource = ds2
    Enabled = False
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    TabOrder = 14
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 189
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tempo'
        Title.Caption = 'Tempo (hrs)'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tolerancia'
        Title.Caption = 'Toler'#226'ncia (min)'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor'
        Title.Caption = 'Valor (R$)'
        Width = 71
        Visible = True
      end>
  end
  object edt1: TEdit [20]
    Left = 301
    Top = 22
    Width = 410
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
    MaxLength = 20
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    OnChange = EditsChange
  end
  object edt2: TEdit [21]
    Left = 301
    Top = 199
    Width = 133
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
    MaxLength = 50
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    OnChange = EditsChange
    OnExit = EditsExit
  end
  object edt3: TEdit [22]
    Left = 452
    Top = 199
    Width = 64
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
    MaxLength = 2
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    OnChange = EditsChange
    OnExit = EditsExit
    OnKeyPress = EditsJustNumbers_KeyPress
  end
  object edt4: TEdit [23]
    Left = 534
    Top = 199
    Width = 64
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
    TabOrder = 4
    OnChange = EditsChange
    OnExit = EditsExit
    OnKeyPress = EditsJustNumbers_KeyPress
  end
  object edt5: TEdit [24]
    Left = 622
    Top = 199
    Width = 44
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
    MaxLength = 5
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
    OnChange = EditsChange
    OnExit = EditsExit
    OnKeyPress = EditsCurrNumbers_KeyPress
  end
  object btAddMomento: TPngBitBtn [25]
    Left = 671
    Top = 181
    Width = 29
    Height = 35
    Enabled = False
    TabOrder = 6
    TabStop = False
    OnClick = btAddMomentoClick
    PngImage.Data = {
      89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
      610000001974455874536F6674776172650041646F626520496D616765526561
      647971C9653C000002BD4944415478DAA5935D4893511CC61FA79B2E5147989B
      1F11393517A2859A14AD297993941012A951E285177D48924965305951525E04
      F346F1A29412224548574E45243315A4462853E647687EA492B8ED7DA77BCF79
      DF5E375C507A53FF73713817CFEFFCCFFF3C8F9F2008F89FF2FB1350D37D5B4D
      795A4828BD422851119E82A364493C37897BB331FFE5D4AE809AEEF23C42F9DA
      FD4A7564A22A05726908DCBC1B3F9CF318B4F562797565911052DA50D4D2FA17
      C02BA68D69F1BAE08488644CDA27B0E49A07C77308938521421E8D810933C626
      AD8CD859D1AB928E561FE0695779ACD876FF11F589A804650AFA16CD6019169C
      4010141408415C9BFC2634A149F834DE838999A9058E106DDB8D9E690FA0BAB3
      4CAF50EC33641DCAC5D0CA0738DD0C1886C19D0C83A7BB479FEFC1C5D8219106
      2043A545536F3D180757D571B3EF8107F0D0546A4BD5E8E236256E4CADDAC477
      737038ECA83E6DF400AEB55C4288420AC2132488B3D97430300DF74C9A6F7D8C
      F700F46FAFB29947CFC9271C635873AEA1F2D8E31DBFACACB300A1720592C2D3
      50F7AEC1D55B31B4C703A86C2B618FA764CBADF651B8E806AA526B760584C842
      91AC4C87B1BDCED57F77C40BA86829B6A90F6AE2F84001DFEDB360B90D30CB76
      345C78E3136E95C44F82F8F0C360D759B40C9A2607EF5BBC4F287B7D59BF2161
      0D67532F6260AE0B1B94838CF7C393EC173E004F05C82401C88CCBC1B30E23D6
      1DCEAA11FDA87788D79B0B62394AFB9511E151E9EA5318F8D6E91998F8B510E8
      16428054E20F9D3A07668B0943E35F1744CF682D06EBB4CF48C5CFCF8B46228D
      D12A65B036311B73EB33985F9B81C0F388D91B8B98D003786F69C7B0759411ED
      5D248A7F1B69BBF2EBCFE4897EAFA5FE2452A739096558E4D6E598FB390BF397
      5ED89DECA2282EDD16EF18A65C63965A841472BE3011314CD41326CA93668B61
      7CF730FD4BFD0276F996F0D72273FA0000000049454E44AE426082}
    PngOptions = [pngBlendOnDisabled, pngGrayscaleOnDisabled]
  end
  object btRemMomento: TPngBitBtn [26]
    Left = 700
    Top = 181
    Width = 29
    Height = 35
    Enabled = False
    TabOrder = 7
    TabStop = False
    OnClick = btRemMomentoClick
    PngImage.Data = {
      89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
      610000001974455874536F6674776172650041646F626520496D616765526561
      647971C9653C000002954944415478DAA593ED4B536118C6AF33DBD636734C13
      7599914E320B3243C9425351316C516964122E2A08C5FD0581627F4120414484
      1A884403732A4A6AA010256192F992DB7CD964BE8496DACE1967E7799E8E130D
      6B7EA9EBD3CD03D78FFBB9EFEBE61863F81F717F023C566B1223B44202A96462
      20968282316991803653465A4E3C6F75ED0998AFB1964A9434441C37C5E9D2D2
      C019F4805F4060D18BD5DE5E7C5F5D59208C584FBF68B3FD05D83413429A220B
      7275BAB45320AE3160C9038822B87003B8230958B177C133EBF4512259325ABB
      6D3B00774D4DA2DCF660544E96519B910ED2DF0E5EF0832301A8554A70948189
      7E20351DDFBADF607EC9ED254CCA3EFFF2ED74103057555DAB3546D5475EBB0A
      FABE0F84DF802008D82F0ABBE6437C02949979986C7C8A3525EA725E0D3C0C02
      66AAEF3B620A734C4AC90F7E6E0AD2A80BA1A48AD543119300DF9A80F12F03CE
      5CDBBBE420C059758F4FB852A2E1A646C0AFAF41FFE05148C0F24D33940603C2
      CE9CC5C7F64621FFF590360870DCB5F0878BF3359CE313A8DC85A6F6C99E00EE
      801EEACC7318EA782614B40D6F0126EFDC72C4A4269B344A02C93D03DEFB2374
      6A140AA8534E62DD2F6262A4C759D4F979EB0B63B7CB6BD5FC46FDA1EB3720F6
      74802A24043602BB07B8B96E850AFA8B660CDB1EE3A7C8D715778D6F0D71D452
      9648146CF0A036C21899970BC16E87BC6B304240C0C96E2A23F621E2D265B8FB
      BB30B73CEE251CCB2EE99C98DE09D27085B99432A9293A3C4A179D570871D605
      D1E5021529D4C74C50C51F85A7CF8E9995291FE5A84536FF0ED2B63E9417C969
      941AD4448C8B4FC992D7660CBEF35E379C6303E0897F41365BB7CD218F69B0EC
      42129302155218AD6494C4CA0705B95E94EB662A492D25DD5FF73EA67FD12FCA
      BE71F0E82977BB0000000049454E44AE426082}
    PngOptions = [pngBlendOnDisabled, pngGrayscaleOnDisabled]
  end
  inherited ds01: TDataSource
    Top = 167
  end
  inherited zquery: TZQuery
    Active = True
    SQL.Strings = (
      'SELECT id, nome FROM apartamentos_tipos')
    Top = 168
  end
  object qryMomentos: TZReadOnlyQuery
    Connection = dmPrincipal.zconn
    AfterOpen = qryMomentosAfterOpen
    SQL.Strings = (
      'SELECT * FROM valores_momentos WHERE id_tipo=0')
    Params = <>
    Left = 608
    Top = 115
  end
  object ds2: TDataSource
    DataSet = qryMomentos
    Left = 640
    Top = 115
  end
end
