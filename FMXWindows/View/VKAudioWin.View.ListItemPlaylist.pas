unit VKAudioWin.View.ListItemPlaylist;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms,
  FMX.Graphics, FMX.Dialogs, FMX.Layouts, FMX.TabControl, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.ListBox,
  FMX.Objects, FMX.Ani, VK.Entity.Playlist, System.ImageList, VK.Entity.Profile, FMX.ImgList, FMX.Effects,
  FMX.Filter.Effects, VKAudioWin.Classes;

type
  TListBoxItemPlaylist = class(TListBoxItem)
  private
    FPlaylistInfo: TPlaylistInfo;
    FAlbum: TBitmap;
    FAlbumPhoto: string;
    RectangleItemImage: TRectangle;
    RectangleItemImageHot: TRectangle;
    LabelItemCount: TLabel;
    LayoutItemText: TLayout;
    LabelItemText: TLabel;
    LabelItemStats: TLabel;
    LabelItemDetail: TLabel;
    LabelItemYear: TLabel;
    LayoutControls: TLayout;
    SpeedButtonAdd: TSpeedButton;
    SpeedButtonPlay: TSpeedButton;
    SpeedButtonShare: TSpeedButton;
    procedure FMouseEnter(Sender: TObject);
    procedure FMouseLeave(Sender: TObject);
    procedure FOnBitmapChange(Sender: TObject);
    procedure SpeedButtonAddMouseEnter(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; Playlist: TVkAudioPlaylist); overload;
    constructor Create(AOwner: TComponent; From: TListBoxItemPlaylist); overload;
    destructor Destroy; override;
    property PlaylistInfo: TPlaylistInfo read FPlaylistInfo;
  end;

implementation

{
var
  Rectangle32 := TRectangle.Create(Self);
  Layout40 := TLayout.Create(Self);
  Label37 := TLabel.Create(Self);
  Label38 := TLabel.Create(Self);
  Label39 := TLabel.Create(Self);
  RectanglePlaylistCover := TRectangle.Create(Self);
  LayoutPlaylistControls := TLayout.Create(Self);
  SpeedButton5 := TSpeedButton.Create(Self);
  SpeedButton10 := TSpeedButton.Create(Self);
  SpeedButton11 := TSpeedButton.Create(Self);
  Label73 := TLabel.Create(Self);
  Label74 := TLabel.Create(Self);
  Glyph3 := TGlyph.Create(Self);
  Glyph4 := TGlyph.Create(Self);

  // Fill.Bitmap.Bitmap := // please assign
  Rectangle32.OnMouseEnter := Rectangle32MouseEnter;
  Rectangle32.OnMouseLeave := Rectangle32MouseLeave;
  Label37.StyledSettings := [FontColor];
  Label37.Text := #1053#1086#1074#1086#1075#1086#1076#1085#1080#1081;
  Label38.StyledSettings := [];
  Label38.Text := 'Noize MC';
  Label39.StyledSettings := [];
  Label39.Text := '2017';
  RectanglePlaylistCover.OnMouseEnter := Rectangle32MouseEnter;
  RectanglePlaylistCover.OnMouseLeave := Rectangle32MouseLeave;
  SpeedButton5.ImageIndex := 8;
  SpeedButton5.StyleLookup := 'SpeedButton9Style1';
  SpeedButton5.OnClick := SpeedButton5Click;
  SpeedButton10.ImageIndex := 10;
  SpeedButton10.StyleLookup := 'SpeedButton9Style1';
  SpeedButton11.ImageIndex := 9;
  SpeedButton11.StyleLookup := 'SpeedButtonPlaylistPlay';
  SpeedButton11.OnClick := SpeedButton11Click;
  Label73.StyledSettings := [Family, Size, Style];
  Label73.Text := '60';
  Label74.StyledSettings := [Family, Size, Style];
  Label74.Text := '325';
  Glyph3.ImageIndex := 11;
  Glyph4.ImageIndex := 12;

}

uses
  VKAudioWin.Main, HGM.FMX.Image;

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
  LabelItemStats := TLabel.Create(Self);
  LabelItemDetail := TLabel.Create(Self);
  LabelItemYear := TLabel.Create(Self);
  LayoutControls := TLayout.Create(Self);
  SpeedButtonAdd := TSpeedButton.Create(Self);
  SpeedButtonPlay := TSpeedButton.Create(Self);
  SpeedButtonShare := TSpeedButton.Create(Self);

  HitTest := True;
  Height := 210;
  Width := 154;
  Padding.Rect := TRectF.Create(5, 5, 5, 5);

  RectangleItemImage.Parent := Self;
  RectangleItemImage.Align := TAlignLayout.Center;
  RectangleItemImage.Height := 143;
  RectangleItemImage.HitTest := True;
  RectangleItemImage.Fill.Kind := TBrushKind.Bitmap;
  RectangleItemImage.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
  RectangleItemImage.Fill.Bitmap.Bitmap := FormMain.ImageList.Bitmap(TSizeF.Create(143, 143), 0);
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
  RectangleItemImageHot.Fill.Kind := TBrushKind.Solid;
  RectangleItemImageHot.Fill.Color := $46000000;
  RectangleItemImageHot.OnMouseEnter := FMouseEnter;
  RectangleItemImageHot.OnMouseLeave := FMouseLeave;
  RectangleItemImageHot.Stroke.Kind := TBrushKind.None;
  RectangleItemImageHot.Width := 143;
  RectangleItemImageHot.XRadius := 8;
  RectangleItemImageHot.YRadius := 8;
  RectangleItemImageHot.Visible := False;

  LabelItemCount.Parent := RectangleItemImageHot;
  LabelItemCount.Text := '20';
  LabelItemCount.Height := 17;
  LabelItemCount.Width := 30;
  LabelItemCount.StyledSettings := [TStyledSetting.Family, TStyledSetting.Size, TStyledSetting.Style];
  LabelItemCount.FontColor := TAlphaColorRec.White;
  LabelItemCount.Position.Point := TPointF.Create(43, 115);

  LabelItemStats.Parent := RectangleItemImageHot;
  LabelItemStats.Text := '654';
  LabelItemStats.Height := 17;
  LabelItemStats.Width := 30;
  LabelItemStats.StyledSettings := [TStyledSetting.Family, TStyledSetting.Size, TStyledSetting.Style];
  LabelItemStats.FontColor := TAlphaColorRec.White;
  LabelItemStats.Position.Point := TPointF.Create(92, 115);

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

  LabelItemDetail.Parent := LayoutItemText;
  LabelItemDetail.Align := TAlignLayout.Top;
  LabelItemDetail.Height := 16;
  LabelItemDetail.Margins.Rect := TRectF.Create(0, 0, 0, 3);
  LabelItemDetail.StyledSettings := [];
  LabelItemDetail.TextSettings.Font.Family := 'Roboto';
  LabelItemDetail.TextSettings.Font.Size := 13;
  LabelItemDetail.TextSettings.FontColor := $FF939393;
  LabelItemDetail.Text := 'Noize MC';

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
  LayoutControls.Height := 60;
  LayoutControls.Width := 125;

  SpeedButtonAdd.Parent := LayoutControls;
  SpeedButtonAdd.Align := TAlignLayout.Left;
  SpeedButtonAdd.ImageIndex := 8;
  SpeedButtonAdd.Images := FormMain.SVGIconImageList1;
  SpeedButtonAdd.StyleLookup := 'SpeedButton9Style1';
  SpeedButtonAdd.Text := '';
  SpeedButtonAdd.Width := 28;
  SpeedButtonAdd.OnMouseEnter := SpeedButtonAddMouseEnter;
  SpeedButtonAdd.OnMouseLeave := SpeedButtonAddMouseEnter;

  SpeedButtonPlay.Parent := LayoutControls;
  SpeedButtonPlay.Align := TAlignLayout.Center;
  SpeedButtonPlay.ImageIndex := 9;
  SpeedButtonPlay.Images := FormMain.SVGIconImageList1;
  SpeedButtonPlay.Margins.Rect := TRectF.Create(4, 0, 0, 0);
  SpeedButtonPlay.StyleLookup := 'SpeedButtonPlaylistPlay';
  SpeedButtonPlay.Text := '';
  SpeedButtonPlay.Width := 52;
  SpeedButtonPlay.Height := 59;

  SpeedButtonShare.Parent := LayoutControls;
  SpeedButtonShare.Align := TAlignLayout.Right;
  SpeedButtonShare.ImageIndex := 10;
  SpeedButtonShare.Images := FormMain.SVGIconImageList1;
  SpeedButtonShare.Margins.Rect := TRectF.Create(0, 0, 0, 6);
  SpeedButtonShare.StyleLookup := 'SpeedButton9Style1';
  SpeedButtonShare.Text := '';
  SpeedButtonShare.Width := 32;
end;

procedure TListBoxItemPlaylist.FMouseEnter(Sender: TObject);
begin
  RectangleItemImageHot.Visible := True;
end;

procedure TListBoxItemPlaylist.FMouseLeave(Sender: TObject);
begin
  if not LayoutControls.AbsoluteRect.Contains(FormMain.ScreenToClient(Screen.MousePos)) then
  begin
    RectangleItemImageHot.Visible := False;
  end;
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

constructor TListBoxItemPlaylist.Create(AOwner: TComponent; Playlist: TVkAudioPlaylist);
begin
  Create(AOwner);
  if Playlist.IsFollowing then
    SpeedButtonAdd.ImageIndex := 8
  else
    SpeedButtonAdd.ImageIndex := 13;
  LabelItemCount.Text := Playlist.Count.ToString;
  LabelItemStats.Text := Playlist.Plays.ToString;
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
  FAlbum.OnChange := nil;
  inherited;
end;

end.

