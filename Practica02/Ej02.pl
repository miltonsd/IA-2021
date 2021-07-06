inicio:- writeln('Ingrese una lista de elementos: '), leer(Lista), mostrar(Lista).

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).

mostrar([H|T]):- write("Cabeza de la lista: "), writeln(H), write("Cola de la lista: "), writeln(T).


% CONSULTA
/*
?- inicio.
Ingrese una lista de elementos:
|: 5.
|: 3.
|: 4.
|: 8.
|: 2.
|: 10.
|: 0.
|: [].
Cabeza de la lista: 5
Cola de la lista: [3,4,8,2,10,0]
true .
*/