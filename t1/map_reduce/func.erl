-module(func).
-export([map/2, reduce/3]).


map(Fun, List) -> map(Fun, List, []).

map(_, [], Result) -> lists:reverse(Result);
map(Fun, [Head|Tail] , Result) -> map(Fun, Tail, [Fun(Head) | Result]).


reduce(_ , [], Result) -> Result;
reduce(Fun, [Head|Tail], Initial_V) ->  reduce(Fun, Tail, Fun(Head, Initial_V)).
