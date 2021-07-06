% horoscopo(Signo,DiaInicio,MesIni,DiaFin,MesFin).
horoscopo(aries,21,3,20,4).
horoscopo(tauro,21,4,20,5).
horoscopo(geminis,21,5,21,6).
horoscopo(cancer,22,6,22,7).
horoscopo(leo,23,7,22,8).
horoscopo(virgo,23,8,22,9).
horoscopo(libra,23,9,22,10).
horoscopo(escorpio,23,10,22,11).
horoscopo(sagitario,23,11,21,12).
horoscopo(capricornio,22,12,20,1).
horoscopo(acuario,21,1,18,2).
horoscopo(piscis,19,2,20,3).

% REGLA
signo(Dia,Mes,Signo):-horoscopo(Signo,DiaInicio,MesInicio,_,_),
                      Mes=:=MesInicio,Dia>=DiaInicio.
signo(Dia,Mes,Signo):-horoscopo(Signo,_,_,DiaFin,MesFin),
                      Mes=:=MesFin,Dia=<DiaFin.

% CONSULTAS
/*
a. ?- signo(3,5,tauro).
true.

?- signo(23,4,aries).
false.

b. ?- signo(16,12,Signo).
Signo = sagitario .

?- signo(7,4,Signo).
Signo = aries .
*/