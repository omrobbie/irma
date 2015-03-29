object frmBerkas: TfrmBerkas
  Left = 515
  Top = 114
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Manajemen Berkas'
  ClientHeight = 566
  ClientWidth = 314
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
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 314
    Height = 41
    Align = alTop
    TabOrder = 0
    object btnBaru: TButton
      Left = 8
      Top = 8
      Width = 65
      Height = 25
      Cursor = crHandPoint
      Caption = 'Baru'
      TabOrder = 0
      OnClick = btnBaruClick
    end
    object btnSimpan: TButton
      Left = 176
      Top = 8
      Width = 65
      Height = 25
      Cursor = crHandPoint
      Caption = 'Simpan'
      TabOrder = 1
      OnClick = btnSimpanClick
    end
    object btnHapus: TButton
      Left = 240
      Top = 8
      Width = 65
      Height = 25
      Cursor = crHandPoint
      Caption = 'Hapus'
      TabOrder = 2
      OnClick = btnHapusClick
    end
    object txtID: TEdit
      Left = 88
      Top = 8
      Width = 73
      Height = 24
      Color = clYellow
      TabOrder = 3
      Visible = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 314
    Height = 144
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 41
      Height = 16
      Caption = 'No. RM'
    end
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 33
      Height = 16
      Caption = 'Nama'
    end
    object Label3: TLabel
      Left = 8
      Top = 72
      Width = 44
      Height = 16
      Caption = 'No. Rak'
    end
    object txtRM: TEdit
      Left = 64
      Top = 8
      Width = 241
      Height = 24
      TabOrder = 0
      OnKeyPress = txtRMKeyPress
    end
    object txtNama: TEdit
      Left = 64
      Top = 40
      Width = 241
      Height = 24
      TabOrder = 1
      OnKeyPress = txtNamaKeyPress
    end
    object txtRak: TEdit
      Left = 64
      Top = 72
      Width = 241
      Height = 24
      TabOrder = 2
      OnKeyPress = txtRakKeyPress
    end
    object btnCetakBarcode: TButton
      Left = 8
      Top = 104
      Width = 145
      Height = 33
      Cursor = crHandPoint
      Caption = 'Cetak Barcode'
      TabOrder = 3
      OnClick = btnCetakBarcodeClick
    end
    object btnDetil: TButton
      Left = 160
      Top = 104
      Width = 145
      Height = 33
      Cursor = crHandPoint
      Caption = 'Lihat Detil'
      TabOrder = 4
      OnClick = btnDetilClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 185
    Width = 314
    Height = 340
    Align = alClient
    BorderWidth = 5
    TabOrder = 2
    object lstRM: TAdvStringGrid
      Left = 6
      Top = 6
      Width = 302
      Height = 328
      Cursor = crHandPoint
      Align = alClient
      ColCount = 3
      FixedCols = 0
      RowCount = 1
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      ScrollBars = ssVertical
      TabOrder = 0
      OnClick = lstRMClick
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ColumnHeaders.Strings = (
        'idrm'
        'No. RM'
        'Nama')
      ControlLook.FixedGradientHoverFrom = clGray
      ControlLook.FixedGradientHoverTo = clWhite
      ControlLook.FixedGradientDownFrom = clGray
      ControlLook.FixedGradientDownTo = clSilver
      ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownHeader.Font.Color = clWindowText
      ControlLook.DropDownHeader.Font.Height = -11
      ControlLook.DropDownHeader.Font.Name = 'Tahoma'
      ControlLook.DropDownHeader.Font.Style = []
      ControlLook.DropDownHeader.Visible = True
      ControlLook.DropDownHeader.Buttons = <>
      ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownFooter.Font.Color = clWindowText
      ControlLook.DropDownFooter.Font.Height = -11
      ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
      ControlLook.DropDownFooter.Font.Style = []
      ControlLook.DropDownFooter.Visible = True
      ControlLook.DropDownFooter.Buttons = <>
      Filter = <>
      FilterDropDown.Font.Charset = DEFAULT_CHARSET
      FilterDropDown.Font.Color = clWindowText
      FilterDropDown.Font.Height = -11
      FilterDropDown.Font.Name = 'MS Sans Serif'
      FilterDropDown.Font.Style = []
      FilterDropDownClear = '(All)'
      FixedColWidth = 2
      FixedRowHeight = 22
      FixedRowAlways = True
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clGreen
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = [fsBold]
      FloatFormat = '%.2f'
      PrintSettings.DateFormat = 'dd/mm/yyyy'
      PrintSettings.Font.Charset = DEFAULT_CHARSET
      PrintSettings.Font.Color = clWindowText
      PrintSettings.Font.Height = -11
      PrintSettings.Font.Name = 'MS Sans Serif'
      PrintSettings.Font.Style = []
      PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
      PrintSettings.FixedFont.Color = clWindowText
      PrintSettings.FixedFont.Height = -11
      PrintSettings.FixedFont.Name = 'MS Sans Serif'
      PrintSettings.FixedFont.Style = []
      PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
      PrintSettings.HeaderFont.Color = clWindowText
      PrintSettings.HeaderFont.Height = -11
      PrintSettings.HeaderFont.Name = 'MS Sans Serif'
      PrintSettings.HeaderFont.Style = []
      PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
      PrintSettings.FooterFont.Color = clWindowText
      PrintSettings.FooterFont.Height = -11
      PrintSettings.FooterFont.Name = 'MS Sans Serif'
      PrintSettings.FooterFont.Style = []
      PrintSettings.PageNumSep = '/'
      ScrollBarAlways = saVert
      SearchFooter.FindNextCaption = 'Find &next'
      SearchFooter.FindPrevCaption = 'Find &previous'
      SearchFooter.Font.Charset = DEFAULT_CHARSET
      SearchFooter.Font.Color = clWindowText
      SearchFooter.Font.Height = -11
      SearchFooter.Font.Name = 'MS Sans Serif'
      SearchFooter.Font.Style = []
      SearchFooter.HighLightCaption = 'Highlight'
      SearchFooter.HintClose = 'Close'
      SearchFooter.HintFindNext = 'Find next occurrence'
      SearchFooter.HintFindPrev = 'Find previous occurrence'
      SearchFooter.HintHighlight = 'Highlight occurrences'
      SearchFooter.MatchCaseCaption = 'Match case'
      ShowDesignHelper = False
      Version = '6.0.0.1'
      ColWidths = (
        2
        69
        211)
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 525
    Width = 314
    Height = 41
    Align = alBottom
    TabOrder = 3
    object Label4: TLabel
      Left = 8
      Top = 12
      Width = 23
      Height = 16
      Caption = 'Cari'
    end
    object txtCari: TEdit
      Left = 112
      Top = 8
      Width = 193
      Height = 24
      TabOrder = 0
      OnKeyPress = txtCariKeyPress
    end
    object cmbCari: TComboBox
      Left = 40
      Top = 8
      Width = 73
      Height = 24
      Cursor = crHandPoint
      Style = csDropDownList
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 1
      Text = 'No. RM'
      OnChange = cmbCariChange
      Items.Strings = (
        'No. RM'
        'Nama'
        'No. Rak')
    end
  end
end
