unit VKAP.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VK.API, VK.Components, HGM.Common.Settings, Vcl.Grids,
  HGM.Controls.VirtualTable, Vcl.ExtCtrls, BassPlayer, Vcl.StdCtrls, HGM.Button, Vcl.ComCtrls,
  HGM.Controls.PanelExt, System.ImageList, Vcl.ImgList, Vcl.Imaging.pngimage,
  System.Generics.Collections, Vcl.Imaging.jpeg, VK.Entity.Playlist;

type
  TAudio = record
    Artist: string;
    Title: string;
    AlbumPhoto: string;
    Image: TJpegImage;
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
    Image: TJpegImage;
    Id: Integer;
    OwnerId: Integer;
  end;

  TFriend = record
    FirstName: string;
    LastName: string;
    Status: string;
    AlbumPhoto: string;
    Image: TJpegImage;
    Id: Integer;
    IsClosed: Boolean;
  end;

  TAlbumThumb = record
    Image: TJpegImage;
    URL: string;
    class function CreateItem(AImage: TJpegImage; AUrl: string): TAlbumThumb; static;
  end;

  TAlbumThumbs = class(TList<TAlbumThumb>)
    function GetImage(Url: string; var Default: Boolean): TJpegImage;
    destructor Destroy; override;
  end;

  TAudioList = TTableData<TAudio>;

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
    DrawPanel1: TDrawPanel;
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
    Edit1: TEdit;
    ButtonFlat1: TButtonFlat;
    ButtonFlat2: TButtonFlat;
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
    procedure FormCreate(Sender: TObject);
    procedure TableExMyMusicItemClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure TimerRefreshTimer(Sender: TObject);
    procedure DrawPanel1Paint(Sender: TObject);
    procedure DrawPanel1MouseEnter(Sender: TObject);
    procedure DrawPanel1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DrawPanel1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DrawPanel1MouseLeave(Sender: TObject);
    procedure DrawPanel1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
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
    FFriends: TFriends;
    FPlaylists: TPlaylists;
    FPlayingId: Integer;
    FSettings: TSettingsIni;
    FPlayer: TBASSPlayer;
    FAlbumThumbs: TAlbumThumbs;
    FLoadingMusic: Boolean;
    FWorkerMusic: Boolean;
    FDoStopMusicThread: Boolean;
    FDoStopMusicWorkerThread: Boolean;
    FLoadingPlaylList: Boolean;
    FWorker2Work: Boolean;
    FDoStopPlaylistWorkerThread: Boolean;
    FLoadingFriends: Boolean;
    FWorkerFriendsWork: Boolean;
    FDoStopFriendsThread: Boolean;
    FLoadingPlaylists: Boolean;
    FDoStopThreads: Boolean;
    FShowLeftTime: Boolean;
    FPlayImage, FActiveImage: TPngImage;
    FPauseImage: TPngImage;
    FEqu: TEquItems;
    FNeedActLeft: Integer;
    FNeedActWidth: Integer;
    FVkId: Integer;
    FActivePlaylist: Integer;
    FOpenning: Boolean;
    procedure FOnAudioEnd(Sender: TObject);
    procedure LoadList;
    function FindNext(CurrentId: Integer): Integer;
    function FindPrev(CurrentId: Integer): Integer;
    function Play(Index: Integer): Boolean;
    procedure ClearInfo;
    procedure SetInfo(Audio: TAudio);
    procedure PlayNext;
    procedure PlayPrev;
    procedure RunAlbumPicWorker;
    procedure Await;
    procedure FAfterLoading;
    procedure FAfterLoadingPL;
    procedure RefillEqu;
    procedure ButtonFlatNavClick(Sender: TObject);
    procedure OpenPlaylists;
    procedure OpenCurrentPlaylist;
    procedure OpenFriends;
    procedure OpenMyMusic;
    procedure LoadPlaylists;
    procedure FillCurrentFromMyMusic;
    procedure UpdateImages(Url: string; Image: TJpegImage);
    procedure FillCurrentFromPlaylist(Index: Integer);
    procedure LoadPlaylist(OwnerId, Id: Integer);
    procedure FAfterLoadingPlaylist;
    procedure ReloadItems;
    procedure RunPlaylistPicWorker;
    procedure LoadFriends;
    procedure FAfterLoadingFriends;
    procedure RunFriendsPicWorker;
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses
  VK.Entity.Audio, VK.Audio, VK.Entity.User, HGM.Common.Utils, Direct2D, D2D1, Math, VK.OAuth2;

{$R *.dfm}

procedure TFormMain.LabelTimeClick(Sender: TObject);
begin
  FShowLeftTime := not FShowLeftTime;
  TimerRefreshTimer(nil);
end;

procedure TFormMain.LoadFriends;
begin
  TableExFriends.Enabled := False;
  TThread.CreateAnonymousThread(
    procedure
    var
      Users: TVkFriends;
      Friend: TFriend;
      i: Integer;
      IsOk: Boolean;
    begin
      FDoStopFriendsThread := True;
      while FLoadingFriends do
        Sleep(100);
      FDoStopFriendsThread := False;
      FLoadingFriends := True;
      FFriends.BeginUpdate;
      FFriends.Clear;
      IsOk := False;
      try
        if VK.Friends.Get(Users, 'nickname, sex, photo_50') then
        begin
          for i := Low(Users.Items) to High(Users.Items) do
          begin
            if FDoStopThreads or FDoStopFriendsThread then
              Break;
            Friend.Id := Users.Items[i].Id;
            Friend.FirstName := Users.Items[i].FirstName;
            Friend.LastName := Users.Items[i].LastName;
            Friend.AlbumPhoto := Users.Items[i].Photo50;
            Friend.IsClosed := Users.Items[i].CanSeeAudio <> 1;
            FFriends.Add(Friend);
          end;
          Users.Free;
          IsOk := True;
        end;
      finally
        if IsOk then
        begin
          if not FDoStopThreads then
          begin
            TThread.Synchronize(TThread.CurrentThread,
              procedure
              begin
                FAfterLoadingFriends;
              end);
          end;
        end;
        FFriends.EndUpdate;
        FLoadingFriends := False;
      end;
    end).Start;
end;

procedure TFormMain.FAfterLoadingFriends;
begin
  TableExFriends.Enabled := True;
  RunFriendsPicWorker;
end;

procedure TFormMain.LoadPlaylist(OwnerId, Id: Integer);
begin
  TableExCurrent.Enabled := False;
  if FLoadingPlaylList then
    Exit;
  if FWorker2Work then
    FDoStopPlaylistWorkerThread := True
  else
    FDoStopPlaylistWorkerThread := False;

  TThread.CreateAnonymousThread(
    procedure
    var
      Audios: TVkAudios;
      Params: TVkAudioParams;
      Audio: TAudio;
      i, M, S: Integer;
      IsOk: Boolean;
    begin
      FLoadingPlaylList := True;
      FCurrentList.BeginUpdate;
      FCurrentList.Clear;
      IsOk := False;
      try
        Params.OwnerId(OwnerId);
        Params.AlbumId(Id);
        if VK.Audio.Get(Audios, Params) then
        begin
          for i := Low(Audios) to High(Audios) do
          begin
            if not FDoStopThreads then
            begin
              Audio.Artist := Audios[i].Artist;
              Audio.Title := Audios[i].Title;
              Audio.AlbumPhoto := Audios[i].Album.Thumb.Photo68;
              Audio.Id := Audios[i].Id;
              Audio.OwnerId := Audios[i].OwnerId;
              Audio.Restricted := Audios[i].ContentRestricted > 0;
              S := Trunc(Audios[i].duration);
              M := S div 60;
              S := S mod 60;
              Audio.Duration := Format('%d:%.2d', [M, S]);
              FCurrentList.Add(Audio);
            end;
            Audios[i].Free;
          end;
          IsOk := True;
        end;
      finally
        if IsOk then
        begin
          if not FDoStopThreads then
          begin
            TThread.Synchronize(TThread.CurrentThread,
              procedure
              begin
                FAfterLoadingPlaylist;
              end);
          end;
        end;
        FCurrentList.EndUpdate;
        FLoadingPlaylList := False;
      end;
    end).Start;
end;

procedure TFormMain.FAfterLoadingPlaylist;
begin
  TableExCurrent.Enabled := True;
  Play(0);
  LabelAudioCount.Caption := 'Аудиозаписей: ' + FCurrentList.Count.ToString;
  RunPlaylistPicWorker
end;

procedure TFormMain.LoadPlaylists;
begin
  TableExPlaylists.Enabled := False;
  TThread.CreateAnonymousThread(
    procedure
    var
      Playlists: TVkPlaylists;
      Playlist: TPlaylist;
      i: Integer;
      IsOk, DefImg: Boolean;
    begin
      FLoadingPlaylists := True;
      IsOk := False;
      FPlaylists.BeginUpdate;
      FPlaylists.Clear;
      try
        if VK.Audio.GetPlaylists(Playlists, FVkId) then
        begin
          for i := Low(Playlists) to High(Playlists) do
          begin
            if not FDoStopThreads then
            begin
              Playlist.Description := Playlists[i].Description;
              Playlist.Title := Playlists[i].Title;
              if Assigned(Playlists[i].Photo) then
                Playlist.AlbumPhoto := Playlists[i].Photo.Photo68
              else
                Playlist.AlbumPhoto := '';
              Playlist.Image := FAlbumThumbs.GetImage(Playlist.AlbumPhoto, DefImg);
              Playlist.Id := Playlists[i].Id;
              Playlist.OwnerId := Playlists[i].OwnerId;
              Playlist.Count := Playlists[i].Count;
              FPlaylists.Add(Playlist);
            end;
            Playlists[i].Free;
          end;
          IsOk := True;
        end;
      finally
        if IsOk then
        begin
          TThread.Synchronize(TThread.CurrentThread,
            procedure
            begin
              if not FDoStopThreads then
              begin
                FAfterLoadingPL;
              end;
            end);
        end;
        FPlaylists.EndUpdate;
        FLoadingPlaylists := False;
      end;
    end).Start;
end;

procedure TFormMain.FAfterLoadingPL;
begin
  TableExPlaylists.Enabled := True;
end;

procedure TFormMain.LoadList;
begin
  TableExMyMusic.Enabled := False;
  TThread.CreateAnonymousThread(
    procedure
    var
      Audios: TVkAudios;
      Audio: TAudio;
      i, M, S: Integer;
      IsOk: Boolean;
    begin
      FDoStopMusicThread := True;
      FDoStopMusicWorkerThread := True;
      while FLoadingMusic or FWorkerMusic do
        Sleep(100);
      FDoStopMusicThread := False;
      FDoStopMusicWorkerThread := False;
      FLoadingMusic := True;
      FMyMusic.BeginUpdate;
      FMyMusic.Clear;
      IsOk := False;
      try
        if VK.Audio.Get(Audios, FVkId) then
        begin
          for i := Low(Audios) to High(Audios) do
          begin
            if not (FDoStopThreads or FDoStopMusicThread) then
            begin
              Audio.Artist := Audios[i].artist;
              Audio.Title := Audios[i].title;
              Audio.AlbumPhoto := Audios[i].Album.Thumb.Photo68;
              Audio.Id := Audios[i].Id;
              Audio.OwnerId := Audios[i].OwnerId;
              Audio.Restricted := Audios[i].ContentRestricted > 0;
              S := Trunc(Audios[i].duration);
              M := S div 60;
              S := S mod 60;
              Audio.Duration := Format('%d:%.2d', [M, S]);
              FMyMusic.Add(Audio);
            end;
            Audios[i].Free;
          end;
          IsOk := True;
        end;
      finally
        if IsOk then
        begin
          if (not FDoStopThreads) and (not FDoStopMusicThread) then
          begin
            TThread.Synchronize(TThread.CurrentThread,
              procedure
              begin
                FAfterLoading;
              end);
          end;
        end;
        FMyMusic.EndUpdate;
        FLoadingMusic := False;
      end;
    end).Start;
end;

procedure TFormMain.FAfterLoading;
begin
  TableExMyMusic.Enabled := True;
  RunAlbumPicWorker;
  FillCurrentFromMyMusic;
end;

procedure TFormMain.TableExCurrentDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
var
  TxtRect: TRect;
  S: string;
begin
  with TableExCurrent.Canvas do
  begin
    if not FCurrentList.IndexIn(ARow) then
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
          if Assigned(FCurrentList[ARow].Image) then
            StretchDraw(Rect, FCurrentList[ARow].Image)
          else
            StretchDraw(Rect, FAlbumThumbs[0].Image);

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
    PlayNext;
end;

procedure TFormMain.TableExFriendsDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
var
  TxtRect: TRect;
  S: string;
begin
  with TableExFriends.Canvas do
  begin
    if not FFriends.IndexIn(ARow) then
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
            StretchDraw(Rect, FFriends[ARow].Image)
          else
            StretchDraw(Rect, FAlbumThumbs[0].Image);
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

procedure TFormMain.TableExFriendsItemClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
var
  Params: TVkAudioParams;
  Audios: TVkAudios;
begin
  if not FFriends.IndexIn(Index) then
    Exit;
  FVkId := FFriends[Index].Id;
  Params.OwnerId(FVkId);
  Params.Count(1);
  if VK.Audio.Get(Audios, Params) then
  begin
    Audios[0].Free;
    ReloadItems;
  end
  else
    ShowMessage('Музыка закрыта или её нет');
end;

procedure TFormMain.TableExMyMusicDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
var
  TxtRect: TRect;
  S: string;
begin
  with TableExMyMusic.Canvas do
  begin
    if not FMyMusic.IndexIn(ARow) then
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
          if Assigned(FMyMusic[ARow].Image) then
            StretchDraw(Rect, FMyMusic[ARow].Image)
          else
            StretchDraw(Rect, FAlbumThumbs[0].Image);
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
  LoadPlaylist(FPlaylists[Index].OwnerId, FPlaylists[Index].Id);
end;

function TFormMain.FindNext(CurrentId: Integer): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to FCurrentList.Count - 1 do
  begin
    if FCurrentList[i].Id = CurrentId then
    begin
      if i < FCurrentList.Count then
        Result := i + 1
      else
        Result := 0;
      Exit;
    end;
  end;
end;

function TFormMain.FindPrev(CurrentId: Integer): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to FCurrentList.Count - 1 do
  begin
    if FCurrentList[i].Id = CurrentId then
    begin
      if i > 0 then
        Result := i - 1
      else
        Result := FCurrentList.Count - 1;
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
      else
        FPlayer.Resume;
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
      if VK.Audio.GetById(Item, [Audio.OwnerId, Audio.Id]) then
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
  PlayNext;
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
  PlayPrev;
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
    PlayNext;
end;

procedure TFormMain.TableExPlaylistsDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
var
  TxtRect: TRect;
  S: string;
begin
  with TableExPlaylists.Canvas do
  begin
    if not FPlaylists.IndexIn(ARow) then
    begin
      if ACol = 1 then
      begin
        TxtRect := Rect;
        TxtRect.Left := 0;
        TxtRect.Inflate(-4, -4);
        if FLoadingPlaylists then
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
            StretchDraw(Rect, FPlaylists[ARow].Image)
          else
            StretchDraw(Rect, FAlbumThumbs[0].Image);
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
    DrawPanel1.Repaint;
    ButtonFlatPlayPause.ImageIndex := 4;
  end
  else
    ButtonFlatPlayPause.ImageIndex := 0;
end;

procedure TFormMain.DrawPanel1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FMouseDownPos := Point(X, Y);
  case Button of
    TMouseButton.mbLeft:
      begin
        FMouseIsDown := True; //FScaleRect.Contains(FMousePos);
      end;
  end;
  DrawPanel1Paint(nil);
end;

procedure TFormMain.DrawPanel1MouseEnter(Sender: TObject);
begin
  FMouseInScale := True;
  DrawPanel1Paint(nil);
end;

procedure TFormMain.DrawPanel1MouseLeave(Sender: TObject);
begin
  FMouseInScale := False;
  DrawPanel1Paint(nil);
end;

procedure TFormMain.DrawPanel1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  FMousePos := Point(X, Y);
  if FScaleRect.Contains(FMousePos) then
    DrawPanel1.Cursor := crHandPoint
  else
    DrawPanel1.Cursor := crDefault;
  DrawPanel1Paint(nil);
end;

procedure TFormMain.DrawPanel1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
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
  DrawPanel1Paint(nil);
end;

procedure TFormMain.DrawPanel1Paint(Sender: TObject);
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
  MRect := DrawPanel1.ClientRect;
  with TDirect2DCanvas.Create(DrawPanel1.Canvas, MRect) do
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

procedure TFormMain.PlayNext;
var
  Nxt: Integer;
begin
  if FOpenning then
    Exit;
  Nxt := FindNext(FPlayingId);
  if FCurrentList.IndexIn(Nxt) then
    if not Play(Nxt) then
      PlayNext;
end;

procedure TFormMain.PlayPrev;
var
  Nxt: Integer;
begin
  if FOpenning then
    Exit;
  Nxt := FindPrev(FPlayingId);
  if FCurrentList.IndexIn(Nxt) then
    if not Play(Nxt) then
      PlayPrev;
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

procedure TFormMain.RunPlaylistPicWorker;
begin
  TThread.CreateAnonymousThread(
    procedure
    var
      i: Integer;
      Item: TAudio;
      DefImg: Boolean;
    begin
      while FWorker2Work do
        Sleep(100);
      if FDoStopThreads or FDoStopPlaylistWorkerThread then
        Exit;
      FWorker2Work := True;
      try
        for i := 0 to FCurrentList.Count - 1 do
        begin
          if FDoStopThreads or FDoStopPlaylistWorkerThread then
            Break;
          Item := FCurrentList[i];
          if not Assigned(Item.Image) then
          begin
            if not Item.AlbumPhoto.IsEmpty then
            begin
              Item.Image := FAlbumThumbs.GetImage(Item.AlbumPhoto, DefImg);
              if FDoStopThreads or FDoStopPlaylistWorkerThread then
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
      finally
        FWorker2Work := False;
        FDoStopPlaylistWorkerThread := False;
      end;
    end).Start;
end;

procedure TFormMain.RunFriendsPicWorker;
begin
  TThread.CreateAnonymousThread(
    procedure
    var
      i: Integer;
      Item: TFriend;
      DefImg: Boolean;
    begin
      while FWorkerFriendsWork do
        Sleep(100);
      FWorkerFriendsWork := True;
      try
        for i := 0 to FFriends.Count - 1 do
        begin
          if FDoStopThreads then
            Break;
          Item := FFriends[i];
          if not Assigned(Item.Image) then
          begin
            if not Item.AlbumPhoto.IsEmpty then
            begin
              Item.Image := FAlbumThumbs.GetImage(Item.AlbumPhoto, DefImg);
              if not DefImg then
                UpdateImages(Item.AlbumPhoto, Item.Image);
              if FDoStopThreads then
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
      finally
        FWorkerFriendsWork := False;
      end;
    end).Start;
end;

procedure TFormMain.RunAlbumPicWorker;
begin
  TThread.CreateAnonymousThread(
    procedure
    var
      i: Integer;
      Item: TAudio;
      DefImg: Boolean;
    begin
      FDoStopMusicWorkerThread := True;
      while FWorkerMusic do
        Sleep(100);
      FDoStopMusicWorkerThread := False;
      FWorkerMusic := True;
      try
        for i := 0 to FMyMusic.Count - 1 do
        begin
          if FDoStopThreads or FDoStopMusicWorkerThread then
            Break;
          Item := FMyMusic[i];
          if not Assigned(Item.Image) then
          begin
            if not Item.AlbumPhoto.IsEmpty then
            begin
              Item.Image := FAlbumThumbs.GetImage(Item.AlbumPhoto, DefImg);
              if not DefImg then
                UpdateImages(Item.AlbumPhoto, Item.Image);
              if FDoStopThreads or FDoStopMusicWorkerThread then
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
      finally
        FWorkerMusic := False;
      end;
    end).Start;
end;

procedure TFormMain.FOnAudioEnd(Sender: TObject);
begin
  PlayNext;
end;

procedure TFormMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TimerEqu.Enabled := False;
  TimerRefresh.Enabled := False;
  VK.Await;
  Await;
  CanClose := True;
end;

procedure TFormMain.FormCreate(Sender: TObject);
var
  i: Integer;
  Stream: TResourceStream;
begin
  FPlayingId := -1;
  FOpenning := False;
  FShowLeftTime := False;
  FDoStopThreads := False;
  FDoStopMusicWorkerThread := False;

  FAlbumThumbs := TAlbumThumbs.Create;
  FPlayImage := TPngImage.Create;
  FPlayImage.LoadFromResourceName(HInstance, 'play');
  FPauseImage := TPngImage.Create;
  FPauseImage.LoadFromResourceName(HInstance, 'pause');
  FActiveImage := TPngImage.Create;
  FActiveImage.LoadFromResourceName(HInstance, 'active');
  Stream := TResourceStream.Create(HInstance, 'blank', RT_RCDATA);
  i := FAlbumThumbs.Add(TAlbumThumb.CreateItem(TJpegImage.Create, ''));
  FAlbumThumbs[i].Image.LoadFromStream(Stream);
  Stream.Free;

  FSettings := TSettingsIni.Create(ExtractFilePath(ParamStr(0)) + '\config.ini');
  FMyMusic := TAudioList.Create(TableExMyMusic);
  FCurrentList := TAudioList.Create(TableExCurrent);
  FFriends := TFriends.Create(TableExFriends);
  FPlaylists := TPlaylists.Create(TableExPlaylists);
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
  ImageListL.AddImages(ImageList);
  for i := 0 to ImageListL.Count - 1 do
    ColorImages(ImageListL, i, ColorLighter($00B58251, 20));
  ClearInfo;
  ButtonFlatMyClick(ButtonFlatMy);
  TimerEqu.Enabled := True;
end;

procedure TFormMain.Await;
begin
  FDoStopThreads := True;
  while FWorkerMusic or FLoadingMusic or FLoadingPlaylists or FWorker2Work or FLoadingFriends or FWorkerFriendsWork do
    Application.ProcessMessages;
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  FPlayer.Stop;
  FCurrentList.Free;
  FMyMusic.Free;
  FFriends.Free;
  FPlaylists.Free;
  FSettings.Free;
  FPlayImage.Free;
  FPauseImage.Free;
  FActiveImage.Free;
  FAlbumThumbs.Free;
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
  end
  else
    ShowMessage(Text);
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
  LoadList;
  LoadPlaylists;
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
    //FVkId := 295621104;
    Caption := 'VK Audio Player [' + User.FirstName + ']';
    User.Free;
    ReloadItems;
    LoadFriends;
  end
  else
    FVkId := -1;
end;

{ TAlbumThumb }

class function TAlbumThumb.CreateItem(AImage: TJpegImage; AUrl: string): TAlbumThumb;
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

function TAlbumThumbs.GetImage(Url: string; var Default: Boolean): TJpegImage;
var
  i: Integer;
  Mem: TMemoryStream;
  Item: TAlbumThumb;
begin
  Default := True;
  for i := 0 to Count - 1 do
  begin
    Default := i = 0;
    if Items[i].Url = Url then
      Exit(Items[i].Image);
  end;
  Mem := DownloadURL(Url);
  if Mem.Size > 0 then
  begin
    Item.Image := TJpegImage.Create;
    try
      Item.Image.LoadFromStream(Mem);
      Default := False;
    except
      begin
        Item.Image.Free;
        Item.Image := Items[0].Image;
      end;
    end;
    Item.URL := Url;
    i := Add(Item);
    Result := Items[i].Image;
  end
  else
    Result := Items[0].Image;
  Mem.Free;
end;

end.

