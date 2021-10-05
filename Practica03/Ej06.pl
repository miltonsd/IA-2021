inicio:- writeln('Ingrese un numero entero: '), read(Nro), transformar(Nro, Binario), reverse(Binario, NroBin), writeln(NroBin).

transformar(0, []).
transformar(Nro, [H|T]):- H is Nro mod 2, Numero is Nro // 2, transformar(Numero, T). 


% CONSULTA
/*
?- inicio.
Ingrese un numero entero:
|: 16.
[1,0,0,0,0]
true .
*/