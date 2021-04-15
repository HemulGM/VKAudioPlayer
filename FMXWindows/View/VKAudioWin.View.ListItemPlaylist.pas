unit VKAudioWin.View.ListItemPlaylist;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms,
  FMX.Graphics, FMX.Dialogs, FMX.Layouts, FMX.TabControl, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.ListBox,
  FMX.Objects, FMX.Ani, VK.Entity.Playlist, System.ImageList, VK.Entity.Profile, FMX.ImgList, FMX.Effects,
  FMX.Filter.Effects, VKAudioWin.Classes;

type
  TOnOpenPlaylist = procedure(Sender: TObject; const PlaylistInfo: TPlaylistInfo) of object;

  TListBoxItemPlaylist = class(TListBoxItem)
  private
    FHotAnimate: TFloatAnimation;
    FHotAnimateControls: TFloatAnimation;
    FPlaylistInfo: TPlaylistInfo;
    FAlbum: TBitmap;
    FAlbumPhoto: string;
    RectangleItemImage: TRectangle;
    RectangleItemImageHot: TRectangle;
    LayoutItemText: TLayout;
    LabelItemCount: TLabel;
    LabelItemText: TLabel;
    LabelItemStats: TLabel;
    GlyphStats: TGlyph;
    GlyphCount: TGlyph;
    LabelItemDetail: TLabel;
    LabelItemYear: TLabel;
    LayoutControls: TLayout;
    SpeedButtonAdd: TSpeedButton;
    SpeedButtonPlay: TSpeedButton;
    SpeedButtonShare: TSpeedButton;
    FOnOpen: TOnOpenPlaylist;
    FOnPlay: TOnOpenPlaylist;
    FSVGList: TCustomImageList;
    FDefaultImage: TBitmap;
    procedure FMouseEnter(Sender: TObject);
    procedure FMouseLeave(Sender: TObject);
    procedure FOnBitmapChange(Sender: TObject);
    procedure SpeedButtonAddMouseEnter(Sender: TObject);
    procedure FOnClick(Sender: TObject);
    procedure FOnClickPlay(Sender: TObject);
    procedure SetOnOpen(const Value: TOnOpenPlaylist);
    procedure SetOnPlay(const Value: TOnOpenPlaylist);
    procedure SetSVGList(const Value: TCustomImageList);
    procedure SetDefaultImage(const Value: TBitmap);
  public
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; Playlist: TVkAudioPlaylist); overload;
    constructor Create(AOwner: TComponent; From: TListBoxItemPlaylist); overload;
    destructor Destroy; override;
    property PlaylistInfo: TPlaylistInfo read FPlaylistInfo;
    property OnOpen: TOnOpenPlaylist read FOnOpen write SetOnOpen;
    procedure SetActive(const Value: Boolean);
    property OnPlay: TOnOpenPlaylist read FOnPlay write SetOnPlay;
    property SVGList: TCustomImageList read FSVGList write SetSVGList;
    property DefaultImage: TBitmap read FDefaultImage write SetDefaultImage;
  end;

implementation

uses
  HGM.FMX.Image;

{ TListBoxItemAudio }

constructor TListBoxItemPlaylist.Create(AOwner: TComponent);
begin
  inherited;
  FAlbum := TBitmap.Create;
  FAlbum.OnChange := FOnBitmapChange;
  RectangleItemImage := TRectangle.Create(Self);
  RectangleItemImageHot := TRectangle.Create(Self);
  LabelItemCount := TLabel.Create(Self);
  LabelItemStats := TLabel.Create(Self);
  LayoutItemText := TLayout.Create(Self);
  LabelItemText := TLabel.Create(Self);
  LabelItemDetail := TLabel.Create(Self);
  LabelItemYear := TLabel.Create(Self);
  LayoutControls := TLayout.Create(Self);
  SpeedButtonAdd := TSpeedButton.Create(Self);
  SpeedButtonPlay := TSpeedButton.Create(Self);
  SpeedButtonShare := TSpeedButton.Create(Self);
  FHotAnimate := TFloatAnimation.Create(Self);
  FHotAnimateControls := TFloatAnimation.Create(Self);

  HitTest := True;
  Height := 210;
  Width := 153;
  Padding.Rect := TRectF.Create(5, 5, 5, 5);

  RectangleItemImage.Parent := Self;
  RectangleItemImage.Align := TAlignLayout.Center;
  RectangleItemImage.Height := 143;
  RectangleItemImage.HitTest := True;
  RectangleItemImage.Fill.Kind := TBrushKind.Bitmap;
  RectangleItemImage.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
  RectangleItemImage.OnMouseEnter := FMouseEnter;
  RectangleItemImage.OnMouseLeave := FMouseLeave;
  RectangleItemImage.Stroke.Kind := TBrushKind.None;
  RectangleItemImage.Width := 143;
  RectangleItemImage.XRadius := 8;
  RectangleItemImage.YRadius := 8;

  RectangleItemImageHot.Parent := Self;
  RectangleItemImageHot.Align := TAlignLayout.Center;
  RectangleItemImageHot.Height := 143;
  RectangleItemImageHot.HitTest := True;
  RectangleItemImageHot.OnClick := FOnClick;
  RectangleItemImageHot.Fill.Kind := TBrushKind.Solid;
  RectangleItemImageHot.Fill.Color := $66000000;
  RectangleItemImageHot.OnMouseEnter := FMouseEnter;
  RectangleItemImageHot.OnMouseLeave := FMouseLeave;
  RectangleItemImageHot.Stroke.Kind := TBrushKind.None;
  RectangleItemImageHot.Width := 143;
  RectangleItemImageHot.XRadius := 8;
  RectangleItemImageHot.YRadius := 8;
  RectangleItemImageHot.Opacity := 0;
  RectangleItemImageHot.Visible := True;

  FHotAnimate.Parent := RectangleItemImageHot;
  FHotAnimate.PropertyName := 'Opacity';
  FHotAnimate.Delay := 0;
  FHotAnimate.Duration := 0.2;

  LabelItemCount.Parent := RectangleItemImageHot;
  LabelItemCount.Text := '20';
  LabelItemCount.Height := 17;
  LabelItemCount.Width := 40;
  LabelItemCount.StyledSettings := [TStyledSetting.Family, TStyledSetting.Size, TStyledSetting.Style];
  LabelItemCount.FontColor := TAlphaColorRec.White;
  LabelItemCount.Position.Point := TPointF.Create(43, 115);

  LabelItemStats.Parent := RectangleItemImageHot;
  LabelItemStats.Text := '654';
  LabelItemStats.Height := 17;
  LabelItemStats.Width := 40;
  LabelItemStats.StyledSettings := [TStyledSetting.Family, TStyledSetting.Size, TStyledSetting.Style];
  LabelItemStats.FontColor := TAlphaColorRec.White;
  LabelItemStats.Position.Point := TPointF.Create(92, 115);

  GlyphStats := TGlyph.Create(Self);
  with GlyphStats do
  begin
    Parent := RectangleItemImageHot;
    Position.X := 79;
    Position.Y := 115;
    Size.Width := 19;
    Size.Height := 20;
    ImageIndex := 12;
  end;

  GlyphCount := TGlyph.Create(Self);
  with GlyphCount do
  begin
    Parent := RectangleItemImageHot;
    Position.X := 31;
    Position.Y := 115;
    Size.Width := 20;
    Size.Height := 17;
    ImageIndex := 11;
  end;

  LayoutItemText.Parent := Self;
  LayoutItemText.Align := TAlignLayout.Bottom;
  LayoutItemText.Margins.Rect := TRectF.Create(0, 8, 0, 0);
  LayoutItemText.Height := 49;

  LabelItemText.Parent := LayoutItemText;
  LabelItemText.Align := TAlignLayout.MostTop;
  LabelItemText.Height := 16;
  LabelItemText.StyledSettings := [TStyledSetting.FontColor];
  LabelItemText.TextSettings.Font.Family := 'Roboto';
  LabelItemText.TextSettings.Font.Size := 13;
  LabelItemText.Text := 'Новогодний';
  LabelItemText.WordWrap := False;

  LabelItemDetail.Parent := LayoutItemText;
  LabelItemDetail.Align := TAlignLayout.Top;
  LabelItemDetail.Height := 16;
  LabelItemDetail.Margins.Rect := TRectF.Create(0, 0, 0, 3);
  LabelItemDetail.StyledSettings := [];
  LabelItemDetail.TextSettings.Font.Family := 'Roboto';
  LabelItemDetail.TextSettings.Font.Size := 13;
  LabelItemDetail.TextSettings.FontColor := $FF939393;
  LabelItemDetail.Text := 'Noize MC';
  LabelItemDetail.WordWrap := False;

  LabelItemYear.Parent := LayoutItemText;
  LabelItemYear.Align := TAlignLayout.Bottom;
  LabelItemYear.Height := 16;
  LabelItemYear.Margins.Rect := TRectF.Create(0, 0, 0, 3);
  LabelItemYear.StyledSettings := [];
  LabelItemYear.TextSettings.Font.Family := 'Roboto';
  LabelItemYear.TextSettings.Font.Size := 13;
  LabelItemYear.TextSettings.FontColor := $FF939393;
  LabelItemYear.Text := '2017';

  LayoutControls.Parent := RectangleItemImageHot;
  LayoutControls.Align := TAlignLayout.Center;
  LayoutControls.Padding.Rect := TRectF.Create(2, 0, 2, 0);
  LayoutControls.Margins.Rect := TRectF.Create(0, 5, 0, 0);
  LayoutControls.Height := 60;
  LayoutControls.Width := 125;

  FHotAnimateControls.Parent := LayoutControls;
  FHotAnimateControls.PropertyName := 'Margins.Top';
  FHotAnimateControls.Delay := 0;
  FHotAnimateControls.Duration := 0.2;

  SpeedButtonAdd.Parent := LayoutControls;
  SpeedButtonAdd.Align := TAlignLayout.Left;
  SpeedButtonAdd.ImageIndex := 8;
  SpeedButtonAdd.StyleLookup := 'SpeedButton9Style1';
  SpeedButtonAdd.Text := '';
  SpeedButtonAdd.Width := 28;
  SpeedButtonAdd.OnMouseEnter := SpeedButtonAddMouseEnter;
  SpeedButtonAdd.OnMouseLeave := SpeedButtonAddMouseEnter;

  SpeedButtonPlay.Parent := LayoutControls;
  SpeedButtonPlay.Align := TAlignLayout.Center;
  SpeedButtonPlay.ImageIndex := 9;
  SpeedButtonPlay.Margins.Rect := TRectF.Create(4, 0, 0, 0);
  SpeedButtonPlay.StyleLookup := 'SpeedButtonPlaylistPlay';
  SpeedButtonPlay.Text := '';
  SpeedButtonPlay.Width := 52;
  SpeedButtonPlay.Height := 59;
  SpeedButtonPlay.OnClick := FOnClickPlay;

  SpeedButtonShare.Parent := LayoutControls;
  SpeedButtonShare.Align := TAlignLayout.Right;
  SpeedButtonShare.ImageIndex := 10;
  SpeedButtonShare.Margins.Rect := TRectF.Create(0, 0, 0, 6);
  SpeedButtonShare.StyleLookup := 'SpeedButton9Style1';
  SpeedButtonShare.Text := '';
  SpeedButtonShare.Width := 32;
end;

procedure TListBoxItemPlaylist.FMouseEnter(Sender: TObject);
begin
  if (FHotAnimate.StopValue <> 1) or (RectangleItemImageHot.Opacity < 1) and (not FHotAnimate.Running) then
  begin
    FHotAnimate.Enabled := False;
    FHotAnimate.StartValue := RectangleItemImageHot.Opacity;
    FHotAnimate.StopValue := 1;
    FHotAnimate.Enabled := True;

    FHotAnimateControls.Enabled := False;
    FHotAnimateControls.StartValue := LayoutControls.Margins.Top;
    FHotAnimateControls.StopValue := 0;
    FHotAnimateControls.Enabled := True;
  end;
end;

procedure TListBoxItemPlaylist.FMouseLeave(Sender: TObject);
begin
  if not LayoutControls.AbsoluteRect.Contains(LayoutControls.Scene.ScreenToLocal(Screen.MousePos)) then
  begin
    FHotAnimate.Enabled := False;
    FHotAnimate.StartValue := RectangleItemImageHot.Opacity;
    FHotAnimate.StopValue := 0;
    FHotAnimate.Enabled := True;

    FHotAnimateControls.Enabled := False;
    FHotAnimateControls.StartValue := LayoutControls.Margins.Top;
    FHotAnimateControls.StopValue := 5;
    FHotAnimateControls.Enabled := True;
  end;
end;

procedure TListBoxItemPlaylist.SetActive(const Value: Boolean);
begin
  if Value then
    SpeedButtonPlay.ImageIndex := 14
  else
    SpeedButtonPlay.ImageIndex := 9;
end;

procedure TListBoxItemPlaylist.SetDefaultImage(const Value: TBitmap);
begin
  FDefaultImage := Value;
  RectangleItemImage.Fill.Bitmap.Bitmap := FDefaultImage;
end;

procedure TListBoxItemPlaylist.SetOnOpen(const Value: TOnOpenPlaylist);
begin
  FOnOpen := Value;
end;

procedure TListBoxItemPlaylist.SetOnPlay(const Value: TOnOpenPlaylist);
begin
  FOnPlay := Value;
end;

procedure TListBoxItemPlaylist.SetSVGList(const Value: TCustomImageList);
begin
  FSVGList := Value;
  SpeedButtonAdd.Images := FSVGList;
  SpeedButtonPlay.Images := FSVGList;
  SpeedButtonShare.Images := FSVGList;
  GlyphCount.Images := FSVGList;
  GlyphStats.Images := FSVGList;
end;

procedure TListBoxItemPlaylist.SpeedButtonAddMouseEnter(Sender: TObject);
begin
  //
end;

procedure TListBoxItemPlaylist.FOnBitmapChange(Sender: TObject);
begin
  RectangleItemImage.Fill.Kind := TBrushKind.Bitmap;
  RectangleItemImage.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
  RectangleItemImage.Fill.Bitmap.Bitmap := FAlbum;
end;

procedure TListBoxItemPlaylist.FOnClick(Sender: TObject);
begin
  if Assigned(FOnOpen) then
    FOnOpen(Self, FPlaylistInfo);
end;

procedure TListBoxItemPlaylist.FOnClickPlay(Sender: TObject);
begin
  if Assigned(FOnPlay) then
    FOnPlay(Self, FPlaylistInfo);
end;

constructor TListBoxItemPlaylist.Create(AOwner: TComponent; Playlist: TVkAudioPlaylist);

  function NumToShortString(const Value: Integer): string;
  begin
    if Value >= 1000000000 then
      Result := FormatFloat('0.0b', Value / 1000000000)
    else if Value >= 1000000 then
      Result := FormatFloat('0.0m', Value / 1000000)
    else if Value >= 1000 then
      Result := FormatFloat('0.0k', Value / 1000)
    else
      Result := Value.ToString;
  end;

begin
  Create(AOwner);
  if Playlist.IsFollowing then
    SpeedButtonAdd.ImageIndex := 8
  else
    SpeedButtonAdd.ImageIndex := 13;
  LabelItemCount.Text := NumToShortString(Playlist.Count);
  LabelItemStats.Text := NumToShortString(Playlist.Plays);
  if Length(Playlist.MainArtists) > 0 then
    LabelItemDetail.Text := Playlist.MainArtists[0].Name
  else
    LabelItemDetail.Text := Playlist.Description;
  if Playlist.Year > 0 then
    LabelItemYear.Text := Playlist.Year.ToString
  else
    LabelItemYear.Text := '';

  LabelItemText.Text := Playlist.Title;
  if Assigned(Playlist.Photo) then
    FAlbumPhoto := Playlist.Photo.Photo270
  else
    FAlbumPhoto := '';
  FAlbum.LoadFromUrlAsync(FAlbumPhoto);
  FPlaylistInfo.Id := Playlist.Id;
  FPlaylistInfo.OwnerId := Playlist.OwnerId;
  FPlaylistInfo.AccessKey := Playlist.AccessKey;
  FPlaylistInfo.Title := LabelItemText.Text;
  FPlaylistInfo.Detail := LabelItemDetail.Text;
  FPlaylistInfo.CoverUrl := FAlbumPhoto;
  FPlaylistInfo.Info := Playlist.Plays.ToString + ' прослушивания · обновлён ' + DateTimeToStr(Playlist.UpdateTime);
end;

constructor TListBoxItemPlaylist.Create(AOwner: TComponent; From: TListBoxItemPlaylist);
begin
  Create(AOwner);
  LabelItemCount.Text := From.LabelItemCount.Text;
  LabelItemStats.Text := From.LabelItemStats.Text;
  LabelItemDetail.Text := From.LabelItemDetail.Text;
  LabelItemYear.Text := From.LabelItemYear.Text;
  LabelItemText.Text := From.LabelItemText.Text;
  FAlbumPhoto := From.FAlbumPhoto;
  FAlbum.LoadFromUrlAsync(FAlbumPhoto);
  FPlaylistInfo := From.PlaylistInfo;
end;

destructor TListBoxItemPlaylist.Destroy;
begin
  FAlbum.Free;
  inherited;
end;

end.

