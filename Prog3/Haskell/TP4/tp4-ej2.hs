-- a)
data DiaSemana = Lunes | Martes | Miercoles |Jueves | Viernes | Sabado | Domingo deriving (Show, Eq, Ord)

-- b)
esFinDeSemana :: DiaSemana->Bool
esFinDeSemana Sabado = True
esFinDeSemana Domingo = True
esFinDeSemana _ = False 

-- c)
data NumeroOLetra =  Entero Integer | Letra Char deriving Show

-- d)
soloNumeros :: [NumeroOLetra]->[Integer]
soloNumeros [] = []
soloNumeros (Entero x:xs) = x : soloNumeros xs
soloNumeros (Letra x:xs) = soloNumeros xs

