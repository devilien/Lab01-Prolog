color(red).
color(blue).
color(yellow).
color(green).

adjacent(V1, V2) :-
    color(V1),
    color(V2),
    V1 \= V2.

map(A, B, C, D, E) :-
    adjacent(A, B), adjacent(A, D), adjacent(A, E),
    adjacent(B, C), adjacent(B, D), adjacent(B, E),
    adjacent(C, D), adjacent(C, E),
    adjacent(D, E).