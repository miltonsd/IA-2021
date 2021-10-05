inicio:- writeln('Ingrese una cadena: '), read(Cad), primer_caracter(Cad, C), write('El primer caracter es: '), writeln(C).

primer_caracter(Cad, C):- sub_atom(Cad, 0, 1, _, C).


% CONSULTA
/*
?- inicio.
Ingrese una cadena:
|: 'Esto es una cadena de prueba'.
El primer caracter es: E
true.
*/