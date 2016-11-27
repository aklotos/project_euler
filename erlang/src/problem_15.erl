%%%-------------------------------------------------------------------
%%% Problem 15
%%% Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
%%% How many such routes are there through a 20×20 grid?
%%%-------------------------------------------------------------------
-module(problem_15).
-author("akli").

%% API
-export([result/0]).

result() ->
  %%% we have 2 elements: 'move right' and 'move left'
  %%% we need to find all the different permutations of the elements
  %%% (20 of type 'move left' and 20 of type 'move right')
  %%% basic formula:
  %%% (20 + 20)! / (20! * 20!) = 40! / (20! * 20!) = (21*...*40)/20!
  %%% there could be written a recursive factorial func to calculate the result
  %%% but for known not big numbers I prefer simple production using list comprehension

  Numerator = lists:foldl(fun(E, Acc) -> Acc * E end, 1, [X || X <- lists:seq(21, 40)]),
  Denominator = lists:foldl(fun(E, Acc) -> Acc * E end, 1, [X || X <- lists:seq(1, 20)]),
  Numerator / Denominator.
