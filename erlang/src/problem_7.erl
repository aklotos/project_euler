%%%-------------------------------------------------------------------
%%% Problem 7
%%% By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
%%% What is the 10 001st prime number?
%%%-------------------------------------------------------------------
-module(problem_7).
-author("akli").

%% API
-export([result/0]).

result() -> gen_prime(10001).

gen_prime(Count) -> gen_prime(2, Count, []).

gen_prime(_, Count, Primes = [H|_]) when length(Primes) >= Count -> H;
gen_prime(Next, Count, Primes) ->
  case check_is_prime(Next, Primes) of
    true -> gen_prime(Next + 1, Count, [Next|Primes]);
    false -> gen_prime(Next + 1, Count, Primes)
  end.

check_is_prime(Next, Primes) ->
  Divisors = [P || P <- Primes, P < trunc(math:sqrt(Next)) + 1],
  not divides_by_any(Next, lists:reverse(Divisors)).

divides_by_any(_, []) -> false;
divides_by_any(Next, [Divisor|Rest]) ->
  case Next rem Divisor of
    0 -> true;
    _ -> divides_by_any(Next, Rest)
  end.