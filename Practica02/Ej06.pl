inicio:- writeln('Ingrese una lista de numeros enteros: '), leer([H|T]), ultimo([H|T],U), Diferencia is H - U, write("Diferencia= "), writeln(Diferencia).

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).

ultimo([H],H).
ultimo([_|T],U):- ultimo(T,U).


% CONSULTA
/*
?- inicio.
Ingrese una lista de numeros enteros:
|: 8.
|: 10.
|: 4.
|: 3.
|: [].
Diferencia= 5
true .
*/