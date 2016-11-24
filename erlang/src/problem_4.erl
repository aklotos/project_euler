%%%-------------------------------------------------------------------
%%% Problem 4
%%% A palindromic number reads the same both ways.
%%% The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
%%% Find the largest palindrome made from the product of two 3-digit numbers.
%%%-------------------------------------------------------------------
-module(problem_4).
-author("akli").

%% API
-export([result/0]).

result() ->
  check_palindromic_product({100000, 100, 100},
    [{X, Y} ||
      X <- lists:reverse(lists:seq(100, 999)),
      Y <- lists:reverse(lists:seq(100, X))]).

check_palindromic_product(Found, []) -> Found;
check_palindromic_product(Found = {F, _, _}, [{X, Y}|Rest]) ->
  Prod = X * Y,
  if
    Prod > F ->
      case is_palindromic(Prod) of
        true -> check_palindromic_product({Prod, X, Y}, Rest);
        false -> check_palindromic_product(Found, Rest)
      end;
    true -> check_palindromic_product(Found, Rest)
  end.

is_palindromic(Number) ->
  NumString = integer_to_list(Number),
  Reversed = lists:reverse(NumString),
  NumString == Reversed.