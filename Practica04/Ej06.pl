:-dynamic(receta/3).

inicio:- abrir_base, menu.

abrir_base:- retractall(receta(_,_,_)), consult('recetas.txt').

guardar:- tell('recetas.txt'), listing(receta), told.

menu:- writeln('Ingrese una opcion:'),
       writeln('1 - Registrar receta.'),
       writeln('2 - Listar recetas que llevan 2 ingredientes determinados.'),
       writeln('3 - Listar recetas que superan una cantidad de un ingrediente.'),
       writeln('4 - Salir.'),
       read(Op), Op\=4, opcion(Op), writeln(''), menu.
menu:- writeln('Fin del programa.').

opcion(1):- alta, guardar.
opcion(2):- listarRecetas1, abrir_base.
opcion(3):- listarRecetas2, abrir_base.
opcion(_).

alta:- write('Ingresar nombre de la receta: '), read(Nombre),
       writeln('Ingresar ingredientes ("[]" para finalizar)'),
       cargar(Ingredientes), obtenerCod(Cod),
       assert(receta(Cod, Nombre, Ingredientes)).

obtenerCod(Cod):- retract(receta(_, _, _)), obtenerCod(CodAnterior),
                  Cod is CodAnterior + 1.
obtenerCod(1):- abrir_base.

cargar([ingrediente(I, C)|T]):- write('Ingresar ingrediente: '), read(I), I\=[], 
                                write('Ingresar cantidad: '), read(C), cargar(T).
cargar([]).

listarRecetas1:- write('Ingresar ingrediente 1: '), read(Ing1),
                 write('Ingresar ingrediente 2: '), read(Ing2),
                 buscarIngredientes(Ing1, Ing2).

buscarIngredientes(Ing1, Ing2):- receta(Cod, Nombre, Ingredientes),
                                 buscar(ingrediente(Ing1, _), Ingredientes),
                                 buscar(ingrediente(Ing2, _), Ingredientes),
                                 write('Codigo de la receta: '), writeln(Cod),
                                 write('Nombre de la receta: '), writeln(Nombre),
                                 retract(receta(Cod, Nombre, Ingredientes)),
                                 writeln(''), buscarIngredientes(Ing1, Ing2).
buscarIngredientes(_, _).

buscar(X,[X|_]).
buscar(X,[_|T]):- buscar(X,T).

listarRecetas2:- write('Ingresar ingrediente: '), read(Ing),
                 write('Ingresar cantidad: '), read(Cant),
                 buscarSuperior(Ing, Cant).

buscarSuperior(Ing, Cant):- receta(Cod, Nombre, Ingredientes),
                            buscar(ingrediente(Ing, C), Ingredientes), C > Cant,
                            write('Codigo de la receta: '), writeln(Cod),
                            write('Nombre de la receta: '), writeln(Nombre),
                            retract(receta(Cod, Nombre, Ingredientes)),
                            writeln(''), buscarSuperior(Ing, Cant).
buscarSuperior(_, _).

% CONSULTAS
/*
?- inicio.
Ingrese una opcion:
1 - Registrar receta.
2 - Listar recetas que llevan 2 ingredientes determinados.
3 - Listar recetas que superan una cantidad de un ingrediente.
4 - Salir.
|: 1.
Ingresar nombre de la receta: |: pure.
Ingresar ingredientes ("[]" para finalizar)
Ingresar ingrediente: |: papa.
Ingresar cantidad: |: 3.
Ingresar ingrediente: |: manteca.
Ingresar cantidad: |: 1.
Ingresar ingrediente: |: [].

Ingrese una opcion:
1 - Registrar receta.
2 - Listar recetas que llevan 2 ingredientes determinados.
3 - Listar recetas que superan una cantidad de un ingrediente.
4 - Salir.
|: 1.
Ingresar nombre de la receta: |: tortilla.
Ingresar ingredientes ("[]" para finalizar)
Ingresar ingrediente: |: papa.
Ingresar cantidad: |: 4.
Ingresar ingrediente: |: queso.
Ingresar cantidad: |: 3.
Ingresar ingrediente: |: huevo.
Ingresar cantidad: |: 2.
Ingresar ingrediente: |: [].

Ingrese una opcion:
1 - Registrar receta.
2 - Listar recetas que llevan 2 ingredientes determinados.
3 - Listar recetas que superan una cantidad de un ingrediente.
4 - Salir.
|: 1.
Ingresar nombre de la receta: |: omelette.
Ingresar ingredientes ("[]" para finalizar)
Ingresar ingrediente: |: huevo.
Ingresar cantidad: |: 2.
Ingresar ingrediente: |: queso.
Ingresar cantidad: |: 2.
Ingresar ingrediente: |: [].

Ingrese una opcion:
1 - Registrar receta.
2 - Listar recetas que llevan 2 ingredientes determinados.
3 - Listar recetas que superan una cantidad de un ingrediente.
4 - Salir.
|: 2.
Ingresar ingrediente 1: |: huevo.
Ingresar ingrediente 2: |: queso.
Codigo de la receta: 2
Nombre de la receta: tortilla

Codigo de la receta: 3
Nombre de la receta: omelette


Ingrese una opcion:
1 - Registrar receta.
2 - Listar recetas que llevan 2 ingredientes determinados.
3 - Listar recetas que superan una cantidad de un ingrediente.
4 - Salir.
|: 3.
Ingresar ingrediente: |: papa.
Ingresar cantidad: |: 2.
Codigo de la receta: 1
Nombre de la receta: pure

Codigo de la receta: 2
Nombre de la receta: tortilla


Ingrese una opcion:
1 - Registrar receta.
2 - Listar recetas que llevan 2 ingredientes determinados.
3 - Listar recetas que superan una cantidad de un ingrediente.
4 - Salir.
|: 4.
Fin del programa.
true .
*/