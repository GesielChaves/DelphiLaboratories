unit uConectaApp;

interface

uses
    Windows, ShellApi, Classes, IdHTTPServer, IdTCPServer, IdCustomHTTPServer, uEventAggregator;

type
    TOnRequestEvent = procedure(Valor: string) of object;

    TConectaApp = class
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
        class function Instancia: TConectaApp;
        property Ativa: Boolean read FAtiva;
    end;

implementation

var
    FInstancia: TConectaApp;

    { TConectaApp }

constructor TConectaApp.Create;
begin
    FAtiva := False;
end;

procedure TConectaApp.Iniciar(Handle: HWND; Owner: TComponent);
var
    ExecuteFile: string;
    SEInfo: TShellExecuteInfo;
    Janela: DWORD;
begin
    IniciarApp(Handle);
    IniciarServidor(Owner);
    FAtiva := true;
end;

procedure TConectaApp.IniciarApp(Handle: HWND);
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

procedure TConectaApp.IniciarServidor(Owner: TComponent);
begin
    FServidor := TIdHTTPServer.Create(Owner);
    FServidor.DefaultPort := 9090;
    FServidor.OnCommandGet := Self.QuandoReceberRequest;
    FServidor.Active := true;
end;

class function TConectaApp.Instancia: TConectaApp;
begin
    if Assigned(FInstancia) then
        Result := FInstancia
    else
    begin
        FInstancia := TConectaApp.Create;
        Result := FInstancia;
    end;
end;

procedure TConectaApp.QuandoReceberRequest(AThread: TIdPeerThread; ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
    stringStream: TStringStream;
    input: string;
begin
    input := ARequestInfo.FormParams;
    Self.FEvento(input);
    AResponseInfo.ContentStream := TStringStream.Create(TEventAggregator.Publish(input, TObject(input)));
    AResponseInfo.WriteContent;
end;

end.
