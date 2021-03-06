unit uMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Menus, frxpngimage, sSkinManager,
  Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, frxClass, CPort;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Konfigurasi1: TMenuItem;
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
    frxReport1: TfrxReport;
    ComPort1: TComPort;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrRefreshTimer(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnBerkasKeluarMasukClick(Sender: TObject);
    procedure lstResultDblClick(Sender: TObject);
    procedure Konfigurasi1Click(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure BerkasKeluarMasuk1Click(Sender: TObject);
    procedure ManajemenBerkas1Click(Sender: TObject);
    procedure MutasiBerkas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LoadData();
  end;

var
  MainForm: TMainForm;

implementation

uses _uStringGrid, _IniFiles, uDM, uBerkas, uBerkasMutasi, uBerkasScan, ADODB, DB,
  DateUtils, uKonfigurasi;

{$R *.dfm}

var
  vIni: TMyIni;
  tmrCnt: Integer;

procedure WriteCOM(TextToSend:string);
begin
  with MainForm.ComPort1 do
  begin
    Port:= vIni.Read('COMPort','port','COM1');
    try
      Open;
    except
      ShowSetupDialog;
      try
        Open;
      finally
        vIni.Write('COMPort','Port',Port);
      end;
    end;

    if not Connected then Exit;
    WriteStr(TextToSend);
    Sleep(200);
  end;
end;

procedure TMainForm.LoadData();
var
  i, iCnt: Integer;
  sNoRM, sNama, sLokasi: string;
begin
  tmrRefresh.Enabled:=False;
  btnRefresh.Enabled:=False;
  btnRefresh.Caption:= 'Loading...';

  //note: kosongkan status berkas rm
  DM.runQuery(DM.cnn2, DM.qry2, 'update rm set ada=false', eExecute);

  //note: load data pasien aktif saat ini di sirus
  if DM.runQuery(DM.cnn1, DM.qry1, 'select norm,nama,lokasi from msttblreg', eOpen, DBSQLServer) then
  begin
    DM.qry1.First;
    for i:= 1 to DM.qry1.RecordCount do
    begin
      sNoRM:= DM.qry1.FieldByName('norm').AsString;
      sNama:= DM.qry1.FieldByName('nama').AsString;
      sLokasi:= DM.qry1.FieldByName('lokasi').AsString;

      //note: cek apakah no rm tersebut tidak ada di tabel rm
      if not DM.runQuery(DM.cnn2, DM.qry2, 'select idrm from rm where norm='+QuotedStr(DM.qry1.FieldByName('norm').AsString)) then
      begin
        DM.runQuery(DM.cnn2, DM.qry2, 'insert into rm(norm,nama,lokasi,norak) values('+
            QuotedStr(sNoRM)+','+QuotedStr(sNama)+','+QuotedStr(sLokasi)+',0)', eExecute);
      end;

      //note: cek apakah no rm tersebut ada di tabel detil
      if DM.runQuery(DM.cnn2, DM.qry2, 'select top 1 rm.idrm,detil.ada from detil inner join rm on detil.idrm=rm.idrm where rm.norm='+QuotedStr(DM.qry1.FieldByName('norm').AsString)+' order by detil.iddetil desc') then
      begin
        //note: perbaharui data rm
        DM.runQuery(DM.cnn3, DM.qry3, 'update rm set nama='+QuotedStr(sNama)+',lokasi='+QuotedStr(sLokasi)+',ada='+DM.qry2.FieldByName('ada').AsString+
            ' where idrm='+DM.qry2.FieldByName('idrm').AsString, eExecute);
      end else
      begin
        //note: bikin data detil yang baru dengan status ada=true
        if DM.qry2.RecordCount = 0 then
        begin
          if DM.runQuery(DM.cnn2, DM.qry2, 'select idrm from rm where norm='+QuotedStr(sNoRM)) then
          begin
            DM.runQuery(DM.cnn3, DM.qry3, 'insert into detil(idrm,tanggal,lokasi,ada) values('+
                DM.qry2.FieldByName('idrm').AsString+',now(),'+QuotedStr(sLokasi)+',true)', eExecute);
            DM.runQuery(DM.cnn3, DM.qry3, 'update rm set ada=true where idrm='+DM.qry2.FieldByName('idrm').AsString, eExecute);
          end;
        end;
      end;
      DM.qry1.Next;
    end;
  end;

  //note: load data untuk ditampilkan
  WriteCOM('Z');
  DM.runQuery(DM.cnn1, DM.qry1, 'select idrm,norm,nama,lokasi,norak from rm where ada=true order by norm');
  with lstResult do
  begin
    ClearStringGrid(lstResult);
    iCnt:= DM.qry1.RecordCount;
    if iCnt > 0 then
    begin
      RowCount:= iCnt + 1;
      DM.qry1.First;
      for i:= 1 to iCnt do
      begin
        Cells[0,i]:= DM.qry1.Fields[0].AsString;
        Cells[1,i]:= DM.qry1.Fields[1].AsString;
        Cells[2,i]:= DM.qry1.Fields[2].AsString;
        Cells[3,i]:= DM.qry1.Fields[3].AsString;
        Cells[4,i]:= DM.qry1.Fields[4].AsString;
        WriteCOM(Cells[4,i]+'AX');
        DM.qry1.Next;
      end;
    end;
  end;

  btnRefresh.Caption:= 'Finish!';
  btnRefresh.Enabled:=True;
  tmrRefresh.Enabled:=True;
  tmrCnt:= StrToInt(vIni.Read('Timer','Refresh','20'));
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  vIni:= TMyIni.Create;

  //note: sembunyikan kolom idrm
  lstResult.HideColumn(0);
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  WriteCOM('Z');
  vIni.Free;
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

procedure TMainForm.lstResultDblClick(Sender: TObject);
begin
  //note: tampilkan data yang terseleksi pada form manajemen berkas
  frmBerkas.CariBerkas(lstResult.Cells[0, lstResult.Row]);
end;

procedure TMainForm.btnBerkasKeluarMasukClick(Sender: TObject);
begin
  frmBerkasScan.ShowModal;
end;

procedure TMainForm.Konfigurasi1Click(Sender: TObject);
begin
  frmKonfigurasi.ShowModal;
end;

procedure TMainForm.ExitClick(Sender: TObject);
begin
  Close;
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
