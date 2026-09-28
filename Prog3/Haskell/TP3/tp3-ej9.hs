-- a)
funA :: [Integer] -> [Integer]
funA = filter odd . map (+1) 

funA' :: [Integer] -> [Integer]
funA' = map (+1) . filter odd
                                                                                                                                    
-- b)
--- I)

contarPares :: [Integer] -> Int
contarPares = length . filter even

--- II)
eliminarNegativos :: [Integer] -> [Integer]
eliminarNegativos = filter (>0)

--- III)
invertir :: [[a]] -> [[a]] 
invertir = map  (reverse)

--- IV) 
--paridad :: [Int] -> [Bool]
--paridad = map even