% HECHOS - persona(nombre, listaCiudades).
persona(juan, [rosario, parana]).
persona(pedro, [parana, cordoba, santaFe]).
persona(carlos, [capitanBermudez, buenosAires, rosario]).
persona(diego, [rosario, capitanBermudez, laPlata, cordoba]).

inicio:- write('Ingrese un nombre de persona: '), read(N),
         write('Ingrese una ciudad: '), read(C), viajo(N,C).

buscar(X,[X|_]).
buscar(X,[_|T]):- buscar(X,T).

viajo(Nombre,Ciudad):- persona(Nombre,Ciudades), buscar(Ciudad,Ciudades).


% CONSULTA
/*
?- inicio.
Ingrese un nombre de persona: diego.
Ingrese una ciudad: |: capitanBermudez.

true .

?- inicio.
Ingrese un nombre de persona: pedro.
Ingrese una ciudad: |: rosario.

false.
*/