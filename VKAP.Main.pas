unit VKAP.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VK.API, VK.Components, HGM.Common.Settings, Vcl.Grids,
  HGM.Controls.VirtualTable, Vcl.ExtCtrls, BassPlayer, Vcl.StdCtrls, HGM.Button, Vcl.ComCtrls,
  HGM.Controls.PanelExt, System.ImageList, Vcl.ImgList, Vcl.Imaging.pngimage,
  System.Generics.Collections, Vcl.Imaging.jpeg;

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
  end;

  TAlbumThumb = record
    Image: TJpegImage;
    URL: string;
    class function CreateItem(AImage: TJpegImage; AUrl: string): TAlbumThumb; static;
  end;

  TAlbumThumbs = class(TList<TAlbumThumb>)
    function GetImage(Url: string): TJpegImage;
    destructor Destroy; override;
  end;

  TAudioList = TTableData<TAudio>;

  TEquItems = array[1..4] of Double;

  TFormMain = class(TForm)
    VK: TVK;
    TableExList: TTableEx;
    PanelNav: TPanel;
    SaveDialogMp3: TSaveDialog;
    ButtonFlatPlayPause: TButtonFlat;
    TimerRefresh: TTimer;
    ButtonFlatNext: TButtonFlat;
    ButtonFlatPrev: TButtonFlat;
    ButtonFlatDownload: TButtonFlat;
    ImageList: TImageList;
    Panel2: TPanel;
    ImageListL: TImageList;
    DrawPanel1: TDrawPanel;
    ImageAlbum: TImage;
    Panel3: TPanel;
    LabelArtist: TLabel;
    LabelTitle: TLabel;
    Panel4: TPanel;
    LabelTime: TLabel;
    Shape1: TShape;
    ImageBlank: TImage;
    Shape2: TShape;
    PanelInfoBottom: TPanel;
    LabelAudioCount: TLabel;
    PanelPlaylist: TPanel;
    TimerEqu: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure TableExListItemClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure TimerRefreshTimer(Sender: TObject);
    procedure DrawPanel1Paint(Sender: TObject);
    procedure DrawPanel1MouseEnter(Sender: TObject);
    procedure DrawPanel1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DrawPanel1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DrawPanel1MouseLeave(Sender: TObject);
    procedure DrawPanel1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ButtonFlatDownloadClick(Sender: TObject);
    procedure TableExListDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure ButtonFlatPrevClick(Sender: TObject);
    procedure ButtonFlatNextClick(Sender: TObject);
    procedure ButtonFlatPlayPauseClick(Sender: TObject);
    procedure VKLogin(Sender: TObject);
    procedure VKErrorLogin(Sender: TObject; E: Exception; Code: Integer; Text: string);
    procedure VKAuth(Sender: TObject; var Token: string; var TokenExpiry: Int64; var ChangePasswordHash: string);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure LabelTimeClick(Sender: TObject);
    procedure TimerEquTimer(Sender: TObject);
  private
    FMouseInScale: Boolean;
    FMouseInButton: Boolean;
    FMouseIsDown: Boolean;
    FMouseDownPos: TPoint;
    FMousePos: TPoint;
    FScalePercent: Extended;
    FScaleRect: TRect;
    FToken: string;
    FList: TAudioList;
    FPlayingId: Integer;
    FSettings: TSettingsIni;
    FPlayer: TBASSPlayer;
    FAlbumThumbs: TAlbumThumbs;
    FLoadingList: Boolean;
    FWorkerWork: Boolean;
    FShowLeftTime: Boolean;
    FDoStopThreads: Boolean;
    FPlayImage, FActiveImage: TPngImage;
    FEqu: TEquItems;
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
    procedure RefillEqu;
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses
  VK.Entity.Audio, HGM.Common.Utils, Direct2D, D2D1, Math, VK.OAuth2;

{$R *.dfm}

procedure TFormMain.LabelTimeClick(Sender: TObject);
begin
  FShowLeftTime := not FShowLeftTime;
end;

procedure TFormMain.LoadList;
begin
  TableExList.Enabled := False;
  TThread.CreateAnonymousThread(
    procedure
    var
      Audios: TVkAudios;
      Audio: TAudio;
      i, M, S: Integer;
    begin
      try
        FLoadingList := True;
        FList.BeginUpdate;
        FList.Clear;
        if VK.Audio.Get(Audios) then
        begin
          for i := Low(Audios) to High(Audios) do
          begin
            if not FDoStopThreads then
            begin
              Audio.Artist := Audios[i].artist;
              Audio.Title := Audios[i].title;
              Audio.AlbumPhoto := Audios[i].album.thumb.photo_68;
              Audio.Id := Audios[i].Id;
              Audio.OwnerId := Audios[i].owner_id;
              S := Trunc(Audios[i].duration);
              M := S div 60;
              S := S mod 60;
              Audio.Duration := Format('%d:%.2d', [M, S]);
              FList.Add(Audio);
            end;
            Audios[i].Free;
          end;
        end;
      finally
        FList.EndUpdate;
        FLoadingList := False;
        TThread.Synchronize(TThread.CurrentThread,
          procedure
          begin
            if not FDoStopThreads then
            begin
              FAfterLoading;
            end;
          end);
      end;
    end).Start;
end;

procedure TFormMain.FAfterLoading;
begin
  TableExList.Enabled := True;
  LabelAudioCount.Caption := 'Аудиозаписей: ' + Flist.Count.ToString;
  RunAlbumPicWorker;
end;

procedure TFormMain.TableExListDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  TxtRect: TRect;
  S: string;
begin
  with TableExList.Canvas do
  begin
    if not FList.IndexIn(ARow) then
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
          if Assigned(FList[ARow].Image) then
            StretchDraw(Rect, FList[ARow].Image)
          else
            StretchDraw(Rect, FAlbumThumbs[0].Image);
          if FList[ARow].Id = FPlayingId then
          begin
            StretchDraw(Rect, FActiveImage);
            Pen.Width := 2;
            Pen.Color := clWhite;
            MoveTo(Rect.Left + 8 + 5, Rect.Bottom - 8);
            LineTo(Rect.Left + 8 + 5, Round(Rect.Bottom - 8 - 1 - ((15 / 100) * FEqu[1])));

            MoveTo(Rect.Left + 8 + 10, Rect.Bottom - 8);
            LineTo(Rect.Left + 8 + 10, Round(Rect.Bottom - 8 - 1 - ((15 / 100) * FEqu[2])));

            MoveTo(Rect.Left + 8 + 15, Rect.Bottom - 8);
            LineTo(Rect.Left + 8 + 15, Round(Rect.Bottom - 8 - 1 - ((15 / 100) * FEqu[3])));

            MoveTo(Rect.Left + 8 + 20, Rect.Bottom - 8);
            LineTo(Rect.Left + 8 + 20, Round(Rect.Bottom - 8 - 1 - ((15 / 100) * FEqu[4])));
          end
          else if TableExList.ItemUnderMouse = ARow then
            StretchDraw(Rect, FPlayImage);
        end;
      1:
        begin
          Font.Name := 'Roboto';
          Font.Size := 9;
          Font.Quality := fqProof;
          TxtRect := Rect;
          TxtRect.Bottom := TxtRect.CenterPoint.Y;
          TxtRect.Inflate(-1, -1);
          TxtRect.Right := TxtRect.Right - 40;
          S := FList[ARow].Title;
          Font.Style := [fsBold];
          Font.Color := clBlack;
          TextRect(TxtRect, S, [tfSingleLine, tfBottom, tfLeft, tfEndEllipsis]);

          TxtRect := Rect;
          TxtRect.Top := TxtRect.CenterPoint.Y;
          TxtRect.Inflate(-1, -1);
          TxtRect.Right := TxtRect.Right - 40;
          S := FList[ARow].Artist;
          Font.Style := [];
          Font.Color := $00939393;
          TextRect(TxtRect, S, [tfSingleLine, tfTop, tfLeft, tfEndEllipsis]);

          TxtRect := Rect;
          TxtRect.Inflate(-4, -4);
          TxtRect.Left := TxtRect.Right - 40;
          S := FList[ARow].Duration;
          Font.Style := [];
          TextRect(TxtRect, S, [tfSingleLine, tfVerticalCenter, tfCenter]);
        end;
    end;
  end;
end;

function TFormMain.FindNext(CurrentId: Integer): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to FList.Count - 1 do
  begin
    if FList[i].Id = CurrentId then
    begin
      if i < FList.Count then
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
  for i := 0 to FList.Count - 1 do
  begin
    if FList[i].Id = CurrentId then
    begin
      if i > 0 then
        Result := i - 1
      else
        Result := FList.Count - 1;
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
  if FList.IndexIn(Index) then
  begin
    if FPlayer.IsPlay then
      if FPlayingId = FList[Index].Id then
        Exit(True);
    TableExList.ItemIndex := Index;
    FPlayer.Stop;
    Audio := FList[Index];
    FPlayingId := Audio.Id;
    if Audio.Url.IsEmpty then
    begin
      if VK.Audio.GetById(Item, [Audio.OwnerId, Audio.Id]) then
      begin
        Audio.Url := Item.url;
        FList[Index] := Audio;
        Item.Free;
      end
      else
        Exit;
    end;
    if not Audio.Url.IsEmpty then
    begin
      SetInfo(Audio);
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

procedure TFormMain.ButtonFlatDownloadClick(Sender: TObject);
begin
  if FList.IndexIn(TableExList.ItemIndex) then
  begin
    SaveDialogMp3.FileName := FList[TableExList.ItemIndex].Artist + ' - ' + FList[TableExList.ItemIndex].Title + '.mp3';
    if SaveDialogMp3.Execute(Handle) then
    begin
      DownloadURL(FList[TableExList.ItemIndex].Url, SaveDialogMp3.FileName);
    end;
  end;
end;

procedure TFormMain.ClearInfo;
begin
  LabelArtist.Caption := 'Артист';
  LabelTitle.Caption := 'Название';
  LabelTime.Caption := '0:00';
end;

procedure TFormMain.TableExListItemClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
begin
  ClearInfo;
  if not Play(Index) then
    PlayNext;
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
    TableExList.Repaint;
  end
  else
  begin
    FEqu[1] := 0;
    FEqu[2] := 0;
    FEqu[3] := 0;
    FEqu[4] := 0;
  end;
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
    Brush.Color := PanelNav.Color;
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
  Nxt := FindNext(FPlayingId);
  if FList.IndexIn(Nxt) then
    if not Play(Nxt) then
      PlayNext;
end;

procedure TFormMain.PlayPrev;
var
  Nxt: Integer;
begin
  Nxt := FindPrev(FPlayingId);
  if FList.IndexIn(Nxt) then
    if not Play(Nxt) then
      PlayPrev;
end;

procedure TFormMain.RunAlbumPicWorker;
begin
  TThread.CreateAnonymousThread(
    procedure
    var
      i: Integer;
      Item: TAudio;
    begin
      FWorkerWork := True;
      try
        for i := 0 to FList.Count - 1 do
        begin
          if FDoStopThreads then
            Break;
          Item := FList[i];
          if not Assigned(Item.Image) then
          begin
            if not Item.AlbumPhoto.IsEmpty then
            begin
              Item.Image := FAlbumThumbs.GetImage(Item.AlbumPhoto);
              TThread.Synchronize(TThread.CurrentThread,
                procedure
                begin
                  FList[i] := Item;
                  FList.UpdateTable;
                end);
            end
          end;
        end;
      finally
        FWorkerWork := False;
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
  FShowLeftTime := False;
  FDoStopThreads := False;
  FAlbumThumbs := TAlbumThumbs.Create;
  FPlayImage := TPngImage.Create;
  FPlayImage.LoadFromResourceName(HInstance, 'play');
  FActiveImage := TPngImage.Create;
  FActiveImage.LoadFromResourceName(HInstance, 'active');
  Stream := TResourceStream.Create(HInstance, 'blank', RT_RCDATA);
  FAlbumThumbs[FAlbumThumbs.Add(TAlbumThumb.CreateItem(TJpegImage.Create, ''))].Image.LoadFromStream(Stream);
  Stream.Free;
  FSettings := TSettingsIni.Create(ExtractFilePath(ParamStr(0)) + '\config.ini');
  FList := TAudioList.Create(TableExList);
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
end;

procedure TFormMain.Await;
begin
  FDoStopThreads := True;
  while FWorkerWork or FLoadingList do
    Application.ProcessMessages;
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  FPlayer.Stop;
  FList.Free;
  FSettings.Free;
  FAlbumThumbs.Free;
  FPlayImage.Free;
  FActiveImage.Free;
end;

procedure TFormMain.VKAuth(Sender: TObject; var Token: string; var TokenExpiry: Int64; var ChangePasswordHash: string);
begin
  Token := FToken;
end;

procedure TFormMain.VKErrorLogin(Sender: TObject; E: Exception; Code: Integer; Text: string);
begin
  ShowMessage(Text);
end;

procedure TFormMain.VKLogin(Sender: TObject);
begin
  FToken := VK.Token;
  FSettings.SetStr('General', 'Token', FToken);
  LoadList;
  TimerRefresh.Enabled := True;
  TimerEqu.Enabled := True;
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
    Items[i].Image.Free;
  inherited;
end;

function TAlbumThumbs.GetImage(Url: string): TJpegImage;
var
  i: Integer;
  Mem: TMemoryStream;
  Item: TAlbumThumb;
begin
  for i := 0 to Count - 1 do
  begin
    if Items[i].Url = Url then
      Exit(Items[i].Image);
  end;
  Mem := DownloadURL(Url);
  if Mem.Size > 0 then
  begin
    Item.Image := TJpegImage.Create;
    try
      Item.Image.LoadFromStream(Mem);
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

