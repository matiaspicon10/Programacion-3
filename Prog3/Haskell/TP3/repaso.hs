import Control.Monad.Accum (MonadAccum(accum))
import Data.Text.Encoding.Error (lenientDecode)
import Distribution.SPDX (LicenseId(X11))
---- Repaso haciendo funciones de las 4 formas (recursion simple, acumulador, foldr, foldl)
-- ej1
intercambiar :: (a,b)->(b,a)
intercambiar t = (snd t, fst t)

intercambiarAc :: (a,b)->(b,a)
intercambiarAc t = aux (fst t)(snd t)
    where aux x y = (y,x)




-- ej2
mylength :: [a] -> Int
mylength [] = 0
mylength (x:xs) = 1 + mylength xs

mylengthAc :: [a] -> Int
mylengthAc l = aux l 0
    where 
        aux [] acc = acc
        aux (x:xs) acc = aux xs (1 + acc)

mylengthFR :: [a] -> Int
mylengthFR l = foldr (\x acc ->  (1 + acc)) 0 l

mylengthFL :: [a] -> Int
mylengthFL l = foldl(\acc x -> 1 + acc) 0 l

-- ej 4 al 6 
contar :: Eq a => a -> [a] -> Int
contar _ [] = 0
contar n (x:xs)  | x == n = 1 + contar n xs
                 | otherwise = contar n xs

contarAc :: Eq a => a -> [a] -> Int
contarAc n l = aux n l 0
 where 
    aux _ [] acc = acc
    aux n (x:xs) acc = aux n xs (if x == n then 1 + acc else acc)

contarFR :: Eq a => a -> [a] -> Int
contarFR n l = foldr (\x acc -> if x == n then 1 + acc else acc) 0 l

contarFL :: Eq a => a -> [a] -> Int
contarFL n l = foldl(\acc x -> if x == n then 1 + acc else acc ) 0 l

--

pertenece :: Eq a => a -> [a] -> Bool
pertenece _ [] = False
pertenece n (x:xs) = if x == n then True else pertenece n xs

perteneceAc :: Eq a => a -> [a] -> Bool
perteneceAc n l = aux n l False
    where 
        aux n [] acc = acc
        aux n (x:xs) acc = aux n xs (if x == n then True else acc) 

perteneceFR :: Eq a => a -> [a] -> Bool
perteneceFR n l = foldr (\x acc -> if x == n then True else acc) False l

perteneceFL :: Eq a => a -> [a] -> Bool
perteneceFL n l = foldl(\acc x -> if x == n then True else acc) False l

--

duplicar :: [a] -> [a]
duplicar [] = []
duplicar (x:xs) = x:x:duplicar xs

duplicarAc :: [a] -> [a]
duplicarAc l = aux l []
    where
        aux [] acc = acc
        aux (x:xs) acc = aux xs (acc ++ [x,x])

duplicarFR :: [a] -> [a]
duplicarFR l = foldr (\x acc -> x:x:acc) [] l 

duplicarFL :: [a] -> [a]
duplicarFL l = foldl(\acc x -> acc ++ [x,x]) [] l

--

productoLista :: Num a => [a] -> a
productoLista [] = 0
productoLista [x] = x
productoLista (x:xs) = x * productoLista xs

productoListaAc :: Num a => [a] -> a
productoListaAc l = aux l 1
    where
        aux [] acc = acc 
        aux (x:xs) acc = aux xs (x * acc)

productoListaFR :: Num a => [a] -> a
productoListaFR l = foldr (\x acc -> x * acc) 1 l

productoListaFL :: Num a => [a] -> a
productoListaFL l = foldl(\acc x -> x * acc) 1 l 

--

reversa :: [a] -> [a]
reversa [] = []
reversa (x:xs) = reversa xs ++ [x] 

reversaAc :: [a] -> [a]
reversaAc l = aux l []
    where 
        aux [] acc = acc
        aux (x:xs) acc = aux xs (x:acc)

reversaFR :: [a] -> [a]
reversaFR l = foldr (\x acc -> acc ++ [x]) [] l

reversaFL :: [a] -> [a]
reversaFL l = foldl(\acc x -> x:acc) [] l

--

invertirSublistas :: [[a]] -> [[a]]
invertirSublistas [] = []
invertirSublistas (x:xs) = reverse x : invertirSublistas xs

invertirSublistasAc :: [[a]] -> [[a]]
invertirSublistasAc l = aux l []
    where 
        aux [] acc = acc
        aux (x:xs) acc = aux xs (reverse (reverse x:acc))

invertirSublistasFR :: [[a]] -> [[a]]
invertirSublistasFR l = foldr (\x acc -> reverse x : acc) [] l

invertirSublistasFL :: [[a]] -> [[a]]
invertirSublistasFL l = foldl (\acc x -> reverse(reverse x : acc)) [] l

--

eliminarDuplicados :: Eq a => [a] -> [a]
eliminarDuplicados [] = []
eliminarDuplicados (x:xs) = if x `elem` xs then eliminarDuplicados xs else x:eliminarDuplicados xs

eliminarDuplicadosAc :: Eq a => [a] -> [a]
eliminarDuplicadosAc l = aux l []
    where
        aux [] acc = acc
        aux (x:xs) acc = reverse $ aux xs  (if x `elem` acc then acc else x:acc)

eliminarDuplicadosFR :: Eq a => [a] -> [a]
eliminarDuplicadosFR l = foldr (\x acc ->  if x `elem` acc then acc else x:acc) [] l

eliminarDuplicadosFL :: Eq a => [a] -> [a]
eliminarDuplicadosFL l = reverse $ foldl (\acc x ->  if x `elem` acc then acc else x:acc) [] l

--

separarParesImpares :: [Int] -> ([Int], [Int])
separarParesImpares [] = ([],[])
separarParesImpares (x:xs) | even x = (x: par, impar)
                           | otherwise = (par, x: impar)
                            where 
                                (par, impar) = separarParesImpares xs

separarParesImparesAc :: [Int] -> ([Int], [Int])
separarParesImparesAc l = aux l ([],[])
    where
        aux [] acc = acc
        aux (x:xs) acc | even x = aux xs (x:par,impar)
                       | otherwise = aux xs (par, x:impar)
                       where 
                        (par, impar) = acc 

separarParesImparesFR :: [Int] -> ([Int], [Int])
separarParesImparesFR l = foldr (\x (pares, impares) -> if even x then (x:pares, impares) else (pares , x:impares) ) ([],[]) l
  
separarParesImparesFL :: [Int] -> ([Int], [Int])
separarParesImparesFL l = foldl(\(pares,impares) x -> if even x then (reverse(x:pares), impares) else (pares , reverse(x:impares))) ([],[]) l

-- 

separarTuplas :: [(a,b)] -> ([a],[b])
separarTuplas [] = ([],[])
separarTuplas ((x,y):xs) = (x: primero, y: segundo)
    where 
        (primero, segundo) = separarTuplas xs

separarTuplasAc :: [(a,b)] -> ([a],[b])
separarTuplasAc l = aux l ([],[])
    where
        aux [] (primero, segundo) = (primero, segundo)
        aux ((x,y):xs) (primero, segundo) = aux xs (reverse(x:primero),reverse(y:segundo))

separarTuplasFR :: [(a,b)] -> ([a],[b])
separarTuplasFR l = foldr(\(x,y) (primero, segundo) -> (x:primero, y:segundo)) ([],[]) l

separarTuplasFL :: [(a,b)] -> ([a],[b])
separarTuplasFL l = foldl (\(primero, segundo) (x,y) -> (reverse(x:primero), reverse(y:segundo))) ([],[]) l

-- 

reemplazarTodos :: Eq a => a -> a -> [a] -> [a]
reemplazarTodos _ _ [] = []
reemplazarTodos v n (x:xs) = if x == v then n:reemplazarTodos v n xs else x:reemplazarTodos v n xs 

reemplazarTodosAc :: Eq a => a -> a -> [a] -> [a]
reemplazarTodosAc v n l = aux v n l []
    where 
        aux _ _ [] acc = acc
        aux v n (x:xs) acc = aux v n xs (if x == v then n:acc else x:acc) 

reemplazarTodosFR :: Eq a => a -> a -> [a] -> [a]
reemplazarTodosFR v n l = foldr (\x acc -> if x == v then n:acc else x:acc) [] l

reemplazarTodosFL :: Eq a => a -> a -> [a] -> [a]
reemplazarTodosFL v n l = reverse $ foldl(\acc x -> if x == v then n:acc else x:acc) [] l

-- 

sumarMultiplicar :: Num a => [(a,a)] -> (a,a)
sumarMultiplicar [] = (0,1)
sumarMultiplicar ((x,y):xs) = (x+primero, y * segundo)
    where (primero, segundo) = sumarMultiplicar xs

sumarMultiplicarAc :: Num a => [(a,a)] -> (a,a)
sumarMultiplicarAc l = aux l (0,1)
    where 
        aux [] (primero, segundo) = (primero, segundo) 
        aux ((x,y):xs) (primero, segundo) = aux xs (x+primero,y*segundo)
       
sumarMultiplicarFR :: Num a => [(a,a)] -> (a,a)
sumarMultiplicarFR l = foldr (\(x,y) (primero,segundo) -> (x+primero,y*segundo)) (0,1) l

sumarMultiplicarFL :: Num a => [(a,a)] -> (a,a)
sumarMultiplicarFL l = foldl(\(primero, segundo) (x,y) -> (x+primero,y*segundo)) (0,1) l

-- 

eliminarImpares :: [a] -> [a]
eliminarImpares [] = []
eliminarImpares [x] = [x]
eliminarImpares (x:y:xs) = y : eliminarImpares xs

eliminarImparesAc :: [a] -> [a]
eliminarImparesAc l = aux l []
    where 
        aux [] acc = acc
        aux [x] acc = [x]
        aux (x:y:xs) acc = reverse $ aux xs (y:acc)

--eliminarImparesFR :: [a] -> [a]
--eliminarImparesFR l = foldr(\x acc-> y:acc) [] l

--- ej 10
misterio :: [a] -> [a]
misterio [] = []
misterio (x:xs) = misterio xs ++ [x]

misterioAc :: [a] -> [a]
misterioAc l = aux l []
    where
        aux [] acc = acc
        aux (x:xs) acc = aux xs ([x]++acc)

misterioFR :: [a] -> [a]
misterioFR l = foldr(\x acc -> acc ++ [x]) [] l

misterioFL :: [a] -> [a]
misterioFL l = foldl(\acc x -> x:acc) [] l

--- ej 12

mapSimple :: (a->b)->[a]->[b]
mapSimple f [] = []
mapSimple f (x:xs) = f x : mapSimple f xs

mapAc :: (a->b)->[a]->[b]
mapAc f l = aux l []
    where 
        aux [] acc = acc
        aux (x:xs) acc = aux xs (acc ++ [f x])

mapFR :: (a->b)->[a]->[b]
mapFR f l = foldr(\x acc -> f x:acc) [] l

mapFL :: (a->b)->[a]->[b]
mapFL f l = foldl(\acc x -> acc ++ [f x]) [] l

--

filterSimple :: (a -> Bool) -> [a] -> [a]
filterSimple c [] = []
filterSimple c (x:xs) = if c x == True then x: filterSimple c xs else filterSimple c xs  

filterAc :: (a -> Bool) -> [a] -> [a]
filterAc c l = aux l []
    where 
        aux [] acc = acc
        aux (x:xs) acc = aux xs (if c x == True then acc ++ [x] else acc)

filterFR :: (a -> Bool) -> [a] -> [a]
filterFR c l = foldr(\x acc -> if c x == True then x : acc else acc) [] l

filterFL :: (a -> Bool) -> [a] -> [a]
filterFL c l = foldl(\acc x -> if c x == True then acc ++ [x] else acc) [] l

-- 

reverseSimple :: [a] -> [a]
reverseSimple [] = []
reverseSimple (x:xs) = reverseSimple xs ++ [x] 

reverseAc :: [a] -> [a]
reverseAc l = aux l []
    where
        aux [] acc = acc
        aux (x:xs) acc = aux xs (x:acc)

reverseFR :: [a] -> [a]
reverseFR l = foldr(\x acc -> acc ++ [x]) [] l

reverseFL :: [a] -> [a]
reverseFL l = foldl(\acc x -> x:acc) [] l

-- 

sumSimple :: Num a => [a]->a
sumSimple [] = 0
sumSimple (x:xs) = x + sumSimple xs

sumAc :: Num a => [a]->a
sumAc l = aux l 0
    where
        aux [] acc = acc
        aux (x:xs) acc = aux xs (x + acc)

sumFR :: Num a => [a]->a
sumFR l = foldr(\x acc -> x+acc) 0 l

sumFL :: Num a => [a]->a
sumFL l = foldl(\acc x -> x + acc) 0 l

--

productSimple :: Num a => [a]->a
productSimple [] = 1
productSimple (x:xs) = x * productSimple xs

productAc :: Num a => [a]->a
productAc l = aux l 1
    where
        aux [] acc = acc
        aux (x:xs) acc = aux xs (x * acc)

productFR :: Num a => [a]->a
productFR l = foldr(\x acc -> x * acc) 1 l

productFL :: Num a => [a]->a
productFL l = foldl(\acc x -> x*acc) 1 l

--

lengthSimple :: [a]-> Int
lengthSimple [] = 0
lengthSimple (x:xs) = 1 + lengthSimple xs

lengthAc :: [a]-> Int
lengthAc l = aux l 0
    where
        aux [] acc = acc
        aux (x:xs) acc = aux xs (1 + acc)

lengthFR :: [a]-> Int
lengthFR l = foldr(\x acc -> 1 + acc) 0 l

lengthFL :: [a]-> Int
lengthFL l = foldl(\acc x -> 1 + acc) 0 l

--

elimDup :: Eq a => [a] -> [a]
elimDup [] = []
elimDup (x:xs) = if x `elem`xs then elimDup xs else x:elimDup xs

elimDupAc :: Eq a => [a] -> [a]
elimDupAc l = aux l []
    where 
        aux [] acc = acc
        aux (x:xs) acc = aux xs (if x `elem` xs then acc else acc ++ [x])

elimDupFR :: Eq a => [a] -> [a]
elimDupFR l = foldr (\x acc -> if x `elem` acc then acc else x:acc) [] l

elimDupFL :: Eq a => [a] -> [a]
elimDupFL l = foldl (\acc x -> if x `elem` acc then acc else acc ++ [x]) [] l

--

contar2Simple :: Eq a => a -> [a] -> Integer
contar2Simple _ [] = 0
contar2Simple n (x:xs) = if x == n then 1 + contar2Simple n xs else contar2Simple n xs 

contar2Ac :: Eq a => a -> [a] -> Integer
contar2Ac n l = aux l 0
    where
        aux [] acc = acc
        aux (x:xs) acc = aux xs (if x == n then 1 + acc else acc)

contar2FR :: Eq a => a -> [a] -> Integer
contar2FR n l = foldr(\x acc -> if x == n then 1 + acc else acc) 0 l

contar2FL :: Eq a => a -> [a] -> Integer
contar2FL n l = foldl(\acc x -> if x == n then 1 + acc else acc) 0 l

--- ejemplo que dio la profe
--Dada una lista de tuplas la cual con tiene una base y un exponente, se debe convertir a una triupla donde esta trendra la base, el exponente, y dicha potencia, por ej:
-- [(2,2),(2,3)]->[(2,2,4),(2,3,8)]

potencia :: (Integral b, Num c) => [(c, b)] -> [(c, b, c)]
potencia [] = []
potencia ((b,e):xs) = (b,e,b^e):potencia xs

potenciaAc :: (Integral b, Num c) => [(c, b)] -> [(c, b, c)]
potenciaAc l = aux l []
    where
        aux [] acc = acc
        aux ((b,e):xs) acc = aux xs (acc ++ [(b,e,b^e)])

potenciaFR  :: (Integral b, Num c) => [(c, b)] -> [(c, b, c)]
potenciaFR l = foldr(\(b,e) acc ->  (b,e,b^e):acc) [] l

potenciaFL :: (Integral b, Num c) => [(c, b)] -> [(c, b, c)]
potenciaFL l = foldl(\acc (b,e) -> acc ++ [(b,e,b^e)]) [] l

-- ej parcial

fun :: Eq a => a -> [a] -> ([a],[a])
fun n [] = ([],[])
fun n (x:xs) = if x == n then (x:primero,segundo) else (primero, x:segundo)
    where (primero, segundo) = fun n xs

funAc :: Eq a => a -> [a] -> ([a],[a])
funAc n l = aux l ([],[])
    where 
        aux [] acc = acc
        aux (x:xs) (primero, segundo) = aux xs (if x == n then (x:primero,segundo) else (primero, x:segundo))
       
funFR :: Eq a => a -> [a] -> ([a],[a])
funFR n l = foldr(\x acc -> if x == n then (x: fst acc , snd acc ) else (fst acc,  snd acc ++ [x])) ([],[]) l

funFL :: Eq a => a -> [a] -> ([a],[a])
funFL n l = foldl(\acc x -> if x == n then (x: fst acc, snd acc) else (fst acc, x: snd acc)) ([],[]) l