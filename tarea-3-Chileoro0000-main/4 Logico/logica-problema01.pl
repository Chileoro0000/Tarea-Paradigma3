pareja(omar, jenny).
pareja(jimmy, natalie).
pareja(bob, linda).

padre(omar, mauro).
padre(omar, javier).
padre(omar, florencia).
padre(jimmy, andy).
padre(jimmy, ollie).
padre(bob, gene).
padre(bob, louise).
padre(bob, tina).

madre(jenny, mauro).
madre(jenny, javier).
madre(jenny, florencia).
madre(natalie, andy).
madre(natalie, ollie).
madre(linda, gene).
madre(linda, louise).
madre(linda, tina).

familia(jenny, pacheco).
familia(omar, pacheco).
familia(mauro, pacheco).
familia(javier, pacheco).
familia(florencia, pacheco).
familia(jimmy, pesto).
familia(natalie, pesto).
familia(ollie, pesto).
familia(andy, pesto).
familia(bob, belcher).
familia(linda, belcher).
familia(gene, belcher).
familia(louise, belcher).
familia(tina, belcher).

casa(maipu, pacheco).
casa(deesa, belcher).
casa(concepcion, pesto).

amistad(pacheco, belcher).
amistad(belcher, pacheco).

enemigos(pacheco, pesto).
enemigos(pesto, pacheco).
enemigos(belcher, pesto).
enemigos(pesto, belcher).

mascota(sushi, pacheco).
mascota(maeve, pacheco).
mascota(0, belcher).
mascota(0, pesto).

hermanos(X,Y):-padre(Z,X),padre(Z,Y),not(X=Y).


main:-
        todos_los_hijos(bob),nl, %Imprime todos los hijos de bob
        la_madre_de(louise),nl, %Imprime la madre de luise
        todos_las_mascotas(pacheco),nl, %imprime todas las mascostas de la familia pacheco
        padres(florencia),nl, %Imprime la madre y padre de florencia
        parentesco(mauro, javier),nl, %imprimera la relacion que tienen en parentesco
        parentesco(bob, gene),nl, %imprimera la relacion que tienen en parentesco
        relacionesFamiliares(belcher, pacheco),nl, %Imprime la relacion que tienen esas familias
        relacionesFamiliares(belcher, pesto),nl, %Imprime la relacion que tienen esas familias
        halt.

todos_los_hijos(PADRE) :- 
    forall( padre(PADRE, X), (write(X), write(", ")) ) .

el_padre_de(HIJO):-
    padre(P, HIJO), write("El padre de "), write(HIJO), write(" es "), write(P).

la_madre_de(HIJO):-
    madre(M, HIJO), write("La madre de "), write(HIJO), write(" es "), write(M).

predecesor(X):-
    padre(X, H)->
        write("El/Los predecesor/es de "), write(X), write(" es/son "), todos_los_hijos(X), nl,
        predecesor(H).

todos_las_mascotas(FAMILIA) :- 
    forall(mascota(X, FAMILIA), (write(X), write(", "))).

padres(HIJO):-
    el_padre_de(HIJO), write(" y ") ,la_madre_de(HIJO).
    
parentesco(P1, P2):-
    padre(P1, P2), write("Padre e hijo"); padre(P2, P1), write("Hijo y padre"), madre(P1, P2), write("Madre e hijo"); madre(P2, P1), write("Hijo y madre")
    , hermanos(P1, P2), write("No tienen parentesco"); write("Son hermanos").
    
relacionesFamiliares(F1, F2):-
    amistad(F1, F2), write("Son amiguis"); write("Son enemigos chan chan chaaaan").

informacion_familiar(X):- 
    familia(X,F),write(X), write(' es de la familia de los '), write(F), write("que viven en "), 
    casa(C, F), write(C), write(", ademas la familia es dueña de "), todos_las_mascotas(F), write("mascotas").

:- main.
