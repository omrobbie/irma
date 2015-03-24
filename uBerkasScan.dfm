object frmBerkasScan: TfrmBerkasScan
  Left = 861
  Top = 358
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Berkas Keluar/Masuk'
  ClientHeight = 225
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
    Top = 152
    Width = 42
    Height = 16
    Caption = 'Nama :'
  end
  object lblNama: TLabel
    Left = 56
    Top = 152
    Width = 4
    Height = 16
  end
  object btnToggle: TButton
    Left = 0
    Top = 0
    Width = 305
    Height = 57
    Cursor = crHandPoint
    Caption = 'BERKAS KELUAR'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnToggleClick
  end
  object txtRM: TEdit
    Left = 0
    Top = 56
    Width = 305
    Height = 85
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -64
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object btnBerkas: TButton
    Left = 8
    Top = 176
    Width = 289
    Height = 41
    Cursor = crHandPoint
    Caption = 'Manajemen Berkas'
    TabOrder = 2
    OnClick = btnBerkasClick
  end
end
