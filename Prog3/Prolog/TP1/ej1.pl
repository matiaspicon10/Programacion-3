equipo(norris, mclaren).
equipo(piastri, mclaren).
equipo(russell, mercedes).
equipo(antonelli, mercedes).
equipo(verstappen, redbull).
equipo(hadjar, redbull).
equipo(hamilton, ferrari).
equipo(leclerc, ferrari).
equipo(alonso, astonmartin).
equipo(stroll, astonmartin).
equipo(alon, williams).
equipo(sainz, williams).
equipo(hulkenberg, audi).
equipo(bortoleto, audi).
equipo(ocon, haas).
equipo(bearman, haas).
equipo(colapinto, alpine).
equipo(gasly, alpine).
equipo(perez, cadillac).
equipo(bottas, cadillac).
equipo(lawson, racingbulls).
equipo(lindblad, racingbulls).
motor(mclaren, mercedes).
motor(mercedes, mercedes).
motor(williams, mercedes).
motor(alpine, mercedes).
motor(ferrari, ferrari).
motor(haas, ferrari).
motor(cadillac, ferrari).
motor(redbull, ford).
motor(racingbulls, ford).
motor(astonmartin, honda).
motor(audi, audi).
dif(X,Y) :- X\=Y.

%----------
% Parte (b)
%----------

% R1
companero_de_equipo(X,Y) :- equipo(X,E),  equipo(Y,E), dif(X,Y).

%----------
% Parte (c)
%----------

% R2
rival_sin_companero(X,Y) :- dif(X,Y), equipo(X,E1), equipo(Y,E2), E1 \= E2.

% R3
rival_con_companero(X,Y) :- dif(X,Y), equipo(X,_), equipo(Y,_).