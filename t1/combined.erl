-module(combined).
-export([velocity_in_mps/1]).


velocity_in_mps(Distance) -> D = drop:fall_velocity(Distance),
                            convert:mps_to_mph(D).
