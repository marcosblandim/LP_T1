SolvePuzzle :: [[Int]] -> [[Int]]
SolvePuzzle(x:xs) = ((dica1 x)):(SolvePuzzle xs))
    where dica1 (x:xs) = -- if x == head xs -> ocorrencia da dica1
        
