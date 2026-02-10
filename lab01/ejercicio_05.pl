% casos base

fibonacci(0, 0).
fibonacci(1, 1).

% regla

fibonacci(N, F) :-
    N > 1,
    X1 is N - 1,
    X2 is N - 2,
    fibonacci(X1, F1),
    fibonacci(X2, F2),
    F is F1 + F2