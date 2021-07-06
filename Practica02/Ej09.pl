inicio:- writeln('Ingrese una lista de numeros enteros: '), leer(L), promedio(L,S,C), Prom is S/C,  write("Promedio= "), writeln(Prom).

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).

promedio([],0,0).
promedio([H|T],S,C):- promedio(T,Sum,Cont), S is Sum + H, C is Cont + 1. 


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
Promedio= 3.2
true .
*/