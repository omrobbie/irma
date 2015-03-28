unit uBerkas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

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
    ListBox1: TListBox;
    Label4: TLabel;
    txtCari: TEdit;
    cmbCari: TComboBox;
    lstDetil: TListBox;
    txtID: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure btnBaruClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnCetakBarcodeClick(Sender: TObject);
    procedure btnDetilClick(Sender: TObject);
    procedure cmbCariChange(Sender: TObject);
    procedure txtCariKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CariBerkas(idRM:string);
  end;

var
  frmBerkas: TfrmBerkas;

implementation

uses _uStringGrid, uDM, uMainForm;

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
  end;
end;

procedure TfrmBerkas.CariBerkas(idRM:string);
begin
  //note: cek apakah data idrm ada di tabel rm
  FormClear;
  DM.runQuery(DM.cnn1, DM.qry1, 'select idrm,norm,nama,norak from rm where idrm='+idRM);
  if DM.qry1.RecordCount > 0 then
  begin
    txtID.Text:= DM.qry1.FieldByName('idrm').AsString;
    txtRM.Text:= DM.qry1.FieldByName('norm').AsString;
    txtNama.Text:= DM.qry1.FieldByName('nama').AsString;
    txtRak.Text:= DM.qry1.FieldByName('norak').AsString;
  end;
  ShowModal;
end;

procedure TfrmBerkas.FormActivate(Sender: TObject);
begin
  bDetil:= False;
  lstDetil.Visible:= bDetil;
  btnDetil.Caption:= 'Lihat Detil';
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
  MainForm.LoadData;
  Close;
end;

procedure TfrmBerkas.btnHapusClick(Sender: TObject);
begin
  if Trim(txtID.Text) = '' then Exit;
  //note: cek apakah ada data idrm tersebut di tabel detil
  DM.runQuery(DM.cnn1, DM.qry1, 'select iddetil from detil where idrm='+txtID.Text);
  if DM.qry1.RecordCount > 0 then
  begin
    if MessageDlg('Anda memiliki '+IntToStr(DM.qry1.RecordCount)+' data log untuk nomer rm ini'+#13#10+
        'Apakah anda yakin akan menghapus seluruh catatan yang ada?', mtConfirmation, mbOKCancel, 0) = mrOk then
    begin
      DM.runQuery(DM.cnn1, DM.qry1, 'delete from detil where idrm='+txtID.Text, eExecute);
      DM.runQuery(DM.cnn1, DM.qry1, 'delete from rm where idrm='+txtID.Text, eExecute);
      MainForm.LoadData;
      Close;
    end;
  end;
end;

procedure TfrmBerkas.btnCetakBarcodeClick(Sender: TObject);
begin
  //todo: scan barcode
end;

procedure TfrmBerkas.btnDetilClick(Sender: TObject);
begin
  //todo: tampilkan data detil keluar/masuk berkas
  bDetil:= not bDetil;
  lstDetil.Visible:= bDetil;

  if bDetil then btnDetil.Caption:= 'Sembunyikan'
  else btnDetil.Caption:= 'Lihat Detil';
end;

procedure TfrmBerkas.cmbCariChange(Sender: TObject);
begin
  txtCari.SetFocus;
end;

procedure TfrmBerkas.txtCariKeyPress(Sender: TObject; var Key: Char);
begin
  //if Key = #13 then CariBerkas;
end;

end.
