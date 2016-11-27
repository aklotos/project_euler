%%%-------------------------------------------------------------------
%%% Problem 13
%%% Work out the first ten digits of the sum of the following one-hundred 50-digit numbers.
%%%-------------------------------------------------------------------
-module(problem_13).
-author("akli").

%% API
-export([result/0]).

result() ->
  {ok, File} = file:read_file("problem_13.input"),
  Content = unicode:characters_to_list(File),
  Sum = lists:sum([list_to_integer(S) || S <- string:tokens(Content, "\n")]),
  Rank = length(integer_to_list(Sum)),
  Sum div trunc(math:pow(10, Rank - 10)).
