# EJERCICIOS LABORATORIO 1

## Ejercicio 1 - Hechos y consultas simples

Dada la siguiente base de conocimiento
```
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

```

Responde:

1. ¿Existe un vuelo directo de Bogotá a Medellín?.
2. ¿Qué destinos se pueden alcanzar directamente desde Bogotá?.
3. ¿Desde que destinos se puede alcanzar Medellin?
4. ¿Hay alguna forma de llegar directamente a cali?

## Ejercicio 2 - Reglas basicas

Dada la base de conocimiento de vuelos, define una regla que:

- Determine si dos ciudades están conectadas mediante una escala.
     - Ahora, verifica si existe una conexión de Bogotá a Barranquilla.
- Encuentra todas las ciudades a las que se puede llegar desde Cali con una escala.
- Define una regla viaje que sea cierta si existe un vuelo directo o con una escala entre dos ciudades (no usar recursion).
   - Ahora, verifica si existe un viaje posible de Bogotá a Pasto.

- Define una regla destinos que devuelva todos los destinos alcanzables directamente desde una ciudad.

---

Dada la base de conocimiento.

```
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
```

Responde:

- Define una regla que determine si una persona tiene un perro.
   - Ahora, encuentra los dueños de perros.
- Define una regla que determine si una persona tiene un gato.
   - Ahora, encuentra los dueños de gatos.
- Define una regla que determine si una persona tiene multiples mascotas.
   - Ahora, encuentra los dueños de multiple tipos de mascota.
- Define una regla amante_animales para identificar dueños que tienen tanto perro como gato.
- Define una regla mascota_compartida que indique si dos personas comparten mascota.
- Define una regla tipo_mascota que asocie una persona con el tipo de mascota que tiene (perro, gato, ave, etc.).

---

## Ejercicio 3 - Predicados con condiciones aritméticas

Dada la base de conocimientos

```
% Hechos: estudiante y su nota final en un curso
nota(ana, 4.5).
nota(luis, 2.8).
nota(maria, 3.7).
nota(juan, 5.0).
nota(pedro, 2.3).
```

Responde:

- Define una regla reprueba, que sea cierta si un estudiante tiene menor a 3.0.
- Define una regla aprueba, que sea cierta si un estudiante tiene nota mayor o igual a 3.0.
- Define una regla rango, donde rango(X, Min, Max) sea cierto si la nota de un estudiante X está entre Min y Max.
- Define una regla clasificacion que asigne una categoría a cada estudiante según la nota:

   - 0.0 – 2.9 → reprobado
   - 3.0 – 3.9 → aprobado
   - 4.0 – 4.4 → notable
   - 4.5 – 5.0 → excelente

- Define la regla distancia((X1, Y1), (X2, Y2), D), que calcule la distantia euclidiana entre dos puntos

Ahora teniendo en cuenta estos casos base.

```
% Caso base: lista vacía o con un solo punto -> distancia 0
distancia_total([], 0).
distancia_total([_], 0).
```

- Define la regla 

distancia_total([P1, P2 | Resto], Total), que calcule la suma de distancias entre una lista puntos.

## Ejercio 4 - Recursion simple

Serie de Fibonacci

La serie de Fibonacci se define así:

- fib(0) = 0
- fib(1) = 1
- fib(N) = fib(N-1) + fib(N-2), para N > 1

``
0, 1, 2, 3, 5 , 8, 13
``

Define la regla fibonacci(X, N), donde X el el numero_x de la serie de fibonacci y F el valor correspondiente de la serie, uso de "is" para asignar valores a variables.

## Ejercicio 5 - 4 color problem

Dado el problema.

Find an "admissible" coloring of a map such that all adjacent countries have different colors. It had been conjectured for a long time that such a coloring is possible with only 4 colors. This conjecture was formulated precisely by F. Guthrie already in 1852, but proved by K. Appel und W. Haken only in 1976 using a computer program.

Escribe un programa que encuentre todas las soluciones validas del mapa usando 4 colores, azul, amarillo, rojo, verde.

![img](mapa_4colors.png)

```
color(red).
color(blue).
color(yellow).
color(green).

map(A, B, C, D, E) :-
    adjacent(A, B), adjacent(A, D), adjacent(A, E),
    adjacent(B, C), adjacent(B, D), adjacent(B, E),
    adjacent(C, D), adjacent(C, E),
    adjacent(D, E).
```
Faltaria definir la regla adjacent la cual valide la adyacencia valida.

## Ejercicio 6 - Listas

En Prolog, las listas se representan con corchetes:

* Lista vacía: []
* Lista con elementos: [a, b, c]

Se puede descomponer en cabeza y cola: [Cabeza | Cola]

```
?- [H|T] = [1,2,3,4].
H = 1,
T = [2,3,4].
```

```
?- [H|T] = [1].
H = 1,
T = [].
```

Ejercicios:
- Escribe una regla que verifique si un elemento es miembro de una lista.
- Escribe una regla "longitud" que dada una lista, calcule su longitud.
- Escribe una regla "concatena" que dadas dos listas, las concatene en otra.
- Escribe una regla que permite obtener en una lista los N elementos de las serie de fibonacci, usa la regla predifina append(L1,L2,L3), que concatena L1 y L2, en L3.
- Escribe una regla que determine el reverso de una lista.
- Escribe una regla que determine si una lista es palindroma.


