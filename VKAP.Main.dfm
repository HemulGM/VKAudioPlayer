object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'VK Audio Player'
  ClientHeight = 491
  ClientWidth = 614
  Color = clWhite
  Constraints.MinHeight = 460
  Constraints.MinWidth = 630
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object Shape1: TShape
    Left = 0
    Top = 56
    Width = 614
    Height = 1
    Align = alTop
    Brush.Color = 15395049
    Pen.Color = 15395049
    ExplicitLeft = -8
    ExplicitTop = 80
    ExplicitWidth = 716
  end
  object PanelPlayer: TPanel
    Left = 0
    Top = 0
    Width = 614
    Height = 56
    Align = alTop
    BevelOuter = bvNone
    Color = 16579578
    ParentBackground = False
    TabOrder = 0
    StyleElements = []
    object ImageAlbum: TImage
      AlignWithMargins = True
      Left = 100
      Top = 8
      Width = 40
      Height = 40
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 4
      Margins.Bottom = 8
      Align = alLeft
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000280000
        00280802000000039C2F3A000000017352474200AECE1CE90000000467414D41
        0000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000001
        0A4944415478DA637CF9F6130318303232FEFFFF9F819600D90A46B8C5740623
        CC6260988F301F8F5A3C942CFEF19BE1D987EF4F5E7FF9F4EDD78B0F3F816491
        9F066D2DBEFFFAC7DE8BCF5E7EFC89265E1DAC495B8BFB36DDF8FE1B4B114B73
        8B5BD75EC72A3E022CE664659410E010E6E712E2629213E5151760A787C5B91E
        CA7CDC6C6468A7D462220376D4E2518B472D1E4C16032BA58FDF7E02EBC18B0F
        3FD1C36260BDBBE7E2538865C880E6166F3983C5567A588CB52E12E7674F7151
        A2ADC593B7DF05366BD004F5E5F97C4CA4696BF1CE8BAFCEDC798B2C02AC0D53
        9C95C8AB9A48B01892B86E3DFB0C6CEE0043585694C75245806C5B49B098EA60
        D4E2518B472D1EFA160300B5E2ED6C3B3604E00000000049454E44AE426082}
      Proportional = True
      Stretch = True
    end
    object ButtonFlatPlayPause: TButtonFlat
      Left = 0
      Top = 0
      Width = 54
      Height = 56
      Align = alLeft
      Caption = ''
      ColorNormal = 14668740
      ColorOver = 11373924
      ColorPressed = 10451273
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      FontOver.Charset = DEFAULT_CHARSET
      FontOver.Color = clWindowText
      FontOver.Height = -13
      FontOver.Name = 'Tahoma'
      FontOver.Style = []
      FontDown.Charset = DEFAULT_CHARSET
      FontDown.Color = clWindowText
      FontDown.Height = -13
      FontDown.Name = 'Tahoma'
      FontDown.Style = []
      IgnorBounds = True
      ImageIndentLeft = 18
      ImageIndex = 0
      Images = ImageList
      ImagesOver = ImageListL
      Transparent = True
      OnClick = ButtonFlatPlayPauseClick
      RoundRectParam = 0
      ShowFocusRect = False
      TabOrder = 0
      TabStop = True
      TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clWhite
      SubTextFont.Height = -13
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
    end
    object ButtonFlatNext: TButtonFlat
      Left = 73
      Top = 0
      Width = 19
      Height = 56
      Align = alLeft
      Caption = ''
      ColorNormal = 14668740
      ColorOver = 11373924
      ColorPressed = 10451273
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      FontOver.Charset = DEFAULT_CHARSET
      FontOver.Color = clWindowText
      FontOver.Height = -13
      FontOver.Name = 'Tahoma'
      FontOver.Style = []
      FontDown.Charset = DEFAULT_CHARSET
      FontDown.Color = clWindowText
      FontDown.Height = -13
      FontDown.Name = 'Tahoma'
      FontDown.Style = []
      IgnorBounds = True
      ImageIndentLeft = -6
      ImageIndex = 1
      Images = ImageList
      ImagesOver = ImageListL
      Transparent = True
      OnClick = ButtonFlatNextClick
      RoundRectParam = 0
      ShowFocusRect = False
      TabOrder = 1
      TabStop = True
      TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clWhite
      SubTextFont.Height = -13
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
    end
    object ButtonFlatPrev: TButtonFlat
      Left = 54
      Top = 0
      Width = 19
      Height = 56
      Align = alLeft
      Caption = ''
      ColorNormal = 14668740
      ColorOver = 11373924
      ColorPressed = 10451273
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      FontOver.Charset = DEFAULT_CHARSET
      FontOver.Color = clWindowText
      FontOver.Height = -13
      FontOver.Name = 'Tahoma'
      FontOver.Style = []
      FontDown.Charset = DEFAULT_CHARSET
      FontDown.Color = clWindowText
      FontDown.Height = -13
      FontDown.Name = 'Tahoma'
      FontDown.Style = []
      IgnorBounds = True
      ImageIndentLeft = -6
      ImageIndex = 2
      Images = ImageList
      ImagesOver = ImageListL
      Transparent = True
      OnClick = ButtonFlatPrevClick
      RoundRectParam = 0
      ShowFocusRect = False
      TabOrder = 2
      TabStop = True
      TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clWhite
      SubTextFont.Height = -13
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
    end
    object ButtonFlatDownload: TButtonFlat
      Left = 518
      Top = 0
      Width = 40
      Height = 56
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1085#1072' '#1076#1080#1089#1082'...'
      Align = alRight
      Caption = ''
      ColorNormal = 14668740
      ColorOver = 11373924
      ColorPressed = 10451273
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      FontOver.Charset = DEFAULT_CHARSET
      FontOver.Color = clWindowText
      FontOver.Height = -13
      FontOver.Name = 'Tahoma'
      FontOver.Style = []
      FontDown.Charset = DEFAULT_CHARSET
      FontDown.Color = clWindowText
      FontDown.Height = -13
      FontDown.Name = 'Tahoma'
      FontDown.Style = []
      IgnorBounds = True
      ImageIndentLeft = 4
      ImageIndex = 3
      Images = ImageList
      ImagesOver = ImageListL
      Transparent = True
      OnClick = ButtonFlatDownloadClick
      RoundRectParam = 0
      ShowFocusRect = False
      TabOrder = 3
      TabStop = True
      TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clWhite
      SubTextFont.Height = -13
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
    end
    object PanelTrackInfo: TPanel
      AlignWithMargins = True
      Left = 144
      Top = 3
      Width = 224
      Height = 50
      Margins.Left = 0
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 4
      object PanelTrackSinger: TPanel
        AlignWithMargins = True
        Left = 2
        Top = 0
        Width = 174
        Height = 36
        Margins.Left = 2
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object LabelTitle: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 0
          Width = 164
          Height = 17
          Margins.Left = 5
          Margins.Top = 0
          Margins.Right = 5
          Margins.Bottom = 0
          Align = alTop
          AutoSize = False
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          EllipsisPosition = epEndEllipsis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI Semibold'
          Font.Style = []
          ParentFont = False
          StyleElements = [seClient, seBorder]
          ExplicitLeft = 21
          ExplicitTop = 11
          ExplicitWidth = 244
        end
        object LabelArtist: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 17
          Width = 164
          Height = 17
          Margins.Left = 5
          Margins.Top = 0
          Margins.Right = 5
          Margins.Bottom = 0
          Align = alTop
          AutoSize = False
          Caption = #1040#1088#1090#1080#1089#1090
          EllipsisPosition = epEndEllipsis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 10658209
          Font.Height = -13
          Font.Name = 'Segoe UI Semibold'
          Font.Style = []
          ParentFont = False
          StyleElements = [seClient, seBorder]
          ExplicitTop = 15
          ExplicitWidth = 244
        end
      end
      object PanelTrackTime: TPanel
        Left = 176
        Top = 0
        Width = 48
        Height = 36
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object LabelTime: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 6
          Width = 42
          Height = 24
          Margins.Top = 6
          Margins.Bottom = 6
          Align = alClient
          Alignment = taCenter
          Caption = '3:22'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 10658209
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          OnClick = LabelTimeClick
          ExplicitWidth = 24
          ExplicitHeight = 15
        end
      end
      object TrackbarPosition: ThTrackbar
        Left = 0
        Top = 36
        Width = 224
        Height = 14
        Align = alBottom
        OnChange = TrackbarPositionChange
        OnAdvHint = TrackbarPositionAdvHint
        OnMouseLeave = TrackbarPositionMouseLeave
        Color = 16579578
        ParentColor = False
        MarginScaleSide = 4
        MarginScaleUpdown = 2
        HotZoom = False
      end
    end
    object ButtonFlatShuffle: TButtonFlat
      Left = 448
      Top = 0
      Width = 35
      Height = 56
      Hint = #1055#1077#1088#1077#1084#1077#1096#1072#1090#1100
      Align = alRight
      Caption = ''
      ColorNormal = 14668740
      ColorOver = 11373924
      ColorPressed = 10451273
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      FontOver.Charset = DEFAULT_CHARSET
      FontOver.Color = clWindowText
      FontOver.Height = -13
      FontOver.Name = 'Tahoma'
      FontOver.Style = []
      FontDown.Charset = DEFAULT_CHARSET
      FontDown.Color = clWindowText
      FontDown.Height = -13
      FontDown.Name = 'Tahoma'
      FontDown.Style = []
      IgnorBounds = True
      ImageIndentLeft = 1
      ImageIndex = 8
      Images = ImageList
      ImagesOver = ImageListL
      Transparent = True
      OnClick = ButtonFlatShuffleClick
      RoundRectParam = 0
      ShowFocusRect = False
      TabOrder = 5
      TabStop = True
      TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clWhite
      SubTextFont.Height = -13
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
    end
    object ButtonFlatRepeat: TButtonFlat
      Left = 483
      Top = 0
      Width = 35
      Height = 56
      Hint = #1055#1086#1074#1090#1086#1088#1103#1090#1100
      Align = alRight
      Caption = ''
      ColorNormal = 14668740
      ColorOver = 11373924
      ColorPressed = 10451273
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      FontOver.Charset = DEFAULT_CHARSET
      FontOver.Color = clWindowText
      FontOver.Height = -13
      FontOver.Name = 'Tahoma'
      FontOver.Style = []
      FontDown.Charset = DEFAULT_CHARSET
      FontDown.Color = clWindowText
      FontDown.Height = -13
      FontDown.Name = 'Tahoma'
      FontDown.Style = []
      IgnorBounds = True
      ImageIndentLeft = 1
      ImageIndex = 6
      Images = ImageList
      ImagesOver = ImageListL
      Transparent = True
      OnClick = ButtonFlatRepeatClick
      RoundRectParam = 0
      ShowFocusRect = False
      TabOrder = 6
      TabStop = True
      TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clWhite
      SubTextFont.Height = -13
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
    end
    object PanelUser: TPanel
      Left = 558
      Top = 0
      Width = 56
      Height = 56
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 7
      object ImageAvatar: TImage
        AlignWithMargins = True
        Left = 8
        Top = 8
        Width = 40
        Height = 40
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        Align = alRight
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000280000
          002808060000008CFEB86D000000097048597300000B1300000B1301009A9C18
          00000A4F6943435050686F746F73686F70204943432070726F66696C65000078
          DA9D53675453E9163DF7DEF4424B8880944B6F5215082052428B801491262A21
          09104A8821A1D91551C1114545041BC8A088038E8E808C15512C0C8A0AD807E4
          21A28E83A3888ACAFBE17BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C
          9648335135800CA9421E11E083C7C4C6E1E42E40810A2470001008B3642173FD
          230100F87E3C3C2B22C007BE000178D30B0800C04D9BC0301C87FF0FEA42995C
          01808401C07491384B08801400407A8E42A600404601809D98265300A0040060
          CB6362E300502D0060277FE6D300809DF8997B01005B94211501A09100201365
          884400683B00ACCF568A450058300014664BC43900D82D00304957664800B0B7
          00C0CE100BB200080C00305188852900047B0060C8232378008499001446F257
          3CF12BAE10E72A00007899B23CB9243945815B082D710757572E1E28CE49172B
          14366102619A402EC27999193281340FE0F3CC0000A0911511E083F3FD78CE0E
          AECECE368EB60E5F2DEABF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2F
          B31A803B06806DFEA225EE04685E0BA075F78B66B20F40B500A0E9DA57F370F8
          7E3C3C45A190B9D9D9E5E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3C
          FCF7F5E0BEE22481325D814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB7
          0BFFFC1DD322C44962B9582A14E35112718E449A8CF332A52289429229C525D2
          FF64E2DF2CFB033EDF3500B06A3E017B912DA85D6303F64B27105874C0E2F700
          00F2BB6FC1D4280803806883E1CF77FFEF3FFD47A02500806649927100005E44
          242E54CAB33FC708000044A0812AB0411BF4C1182CC0061CC105DCC10BFC6036
          844224C4C24210420A64801C726029AC82422886CDB01D2A602FD4401D34C051
          688693700E2EC255B80E3D700FFA61089EC128BC81090441C808136121DA8801
          628A58238E08179985F821C14804128B2420C9881451224B91354831528A5420
          55481DF23D720239875C46BA913BC8003282FC86BC47319481B2513DD40CB543
          B9A8371A8446A20BD06474319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F
          3E43C730C0E8180733C46C302EC6C342B1382C099363CBB122AC0CABC61AB056
          AC03BB89F563CFB17704128145C0093604774220611E4148584C584ED848A820
          1C243411DA093709038451C2272293A84BB426BA11F9C4186232318758482C23
          D6128F132F107B8843C437241289433227B9900249B1A454D212D246D26E5223
          E92CA99B34481A2393C9DA646BB20739942C202BC885E49DE4C3E433E41BE421
          F25B0A9D624071A4F853E22852CA6A4A19E510E534E5066598324155A39A52DD
          A8A15411358F5A42ADA1B652AF5187A81334759A39CD8316494BA5ADA295D31A
          681768F769AFE874BA11DD951E4E97D057D2CBE947E897E803F4770C0D861583
          C7886728199B18071867197718AF984CA619D38B19C754303731EB98E7990F99
          6F55582AB62A7C1591CA0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB54
          8FA95E537DAE46553353E3A909D496AB55AA9D50EB531B5367A93BA887AA67A8
          6F543FA47E59FD890659C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B
          0DAB86758135C426B1CDD97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352
          F394663F07E39871F89C744E09E728A797F37E8ADE14EF29E2291BA6344CB931
          655C6BAA96979658AB48AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A
          275C2747678FCE059DE753D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477
          BF6EA7EE989EBE5E809E4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806
          B30C2406DB0CCE183CC535716F3C1D2FC7DBF151435DC34043A561956197E184
          91B9D13CA3D5468D460F8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE
          9A524DB9A629A63B4C3B4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDF
          B7605A785A2CB6A8B6B86549B2E45AA659EEB6BC6E855A3959A558555A5DB346
          AD9DAD25D6BBADBBA711A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806
          DBAEB66DB67D6167621767B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D
          5A1D7E73B472143A563ADE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613
          CB29C4699D539BD347671767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BD
          E44A74F5715DE17AD2F59D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E
          593373D0C3C843E051E5D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F91
          57ADD7B0B7A577AAF761EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8
          B7CB4FC36F9E5F85DF437F23FF64FF7AFFD100A78025016703898141815B02FB
          F87A7C21BF8E3F3ADB65F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC
          90AD21F7E798CE91CE690E85507EE8D6D00761E6618BC37E0C2785878557863F
          8E7088581AD131973577D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3E
          AA2E6A3CDA37BA34BA3FC62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDF
          FCEDF387E29DE20BE37B17982FC85D7079A1CEC2F485A716A92E122C3A96404C
          884E3894F041102AA8168C25F21377258E0A79C21DC267222FD136D188D8435C
          2A1E4EF2482A4D7A92EC91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A
          9E169A76206D323D3ABD31839291907142AA214D93B667EA67E66676CBAC6585
          B2FEC56E8BB72F1E9507C96BB390AC05592D0AB642A6E8545A28D72A07B26765
          5766BFCD89CA3996AB9E2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A586
          4B572D1D58E6BDAC6A39B23C7179DB0AE315052B865606AC3CB88AB62A6DD54F
          ABED5797AE7EBD267A4D6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D
          4F582F59DFB561FA869D1B3E15898AAE14DB1797157FD828DC78E51B876FCABF
          99DC94B4A9ABC4B964CF66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40D
          DF56B4EDF5F645DB2F97CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A4
          54F454FA5436EED2DDB561D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB
          5501554DD566D565FB49FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203
          FD07230EB6D7B9D4D51DD23D54528FD62BEB470EC71FBEFE9DEF772D0D360D55
          8D9CC6E223704479E4E9F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A
          429AF29A469B539AFB5B625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794A
          F354C969DAE982D39367F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F
          6FEFBA1074E1D245FF8BE73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6D
          EA74EA3CFE93D34FC7BB9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4
          BD79F116FFD6D59E393DDDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727
          EEADBC4FBC5FF440ED41D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7
          068583CFFE91F58F0F43058F998FCB860D86EB9E383E3939E23F72FDE9FCA743
          CF64CF269E17FEA2FECBAE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5
          FDEAC0EB19AFDBC6C2C61EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE4
          7C207F28FF68F9B1F553D0A7FB93199393FF040398F3FC63332DDB000004D149
          44415478DACD98EB72DA4614C7FF5C0D36C6863A38AE1D1B5F9A4973A99B6967
          927E2A7D82E60DEABE41F204A54F90F609EA3C419C2728FD9664D299D4719AE9
          A43638A9496D2780C1E00B42F49C452242AC402298E9617624B4D2EAA773DBB3
          EBAAD7EBF83F8BAB57C057FFE6BEA5C3756A5F538B6B4D9702B5A786B6367B3E
          7A70E6800435478724B55BD4C61DBE6B8DDA4F04FA5BDF01096C8C07A7B6D28B
          164C92A2769B40FFE80BA066CAD51E34D64D7E24C8E40701121C0FF0439FC18C
          C2665FE9E49F968004F70BFA63D26EC24194B08294020E4073664911E037B600
          359F5B1B209C2E1CE1773A026AD19A41FF03C2AE24CC69C80CE8C8EFDC6E175C
          2E6A746E7614FD1A8FAFAAB6736D8600E7A5805A12CED805AB2A3564F7F2D8CB
          17A1D2182ED33D3CAA9BE06391303E8E45E0F37AEC827254DF93015A6A8F813C
          6E775337B55A0D7FA6770460535D32D17818F0F2FC343C1E4FF3624D55AD805B
          B46804E4B7B5F91E9BF0F8E414F9625998CB45A0C5C323BCD9CFD3ABEAA2BF93
          8867E837752E827028883A81F13391F00802437E58A4B9CFF59946005A452E0F
          745AADE2F9E63FD8CB95F86EF132369DD7E74567B456452A5545B802FF5027D3
          4747716571067E9F4F06D98C681D300949DE73B3B6CA153C5CFF1B5E328FAE2C
          A3D6F4C1F95EFD9CFB55D214DBDEA860BD9F0F0AB9C9CDCF96101E19D6EE6D91
          665ED4017FA5F38414F0B082471B9B04E8969A93B53249814003C2AFF9D889A2
          E2D56E0EFBF912641EC0EF546A2A6E5C5D24B34B01793C9711308DD67AAE4583
          8F9E6D8A286C8323275F989EC0EC6414A5CA310ECB27226046870318090E09C8
          74F6AD0832B37016B8716DD14A832C7182DCD601A59EDA099035373116C2158A
          CE77C512365FEFA17C7C2AFA42C343589A89617C34848DAD1D0AB0C336EDDB00
          1449BB6740F6A1E58B73180D06B0FE721B058A6CFD9EAAA2608C4CB7FCC91C0E
          C8453628C83C1EF76001F9055F5D5B12267DB8FE125EAFB7ED036E523F6BFA31
          3DEF953CEF04509A03BB01B293B3661E5310B544B676E47E85EEE320F3390714
          B9B07B145B00F24CB0381DC3ECD4045EA4B3C852E27E6FE21A2E4C7E848BF1F3
          D8DED9C75676DF3013D9033447F15D3ABFED04909FF3515AF9F2F28230DFD6CE
          2E76DF15455A8945C7B130738E92BC8227CFD3F43135A741F29400AF1B01BF43
          63DDE10890D34C3814C0258AE410058B5B8360BF2B558EF01769B6583E6E563D
          0E005709F07B2320D7810527803A648D20FDD437191D43682420AE97086A3757
          20FF53A57036006F11E08326200B41DE4763BD6B007411E09125A02EFC029E19
          547DDAE3B99ACC2F4BD0ED804173555320B888FEC708C83B04293360E5E814BF
          BF48E3848A0699269AC5AA79C2B7286475CD0F5191F0C5A7F3180EFACD802DCB
          517345DD16CD0CF5F6A088D76F72A20E4427C82ED7343A51175E988AD24C1436
          5732EC6671E30ACF0CB88CC632B045DE17AC760BAC6E52B72A5879C7E1E7960F
          95ACEA58BD835C72EA225D7A5AAD8BDB02E68C2583C6CCD1B678B702E4B493E2
          870600C77E97B0DA4CEAB4F5C190BC0C489C215C068D9C67B9D36567774B3A0D
          F641521A5CC78D4DBBFB839C235721A9BA7B103669D21CAD1F046800E5393BD9
          23288331D45D27DBC13DED516BF972058D204A74B8D5B847FDA0878FEA7D13DD
          04CCDB2671A3B6EC6EF10E04F02CE53F801D14DE1749987D0000000049454E44
          AE426082}
        Proportional = True
        Stretch = True
        OnClick = ImageAvatarClick
        ExplicitLeft = 11
        ExplicitTop = 6
      end
    end
    object PanelVolume: TPanel
      Left = 371
      Top = 0
      Width = 77
      Height = 56
      Align = alRight
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 8
      object TrackbarVolume: ThTrackbar
        AlignWithMargins = True
        Left = 3
        Top = 21
        Width = 71
        Height = 14
        Margins.Top = 21
        Margins.Bottom = 21
        Align = alClient
        OnChange = TrackbarVolumeChange
        OnAdvHint = TrackbarVolumeAdvHint
        OnMouseLeave = TrackbarVolumeMouseLeave
        Color = 16579578
        ParentColor = False
        HotScroll = True
        MarginScaleSide = 4
        MarginScaleUpdown = 2
        HotZoom = False
      end
    end
  end
  object PanelPlaylist: TPanel
    AlignWithMargins = True
    Left = 20
    Top = 57
    Width = 594
    Height = 434
    Margins.Left = 20
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    ParentColor = True
    TabOrder = 1
    object PanelInfoBottom: TPanel
      AlignWithMargins = True
      Left = 0
      Top = 399
      Width = 574
      Height = 35
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 20
      Margins.Bottom = 0
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 0
      object LabelAudioCount: TLabel
        AlignWithMargins = True
        Left = 15
        Top = 4
        Width = 9
        Height = 28
        Margins.Left = 15
        Align = alLeft
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10658466
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 17
      end
      object Shape2: TShape
        Left = 0
        Top = 0
        Width = 574
        Height = 1
        Align = alTop
        Brush.Color = 15460326
        Pen.Color = 15460326
        ExplicitTop = 64
        ExplicitWidth = 716
      end
    end
    object PanelNav: TPanel
      AlignWithMargins = True
      Left = 0
      Top = 0
      Width = 574
      Height = 111
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 20
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 1
      object Shape3: TShape
        Left = 0
        Top = 110
        Width = 574
        Height = 1
        Align = alBottom
        Brush.Color = 15460326
        Pen.Color = 15460326
        ExplicitTop = 108
        ExplicitWidth = 651
      end
      object PanelPageControl: TPanel
        Left = 0
        Top = 65
        Width = 574
        Height = 45
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object PanelPageInd: TPanel
          Left = 0
          Top = 43
          Width = 574
          Height = 2
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object ShapeHotButton: TShape
            Left = 0
            Top = 0
            Width = 122
            Height = 2
            Brush.Color = 14406346
            Pen.Color = 14406346
            Visible = False
          end
          object ShapeActivePage: TShape
            Left = 0
            Top = 0
            Width = 122
            Height = 2
            Brush.Color = 12091729
            Pen.Color = 12091729
          end
        end
        object ButtonFlatMy: TButtonFlat
          AlignWithMargins = True
          Left = 128
          Top = 0
          Width = 85
          Height = 43
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alLeft
          Caption = #1052#1091#1079#1099#1082#1072
          ColorNormal = clWhite
          ColorOver = clWhite
          ColorPressed = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          BorderColor = clWhite
          FontOver.Charset = DEFAULT_CHARSET
          FontOver.Color = clWindowText
          FontOver.Height = -13
          FontOver.Name = 'Tahoma'
          FontOver.Style = []
          FontDown.Charset = DEFAULT_CHARSET
          FontDown.Color = clWindowText
          FontDown.Height = -13
          FontDown.Name = 'Tahoma'
          FontDown.Style = []
          IgnorBounds = True
          ImageIndentLeft = 0
          OnClick = ButtonFlatMyClick
          OnMouseEnter = ButtonFlatMyMouseEnter
          OnMouseLeave = ButtonFlatMyMouseLeave
          RoundRectParam = 3
          Shape = stRoundRect
          ShowFocusRect = False
          TabOrder = 1
          TabStop = True
          TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
          SubTextFont.Charset = DEFAULT_CHARSET
          SubTextFont.Color = clWhite
          SubTextFont.Height = -13
          SubTextFont.Name = 'Tahoma'
          SubTextFont.Style = []
        end
        object ButtonFlatCurrent: TButtonFlat
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 122
          Height = 43
          Margins.Left = 0
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alLeft
          Caption = #1058#1077#1082#1091#1097#1080#1081' '#1087#1083#1077#1081#1083#1080#1089#1090
          ColorNormal = clWhite
          ColorOver = clWhite
          ColorPressed = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          BorderColor = clWhite
          FontOver.Charset = DEFAULT_CHARSET
          FontOver.Color = clWindowText
          FontOver.Height = -13
          FontOver.Name = 'Tahoma'
          FontOver.Style = []
          FontDown.Charset = DEFAULT_CHARSET
          FontDown.Color = clWindowText
          FontDown.Height = -13
          FontDown.Name = 'Tahoma'
          FontDown.Style = []
          IgnorBounds = True
          ImageIndentLeft = 0
          OnClick = ButtonFlatCurrentClick
          OnMouseEnter = ButtonFlatMyMouseEnter
          OnMouseLeave = ButtonFlatMyMouseLeave
          RoundRectParam = 3
          Shape = stRoundRect
          ShowFocusRect = False
          TabOrder = 2
          TabStop = True
          TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
          SubTextFont.Charset = DEFAULT_CHARSET
          SubTextFont.Color = clWhite
          SubTextFont.Height = -13
          SubTextFont.Name = 'Tahoma'
          SubTextFont.Style = []
        end
        object ButtonFlatPlaylists: TButtonFlat
          AlignWithMargins = True
          Left = 219
          Top = 0
          Width = 79
          Height = 43
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alLeft
          Caption = #1055#1083#1077#1081#1083#1080#1089#1090#1099
          ColorNormal = clWhite
          ColorOver = clWhite
          ColorPressed = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          BorderColor = clWhite
          FontOver.Charset = DEFAULT_CHARSET
          FontOver.Color = clWindowText
          FontOver.Height = -13
          FontOver.Name = 'Tahoma'
          FontOver.Style = []
          FontDown.Charset = DEFAULT_CHARSET
          FontDown.Color = clWindowText
          FontDown.Height = -13
          FontDown.Name = 'Tahoma'
          FontDown.Style = []
          IgnorBounds = True
          ImageIndentLeft = 0
          OnClick = ButtonFlatPlaylistsClick
          OnMouseEnter = ButtonFlatMyMouseEnter
          OnMouseLeave = ButtonFlatMyMouseLeave
          RoundRectParam = 3
          Shape = stRoundRect
          ShowFocusRect = False
          TabOrder = 3
          TabStop = True
          TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
          SubTextFont.Charset = DEFAULT_CHARSET
          SubTextFont.Color = clWhite
          SubTextFont.Height = -13
          SubTextFont.Name = 'Tahoma'
          SubTextFont.Style = []
        end
        object ButtonFlatFriends: TButtonFlat
          AlignWithMargins = True
          Left = 304
          Top = 0
          Width = 79
          Height = 43
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alLeft
          Caption = #1044#1088#1091#1079#1100#1103
          ColorNormal = clWhite
          ColorOver = clWhite
          ColorPressed = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          BorderColor = clWhite
          FontOver.Charset = DEFAULT_CHARSET
          FontOver.Color = clWindowText
          FontOver.Height = -13
          FontOver.Name = 'Tahoma'
          FontOver.Style = []
          FontDown.Charset = DEFAULT_CHARSET
          FontDown.Color = clWindowText
          FontDown.Height = -13
          FontDown.Name = 'Tahoma'
          FontDown.Style = []
          IgnorBounds = True
          ImageIndentLeft = 0
          OnClick = ButtonFlatFriendsClick
          OnMouseEnter = ButtonFlatMyMouseEnter
          OnMouseLeave = ButtonFlatMyMouseLeave
          RoundRectParam = 3
          Shape = stRoundRect
          ShowFocusRect = False
          TabOrder = 4
          TabStop = True
          TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
          SubTextFont.Charset = DEFAULT_CHARSET
          SubTextFont.Color = clWhite
          SubTextFont.Height = -13
          SubTextFont.Name = 'Tahoma'
          SubTextFont.Style = []
        end
        object ButtonFlatSearchTab: TButtonFlat
          AlignWithMargins = True
          Left = 389
          Top = 0
          Width = 79
          Height = 43
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alLeft
          Caption = #1055#1086#1080#1089#1082
          ColorNormal = clWhite
          ColorOver = clWhite
          ColorPressed = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          BorderColor = clWhite
          FontOver.Charset = DEFAULT_CHARSET
          FontOver.Color = clWindowText
          FontOver.Height = -13
          FontOver.Name = 'Tahoma'
          FontOver.Style = []
          FontDown.Charset = DEFAULT_CHARSET
          FontDown.Color = clWindowText
          FontDown.Height = -13
          FontDown.Name = 'Tahoma'
          FontDown.Style = []
          IgnorBounds = True
          ImageIndentLeft = 0
          OnClick = ButtonFlatSearchTabClick
          OnMouseEnter = ButtonFlatMyMouseEnter
          OnMouseLeave = ButtonFlatMyMouseLeave
          RoundRectParam = 3
          Shape = stRoundRect
          ShowFocusRect = False
          TabOrder = 5
          TabStop = True
          TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
          SubTextFont.Charset = DEFAULT_CHARSET
          SubTextFont.Color = clWhite
          SubTextFont.Height = -13
          SubTextFont.Name = 'Tahoma'
          SubTextFont.Style = []
          Visible = False
        end
        object ButtonFlatMyMusic: TButtonFlat
          AlignWithMargins = True
          Left = 477
          Top = 0
          Width = 94
          Height = 43
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alRight
          Caption = #1052#1086#1081' '#1072#1082#1082#1072#1091#1085#1090
          ColorNormal = clWhite
          ColorOver = clWhite
          ColorPressed = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          BorderColor = clWhite
          FontOver.Charset = DEFAULT_CHARSET
          FontOver.Color = clWindowText
          FontOver.Height = -13
          FontOver.Name = 'Tahoma'
          FontOver.Style = []
          FontDown.Charset = DEFAULT_CHARSET
          FontDown.Color = clWindowText
          FontDown.Height = -13
          FontDown.Name = 'Tahoma'
          FontDown.Style = []
          IgnorBounds = True
          ImageIndentLeft = 0
          OnClick = ButtonFlatMyMusicClick
          OnMouseEnter = ButtonFlatMyMouseEnter
          OnMouseLeave = ButtonFlatMyMouseLeave
          RoundRectParam = 3
          Shape = stRoundRect
          ShowFocusRect = False
          TabOrder = 6
          TabStop = True
          TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
          SubTextFont.Charset = DEFAULT_CHARSET
          SubTextFont.Color = clWhite
          SubTextFont.Height = -13
          SubTextFont.Name = 'Tahoma'
          SubTextFont.Style = []
          Visible = False
        end
      end
      object PanelSearch: TPanel
        Left = 0
        Top = 0
        Width = 574
        Height = 65
        Align = alClient
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 1
        StyleElements = []
        DesignSize = (
          574
          65)
        object ButtonFlatSearchBG: TButtonFlat
          Left = 4
          Top = 18
          Width = 570
          Height = 36
          Anchors = [akLeft, akTop, akRight]
          Caption = ''
          ColorNormal = clWhite
          ColorOver = clWhite
          ColorPressed = clWhite
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Flat = False
          BorderColor = 15460326
          FontOver.Charset = DEFAULT_CHARSET
          FontOver.Color = clWindowText
          FontOver.Height = -13
          FontOver.Name = 'Tahoma'
          FontOver.Style = []
          FontDown.Charset = DEFAULT_CHARSET
          FontDown.Color = clWindowText
          FontDown.Height = -13
          FontDown.Name = 'Tahoma'
          FontDown.Style = []
          IgnorBounds = True
          RoundRectParam = 3
          Shape = stRoundRect
          ShowFocusRect = False
          TabOrder = 1
          TabStop = True
          TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
          SubTextFont.Charset = DEFAULT_CHARSET
          SubTextFont.Color = clWhite
          SubTextFont.Height = -13
          SubTextFont.Name = 'Tahoma'
          SubTextFont.Style = []
        end
        object EditSearch: TEdit
          Left = 15
          Top = 19
          Width = 339
          Height = 33
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvSpace
          BevelWidth = 7
          BorderStyle = bsNone
          TabOrder = 0
          TextHint = #1055#1086#1080#1089#1082
          StyleElements = []
          OnKeyPress = EditSearchKeyPress
        end
        object ButtonFlatSearch: TButtonFlat
          Left = 514
          Top = 18
          Width = 60
          Height = 36
          Anchors = [akTop, akRight]
          Caption = ''
          ColorNormal = 15987442
          ColorOver = 15987442
          ColorPressed = 15263462
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Flat = False
          BorderColor = 15460326
          FontOver.Charset = DEFAULT_CHARSET
          FontOver.Color = clWindowText
          FontOver.Height = -13
          FontOver.Name = 'Tahoma'
          FontOver.Style = []
          FontDown.Charset = DEFAULT_CHARSET
          FontDown.Color = clWindowText
          FontDown.Height = -13
          FontDown.Name = 'Tahoma'
          FontDown.Style = []
          GroupItemKind = giRight
          IgnorBounds = True
          ImageIndentLeft = 15
          ImageIndex = 5
          Images = ImageList
          OnClick = ButtonFlatSearchClick
          RoundRectParam = 3
          Shape = stRoundRect
          ShowFocusRect = False
          TabOrder = 2
          TabStop = True
          TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
          SubTextFont.Charset = DEFAULT_CHARSET
          SubTextFont.Color = clWhite
          SubTextFont.Height = -13
          SubTextFont.Name = 'Tahoma'
          SubTextFont.Style = []
        end
        object CheckBoxFlatSerachType: TCheckBoxFlat
          Left = 360
          Top = 18
          Width = 155
          Height = 36
          Anchors = [akTop, akRight]
          Caption = #1042' '#1090#1077#1082#1091#1097#1077#1084' '#1089#1087#1080#1089#1082#1077
          ColorNormal = 15987442
          ColorOver = 15987442
          ColorPressed = 15263462
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Flat = False
          BorderColor = 15460326
          FontOver.Charset = DEFAULT_CHARSET
          FontOver.Color = clWindowText
          FontOver.Height = -13
          FontOver.Name = 'Tahoma'
          FontOver.Style = []
          FontDown.Charset = DEFAULT_CHARSET
          FontDown.Color = clWindowText
          FontDown.Height = -13
          FontDown.Name = 'Tahoma'
          FontDown.Style = []
          GroupItemKind = giCenter
          IgnorBounds = True
          ImageIndex = 12
          Images = ImageList
          RoundRectParam = 0
          ShowFocusRect = False
          TabOrder = 3
          TabStop = True
          TextFormat = [tfSingleLine, tfVerticalCenter]
          SubTextFont.Charset = DEFAULT_CHARSET
          SubTextFont.Color = clWhite
          SubTextFont.Height = -13
          SubTextFont.Name = 'Tahoma'
          SubTextFont.Style = []
          Checked = True
          ImageCheck = 12
          ImageUncheck = 13
        end
      end
    end
    object PageControl: TPageControl
      Left = 0
      Top = 111
      Width = 594
      Height = 288
      ActivePage = TabSheetFriends
      Align = alClient
      Style = tsButtons
      TabOrder = 2
      StyleElements = []
      object TabSheetCurrent: TTabSheet
        Caption = #1058#1077#1082#1091#1097#1080#1081
        object TableExCurrent: TTableEx
          Left = 0
          Top = 0
          Width = 586
          Height = 253
          Align = alClient
          BevelInner = bvNone
          BorderStyle = bsNone
          DefaultRowHeight = 54
          TabOrder = 0
          StyleElements = [seBorder]
          OnDrawCellData = TableExCurrentDrawCellData
          ItemIndex = -1
          OnItemClick = TableExCurrentItemClick
          ProcEmpty = True
          Columns = <
            item
              Caption = 'Album'
              Width = 54
              MinWidth = 54
            end
            item
              Caption = #1053#1072#1079#1074#1072#1085#1080#1077
              Width = 505
            end>
          DefaultDataDrawing = False
          ItemCount = 1
          LineColor = clWhite
          LineColorXor = clWhite
          LineHotColor = 16250098
          LineSelColor = 15855081
          FontHotLine.Charset = DEFAULT_CHARSET
          FontHotLine.Color = 2631720
          FontHotLine.Height = -11
          FontHotLine.Name = 'Tahoma'
          FontHotLine.Style = []
          FontLine.Charset = DEFAULT_CHARSET
          FontLine.Color = 2631720
          FontLine.Height = -11
          FontLine.Name = 'Tahoma'
          FontLine.Style = []
          FontSelLine.Charset = DEFAULT_CHARSET
          FontSelLine.Color = 4210752
          FontSelLine.Height = -11
          FontSelLine.Name = 'Tahoma'
          FontSelLine.Style = []
          ShowColumns = False
          ColumnsFont.Charset = DEFAULT_CHARSET
          ColumnsFont.Color = 2631720
          ColumnsFont.Height = -11
          ColumnsFont.Name = 'Tahoma'
          ColumnsFont.Style = []
          SetFocusOnEnter = True
        end
      end
      object TabSheetMyMusic: TTabSheet
        Caption = #1052#1091#1079#1099#1082#1072
        ImageIndex = 1
        object TableExMyMusic: TTableEx
          Left = 0
          Top = 0
          Width = 586
          Height = 253
          Align = alClient
          BevelInner = bvNone
          BorderStyle = bsNone
          DefaultRowHeight = 54
          TabOrder = 0
          StyleElements = [seBorder]
          OnDrawCellData = TableExMyMusicDrawCellData
          ItemIndex = -1
          OnItemClick = TableExMyMusicItemClick
          ProcEmpty = True
          Columns = <
            item
              Caption = 'Album'
              Width = 54
              MinWidth = 54
            end
            item
              Caption = #1053#1072#1079#1074#1072#1085#1080#1077
              Width = 505
            end>
          DefaultDataDrawing = False
          ItemCount = 1
          LineColor = clWhite
          LineColorXor = clWhite
          LineHotColor = 16250098
          LineSelColor = 15855081
          FontHotLine.Charset = DEFAULT_CHARSET
          FontHotLine.Color = 2631720
          FontHotLine.Height = -11
          FontHotLine.Name = 'Tahoma'
          FontHotLine.Style = []
          FontLine.Charset = DEFAULT_CHARSET
          FontLine.Color = 2631720
          FontLine.Height = -11
          FontLine.Name = 'Tahoma'
          FontLine.Style = []
          FontSelLine.Charset = DEFAULT_CHARSET
          FontSelLine.Color = 4210752
          FontSelLine.Height = -11
          FontSelLine.Name = 'Tahoma'
          FontSelLine.Style = []
          ShowColumns = False
          ColumnsFont.Charset = DEFAULT_CHARSET
          ColumnsFont.Color = 2631720
          ColumnsFont.Height = -11
          ColumnsFont.Name = 'Tahoma'
          ColumnsFont.Style = []
          SetFocusOnEnter = True
        end
      end
      object TabSheetPlaylists: TTabSheet
        Caption = #1055#1083#1077#1081#1083#1080#1089#1090#1099
        ImageIndex = 2
        object TableExPlaylists: TTableEx
          Left = 0
          Top = 0
          Width = 586
          Height = 253
          Align = alClient
          BevelInner = bvNone
          BorderStyle = bsNone
          DefaultRowHeight = 54
          TabOrder = 0
          StyleElements = [seBorder]
          OnDrawCellData = TableExPlaylistsDrawCellData
          ItemIndex = -1
          OnItemClick = TableExPlaylistsItemClick
          ProcEmpty = True
          Columns = <
            item
              Caption = 'Album'
              Width = 54
              MinWidth = 54
            end
            item
              Caption = #1053#1072#1079#1074#1072#1085#1080#1077
              Width = 505
            end>
          DefaultDataDrawing = False
          ItemCount = 1
          LineColor = clWhite
          LineColorXor = clWhite
          LineHotColor = 16250098
          LineSelColor = 15855081
          FontHotLine.Charset = DEFAULT_CHARSET
          FontHotLine.Color = 2631720
          FontHotLine.Height = -11
          FontHotLine.Name = 'Tahoma'
          FontHotLine.Style = []
          FontLine.Charset = DEFAULT_CHARSET
          FontLine.Color = 2631720
          FontLine.Height = -11
          FontLine.Name = 'Tahoma'
          FontLine.Style = []
          FontSelLine.Charset = DEFAULT_CHARSET
          FontSelLine.Color = 4210752
          FontSelLine.Height = -11
          FontSelLine.Name = 'Tahoma'
          FontSelLine.Style = []
          ShowColumns = False
          ColumnsFont.Charset = DEFAULT_CHARSET
          ColumnsFont.Color = 2631720
          ColumnsFont.Height = -11
          ColumnsFont.Name = 'Tahoma'
          ColumnsFont.Style = []
          SetFocusOnEnter = True
        end
      end
      object TabSheetFriends: TTabSheet
        Caption = #1044#1088#1091#1079#1100#1103
        ImageIndex = 3
        object MemoLog: TMemo
          Left = 0
          Top = 0
          Width = 586
          Height = 253
          Align = alClient
          BorderStyle = bsNone
          ScrollBars = ssBoth
          TabOrder = 0
        end
        object TableExFriends: TTableEx
          Left = 0
          Top = 0
          Width = 586
          Height = 253
          Align = alClient
          BevelInner = bvNone
          BorderStyle = bsNone
          DefaultRowHeight = 54
          TabOrder = 1
          StyleElements = [seBorder]
          OnDrawCellData = TableExFriendsDrawCellData
          ItemIndex = -1
          OnItemClick = TableExFriendsItemClick
          ProcEmpty = True
          Columns = <
            item
              Caption = 'Album'
              Width = 54
              MinWidth = 54
            end
            item
              Caption = #1053#1072#1079#1074#1072#1085#1080#1077
              Width = 532
            end>
          DefaultDataDrawing = False
          ItemCount = 1
          LineColor = clWhite
          LineColorXor = clWhite
          LineHotColor = 16250098
          LineSelColor = 15855081
          FontHotLine.Charset = DEFAULT_CHARSET
          FontHotLine.Color = 2631720
          FontHotLine.Height = -11
          FontHotLine.Name = 'Tahoma'
          FontHotLine.Style = []
          FontLine.Charset = DEFAULT_CHARSET
          FontLine.Color = 2631720
          FontLine.Height = -11
          FontLine.Name = 'Tahoma'
          FontLine.Style = []
          FontSelLine.Charset = DEFAULT_CHARSET
          FontSelLine.Color = 4210752
          FontSelLine.Height = -11
          FontSelLine.Name = 'Tahoma'
          FontSelLine.Style = []
          ShowColumns = False
          ColumnsFont.Charset = DEFAULT_CHARSET
          ColumnsFont.Color = 2631720
          ColumnsFont.Height = -11
          ColumnsFont.Name = 'Tahoma'
          ColumnsFont.Style = []
          SetFocusOnEnter = True
        end
      end
      object TabSheetSearch: TTabSheet
        Caption = #1055#1086#1080#1089#1082
        ImageIndex = 4
        object TableExSearch: TTableEx
          Left = 0
          Top = 0
          Width = 586
          Height = 253
          Align = alClient
          BevelInner = bvNone
          BorderStyle = bsNone
          DefaultRowHeight = 54
          TabOrder = 0
          StyleElements = [seBorder]
          OnDrawCellData = TableExSearchDrawCellData
          ItemIndex = -1
          OnItemClick = TableExSearchItemClick
          ProcEmpty = True
          Columns = <
            item
              Caption = 'Album'
              Width = 54
              MinWidth = 54
            end
            item
              Caption = #1053#1072#1079#1074#1072#1085#1080#1077
              Width = 505
            end>
          DefaultDataDrawing = False
          ItemCount = 1
          LineColor = clWhite
          LineColorXor = clWhite
          LineHotColor = 16250098
          LineSelColor = 15855081
          FontHotLine.Charset = DEFAULT_CHARSET
          FontHotLine.Color = 2631720
          FontHotLine.Height = -11
          FontHotLine.Name = 'Tahoma'
          FontHotLine.Style = []
          FontLine.Charset = DEFAULT_CHARSET
          FontLine.Color = 2631720
          FontLine.Height = -11
          FontLine.Name = 'Tahoma'
          FontLine.Style = []
          FontSelLine.Charset = DEFAULT_CHARSET
          FontSelLine.Color = 4210752
          FontSelLine.Height = -11
          FontSelLine.Name = 'Tahoma'
          FontSelLine.Style = []
          ShowColumns = False
          ColumnsFont.Charset = DEFAULT_CHARSET
          ColumnsFont.Color = 2631720
          ColumnsFont.Height = -11
          ColumnsFont.Name = 'Tahoma'
          ColumnsFont.Style = []
          SetFocusOnEnter = True
        end
      end
    end
  end
  object PanelLoading: TPanel
    Left = 341
    Top = 314
    Width = 270
    Height = 153
    BevelOuter = bvNone
    Caption = 'Loading...'
    Color = 11040330
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -27
    Font.Name = 'Roboto'
    Font.Style = []
    Font.Quality = fqProof
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    Visible = False
    DesignSize = (
      270
      153)
    object ActivityIndicatorLoading: TActivityIndicator
      Left = 101
      Top = 25
      Anchors = []
      FrameDelay = 30
      IndicatorColor = aicWhite
      IndicatorSize = aisXLarge
    end
  end
  object VK: TVK
    AppID = '6121396'
    AppKey = 'AlVXZFMUqyrnABp8ncuU'
    EndPoint = 'https://oauth.vk.com/authorize'
    Permissions = [Friends, Audio]
    APIVersion = '5.103'
    BaseURL = 'https://api.vk.com/method'
    OnAuth = VKAuth
    OnLogin = VKLogin
    OnLog = VKLog
    OnError = VKError
    OnErrorLogin = VKErrorLogin
    Left = 64
    Top = 256
  end
  object TimerRefresh: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimerRefreshTimer
    Left = 256
    Top = 320
  end
  object ImageList: TImageList
    ColorDepth = cd32Bit
    Height = 32
    Width = 32
    Left = 160
    Top = 256
    Bitmap = {
      494C01010E001800040020002000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000008000000001002000000000000000
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003A2A
      19525C40277F5C40277F5C40277F5C40277F5C40277F5C40277F5C40277F5C40
      277F503823700403010600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000413F
      3C506864607F6864607F6864607F6864607F6864607F6864607F6864607F6864
      607F5A56536D0504040600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001A120A24B780
      4FFEB88150FFB88150FFB88150FFB88150FFB88150FFB88150FFB88150FFB881
      50FFB88150FF4D36216B00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001C1B1B24CDC6
      BEFB9D9791C09B958FBF9B958FBF9B958FBF9B958FBF9B958FBF9B958FBF9B95
      8FBFBFB9B2EB5654516B00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000022180F30B881
      50FFB88150FFB88150FFB88150FFB88150FFB88150FFB88150FFB88150FFB881
      50FFB88150FF573D257800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000027262430C8C0
      B8F4020202030000000000000000000000000000000000000000000000000000
      0000908A85B0615F5A7800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000022180F30B881
      50FFB88150FFB67F4FFC412E1B5B50392370B88150FFB88150FFB88150FFB881
      50FFB88150FF573D257800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000027262430C8C0
      B8F4020202030000000000000000000000000000000000000000000000000000
      0000908A85B0615F5A7800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000022180F30B881
      50FFB67F4FFC412E1B5B0F0B05150A06030F50392370B88150FFB88150FFB881
      50FFB88150FF573D257800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000027262430C8C0
      B8F4020202030000000000000000000000000000000000000000000000000000
      0000908A85B0615F5A7800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000022180F30B67F
      4FFC412E1B5B110C06189B6D44D791653EC90A06030F50392370B88150FFB881
      50FFB88150FF573D257800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000027262430C8C0
      B8F4020202030000000000000000000000000000000000000000000000000000
      0000908A85B0615F5A7800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000022180F30B881
      50FF7250319E9B6D44D7B88150FFB88150FF91653EC90A06030F50392370B881
      50FFB88150FF573D257800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000027262430C8C0
      B8F4020202030000000000000000000000000000000000000000000000000000
      0000908A85B0615F5A7800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000022180F30B881
      50FFB88150FFB88150FFB88150FFB88150FFB88150FF91653EC90A06030F5039
      2370B88150FF573D257800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000027262430C8C0
      B8F4020202030000000000000000000000000000000000000000000000000000
      0000908A85B0615F5A7800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000022180F30B881
      50FFB88150FFB88150FFB88150FFB88150FFB88150FFB88150FF91653EC91C14
      0B27A9764AEA573D257800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000027262430C8C0
      B8F4020202030000000000000000000000000000000000000000000000000000
      0000908A85B0615F5A7800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000022180F30B881
      50FFB88150FFB88150FFB88150FFB88150FFB88150FFB88150FFB88150FFB881
      50FFB88150FF573D257800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000027262430C8C0
      B8F4020202030000000000000000000000000000000000000000000000000000
      0000908A85B0615F5A7800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000110C0618B07B
      4CF5B88150FFB88150FFB88150FFB88150FFB88150FFB88150FFB88150FFB881
      50FFB88150FF3E2B1A5600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000013131218C6BE
      B7F2D1C9C1FFD1C9C1FFD1C9C1FFD1C9C1FFD1C9C1FFD1C9C1FFD1C9C1FFD1C9
      C1FFD1C9C1FF44413F5300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000160F
      091E2D20133F2D20133F2D20133F2D20133F2D20133F2D20133F2D20133F2D20
      133F23180F300000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001615
      151C33312F3F33312F3F33312F3F33312F3F33312F3F33312F3F33312F3F3331
      2F3F2524212E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000023190F323626
      184C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000023190F323626
      184C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000023190F32A97949EE412F
      1C5C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000023190F32A97949EE412F
      1C5C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000303030A434343C1272727710000
      0000000000000000000000000000000000000000000000000000000000033E3E
      3EB3595959FF595959FF595959FF585858FB0B0B0B2000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000023190F32A97949EEB5824FFF412F
      1C5C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000023190F32A97949EEB5824FFF412F
      1C5C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000705030A89623BC1503A22710000
      0000000000000000000000000000000000000000000000000000020000037F5B
      37B3B5824FFFB5824FFFB5824FFFB2804EFB17100A2000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001D1D1D57595959FF595959FF2727
      2771000000000000000000000000000000000000000000000000000000000000
      00033E3E3EB3595959FF595959FF585858FB0B0B0B2000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000023190F32A97949EEB5824FFFB5824FFFB582
      4FFFB5824FFFB5824FFFB5824FFFB5824FFFB5824FFFB5824FFFB5824FFFB582
      4FFFB5824FFFB5824FFFB2804EFB17100A200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000023190F32A97949EEB5824FFFB5824FFFB582
      4FFFB5824FFFB5824FFFB5824FFFB5824FFFB5824FFFB5824FFFB5824FFFB582
      4FFFB5824FFFB5824FFFB2804EFB17100A200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003D2C1A57B5824FFFB5824FFF503A
      2271000000000000000000000000000000000000000000000000000000000200
      00037F5B37B3B5824FFFB5824FFFB2804EFB17100A2000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021212162595959FF5959
      59FF272727710000000000000000000000000000000000000000000000000404
      0411484848D0595959FF595959FF585858FB0B0B0B2000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000C070411936A41D0B5824FFFB5824FFFB582
      4FFFB5824FFFB5824FFFB5824FFFB5824FFFB5824FFFB5824FFFB5824FFFB582
      4FFFB5824FFFB5824FFFB2804EFB17100A200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000C070411936A41D0B5824FFFB5824FFFB582
      4FFFB5824FFFB5824FFFB5824FFFB5824FFFB5824FFFB5824FFFB5824FFFB582
      4FFFB5824FFFB5824FFFB2804EFB17100A200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000045311D62B5824FFFB582
      4FFF503A22710000000000000000000000000000000000000000000000000C07
      0411936A41D0B5824FFFB5824FFFB2804EFB17100A2000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000212121625959
      59FF595959FF2727277100000000000000000000000000000000040404114848
      48D0595959FF4B4B4BD8404040BA585858FB0B0B0B2000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000C070411936A41D0B5824FFF412F
      1C5C000000000000000000000000000000000000000000000000000000000000
      00000000000090683ECCB2804EFB17100A200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000C070411936A41D0B5824FFF412F
      1C5C000000000000000000000000000000000000000000000000000000000000
      00000000000090683ECCB2804EFB17100A200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000045311D62B582
      4FFFB5824FFF503A2271000000000000000000000000000000000C070411936A
      41D0B5824FFF996E42D8845F3ABAB2804EFB17100A2000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002121
      2162595959FF595959FF27272771000000000000000004040411484848D05959
      59FF4B4B4BD807070718000000033D3D3DB00B0B0B2000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000C070411936A41D0412F
      1C5C000000000000000000000000000000000000000000000000000000000000
      00000000000090683ECCB2804EFB17100A200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000C070411936A41D0412F
      1C5C000000000000000000000000000000000000000000000000000000000000
      00000000000090683ECCB2804EFB17100A200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004531
      1D62B5824FFFB5824FFF503A227100000000000000000C070411936A41D0B582
      4FFF996E42D8110C0618020000037C5937B017100A2000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000021212162595959FF595959FF27272771000000000303030A434343C14B4B
      4BD8070707180000000000000000000000010303030800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000C0704111F17
      0E2E000000000000000000000000000000000000000000000000000000000000
      00000000000090683ECCB2804EFB17100A200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000C0704111F17
      0E2E000000000000000000000000271C1037B5824FFF33241547000000000000
      00000000000090683ECCB2804EFB17100A200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000045311D62B5824FFFB5824FFF503A2271000000000705030A89623BC1996E
      42D8110C06180000000000000000000000010604020800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000021212162595959FF595959FF27272771000000000303030A0606
      0615000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000090683ECCB2804EFB17100A200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000271C1037B5824FFF33241547000000000000
      00000000000090683ECCB2804EFB17100A200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000045311D62B5824FFFB5824FFF503A2271000000000705030A0F09
      0515000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000021212162595959FF595959FF27272771000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000271C1037B5824FFF33241547000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000045311D62B5824FFFB5824FFF503A2271000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000021212162595959FF595959FF272727710000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000312315465A41277F1F17
      0E2E000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000312315465A41277F1F17
      0E2E0000000000000000412E1B5B6E4F2F9BB5824FFF33241547000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000045311D62B5824FFFB5824FFF503A22710000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000040404113636369D050505100000000021212162595959FF595959FF2727
      2771000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000062472A8CB5824FFF412F
      1C5C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000062472A8CB5824FFF412F
      1C5C00000000000000007A5735ACB5824FFFB5824FFF33241547000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000C0704116F50319D0B0805100000000045311D62B5824FFFB5824FFF503A
      2271000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000404
      0411484848D0595959FF3A3A3AA7000000000000000021212162595959FF5959
      59FF2727277100000000000000001313133B0808081900000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000062472A8CB5824FFF412F
      1C5C000000000000000000000000000000000000000000000000000000000000
      000000000000755432A5100B0619000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000062472A8CB5824FFF412F
      1C5C000000000000000000000000392919505A40267F19120A23000000000000
      000000000000755432A5100B0619000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000C07
      0411936A41D0B5824FFF765533A7000000000000000045311D62B5824FFFB582
      4FFF503A22710000000000000000291E113B120B061900000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000040404114848
      48D0595959FF4B4B4BD807070718000000000000000000000000212121625959
      59FF595959FF272727711515153E555555F30B0B0B2000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000062472A8CB5824FFF412F
      1C5C000000000000000000000000000000000000000000000000000000000000
      00000000000090683ECC996E42D8100B06190000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000062472A8CB5824FFF412F
      1C5C000000000000000000000000000000000000000000000000000000000000
      00000000000090683ECC996E42D8100B06190000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000C070411936A
      41D0B5824FFF996E42D8110C061800000000000000000000000045311D62B582
      4FFFB5824FFF503A22712C20123EAD7C4BF317100A2000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000004040411484848D05959
      59FF4B4B4BD80707071800000000000000000000000000000000000000002121
      2162595959FF595959FF595959FF585858FB0B0B0B2000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000062472A8CB5824FFF7A58
      36AD5A41277F5A41277F5A41277F5A41277F5A41277F5A41277F5A41277F5A41
      277F5A41277FA17547E5B5824FFF996E42D8100B061900000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000062472A8CB5824FFF7A58
      36AD5A41277F5A41277F5A41277F5A41277F5A41277F5A41277F5A41277F5A41
      277F5A41277FA17547E5B5824FFF996E42D8100B061900000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000C070411936A41D0B582
      4FFF996E42D8110C061800000000000000000000000000000000000000004531
      1D62B5824FFFB5824FFFB5824FFFB2804EFB17100A2000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000004040411484848D0595959FF4B4B
      4BD8070707180000000000000000000000000000000000000000000000000000
      00003030308C595959FF595959FF585858FB0B0B0B2000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000062472A8CB5824FFFB582
      4FFFB5824FFFB5824FFFB5824FFFB5824FFFB5824FFFB5824FFFB5824FFFB582
      4FFFB5824FFFB5824FFFB5824FFFB5824FFF926940CD02000003000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000062472A8CB5824FFFB582
      4FFFB5824FFFB5824FFFB5824FFFB5824FFFB5824FFFB5824FFFB5824FFFB582
      4FFFB5824FFFB5824FFFB5824FFFB5824FFF926940CD02000003000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000C070411936A41D0B5824FFF996E
      42D8110C06180000000000000000000000000000000000000000000000000000
      000062472B8CB5824FFFB5824FFFB2804EFB17100A2000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001B1B1B50575757FB4B4B4BD80707
      0718000000000000000000000000000000000000000000000000000000001515
      153E565656F7595959FF595959FF585858FB0B0B0B2000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000312315465A40267F5A40
      267F5A40267F5A40267F5A40267F5A40267F5A40267F5A40267F5A40267F5A40
      267F5A40267FA17546E5B5824FFFAD7C4BF42A1E123C00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000312315465A40267F5A40
      267F5A40267F5A40267F5A40267F5A40267F5A40267F5A40267F5A40267F5A40
      267F5A40267FA17546E5B5824FFFAD7C4BF42A1E123C00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000038281950B27F4DFB996E42D8110C
      0618000000000000000000000000000000000000000000000000000000002C20
      123EAF7E4CF7B5824FFFB5824FFFB2804EFB17100A2000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000017171746070707180000
      0000000000000000000000000000000000000000000000000000000000032929
      29772B2B2B7F2B2B2B7F2B2B2B7F2B2B2B7D0505051000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000090683ECCAD7C4BF42A1E123C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000090683ECCAD7C4BF42A1E123C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031231546110C06180000
      000000000000000000000000000000000000000000000000000002000003553D
      24775A40267F5A40267F5A40267F593F277D0B08041000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000089633BC12A1E123C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000089633BC12A1E123C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000160E081F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000160E081F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000705030A563F267B5A41277F5A41277F5940287D0B0805100000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000022180F306649
      2D90B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF6C4D3098281D113800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000C070411755433A6B58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FF7A5836AD100B08190000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000022180F30A17548E5B58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFA8794AED281D113800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002C20123EAF7E4EF7B58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB2804FFB3526164A000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000101010321919
      194C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000101010321919
      194C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001C140B27A9794AEEB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFAD7C4CF423190E310000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010101032535353EE1F1F
      1F5C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010101032535353EE1F1F
      1F5C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000020000038E663EC8B58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FF976C43D40502
      0107000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000010101032535353EE595959FF1F1F
      1F5C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000010101032535353EE595959FF1F1F
      1F5C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004B37216CB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FF583F
      267C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000033E3E3EB33636369C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000010101032535353EE595959FF595959FF5959
      59FF595959FF595959FF595959FF595959FF595959FF595959FF595959FF5959
      59FF595959FF595959FF585858FB0B0B0B200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000010101032535353EE595959FF595959FF5959
      59FF595959FF595959FF595959FF595959FF595959FF595959FF595959FF5959
      59FF595959FF595959FF585858FB0B0B0B200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000200
      00039C7145DEB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF6C4D30985A40277F6E4F319BB58250FFB58250FF735332A35A40277F6649
      2D90B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFA677
      4AEA050201070000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00033E3E3EB3595959FF424242BF010101070000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000004040411484848D0595959FF595959FF5959
      59FF595959FF595959FF595959FF595959FF595959FF595959FF595959FF5959
      59FF595959FF595959FF585858FB0B0B0B200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000004040411484848D0595959FF595959FF5959
      59FF595959FF595959FF595959FF595959FF595959FF595959FF595959FF5959
      59FF595959FF595959FF585858FB0B0B0B200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003626
      184CB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF2319103200000000271C1037B58250FFB58250FF33241547000000001811
      0922B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF412F1C5C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000033E3E
      3EB3595959FF424242BF01010107000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000004040411484848D0595959FF1F1F
      1F5C000000000000000000000000000000000000000000000000000000000000
      000000000000464646CC585858FB0B0B0B200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000004040411484848D0595959FF1F1F
      1F5C000000000000000000000000000000000000000000000000000000000000
      000000000000464646CC585858FB0B0B0B200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006247
      2B8CB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF2319103200000000271C1037B58250FFB58250FF33241547000000001811
      0922B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF6E4F309C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000101010302C2C2C7F2C2C2C7F2525256E00000000000000033E3E3EB35959
      59FF424242BF0101010700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000004040411484848D01F1F
      1F5C000000000000000000000000000000000000000000000000000000000000
      000000000000464646CC585858FB0B0B0B200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000004040411484848D01F1F
      1F5C000000000000000000000000000000000000000000000000000000000000
      000000000000464646CC585858FB0B0B0B200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008962
      3DC1B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF2319103200000000271C1037B58250FFB58250FF33241547000000001811
      0922B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF946A42D10000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000040404114141
      41BB595959FF595959FF595959FF595959FF555555F42D2D2D82575757FB4242
      42BF010101070000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000040404110F0F
      0F2E000000000000000000000000000000000000000000000000000000000000
      000000000000464646CC585858FB0B0B0B200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000040404110F0F
      0F2E00000000000000000000000012121237595959FF18181847000000000000
      000000000000464646CC585858FB0B0B0B200000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000001976C
      42D5B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF2319103200000000271C1037B58250FFB58250FF33241547000000001811
      0922B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFA17347E30200000300000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000040404114C4C4CDA5959
      59FF3434349807070718000000001F1F1F5B484848D0595959FF2B2B2B7C0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000464646CC585858FB0B0B0B200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000012121237595959FF18181847000000000000
      000000000000464646CC585858FB0B0B0B200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000010100029D70
      45DDB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF2319103200000000271C1037B58250FFB58250FF33241547000000001811
      0922B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFA6774AEA0502010700000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002C2C2C81595959FF2323
      2367000000000000000000000000000000000303030A474747CC525252EB0505
      0510000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000012121237595959FF18181847000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000001976C
      42D5B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF2319103200000000271C1037B58250FFB58250FF33241547000000001811
      0922B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFA17347E30200000300000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000034E4E4EDE4B4B4BD80000
      000300000000000000000000000000000000000000001919194C595959FF1F1F
      1F5C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000171717462C2C2C7F0F0F
      0F2E000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000171717462C2C2C7F0F0F
      0F2E00000000000000001F1F1F5B3535359B595959FF18181847000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008962
      3DC1B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF2319103200000000271C1037B58250FFB58250FF33241547000000001811
      0922B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF946A42D10000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000303030D545454F33636369C0000
      000000000000000000000000000000000000000000000808081B575757FB2E2E
      2E87000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003030308C595959FF1F1F
      1F5C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003030308C595959FF1F1F
      1F5C00000000000000003B3B3BAC595959FF595959FF18181847000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006247
      2B8CB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF2319103200000000271C1037B58250FFB58250FF33241547000000001811
      0922B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF6E4F309C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000303030D545454F33A3A3AA70000
      000000000000000000000000000000000000000000000E0E0E2C595959FF2A2A
      2A7C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003030308C595959FF1F1F
      1F5C000000000000000000000000000000000000000000000000000000000000
      0000000000003A3A3AA508080819000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003030308C595959FF1F1F
      1F5C0000000000000000000000001B1B1B502B2B2B7F0B0B0B23000000000000
      0000000000003A3A3AA508080819000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003626
      184CB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF2319103200000000271C1037B58250FFB58250FF33241547000000001811
      0922B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF412F1C5C0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003F3F3FB7555555F40909
      091C00000000000000000000000000000000000000002C2C2C81595959FF1818
      1847000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003030308C595959FF1F1F
      1F5C000000000000000000000000000000000000000000000000000000000000
      000000000000464646CC4B4B4BD8080808190000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003030308C595959FF1F1F
      1F5C000000000000000000000000000000000000000000000000000000000000
      000000000000464646CC4B4B4BD8080808190000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000200
      00039C7145DEB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF6C4D30985A41277F6E4F319BB58250FFB58250FF735332A35A41277F6649
      2D90B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFA577
      4AEA050201070000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001919194C595959FF4343
      43C1050505100000000000000000000000001E1E1E5B575757FB444444C30000
      0003000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003030308C595959FF3C3C
      3CAD2C2C2C7F2C2C2C7F2C2C2C7F2C2C2C7F2C2C2C7F2C2C2C7F2C2C2C7F2C2C
      2C7F2C2C2C7F4F4F4FE5595959FF4B4B4BD80808081900000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003030308C595959FF3C3C
      3CAD2C2C2C7F2C2C2C7F2C2C2C7F2C2C2C7F2C2C2C7F2C2C2C7F2C2C2C7F2C2C
      2C7F2C2C2C7F4F4F4FE5595959FF4B4B4BD80808081900000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004B37216CB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FF583F
      267C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000282828775959
      59FF585858FD3131318F2C2C2C7F444444C5595959FF4E4E4EE20B0B0B230000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003030308C595959FF5959
      59FF595959FF595959FF595959FF595959FF595959FF595959FF595959FF5959
      59FF595959FF595959FF595959FF595959FF484848CD00000003000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003030308C595959FF5959
      59FF595959FF595959FF595959FF595959FF595959FF595959FF595959FF5959
      59FF595959FF595959FF595959FF595959FF484848CD00000003000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000020000038E663EC8B58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FF956C43D40502
      0107000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001717
      1746444444C5595959FF595959FF585858FD3131318D05050510000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000171717462B2B2B7F2B2B
      2B7F2B2B2B7F2B2B2B7F2B2B2B7F2B2B2B7F2B2B2B7F2B2B2B7F2B2B2B7F2B2B
      2B7F2B2B2B7F4F4F4FE5595959FF555555F41414143C00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000171717462B2B2B7F2B2B
      2B7F2B2B2B7F2B2B2B7F2B2B2B7F2B2B2B7F2B2B2B7F2B2B2B7F2B2B2B7F2B2B
      2B7F2B2B2B7F4F4F4FE5595959FF555555F41414143C00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001C140B27A9794AEEB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFAD7C4CF423190E310000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000464646CC555555F41414143C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000464646CC555555F41414143C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002C20123EAF7E4EF7B58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB2804EFB3526164A000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000434343C11414143C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000434343C11414143C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000022180F30A17547E5B58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFA8784AED281C103800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000A0A0A1F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000A0A0A1F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000C070411755433A5B58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FF7A5836AD110C06180000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000022180F306649
      2D90B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF6C4D3098281C103800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000002000003553D24775A40277F5A40277F563F267B050201070000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000705030A563F267B5A41277F5A41277F5940287D0B0805100000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000022180F306649
      2D90B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF6C4D3098281D113800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000C070411755433A6B58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FF7A5836AD100B08190000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000022180F30A17548E5B58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFA8794AED281D113800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000050402080806030C00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002C20123EAF7E4EF7B58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB2804FFB3526164A000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000705030A89623DC1906740CC0B080510000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001C140B27A9794AEEB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFAD7C4CF423190E310000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000705030A89623DC1B58250FFB58250FF906740CC0B0805100000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000020000038E663EC8B58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FF976C43D40502
      0107000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000705030A89623DC1B58250FFB58250FFB58250FFB58250FF906740CC0B08
      0510000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004B37216CB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFAB7C4CF3B58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FF583F
      267C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000705
      030A89623DC1B58250FFB58250FFB58250FFB58250FFB58250FFB58250FF9067
      40CC0B0805100000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000200
      00039C7145DEB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FF503A2371543C2477B58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFA677
      4AEA050201070000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000705030A8962
      3DC1B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF906740CC0B08051000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003626
      184CB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FF503A2371000000002A1E113BA17547E5B58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF412F1C5C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006B4D
      2F973A291951000000000000000000000000000000000000000000000000543C
      2476B58250FF2319103200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007252
      32A1B07E4EF80A07030E00000000000000000000000000000000000000000705
      030A7A5735AC2319103200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000705030A89623DC1B582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FF906740CC0B080510000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006247
      2B8CB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FF503A237100000000000000000C070411845F3ABAB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF6E4F309C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007252
      32A1B58250FF785635AA0502010700000000000000000000000000000000543C
      2476B58250FF2319103200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007252
      32A1B07E4EF80A07030E000000000000000000000000000000002A1E113BA175
      48E5B58250FF2319103200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000705030A89623DC1B58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FF906740CC0B0805100000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008962
      3DC1B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FF503A237100000000000000000000000000000000543C2477B582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF946A42D10000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007252
      32A1B58250FFB58250FFA17347E3281D1138000000000000000000000000543C
      2476B58250FF2319103200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007252
      32A1B07E4EF80A07030E00000000000000000000000162462B8AB58250FFB582
      50FFB58250FF2319103200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000705030A89623DC1B58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FF906740CC0B08051000000000000000000000
      000000000000000000000000000000000000000000000000000000000001976C
      42D5B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FF503A237100000000000000000000000000000000000000002A1E
      113BA17547E5B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFA17347E30200000300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007252
      32A1B58250FFB58250FFB58250FFB58250FF5E442A870000000000000000543C
      2476B58250FF2319103200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007252
      32A1B07E4EF80A07030E000000001B130C26936A41D0B58250FFB58250FFB582
      50FFB58250FF2319103200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000705030A89623DC1B58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FF906740CC0B080510000000000000
      0000000000000000000000000000000000000000000000000000010100029D70
      45DDB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FF503A237100000000000000000000000000000000000000000000
      000018110922B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFA6774AEA0502010700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007252
      32A1B58250FFB58250FFB58250FFB58250FFB58250FF926840CD19120A23543C
      2476B58250FF2319103200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007252
      32A1B07E4EF80A07030E48341F65B27F4EFBB58250FFB58250FFB58250FFB582
      50FFB58250FF2319103200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000705030A89623DC1B58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FF906740CC0B0805100000
      000000000000000000000000000000000000000000000000000000000001976C
      42D5B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FF503A237100000000000000000000000000000000000000002A1E
      113BA17548E5B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFA17347E30200000300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007252
      32A1B58250FFB58250FFB58250FFB58250FFA8784AED3727174E00000000543C
      2476B58250FF2319103200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007252
      32A1B07E4EF80A07030E0705030A715232A2B58250FFB58250FFB58250FFB582
      50FFB58250FF2319103200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000018110922B582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FF2319103200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008962
      3DC1B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FF503A237100000000000000000000000000000000543D2577B582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF946A42D10000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007252
      32A1B58250FFB58250FFB58250FF825D39B8110C06180000000000000000543C
      2476B58250FF2319103200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007252
      32A1B07E4EF80A07030E000000000000000039291952A9794AEEB58250FFB582
      50FFB58250FF2319103200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000018110922B582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FF2319103200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006247
      2B8CB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FF503A237100000000000000000C070411845F3ABBB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF6E4F309C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007252
      32A1B58250FFB2804EFB4A36206A00000000000000000000000000000000543C
      2476B58250FF2319103200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007252
      32A1B07E4EF80A07030E000000000000000000000000120E081B845F3ABAB582
      50FFB58250FF2319103200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000018110922B582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FF2319103200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003626
      184CB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FF503A2371000000002A1E113BA17548E5B58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF412F1C5C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007252
      32A1906840CD1F170E2E0000000000000000000000000000000000000000543C
      2476B58250FF2319103200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007252
      32A1B07E4EF80A07030E00000000000000000000000000000000000000004F39
      2370B27F4EFB2319103200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000018110922B582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FF2319103200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000200
      00039C7145DEB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FF503A2371543D2577B58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFA577
      4AEA050201070000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003123
      1546020000030000000000000000000000000000000000000000000000002A1E
      113B5A40277F110C061800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003929
      1950563F267B0502010700000000000000000000000000000000000000000000
      000022180F30110C061800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000018110922B582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FF2319103200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004B37216CB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFAD7C4CF4B58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FF583F
      267C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000018110922B582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FF2319103200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000020000038E663EC8B58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FF956C43D40502
      0107000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000018110922B582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FF2319103200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001C140B27A9794AEEB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFAD7C4CF423190E310000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000018110922B582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FF2319103200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002C20123EAF7E4EF7B58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB2804EFB3526164A000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000018110922B582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FF2319103200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000022180F30A17547E5B58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFA8784AED281C103800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000018110922B582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FF2319103200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000C070411755433A5B58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FF7A5836AD110C06180000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000C0704115A40
      277F5A40277F5A40277F5A40277F5A40277F5A40277F5A40277F5A40277F5A40
      277F5A40277F110C061800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000022180F306649
      2D90B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF6C4D3098281C103800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000002000003553D24775A40277F5A40277F563F267B050201070000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000800000000100010000000000000800000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFE003FFFFE003FF0000000000000000
      FFC003FFFFC003FF0000000000000000FFC003FFFFC7F3FF0000000000000000
      FFC003FFFFC7F3FF0000000000000000FFC003FFFFC7F3FF0000000000000000
      FFC003FFFFC7F3FF0000000000000000FFC003FFFFC7F3FF0000000000000000
      FFC003FFFFC7F3FF0000000000000000FFC003FFFFC7F3FF0000000000000000
      FFC003FFFFC7F3FF0000000000000000FFC003FFFFC003FF0000000000000000
      FFE007FFFFE007FF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFFFFFFFCFFFFFFFFFFFFF
      FFFFFFFFFF8FFFFFFF8FFFFFFFFFFFFFFF1FC07FFF0FFFFFFF0FFFFFFF1FC07F
      FF0FE07FFE0000FFFE0000FFFF0FE07FFF87E07FFE0000FFFE0000FFFF87E07F
      FFC3C07FFF0FF8FFFF0FF8FFFFC3C07FFFE1807FFF8FF8FFFF8FF8FFFFE1807F
      FFF0867FFFCFF8FFFFCE38FFFFF0867FFFF84FFFFFFFF8FFFFFE38FFFFF84FFF
      FFFC3FFFFFFFFFFFFFFE3FFFFFFC3FFFFFFE1FFFFF8FFFFFFF8C3FFFFFFE1FFF
      FFF10FFFFF8FFFFFFF8C3FFFFFF10FFFFFE1867FFF8FF9FFFF8E39FFFFE1867F
      FFC1C07FFF8FF8FFFF8FF8FFFFC1C07FFF83E07FFF80007FFF80007FFF83E07F
      FF07F07FFF80003FFF80003FFF07F07FFF0FE07FFF80007FFF80007FFF0FE07F
      FF9FC07FFFFFF8FFFFFFF8FFFF9FC07FFFFFFFFFFFFFF9FFFFFFF9FFFFFFFFFF
      FFFFFFFFFFFFFBFFFFFFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF81FFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFC003FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFF
      FE00007FFFFFFFFFFFFFFFFFFFFFFFFFFC00003FFFFFFFFFFFCFFFFFFFCFFFFF
      F800001FFFFFFFFFFF8FFFFFFF8FFFFFF000000FFFFFFFFFFF0FFFFFFF0FFFFF
      F000000FFFFFF1FFFE0000FFFE0000FFE0000007FFFFE0FFFE0000FFFE0000FF
      E0042007FFFFC1FFFF0FF8FFFF0FF8FFE0042007FFF083FFFF8FF8FFFF8FF8FF
      E0042007FFC007FFFFCFF8FFFFCE38FFC0042003FF821FFFFFFFF8FFFFFE38FF
      C0042003FF8F0FFFFFFFFFFFFFFE3FFFC0042003FF0F8FFFFF8FFFFFFF8C3FFF
      E0042007FF1F8FFFFF8FFFFFFF8C3FFFE0042007FF1F8FFFFF8FF9FFFF8E39FF
      E0042007FF8F8FFFFF8FF8FFFF8FF8FFE0000007FF870FFFFF80007FFF80007F
      F000000FFFC01FFFFF80003FFF80003FF000000FFFE03FFFFF80007FFF80007F
      F800001FFFFFFFFFFFFFF8FFFFFFF8FFFC00003FFFFFFFFFFFFFF9FFFFFFF9FF
      FE00007FFFFFFFFFFFFFFBFFFFFFFBFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFC003FFFFFFFFFFFFFFFFFFFFFFFFFFFFF81FFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF81FFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFC003FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFF
      FE00007FFFFFFFFFFFFFFFFFFFFE7FFFFC00003FFFFFFFFFFFFFFFFFFFFC3FFF
      F800001FFFFFFFFFFFFFFFFFFFF81FFFF000000FFFFFFFFFFFFFFFFFFFF00FFF
      F000000FFFFFFFFFFFFFFFFFFFE007FFE0000007FFFFFFFFFFFFFFFFFFC003FF
      E0020007FFE7E3FFFFE3E3FFFF8001FFE0030007FFE1E3FFFFE3C3FFFF0000FF
      E003C007FFE0E3FFFFE303FFFE00007FC003E003FFE063FFFFE203FFFC00003F
      C003F003FFE003FFFFE003FFF800001FC003E003FFE023FFFFE003FFFFC003FF
      E003C007FFE063FFFFE303FFFFC003FFE0030007FFE1E3FFFFE383FFFFC003FF
      E0020007FFE3E3FFFFE3E3FFFFC003FFE0000007FFE7E3FFFFE3F3FFFFC003FF
      F000000FFFFFFFFFFFFFFFFFFFC003FFF000000FFFFFFFFFFFFFFFFFFFC003FF
      F800001FFFFFFFFFFFFFFFFFFFC003FFFC00003FFFFFFFFFFFFFFFFFFFC003FF
      FE00007FFFFFFFFFFFFFFFFFFFC003FFFF0000FFFFFFFFFFFFFFFFFFFFC003FF
      FFC003FFFFFFFFFFFFFFFFFFFFFFFFFFFFF81FFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ImageListL: TImageList
    ColorDepth = cd32Bit
    Height = 32
    Width = 32
    Left = 256
    Top = 256
  end
  object TimerEqu: TTimer
    Enabled = False
    Interval = 50
    OnTimer = TimerEquTimer
    Left = 340
    Top = 321
  end
  object TimerAnimate: TTimer
    Enabled = False
    Interval = 5
    OnTimer = TimerAnimateTimer
    Left = 340
    Top = 257
  end
  object PopupMenuAudio: TPopupMenu
    Left = 160
    Top = 319
    object MenuItemAudioDownload: TMenuItem
      Caption = #1057#1082#1072#1095#1072#1090#1100
    end
    object MenuItemAudioAlbum: TMenuItem
      Caption = #1040#1083#1100#1073#1086#1084
    end
    object MenuItemAudioArtist: TMenuItem
      Caption = #1040#1088#1090#1080#1089#1090
    end
    object MenuItemAudioDelete: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
    end
    object MenuItemAudioAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    end
  end
  object Taskbar: TTaskbar
    TaskBarButtons = <
      item
        Hint = #1053#1072#1079#1072#1076
        Icon.Data = {
          0000010001001818000001002000880900001600000028000000180000003000
          0000010020000000000060090000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000120000003D0000003D0000001F0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000500000009000000000000000000000000000000000000
          0000000000000000000000000000151515B6808080FD808080FD323232D80000
          0013000000000000000000000000000000000000000000000000000000000000
          00000000001A101010AD303030D1000000240000000000000000000000000000
          0000000000000000000000000000242424DAFFFFFFFFFFFFFFFF5A5A5AEF0000
          0020000000000000000000000000000000000000000000000000000000000000
          004A282828DEC3C3C3FE7F7F7FFD0000003D0000000000000000000000000000
          0000000000000000000000000000242424DAFFFFFFFFFFFFFFFF5A5A5AEF0000
          002000000000000000000000000000000000000000000000000D070707946767
          67FBEFEFEFFFFFFFFFFF808080FD0000003D0000000000000000000000000000
          0000000000000000000000000000242424DAFFFFFFFFFFFFFFFF5A5A5AEF0000
          002000000000000000000000000000000000000000361E1E1ECBABABABFEFBFB
          FBFFFFFFFFFFFFFFFFFF808080FD0000003D0000000000000000000000000000
          0000000000000000000000000000242424DAFFFFFFFFFFFFFFFF5A5A5AEF0000
          0020000000000000000000000001000000744A4A4AF0DBDBDBFFFEFEFEFFFFFF
          FFFFFFFFFFFFFFFFFFFF808080FD0000003D0000000000000000000000000000
          0000000000000000000000000000242424DAFFFFFFFFFFFFFFFF5A5A5AEF0000
          00200000000000000023111111B8909090FEFAFAFAFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF808080FD0000003D0000000000000000000000000000
          0000000000000000000000000000242424DAFFFFFFFFFFFFFFFF5A5A5AEF0000
          002200000059393939E4C8C8C8FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF808080FD0000003D0000000000000000000000000000
          0000000000000000000000000000242424DAFFFFFFFFFFFFFFFF5A5A5AEF0000
          0058656565FCEEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF808080FD0000003D0000000000000000000000000000
          0000000000000000000000000000242424DAFFFFFFFFFFFFFFFF5A5A5AEF0000
          0042252525DCB8B8B8FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF808080FD0000003D0000000000000000000000000000
          0000000000000000000000000000242424DAFFFFFFFFFFFFFFFF5A5A5AEF0000
          002000000019101010A3777777FAF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF808080FD0000003D0000000000000000000000000000
          0000000000000000000000000000242424DAFFFFFFFFFFFFFFFF5A5A5AEF0000
          002000000000000000040000005E3E3E3EF0D5D5D5FEFEFEFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF808080FD0000003D0000000000000000000000000000
          0000000000000000000000000000242424DAFFFFFFFFFFFFFFFF5A5A5AEF0000
          002000000000000000000000000000000023121212BB929292FEFBFBFBFFFFFF
          FFFFFFFFFFFFFFFFFFFF808080FD0000003D0000000000000000000000000000
          0000000000000000000000000000242424DAFFFFFFFFFFFFFFFF5A5A5AEF0000
          0020000000000000000000000000000000000000000B04040479565656F4E0E0
          E0FFFFFFFFFFFFFFFFFF808080FD0000003D0000000000000000000000000000
          0000000000000000000000000000242424DAFFFFFFFFFFFFFFFF5A5A5AEF0000
          00200000000000000000000000000000000000000000000000000000003E2525
          25D7B3B3B3FEFEFEFEFF808080FD0000003D0000000000000000000000000000
          0000000000000000000000000000242424DAFFFFFFFFFFFFFFFF5A5A5AEF0000
          0020000000000000000000000000000000000000000000000000000000000000
          000E000000966F6F6FFB6F6F6FFD0000003D0000000000000000000000000000
          000000000000000000000000000006060677242424DA242424DA1010109D0000
          0006000000000000000000000000000000000000000000000000000000000000
          000000000002000000550F0F0F7B0000000D0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000FFFF
          FF00FFFFFF00FFFFFF00F0FFCF00F07F8700F07F0700F07C0700F0780700F060
          0700F0400700F0000700F0000700F0000700F0000700F0400700F0700700F078
          0700F07E0700F07F0700F07F8700FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      end
      item
        Hint = #1042#1086#1089#1087#1088#1086#1080#1079#1074#1077#1089#1090#1080
        Icon.Data = {
          0000010001001818000001002000880900001600000028000000180000003000
          0000010020000000000060090000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000250000
          0006000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000055525252FB1C1C
          1CCE000000380000000100000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000066AAAAAAFFDFDF
          DFFF575757F30909098B00000013000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000066AAAAAAFFFFFF
          FFFFFBFBFBFFAAAAAAFE222222D8000000460000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000066AAAAAAFFFFFF
          FFFFFFFFFFFFFFFFFFFFF0F0F0FF6A6A6AFD0D0D0DA20000001D000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000066AAAAAAFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFBEBEBEFE383838E50000005D0000
          0007000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000066AAAAAAFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2FF7E7E7EFC0D0D
          0DB3000000240000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000066AAAAAAFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3D3
          D3FF474747F4000000730000000A000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000066AAAAAAFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF7F7F7FF959595FD1E1E1EC60000003A0000000000000000000000000000
          0000000000000000000000000000000000000000000000000066AAAAAAFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFDBDBDBFF484848F50000001300000000000000000000
          0000000000000000000000000000000000000000000000000066AAAAAAFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF6F6F6FF929292FD151515C50000000B00000000000000000000
          0000000000000000000000000000000000000000000000000066AAAAAAFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
          FDFFCECECEFF424242EB040404720000000A0000000000000000000000000000
          0000000000000000000000000000000000000000000000000066AAAAAAFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5FF7E7E
          7EFD121212B70000002600000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000066AAAAAAFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFBCBCBCFF2C2C2CE10000
          005B000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000066AAAAAAFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6E6FF6A6A6AF70D0D0DA0000000190000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000066AAAAAAFFFFFF
          FFFFFFFFFFFFFDFDFDFFAEAEAEFE242424D90000004A00000001000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000066AAAAAAFFFFFF
          FFFFDADADAFF545454F30000008A000000090000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000066A0A0A0FF9797
          97FE1A1A1AC30000003700000001000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000002E232323C00000
          0075000000080000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000FFFF
          FF00FFFFFF00FE7FFF00FC1FFF00FC0FFF00FC07FF00FC01FF00FC007F00FC00
          3F00FC000F00FC000700FC000300FC000300FC000700FC001F00FC003F00FC00
          FF00FC01FF00FC07FF00FC0FFF00FC3FFF00FFFFFF00FFFFFF00FFFFFF00}
      end
      item
        Hint = #1044#1072#1083#1077#1077
        Icon.Data = {
          0000010001001818000001002000880900001600000028000000180000003000
          0000010020000000000060090000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000020000000C00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00090000003B0000003D00000029000000000000000000000000000000000000
          00000000000000000000000000001212129E2E2E2ED700000045000000020000
          0000000000000000000000000000000000000000000000000000000000000F0F
          0F8C727272FC808080FD454545EC000000290000000000000000000000000000
          0000000000000000000000000000242424DBEAEAEAFF5B5B5BF6020202880000
          0009000000000000000000000000000000000000000000000000000000001919
          19AFE2E2E2FFFFFFFFFF808080FD0000003D0000000000000000000000000000
          0000000000000000000000000000242424DAFFFFFFFFFEFEFEFFA3A3A3FF1C1C
          1CCE0000002F0000000000000000000000000000000000000000000000001919
          19AFE2E2E2FFFFFFFFFF808080FD0000003D0000000000000000000000000000
          0000000000000000000000000000242424DAFFFFFFFFFFFFFFFFFEFEFEFFDADA
          DAFF464646ED0202026D00000007000000000000000000000000000000001919
          19AFE2E2E2FFFFFFFFFF808080FD0000003D0000000000000000000000000000
          0000000000000000000000000000242424DAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF5F5F5FF868686FC0B0B0BB2000000170000000000000000000000001919
          19AFE2E2E2FFFFFFFFFF808080FD0000003D0000000000000000000000000000
          0000000000000000000000000000242424DAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFCBCBCBFF313131E60000005300000002000000001919
          19AFE2E2E2FFFFFFFFFF808080FD0000003D0000000000000000000000000000
          0000000000000000000000000000242424DAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFECECECFF6C6C6CF80A0A0A970000000F1919
          19AFE2E2E2FFFFFFFFFF808080FD0000003D0000000000000000000000000000
          0000000000000000000000000000242424DAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFADADADFF0E0E0E951919
          19AFE2E2E2FFFFFFFFFF808080FD0000003D0000000000000000000000000000
          0000000000000000000000000000242424DAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3FF575757F6000000671919
          19AFE2E2E2FFFFFFFFFF808080FD0000003D0000000000000000000000000000
          0000000000000000000000000000242424DAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFDFDFDFFB4B4B4FE292929D500000042000000001919
          19AFE2E2E2FFFFFFFFFF808080FD0000003D0000000000000000000000000000
          0000000000000000000000000000242424DAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF4F4F4FF747474FE0808089E0000001600000000000000001919
          19AFE2E2E2FFFFFFFFFF808080FD0000003D0000000000000000000000000000
          0000000000000000000000000000242424DAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFCACACAFF353535E500000059000000000000000000000000000000001919
          19AFE2E2E2FFFFFFFFFF808080FD0000003D0000000000000000000000000000
          0000000000000000000000000000242424DAFFFFFFFFFFFFFFFFF6F6F6FF9292
          92FD121212B70000002500000000000000000000000000000000000000001919
          19AFE2E2E2FFFFFFFFFF808080FD0000003D0000000000000000000000000000
          0000000000000000000000000000242424DAFEFEFEFFE2E2E2FF505050F50202
          0279000000060000000000000000000000000000000000000000000000001919
          19AFE2E2E2FFFFFFFFFF808080FD0000003D0000000000000000000000000000
          0000000000000000000000000000212121DBABABABFF181818CD000000330000
          0000000000000000000000000000000000000000000000000000000000001919
          19AFE2E2E2FFFFFFFFFF808080FD0000003D0000000000000000000000000000
          00000000000000000000000000000707074E0A0A0A830000000F000000000000
          0000000000000000000000000000000000000000000000000000000000000606
          0654212121D8242424DA151515B6000000120000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000FFFF
          FF00FFFFFF00FFFFFF00F3FF0F00F0FF0700F07F0700F03F0700F00F0700F007
          0700F0010700F0000700F0000700F0000700F0010700F0030700F00F0700F01F
          0700F03F0700F0FF0700F1FF0700FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      end>
    TabProperties = []
    OnThumbButtonClick = TaskbarThumbButtonClick
    Left = 432
    Top = 255
  end
  object HintPanel: TlkHint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Left = 429
    Top = 322
  end
  object SaveDialogMp3: TFileSaveDialog
    DefaultExtension = '.mp3'
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = 'MP3'
        FileMask = '*.mp3'
      end>
    Options = []
    Left = 64
    Top = 319
  end
end
