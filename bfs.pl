% Facts representing the graph
edge(a, b, 2).
edge(a, c, 1).
edge(b, d, 5).
edge(c, e, 3).
edge(c, f, 4).

% Best First Search algorithm
best_first_search(Start, Goal, Path) :-
    best_first_search_([Path], Goal, [Start]).

best_first_search_([Path|_], Goal, _) :-
    Path = [Goal|_],
    write('Goal reached! Path: '), write(Path), nl.

best_first_search_([Path|Paths], Goal, Visited) :-
    extend(Path, NewPaths, Visited),
    append(Paths, NewPaths, AllPaths),
    best_first_search_(AllPaths, Goal, [Path|Visited]).

extend([Node|Path], NewPaths, Visited) :-
    findall([NewNode, Node|Path],
            (edge(Node, NewNode, _),
             \+ member(NewNode, Visited)),
            NewPaths).
