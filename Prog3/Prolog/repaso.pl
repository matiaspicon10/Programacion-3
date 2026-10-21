% ----------- TP1 -----------

% ---- EJ3 ----

maximo(X,Y,Z):- X>=Y, Z=X.
maximo(X,Y,Z):- Y>X, Z=Y.

% ---- EJ4 ----

primero([X|_],X). 

% ---- EJ5 ----

%cola([X|Xs],Xs).

% ---- EJ6 ----

cons(X,Y, [X|Y]).

% ---- EJ7 ----

suma_acc(L,R):- suma_acc(L,0,R).
suma_acc([],Acc, Acc).
suma_acc([X|XS],Acc,R):- Acc1 is Acc+X, suma_acc(XS, Acc1, R).

suma([],0).
suma([X|XS],R):- suma(XS,R1), R is X + R1.

% ---- EJ8 ----

pertenece(X,[X|_]).
pertenece(X,[_|Xs]):- pertenece(X,Xs).

% ---- EJ9 ----

conc([],L,L).
conc([X|Y], Z , [X|U]):- conc(Y,Z,U).

% ---- EJ10 ---

palindromo(L):- palindromo(L,L,[]).
palindromo([],L,L).
palindromo([X|Xs],L,Acc):- palindromo(Xs,L,[X|Acc]).

% ---- EJ11 ---

duplica([],[]).
duplica([X|Y],[X,X|Z]):- duplica(Y,Z).

% ---- EJ12 ---

cuentaN([],_,0).
cuentaN([X|Y], X, LR):- cuentaN(Y,X,LR2), LR is LR2 + 1. 
cuentaN([H|Y], X, LR):- H \= X, cuentaN(Y,X,LR).

% ----------- TP2 -----------

% ---- EJ1 ---

invertir(X,Y):- invertir(X,Y,[]).
invertir([X|S],Z,U):- invertir(S,Z,[X|U]).
invertir([],L,L).

% ---- EJ2 ---

aplana(L, R) :- aplana(L, [], R).
aplana([], Acc, Acc).  
aplana([X|Xs], Acc, R) :-  aplana(Xs, Acc, R1), aplana(X, R1, R).  
aplana(X, Acc, [X|Acc]) :-   X \= [],  X \= [_|_].

% ---- EJ3 ---

fact(0,1).
fact(X,Y):- X>0, X1 is X-1, fact(X1,Y1), Y is X*Y1.

% ---- EJ6 ---

triangulo(A,B,C,Tipo):- A>0, B>0, C>0, A+B>=0, A+C>=0, B+C>=0, tipo(A,B,C,Tipo).

tipo(A,B,C,"equilatero"):- A =:= B, A =:= C, B =:= C.
tipo(A,B,C,"isoceles"):- (A =:= B; A =:= C; B =:= C).
tipo(A,B,C,"escaleno"):- A =\= B,  A =\= C,  B =\= C.

