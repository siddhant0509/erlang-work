-module(map_reduce).
-export([map/1, reduce/1, map_node/0,reduce_node/0]).


map(Receiver) -> receive 
                  {map, Mapping_Function, List} ->
                     PID = spawn(map_reduce, map_node, []),
                     io:format("Spawned Map node ~w ~n and receiver is ~w",[PID, self()]),
                     PID ! {self(),Mapping_Function, List};
                   {mapped, Result} -> io:format("Mapped result is ~w  and Receiver back is ~w ~n", [Result, Receiver]),
                      Receiver ! {map, Result}
          end ,
          map(Receiver).


reduce(Receiver) -> receive {reduce, Reducing_Function, List, Initial_V} ->
                                PID = spawn(map_reduce, reduce_node, []),
                                io:format("Spawned Reduce Node ~w ~n", [PID]),
                                PID ! {self(),Reducing_Function, List, Initial_V};
                             {reducted, R} ->
                                io:format("Result is ~w and sending back to ~w ~n",[R, Receiver]),
                                Receiver ! {reduce, R}
                     end,
                    reduce(Receiver).


map_node() -> receive {Receiver, Mapping_F, List} ->
                      io:format("Receiver is ~w ~n",[Receiver]),
                      timer:sleep(50000),
                      Receiver ! {mapped, func:map(Mapping_F, List)}
              end.



reduce_node() -> receive {Receiver, Reducer_F, List, Initial_V} ->
                      timer:sleep(50000),
                      Receiver ! {reducted, func:reduce(Reducer_F, List, Initial_V)}
                 end.




