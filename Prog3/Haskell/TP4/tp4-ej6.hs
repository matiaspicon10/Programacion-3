import Data.Maybe (catMaybes)
--- a)
divisionSegura :: Float ->Float ->Maybe Float
divisionSegura _ 0 = Nothing
divisionSegura a b = Just (a/b)

--- b) 
divisionValida :: [(Float, Float)] -> [Float]
divisionValida [] = []
divisionValida ((x,y):xs) = catMaybes [divisionSegura x y] ++ divisionValida xs

--- c)
type Resultado a = Either String a

divisionSegura'  :: Float ->Float ->Resultado Float
divisionSegura' _ 0 = Left "Error: no se puede dividir por cero"
divisionSegura' a b = Right (a/b)

