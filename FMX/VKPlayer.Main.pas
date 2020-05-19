unit VKPlayer.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms,
  FMX.Graphics, FMX.Dialogs, FMX.TabControl, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Gestures, System.Actions,
  FMX.ActnList, FMX.Player, VK.API, VK.Components, VK.Entity.User, FMX.Layouts, FMX.Objects, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, VK.Entity.Audio, VK.Audio, FMX.ListView, BassPlayer.LoadHandle,
  System.Generics.Collections, System.ImageList, FMX.ImgList, FMX.Effects, FMX.Player.Shared, FMX.Player.Windows;

type
  TBitmapCacheItem = record
    Image: TBitmap;
    Url: string;
  end;

  TBitmapCache = TArray<TBitmapCacheItem>;

  TBitmapHelper = class helper for TBitmap
    class var
      PictureCache: TBitmapCache;
    class var
      LoadCounter: Integer;
    procedure LoadFromUrl(const Url: string; UseCache: Boolean = True);
    class function CreateFromUrl(const Url: string): TBitmap;
    class function CreateLazy(const Url: string): TBitmap;
  end;

  TPlayRepeat = (prNone, prAll, prOne);

  TAudio = record
    Artist: string;
    Title: string;
    AlbumPhoto: string;
    Image: TBitmap;
    Id: Integer;
    OwnerId: Integer;
    Url: string;
    Duration: string;
    AccessKey: string;
    Restricted: Boolean;
    procedure NeedImage;
    procedure Fill(Audio: TVkAudio);
  end;

  TPlaylist = record
    Description: string;
    Title: string;
    AlbumPhoto: string;
    Count: Integer;
    Image: TBitmap;
    Id: Integer;
    OwnerId: Integer;
  end;

  TFriend = record
    FirstName: string;
    LastName: string;
    Status: string;
    Music: Integer;
    AlbumPhoto: string;
    Image: TBitmap;
    Id: Integer;
    CanSeeAudio: Boolean;
  end;

  TAudioList = class(TList<TAudio>)
 { public
    function Find(AudioId: Integer): Integer; overload;
    function Find(Query: string; StartFrom: Integer = 0): Integer; overload;  }
    function IndexIn(Index: Integer): Boolean;
  end;

  TPlaylists = class(TList<TPlaylist>)
  {public
    function Find(Query: string; StartFrom: Integer = 0): Integer; overload; }
  end;

  TFriends = class(TList<TFriend>)
 { protected
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
  public
    function Find(Query: string; StartFrom: Integer = 0): Integer; overload; }
  end;

  TFormMain = class(TForm)
    TabControlMain: TTabControl;
    TabItemMusic: TTabItem;
    TabControlPlayer: TTabControl;
    TabItemPlayer: TTabItem;
    ToolBar1: TToolBar;
    lblTitle1: TLabel;
    btnNext: TSpeedButton;
    TabItemPlaylist: TTabItem;
    ToolBar2: TToolBar;
    lblTitle2: TLabel;
    btnBack: TSpeedButton;
    TabItemSearch: TTabItem;
    ToolBar3: TToolBar;
    lblTitle3: TLabel;
    TabItemUsers: TTabItem;
    ToolBar4: TToolBar;
    lblTitle4: TLabel;
    TabItemPlay: TTabItem;
    GestureManager1: TGestureManager;
    ActionList1: TActionList;
    NextTabAction1: TNextTabAction;
    PreviousTabAction1: TPreviousTabAction;
    VK: TVK;
    LayoutBottom: TLayout;
    ToolBar6: TToolBar;
    Label1: TLabel;
    ListViewMusic: TListView;
    Layout2: TLayout;
    Layout3: TLayout;
    LabelTitle: TLabel;
    LabelArtist: TLabel;
    ImageAlbum: TImage;
    StyleBook: TStyleBook;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    LabelTime: TLabel;
    LabelDuration: TLabel;
    TrackBarPosition: TTrackBar;
    TimerRefresh: TTimer;
    TimerPos: TTimer;
    ImageList64: TImageList;
    TabItemPlaylists: TTabItem;
    GridPanelLayout1: TGridPanelLayout;
    SpeedButtonPlayPause: TSpeedButton;
    SpeedButtonPlayOption: TSpeedButton;
    SpeedButtonPlayNext: TSpeedButton;
    SpeedButtonPlayPrev: TSpeedButton;
    SpeedButtonDownload: TSpeedButton;
    Panel1: TPanel;
    GridPanelLayout2: TGridPanelLayout;
    SpeedButtonPlaylists: TSpeedButton;
    SpeedButtonUsers: TSpeedButton;
    SpeedButtonSearch: TSpeedButton;
    SpeedButtonMusic: TSpeedButton;
    SpeedButton4: TLayout;
    CircleUser: TCircle;
    ListViewSearch: TListView;
    ListViewFriends: TListView;
    TabControlPlaylists: TTabControl;
    TabItemUserPlaylists: TTabItem;
    TabItemUserPlaylist: TTabItem;
    ListViewPlaylists: TListView;
    ToolBar5: TToolBar;
    Label2: TLabel;
    ToolBar7: TToolBar;
    LabelUserPlaylist: TLabel;
    ListViewCurrentPlaylist: TListView;
    ListViewPlaylist: TListView;
    SpeedButton1: TSpeedButton;
    ShadowEffect1: TShadowEffect;
    FMXPlayer: TFMXPlayer;
    procedure GestureDone(Sender: TObject; const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure VKAuth(Sender: TObject; Url: string; var Token: string; var TokenExpiry: Int64; var ChangePasswordHash: string);
    procedure VKError(Sender: TObject; E: Exception; Code: Integer; Text: string);
    procedure VKLogin(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure VKErrorLogin(Sender: TObject; E: Exception; Code: Integer; Text: string);
    procedure SpeedButtonMusicClick(Sender: TObject);
    procedure SpeedButtonSearchClick(Sender: TObject);
    procedure SpeedButtonUsersClick(Sender: TObject);
    procedure SpeedButtonPlaylistsClick(Sender: TObject);
    procedure ListViewMusicItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure ListViewCurrentPlaylistItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure TimerRefreshTimer(Sender: TObject);
    procedure SpeedButtonPlayPauseClick(Sender: TObject);
    procedure TrackBarPositionMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure TrackBarPositionMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure TrackBarPositionChange(Sender: TObject);
    procedure TimerPosTimer(Sender: TObject);
    procedure ListViewMusicUpdatingObjects(const Sender: TObject; const AItem: TListViewItem; var AHandled: Boolean);
    procedure SpeedButtonPlayNextClick(Sender: TObject);
    procedure SpeedButtonPlayPrevClick(Sender: TObject);
    procedure ListViewPlaylistsItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure ListViewPlaylistItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FMXPlayerChangeState(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FToken: string;
    FAppLoading: Boolean;
    FOpenning: Boolean;
    FPlayingId: Integer;
    FFailCount: Integer;
    FShowLeftTime: Boolean;
    FActivePlaylist: Integer;
    FVkId: Integer;
    FVkIdCurrent: Integer;
    FPlayRepeat: TPlayRepeat;
    FPosChanging: Boolean;
    FPlayChange: Boolean;
    //
    FCurrentList: TAudioList;
    FPlaylist: TAudioList;
    //
    FMyMusic: TAudioList;
    FLoadMusic: TLoadThread;
    FPlaylists: TPlaylists;
    FLoadPlaylists: TLoadThread;
    FLoadPlaylist: TLoadPlaylist;
    FFriends: TFriends;
    FLoadUsers: TLoadThread;
    //
    procedure SetCurrentUser(User: TVkUser);
    procedure SetAvatar(Url: string);
    procedure ReloadItems;
    procedure CreateLoaders;
    function Play(Index: Integer): Boolean;
    procedure FillCurrentFrom(List: TAudioList);
    procedure PlayNext(HandlePlay: Boolean);
    procedure PlayPrev(HandlePlay: Boolean);
    function FindNext(CurrentId: Integer; HandlePlay: Boolean): Integer;
    function FindPrev(CurrentId: Integer; HandlePlay: Boolean): Integer;
    procedure FillAudioItem(ListItem: TListViewItem; Item: TAudio);
    procedure SetInfo(Audio: TAudio);
    procedure FillPlaylistItem(ListItem: TListViewItem; Item: TPlaylist);
    procedure FillFriendItem(ListItem: TListViewItem; Item: TFriend);
    procedure Await;
    procedure Quit;
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses
  VK.FMX.OAuth2, VK.Friends, VK.Entity.Playlist, System.Net.HttpClient;

{$R *.fmx}

procedure OpenTab(Control: TTabControl; Tab: TTabItem);
begin
  if Control.ActiveTab.Index < Tab.Index then
    Control.SetActiveTabWithTransitionAsync(Tab, TTabTransition.Slide, TTabTransitionDirection.Normal, nil)
  else
    Control.SetActiveTabWithTransitionAsync(Tab, TTabTransition.Slide, TTabTransitionDirection.Reversed, nil);
end;

function DownloadURL(URL: string): TMemoryStream;
var
  HTTP: THTTPClient;
begin
  Result := TMemoryStream.Create;
  if URL.IsEmpty then
    Exit;

  HTTP := THTTPClient.Create;
  try
    try
      HTTP.HandleRedirects := True;
      HTTP.Get(URL, Result);
      Result.Position := 0;
    except
      //Ну, ошибка... Поток всё равно создан и ошибки не должно возникнуть,
      //если проверить размер потока перед его использованием
    end;
  finally
    HTTP.Free;
  end;
end;

procedure TFormMain.FillAudioItem(ListItem: TListViewItem; Item: TAudio);
begin
  with ListItem do
  begin
    Objects.FindObjectT<TListItemText>('Title').Text := Item.Title;
    Objects.FindObjectT<TListItemText>('Artist').Text := Item.Artist;
    Objects.FindObjectT<TListItemText>('Time').Text := Item.Duration;
    Objects.FindObjectT<TListItemImage>('Album').Bitmap := Item.Image;
  end;
end;

procedure TFormMain.FillFriendItem(ListItem: TListViewItem; Item: TFriend);
begin
  with ListItem do
  begin
    Objects.FindObjectT<TListItemText>('Name').Text := Item.FirstName + ' ' + Item.LastName;
    Objects.FindObjectT<TListItemText>('Status').Text := Item.Status;
    Objects.FindObjectT<TListItemText>('Music').Text := Item.Music.ToString;
    Objects.FindObjectT<TListItemImage>('Avatar').Bitmap := Item.Image;
  end;
end;

procedure TFormMain.FillPlaylistItem(ListItem: TListViewItem; Item: TPlaylist);
begin
  with ListItem do
  begin
    Objects.FindObjectT<TListItemText>('Title').Text := Item.Title;
    Objects.FindObjectT<TListItemText>('Desc').Text := Item.Description;
    Objects.FindObjectT<TListItemText>('Count').Text := Item.Count.ToString;
    Objects.FindObjectT<TListItemImage>('Album').Bitmap := Item.Image;
  end;
end;

procedure TFormMain.FillCurrentFrom(List: TAudioList);
var
  i: Integer;
begin
  FLoadPlaylist.Stop;
  FLoadPlaylist.Await;

  FActivePlaylist := -1;
  //FCurrentList.BeginUpdate;
  FCurrentList.Clear;
  ListViewCurrentPlaylist.Enabled := False;
  ListViewCurrentPlaylist.BeginUpdate;
  ListViewCurrentPlaylist.Items.Clear;
  for i := 0 to List.Count - 1 do
  begin
    FCurrentList.Add(List[i]);
    FillAudioItem(ListViewCurrentPlaylist.Items.Add, List[i]);
  end;
  ListViewCurrentPlaylist.Enabled := True;
  ListViewCurrentPlaylist.EndUpdate;
  //FCurrentList.EndUpdate;
  //LabelAudioCount.Caption := 'Аудиозаписей: ' + FCurrentList.Count.ToString;
end;

function TFormMain.FindNext(CurrentId: Integer; HandlePlay: Boolean): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to FCurrentList.Count - 1 do
  begin
    if FCurrentList[i].Id = CurrentId then
    begin
      if HandlePlay or (FPlayRepeat = prAll) then
      begin
        if i < (FCurrentList.Count - 1) then
          Result := i + 1
        else
          Result := 0;
      end
      else
        case FPlayRepeat of
          prNone:
            begin
              if i < (FCurrentList.Count - 1) then
                Result := i + 1
              else
                Result := -1;
            end;
          prOne:
            Result := i;
        end;
      Exit;
    end;
  end;
end;

procedure TFormMain.Await;
begin
  FLoadUsers.Stop;
  FLoadPlaylist.Stop;
  FLoadPlaylists.Stop;
  FLoadMusic.Stop;
  //FLoadSearch.Stop;
  //FLoadPicCurrent.Stop;
  //FLoadPicFriends.Stop;
  //FLoadPicSearch.Stop;
  //FLoadPicMusic.Stop;
  while
    //FLoadPicMusic.IsWorking or
    //FLoadPicSearch.IsWorking or
    //FLoadSearch.IsWorking or
    FLoadPlaylist.IsWorking or
    FLoadMusic.IsWorking or
    FLoadPlaylists.IsWorking or
    //FLoadPicCurrent.IsWorking or
    FLoadUsers.IsWorking// or
    //FLoadPicFriends.IsWorking
  do
    Application.ProcessMessages;
end;

function TFormMain.FindPrev(CurrentId: Integer; HandlePlay: Boolean): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to FCurrentList.Count - 1 do
  begin
    if FCurrentList[i].Id = CurrentId then
    begin
      if HandlePlay or (FPlayRepeat = prAll) then
      begin
        if i > 0 then
          Result := i - 1
        else
          Result := FCurrentList.Count - 1;
      end
      else
        case FPlayRepeat of
          prNone:
            begin
              if i > 0 then
                Result := i - 1
              else
                Result := -1;
            end;
          prOne:
            Result := i;
        end;
      Exit;
    end;
  end;
end;

procedure TFormMain.FMXPlayerChangeState(Sender: TObject);
begin
  case FMXPlayer.State of
    TPlayerState.psPlay:
      SpeedButtonPlayPause.ImageIndex := 14;
  else
    SpeedButtonPlayPause.ImageIndex := 18;
  end;
end;

procedure TFormMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := False;
  Quit;
end;

procedure TFormMain.Quit;
begin
  //FTerminating := True;
  //TimerEqu.Enabled := False;
  TimerRefresh.Enabled := False;
  Await;
  Application.Terminate;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  TBitmap.LoadCounter := 0;
  FAppLoading := True;
  CreateLoaders;
  TabControlMain.ActiveTab := TabItemMusic;
  TabControlMain.TabPosition := TTabPosition.None;

  FMyMusic := TAudioList.Create;
  FPlaylists := TPlaylists.Create;
  FCurrentList := TAudioList.Create;
  FPlaylist := TAudioList.Create;
  FFriends := TFriends.Create;

  TabControlPlaylists.ActiveTab := TabItemUserPlaylists;
  if not FMXPlayer.Init(Handle) then
  begin
    ShowMessage('Аудио не инициализировано ' + FMXPlayer.GetLibPath);
    //Halt;
  end;
end;

procedure TFormMain.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
  FMyMusic.Free;
  FPlaylists.Free;
  FCurrentList.Free;
  FPlaylist.Free;
  FFriends.Free;
  for i := Low(TBitmap.PictureCache) to High(TBitmap.PictureCache) do
    TBitmap.PictureCache[i].Image.Free;
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
  TThread.ForceQueue(TThread.Current,
    procedure
    begin
      VK.Login;
    end);
end;

procedure TFormMain.GestureDone(Sender: TObject; const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin     {
  case EventInfo.GestureID of
    sgiLeft:
      begin
        if TabControlMain.ActiveTab <> TabControlMain.Tabs[TabControlMain.TabCount - 1] then
          TabControlMain.ActiveTab := TabControlMain.Tabs[TabControlMain.TabIndex + 1];
        Handled := True;
      end;
    sgiRight:
      begin
        if TabControlMain.ActiveTab <> TabControlMain.Tabs[0] then
          TabControlMain.ActiveTab := TabControlMain.Tabs[TabControlMain.TabIndex - 1];
        Handled := True;
      end;
  end;   }
end;

procedure LoadImage(Image: TImage; Url: string);
begin
  TThread.CreateAnonymousThread(
    procedure
    var
      Mem: TMemoryStream;
      i: Integer;
    begin
      Image.Bitmap := TBitmap.CreateFromUrl(Url);
      for i := Low(TBitmap.PictureCache) to High(TBitmap.PictureCache) do
        if TBitmap.PictureCache[i].Url = Url then
        begin
          TThread.ForceQueue(nil,
            procedure
            begin
              Image.Bitmap := TBitmap.PictureCache[i].Image;
            end);
          Exit;
        end;
      Mem := DownloadURL(Url);
      try
        i := Length(TBitmap.PictureCache);
        SetLength(TBitmap.PictureCache, i + 1);
        TBitmap.PictureCache[i].Image := TBitmap.Create;
        try
          if Mem.Size > 0 then
          begin
            TBitmap.PictureCache[i].Image.LoadFromStream(Mem);
          end;
        finally
          TThread.ForceQueue(nil,
            procedure
            begin
              Image.Bitmap := TBitmap.PictureCache[i].Image;
            end);
          Mem.Free;
        end;
      except
      end;
    end).Start;
end;

procedure TFormMain.SetInfo(Audio: TAudio);
begin
  LabelArtist.Text := Audio.Artist;
  LabelTitle.Text := Audio.Title;
  LabelDuration.Text := Audio.Duration;
  Audio.NeedImage;
  if Assigned(Audio.Image) then
  begin
    LoadImage(ImageAlbum, Audio.AlbumPhoto);
    ImageAlbum.Hint := Audio.AlbumPhoto;
  end
  else
  begin
    //ImageAlbum.Bitmap.Assign(FAlbumThumbs.Items[0].Image);
    ImageAlbum.Hint := '';
  end;
end;

function TFormMain.Play(Index: Integer): Boolean;
var
  Item: TVkAudio;
  Audio: TAudio;
  IsDone, FRes: Boolean;
begin
  Result := False;
  if FOpenning then
    Exit;
  FOpenning := True;
  if FCurrentList.IndexIn(Index) then
  begin
    if FPlayingId = FCurrentList[Index].Id then
    begin
      if FMXPlayer.IsPlay then
        FMXPlayer.Pause
      else if not FMXPlayer.Resume then
        FMXPlayer.Play;
      FOpenning := False;
      Exit(True);
    end;
    ListViewCurrentPlaylist.ItemIndex := Index;
    Audio := FCurrentList[Index];
    FPlayingId := Audio.Id;
    if Audio.Url.IsEmpty then
    begin
      if VK.Audio.GetById(Item, Audio.OwnerId, Audio.Id, Audio.AccessKey) then
      begin
        Audio.Url := Item.Url;
        FCurrentList[Index] := Audio;
        Item.Free;
      end
      else
      begin
        FOpenning := False;
        Inc(FFailCount);
        FMXPlayer.Stop;
        Exit;
      end;
    end;
    SetInfo(Audio);
    if not Audio.Url.IsEmpty then
    begin
      FFailCount := 0;
      FMXPlayer.StreamURL := Audio.Url;
      IsDone := False;
      FRes := False;
      TThread.CreateAnonymousThread(
        procedure
        begin
          FRes := FMXPlayer.Play;
          IsDone := True;
        end).Start;
      while not IsDone do
        Application.ProcessMessages;
      Result := FRes;
    end
    else
    begin
      FMXPlayer.Stop;
      Inc(FFailCount);
    end;
  end;
  FOpenning := False;
end;

procedure TFormMain.PlayNext;
var
  Nxt: Integer;
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
    Exit;
  Nxt := FindNext(FPlayingId, HandlePlay);
  if FCurrentList.IndexIn(Nxt) then
    if not Play(Nxt) then
      PlayNext(HandlePlay);
end;

procedure TFormMain.PlayPrev;
var
  Nxt: Integer;
begin
  if FOpenning then
    Exit;
  Nxt := FindPrev(FPlayingId, HandlePlay);
  if FCurrentList.IndexIn(Nxt) then
    if not Play(Nxt) then
      PlayPrev(HandlePlay);
end;

procedure TFormMain.ListViewMusicItemClick(const Sender: TObject; const AItem: TListViewItem);
begin
  FillCurrentFrom(FMyMusic);
  if not Play(AItem.Index) then
    PlayNext(True);
  OpenTab(TabControlMain, TabItemPlay);
  OpenTab(TabControlPlayer, TabItemPlayer);
end;

procedure TFormMain.ListViewMusicUpdatingObjects(const Sender: TObject; const AItem: TListViewItem; var AHandled: Boolean);
begin
  //FMyMusic[AItem.Index].NeedImage;
end;

procedure TFormMain.ListViewPlaylistItemClick(const Sender: TObject; const AItem: TListViewItem);
begin
  FillCurrentFrom(FPlaylist);
  if not Play(AItem.Index) then
    PlayNext(True);
  OpenTab(TabControlMain, TabItemPlay);
  OpenTab(TabControlPlayer, TabItemPlayer);
end;

procedure TFormMain.ListViewPlaylistsItemClick(const Sender: TObject; const AItem: TListViewItem);
begin
  FActivePlaylist := FPlaylists[AItem.Index].Id;
  LabelUserPlaylist.Text := AItem.Objects.FindObjectT<TListItemText>('Title').Text;
  FLoadPlaylist.Execute(FPlaylists[AItem.Index].OwnerId, FPlaylists[AItem.Index].Id);
  OpenTab(TabControlPlaylists, TabItemUserPlaylist);
end;

procedure TFormMain.ListViewCurrentPlaylistItemClick(const Sender: TObject; const AItem: TListViewItem);
begin
  if not Play(AItem.Index) then
    PlayNext(True);
end;

procedure TFormMain.VKAuth(Sender: TObject; Url: string; var Token: string; var TokenExpiry: Int64; var
  ChangePasswordHash: string);
begin
  if FToken.IsEmpty then
  begin
    TFormFMXOAuth2.Execute(Url,
      procedure(Form: TFormFMXOAuth2)
      begin
        FToken := Form.Token;
        if not FToken.IsEmpty then
          Vk.Login;
      end);
  end;
  Token := FToken;
end;

procedure TFormMain.VKError(Sender: TObject; E: Exception; Code: Integer; Text: string);
begin
  if Code = 5 then
  begin
    FToken := '';
    //FSettings.SetStr('General', 'Token', FToken);
    //Вызываем авторизацию после того, как выйдем из всего этого стека
    TThread.CreateAnonymousThread(
      procedure
      begin
        TThread.Synchronize(TThread.CurrentThread,
          procedure
          begin
            VK.Login;
          end);
      end).Start;
  end;
end;

procedure TFormMain.VKErrorLogin(Sender: TObject; E: Exception; Code: Integer; Text: string);
begin
  //
end;

procedure TFormMain.SetCurrentUser(User: TVkUser);
begin
  Caption := 'VK Audio Player [' + User.GetFullName + ']';
end;

procedure TFormMain.SpeedButton1Click(Sender: TObject);
begin
  OpenTab(TabControlPlaylists, TabItemUserPlaylists);
end;

procedure TFormMain.SpeedButton4Click(Sender: TObject);
begin
  OpenTab(TabControlMain, TabItemPlay);
end;

procedure TFormMain.SpeedButtonMusicClick(Sender: TObject);
begin
  OpenTab(TabControlMain, TabItemMusic);
end;

procedure TFormMain.SpeedButtonSearchClick(Sender: TObject);
begin
  //OpenTab(TabControlMain, TabItemSearch);
 { FMXPlayer.StreamURL := 'https://rusradio.hostingradio.ru/rusradio96.aacp';
  FMXPlayer.Play; }
  OpenTab(TabControlMain, TabItemPlay);
  FMXPlayer.FileName := 'D:\Мультимедиа\Музыка\Dear Euphoria\Dear Euphoria - Glorious Laughter.mp3';
  FMXPlayer.Play;
end;

procedure TFormMain.TimerRefreshTimer(Sender: TObject);
begin
  if FMXPlayer.IsPlay then
  begin
    if FShowLeftTime then
      LabelTime.Text := FMXPlayer.PositionTimeLeft
    else
      LabelTime.Text := FMXPlayer.PositionTime;
  end;
  if not FPosChanging then
  begin
    FPlayChange := True;
    TrackbarPosition.Value := FMXPlayer.PositionPercent;
    FPlayChange := False;
  end;
  //TrackbarPosition.SecondPosition := FMXPlayer.BufferringPercent;
end;

procedure TFormMain.TimerPosTimer(Sender: TObject);
begin
  TimerPos.Enabled := False;
  FMXPlayer.PositionPercent := TrackbarPosition.Value;
  FPosChanging := False;
end;

procedure TFormMain.TrackBarPositionChange(Sender: TObject);
begin
  if not FPlayChange then
  begin
    FPosChanging := True;
    TimerPos.Enabled := False;
    TimerPos.Enabled := True;
  end;
end;

procedure TFormMain.TrackBarPositionMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  FPosChanging := True;
end;

procedure TFormMain.TrackBarPositionMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  if FPosChanging then
  begin
    FPosChanging := False;
    FMXPlayer.PositionPercent := TrackBarPosition.Value;
  end;
end;

procedure TFormMain.SpeedButtonPlaylistsClick(Sender: TObject);
begin
  OpenTab(TabControlMain, TabItemPlaylists);
end;

procedure TFormMain.SpeedButtonPlayNextClick(Sender: TObject);
begin
  PlayNext(True);
end;

procedure TFormMain.SpeedButtonUsersClick(Sender: TObject);
begin
  OpenTab(TabControlMain, TabItemUsers);
end;

procedure TFormMain.SpeedButtonPlayPauseClick(Sender: TObject);
begin
  if FMXPlayer.IsPlay then
    FMXPlayer.Pause
  else if FPlayingId >= 0 then
    FMXPlayer.Resume
  else if FCurrentList.Count <= 0 then
  begin
    FillCurrentFrom(FMyMusic);
    Play(0);
  end
  else
    Play(0);
end;

procedure TFormMain.SpeedButtonPlayPrevClick(Sender: TObject);
begin
  PlayPrev(True);
end;

procedure TFormMain.SetAvatar(Url: string);
var
  Mem: TMemoryStream;
  Pic: TBitmap;
begin
  Mem := DownloadURL(Url);
  Pic := TBitmap.Create;
  try
    if Mem.Size > 0 then
    begin
      try
        Pic.LoadFromStream(Mem);
        CircleUser.Fill.Bitmap.Bitmap := Pic;
        CircleUser.Fill.Kind := TBrushKind.Bitmap;
      except
      end;
    end;
  finally
    Pic.Free;
    Mem.Free;
  end;
end;

procedure TFormMain.CreateLoaders;
begin
  {$REGION 'FLoadMusic'}
  FLoadMusic := TLoadThread.Create(
    procedure
    begin
      ListViewMusic.Enabled := False;
      ListViewMusic.BeginUpdate;
      ListViewMusic.Items.Clear;
    end,
    function(LT: TLoadThread): Boolean
    var
      i: Integer;
      Audios: TVkAudios;
      Audio: TAudio;
    begin
      Result := False;
      //FLoadPicMusic.Stop;
      //FLoadPicMusic.Await(False);
      //FMyMusic.BeginUpdate;
      try
        FMyMusic.Clear;
        if VK.Audio.Get(Audios, FVkId) then
        begin
          try
            for i := Low(Audios.Items) to High(Audios.Items) do
            begin
              if LT.NeedStop then
                Break;
              Audio.Fill(Audios.Items[i]);
              FMyMusic.Add(Audio);
            end;
          finally
            Audios.Free;
          end;
          Result := not LT.NeedStop;
        end;
      finally
        //FMyMusic.EndUpdate;
      end;
    end,
    procedure(Complete: Boolean)
    var
      i: Integer;
    begin
      for i := 0 to FMyMusic.Count - 1 do
        FillAudioItem(ListViewMusic.Items.Add, FMyMusic[i]);
      ListViewMusic.EndUpdate;
      ListViewMusic.Enabled := True;
      {if Complete then
        FLoadPicMusic.Execute;  }
    end);
  {$ENDREGION}
  {$REGION 'FLoadPlaylists'}
  FLoadPlaylists := TLoadThread.Create(
    procedure
    begin
      ListViewPlaylists.Enabled := False;
      ListViewPlaylists.BeginUpdate;
      ListViewPlaylists.Items.Clear;
    end,
    function(LT: TLoadThread): Boolean
    var
      i: Integer;
      Playlists: TVkPlaylists;
      Playlist: TPlaylist;
      //DefImg: Boolean;
    begin
      Result := False;
      //FPlaylists.BeginUpdate;
      try
        FPlaylists.Clear;
        if VK.Audio.GetPlaylists(Playlists, FVkId) then
        begin
          try
            for i := Low(Playlists.Items) to High(Playlists.Items) do
            begin
              if LT.NeedStop then
                Break;
              if Length(Playlists.Items[i].MainArtists) > 0 then
                Playlist.Description := Playlists.Items[i].MainArtists[0].Name
              else
                Playlist.Description := Playlists.Items[i].Description;
              Playlist.Title := Playlists.Items[i].Title;
              if Assigned(Playlists.Items[i].Photo) then
                Playlist.AlbumPhoto := Playlists.Items[i].Photo.Photo68
              else
                Playlist.AlbumPhoto := '';

              Playlist.Image := TBitmap.CreateLazy(Playlist.AlbumPhoto);
              Playlist.Id := Playlists.Items[i].Id;
              Playlist.OwnerId := Playlists.Items[i].OwnerId;
              Playlist.Count := Playlists.Items[i].Count;
              FPlaylists.Add(Playlist);
            end;
          finally
            Playlists.Free;
          end;
          Result := not LT.NeedStop;
        end;
      finally
        //FPlaylists.EndUpdate;
      end;
    end,
    procedure(Complete: Boolean)
    var
      i: Integer;
    begin
      for i := 0 to FPlaylists.Count - 1 do
        FillPlaylistItem(ListViewPlaylists.Items.Add, FPlaylists[i]);
      ListViewPlaylists.EndUpdate;
      ListViewPlaylists.Enabled := True;
    end);
  {$ENDREGION}
  {$REGION 'FLoadPlaylist'}
  FLoadPlaylist := TLoadPlaylist.Create(
    procedure
    begin
      ListViewPlaylist.Enabled := False;
      ListViewPlaylist.BeginUpdate;
      ListViewPlaylist.Items.Clear;
    end,
    function(LT: TLoadThread; OwnerId, Id: Integer): Boolean
    var
      i: Integer;
      Audios: TVkAudios;
      Params: TVkAudioParams;
      Audio: TAudio;
    begin
      //FPlaylist.BeginUpdate;
      FPlaylist.Clear;
      Result := False;
      try
        Params.OwnerId(OwnerId);
        Params.AlbumId(Id);
        if VK.Audio.Get(Audios, Params) then
        begin
          try
            for i := Low(Audios.Items) to High(Audios.Items) do
            begin
              if not LT.NeedStop then
              begin
                Audio.Fill(Audios.Items[i]);
                FPlaylist.Add(Audio);
              end;
            end;
          finally
            Audios.Free;
          end;
          Result := not LT.NeedStop;
        end;
      finally
        //FPlaylist.EndUpdate;
      end;
    end,
    procedure(Complete: Boolean)
    var
      i: Integer;
    begin
      for i := 0 to FPlaylist.Count - 1 do
        FillAudioItem(ListViewPlaylist.Items.Add, FPlaylist[i]);
      ListViewPlaylist.EndUpdate;
      ListViewPlaylist.Enabled := True;
    {
      TableExCurrent.Enabled := True;
      Play(0);
      LabelAudioCount.Caption := 'Аудиозаписей: ' + FCurrentList.Count.ToString;
      if Complete then
        FLoadPicCurrent.Execute;   }
    end);
  {$ENDREGION}
  {$REGION 'FLoadUsers'}
  FLoadUsers := TLoadThread.Create(
    procedure
    begin
      ListViewFriends.Enabled := False;
      ListViewFriends.BeginUpdate;
      ListViewFriends.Items.Clear;
    end,
    function(LT: TLoadThread): Boolean
    var
      Users: TVkUsers;
      Friend: TFriend;
      i: Integer;
    begin
      //FFriends.BeginUpdate;
      FFriends.Clear;
      Result := False;
      try
        if VK.Friends.Get(Users, 'nickname, sex, photo_50, status, can_see_audio', fsName) then
        begin
          try
            for i := Low(Users.Items) to High(Users.Items) do
            begin
              if LT.NeedStop then
                Break;
              Friend.Id := Users.Items[i].Id;
              Friend.FirstName := Users.Items[i].FirstName;
              Friend.LastName := Users.Items[i].LastName;
              Friend.AlbumPhoto := Users.Items[i].Photo50;
              Friend.CanSeeAudio := Users.Items[i].CanSeeAudio = 1;
              Friend.Image := nil;
              Friend.Status := Users.Items[i].Status;
              FFriends.Add(Friend);
            end;
          finally
            Users.Free;
          end;
          Result := not LT.NeedStop;
        end;
      finally
        //FFriends.EndUpdate;
      end;
    end,
    procedure(Complete: Boolean)
    var
      i: Integer;
    begin
      for i := 0 to FFriends.Count - 1 do
        FillFriendItem(ListViewFriends.Items.Add, FFriends[i]);
      ListViewFriends.EndUpdate;
      ListViewFriends.Enabled := True;
    end);
  {$ENDREGION}
end;

procedure TFormMain.ReloadItems;
begin
  TimerRefresh.Enabled := False;
  FLoadMusic.Execute;
  FLoadPlaylists.Execute;
  TimerRefresh.Enabled := True;
end;

procedure TFormMain.VKLogin(Sender: TObject);
var
  User: TVkUser;
begin
  FFailCount := 0;
  FToken := VK.Token;
  //FSettings.SetStr('General', 'Token', FToken);

  if VK.Users.Get(User, 0, 'photo_50') then
  begin
    FVkId := User.Id;
    FVkIdCurrent := FVkId;
    SetCurrentUser(User);
    SetAvatar(User.Photo50);
    User.Free;
    ReloadItems;
    FLoadUsers.Execute;
  end
  else
    FVkId := -1;
  FAppLoading := False;
end;

{ TAudio }

procedure TAudio.Fill(Audio: TVkAudio);
var
  M, S: Integer;
begin
  Artist := Audio.Artist;
  Title := Audio.Title;
  if Assigned(Audio.Album) and Assigned(Audio.Album.Thumb) then
    AlbumPhoto := Audio.Album.Thumb.Photo270
  else
    AlbumPhoto := '';
  Image := TBitmap.CreateLazy(AlbumPhoto);
  Id := Audio.Id;
  OwnerId := Audio.OwnerId;
  Restricted := Audio.ContentRestricted > 0;
  S := Trunc(Audio.Duration);
  M := S div 60;
  S := S mod 60;
  Duration := Format('%d:%.2d', [M, S]);
  AccessKey := Audio.AccessKey;
end;

procedure TAudio.NeedImage;
begin
  Image.LoadFromUrl(AlbumPhoto, False);
end;

{ TAudioList }

function TAudioList.IndexIn(Index: Integer): Boolean;
begin
  Result := (Index >= 0) and (Index <= Count - 1) and (Count > 0);
end;

{ TBitmapHelper }

class function TBitmapHelper.CreateFromUrl(const Url: string): TBitmap;
var
  i: Integer;
begin
  for i := Low(PictureCache) to High(PictureCache) do
    if PictureCache[i].Url = Url then
    begin                      {
      TThread.Queue(TThread.Current,
        procedure
        begin
          //FormMain.ImageBook.Repaint;
        end);          }
      Exit(PictureCache[i].Image);
    end;
  i := Length(PictureCache);
  SetLength(PictureCache, i + 1);
  PictureCache[i].Image := TBitmap.Create;
  PictureCache[i].Image.LoadFromUrl(Url, False);
  Result := PictureCache[i].Image;
end;

class function TBitmapHelper.CreateLazy(const Url: string): TBitmap;
var
  i: Integer;
begin
  for i := Low(PictureCache) to High(PictureCache) do
    if PictureCache[i].Url = Url then
    begin
      Exit(PictureCache[i].Image);
    end;
  i := Length(PictureCache);
  SetLength(PictureCache, i + 1);
  PictureCache[i].Image := TBitmap.Create;
  //PictureCache[i].Image.LoadFromUrl(Url, False);
  Result := PictureCache[i].Image;
end;

procedure TBitmapHelper.LoadFromUrl(const Url: string; UseCache: Boolean);
begin
  TThread.CreateAnonymousThread(
    procedure
    var
      Mem: TMemoryStream;
      i: Integer;
    begin
      if UseCache then
        for i := Low(PictureCache) to High(PictureCache) do
          if PictureCache[i].Url = Url then
          begin
            Self.Assign(PictureCache[i].Image);
            Exit;
          end;
      while LoadCounter > 10 do
        Sleep(500);
      Inc(LoadCounter);
      try
        Mem := DownloadURL(Url);
        try
          i := Length(PictureCache);
          SetLength(PictureCache, i + 1);
          PictureCache[i].Image := TBitmap.Create;
          try
            if Mem.Size > 0 then
            begin
              PictureCache[i].Image.LoadFromStream(Mem);
            end;
          finally
            Self.Assign(PictureCache[i].Image);
            Mem.Free;
          end;
        except
        end;
      finally
        Dec(LoadCounter);
      end;
    end).Start;
end;

end.

