% vive_en(persona, ciudad)
vive_en(carolina,rosario).
vive_en(jose,rosario).
vive_en(miguel,funes).
vive_en(mariano,rosario).
vive_en(silvia,funes).
vive_en(eduardo,roldan).
vive_en(diego,casilda).
vive_en(laura,rosario).
vive_en(mauro,funes).

% es(persona, rol)
es(carolina,guitarrista).
es(jose,guitarrista).
es(miguel,guitarrista).
es(mariano,cantante).
es(silvia,cantante).
es(eduardo,baterista).
es(diego,baterista).
es(laura,baterista).
es(mauro,cantante).

% REGLA
forma_banda(Ciudad):-vive_en(A,Ciudad), es(A,guitarrista),
                     vive_en(B,Ciudad), es(B,cantante),
                     vive_en(C,Ciudad), es(C,baterista).

% CONSULTAS
/*
?- forma_banda(rosario).
true .

?- forma_banda(Donde).
Donde = rosario ;
Donde = rosario ;
false.

?- forma_banda(_).
true .

?- forma_banda(funes).
false.

?- forma_banda(casilda).
false.

?- forma_banda(roldan).
false.
*/