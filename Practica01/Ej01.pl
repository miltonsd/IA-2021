% HECHOS
observa(maria,omar).
observa(laura,omar).
observa(maria,flavio).
observa(gabriela,flavio).
observa(maria,carlos).

% CONSULTAS
/*
a. ?- observa(maria,flavio).
true .

b. ?- observa(maria,Quien).
Quien = omar ;
Quien = flavio ;
Quien = carlos.

c. ?- observa(maria,_).
true .

d. ?- observa(Quien,flavio).
Quien = maria ;
Quien = gabriela.

e. ?- observa(Quien1,Quien2).
Quien1 = maria,
Quien2 = omar ;
Quien1 = laura,
Quien2 = omar ;
Quien1 = maria,
Quien2 = flavio ;
Quien1 = gabriela,
Quien2 = flavio ;
Quien1 = maria,
Quien2 = carlos.

f. ?- observa(_,_).
true .
*/