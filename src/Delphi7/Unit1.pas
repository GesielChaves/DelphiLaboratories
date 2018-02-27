unit Unit1;

interface

uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ShellApi, ScktComp;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    ServerSocket1: TServerSocket;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure ServerSocket1Accept(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientError(Sender: TObject;
      Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
      var ErrorCode: Integer);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientWrite(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1GetSocket(Sender: TObject; Socket: Integer;
      var ClientSocket: TServerClientWinSocket);
    procedure ServerSocket1GetThread(Sender: TObject;
      ClientSocket: TServerClientWinSocket;
      var SocketThread: TServerClientThread);
    procedure ServerSocket1Listen(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ThreadEnd(Sender: TObject;
      Thread: TServerClientThread);
    procedure ServerSocket1ThreadStart(Sender: TObject;
      Thread: TServerClientThread);
  private
    { Private declarations }
    AppWnd : DWORD;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  ExecuteFile : string;
  SEInfo: TShellExecuteInfo;
begin
  ShowMessage('ativando');
  ServerSocket1.Active := true;
  ShowMessage('ativado');
  Exit;
{  ExecuteFile:='C:\Projetos\WindowsFormsApp2\WindowsFormsApp2\bin\Debug\WindowsFormsApp2.exe';

  FillChar(SEInfo, SizeOf(SEInfo), 0) ;
  SEInfo.cbSize := SizeOf(TShellExecuteInfo) ;
  with SEInfo do
  begin
    fMask := SEE_MASK_NOCLOSEPROCESS;
    Wnd := panel1.Handle;
    lpFile := PChar(ExecuteFile) ;
    nShow := SW_HIDE;
  end;
  if ShellExecuteEx(@SEInfo) then
  begin
    AppWnd := FindWindow(nil, PChar('AppTeste'));
    if AppWnd <> 0 then
    begin
      Windows.SetParent(AppWnd, SEInfo.Wnd);
      ShowWindow(AppWnd, SW_SHOWMAXIMIZED);
      ShowWindow(AppWnd, SW_SHOWMAXIMIZED);
    end;
  end
  else
    ShowMessage('Error starting notepad!') ;
 }
end;

procedure TForm1.ServerSocket1Accept(Sender: TObject;  Socket: TCustomWinSocket);
begin
      Memo1.Text := Memo1.Text + #13#10 + 'Accept' ;
end;

procedure TForm1.ServerSocket1ClientConnect(Sender: TObject;  Socket: TCustomWinSocket);
begin
      Memo1.Text := Memo1.Text + #13#10 + 'Alguem conecto' ;
end;

procedure TForm1.ServerSocket1ClientDisconnect(Sender: TObject;  Socket: TCustomWinSocket);
begin
      Memo1.Text := Memo1.Text + #13#10 + 'Alguem Disconecto' ;
end;

procedure TForm1.ServerSocket1ClientError(Sender: TObject;  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
      Memo1.Text := Memo1.Text + #13#10 + 'Deu pau' ;
end;

procedure TForm1.ServerSocket1ClientRead(Sender: TObject;  Socket: TCustomWinSocket);
begin
    if (Assigned(Socket)) then
    ShowMessage('ClientRead ' + Socket.ReceiveText + ' - ' + IntToStr(Socket.ReceiveLength)) ;
end;

procedure TForm1.ServerSocket1ClientWrite(Sender: TObject;  Socket: TCustomWinSocket);
begin
      Memo1.Text := Memo1.Text + #13#10 + 'ClientWrite';// + Socket.ReceiveText + ' - ' + IntToStr(Socket.ReceiveLength)) ;
end;

procedure TForm1.ServerSocket1GetSocket(Sender: TObject; Socket: Integer;  var ClientSocket: TServerClientWinSocket);
begin
      Memo1.Text := Memo1.Text + #13#10 + 'GetSocket' ;
end;

procedure TForm1.ServerSocket1GetThread(Sender: TObject;  ClientSocket: TServerClientWinSocket;  var SocketThread: TServerClientThread);
begin
      Memo1.Text := Memo1.Text + #13#10 + 'GetThread' ;
end;

procedure TForm1.ServerSocket1Listen(Sender: TObject;  Socket: TCustomWinSocket);
begin
      Memo1.Text := Memo1.Text + #13#10 + 'Listen' ;
end;

procedure TForm1.ServerSocket1ThreadEnd(Sender: TObject;  Thread: TServerClientThread);
begin
      Memo1.Text := Memo1.Text + #13#10 + 'ThreadEnd' ;
end;

procedure TForm1.ServerSocket1ThreadStart(Sender: TObject;  Thread: TServerClientThread);
begin
      Memo1.Text := Memo1.Text + #13#10 + 'ThreadStart' ;
end;

end.

