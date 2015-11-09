-module(temp).
-export([convert/1]).



convert({c,Num}) -> c2f(Num);
convert({f,Num}) -> f2c(Num).



f2c(F) -> (5*(F - 32))/9.

c2f(C) -> 1.8*C + 32.
