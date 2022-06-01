% Programa que agrega un hecho a la base de datos

:-dynamic(padres/3). % El predicado es dinámico

inicio:-abrir_base,
        agregarNuevo,
        guardar.

abrir_base:-consult('datos.txt').

agregarNuevo:-write('Ingrese hijo: '), read(H),
              write('Ingrese madre: '), read(M),
              write('Ingrese padre: '), read(P),
              assert(padres(H,M,P)).

guardar:-tell('datos.txt'), listing(padres), told.