-module(coordinate).
-export([setup/0,exec/4]).


setup() -> My = self(),
          Pid = spawn(mapper,map,[My]),
          Pid2 = spawn(reducer,reduce,[My]),
          register(mapp,Pid),
          register(reducee,Pid2)
  .


exec(Map,Red,L,Num) -> io:format("Calling with ~w and ~w ~n", [Map, L]),
                  mapp ! {Map,L},
                  receive R -> reducee ! {Red,R,Num} end,
                  receive R1 -> R1 end.


