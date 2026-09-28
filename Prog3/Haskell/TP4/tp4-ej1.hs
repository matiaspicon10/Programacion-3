-- a)
type Persona = (String, Int)

-- b)
type Agenda = [(String, Int)]

-- c)
edadDe :: String ->Agenda ->Maybe Int
edadDe _ [] = Nothing
edadDe n ((nombre,edad):xs)
    | n == nombre = Just edad
    | otherwise = edadDe n xs
   
