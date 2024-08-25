# Vacaciones

Llegó el momento de armar las valijas y emprender el hermoso viaje... de programar en Lógico! Necesitamos modelar la información que se detalla a continuación.

## Punto 1: El destino es así, lo se... (2 puntos)

Sabemos que Dodain se va a Pehuenia, San Martín (de los Andes), Esquel, Sarmiento, Camarones y Playas Doradas. Alf, en cambio, se va a Bariloche, San Martín de los Andes y El Bolsón. Nico se va a Mar del Plata, como siempre. Y Vale se va para Calafate y El Bolsón.

- Además Martu se va donde vayan Nico y Alf.
- Juan no sabe si va a ir a Villa Gesell o a Federación
- Carlos no se va a tomar vacaciones por ahora

Se pide que defina los predicados correspondientes, y justifique sus decisiones en base a conceptos vistos en la cursada.

## Punto 2: Vacaciones copadas (4 puntos)

Incorporamos ahora información sobre las atracciones de cada lugar. Las atracciones se dividen en

- un parque nacional, donde sabemos su nombre
- un cerro, sabemos su nombre y la altura
- un cuerpo de agua (cuerpoAgua, río, laguna, arroyo), sabemos si se puede pescar y la temperatura promedio del agua
- una playa: tenemos la diferencia promedio de marea baja y alta
- una excursión: sabemos su nombre

**Agregue hechos a la base de conocimientos de ejemplo para dejar en claro cómo modelaría las atracciones**. Por ejemplo: Esquel tiene como atracciones un parque nacional (Los Alerces) y dos excursiones (Trochita y Trevelin). Villa Pehuenia tiene como atracciones un cerro (Batea Mahuida de 2.000 m) y dos cuerpos de agua (Moquehue, donde se puede pescar y tiene 14 grados de temperatura promedio y Aluminé, donde se puede pescar y tiene 19 grados de temperatura promedio).

Queremos saber qué vacaciones fueron copadas para una persona. Esto ocurre cuando todos los lugares a visitar tienen por lo menos una atracción copada.

- un cerro es copado si tiene más de 2000 metros
- un cuerpoAgua es copado si se puede pescar o la temperatura es mayor a 20
- una playa es copada si la diferencia de mareas es menor a 5
- una excursión que tenga más de 7 letras es copado
- cualquier parque nacional es copado

El predicado debe ser inversible.

## Punto 3: Ni se me cruzó por la cabeza (2 puntos)

Cuando dos personas distintas no coinciden en ningún lugar como destino decimos que no se cruzaron. Por ejemplo, Dodain no se cruzó con Nico ni con Vale (sí con Alf en San Martín de los Andes). Vale no se cruzó con Dodain ni con Nico (sí con Alf en El Bolsón). El predicado debe ser completamente inversible.

## Punto 4: Vacaciones gasoleras (2 puntos)

Incorporamos el costo de vida de cada destino:

| Destino | Costo de vida |
|---------|---------------|
| Sarmiento | 100 |
| Esquel | 150 |
| Pehuenia | 180 |
| San Martín de los Andes | 150 |
| Camarones | 135 |
| Playas Doradas | 170 |
| Bariloche | 140 |
| El Calafate | 240 |
| El Bolsón | 145 |
| Mar del Plata | 140 |

Queremos saber si unas vacaciones fueron gasoleras para una persona. Esto ocurre si todos los destinos son gasoleros, es decir, tienen un costo de vida menor a 160. Alf, Nico y Martu hicieron vacaciones gasoleras.

El predicado debe ser inversible.

## Punto 5: Itinerarios posibles (3 puntos)

Queremos conocer todas las formas de armar el itinerario de un viaje para una persona sin importar el recorrido. **Para eso todos los destinos tienen que aparecer en la solución** (no pueden quedar destinos sin visitar).

Por ejemplo, para Alf las opciones son
[bariloche, sanMartin, elBolson]
[bariloche, elBolson, sanMartin]
[sanMartin, bariloche, elBolson]
[sanMartin, elBolson, bariloche]
[elBolson, bariloche, sanMartin]
[elBolson, sanMartin, bariloche]

(claramente no es lo mismo ir primero a El Bolsón y después a Bariloche que primero a Bariloche y luego a El Bolsón, pero el itinerario tiene que incluir los 3 destinos a los que quiere ir Alf).
