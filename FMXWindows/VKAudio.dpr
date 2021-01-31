program VKAudio;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  VKAudioWin.Main in 'VKAudioWin.Main.pas' {FormMain},
  VKAudioWin.View.ListItemAudio in 'View\VKAudioWin.View.ListItemAudio.pas',
  VKAudioWin.Classes in 'VKAudioWin.Classes.pas',
  VKAudioWin.View.ListItemUser in 'View\VKAudioWin.View.ListItemUser.pas',
  VKAudioWin.View.ListItemSheffle in 'View\VKAudioWin.View.ListItemSheffle.pas',
  VKAudioWin.View.ListItemPlaylist in 'View\VKAudioWin.View.ListItemPlaylist.pas';

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
