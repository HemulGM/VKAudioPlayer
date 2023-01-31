unit VKAP.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  System.Types, VK.API, VK.Components, HGM.Common.Settings, Vcl.Grids,
  HGM.Controls.VirtualTable, Vcl.ExtCtrls, BassPlayer, Vcl.StdCtrls, HGM.Button,
  Vcl.ComCtrls, HGM.Controls.PanelExt, System.ImageList, Vcl.ImgList,
  Vcl.Imaging.pngimage, System.Generics.Collections, Vcl.Imaging.jpeg,
  VK.Entity.Playlist, VK.Entity.Profile, BassPlayer.LoadHandle, VK.Entity.Audio,
  VKAP.Player, HGM.SQLite, HGM.SQLang, Vcl.Menus, Vcl.WinXCtrls,
  HGM.Controls.TrackBar, System.Win.TaskbarCore, Vcl.Taskbar, HGM.Tools.Hint
  {,
  Vcl.Styles.Utils.SysStyleHook};

type
  TAudio = record
    Artist: string;
    Title: string;
    AlbumPhoto: string;
    Image: TPicture;
    Id: Integer;
    OwnerId: Integer;
    Url: string;
    Duration: string;
    AccessKey: string;
    Restricted: Boolean;
    procedure Fill(Audio: TVkAudio);
  end;

  TPlaylist = record
    Description: string;
    Title: string;
    AlbumPhoto: string;
    Count: Integer;
    Image: TPicture;
    Id: Integer;
    OwnerId: Integer;
  end;

  TFriend = record
    FirstName: string;
    LastName: string;
    Status: string;
    AlbumPhoto: string;
    Image: TPicture;
    Id: Integer;
    CanSeeAudio: Boolean;
  end;

  TAlbumThumb = record
    Image: TPicture;
    Stored: Boolean;
    URL: string;
    class function CreateItem(AImage: TPicture; AUrl: string): TAlbumThumb; static;
  end;

  TAlbumThumbs = class(TList<TAlbumThumb>)
    const
      TableName = 'ImageCache';
      fnID = 'icID';
      fnURL = 'icURL';
      fnImage = 'icImage';
  private
    FDB: TSQLiteDatabase;
    FCanFind: Boolean;
    FFinding: Boolean;
    FSaving: Boolean;
  public
    procedure LoadImages;
    procedure SaveImages;
    function FindPicture(Url: string; var Index: Integer): Boolean;
    function GetImage(Url: string; var UseDefault: Boolean; Avatar: Boolean = False): TPicture;
    destructor Destroy; override;
    constructor Create(ADB: TSQLiteDatabase);
  end;

  IListFind = interface
    function Find(Query: string; StartFrom: Integer = 0): Integer;
    function IndexIn(Index: Integer): Boolean;
    procedure SelectInTable(Index: Integer; Table: TTableEx = nil);
    function GetFirstTableSelectedIndex: Integer;
  end;

  TAudioList = class(TTableData<TAudio>, IListFind)
  protected
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
  public
    function Find(AudioId: Integer): Integer; overload;
    function Find(Query: string; StartFrom: Integer = 0): Integer; overload;
  end;

  TFriends = class(TTableData<TFriend>, IListFind)
  protected
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
  public
    function Find(Query: string; StartFrom: Integer = 0): Integer; overload;
  end;

  TPlaylists = class(TTableData<TPlaylist>, IListFind)
  protected
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
  public
    function Find(Query: string; StartFrom: Integer = 0): Integer; overload;
  end;

  TPlayRepeat = (prNone, prAll, prOne);

  TEquItems = array[1..4] of Double;

  TFormMain = class(TForm)
    VK: TVK;
    PanelPlayer: TPanel;
    ButtonFlatPlayPause: TButtonFlat;
    TimerRefresh: TTimer;
    ButtonFlatNext: TButtonFlat;
    ButtonFlatPrev: TButtonFlat;
    ButtonFlatDownload: TButtonFlat;
    ImageList: TImageList;
    PanelTrackInfo: TPanel;
    ImageListL: TImageList;
    ImageAlbum: TImage;
    PanelTrackSinger: TPanel;
    LabelArtist: TLabel;
    LabelTitle: TLabel;
    PanelTrackTime: TPanel;
    LabelTime: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    PanelInfoBottom: TPanel;
    LabelAudioCount: TLabel;
    PanelPlaylist: TPanel;
    TimerEqu: TTimer;
    PanelNav: TPanel;
    Shape3: TShape;
    PanelPageControl: TPanel;
    PanelSearch: TPanel;
    EditSearch: TEdit;
    ButtonFlatSearchBG: TButtonFlat;
    ButtonFlatSearch: TButtonFlat;
    PanelPageInd: TPanel;
    ShapeActivePage: TShape;
    ButtonFlatMy: TButtonFlat;
    ShapeHotButton: TShape;
    ButtonFlatCurrent: TButtonFlat;
    ButtonFlatPlaylists: TButtonFlat;
    TimerAnimate: TTimer;
    PageControl: TPageControl;
    TableExMyMusic: TTableEx;
    TabSheetCurrent: TTabSheet;
    TabSheetMyMusic: TTabSheet;
    TabSheetPlaylists: TTabSheet;
    TabSheetFriends: TTabSheet;
    ButtonFlatFriends: TButtonFlat;
    TableExPlaylists: TTableEx;
    TableExCurrent: TTableEx;
    MemoLog: TMemo;
    TableExFriends: TTableEx;
    ButtonFlatSearchTab: TButtonFlat;
    TabSheetSearch: TTabSheet;
    ButtonFlatShuffle: TButtonFlat;
    ButtonFlatRepeat: TButtonFlat;
    TableExSearch: TTableEx;
    PanelUser: TPanel;
    ImageAvatar: TImage;
    ButtonFlatMyMusic: TButtonFlat;
    PopupMenuAudio: TPopupMenu;
    MenuItemAudioDownload: TMenuItem;
    MenuItemAudioAlbum: TMenuItem;
    MenuItemAudioArtist: TMenuItem;
    MenuItemAudioDelete: TMenuItem;
    MenuItemAudioAdd: TMenuItem;
    PanelLoading: TPanel;
    ActivityIndicatorLoading: TActivityIndicator;
    TrackbarPosition: ThTrackbar;
    PanelVolume: TPanel;
    TrackbarVolume: ThTrackbar;
    Taskbar: TTaskbar;
    CheckBoxFlatSerachType: TCheckBoxFlat;
    HintPanel: TlkHint;
    SaveDialogMp3: TFileSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure TableExMyMusicItemClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure TimerRefreshTimer(Sender: TObject);
    procedure ButtonFlatDownloadClick(Sender: TObject);
    procedure TableExMyMusicDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure ButtonFlatPrevClick(Sender: TObject);
    procedure ButtonFlatNextClick(Sender: TObject);
    procedure ButtonFlatPlayPauseClick(Sender: TObject);
    procedure VKLogin(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure LabelTimeClick(Sender: TObject);
    procedure TimerEquTimer(Sender: TObject);
    procedure VKError(Sender: TObject; E: Exception; Code: Integer; Text: string);
    procedure ButtonFlatMyMouseEnter(Sender: TObject);
    procedure ButtonFlatMyMouseLeave(Sender: TObject);
    procedure ButtonFlatPlaylistsClick(Sender: TObject);
    procedure TimerAnimateTimer(Sender: TObject);
    procedure ButtonFlatCurrentClick(Sender: TObject);
    procedure ButtonFlatMyClick(Sender: TObject);
    procedure ButtonFlatFriendsClick(Sender: TObject);
    procedure TableExPlaylistsDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure TableExCurrentDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure TableExCurrentItemClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
    procedure TableExPlaylistsItemClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
    procedure VKLog(Sender: TObject; const Value: string);
    procedure TableExFriendsDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure TableExFriendsItemClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
    procedure ButtonFlatRepeatClick(Sender: TObject);
    procedure ButtonFlatShuffleClick(Sender: TObject);
    procedure ButtonFlatSearchClick(Sender: TObject);
    procedure ButtonFlatSearchTabClick(Sender: TObject);
    procedure TableExSearchDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure TableExSearchItemClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
    procedure FormShow(Sender: TObject);
    procedure ButtonFlatMyMusicClick(Sender: TObject);
    procedure VKAuth(Sender: TObject; Url: string; var Token: string; var TokenExpiry: Int64; var ChangePasswordHash: string);
    procedure FormResize(Sender: TObject);
    procedure ImageAvatarClick(Sender: TObject);
    procedure TrackbarPositionChange(Sender: TObject; Position: Extended);
    procedure TrackbarVolumeChange(Sender: TObject; Position: Extended);
    procedure TaskbarThumbButtonClick(Sender: TObject; AButtonID: Integer);
    procedure EditSearchKeyPress(Sender: TObject; var Key: Char);
    procedure TrackbarVolumeAdvHint(Sender: TObject; HintPosition: Extended; var Text: string);
    procedure TrackbarVolumeMouseLeave(Sender: TObject);
    procedure TrackbarPositionAdvHint(Sender: TObject; HintPosition: Extended; var Text: string);
    procedure TrackbarPositionMouseLeave(Sender: TObject);
  private
    FToken: string;
    FMyMusic: TAudioList;
    FCurrentList: TAudioList;
    FSearchList: TAudioList;
    FFriends: TFriends;
    FPlaylists: TPlaylists;
    FPlayingId: Integer;
    FSettings: TSettingsIni;
    FPlayer: TBASSPlayer;
    FAlbumThumbs: TAlbumThumbs;
    FShowLeftTime: Boolean;
    FPlayImage, FActiveImage: TPngImage;
    FPauseImage: TPngImage;
    FEqu: TEquItems;
    FNeedActLeft: Integer;
    FNeedActWidth: Integer;
    FVkId: Integer;
    FVkIdCurrent: Integer;
    FActivePlaylist: Integer;
    FOpenning: Boolean;
    FPlayRepeat: TPlayRepeat;
    FLoadUsers: TLoadThread;
    FLoadPlaylist: TLoadPlaylist;
    FLoadPlaylists: TLoadThread;
    FLoadMusic: TLoadThread;
    FLoadSearch: TLoadSearch;
    FLoadPicCurrent: TLoadThread;
    FLoadPicFriends: TLoadThread;
    FLoadPicSearch: TLoadThread;
    FLoadPicMusic: TLoadThread;
    FAppLoading: Boolean;
    FFailCount: Integer;
    FAvatarMask: TPngImage;
    FAvatarDef: TPngImage;
    FAudioMask: TPngImage;
    FTerminating: Boolean;
    FChangingUser: Boolean;
    FDB: TSQLiteDatabase;
    FLoading: TDecoratePanel;
    FFontColor: TColor;
    FStyleColor: TColor;
    FIsDark: Boolean;
    FPlayIco: TIcon;
    FPauseIco: TIcon;
    procedure FOnAudioEnd(Sender: TObject);
    procedure FOnAudioChangeState(Sender: TObject);
    function FindNext(CurrentId: Integer; HandlePlay: Boolean): Integer;
    function FindPrev(CurrentId: Integer; HandlePlay: Boolean): Integer;
    function Play(Index: Integer): Boolean;
    procedure ClearInfo;
    procedure SetInfo(Audio: TAudio);
    procedure PlayNext(HandlePlay: Boolean);
    procedure PlayPrev(HandlePlay: Boolean);
    procedure Await;
    procedure RefillEqu;
    procedure ButtonFlatNavClick(Sender: TObject);
    procedure FillCurrentFromMyMusic;
    procedure UpdateImages(Url: string; Image: TPicture);
    procedure FillCurrentFromPlaylist(Index: Integer);
    procedure ReloadItems;
    procedure SetCurrentUser(User: TVkProfile);
    procedure NextRepeat;
    procedure SetRepeat(Value: TPlayRepeat);
    procedure Shuffle;
    procedure Search(Query: string);
    procedure FillCurrentFromSearch;
    procedure CreateLoaders;
    procedure SetPlayerInfo(Audio: TAudio);
    procedure SetPlayerState(IsPlay: Boolean);
    procedure SetAvatar(Url: string);
    procedure DrawAudioThumb(Target: TCanvas; List: TAudioList; Index: Integer; Rect: TRect; Hot: Boolean);
    procedure DrawAlbumThumb(Target: TCanvas; List: TPlaylists; Index: Integer; Rect: TRect; Hot: Boolean);
    procedure DrawAudioInfo(Target: TCanvas; List: TAudioList; Index: Integer; Rect: TRect);
    procedure DrawAlbumInfo(Target: TCanvas; List: TPlaylists; Index: Integer; Rect: TRect);
    procedure SetColors(IsDark: Boolean);
    procedure SearchInList(List: IListFind; Query: string);
    function GetActiveList: IListFind;
  public
    procedure DoLogin;
    procedure Quit;
    procedure Mini;
    procedure Full;
    procedure OpenPlaylists;
    procedure OpenCurrentPlaylist;
    procedure OpenFriends;
    procedure OpenSearch;
    procedure OpenMyMusic;
  end;

var
  FormMain: TFormMain;
  AppFolder: string;

function CreateAvatar(Source: TGraphic; Mask: TPngImage): TPngImage;

implementation

uses
  VK.Audio, Vk.Types, System.IOUtils, HGM.Common.Workspace, HGM.Common.Utils,
  Direct2D, D2D1, Math, VK.Vcl.OAuth2, VK.Friends, Vcl.Themes, Vcl.Styles,
  HGM.Common.PngUtils, VK.Clients;

{$R *.dfm}

function CreateAvatar(Source: TGraphic; Mask: TPngImage): TPngImage;
var
  BMPSmooth: TBitmap;
begin
  BMPSmooth := SmoothStrechDraw(Source, TRect.Create(0, 0, Mask.Width, Mask.Height));
  Result := TPngImage.CreateBlank(COLOR_RGB, 16, Mask.Width, Mask.Height);
  Result.Assign(BMPSmooth);
  Result.CreateAlpha;
  BMPSmooth.Free;
  ApplyMask(0, 0, Mask, Result);
end;

procedure TFormMain.LabelTimeClick(Sender: TObject);
begin
  FShowLeftTime := not FShowLeftTime;
  TimerRefreshTimer(nil);
end;

procedure TFormMain.DrawAudioInfo(Target: TCanvas; List: TAudioList; Index: Integer; Rect: TRect);
var
  TxtRect: TRect;
  S: string;
begin
  with Target do
  begin
    Font.Name := 'Roboto';
    Font.Size := 9;
    TxtRect := Rect;
    TxtRect.Bottom := TxtRect.CenterPoint.Y;
    TxtRect.Inflate(-1, -1);
    TxtRect.Right := TxtRect.Right - 40;
    S := List[Index].Title;
    Font.Color := FFontColor;
    TextRect(TxtRect, S, [tfSingleLine, tfBottom, tfLeft, tfEndEllipsis]);

    TxtRect := Rect;
    TxtRect.Top := TxtRect.CenterPoint.Y;
    TxtRect.Inflate(-1, -1);
    TxtRect.Right := TxtRect.Right - 40;
    S := List[Index].Artist;
    Font.Color := $00939393;
    TextRect(TxtRect, S, [tfSingleLine, tfTop, tfLeft, tfEndEllipsis]);

    TxtRect := Rect;
    TxtRect.Inflate(-4, -4);
    TxtRect.Left := TxtRect.Right - 40;
    S := List[Index].Duration;
    TextRect(TxtRect, S, [tfSingleLine, tfVerticalCenter, tfCenter]);

    if List[Index].Restricted then
    begin
      TxtRect := TRect.Create(TPoint.Zero, 100, 20);
      TxtRect.SetLocation(Rect.Right - (TxtRect.Width + 60), Rect.CenterPoint.Y - TxtRect.Height div 2);
      S := 'Недоступна';
      Font.Color := clWhite;
      Pen.Color := clMaroon;
      Brush.Color := $005A5AAC;
      RoundRect(TxtRect, 4, 4);
      TextRect(TxtRect, S, [tfSingleLine, tfVerticalCenter, tfCenter]);
    end;
  end;
end;

procedure TFormMain.DrawAudioThumb(Target: TCanvas; List: TAudioList; Index: Integer; Rect: TRect; Hot: Boolean);
begin
  with Target do
  begin
    Rect.Inflate(-7, -7);
    if Assigned(List[Index].Image) then
      StretchDraw(Rect, List[Index].Image.Graphic)
    else
      StretchDraw(Rect, FAlbumThumbs[0].Image.Graphic);

    if List[Index].Id = FPlayingId then
    begin
      if Hot then
      begin
        if FPlayer.IsPlay then
          StretchDraw(Rect, FPauseImage)
        else
          StretchDraw(Rect, FPlayImage);
      end
      else
      begin
        StretchDraw(Rect, FActiveImage);
        Pen.Width := 2;
        Pen.Color := clWhite;
        MoveTo(Rect.Left + 8 + 5, Rect.Bottom - 12);
        LineTo(Rect.Left + 8 + 5, Round(Rect.Bottom - 12 - 1 - ((15 / 100) * FEqu[1])));

        MoveTo(Rect.Left + 8 + 10, Rect.Bottom - 12);
        LineTo(Rect.Left + 8 + 10, Round(Rect.Bottom - 12 - 1 - ((15 / 100) * FEqu[2])));

        MoveTo(Rect.Left + 8 + 15, Rect.Bottom - 12);
        LineTo(Rect.Left + 8 + 15, Round(Rect.Bottom - 12 - 1 - ((15 / 100) * FEqu[3])));

        MoveTo(Rect.Left + 8 + 20, Rect.Bottom - 12);
        LineTo(Rect.Left + 8 + 20, Round(Rect.Bottom - 12 - 1 - ((15 / 100) * FEqu[4])));
      end;
    end
    else if Hot then
      StretchDraw(Rect, FPlayImage);
  end;
end;

procedure TFormMain.EditSearchKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ButtonFlatSearchClick(nil);
  end;
end;

procedure TFormMain.DrawAlbumThumb(Target: TCanvas; List: TPlaylists; Index: Integer; Rect: TRect; Hot: Boolean);
begin
  with Target do
  begin
    Rect.Inflate(-7, -7);
    if Assigned(List[Index].Image) then
      StretchDraw(Rect, List[Index].Image.Graphic)
    else
      StretchDraw(Rect, FAlbumThumbs[0].Image.Graphic);

    if List[Index].Id = FPlayingId then
    begin
      if Hot then
      begin
        if FPlayer.IsPlay then
          StretchDraw(Rect, FPauseImage)
        else
          StretchDraw(Rect, FPlayImage);
      end
      else
      begin
        StretchDraw(Rect, FActiveImage);
        Pen.Width := 2;
        Pen.Color := clWhite;
        MoveTo(Rect.Left + 8 + 5, Rect.Bottom - 12);
        LineTo(Rect.Left + 8 + 5, Round(Rect.Bottom - 12 - 1 - ((15 / 100) * FEqu[1])));

        MoveTo(Rect.Left + 8 + 10, Rect.Bottom - 12);
        LineTo(Rect.Left + 8 + 10, Round(Rect.Bottom - 12 - 1 - ((15 / 100) * FEqu[2])));

        MoveTo(Rect.Left + 8 + 15, Rect.Bottom - 12);
        LineTo(Rect.Left + 8 + 15, Round(Rect.Bottom - 12 - 1 - ((15 / 100) * FEqu[3])));

        MoveTo(Rect.Left + 8 + 20, Rect.Bottom - 12);
        LineTo(Rect.Left + 8 + 20, Round(Rect.Bottom - 12 - 1 - ((15 / 100) * FEqu[4])));
      end;
    end
    else if Hot then
      StretchDraw(Rect, FPlayImage);
  end;
end;

procedure TFormMain.DrawAlbumInfo(Target: TCanvas; List: TPlaylists; Index: Integer; Rect: TRect);
var
  TxtRect: TRect;
  S: string;
begin
  with Target do
  begin
    Font.Name := 'Roboto';
    Font.Size := 9;
    TxtRect := Rect;
    TxtRect.Bottom := TxtRect.CenterPoint.Y;
    TxtRect.Inflate(-1, -1);
    TxtRect.Right := TxtRect.Right - 40;
    S := List[Index].Title;
    Font.Color := FFontColor;
    TextRect(TxtRect, S, [tfSingleLine, tfBottom, tfLeft, tfEndEllipsis]);

    TxtRect := Rect;
    TxtRect.Top := TxtRect.CenterPoint.Y;
    TxtRect.Inflate(-1, -1);
    TxtRect.Right := TxtRect.Right - 40;
    S := List[Index].Description;
    Font.Color := $00939393;
    TextRect(TxtRect, S, [tfSingleLine, tfTop, tfLeft, tfEndEllipsis]);

    TxtRect := Rect;
    TxtRect.Inflate(-4, -4);
    TxtRect.Left := TxtRect.Right - 40;
    S := List[Index].Count.ToString;
    TextRect(TxtRect, S, [tfSingleLine, tfVerticalCenter, tfCenter]);
  end;
end;

procedure TFormMain.TableExCurrentDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  TxtRect: TRect;
  S: string;
begin
  with TableExCurrent.Canvas do
  begin
    if (not FCurrentList.IndexIn(ARow)) or (FCurrentList.IsUpdate) then
    begin
      if ACol = 1 then
      begin
        TxtRect := Rect;
        TxtRect.Left := 0;
        TxtRect.Inflate(-4, -4);
        S := 'Нет аудио';
        Font.Style := [];
        TextRect(TxtRect, S, [tfSingleLine, tfVerticalCenter, tfCenter]);
      end;
      Exit;
    end;
    case ACol of
      0:
        DrawAudioThumb(TableExCurrent.Canvas, FCurrentList, ARow, Rect, TableExCurrent.ItemUnderMouse = ARow);
      1:
        DrawAudioInfo(TableExCurrent.Canvas, FCurrentList, ARow, Rect);
    end;
  end;
end;

procedure TFormMain.TableExCurrentItemClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
begin
  if not Play(Index) then
    PlayNext(True);
end;

procedure TFormMain.TableExFriendsDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  TxtRect: TRect;
  S: string;
begin
  with TableExFriends.Canvas do
  begin
    if (not FFriends.IndexIn(ARow)) or (FFriends.IsUpdate) or (TableExFriends.ItemCount <= 0) then
    begin
      if ACol = 1 then
      begin
        TxtRect := Rect;
        TxtRect.Left := 0;
        TxtRect.Inflate(-4, -4);
        S := 'Загрузка...';
        Font.Style := [];
        TextRect(TxtRect, S, [tfSingleLine, tfVerticalCenter, tfCenter]);
      end;
      Exit;
    end;
    case ACol of
      0:
        begin
          Rect.Inflate(-7, -7);
          if Assigned(FFriends[ARow].Image) then
            StretchDraw(Rect, FFriends[ARow].Image.Graphic)
          else
            StretchDraw(Rect, FAvatarDef);
        end;
      1:
        begin
          Font.Name := 'Roboto';
          Font.Size := 9;
          TxtRect := Rect;
          TxtRect.Bottom := TxtRect.CenterPoint.Y;
          TxtRect.Inflate(-1, -1);
          TxtRect.Right := TxtRect.Right - 40;
          S := FFriends[ARow].FirstName + ' ' + FFriends[ARow].LastName;
          Font.Color := FFontColor;
          TextRect(TxtRect, S, [tfSingleLine, tfBottom, tfLeft, tfEndEllipsis]);

          TxtRect := Rect;
          TxtRect.Top := TxtRect.CenterPoint.Y;
          TxtRect.Inflate(-1, -1);
          TxtRect.Right := TxtRect.Right - 40;
          S := FFriends[ARow].Status;
          Font.Color := $00939393;
          TextRect(TxtRect, S, [tfSingleLine, tfTop, tfLeft, tfEndEllipsis]);

          if not FFriends[ARow].CanSeeAudio then
          begin
            TxtRect := TRect.Create(TPoint.Zero, 100, 20);
            TxtRect.SetLocation(Rect.Right - (TxtRect.Width + 60), Rect.CenterPoint.Y - TxtRect.Height div 2);
            S := 'Недоступна';
            Font.Color := clWhite;
            Pen.Color := clMaroon;
            Brush.Color := $005A5AAC;
            RoundRect(TxtRect, 4, 4);
            TextRect(TxtRect, S, [tfSingleLine, tfVerticalCenter, tfCenter]);
          end;
        end;
    end;
  end;
end;

procedure TFormMain.SetCurrentUser(User: TVkProfile);
begin
  Caption := 'VK Audio Player [' + User.FullName + ']';
end;

procedure TFormMain.SetAvatar(Url: string);
var
  Mem: TMemoryStream;
  Png: TPngImage;
  Pic: TPicture;
  UseDefault: Boolean;
begin
  UseDefault := True;
  Mem := DownloadURL(Url);
  Pic := TPicture.Create;
  try
    if Mem.Size > 0 then
    begin
      try
        Pic.LoadFromStream(Mem);
        Png := CreateAvatar(Pic.Graphic, FormMain.FAvatarMask);
        ImageAvatar.Picture.Assign(Png);
        Png.Free;
        UseDefault := False;
      except
      end;
    end;
    if UseDefault then
    begin
      ImageAvatar.Picture.Assign(FAvatarDef);
    end;
  finally
    Pic.Free;
    Mem.Free;
  end;
end;

procedure TFormMain.TableExFriendsItemClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
var
  Params: TVkParamsAudioGet;
  Audios: TVkAudios;
  User: TVkProfile;
begin
  if not FFriends.IndexIn(Index) then
    Exit;
  if FChangingUser then
    Exit;
  FChangingUser := True;
  try
    Params.OwnerId(FFriends[Index].Id);
    Params.Count(1);
    if VK.Audio.Get(Audios, Params) then
    begin
      try
        FVkId := FFriends[Index].Id;
        ButtonFlatMyMusic.Show;
        if Length(Audios.Items) <= 0 then
          ShowMessage('У выбранного пользователя нет музыки')
        else
          OpenMyMusic;
      finally
        Audios.Free;
      end;
      ReloadItems;
      if VK.Users.Get(User, FVkId) then
      begin
        SetCurrentUser(User);
        User.Free;
      end;
    end
    else
      ShowMessage('Музыка закрыта');
  finally
    FChangingUser := False;
  end;
end;

procedure TFormMain.TableExMyMusicDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  TxtRect: TRect;
  S: string;
begin
  with TableExMyMusic.Canvas do
  begin
    if (not FMyMusic.IndexIn(ARow)) or (FMyMusic.IsUpdate) or (TableExMyMusic.ItemCount <= 0) then
    begin
      if ACol = 1 then
      begin
        TxtRect := Rect;
        TxtRect.Left := 0;
        TxtRect.Inflate(-4, -4);
        if FLoadMusic.IsWorking or FAppLoading then
          S := 'Загрузка...'
        else
          S := 'Нет аудио';
        Font.Style := [];
        TextRect(TxtRect, S, [tfSingleLine, tfVerticalCenter, tfCenter]);
      end;
      Exit;
    end;
    case ACol of
      0:
        DrawAudioThumb(TableExMyMusic.Canvas, FMyMusic, ARow, Rect, TableExMyMusic.ItemUnderMouse = ARow);
      1:
        DrawAudioInfo(TableExMyMusic.Canvas, FMyMusic, ARow, Rect);
    end;
  end;
end;

procedure TFormMain.FillCurrentFromMyMusic;
var
  i: Integer;
begin
  FLoadPlaylist.Stop;
  FLoadPlaylist.Await;

  FActivePlaylist := -1;
  FCurrentList.BeginUpdate;
  FCurrentList.Clear;
  for i := 0 to FMyMusic.Count - 1 do
  begin
    FCurrentList.Add(FMyMusic[i]);
  end;
  FCurrentList.EndUpdate;
  LabelAudioCount.Caption := 'Аудиозаписей: ' + FCurrentList.Count.ToString;
end;

procedure TFormMain.FillCurrentFromPlaylist(Index: Integer);
begin
  if not FPlaylists.IndexIn(Index) then
    Exit;
  FActivePlaylist := FPlaylists[Index].Id;
  FLoadPlaylist.Execute(FPlaylists[Index].OwnerId, FPlaylists[Index].Id);
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

procedure TFormMain.SetInfo(Audio: TAudio);
begin
  LabelArtist.Caption := Audio.Artist;
  LabelTitle.Caption := Audio.Title;
  if Assigned(Audio.Image) then
  begin
    ImageAlbum.Picture.Assign(Audio.Image);
    ImageAlbum.Hint := Audio.AlbumPhoto;
  end
  else
  begin
    ImageAlbum.Picture.Assign(FAlbumThumbs.Items[0].Image);
    ImageAlbum.Hint := '';
  end;
  SetPlayerInfo(Audio);
end;

procedure TFormMain.SetPlayerState(IsPlay: Boolean);
begin
  FormPlayer.IsPlay := IsPlay;
end;

procedure TFormMain.SetPlayerInfo(Audio: TAudio);
begin
  FormPlayer.LabelTitle.Caption := Audio.Artist + ' - ' + Audio.Title;
  FormPlayer.ImageAlbum.Picture.Assign(ImageAlbum.Picture);
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
      if FPlayer.IsPlay then
        FPlayer.Pause
      else if not FPlayer.Resume then
        FPlayer.Play;
      FOpenning := False;
      Exit(True);
    end;
    TableExCurrent.ItemIndex := Index;
    Audio := FCurrentList[Index];
    SetInfo(Audio);
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
        FPlayer.Stop;
        Exit;
      end;
    end;
    if not Audio.Url.IsEmpty then
    begin
      FFailCount := 0;
      FPlayer.SetStreamURL(Audio.Url);
      IsDone := False;
      FRes := False;
      TThread.CreateAnonymousThread(
        procedure
        begin
          FRes := FPlayer.Play;
          IsDone := True;
        end).Start;
      while not IsDone do
        Application.ProcessMessages;
      Result := FRes;
    end
    else
    begin
      FPlayer.Stop;
      Inc(FFailCount);
    end;
  end;
  FOpenning := False;
end;

procedure TFormMain.ButtonFlatNextClick(Sender: TObject);
begin
  PlayNext(True);
end;

procedure TFormMain.ButtonFlatPlayPauseClick(Sender: TObject);
begin
  if FPlayer.IsPlay then
    FPlayer.Pause
  else if FPlayingId >= 0 then
    FPlayer.Resume
  else if FCurrentList.Count <= 0 then
  begin
    FillCurrentFromMyMusic;
    Play(0);
  end
  else
    Play(0);
end;

procedure TFormMain.ButtonFlatPrevClick(Sender: TObject);
begin
  PlayPrev(True);
end;

procedure TFormMain.ButtonFlatRepeatClick(Sender: TObject);
begin
  NextRepeat;
end;

procedure TFormMain.ButtonFlatShuffleClick(Sender: TObject);
begin
  Shuffle;
end;

procedure TFormMain.NextRepeat;
begin
  case FPlayRepeat of
    prNone:
      SetRepeat(prAll);
    prAll:
      SetRepeat(prOne);
    prOne:
      SetRepeat(prNone);
  end;
end;

procedure TFormMain.SetRepeat(Value: TPlayRepeat);
begin
  FPlayRepeat := Value;
  case Value of
    prNone:
      ButtonFlatRepeat.ImageIndex := 6;
    prAll:
      ButtonFlatRepeat.ImageIndex := 9;
    prOne:
      ButtonFlatRepeat.ImageIndex := 10;
  end;
end;

procedure TFormMain.Shuffle;
var
  i, n: Integer;
begin
  for i := 0 to FCurrentList.Count - 1 do
  begin
    n := RandomRange(0, FCurrentList.Count - 1);
    FCurrentList.Move(i, n);
  end;
  FCurrentList.UpdateTable;

  TableExCurrent.ItemIndex := FCurrentList.Find(FPlayingId);
end;

procedure TFormMain.SearchInList(List: IListFind; Query: string);
var
  Id: Integer;
begin
  if Query.IsEmpty then
    Exit;
  if not Assigned(List) then
    Exit;
  Id := List.Find(EditSearch.Text, List.GetFirstTableSelectedIndex + 1);
  if List.IndexIn(Id) then
    List.SelectInTable(Id);
end;

function TFormMain.GetActiveList: IListFind;
begin
  if PageControl.ActivePage = TabSheetCurrent then
    Exit(FCurrentList);
  if PageControl.ActivePage = TabSheetMyMusic then
    Exit(FMyMusic);
  if PageControl.ActivePage = TabSheetPlaylists then
    Exit(FPlaylists);
  if PageControl.ActivePage = TabSheetSearch then
    Exit(FSearchList);
  if PageControl.ActivePage = TabSheetFriends then
    Exit(FFriends);
end;

procedure TFormMain.ButtonFlatSearchClick(Sender: TObject);
begin
  if CheckBoxFlatSerachType.Checked then
  begin
    SearchInList(GetActiveList, EditSearch.Text);
  end
  else
  begin
    Search(EditSearch.Text);
  end;
end;

procedure TFormMain.ButtonFlatSearchTabClick(Sender: TObject);
begin
  OpenSearch;
end;

procedure TFormMain.Search(Query: string);
begin
  if Query.IsEmpty then
    Exit;
  ButtonFlatSearchTab.Show;
  ButtonFlatSearchTab.Click;
  FLoadSearch.Execute(Query);
end;

procedure TFormMain.ButtonFlatCurrentClick(Sender: TObject);
begin
  OpenCurrentPlaylist;
end;

procedure TFormMain.OpenPlaylists;
begin
  //
  ButtonFlatNavClick(ButtonFlatPlaylists);
  PageControl.ActivePage := TabSheetPlaylists;
end;

procedure TFormMain.OpenSearch;
begin
  //
  ButtonFlatNavClick(ButtonFlatSearchTab);
  PageControl.ActivePage := TabSheetSearch;
end;

procedure TFormMain.OpenCurrentPlaylist;
begin
  //
  ButtonFlatNavClick(ButtonFlatCurrent);
  PageControl.ActivePage := TabSheetCurrent;
end;

procedure TFormMain.OpenFriends;
begin
  //
  ButtonFlatNavClick(ButtonFlatFriends);
  PageControl.ActivePage := TabSheetFriends;
end;

procedure TFormMain.OpenMyMusic;
begin
  //
  ButtonFlatNavClick(ButtonFlatMy);
  PageControl.ActivePage := TabSheetMyMusic;
end;

procedure TFormMain.ButtonFlatDownloadClick(Sender: TObject);
var
  Url, FileName: string;
begin
  if FCurrentList.IndexIn(TableExCurrent.ItemIndex) then
  begin
    SaveDialogMp3.FileName := FCurrentList[TableExCurrent.ItemIndex].Artist + ' - ' + FCurrentList[TableExCurrent.ItemIndex].Title
      + '.mp3';
    if SaveDialogMp3.Execute(Handle) then
    begin
      Url := FCurrentList[TableExCurrent.ItemIndex].Url;
      FileName := SaveDialogMp3.FileName;
      TThread.CreateAnonymousThread(
        procedure
        begin
          DownloadURL(Url, FileName + '.download');
          RenameFile(FileName + '.download', FileName);
        end).Start;
    end;
  end;
end;

procedure TFormMain.ButtonFlatFriendsClick(Sender: TObject);
begin
  OpenFriends;
end;

procedure TFormMain.ButtonFlatMyClick(Sender: TObject);
begin
  OpenMyMusic;
end;

procedure TFormMain.ButtonFlatMyMouseEnter(Sender: TObject);
var
  Button: TButtonFlat absolute Sender;
begin
  ShapeHotButton.Left := Button.Left;
  ShapeHotButton.Width := Button.Width;
  ShapeHotButton.Show;
end;

procedure TFormMain.ButtonFlatNavClick(Sender: TObject);
var
  Button: TButtonFlat absolute Sender;
begin
  FNeedActLeft := Button.Left;
  FNeedActWidth := Button.Width;
  TimerAnimate.Enabled := True;
end;

procedure TFormMain.ButtonFlatPlaylistsClick(Sender: TObject);
begin
  OpenPlaylists;
end;

procedure TFormMain.ButtonFlatMyMouseLeave(Sender: TObject);
begin
  ShapeHotButton.Hide;
end;

procedure TFormMain.ButtonFlatMyMusicClick(Sender: TObject);
var
  Params: TVkParamsAudioGet;
  Audios: TVkAudios;
  User: TVkProfile;
begin
  ButtonFlatMyMusic.Hide;
  FVkId := FVkIdCurrent;
  Params.OwnerId(FVkId);
  Params.Count(1);
  if VK.Audio.Get(Audios, Params) then
  begin
    Audios.Free;
    ReloadItems;
    if VK.Users.Get(User, FVkId) then
    begin
      SetCurrentUser(User);
      User.Free;
    end;
  end;
end;

procedure TFormMain.ClearInfo;
begin
  LabelArtist.Caption := 'Артист';
  LabelTitle.Caption := 'Название';
  LabelTime.Caption := '0:00';
end;

procedure TFormMain.TableExMyMusicItemClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
begin
  FillCurrentFromMyMusic;
  if not Play(Index) then
    PlayNext(True);
end;

procedure TFormMain.TableExPlaylistsDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  TxtRect: TRect;
  S: string;
begin
  with TableExPlaylists.Canvas do
  begin
    if (not FPlaylists.IndexIn(ARow)) or (FPlaylists.IsUpdate) or (TableExPlaylists.ItemCount <= 0) then
    begin
      if ACol = 1 then
      begin
        TxtRect := Rect;
        TxtRect.Left := 0;
        TxtRect.Inflate(-4, -4);
        if FLoadPlaylists.IsWorking or FAppLoading then
          S := 'Загрузка...'
        else
          S := 'Пусто';
        Font.Style := [];
        TextRect(TxtRect, S, [tfSingleLine, tfVerticalCenter, tfCenter]);
      end;
      Exit;
    end;
    case ACol of
      0:
        DrawAlbumThumb(TableExPlaylists.Canvas, FPlaylists, ARow, Rect, TableExPlaylists.ItemUnderMouse = ARow);
      1:
        DrawAlbumInfo(TableExPlaylists.Canvas, FPlaylists, ARow, Rect);
    end;
  end;
end;

procedure TFormMain.TableExPlaylistsItemClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
begin
  if FPlaylists.IndexIn(Index) then
  begin
    FillCurrentFromPlaylist(Index);
  end;
end;

procedure TFormMain.TableExSearchDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  TxtRect: TRect;
  S: string;
begin
  with TableExSearch.Canvas do
  begin
    if (not FSearchList.IndexIn(ARow)) or (FSearchList.IsUpdate) or (TableExSearch.ItemCount <= 0) then
    begin
      if ACol = 1 then
      begin
        TxtRect := Rect;
        TxtRect.Left := 0;
        TxtRect.Inflate(-4, -4);
        if FLoadSearch.IsWorking or FAppLoading then
          S := 'Загрузка...'
        else
          S := 'Нет аудио';
        Font.Style := [];
        TextRect(TxtRect, S, [tfSingleLine, tfVerticalCenter, tfCenter]);
      end;
      Exit;
    end;
    case ACol of
      0:
        DrawAudioThumb(TableExSearch.Canvas, FSearchList, ARow, Rect, TableExSearch.ItemUnderMouse = ARow);
      1:
        DrawAudioInfo(TableExSearch.Canvas, FSearchList, ARow, Rect);
    end;
  end;
end;

procedure TFormMain.TableExSearchItemClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
begin
  FillCurrentFromSearch;
  if not Play(Index) then
    PlayNext(True);
end;

procedure TFormMain.TaskbarThumbButtonClick(Sender: TObject; AButtonID: Integer);
begin
  case AButtonID of
    0:
      PlayPrev(True);
    1:
      ButtonFlatPlayPauseClick(nil);
    2:
      PlayNext(True);
  end;
end;

procedure TFormMain.FillCurrentFromSearch;
var
  i: Integer;
begin
  FActivePlaylist := -1;
  FCurrentList.BeginUpdate;
  FCurrentList.Clear;
  for i := 0 to FSearchList.Count - 1 do
  begin
    FCurrentList.Add(FSearchList[i]);
  end;
  FCurrentList.EndUpdate;
  LabelAudioCount.Caption := 'Аудиозаписей: ' + FCurrentList.Count.ToString;
end;

procedure TFormMain.RefillEqu;
const
  DrawRes = 1;
  PeakFall = 1;
  SpecHeight = 20;
  LineFall = 3;
var
  i, YPos, it: LongInt;
  YVal: Single;
  FFTFallOff: array[0..128] of Integer;
  FFTData: TFFTData;
begin
  if FPlayer.GetData(FFTData) then
  begin
    for i := 0 to 128 do
    begin
      FFTFallOff[i] := 0;
    end;
    for i := 0 to 128 do
    begin
      YVal := Abs(FFTData[(i * DrawRes) + 5]);
      YPos := Trunc((YVal) * 500);
      if YPos > SpecHeight then
        YPos := SpecHeight;

      if YPos >= FFTFallOff[i] then
        FFTFallOff[i] := YPos
      else
        FFTFallOff[i] := FFTFallOff[i] - LineFall;

      if (SpecHeight - FFTFallOff[i]) > SpecHeight then
        FFTFallOff[i] := 100;
      it := Max(1, Min(4, (Trunc(i / 32) + 1)));
      FEqu[it] := (((100 / SpecHeight) * Max(0, Min(100, FFTFallOff[i]))) + FEqu[it]) / 2;
    end;
    if PageControl.ActivePage = TabSheetCurrent then
      TableExCurrent.Repaint;
    if PageControl.ActivePage = TabSheetMyMusic then
      TableExMyMusic.Repaint;
    if PageControl.ActivePage = TabSheetPlaylists then
      TableExPlaylists.Repaint;
    if PageControl.ActivePage = TabSheetSearch then
      TableExSearch.Repaint;
  end
  else
  begin
    FEqu[1] := 0;
    FEqu[2] := 0;
    FEqu[3] := 0;
    FEqu[4] := 0;
  end;
end;

procedure TFormMain.TimerAnimateTimer(Sender: TObject);
begin
  if Abs(ShapeActivePage.Left - FNeedActLeft) > 10 then
  begin
    if ShapeActivePage.Left > FNeedActLeft then
      ShapeActivePage.Left := ShapeActivePage.Left - 10
    else
      ShapeActivePage.Left := ShapeActivePage.Left + 10;
  end
  else
    ShapeActivePage.Left := FNeedActLeft;

  if Abs(ShapeActivePage.Width - FNeedActWidth) > 10 then
  begin
    if ShapeActivePage.Width > FNeedActWidth then
      ShapeActivePage.Width := ShapeActivePage.Width - 10
    else
      ShapeActivePage.Width := ShapeActivePage.Width + 10;
  end
  else
    ShapeActivePage.Width := FNeedActWidth;
  if (ShapeActivePage.Left = FNeedActLeft) and (ShapeActivePage.Width = FNeedActWidth) then
    TimerAnimate.Enabled := False;
end;

procedure TFormMain.TimerEquTimer(Sender: TObject);
begin
  RefillEqu;
end;

procedure TFormMain.TimerRefreshTimer(Sender: TObject);
begin
  if not FPlayer.IsInit then
    Exit;

  if FPlayer.IsPlay then
  begin
    if FShowLeftTime then
      LabelTime.Caption := FPlayer.PositionTimeLeft
    else
      LabelTime.Caption := FPlayer.PositionTime;
    ButtonFlatPlayPause.ImageIndex := 4;
  end
  else
    ButtonFlatPlayPause.ImageIndex := 0;
  TrackbarPosition.SecondPosition := FPlayer.BufferringPercent;
  TrackbarPosition.Position := FPlayer.PositionPercent;
  TrackbarVolume.Position := FPlayer.VolumeChannel;
  SetPlayerState(FPlayer.IsPlay);
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

procedure TFormMain.Quit;
begin
  FTerminating := True;
  TimerEqu.Enabled := False;
  TimerRefresh.Enabled := False;
  Await;
  Application.Terminate;
end;

procedure TFormMain.UpdateImages;
var
  i: Integer;
  Item: TAudio;
begin
  for i := 0 to FCurrentList.Count - 1 do
  begin
    if FCurrentList[i].AlbumPhoto = Url then
    begin
      Item := FCurrentList[i];
      Item.Image := Image;
      FCurrentList[i] := Item;
    end;
  end;
end;

procedure TFormMain.FOnAudioChangeState(Sender: TObject);
begin
  if FPlayer.IsPlay then
  begin
    Taskbar.TaskBarButtons.Items[1].Icon.Assign(FPauseIco);
    Taskbar.TaskBarButtons.Items[1].Hint := 'Приостановить';
  end
  else
  begin
    Taskbar.TaskBarButtons.Items[1].Icon.Assign(FPlayIco);
    Taskbar.TaskBarButtons.Items[1].Hint := 'Воспроизвести';
  end;
end;

procedure TFormMain.FOnAudioEnd(Sender: TObject);
begin
  if FTerminating then
    Exit;
  PlayNext(False);
end;

procedure TFormMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := False;
  Quit;
end;

procedure TFormMain.CreateLoaders;
begin
  {$REGION 'FLoadUsers'}
  FLoadUsers := TLoadThread.Create(
    procedure
    begin
      TableExFriends.Enabled := False;
      TableExFriends.ItemCount := 0;
      TableExFriends.Repaint;
    end,
    function(LT: TLoadThread): Boolean
    var
      Users: TVkProfiles;
      Friend: TFriend;
      i: Integer;
    begin
      FFriends.BeginUpdate;
      FFriends.Clear;
      Result := False;
      try
        if VK.Friends.Get(Users, [TVkExtendedField.NickName, TVkExtendedField.Sex, TVkExtendedField.Photo50, TVkExtendedField.Status, TVkExtendedField.CanSeeAudio], TVkFriendsOrder.Name) then
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
              Friend.CanSeeAudio := Users.Items[i].CanSeeAudio;
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
        FFriends.EndUpdate;
      end;
    end,
    procedure(Complete: Boolean)
    begin
      TableExFriends.Enabled := True;
      if Complete then
        FLoadPicFriends.Execute;
    end);
  {$ENDREGION}
  {$REGION 'FLoadPlaylist'}
  FLoadPlaylist := TLoadPlaylist.Create(
    procedure
    begin
      TableExCurrent.Enabled := False;
      TableExCurrent.ItemCount := 0;
      TableExCurrent.Repaint;
    end,
    function(LT: TLoadThread; OwnerId, Id: Integer): Boolean
    var
      i: Integer;
      Audios: TVkAudios;
      Params: TVkParamsAudioGet;
      Audio: TAudio;
    begin
      FCurrentList.BeginUpdate;
      FCurrentList.Clear;
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
                FCurrentList.Add(Audio);
              end;
            end;
          finally
            Audios.Free;
          end;
          Result := not LT.NeedStop;
        end;
      finally
        FCurrentList.EndUpdate;
      end;
    end,
    procedure(Complete: Boolean)
    begin
      TableExCurrent.Enabled := True;
      Play(0);
      LabelAudioCount.Caption := 'Аудиозаписей: ' + FCurrentList.Count.ToString;
      if Complete then
        FLoadPicCurrent.Execute;
    end);
  {$ENDREGION}
  {$REGION 'FLoadPlaylists'}
  FLoadPlaylists := TLoadThread.Create(
    procedure
    begin
      TableExPlaylists.Enabled := False;
      TableExPlaylists.ItemCount := 0;
      TableExPlaylists.Repaint;
    end,
    function(LT: TLoadThread): Boolean
    var
      i: Integer;
      Playlists: TVkPlaylists;
      Playlist: TPlaylist;
      DefImg: Boolean;
    begin
      Result := False;
      FPlaylists.BeginUpdate;
      FPlaylists.Clear;
      try
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
              Playlist.Image := FAlbumThumbs.GetImage(Playlist.AlbumPhoto, DefImg);
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
        FPlaylists.EndUpdate;
      end;
    end,
    procedure(Complete: Boolean)
    begin
      TableExPlaylists.Enabled := True;
    end);
  {$ENDREGION}
  {$REGION 'FLoadMusic'}
  FLoadMusic := TLoadThread.Create(
    procedure
    begin
      TableExMyMusic.ItemCount := 0;
      TableExMyMusic.Repaint;
      TableExMyMusic.Enabled := False;
    end,
    function(LT: TLoadThread): Boolean
    var
      i: Integer;
      Audios: TVkAudios;
      Audio: TAudio;
    begin
      Result := False;
      FLoadPicMusic.Stop;
      FLoadPicMusic.Await(False);

      FMyMusic.BeginUpdate;
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
        FMyMusic.EndUpdate;
      end;
    end,
    procedure(Complete: Boolean)
    begin
      TableExMyMusic.Enabled := True;
      if Complete then
        FLoadPicMusic.Execute;
    end);
  {$ENDREGION}
  {$REGION 'FLoadSearch'}
  FLoadSearch := TLoadSearch.Create(
    procedure
    begin
      TableExSearch.Enabled := False;
      TableExSearch.ItemCount := 0;
      TableExSearch.Repaint;
    end,
    function(LT: TLoadThread; Query: string): Boolean
    var
      i: Integer;
      Audios: TVkAudios;
      Audio: TAudio;
    begin
      Result := False;
      FLoadPicSearch.Stop;
      FLoadPicSearch.Await(False);

      FSearchList.BeginUpdate;
      try
        FSearchList.Clear;
        if VK.Audio.Search(Audios, Query) then
        begin
          try
            for i := Low(Audios.Items) to High(Audios.Items) do
            begin
              if LT.NeedStop then
                Break;
              Audio.Fill(Audios.Items[i]);
              FSearchList.Add(Audio);
            end;
          finally
            Audios.Free;
          end;
          Result := not LT.NeedStop;
        end;
      finally
        FSearchList.EndUpdate;
      end;
    end,
    procedure(Complete: Boolean)
    begin
      TableExSearch.Enabled := True;
      if Complete then
        FLoadPicSearch.Execute;
    end);
  {$ENDREGION}
  {$REGION 'FLoadPicCurrent'}
  FLoadPicCurrent := TLoadThread.Create(nil,
    function(LT: TLoadThread): Boolean
    var
      i: Integer;
      Item: TAudio;
      DefImg: Boolean;
    begin
      Result := False;
      for i := 0 to FCurrentList.Count - 1 do
      begin
        if LT.NeedStop then
          Break;
        Item := FCurrentList[i];
        if not Assigned(Item.Image) then
        begin
          if not Item.AlbumPhoto.IsEmpty then
          begin
            Item.Image := FAlbumThumbs.GetImage(Item.AlbumPhoto, DefImg);
            if not DefImg then
            begin
              if ImageAlbum.Hint = Item.AlbumPhoto then
              begin
                ImageAlbum.Picture.Assign(Item.Image);
              end;
            end;
            if LT.NeedStop then
              Break;
            TThread.Synchronize(TThread.CurrentThread,
              procedure
              begin
                FCurrentList[i] := Item;
                FCurrentList.UpdateTable;
              end);
          end
        end;
      end;
    end, nil);
  {$ENDREGION}
  {$REGION 'FLoadPicFriends'}
  FLoadPicFriends := TLoadThread.Create(nil,
    function(LT: TLoadThread): Boolean
    var
      i: Integer;
      Item: TFriend;
      DefImg: Boolean;
    begin
      Result := False;
      for i := 0 to FFriends.Count - 1 do
      begin
        if LT.NeedStop then
          Break;
        Item := FFriends[i];
        if not Assigned(Item.Image) then
        begin
          if not Item.AlbumPhoto.IsEmpty then
          begin
            Item.Image := FAlbumThumbs.GetImage(Item.AlbumPhoto, DefImg, True);
            if not DefImg then
              UpdateImages(Item.AlbumPhoto, Item.Image);
            if LT.NeedStop then
              Break;
            TThread.Synchronize(TThread.CurrentThread,
              procedure
              begin
                FFriends[i] := Item;
                FFriends.UpdateTable;
              end);
          end
        end;
      end;
    end, nil);
  {$ENDREGION}
  {$REGION 'FLoadPicSearch'}
  FLoadPicSearch := TLoadThread.Create(nil,
    function(LT: TLoadThread): Boolean
    var
      i: Integer;
      Item: TAudio;
      DefImg: Boolean;
    begin
      Result := False;
      for i := 0 to FSearchList.Count - 1 do
      begin
        if LT.NeedStop then
          Break;
        Item := FSearchList[i];
        if not Assigned(Item.Image) then
        begin
          if not Item.AlbumPhoto.IsEmpty then
          begin
            Item.Image := FAlbumThumbs.GetImage(Item.AlbumPhoto, DefImg);
            if not DefImg then
              UpdateImages(Item.AlbumPhoto, Item.Image);
            if LT.NeedStop then
              Break;
            TThread.Synchronize(TThread.CurrentThread,
              procedure
              begin
                FSearchList[i] := Item;
                FSearchList.UpdateTable;
              end);
          end
        end;
      end;
    end, nil);
  {$ENDREGION}
  {$REGION 'FLoadPicMusic'}
  FLoadPicMusic := TLoadThread.Create(nil,
    function(LT: TLoadThread): Boolean
    var
      i: Integer;
      Item: TAudio;
      DefImg: Boolean;
    begin
      Result := False;
      for i := 0 to FMyMusic.Count - 1 do
      begin
        if LT.NeedStop then
          Break;
        Item := FMyMusic[i];
        if not Assigned(Item.Image) then
        begin
          if not Item.AlbumPhoto.IsEmpty then
          begin
            Item.Image := FAlbumThumbs.GetImage(Item.AlbumPhoto, DefImg);
            if not DefImg then
              UpdateImages(Item.AlbumPhoto, Item.Image);
            if LT.NeedStop then
              Break;
            TThread.Synchronize(TThread.CurrentThread,
              procedure
              begin
                FMyMusic[i] := Item;
                FMyMusic.UpdateTable;
              end);
          end
        end;
      end;
    end, nil);
  {$ENDREGION}
end;

procedure TFormMain.SetColors(IsDark: Boolean);
var
  i: Integer;
  Stream: TResourceStream;
  AColor: TColor;
  AFont: TColor;
  ButtonColorHot: TColor;
  ButtonColorNormal: TColor;
  ColorTableHot: TColor;
  ColorTableSel: TColor;

  procedure SetTabsColor(Button: TButtonFlat);
  begin
    Button.ColorNormal := AColor;
    Button.ColorOver := AColor;
    Button.ColorPressed := AColor;
    Button.Font.Color := AFont;
    Button.FontOver.Color := AFont;
    Button.FontDown.Color := AFont;
  end;

  procedure SetTableColor(Table: TTableEx);
  begin
    Table.Color := AColor;
    Table.LineColor := AColor;
    Table.LineColorXor := AColor;
    Table.LineHotColor := ColorTableHot;
    Table.LineSelColor := ColorTableSel;

    Table.FontLine.Color := AFont;
    Table.FontHotLine.Color := AFont;
    Table.FontSelLine.Color := AFont;
  end;

  procedure SetTrackbarColor(TrackBar: ThTrackbar);
  begin
    if IsDark then
    begin
      TrackBar.Color := PanelPlayer.Color;
      TrackBar.ColorScale := $00262525;
      TrackBar.ColorPos := $00838383;
      TrackBar.ColorBuf := $003D3C3A;
      TrackBar.ColorPosBtn := $00838383;
    end
    else
    begin
      TrackBar.Color := PanelPlayer.Color;
      TrackBar.ColorScale := $00ECE8E7;
      TrackBar.ColorPos := $00B88151;
      TrackBar.ColorBuf := $00DED6D1;
      TrackBar.ColorPosBtn := $00B88151;
    end;
  end;

begin
  if IsDark then
  begin
    AColor := clBlack;
    AFont := clWhite;

    HintPanel.Color := ColorLighterOr(AColor, 20);
    HintPanel.BorderColor := AColor;
    HintPanel.Font.Color := AFont;

    ColorTableHot := ColorLighterOr(AColor, 20);
    ColorTableSel := ColorLighterOr(AColor, 40);

    Stream := TResourceStream.Create(HInstance, 'blank_dark', RT_RCDATA);
    FAlbumThumbs[0].Image.LoadFromStream(Stream);

    Stream.Free;
    FAvatarDef.LoadFromResourceName(HInstance, 'def_avatar_dark');
    ButtonColorHot := $00757575;
    ButtonColorNormal := $00A2A2A2;

    PanelPlayer.Color := $00151515;

    ButtonFlatSearchBG.ColorNormal := AColor;
    ButtonFlatSearchBG.ColorPressed := AColor;
    ButtonFlatSearchBG.ColorOver := AColor;
    ButtonFlatSearchBG.BorderColor := ColorLighterOr(AColor, 15);

    ShapeActivePage.Brush.Color := ColorLighterOr(AColor, 30);
    ShapeActivePage.Pen.Color := ColorLighterOr(AColor, 30);

    ShapeHotButton.Brush.Color := ColorLighterOr(AColor, 15);
    ShapeHotButton.Pen.Color := ColorLighterOr(AColor, 15);
  end
  else
  begin
    AFont := $00242424;
    AColor := clWhite;

    HintPanel.Color := ColorLighterOr(AColor, 10);
    HintPanel.BorderColor := AColor;
    HintPanel.Font.Color := AFont;

    ColorTableHot := $00F7F4F2;
    ColorTableSel := $00F1EDE9;

    Stream := TResourceStream.Create(HInstance, 'blank', RT_RCDATA);
    FAlbumThumbs[0].Image.LoadFromStream(Stream);
    Stream.Free;
    FAvatarDef.LoadFromResourceName(HInstance, 'def_avatar');
    ButtonColorHot := $00ACA09A;
    ButtonColorNormal := $00B58251;

    PanelPlayer.Color := $00FCFBFA;

    ButtonFlatSearchBG.ColorNormal := AColor;
    ButtonFlatSearchBG.ColorPressed := AColor;
    ButtonFlatSearchBG.ColorOver := AColor;
    ButtonFlatSearchBG.BorderColor := ColorLighterOr(AColor, 15);

    ShapeActivePage.Brush.Color := $00B88151;
    ShapeActivePage.Pen.Color := $00B88151;

    ShapeHotButton.Brush.Color := $00DBD2CA;
    ShapeHotButton.Pen.Color := $00DBD2CA;
  end;

  PanelTrackSinger.Color := PanelPlayer.Color;
  PanelTrackTime.Color := PanelPlayer.Color;
  PanelVolume.Color := PanelPlayer.Color;
  PanelUser.Color := PanelPlayer.Color;

  FStyleColor := AColor;
  FFontColor := AFont;
  FIsDark := IsDark;

  ImageAlbum.Picture.Assign(FAlbumThumbs[0].Image);

  for i := 0 to ImageList.Count - 1 do
    ColorImages(ImageList, i, ButtonColorNormal);

  ColorImages(ImageList, 6, ButtonColorHot);
  ColorImages(ImageList, 7, ButtonColorHot);
  ColorImages(ImageList, 8, ButtonColorHot);

  for i := 0 to ImageListL.Count - 1 do
    ColorImages(ImageListL, i, ColorLighter(ButtonColorNormal, 20));

  ColorImages(ImageListL, 6, ColorLighter(ButtonColorHot, 20));
  ColorImages(ImageListL, 7, ColorLighter(ButtonColorHot, 20));
  ColorImages(ImageListL, 8, ColorLighter(ButtonColorHot, 20));

  Color := AColor;
  PanelPageControl.Color := AColor;
  LabelAudioCount.Font.Color := AFont;
  LabelTitle.Font.Color := AFont;
  Shape3.Brush.Color := ColorDarkerOr(AColor, 10);
  Shape3.Pen.Color := ColorDarkerOr(AColor, 10);
  Shape1.Brush.Color := ColorDarkerOr(AColor, 10);
  Shape1.Pen.Color := ColorDarkerOr(AColor, 10);
  Shape2.Brush.Color := ColorDarkerOr(AColor, 10);
  Shape2.Pen.Color := ColorDarkerOr(AColor, 10);

  ButtonFlatSearch.ColorNormal := ColorLighterOr(AColor, 3);
  ButtonFlatSearch.ColorPressed := ColorLighterOr(AColor, 8);
  ButtonFlatSearch.ColorOver := ColorLighterOr(AColor, 10);
  ButtonFlatSearch.BorderColor := ColorLighterOr(AColor, 15);

  CheckBoxFlatSerachType.ColorNormal := ColorLighterOr(AColor, 3);
  CheckBoxFlatSerachType.ColorPressed := ColorLighterOr(AColor, 8);
  CheckBoxFlatSerachType.ColorOver := ColorLighterOr(AColor, 10);
  CheckBoxFlatSerachType.BorderColor := ColorLighterOr(AColor, 15);
  CheckBoxFlatSerachType.Font.Color := AFont;
  CheckBoxFlatSerachType.FontOver.Color := AFont;
  CheckBoxFlatSerachType.FontDown.Color := AFont;

  EditSearch.Color := AColor;
  EditSearch.Font.Color := AFont;

  SetTabsColor(ButtonFlatCurrent);
  SetTabsColor(ButtonFlatMy);
  SetTabsColor(ButtonFlatPlaylists);
  SetTabsColor(ButtonFlatFriends);
  SetTabsColor(ButtonFlatSearchTab);
  SetTabsColor(ButtonFlatMyMusic);

  SetTableColor(TableExMyMusic);
  SetTableColor(TableExPlaylists);
  SetTableColor(TableExCurrent);
  SetTableColor(TableExFriends);
  SetTableColor(TableExSearch);

  SetTrackbarColor(TrackbarPosition);
  SetTrackbarColor(TrackbarVolume);

  if IsDark then
    TStyleManager.TrySetStyle('Windows10 Dark')
    //TStyleManager.TrySetStyle('Windows')
  else
    TStyleManager.TrySetStyle('Windows');
  FormShow(nil);
end;

procedure TFormMain.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  VK.Application := TVkApplicationData.Marusia;
  //{ $IFDEF NEEDFMX}
  //TFormFMXCaptcha.Execute(CaptchaImg, Answer);
  //{$ELSE}
  //TFormCaptcha.Execute(CaptchaImg, Answer);
  //{$ENDIF}

  FLoading := TDecoratePanel.Create(Self, PanelLoading, False);
  ActivityIndicatorLoading.Animate := True;
  FLoading.Open(False);

  FPlayer := TBASSPlayer.Create(Self);
  FPlayer.OnEnd := FOnAudioEnd;
  FPlayer.OnChangeState := FOnAudioChangeState;
  FPlayingId := -1;
  FAppLoading := True;
  FTerminating := False;
  FChangingUser := False;
  FOpenning := False;
  FShowLeftTime := False;
  CreateLoaders;

  FAvatarMask := TPngImage.Create;
  FAvatarMask.LoadFromResourceName(HInstance, 'mask');
  FAvatarDef := TPngImage.Create;
  FAudioMask := TPngImage.Create;
  FAudioMask.LoadFromResourceName(HInstance, 'avatarmask');

  FDB := TSQLiteDatabase.Create(AppFolder + 'cache.db');
  FAlbumThumbs := TAlbumThumbs.Create(FDB);
  FAlbumThumbs.Add(TAlbumThumb.CreateItem(TPicture.Create, ''));
  //FAlbumThumbs.LoadImages;
  FPlayImage := TPngImage.Create;
  FPlayImage.LoadFromResourceName(HInstance, 'play');
  FPauseImage := TPngImage.Create;
  FPauseImage.LoadFromResourceName(HInstance, 'pause');
  FActiveImage := TPngImage.Create;
  FActiveImage.LoadFromResourceName(HInstance, 'active');

  FPlayIco := TIcon.Create;
  FPlayIco.LoadFromResourceName(HInstance, 'PlayIco');
  FPauseIco := TIcon.Create;
  FPauseIco.LoadFromResourceName(HInstance, 'PauseIco');

  FSettings := TSettingsIni.Create(ExtractFilePath(ParamStr(0)) + '\config.ini');
  FMyMusic := TAudioList.Create(TableExMyMusic);
  FCurrentList := TAudioList.Create(TableExCurrent);
  FFriends := TFriends.Create(TableExFriends);
  FPlaylists := TPlaylists.Create(TableExPlaylists);
  FSearchList := TAudioList.Create(TableExSearch);

  FToken := FSettings.GetStr('General', 'Token', '');
  if FToken.IsEmpty then
  begin
    FSettings.SetStr('General', 'Token', '');
    FSettings.SetStr('General', 'Url', 'https://vkhost.github.io/');
    //ShowMessage('Укажи токен в config.ini. Ссылка внутри');
    //Halt;
  end;
  for i := 0 to PageControl.PageCount - 1 do
    PageControl.Pages[i].TabVisible := False;

  ImageListL.AddImages(ImageList);

  SetColors(True);
  ClearInfo;
  ButtonFlatMyClick(ButtonFlatMy);
  FOnAudioChangeState(nil);
  SetRepeat(prNone);

  if not FPlayer.Init(Handle) then
  begin
    ShowMessage('Не хватает библиотек BASS');
    Exit;
  end;

  TimerEqu.Enabled := True;
end;

procedure TFormMain.Await;
begin
  FLoadUsers.Stop;
  FLoadPlaylist.Stop;
  FLoadPlaylists.Stop;
  FLoadMusic.Stop;
  FLoadSearch.Stop;
  FLoadPicCurrent.Stop;
  FLoadPicFriends.Stop;
  FLoadPicSearch.Stop;
  FLoadPicMusic.Stop;
  while FLoadPicMusic.IsWorking or FLoadPicSearch.IsWorking or FLoadSearch.IsWorking or FLoadPlaylist.IsWorking or FLoadMusic.IsWorking or FLoadPlaylists.IsWorking or FLoadPicCurrent.IsWorking or FLoadUsers.IsWorking or FLoadPicFriends.IsWorking do
    Application.ProcessMessages;
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  FPlayer.Stop;
  Hide;
  FAlbumThumbs.SaveImages;
  TLoadThread.StopAll;
  FSearchList.Free;
  FCurrentList.Free;
  FMyMusic.Free;
  FFriends.Free;
  FPlaylists.Free;
  FSettings.Free;
  FPlayImage.Free;
  FPauseImage.Free;
  FActiveImage.Free;
  FAlbumThumbs.Free;
  FLoadUsers.Free;
  FLoadPlaylist.Free;
  FLoadPlaylists.Free;
  FLoadMusic.Free;
  FLoadSearch.Free;
  FLoadPicCurrent.Free;
  FLoadPicFriends.Free;
  FLoadPicSearch.Free;
  FLoadPicMusic.Free;
  FAvatarMask.Free;
  FAvatarDef.Free;
  FAudioMask.Free;
  FPlayIco.Free;
  FPauseIco.Free;
  FDB.Free;
  FLoading.Free;
end;

procedure TFormMain.FormResize(Sender: TObject);
begin
  FLoading.UpdateSize;
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
  //ShowWindow(Application.Handle, SW_HIDE);
 // if FAppLoading then
  FLoading.CloseDelay(2000,
    procedure
    begin
      ActivityIndicatorLoading.Animate := False;
    end);
end;

procedure TFormMain.Full;
begin
  ShowWindow(Application.Handle, SW_SHOW);
  FormStyle := fsNormal;
  Show;
  FormPlayer.Hide;
  BringToFront;
end;

procedure TFormMain.TrackbarPositionAdvHint(Sender: TObject; HintPosition: Extended; var Text: string);
var
  Ps: Tpoint;
begin
  HintPanel.Text := FPlayer.GetTimeFromPercent(HintPosition);
  Ps := Mouse.CursorPos;
  Ps.Y := TrackbarPosition.ClientToScreen(Point(0, 0)).Y;
  HintPanel.Show(Ps);
end;

procedure TFormMain.TrackbarPositionChange(Sender: TObject; Position: Extended);
begin
  FPlayer.PositionPercent := Position;
end;

procedure TFormMain.TrackbarPositionMouseLeave(Sender: TObject);
begin
  HintPanel.Hide;
end;

procedure TFormMain.TrackbarVolumeAdvHint(Sender: TObject; HintPosition: Extended; var Text: string);
var
  Ps: Tpoint;
begin
  HintPanel.Text := Trunc(HintPosition).ToString;
  Ps := Mouse.CursorPos;
  Ps.Y := TrackbarVolume.ClientToScreen(Point(0, 0)).Y;
  HintPanel.Show(Ps);
end;

procedure TFormMain.TrackbarVolumeChange(Sender: TObject; Position: Extended);
begin
  FPlayer.VolumeChannel := Position;
end;

procedure TFormMain.TrackbarVolumeMouseLeave(Sender: TObject);
begin
  HintPanel.Hide;
end;

procedure TFormMain.ImageAvatarClick(Sender: TObject);
begin
  ActivityIndicatorLoading.Animate := True;
  FLoading.Open(True);
  SetColors(ImageAvatar.Tag = 1);
  if ImageAvatar.Tag = 0 then
    ImageAvatar.Tag := 1
  else
    ImageAvatar.Tag := 0;
end;

procedure TFormMain.Mini;
begin
  ShowWindow(Application.Handle, SW_HIDE);
  Hide;
  FormPlayer.Show;
  FormPlayer.BringToFront;
end;

procedure TFormMain.VKAuth(Sender: TObject; Url: string; var Token: string; var TokenExpiry: Int64; var ChangePasswordHash: string);
begin
  if FToken.IsEmpty then
  begin
    TFormOAuth2.Execute(Url,
      procedure(Form: TFormOAuth2)
      begin
        FToken := Form.Token;
      end, True);
  end;
  Token := FToken;
end;

procedure TFormMain.DoLogin;
begin
  FToken := '';
  FSettings.SetStr('General', 'Token', FToken);
  VK.Token := '';

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

procedure TFormMain.VKError(Sender: TObject; E: Exception; Code: Integer; Text: string);
begin
  if Code = 5 then
    DoLogin;
end;

procedure TFormMain.VKLog(Sender: TObject; const Value: string);
begin
  MemoLog.Lines.Add(Value);
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
  User: TVkProfile;
begin
  FFailCount := 0;
  FToken := VK.Token;
  FSettings.SetStr('General', 'Token', FToken);

  if VK.Users.Get(User, 0, [TVkExtendedField.Photo50]) then
  begin
    FVkId := User.id;
    FVkIdCurrent := FVkId;
    SetCurrentUser(User);
    SetAvatar(User.Photo50);
    User.Free;
    ReloadItems;
    FLoadUsers.Execute;
  end
  else
    FVkId := -1;
  FLoading.Close;
  FAppLoading := False;
end;
{ TAlbumThumb }

class function TAlbumThumb.CreateItem(AImage: TPicture; AUrl: string): TAlbumThumb;
begin
  Result.Stored := False;
  Result.Image := AImage;
  Result.URL := AUrl;
end;

{ TAlbumThumbs }

constructor TAlbumThumbs.Create(ADB: TSQLiteDatabase);
begin
  inherited Create;
  FDB := ADB;
  FFinding := False;
  FSaving := False;
  FCanFind := FDB.TableExists(TableName);
end;

destructor TAlbumThumbs.Destroy;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
  try
    Items[i].Image.Free;
  except
  end;
  inherited;
end;

procedure TAlbumThumbs.SaveImages;
var
  i, ID: Integer;
  Mem: TMemoryStream;
begin
  if Count <= 1 then
    Exit;
  while FSaving do
    Sleep(50);
  FSaving := True;
  try
    if not FDB.TableExists(TableName) then
    begin
      with SQL.CreateTable(TableName) do
      begin
        AddField(fnID, ftInteger, True, True);
        AddField(fnURL, ftString);
        AddField(fnImage, ftBlob);
        FDB.ExecSQL(GetSQL);
        EndCreate;
      end;
      FCanFind := True;
    end;
    for i := 0 to Count - 1 do
    begin
      if Items[i].Url.IsEmpty or Items[i].Stored then
        Continue;
      with SQL.Select(TableName, [fnID]) do
      begin
        WhereFieldEqual(fnURL, Items[i].Url);
        ID := FDB.GetTableValue(GetSQL);
        EndCreate;
      end;
      if ID < 0 then
        with SQL.InsertInto(TableName) do
        begin
          AddValue(fnURL, Items[i].Url);
          FDB.ExecSQL(GetSQL);
          ID := FDB.LastInsertRowID;
          EndCreate;
        end;
      with SQL.UpdateBlob(TableName, fnImage) do
      begin
        WhereFieldEqual(fnID, ID);
        Mem := TMemoryStream.Create;
        Items[i].Image.SaveToStream(Mem);
        if Mem.Size > 0 then
          FDB.UpdateBlob(GetSQL, Mem);
        Mem.Free;
        EndCreate;
      end;
    end;
  finally
    FSaving := False;
  end;
end;

procedure TAlbumThumbs.LoadImages;
var
  Table: TSQLiteTable;
  Mem: TMemoryStream;
  Item: TAlbumThumb;
begin
  if not FDB.TableExists(TableName) then
    Exit;
  with SQL.Select(TableName, [fnURL, fnImage]) do
  begin
    Table := FDB.Query(GetSQL);
    Table.MoveFirst;
    while not Table.EOF do
    begin
      Mem := Table.FieldAsBlob(1);
      if Assigned(Mem) then
      begin
        try
          Item.Image := TPicture.Create;
          Mem.Position := 0;
          Item.Image.LoadFromStream(Mem);
          Item.URL := Table.FieldAsString(0);
          Item.Stored := True;
          Add(Item);
        except
        end;
      end;
      Table.Next;
    end;
    Table.Free;
    EndCreate;
  end;
end;

function TAlbumThumbs.FindPicture(Url: string; var Index: Integer): Boolean;
var
  Table: TSQLiteTable;
  Mem: TMemoryStream;
  Item: TAlbumThumb;
begin
  Index := -1;
  Result := False;
  if not FCanFind then
    Exit;
  while FFinding do
    Sleep(50);
  FFinding := True;
  try
    with SQL.Select(TableName, [fnURL, fnImage]) do
    begin
      WhereFieldEqual(fnURL, Url);
      Table := FDB.Query(GetSQL);
      try
        Table.MoveFirst;
        if Table.RowCount > 0 then
        begin
          Mem := Table.FieldAsBlob(fnImage);
          if Assigned(Mem) then
          begin
            try
              Item.Image := TPicture.Create;
              Mem.Position := 0;
              Item.Image.LoadFromStream(Mem);
              Item.URL := Table.FieldAsString(fnURL);
              Item.Stored := True;
              Index := Add(Item);
              Result := True;
            except
            end;
          end;
        end;
      finally
        Table.Free;
        EndCreate;
      end;
    end;
  finally
    FFinding := False;
  end;
end;

function TAlbumThumbs.GetImage(Url: string; var UseDefault: Boolean; Avatar: Boolean): TPicture;
var
  i: Integer;
  Mem: TMemoryStream;
  Item: TAlbumThumb;
  Png: TPngImage;
begin
  UseDefault := True;
  for i := 0 to Count - 1 do
  begin
    UseDefault := i = 0;
    if Items[i].Url = Url then
    begin
      if Assigned(Items[i].Image) then
        Exit(Items[i].Image)
      else
        Exit(Items[0].Image);
    end;
  end;
  if FindPicture(Url, i) then
  begin
    Exit(Items[i].Image);
  end;
  Mem := DownloadURL(Url);
  try
    if Mem.Size > 0 then
    begin
      Item.Image := TPicture.Create;
      try
        TThread.Synchronize(TThread.Current,
          procedure
          begin
            Item.Image.LoadFromStream(Mem);
          end);
        if Avatar then
        begin
          Png := CreateAvatar(Item.Image.Graphic, FormMain.FAvatarMask);
          Item.Image.Assign(Png);
          Png.Free;
        end
        else
        begin
          Png := CreateAvatar(Item.Image.Graphic, FormMain.FAudioMask);
          Item.Image.Assign(Png);
          Png.Free;
        end;
        UseDefault := False;
      except
        Item.Image.Free;
        Item.Image := nil;
      end;
      Item.URL := Url;
      i := Add(Item);
      if Assigned(Item.Image) then
        Result := Items[i].Image
      else
        Result := Items[0].Image;
    end
    else
      Result := Items[0].Image;
  finally
    Mem.Free;
  end;
end;

{ TAudioList }

function TAudioList.Find(AudioId: Integer): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
    if Items[i].Id = AudioId then
      Exit(i);
end;

function TAudioList.Find(Query: string; StartFrom: Integer): Integer;
var
  i, Start: Integer;
begin
  Result := -1;
  Query := AnsiLowerCase(Query);
  Start := StartFrom;
  if Start >= Count - 1 then
    Start := 0;
  for i := Start to Count - 1 do
    if (Pos(Query, AnsiLowerCase(Items[i].Title)) <> 0) or (Pos(Query, AnsiLowerCase(Items[i].Artist)) <> 0) then
      Exit(i);
  if StartFrom > 0 then
    Result := Find(Query, 0);
end;

function TAudioList.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

function TAudioList._AddRef: Integer;
begin
  Result := -1;
end;

function TAudioList._Release: Integer;
begin
  Result := -1;
end;

{ TAudio }

procedure TAudio.Fill(Audio: TVkAudio);
var
  M, S: Integer;
begin
  Image := nil;
  Artist := Audio.Artist;
  Title := Audio.Title;
  if Assigned(Audio.Album) and Assigned(Audio.Album.Thumb) then
    AlbumPhoto := Audio.Album.Thumb.Photo68
  else
    AlbumPhoto := '';
  Id := Audio.Id;
  OwnerId := Audio.OwnerId;
  Restricted := Audio.ContentRestricted > 0;
  S := Trunc(Audio.Duration);
  M := S div 60;
  S := S mod 60;
  Duration := Format('%d:%.2d', [M, S]);
  AccessKey := Audio.AccessKey;
end;

{ TFriends }

function TFriends.Find(Query: string; StartFrom: Integer): Integer;
var
  i, Start: Integer;
begin
  Result := -1;
  Query := AnsiLowerCase(Query);
  Start := StartFrom;
  if Start >= Count - 1 then
    Start := 0;
  for i := Start to Count - 1 do
    if (Pos(Query, AnsiLowerCase(Items[i].FirstName)) <> 0) or (Pos(Query, AnsiLowerCase(Items[i].LastName)) <> 0) then
      Exit(i);
  if StartFrom > 0 then
    Result := Find(Query, 0);
end;

function TFriends.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

function TFriends._AddRef: Integer;
begin
  Result := -1;
end;

function TFriends._Release: Integer;
begin
  Result := -1;
end;

{ TPlaylists }

function TPlaylists.Find(Query: string; StartFrom: Integer): Integer;
var
  i, Start: Integer;
begin
  Result := -1;
  Query := AnsiLowerCase(Query);
  Start := StartFrom;
  if Start >= Count - 1 then
    Start := 0;
  for i := Start to Count - 1 do
    if (Pos(Query, AnsiLowerCase(Items[i].Title)) <> 0) or (Pos(Query, AnsiLowerCase(Items[i].Description)) <> 0) then
      Exit(i);
  if StartFrom > 0 then
    Result := Find(Query, 0);
end;

function TPlaylists.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

function TPlaylists._AddRef: Integer;
begin
  Result := -1;
end;

function TPlaylists._Release: Integer;
begin
  Result := -1;
end;

initialization
  AppFolder := TPath.GetCachePath + '\VKAudioPlayer\';
  if not DirectoryExists(AppFolder) then
    if not CreateDir(AppFolder) then
      AppFolder := ExtractFilePath(Application.ExeName);

end.

