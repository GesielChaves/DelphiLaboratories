program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  uConectaApp in 'uConectaApp.pas',
  uCalculadora in 'uCalculadora.pas',
  uEventAggregator in 'uEventAggregator.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
