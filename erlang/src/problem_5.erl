%%%-------------------------------------------------------------------
%%% Problem 5
%%% 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
%%% What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
%%%-------------------------------------------------------------------
-module(problem_5).
-author("akli").

%% API
-export([result/0]).

result() -> lcm(lists:seq(1, 20)).

%% least common multiple
lcm(Numbers = [Number|_]) when is_integer(Number)->
  Divisors = [num_to_primes(N) || N <- Numbers],
  ResDivisors = result_divisors(Divisors),
  maps:fold(fun(K, V, AccIn) -> AccIn * math:pow(K, V) end, 1, ResDivisors).

result_divisors(Divisors) ->
  result_divisors(Divisors, maps:new()).

result_divisors([], Acc) -> Acc;
result_divisors([DivisorPrimes|Rest], Acc) ->
  result_divisors(Rest, maps:fold(fun add_to_map/3, Acc, DivisorPrimes)).

add_to_map(Key, Value, Map) when is_integer(Value) ->
  case maps:find(Key, Map) of
    {ok, Val} -> Map#{ Key := max(Val, Value) };
    _ -> Map#{ Key => Value }
  end.

num_to_primes(Number) -> num_to_primes(Number, 2, maps:new()).

num_to_primes(1, _, Primes) -> Primes;
num_to_primes(Number, Next, Primes) ->
  case Number rem Next of
    0 -> num_to_primes(Number div Next, Next, Primes#{ Next => maps:get(Next, Primes, 0) + 1 });
    _ -> num_to_primes(Number, Next + 1, Primes)
  end.