aplana(L, R) :- aplana(L, [], R).

% aplana(+Entrada, +Acc, -Salida)
% Salida = elementos de Entrada (aplanados) puestos delante de Acc

aplana([], Acc, Acc).                          % 1) lista vacía

aplana([X|Xs], Acc, R) :-                      % 2) lista no vacía
    aplana(Xs, Acc, R1),                       %    primero la cola
    aplana(X, R1, R).                          %    después la cabeza, delante

aplana(X, Acc, [X|Acc]) :-                     % 3) elemento suelto
    X \= [],
    X \= [_|_].