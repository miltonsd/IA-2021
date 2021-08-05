inicio:- writeln('Ingrese una lista de numeros enteros: '), leer(Lista), mayor(Lista,Nro), write("Numero mayor de la lista= "), writeln(Nro).

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).

mayor([H|T],Nro):- mayor(T,N), N >= H, Nro is N.
mayor([H|_],Nro):- Nro is H.


% CONSULTA
/*
?- inicio.
Ingrese una lista de numeros enteros:
|: 5.
|: 3.
|: 8.
|: 4.
|: 1.
|: [].
Numero mayor de la lista= 8
true .
*/