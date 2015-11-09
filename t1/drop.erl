%% @author Siddhant Srivastava <siddddhant@gmail.com>
%% @doc Function calculation velocity attained by objects in vacuum
%% @version 0.1



-module(drop).
-export([fall_velocity/1]).

%% @doc This function calcualtes the velocity of an object if dropped in vacuum
%% under the gravity influence of earth


fall_velocity(Where) -> {Planemo,Distance} = Where,
                        fall_velocity(Planemo,Distance).



fall_velocity(Planemo,Distance) when Distance >=0 ->
  Gravity  = case Planemo of
              earth -> 9.8;
              moon -> 1.6;
              mars ->3.71
            end,
 Velocity = math:sqrt(2*Gravity*Distance),
 if
    Velocity == 0 -> "Stable";
    Velocity < 5 -> "Slow";
    Velocity <10 -> "Medium";
    true -> "Too fast"
 end.
