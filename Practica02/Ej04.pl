inicio:- writeln('Ingrese una lista de elementos: '), leer(Lista), mostrar(Lista).

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).

mostrar([H|T]):- primero(H), segundo(T).
primero(H):- write("Primer elemento: "), writeln(H).
segundo([T|_]):- write("Segundo elemento: "), writeln(T).


% CONSULTA
/*
?- inicio.
Ingrese una lista de elementos:
|: hola.
|: como.
|: estas.
|: [].
Primer elemento: hola
Segundo elemento: como
true .
*/