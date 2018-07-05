%%%-------------------------------------------------------------------
%%% @author tom_red
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. Jul 2018 13:08
%%%-------------------------------------------------------------------
-module(useless).
-author("tom_red").

%% API
-export([add/2, getTime/0, hello/0, greet_and_add_two/1]).
-define(HOUR, 3600). % in seconds

%% Functions
add(A,B) ->
  A + B.

%% return time
getTime() ->
  ?HOUR.

%% Shows greetings.
%% io:format/1 is the standard function used to output text.
hello() ->
  io:format("Hello, world!~n").

greet_and_add_two(X) ->
  hello(),
  add(X, 2).