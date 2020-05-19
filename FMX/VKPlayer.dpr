program VKPlayer;

uses
  System.StartUpCopy,
  FMX.Forms,
  VKPlayer.Main in 'VKPlayer.Main.pas' {FormMain},
  BassPlayer.LoadHandle in '..\BassPlayer.LoadHandle.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
