:-dynamic(libro/5).

inicio:- abrir_base, menu.

abrir_base:- retractall(libro(_,_,_,_,_)), consult('libreria.txt').

guardar:- tell('libreria.txt'), listing(libro), told.

menu:- writeln('Ingrese una opcion:'),
       writeln('1 - Altas.'),
       writeln('2 - Bajas.'),
       writeln('3 - Consultas.'),
       writeln('4 - Calcular precio promedio de los libros de un autor.'),
       writeln('5 - Salir.'),
       read(Op), Op\=5, opcion(Op), writeln(''), menu.
menu:- writeln('Fin del programa.').

opcion(1):- alta, guardar.
opcion(2):- baja, guardar.
opcion(3):- consulta, abrir_base.
opcion(4):- calcPromedio, abrir_base.
opcion(_).

alta:- write('Ingresar titulo: '), read(Titulo),
       write('Ingresar autor: '), read(Autor),
       write('Ingresar editorial: '), read(Editorial),
       write('Ingresar precio: $'), read(Precio),
       obtenerID(ID), assert(libro(ID, Titulo, Autor, Editorial, Precio)).

obtenerID(ID):- retract(libro(_, _, _, _, _)), obtenerID(IDanterior),
                ID is IDanterior + 1.       
obtenerID(1):- abrir_base.

baja:- write('Ingresar nro de libro: '), read(ID), 
       retract(libro(ID, _, _, _, _)).

consulta:- writeln('Ingresar tipo de busqueda:'),
           writeln('1 - Por titulo.'),
           writeln('2 - Por autor.'),
           writeln('3 - Por editorial.'),
           read(Op), buscarPor(Op).

buscarPor(1):- write('Ingresar titulo: '), read(T), listarPorTitulo(T).
buscarPor(2):- write('Ingresar autor: '), read(A), listarPorAutor(A).
buscarPor(3):- write('Ingresar editorial: '), read(E), listarPorEditorial(E).
buscarPor(_).

listarPorTitulo(T):- libro(ID, T, A, E, P), retract(libro(ID, T, A, E, P)),
                     write('Titulo: '), writeln(T), 
                     write('Autor: '), writeln(A),
                     write('Editorial: '), writeln(E),
                     write('Precio: $'), writeln(P), writeln(''),
                     listarPorTitulo(T).

listarPorAutor(A):- libro(ID, T, A, E, P), retract(libro(ID, T, A, E, P)),
                    write('Titulo: '), writeln(T), 
                    write('Autor: '), writeln(A),
                    write('Editorial: '), writeln(E),
                    write('Precio: $'), writeln(P), writeln(''),
                    listarPorAutor(A).

listarPorEditorial(E):- libro(ID, T, A, E, P), retract(libro(ID, T, A, E, P)),
                        write('Titulo: '), writeln(T), 
                        write('Autor: '), writeln(A),
                        write('Editorial: '), writeln(E),
                        write('Precio: $'), writeln(P), writeln(''),
                        listarPorEditorial(E).

calcPromedio:- write('Ingresar autor: '), read(Autor),
               promediar(Autor, S, C), Prom is S/C, 
               write('Promedio= $'), writeln(Prom).

promediar(A, S, C):- libro(ID, T, A, E, Precio), 
                     retract(libro(ID, T, A, E, Precio)),
                     promediar(A, Sum, Cont),
                     S is Sum + Precio,
                     C is Cont + 1.
promediar(_, 0, 0).

% CONSULTAS
/*
?- inicio.
Ingrese una opcion:
1 - Altas.
2 - Bajas.
3 - Consultas.
4 - Calcular precio promedio de los libros de un autor.
5 - Salir.
|: 1.
Ingresar titulo: |: martinFierro.
Ingresar autor: |: joseHernandez.
Ingresar editorial: |: arg.
Ingresar precio: $|: 150.

Ingrese una opcion:
1 - Altas.
2 - Bajas.
3 - Consultas.
4 - Calcular precio promedio de los libros de un autor.
5 - Salir.
|: 1.
Ingresar titulo: |: historia1.
Ingresar autor: |: fulanito.
Ingresar editorial: |: arg.
Ingresar precio: $|: 95.

Ingrese una opcion:
1 - Altas.
2 - Bajas.
3 - Consultas.
4 - Calcular precio promedio de los libros de un autor.
5 - Salir.
|: 1.
Ingresar titulo: |: historia1.
Ingresar autor: |: fulanito.
Ingresar editorial: |: educAR.
Ingresar precio: $|: 70.

Ingrese una opcion:
1 - Altas.
2 - Bajas.
3 - Consultas.
4 - Calcular precio promedio de los libros de un autor.
5 - Salir.
|: 1.
Ingresar titulo: |: borrar.
Ingresar autor: |: borrar.
Ingresar editorial: |: borrar.
Ingresar precio: $|: 1.

Ingrese una opcion:
1 - Altas.
2 - Bajas.
3 - Consultas.
4 - Calcular precio promedio de los libros de un autor.
5 - Salir.
|: 2.
Ingresar nro de libro: |: 4.

Ingrese una opcion:
1 - Altas.
2 - Bajas.
3 - Consultas.
4 - Calcular precio promedio de los libros de un autor.
5 - Salir.
|: 3.
Ingresar tipo de busqueda:
1 - Por titulo.
2 - Por autor.
3 - Por editorial.
|: 3.
Ingresar editorial: |: arg.
Titulo: martinFierro
Autor: joseHernandez
Editorial: arg
Precio: $150

Titulo: historia1
Autor: fulanito
Editorial: arg
Precio: $95


Ingrese una opcion:
1 - Altas.
2 - Bajas.
3 - Consultas.
4 - Calcular precio promedio de los libros de un autor.
5 - Salir.
|: 4.
Ingresar autor: |: fulanito.
Promedio= $82.5

Ingrese una opcion:
1 - Altas.
2 - Bajas.
3 - Consultas.
4 - Calcular precio promedio de los libros de un autor.
5 - Salir.
|: 5.
Fin del programa.
true .
*/