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
  end;

var
  frmBerkas: TfrmBerkas;

implementation

{$R *.dfm}

var
  bDetil: Boolean;

procedure FormClear();
begin
  with frmBerkas do
  begin
    txtRM.Text:= '';
    txtNama.Text:= '';
    txtRak.Text:= '';
    txtRM.SetFocus;
  end;
end;

procedure CariBerkas;
begin
  //todo: cari berkas
  ShowMessage('cari berkas');
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
end;

procedure TfrmBerkas.btnSimpanClick(Sender: TObject);
begin
  //todo: simpan atau update berkas
end;

procedure TfrmBerkas.btnHapusClick(Sender: TObject);
begin
  //todo: hapus berkas
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
  if Key = #13 then CariBerkas;
end;

end.
