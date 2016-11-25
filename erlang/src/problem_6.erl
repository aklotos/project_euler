%%%-------------------------------------------------------------------
%%% Problem 6
%%% The sum of the squares of the first ten natural numbers is,
%%% 1^2 + 2^2 + ... + 10^2 = 385
%%% The square of the sum of the first ten natural numbers is,
%%% (1 + 2 + ... + 10)^2 = 552 = 3025
%%% Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
%%% Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
%%%-------------------------------------------------------------------
-module(problem_6).
-author("akli").

%% API
-export([result/0]).

result() ->
  List = lists:seq(1, 100),
  square_of_sum(List) - sum_of_squares(List).

sum_of_squares(List) ->
  lists:sum(lists:map(fun(X) -> X * X end, List)).

square_of_sum(List) ->
  math:pow(lists:sum(List), 2).