object frmBerkasMutasi: TfrmBerkasMutasi
  Left = 196
  Top = 147
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Mutasi Berkas'
  ClientHeight = 279
  ClientWidth = 778
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 44
    Height = 16
    Caption = 'No. Rak'
  end
  object Label2: TLabel
    Left = 8
    Top = 252
    Width = 23
    Height = 16
    Caption = 'Cari'
  end
  object Label3: TLabel
    Left = 424
    Top = 12
    Width = 44
    Height = 16
    Caption = 'No. Rak'
  end
  object Label4: TLabel
    Left = 424
    Top = 252
    Width = 23
    Height = 16
    Caption = 'Cari'
  end
  object txtRakKiri: TEdit
    Left = 64
    Top = 8
    Width = 121
    Height = 24
    TabOrder = 0
    OnKeyPress = txtRakKiriKeyPress
  end
  object ListBox1: TListBox
    Left = 8
    Top = 40
    Width = 345
    Height = 201
    Cursor = crHandPoint
    ItemHeight = 16
    TabOrder = 1
  end
  object cmbCariKiri: TComboBox
    Left = 40
    Top = 248
    Width = 73
    Height = 24
    Cursor = crHandPoint
    Style = csDropDownList
    ItemHeight = 16
    ItemIndex = 0
    TabOrder = 2
    Text = 'No. RM'
    OnChange = cmbCariKiriChange
    Items.Strings = (
      'No. RM'
      'Nama')
  end
  object txtCariKiri: TEdit
    Left = 112
    Top = 248
    Width = 241
    Height = 24
    TabOrder = 3
    OnKeyPress = txtCariKiriKeyPress
  end
  object txtRakKanan: TEdit
    Left = 480
    Top = 8
    Width = 121
    Height = 24
    TabOrder = 4
    OnKeyPress = txtRakKananKeyPress
  end
  object ListBox2: TListBox
    Left = 424
    Top = 40
    Width = 345
    Height = 201
    Cursor = crHandPoint
    ItemHeight = 16
    TabOrder = 5
  end
  object cmbCariKanan: TComboBox
    Left = 456
    Top = 248
    Width = 73
    Height = 24
    Cursor = crHandPoint
    Style = csDropDownList
    ItemHeight = 16
    ItemIndex = 0
    TabOrder = 6
    Text = 'No. RM'
    OnChange = cmbCariKananChange
    Items.Strings = (
      'No. RM'
      'Nama')
  end
  object txtCariKanan: TEdit
    Left = 528
    Top = 248
    Width = 241
    Height = 24
    TabOrder = 7
    OnKeyPress = txtCariKananKeyPress
  end
  object btnTransferKiri: TButton
    Left = 368
    Top = 112
    Width = 41
    Height = 25
    Cursor = crHandPoint
    Caption = '>'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object btnTransferKanan: TButton
    Left = 368
    Top = 152
    Width = 41
    Height = 25
    Cursor = crHandPoint
    Caption = '<'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
  end
end
