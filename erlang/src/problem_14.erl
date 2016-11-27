%%%-------------------------------------------------------------------
%%% Problem 14
%%% The following iterative sequence is defined for the set of positive integers:
%%% n → n/2 (n is even)
%%% n → 3n + 1 (n is odd)
%%% Using the rule above and starting with 13, we generate the following sequence:
%%% 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
%%% It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
%%% Which starting number, under one million, produces the longest chain?
%%% NOTE: Once the chain starts the terms are allowed to go above one million.
%%%-------------------------------------------------------------------
-module(problem_14).
-author("akli").

%% API
-export([result/0]).

result() ->
  max_chain(1, {1, 1}).

max_chain(Start, Max) when Start >= 1000000 ->
  Max;
max_chain(Start, Max = {_MaxStart, MaxLength}) ->
  {_, Length} = chain({Start, Start}, 1),
  if
    Length > MaxLength -> max_chain(Start + 1, {Start, Length});
    true -> max_chain(Start + 1, Max)
  end.

chain({Start, 1}, Length) -> {Start, Length};
chain({Start, Current}, Length) ->
  chain({Start, next(Current)}, Length + 1).

next(Current) when Current rem 2 == 0 ->
  Current div 2;
next(Current) when Current rem 2 == 1 ->
  3 * Current + 1.