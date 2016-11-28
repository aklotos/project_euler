%%%-------------------------------------------------------------------
%%% Problem 16
%%% 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
%%% What is the sum of the digits of the number 2^1000?
%%%-------------------------------------------------------------------
-module(problem_16).
-author("akli").

%% API
-export([result/0]).

-define(POW, 1000).

result() ->
  Pow = 1000,
  lists:foldl(fun(X, {?POW,A}) -> {?POW, A + list_to_integer([X])} end,
    {Pow, 0},
    integer_to_list(trunc(math:pow(2,?POW)))).
