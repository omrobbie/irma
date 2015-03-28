unit uBerkasScan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmBerkasScan = class(TForm)
    btnToggle: TButton;
    txtRM: TEdit;
    Label1: TLabel;
    lblNama: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btnToggleClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBerkasScan: TfrmBerkasScan;

implementation

uses uBerkas;

{$R *.dfm}

var
  bToggle: Boolean;

procedure TfrmBerkasScan.FormActivate(Sender: TObject);
begin
  bToggle:= False;
  btnToggle.Caption:= 'BERKAS KELUAR';
  txtRM.Color:= clRed;
  txtRM.SetFocus;
end;

procedure TfrmBerkasScan.btnToggleClick(Sender: TObject);
begin
  bToggle:= not bToggle;
  if bToggle then
  begin
    btnToggle.Caption:= 'BERKAS MASUK';
    txtRM.Color:= clGreen;
  end else
  begin
    btnToggle.Caption:= 'BERKAS KELUAR';
    txtRM.Color:= clRed;
  end;
  lblNama.Caption:= '';
  txtRM.Text:= '';
  txtRM.SetFocus;
end;

end.
