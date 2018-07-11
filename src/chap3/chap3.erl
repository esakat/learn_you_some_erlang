%%%-------------------------------------------------------------------
%%% @author tom_red
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. Jul 2018 1:14
%%%-------------------------------------------------------------------
-module(chap3).
-author("tom_red").

%% API
-export([
  greet/2,
  head/1,
  second/1,
  same/2,
  valid_time/1,
  old_enough/1,
  right_age/1
]).

%% パターンマッチ
%% io:formatではチルダで文字列置き換えできるよ
greet(male, Name) ->
  io:format("Hello, Mr. ~s!", [Name]);
greet(female, Name) ->
  io:format("Hello, Mrs. ~s", [Name]);
greet(_, Name) ->
  io:format("Hello, ~s!", [Name]).
%% ここでgreetは関数節と呼ばれ、関数節は ; で区切られている
%% 関数宣言は1つの大きな文として捉えられる

%% Head関数作成
head([H|_]) -> H.
%% 2つめを取得 // これは実際は再帰的にやる方が良いよ５章でやるよ
second([_, H|_]) -> H.

%% 束縛する変数
%% Erlangでは新しい値が束縛されている値と同じでない限りエラーになる
%% パターンマッチで関数に渡されたパラメータが同じか比較できる
same(X, X) ->
  true;
same(_, _) ->
  false.

%% 日付の表示
valid_time({Date = {Y,M,D}, Time = {H,Min,S}}) ->
  io:format("The Date tuple (~p) says today is: ~p/~p/~p,~n", [Date,Y,M,D]),
  io:format("The time tuple (~p) indicates: ~p/~p/~p.~n", [Time,H,Min,S]);
valid_time(_) ->
  io:format("Stop feeding me wrong data!~n").

%%12> chap3:valid_time({{2018,07,04},{09,04,23}}).
%%The Date tuple ({2018,7,4}) says today is: 2018/7/4,
%%The time tuple ({9,4,23}) indicates: 9/4/23.
%%ok
%%13> chap3:valid_time({{2018,07,04},{09,0}}).
%%Stop feeding me wrong data!
%%ok

%% ガード
%% パターンマッチで捕まえきれない表現ができる(値の範囲でのマッチとか)
%% 成功時はtrueで返すことが必須
%% Erlangは純粋関数型言語ではないので、ガード内でユーザ定義の関数は使えないよ(副作用怖い)
old_enough(X) when X >= 16 -> true;
old_enough(_) -> false.

right_age(X) when X >= 16, X =< 104 ->
  true;
right_age(_) ->
  false.

