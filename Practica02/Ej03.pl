inicio:- writeln('Ingrese una lista de elementos: '), leer(Lista), mostrar(Lista).

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).

mostrar([H|_]):- write("Primer elemento: "), writeln(H).


% CONSULTA
/*
?- inicio.
Ingrese una lista de elementos:
|: 10.
|: 23.
|: 546.
|: a.
|: hola.
|: [].
Primer elemento: 10
true .
*/