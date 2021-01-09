unit BassPlayer.LoadHandle;

interface

uses
  System.SysUtils, System.Variants, System.Classes, System.Generics.Collections, System.Threading;

type
  TLoadThread = class
    class var
      TaskPoll: TThreadPool;
  private
    FBefore: TProc;
    FAsync: TFunc<TLoadThread, Boolean>;
    FAfter: TProc<Boolean>;
    FDoStopThread: Boolean;
    FWorking: Boolean;
  protected
    procedure FProc;
  public
    procedure Execute;
    procedure Stop; virtual;
    procedure Await(AppProc: Boolean = True);
    property IsWorking: Boolean read FWorking;
    property NeedStop: Boolean read FDoStopThread;
    constructor Create(Before: TProc; Async: TFunc<TLoadThread, Boolean>; After: TProc<Boolean>);
    class procedure StopAll;
  end;

  TLoadPlaylist = class(TLoadThread)
  private
    FAsync: TFunc<TLoadThread, Integer, Integer, Boolean>;
    procedure FProc(OwnerId, Id: Integer);
  public
    procedure Execute(OwnerId, Id: Integer);
    constructor Create(Before: TProc; Async: TFunc<TLoadThread, Integer, Integer, Boolean>; After: TProc<Boolean>);
  end;

  TLoadSearch = class(TLoadThread)
  private
    FAsync: TFunc<TLoadThread, string, Boolean>;
    procedure FProc(Query: string);
  public
    procedure Execute(Query: string);
    constructor Create(Before: TProc; Async: TFunc<TLoadThread, string, Boolean>; After: TProc<Boolean>);
  end;

  TLoaders = class(TList<TLoadThread>)
    procedure Stop;
    procedure Await;
    procedure Clear;
  end;

implementation

procedure TLoadThread.Await;
begin          {
  while FWorking do
    if AppProc then
      Application.ProcessMessages;   }
end;

constructor TLoadThread.Create(Before: TProc; Async: TFunc<TLoadThread, Boolean>; After: TProc<Boolean>);
begin
  FBefore := Before;
  FAsync := Async;
  FAfter := After;
  FWorking := False;
  FDoStopThread := False;
end;

procedure TLoadThread.Execute;
begin
  FProc;
end;

procedure TLoadThread.FProc;
begin
  TTask.Run(
    procedure
    var
      DoAfter: Boolean;
    begin
      FDoStopThread := True;
      while FWorking do
        Sleep(100);
      FDoStopThread := False;
      FWorking := True;
      TThread.Synchronize(TThread.Current,
        procedure
        begin
          if Assigned(FBefore) then
            FBefore;
        end);
      try
        try
          DoAfter := FAsync(Self);
          TThread.Synchronize(TThread.Current,
            procedure
            begin
              if Assigned(FAfter) then
              begin
                FAfter(DoAfter and (not FDoStopThread));
              end;
            end);
        finally
          FWorking := False;
        end;
      except
      end;
    end, TaskPoll);
end;

procedure TLoadThread.Stop;
begin
  FDoStopThread := True;
end;

class procedure TLoadThread.StopAll;
begin
  TaskPoll.Free;
  TaskPoll := TThreadPool.Create;
end;

{ TLoadPlaylist }

constructor TLoadPlaylist.Create(Before: TProc; Async: TFunc<TLoadThread, Integer, Integer, Boolean>; After: TProc<Boolean>);
begin
  FBefore := Before;
  FAsync := Async;
  FAfter := After;
  FWorking := False;
  FDoStopThread := False;
end;

procedure TLoadPlaylist.Execute(OwnerId, Id: Integer);
begin
  FProc(OwnerId, Id);
end;

procedure TLoadPlaylist.FProc(OwnerId, Id: Integer);
begin
  TTask.Run(
    procedure
    var
      DoAfter: Boolean;
    begin
      FDoStopThread := True;
      while FWorking do
        Sleep(100);
      FDoStopThread := False;
      FWorking := True;
      TThread.Synchronize(TThread.Current,
        procedure
        begin
          if Assigned(FBefore) then
            FBefore;
        end);
      try
        try
          DoAfter := FAsync(Self, OwnerId, Id);
          TThread.Synchronize(TThread.Current,
            procedure
            begin
              if Assigned(FAfter) then
              begin
                FAfter(DoAfter and (not FDoStopThread));
              end;
            end);
        finally
          FWorking := False;
        end;
      except
      end;
    end, TaskPoll);
end;

{ TLoaders }

procedure TLoaders.Await;
var
  i: Integer;
  FComplete: Boolean;
begin
  repeat
    FComplete := True;
    for i := 0 to Count - 1 do
    begin
      if Items[i].IsWorking then
        FComplete := False;
    end;     {
    if not FComplete then
      Application.ProcessMessages;   }
  until FComplete;
end;

procedure TLoaders.Clear;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    Items[i].Free;
  inherited;
end;

procedure TLoaders.Stop;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    Items[i].Stop;
end;

{ TLoadSearch }

constructor TLoadSearch.Create(Before: TProc; Async: TFunc<TLoadThread, string, Boolean>; After: TProc<Boolean>);
begin
  FBefore := Before;
  FAsync := Async;
  FAfter := After;
  FWorking := False;
  FDoStopThread := False;
end;

procedure TLoadSearch.Execute(Query: string);
begin
  FProc(Query);
end;

procedure TLoadSearch.FProc(Query: string);
begin
  TTask.Run(
    procedure
    var
      DoAfter: Boolean;
    begin
      FDoStopThread := True;
      while FWorking do
        Sleep(100);
      FDoStopThread := False;
      FWorking := True;
      TThread.Synchronize(TThread.Current,
        procedure
        begin
          if Assigned(FBefore) then
            FBefore;
        end);
      try
        try
          DoAfter := FAsync(Self, Query);
          TThread.Synchronize(TThread.Current,
            procedure
            begin
              if Assigned(FAfter) then
              begin
                FAfter(DoAfter and (not FDoStopThread));
              end;
            end);
        finally
          FWorking := False;
        end;
      except
      end;
    end, TaskPoll);
end;

initialization
  TLoadThread.TaskPoll := TThreadPool.Create;

finalization
  if Assigned(TLoadThread.TaskPoll) then
    TLoadThread.TaskPoll.Free;

end.

