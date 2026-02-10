perro(firulais).
perro(bruno).
perro(max).
gato(misu).
gato(luna).
gato(chanel).
gato(orion).
ave(piolin).

dueno(ana, firulais).
dueno(ana, misu).
dueno(luis, luna).
dueno(luis, orion).
dueno(luis, firulais).
dueno(maria, piolin).
dueno(julia, chanel).
dueno(pedro, bruno).

tiene_perro(Nombre) :- 
    dueno(Nombre, Mascota),
    perro(Mascota).

tiene_gato(Nombre) :- 
    dueno(Nombre, Mascota),
    gato(Mascota).

tiene_mascota(Nombre) :- 
    dueno(Nombre, Mascota),
    (gato(Mascota); ave(Mascota); perro(Mascota)).

amante_animales(Nombre) :-
    tiene_perro(Nombre),
    tiene_gato(Nombre).

mascota_compartida(Persona1, Persona2) :-
    Persona1 \= Persona2,
    dueno(Persona1, Mascota),
    dueno(Persona2, Mascota).

tipo_mascota(Nombre, Tipo) :-
    dueno(Nombre, Mascota),
    ((perro(Mascota), Tipo = perro);
    (gato(Mascota), Tipo = gato);
    (ave(Mascota), Tipo = ave)).

% tiene_perro(Persona).
% ana, luis, pedro

% tiene_gato(Persona).
% ana, luis, julia

% tiene_mascota(Persona).
% ana, luis, maria, julia, pedro