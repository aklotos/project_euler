%%%-------------------------------------------------------------------
%%% @author akli
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. Nov 2016 00:44
%%%-------------------------------------------------------------------
-module(problem_9).
-author("akli").

%% API
-export([result/0]).

result() ->
  [{A,B,C}|_] = [{A,B,1000 - A - B} || A <- lists:seq(1, 999),
    B <- lists:seq(A, 999),
    A * A + B * B == (1000 - A - B) * (1000 - A - B)],
  A * B * C.