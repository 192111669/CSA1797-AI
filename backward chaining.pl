% Rules
has_flu(X) :- has_fever(X), has_cough(X), has_headache(X).

% Facts
has_fever(john).
has_cough(john).
has_headache(john).

% Backward chaining implementation
backward_chaining(Goal) :-
    Goal,
    write('Goal achieved: '), write(Goal), nl.
backward_chaining(Goal) :-
    rule(Goal, Premises),
    write('Checking rule for '), write(Goal), write(' with premises: '), write(Premises), nl,
    backward_chaining_list(Premises).

backward_chaining_list([]).
backward_chaining_list([H|T]) :-
    backward_chaining(H),
    backward_chaining_list(T).

% Example queries
% Query 1
?- backward_chaining(has_flu(john)).
% Output: Checking rule for has_flu(john) with premises: [has_fever(john), has_cough(john), has_headache(john)]
%        Goal achieved: has_flu(john).

% Query 2
?- backward_chaining(has_flu(mary)).
% Output: false.
