object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'VK Audio Player'
  ClientHeight = 519
  ClientWidth = 691
  Color = clWhite
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 17
  object Shape1: TShape
    Left = 0
    Top = 56
    Width = 691
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
    Width = 691
    Height = 56
    Align = alTop
    BevelOuter = bvNone
    Color = 16579578
    ParentBackground = False
    TabOrder = 0
    object ImageAlbum: TImage
      AlignWithMargins = True
      Left = 100
      Top = 8
      Width = 40
      Height = 40
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
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
      Left = 650
      Top = 0
      Width = 41
      Height = 56
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
      Left = 148
      Top = 3
      Width = 499
      Height = 50
      Margins.Left = 0
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 4
      object DrawPanel1: TDrawPanel
        Left = 0
        Top = 39
        Width = 499
        Height = 11
        DefaultPaint = False
        OnMouseEnter = DrawPanel1MouseEnter
        OnMouseLeave = DrawPanel1MouseLeave
        OnMouseDown = DrawPanel1MouseDown
        OnMouseMove = DrawPanel1MouseMove
        OnMouseUp = DrawPanel1MouseUp
        OnPaint = DrawPanel1Paint
        Align = alBottom
        Color = clSilver
        ParentBackground = False
        TabOrder = 0
      end
      object PanelTrackSinger: TPanel
        Left = 0
        Top = 0
        Width = 451
        Height = 39
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object LabelTitle: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 0
          Width = 441
          Height = 17
          Margins.Left = 5
          Margins.Top = 0
          Margins.Right = 5
          Margins.Bottom = 1
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
          ExplicitWidth = 60
        end
        object LabelArtist: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 441
          Height = 17
          Margins.Left = 5
          Margins.Top = 0
          Margins.Right = 5
          Margins.Bottom = 1
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
          ExplicitWidth = 43
        end
      end
      object PanelTrackTime: TPanel
        Left = 451
        Top = 0
        Width = 48
        Height = 39
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 2
        object LabelTime: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 6
          Width = 42
          Height = 27
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
          Layout = tlBottom
          OnClick = LabelTimeClick
          ExplicitWidth = 24
          ExplicitHeight = 15
        end
      end
    end
  end
  object PanelPlaylist: TPanel
    AlignWithMargins = True
    Left = 20
    Top = 57
    Width = 671
    Height = 462
    Margins.Left = 20
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object PanelInfoBottom: TPanel
      AlignWithMargins = True
      Left = 0
      Top = 427
      Width = 651
      Height = 35
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 20
      Margins.Bottom = 0
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object LabelAudioCount: TLabel
        AlignWithMargins = True
        Left = 15
        Top = 4
        Width = 190
        Height = 28
        Margins.Left = 15
        Align = alLeft
        Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1089#1087#1080#1089#1082#1072' '#1072#1091#1076#1080#1086#1079#1072#1087#1080#1089#1077#1081'...'
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
        Width = 651
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
      Width = 651
      Height = 111
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 20
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      object Shape3: TShape
        Left = 0
        Top = 110
        Width = 651
        Height = 1
        Align = alBottom
        Brush.Color = 15460326
        Pen.Color = 15460326
        ExplicitTop = 108
      end
      object PanelPageControl: TPanel
        Left = 0
        Top = 65
        Width = 651
        Height = 45
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object PanelPageInd: TPanel
          Left = 0
          Top = 43
          Width = 651
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
          Caption = #1052#1086#1103' '#1084#1091#1079#1099#1082#1072
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
      end
      object PanelSearch: TPanel
        Left = 0
        Top = 0
        Width = 651
        Height = 65
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          651
          65)
        object ButtonFlat1: TButtonFlat
          Left = 0
          Top = 18
          Width = 676
          Height = 36
          Anchors = [akLeft, akTop, akRight]
          Caption = ''
          ColorNormal = clWhite
          ColorOver = clWhite
          ColorPressed = clWhite
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
        object Edit1: TEdit
          Left = 15
          Top = 19
          Width = 567
          Height = 33
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvSpace
          BevelWidth = 7
          BorderStyle = bsNone
          TabOrder = 0
          TextHint = #1055#1086#1080#1089#1082' '#1084#1091#1079#1099#1082#1080
        end
        object ButtonFlat2: TButtonFlat
          Left = 591
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
          IgnorBounds = True
          ImageIndentLeft = 15
          ImageIndex = 5
          Images = ImageList
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
      end
    end
    object PageControl: TPageControl
      Left = 0
      Top = 111
      Width = 671
      Height = 316
      ActivePage = TabSheetPlaylists
      Align = alClient
      Style = tsButtons
      TabOrder = 2
      object TabSheetCurrent: TTabSheet
        Caption = 'TabSheetCurrent'
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object TableExCurrent: TTableEx
          Left = 0
          Top = 0
          Width = 663
          Height = 306
          Align = alClient
          BevelInner = bvNone
          BorderStyle = bsNone
          DefaultRowHeight = 54
          TabOrder = 0
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
              Width = 609
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
        Caption = 'TabSheetMyMusic'
        ImageIndex = 1
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object TableExMyMusic: TTableEx
          Left = 0
          Top = 0
          Width = 663
          Height = 306
          Align = alClient
          BevelInner = bvNone
          BorderStyle = bsNone
          DefaultRowHeight = 54
          TabOrder = 0
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
              Width = 609
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
        Caption = 'TabSheetPlaylists'
        ImageIndex = 2
        TabVisible = False
        object TableExPlaylists: TTableEx
          Left = 0
          Top = 0
          Width = 663
          Height = 306
          Align = alClient
          BevelInner = bvNone
          BorderStyle = bsNone
          DefaultRowHeight = 54
          TabOrder = 0
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
              Width = 609
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
        Caption = 'TabSheetFriends'
        ImageIndex = 3
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object MemoLog: TMemo
          Left = 0
          Top = 0
          Width = 663
          Height = 306
          Align = alClient
          BorderStyle = bsNone
          ScrollBars = ssBoth
          TabOrder = 0
        end
        object TableExFriends: TTableEx
          Left = 0
          Top = 0
          Width = 663
          Height = 306
          Align = alClient
          BevelInner = bvNone
          BorderStyle = bsNone
          DefaultRowHeight = 54
          TabOrder = 1
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
              Width = 609
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
  object VK: TVK
    AppID = '6121396'
    AppKey = 'AlVXZFMUqyrnABp8ncuU'
    EndPoint = 'https://oauth.vk.com/authorize'
    Permissions = 'groups,friends,wall,photos,video,docs,notes,market,audio'
    APIVersion = '5.103'
    BaseURL = 'https://api.vk.com/method'
    OnAuth = VKAuth
    OnLogin = VKLogin
    OnLog = VKLog
    OnError = VKError
    OnErrorLogin = VKErrorLogin
    Left = 56
    Top = 192
  end
  object SaveDialogMp3: TSaveDialog
    Left = 152
    Top = 192
  end
  object TimerRefresh: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimerRefreshTimer
    Left = 288
    Top = 272
  end
  object ImageList: TImageList
    ColorDepth = cd32Bit
    Height = 32
    Width = 32
    Left = 320
    Top = 192
    Bitmap = {
      494C010106000800040020002000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000004000000001002000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000200
      00039C7145DEB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF6C4D30985A40277F6E4F319BB58250FFB58250FF735332A35A40277F6649
      2D90B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFA677
      4AEA050201070000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00033E3E3EB3595959FF424242BF010101070000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003626
      184CB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF2319103200000000271C1037B58250FFB58250FF33241547000000001811
      0922B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF412F1C5C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000033E3E
      3EB3595959FF424242BF01010107000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006247
      2B8CB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF2319103200000000271C1037B58250FFB58250FF33241547000000001811
      0922B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF6E4F309C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000101010302C2C2C7F2C2C2C7F2525256E00000000000000033E3E3EB35959
      59FF424242BF0101010700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008962
      3DC1B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF2319103200000000271C1037B58250FFB58250FF33241547000000001811
      0922B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF946A42D10000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000040404114141
      41BB595959FF595959FF595959FF595959FF555555F42D2D2D82575757FB4242
      42BF010101070000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003626
      184CB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF2319103200000000271C1037B58250FFB58250FF33241547000000001811
      0922B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF412F1C5C0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003F3F3FB7555555F40909
      091C00000000000000000000000000000000000000002C2C2C81595959FF1818
      1847000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000200
      00039C7145DEB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FF6C4D30985A41277F6E4F319BB58250FFB58250FF735332A35A41277F6649
      2D90B58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFA577
      4AEA050201070000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001919194C595959FF4343
      43C1050505100000000000000000000000001E1E1E5B575757FB444444C30000
      0003000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004B37216CB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FF583F
      267C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000282828775959
      59FF585858FD3131318F2C2C2C7F444444C5595959FF4E4E4EE20B0B0B230000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000020000038E663EC8B58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FFB582
      50FFB58250FFB58250FFB58250FFB58250FFB58250FFB58250FF956C43D40502
      0107000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001717
      1746444444C5595959FF595959FF585858FD3131318D05050510000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      2800000080000000400000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFF81FFFFFFFFFFF0000000000000000
      FFC003FFFFFFFFFF0000000000000000FF0000FFFFFFFFFF0000000000000000
      FE00007FFFFFFFFF0000000000000000FC00003FFFFFFFFF0000000000000000
      F800001FFFFFFFFF0000000000000000F000000FFFFFFFFF0000000000000000
      F000000FFFFFF1FF0000000000000000E0000007FFFFE0FF0000000000000000
      E0042007FFFFC1FF0000000000000000E0042007FFF083FF0000000000000000
      E0042007FFC007FF0000000000000000C0042003FF821FFF0000000000000000
      C0042003FF8F0FFF0000000000000000C0042003FF0F8FFF0000000000000000
      E0042007FF1F8FFF0000000000000000E0042007FF1F8FFF0000000000000000
      E0042007FF8F8FFF0000000000000000E0000007FF870FFF0000000000000000
      F000000FFFC01FFF0000000000000000F000000FFFE03FFF0000000000000000
      F800001FFFFFFFFF0000000000000000FC00003FFFFFFFFF0000000000000000
      FE00007FFFFFFFFF0000000000000000FF0000FFFFFFFFFF0000000000000000
      FFC003FFFFFFFFFF0000000000000000FFF81FFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
    Left = 384
    Top = 192
  end
  object TimerEqu: TTimer
    Enabled = False
    Interval = 50
    OnTimer = TimerEquTimer
    Left = 380
    Top = 273
  end
  object TimerAnimate: TTimer
    Enabled = False
    Interval = 5
    OnTimer = TimerAnimateTimer
    Left = 468
    Top = 273
  end
end
