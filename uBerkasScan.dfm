object frmBerkasScan: TfrmBerkasScan
  Left = 840
  Top = 506
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Berkas Keluar/Masuk'
  ClientHeight = 193
  ClientWidth = 305
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 96
    Width = 41
    Height = 16
    Caption = 'No. RM'
  end
  object lblNama: TLabel
    Left = 56
    Top = 168
    Width = 4
    Height = 16
  end
  object Label2: TLabel
    Left = 8
    Top = 120
    Width = 33
    Height = 16
    Caption = 'Nama'
  end
  object Label3: TLabel
    Left = 8
    Top = 144
    Width = 83
    Height = 16
    Caption = 'Lokasi terakhir'
  end
  object Label4: TLabel
    Left = 104
    Top = 96
    Width = 5
    Height = 16
    Caption = ':'
  end
  object Label5: TLabel
    Left = 104
    Top = 120
    Width = 5
    Height = 16
    Caption = ':'
  end
  object Label6: TLabel
    Left = 104
    Top = 144
    Width = 5
    Height = 16
    Caption = ':'
  end
  object txtRM: TLabel
    Left = 120
    Top = 96
    Width = 4
    Height = 16
  end
  object txtNama: TLabel
    Left = 120
    Top = 120
    Width = 4
    Height = 16
  end
  object txtLokasi: TLabel
    Left = 120
    Top = 144
    Width = 4
    Height = 16
  end
  object Label7: TLabel
    Left = 56
    Top = 176
    Width = 4
    Height = 16
  end
  object Label8: TLabel
    Left = 8
    Top = 168
    Width = 36
    Height = 16
    Caption = 'Status'
  end
  object Label9: TLabel
    Left = 104
    Top = 168
    Width = 5
    Height = 16
    Caption = ':'
  end
  object txtStatus: TLabel
    Left = 120
    Top = 168
    Width = 4
    Height = 16
  end
  object txtScan: TEdit
    Left = 0
    Top = 0
    Width = 305
    Height = 85
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -64
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyPress = txtScanKeyPress
  end
end
