inicio:- writeln('Ingrese una lista de elementos: '), leer(Lista), write('Ingrese un elemento: '), read(X), buscar(X,Lista).

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).

buscar(X,[]):- write(X), writeln(' no se encuentra en la lista.').
buscar(X,[X|_]):- write(X), writeln(' se encuentra en la lista.').
buscar(X,[_|T]):- buscar(X,T).


% CONSULTAS
/*
?- inicio.
Ingrese una lista de elementos:
|: a.
|: b.
|: c.
|: d.
|: e.
|: [].
Ingrese un elemento: |: f.
f no se encuentra en la lista.
true .

?- inicio.
Ingrese una lista de elementos:
|: a.
|: b.
|: c.
|: d.
|: e.
|: [].
Ingrese un elemento: |: e.
e se encuentra en la lista.
true .
*/