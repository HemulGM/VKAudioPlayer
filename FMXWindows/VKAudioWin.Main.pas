unit VKAudioWin.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.TabControl, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.ListBox,
  FMX.Objects, FMX.Ani, VK.API, VK.Components, FMX.Player, FMX.Trayicon.Win,
  HGM.Common.Settings, VK.Entity.Audio, System.ImageList, VK.Entity.Profile,
  FMX.ImgList, FMX.Effects, FMX.Filter.Effects, VKAudioWin.Classes,
  FMX.SVGIconImage, FMX.SVGIconImageList, VKAudioWin.View.ListItemAudio,
  VKAudioWin.View.ListItemPlaylist, VKAudioWin.View.ListItemUser,
  VKAudioWin.View.ListItemSheffle, FMX.ScrollBox, FMX.Memo, FMX.BassComponents,
  FMX.BASS.Classes, FMX.Memo.Types;

type
  TFormMain = class(TForm)
    LayoutHead: TLayout;
    LayoutSearch: TLayout;
    LayoutClient: TLayout;
    LayoutTabs: TLayout;
    TabControl: TTabControl;
    TabItemCurrent: TTabItem;
    TabItemMyMusic: TTabItem;
    TabItemPlaylists: TTabItem;
    TabItemRecomend: TTabItem;
    TabItemUpdates: TTabItem;
    TabItemSearch: TTabItem;
    PanelControls: TPanel;
    EditSearch: TEdit;
    SearchEditButton: TSearchEditButton;
    LayoutFooter: TLayout;
    LabelNowPlay: TLabel;
    LabelActionClearPlaylist: TLabel;
    ListBoxCurrent: TListBox;
    StyleBook1: TStyleBook;
    VertScrollBox: TVertScrollBox;
    ClearEditButtonSearch: TClearEditButton;
    SpeedButtonCurrent: TSpeedButton;
    SpeedButtonMusic: TSpeedButton;
    SpeedButtonPlaylists: TSpeedButton;
    SpeedButtonUpdates: TSpeedButton;
    SpeedButtonRecomends: TSpeedButton;
    LayoutRecomends: TLayout;
    Layout2: TLayout;
    ListBoxMusic: TListBox;
    ListBoxRecomendUser: TListBox;
    ListBoxItem7: TListBoxItem;
    Rectangle11: TRectangle;
    Rectangle12: TRectangle;
    Layout12: TLayout;
    Label21: TLabel;
    Label22: TLabel;
    ListBoxItem8: TListBoxItem;
    Layout14: TLayout;
    Rectangle13: TRectangle;
    Rectangle14: TRectangle;
    Layout15: TLayout;
    Label24: TLabel;
    Label25: TLabel;
    ListBoxItem9: TListBoxItem;
    Rectangle15: TRectangle;
    Layout16: TLayout;
    Label27: TLabel;
    Label28: TLabel;
    Line1: TLine;
    ListBoxItem10: TListBoxItem;
    Layout13: TLayout;
    Label23: TLabel;
    Path1: TPath;
    Layout19: TLayout;
    LayoutRecomendItems: TLayout;
    ListBoxItem12: TListBoxItem;
    Rectangle16: TRectangle;
    Layout20: TLayout;
    Label20: TLabel;
    Label26: TLabel;
    ListBoxItem13: TListBoxItem;
    Rectangle19: TRectangle;
    Layout21: TLayout;
    Label32: TLabel;
    Label33: TLabel;
    ListBoxItem14: TListBoxItem;
    Rectangle20: TRectangle;
    Layout22: TLayout;
    Label34: TLabel;
    Label35: TLabel;
    Layout23: TLayout;
    ButtonRecomendUserNext: TButton;
    RectangleSelectionTab: TRectangle;
    FloatAnimationSelectionTabPos: TFloatAnimation;
    FloatAnimationSelectionTabSize: TFloatAnimation;
    Line2: TLine;
    LayoutScroll: TLayout;
    SmallScrollBar1: TSmallScrollBar;
    TimerUpdateScroll: TTimer;
    VK: TVK;
    FMXPlayer: TFMXPlayer;
    ImageList: TImageList;
    TabItemFriend: TTabItem;
    ListBoxFriendMusic: TListBox;
    SpeedButtonNoTab: TSpeedButton;
    SpeedButtonPlay: TSpeedButton;
    Rectangle1: TRectangle;
    Path2: TPath;
    SpeedButton2: TSpeedButton;
    Rectangle2: TRectangle;
    Path3: TPath;
    SpeedButton3: TSpeedButton;
    Rectangle3: TRectangle;
    Path4: TPath;
    Layout1: TLayout;
    RectangleActiveCover: TRectangle;
    Layout3: TLayout;
    LayoutPosition: TLayout;
    Layout5: TLayout;
    LabelPlayTitle: TLabel;
    LabelPlayArtist: TLabel;
    TrackBarPosition: TTrackBar;
    Layout6: TLayout;
    LabelPlayTime: TLabel;
    Layout7: TLayout;
    TrackBarVolume: TTrackBar;
    Layout8: TLayout;
    SpeedButton4: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SVGIconImageList1: TSVGIconImageList;
    ListBoxCatalog: TListBox;
    ListBoxItem1: TListBoxItem;
    Layout9: TLayout;
    ListBox1: TListBox;
    ListBoxItem2: TListBoxItem;
    Rectangle4: TRectangle;
    Layout10: TLayout;
    Label6: TLabel;
    ListBoxItem3: TListBoxItem;
    Rectangle5: TRectangle;
    Layout11: TLayout;
    Label7: TLabel;
    ListBoxItem4: TListBoxItem;
    Rectangle6: TRectangle;
    Layout17: TLayout;
    Label8: TLabel;
    ListBoxItem5: TListBoxItem;
    Rectangle7: TRectangle;
    Layout18: TLayout;
    Label9: TLabel;
    ListBoxItem6: TListBoxItem;
    Rectangle8: TRectangle;
    Layout24: TLayout;
    Label10: TLabel;
    ListBoxItem11: TListBoxItem;
    Rectangle9: TRectangle;
    Layout25: TLayout;
    Label11: TLabel;
    ListBoxItem15: TListBoxItem;
    Layout26: TLayout;
    ListBox2: TListBox;
    ListBoxItem16: TListBoxItem;
    Rectangle10: TRectangle;
    Layout27: TLayout;
    Label12: TLabel;
    ListBoxItem17: TListBoxItem;
    Rectangle17: TRectangle;
    Layout28: TLayout;
    Label13: TLabel;
    ListBoxItem18: TListBoxItem;
    Rectangle18: TRectangle;
    Layout29: TLayout;
    Label14: TLabel;
    ListBoxItem19: TListBoxItem;
    Rectangle21: TRectangle;
    Layout30: TLayout;
    Label15: TLabel;
    ListBoxItem20: TListBoxItem;
    Rectangle22: TRectangle;
    Layout31: TLayout;
    Label16: TLabel;
    ListBoxItem21: TListBoxItem;
    Rectangle23: TRectangle;
    Layout32: TLayout;
    Label17: TLabel;
    ListBoxItem22: TListBoxItem;
    Layout33: TLayout;
    ListBox3: TListBox;
    ListBoxItem23: TListBoxItem;
    Rectangle24: TRectangle;
    Layout34: TLayout;
    Label18: TLabel;
    ListBoxItem24: TListBoxItem;
    Rectangle25: TRectangle;
    Layout35: TLayout;
    Label19: TLabel;
    ListBoxItem25: TListBoxItem;
    Rectangle26: TRectangle;
    Layout36: TLayout;
    Label29: TLabel;
    ListBoxItem26: TListBoxItem;
    Rectangle27: TRectangle;
    Layout37: TLayout;
    Label30: TLabel;
    ListBoxItem27: TListBoxItem;
    Rectangle28: TRectangle;
    Layout38: TLayout;
    Label31: TLabel;
    ListBoxItem28: TListBoxItem;
    Rectangle29: TRectangle;
    Layout39: TLayout;
    Label36: TLabel;
    LayoutViewRight: TLayout;
    Rectangle30: TRectangle;
    Glyph1: TGlyph;
    LayoutViewLeft: TLayout;
    Rectangle31: TRectangle;
    Glyph2: TGlyph;
    ListBoxPlaylists: TListBox;
    ListBoxItem34: TListBoxItem;
    Rectangle32: TRectangle;
    Layout40: TLayout;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    ListBoxItem29: TListBoxItem;
    Rectangle33: TRectangle;
    Layout41: TLayout;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    ListBoxItem30: TListBoxItem;
    Rectangle34: TRectangle;
    Layout42: TLayout;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    ListBoxItem31: TListBoxItem;
    Rectangle35: TRectangle;
    Layout43: TLayout;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    ListBoxItem32: TListBoxItem;
    Rectangle36: TRectangle;
    Layout44: TLayout;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    ListBoxItem33: TListBoxItem;
    Rectangle37: TRectangle;
    Layout45: TLayout;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    ListBoxItem35: TListBoxItem;
    Rectangle38: TRectangle;
    Layout46: TLayout;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    ListBoxItem36: TListBoxItem;
    Rectangle39: TRectangle;
    Layout47: TLayout;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    ListBoxItem37: TListBoxItem;
    Rectangle40: TRectangle;
    Layout48: TLayout;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    ListBoxItem38: TListBoxItem;
    Rectangle41: TRectangle;
    Layout49: TLayout;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    ListBoxItem39: TListBoxItem;
    Rectangle42: TRectangle;
    Layout50: TLayout;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    ListBoxItem40: TListBoxItem;
    Rectangle43: TRectangle;
    Layout51: TLayout;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    RectanglePlaylistCover: TRectangle;
    LayoutPlaylistControls: TLayout;
    Label73: TLabel;
    Label74: TLabel;
    SpeedButton5: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    Glyph3: TGlyph;
    Glyph4: TGlyph;
    LayoutPlalistsCount: TLayout;
    LabelPlaylistsCount: TLabel;
    TabItemPlaylist: TTabItem;
    ListBoxPlaylist: TListBox;
    LayoutPlaylistInfo: TLayout;
    ImagePlaylistCover: TImage;
    Layout53: TLayout;
    LabelPlaylistTitle: TLabel;
    LabelPlaylistDetail: TLabel;
    LabelPlaylistInfo: TLabel;
    Layout54: TLayout;
    SpeedButtonPlaylistAdd: TSpeedButton;
    SpeedButtonPlaylistShare: TSpeedButton;
    SpeedButtonPlaylistMore: TSpeedButton;
    ButtonPlaylistClose: TButton;
    Memo1: TMemo;
    RectangleBuffer: TRectangle;
    GlyphPlayState: TGlyph;
    Line3: TLine;
    StyleBook2: TStyleBook;
    procedure SpeedButtonCurrentClick(Sender: TObject);
    procedure SpeedButtonMusicClick(Sender: TObject);
    procedure SpeedButtonPlaylistsClick(Sender: TObject);
    procedure SpeedButtonRecomendsClick(Sender: TObject);
    procedure SpeedButtonUpdatesClick(Sender: TObject);
    procedure VertScrollBoxViewportPositionChange(Sender: TObject; const OldViewportPosition, NewViewportPosition: TPointF; const ContentSizeChanged: Boolean);
    procedure FloatAnimationSelectionTabPosProcess(Sender: TObject);
    procedure SmallScrollBar1Change(Sender: TObject);
    procedure VertScrollBoxMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean);
    procedure TimerUpdateScrollTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditSearchChangeTracking(Sender: TObject);
    procedure ListBoxMusicItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure ButtonRecomendUserNextClick(Sender: TObject);
    procedure LabelActionClearPlaylistMouseEnter(Sender: TObject);
    procedure LabelActionClearPlaylistMouseLeave(Sender: TObject);
    procedure VKAuth(Sender: TObject; Url: string; var Token: string; var TokenExpiry: Int64; var ChangePasswordHash: string);
    procedure FormDestroy(Sender: TObject);
    procedure VKLogin(Sender: TObject);
    procedure ListBoxRecomendUserItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
    procedure ListBoxFriendMusicItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
    procedure FMXPlayerChangeState(Sender: TObject);
    procedure ListBoxCurrentItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
    procedure VKError(Sender: TObject; E: Exception; Code: Integer; Text: string);
    procedure Rectangle30Click(Sender: TObject);
    procedure Rectangle31Click(Sender: TObject);
    procedure ListBox1ViewportPositionChange(Sender: TObject; const OldViewportPosition, NewViewportPosition: TPointF; const ContentSizeChanged: Boolean);
    procedure Rectangle32MouseEnter(Sender: TObject);
    procedure Rectangle32MouseLeave(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ButtonPlaylistCloseClick(Sender: TObject);
    procedure SpeedButtonPlayClick(Sender: TObject);
    procedure ListBoxPlaylistItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
    procedure TrackBarVolumeChange(Sender: TObject);
    procedure SearchEditButtonClick(Sender: TObject);
    procedure VKLog(Sender: TObject; const Value: string);
    procedure FloatAnimation1Process(Sender: TObject);
    procedure FMXPlayerEnd(Sender: TObject);
    procedure FMXPlayerChangePosition(Sender: TObject; const Time: Int64);
    procedure LabelPlayTimeClick(Sender: TObject);
    procedure TrackBarPositionChange(Sender: TObject);
    procedure LabelActionClearPlaylistClick(Sender: TObject);
  private
    FCurrentPlaylist: TCurrentPlaylist;
    FMusicOffset: Integer;
    FPlaylistsOffset: Integer;
    FFriendMusicOffset: Integer;
    FCurrentFriend: TFriendInfo;
    FRUsersOffset: Integer;
    FScrollImpulse: Single;
    FActiveAudioInfo: TAudioInfo;
    FSettings: TSettingsIni;
    FNeedCatalog: Boolean;
    FNeedPlaylists: Boolean;
    FPlaylistAlbum: TBitmap;
    FAudioCover: TBitmap;
    FAudioCoverUrl: string;
    FPlaylistInfo: TPlaylistInfo;
    FFailCount: Integer;
    FOpenning: Boolean;
    procedure SelectTab(Tab: TTabItem; SelectionButton: TSpeedButton);
    procedure UpdateSizeTab;
    procedure FDoScroll(Delta: Single);
    procedure LoadMusic(Reset: Boolean = False);
    procedure LoadFriend(Info: TFriendInfo; Reset: Boolean = False);
    procedure PlayAudio(Info: TAudioInfo);
    procedure LoadRecomendUser(Reset: Boolean = False);
    procedure CopyAudioList(Src, Dest: TListBox);
    procedure SelectActiveAudio;
    procedure LoadCatalog;
    procedure LoadPlaylists(Reset: Boolean = False);
    procedure FOnOpenPlaylist(Sender: TObject; const PlaylistInfo: TPlaylistInfo);
    procedure FOnPlayPlaylist(Sender: TObject; const PlaylistInfo: TPlaylistInfo);
    procedure LoadPlaylist(const PlaylistInfo: TPlaylistInfo; const AutoStart: Boolean);
    procedure FOnPlaylistAlbumChange(Sender: TObject);
    procedure FOnAudioCoverChange(Sender: TObject);
    procedure FOnCurrentPlaylistChange(const Sender: TCurrentPlaylist);
    function SelectFirstAudio(const ListBox: TListBox; const StartPlay: Boolean): Boolean;
    procedure SetAudioInfo(Info: TAudioInfo);
    function GetFirstAudio(const ListBox: TListBox): TListBoxItemAudio;
    procedure ClearAudioInfo;
    procedure SetBufferingPrecent(const Value: Single);
    procedure FPlay;
  public
    procedure PlayNext(HandlePlay: Boolean);
    procedure PlayPrev(HandlePlay: Boolean);
  end;

var
  FormMain: TFormMain;

implementation

uses
  System.Math, VK.Errors, VK.Types, System.Threading, HGM.FMX.Image, VK.Clients,
  VK.Entity.Playlist, VK.Entity.Audio.Catalog, VK.FMX.OAuth2, VK.Audio,
  VK.Friends, VK.Entity.Catalog.Section, REST.Types;

{$R *.fmx}

procedure TFormMain.ButtonPlaylistCloseClick(Sender: TObject);
begin
  SelectTab(TabItemPlaylists, nil);
end;

procedure TFormMain.ButtonRecomendUserNextClick(Sender: TObject);
begin
  LoadRecomendUser();
end;

procedure TFormMain.CopyAudioList(Src, Dest: TListBox);
var
  i: Integer;
begin
  Dest.Clear;
  for i := 0 to Pred(Src.Count) do
    if Src.ListItems[i] is TListBoxItemAudio then
      Dest.AddObject(TListBoxItemAudio.Create(Dest, Src.ListItems[i] as TListBoxItemAudio));
end;

procedure TFormMain.EditSearchChangeTracking(Sender: TObject);
begin
  ClearEditButtonSearch.Visible := not EditSearch.Text.IsEmpty;
  SearchEditButton.Align := TAlignLayout.MostRight;
end;

procedure TFormMain.FloatAnimation1Process(Sender: TObject);
begin
  //
end;

procedure TFormMain.FloatAnimationSelectionTabPosProcess(Sender: TObject);
begin
  LayoutTabs.InvalidateRect(LayoutTabs.ClipRect);
end;

procedure TFormMain.SearchEditButtonClick(Sender: TObject);
var
  Items: TVkAudios;
  Params: TVkParamsByArtist;
  S: TVkSectionData;
begin
  Memo1.Lines.Clear;

  {
  VK.CallMethod('catalog.getAudioSearch', [['query', 'Трава']],
    procedure(Response: TResponse)
    begin
      Memo1.Lines.Add(Response.JSON);
    end);

  Exit;    }
  if VK.Catalog.GetSection(S,
    'PUldVA8NR0RzSVNUagdSRGpJUFQPBUdEfklTQw0BXlVyWlBaFwNJXGQ3HEYBBlk6M1tdQgVoHlZyWFkqQARfVXQ3HEYBB1tEOw') then
  begin
    Memo1.Lines.Add(S.Section.Title);
    S.Free;
  end;
  Exit;
  //Audio.GetCatalog(
  //Params.Add('q', 'noize');
  Params.ArtistId('1204512717686522332');
  if VK.Audio.GetAudiosByArtist(Items, Params) then
  begin
    Memo1.Lines.Add(Items.Count.ToString);
    Items.Free;
  end;
end;

procedure TFormMain.SelectActiveAudio;

  procedure SelectActiveAudioFor(List: TListBox);
  var
    i: Integer;
  begin
    List.ItemIndex := -1;
    for i := 0 to Pred(List.Count) do
    begin
      if List.ListItems[i] is TListBoxItemAudio then
      begin
        List.ListItems[i].IsSelected := (List.ListItems[i] as TListBoxItemAudio).AudioInfo.Id = FActiveAudioInfo.Id;
      end
      else if List.ListItems[i] is TListBoxItemPlaylist then
      begin
        if (List.ListItems[i] as TListBoxItemPlaylist).PlaylistInfo.Id = FCurrentPlaylist.Id then
        begin
          (List.ListItems[i] as TListBoxItemPlaylist).SetActive(FMXPlayer.IsPlay or FMXPlayer.IsOpening);
        end
        else
          (List.ListItems[i] as TListBoxItemPlaylist).SetActive(False);
      end;
    end;
  end;

begin
  SelectActiveAudioFor(ListBoxCurrent);
  SelectActiveAudioFor(ListBoxMusic);
  SelectActiveAudioFor(ListBoxFriendMusic);
  SelectActiveAudioFor(ListBoxPlaylist);
  SelectActiveAudioFor(ListBoxPlaylists);
end;

procedure TFormMain.SetBufferingPrecent(const Value: Single);
begin
  RectangleBuffer.Margins.Right := LayoutPosition.Padding.Right + (TrackBarPosition.Width - (TrackBarPosition.Width *
    Value / 100)) + 2;
end;

procedure TFormMain.FMXPlayerChangePosition(Sender: TObject; const Time: Int64);
begin
  if LabelPlayTime.Tag = 0 then
    LabelPlayTime.Text := Player.PositionTime
  else
    LabelPlayTime.Text := Player.PositionTimeLeft;

  TrackBarPosition.Tag := 0;
  TrackBarPosition.Value := Player.PositionPercent;
  TrackBarPosition.Tag := 1;

  SetBufferingPrecent(Player.BufferringPercent);
end;

procedure TFormMain.FMXPlayerChangeState(Sender: TObject);
begin
  SelectActiveAudio;
  if FMXPlayer.IsPause then
    GlyphPlayState.ImageIndex := 18
  else
    GlyphPlayState.ImageIndex := 17;
end;

procedure TFormMain.FMXPlayerEnd(Sender: TObject);
begin
  //
end;

procedure TFormMain.FOnOpenPlaylist(Sender: TObject; const PlaylistInfo: TPlaylistInfo);
begin
  if FPlaylistInfo.Id <> PlaylistInfo.Id then
    LoadPlaylist(PlaylistInfo, False);
  SelectTab(TabItemPlaylist, nil);
end;

procedure TFormMain.FOnPlaylistAlbumChange(Sender: TObject);
begin
  ImagePlaylistCover.Bitmap := FPlaylistAlbum;
end;

procedure TFormMain.FOnPlayPlaylist(Sender: TObject; const PlaylistInfo: TPlaylistInfo);
begin
  if not FCurrentPlaylist.Compare(lkPlaylist, PlaylistInfo.Id) then
  begin
    LoadPlaylist(PlaylistInfo, True);
  end
  else
  begin
    if ListBoxCurrent.Count > 0 then
      PlayAudio(TListBoxItemAudio(ListBoxCurrent.ListItems[0]).AudioInfo);
  end;
  SelectActiveAudio;
end;

procedure TFormMain.FOnAudioCoverChange(Sender: TObject);
begin
  RectangleActiveCover.Fill.Bitmap.Bitmap := FAudioCover;
end;

procedure TFormMain.FOnCurrentPlaylistChange(const Sender: TCurrentPlaylist);
begin
  LayoutFooter.Visible := Sender.Kind <> lkNone;
  case Sender.Kind of
    lkNone:
      LabelNowPlay.Text := '';
    lkMusic:
      LabelNowPlay.Text := 'Сейчас играет - Моя музыка';
    lkFriend:
      LabelNowPlay.Text := 'Сейчас играет - Аудиозаписи ' + Sender.FriendInfo.FirstName;
    lkPlaylist:
      LabelNowPlay.Text := 'Сейчас играет - ' + Sender.PlaylistInfo.Title;
    lkCustom:
      LabelNowPlay.Text := '';
  end;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  FCurrentPlaylist := TCurrentPlaylist.Create;
  FCurrentPlaylist.OnChange := FOnCurrentPlaylistChange;
  FPlaylistAlbum := TBitmap.Create;
  FPlaylistAlbum.OnChange := FOnPlaylistAlbumChange;
  FAudioCover := TBitmap.Create;
  FAudioCover.OnChange := FOnAudioCoverChange;
  FAudioCoverUrl := '';
  FNeedCatalog := True;
  FFailCount := 0;
  FOpenning := False;
  FNeedPlaylists := True;
  FSettings := TSettingsIni.CreateDefault('VKAudioPlayer');
  FScrollImpulse := 0;
  ClearAudioInfo;
  LayoutScroll.BringToFront;
  VK.Token := FSettings.GetStr('Auth', 'Token');
  VK.Application := TVkApplicationData.Marusia;
  try
    if not VK.Login then
    begin
      VK.Token := '';
      VK.Login;
    end;
  except
    VKError(nil, nil, VK_ERROR_INVALID_TOKEN, '');
  end;
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  FPlaylistAlbum.OnChange := nil;
  FPlaylistAlbum.Free;
  FAudioCover.OnChange := nil;
  FAudioCover.Free;
  FSettings.Free;
  FCurrentPlaylist.Free;
end;

procedure TFormMain.FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkDown then
  begin
    FDoScroll(-20);
    Key := 0;
  end
  else if Key = vkUp then
  begin
    FDoScroll(20);
    Key := 0;
  end;
end;

function TFormMain.GetFirstAudio(const ListBox: TListBox): TListBoxItemAudio;
var
  i: Integer;
begin
  Result := nil;
  if ListBox.Count > 0 then
  begin
    for i := 0 to Pred(ListBox.Count) do
      if ListBox.ListItems[i] is TListBoxItemAudio then
        Exit(ListBox.ListItems[i] as TListBoxItemAudio);
  end;
end;

procedure TFormMain.ClearAudioInfo;
begin
  LabelPlayTitle.Text := 'Название трека';
  LabelPlayArtist.Text := 'Исполнитель';
  LabelPlayTime.Text := '0:00';
  GlyphPlayState.ImageIndex := 18;
  RectangleActiveCover.Fill.Bitmap.Bitmap.LoadFromResource('cover');
  TrackBarPosition.Value := 0;
  SetBufferingPrecent(0);
end;

function TFormMain.SelectFirstAudio(const ListBox: TListBox; const StartPlay: Boolean): Boolean;
var
  Item: TListBoxItemAudio;
begin
  Result := False;
  Item := GetFirstAudio(ListBox);
  if Assigned(Item) then
  begin
    Result := True;
    if Assigned(ListBox.OnItemClick) and StartPlay then
      ListBox.OnItemClick(ListBox, Item)
    else
      SetAudioInfo(Item.AudioInfo);
  end
  else
    ClearAudioInfo;
end;

procedure TFormMain.LabelActionClearPlaylistClick(Sender: TObject);
begin
  Player.Stop;
  ListBoxCurrent.Clear;
  UpdateSizeTab;
  SelectFirstAudio(ListBoxMusic, False);
end;

procedure TFormMain.LabelActionClearPlaylistMouseEnter(Sender: TObject);
var
  LabelItem: TLabel absolute Sender;
begin
  LabelItem.StyledSettings := LabelItem.StyledSettings - [TStyledSetting.Style];
  LabelItem.Font.Style := [TFontStyle.fsUnderline];
end;

procedure TFormMain.LabelActionClearPlaylistMouseLeave(Sender: TObject);
var
  LabelItem: TLabel absolute Sender;
begin
  LabelItem.Font.Style := [];
end;

procedure TFormMain.LabelPlayTimeClick(Sender: TObject);
begin
  if LabelPlayTime.Tag = 0 then
    LabelPlayTime.Tag := 1
  else
    LabelPlayTime.Tag := 0;
end;

procedure TFormMain.SetAudioInfo(Info: TAudioInfo);
begin
  FActiveAudioInfo := Info;
  LabelPlayTitle.Text := Info.Title;
  LabelPlayArtist.Text := Info.Artist;
  LabelPlayTime.Text := '0:00';
  TrackBarPosition.Value := 0;
  SetBufferingPrecent(0);
  if FAudioCoverUrl <> Info.CoverUrl then
  begin
    FAudioCoverUrl := Info.CoverUrl;
    RectangleActiveCover.Fill.Bitmap.Bitmap.LoadFromResource('cover');
    FAudioCover.LoadFromUrlAsync(Info.CoverUrl);
  end;
end;

procedure TFormMain.FPlay;
begin
  if FOpenning then
    Exit;
  FOpenning := True;
  TTask.Run(
    procedure
    var
      Item: TVkAudio;
    begin
      try
        if VK.Audio.GetById(Item, FActiveAudioInfo.OwnerId, FActiveAudioInfo.Id, FActiveAudioInfo.AccessKey) then
        try
          if FMXPlayer.StreamURL = Item.Url then
          begin
            FMXPlayer.SwitchPlay;
          end
          else
          begin
            FMXPlayer.StreamURL := Item.Url;
            FMXPlayer.Play;
          end;
        finally
          Item.Free;
        end;
      finally
        FOpenning := False;
      end;
    end);
end;

procedure TFormMain.PlayAudio(Info: TAudioInfo);
begin
  if (FMXPlayer.IsPause or FMXPlayer.IsPlay) and (FActiveAudioInfo.Id = Info.Id) then
  begin
    FMXPlayer.SwitchPlay;
    Exit;
  end;

  SetAudioInfo(Info);
  FPlay;
end;

procedure TFormMain.PlayNext(HandlePlay: Boolean);
{var
  Nxt: Integer; }
begin
  if not HandlePlay then
  begin
    if FFailCount > 5 then
    begin
      FFailCount := 0;
      Exit;
    end;
  end;
  if FOpenning then
    Exit;      {
  Nxt := FindNext(FPlayingId, HandlePlay);
  if FCurrentList.IndexIn(Nxt) then
    if not Play(Nxt) then
      PlayNext(HandlePlay);}
end;

procedure TFormMain.PlayPrev(HandlePlay: Boolean);
begin

end;

procedure TFormMain.Rectangle30Click(Sender: TObject);
begin
  ListBox1.ViewportPosition := TPointF.Create(ListBox1.ViewportPosition.X + 20, 0);
end;

procedure TFormMain.Rectangle31Click(Sender: TObject);
begin
  ListBox1.ViewportPosition := TPointF.Create(ListBox1.ViewportPosition.X - 20, 0);
end;

procedure TFormMain.Rectangle32MouseEnter(Sender: TObject);
begin
  RectanglePlaylistCover.Visible := True;
end;

procedure TFormMain.Rectangle32MouseLeave(Sender: TObject);
begin
  if not LayoutPlaylistControls.AbsoluteRect.Contains(FormMain.ScreenToClient(Screen.MousePos)) then
  begin
    RectanglePlaylistCover.Visible := False;
  end;
end;

procedure TFormMain.ListBox1ViewportPositionChange(Sender: TObject; const OldViewportPosition, NewViewportPosition: TPointF; const ContentSizeChanged: Boolean);
begin
  LayoutViewLeft.Visible := NewViewportPosition.X > 0;
  LayoutViewRight.Visible := ListBox1.Content.ScrollBox.ContentBounds.Width > NewViewportPosition.X + ListBox1.Width;
end;

procedure TFormMain.ListBoxCurrentItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
begin
  PlayAudio(TListBoxItemAudio(Item).AudioInfo);
end;

procedure TFormMain.ListBoxFriendMusicItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
begin
  PlayAudio(TListBoxItemAudio(Item).AudioInfo);
  if not FCurrentPlaylist.Compare(lkFriend, FCurrentFriend.Id) then
  begin
    CopyAudioList(ListBoxFriendMusic, ListBoxCurrent);
    FCurrentPlaylist.Friend(FCurrentFriend);
  end;
end;

procedure TFormMain.ListBoxMusicItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
begin
  PlayAudio(TListBoxItemAudio(Item).AudioInfo);
  if not FCurrentPlaylist.Compare(lkMusic) then
  begin
    CopyAudioList(ListBoxMusic, ListBoxCurrent);
    FCurrentPlaylist.Music;
  end;
end;

procedure TFormMain.ListBoxPlaylistItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
begin
  PlayAudio(TListBoxItemAudio(Item).AudioInfo);
  if not FCurrentPlaylist.Compare(lkPlaylist, FPlaylistInfo.Id) then
  begin
    CopyAudioList(ListBoxPlaylist, ListBoxCurrent);
    FCurrentPlaylist.Playlist(FPlaylistInfo);
  end;
end;

procedure TFormMain.ListBoxRecomendUserItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
begin
  if FCurrentFriend.Id <> TListBoxItemUser(Item).Id then
  begin
    LoadFriend(TListBoxItemUser(Item).UserInfo, True);
  end;
  SelectTab(TabItemFriend, nil);
  EditSearch.Text := TListBoxItemUser(Item).Id.ToString;
end;

procedure TFormMain.SelectTab(Tab: TTabItem; SelectionButton: TSpeedButton);
begin
  TabControl.ActiveTab := Tab;

  FloatAnimationSelectionTabPos.Enabled := False;
  FloatAnimationSelectionTabSize.Enabled := False;
  if SelectionButton <> nil then
  begin
    RectangleSelectionTab.Visible := True;
    FloatAnimationSelectionTabPos.StopValue := SelectionButton.Position.X;
    FloatAnimationSelectionTabSize.StopValue := SelectionButton.Width;
    FloatAnimationSelectionTabPos.Enabled := True;
    FloatAnimationSelectionTabSize.Enabled := True;
  end
  else
  begin
    RectangleSelectionTab.Visible := False;
    SpeedButtonNoTab.IsPressed := True;
  end;
  UpdateSizeTab;
end;

procedure TFormMain.SpeedButton11Click(Sender: TObject);
begin
  if SpeedButton11.ImageIndex = 9 then
    SpeedButton11.ImageIndex := 14
  else
    SpeedButton11.ImageIndex := 9;
end;

procedure TFormMain.SpeedButton5Click(Sender: TObject);
begin
  if SpeedButton5.ImageIndex = 8 then
    SpeedButton5.ImageIndex := 13
  else
    SpeedButton5.ImageIndex := 8;
end;

procedure TFormMain.SpeedButtonCurrentClick(Sender: TObject);
begin
  SelectTab(TabItemCurrent, SpeedButtonCurrent);
end;

procedure TFormMain.SpeedButtonMusicClick(Sender: TObject);
begin
  SelectTab(TabItemMyMusic, SpeedButtonMusic);
end;

procedure TFormMain.SpeedButtonPlayClick(Sender: TObject);
begin
  if FMXPlayer.IsPlay then
    FMXPlayer.Pause
  else if FMXPlayer.IsPause then
    FMXPlayer.Resume
  else
    SelectFirstAudio(ListBoxMusic, True);
end;

procedure TFormMain.SpeedButtonPlaylistsClick(Sender: TObject);
begin
  if FNeedPlaylists then
    LoadPlaylists(True);
  SelectTab(TabItemPlaylists, SpeedButtonPlaylists);
end;

procedure TFormMain.LoadCatalog;
begin
 { FNeedCatalog := False;
  ListBoxCatalog.Clear;
  ListBoxCatalog.BeginUpdate;
  TTask.Run(
    procedure
    var
      Catalog: TVkAudioCatalog;
    begin
      try
        if VK.Audio.GetCatalog(Catalog) then
        begin
          try

          finally
            Catalog.Free;
          end;
        end;
      finally
        ListBoxCatalog.EndUpdate;
        UpdateSizeTab;
      end;
    end);  }
end;

procedure TFormMain.LoadPlaylists;
begin
  FNeedPlaylists := False;
  LabelPlaylistsCount.Text := 'Загрузка...';
  if Reset then
  begin
    ListBoxPlaylists.Clear;
    FPlaylistsOffset := 0;
  end;
  ListBoxPlaylists.BeginUpdate;
  TTask.Run(
    procedure
    var
      Playlists: TVkPlaylists;
      Playlist: TVkAudioPlaylist;
      Params: TVkParamsPlaylist;
      Item: TListBoxItemPlaylist;
    begin
      try
        Params.OwnerId(Vk.UserId);
        Params.Offset(FPlaylistsOffset);
        Params.Count(50);
        if VK.Audio.GetPlaylists(Playlists, Params) then
        begin
          try
            for Playlist in Playlists.Items do
            begin
              TThread.Synchronize(nil,
                procedure
                begin
                  Playlist.IsFollowing := True;
                  Item := TListBoxItemPlaylist.Create(ListBoxPlaylists, Playlist);
                  Item.OnOpen := FOnOpenPlaylist;
                  Item.OnPlay := FOnPlayPlaylist;
                  Item.SVGList := SVGIconImageList1;
                  Item.DefaultImage := ImageList.Bitmap(TSizeF.Create(143, 143), 0);
                  ListBoxPlaylists.AddObject(Item);
                end);
            end;
            TThread.Synchronize(nil,
              procedure
              begin
                LabelPlaylistsCount.Text := Playlists.Count.ToString + ' плейлистов';
              end);
          finally
            Playlists.Free;
          end;
          Inc(FPlaylistsOffset, 50);
        end;
      finally
        TThread.ForceQueue(nil,
          procedure
          begin
            ListBoxPlaylists.EndUpdate;
            UpdateSizeTab;
          end);
      end;
    end);
end;

procedure TFormMain.SpeedButtonRecomendsClick(Sender: TObject);
begin
  if FNeedCatalog then
    LoadCatalog;
  SelectTab(TabItemRecomend, SpeedButtonRecomends);
end;

procedure TFormMain.SpeedButtonUpdatesClick(Sender: TObject);
begin
  SelectTab(TabItemUpdates, SpeedButtonUpdates);
end;

procedure TFormMain.TimerUpdateScrollTimer(Sender: TObject);
var
  Old: TPointF;
begin
  if Abs(FScrollImpulse) > 2 then
  begin
    if FScrollImpulse < 0 then
      FScrollImpulse := FScrollImpulse + 1
    else
      FScrollImpulse := FScrollImpulse - 1;

    Old := VertScrollBox.ViewportPosition;
    VertScrollBox.ViewportPosition := TPointF.Create(0, VertScrollBox.ViewportPosition.Y + FScrollImpulse);
    if VertScrollBox.ViewportPosition = Old then
    begin
      FScrollImpulse := 0;
      TimerUpdateScroll.Enabled := False;
    end;
  end
  else
  begin
    FScrollImpulse := 0;
    TimerUpdateScroll.Enabled := False;
  end;
end;

procedure TFormMain.TrackBarPositionChange(Sender: TObject);
begin
  if TrackBarPosition.Tag = 0 then
    Exit;
  Player.PositionPercent := TrackBarPosition.Value;
end;

procedure TFormMain.TrackBarVolumeChange(Sender: TObject);
begin
  FMXPlayer.VolumeChannel := TrackBarVolume.Value;
end;

procedure TFormMain.UpdateSizeTab;
begin
  LayoutClient.Height := 0;
  if TabControl.ActiveTab = TabItemCurrent then
  begin
    LayoutClient.Height := LayoutTabs.Height + 16 + ListBoxCurrent.Items.Count * (48 + 6) + 2;
  end
  else if TabControl.ActiveTab = TabItemFriend then
  begin
    LayoutClient.Height := LayoutTabs.Height + 16 + ListBoxFriendMusic.Items.Count * (48 + 6) + 2;
  end
  else if TabControl.ActiveTab = TabItemPlaylist then
  begin
    LayoutClient.Height := LayoutTabs.Height + 16 + LayoutPlaylistInfo.Height + 20 + ListBoxPlaylist.Items.Count * (48 + 6) + 2;
  end
  else if TabControl.ActiveTab = TabItemPlaylists then
  begin
    LayoutClient.Height := LayoutTabs.Height + 16 + LayoutPlalistsCount.Height + (4 + 20) + Ceil(ListBoxPlaylists.Items.Count
      / ListBoxPlaylists.Columns) * (210 + 6) + 2;
  end
  else if TabControl.ActiveTab = TabItemMyMusic then
  begin
    LayoutClient.Height := Max(LayoutRecomendItems.Height, LayoutTabs.Height + 16 + ListBoxMusic.Items.Count * (48 + 6) + 2);
  end
  else if TabControl.ActiveTab = TabItemRecomend then
  begin
    LayoutClient.Height := LayoutTabs.Height + 16 + ListBoxCatalog.Items.Count * (150 + 6) + 2;
  end;
  LayoutClient.Height := Max(VertScrollBox.Height - LayoutSearch.Height - 10, LayoutClient.Height);
end;

procedure TFormMain.SmallScrollBar1Change(Sender: TObject);
begin
  if SmallScrollBar1.Tag = 2 then
    Exit;
  VertScrollBox.ViewportPosition := TPointF.Create(0, VertScrollBox.Content.ScrollBox.ContentBounds.Height / 100 * SmallScrollBar1.Value);
end;

procedure TFormMain.FDoScroll(Delta: Single);
begin
  if not TimerUpdateScroll.Enabled then
    TimerUpdateScroll.Enabled := True;
  FScrollImpulse := FScrollImpulse - Delta;
  FScrollImpulse := Max(-30, Min(FScrollImpulse, 30));
end;

procedure TFormMain.VertScrollBoxMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean);
begin
  FDoScroll(WheelDelta / 9);
  Handled := True;
end;

procedure TFormMain.VertScrollBoxViewportPositionChange(Sender: TObject; const OldViewportPosition, NewViewportPosition: TPointF; const ContentSizeChanged: Boolean);
begin
  if VertScrollBox.Content.ScrollBox.ContentBounds.Height - VertScrollBox.Content.Height >= 0 then
  begin
    SmallScrollBar1.Tag := 2;
    SmallScrollBar1.Value := 100 / VertScrollBox.Content.ScrollBox.ContentBounds.Height * NewViewportPosition.Y;
    SmallScrollBar1.Tag := 0;
    SmallScrollBar1.Visible := True;
  end
  else
    SmallScrollBar1.Visible := False;

  if NewViewportPosition.Y > (56 + 45 + 16) then
    LayoutRecomendItems.Margins.Top := NewViewportPosition.Y - (56 + 45 + 16)
  else
    LayoutRecomendItems.Margins.Top := 0;
end;

procedure TFormMain.LoadFriend;
begin
  FCurrentFriend := Info;
  if Reset then
  begin
    FFriendMusicOffset := 0;
    ListBoxFriendMusic.Clear;
    ListBoxFriendMusic.AddObject(TListBoxItemShuffle.Create(ListBoxCurrent));
  end;
  ListBoxFriendMusic.BeginUpdate;
  TTask.Run(
    procedure
    var
      Audios: TVkAudios;
      Audio: TVkAudio;
      Params: TVkParamsAudioGet;
    begin
      try
        Params.Offset(FFriendMusicOffset);
        Params.Count(50);
        Params.OwnerId(FCurrentFriend.Id);
        if VK.Audio.Get(Audios, Params) then
        begin
          try
            for Audio in Audios.Items do
            begin
              TThread.Synchronize(nil,
                procedure
                begin
                  ListBoxFriendMusic.AddObject(TListBoxItemAudio.Create(ListBoxFriendMusic, Audio));
                end);
            end;
            Inc(FFriendMusicOffset, 50);
          finally
            Audios.Free;
          end;
        end;
      finally
        TThread.ForceQueue(nil,
          procedure
          begin
            ListBoxFriendMusic.EndUpdate;
            UpdateSizeTab;
          end);
      end;
    end);
end;

procedure TFormMain.LoadPlaylist(const PlaylistInfo: TPlaylistInfo; const AutoStart: Boolean);
begin
  FPlaylistInfo := PlaylistInfo;
  FPlaylistAlbum.LoadFromUrlAsync(PlaylistInfo.CoverUrl);
  LabelPlaylistTitle.Text := PlaylistInfo.Title;
  LabelPlaylistDetail.Text := PlaylistInfo.Detail;
  LabelPlaylistInfo.Text := PlaylistInfo.Info;

  ListBoxPlaylist.Clear;
  ListBoxPlaylist.BeginUpdate;
  TTask.Run(
    procedure
    var
      Audios: TVkAudios;
      Audio: TVkAudio;
      Params: TVkParamsAudioGet;
    begin
      try
        Params.PlaylistId(PlaylistInfo.Id);
        Params.OwnerId(PlaylistInfo.OwnerId);
        Params.AccessKey(PlaylistInfo.AccessKey);
        Params.Count(200);
        if VK.Audio.Get(Audios, Params) then
        begin
          try
            for Audio in Audios.Items do
            begin
              TThread.Synchronize(nil,
                procedure
                begin
                  ListBoxPlaylist.AddObject(TListBoxItemAudio.Create(ListBoxPlaylist, Audio));
                end);
            end;
          finally
            Audios.Free;
          end;
        end;
      finally
        TThread.ForceQueue(nil,
          procedure
          begin
            ListBoxPlaylist.EndUpdate;
            if TabControl.ActiveTab = TabItemPlaylist then
              UpdateSizeTab;
            if AutoStart then
            begin
              CopyAudioList(ListBoxPlaylist, ListBoxCurrent);
              FCurrentPlaylist.Playlist(PlaylistInfo);
              FOnPlayPlaylist(Self, FPlaylistInfo);
            end;
            SelectActiveAudio;
          end);
      end;
    end);
end;

procedure TFormMain.LoadMusic;
begin
  if Reset then
  begin
    FMusicOffset := 0;
    ListBoxMusic.Clear;
    ListBoxMusic.AddObject(TListBoxItemShuffle.Create(ListBoxCurrent));
  end;
  ListBoxMusic.BeginUpdate;
  TTask.Run(
    procedure
    var
      Audios: TVkAudios;
      Audio: TVkAudio;
      Params: TVkParamsAudioGet;
    begin
      try
        Params.Offset(FMusicOffset);
        Params.Count(50);
        if VK.Audio.Get(Audios, Params) then
        begin
          try
            for Audio in Audios.Items do
            begin
              TThread.Synchronize(nil,
                procedure
                begin
                  ListBoxMusic.AddObject(TListBoxItemAudio.Create(ListBoxMusic, Audio));
                end);
            end;
            Inc(FMusicOffset, 50);
          finally
            Audios.Free;
          end;
        end;
      finally
        TThread.ForceQueue(nil,
          procedure
          begin
            ListBoxMusic.EndUpdate;
            UpdateSizeTab;
            SelectFirstAudio(ListBoxMusic, False);
          end);
      end;
    end);
end;

procedure TFormMain.LoadRecomendUser;
begin
  if Reset then
  begin
    FRUsersOffset := 0;
  end;
  ListBoxRecomendUser.Clear;
  ListBoxRecomendUser.BeginUpdate;
  TTask.Run(
    procedure
    var
      Items: TVkProfiles;
      Item: TVkProfile;
      Params: TVkParamsFriendsGet;
    begin
      try
        Params.Offset(FRUsersOffset);
        Params.Count(6);
        Params.Fields([TVkProfileField.Photo50]);
        Params.Order(TVkFriendsOrder.Hints);
        if VK.Friends.Get(Items, Params) then
        begin
          try
            for Item in Items.Items do
            begin
              TThread.Synchronize(nil,
                procedure
                begin
                  ListBoxRecomendUser.AddObject(TListBoxItemUser.Create(ListBoxMusic, Item));
                end);
            end;
            if Length(Items.Items) <= 0 then
              TThread.ForceQueue(nil,
                procedure
                begin
                  LoadRecomendUser(True);
                end)
            else
              Inc(FRUsersOffset, 6);
          finally
            Items.Free;
          end;
        end;
      finally
        TThread.ForceQueue(nil,
          procedure
          begin
            ListBoxRecomendUser.EndUpdate;
            UpdateSizeTab;
          end);
      end;
    end);
end;

procedure TFormMain.VKAuth(Sender: TObject; Url: string; var Token: string; var TokenExpiry: Int64; var ChangePasswordHash: string);
begin
  TFormFMXOAuth2.Execute(Url,
    procedure(Form: TFormFMXOAuth2)
    begin
      if not Form.IsError then
      begin
        if not Form.Token.IsEmpty then
        begin
          VK.Token := Form.Token;
          VK.Login;
        end;
      end;
    end);
end;

procedure TFormMain.VKError(Sender: TObject; E: Exception; Code: Integer; Text: string);
begin
  if E is ERESTException then
  begin
    ShowMessage('Сетевая ошибка');
    Exit;
  end;
  if Code = VK_ERROR_INVALID_TOKEN then
  begin
    VK.Token := '';
    VK.Login;
  end;
end;

procedure TFormMain.VKLog(Sender: TObject; const Value: string);
begin
  TThread.Queue(nil,
    procedure
    begin
      Memo1.Lines.Add(Value);
    end);
end;

procedure TFormMain.VKLogin(Sender: TObject);
begin
  FSettings.SetStr('Auth', 'Token', VK.Token);
  LoadMusic(True);
  LoadRecomendUser(True);
  SelectTab(TabItemMyMusic, SpeedButtonMusic);
end;

end.

