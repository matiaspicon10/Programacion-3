----- Con foldr

-- a)

mapfoldr :: (a->b)->[a]->[b] 
mapfoldr f l = foldr (\x acc -> f x : acc) [] l

mapfoldl :: (a->b)->[a]->[b]
mapfoldl f l = foldl (\acc x -> reverse(f x : acc)) [] l 
-- b)

filterfoldr :: (a->Bool)->[a]->[a]
filterfoldr c = foldr (\x acc -> if c x then x : acc else acc) [] 

filterfoldl :: (a->Bool)->[a]->[a]
filterfoldl c = foldr (\acc x -> if c acc then acc : x else x) [] 

-- c)
reversefoldr :: [a] -> [a]
reversefoldr = foldr (\x xs -> xs ++ [x]) []

reversefoldl :: [a]->[a]
reversefoldl = foldl (\xs x -> x : xs) []

----- Con foldl
-- a)

sumfoldl :: Num a => [a] -> a
sumfoldl = foldl (+) 0

sumfoldr :: Num a => [a] -> a
sumfoldr = foldr (+) 0

-- b)

productofoldl :: Num a => [a] -> a
productofoldl = foldl (*) 1

productofoldr :: Num a => [a] -> a
productofoldr = foldr (*) 1

-- c) 
longitud :: [a] -> Integer
longitud = foldl (\acc x -> acc + 1) 0 

longitudfoldr :: [a] -> Integer
longitudfoldr = foldr (\x acc -> acc + 1) 0

--- Con ambos plegados

-- a)

eliminarDuplicados :: Eq a =>[a]->[a] 
eliminarDuplicados = foldr (\x acc -> if x `elem` acc then acc else x : acc ) []

eliminarDuplicadosfoldl :: Eq a =>[a]->[a] 
eliminarDuplicadosfoldl = foldl (\acc x -> if x `elem` acc then acc else acc ++ [x]) []

-- b)

contarfoldr :: Eq a => a -> [a] -> Int
contarfoldr n = foldr (\x acc -> if x == n then acc + 1 else acc) 0

contarfoldl :: Eq a => a -> [a] -> Int
contarfoldl n = foldl (\acc x -> if x == n then acc + 1 else acc) 0 