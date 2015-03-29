unit uBerkas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, AdvObj, BaseGrid, AdvGrid, frxClass;

type
  TfrmBerkas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    btnBaru: TButton;
    btnSimpan: TButton;
    btnHapus: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    txtRM: TEdit;
    txtNama: TEdit;
    txtRak: TEdit;
    btnCetakBarcode: TButton;
    btnDetil: TButton;
    Label4: TLabel;
    txtCari: TEdit;
    cmbCari: TComboBox;
    txtID: TEdit;
    lstRM: TAdvStringGrid;
    lstDetil: TAdvStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnBaruClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnCetakBarcodeClick(Sender: TObject);
    procedure btnDetilClick(Sender: TObject);
    procedure cmbCariChange(Sender: TObject);
    procedure txtRMKeyPress(Sender: TObject; var Key: Char);
    procedure txtNamaKeyPress(Sender: TObject; var Key: Char);
    procedure txtRakKeyPress(Sender: TObject; var Key: Char);
    procedure txtCariKeyPress(Sender: TObject; var Key: Char);
    procedure lstRMClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CariBerkas(idRM:string);
  end;

var
  frmBerkas: TfrmBerkas;

implementation

uses _uStringGrid, uDM, uMainForm, DB, StdVCL;

{$R *.dfm}

var
  bDetil: Boolean;

procedure FormClear();
begin
  with frmBerkas do
  begin
    txtID.Text:= '';
    txtRM.Text:= '';
    txtNama.Text:= '';
    txtRak.Text:= '';
    lstDetil.Visible:= False;
  end;
end;

procedure LoadData(Berdasarkan:integer=0; Data:string='');
var
  i, iCnt: Integer;
  sSQL, sWhere, sOrder: string;
begin
  //note: berdasarkan: 0=norm, 1=nama, 2=norak
  case Berdasarkan of
    0: begin
      sWhere:= 'norm like '+QuotedStr('%'+frmBerkas.txtCari.Text+'%');
      sOrder:= 'norm';
    end;
    1: begin
      sWhere:= 'nama like '+QuotedStr('%'+frmBerkas.txtCari.Text+'%');
      sOrder:= 'nama';
    end;
    2: begin
      sWhere:= 'norak='+frmBerkas.txtCari.Text;
      sOrder:= 'norak'
    end;
  end;
  if Data = '' then sOrder:= 'idrm';
  sSQL:= 'select top 50 idrm,norm,nama from rm where '+sWhere+' order by '+sOrder+' desc';
  DM.runQuery(DM.cnn1, DM.qry1, sSQL);
  ClearStringGrid(frmBerkas.lstRM);
  iCnt:= DM.qry1.RecordCount;
  if iCnt > 0 then
  begin
    frmBerkas.lstRM.RowCount:= iCnt + 1;
    DM.qry1.First;
    for i:= 1 to iCnt do
    begin
      frmBerkas.lstRM.Cells[0,i]:= DM.qry1.Fields[0].AsString;
      frmBerkas.lstRM.Cells[1,i]:= DM.qry1.Fields[1].AsString;
      frmBerkas.lstRM.Cells[2,i]:= DM.qry1.Fields[2].AsString;
      DM.qry1.Next;
    end;
  end;
end;

procedure TfrmBerkas.CariBerkas(idRM:string);
begin
  //note: cek apakah data idrm ada di tabel rm
  FormClear;
  if idRM = '' then Exit;
  DM.runQuery(DM.cnn1, DM.qry1, 'select idrm,norm,nama,norak from rm where idrm='+idRM);
  if DM.qry1.RecordCount > 0 then
  begin
    txtID.Text:= DM.qry1.FieldByName('idrm').AsString;
    txtRM.Text:= DM.qry1.FieldByName('norm').AsString;
    txtNama.Text:= DM.qry1.FieldByName('nama').AsString;
    txtRak.Text:= DM.qry1.FieldByName('norak').AsString;
  end;
  if Visible = False then ShowModal;
end;

procedure TfrmBerkas.FormCreate(Sender: TObject);
begin
  lstRM.HideColumn(0);
end;

procedure TfrmBerkas.FormActivate(Sender: TObject);
begin
  bDetil:= False;
  lstDetil.Visible:= bDetil;
  btnDetil.Caption:= 'Lihat Detil';
  LoadData;
end;

procedure TfrmBerkas.btnBaruClick(Sender: TObject);
begin
  FormClear;
  txtRM.SetFocus;
end;

procedure TfrmBerkas.btnSimpanClick(Sender: TObject);
begin
  if Trim(txtRM.Text) = '' then Exit;
  if Trim(txtRak.Text) = '' then txtRak.Text:= '0';
  if Trim(txtID.Text) = '' then
  begin
    DM.runQuery(DM.cnn1, DM.qry1, 'select idrm from rm where norm='+QuotedStr(txtRM.Text));
    if DM.qry1.RecordCount > 0 then
    begin
      ShowMessage('Nomer rm "'+txtRM.Text+'" sudah ada!');
      Exit;
    end;
    DM.runQuery(DM.cnn1, DM.qry1, 'insert into rm(norm,nama,norak) values('+
        QuotedStr(txtRM.Text)+','+QuotedStr(txtNama.Text)+','+QuotedStr(txtRak.Text)+')', eExecute);
  end else                   
  begin
    DM.runQuery(DM.cnn1, DM.qry1, 'update rm set norm='+QuotedStr(txtRM.Text)+
        ', nama='+QuotedStr(txtNama.Text)+
        ', norak='+QuotedStr(txtRak.Text)+
        ' where idrm='+txtID.Text, eExecute);
  end;
  ShowMessage('Data berhasil disimpan!');
  btnBaru.Click;
  LoadData;
end;

procedure TfrmBerkas.btnHapusClick(Sender: TObject);
begin
  if Trim(txtID.Text) = '' then Exit;
  //note: cek apakah ada data idrm tersebut di tabel detil
  DM.runQuery(DM.cnn1, DM.qry1, 'select iddetil from detil where idrm='+txtID.Text);
  if DM.qry1.RecordCount > 0 then
  begin
    if MessageDlg('Anda memiliki '+IntToStr(DM.qry1.RecordCount)+' data log untuk nomer rm ini'+#13#10+
        'Apakah anda yakin akan menghapus seluruh catatan yang ada?', mtConfirmation, mbOKCancel, 0) = mrCancel then Exit;
    DM.runQuery(DM.cnn1, DM.qry1, 'delete from detil where idrm='+txtID.Text, eExecute);
  end;
  DM.runQuery(DM.cnn1, DM.qry1, 'delete from rm where idrm='+txtID.Text, eExecute);
  ShowMessage('Data berhasil dihapus!');
  btnBaru.Click;
  LoadData;
end;

procedure TfrmBerkas.btnCetakBarcodeClick(Sender: TObject);
begin
  //note: cetak barcode
  if txtID.Text = '' then Exit;
  with MainForm.frxReport1 do
  begin
    LoadFromFile('rptBarcode.fr3');
    CetakMemo('barcode',txtRM.Text);
    CetakMemo('nama', txtNama.Text);
    ShowReport;
  end;
end;

procedure TfrmBerkas.btnDetilClick(Sender: TObject);
var
  i, iCnt: Integer;
begin
  //note: tampilkan data detil keluar/masuk berkas
  bDetil:= not bDetil;
  lstDetil.Visible:= bDetil;

  if bDetil then btnDetil.Caption:= 'Sembunyikan'
  else btnDetil.Caption:= 'Lihat Detil';

  if bDetil then
  begin
    DM.runQuery(DM.cnn1, DM.qry1, 'select tanggal,lokasi,iif(ada,"<<","          >>") from detil where idrm='+txtID.Text+' order by iddetil desc');
    ClearStringGrid(lstDetil);
    iCnt:= DM.qry1.RecordCount;
    if iCnt > 0 then
    begin
      lstDetil.RowCount:= iCnt + 1;
      DM.qry1.First;
      for i:= 1 to iCnt do
      begin
        lstDetil.Cells[0,i]:= DM.qry1.Fields[0].AsString;
        lstDetil.Cells[1,i]:= DM.qry1.Fields[1].AsString;
        lstDetil.Cells[2,i]:= DM.qry1.Fields[2].AsString;
        DM.qry1.Next;
      end;
    end;
  end;
end;

procedure TfrmBerkas.cmbCariChange(Sender: TObject);
begin
  txtCari.SetFocus;
end;

procedure TfrmBerkas.txtRMKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then txtNama.SetFocus;
end;

procedure TfrmBerkas.txtNamaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then txtRak.SetFocus;
end;

procedure TfrmBerkas.txtRakKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then btnSimpan.SetFocus;
end;

procedure TfrmBerkas.txtCariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then LoadData(cmbCari.ItemIndex, txtCari.Text);
end;

procedure TfrmBerkas.lstRMClick(Sender: TObject);
begin
  CariBerkas(lstRM.Cells[0,lstRM.Row]);
end;

end.
