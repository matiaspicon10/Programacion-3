misterio :: [a] -> [a]
misterio [] = []
misterio (x:xs) = misterio xs ++ [x]

mistfoldr :: [a] -> [a]
mistfoldr = foldr (\ x xs -> xs ++ [x])  []


