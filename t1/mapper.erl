-module(mapper).
-export([map/1]).


map(Pid) -> receive {Function,List} -> io:format("Calling with ~w and ~w ~n", [List,Function]),
      Pid ! algo:map(List,Function),
          map(Pid)
         end.
