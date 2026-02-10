% Hechos: relación entre ciudades
ciudad(bogota).
ciudad(medellin).
ciudad(cali).
ciudad(cartagena).
ciudad(manizales).
ciudad(barranquilla).
ciudad(pasto).
ciudad(monteria).

% Hechos: vuelos directos
vuelo(bogota, medellin).
vuelo(medellin, cartagena).
vuelo(cali, bogota).
vuelo(bogota, cartagena).
vuelo(manizales, cartagena).
vuelo(medellin, barranquilla).
vuelo(pasto, bogota).
vuelo(bogota, pasto).

% Reglas
conexion_escala(X, Y) :- 
    vuelo(X, Z), 
    vuelo(Z, Y).

viaje(X, Y) :- vuelo(X, Y).
viaje(X, Y) :- conexion_escala(X, Y).

destinos(Origen, Destino) :- 
    vuelo(Origen, Destino).