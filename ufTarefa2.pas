unit ufTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, System.Threading, MyThread, Generics.Collections;

type
  TfTarefa2 = class(TForm)
    bStart: TButton;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    lThread1: TLabel;
    lThread2: TLabel;
    eThread1: TEdit;
    eThread2: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function GetProgressBar: TList;
    function GetEdit: TList<String>;
    procedure bStartClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefa2: TfTarefa2;
  CallMyThread: TMyThread;
  ProgressList: TList;
  EditList: TList<String>;
  ThreadList: TThreadList;

implementation

{$R *.dfm}

procedure TfTarefa2.bStartClick(Sender: TObject);
var
  i: Integer;
begin
  if Not Assigned(ThreadList) then
  begin
  try
      EditList:= GetEdit;
      if EditList.Contains('') then
        raise Exception.Create('Preencha os campos necess?rios!');
      ThreadList:= TThreadList.Create;
      ProgressList:= GetProgressBar;
    begin
      for i:= 0 to ProgressList.Count-1 do
      begin
        CallMyThread := TmyThread.Create(ProgressList[i], StrToInt(EditList[i]));
        CallMyThread.FreeOnTerminate := True;
      end;
    end;
    finally
      FreeAndNil(ProgressList);
      FreeAndNil(EditList);
    end;
  end
  else
    raise Exception.Create('Aguarde o t?rmino da opera??o!');
end;

procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(ThreadList) then
    raise Exception.Create('Aguarde o t?rmino da opera??o!')
  else
  begin
    Action := caFree;
    Release;
    fTarefa2:= nil;
  end;
end;

function TfTarefa2.GetEdit: TList<String>;
var
  i: Integer;
  TListEdit: TList<String>;
begin
  TListEdit:= TList<String>.Create;
  for i := 0 to fTarefa2.ComponentCount -1 do
  begin
    if fTarefa2.Components[i] is TEdit then
      TListEdit.Add((fTarefa2.Components[i] as TEdit).Text);
  end;
  Result:= TListEdit;
end;


function TfTarefa2.GetProgressBar: TList;
var
  i: Integer;
  TListProgressBar: TList;
begin
  TListProgressBar:= TList.Create;
  for i := 0 to fTarefa2.ComponentCount -1 do
  begin
    if fTarefa2.Components[i] is TProgressBar then
      TListProgressBar.Add(fTarefa2.Components[i]);
  end;
  Result:= TListProgressBar;
end;

end.

