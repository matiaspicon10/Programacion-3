%---------
% Parte(a)
%---------

% Ejemplo: palindromo([o,s,o]).

% palindromo(L):- reverse(L,L2), L=L2. 

palindromo(L):- palindromo(L,L,[]). 

palindromo([],L,L).

palindromo([X|XS],L,Acc):- palindromo(XS,L,[X|Acc]).