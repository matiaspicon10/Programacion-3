triangulo(A,B,C,Tipo):- A>0, B>0, C>0, A+B>=0, A+C>=0, B+C>=0, tipo(A,B,C,Tipo).

tipo(A,B,C,"equilatero"):- A =:= B, A =:= C, B =:= C.
tipo(A,B,C,"isoceles"):- (A =:= B; A =:= C; B =:= C).
tipo(A,B,C,"escaleno"):- A =\= B,  A =\= C,  B =\= C.
