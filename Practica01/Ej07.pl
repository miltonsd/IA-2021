menu:-write('Ingrese el primer numero: '),read(N1),
      write('Ingrese el segundo numero: '),read(N2),
      writeln('¿Que operacion desea realizar?'),
      writeln('1 - Suma'),
      writeln('2 - Resta'),
      writeln('3 - Multiplicacion'),
      writeln('4 - Division'),
      writeln('5 - Salir'),
      read(Opc),
      Opc \= 5,
      opcion(Opc,N1,N2),
      menu.
menu:-writeln("Adios").

opcion(1,N1,N2):-Suma is N1 + N2,write('Total= '),writeln(Suma).
opcion(2,N1,N2):-Resta is N1 - N2,write('Total= '),writeln(Resta).
opcion(3,N1,N2):-Multiplicacion is N1 * N2,write('Total= '),writeln(Multiplicacion).
opcion(4,N1,N2):-Division is N1 / N2,write('Total= '),writeln(Division).

% CONSULTAS
/*
?- menu.
Ingrese el primer numero: 10.
Ingrese el segundo numero: |: 5.
Â¿Que operacion desea realizar?
1 - Suma
2 - Resta
3 - Multiplicacion
4 - Division
5 - Salir
|: 3.
Total= 50
Ingrese el primer numero: |: 2.
Ingrese el segundo numero: |: 3.
Â¿Que operacion desea realizar?
1 - Suma
2 - Resta
3 - Multiplicacion
4 - Division
5 - Salir
|: 2.
Total= -1
Ingrese el primer numero: |: 7.
Ingrese el segundo numero: |: 4.
Â¿Que operacion desea realizar?
1 - Suma
2 - Resta
3 - Multiplicacion
4 - Division
5 - Salir
|: 4.
Total= 1.75
Ingrese el primer numero: |: 12.
Ingrese el segundo numero: |: 6.
Â¿Que operacion desea realizar?
1 - Suma
2 - Resta
3 - Multiplicacion
4 - Division
5 - Salir
|: 1.
Total= 18
Ingrese el primer numero: |: 0.
Ingrese el segundo numero: |: 0.
Â¿Que operacion desea realizar?
1 - Suma
2 - Resta
3 - Multiplicacion
4 - Division
5 - Salir
|: 5.
Adios
true .
*/