:-dynamic(personas/2).

inicio:- consult('personas.txt'),
         writeln('Ingrese un codigo: '), read(Codigo),
         buscarPersona(Codigo).

buscarPersona(Cod):- personas(Cod, Nombre),
                     write('Este codigo corresponde a '), write(Nombre), writeln('.').
buscarPersona(Cod):- writeln('Codigo no encontrado. Se procedera a registrarlo'),
                   write('Ingresar nombre de la persona: '), read(Nombre),
                   assert(personas(Cod, Nombre)), guardar.

guardar:- tell('personas.txt'), listing(personas), told.


% CONSULTAS
/*
?- inicio.
Ingrese un codigo:
|: 1.
Codigo no encontrado. Se procedera a registrarlo
Ingresar nombre de la persona: |: milton.

true.

?- inicio.
Ingrese un codigo:
|: 2.
Codigo no encontrado. Se procedera a registrarlo
Ingresar nombre de la persona: |: agostina.

true.

?- inicio.
Ingrese un codigo:
|: 1.
Este codigo corresponde a milton.
true .
*/