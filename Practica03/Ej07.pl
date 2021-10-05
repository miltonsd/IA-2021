inicio:- writeln('Ingrese una palabra: '), read(Palabra), reconocer(Palabra, ContA, ContB), ContA = ContB.

reconocer('', 0, 0).
reconocer(Palabra, ContA, ContB):- sub_atom(Palabra, 0, 1, _, 'a'), sub_atom(Palabra, 1, _, 0, Sub), reconocer(Sub, A, ContB), ContA is A + 1.
reconocer(Palabra, ContA, ContB):- sub_atom(Palabra, 0, 1, _, 'b'), sub_atom(Palabra, 1, _, 0, Sub), reconocer(Sub, ContA, B), ContB is B + 1.


% CONSULTAS
/*
?- inicio.
Ingrese una palabra:
|: 'aaabbb'.
true .

?- inicio.
Ingrese una palabra:
|: 'aaab'.
false.

?- inicio.
Ingrese una palabra:
|: 'casa'.
false.
*/