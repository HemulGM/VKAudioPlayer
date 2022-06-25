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
  HGM.SQLite.Wrapper in '..\SQLite\HGM.SQLite.Wrapper.pas';

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
  Application.ProcessMessages;
  if not FormMain.VK.Login then
    FormMain.DoLogin;
  Application.Run;
end.

