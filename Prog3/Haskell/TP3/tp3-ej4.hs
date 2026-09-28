
-- a)
longitud :: [a] -> Int
longitud [] = 0
longitud (_:xs) = 1 + longitud xs

-- b)
contar :: Eq a => a -> [a] -> Int
contar _ []  = 0
contar n (x:xs)  = 
    if x == n
    then 1 + contar n xs 
    else contar n xs 

-- c) 
pertenece :: Eq a => a -> [a] -> Bool
pertenece _ [] = False
pertenece n (x:xs) = 
    if x == n
    then True
    else pertenece n xs

-- d) 
duplicar :: [a] -> [a]
duplicar [] = []
duplicar (x:xs) = x : x : duplicar xs

-- e) 
compararLongitudes :: [a] -> [b] -> Ordering
compararLongitudes [] [] = EQ
compararLongitudes [] (_:ys) = LT
compararLongitudes (_:xs) [] = GT
compararLongitudes (_:xs) (_:ys) = compararLongitudes xs ys

-- f)
productoLista :: Num a => [a] -> a
productoLista [] = 0
productoLista [x] = x
productoLista (x:xs) = x * productoLista xs

-- g)
multSum :: Int -> Int -> Int
multSum 0 _ = 0
multSum _ 0 = 0
multSum x y = y + multSum (x-1) y

-- h)
reversa :: [a] -> [a]
reversa [] = []
reversa (x:xs) = reversa xs ++ [x]

-- i) 
invertirSublistas :: [[a]] -> [[a]]
invertirSublistas [] = []
invertirSublistas (x:xs) = reverse x : invertirSublistas xs