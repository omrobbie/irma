unit uKonfigurasi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmKonfigurasi = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    txtPort: TEdit;
    txtRefresh: TEdit;
    btnSimpan: TButton;
    btnCOMDialog: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnCOMDialogClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKonfigurasi: TfrmKonfigurasi;

implementation

uses uMainForm, _IniFiles, CPort;

{$R *.dfm}

var
  vIni: TMyIni;

procedure TfrmKonfigurasi.FormCreate(Sender: TObject);
begin
  vIni:= TMyIni.Create;
end;

procedure TfrmKonfigurasi.FormDestroy(Sender: TObject);
begin
  vIni.Destroy;
end;

procedure TfrmKonfigurasi.FormActivate(Sender: TObject);
begin
  txtPort.Text:= vIni.Read('COMPort','Port','COM1');
  txtRefresh.Text:= vIni.Read('Timer','Refresh','20');
end;

procedure TfrmKonfigurasi.btnCOMDialogClick(Sender: TObject);
begin
  with MainForm.ComPort1 do
  begin
    ShowSetupDialog;
    try
      Open;
    finally
      txtPort.Text:= Port;
    end;
  end;
end;

procedure TfrmKonfigurasi.btnSimpanClick(Sender: TObject);
begin
  vIni.Write('COMPort','Port',txtPort.Text);
  vIni.Write('Timer','Refresh',txtRefresh.Text);
  MainForm.LoadData;
  Close;
end;

end.
