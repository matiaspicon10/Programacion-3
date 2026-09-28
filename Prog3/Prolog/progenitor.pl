progenitor(clara,jose).
progenitor(tomas,jose).
progenitor(tomas,isabel).
progenitor(jose,ana).
progenitor(jose,patricia).
progenitor(patricia,jaime).
dif(X,Y) :- X\=Y.

% H1
es_hombre(jose).
es_hombre(tomas).
es_hombre(jaime).

% H2 
es_mujer(clara).
es_mujer(isabel).
es_mujer(ana).
es_mujer(patricia).




% R1
es_padre(X) :- es_hombre(X), progenitor(X,_).

% R2
es_madre(X) :- es_mujer(X), progenitor(X,_).

% R3
es_hijo(X) :- progenitor(_,X).

% R4
hermana_de(X,Y) :- es_mujer(X), progenitor(P,X), progenitor(P,Y), dif(X,Y).

% R5
hermanos(X,Y) :- progenitor(P,X), progenitor(P,Y), dif(X,Y).
