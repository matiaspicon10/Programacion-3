cuentaN([],_,0).


cuentaN([X|Y], X, LR):- cuentaN(Y,X,LR2), LR is LR2 + 1. 

% caso en el que la cabeza es distinto del numero buscado
cuentaN([H|T], N, C) :- H \= N, cuentaN(T, N, C). 