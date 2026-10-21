% mismo caso que el ejercicio de palindromo
invertir(X,Y):- invertir(X,Y,[]).
invertir([X|Xs],Y,Acc):- invertir(Xs,Y,[X|Acc]).
invertir([],L,L).