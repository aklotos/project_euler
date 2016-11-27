%%%-------------------------------------------------------------------
%%% Problem 10
%%% The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
%%% Find the sum of all the primes below two million.
%%%-------------------------------------------------------------------
-module(problem_10).
-author("akli").

%% API
-export([result/0]).

-define(MAX, 2000000).

result() ->
  Numbers = [2 | [N || N <- lists:seq(2,?MAX), N rem 2 =/= 0] ],
  Primes = sieve(Numbers, {3, trunc(math:sqrt(?MAX)) + 1}),
  lists:sum(Primes).

sieve(Numbers, {Next, Max}) when Next > Max ->
  Numbers;
sieve(Numbers, {Next, Max}) ->
  Sieved = lists:filter(fun(X) -> X == Next orelse X rem Next =/= 0 end, Numbers),
  [H|_] = lists:dropwhile(fun(E) -> E =< Next end, Sieved),
  sieve(Sieved, {H, Max}).