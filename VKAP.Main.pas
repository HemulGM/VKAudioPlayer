unit VKAP.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Types, VK.API, VK.Components, HGM.Common.Settings,
  Vcl.Grids, HGM.Controls.VirtualTable, Vcl.ExtCtrls, BassPlayer, Vcl.StdCtrls, HGM.Button,
  Vcl.ComCtrls, HGM.Controls.PanelExt, System.ImageList, Vcl.ImgList, Vcl.Imaging.pngimage,
  System.Generics.Collections, Vcl.Imaging.jpeg, VK.Entity.Playlist, VK.Entity.User,
  BassPlayer.LoadHandle;

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
    Restricted: Boolean;
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
    IsClosed: Boolean;
  end;

  TAlbumThumb = record
    Image: TPicture;
    URL: string;
    class function CreateItem(AImage: TPicture; AUrl: string): TAlbumThumb; static;
  end;

  TAlbumThumbs = class(TList<TAlbumThumb>)
    function GetImage(Url: string; var UseDefault: Boolean): TPicture;
    destructor Destroy; override;
  end;

  TPlayRepeat = (prNone, prAll, prOne);

  TAudioList = class(TTableData<TAudio>)
    function Find(AudioId: Integer): Integer; overload;
    function Find(Query: string): Integer; overload;
  end;

  TFriends = TTableData<TFriend>;

  TPlaylists = TTableData<TPlaylist>;

  TEquItems = array[1..4] of Double;

  TFormMain = class(TForm)
    VK: TVK;
    PanelPlayer: TPanel;
    SaveDialogMp3: TSaveDialog;
    ButtonFlatPlayPause: TButtonFlat;
    TimerRefresh: TTimer;
    ButtonFlatNext: TButtonFlat;
    ButtonFlatPrev: TButtonFlat;
    ButtonFlatDownload: TButtonFlat;
    ImageList: TImageList;
    PanelTrackInfo: TPanel;
    ImageListL: TImageList;
    DrawPanelTrackBar: TDrawPanel;
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
    ButtonFlat1: TButtonFlat;
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
    Panel1: TPanel;
    ButtonFlat2: TButtonFlat;
    EditSearchCur: TEdit;
    ButtonFlatSerachCur: TButtonFlat;
    procedure FormCreate(Sender: TObject);
    procedure TableExMyMusicItemClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure TimerRefreshTimer(Sender: TObject);
    procedure DrawPanelTrackBarPaint(Sender: TObject);
    procedure DrawPanelTrackBarMouseEnter(Sender: TObject);
    procedure DrawPanelTrackBarMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DrawPanelTrackBarMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DrawPanelTrackBarMouseLeave(Sender: TObject);
    procedure DrawPanelTrackBarMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ButtonFlatDownloadClick(Sender: TObject);
    procedure TableExMyMusicDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure ButtonFlatPrevClick(Sender: TObject);
    procedure ButtonFlatNextClick(Sender: TObject);
    procedure ButtonFlatPlayPauseClick(Sender: TObject);
    procedure VKLogin(Sender: TObject);
    procedure VKErrorLogin(Sender: TObject; E: Exception; Code: Integer; Text: string);
    procedure VKAuth(Sender: TObject; var Token: string; var TokenExpiry: Int64; var ChangePasswordHash: string);
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
    procedure ButtonFlatSerachCurClick(Sender: TObject);
    procedure EditSearchCurChange(Sender: TObject);
  private
    FMouseInScale: Boolean;
    FMouseInButton: Boolean;
    FMouseIsDown: Boolean;
    FMouseDownPos: TPoint;
    FMousePos: TPoint;
    FScalePercent: Extended;
    FScaleRect: TRect;
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
    procedure FOnAudioEnd(Sender: TObject);
    function FindNext(CurrentId: Integer; Handle: Boolean): Integer;
    function FindPrev(CurrentId: Integer; Handle: Boolean): Integer;
    function Play(Index: Integer): Boolean;
    procedure ClearInfo;
    procedure SetInfo(Audio: TAudio);
    procedure PlayNext(Handle: Boolean);
    procedure PlayPrev(Handle: Boolean);
    procedure Await;
    procedure RefillEqu;
    procedure ButtonFlatNavClick(Sender: TObject);
    procedure OpenPlaylists;
    procedure OpenCurrentPlaylist;
    procedure OpenFriends;
    procedure OpenSearch;
    procedure OpenMyMusic;
    procedure FillCurrentFromMyMusic;
    procedure UpdateImages(Url: string; Image: TPicture);
    procedure FillCurrentFromPlaylist(Index: Integer);
    procedure ReloadItems;
    procedure SetCurrentUser(User: TVkUser);
    procedure NextRepeat;
    procedure SetRepeat(Value: TPlayRepeat);
    procedure Shuffle;
    procedure Search(Query: string);
    procedure FillCurrentFromSearch;
    procedure CreateLoaders;
  public
    procedure Quit;
  end;

var
  FormMain: TFormMain;

implementation

uses
  VK.Entity.Audio, VK.Audio, HGM.Common.Utils, Direct2D, D2D1, Math, VK.OAuth2;

{$R *.dfm}

procedure TFormMain.LabelTimeClick(Sender: TObject);
begin
  FShowLeftTime := not FShowLeftTime;
  TimerRefreshTimer(nil);
end;

procedure TFormMain.TableExCurrentDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
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
        begin
          Rect.Inflate(-7, -7);
          if Assigned(FCurrentList[ARow].Image) then
            StretchDraw(Rect, FCurrentList[ARow].Image.Graphic)
          else
            StretchDraw(Rect, FAlbumThumbs[0].Image.Graphic);

          if FCurrentList[ARow].Id = FPlayingId then
          begin
            if TableExCurrent.ItemUnderMouse = ARow then
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
          else if TableExCurrent.ItemUnderMouse = ARow then
            StretchDraw(Rect, FPlayImage);
        end;
      1:
        begin
          Font.Name := 'Roboto';
          Font.Size := 9;
          TxtRect := Rect;
          TxtRect.Bottom := TxtRect.CenterPoint.Y;
          TxtRect.Inflate(-1, -1);
          TxtRect.Right := TxtRect.Right - 40;
          S := FCurrentList[ARow].Title;
          Font.Color := clBlack;
          TextRect(TxtRect, S, [tfSingleLine, tfBottom, tfLeft, tfEndEllipsis]);

          TxtRect := Rect;
          TxtRect.Top := TxtRect.CenterPoint.Y;
          TxtRect.Inflate(-1, -1);
          TxtRect.Right := TxtRect.Right - 40;
          S := FCurrentList[ARow].Artist;
          Font.Color := $00939393;
          TextRect(TxtRect, S, [tfSingleLine, tfTop, tfLeft, tfEndEllipsis]);

          TxtRect := Rect;
          TxtRect.Inflate(-4, -4);
          TxtRect.Left := TxtRect.Right - 40;
          S := FCurrentList[ARow].Duration;
          TextRect(TxtRect, S, [tfSingleLine, tfVerticalCenter, tfCenter]);

          if FCurrentList[ARow].Restricted then
          begin
            TxtRect := Rect;
            TxtRect.Inflate(-4, -4);
            TxtRect.Left := TxtRect.Right - 40 - 50;
            S := 'x';
            TextRect(TxtRect, S, [tfSingleLine, tfVerticalCenter, tfCenter]);
          end;
        end;
    end;
  end;
end;

procedure TFormMain.TableExCurrentItemClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
begin
  if not Play(Index) then
    PlayNext(True);
end;

procedure TFormMain.TableExFriendsDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
var
  TxtRect: TRect;
  S: string;
begin
  with TableExFriends.Canvas do
  begin
    if (not FFriends.IndexIn(ARow)) or (FFriends.IsUpdate) then
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
            StretchDraw(Rect, FAlbumThumbs[0].Image.Graphic);
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
          Font.Color := clBlack;
          TextRect(TxtRect, S, [tfSingleLine, tfBottom, tfLeft, tfEndEllipsis]);

          TxtRect := Rect;
          TxtRect.Top := TxtRect.CenterPoint.Y;
          TxtRect.Inflate(-1, -1);
          TxtRect.Right := TxtRect.Right - 40;
          S := FFriends[ARow].Status;
          Font.Color := $00939393;
          TextRect(TxtRect, S, [tfSingleLine, tfTop, tfLeft, tfEndEllipsis]);
        end;
    end;
  end;
end;

procedure TFormMain.SetCurrentUser(User: TVkUser);
begin
  Caption := 'VK Audio Player [' + User.GetFullName + ']';
end;

procedure TFormMain.TableExFriendsItemClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
var
  Params: TVkAudioParams;
  Audios: TVkAudios;
  User: TVkUser;
begin
  if not FFriends.IndexIn(Index) then
    Exit;
  FVkId := FFriends[Index].Id;
  if VK.Users.Get(User, FVkId) then
  begin
    SetCurrentUser(User);
    User.Free;
  end;
  Params.OwnerId(FVkId);
  Params.Count(1);
  if VK.Audio.Get(Audios, Params) then
  begin
    if Length(Audios.Items) <= 0 then
      ShowMessage('У выбранного пользователя нет музыки');
    Audios.Free;
    ReloadItems;
  end
  else
    ShowMessage('Музыка закрыта');
end;

procedure TFormMain.TableExMyMusicDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
var
  TxtRect: TRect;
  S: string;
begin
  with TableExMyMusic.Canvas do
  begin
    if (not FMyMusic.IndexIn(ARow)) or (FMyMusic.IsUpdate) then
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
        begin
          Rect.Inflate(-7, -7);
          if Assigned(FMyMusic[ARow].Image) then
            StretchDraw(Rect, FMyMusic[ARow].Image.Graphic)
          else
            StretchDraw(Rect, FAlbumThumbs[0].Image.Graphic);
          if FMyMusic[ARow].Id = FPlayingId then
          begin
            if TableExMyMusic.ItemUnderMouse = ARow then
              if FPlayer.IsPlay then
                StretchDraw(Rect, FPauseImage)
              else
                StretchDraw(Rect, FPlayImage)
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
          else if TableExMyMusic.ItemUnderMouse = ARow then
            StretchDraw(Rect, FPlayImage);
        end;
      1:
        begin
          Font.Name := 'Roboto';
          Font.Size := 9;
          TxtRect := Rect;
          TxtRect.Bottom := TxtRect.CenterPoint.Y;
          TxtRect.Inflate(-1, -1);
          TxtRect.Right := TxtRect.Right - 40;
          S := FMyMusic[ARow].Title;
          Font.Color := clBlack;
          TextRect(TxtRect, S, [tfSingleLine, tfBottom, tfLeft, tfEndEllipsis]);

          TxtRect := Rect;
          TxtRect.Top := TxtRect.CenterPoint.Y;
          TxtRect.Inflate(-1, -1);
          TxtRect.Right := TxtRect.Right - 40;
          S := FMyMusic[ARow].Artist;
          Font.Color := $00939393;
          TextRect(TxtRect, S, [tfSingleLine, tfTop, tfLeft, tfEndEllipsis]);

          TxtRect := Rect;
          TxtRect.Inflate(-4, -4);
          TxtRect.Left := TxtRect.Right - 40;
          S := FMyMusic[ARow].Duration;
          TextRect(TxtRect, S, [tfSingleLine, tfVerticalCenter, tfCenter]);
        end;
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

function TFormMain.FindNext(CurrentId: Integer; Handle: Boolean): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to FCurrentList.Count - 1 do
  begin
    if FCurrentList[i].Id = CurrentId then
    begin
      if Handle or (FPlayRepeat = prAll) then
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

function TFormMain.FindPrev(CurrentId: Integer; Handle: Boolean): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to FCurrentList.Count - 1 do
  begin
    if FCurrentList[i].Id = CurrentId then
    begin
      if Handle or (FPlayRepeat = prAll) then
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
  end
  else
    ImageAlbum.Picture.Assign(FAlbumThumbs.Items[0].Image);
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
    FPlayer.Stop;
    Audio := FCurrentList[Index];
    SetInfo(Audio);
    FPlayingId := Audio.Id;
    if Audio.Url.IsEmpty then
    begin
      if VK.Audio.GetById(Item, Audio.OwnerId, Audio.Id) then
      begin
        Audio.Url := Item.Url;
        FCurrentList[Index] := Audio;
        Item.Free;
      end
      else
      begin
        FOpenning := False;
        Exit;
      end;
    end;
    if not Audio.Url.IsEmpty then
    begin
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

procedure TFormMain.ButtonFlatSearchClick(Sender: TObject);
begin
  Search(EditSearch.Text);
end;

procedure TFormMain.ButtonFlatSearchTabClick(Sender: TObject);
begin
  ButtonFlatNavClick(Sender);
  OpenSearch;
end;

procedure TFormMain.ButtonFlatSerachCurClick(Sender: TObject);
var
  Id: Integer;
begin
  if Length(EditSearchCur.Text) > 0 then
  begin
    Id := FCurrentList.Find(EditSearchCur.Text);
    if FCurrentList.IndexIn(Id) then
      TableExCurrent.ItemIndex := Id;
  end;
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
  ButtonFlatNavClick(Sender);
  OpenCurrentPlaylist;
end;

procedure TFormMain.OpenPlaylists;
begin
  //
  PageControl.ActivePage := TabSheetPlaylists;
end;

procedure TFormMain.OpenSearch;
begin
  //
  PageControl.ActivePage := TabSheetSearch;
end;

procedure TFormMain.OpenCurrentPlaylist;
begin
  //
  PageControl.ActivePage := TabSheetCurrent;
end;

procedure TFormMain.OpenFriends;
begin
  //
  PageControl.ActivePage := TabSheetFriends;
end;

procedure TFormMain.OpenMyMusic;
begin
  //
  PageControl.ActivePage := TabSheetMyMusic;
end;

procedure TFormMain.ButtonFlatDownloadClick(Sender: TObject);
begin
  if FCurrentList.IndexIn(TableExCurrent.ItemIndex) then
  begin
    SaveDialogMp3.FileName := FCurrentList[TableExCurrent.ItemIndex].Artist + ' - ' + FCurrentList[TableExCurrent.ItemIndex].Title
      + '.mp3';
    if SaveDialogMp3.Execute(Handle) then
    begin
      DownloadURL(FCurrentList[TableExCurrent.ItemIndex].Url, SaveDialogMp3.FileName);
    end;
  end;
end;

procedure TFormMain.ButtonFlatFriendsClick(Sender: TObject);
begin
  ButtonFlatNavClick(Sender);
  OpenFriends;
end;

procedure TFormMain.ButtonFlatMyClick(Sender: TObject);
begin
  ButtonFlatNavClick(Sender);
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
  ButtonFlatNavClick(Sender);
  OpenPlaylists;
end;

procedure TFormMain.ButtonFlatMyMouseLeave(Sender: TObject);
begin
  ShapeHotButton.Hide;
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

procedure TFormMain.TableExPlaylistsDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
var
  TxtRect: TRect;
  S: string;
begin
  with TableExPlaylists.Canvas do
  begin
    if (not FPlaylists.IndexIn(ARow)) or (FPlaylists.IsUpdate) then
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
        begin
          Rect.Inflate(-7, -7);
          if Assigned(FPlaylists[ARow].Image) then
            StretchDraw(Rect, FPlaylists[ARow].Image.Graphic)
          else
            StretchDraw(Rect, FAlbumThumbs[0].Image.Graphic);
          if FPlaylists[ARow].Id = FActivePlaylist then
          begin

            if TableExPlaylists.ItemUnderMouse = ARow then
              if FPlayer.IsPlay then
                StretchDraw(Rect, FPauseImage)
              else
                StretchDraw(Rect, FPlayImage)
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
          else if TableExPlaylists.ItemUnderMouse = ARow then
            StretchDraw(Rect, FPlayImage);
        end;
      1:
        begin
          Font.Name := 'Roboto';
          Font.Size := 9;
          TxtRect := Rect;
          TxtRect.Bottom := TxtRect.CenterPoint.Y;
          TxtRect.Inflate(-1, -1);
          TxtRect.Right := TxtRect.Right - 40;
          S := FPlaylists[ARow].Title;
          Font.Color := clBlack;
          TextRect(TxtRect, S, [tfSingleLine, tfBottom, tfLeft, tfEndEllipsis]);

          TxtRect := Rect;
          TxtRect.Top := TxtRect.CenterPoint.Y;
          TxtRect.Inflate(-1, -1);
          TxtRect.Right := TxtRect.Right - 40;
          S := FPlaylists[ARow].Description;
          Font.Color := $00939393;
          TextRect(TxtRect, S, [tfSingleLine, tfTop, tfLeft, tfEndEllipsis]);

          TxtRect := Rect;
          TxtRect.Inflate(-4, -4);
          TxtRect.Left := TxtRect.Right - 40;
          S := FPlaylists[ARow].Count.ToString;
          TextRect(TxtRect, S, [tfSingleLine, tfVerticalCenter, tfCenter]);
        end;
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
    if (not FSearchList.IndexIn(ARow)) or (FSearchList.IsUpdate) then
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
        begin
          Rect.Inflate(-7, -7);
          if Assigned(FSearchList[ARow].Image) then
            StretchDraw(Rect, FSearchList[ARow].Image.Graphic)
          else
            StretchDraw(Rect, FAlbumThumbs[0].Image.Graphic);
          if FSearchList[ARow].Id = FPlayingId then
          begin
            if TableExSearch.ItemUnderMouse = ARow then
              if FPlayer.IsPlay then
                StretchDraw(Rect, FPauseImage)
              else
                StretchDraw(Rect, FPlayImage)
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
          else if TableExSearch.ItemUnderMouse = ARow then
            StretchDraw(Rect, FPlayImage);
        end;
      1:
        begin
          Font.Name := 'Roboto';
          Font.Size := 9;
          TxtRect := Rect;
          TxtRect.Bottom := TxtRect.CenterPoint.Y;
          TxtRect.Inflate(-1, -1);
          TxtRect.Right := TxtRect.Right - 40;
          S := FSearchList[ARow].Title;
          Font.Color := clBlack;
          TextRect(TxtRect, S, [tfSingleLine, tfBottom, tfLeft, tfEndEllipsis]);

          TxtRect := Rect;
          TxtRect.Top := TxtRect.CenterPoint.Y;
          TxtRect.Inflate(-1, -1);
          TxtRect.Right := TxtRect.Right - 40;
          S := FSearchList[ARow].Artist;
          Font.Color := $00939393;
          TextRect(TxtRect, S, [tfSingleLine, tfTop, tfLeft, tfEndEllipsis]);

          TxtRect := Rect;
          TxtRect.Inflate(-4, -4);
          TxtRect.Left := TxtRect.Right - 40;
          S := FSearchList[ARow].Duration;
          TextRect(TxtRect, S, [tfSingleLine, tfVerticalCenter, tfCenter]);
        end;
    end;
  end;
end;

procedure TFormMain.TableExSearchItemClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
begin
  FillCurrentFromSearch;
  if not Play(Index) then
    PlayNext(True);
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
  if FPlayer.IsPlay then
  begin
    if FShowLeftTime then
      LabelTime.Caption := FPlayer.PositionTimeLeft
    else
      LabelTime.Caption := FPlayer.PositionTime;
    DrawPanelTrackBar.Repaint;
    ButtonFlatPlayPause.ImageIndex := 4;
  end
  else
    ButtonFlatPlayPause.ImageIndex := 0;
end;

procedure TFormMain.DrawPanelTrackBarMouseDown(Sender: TObject; Button: TMouseButton; Shift:
  TShiftState; X, Y: Integer);
begin
  FMouseDownPos := Point(X, Y);
  case Button of
    TMouseButton.mbLeft:
      begin
        FMouseIsDown := True; //FScaleRect.Contains(FMousePos);
      end;
  end;
  DrawPanelTrackBarPaint(nil);
end;

procedure TFormMain.DrawPanelTrackBarMouseEnter(Sender: TObject);
begin
  FMouseInScale := True;
  DrawPanelTrackBarPaint(nil);
end;

procedure TFormMain.DrawPanelTrackBarMouseLeave(Sender: TObject);
begin
  FMouseInScale := False;
  DrawPanelTrackBarPaint(nil);
end;

procedure TFormMain.DrawPanelTrackBarMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  FMousePos := Point(X, Y);
  if FScaleRect.Contains(FMousePos) then
    DrawPanelTrackBar.Cursor := crHandPoint
  else
    DrawPanelTrackBar.Cursor := crDefault;
  DrawPanelTrackBarPaint(nil);
end;

procedure TFormMain.DrawPanelTrackBarMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case Button of
    TMouseButton.mbLeft:
      begin
        if FMouseIsDown then
        begin
          FPlayer.PositionPercent := FScalePercent;
          FMouseIsDown := False;
          FMouseDownPos := Point(-1, -1);
        end;
      end;
  end;
  DrawPanelTrackBarPaint(nil);
end;

procedure TFormMain.DrawPanelTrackBarPaint(Sender: TObject);
const
  ColorScale = $00ECE8E7;
  ColorPos = $00B88151;
  ColorBuf = $00DED6D1;
  PosMargin = 2;
  ScaleMarginSide = 10;
  ScaleMarginUpdown = 4;
var
  MRect, PosRect, PosScale: TRect;
  ScalePos, VisPos, BufPos: Integer;
begin
  MRect := DrawPanelTrackBar.ClientRect;
  with TDirect2DCanvas.Create(DrawPanelTrackBar.Canvas, MRect) do
  begin
    BeginDraw;
    Brush.Color := PanelPlayer.Color;
    FillRect(MRect);

    //Scale
    Pen.Color := ColorScale;
    Brush.Color := ColorScale;
    FScaleRect := MRect;
    FScaleRect.Inflate(-ScaleMarginSide, -ScaleMarginUpdown);
    RoundRect(FScaleRect, FScaleRect.Height, FScaleRect.Height);
    ScalePos := Max(FScaleRect.Left, Min(FMousePos.X, FScaleRect.Right));
    ScalePos := ScalePos - FScaleRect.Left;

    //Position
    if FMouseIsDown then
    begin
      VisPos := ScalePos;
      FScalePercent := (100 / FScaleRect.Width) * ScalePos;
    end
    else
    begin
      VisPos := Round((FScaleRect.Width / 100) * FPlayer.PositionPercent);
    end;

    //Buffering
    BufPos := Round((FScaleRect.Width / 100) * FPlayer.BufferringPercent);
    Pen.Color := ColorBuf;
    Brush.Color := ColorBuf;

    PosScale := FScaleRect;
    PosScale.Right := (FScaleRect.Left + BufPos);
    RoundRect(PosScale, PosScale.Height, PosScale.Height);

    //Playing
    Pen.Color := ColorPos;
    Brush.Color := ColorPos;

    PosScale := FScaleRect;
    PosScale.Right := (FScaleRect.Left + VisPos);
    RoundRect(PosScale, PosScale.Height, PosScale.Height);

    //Ellipse
    if FMouseInScale then
    begin
      PosRect := TRect.Create(TPoint.Create(0, 0), MRect.Height - PosMargin, MRect.Height - PosMargin);
      PosRect.SetLocation(PosScale.Right - PosRect.Width div 2, (PosScale.Top + PosScale.Height div 2)
        - PosRect.Height div 2);
      Ellipse(PosRect);
      if PosRect.Contains(FMousePos) then
      begin
        FMouseInButton := True;
      end;
    end;

    EndDraw;
    Free;
  end;
end;

procedure TFormMain.EditSearchCurChange(Sender: TObject);
begin
  ButtonFlatSerachCurClick(nil);
end;

procedure TFormMain.PlayNext;
var
  Nxt: Integer;
begin
  if FOpenning then
    Exit;
  Nxt := FindNext(FPlayingId, Handle);
  if FCurrentList.IndexIn(Nxt) then
    if not Play(Nxt) then
      PlayNext(Handle);
end;

procedure TFormMain.PlayPrev;
var
  Nxt: Integer;
begin
  if FOpenning then
    Exit;
  Nxt := FindPrev(FPlayingId, Handle);
  if FCurrentList.IndexIn(Nxt) then
    if not Play(Nxt) then
      PlayPrev(Handle);
end;

procedure TFormMain.Quit;
begin
  TimerEqu.Enabled := False;
  TimerRefresh.Enabled := False;
  VK.Await;
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

procedure TFormMain.FOnAudioEnd(Sender: TObject);
begin
  PlayNext(False);
end;

procedure TFormMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := False;
  Quit;
end;

procedure TFormMain.CreateLoaders;
begin
  FLoadUsers := TLoadThread.Create(
    procedure
    begin
      TableExFriends.Enabled := False;
      TableExFriends.ItemCount := 0;
      TableExFriends.Repaint;
    end,
    function(LT: TLoadThread): Boolean
    var
      Users: TVkUsers;
      Friend: TFriend;
      i: Integer;
    begin
      FFriends.BeginUpdate;
      FFriends.Clear;
      Result := False;
      try
        if VK.Friends.Get(Users, 'nickname, sex, photo_50') then
        begin
          for i := Low(Users.Items) to High(Users.Items) do
          begin
            if LT.NeedStop then
              Break;
            Friend.Id := Users.Items[i].Id;
            Friend.FirstName := Users.Items[i].FirstName;
            Friend.LastName := Users.Items[i].LastName;
            Friend.AlbumPhoto := Users.Items[i].Photo50;
            Friend.IsClosed := Users.Items[i].CanSeeAudio <> 1;
            FFriends.Add(Friend);
          end;
          Users.Free;
          Result := True;
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

  FLoadPlaylist := TLoadPlaylist.Create(
    procedure
    begin
      TableExCurrent.Enabled := False;
      TableExCurrent.ItemCount := 0;
      TableExCurrent.Repaint;
    end,
    function(LT: TLoadThread; OwnerId, Id: Integer): Boolean
    var
      Audios: TVkAudios;
      Params: TVkAudioParams;
      Audio: TAudio;
      i, M, S: Integer;
    begin
      FCurrentList.BeginUpdate;
      FCurrentList.Clear;
      Result := False;
      try
        Params.OwnerId(OwnerId);
        Params.AlbumId(Id);
        if VK.Audio.Get(Audios, Params) then
        begin
          for i := Low(Audios.Items) to High(Audios.Items) do
          begin
            if not LT.NeedStop then
            begin
              Audio.Artist := Audios.Items[i].Artist;
              Audio.Title := Audios.Items[i].Title;
              Audio.AlbumPhoto := Audios.Items[i].Album.Thumb.Photo68;
              Audio.Id := Audios.Items[i].Id;
              Audio.OwnerId := Audios.Items[i].OwnerId;
              Audio.Restricted := Audios.Items[i].ContentRestricted > 0;
              S := Trunc(Audios.Items[i].duration);
              M := S div 60;
              S := S mod 60;
              Audio.Duration := Format('%d:%.2d', [M, S]);
              FCurrentList.Add(Audio);
            end;
          end;
          Audios.Free;
          Result := True;
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
          Result := True;
        end;
      finally
        FPlaylists.EndUpdate;
      end;
    end,
    procedure(Complete: Boolean)
    begin
      TableExPlaylists.Enabled := True;
    end);

  FLoadMusic := TLoadThread.Create(
    procedure
    begin
      TableExMyMusic.Enabled := False;
      TableExMyMusic.ItemCount := 0;
      TableExMyMusic.Repaint;
    end,
    function(LT: TLoadThread): Boolean
    var
      Audios: TVkAudios;
      Audio: TAudio;
      i, M, S: Integer;
    begin
      //
      FLoadPicMusic.Stop;
      FLoadPicMusic.Await(False);

      FMyMusic.BeginUpdate;
      FMyMusic.Clear;
      Result := False;
      try
        if VK.Audio.Get(Audios, FVkId) then
        begin
          for i := Low(Audios.Items) to High(Audios.Items) do
          begin
            if LT.NeedStop then
              Break;
            Audio.Artist := Audios.Items[i].artist;
            Audio.Title := Audios.Items[i].title;
            Audio.AlbumPhoto := Audios.Items[i].Album.Thumb.Photo68;
            Audio.Id := Audios.Items[i].Id;
            Audio.OwnerId := Audios.Items[i].OwnerId;
            Audio.Restricted := Audios.Items[i].ContentRestricted > 0;
            S := Trunc(Audios.Items[i].duration);
            M := S div 60;
            S := S mod 60;
            Audio.Duration := Format('%d:%.2d', [M, S]);
            FMyMusic.Add(Audio);
          end;
          Audios.Free;
          Result := True;
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

  FLoadSearch := TLoadSearch.Create(
    procedure
    begin
      TableExSearch.Enabled := False;
      TableExSearch.ItemCount := 0;
      TableExSearch.Repaint;
    end,
    function(LT: TLoadThread; Query: string): Boolean
    var
      Audios: TVkAudios;
      Audio: TAudio;
      i, M, S: Integer;
    begin
      FLoadPicSearch.Stop;
      FLoadPicSearch.Await(False);

      FSearchList.BeginUpdate;
      FSearchList.Clear;
      Result := False;
      try
        if VK.Audio.Search(Audios, Query) then
        begin
          try
            for i := Low(Audios.Items) to High(Audios.Items) do
            begin
              if LT.NeedStop then
                Break;

              Audio.Artist := Audios.Items[i].artist;
              Audio.Title := Audios.Items[i].title;
              Audio.AlbumPhoto := Audios.Items[i].Album.Thumb.Photo68;
              Audio.Id := Audios.Items[i].Id;
              Audio.OwnerId := Audios.Items[i].OwnerId;
              Audio.Restricted := Audios.Items[i].ContentRestricted > 0;
              S := Trunc(Audios.Items[i].duration);
              M := S div 60;
              S := S mod 60;
              Audio.Duration := Format('%d:%.2d', [M, S]);
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
            Item.Image := FAlbumThumbs.GetImage(Item.AlbumPhoto, DefImg);
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
end;

procedure TFormMain.FormCreate(Sender: TObject);
var
  i: Integer;
  Stream: TResourceStream;
begin
  FPlayingId := -1;
  FAppLoading := True;
  FOpenning := False;
  FShowLeftTime := False;
  CreateLoaders;

  FAlbumThumbs := TAlbumThumbs.Create;
  FPlayImage := TPngImage.Create;
  FPlayImage.LoadFromResourceName(HInstance, 'play');
  FPauseImage := TPngImage.Create;
  FPauseImage.LoadFromResourceName(HInstance, 'pause');
  FActiveImage := TPngImage.Create;
  FActiveImage.LoadFromResourceName(HInstance, 'active');
  Stream := TResourceStream.Create(HInstance, 'blank', RT_RCDATA);
  i := FAlbumThumbs.Add(TAlbumThumb.CreateItem(TPicture.Create, ''));
  FAlbumThumbs[i].Image.LoadFromStream(Stream);
  Stream.Free;

  FSettings := TSettingsIni.Create(ExtractFilePath(ParamStr(0)) + '\config.ini');
  FMyMusic := TAudioList.Create(TableExMyMusic);
  FCurrentList := TAudioList.Create(TableExCurrent);
  FFriends := TFriends.Create(TableExFriends);
  FPlaylists := TPlaylists.Create(TableExPlaylists);
  FSearchList := TAudioList.Create(TableExSearch);
  FPlayer := TBASSPlayer.Create(Self);
  FToken := FSettings.GetStr('General', 'Token', '');
  if FToken.IsEmpty then
  begin
    FSettings.SetStr('General', 'Token', '');
    FSettings.SetStr('General', 'Url', 'https://vkhost.github.io/');
    //ShowMessage('Укажи токен в config.ini. Ссылка внутри');
    //Halt;
  end;
  FPlayer.OnEnd := FOnAudioEnd;
  FPlayer.Init(Handle);
  for i := 0 to PageControl.PageCount - 1 do
    PageControl.Pages[i].TabVisible := False;

  ImageListL.AddImages(ImageList);
  ColorImages(ImageList, 6, $00ACA09A);
  ColorImages(ImageList, 7, $00ACA09A);
  ColorImages(ImageList, 8, $00ACA09A);
  for i := 0 to ImageListL.Count - 1 do
    ColorImages(ImageListL, i, ColorLighter($00B58251, 20));

  ColorImages(ImageListL, 6, ColorLighter($00ACA09A, 20));
  ColorImages(ImageListL, 7, ColorLighter($00ACA09A, 20));
  ColorImages(ImageListL, 8, ColorLighter($00ACA09A, 20));
  ClearInfo;
  ButtonFlatMyClick(ButtonFlatMy);
  SetRepeat(prNone);
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
  while FLoadPicMusic.IsWorking or FLoadPicSearch.IsWorking or FLoadSearch.IsWorking or
    FLoadPlaylist.IsWorking or FLoadMusic.IsWorking or FLoadPlaylists.IsWorking or FLoadPicCurrent.IsWorking
    or FLoadUsers.IsWorking or FLoadPicFriends.IsWorking do
    Application.ProcessMessages;
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  FPlayer.Stop;
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
end;

procedure TFormMain.VKAuth(Sender: TObject; var Token: string; var TokenExpiry: Int64; var ChangePasswordHash: string);
begin
  Token := FToken;
end;

procedure TFormMain.VKError(Sender: TObject; E: Exception; Code: Integer; Text: string);
begin
  if Code = 5 then
  begin
    FToken := '';
    FSettings.SetStr('General', 'Token', FToken);

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
  ShowMessage(Text);
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
  User: TVkUser;
begin
  FToken := VK.Token;
  FSettings.SetStr('General', 'Token', FToken);

  if VK.Users.Get(User) then
  begin
    FVkId := User.id;
    SetCurrentUser(User);
    User.Free;
    ReloadItems;
    FLoadUsers.Execute;
  end
  else
    FVkId := -1;
  FAppLoading := False;
end;

{ TAlbumThumb }

class function TAlbumThumb.CreateItem(AImage: TPicture; AUrl: string): TAlbumThumb;
begin
  Result.Image := AImage;
  Result.URL := AUrl;
end;

{ TAlbumThumbs }

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

function TAlbumThumbs.GetImage(Url: string; var UseDefault: Boolean): TPicture;
var
  i: Integer;
  Mem: TMemoryStream;
  Item: TAlbumThumb;
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
  Mem := DownloadURL(Url);
  try
    if Mem.Size > 0 then
    begin
      Item.Image := TPicture.Create;
      try
        Item.Image.LoadFromStream(Mem);
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

function TAudioList.Find(Query: string): Integer;
var
  i: Integer;
begin
  Result := -1;
  Query := AnsiLowerCase(Query);
  for i := 0 to Count - 1 do
    if (Pos(Query, AnsiLowerCase(Items[i].Title)) <> 0) or
      (Pos(Query, AnsiLowerCase(Items[i].Artist)) <> 0)
      then
      Exit(i);
end;

end.

