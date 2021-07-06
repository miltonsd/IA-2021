programa:-write('Ingrese el numero: '),read(N),
          suma(N,Sum),
          write('Sumatoria= '),writeln(Sum).
      
suma(0,0).
suma(N,Sum):-Anterior is N-1,
             suma(Anterior,Sumatoria),
             Sum is N + Sumatoria.

% CONSULTAS
/*
?- programa.
Ingrese el numero: 5.
Sumatoria= 15
true .
*/