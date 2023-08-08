unit VKAP.Player;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, HGM.Controls.PanelExt, HGM.Button,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.Menus,
  HGM.Controls.SpinEdit, Vcl.Grids, HGM.Controls.ColorGrid;

type
  TFormPlayer = class(TForm)
    ImageAlbum: TImage;
    LabelTitle: TLabel;
    ImagePrev: TImage;
    ImageNext: TImage;
    ImagePlay: TImage;
    ImageList: TImageList;
    ImageListL: TImageList;
    PopupMenu: TPopupMenu;
    MenuItemFontColor: TMenuItem;
    MenuItemButtonsColor: TMenuItem;
    ColorDialog: TColorDialog;
    MenuItemOnTop: TMenuItem;
    MenuItemBGColor: TMenuItem;
    N1: TMenuItem;
    Panel1: TPanel;
    MenuItemProps: TMenuItem;
    hColorGrid1: ThColorGrid;
    CheckBoxFlat1: TCheckBoxFlat;
    CheckBoxFlat2: TCheckBoxFlat;
    CheckBoxFlat3: TCheckBoxFlat;
    ImageList24: TImageList;
    SpinEditBGAlpha: TlkSpinEdit;
    ButtonFlat1: TButtonFlat;
    ButtonFlat2: TButtonFlat;
    ButtonFlat3: TButtonFlat;
    procedure PanelPlayerMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure MenuItemButtonsColorClick(Sender: TObject);
    procedure MenuItemFontColorClick(Sender: TObject);
    procedure MenuItemOnTopClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MenuItemBGColorClick(Sender: TObject);
    procedure MenuItemPropsClick(Sender: TObject);
  private
    FIsPlay: Boolean;
    FPlayImg: Integer;
    procedure SetIsPlay(const Value: Boolean);
    procedure SetImageColor(Color: TColor);
  public
    procedure CreateParams(var Params: TCreateParams); override;
    property IsPlay: Boolean read FIsPlay write SetIsPlay;
  end;

var
  FormPlayer: TFormPlayer;

implementation

uses
  VKAP.Main, HGM.Common.Utils, HGM.Common.PngUtils;

{$R *.dfm}

procedure TFormPlayer.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := (Params.Style or WS_POPUP) and (not WS_CHILD);
  //Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  //Params.ExStyle := Params.ExStyle or WS_EX_TRANSPARENT;
  Params.WndParent := GetDesktopWindow;
end;

procedure TFormPlayer.SetImageColor(Color: TColor);
var
  i: Integer;
begin
  for i := 0 to ImageList.Count - 1 do
    ColorImages(ImageList, i, Color);
  for i := 0 to ImageListL.Count - 1 do
    ColorImages(ImageListL, i, ColorLighter(Color, 20));
  ColorImages(ImageList, 5, clWhite);
end;

procedure TFormPlayer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FormMain.Close;
end;

procedure TFormPlayer.FormCreate(Sender: TObject);
begin
  ClientHeight := 42;
  Color := clBlack;
  Left := FormMain.Left;
  Top := FormMain.Top;
  FPlayImg := 7;
  ImagePlay.OnClick := FormMain.ButtonFlatPlayPauseClick;
  ImageNext.OnClick := FormMain.ButtonFlatNextClick;
  ImagePrev.OnClick := FormMain.ButtonFlatPrevClick;

  ImageListL.AddImages(ImageList);
  SetImageColor($00B58251);
end;

procedure TFormPlayer.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  Invalidate;
end;

procedure TFormPlayer.FormPaint(Sender: TObject);
var
  IL: TImageList;
begin
  with Canvas do
  begin
    if Color <> clBlack then
    begin
      Brush.Color := Color;
      FillRect(ClientRect);
    end;

    if PtInRect(ImagePrev.BoundsRect, ScreenToClient(Mouse.CursorPos)) then
      IL := ImageListL
    else
      IL := ImageList;
    IL.Draw(Canvas,
      ImagePrev.Left + ImagePrev.Width div 2 - 32 div 2,
      ImagePrev.Top + ImagePrev.Height div 2 - 32 div 2,
      2, True);

    if PtInRect(ImagePlay.BoundsRect, ScreenToClient(Mouse.CursorPos)) then
      IL := ImageListL
    else
      IL := ImageList;
    IL.Draw(Canvas,
      ImagePlay.Left + ImagePlay.Width div 2 - 32 div 2 + 1,
      ImagePlay.Top + ImagePlay.Height div 2 - 32 div 2,
      FPlayImg, True);

    if PtInRect(ImageNext.BoundsRect, ScreenToClient(Mouse.CursorPos)) then
      IL := ImageListL
    else
      IL := ImageList;
    IL.Draw(Canvas,
      ImageNext.Left + ImageNext.Width div 2 - 32 div 2,
      ImageNext.Top + ImageNext.Height div 2 - 32 div 2,
      1, True);

    StretchDraw(TRect.Create(TPoint.Create(ImageAlbum.Left, ImageAlbum.Top), 26, 26), ImageAlbum.Picture.Graphic);
  end;
end;

procedure TFormPlayer.MenuItemBGColorClick(Sender: TObject);
begin
  if ColorDialog.Execute(Handle) then
  begin
    Color := ColorDialog.Color;
    GlassFrame.Enabled := Color = clBlack;
    Invalidate;
  end;
end;

procedure TFormPlayer.MenuItemButtonsColorClick(Sender: TObject);
begin
  if ColorDialog.Execute(Handle) then
  begin
    SetImageColor(ColorDialog.Color);
    Invalidate;
  end;
end;

procedure TFormPlayer.MenuItemFontColorClick(Sender: TObject);
begin
  if ColorDialog.Execute(Handle) then
  begin
    LabelTitle.Font.Color := ColorDialog.Color;
    Invalidate;
  end;
end;

procedure TFormPlayer.MenuItemOnTopClick(Sender: TObject);
begin
  if FormStyle = fsNormal then
    FormStyle := fsStayOnTop
  else
    FormStyle := fsNormal;
  MenuItemOnTop.Checked := FormStyle = fsStayOnTop;
end;

procedure TFormPlayer.MenuItemPropsClick(Sender: TObject);
begin
  if ClientHeight <= 42 then
    ClientHeight := 200
  else
    ClientHeight := 42;
end;

procedure TFormPlayer.PanelPlayerMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if ssDouble in Shift then
  begin
    if Button = mbLeft then
    begin
      FormMain.Full;
    end;
    Exit;
  end;
  if Button = mbLeft then
  begin
    ReleaseCapture;
    SendMessage(Handle, WM_SYSCOMMAND, 61458, 0);
  end;
  if Button = mbRight then
  begin
    PopupMenu.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
  end;
end;

procedure TFormPlayer.SetIsPlay(const Value: Boolean);
begin
  FIsPlay := Value;
  if FIsPlay then
    FPlayImg := 6
  else
    FPlayImg := 7;
  Invalidate;
end;

end.

