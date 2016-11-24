%%%-------------------------------------------------------------------
%%% Problem 3
%%% The prime factors of 13195 are 5, 7, 13 and 29.
%%% What is the largest prime factor of the number 600851475143 ?
%%%-------------------------------------------------------------------
-module(problem_3).
-author("akli").

%% API
-export([result/0]).

result() -> largest_prime(600851475143).

largest_prime(Value) -> largest_prime(Value, 2, trunc(math:sqrt(Value)) + 1).

largest_prime(Value, LastPrime, End) ->
  NextPrime = next_prime(Value, LastPrime, End),
  case NextPrime of
    undefined -> case LastPrime of
                   2 -> Value;
                   _ -> LastPrime
                 end;
    _ -> largest_prime(Value div NextPrime, NextPrime, End)
  end.

next_prime(Number, Start, End) when is_integer(Start) andalso Start =< End ->
  next_prime(Number, lists:seq(Start, End));
next_prime(_, _, _) -> undefined.

next_prime(_, []) -> undefined;
next_prime(Number, [H|Rest]) ->
  if
    Number rem H == 0 -> H;
    Number rem H =/= 0 -> next_prime(Number, Rest)
  end.
