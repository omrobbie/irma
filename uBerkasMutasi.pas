unit uBerkasMutasi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, AdvObj, BaseGrid, AdvGrid;

type
  TfrmBerkasMutasi = class(TForm)
    Label1: TLabel;
    txtRakKiri: TEdit;
    Label2: TLabel;
    cmbCariKiri: TComboBox;
    txtCariKiri: TEdit;
    Label3: TLabel;
    txtRakKanan: TEdit;
    Label4: TLabel;
    cmbCariKanan: TComboBox;
    txtCariKanan: TEdit;
    btnTransferKiri: TButton;
    btnTransferKanan: TButton;
    lstKiri: TAdvStringGrid;
    lstKanan: TAdvStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure txtRakKiriKeyPress(Sender: TObject; var Key: Char);
    procedure txtRakKananKeyPress(Sender: TObject; var Key: Char);
    procedure cmbCariKiriChange(Sender: TObject);
    procedure cmbCariKananChange(Sender: TObject);
    procedure btnTransferKiriClick(Sender: TObject);
    procedure btnTransferKananClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBerkasMutasi: TfrmBerkasMutasi;

implementation

uses _uStringGrid, uDM, Math;

{$R *.dfm}

procedure LoadData(List:TAdvStringGrid; Sisi:Byte; Berdasarkan:integer=0; Data:string=''; Rak:string='');
var
  i, iCnt: Integer;
  sCari, sSQL, sWhere, sOrder: string;
begin
  //note: sisi: 0=kiri, 1=kanan
  if Sisi = 0 then sCari:= frmBerkasMutasi.txtCariKiri.Text
  else sCari:= frmBerkasMutasi.txtCariKanan.Text;

  //note: berdasarkan: 0=norm, 1=nama
  case Berdasarkan of
    0: begin
      sWhere:= 'norm like '+QuotedStr('%'+sCari+'%');
      sOrder:= 'norm';
    end;
    1: begin
      sWhere:= 'nama like '+QuotedStr('%'+sCari+'%');
      sOrder:= 'nama';
    end;
  end;

  if Data = '' then sOrder:= 'idrm';
  if Rak <> '' then sWhere:= sWhere+' and norak='+Rak;
  sSQL:= 'select top 50 idrm,norm,nama from rm where '+sWhere+' order by '+sOrder+' desc';
  DM.runQuery(DM.cnn1, DM.qry1, sSQL);
  ClearStringGrid(List);
  iCnt:= DM.qry1.RecordCount;
  if iCnt > 0 then
  begin
    List.RowCount:= iCnt + 1;
    DM.qry1.First;
    for i:= 1 to iCnt do
    begin
      List.Cells[0,i]:= DM.qry1.Fields[0].AsString;
      List.Cells[1,i]:= DM.qry1.Fields[1].AsString;
      List.Cells[2,i]:= DM.qry1.Fields[2].AsString;
      DM.qry1.Next;
    end;
  end;
end;

procedure RefreshList();
begin
  with frmBerkasMutasi do
  begin
    LoadData(lstKiri, 0, cmbCariKiri.ItemIndex, txtCariKiri.Text, txtRakKiri.Text);
    LoadData(lstKanan, 1, cmbCariKanan.ItemIndex, txtCariKanan.Text, txtRakKanan.Text);
  end;
end;

procedure TransferBerkas(lstFrom:TAdvStringGrid; Rak:string);
begin
  if lstFrom.RowCount <= 1 then
  begin
    ShowMessage('Tidak ada data yang dapat ditransfer');
    Exit;
  end;
  DM.runQuery(DM.cnn1, DM.qry1, 'update rm set norak='+Rak+' where idrm='+lstFrom.cells[0,lstFrom.SelectedRow[0]], eExecute);
end;

procedure TfrmBerkasMutasi.FormCreate(Sender: TObject);
begin
  lstKiri.HideColumn(0);
  lstKanan.HideColumn(0);
end;

procedure TfrmBerkasMutasi.txtRakKiriKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    //note: cari dan tempatkan di list kiri
    RefreshList;
  end;
end;

procedure TfrmBerkasMutasi.txtRakKananKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    //note: cari dan tempatkan di list kanan
    RefreshList;
  end;
end;

procedure TfrmBerkasMutasi.cmbCariKiriChange(Sender: TObject);
begin
  txtCariKiri.SetFocus;
end;

procedure TfrmBerkasMutasi.cmbCariKananChange(Sender: TObject);
begin
  txtCariKanan.SetFocus;
end;

procedure TfrmBerkasMutasi.btnTransferKiriClick(Sender: TObject);
begin
  if txtRakKanan.Text = '' then
  begin
    ShowMessage('Rak tujuan belum ditentukan');
    Exit;
  end;

  //note: mutasi berkas dari kiri ke kanan
  TransferBerkas(lstKiri, txtRakKanan.Text);

  //note: refresh list berkas
  RefreshList;
end;

procedure TfrmBerkasMutasi.btnTransferKananClick(Sender: TObject);
begin
  if txtRakKiri.Text = '' then
  begin
    ShowMessage('Rak tujuan belum ditentukan');
    Exit;
  end;

  //note: mutasi berkas dari kanan ke kiri
  TransferBerkas(lstKanan, txtRakKiri.Text);

  //note: refresh list berkas
  RefreshList;
end;

end.
