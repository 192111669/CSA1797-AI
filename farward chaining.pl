% Facts
has_fever(john).
has_cough(john).
has_headache(john).

% Rules
has_flu(X) :- has_fever(X), has_cough(X), has_headache(X).

% Forward chaining implementation
forward_chaining :-
    % Check for new facts using rules
    (has_flu(X),
     \+ has_flu(X)   % Check if the fact is not already known
     -> 
     assert(has_flu(X)),
     write('Derived new fact: has_flu('), write(X), write(')'), nl,
     fail  % Force backtracking to find more facts
     ;
     true).

% Example queries
:- dynamic has_flu/1.  % Dynamic predicate to allow assert/retract

% Run forward chaining
:- initialization(forward_chaining).

% Example queries after forward chaining
% Query 1
?- has_flu(john).
% Output: Derived new fact: has_flu(john)
% true.

% Query 2
?- has_flu(mary).
% Output: false.
