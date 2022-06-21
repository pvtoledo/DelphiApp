unit ufTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Data.DB, Vcl.StdCtrls, DBClient,
  Vcl.DBGrids;

type
  TfTarefa3 = class(TForm)
    gridTarefa: TDBGrid;
    btTotal: TButton;
    btTotalDivisoes: TButton;
    lTotal: TLabel;
    lTotalDivisoes: TLabel;
    eTotalDivisoes: TEdit;
    eTotal: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btTotalClick(Sender: TObject);
    procedure btTotalDivisoesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefa3: TfTarefa3;
  cds: TClientDataSet;
  ds: TDataSource;

implementation

{$R *.dfm}

procedure TfTarefa3.btTotalClick(Sender: TObject);
var
  total: Currency;
begin
  cds.First;
  total:= 0;
  while not cds.Eof do
  begin
   total := cds.FieldByName('Valor').AsCurrency  + total;
   cds.Next;
  end;
  eTotal.Text := CurrToStrf(total,ffCurrency,2);
end;

procedure TfTarefa3.btTotalDivisoesClick(Sender: TObject);
var
  valorAnterior,total: Currency;
begin
  cds.First;
  total:= 0;
  valorAnterior:= cds.FieldByName('Valor').AsCurrency;
  cds.Next;
  while not cds.Eof do
  begin
   total := (cds.FieldByName('Valor').AsCurrency  / valorAnterior) + total;
   valorAnterior:= cds.FieldByName('Valor').AsCurrency;
   cds.Next;
  end;
  eTotalDivisoes.Text := CurrToStrf(total,ffCurrency,2);
end;

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cds.Close;
  FreeAndNil(cds);
  FreeAndNil(ds);
  Action := caFree;
  Release;
  fTarefa3:= nil;
end;

procedure TfTarefa3.FormCreate(Sender: TObject);
var
  i, nroRandom: Integer;
begin
  cds:= TClientDataSet.Create(nil);
  cds.Close;
  cds.FieldDefs.Clear;
  cds.FieldDefs.Add('IdProjeto', ftInteger);
  cds.FieldDefs.Add('NomeProjeto', ftString,40,False);
  cds.FieldDefs.Add('Valor', ftCurrency);
  cds.CreateDataSet;
  for i := 0 to 9 do
  begin
    nroRandom := 1 + Random(100);
    cds.Append;
    cds.FieldByName('IdProjeto').AsInteger := nroRandom;
    cds.FieldByName('NomeProjeto').AsString := 'Projeto ' + nroRandom.ToString;
    cds.FieldByName('Valor').AsCurrency := nroRandom * 10;
    cds.Post;
  end;
  ds:= TDataSource.Create(nil);
  ds.DataSet := cds;
  gridTarefa.DataSource:= ds;
end;

end.

