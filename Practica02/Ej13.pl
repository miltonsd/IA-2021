inicio:- writeln('Ingrese la primer lista de elementos: '), leer(Lista1), 
         writeln('Ingrese la segunda lista de elementos: '), leer(Lista2), 
         concatenar(Lista1,Lista2,Lista), write("Lista 1= "), writeln(Lista1), 
         write("Lista 2= "), writeln(Lista2), write("Lista concatenada= "), writeln(Lista).

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).

concatenar([],[],[]).
concatenar([H1|T1],Lista2,[H1|T3]):- concatenar(T1,Lista2,T3).
concatenar([],[H2|T2],[H2|T3]):- concatenar([],T2,T3).


% CONSULTA
/*
?- inicio.
Ingrese la primer lista de elementos:
|: 2.
|: 4.
|: 6.
|: [].
Ingrese la segunda lista de elementos:
|: 3.
|: 5.
|: 7.
|: [].
Lista 1= [2,4,6]
Lista 2= [3,5,7]
Lista concatenada= [2,4,6,3,5,7]
true .
*/