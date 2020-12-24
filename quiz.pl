append([],L2,L2).
append([X|L1],L2,[X|Z]) :- append(L1,L2,Z).
reverse([],[]).
reverse([X|R],Z) :- reverse(R,T),append(T,[X],Z).


lt(X,Y) :- var(X);var(Y).
lt(X,Y) :- nonvar(X),nonvar(Y),X<Y.
difference([],L2,[]).
difference([X|L1],[X|L2],Z) :- difference(L1,L2,Z).
difference([X|L1],[F|L2],[X|Z]) :- lt(X,Y),difference(L1,[Y|L2],Z).
difference([X|L1],[F|L2],[X|Z]) :- lt(Y,X),difference([X|L1],L2,Z).