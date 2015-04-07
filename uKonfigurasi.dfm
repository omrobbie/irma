object frmKonfigurasi: TfrmKonfigurasi
  Left = 718
  Top = 573
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Konfigurasi'
  ClientHeight = 115
  ClientWidth = 243
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 48
    Width = 96
    Height = 16
    Caption = 'COM Port Lampu'
  end
  object Label2: TLabel
    Left = 8
    Top = 80
    Width = 122
    Height = 16
    Caption = 'Refresh Otomatis Per'
  end
  object Label3: TLabel
    Left = 192
    Top = 80
    Width = 28
    Height = 16
    Caption = 'Detik'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 243
    Height = 41
    Align = alTop
    TabOrder = 0
    object btnSimpan: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = '&Simpan'
      TabOrder = 0
      OnClick = btnSimpanClick
    end
  end
  object txtPort: TEdit
    Left = 112
    Top = 48
    Width = 81
    Height = 24
    Enabled = False
    TabOrder = 1
  end
  object txtRefresh: TEdit
    Left = 136
    Top = 80
    Width = 49
    Height = 24
    TabOrder = 2
  end
  object btnCOMDialog: TButton
    Left = 200
    Top = 48
    Width = 35
    Height = 25
    Cursor = crHandPoint
    Caption = '...'
    TabOrder = 3
    OnClick = btnCOMDialogClick
  end
end
