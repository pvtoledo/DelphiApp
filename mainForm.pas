unit mainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, MidasLib;

type
  TfTarefas = class(TForm)
    MenuTarefas: TMainMenu;
    mTarefas: TMenuItem;
    itemTarefas1: TMenuItem;
    itemTarefas2: TMenuItem;
    itemTarefas3: TMenuItem;
    procedure itemTarefas1Click(Sender: TObject);
    procedure itemTarefas2Click(Sender: TObject);
    procedure itemTarefas3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefas: TfTarefas;

implementation

uses
  ufTarefa1,
  ufTarefa2,
  ufTarefa3;
{$R *.dfm}

procedure TfTarefas.itemTarefas3Click(Sender: TObject);
begin
  if not Assigned(fTarefa3) then
  begin
    fTarefa3 := TfTarefa3.Create(Self);
  end;
  fTarefa3.Show;
end;

procedure TfTarefas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(fTarefa1) then
    fTarefa1.Close;
  if Assigned(fTarefa2) then
    fTarefa2.Close;
  if Assigned(fTarefa3) then
    fTarefa3.Close;
end;

procedure TfTarefas.itemTarefas1Click(Sender: TObject);
begin
  if not Assigned(fTarefa1) then
  begin
    fTarefa1 := TfTarefa1.Create(Self);
  end;
  fTarefa1.Show;
end;

procedure TfTarefas.itemTarefas2Click(Sender: TObject);
begin
  if not Assigned(fTarefa2) then
  begin
    fTarefa2 := TfTarefa2.Create(Self);
  end;
  fTarefa2.Show;
end;

end.
