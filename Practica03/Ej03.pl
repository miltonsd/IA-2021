inicio:- writeln('Ingrese una cadena: '), read(Cad), contar1(Cad, C1), write("***Usando atom_length***\nCantidad= "), writeln(C1), contar2(Cad, C2), write("***Usando sub_atom***\nCantidad= "), writeln(C2).

contar1(Cad, C1):- atom_length(Cad, C1).

contar2('', 0).
contar2(Cad, C2):- sub_atom(Cad, 1, _, 0, Sub), contar2(Sub, Cant), C2 is Cant + 1.


% CONSULTA
/*
?- inicio.
Ingrese una cadena:
|: 'Cadena'.
***Usando atom_length***
Cantidad= 6
***Usando sub_atom***
Cantidad= 6
true .
*/