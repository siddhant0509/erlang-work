%% @author Siddhant Srivastava
%% @doc Sorting Techniques implemented in Erlang
%% @version 0.1
%% @copyright Bhai


-module(sorting).
-export([quicksort/1,mergesort/1, count/1]).


%% @doc Quicksort Implementation of sorting technique
quicksort([]) ->  [];
quicksort([X|List]) -> lists:append([quicksort(smaller(X,List)),[X],quicksort(bigger(X,List))]).


mergesort([]) -> [];
mergesort([V|[]]) -> [V];
mergesort(List) -> Count= count(List) ,
                  Break = Count div 2,
  combine(mergesort(lists:sublist(List,1,Break)),mergesort(lists:sublist(List,Break +1, Count - Break))).



combine(L1,L2) -> combine(L1,L2,[]).


combine([],[],Result) -> lists:reverse(Result);
combine([F|List], [], [Check|Result]) when Check > F -> combine([],[], lists:append(lists:append([F],List), Result));
combine([F|List], [], [Check|Result]) when Check =< F -> combine([],[], lists:append( Result, lists:append([F],List)));
combine([],[F|List], [Check|Result]) when Check > F -> combine([],[], lists:append(lists:append([F],List), Result));
combine([],[F|List], [Check|Result]) when Check > F -> combine([],[], lists:append(Result, lists:append([F],List)));
combine([F|[]],[S|L2], Result)  when F > S -> io:format("Numbers are ~w ~w  ~n",[F,S]),combine([F], L2, [S|Result]);
combine([F|L1],[S|[]], Result) when S>= F -> combine(L1, [S], [F|Result]);
combine([F|L1],[S|L2], Result)  when F > S -> io:format("Numbers are ~w ~w  ~n",[F,S]),combine(lists:append([F],L1), L2, [S|Result]);
combine([F|L1],[S|L2], Result) when S>= F -> io:format("Numbers are ~w ~w  ~w ~w~n",[F,S,L1,L2]), combine(L1, lists:append([S],L2), [F|Result]).



count(List) -> map_reduce:reduce(0,map_reduce:map(List, fun(_) -> 1 end ),fun(A,B) -> A+B end).

smaller(_,[]) -> [];
smaller(X,List) -> calculateSmaller(X,List,[]).

bigger(_,[]) -> [];
bigger(X,List) -> calculateBigger(X,List,[]).


calculateSmaller(_,[], Result) ->  Result;
calculateSmaller(X,[F|Rest],Result) when F < X ->  calculateSmaller(X,Rest,[F|Result]);
calculateSmaller(X,[_|List], Result) -> calculateSmaller(X,List,Result).


calculateBigger(_,[] ,Result) -> Result;
calculateBigger(X,[F|Rest],Result) when F > X ->  calculateBigger(X,Rest,[F|Result]);
calculateBigger(X,[_|List], Result) -> calculateBigger(X,List,Result).

