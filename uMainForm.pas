unit uMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Menus, frxpngimage, sSkinManager,
  Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Konfigurasi1: TMenuItem;
    ResetLampu1: TMenuItem;
    Exit: TMenuItem;
    N1: TMenuItem;
    PengaturanBerkas1: TMenuItem;
    ManajemenBerkas1: TMenuItem;
    MutasiBerkas1: TMenuItem;
    Laporan1: TMenuItem;
    TentangIrma1: TMenuItem;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btnRefresh: TButton;
    tmrRefresh: TTimer;
    BerkasKeluarMasuk1: TMenuItem;
    N2: TMenuItem;
    sSkinManager1: TsSkinManager;
    lstResult: TAdvStringGrid;
    btnBerkasKeluarMasuk: TButton;
    procedure FormCreate(Sender: TObject);
    procedure tmrRefreshTimer(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnBerkasKeluarMasukClick(Sender: TObject);
    procedure BerkasKeluarMasuk1Click(Sender: TObject);
    procedure ManajemenBerkas1Click(Sender: TObject);
    procedure MutasiBerkas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearList();
    procedure LoadData();
  end;

var
  MainForm: TMainForm;

implementation

uses uDM, uBerkas, uBerkasMutasi, uBerkasScan, ADODB, DB;

{$R *.dfm}

var
  __CFG_TIMER_INTERVAL: Integer;
  tmrCnt: Integer;

procedure TMainForm.ClearList();
begin
  with lstResult do
  begin
    ClearNormalCells;
    RowCount:= 2;
  end;
end;

procedure TMainForm.LoadData();
var
  i, iCnt: Integer;
begin
  tmrRefresh.Enabled:=False;
  btnRefresh.Enabled:=False;
  btnRefresh.Caption:= 'Loading...';

  //todo: load data pendaftaran dari sirus

  if DM.runQuery(DM.cnn1, DM.qry1, 'select * from msttblreg', eOpen, DBSQLServer) then
  begin
    DM.qry1.First;
    for i:= 1 to DM.qry1.RecordCount do
    begin
      if DM.runQuery(DM.cnn2, DM.qry2, 'select * from rm where norm='+QuotedStr(DM.qry1.FieldByName('norm').AsString)) then
      begin
        if DM.qry2.RecordCount > 0 then DM.runQuery(DM.cnn2, DM.qry2, 'update rm set tampil=true', eExecute)
        else DM.runQuery(DM.cnn2, DM.qry2, 'insert into rm(norm,nama,tampil) values('+QuotedStr(DM.qry1.FieldByName('norm').AsString)+','+QuotedStr(DM.qry1.FieldByName('nama').AsString)+',true)', eExecute);
      end;
      DM.qry1.Next;
    end;
  end;

  DM.runQuery(DM.cnn1, DM.qry1, 'select * from rm where tampil=true');
  with lstResult do
  begin
    iCnt:= DM.qry1.RecordCount;
    RowCount:= iCnt + 1;
    DM.qry1.First;
    for i:= 1 to iCnt do
    begin
      Cells[0,i]:= DM.qry1.Fields[1].AsString;
      Cells[1,i]:= DM.qry1.Fields[2].AsString;
      Cells[2,i]:= DM.qry1.Fields[3].AsString;
      //Cells[3,i]:= DM.qry1.Fields[4].AsString;
      DM.qry1.Next;
    end;
  end;

  //todo: refresh lampu rak

  btnRefresh.Caption:= 'Finish!';
  btnRefresh.Enabled:=True;
  tmrRefresh.Enabled:=True;
  tmrCnt:= __CFG_TIMER_INTERVAL;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  __CFG_TIMER_INTERVAL:= 20;
end;

procedure TMainForm.tmrRefreshTimer(Sender: TObject);
begin
  btnRefresh.Caption:= 'Ambil Data Pendaftaran (' + IntToStr(tmrCnt) + ' detik)';
  if tmrCnt > 0 then Dec(tmrCnt) else LoadData;
end;

procedure TMainForm.btnRefreshClick(Sender: TObject);
begin
  LoadData;
end;

procedure TMainForm.btnBerkasKeluarMasukClick(Sender: TObject);
begin
  frmBerkasScan.ShowModal;
end;

procedure TMainForm.BerkasKeluarMasuk1Click(Sender: TObject);
begin
  btnBerkasKeluarMasuk.Click;
end;

procedure TMainForm.ManajemenBerkas1Click(Sender: TObject);
begin
  frmBerkas.ShowModal;
end;

procedure TMainForm.MutasiBerkas1Click(Sender: TObject);
begin
  frmBerkasMutasi.ShowModal;
end;

end.
