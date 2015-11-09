-module(mathstuff).
-export([area/1]).


area({square,Side}) -> area_square(Side);
area({circle,Radius}) -> area_circle(Radius).



area_square(Side) -> Side * Side .

area_circle(Radius) -> math:pi() * Radius * Radius.
