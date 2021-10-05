% vuelo(origen, destino, tiempo[min])
vuelo('Salta','Cordoba',80).
vuelo('Cordoba','Formosa',120).
vuelo('Cordoba','Rosario',55).
vuelo('Cordoba','Neuquen',100).
vuelo('Cordoba','Mendoza',65).
vuelo('Formosa','Corrientes',50).
vuelo('Corrientes','Posadas',70).
vuelo('Corrientes', 'Parana',57).
vuelo('Corrientes','Santa Fe',93).
vuelo('Posadas','Parana',85).
vuelo('Santa Fe','Rosario',30).
vuelo('Rosario','Parana',25).
vuelo('Rosario','Buenos Aires',55).
vuelo('Rosario','Mendoza',175).
vuelo('Mendoza','Buenos Aires',85).
vuelo('Mendoza','Neuquen',83).
vuelo('Neuquen', 'Buenos Aires',90).
vuelo('Buenos Aires','Calafate',115).
vuelo('Buenos Aires', 'Puerto Madryn',75).
vuelo('Neuquen','Calafate',65).

inicio:-writeln("Ingrese una ciudad de origen: "),read(Origen),writeln("Ingrese una ciudad de destino:") ,
read(Destino),writeln("Desea ver el itinerario con la menor cantidad de transbordos posibles? Ingrese s o n") , read(Op) ,
busqueda(Origen,Destino,Op).
busqueda(Origen,Destino,n):-primeroEnProfundidad(Origen,Destino).
busqueda(Origen,Destino,s):-primeroEnAnchura(Origen,Destino).
busqueda(_,_,_):-write("Ingrese una opción valida").

primeroEnProfundidad(Inicio,Fin) :- buscaRuta(Inicio,Fin,[Inicio],Solucion) , reverse(Solucion,Recorrido) ,
writeln(Recorrido) , costo(Recorrido,T) , writeln("Tiempo: ") , write(T).

% Si el estado actual es la meta, devolver la ruta recorrida como solución.
buscaRuta(Estado, Estado, Ruta, Ruta).
% Generar un sucesor del estado actual. Si no fue visitado agregarlo a la ruta.
buscaRuta(Estado, Meta, Ruta, Solucion) :- sucesor(Estado,NuevoEstado),
not(pertenece(NuevoEstado, Ruta)), buscaRuta(NuevoEstado, Meta, [NuevoEstado|Ruta], Solucion).

% Generar el próximo estado.
sucesor(Estado,NuevoEstado):- conecta(Estado,NuevoEstado,_).
sucesor(Estado,NuevoEstado):- conecta(NuevoEstado,Estado,_).
% -----------------------------------
primeroEnAnchura(Inicio,Meta):-buscaRutaAnchura([[Inicio]],Meta,Solucion),reverse(Solucion,Recorrido) ,
writeln(Recorrido),costo(Recorrido,T) , writeln("Tiempo: ") , write(T).
% Si el estado actual es la meta devuelve la ruta
buscaRutaAnchura([[Estado|Ruta]|_],Estado,[Estado|Ruta]).
% Generar las rutas sucesoras y agregar a la lista, eliminando la
% primera.
buscaRutaAnchura([PrimerRuta|OtrasRutas],Meta,Solucion):-expandir(PrimerRuta,NuevasRutas) ,
concatenar(OtrasRutas,NuevasRutas,NuevaLista),buscaRutaAnchura(NuevaLista,
Meta,Solucion).
% Rutas sucesoras.
expandir([Estado|Ruta],NuevasRutas):-findall([NuevoEstado,Estado|Ruta] ,
(sucesor(Estado,NuevoEstado) , not(pertenece(NuevoEstado,[Estado|Ruta]))),NuevasRutas).
expandir(_,[]). 
concatenar([],Lista,Lista).
concatenar([H|T],Lista,[H|R]) :- concatenar(T,Lista,R).
pertenece(X,[X|_]).
pertenece(X,[_|T]) :- pertenece(X,T).
% Para calcular el costo
costo([H|[T]],Distancia):-conecta(H,T,Distancia).
costo([H|[H1|T]],Distancia):-costo([H1|T],DistInt),conecta(H,H1,D),Distancia is DistInt + D.
% Distancia entre vuelos
conecta(A,B,T):-vuelo(A,B,T).
conecta(A,B,T):-vuelo(B,A,T).