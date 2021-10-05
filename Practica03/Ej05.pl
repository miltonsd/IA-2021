inicio:- writeln('Ingrese una cadena: '), read(Cad), transformar(Cad, Lista), writeln(Lista).

transformar(Cad, [H|T]):- sub_atom(Cad, Pos, _, _, ' '), sub_atom(Cad, 0, Pos, _, H), Esp is Pos+1, sub_atom(Cad, Esp, _, 0, Sub), transformar(Sub, T).
transformar(Cad, [Cad]).


% CONSULTA
/*
?- inicio.
Ingrese una cadena:
|: 'Esto es una cadena de prueba'.
[Esto,es,una,cadena,de,prueba]
true.
*/