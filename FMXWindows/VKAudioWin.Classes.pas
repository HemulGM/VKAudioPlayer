unit VKAudioWin.Classes;

interface

type
  TCurrentListKind = (lkNone, lkMusic, lkFriend, lkPlaylist, lkCustom);

  TCurrentPlaylist = record
  private
    FKind: TCurrentListKind;
    FId: Integer;
    procedure SetKind(const Value: TCurrentListKind);
    procedure SetId(const Value: Integer);
  public
    procedure Friend(Id: Integer);
    procedure Music;
    procedure Playlist(Id: Integer);
    procedure Custom;
    function Compare(AKind: TCurrentListKind; const AId: Integer = 0): Boolean;
    property Kind: TCurrentListKind read FKind write SetKind;
    property Id: Integer read FId write SetId;
  end;

  TAudioInfo = record
    Id: Integer;
    OwnerId: Integer;
    AccessKey: string;
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
end;

procedure TCurrentPlaylist.Friend(Id: Integer);
begin
  FKind := lkFriend;
  FId := Id;
end;

procedure TCurrentPlaylist.Music;
begin
  FKind := lkMusic;
  FId := 0;
end;

procedure TCurrentPlaylist.Playlist(Id: Integer);
begin
  FKind := lkPlaylist;
  FId := Id;
end;

procedure TCurrentPlaylist.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TCurrentPlaylist.SetKind(const Value: TCurrentListKind);
begin
  FKind := Value;
end;

end.

