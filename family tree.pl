male(anil).
male(vinay).
male(peter).
female(susan).
female(linda).
female(emma).

parent(anil, vinay).
parent(anil, susan).
parent(linda, vinay).
parent(linda, susan).
parent(vinay, emma).
parent(peter,anil).
parent(susan,anil).

father(X, Y) :- male(X), parent(X, Y).
mother(X, Y) :- female(X), parent(X, Y).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
