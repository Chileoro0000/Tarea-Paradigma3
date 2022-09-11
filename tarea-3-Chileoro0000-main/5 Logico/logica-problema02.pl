renta_liquida(gabriel, 30).
renta_liquida(samira, 22).
renta_liquida(catalina, 15).
renta_liquida(conztanza, 7).

edad(gabriel, 20).
edad(samira, 18).
edad(catalina, 40).
edad(conztanza, 15).

deudas(gabriel, 0).
deudas(samira, 1).
deudas(catalina, 0).
deudas(conztanza, 0).

nacionalidad(gabriel, chileno).
nacionalidad(samira, chileno).
nacionalidad(catalina, venezolana).
nacionalidad(conztanza, chileno).

reside(gabriel, chile).
reside(samira, paris).
reside(catalina, chile).
reside(conztanza, chile).

anos_antiguedad(gabriel, 1).
anos_antiguedad(samira, 1).
anos_antiguedad(catalina, 10).
anos_antiguedad(conztanza, 0).

tipo(gabriel, dependiente).
tipo(samira, independiente).
tipo(catalina, dependiente).
tipo(conztanza, independiente).

main:-
        consultar(gabriel),nl,
        consultar(conztanza),nl,
        consultar(catalina),nl,
        consultar(samira),nl,
        halt.

nacion(X):-
	nacionalidad(X, N), N = chileno; reside(X, Re), Re = chile.

caso2(X):-
	tipo(X, T), T = independiente, anos_antiguedad(X, A), A >= 2.

trabajo(X):-
	tipo(X, T), T = dependiente, anos_antiguedad(X, A), A >= 1; caso2(X).

consultar(X):-
	renta_liquida(X, R), R>=10, edad(X, E), E>=18, deudas(X, D), D=0,
	nacion(X), trabajo(X),write("Si aprueba."); write("No aprueba.").

:- main.
