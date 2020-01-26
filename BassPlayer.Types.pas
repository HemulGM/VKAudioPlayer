unit BassPlayer.Types;

interface

uses
  BassPlayer.Lib, System.Types, Vcl.Dialogs;

const
  strLoading: string = 'Loading...';
  strUnknown: string = 'Unknown!';
  strCompleted: string = 'Completed!';

type
  TStatusProc = procedure(pszData: string; Progress: Integer);

  TBroadcastInfoProc = procedure(pszBroadcastName, pszBitRate: string);

  TBroadcastMetaProc = procedure(pszData: string);

  TOnEnd = procedure(handle: HSYNC; channel, data: Cardinal; user: Pointer) of object;

  TBASSCustomPlayer = class(TObject)
  public
  end;

implementation

uses
  Sysutils;

{ TBASSCustomPlayer }


end.

