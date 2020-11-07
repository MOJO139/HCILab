object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Distanse Between Points'
  ClientHeight = 395
  ClientWidth = 577
  Color = clPurple
  Constraints.MinHeight = 454
  Constraints.MinWidth = 593
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    577
    395)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 561
    Height = 97
    Caption = #1059#1087#1088#1072#1074#1083#1103#1102#1097#1080#1081' '#1073#1083#1086#1082': '
    Color = clAppWorkSpace
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 199
      Height = 19
      Caption = #1050#1086#1086#1088#1076#1080#1085#1090#1099' '#1087#1077#1088#1074#1086#1081' '#1090#1086#1095#1082#1080': '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 199
      Height = 19
      Caption = #1050#1086#1086#1088#1076#1080#1085#1090#1099' '#1074#1090#1086#1088#1086#1081' '#1090#1086#1095#1082#1080': '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object x1: TEdit
      Left = 221
      Top = 26
      Width = 100
      Height = 21
      TabOrder = 0
      OnKeyPress = y2KeyPress
    end
    object x2: TEdit
      Left = 221
      Top = 58
      Width = 100
      Height = 21
      TabOrder = 1
      OnKeyPress = y2KeyPress
    end
    object Calculate: TButton
      Left = 448
      Top = 24
      Width = 97
      Height = 55
      Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = CalculateClick
    end
    object y1: TEdit
      Left = 327
      Top = 26
      Width = 100
      Height = 21
      TabOrder = 3
      OnKeyPress = y2KeyPress
    end
    object y2: TEdit
      Left = 327
      Top = 58
      Width = 100
      Height = 21
      TabOrder = 4
      OnKeyPress = y2KeyPress
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 111
    Width = 561
    Height = 274
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1074#1099#1095#1080#1089#1083#1103#1077#1085#1080#1103': '
    Color = clAppWorkSpace
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
    DesignSize = (
      561
      274)
    object Results: TMemo
      Left = 3
      Top = 16
      Width = 555
      Height = 255
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'Results')
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  object SaveDialog1: TSaveDialog
    Top = 39
  end
  object MainMenu1: TMainMenu
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1083#1086#1075
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #1042#1099#1081#1090#1080
        OnClick = N5Click
      end
    end
    object N6: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      object N7: TMenuItem
        Caption = #1040#1074#1090#1086#1088
        OnClick = N7Click
      end
      object N8: TMenuItem
        Caption = #1047#1072#1076#1072#1095#1072
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = #1057#1089#1099#1083#1082#1072' '#1085#1072' '#1079#1072#1076#1072#1095#1080
        OnClick = N9Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Top = 72
  end
end
