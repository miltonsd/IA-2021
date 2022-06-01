:-dynamic(facturas/4).

inicio:- consult('facturas.txt'),
         writeln('Ingrese una opcion:'),
         writeln('1 - Agregar factura.'),
         writeln('2 - Informar gastos.'),
         writeln('3 - Salir.'),
         read(Op), opcion(Op).

opcion(1):- agregarFactura, guardar, inicio.
opcion(2):- write('Ingresar nombre de la persona: '), read(Persona), buscarFactura(Persona), inicio.
opcion(3):- writeln('Fin del programa.').

agregarFactura:- write('Ingresar nombre de la persona: '), read(Nombre), 
                 write('Ingresar mes: '), read(Mes),
                 write('Ingresar tipo de gasto: '), read(Gasto),
                 write('Ingresar monto: $'), read(Monto),
                 assert(facturas(Nombre, Mes, Gasto, Monto)), writeln('').

guardar:- tell('facturas.txt'), listing(facturas), told.

buscarFactura(P):- facturas(P, Mes, Gasto, Monto),
                   write('Mes: '), writeln(Mes),
                   write('Tipo de gasto: '), writeln(Gasto),
                   write('Monto: $'), writeln(Monto), writeln(''),
                   retract(facturas(P, Mes, Gasto, Monto)),
                   buscarFactura(P).              
buscarFactura(_).


% CONSULTAS
/*
?- inicio.
Ingrese una opcion:
1 - Agregar factura.
2 - Informar gastos.
3 - Salir.
|: 1.
Ingresar nombre de la persona: |: pedro.
Ingresar mes: |: octubre.
Ingresar tipo de gasto: |: luz.
Ingresar monto: $|: 3000.

Ingrese una opcion:
1 - Agregar factura.
2 - Informar gastos.
3 - Salir.
|: 1.
Ingresar nombre de la persona: |: juan.
Ingresar mes: |: octubre.
Ingresar tipo de gasto: |: gas.
Ingresar monto: $|: 2500.

Ingrese una opcion:
1 - Agregar factura.
2 - Informar gastos.
3 - Salir.
|: 1.
Ingresar nombre de la persona: |: lucas.
Ingresar mes: |: noviembre.
Ingresar tipo de gasto: |: supermercado.
Ingresar monto: $|: 1800.

Ingrese una opcion:
1 - Agregar factura.
2 - Informar gastos.
3 - Salir.
|: 1.
Ingresar nombre de la persona: |: pedro.
Ingresar mes: |: noviembre.
Ingresar tipo de gasto: |: alquiler.
Ingresar monto: $|: 6500.

Ingrese una opcion:
1 - Agregar factura.
2 - Informar gastos.
3 - Salir.
|: 2.
Ingresar nombre de la persona: |: pedro.
Mes: octubre
Tipo de gasto: luz
Monto: $3000

Mes: noviembre
Tipo de gasto: alquiler
Monto: $6500

Ingrese una opcion:
1 - Agregar factura.
2 - Informar gastos.
3 - Salir.
|: 3.
Fin del programa.
true .
*/