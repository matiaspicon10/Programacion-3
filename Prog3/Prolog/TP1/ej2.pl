piloto(fangio, mercedes, 51, 24, 35, 5).
piloto(reutemann, williams, 146, 12, 45, 0).
piloto(jose_froilan_gonzalez, ferrari, 26, 2, 15, 0).
piloto(franco_colapinto, alpine, 39, 0, 0, 0).
piloto(emerson_fittipaldi, lotus, 144, 14, 35, 2).
piloto(nelson_piquet, brabham, 204, 23, 60, 3).
piloto(ayrton_senna, mclaren, 161, 41, 80, 3).
piloto(rubens_barrichello, ferrari, 326, 11, 68, 0).
piloto(felipe_massa, ferrari, 272, 11, 41, 0).

% piloto(Nombre, Escuderia, GrandesPremios, Victorias, Podios, Campeonatos).

%---------
% Parte(a)
%---------

% R1
es_campeon_mundial(Nombre) :- piloto(Nombre,_,_,_,_,C), C>0.

%---------
% Parte(b)
%---------

% R2
mas_experimentado(Piloto1, Piloto2) :- piloto(Piloto1,_,GP1,_,_,_), piloto(Piloto2,_,GP2,_,_,_), GP1>GP2.


%---------
% Parte(c)
%---------

% R3
mas_de_n_podios(Piloto, N) :- piloto(Piloto,_,_,_,Podios,_), Podios>N.

