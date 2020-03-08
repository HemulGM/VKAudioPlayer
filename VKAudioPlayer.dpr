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
  SQLite3 in '..\SQLite\SQLite3.pas',
  SQLiteTable3 in '..\SQLite\SQLiteTable3.pas',
  SQLLang in '..\SQLite\SQLLang.pas';

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
  FormMain.VK.Login;
  Application.Run;
end.

