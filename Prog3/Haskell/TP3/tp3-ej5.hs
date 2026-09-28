
-- a)
eliminarDuplicados :: Eq a => [a] -> [a]
eliminarDuplicados [] = [] 
eliminarDuplicados (x:xs) = x : eliminarDuplicados (filter (/=x)xs)
    
-- b)
separarParesImpares :: [Int] -> ([Int], [Int])
separarParesImpares [] = ([],[])
separarParesImpares (x:xs) | even x = (x : pares, impares)
                           | otherwise = (pares, x: impares)
                           where (pares, impares) = separarParesImpares xs

-- c)
separarTuplas :: [(a,b)] -> ([a],[b])
separarTuplas [] = ([],[])
separarTuplas ((x,y):xs) = (x : primero, y: segundo)
    where (primero, segundo) = separarTuplas xs
 
-- d) 
reemplazarTodos :: Eq a => a -> a -> [a] -> [a]
reemplazarTodos _ _ [] = []
reemplazarTodos v n (x:xs) | x == v = n : reemplazarTodos v n xs 
                           | otherwise = x : reemplazarTodos v n xs

-- e)
sumarMultiplicar :: Num a => [(a,a)] -> (a,a)
sumarMultiplicar [] = (0,1)
sumarMultiplicar ((x,y):xs) = (x + primero, y * segundo)
    where (primero, segundo) = sumarMultiplicar xs

-- f)