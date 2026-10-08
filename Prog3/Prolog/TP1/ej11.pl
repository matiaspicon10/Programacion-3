%---------
% Parte(a)
%---------

duplica([],[]).
duplica([X|Y], [X,X|Z]):- duplica(Y,Z).