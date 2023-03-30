%%%-------------------------------------------------------------------
%% @doc myapp public API
%% @end
%%%-------------------------------------------------------------------

-module(myapp_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    myapp_sup:start_link(),
    
    io:fwrite("1.Dodawanie \n", []),
    io:fwrite("2.Odejmowanie \n", []),
    io:fwrite("3.Mnożenie \n", []),
    io:fwrite("4.Dzielenie \n", []),
    {ok, D} = io:read("Podaj dzialanie: "),
    {ok, A} = io:read("Podaj pierwszą liczbe: "),
    {ok, B} = io:read("Podaj druga liczbe: "),
    if
    D == 1 ->
        io:write(A+B);
    D == 2 ->
        io:write(A-B);
    D == 3 ->
        io:write(A*B);
    (D == 4) and (B /= 0) ->
        io:write(A/B);
    D == 4 and (B == 0) ->
        io:fwrite("Nie można dzielić przez zero!", []); 
    true ->
        io:fwrite("Błednie podane!", [])
    end.
    
    
    

stop(_State) ->
    ok.

%% internal functions
