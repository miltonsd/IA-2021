inicio:- writeln('Ingrese una lista de elementos: '), leer(Lista), mostrar(Lista).

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).

mostrar([T|[]]):- write("Ultimo elemento: "), writeln(T).
mostrar([_|T]):- mostrar(T).


% CONSULTA
/*
?- inicio.
Ingrese una lista de elementos:
|: hola.
|: como.
|: estas.
|: [].
Ultimo elemento: estas
true .
*/