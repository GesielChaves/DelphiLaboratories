unit uConectaApp;

interface

uses
    Windows, ShellApi, Classes, IdHTTPServer, IdTCPServer, IdCustomHTTPServer, Dialogs;

type
    TOnRequestEvent = procedure(Valor: string) of object;

    ConectaApp = class
    private
        FAtiva: boolean;
        FServidor: TIdHTTPServer;
        constructor Create;
        procedure IniciarApp(Handle: HWND);
        procedure IniciarServidor(Owner: TComponent);
        procedure QuandoReceberRequest(AThread: TIdPeerThread; ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    public
        FEvento: TOnRequestEvent;
        procedure Iniciar(Handle: HWND; Owner: TComponent);
        class function Instancia: ConectaApp;
        property Ativa: Boolean read FAtiva;
    end;

implementation

var
    FInstancia: ConectaApp;

    { ConectaApp }

constructor ConectaApp.Create;
begin
    FAtiva := False;
end;

procedure ConectaApp.Iniciar(Handle: HWND; Owner: TComponent);
var
    ExecuteFile: string;
    SEInfo: TShellExecuteInfo;
    Janela: DWORD;
begin
    IniciarApp(Handle);
    IniciarServidor(Owner);
    FAtiva := true;
end;

procedure ConectaApp.IniciarApp(Handle: HWND);
var
    ExecuteFile: string;
    SEInfo: TShellExecuteInfo;
    Janela: DWORD;
begin
    ExecuteFile := '..\C#\WindowsFormsApp2\bin\Debug\WindowsFormsApp2.exe';

    FillChar(SEInfo, SizeOf(SEInfo), 0);
    SEInfo.cbSize := SizeOf(TShellExecuteInfo);
    SEInfo.fMask := SEE_MASK_NOCLOSEPROCESS;
    SEInfo.Wnd := Handle;
    SEInfo.lpFile := PChar(ExecuteFile);
    SEInfo.nShow := SW_HIDE;

    if not ShellExecuteEx(@SEInfo) then
        Exit;

    Janela := FindWindow(nil, PChar('AppTeste'));
    while Janela = 0 do
    begin
        Sleep(10);
        Janela := FindWindow(nil, PChar('AppTeste'));
    end;
    Windows.SetParent(Janela, SEInfo.Wnd);
    ShowWindow(Janela, SW_SHOWMAXIMIZED);
    ShowWindow(Janela, SW_SHOWMAXIMIZED);
end;

procedure ConectaApp.IniciarServidor(Owner: TComponent);
begin
    FServidor := TIdHTTPServer.Create(Owner);
    FServidor.DefaultPort := 9090;
    FServidor.OnCommandGet := Self.QuandoReceberRequest;
    FServidor.Active := true;
end;

class function ConectaApp.Instancia: ConectaApp;
begin
    if Assigned(FInstancia) then
        Result := FInstancia
    else
    begin
        FInstancia := ConectaApp.Create;
        Result := FInstancia;
    end;
end;

procedure ConectaApp.QuandoReceberRequest(AThread: TIdPeerThread; ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
begin
    Self.FEvento(ARequestInfo.FormParams);
end;

end.
