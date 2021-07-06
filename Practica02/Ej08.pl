inicio:- writeln('Ingrese una lista de numeros enteros: '), leer(Lista), sumar(Lista,Sum), write("Sumatoria= "), writeln(Sum).

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).

sumar([],0).
sumar([H|T],Sum):- sumar(T,Suma), Sum is Suma + H.


% CONSULTA
/*
?- inicio.
Ingrese una lista de numeros enteros:
|: 4.
|: 0.
|: 3.
|: 2.
|: 7.
|: [].
Sumatoria= 16
true .
*/