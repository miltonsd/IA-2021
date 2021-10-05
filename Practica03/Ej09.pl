inicio:- writeln('Ingrese una cadena: '), read(Palabra), contar(Palabra, ContA, ContE, ContI, ContO, ContU, Contador), 
         write("Cantidad de veces que aparece A= "), writeln(ContA),
         write("Cantidad de veces que aparece E= "), writeln(ContE),
         write("Cantidad de veces que aparece I= "), writeln(ContI),
         write("Cantidad de veces que aparece O= "), writeln(ContO),
         write("Cantidad de veces que aparece U= "), writeln(ContU),
         write("Cantidad de veces que aparecen consonantes= "), writeln(Contador).

contar('', 0, 0, 0, 0, 0, 0).
contar(Pal, ContA, ContE, ContI, ContO, ContU, Contador):- sub_atom(Pal, 0, 1, _, 'a'), sub_atom(Pal, 1, _, 0, Sub), contar(Sub, A, ContE, ContI, ContO, ContU, Contador), ContA is A + 1.
contar(Pal, ContA, ContE, ContI, ContO, ContU, Contador):- sub_atom(Pal, 0, 1, _, 'e'), sub_atom(Pal, 1, _, 0, Sub), contar(Sub, ContA, E, ContI, ContO, ContU, Contador), ContE is E + 1.
contar(Pal, ContA, ContE, ContI, ContO, ContU, Contador):- sub_atom(Pal, 0, 1, _, 'i'), sub_atom(Pal, 1, _, 0, Sub), contar(Sub, ContA, ContE, I, ContO, ContU, Contador), ContI is I + 1.
contar(Pal, ContA, ContE, ContI, ContO, ContU, Contador):- sub_atom(Pal, 0, 1, _, 'o'), sub_atom(Pal, 1, _, 0, Sub), contar(Sub, ContA, ContE, ContI, O, ContU, Contador), ContO is O + 1.
contar(Pal, ContA, ContE, ContI, ContO, ContU, Contador):- sub_atom(Pal, 0, 1, _, 'u'), sub_atom(Pal, 1, _, 0, Sub), contar(Sub, ContA, ContE, ContI, ContO, U, Contador), ContU is U + 1.
contar(Pal, ContA, ContE, ContI, ContO, ContU, Contador):- sub_atom(Pal, 0, 1, _, C), C\=' ', C\='.', C\=',', C\=';', C\=':', sub_atom(Pal, 1, _, 0, Sub), contar(Sub, ContA, ContE, ContI, ContO, ContU, Cont), Contador is Cont + 1.
contar(Pal, ContA, ContE, ContI, ContO, ContU, Contador):- sub_atom(Pal, 1, _, 0, Sub), contar(Sub, ContA, ContE, ContI, ContO, ContU, Contador).


% CONSULTA
/*
?- inicio.
Ingrese una cadena:
|: 'esto es un mensaje de prueba'.
Cantidad de veces que aparece A= 2
Cantidad de veces que aparece E= 6
Cantidad de veces que aparece I= 0
Cantidad de veces que aparece O= 1
Cantidad de veces que aparece U= 2
Cantidad de veces que aparecen consonantes= 12
true .
*/