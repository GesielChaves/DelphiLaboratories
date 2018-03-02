unit uCalculadora;

interface

uses
    uEventAggregator;
type
    TSomadora = class(TSubscription)
    public
        function Call(data: TObject): string; override;
    end;

    TMultiplicadora = class(TSubscription)
    public
        function Call(data: TObject): string; override;
    end;

implementation

{ TSomadora }

function TSomadora.Call(data: TObject): string;
begin
    Result := 'From Delphi 7 - TSomadora ' + String(data);
end;

{ TMultiplicadora }

function TMultiplicadora.Call(data: TObject): string;
begin
    Result := 'From Delphi 7 - TMultiplicadora ' + String(data);
end;

initialization
    TEventAggregator.Subscribe('Somar', TSomadora.Create);
    TEventAggregator.Subscribe('Multiplicar', TMultiplicadora.Create);
end.
