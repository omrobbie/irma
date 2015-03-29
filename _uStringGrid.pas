unit _uStringGrid;

interface

uses AdvGrid;

procedure ClearStringGrid(Grid: TAdvStringGrid);
procedure CetakMemo(sObj, sMemo: String);

implementation

uses Classes, frxclass, uMainForm;

procedure ClearStringGrid(Grid: TAdvStringGrid);
var
  sHeader: string;
begin
  with Grid do
  begin
    sHeader:= ColumnHeaders.Text;
    RowCount:= 1;
    Clear;
    ColumnHeaders.Text:= sHeader;
  end;
end;

procedure CetakMemo(sObj, sMemo: String);
var
  vMemo: TfrxMemoView;
begin
  vMemo:= TfrxMemoView(MainForm.frxReport1.FindObject(sObj));
  vMemo.Memo.Text:= sMemo;
end;

end.
