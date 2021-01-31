unit VKAudioWin.View.ListItemAudio;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms,
  FMX.Graphics, FMX.Dialogs, FMX.Layouts, FMX.TabControl, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.ListBox,
  FMX.Objects, FMX.Ani, VK.Entity.Audio, System.ImageList, VK.Entity.Profile, FMX.ImgList, FMX.Effects,
  FMX.Filter.Effects, VKAudioWin.Classes;

type
  TListBoxItemAudio = class(TListBoxItem)
  private
    FAudioInfo: TAudioInfo;
    FAlbum: TBitmap;
    FAlbumPhoto: string;
    RectangleItemHot: TRectangle;
    RectangleItemImage: TRectangle;
    RectangleItemImageHot: TRectangle;
    LabelItemTime: TLabel;
    LayoutItemText: TLayout;
    LabelItemText: TLabel;
    LabelItemDetail: TLabel;
    LayoutControls1: TLayout;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FMouseEnter(Sender: TObject);
    procedure FMouseLeave(Sender: TObject);
    procedure FClick(Sender: TObject);
    procedure FOnBitmapChange(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; Audio: TVkAudio); overload;
    constructor Create(AOwner: TComponent; From: TListBoxItemAudio); overload;
    destructor Destroy; override;
    property AudioInfo: TAudioInfo read FAudioInfo;
  end;

implementation

uses
  VKAudioWin.Main, HGM.FMX.Image;

{ TListBoxItemAudio }

constructor TListBoxItemAudio.Create(AOwner: TComponent);
begin
  inherited;
  FAlbum := TBitmap.Create;
  FAlbum.OnChange := FOnBitmapChange;
  RectangleItemHot := TRectangle.Create(Self);
  RectangleItemImage := TRectangle.Create(Self);
  RectangleItemImageHot := TRectangle.Create(Self);
  LabelItemTime := TLabel.Create(Self);
  LayoutItemText := TLayout.Create(Self);
  LabelItemText := TLabel.Create(Self);
  LabelItemDetail := TLabel.Create(Self);
  LayoutControls1 := TLayout.Create(Self);
  SpeedButton1 := TSpeedButton.Create(Self);
  SpeedButton2 := TSpeedButton.Create(Self);

  HitTest := True;
  OnMouseEnter := FMouseEnter;
  OnMouseLeave := FMouseLeave;
  OnClick := FClick;
  Height := 48;
  Margins.Rect := TRectF.Create(0, 0, 0, 6);

  RectangleItemHot.Parent := Self;
  RectangleItemHot.Align := TAlignLayout.Contents;
  RectangleItemHot.HitTest := False;
  RectangleItemHot.XRadius := 4;
  RectangleItemHot.YRadius := 4;
  RectangleItemHot.Fill.Color := $FFF0F2F5;
  RectangleItemHot.Stroke.Kind := TBrushKind.None;
  RectangleItemHot.SendToBack;
  RectangleItemHot.Visible := False;

  RectangleItemImage.Parent := Self;
  RectangleItemImage.Align := TAlignLayout.Left;
  RectangleItemImage.Width := 40;
  RectangleItemImage.Margins.Rect := TRectF.Create(4, 4, 10, 4);
  RectangleItemImage.HitTest := False;
  RectangleItemImage.XRadius := 4;
  RectangleItemImage.YRadius := 4;
  //RectangleItemImage.Fill.Color := TAlphaColorRec.Gray;
  RectangleItemImage.Stroke.Kind := TBrushKind.None;
  RectangleItemImage.Fill.Kind := TBrushKind.Bitmap;
  RectangleItemImage.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
  RectangleItemImage.Fill.Bitmap.Bitmap := FormMain.ImageList.Bitmap(TSizeF.Create(40, 40), 0);

  RectangleItemImageHot.Parent := RectangleItemImage;
  RectangleItemImageHot.Align := TAlignLayout.Client;
  RectangleItemImageHot.HitTest := False;
  RectangleItemImageHot.XRadius := 4;
  RectangleItemImageHot.YRadius := 4;
  RectangleItemImageHot.Fill.Color := $88000000;
  RectangleItemImageHot.Stroke.Kind := TBrushKind.None;
  RectangleItemImageHot.Visible := False;

  LabelItemTime.Parent := Self;
  LabelItemTime.Align := TAlignLayout.MostRight;
  LabelItemTime.Margins.Rect := TRectF.Create(15, 0, 12, 0);
  LabelItemTime.Text := '3:48';
  LabelItemTime.TextAlign := TTextAlign.Trailing;
  LabelItemTime.Width := 30;
  LabelItemTime.WordWrap := False;

  LayoutItemText.Parent := Self;
  LayoutItemText.Align := TAlignLayout.Client;
  LayoutItemText.Margins.Rect := TRectF.Create(0, 4, 0, 4);

  LabelItemText.Parent := LayoutItemText;
  LabelItemText.Align := TAlignLayout.Top;
  LabelItemText.Margins.Rect := TRectF.Create(0, 5, 0, 0);
  LabelItemText.StyledSettings := [TStyledSetting.FontColor];
  LabelItemText.TextSettings.Font.Family := 'Roboto';
  LabelItemText.TextSettings.Font.Size := 12.5;
  LabelItemText.Text := 'Ласточка';
  LabelItemText.WordWrap := False;

  LabelItemDetail.Parent := LayoutItemText;
  LabelItemDetail.Align := TAlignLayout.Bottom;
  LabelItemDetail.Margins.Rect := TRectF.Create(0, 0, 0, 3);
  LabelItemDetail.StyledSettings := [];
  LabelItemDetail.TextSettings.Font.Family := 'Roboto';
  LabelItemDetail.TextSettings.Font.Size := 12.5;
  LabelItemDetail.TextSettings.FontColor := $FF939393;
  LabelItemDetail.Text := 'Анна Пингина';
  LabelItemDetail.WordWrap := False;

  LayoutControls1.Parent := Self;
  LayoutControls1.Align := TAlignLayout.Right;
  LayoutControls1.Margins.Rect := TRectF.Create(4, 4, 4, 4);
  LayoutControls1.Width := 103;
  LayoutControls1.Visible := False;

  SpeedButton1.Parent := LayoutControls1;
  SpeedButton1.Align := TAlignLayout.Right;
  SpeedButton1.StyleLookup := 'ellipseseditbutton';
  SpeedButton1.Text := 'SpeedButton1';
  SpeedButton1.Width := 22;

  SpeedButton2.Parent := LayoutControls1;
  SpeedButton2.Align := TAlignLayout.Right;
  SpeedButton2.StyleLookup := 'cleareditbutton';
  SpeedButton2.Text := 'SpeedButton1';
  SpeedButton2.Width := 22;
end;

procedure TListBoxItemAudio.FMouseEnter(Sender: TObject);
begin
  LayoutControls1.Visible := True;
  LabelItemTime.Visible := False;
  RectangleItemHot.Visible := not TListBoxItem(Sender).IsSelected;
  RectangleItemImageHot.Visible := True;
end;

procedure TListBoxItemAudio.FMouseLeave(Sender: TObject);
begin
  if not LayoutControls1.AbsoluteRect.Contains(FormMain.ScreenToClient(Screen.MousePos)) then
  begin
    RectangleItemHot.Visible := False;
    LayoutControls1.Visible := False;
    LabelItemTime.Visible := True;
    RectangleItemImageHot.Visible := False;
  end;
end;

procedure TListBoxItemAudio.FOnBitmapChange(Sender: TObject);
begin
  RectangleItemImage.Fill.Kind := TBrushKind.Bitmap;
  RectangleItemImage.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
  RectangleItemImage.Fill.Bitmap.Bitmap := FAlbum;
end;

constructor TListBoxItemAudio.Create(AOwner: TComponent; Audio: TVkAudio);
begin
  Create(AOwner);
  LabelItemTime.Text := Audio.DurationText('%d:%.2d');
  LabelItemDetail.Text := Audio.Artist;
  LabelItemText.Text := Audio.Title;
  if Assigned(Audio.Album) and Assigned(Audio.Album.Thumb) then
    FAlbumPhoto := Audio.Album.Thumb.Photo68
  else
    FAlbumPhoto := '';
  FAlbum.LoadFromUrlAsync(FAlbumPhoto);
  FAudioInfo.Id := Audio.Id;
  FAudioInfo.OwnerId := Audio.OwnerId;
  FAudioInfo.AccessKey := Audio.AccessKey;
  FAudioInfo.Title := Audio.Title;
  FAudioInfo.Artist := Audio.Artist;
  FAudioInfo.Duration := Audio.DurationText('%d:%.2d');
  FAudioInfo.CoverUrl := FAlbumPhoto;
end;

constructor TListBoxItemAudio.Create(AOwner: TComponent; From: TListBoxItemAudio);
begin
  Create(AOwner);
  LabelItemTime.Text := From.LabelItemTime.Text;
  LabelItemDetail.Text := From.LabelItemDetail.Text;
  LabelItemText.Text := From.LabelItemText.Text;
  FAlbumPhoto := From.FAlbumPhoto;
  FAlbum.LoadFromUrlAsync(FAlbumPhoto);
  FAudioInfo := From.FAudioInfo;
end;

destructor TListBoxItemAudio.Destroy;
begin
  FAlbum.Free;
  inherited;
end;

procedure TListBoxItemAudio.FClick(Sender: TObject);
begin
  IsSelected := True;
  RectangleItemHot.Visible := False;
  if Assigned(ListBox.OnItemClick) then
    ListBox.OnItemClick(ListBox, Self);
end;

end.

