inicio:- writeln('Ingrese una cadena: '), read(Cad), ultimo_caracter(Cad, C), write('El ultimo caracter es: '), writeln(C).

ultimo_caracter(Cad, C):- sub_atom(Cad, _, 1, 0, C).


% CONSULTA
/*
?- inicio.
Ingrese una cadena:
|: 'Esto es una cadena de prueba'.
El ultimo caracter es: a
true.
*/