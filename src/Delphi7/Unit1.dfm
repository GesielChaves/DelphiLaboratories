object Form1: TForm1
  Left = 192
  Top = 125
  Width = 1305
  Height = 675
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
    Left = 224
    Top = 304
    Width = 465
    Height = 249
    Caption = 'Panel1'
    TabOrder = 0
  end
  object Button1: TButton
    Left = 104
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 288
    Top = 56
    Width = 417
    Height = 225
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object ServerSocket1: TServerSocket
    Active = False
    Port = 9090
    ServerType = stNonBlocking
    OnListen = ServerSocket1Listen
    OnAccept = ServerSocket1Accept
    OnGetThread = ServerSocket1GetThread
    OnGetSocket = ServerSocket1GetSocket
    OnThreadStart = ServerSocket1ThreadStart
    OnThreadEnd = ServerSocket1ThreadEnd
    OnClientConnect = ServerSocket1ClientConnect
    OnClientDisconnect = ServerSocket1ClientDisconnect
    OnClientRead = ServerSocket1ClientRead
    OnClientWrite = ServerSocket1ClientWrite
    OnClientError = ServerSocket1ClientError
    Left = 248
    Top = 56
  end
end
