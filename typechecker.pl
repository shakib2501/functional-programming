hastype(Gamma, const(N), t_int).
hastype(Gamma, bool(true), t_bool).
hastype(Gamma, bool(false), t_bool).
lookup(X,[],V) :- fail.
lookup(X,[(X,V)|R],V) :- !.
lookup(X,[_|R],V) :- lookup(X,R,V).
hastype(Gamma,variable(X),T) :- lookup(X,Gamma,T).
hastype(Gamma,abs(X,E),arrow(T1,T2)) :- hastype([(X,T1)|Gamma],E,T2).
hastype(Gamma,app(E1,E2),T) :- hastype(Gamma,E1,arrow(T1,T)),hastype(Gamma,E2,T1).

hastype(Gamma,plus(E1,E2),t_int) :- hastype(Gamma,E1,t_int),hastype(Gamma,E2,t_int).
hastype(Gamma,times(E1,E2),t_int) :- hastype(Gamma,E1,t_int),hastype(Gamms,E2,t_int).

hastype(Gamma,neg(E),t_bool) :- hastype(Gamma,E,t_bool).
hastype(Gamma,conj(E1,E2),t_bool) :- hastype(Gamma,E1,t_bool),hastype(Gamma,E2,t_bool).
hastype(Gamma,disj(E1,E2),t_bool) :- hastype(Gamma,E1,t_bool),hastype(Gamma,E2,t_bool).

hastype(Gamma,leq(E1,E2),t_bool) :- hastype(Gamma,E1,t_bool), hastype(Gamma,E2,t_bool).
hastype(Gamma,equals(E1,E2),t_bool) :- hastype(Gamma,E1,t_bool), hastype(Gamma,E2,t_bool).
hastype(Gamma,equals(E1,E2),t_bool) :- hastype(Gamma,E1,t_int),hastype(Gamma,E2,t_int).
hastype(Gamma,geq(E1,E2),t_bool) :- hastype(Gamma,E1,t_bool), hastype(Gamma,E2,t_bool).

hastype(Gamma,unit,t_unit).

hastype(Gamma,pair(E1,E2),product(T1,T2)) :- hastype(Gamma,E1,T1),hastype(Gamma,E2,T2).

hastype(Gamma,proj1(E),T1) :- hastype(Gamma,E,product(T1,T2)).
hastype(Gamma,proj2(E),T2) :- hastype(Gamma,E,product(T1,T2)).

hastype(Gamma,ifte(E0,E1,E2),arrow(T,t_bool) :- hastype(Gamma,E0,t_bool), hastype(Gamma,E1,T),hastype(Gamma,E2,T).
