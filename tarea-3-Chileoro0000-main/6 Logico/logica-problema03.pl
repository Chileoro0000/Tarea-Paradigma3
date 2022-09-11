paper(['Dijkstra', 'Scholten']).
paper(['Dijkstra', 'Martin', 'Lamport', 'Scholten']).
paper(['Dijkstra', 'Feijen']).
paper(['Feijen', 'Boyer']).
paper(['Hunt', 'Boyer']).
paper(['Hunt', 'Ramanathan']).
paper(['Kaufmann', 'Moore', 'Boyer']).
paper(['Boyer', 'Hinton']).
paper(['LeCun', 'Bengio', 'Hinton']).
paper(['Bengio', 'Santoro']).
paper(['Ruml', 'Lecun']).
paper(['Maning', 'Santoro']).
paper(['Maning', 'LeCun']).
goal('Dijkstra'). %es el inicio del camino.

main:-
        solucion('LeCun', R),nl,
        halt.

sacar(P, R):- paper(X),member(P, X), ultimo(R, X).

ultimo(X,[X]). %Obtiene el ultimo valor de la lista
ultimo(X, [_|Y]) :- ultimo(X, Y).

solucion(Nodo, S):- %comienza a generar la busqueda
    busqueda([], Nodo, S).

busqueda(Lista, Nodo, [Nodo|Lista]):-
    goal(Nodo). %ve si el nodo es el destino es decir dijkstra

busqueda(Lista, Nodo, Sol):-
    sacar(Nodo, R), %saca el nodo de la lista
    not(member(Nodo, Lista)), %ve si es miembro del camino recorrido
    busqueda([Nodo|Lista], R, Sol). %avanza al siguiente recursivamente

:- main.
