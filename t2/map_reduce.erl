-module(map_reduce).
-export([map/2, reduce/3]).

map(List,Func) -> map(List,Func,[]).

reduce(Result,[],_) -> Result;
reduce(Initial,[F|List],Func) -> reduce(Func(Initial,F), List, Func).

map([],_,Result) -> lists:reverse(Result);
map([F|List], Func, Result) -> map(List, Func, [Func(F) | Result]).



