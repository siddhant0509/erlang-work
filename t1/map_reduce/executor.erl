-module(executor).
-export([execute/3, setup/1]).

setup(P) -> PID_M  = spawn_link(map_reduce, map, [P]),
          io:format("Spawned Map Master ~w ~n",[PID_M]),
          register(mapper, PID_M),
  PID_R = spawn_link(map_reduce, reduce, [P]),
          io:format("Spawned Reduce Master ~w ~n", [PID_R]),
          register(reducer, PID_R).


execute(Mapping_Function, Reducing_Function, Initial_Value) -> 
    receive {execute, List} -> send_to_mapper(map,Mapping_Function,List);
            {map, Result} -> send_to_reducer(reduce, Reducing_Function, Result, Initial_Value);
            {reduce, Result} -> execute(Mapping_Function, Reducing_Function, Result + Initial_Value);
    {result} -> io:format("Result is ~w ~n",[Initial_Value])
     end ,
    execute(Mapping_Function, Reducing_Function, Initial_Value) .

    


send_to_mapper(map, Mapping_Function, List) -> 
          mapper ! {map, Mapping_Function, List}.


send_to_reducer(reduce, Reducing_Function, Result, Initial_V) ->
        io:format("Reducing ~w using reducer node ~n",[Result]),
          reducer ! {reduce, Reducing_Function, Result, Initial_V} .
