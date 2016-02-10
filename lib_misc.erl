-module(lib_misc).
-compile(export_all).

for(Max, Max, F) -> [F(Max)];
for(I, Max, F) -> [F(I) | for(I+1, Max, F)].

qsort([]) -> [];
qsort([Pivot | T]) ->
    qsort([X || X <- T, X < Pivot])
    ++ [Pivot] ++
    qsort([X || X <- T, X >= Pivot]).

pythag(N) ->
    Seq = lists:seq(1, N),

    [{A, B, C} ||
        A <- Seq,
        B <- Seq,
        C <- Seq,
        
        A + B =< N,
        A * A + B * B =:= C * C
    ].

perms([]) -> [[]];
perms(L) -> [[H | T] || H <- L, T <- perms(L -- [H])].


odds_and_evens1(L) ->
    Odds = [X || X <- L, (X rem 2) =:= 1],
    Evens = [X || X <- L, (X rem 2) =:= 0],
    {Odds, Evens}.

odds_and_evens2(L) ->
    odds_and_evens_acc(L, [], []).

odds_and_evens_acc([H | T], Odds, Evens) ->
    case (H rem 2) of
        1 -> odds_and_evens_acc(T, [H | Odds], Evens);
        0 -> odds_and_evens_acc(T, Odds, [H | Evens])
    end;

odds_and_evens_acc([], Odds, Evens) ->
    {lists:reverse(Odds), lists:reverse(Evens)}.


my_tuple_to_list(T) ->
    my_tuple_to_list_acc(T, tuple_size(T), []).

my_tuple_to_list_acc(_T, 0, Acc) ->
    Acc;

my_tuple_to_list_acc(T, I, Acc) ->
    my_tuple_to_list_acc(T, I - 1, [element(I, T) | Acc]).


my_time_func(F) ->
    TimeBefore = tuple_to_list(erlang:timestamp()),
    F(),
    TimeAfter = tuple_to_list(erlang:timestamp()),
    list_to_tuple([A - B || {A, B} <- lists:zip(TimeAfter, TimeBefore)]).
