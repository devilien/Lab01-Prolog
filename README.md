# Laboratorio 02 - Busquedas en Prolog  

## 📌 Descripción  
Este laboratorio tiene como objetivo que los estudiantes fortalezcan sus conocimientos relacionados a algoritmos de busqueda en **Prolog**.

El desarrollo se realizará en **[SWISH Prolog](https://swish.swi-prolog.org/)**, un entorno en línea que no requiere instalación local.  

---

## 🛠️ Instrucciones Generales  

1. **Fork del repositorio**  
   - Realice un **fork** de este repositorio en su cuenta personal de GitHub.  
   - No realice cambios directamente sobre el repositorio original.  

2. **Estructura de carpetas**  
   - Dentro de su fork, cree una carpeta llamada **`lab02/`**.  
   - Cada ejercicio debe resolverse en un archivo **independiente** con el siguiente formato:  
     ```
     lab02/ejercicio01.pl
     lab02/ejercicio02.pl
     ...
     ```  

3. **Resolución de ejercicios**  
   - Desarrolle los programas en **SWISH Prolog**.  
   - Una vez finalizados, copie el código a los archivos `.pl` correspondientes en su repositorio.  
   - Cada archivo debe contener:
     - La implementación de su solución.  

4. **Buenas prácticas**  
   - Use **nombres de predicados claros y significativos**.
---

## 🚀 Entrega  

- **Plazo**: La entrega debe realizarse a mas tardar el proximo lunes, se habilitara una tarea en Moodle para adjuntar el link del repositorio.

---

## ✅ Criterios de Evaluación  

1. **Correctitud de las soluciones** (funcionalidad de los predicados).  
2. **Cumplimiento de la estructura solicitada** (archivos independientes en `lab01/`).  
3. **Claridad en la codificación** (nombres, comentarios y legibilidad).  
4. **Uso adecuado de variables** (incluyendo variables anónimas donde corresponda).  

---

## 💡 Recomendaciones  

- Revise la documentación oficial de Prolog: [SWI-Prolog Documentation](https://www.swi-prolog.org/pldoc/).  
- Antes de subir sus archivos, **ejecute y verifique** cada consulta en SWISH.  
- Mantenga su repositorio organizado y actualizado.

---

## Ejercicio 1 - Problema de la rana

Un problema bien conocido es aquel de la rana donde dados un punto de inicio junto con otros puntos que representan la ubicación de una serie de piedras se quiere determinar si una rana la cual tiene
una capacidad maxima de salto puede llegar a un punto objetivo.

Para este problema se tienen los siguientes hechos.

```
% --- HECHOS Y CAPACIDADES (PARÁMETROS DEL PROBLEMA) ---

% Coordenadas de las ubicaciones: ubicacion(ID, X, Y).
ubicacion(orilla_inicial, 0, 5).
ubicacion(piedra1, 2, 4).
ubicacion(piedra2, 5, 6).
ubicacion(piedra3, 8, 4).
ubicacion(piedra4, 5, 0).
ubicacion(orilla_final, 10, 5).

% Capacidad de la rana: distancia máxima de salto.
salto_maximo(4.0).
```

Usando el algoritmo generico de DFS visto en clase, poder determinar si la rana puede llegar de la `orilla_inicial` a la `orilla_final`.

Definir la regla `siguiente_estado/2`, que determine si es posible pasar de un estado a otro, esta puede definirse así, donde consultado `ubicacion` para `LugarActual`, se obtienen las ubicaciones.

```
siguiente_estado(pos(LugarActual), pos(LugarSiguiente))
```

Asi se puede iniciar la busqueda en el espacio de soluciones.

```
buscar_solucion(Solucion) :-
    EstadoInicial = pos(orilla_inicial),
    dfs(EstadoInicial, [EstadoInicial], Solucion). %dfs(Estado,Visitados, Solucion)
```

---

## Ejercicio 2 - Problema de Batman vs Villanos

Se tiene un problema donde dados una lista de poderes y su respectivo daño, asi como el costo asociado a usar este, junto con una lista de villanos con sus puntos de vida, y una lista de sus debilidades a poderes.

Se quiere encontrar si batman es capaz de derrotarlos teniendo este una cantidad de energia que se agota al usar cada poder, asi como la condicion de que puede omitir el uso de un poder e intentar usar otro contra el mismo villano.

Para este problema se tienen los siguientes hechos.

Aqui se tiene por ejemplo el poder logica que hace 100 de daño, y usa 10 de energia, y se tiene el villano riddler que tiene 90 de salud y es debil a logica y sigilo.

```
power_list([
    power(logica, 100, 10),
    power(sigilo, 150, 30),
    power(fuerza, 250, 50)
]).

villain_list([
    villain(riddler, 90, [logica, sigilo]),
    villain(bane, 240, [fuerza])
]).
```

Usando el algoritmo DFS visto en clase, poder determinar si batman puede derrotar a todos los villanos con la energia disponible o no.

Asi se puede iniciar la busqueda en el espacio de soluciones.

```
batman_can_win(EnergiaMaxima) :-
    power_list(Superpoderes),
    villain_list(Villanos),
    % El estado inicial contiene todos los villanos, todos los poderes y la energía máxima.
    EstadoInicial = estado(Villanos, Superpoderes, EnergiaMaxima),
    dfs(EstadoInicial, [EstadoInicial]). %dfs(Estado,Visitados)
```

---

## Ejercicio 3 - 8 reinas

Se quiere resolver el problema de las [8 reinas](https://es.wikipedia.org/wiki/Problema_de_las_ocho_reinas) usanado DFS, donde un estado se puede entender como una lista donde cada elemento representa
la fila en la que esta esa reina, es decir [4,3] dice que en hay reinas en la columna 1, fila 4, y columna 2, fila 3.

Asi se puede definir la regla de dfs para solo tener en cuenta la solucion final y no todo el camino.

```
dfs(EstadoActual, Visitados, SolucionFinal)
```

Asi se puede iniciar la busqueda en el espacio de soluciones.

```
solucion(Solucion) :-
    EstadoInicial = [],
    dfs(EstadoInicial, [EstadoInicial], Solucion).
```

---


## Retrospectiva
1. ¿Cuál fue el tiempo total invertido en el laboratorio por cada uno de ustedes? (Horas/Hombre)
2. ¿Cuál es el estado actual del laboratorio? ¿Por qué?
3. ¿Cuál consideran fue el mayor logro? ¿Por qué?
4. ¿Cuál consideran que fue el mayor problema técnico? ¿Qué hicieron para resolverlo?
5. ¿Qué hicieron bien como equipo? ¿Qué se comprometen a hacer para mejorar los resultados?
6. ¿Qué referencias usaron? ¿Cuál fue la más útil? Incluyan citas con estándares adecuados.

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


