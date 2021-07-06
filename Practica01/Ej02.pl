% HECHOS
conoce(franco,ingles).
conoce(renzo,ingles).
conoce(franco,frances).
conoce(renzo,frances).
conoce(franco,italiano).
conoce(marco,ingles).
conoce(omar,ingles).
conoce(maria,frances).

% REGLA DEFINIDA
habla_ingles_frances(X):-conoce(X,ingles), conoce(X,frances).

% CONSULTAS
/*
?- habla_ingles_frances(Quien).
Quien = franco ;
Quien = renzo ;
false.

?- habla_ingles_frances(franco).
true .

?- habla_ingles_frances(renzo).
true .

?- habla_ingles_frances(marco).
false.

?- habla_ingles_frances(omar).
false.

?- habla_ingles_frances(maria).
false.

?- habla_ingles_frances(_).
true .
*/