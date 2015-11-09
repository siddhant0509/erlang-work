-module(reducer).
-export([reduce/1]).


reduce(P) -> receive {Fun,Result,Num} -> P ! algo:reduce(Num,Fun,Result),
  reduce(P) end.
