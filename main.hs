--import Control.Lens
import Data.List

-- Substitiu um valor escolhido em um indice escolhido e retorna a lista modificada
replace' :: Int -> Int -> [Int] -> [Int]
replac [] = []
replace' n novoValor (x:xs) = if n == 0 
                                then (novoValor:xs)
                             else (x:(replace' (n-1) novoValor xs))

-- Aplica as dicas de 00_ = 001, _00 = 100, 11_ = 110, _11 = 011
seguidosLinhas :: [Int] -> [Int]
seguidosLinhas [] = []
seguidosLinhas (x:xs) =   if length (x:xs) > 2  then
                            if x == 1 && xs!!0 == 1 then x : seguidosLinhas (replace' 1 0 xs)
                            else if x == 0 && xs!!0 == 0 then x : seguidosLinhas (replace' 1 1 xs)
                            else if ((x == 1 && xs!!0 == 0) || (x == 0 && xs!!0 == 1)) then x : seguidosLinhas (xs)
                            else if ((x == -1  && xs!!0 == 0 && xs!!1 == 1) || (x == 0  && xs!!0 == -1) || (x == -1  && xs!!0 == 1 && xs!!1 == 0) || (x == 1  && xs!!0 == -1) || (x == -1  && xs!!0 == -1)) then x : seguidosLinhas (xs)
                            else if ((x == -1 && xs!!0 == 0 && xs!!1 == 0)) then 1 : seguidosLinhas(xs)
                            else if ((x == -1 && xs!!0 == 1 && xs!!1 == 1)) then 0 : seguidosLinhas(xs)
                            else []
                        else (x:xs)

-- Aplica as dicas de 0_0 = 010, 1_1 = 101
sanduicheLinhas :: [Int] -> [Int]
sanduicheLinhas [] = []
sanduicheLinhas (x:xs) = if length (x:xs) > 2 then
                        if x == 1 && xs!!1 == 1 then x : sanduicheLinhas (replace' 0 0 xs)
                        else if x == 0 && xs!!1 == 0 then x : sanduicheLinhas (replace' 0 1 xs)
                        else x : sanduicheLinhas xs
                    else (x:xs)

-- Percorre uma lista de listas e aplica uma regra a ela
todaLista :: [[Int]] -> [[Int]]
todaLista [] = []
todaLista (x:xs) = ((seguidosLinhas x) : todaLista xs)

-- Retorna quantas ocorrencias na lista
conta :: [Int] -> Int -> Int
conta [] _ = 0
conta (x:xs) n = length $ filter (==n) (x:xs)

-- Validacoes para o bruteforce
-- Confere se linha tem menos que 4 0's e 1's
validaLinha :: [Int] -> Bool
validaLinha x = conta x 1 <= 4 && conta x 0 <= 4  
-- Procura por linhas iguais
comparaLinhas :: [[Int]] -> [Int] -> Bool
comparaLinhas x y = not(any (y==) (x))
-- Procura por trios
triosEmLista :: [Int] -> Bool
triosEmLista (x:xs) = if length xs >= 2 then
                        if x /= -1 && x == xs!!0 && x == xs!!1 then False
                        else triosEmLista xs
                    else True

-- Faz todas as validacoes
valida :: [[Int]] -> [Int] -> Int -> Bool
valida x y k = validaLinha y && comparaLinhas x y && triosEmLista y && validaLinha ((transpose x)!!k) && comparaLinhas (transpose x) ((transpose x)!!k) && triosEmLista ((transpose x)!!k)

-- Backtrack por linha do tabuleiro:
-- Recebe matriz, linha, indice do termo na linha e retorna linha preenchida
backtrackLinha :: [[Int]] -> [Int] -> Int -> [Int]
backtrackLinha _ _ 8 = []
backtrackLinha y (x:xs) k = [m:ms | m <- [0,1]
                                , ms <- backtrackLinha y (x:xs) (k+1)
                                , valida y (m:ms) k || (x /= -1 && m == x)]

-- Bruteforce
backtrack :: [[Int]] -> [[Int]]
backtrack (x:xs) = [[]]


-- Funcao final: resolve o tabuleiro
-- resolvePuzzle :: [[Int]] -> [[Int]]
-- resolvePuzzle

-- Teste
-- [[-1,0,-1,-1,-1,-1,-1,-1],[-1,-1,-1,1-1,-1,1-1,-1,0],[-1,-1,0,-1,-1,-1,-1,-1,-1,-1],[-1,1-1,-1,-1,-1,-1,-1],[-1,0,-1,-1,-1,-1,-1],[-1,-1,-1,1-1,-1,1-1,-1,0],[-1,-1,0,-1,-1,-1,-1,-1,-1,-1],[-1,1-1,-1,-1,-1,-1,-1]]
-- backtrackLinha [[-1,0,-1,-1,-1,-1,-1,-1],[-1,-1,-1,1,-1,1,-1,0],[-1,-1,0,-1,-1,-1,-1,-1],[-1,1,-1,-1,-1,-1,-1,-1],[-1,0,-1,-1,-1,-1,-1,-1],[-1,-1,-1,1,-1,1,-1,0],[-1,-1,0,-1,-1,-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1,-1,-1]] [-1,0,-1,-1,-1,-1,-1,-1] 1