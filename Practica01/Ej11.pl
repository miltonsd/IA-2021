programa:-write('Ingrese el numero: '),read(N),
          factorial(N,Fact),
          write('Factorial= '),writeln(Fact).
      
factorial(0,1).
factorial(N,Fact):-Anterior is N-1,
                   factorial(Anterior,Factorial),
                   Fact is N * Factorial.

% CONSULTAS
/*
?- programa.
Ingrese el numero: 5.
Factorial= 120
true .

?- programa.
Ingrese el numero: 3.
Factorial= 6
true .
*/