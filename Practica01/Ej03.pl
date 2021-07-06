% HECHOS
esta_en(brasil,grupo1).
esta_en(espana,grupo1).
esta_en(jamaica,grupo1).
esta_en(italia,grupo1).
esta_en(argentina,grupo2).
esta_en(nigeria,grupo2).
esta_en(holanda,grupo2).
esta_en(escocia,grupo2).

% REGLA
rivales(X,Y):-esta_en(X,Grupo), esta_en(Y,Grupo), X\=Y.

% CONSULTAS
/*
a. ?- rivales(argentina,brasil).
false.

b. ?- rivales(holanda,Quien).
Quien = argentina ;
Quien = nigeria ;
Quien = escocia.
*/