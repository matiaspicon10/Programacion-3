
-- a)
longitud :: [a] -> Int
longitud xs = aux xs 0
    where 
        aux [] acc = acc
        aux (x:xs) acc = aux xs (1 + acc)

-- b)
contar :: Eq a => a -> [a] -> Int
contar n xs = aux xs 0 
    where 
        aux [] acc = acc
        aux (x:xs) acc = aux xs (if x == n then acc + 1 else acc ) 

-- c)
pertenece :: Eq a => a -> [a] -> Bool
pertenece n xs = aux xs False
    where 
        aux [] acc = acc
        aux (x:xs) acc = aux xs (if x == n then True else acc)

-- d)
duplicar :: [a] -> [a]
duplicar l = reverse (aux l [])
    where 
        aux [] acc = acc
        aux (x:xs) acc = aux xs (x:x:acc)

-- e)
--compararLongitudes :: [a] -> [b] -> Ordering
--compararLongitudes l1 l2 = aux l1 l2 
  
-- f)
productoLista :: Num a => [a] -> a
productoLista l = aux l 1
    where 
        aux [] acc = acc
        aux (x:xs) acc = aux xs (acc * x)

-- g)
--multSum :: Int -> Int -> Int
--multSum n 

-- h)
reversa :: [a] -> [a]
reversa l = aux l []
    where 
        aux [] acc = acc
        aux (x:xs) acc = aux xs (x:acc)

-- i)
invertirSublistas :: [[a]] -> [[a]]
invertirSublistas l = aux l []
    where
        aux [] acc = acc
        aux (x:xs) acc = aux xs (reverse(reverse x:acc))

-- funciones del ejercicio 5

-- a)
eliminarDuplicados :: Eq a => [a] -> [a]
eliminarDuplicados l = aux l []
    where 
       aux [] acc = acc
       aux (x:xs) acc = reverse(aux xs (if x `elem` acc then acc else (x:acc)))
            

-- b)
separarParesImpares :: [Int] -> ([Int], [Int])
separarParesImpares l = aux l ([],[])
    where 
        aux [] (pares, impares) = (reverse(pares), reverse (impares))
        aux (x:xs) (pares, impares) | even x = aux xs(x : pares , impares)
                                    | otherwise = aux xs(pares , x: impares)

-- c)
separarTuplas :: [(a,b)] -> ([a],[b])
separarTuplas l = aux l ([],[])
    where 
        aux [] (primero, segundo) = (reverse(primero), reverse (segundo))
        aux ((x,y):xs) (primero, segundo) = aux xs (x: primero , y: segundo)

-- d)
reemplazarTodos :: Eq a => a -> a -> [a] -> [a]
reemplazarTodos v n l = aux l []
    where 
        aux [] acc = reverse acc
        aux (x:xs) acc | x == v = aux xs (n : acc)
                       | otherwise = aux xs (x: acc)

-- e)
sumarMultiplicar :: Num a => [(a,a)] -> (a,a)
sumarMultiplicar l = aux l (0,1)
    where
        aux [] (primero, segundo) = (primero, segundo)
        aux ((x,y):xs) (primero, segundo) = aux xs (x + primero, y * segundo)

------ ejercicio 6 funciones nuevas

-- a)
maxMin :: Ord a => [a] -> (a,a)
maxMin (x:xs) = aux xs (x,x)
    where
        aux [] (minimo, maximo) = (minimo, maximo)
        aux (x:xs) (minimo, maximo) = aux xs (min minimo x, max maximo x)

-- b)