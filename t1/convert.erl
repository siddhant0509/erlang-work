-module(convert).
-export([mps_to_mph/1, mps_to_kph/1]).


mps_to_mph(Velocity) -> Velocity*2.2369.

mps_to_kph(Velocity) -> Velocity*3.6.
