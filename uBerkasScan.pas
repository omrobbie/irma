unit uBerkasScan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmBerkasScan = class(TForm)
    txtScan: TEdit;
    Label1: TLabel;
    lblNama: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    txtRM: TLabel;
    txtNama: TLabel;
    txtLokasi: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    txtStatus: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure txtScanKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LoadData();
  end;

var
  frmBerkasScan: TfrmBerkasScan;

implementation

uses uBerkas, uDM;

{$R *.dfm}

procedure TfrmBerkasScan.LoadData();
var
  bKeluar: Boolean;
begin
  if txtScan.Text = '' then Exit;

  //note: cek apakah nomer rm tersebut ada di tabel rm
  DM.runQuery(DM.cnn1, DM.qry1, 'select idrm,norm,nama,lokasi from rm where norm='+QuotedStr(txtScan.Text));
  if DM.qry1.RecordCount <= 0 then
  begin
    ShowMessage('Data RM "'+txtScan.Text+'" belum terdaftar.'+#13#10+'Mohon di daftarkan melalui form Manajemen Berkas');
    txtScan.Text:= '';
    Exit;
  end;
  
  txtRM.Caption:= DM.qry1.FieldByName('norm').AsString;
  txtNama.Caption:= DM.qry1.FieldByName('nama').AsString;
  txtLokasi.Caption:= DM.qry1.FieldByName('lokasi').AsString;

  //note: cek apakah ada data di tabel detil untuk rm tersebut
  DM.runQuery(DM.cnn2, DM.qry2, 'select top 1 ada from detil where idrm='+DM.qry1.FieldByName('idrm').AsString+' order by iddetil desc');
  if DM.qry2.RecordCount > 0 then bKeluar:= DM.qry2.FieldByName('ada').AsBoolean
  else
  begin
    ShowMessage('Data RM "'+txtScan.Text+'" tidak ada data detilnya');
    txtScan.Text;
    Exit;
  end;

  //note: masukkan data baru ke tabel detil
  DM.runQuery(DM.cnn3, DM.qry3, 'insert into detil(idrm,tanggal,lokasi,ada) values('+
      DM.qry1.FieldByName('idrm').AsString+',now(),'+QuotedStr(txtLokasi.Caption)+','+BoolToStr(not bKeluar)+')', eExecute);
  txtStatus.ParentColor:= false;
  if bKeluar then txtStatus.Caption:= '<<< KELUAR >>>'
  else txtStatus.Caption:= '>>> MASUK <<<';
  txtScan.Text:= '';
end;

procedure TfrmBerkasScan.FormActivate(Sender: TObject);
begin
  txtScan.Color:= clYellow;
  txtScan.SetFocus;
end;

procedure TfrmBerkasScan.txtScanKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then LoadData;
end;

end.
