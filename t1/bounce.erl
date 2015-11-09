-module(bounce).
-export([report/2]).

report(Count, Num)  when Count - 1  == Num -> io:format("Done");
report(Count, Num) ->
  receive X -> io:format("I have received ~w and count is ~w ~n",[X,Count]),
      report(Count + 1, Num)
  end.

