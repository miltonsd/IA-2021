inicio:- writeln('Ingrese una cadena: '), read(Cad), transformar(Cad, Lista), writeln(Lista).

transformar(Cad, [H|T]):- sub_atom(Cad, 0, 1, _, H), H\=[], sub_atom(Cad, 1, _, 0, Sub), transformar(Sub, T).
transformar('', []). 


% CONSULTA
/*
?- inicio.
Ingrese una cadena:
|: 'Esto es una cadena de prueba'.
[E,s,t,o, ,e,s, ,u,n,a, ,c,a,d,e,n,a, ,d,e, ,p,r,u,e,b,a]
true.
*/