unit VKAudioWin.Classes;

interface

type
  TCurrentPlaylist = class;

  TCurrentListKind = (lkNone, lkMusic, lkFriend, lkPlaylist, lkCustom);

  TAudioInfo = record
    Id: Integer;
    OwnerId: Integer;
    AccessKey: string;
    Title: string;
    Artist: string;
    Duration: string;
    CoverUrl: string;
  end;

  TFriendInfo = record
    Id: Integer;
    FullName: string;
    FirstName: string;
  end;

  TPlaylistInfo = record
    Id: Integer;
    OwnerId: Integer;
    AccessKey: string;
    Title: string;
    Detail: string;
    Info: string;
    CoverUrl: string;
  end;

  TOnCurrentPlaylistChange = procedure(const Sender: TCurrentPlaylist) of object;

  TCurrentPlaylist = class
  private
    FKind: TCurrentListKind;
    FPlaylistInfo: TPlaylistInfo;
    FFriendInfo: TFriendInfo;
    FId: Integer;
    FOnChange: TOnCurrentPlaylistChange;
    procedure SetKind(const Value: TCurrentListKind);
    procedure SetId(const Value: Integer);
    procedure SetOnChange(const Value: TOnCurrentPlaylistChange);
    procedure DoChange;
  public
    procedure Friend(Info: TFriendInfo);
    procedure Music;
    procedure Playlist(Info: TPlaylistInfo);
    procedure Custom;
    function Compare(AKind: TCurrentListKind; const AId: Integer = 0): Boolean;
    property Kind: TCurrentListKind read FKind write SetKind;
    property Id: Integer read FId write SetId;
    property OnChange: TOnCurrentPlaylistChange read FOnChange write SetOnChange;
    property FriendInfo: TFriendInfo read FFriendInfo;
    property PlaylistInfo: TPlaylistInfo read FPlaylistInfo;
  end;

implementation

{ TCurrentPlaylist }

function TCurrentPlaylist.Compare(AKind: TCurrentListKind; const AId: Integer): Boolean;
begin
  Result := (AKind = FKind) and (FId = AId);
end;

procedure TCurrentPlaylist.Custom;
begin
  FKind := lkCustom;
  FId := 0;
  DoChange;
end;

procedure TCurrentPlaylist.DoChange;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

procedure TCurrentPlaylist.Friend(Info: TFriendInfo);
begin
  FKind := lkFriend;
  FFriendInfo := Info;
  FId := Info.Id;
  DoChange;
end;

procedure TCurrentPlaylist.Music;
begin
  FKind := lkMusic;
  FId := 0;
  DoChange;
end;

procedure TCurrentPlaylist.Playlist(Info: TPlaylistInfo);
begin
  FKind := lkPlaylist;
  FId := Info.Id;
  FPlaylistInfo := Info;
  DoChange;
end;

procedure TCurrentPlaylist.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TCurrentPlaylist.SetKind(const Value: TCurrentListKind);
begin
  FKind := Value;
end;

procedure TCurrentPlaylist.SetOnChange(const Value: TOnCurrentPlaylistChange);
begin
  FOnChange := Value;
end;

end.

