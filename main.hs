--import Control.Lens

replace' :: Int -> Int -> [Int] -> [Int]
replace' _ _ [] = []
replace' n novoValor (x:xs) = if n == 0
                                then (novoValor:xs)
                            else (x:(replace' (n-1) novoValor xs))

dica1 :: [[Int]] -> [[Int]]
dica1(x:xs) = ((dica1Linha x)):(dica1 xs))
    where dica1Linha (x:xs) = if (fst xs == snd xs) && x == -1
                                then if 
        
        -- if x == head xs -> ocorrencia da dica1
        
