unit _uStringGrid;

interface

uses AdvGrid;

procedure ClearStringGrid(Grid: TAdvStringGrid);

implementation

uses Classes;

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

end.
