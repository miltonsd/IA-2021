inicio:- writeln('Ingrese una lista de elementos: '), leer(Lista),
         write('Ingrese un elemento: '), read(X),
         contar(X,Lista,Cant), write("Cantidad de veces que se repite= "), writeln(Cant).

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).

contar(_,[],0).
contar(X,[H|T],Cant):- X=H, contar(X,T,Cantidad), Cant is Cantidad + 1.
contar(X,[_|T],Cant):- contar(X,T,Cant).


% CONSULTA
/*
?- inicio.
Ingrese una lista de elementos:
|: 2.
|: 5.
|: 4.
|: 8.
|: 4.
|: 6.
|: 5.
|: 4.
|: [].
Ingrese un elemento: |: 4.
Cantidad de veces que se repite= 3
true .
*/