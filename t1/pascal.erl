-module(pascal).
-export([add_row/1,pascal/1]).


pascal(N) -> pascal(N-1, [0,1,0], [[0,1,0]]).

pascal(0, _, R) -> lists:reverse(R);
pascal(N, V, R) -> pascal(N-1, add_row(V), [add_row(V) | R]).


add_row(L) -> add_row(L, 0 , []).

add_row([],_,Result) -> [0|Result];
add_row([Head|Tail], V, Result) -> add_row(Tail, Head, [(Head+V)|Result]).
