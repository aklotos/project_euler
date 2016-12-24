%%%-------------------------------------------------------------------
%%% Problem 17
%%% If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
%%% If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
%%% NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
%%%-------------------------------------------------------------------
-module(problem_17).
-author("akli").

%% API
-export([result/0]).

result() ->
  lists:foldl(fun({_, Length}, Acc) -> Acc + Length end, 0,
    [get_character_number(N, numbers()) || N <- lists:seq(1, 1000)]).

get_character_number(N, Map) ->
  if
    N =< 20 orelse (N =< 99 andalso N rem 10 == 0) -> maps:get(N, Map);
    N =< 99 -> sum([maps:get((N div 10) * 10, Map), maps:get(N rem 10, Map)]);
    N == 1000 -> sum([get_character_number(1, Map), maps:get(thousand, Map)]);
    N rem 100 == 0  -> sum([get_character_number(N div 100, Map), maps:get(hundred, Map)]);
    true -> sum([get_character_number(N div 100, Map), maps:get(hundred, Map),
      maps:get(join, Map), get_character_number(N rem 100, Map)])
  end.

sum(List) ->
  lists:foldl(
    fun({Name, Length}, {AccName, AccLength}) ->
      {
        if
          AccName == "" -> Name;
          true -> AccName ++ " " ++ Name
        end, AccLength + Length
      }
    end, {"", 0}, List).

numbers() ->
  #{
    1 => {"one", length("one")},
    2 => {"two", length("two")},
    3 => {"three", length("three")},
    4 => {"four", length("four")},
    5 => {"five", length("five")},
    6 => {"six", length("six")},
    7 => {"seven", length("seven")},
    8 => {"eight", length("eight")},
    9 => {"nine", length("nine")},
    10 => {"ten", length("ten")},
    11 => {"eleven", length("eleven")},
    12 => {"twelve", length("twelve")},
    13 => {"thirteen", length("thirteen")},
    14 => {"fourteen", length("fourteen")},
    15 => {"fifteen", length("fifteen")},
    16 => {"sixteen", length("sixteen")},
    17 => {"seventeen", length("seventeen")},
    18 => {"eighteen", length("eighteen")},
    19 => {"nineteen", length("nineteen")},
    20 => {"twenty", length("twenty")},
    30 => {"thirty", length("thirty")},
    40 => {"forty", length("forty")},
    50 => {"fifty", length("fifty")},
    60 => {"sixty", length("sixty")},
    70 => {"seventy", length("seventy")},
    80 => {"eighty", length("eighty")},
    90 => {"ninety", length("ninety")},
    hundred => {"hundred", length("hundred")},
    thousand => {"thousand", length("thousand")},
    join => {"and", length("and")}
  }.