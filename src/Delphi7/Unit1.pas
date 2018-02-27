unit Unit1;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, ExtCtrls, ShellApi, ScktComp, IdBaseComponent,
    IdComponent, IdTCPServer, IdCustomHTTPServer, IdHTTPServer;

type
    TForm1 = class(TForm)
        Panel1: TPanel;
        Button1: TButton;
        Memo1: TMemo;
        CheckBox1: TCheckBox;
        IdHTTPServer1: TIdHTTPServer;
        procedure Button1Click(Sender: TObject);
        procedure CheckBox1Click(Sender: TObject);
        procedure IdHTTPServer1CommandGet(AThread: TIdPeerThread;
            ARequestInfo: TIdHTTPRequestInfo;
            AResponseInfo: TIdHTTPResponseInfo);
        procedure IdHTTPServer1CommandOther(Thread: TIdPeerThread;
            const asCommand, asData, asVersion: string);
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

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
    IdHTTPServer1.Active := CheckBox1.Checked;
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

procedure TForm1.IdHTTPServer1CommandGet(AThread: TIdPeerThread; ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
begin
    Memo1.Text := ('CommandGet:' + #13#10 + ARequestInfo.FormParams);
end;

procedure TForm1.IdHTTPServer1CommandOther(Thread: TIdPeerThread;
    const asCommand, asData, asVersion: string);
begin
    if asCommand = 'post' then
        ShowMessage(asData);
end;

end.
