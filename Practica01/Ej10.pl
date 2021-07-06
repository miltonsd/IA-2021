% precedente(Tarea1,Tarea2)
precede(a,c).
precede(c,d).
precede(b,d).
precede(b,f).
precede(f,g).
precede(d,e).
precede(e,h).
precede(e,i).
precede(g,j).
precede(h,j).
precede(i,j).

% REGLA
requiere_de(X,Y):-precede(X,Y).
requiere_de(X,Y):-precede(Tarea,Y), requiere_de(X,Tarea).

% CONSULTAS
/*
?- requiere_de(a,c).
true .

?- requiere_de(a,e).
true .

?- requiere_de(a,f).
false.

?- requiere_de(a,j).
true .

?- requiere_de(b,i).
true .

?- requiere_de(c,j).
true .

?- requiere_de(d,g).
false.

?- requiere_de(e,j).
true .

?- requiere_de(Quien,d).
Quien = c ;
Quien = b ;
Quien = a ;
false.
*/