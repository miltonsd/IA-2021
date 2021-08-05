inicio:- writeln('Ingrese una lista de elementos: '), leer(Lista), 
         repetido(Lista,Repetidos), write("Elementos que se repiten: "), writeln(Repetidos).

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).

pertenece(X,[X|_]).
pertenece(X,[_|T]):- pertenece(X,T).

repetido([],[]).
repetido([H|T],[H|TR]):- pertenece(H,T), repetido(T,TR).
repetido([_|T],Repetidos):- repetido(T,Repetidos).


% CONSULTA
/*
?- inicio.
Ingrese una lista de elementos:
|: 2.
|: 5.
|: 3.
|: 4.
|: 5.
|: 3.
|: [].
Elementos que se repiten: [5,3]
true .
*/