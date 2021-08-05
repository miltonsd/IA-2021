inicio:- writeln('Ingrese una lista de elementos: '), leer(Lista), 
         repetido(Elemento,Lista), write("Primer elemento que se repite: "), writeln(Elemento).

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).

pertenece(X,[X|_]).
pertenece(X,[_|T]):- pertenece(X,T).

repetido(H,[H|T]):- pertenece(H,T).
repetido(Elemento,[_|T]):- repetido(Elemento,T).


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
Primer elemento que se repite: 5
true .
*/