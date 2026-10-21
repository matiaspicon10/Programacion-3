piloto(norris, mclaren, mercedes, britanico).
piloto(piastri, mclaren, mercedes, australiano).
piloto(russell, mercedes, mercedes, britanico).
piloto(antonelli, mercedes, mercedes, italiano).
piloto(verstappen, redbull, redbull, neerlandes).
piloto(hadjar, redbull, redbull, frances).
piloto(hamilton, ferrari, ferrari, britanico).
piloto(leclerc, ferrari, ferrari, monegasco).
piloto(alonso, astonmartin, honda, espanol).
piloto(stroll, astonmartin, honda, canadiense).
piloto(alon, williams, mercedes, tailandes).
piloto(sainz, williams, mercedes, espanol).
piloto(hulkenberg, audi, audi, aleman).
piloto(bortoleto, audi, audi, brasileno).
piloto(ocon, haas, ferrari, frances).
piloto(bearman, haas, ferrari, britanico).
piloto(colapinto, alpine, mercedes, argentino).
piloto(gasly, alpine, mercedes, frances).
piloto(perez, cadillac, ferrari, mexicano).
piloto(bottas, cadillac, ferrari, finlandes).
piloto(lawson, racingbulls, redbull, neozelandes).
piloto(lindblad, racingbulls, redbull, britanico).

%---------
% Parte(b)
%---------

% I. ¿Qué piloto argentino corre en la Fórmula 1 2026 y en qué escudería?
% ?- piloto(P,E,_,argentino).

% II. ¿Cuántas escuderías distintas usan motor Mercedes? ¿Y motor Ferrari?
% setof(E,P^N^piloto(P,E,mercedes,N),Lista),length(Lista,Cantidad).
% setof(E,P^N^piloto(P,E,ferrari,N),Lista),length(Lista,Cantidad).

% IV. Definir compañero_de_equipo(?X, ?Y): X e Y corren para la misma escudería (X \= Y).
companero_de_equipo(X,Y):- piloto(X,E,_,_), piloto(Y,E,_,_), X\=Y.

% V. Definir mismo_motor(?X, ?Y): los autos de X e Y llevan el mismo motor, aunque corran para escuderías distintas (X \= Y).
mismo_motor(X,Y):- piloto(X,_,M,_), piloto(Y,_,M,_), X\=Y.

% VI. Definir mismo_pais(?X, ?Y): X e Y son pilotos de la misma nacionalidad (X \= Y). Preguntar por todos los pares de pilotos británicos.
mismo_pais(X,Y):- piloto(X,_,_,N), piloto(Y,_,_,N), X\=Y.

% VII. Definir esPiloto(X): X es un piloto existente en la base de datos.
esPiloto(X):- piloto(X,_,_,_).

% VIII. Preguntar por los nombres y escuderías de todos los pilotos de la base de datos.
% findall(P-E, piloto(P,E,_,_),Lista).

% IX. Definir motor_de(?Piloto, ?Motor): Motor es el motor que usa Piloto, a partir de su escudería.
motor_de(Piloto, Motor):- piloto(Piloto,_,Motor,_).

% X. Definir cantidad_por_motor(+ListaPilotos, +Motor, ?N): si ListaPilotos es una lista de nombres de pilotos, N es la cantidad de ellos que corre con el motor Motor.
cantidad_por_motor([],M,N).
cantidad_por_motor([P|Ps], M, N):- motor_de(P,M), cantidad_por_motor(Ps, M, N1), N is N+1.
cantidad_por_motor([P|Ps], M, N):- \+ motor_de(P, M), cantidad_por_motor(Ps, M, N).