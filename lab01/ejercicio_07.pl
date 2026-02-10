miembro_de_lista(X, [X|_]).

miembro_de_lista(X, [_|Cola]) :- 
    miembro(X, Cola).

longitud([], 0).

longitud([_|Cola], Cuenta) :- 
    longitud(Cola, SubCuenta),
    Cuenta is SubCuenta + 1.

concatena([], Lista2, Lista2).

concatena([X|Cola1], Lista2, [X|Resto]) :-
    concatena(Cola1, Lista2, Resto).

fibonacci(0, 0, [0]).
fibonacci(1, 1, [1, 0]).

fibonacci(N, F, [F | Resto1]) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, F1, Resto1),
    fibonacci(N2, F2, _),
    F is F1 + F2.

reversa_acumulada([], Acumulador, Acumulador).

reversa_acumulada([X|Resto], Acumulador, Resultado) :-
    reversa_acumulada(Resto, [X|Acumulador], Resultado).

reversa(Lista, Resultado) :- 
    reversa_acumulada(Lista, [], Resultado).

palindromo(Lista) :-
    reversa(Lista, Lista).