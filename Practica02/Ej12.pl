inicio:- writeln('Ingrese una lista de numeros enteros: '), leer(Lista), menor(Lista,Nro), write("Numero menor de la lista= "), writeln(Nro).

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).

menor([H|T],Nro):- menor(T,N), N =< H, Nro is N.
menor([H|_],Nro):- Nro is H.


% CONSULTA
/*
?- inicio.
Ingrese una lista de numeros enteros:
|: 3.
|: 1.
|: 5.
|: 4.
|: 8.
|: [].
Numero menor de la lista= 1
true .
*/