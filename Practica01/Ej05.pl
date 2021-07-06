% auto(patente,propietario)
auto(hti687,pedro).
auto(jug144,juan).
auto(gqm758,pedro).
auto(lod445,carlos).
auto(lfz569,miguel).
auto(axk798,maria).

% deuda(patente, monto adeudado)
deuda(lfz569,2000).
deuda(gqm758,15000).
deuda(axk798,1000).

% REGLA
es_deudor(X):-auto(Patente,X), deuda(Patente,_).

% CONSULTAS
/*
?- es_deudor(_).
true .

?- es_deudor(pedro).
true.

?- es_deudor(carlos).
false.

?- es_deudor(Quien).
Quien = pedro ;
Quien = miguel ;
Quien = maria.
*/