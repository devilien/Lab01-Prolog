% Punto de entrada
reinas(Sol) :- buscar([], Sol).

% Si hay 8 reinas, terminamos
buscar(Qs, Qs) :- length(Qs, 8).

% Intentar colocar una reina en una fila (F) del 1 al 8
buscar(Actual, Sol) :-
    between(1, 8, F),
    \+ member(F, Actual),    % No repetir fila
    seguro(F, Actual, 1),    % No diagonales
    buscar([F|Actual], Sol).

% Validación de diagonales
seguro(_, [], _).
seguro(F, [F1|Fs], Dist) :-
    abs(F - F1) =\= Dist,
    D1 is Dist + 1,
    seguro(F, Fs, D1).