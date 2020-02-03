unit BassPlayer;

interface

uses
  BassPlayer.Types, BassPlayer.Lib, System.Types, System.Classes;

type
  TAudioEnd = procedure(Sender: TObject) of object;

  TFFTData = array[0..512] of Single;

  TBASSPlayer = class(TComponent)
  private
    FOnEnd: TAudioEnd;
    FIsPlay: Boolean;
    FOpenning: BOOL;
    function GetLastErrorCode: Integer;
    function GetSize: Int64;
    procedure UnloadChannel;
    procedure SetPosition(const Value: Int64);
    function GetPosition: Int64;
    procedure DoOnEnd(handle: HSYNC; channel, data: Cardinal; user: Pointer);
    procedure SetOnEnd(const Value: TAudioEnd);
    function GetPositionPercent: Extended;
    procedure SetPositionPercent(const Value: Extended);
    function GetBufferring: Int64;
    function GetBufferringPercent: Extended;
    function GetSizeAsBuffer: Int64;
    function GetPositionTime: string;
    function GetPositionTimeLeft: string;
  public
    FStreamURL: string;
    FActiveChannel: HSTREAM;
    FPlaySync: HSYNC;
    FLastErrorCode: Integer;
    FStatusProc: TStatusProc;
    FBroadcastInfoProc: TBroadcastInfoProc;
    FBroadcastMetaProc: TBroadcastMetaProc;
    FPauseOnIncomingCalls: Boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetVolume(const AValue: Single);
    function GetVolume: Single;
    function Play: Boolean;
    procedure Stop;
    procedure Pause;
    function Resume: Boolean;
    procedure SetStreamURL(AUrl: string);
    procedure SetStatusProc(AProc: TStatusProc);
    procedure SetBroadcastInfoProc(AProc: TBroadcastInfoProc);
    procedure SetBroadcastMetaProc(AProc: TBroadcastMetaProc);
    procedure PauseRadioOnIncomingCalls(APauseOnIncomingCalls: Boolean);
    function GetData(var FFTData: TFFTData): Boolean;
    function Init(Handle: THandle): Boolean;
    property LastErrorCode: Integer read GetLastErrorCode;
    property Position: Int64 read GetPosition write SetPosition;
    property PositionPercent: Extended read GetPositionPercent write SetPositionPercent;
    property PositionTime: string read GetPositionTime;
    property PositionTimeLeft: string read GetPositionTimeLeft;
    property Bufferring: Int64 read GetBufferring;
    property BufferringPercent: Extended read GetBufferringPercent;
    property Size: Int64 read GetSize;
    property SizeAsBuffer: Int64 read GetSizeAsBuffer;
    property IsPlay: Boolean read FIsPlay;
    property OnEnd: TAudioEnd read FOnEnd write SetOnEnd;
  end;

var
  Player: TBASSPlayer;

procedure FSync(handle: HSYNC; channel, data: Cardinal; user: Pointer);

implementation

uses
  Math, SysUtils;

procedure FSync(handle: HSYNC; channel, data: Cardinal; user: Pointer);
begin
  Player.DoOnEnd(handle, channel, data, user);
end;

{ TFMXRadio }

constructor TBASSPlayer.Create;
begin
  inherited;
  FActiveChannel := 0;
  FStatusProc := nil;
  FBroadcastInfoProc := nil;
  FBroadcastMetaProc := nil;
  FIsPlay := False;
  Player := Self;
end;

function TBASSPlayer.GetVolume: Single;
begin
  Result := BASS_GetVolume;
end;

procedure TBASSPlayer.SetVolume(const AValue: Single);
begin
  BASS_SetVolume(AValue);
end;

function TBASSPlayer.Init(Handle: THandle): Boolean;
begin
  if BASS_Init(-1, 44100, 0, Handle, nil) then
  begin
    BASS_PluginLoad(PChar(BASS_FOLDER + 'libbass.dll'), 0 or BASS_UNICODE);
    BASS_SetConfig(BASS_CONFIG_NET_PREBUF, 0);
    BASS_SetConfig(BASS_CONFIG_VERIFY, 1024 * 1024);
    Result := True;
  end
  else
    Result := False;
end;

procedure TBASSPlayer.UnloadChannel;
begin
  if FActiveChannel <> 0 then
    BASS_StreamFree(FActiveChannel);
end;

function TBASSPlayer.Play: Boolean;
begin
  Result := False;
  if FOpenning then
    Exit;

  FOpenning := True;
  FIsPlay := False;

  UnloadChannel;

  FActiveChannel := BASS_StreamCreateURL(PChar(FStreamURL), 0, BASS_STREAM_STATUS or
    BASS_STREAM_AUTOFREE or BASS_UNICODE or BASS_MP3_SETPOS, nil, nil);

  if FActiveChannel <> 0 then
  begin
    if BASS_ChannelPlay(FActiveChannel, False) then
    begin
      BASS_ChannelRemoveSync(FActiveChannel, FPlaySync);
      FPlaySync := BASS_ChannelSetSync(FActiveChannel, BASS_SYNC_END, 1, @FSync, nil);
      if Assigned(FStatusProc) then
        FStatusProc(strCompleted, 100);

      Result := True;
      FIsPlay := True;
    end;
  end
  else
  begin
    FLastErrorCode := Bass_ErrorGetCode;
  end;
  FOpenning := False;
end;

procedure TBASSPlayer.Pause;
begin
  FIsPlay := False;
  if FActiveChannel <> 0 then
    BASS_ChannelPause(FActiveChannel)
  else
    Play;
end;

function TBASSPlayer.Resume: Boolean;
begin
  FIsPlay := True;
  if FActiveChannel <> 0 then
    Result := BASS_ChannelPlay(FActiveChannel, False);
end;

procedure TBASSPlayer.SetPosition(const Value: Int64);
begin
  if FActiveChannel <> 0 then
    BASS_ChannelSetPosition(FActiveChannel, BASS_ChannelSeconds2Bytes(FActiveChannel, Value), BASS_POS_BYTE);
end;

procedure TBASSPlayer.SetPositionPercent(const Value: Extended);
begin
  SetPosition(Round((GetSize / 100) * Value));
end;

procedure TBASSPlayer.SetStreamURL(AUrl: string);
begin
  FStreamURL := AUrl;
end;

procedure TBASSPlayer.Stop;
begin
  FIsPlay := False;
  if FActiveChannel <> 0 then
    BASS_ChannelStop(FActiveChannel);
end;

procedure TBASSPlayer.DoOnEnd(handle: HSYNC; channel, data: Cardinal; user: Pointer);
begin
  FIsPlay := False;
  if Assigned(FOnEnd) then
    FOnEnd(Self);
end;

function TBASSPlayer.GetPosition: Int64;
begin
  if FActiveChannel <> 0 then
    Result := Trunc(BASS_ChannelBytes2Seconds(FActiveChannel, BASS_ChannelGetPosition(FActiveChannel, BASS_POS_BYTE)))
  else
    Result := 0;
end;

function TBASSPlayer.GetPositionPercent: Extended;
begin
  Result := Min(Max(0, (100 / Size) * Position), 100);
end;

function TBASSPlayer.GetPositionTime: string;
var
  M, S: Integer;
begin
  S := Position;
  M := S div 60;
  S := S mod 60;
  Result := Format('%d:%.2d', [M, S]);
end;

function TBASSPlayer.GetPositionTimeLeft: string;
var
  M, S: Integer;
begin
  S := Position - Size;
  M := S div 60;
  S := S mod 60;
  Result := Format('-%d:%.2d', [Abs(M), Abs(S)]);
end;

function TBASSPlayer.GetSize: Int64;
begin
  if FActiveChannel <> 0 then
    Result := Trunc(BASS_ChannelBytes2Seconds(FActiveChannel, BASS_ChannelGetLength(FActiveChannel, BASS_POS_BYTE)))
  else
    Result := 0;
end;

function TBASSPlayer.GetSizeAsBuffer: Int64;
begin
  Result := BASS_StreamGetFilePosition(FActiveChannel, BASS_FILEPOS_END);
end;

function TBASSPlayer.GetBufferring: Int64;
begin
  Result := BASS_StreamGetFilePosition(FActiveChannel,
    BASS_FILEPOS_BUFFER);
end;

function TBASSPlayer.GetBufferringPercent: Extended;
begin
  Result := Min(Max(0, (100 / SizeAsBuffer) * Bufferring), 100);
end;

function TBASSPlayer.GetData(var FFTData: TFFTData): Boolean;
begin
  Result := False;
  if BASS_ChannelIsActive(FActiveChannel) <> BASS_ACTIVE_PLAYING then
    Exit;
  BASS_ChannelGetData(FActiveChannel, @FFTData, BASS_DATA_FFT1024);
  Result := True;
end;

procedure TBASSPlayer.SetStatusProc(AProc: TStatusProc);
begin
  FStatusProc := AProc;
end;

procedure TBASSPlayer.SetBroadcastInfoProc(AProc: TBroadcastInfoProc);
begin
  FBroadcastInfoProc := AProc;
end;

procedure TBASSPlayer.SetBroadcastMetaProc(AProc: TBroadcastMetaProc);
begin
  FBroadcastMetaProc := AProc;
end;

procedure TBASSPlayer.SetOnEnd(const Value: TAudioEnd);
begin
  FOnEnd := Value;
end;

procedure TBASSPlayer.PauseRadioOnIncomingCalls(APauseOnIncomingCalls: Boolean);
begin
  FPauseOnIncomingCalls := APauseOnIncomingCalls;
end;

destructor TBASSPlayer.Destroy;
begin
  UnloadChannel;
  inherited;
end;

function TBASSPlayer.GetLastErrorCode: Integer;
begin
  Result := FLastErrorCode;
end;

end.

