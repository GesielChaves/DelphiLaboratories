unit Unit1;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, ExtCtrls, ShellApi, ScktComp;

type
    TForm1 = class(TForm)
        Panel1: TPanel;
        Button1: TButton;
        Memo1: TMemo;
        ServerSocket1: TServerSocket;
        CheckBox1: TCheckBox;
        procedure Button1Click(Sender: TObject);
        procedure ServerSocket1Accept(Sender: TObject; Socket: TCustomWinSocket);
        procedure ServerSocket1ClientConnect(Sender: TObject; Socket: TCustomWinSocket);
        procedure ServerSocket1ClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
        procedure ServerSocket1ClientError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
        procedure ServerSocket1ClientRead(Sender: TObject; Socket: TCustomWinSocket);
        procedure ServerSocket1ClientWrite(Sender: TObject; Socket: TCustomWinSocket);
        procedure ServerSocket1GetSocket(Sender: TObject; Socket: Integer; var ClientSocket: TServerClientWinSocket);
        procedure ServerSocket1GetThread(Sender: TObject; ClientSocket: TServerClientWinSocket; var SocketThread: TServerClientThread);
        procedure ServerSocket1Listen(Sender: TObject; Socket: TCustomWinSocket);
        procedure ServerSocket1ThreadEnd(Sender: TObject; Thread: TServerClientThread);
        procedure ServerSocket1ThreadStart(Sender: TObject; Thread: TServerClientThread);
        procedure CheckBox1Click(Sender: TObject);
    private
        { Private declarations }
        AppWnd: DWORD;
    public
        { Public declarations }
    end;

var
    Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
    ExecuteFile: string;
    SEInfo: TShellExecuteInfo;
begin
    ExecuteFile := 'C:\dev\DephiLaboratories\src\C#\WindowsFormsApp2\bin\Debug\WindowsFormsApp2.exe';

    FillChar(SEInfo, SizeOf(SEInfo), 0);
    SEInfo.cbSize := SizeOf(TShellExecuteInfo);
    with SEInfo do
    begin
        fMask := SEE_MASK_NOCLOSEPROCESS;
        Wnd := panel1.Handle;
        lpFile := PChar(ExecuteFile);
        nShow := SW_HIDE;
    end;
    if ShellExecuteEx(@SEInfo) then
    begin
        AppWnd := FindWindow(nil, PChar('AppTeste'));
        while AppWnd = 0 do
        begin
            Sleep(10);
            AppWnd := FindWindow(nil, PChar('AppTeste'));
        end;
        Windows.SetParent(AppWnd, SEInfo.Wnd);
        ShowWindow(AppWnd, SW_SHOWMAXIMIZED);
        ShowWindow(AppWnd, SW_SHOWMAXIMIZED);
    end
    else
        ShowMessage('Error starting notepad!');

end;

procedure TForm1.ServerSocket1Accept(Sender: TObject; Socket: TCustomWinSocket);
begin
    Memo1.Text := Memo1.Text + #13#10 + 'Accept';
end;

procedure TForm1.ServerSocket1ClientConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
    Memo1.Text := Memo1.Text + #13#10 + 'Alguem conectou';
end;

procedure TForm1.ServerSocket1ClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
begin
    Memo1.Text := Memo1.Text + #13#10 + 'Alguem Disconectou';
end;

procedure TForm1.ServerSocket1ClientError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
    var ErrorCode: Integer);
begin
    Memo1.Text := Memo1.Text + #13#10 + 'Deu pau';
end;

procedure TForm1.ServerSocket1ClientRead(Sender: TObject; Socket: TCustomWinSocket);
begin
    if (Assigned(Socket)) then
        ShowMessage('ClientRead ' + Socket.ReceiveText + ' - ' +
            IntToStr(Socket.ReceiveLength));
end;

procedure TForm1.ServerSocket1ClientWrite(Sender: TObject; Socket: TCustomWinSocket);
begin
    Memo1.Text := Memo1.Text + #13#10 + 'ClientWrite';
    // + Socket.ReceiveText + ' - ' + IntToStr(Socket.ReceiveLength)) ;
end;

procedure TForm1.ServerSocket1GetSocket(Sender: TObject; Socket: Integer; var ClientSocket: TServerClientWinSocket);
begin
    Memo1.Text := Memo1.Text + #13#10 + 'GetSocket';
end;

procedure TForm1.ServerSocket1GetThread(Sender: TObject; ClientSocket: TServerClientWinSocket; var SocketThread:
    TServerClientThread);
begin
    Memo1.Text := Memo1.Text + #13#10 + 'GetThread';
end;

procedure TForm1.ServerSocket1Listen(Sender: TObject; Socket: TCustomWinSocket);
begin
    Memo1.Text := Memo1.Text + #13#10 + 'Listen';
end;

procedure TForm1.ServerSocket1ThreadEnd(Sender: TObject; Thread: TServerClientThread);
begin
    Memo1.Text := Memo1.Text + #13#10 + 'ThreadEnd';
end;

procedure TForm1.ServerSocket1ThreadStart(Sender: TObject; Thread: TServerClientThread);
begin
    Memo1.Text := Memo1.Text + #13#10 + 'ThreadStart';
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
    ServerSocket1.Active := CheckBox1.Checked;
    if CheckBox1.Checked then
    begin
        CheckBox1.Caption := 'Socket ativado';
        CheckBox1.Font.Color := clGreen;
    end
    else
    begin
        CheckBox1.Caption := 'Socket desativado';
        CheckBox1.Font.Color := clRed;
    end;
end;

end.
