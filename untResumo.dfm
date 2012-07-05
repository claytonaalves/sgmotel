inherited frmResumo: TfrmResumo
  Left = 295
  Top = 276
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Informa'#231#245'es do Apartamento xx'
  ClientHeight = 432
  ClientWidth = 493
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
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 499
  ExplicitHeight = 465
  PixelsPerInch = 96
  TextHeight = 13
  object XiPanel1: TXiPanel
    Left = 0
    Top = 0
    Width = 493
    Height = 433
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
    TabOrder = 0
    UseDockManager = True
    object Label2: TLabel
      Left = 256
      Top = 315
      Width = 112
      Height = 11
      Caption = 'Total Consumo:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblConsumo: TLabel
      Left = 380
      Top = 314
      Width = 56
      Height = 11
      Caption = 'R$ 0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label1: TLabel
      Left = 256
      Top = 335
      Width = 112
      Height = 11
      Caption = 'Total Geral..:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 16
      Top = 91
      Width = 119
      Height = 11
      Caption = 'Valor do Momento:'
      Transparent = True
    end
    object lblValor_Apto: TLabel
      Left = 147
      Top = 91
      Width = 56
      Height = 11
      Caption = 'R$ 0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblTotal: TLabel
      Left = 380
      Top = 335
      Width = 56
      Height = 11
      Caption = 'R$ 0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lbl01: TLabel
      Left = 16
      Top = 51
      Width = 119
      Height = 11
      Caption = 'N'#250'mero..........:'
      Transparent = True
    end
    object lblApto: TLabel
      Left = 147
      Top = 51
      Width = 16
      Height = 11
      Caption = '01'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lbl02: TLabel
      Left = 16
      Top = 71
      Width = 119
      Height = 11
      Caption = 'Tipo............:'
      Transparent = True
    end
    object lblTipo: TLabel
      Left = 147
      Top = 71
      Width = 64
      Height = 11
      Caption = 'ESPECIAL'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lbl04: TLabel
      Left = 255
      Top = 111
      Width = 133
      Height = 11
      Caption = 'Ve'#237'culo...........:'
      Transparent = True
    end
    object lblEntrada: TLabel
      Left = 400
      Top = 51
      Width = 40
      Height = 11
      Caption = '08:00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lbl03: TLabel
      Left = 255
      Top = 51
      Width = 133
      Height = 11
      Caption = 'Hor'#225'rio de Entrada:'
      Transparent = True
    end
    object Label5: TLabel
      Left = 255
      Top = 91
      Width = 133
      Height = 11
      Caption = 'Tempo Transcorrido:'
      Transparent = True
    end
    object lblTranscorrido: TLabel
      Left = 400
      Top = 91
      Width = 40
      Height = 11
      Caption = '01:35'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblVeiculo: TLabel
      Left = 400
      Top = 111
      Width = 32
      Height = 11
      Caption = 'Moto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label14: TLabel
      Left = 16
      Top = 16
      Width = 189
      Height = 19
      Caption = 'Informa'#231#245'es do Quarto'
      Font.Charset = ANSI_CHARSET
      Font.Color = 8224125
      Font.Height = -16
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Shape4: TShape
      Left = 16
      Top = 36
      Width = 206
      Height = 1
      Pen.Color = 8224125
    end
    object Label17: TLabel
      Left = 255
      Top = 16
      Width = 198
      Height = 19
      Caption = 'Informa'#231#245'es do Momento'
      Font.Charset = ANSI_CHARSET
      Font.Color = 8224125
      Font.Height = -16
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Shape5: TShape
      Left = 255
      Top = 36
      Width = 219
      Height = 1
      Pen.Color = 8224125
    end
    object Label4: TLabel
      Left = 17
      Top = 126
      Width = 171
      Height = 13
      Caption = 'Produtos Consumidos'
      Font.Charset = ANSI_CHARSET
      Font.Color = 8224125
      Font.Height = -13
      Font.Name = 'Lucida Console'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Shape6: TShape
      Left = 17
      Top = 146
      Width = 458
      Height = 1
      Pen.Color = 8224125
    end
    object Shape7: TShape
      Left = 17
      Top = 299
      Width = 458
      Height = 1
      Pen.Color = 8224125
    end
    object Label7: TLabel
      Left = 255
      Top = 71
      Width = 133
      Height = 11
      Caption = 'Hor'#225'rio de Sa'#237'da..:'
      Transparent = True
    end
    object Label8: TLabel
      Left = 17
      Top = 315
      Width = 119
      Height = 11
      Caption = 'Desconto (%)....:'
      Transparent = True
    end
    object Label9: TLabel
      Left = 17
      Top = 335
      Width = 119
      Height = 11
      Caption = 'Desconto ($)....:'
      Transparent = True
    end
    object Label6: TLabel
      Left = 17
      Top = 279
      Width = 99
      Height = 19
      Caption = 'Total Geral'
      Font.Charset = ANSI_CHARSET
      Font.Color = 8224125
      Font.Height = -16
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Shape2: TShape
      Left = 18
      Top = 370
      Width = 455
      Height = 1
      Pen.Color = 8224125
    end
    object Shape1: TShape
      Left = 239
      Top = 16
      Width = 1
      Height = 109
      Pen.Color = 8224125
    end
    object Shape3: TShape
      Left = 239
      Top = 310
      Width = 1
      Height = 43
      Pen.Color = 8224125
    end
    object Label10: TLabel
      Left = 400
      Top = 71
      Width = 40
      Height = 11
      Caption = '--:--'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object BmsXPButton1: TBmsXPButton
      Left = 242
      Top = 387
      Width = 190
      Height = 30
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFC1BFCE80819880809980809980809981809880809BC0C1C8FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFC1CB0904B53030DC322FDC32
        2FDC322FDC332EDC3230DC0A05B6BFBFCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        BFBFCC0D09AC3436DB0A0CD20A0CD20A0CD20A0CD2080CD20C0BD23037DA0E0A
        A9BFBFCEFFFFFFFFFFFFFFFFFFC0C0CC0D0EBA393BDE1815D31813D51713D717
        13D71713D71216D50E13DA1716D43A39DF110EB8BFC1CBFFFFFFC0BFE61A17A9
        4849E4191BD51618DB1819DA191AD9191AD9191AD91819D81B1BD61819D9191A
        D94548E61B13ADC4C0E88080BF504EE62121E42726E12424DD1F25D82224DD22
        24DD2224DD2224DD2224DC2224DC2224DC2722DD4A51E48280BD8382CC6A69EB
        2A2AE32928E22B2CDF292BE3292AE2292AE2292AE2292AE1292AE1292AE1292A
        E12C2AE26A6AEB8380D08282CF8386F4302EE72F30E42E2CE72F2DE7302EE730
        2EE7302EE72F2EE72F2EE72F2EE72F2EE72C2FE58784F48282D28080CA9294F8
        383BEB3C3AED393DEA393BEC3B3CEB3B3CEB3B3CEB3C3BEC3B3CE83A3CE83B3B
        EA3D3AEB9394F58080CA8182CFABA7FC3B3DEE443EF34040EC3F3DF03F3DF03F
        3DF03F3DF03F3EEF3F3BF53D3CF13D3EF0363FEEB0A4FF8081D08280CFADB3FC
        4E4EF44A4EEF4D4CF54B4DF54B4DF34B4DF34B4DF34B4DF14E4EEF514BF54E4A
        F34F4CF4B4B5FB8080CCC1C0E97572E59399FC5D55FB5355F75657F85457F654
        57F65457F65558F85158F85155FB5B54F6949AF97B75E3BFBFEBFFFFFFC1C0E4
        7B73E3A8AEFA5C5BF85A5BFC5A5BFC5A5BFC5A5BFC5A5AF95B5BFA605BF9ADAD
        F97C72E1C0C0E6FFFFFFFFFFFFFFFFFFC0C0EC7673E1A29FFC6363F96261FD62
        61FD6261FD6560FE6562FC9A9EFB6364E4BFBFEBFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFC0BFE57674E4BDBFFFBFBEFFBFBEFFBFBEFFBEBFFEC0BEFD7473E2BFC0
        E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFEA8180D48280D582
        80D58280D58180D58080DBC1BFE9FFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = '&Fechar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ModalResult = 2
      Layout = blGlyphLeft
      WordWrap = False
      ShowAccelChar = True
      ParentFont = False
      TabOrder = 0
    end
    object BmsXPButton2: TBmsXPButton
      Left = 49
      Top = 387
      Width = 190
      Height = 30
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1D639B196098145D95105A
        920D5890135C920C578F9999997171715454545151514F4F4F4C4C4C4A4A4A47
        474745454525679D3274A83D7CAF4784B54E8ABA3E7EAD0C578FFFFFFFFFFFFF
        585858A2A2A2A2A2A2A3A3A3A4A4A4A4A4A4A5A5A52F6FA578ABD278ABD373A7
        D169A0CD407FAE0F5991FFFFFFFFFFFF5C5C5CA0A0A03C3C72A2A2A2A3A3A3A3
        A3A3A4A4A43674AA7DAFD45B9AC95495C75896C84180AE135C94FFFFFFFFFFFF
        6060603939753C3C75A1A1A1A2A2A2A2A2A2A3A3A33D79B082B3D7629FCC5A9A
        C95E9BCA4381AF196098FFFFFFFFFFFF3939754C4C9348488E27276B25256823
        2366202060457EB488B7D967A3CF619ECC639FCC4583B11F649CFFFFFF374278
        55559B7F7FC47C7CC17676BF7171BC6F6FBA2323664C84BA8DBBDB6EA8D166A6
        D15FB4DF4785B12569A13D51775D5DA38C8CCC7D7DC47272BF6F6FBC6A6ABA74
        74BC27276B5489BF94BFDD75ADD463B8E14BD4FF428BB82C6EA6FFFFFF3D487F
        6060A58C8CCC8888C98585C67F7FC47C7CC129296D5A8EC498C3E07CB3D774AF
        D65EC4ED4B88B33473ABFFFFFFFFFFFF4646876060A55D5DA336367F34347C31
        31772D2D726092C99EC7E283B8DA7DB4D77EB3D74F89B43B79B1FFFFFFFFFFFF
        7777774D4D8E3D3D899B9B9B9C9C9C9D9D9D9D9D9D6696CCA2CBE389BDDC83B9
        DA84B9DA518BB5437EB6FFFFFFFFFFFF7A7A7A98999851518E9A9A9A9B9B9B9C
        9C9C9C9C9C6C9AD0A7CEE58FC1DF89BDDC8BBDDC538DB64B84BCFFFFFFFFFFFF
        7D7D7D9999999999999A9A9A9A9A9A9B9B9B9B9B9B6F9DD3AAD1E7ABD1E798C7
        E191C2DE568FB75289C1FFFFFFFFFFFF8080807E7E7E7C7C7C7A7A7A77777775
        7575727272719ED46F9ED687B2DCABD3E8A9D0E65890B8598EC6FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF709ED66D9C
        D485B1DA5A91B96093CBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6D9CD46A9AD26697CF}
      Caption = 'Lan'#231'ar Fechamento do Apto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ModalResult = 2
      Layout = blGlyphLeft
      WordWrap = False
      ShowAccelChar = True
      ParentFont = False
      TabOrder = 1
    end
    object grdMov_Produtos: TDBGrid
      Left = 18
      Top = 160
      Width = 344
      Height = 101
      Ctl3D = False
      Options = [dgTitles, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      TabOrder = 2
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
          Width = 165
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Title.Caption = 'QTD'
          Width = 32
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor'
          Title.Caption = 'Unt.'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Expr1005'
          Title.Caption = 'Total'
          Width = 60
          Visible = True
        end>
    end
    object btnOk: TBmsXPButton
      Left = 378
      Top = 160
      Width = 98
      Height = 49
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFF8686868181817D7D7DFFFFFFFFFFFFFFFFFFFFFFFF6868686565656262
        62FFFFFFFFFFFFFFFFFFFFFFFF959595909090ACACACC9C9C9A6A6A67E7E7E79
        7979757575717171999999C5C5C5959595626262FFFFFFFFFFFFFFFFFF9A9A9A
        FFFFFF9191918C8C8C888888FFFFFFFFFFFFFFFFFFFFFFFF7171716D6D6D6A6A
        6A666666FFFFFFFFFFFFFFFFFFA0A0A09B9B9B9797979292928D8D8D88888884
        84847F7F7F7B7B7B767676727272FFFFFF6A6A6AFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7777777373
        736F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA1A1A19D9D9D9898989393938F
        8F8F8A8A8A8585858181817F7F7FB1B1B1747474FFFFFFFFFFFFFFFFFFFFFFFF
        ABABABCACACADADADAB2B2B2D7D7D7AAAAAAD3D3D3A3A3A3D0D0D09B9B9BCCCC
        CC787878FFFFFFFFFFFFFFFFFFFFFFFFB0B0B0F4F4F4B9B9B9A3A3A3B2B2B29A
        9A9AABABAB909090A4A4A48787879C9C9C7E7E7EFFFFFFFFFFFFFFFFFFB8B8B8
        D2D2D2C0C0C0DEDEDEBABABADADBDA088736389551ACACACD4D4D4A4A4A4D0D0
        D08989897E7E7EFFFFFFFFFFFFBCBCBCC6C6C6B5B5B5C1C1C1ADADAD1A904746
        A56848A5660D7F29ACACAC929292A5A5A59A9A9A848484FFFFFFC2C2C2D8D8D8
        E3E3E3C7C7C7E1E1E12898574FAB748AC7A182C29746A36257A16AACACACD4D4
        D4ABABAB898989FFFFFFC4C4C4FCFCFCF9F9F9F9F9F9319F655AB38191CBAA74
        BC906AB68580C19643A15F147F2CF1F1F1D8D8D88F8F8F8A8A8AC5C5C5C5C5C5
        C3C3C3C0C0C042A5713CA16A55AF7C90CBA888C59E3A9F5E0E86350D802BC5C5
        C5FBFBFBE4E4E4909090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF33A16794
        CDAD8DC8A5158F43FFFFFFFFFFFFA3A3A39E9E9E9A9A9A959595FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF37A36D96CEB090CAA91B9149FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3DA56F37
        A36B299B5B219751FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = 'Lan'#231'ar Produto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Layout = blGlyphTop
      WordWrap = False
      ShowAccelChar = True
      ParentFont = False
      TabOrder = 3
    end
    object btnCancelar: TBmsXPButton
      Left = 378
      Top = 211
      Width = 98
      Height = 49
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3DED3B38EBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF211FE31E1CE2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        4A47F04F4CF2403EED3C39EBFFFFFFFFFFFFFFFFFFFFFFFF2725E52422E4312F
        EA1F1DE2FFFFFFFFFFFFFFFFFF5451F35856F56361FA5855F6413FED3D3AECFF
        FFFFFFFFFF302DE72C2AE6413FF14C4AF6312FEA1F1DE2FFFFFFFFFFFF5956F5
        5B58F66562FA7170FF5956F64240EE3E3BEC3937EB3532E94745F26362FF4A48
        F42F2DE92220E3FFFFFFFFFFFFFFFFFF5A57F55B59F66663FA7471FF5A58F643
        41EE3E3CEC504DF46867FF504EF53634EB2A27E5FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF5B58F65C5AF66764FA7472FF7370FF706EFF6E6CFF5755F73F3DEE3230
        E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5C59F65D5BF77976FF59
        56FF5754FF7270FF4846F03C39EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF615EF85D5AF67D79FF5E5BFF5B58FF7674FF4643EF413FEDFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6967FB6663F9706DFB807EFF7E
        7BFF7C79FF7977FF5E5CF74744EF4240EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        716EFD6E6BFC7774FD8682FF7673FC6462F8605DF76D6AFA7B79FF605DF74845
        EF4341EEFFFFFFFFFFFFFFFFFF7673FF7471FE7D7AFE8A87FF7C79FD6C69FB63
        61F95F5CF7615EF86E6CFA7D7AFF615FF74946F04441EEFFFFFFFFFFFF7774FF
        7A77FF817EFF817EFE7471FD6C69FBFFFFFFFFFFFF605DF7625FF86F6DFB7E7C
        FF625FF84A47F04542EEFFFFFFFFFFFF7774FF7A77FF7976FE726FFDFFFFFFFF
        FFFFFFFFFFFFFFFF615EF86461F86A68F95451F34F4DF2FFFFFFFFFFFFFFFFFF
        FFFFFF7774FF7774FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF625FF85D5B
        F75956F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF6360F8FFFFFFFFFFFFFFFFFF}
      Caption = 'Excluir Produto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ModalResult = 2
      Layout = blGlyphTop
      WordWrap = False
      ShowAccelChar = True
      ParentFont = False
      TabOrder = 4
    end
    object edtDesconto: TEdit
      Left = 148
      Top = 312
      Width = 76
      Height = 17
      BorderStyle = bsNone
      Color = 14344414
      Ctl3D = False
      MaxLength = 2
      ParentCtl3D = False
      TabOrder = 5
    end
    object edtDesconto2: TEdit
      Left = 148
      Top = 332
      Width = 76
      Height = 17
      BorderStyle = bsNone
      Color = 14344414
      Ctl3D = False
      MaxLength = 4
      ParentCtl3D = False
      TabOrder = 6
    end
  end
end
