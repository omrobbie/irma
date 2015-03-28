object DM: TDM
  OldCreateOrder = False
  Left = 1072
  Top = 482
  Height = 266
  Width = 167
  object cnn1: TADOConnection
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 24
    Top = 8
  end
  object qry1: TADOQuery
    Connection = cnn1
    CursorType = ctStatic
    Parameters = <>
    Left = 80
    Top = 8
  end
  object cnn2: TADOConnection
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 24
    Top = 56
  end
  object qry2: TADOQuery
    Connection = cnn2
    CursorType = ctStatic
    Parameters = <>
    Left = 80
    Top = 56
  end
  object cnn3: TADOConnection
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 24
    Top = 112
  end
  object qry3: TADOQuery
    Connection = cnn3
    CursorType = ctStatic
    Parameters = <>
    Left = 80
    Top = 112
  end
end
