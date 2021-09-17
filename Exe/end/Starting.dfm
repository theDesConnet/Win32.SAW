object Form5: TForm5
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Oops...'
  ClientHeight = 53
  ClientWidth = 487
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Font.Quality = fqClearType
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 479
    Height = 19
    Caption = #1048#1075#1088#1072' '#1054#1082#1086#1085#1095#1077#1085#1072'. '#1058#1099' '#1088#1077#1096#1080#1083' '#1087#1077#1088#1077#1079#1072#1075#1088#1091#1079#1080#1090#1100' '#1055#1050' '#1080' '#1085#1072#1088#1091#1096#1080#1083' '#1087#1088#1072#1074#1080#1083#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Font.Quality = fqClearType
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 33
    Width = 118
    Height = 16
    Caption = 'C0d9d by DesConnet'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Font.Quality = fqClearType
    ParentFont = False
  end
  object Label3: TLabel
    Left = 388
    Top = 32
    Width = 91
    Height = 16
    Caption = '</Win32.SAW>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Font.Quality = fqClearType
    ParentFont = False
  end
  object Label4: TLabel
    Left = 232
    Top = 33
    Width = 33
    Height = 16
    Caption = '00:00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Font.Quality = fqClearType
    ParentFont = False
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 304
    Top = 32
  end
end
