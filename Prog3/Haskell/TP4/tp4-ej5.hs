--- a) 
class Medible a where
    medida :: a -> Float 

--- b) 
data Circulo = Circulo Float deriving Show

data Rectangulo = Rectangulo Float Float deriving Show

instance Medible Circulo where
    medida (Circulo radio) = pi * radio * radio

instance Medible Rectangulo where
    medida (Rectangulo base altura) = base * altura

--- c) 
data Arbol a = Vacio | Nodo a (Arbol a) (Arbol a) deriving Show

instance Medible a => Medible (Arbol a) where
    medida Vacio = 0.0
    medida (Nodo x izq der) = medida x + medida izq + medida der 



