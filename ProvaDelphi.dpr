program ProvaDelphi;

uses
  Vcl.Forms,
  mainForm in 'mainForm.pas' {fTarefas},
  ufTarefa1 in 'ufTarefa1.pas' {fTarefa1},
  ufTarefa2 in 'ufTarefa2.pas' {fTarefa2},
  MyThread in 'MyThread.pas',
  ufTarefa3 in 'ufTarefa3.pas' {fTarefa3};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfTarefas, fTarefas);
  Application.Run;
end.
