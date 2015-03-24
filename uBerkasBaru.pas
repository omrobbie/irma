unit uBerkasBaru;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmBerkasBaru = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btnBaru: TButton;
    btnSimpan: TButton;
    btnHapus: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    txtRM: TEdit;
    txtNama: TEdit;
    txtRak: TEdit;
    ListBox1: TListBox;
    Panel4: TPanel;
    Label4: TLabel;
    txtCari: TEdit;
    cmbCari: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure btnBaruClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure cmbCariChange(Sender: TObject);
    procedure txtCariKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBerkasBaru: TfrmBerkasBaru;

implementation

{$R *.dfm}

procedure FormClear();
begin
  with frmBerkasBaru do
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

procedure TfrmBerkasBaru.FormActivate(Sender: TObject);
begin
  FormClear;
end;

procedure TfrmBerkasBaru.btnBaruClick(Sender: TObject);
begin
  FormClear;
end;

procedure TfrmBerkasBaru.btnSimpanClick(Sender: TObject);
begin
  //todo: simpan atau update berkas
end;

procedure TfrmBerkasBaru.btnHapusClick(Sender: TObject);
begin
  //todo: hapus berkas
end;

procedure TfrmBerkasBaru.cmbCariChange(Sender: TObject);
begin
  txtCari.SetFocus;
end;

procedure TfrmBerkasBaru.txtCariKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then CariBerkas;
end;

end.
