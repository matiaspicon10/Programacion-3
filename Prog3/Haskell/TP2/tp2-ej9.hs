acumulador acc f g [] = acc
acumulador acc f g (x:xs) = g (f x) (acumulador acc f g xs)