% Dodain se va a Pehuenia, San Martín (de los Andes), Esquel, Sarmiento, Camarones y Playas Doradas
destino(dodain, pehuenia).
destino(dodain, sanMartin).
destino(dodain, esquel).
destino(dodain, sarmiento).
destino(dodain, camarones).
destino(dodain, playasDoradas).
% Alf, en cambio, se va a Bariloche, San Martín de los Andes y El Bolsón.
destino(alf, bariloche).
destino(alf, sanMartin).
destino(alf, elBolson).
% Nico se va a Mar del Plata
destino(nico, marDelPlata).
% Vale se va para Calafate y El Bolsón.
destino(vale, calafate).
destino(vale, elBolson).
% Martu se va donde vayan Nico y Alf.
destino(martu, Lugar) :- destino(nico, Lugar).
destino(martu, Lugar) :- destino(alf, Lugar).

% Como juan no sabe si va a ir a villaGessel o a federacion, todavia no puedo representarlo con un hecho, ya que esto confirmaria que se va a alguno
% de los dos destinos. Por lo que si no sabemos cual es el hecho todavia, entonces los suponemos falso y no lo agregamos ya que prolog trabaja con el
% principio de universo cerrado y todo lo que no escribamos lo presupone falso. Lo mismo con carlos que no va a tomar vacaciones, simplemente no lo
% escribimos y prolog toma como falso que carlos se va a algun lado.

% Punto 2
atraccion(esquel, parqueNacional(losAlerces)).
atraccion(esquel, excursion(trochita)).
atraccion(esquel, excursion(trevelin)).

atraccion(pehuenia, cerro(bateaMahuida, 2000)).
atraccion(pehuenia, cuerpoDeAgua(moquehue, permitidoPescar, 14)).
atraccion(pehuenia, cuerpoDeAgua(alumine, permitidoPescar, 19)).

% atraccion(marDelPlata, playa(4)).
% atraccion(marDelPlata, cuerpoAgua(lagoMardel, noSePuedePescar, 10)).

% lugarConAtraccionCopada(Lugar):-
%     atraccion(Lugar, Atraccion),
%     esCopada(Atraccion).

tuvoVacacionesCopadas(Persona):-
    destino(Persona, _),
    forall(destino(Persona, Lugar), (atraccion(Lugar, Atraccion), esCopada(Atraccion))). 
       
esCopada(cerro(_, MetrosAltura)) :- MetrosAltura > 2000.
esCopada(cuerpoDeAgua(_, permitidoPescar, _)).
esCopada(cuerpoDeAgua(_, _, Temperatura)) :- Temperatura > 20.
esCopada(playa(DiferenciaDeMarea)):- DiferenciaDeMarea < 5.
esCopada(excursion(Nombre)) :- atom_length(Nombre, CantLetras), CantLetras > 7.
esCopada(parqueNacional(_)).

% Punto 3
% Personas que no se cruzaron en ningún destino (intente con 'distinct' pero no pude)
noSeCruzaron(Persona1, Persona2) :-
    destino(Persona1, _),
    destino(Persona2, _),
    Persona1 \= Persona2,  % primero deben ser dos personas /=
    forall(
        destino(Persona1, Ciudad), 
        not(destino(Persona2, Ciudad))
    ).

% Punto 4
% Costos de vida
costoDeVida(sarmiento, 100).
costoDeVida(esquel, 150).
costoDeVida(pehuenia, 180).
costoDeVida(sanMartin, 150).
costoDeVida(camarones, 135).
costoDeVida(playasDoradas, 170).
costoDeVida(bariloche, 140).
costoDeVida(calafate, 240).
costoDeVida(elBolson, 145).
costoDeVida(marDelPlata, 140).

% Vacaciones gasoleras
vacacionesGasoleras(Persona) :-
    distinct(Persona, (destino(Persona, _), 
        forall(destino(Persona, Ciudad), (costoDeVida(Ciudad, Costo), Costo < 160)))
    ).

% Punto 5    
% Itinerarios posibles
destinosPosibles(Persona, DestinosPosibles):-
    findall(Ciudad, destino(Persona, Ciudad), Destinos),
    permutarDestinos(Destinos, DestinosPosibles).

permutarDestinos([], []). % Caso base
permutarDestinos(Destinos, [Primero|Resto]) :- % Caso recursivo
    seleccionar(Primero, Destinos, RestoDestinos),
    permutarDestinos(RestoDestinos, Resto).

seleccionar(Elemento, [Elemento|Resto], Resto).
seleccionar(Elemento, [Otro|Resto], [Otro|RestoSeleccionado]) :-
    seleccionar(Elemento, Resto, RestoSeleccionado).

    % Todo algoritmo recursivo necesita al menos un caso base y al menos un caso recursivo. Esto define
    % entonces que los predicados son no determinísticos: intervendrá el mecanismo de backtracking.














% % Punto 1: El destino es así, lo se... (2 puntos)
% % Sabemos que Dodain se va a Pehuenia, San Martín (de los Andes), Esquel, Sarmiento, Camarones y Playas Doradas. Alf, en cambio, se va a Bariloche, 
% % San Martín de los Andes y El Bolsón. Nico se va a Mar del Plata, como siempre. Y Vale se va para Calafate y El Bolsón.
% % ● Además Martu se va donde vayan Nico y Alf.
% % ● Juan no sabe si va a ir a Villa Gesell o a Federación
% % ● Carlos no se va a tomar vacaciones por ahora
% % Se pide que defina los predicados correspondientes, y justifique sus decisiones en base a conceptos vistos en la cursada.

% % seVaA(Persona, Lugar).
% seVaA(dodain, pehuenia).
% seVaA(dodain, sanMartin).
% seVaA(dodain, esquel).
% seVaA(dodain, sarmiento).
% seVaA(dodain, camarones).
% seVaA(dodain, playasDoradas).
% seVaA(alf, bariloche).
% seVaA(alf, sanMartin).
% seVaA(alf, elBolson).
% seVaA(nico, marDelPlata).
% seVaA(vale, calafate).
% seVaA(vale, elBolson).

% seVaA(martu, Lugar):-
%     seVaA(alf, Lugar).
% seVaA(martu, Lugar):-
%     seVaA(nico, Lugar).

% % Como juan no sabe si va a ir a villaGessel o a federacion, todavia no puedo representarlo con un hecho, ya que esto confirmaria que se va a alguno
% % de los dos destinos. Por lo que si no sabemos cual es el hecho todavia, entonces los suponemos falso y no lo agregamos ya que prolog trabaja con el
% % principio de universo cerrado y todo lo que no escribamos lo presupone falso. Lo mismo con carlos que no va a tomar vacaciones, simplemente no lo
% % escribimos y prolog toma como falso que carlos se va a algun lado.

% % Punto 2: Vacaciones copadas (4 puntos)
% % Incorporamos ahora información sobre las atracciones de cada lugar.
% % Las atracciones se dividen en:
% % ● un parque nacional, donde sabemos su nombre
% % ● un cerro, sabemos su nombre y la altura
% % ● un cuerpo de agua (cuerpoAgua, río, laguna, arroyo), sabemos si se puede pescar y la temperatura promedio del agua
% % ● una playa: tenemos la diferencia promedio de marea baja y alta
% % ● una excursión: sabemos su nombre
% % Agregue hechos a la base de conocimientos de ejemplo para dejar en claro cómo modelaría las atracciones. 
% % Por ejemplo: Esquel tiene como atracciones un parque nacional (Los Alerces) y dos excursiones (Trochita y Trevelin). Villa Pehuenia tiene como
% % atracciones un cerro (Batea Mahuida de 2.000 m) y dos cuerpos de agua (Moquehue, donde se puede pescar y tiene 14 grados de temperatura promedio y 
% % Aluminé, donde se puede pescar y tiene 19 grados de temperatura promedio).
% % Queremos saber qué vacaciones fueron copadas para una persona. Esto ocurre cuando todos los lugares a visitar tienen por lo menos una atracción copada.
% % ● un cerro es copado si tiene más de 2000 metros
% % ● un cuerpoAgua es copado si se puede pescar o la temperatura es mayor a 20
% % ● una playa es copada si la diferencia de mareas es menor a 5
% % ● una excursión que tenga más de 7 letras es copado
% % ● cualquier parque nacional es copado
% % El predicado debe ser inversible.

% % esCopada(Atraccion).
% esCopada(cerro(_, MetrosAltura)):-
%     MetrosAltura > 2000.
% esCopada(cuerpoAgua(_, sePuedePescar, _)).
% esCopada(cuerpoAgua(_, _, Temperatura)):-
%     Temperatura > 20.
% esCopada(playa(DiferenciaMareas)):-
%     DiferenciaMareas < 5.
% esCopada(excursion(Nombre)):-
%     length(Nombre, Largo),
%     Largo > 7.
% esCopada(parqueNacional(_)).


% % tieneAtraccion(Lugar, Atraccion).
% tieneAtraccion(esquel, parqueNacional(losAlerces)).
% tieneAtraccion(esquel, excursion([t,r,o,c,h,i,t,a])).
% tieneAtraccion(esquel, excursion([t,r,e,v,e,l,i,n])).
% tieneAtraccion(pehuenia, cerro(bateaMahuida, 2000)).
% tieneAtraccion(pehuenia, cuerpoDeAgua(moquehue, sePuedePescar, 14)).
% tieneAtraccion(pehuenia, cuerpoDeAgua(alumine, sePuedePescar, 19)).
% tieneAtraccion(marDelPlata, playa(4)).
% tieneAtraccion(marDelPlata, cuerpoAgua(lagoMardel, noSePuedePescar, 10)).
% % lugarConAtraccionCopada(Lugar).
% lugarConAtraccionCopada(Lugar):-
%     tieneAtraccion(Lugar, Atraccion),
%     esCopada(Atraccion).

% % tuvoVacacionesCopadas(Persona).
% tuvoVacacionesCopadas(Persona):-
%     seVaA(Persona, _),
%     forall(seVaA(Persona, Lugar), lugarConAtraccionCopada(Lugar)).

% % Punto 3: Ni se me cruzó por la cabeza (2 puntos)
% % Cuando dos personas distintas no coinciden en ningún lugar como destino decimos que no se cruzaron. 
% % Por ejemplo, Dodain no se cruzó con Nico ni con Vale (sí con Alf en San Martín de los Andes). 
% % Vale no se cruzó con Dodain ni con Nico (sí con Alf en El Bolsón). 
% % El predicado debe ser completamente inversible.

% noSeCruzaron(Uno, Otro):-
%     seVaA(Uno, _),
%     seVaA(Otro, _),
%     forall(seVaA(Uno, Lugar), not(seVaA(Otro, Lugar))),
%     Uno \= Otro.

% % Punto 4: Vacaciones gasoleras (2 puntos)
% % Incorporamos el costo de vida de cada destino:
% % Queremos saber si unas vacaciones fueron gasoleras para una persona. Esto ocurre si todos los destinos son gasoleros, es decir, tienen un costo de 
% % vida menor a 160. Alf, Nico y Martu hicieron vacaciones gasoleras.
% % El predicado debe ser inversible.
% % costoDeVida(Destino, Costo).
% costoDeVida(sarmiento, 100).
% costoDeVida(esquel, 150).
% costoDeVida(pehuenia, 180).
% costoDeVida(sanMartin, 150).
% costoDeVida(camarones, 135).
% costoDeVida(playasDoradas, 170).
% costoDeVida(bariloche, 140).
% costoDeVida(calafate, 240).
% costoDeVida(elBolson, 145).
% costoDeVida(marDelPlata, 140).

% esGasolero(Destino):-
%     costoDeVida(Destino, Costo),
%     Costo < 160.

% vacacionesGasoleras(Persona):-
%     seVaA(Persona, _),
%     forall(seVaA(Persona, Lugar), esGasolero(Lugar)).

% % Punto 5: Itinerarios posibles (3 puntos)
% % Queremos conocer todas las formas de armar el itinerario de un viaje para una persona sin importar el recorrido. 
% % Para eso todos los destinos tienen que aparecer en la solución (no pueden quedar destinos sin visitar).
% % Por ejemplo, para Alf las opciones son
% % [bariloche, sanMartin, elBolson]
% % [bariloche, elBolson, sanMartin]
% % [sanMartin, bariloche, elBolson]
% % [sanMartin, elBolson, bariloche]
% % [elBolson, bariloche, sanMartin]
% % [elBolson, sanMartin, bariloche]
% % (claramente no es lo mismo ir primero a El Bolsón y después a Bariloche que primero a
% % Bariloche y luego a El Bolsón, pero el itinerario tiene que incluir los 3 destinos a los que
% % quiere ir Alf).

% destinosPosibles(Persona, DestinosPosibles):-
%     findall(Lugar, seVaA(Persona, Lugar), Destinos),
%     permutarDestinos(Destinos, DestinosPosibles).

% permutarDestinos([], []).
% permutarDestinos(Destinos, [Primero|Resto]) :-
%     seleccionar(Primero, Destinos, RestoDestinos),
%     permutarDestinos(RestoDestinos, Resto).

% seleccionar(Elemento, [Elemento|Resto], Resto).
% seleccionar(Elemento, [Otro|Resto], [Otro|RestoSeleccionado]) :-
%     seleccionar(Elemento, Resto, RestoSeleccionado).