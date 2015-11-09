-module(count).
-export([countdown/1, countup/1]).


countdown(Number) when Number > 0 -> io:format("Counting ~w ~n",[Number]),
  countdown(Number - 1);
countdown(0) -> io:format("Countdown Done").

countup(Limit) when Limit >= 0 -> countup(Limit,1).

countup(Limit,Number) when ((Number < Limit)) -> io:format("Counting ~w ~n",[Number]),
  countup(Limit,Number+1);
countup(Limit,Limit) -> io:format("Done").

