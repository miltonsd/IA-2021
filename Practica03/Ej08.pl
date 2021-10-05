inicio:- writeln('Ingrese una palabra: '), read(Palabra), writeln('Ingrese un caracter: '), read(C), contar(Palabra, C, Contador), write("Cantidad de veces que aparece= "), writeln(Contador).

contar('', _, 0).
contar(Pal, C, Contador):- sub_atom(Pal, 0, 1, _, C), sub_atom(Pal, 1, _, 0, Sub), contar(Sub, C, Cont), Contador is Cont + 1.
contar(Pal, C, Contador):- sub_atom(Pal, 1, _, 0, Sub), contar(Sub, C, Contador).


% CONSULTA
/*
?- inicio.
Ingrese una palabra:
|: 'escaleras'.
Ingrese un caracter:
|: 's'.
Cantidad de veces que aparece= 2
true .
*/