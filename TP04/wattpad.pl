:- dynamic(genero/2).
:- dynamic(lecturas/3).
:- dynamic(generoUsuario/2).
:- dynamic(listaCaracteristicaDeseadaUsuario/1).
:- dynamic(listaCaracteristicaNoDeseadaUsuario/1).
:- dynamic(lecturasRecomendadas/1).

limpiarPantalla :- write('\e[H\e[2J').

cargarBases :-
  retractall(genero(_,_)), 
  retractall(lecturas(_,_,_)),
  retractall(generoUsuario(_,_)),
  retractall(listaCaracteristicaDeseadaUsuario(_)),
  retractall(listaCaracteristicaNoDeseadaUsuario(_)),
  retractall(lecturasRecomendadas(_)),
  consult('db_generos.txt'), consult('db_lecturas.txt').

loginUsuario(Usuario) :-
  writeln("*** SISTEMA EXPERTO DE LECTURAS ***"), nl,
  writeln("Wattpad"),nl, nl,
  write(" POR FAVOR, INGRESA TU NOMBRE (en minusculas): "), read(Usuario),
  write("¡Bienvenido, "), write(Usuario), writeln(" a Wattpad!"), nl.

preferenciaUsuario :-
  write("¿Estas interesado en leer o escribir textos? [l/e]: "), read(Respuesta),
  validarPreferencia(Respuesta).

validarPreferencia(Respuesta) :-
  % Se ejecuta cuando la respuesta es 'e'. Finaliza el caso del Sistema Experto
  Respuesta = 'e',
  write("El sistema solo recomienda lecturas.").

validarPreferencia(Respuesta) :-
  % Se ejecuta cuando la respuesta es 'l'. Procede a validar los géneros.
  Respuesta = 'l',
  writeln("Responde las siguientes preguntas asi puedo recomendarte una lectura que se adapte a tus gustos."),
  validarGeneros.

validarPreferencia(_) :-
	% Se ejecuta cuando la respuesta no es 'e' ni 'l'
  writeln('La opcion que ingresaste es incorrecta.'),
  preferenciaUsuario.

validarGeneros :-
  % Pregunta al usuario si le interesa o no cada género de la BD
  genero(GeneroID,GeneroNombre),
  write("Te gustan las lecturas del tipo "), write(GeneroNombre), write("? [s/n]: "),
  read(GeneroRespuesta),
  clasificarGenero(GeneroID,GeneroRespuesta,GeneroNombre),
  validarGeneros.

validarGeneros :-
  % No hay mas géneros por ofrecer y el usuario seleccionó al menos uno
  generoUsuario(_,_),
  writeln("Esos son todos los generos de lectura que conozco."), nl,
  validarLecturas.

validarGeneros :-
  % No hay mas géneros por ofrecer y el usuario no selecciona ninguno
  not(generoUsuario(_,_)),
  writeln("Lamento mucho que no te gusten los generos que conozco.").

clasificarGenero(GeneroID,GeneroRespuesta,_) :-
  % Se ejecuta cuando la respuesta es 'n'. Elimina las lecturas con ese género
  GeneroRespuesta = 'n',
  retract(genero(GeneroID,_)),
  retractall(lecturas(_,GeneroID,_)).

clasificarGenero(GeneroID,GeneroRespuesta,GeneroNombre) :-
  % Se ejecuta cuando la respuesta es 's'. Agrega el género a los del usuario
  GeneroRespuesta = 's',
  retract(genero(GeneroID,_)),
  assert(generoUsuario(GeneroID,GeneroNombre)).

clasificarGenero(_,_,_).
  % Se ejecuta cuando la respuesta no es 's' ni 'n'

validarLecturas :-
  % Se ejecuta cuando ya todos los géneros fueron recorridos
  writeln("Ok, sigamos con las preguntas..!"), nl,
  writeln("Contame las caracteristicas que te interesan:"),
  explorarCaracteristicasDeLecturas.

explorarCaracteristicasDeLecturas :-
  lecturas(LecturasNombre,_,LecturasCaracteristicas),
  explorarCaracteristicas(LecturasNombre,LecturasCaracteristicas),
  explorarCaracteristicasDeLecturas.

explorarCaracteristicasDeLecturas :-
  % Se ejecuta cuando no hay mas lecturas
  recomendarLecturas.

explorarCaracteristicas(LecturasNombre,[]) :-
  % Si no hay mas características de una lectura, se agrega como sugerencia
  assert(lecturasRecomendadas(LecturasNombre)),
  retract(lecturas(LecturasNombre,_,_)).

explorarCaracteristicas(LecturasNombre,[CaracteristicasH|CaracteristicasT]) :-
  % La característica no se acepto ni rechazo. Se preguntara para categorizarla
  not(listaCaracteristicaDeseadaUsuario(CaracteristicasH)),
  not(listaCaracteristicaNoDeseadaUsuario(CaracteristicasH)),
  validarCaracteristica(CaracteristicasH),
  explorarCaracteristicas(LecturasNombre,CaracteristicasT).

explorarCaracteristicas(LecturasNombre,[CaracteristicasH|CaracteristicasT]) :-
  % La característica está en lista de recomendación, se exploran las restantes
  listaCaracteristicaDeseadaUsuario(CaracteristicasH),
  explorarCaracteristicas(LecturasNombre,CaracteristicasT).

explorarCaracteristicas(LecturasNombre,[CaracteristicasH|_]) :-
  % La característica está en lista de no recomendación, se descarta la lectura
  listaCaracteristicaNoDeseadaUsuario(CaracteristicasH),
  retract(lecturas(LecturasNombre,_,_)).

validarCaracteristica(LecturasCaracteristica) :-
  % Pregunta por la característica que aún no ha sido clasificada
  write("> ..."), write(LecturasCaracteristica), write("? [s/n]"),
  read(CaracteristicaDecision),
  clasificarCaracteristica(LecturasCaracteristica,CaracteristicaDecision).

clasificarCaracteristica(LecturasCaracteristica, 'n') :-
  % Pone la característica en lista de no recomendación y falla
  assert(listaCaracteristicaNoDeseadaUsuario(LecturasCaracteristica)),
  fail.

clasificarCaracteristica(LecturasCaracteristica, 's') :-
  % Pone la característica en lista de recomendación
  assert(listaCaracteristicaDeseadaUsuario(LecturasCaracteristica)).

clasificarCaracteristica(LecturasCaracteristica,CaracteristicaDecision) :-
  % Vuelve a pedir una decisión cuando se ingresa algo distinto de 's' o 'n'
  CaracteristicaDecision \= 'n', nl,
  writeln('La opcion que ingresaste es incorrecta'), nl,
  validarCaracteristica(LecturasCaracteristica).

recomendarLecturas :-
  % Se ejecuta cuando hay géneros seleccionados, pero no hay lecturas
  generoUsuario(_,_),
  not(lecturasRecomendadas(_)), nl,
  writeln("Lamentablemente no conozco lecturas que sean de tus gustos.").

recomendarLecturas :-
  % Se ejecuta si hay lecturas recomendadas
  nl, writeln("¡Encontre lecturas que se ajustan a tus gustos!"),
  writeln("Las lecturas son: "),nl,
  listarLecturasRecomendadas.

listarLecturasRecomendadas :-
  lecturasRecomendadas(LecturasNombre),
  write("- "), writeln(LecturasNombre),
  retract(lecturasRecomendadas(LecturasNombre)),
  listarLecturasRecomendadas.

listarLecturasRecomendadas.

logoutUsuario(Usuario) :-
  nl, write("Chau "), write(Usuario), write(", nos vemos.").

inicio :-
  limpiarPantalla, 
  cargarBases, 
  loginUsuario(Usuario), 
  preferenciaUsuario, 
  logoutUsuario(Usuario).