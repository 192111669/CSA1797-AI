hanoi(1, From, To, _) :-
    write('Move disk 1 from '),
    write(From),
    write(' to '),
    writeln(To).

hanoi(N, From, To, Via) :-
    N > 1,
    M is N - 1,
    hanoi(M, From, Via, To),
    write('Move disk '),
    write(N),
    write(' from '),
    write(From),
    write(' to '),
    writeln(To),
    hanoi(M, Via, To, From).
