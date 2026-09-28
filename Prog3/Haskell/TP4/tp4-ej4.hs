--- a)
data Arbol a = Vacio | Nodo a (Arbol a) (Arbol a) deriving Show

--- b)

tamanio :: Arbol a -> Int 
tamanio Vacio = 0
tamanio (Nodo _ izq der) = 1 + tamanio izq + tamanio der

--- c)

profundidad :: Arbol a -> Int
profundidad Vacio = 0
profundidad (Nodo _ izq der) = 1 + max (profundidad izq) (profundidad der)

--- d)


mapArbol :: (a ->b) ->Arbol a ->Arbol b
mapArbol _ Vacio = Vacio
mapArbol f (Nodo a izq der ) = Nodo (f a) (mapArbol f izq) (mapArbol f der)

--- e) 
foldArbol :: (b ->a ->b ->b) ->b ->Arbol a ->b
foldArbol _ z Vacio = z
foldArbol f z (Nodo x izq der) = f (foldArbol f z izq) x (foldArbol f z der)

-- ejemplo de uso
sumaArbol :: Arbol Int -> Int
sumaArbol arbol = foldArbol(\izq x der -> izq + x + der) 0 arbol 

multArbol :: Arbol Int -> Int
multArbol arbol = foldArbol(\izq x der -> izq * x * der) 1 arbol

