-module(mathdemo).
-export([abs/1]).

abs(Number) when Number > 0 -> Number;
abs(Number) when Number == 0 -> Number;
abs(Number) when Number < 0 -> -Number.


