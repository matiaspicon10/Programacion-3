myLength :: [a] -> Int
myLength = foldr (\a acc -> acc + 1) 0
