program VKAudioPlayer;

{$R *.dres}

uses
  VCLFlickerReduce in '..\#Fork\VCLFlickerReduce\VCLFlickerReduce.pas',
  Vcl.Forms,
  VKAP.Main in 'VKAP.Main.pas' {FormMain},
  BassPlayer.Lib in 'BassPlayer.Lib.pas',
  BassPlayer in 'BassPlayer.pas',
  BassPlayer.Types in 'BassPlayer.Types.pas',
  Vcl.Themes,
  Vcl.Styles,
  VK.API in '..\VK_API\VK.API.pas',
  BassPlayer.LoadHandle in 'BassPlayer.LoadHandle.pas',
  VKAP.Player in 'VKAP.Player.pas' {FormPlayer},
  HGM.SQLang in '..\SQLite\HGM.SQLang.pas',
  HGM.SQLite in '..\SQLite\HGM.SQLite.pas',
  HGM.SQLite.Wrapper in '..\SQLite\HGM.SQLite.Wrapper.pas',
  Vcl.Styles.ColorTabs in '..\#Fork\vcl-styles-utils\Common\Vcl.Styles.ColorTabs.pas',
  Vcl.Styles.ControlColor in '..\#Fork\vcl-styles-utils\Common\Vcl.Styles.ControlColor.pas',
  Vcl.Styles.Ext in '..\#Fork\vcl-styles-utils\Common\Vcl.Styles.Ext.pas',
  Vcl.Styles.Fixes in '..\#Fork\vcl-styles-utils\Common\Vcl.Styles.Fixes.pas',
  Vcl.Styles.FormStyleHooks in '..\#Fork\vcl-styles-utils\Common\Vcl.Styles.FormStyleHooks.pas',
  Vcl.Styles.Preview in '..\#Fork\vcl-styles-utils\Common\Vcl.Styles.Preview.pas',
  Vcl.Styles.Register in '..\#Fork\vcl-styles-utils\Common\Vcl.Styles.Register.pas',
  Vcl.Styles.Utils.Graphics in '..\#Fork\vcl-styles-utils\Common\Vcl.Styles.Utils.Graphics.pas',
  Vcl.Styles.Utils.Menus in '..\#Fork\vcl-styles-utils\Common\Vcl.Styles.Utils.Menus.pas',
  Vcl.Styles.Utils.Misc in '..\#Fork\vcl-styles-utils\Common\Vcl.Styles.Utils.Misc.pas',
  Vcl.Styles.Utils in '..\#Fork\vcl-styles-utils\Common\Vcl.Styles.Utils.pas',
  Vcl.Styles.Utils.ScreenTips in '..\#Fork\vcl-styles-utils\Common\Vcl.Styles.Utils.ScreenTips.pas',
  Vcl.Styles.Utils.SysControls in '..\#Fork\vcl-styles-utils\Common\Vcl.Styles.Utils.SysControls.pas',
  Vcl.Styles.Utils.SysStyleHook in '..\#Fork\vcl-styles-utils\Common\Vcl.Styles.Utils.SysStyleHook.pas',
  Vcl.Styles.Utils.SystemMenu in '..\#Fork\vcl-styles-utils\Common\Vcl.Styles.Utils.SystemMenu.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := False;
  Application.ShowMainForm := False;
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}
  Application.Title := 'VK Audio Player by HGM';
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormPlayer, FormPlayer);
  Application.ProcessMessages;
  FormMain.Show;
  FormMain.Invalidate;
  Application.Run;
end.

