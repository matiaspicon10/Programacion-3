data Arbol a = Vacio | Nodo a (Arbol a) (Arbol a) deriving Show

tamanio :: Arbol a -> Int 
tamanio Vacio = 0
tamanio (Nodo _ izq der) = 1 + tamanio izq + tamanio der

