mayorN(_, [], []).
mayorN(N, [H|T], [H|R]) :-
    H > N,
    mayorN(N, T, R).
mayorN(N, [H|T], R) :-
    H =< N,
    mayorN(N, T, R).