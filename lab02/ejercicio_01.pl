% Configuración
punto(inicio, 0, 5).
punto(p1, 2, 4).
punto(p2, 5, 6).
punto(p3, 8, 4).
punto(p4, 5, 0).
punto(meta, 10, 5).

alcance(4.0).

% Lógica de movimiento
distancia(P1, P2, D) :-
    punto(P1, X1, Y1),
    punto(P2, X2, Y2),
    D is sqrt((X2 - X1)^2 + (Y2 - Y1)^2).

puede_saltar(A, B) :-
    A \= B,
    alcance(Max),
    distancia(A, B, D),
    D =< Max.

% Buscador
resolver(Camino) :- 
    ruta(inicio, meta, [inicio], Camino).

ruta(Destino, Destino, _, [Destino]).
ruta(Actual, Destino, Visitados, [Actual|Resto]) :-
    puede_saltar(Actual, Siguiente),
    \+ member(Siguiente, Visitados),
    ruta(Siguiente, Destino, [Siguiente|Visitados], Resto).