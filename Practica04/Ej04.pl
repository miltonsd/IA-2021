:-dynamic(gasto/2).

inicio:- abrir_base, menu.

abrir_base:- retractall(gasto(_,_)), consult('facturas.txt').

menu:- writeln('Ingrese una opcion:'),
       writeln('1 - Cargar gasto.'),
       writeln('2 - Informar personas con el mismo tipo de gasto.'),
       writeln('3 - Informar personas con un consumo superior a $150 en un tipo de gasto.'),
       writeln('4 - Calcular gasto promedio de una persona.'),
       writeln('5 - Salir.'),
       read(Op), Op\=5, opcion(Op), writeln(''), menu.
menu:- writeln('Fin del programa.').

opcion(1):- agregarGasto, guardar.
opcion(2):- informarPersonas, abrir_base.
opcion(3):- informarGastos, abrir_base.
opcion(4):- gastoPromedio, abrir_base.
opcion(_).

menuGastos:- writeln('Ingresar tipo de gasto:'),
             writeln('1 - Supermercado.'),
             writeln('2 - Telefono.'),
             writeln('3 - Luz.').

agregarGasto:- write('Ingresar nombre de la persona: '), read(Persona), 
               menuGastos, read(Op), cargarGasto(Persona, Op).

cargarGasto(P, 1):- write('Ingresar monto: $'), read(Monto),
                    assert(gasto(P, super(Monto))).
cargarGasto(P, 2):- write('Ingresar monto: $'), read(Monto),
                    assert(gasto(P, tel(Monto))).
cargarGasto(P, 3):- write('Ingresar monto: $'), read(Monto),
                    assert(gasto(P, luz(Monto))).
cargarGasto(_, _).

guardar:- tell('facturas.txt'), listing(gasto), told.

informarPersonas:- menuGastos, read(Op), writeln('*******'), listarPersonas(Op).

listarPersonas(1):- gasto(Persona, super(_)),
                    writeln(Persona), retract(gasto(Persona, super(_))), 
                    listarPersonas(1).
listarPersonas(2):- gasto(Persona, tel(_)),
                    writeln(Persona), retract(gasto(Persona, tel(_))), 
                    listarPersonas(2).
listarPersonas(3):- gasto(Persona, luz(_)),
                    writeln(Persona), retract(gasto(Persona, luz(_))), 
                    listarPersonas(3).
listarPersonas(_).

informarGastos:- menuGastos, read(Op), writeln('*******'), listarPersGastos(Op).

listarPersGastos(1):- gasto(Persona, super(Monto)), Monto>150,
                      writeln(Persona), retract(gasto(Persona, super(Monto))), 
                      listarPersGastos(1).
listarPersGastos(2):- gasto(Persona, tel(Monto)), Monto>150,
                      writeln(Persona), retract(gasto(Persona, tel(Monto))), 
                      listarPersGastos(2).
listarPersGastos(3):- gasto(Persona, luz(Monto)), Monto>150,
                      writeln(Persona), retract(gasto(Persona, luz(Monto))), 
                      listarPersGastos(3).
listarPersGastos(_).

gastoPromedio:- write('Ingresar nombre de la persona: '), read(Persona),
                promediar(Persona, S, C), Prom is S/C, 
                write('Gasto promedio= $'), writeln(Prom).

promediar(P, S, C):- gasto(P, Gasto), monto(Gasto, Monto),
                     retract(gasto(P, Gasto)),
                     promediar(P, Sum, Cont),
                     S is Sum + Monto,
                     C is Cont + 1.
promediar(_, 0, 0).

monto(super(Monto), Monto).
monto(tel(Monto), Monto).
monto(luz(Monto), Monto).

% CONSULTAS
/*
?- inicio.
Ingrese una opcion:
1 - Cargar gasto.
2 - Informar personas con el mismo tipo gasto.
3 - Informar personas con un consumo superior a $150.
4 - Calcular gasto promedio de una persona.
5 - Salir.
|: 1.
Ingresar nombre de la persona: |: juan.
Ingresar tipo de gasto:
1 - Supermercado.
2 - Telefono.
3 - Luz.
|: 1.
Ingresar monto: $|: 86.

Ingrese una opcion:
1 - Cargar gasto.
2 - Informar personas con el mismo tipo gasto.
3 - Informar personas con un consumo superior a $150.
4 - Calcular gasto promedio de una persona.
5 - Salir.
|: 1.
Ingresar nombre de la persona: |: pedro.
Ingresar tipo de gasto:
1 - Supermercado.
2 - Telefono.
3 - Luz.
|: 2.
Ingresar monto: $|: 160.

Ingrese una opcion:
1 - Cargar gasto.
2 - Informar personas con el mismo tipo gasto.
3 - Informar personas con un consumo superior a $150.
4 - Calcular gasto promedio de una persona.
5 - Salir.
|: 1.
Ingresar nombre de la persona: |: juan.
Ingresar tipo de gasto:
1 - Supermercado.
2 - Telefono.
3 - Luz.
|: 3.
Ingresar monto: $|: 44.

Ingrese una opcion:
1 - Cargar gasto.
2 - Informar personas con el mismo tipo gasto.
3 - Informar personas con un consumo superior a $150.
4 - Calcular gasto promedio de una persona.
5 - Salir.
|: 1.
Ingresar nombre de la persona: |: martin.
Ingresar tipo de gasto:
1 - Supermercado.
2 - Telefono.
3 - Luz.
|: 3.
Ingresar monto: $|: 45.

Ingrese una opcion:
1 - Cargar gasto.
2 - Informar personas con el mismo tipo gasto.
3 - Informar personas con un consumo superior a $150.
4 - Calcular gasto promedio de una persona.
5 - Salir.
|: 2.
Ingresar tipo de gasto:
1 - Supermercado.
2 - Telefono.
3 - Luz.
|: 3.
*******
juan
martin

Ingrese una opcion:
1 - Cargar gasto.
2 - Informar personas con el mismo tipo gasto.
3 - Informar personas con un consumo superior a $150.
4 - Calcular gasto promedio de una persona.
5 - Salir.
|: 3.
Ingresar tipo de gasto:
1 - Supermercado.
2 - Telefono.
3 - Luz.
|: 2.
*******
pedro

Ingrese una opcion:
1 - Cargar gasto.
2 - Informar personas con el mismo tipo gasto.
3 - Informar personas con un consumo superior a $150.
4 - Calcular gasto promedio de una persona.
5 - Salir.
|: 4.
Ingresar nombre de la persona: |: juan.
Gasto promedio= $65

Ingrese una opcion:
1 - Cargar gasto.
2 - Informar personas con el mismo tipo gasto.
3 - Informar personas con un consumo superior a $150.
4 - Calcular gasto promedio de una persona.
5 - Salir.
|: 5.
Fin del programa.
true .
*/