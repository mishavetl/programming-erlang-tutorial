-module(geometry).
-export([area/1, perimeter/1]).

area({rectangle, Width, Height}) -> Width * Height;

area({square, Side}) -> Side * Side;

area({circle, Radius}) -> math:pi() * math:pow(Radius, 2);

area({triangle, A, B}) -> A * B / 2.

perimeter(L) -> perimeter(L, 0);
perimeter([], Acc) -> Acc;
perimeter([H | T], Acc) -> perimeter(T, Acc + H).
