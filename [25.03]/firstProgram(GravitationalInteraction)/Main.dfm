object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'POWER'
  ClientHeight = 556
  ClientWidth = 528
  Color = 6710784
  Constraints.MinHeight = 542
  Constraints.MinWidth = 542
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    528
    556)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 513
    Height = 145
    Caption = #1054#1088#1075#1072#1085#1099' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103' '#1076#1072#1085#1085#1099#1084#1080':'
    Color = 13421721
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    object Label1: TLabel
      Left = 63
      Top = 24
      Width = 150
      Height = 19
      Caption = #1052#1072#1089#1089#1072' '#1087#1077#1088#1074#1086#1075#1086' '#1090#1077#1083#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 63
      Top = 64
      Width = 150
      Height = 19
      Caption = #1052#1072#1089#1089#1072' '#1074#1090#1086#1088#1086#1075#1086' '#1090#1077#1083#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 104
      Width = 197
      Height = 19
      Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1084#1077#1078#1076#1091' '#1090#1077#1083#1072#1084#1080':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object firstBodyMass: TEdit
      Left = 219
      Top = 21
      Width = 121
      Height = 27
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = firstBodyMassKeyPress
    end
    object secondBodyMass: TEdit
      Left = 219
      Top = 54
      Width = 121
      Height = 27
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnKeyPress = firstBodyMassKeyPress
    end
    object distantionBetweenBodys: TEdit
      Left = 219
      Top = 101
      Width = 121
      Height = 27
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnKeyPress = firstBodyMassKeyPress
    end
    object Button1: TButton
      Left = 384
      Top = 21
      Width = 113
      Height = 107
      Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 168
    Width = 512
    Height = 380
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1074#1099#1095#1080#1089#1083#1077#1085#1080#1081':'
    Color = 13421721
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
    DesignSize = (
      512
      380)
    object Results: TMemo
      Left = 3
      Top = 16
      Width = 506
      Height = 361
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'Memo1')
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  object MainMenu1: TMainMenu
    object menu_file: TMenuItem
      Caption = #1060#1072#1081#1083
      object menu_file_open: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
        OnClick = menu_file_openClick
      end
      object menu_file_save: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        OnClick = menu_file_saveClick
      end
      object menu_file_saveLog: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1086#1090#1095#1077#1090
        OnClick = menu_file_saveLogClick
      end
      object menu_file_close: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = menu_file_closeClick
      end
    end
    object menu_info: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      object menu_info_author: TMenuItem
        Caption = #1040#1074#1090#1086#1088
        OnClick = menu_info_authorClick
      end
      object menu_info_task: TMenuItem
        Caption = #1047#1072#1076#1072#1095#1072
        OnClick = menu_info_taskClick
      end
    end
  end
  object SaveDialog1: TSaveDialog
    Top = 48
  end
  object OpenDialog1: TOpenDialog
    Top = 96
  end
end
