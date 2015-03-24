program IRMA;

uses
  Forms,
  uMainForm in 'uMainForm.pas' {MainForm},
  uBerkas in 'uBerkas.pas' {frmBerkas},
  uBerkasMutasi in 'uBerkasMutasi.pas' {frmBerkasMutasi},
  uBerkasScan in 'uBerkasScan.pas' {frmBerkasScan},
  uDM in 'uDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Indikator Rekam Medis Analog';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TfrmBerkas, frmBerkas);
  Application.CreateForm(TfrmBerkasMutasi, frmBerkasMutasi);
  Application.CreateForm(TfrmBerkasScan, frmBerkasScan);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
