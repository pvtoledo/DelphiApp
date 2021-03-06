unit ufTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys, uspQuery, System.StrUtils;

type
  TfTarefa1 = class(TForm)
    MemoColunas: TMemo;
    LblColunas: TLabel;
    MemoTabelas: TMemo;
    LblTabelas: TLabel;
    MemoCondicoes: TMemo;
    LblCondicoes: TLabel;
    MemoSQL: TMemo;
    LblSql: TLabel;
    BtnGera: TButton;
    spSql: TspQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGeraClick(Sender: TObject);
    procedure LimpaMemos;
    procedure ChecaMemos;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefa1: TfTarefa1;

implementation

{$R *.dfm}

procedure TfTarefa1.BtnGeraClick(Sender: TObject);
begin
  spSql := TspQuery.Create;
  ChecaMemos;
  try
    spSql.spColunas.Assign(MemoColunas.Lines);
    spSql.spTabelas.Assign(MemoTabelas.Lines);
    spSql.spCondicoes.Assign(MemoCondicoes.Lines);
    spSql.GeraSql;
  finally
    MemoSQL.Lines.Assign(spSql.SQL);
    LimpaMemos;
    FreeAndNil(spSql);
  end;
end;

procedure TfTarefa1.ChecaMemos;
begin
  if MemoTabelas.Lines.Count > 1 then
  begin
    LimpaMemos;
    spSql.RaiseException('? permitido informar apenas 1 tabela para gera??o do SQL!');
  end
  else if (MemoColunas.Lines.Count = 0) OR (MemoTabelas.Lines.Count = 0) OR (MemoCondicoes.Lines.Count = 0) then
  begin
     LimpaMemos;
     spSql.RaiseException('? necess?rio preencher todos os campos!');
  end;
end;

procedure TfTarefa1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
  fTarefa1:= nil;
end;

procedure TfTarefa1.LimpaMemos;
begin
  MemoColunas.Clear;
  MemoTabelas.Clear;
  MemoCondicoes.Clear;
end;

end.
