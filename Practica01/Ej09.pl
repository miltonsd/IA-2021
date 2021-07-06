% hijo(X,Y)
hijo(juan,miguel).
hijo(jose,miguel).
hijo(miguel,roberto).
hijo(julio,roberto).
hijo(roberto,carlos).

% REGLA
descendiente(A,B):-hijo(A,B).
descendiente(A,B):-hijo(A,Padre), descendiente(Padre,B).

% CONSULTAS
/*
?- descendiente(juan,miguel).
true .

?- descendiente(miguel,roberto).
true .

?- descendiente(juan,roberto).
true .

?- descendiente(roberto,juan).
false.

?- descendiente(juan,julio).
false.

?- descendiente(jose,carlos).
true .
*/