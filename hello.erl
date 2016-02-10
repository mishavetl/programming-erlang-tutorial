-module(hello).
-export([start/0, len/1, len_test/0]).

start() ->
	io:format("Hello world~n").

len_test() ->
	List = [1, 2, 3, 4, 5],
	io:format("~p~n", [List]),
	Len = len(List),
	io:format("~p~n", [Len]).

len(List) ->
	len(List, 0).

len([], Acc) ->
	Acc;

len([_H | T], Acc) ->
	len(T, Acc + 1).