import Control.Lens

{-retornaLista :: [Int] -> [Int] 
retornaLista [] = []
retornaLista (x:xs) = element-}


-- Substitiu um valor escolhido em um indice escolhido e retorna a lista modificada
replace' :: Int -> Int -> [Int] -> [Int]
replace' _ _ [] = []
replace' n novoValor (x:xs) = if n == 0 
                                then (novoValor:xs)
                             else (x:(replace' (n-1) novoValor xs))

-- Aplica as dicas de 00_ = 001, _00 = 100, 11_ = 110, _11 = 011
dicaSeguidos :: [Int] -> [Int]
dicaSeguidos [] = []
dicaSeguidos (x:xs) =   if length (x:xs) > 2  then
                            if x == 1 && xs!!0 == 1 then x : dicaSeguidos (replace' 1 0 xs)
                            else if x == 0 && xs!!0 == 0 then x : dicaSeguidos (replace' 1 1 xs)
                            else if ((x == 1 && xs!!0 == 0) || (x == 0 && xs!!0 == 1)) then x : dicaSeguidos (xs)
                            else if ((x == -1  && xs!!0 == 0 && xs!!1 == 1) || (x == 0  && xs!!0 == -1) || (x == -1  && xs!!0 == 1 && xs!!1 == 0) || (x == 1  && xs!!0 == -1) || (x == -1  && xs!!0 == -1)) then x : dicaSeguidos (xs)
                            else if ((x == -1 && xs!!0 == 0 && xs!!1 == 0)) then 1 : dicaSeguidos(xs)
                            else if ((x == -1 && xs!!0 == 1 && xs!!1 == 1)) then 0 : dicaSeguidos(xs)
                            else []
                        else (x:xs)

-- Aplica as dicas de 0_0 = 010, 1_1 = 101
sanduiche :: [Int] -> [Int]
sanduiche [] = []
sanduiche (x:xs) = if length (x:xs) > 2 then
                        if x == 1 && xs!!1 == 1 then x : sanduiche (replace' 0 0 xs)
                        else if x == 0 && xs!!1 == 0 then x : sanduiche (replace' 0 1 xs)
                        else x : sanduiche xs
                    else (x:xs)


-- Percorre uma lista de listas e aplica uma regra a ela
todaLista :: [[Int]] -> [[Int]]
todaLista [] = []
todaLista (x:xs) = ((dicaSeguidos x) : todaLista xs)

-----------------------------------------------------------------------------------------------------------------------

SolvePuzzle :: [[Int]] -> [[Int]]
SolvePuzzle(x:xs) = ((dica1 x)):(SolvePuzzle xs))
    where dica1 (x:xs) = -- if x == head xs -> ocorrencia da dica1
        
