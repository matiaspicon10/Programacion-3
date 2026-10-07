suma_lista([],0).
suma_lista([X|Y],S) :- suma_lista(Y,Aux), S is X + Aux.