program IRMA;

{%ToDo 'IRMA.todo'}

uses
  Forms,
  uMainForm in 'uMainForm.pas' {MainForm},
  uBerkas in 'uBerkas.pas' {frmBerkas},
  uBerkasMutasi in 'uBerkasMutasi.pas' {frmBerkasMutasi},
  uBerkasScan in 'uBerkasScan.pas' {frmBerkasScan},
  uDM in 'uDM.pas' {DM: TDataModule},
  _uStringGrid in '_uStringGrid.pas',
  _IniFiles in '_IniFiles.pas',
  uKonfigurasi in 'uKonfigurasi.pas' {frmKonfigurasi};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Indikator Rekam Medis Analog';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TfrmBerkas, frmBerkas);
  Application.CreateForm(TfrmBerkasMutasi, frmBerkasMutasi);
  Application.CreateForm(TfrmBerkasScan, frmBerkasScan);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmKonfigurasi, frmKonfigurasi);
  Application.Run;
end.
