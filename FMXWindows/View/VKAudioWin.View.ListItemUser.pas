unit VKAudioWin.View.ListItemUser;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms,
  FMX.Graphics, FMX.Dialogs, FMX.Layouts, FMX.TabControl, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.ListBox,
  FMX.Objects, FMX.Ani, VK.Entity.Audio, System.ImageList, VK.Entity.Profile, FMX.ImgList, FMX.Effects,
  FMX.Filter.Effects, VKAudioWin.Classes;

type
  TListBoxItemUser = class(TListBoxItem)
  private
    FAlbum: TBitmap;
    FAlbumPhoto: string;
    RectangleItemHot: TRectangle;
    RectangleItemImage: TRectangle;
    LayoutItemText: TLayout;
    LabelItemText: TLabel;
    LabelItemDetail: TLabel;
    FId: Integer;
    FUserInfo: TFriendInfo;
    procedure FMouseEnter(Sender: TObject);
    procedure FMouseLeave(Sender: TObject);
    procedure FClick(Sender: TObject);
    procedure FOnBitmapChange(Sender: TObject);
    procedure SetId(const Value: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    constructor Create(AOwner: TComponent; Profile: TVkProfile); overload;
    destructor Destroy; override;
    property Id: Integer read FId write SetId;
    property UserInfo: TFriendInfo read FUserInfo;
  end;

implementation

uses
  System.Threading, HGM.FMX.Image, VKAudioWin.Main;

{ TListBoxItemUser }

constructor TListBoxItemUser.Create(AOwner: TComponent);
begin
  inherited;
  RectangleItemHot := TRectangle.Create(Self);
  RectangleItemImage := TRectangle.Create(Self);
  LayoutItemText := TLayout.Create(Self);
  LabelItemText := TLabel.Create(Self);
  LabelItemDetail := TLabel.Create(Self);

  HitTest := True;
  OnMouseEnter := FMouseEnter;
  OnMouseLeave := FMouseLeave;
  OnClick := FClick;
  Height := 48;
  Padding.Rect := TRectF.Create(0, 1, 0, 1);

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
  RectangleItemImage.Width := 34;
  RectangleItemImage.Margins.Rect := TRectF.Create(15, 6, 10, 6);
  RectangleItemImage.HitTest := False;
  RectangleItemImage.XRadius := 17;
  RectangleItemImage.YRadius := 17;
  RectangleItemImage.Stroke.Kind := TBrushKind.None;
  RectangleItemImage.Fill.Color := TAlphaColorRec.Gray;

  LayoutItemText.Parent := Self;
  LayoutItemText.Align := TAlignLayout.Client;
  LayoutItemText.Margins.Rect := TRectF.Create(0, 4, 0, 4);

  LabelItemText.Parent := LayoutItemText;
  LabelItemText.Align := TAlignLayout.Top;
  LabelItemText.Margins.Rect := TRectF.Create(0, 3, 0, 0);
  LabelItemText.StyledSettings := [TStyledSetting.FontColor];
  LabelItemText.TextSettings.Font.Family := 'Roboto';
  LabelItemText.TextSettings.Font.Size := 12.5;
  LabelItemText.Text := 'Даннил Мурзак';

  LabelItemDetail.Parent := LayoutItemText;
  LabelItemDetail.Align := TAlignLayout.Bottom;
  LabelItemDetail.Margins.Rect := TRectF.Create(0, 0, 0, 0);
  LabelItemDetail.StyledSettings := [];
  LabelItemDetail.TextSettings.Font.Family := 'Roboto';
  LabelItemDetail.TextSettings.Font.Size := 12.5;
  LabelItemDetail.TextSettings.FontColor := $FF939393;
  LabelItemDetail.Text := '1300 аудиозаписей';
end;

constructor TListBoxItemUser.Create(AOwner: TComponent; Profile: TVkProfile);
var
  Id: Integer;
begin
  Create(AOwner);
  FUserInfo.Id := Profile.Id;
  FUserInfo.FullName := Profile.GetFullName;
  FUserInfo.FirstName := Profile.FirstName;
  FId := Profile.Id;
  LabelItemText.Text := Profile.GetFullName;
  LabelItemDetail.Text := '...';
  Id := Profile.Id;
  FAlbumPhoto := Profile.Photo50;
  FAlbum := TBitmap.Create;
  FAlbum.OnChange := FOnBitmapChange;
  FAlbum.LoadFromUrlAsync(FAlbumPhoto);
  TTask.Run(
    procedure
    var
      Items: TVkAudios;
    begin
      if FormMain.VK.Audio.Get(Items, Id) then
      begin
        try
          TThread.Synchronize(nil,
            procedure
            begin
              LabelItemDetail.Text := Items.Count.ToString + ' аудиозаписей';
            end);
        finally
          Items.Free;
        end;
      end;
    end);
end;

destructor TListBoxItemUser.Destroy;
begin
  FAlbum.Free;
  inherited;
end;

procedure TListBoxItemUser.FClick(Sender: TObject);
begin
  //IsSelected := True;
  //RectangleItemHot.Visible := False;
  if Assigned(ListBox.OnItemClick) then
    ListBox.OnItemClick(ListBox, Self);
end;

procedure TListBoxItemUser.FMouseEnter(Sender: TObject);
begin
  RectangleItemHot.Visible := not TListBoxItem(Sender).IsSelected;
end;

procedure TListBoxItemUser.FMouseLeave(Sender: TObject);
begin
  RectangleItemHot.Visible := False;
end;

procedure TListBoxItemUser.FOnBitmapChange(Sender: TObject);
begin
  RectangleItemImage.Fill.Kind := TBrushKind.Bitmap;
  RectangleItemImage.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
  RectangleItemImage.Fill.Bitmap.Bitmap := FAlbum;
end;

procedure TListBoxItemUser.SetId(const Value: Integer);
begin
  FId := Value;
end;

end.

