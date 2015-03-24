unit uDM;

interface

uses
  SysUtils, Classes, DB, ADODB, Dialogs;

type
  TDBTypes = (DBMSAccess, DBSQLServer);
  TExecutes = (eOpen, eExecute);

  TDM = class(TDataModule)
    cnn1: TADOConnection;
    qry1: TADOQuery;
    cnn2: TADOConnection;
    qry2: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function runQuery(Connection:TADOConnection; Query:TADOQuery; SQLString:string; Executed:TExecutes=eOpen; DBType:TDBTypes=DBMSAccess):Boolean;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

function TDM.runQuery(Connection:TADOConnection; Query:TADOQuery; SQLString:string; Executed:TExecutes=eOpen; DBType:TDBTypes=DBMSAccess):Boolean;
begin
  try
    Connection.Close;
    Connection.ConnectionString:= '';
    if DBType = DBMSAccess then Connection.ConnectionString:= 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=irma.mdb;Persist Security Info=False';
    if DBType = DBSQLServer then Connection.ConnectionString:= 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=master.mdb;Persist Security Info=False';
    //if DBType = SQLServer then Connection.ConnectionString:= 'Provider=MSDASQL;Persist Security Info=False;Data Source=PB;Initial Catalog=SIRUS PB';
    Connection.Open;
  except
    ShowMessage('Tidak dapat terkoneksi dengan database!');
    Result:= False;
    Exit;
  end;

  try
    Connection.BeginTrans;
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add(SQLString);
    if Executed = eExecute then Query.ExecSQL
    else Query.Open;
    Connection.CommitTrans;
  except
    Connection.RollbackTrans;
  end;
  if Query.Active then Result:= True;
end;

end.
