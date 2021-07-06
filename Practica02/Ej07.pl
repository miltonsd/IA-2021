inicio:- writeln('Ingrese una lista de elementos: '), leer(Lista), contar(Lista,Cantidad), write("Total de elementos= "), writeln(Cantidad).

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).

contar([],0).
contar([_|T],Cantidad):- contar(T,Cant), Cantidad is Cant + 1.


% CONSULTA
/*
?- inicio.
Ingrese una lista de elementos:
|: a.
|: e.
|: f.
|: z.
|: [].
Total de elementos= 4
true .
*/