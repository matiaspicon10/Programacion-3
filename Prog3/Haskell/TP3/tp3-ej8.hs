suma' :: Integer -> Integer -> Integer
suma' x = (x+)

suma'' :: Integer -> Integer -> Integer
suma'' = (+)

duplica :: Int -> Int
duplica = (*2)

incrementar :: Int -> Int
incrementar x = x + 1

incrementar' :: Int -> Int
incrementar' = (+ 1)

-- c)
fun :: Int -> Int
fun = duplica . incrementar