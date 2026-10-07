%---------
% Parte(a)
%---------

pertenece(X, [X|_]).
pertenece(X, [_|Y]):- pertenece(X,Y).

%---------
% Parte(c)
%---------

% I. ¿Es c un elemento de [a, c, b, c]?
% pertenece(c,[a,c,b,c]). true

% II. ¿Cuáles son los elementos de [a, b, a] ?
% pertenece(X,[a,b,a]). X = a ; X = b ; X = a.

% III. ¿Cuáles son los elementos comunes de [a, b, c], y [d, c, b]?
% pertenece(X,[a, b, c]), pertenece(X, [d, c, b]). X = b; X = c.

