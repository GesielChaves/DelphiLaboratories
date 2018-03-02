unit Unit1;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, ExtCtrls, ShellApi, ScktComp, IdBaseComponent,
    IdComponent, IdTCPServer, IdCustomHTTPServer, IdHTTPServer, IdHTTP, uConectaApp;

type
    TForm1 = class(TForm)
        Panel1: TPanel;
        Button1: TButton;
        Memo1: TMemo;
        Button2: TButton;
        procedure Button1Click(Sender: TObject);
        procedure Button2Click(Sender: TObject);
    private
        procedure DoIt(Valor: string);
        { Private declarations }
    public
        { Public declarations }
    end;

var
    Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
    SEInfo: TShellExecuteInfo;
begin
    ConectaApp.Instancia.Iniciar(panel1.Handle, Self);
    ConectaApp.Instancia.FEvento := DoIt;
end;

procedure TForm1.DoIt(Valor: string);
begin
    Memo1.Text := 'CommandGet:' + #13#10 + Valor;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
    client: TIdHttp;
    resultado: string;
begin
    client := TIdHTTP.Create(Self);
    resultado := client.Get('http://localhost:1234');
    ShowMessage(resultado);
end;

end.
