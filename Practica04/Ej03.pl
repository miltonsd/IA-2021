:-dynamic(alimentacion/3).
:-dynamic(bebida/3).
:-dynamic(reproduccion/3).
:-dynamic(horas_suenio/2).

inicio:- consult('zoo.txt'),
         writeln('Ingrese una opcion:'),
         writeln('1 - Agregar un animal.'),
         writeln('2 - Informar habitos de un animal.'),
         writeln('3 - Informar animales que tienen un habito en comun.'),
         writeln('4 - Salir.'),
         read(Op), opcion(Op).

opcion(1):- agregarAnimal, guardar, inicio.
opcion(2):- write('Ingresar nombre del animal: '), read(Animal), 
            informarHabitos(Animal), inicio.
opcion(3):- writeln(''), writeln('Ingrese un habito:'),
            writeln('1 - Alimentacion.'),
            writeln('2 - Bebida.'),
            writeln('3 - Reproduccion.'),
            writeln('4 - Horas de suenio.'),
            read(Habito), buscarAnimales(Habito), writeln(''), inicio.
opcion(4):- writeln('Fin del programa.').

agregarAnimal:- write('Ingresar nombre del animal: '), read(Animal), 
                write('Ingresar comida: '), read(Comida),
                write('Ingresar cantidad de comida: '), read(CantComida),
                write('Ingresar bebida: '), read(Bebida),
                write('Ingresar cantidad de bebida: '), read(CantBebida),
                write('Ingresar epoca de reproduccion: '), read(Epoca),
                write('Ingresar periodo de gestacion: '), read(Gestacion),
                write('Ingresar horas de suenio: '), read(Horas),
                assert(alimentacion(Animal, Comida, CantComida)),
                assert(bebida(Animal, Bebida, CantBebida)),
                assert(reproduccion(Animal, Epoca, Gestacion)),
                assert(horas_suenio(Animal, Horas)), writeln('').

guardar:- tell('zoo.txt'), listing(alimentacion), listing(bebida), 
          listing(reproduccion), listing(horas_suenio), told.

informarHabitos(A):- alimentacion(A, Comida, CantComida), 
                     bebida(A, Bebida, CantBebida),
                     reproduccion(A, Epoca, Gestacion),
                     horas_suenio(A, Horas),
                     writeln('////////  ALIMENTACION  ////////'),
                     write('Comida: '), writeln(Comida), 
                     write('Cantidad: '), writeln(CantComida),
                     writeln('////////  BEBIDA  ////////'),
                     write('Bebida: '), writeln(Bebida),
                     write('Cantidad: '), writeln(CantBebida),
                     writeln('////////  REPRODUCCION  ////////'),
                     write('Epoca de reproduccion: '), writeln(Epoca),
                     write('Periodo de gestacion: '), writeln(Gestacion),
                     writeln('////////  SUENIO  ////////'),
                     write('Horas de suenio: '), writeln(Horas), writeln('').
informarHabitos(_).

buscarAnimales(1):- write('Ingresar comida: '), read(Comida),
                    write('Ingresar cantidad de comida: '), read(Cantidad),
                    informarAnimales(1, Comida, Cantidad).
buscarAnimales(2):- write('Ingresar bebida: '), read(Bebida),
                    write('Ingresar cantidad de bebida: '), read(Cantidad),
                    informarAnimales(2, Bebida, Cantidad).
buscarAnimales(3):- write('Ingresar epoca de reproduccion: '), read(Epoca),
                    write('Ingresar periodo de gestacion: '), read(Gestacion),
                    informarAnimales(3, Epoca, Gestacion).
buscarAnimales(4):- write('Ingresar horas de suenio: '), read(Horas),
                    informarAnimales(4, Horas, _).
buscarAnimales(_).

informarAnimales(1, C, Cant):- alimentacion(Animal, C, Cant), writeln(Animal), 
                               retract(alimentacion(Animal, C, Cant)), 
                               informarAnimales(1, C, Cant).
informarAnimales(2, B, Cant):- bebida(Animal, B, Cant), writeln(Animal), 
                               retract(bebida(Animal, B, Cant)),
                               informarAnimales(2, B, Cant).
informarAnimales(3, E, G):- reproduccion(Animal, E, G), writeln(Animal), 
                            retract(reproduccion(Animal, E, G)),
                            informarAnimales(3, E, G).
informarAnimales(4, H, _):- horas_suenio(Animal, H), writeln(Animal),
                            retract(horas_suenio(Animal, H)),
                            informarAnimales(4, H, _).
informarAnimales(_, _, _).


% CONSULTAS
/*
?- inicio.
Ingrese una opcion:
1 - Agregar un animal.
2 - Informar habitos de un animal.
3 - Informar animales que tienen un habito en comun.
4 - Salir.
|: 1.
Ingresar nombre del animal: |: leon.
Ingresar comida: |: carne.
Ingresar cantidad de comida: |: 5.
Ingresar bebida: |: agua.
Ingresar cantidad de bebida: |: 3.
Ingresar epoca de reproduccion: |: verano.
Ingresar periodo de gestacion: |: 4.
Ingresar horas de suenio: |: 6.

Ingrese una opcion:
1 - Agregar un animal.
2 - Informar habitos de un animal.
3 - Informar animales que tienen un habito en comun.
4 - Salir.
|: 1.
Ingresar nombre del animal: |: jirafa.
Ingresar comida: |: hojas.
Ingresar cantidad de comida: |: 6.
Ingresar bebida: |: agua.
Ingresar cantidad de bebida: |: 3.
Ingresar epoca de reproduccion: |: verano.
Ingresar periodo de gestacion: |: 7.
Ingresar horas de suenio: |: 9.

Ingrese una opcion:
1 - Agregar un animal.
2 - Informar habitos de un animal.
3 - Informar animales que tienen un habito en comun.
4 - Salir.
|: 2.
Ingresar nombre del animal: |: leon.
////////  ALIMENTACION  ////////
Comida: carne
Cantidad: 5
////////  BEBIDA  ////////
Bebida: agua
Cantidad: 3
////////  REPRODUCCION  ////////
Epoca de reproduccion: verano
Periodo de gestacion: 4
////////  SUENIO  ////////
Horas de suenio: 6

Ingrese una opcion:
1 - Agregar un animal.
2 - Informar habitos de un animal.
3 - Informar animales que tienen un habito en comun.
4 - Salir.
|: 3.

Ingrese un habito:
1 - Alimentacion.
2 - Bebida.
3 - Reproduccion.
4 - Horas de suenio.
|: 2.
Ingresar bebida: |: agua.
Ingresar cantidad de bebida: |: 3.
leon
jirafa

Ingrese una opcion:
1 - Agregar un animal.
2 - Informar habitos de un animal.
3 - Informar animales que tienen un habito en comun.
4 - Salir.
|: 4.
Fin del programa.
true .
*/