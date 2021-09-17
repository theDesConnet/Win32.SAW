object Form3: TForm3
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  ClientHeight = 267
  ClientWidth = 536
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 216
    Top = 8
    Width = 101
    Height = 23
    Caption = #1042#1085#1080#1084#1072#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Lucida Sans Unicode'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 37
    Width = 530
    Height = 13
    Caption = 
      #1044#1072#1085#1085#1072#1103' '#1087#1088#1086#1075#1088#1072#1084#1084#1072' '#1103#1074#1083#1103#1077#1090#1089#1103' '#1042#1056#1045#1044#1054#1053#1054#1057#1053#1054#1049' '#1072#1074#1090#1086#1088' '#1085#1077' '#1085#1077#1089#1077#1090' '#1085#1080#1082#1072#1082#1086#1081' '#1086#1090#1074 +
      #1077#1090#1089#1090#1074#1077#1085#1085#1086#1089#1090#1080' '#1079#1072' '#1101#1090#1086#1090' '#1074#1080#1088#1091#1089' '#1074#1099
  end
  object Label3: TLabel
    Left = 8
    Top = 56
    Width = 514
    Height = 13
    Caption = 
      #1047#1072#1087#1091#1089#1082#1072#1077#1090#1077' '#1077#1075#1086' '#1085#1072' '#1089#1074#1086#1081' '#1089#1090#1088#1072#1093' '#1080' '#1088#1080#1089#1082' ('#1054#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086' '#1074' '#1074#1080#1088#1091#1072#1083#1100#1085#1086#1081' '#1084#1072 +
      #1096#1080#1085#1077') '#1077#1089#1083#1080' '#1074#1099' '#1079#1072#1087#1091#1089#1090#1080#1083#1080' '#1077#1075#1086' '#1087#1086' '
  end
  object Label4: TLabel
    Left = 8
    Top = 75
    Width = 189
    Height = 13
    Caption = #1054#1096#1080#1073#1082#1077' '#1090#1086' '#1085#1072#1078#1084#1080#1090#1077' '#1082#1085#1086#1087#1082#1091' "'#1042#1099#1093#1086#1076'".'
  end
  object Label5: TLabel
    Left = 298
    Top = 103
    Width = 230
    Height = 13
    Caption = 'Created By DesConnet (https://vk.com/endnet)'
  end
  object Button1: TButton
    Left = 0
    Top = 125
    Width = 537
    Height = 41
    Caption = #1047#1072#1087#1091#1089#1082
    Enabled = False
    Style = bsCommandLink
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 0
    Top = 172
    Width = 537
    Height = 41
    Caption = #1042#1099#1093#1086#1076
    Style = bsCommandLink
    TabOrder = 1
    OnClick = Button2Click
  end
  object RadioButton1: TRadioButton
    Left = 8
    Top = 102
    Width = 185
    Height = 17
    Caption = #1040#1074#1090#1086#1088' '#1085#1077' '#1085#1077#1089#1077#1090' '#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1086#1089#1090#1080
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenu
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 2
  end
  object Button3: TButton
    Left = 0
    Top = 219
    Width = 528
    Height = 41
    Caption = #1052#1086#1081' '#1070#1090#1091#1073
    Style = bsCommandLink
    TabOrder = 3
    OnClick = Button3Click
  end
  object Timer1: TTimer
    Interval = 200
    OnTimer = Timer1Timer
    Left = 512
    Top = 224
  end
end
