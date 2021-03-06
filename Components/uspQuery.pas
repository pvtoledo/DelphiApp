unit uspQuery;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys, System.StrUtils;

type
  TspQuery = class(TFDQuery)
  private
    { Private declarations }
  protected

    { Protected declarations }
  public
    spCondicoes: TStringList;
    spColunas: TStringList;
    spTabelas: TStringList;
    procedure GeraSql;
    constructor Create; reintroduce; overload;
    procedure RaiseException(exc: String);
    procedure CleanList;
    { Public declarations }
  published
    { Published declarations }
  end;

implementation

{ TspQuery }

procedure TspQuery.CleanList;
begin
  Self.spCondicoes.Free;
  Self.spColunas.Free;
  Self.spTabelas.Free;
end;

constructor TspQuery.Create;
begin
  inherited Create(nil);
  Self.spCondicoes := TStringList.Create;
  Self.spColunas := TStringList.Create;
  Self.spTabelas := TStringList.Create;
end;

procedure TspQuery.GeraSql;
var
  i: Integer;
  temp: String;
begin
  try
    temp := '';
    if Self.spColunas.Count > 1 then
    begin
      for i := 0 to Self.spColunas.Count - 1 do
      begin
        if i = Self.spColunas.Count - 1 then
          temp := temp + Self.spColunas[i]
        else
          temp := temp + Self.spColunas[i] + ', ';
      end;
      Self.SQL.Add('SELECT ' + temp);
    end
    else
      Self.SQL.Add('SELECT ' + Self.spColunas[0]);
    temp := '';
    Self.SQL.Add('FROM ' + spTabelas[0]);

    if Self.spCondicoes.Count > 1 then
    begin
      for i := 0 to Self.spCondicoes.Count - 1 do
      begin
        if i = Self.spCondicoes.Count - 1 then
          temp := temp + Self.spCondicoes[i]
        else
        begin
          temp := temp + Self.spCondicoes[i] + ' AND ';
        end;
      end;
      Self.SQL.Add('WHERE ' + temp);
    end
    else
      Self.SQL.Add('WHERE ' + Self.spCondicoes[0]);
  finally
    CleanList;
  end;
end;

procedure TspQuery.RaiseException(exc: String);
begin
  CleanList;
  Self.Free;
  raise Exception.Create(exc);
end;

end.
