object Form1: TForm1
  Left = 192
  Top = 129
  Width = 465
  Height = 574
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 272
    Width = 417
    Height = 249
    BevelInner = bvRaised
    BevelOuter = bvNone
    BevelWidth = 2
    BorderWidth = 2
    BorderStyle = bsSingle
    Caption = 'Panel1'
    Color = clGradientActiveCaption
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 121
    Height = 25
    Caption = 'Abrir o App'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 40
    Width = 417
    Height = 225
    TabOrder = 2
  end
  object CheckBox1: TCheckBox
    Left = 264
    Top = 16
    Width = 113
    Height = 17
    Caption = 'Socket desativado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = CheckBox1Click
  end
  object IdHTTPServer1: TIdHTTPServer
    Bindings = <>
    CommandHandlers = <>
    DefaultPort = 9090
    Greeting.NumericCode = 0
    MaxConnectionReply.NumericCode = 0
    ReplyExceptionCode = 0
    ReplyTexts = <>
    ReplyUnknownCommand.NumericCode = 0
    OnCommandOther = IdHTTPServer1CommandOther
    OnCommandGet = IdHTTPServer1CommandGet
    Left = 416
    Top = 8
  end
end
