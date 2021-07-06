inicio:- writeln('Ingrese una lista de elementos: '), leer(Lista), writeln(Lista).

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).


% CONSULTA
/*
?- inicio.
Ingrese una lista de elementos:
|: hola.
|: a.
|: 10.
|: 4.
|: e.
|: chau.
|: [].
[hola,a,10,4,e,chau]
true .
*/