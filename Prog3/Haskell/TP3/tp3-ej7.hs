-- a)
esPar :: Integral a => a -> Bool
esPar x = (x `mod` 2 == 0)

esImpar :: Integral a => a -> Bool
esImpar = not . esPar

-- b)
fun :: Integer -> Integer
fun = (+1) . (*2) . (+2)

ejd :: Integer
ejd = (*3) . (+5) $ 10

