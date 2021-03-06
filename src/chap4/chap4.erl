%%%-------------------------------------------------------------------
%%% @author tom_red
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. Jul 2018 21:38
%%%-------------------------------------------------------------------
-module(chap4).
-author("tom_red").

%% API
-export([my_function/1]).

%% Erlangの型は動的で強い型付け
%% 強い型付けなので、 6 = 5 + "1"とかはできない

%% 型変換
%% 2> erlang:list_to_integer("54").
%% 54
%% -- 型A_to_型Bで型変換ができる

%% 型データを守る

my_function(Exp) when is_binary(Exp) -> "hoge".
my_function(Exp) when is_list(Exp) -> "huga".