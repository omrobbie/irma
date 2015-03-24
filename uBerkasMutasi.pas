unit uBerkasMutasi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmBerkasMutasi = class(TForm)
    Label1: TLabel;
    txtRakKiri: TEdit;
    ListBox1: TListBox;
    Label2: TLabel;
    cmbCariKiri: TComboBox;
    txtCariKiri: TEdit;
    Label3: TLabel;
    txtRakKanan: TEdit;
    ListBox2: TListBox;
    Label4: TLabel;
    cmbCariKanan: TComboBox;
    txtCariKanan: TEdit;
    btnTransferKiri: TButton;
    btnTransferKanan: TButton;
    procedure txtRakKiriKeyPress(Sender: TObject; var Key: Char);
    procedure txtRakKananKeyPress(Sender: TObject; var Key: Char);
    procedure cmbCariKiriChange(Sender: TObject);
    procedure cmbCariKananChange(Sender: TObject);
    procedure txtCariKiriKeyPress(Sender: TObject; var Key: Char);
    procedure txtCariKananKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBerkasMutasi: TfrmBerkasMutasi;

implementation

{$R *.dfm}

procedure TfrmBerkasMutasi.txtRakKiriKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    //todo: cari dan tempatkan di list kiri
  end;
end;

procedure TfrmBerkasMutasi.txtRakKananKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    //todo: cari dan tempatkan di list kanan
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

procedure TfrmBerkasMutasi.txtCariKiriKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    //todo: cari dan tempatkan di list kiri
  end;
end;

procedure TfrmBerkasMutasi.txtCariKananKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    //todo: cari dan tempatkan di list kanan
  end;
end;

end.
