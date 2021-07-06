programa:-write('Ingrese el numero: '),read(N),
          suma(N,SumPar,SumImpar),
          write('Sumatoria numeros pares= '),writeln(SumPar),
          write('Sumatoria numeros impares= '),writeln(SumImpar).
      
suma(0,0,0).
suma(N,SumPar,SumImpar):-Anterior is N-1,
                         Resto is N mod 2,
                         Resto =:= 0,
                         suma(Anterior,SumatoriaPar,SumImpar),
                         SumPar is N + SumatoriaPar.
suma(N,SumPar,SumImpar):-Anterior is N-1,
                         Resto is N mod 2,
                         Resto =:= 1,
                         suma(Anterior,SumPar,SumatoriaImpar),
                         SumImpar is N + SumatoriaImpar.

% CONSULTAS
/*
?- programa.
Ingrese el numero: 8.
Sumatoria numeros pares= 20
Sumatoria numeros impares= 16
true .
*/