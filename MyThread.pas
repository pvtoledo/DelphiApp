unit MyThread;

interface

  uses
  System.Threading,
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Types,
  System.Variants,
  System.Classes,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.Dialogs;

  type
  TmyThread = class(TThread)
    protected
      procedure Execute; override;
    public
      progress: TProgressBar;
      timeSleep: Integer;
      constructor Create(const p: TProgressBar; const tSleep: Integer);
      destructor Destroy; override;
      procedure inicia;
      procedure finaliza;
end;

implementation
uses
  ufTarefa2;
{ TmyThread }

constructor TmyThread.Create(const p: TProgressBar; const tSleep: Integer);
begin
  inherited Create;
  progress:= p;
  timeSleep:= tSleep;
  Self.FreeOnTerminate :=  False;
end;


destructor TmyThread.Destroy;
begin
  Self.Synchronize(Self, Self.finaliza);
  inherited Destroy;
end;

procedure TmyThread.Execute;
var
  i: Integer;
begin
  Self.Synchronize(Self, Self.inicia);
  progress.Position:= 0;
  for i := 0 to 100 do
  begin
    Sleep(timeSleep);
    progress.StepBy(1);
  end;
end;

procedure TmyThread.finaliza;
begin
  ThreadList.Remove(Self);
  if ThreadList.LockList.Count = 0 then
    FreeAndNil(ThreadList);
end;

procedure TmyThread.inicia;
begin
  ThreadList.Add(Self);
end;

end.

