%% @author Siddhant Srivasta <siddhant.srivastava@flipkart.com> 
%% @version 0.1
%% @doc This module contains basic mathematical algorithms


-module(algo).
-export([fact/1, fibo/1, pallindrome/1, reverse/1, count/1,product/1, vector_multiply/2, map/2, filter/2, reduce/3,all/2,any/2]).

%% @doc This function calculates the factorial of a given Number
-spec(fact(number()) -> number()).

fact(Number) when Number > 0 -> fact(1,Number,1).

%% @doc This function calculates the fibonacci number

-spec(fibo(number()) -> number()).

fibo(Number) when Number > 0 -> fibo(Number,0 ,1).

fact(Current, Number, Result) when Current > Number -> Result;
fact(Current, Number, Result) when Current =< Number ->  fact(Current +1, Number, Result*Current).


fibo(1,_, Result) -> Result;
fibo(Number, A, B) -> fibo(Number -1, B, A+B).


%% @doc This method test if the give number is pallindrome or not

-spec(pallindrome(integer()) -> integer()).
pallindrome(Number) when Number > 0 ->Number ==  pallindrome(Number,0).


pallindrome(0, Result) -> Result;
pallindrome(Number, Result) -> pallindrome(Number div 10, Result*10 + Number rem 10).


%% @doc Reversing a list
reverse([Head| []]) -> [Head] ;
reverse([Head|Tail]) -> lists:append(reverse(Tail ),[Head]).


%% @doc Count size of list

count(List) ->  count(List,0).

count([], Count) -> Count;
count([_|Tail],Count) -> count(Tail, Count +1).

%% @doc calculates the product of the List Values
%%

product(List) -> product(List,1).

product([],1) -> 0;
product([], Result) -> Result ;
product([Head|Tail],Result) -> product(Tail, Head*Result).

%% @doc Vector Multiplication

vector_multiply(List, Number) -> vector_multiply(List,[], Number).

vector_multiply([], Result, _) -> lists:reverse(Result);
vector_multiply([Head|Tail] , Result, Number) -> vector_multiply(Tail, [Number*Head | Result], Number).

%% @doc This method implements the map function

map(List,Function) -> map(List,Function,[]).

map([],_,Result) -> lists:reverse(Result);
map([Head|Tail], Function, Result) -> map(Tail, Function, [Function(Head) | Result]).

%% @doc This method implements the filter function

filter(List,Function) -> filter(List,Function,[]).

filter([], _, Result) -> lists:reverse(Result);
filter([Head|Tail], Function, Result) -> case Function(Head) of
                                          true -> filter(Tail, Function, [Head|Result]);
                                          false -> filter(Tail, Function, Result)
                                        end.

%% @doc This method implements the reduce functionality.

reduce(Num, _ , []) -> Num;
reduce(Num, Fun, [Head|Tail]) -> reduce(Fun(Num,Head), Fun, Tail).

%% @doc Any impl 

any([], _) -> false;
any([Head|Tail], Fun) -> case Fun(Head) of
    true -> true;
    false -> any(Tail, Fun)
    end.

all([], _) -> true;
all([Head|Tail],Fun) -> case Fun(Head) of
    true -> all(Tail, Fun);
    false -> false
    end.


