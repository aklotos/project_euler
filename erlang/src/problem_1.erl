%%%-------------------------------------------------------------------
%%% Problem 1.
%%% If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
%%% The sum of these multiples is 23.
%%% Find the sum of all the multiples of 3 or 5 below 1000.
%%%-------------------------------------------------------------------
-module(problem_1).
-author("akli").

%% API
-export([result/0, result_2/0]).

result() -> sum_3_5(lists:seq(1, 999)).

sum_3_5(L) when is_list(L) -> sum_3_5(L, 0).

sum_3_5([], Acc) -> Acc;
sum_3_5([H|Rest], Acc) when is_integer(H) andalso (H rem 3 == 0 orelse H rem 5 == 0) ->
  sum_3_5(Rest, H + Acc);
sum_3_5([_|Rest], Acc) -> sum_3_5(Rest, Acc).

result_2() ->
  lists:sum([X || X <- lists:seq(1, 999), X rem 3 == 0 orelse X rem 5 == 0]).