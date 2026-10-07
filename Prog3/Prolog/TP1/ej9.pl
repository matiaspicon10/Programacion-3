%---------
% Parte(a)
%---------

conc([],L,L).
conc([X|L1], L2, [X|L3]):- conc(L1,L2,L3).

%---------
% Parte(c)
%---------

% I. ¿Qué lista hay que añadirle a la lista [a, b] para obtener [a, b, c, d]?. 
% conc([a,b],L,[a,b,c,d]). L = [c, d].

% II. ¿Qué listas hay que concatenar para obtener [a, b]?
% conc(L1,L2,[a,b]). L1 = [], L2 = [a, b].

% III. ¿Pertenece b a la lista [a, b, c]?
% conc([_|_],[b|_],[a,b,c]).

% IV. ¿Es [b, c] una sublista de [a, b, c, d]?
% 
