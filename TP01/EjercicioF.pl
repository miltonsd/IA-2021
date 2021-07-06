% HECHOS

viaje(ciudad1, ciudad2).
viaje(ciudad1, ciudad6).
viaje(ciudad3, ciudad4).
viaje(ciudad3, ciudad5).
viaje(ciudad5, ciudad4).
viaje(ciudad5, ciudad7).
viaje(ciudad6, ciudad7).
viaje(ciudad6, ciudad8).
viaje(ciudad7, ciudad6).


% REGLA

conexion(A,B):-viaje(A,B).
conexion(A,B):-viaje(A,X), conexion(X,B).