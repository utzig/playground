%% Extend geometry.erl. Add clauses to compute the areas
%% of circles and right-angled triangles. Add clauses for
%% computing the perimeters of different geometric objects.

-module(geometry).
-export([area/1]).
-export([perimeter/1]).

area({rectangle, Width, Height})
  -> Width * Height;
area({square, Side})
  -> area({rectangle, Side, Side});
%% right angled triangle
area({triangle, Base, Height})
  -> area({rectangle, Base, Height}) / 2.0;
area({circle, Radius})
  -> math:pi() * Radius * Radius.

perimeter({rectangle, Width, Height})
  -> Width * 2 + Height * 2;
perimeter({square, Side})
  -> perimeter({rectangle, Side, Side});
perimeter({triangle, Base, Height})
  -> Base + Height + math:sqrt(Base*Base + Height*Height);
perimeter({circle, Radius})
  -> 2 * math:pi() * Radius.
