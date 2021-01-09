unit VKAudioWin.View.ListItemSheffle;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms,
  FMX.Graphics, FMX.Dialogs, FMX.Layouts, FMX.TabControl, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.ListBox,
  FMX.Objects, FMX.Ani, VK.Entity.Audio, System.ImageList, VK.Entity.Profile, FMX.ImgList, FMX.Effects,
  FMX.Filter.Effects, VKAudioWin.Classes;

type
  TListBoxItemShuffle = class(TListBoxItem)
  private
    RectangleItemHot: TRectangle;
    PathImage: TPath;
    LayoutItemImage: TLayout;
    LabelItemText: TLabel;
    procedure FMouseEnter(Sender: TObject);
    procedure FMouseLeave(Sender: TObject);
    procedure FClick(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{ TListBoxItemShuffle }

constructor TListBoxItemShuffle.Create(AOwner: TComponent);
begin
  inherited;
  RectangleItemHot := TRectangle.Create(Self);
  PathImage := TPath.Create(Self);
  LayoutItemImage := TLayout.Create(Self);
  LabelItemText := TLabel.Create(Self);

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

  LayoutItemImage.Parent := Self;
  LayoutItemImage.Align := TAlignLayout.Left;
  LayoutItemImage.Margins.Rect := TRectF.Create(4, 4, 10, 4);
  LayoutItemImage.Width := 40;

  PathImage := TPath.Create(Self);
  PathImage.Align := TAlignLayout.Center;
  PathImage.Parent := LayoutItemImage;
  PathImage.Data.Data :=
    'M16,7 C13.0599994659424,7 11.6000003814697,9.30000019073486 10.1300001144409,11.25 ' +
    'C8.82999992370605,12.9499998092651 7.75,14.9499998092651 6,15 L3,15 L3,17 L6,17 C8.93000030517578,17 ' +
    '10.2399997711182,14.3999996185303 11.6999998092651,12.4699993133545 C13,10.7299995422363 ' +
    '14.1599998474121,8.99999904632568 16,8.99999904632568 L17,8.99999904632568 L17,6.99999904632568 ' +
    'Z M9.94000053405762,8.84000015258789 C9.42000007629395,8.38000011444092 8.5600004196167,7.74000024795532 ' +
    '7.90000057220459,7.46000003814697 C7.26000070571899,7.15999984741211 6.50000047683716,7 5.6700005531311,7 ' +
    'L3.00000047683716,7 L3.00000047683716,9 L6.00000047683716,9 C6.44000053405762,9 6.80000066757202,9.07999992370605 ' +
    '7.14000034332275,9.22000026702881 C7.59000015258789,9.42000007629395 8.28000068664551,9.92000007629395 ' +
    '8.72000026702881,10.3200006484985 L9.95000076293945,8.84000015258789 Z M16,15 L17,15 L17,17 L16,17 ' +
    'C14.2299995422363,17 12.7600002288818,15.9200000762939 11.6800003051758,14.8500003814697 ' +
    'L12.9099998474121,13.3500003814697 C13.710000038147,14.1800003051758 14.8899993896484,15 16.0100002288818,15 ' +
    'Z M17,19 L17,13 L21,16 Z M17,11 L17,5 L21,8 Z';
  PathImage.Fill.Color := $FF356CA9;
  PathImage.Stroke.Kind := TBrushKind.None;
  PathImage.Height := 14;
  PathImage.Width := 19;

  LabelItemText.Parent := Self;
  LabelItemText.Align := TAlignLayout.Client;
  LabelItemText.StyledSettings := [TStyledSetting.FontColor];
  LabelItemText.TextSettings.Font.Family := 'Roboto';
  LabelItemText.TextSettings.Font.Size := 12.5;
  LabelItemText.Text := 'Перемешать все';
end;

procedure TListBoxItemShuffle.FClick(Sender: TObject);
begin
  TListBoxItem(Sender).IsSelected := True;
  RectangleItemHot.Visible := False;
end;

procedure TListBoxItemShuffle.FMouseEnter(Sender: TObject);
begin
  RectangleItemHot.Visible := not TListBoxItem(Sender).IsSelected;
end;

procedure TListBoxItemShuffle.FMouseLeave(Sender: TObject);
begin
  RectangleItemHot.Visible := False;
end;

end.

