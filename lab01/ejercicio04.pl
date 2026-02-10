% Casos base
distancia_total([], 0).
distancia_total([_], 0).

% Hechos: estudiante y su nota final en un curso
nota(ana, 4.5).
nota(luis, 2.8).
nota(maria, 3.7).
nota(juan, 5.0).
nota(pedro, 2.3).

% Reglas
reprueba(Estudiante) :-
    nota(Estudiante, N),
    N < 3.0.

aprueba(Estudiante) :-
    nota(Estudiante, N),
    N >= 3.0.

rango(Estudiante, Min, Max) :-
    nota(Estudiante, N),
    N >= Min,
    N =< Max.

clasificacion(Estudiante, Categoria) :-
    (rango(Estudiante, 0, 2.9), Categoria = "Reprobado");
    (rango(Estudiante, 3, 3.9), Categoria = "Aprobado");
    (rango(Estudiante, 4, 4.4), Categoria = "Notable");
    (rango(Estudiante, 4.5, 5), Categoria = "Excelente");

distancia((X1, Y1), (X2, Y2), D) :-
    D is sqrt((X2 - X1)*(X2 - X1) + (Y2 - Y1)*(Y2 - Y1)).

distancia_total([P1, P2 | Resto], Total) :-
    distancia(P1, P2, Distancia_Calculada),
    distancia_total([P2 | Resto], Acumulado),
    Total is Distancia_Calculada + Acumulado.