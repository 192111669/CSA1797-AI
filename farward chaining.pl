:- discontiguous likes/2. 

likes(john, pizza).
likes(mary, pasta).
likes(mike, burgers).

eats(X, Y) :- likes(X, Y).

healthy(pasta).
healthy(salad).

recommends(X, Y) :- eats(X, Y), healthy(Y).

likes(X, Y) :- recommends(Z, Y), friend(X, Z).

friend(john, mary).
