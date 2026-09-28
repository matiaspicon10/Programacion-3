aplicarSi :: (a -> Bool) -> (a -> a) -> a -> a
aplicarSi c f n = 
    if c n
        then f n
        else n