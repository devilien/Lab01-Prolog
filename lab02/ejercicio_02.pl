poderes([
    p(logica, 100, 10),
    p(sigilo, 150, 30),
    p(fuerza, 250, 50)
]).

villanos([
    v(riddler, 90, [logica, sigilo]),
    v(bane, 240, [fuerza])
]).

% Simulación de combate
combate([], _, E) :- 
    format('Victoria. Energía final: ~w~n', [E]).

combate([v(NombreV, HP, Debs)|Resto], ListaP, E) :-
    member(p(Poder, Dmg, Costo), ListaP),
    member(Poder, Debs), % El villano es débil a este poder
    Dmg >= HP,           % El poder tiene fuerza suficiente
    E >= Costo,          % Batman tiene energía
    NuevaE is E - Costo,
    combate(Resto, ListaP, NuevaE).

% Punto de entrada
batman(Energia) :-
    poderes(Ps),
    villanos(Vs),
    combate(Vs, Ps, Energia).