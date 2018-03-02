unit uEventAggregator;

interface

uses
    Contnrs, Classes;

type
    TEvent = procedure(data: TObject) of object;

    TSubscription = class
    public
        function Call(data: TObject): string; virtual; abstract;
    end;

    TEventAggregator = class
    public
        class procedure Subscribe(canal: string; handler: TObject);
        class function Publish(canal: string; data: TObject): string;
    end;

implementation

var
    FSubscriptions: TObjectList;
    FIndiceCanal: TStringList;

    { TEventAggregator }

class function TEventAggregator.Publish(canal: string; data: TObject): string;
var
    indice: integer;
    subscricao: TSubscription;
begin
    indice := FIndiceCanal.IndexOf(canal);
    subscricao := TSubscription(FSubscriptions.Items[indice]);
    Result := subscricao.Call(data);
end;

class procedure TEventAggregator.Subscribe(canal: string; handler: TObject);
begin
    FIndiceCanal.Add(canal);
    FSubscriptions.Add(handler);
end;

initialization
    FSubscriptions := TObjectList.Create;
    FIndiceCanal := TStringList.Create;
end.
