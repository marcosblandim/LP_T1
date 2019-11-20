--import Control.Lens
import Data.List
import Data.List (transpose)
import Data.List (intercalate)


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
                            else if ((x == -1  && xs!!0 == 0 && xs!!1 == 1) || (x == 0  && xs!!0 == -1) || (x == -1  && xs!!0 == 1 && xs!!1 == -1) || (x == -1  && xs!!0 == 1 && xs!!1 == 0) || (x == 1  && xs!!0 == -1) || (x == -1  && xs!!0 == -1)) then x : seguidosLinhas (xs)
                            else if ((x == -1 && xs!!0 == 0 && xs!!1 == 0)) then 1 : seguidosLinhas(xs)
                            else if ((x == -1 && xs!!0 == 1 && xs!!1 == 1)) then 0 : seguidosLinhas(xs)
                            else (x:xs)
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
valida x y k = (validaLinha y && comparaLinhas x y && triosEmLista y)
-- Falta validar as colunas
--valida x y k = (validaLinha y && comparaLinhas x y && triosEmLista y && validaLinha ((transpose x)!!k) && comparaLinhas (transpose x) ((transpose x)!!k) && triosEmLista ((transpose x)!!k))

-- Roda as dicas em uma matriz o numero de vezes indicado
aplicaDicas :: [[Int]] -> Int -> [[Int]]
aplicaDicas x 0  = x
aplicaDicas x n = aplicaDicas (dicas(transpose(transpose(transpose(dicas (transpose x)))))) (n-1)

-- Percorre uma lista de listas e aplica uma regra a ela
dicas :: [[Int]] -> [[Int]]
dicas [] = []
dicas (x:xs) = ((seguidosLinhas (sanduicheLinhas x)) : dicas xs)

------------------------------------------------------------ Printar formatado 
-- print  = putStrLn $ showMat
showMat = unTable " " . equalizeCellLengths . (map . map) show

main = putStrLn $ showMat [[1,23,456],[78,-90,123],[4567,8,9]]

-- | Un-tabs, and intersperses the result with \\n. This converts a 2-dimensional
--   list of strings into a string where ends of a line are \\n, and the
--   individual cells are divided by \\t.
unTable :: String     -- ^ Column spacer
        -> [[String]] -- ^ Table
        -> String
unTable colSpacer = intercalate "\n" . map (intercalate colSpacer)

-- | Finds the length of the longest line of a table
maxLineLength :: [[a]] -> Int
maxLineLength = maximum . map length

-- | Calculates the length of the longest entry of each column.
maxCellLengthsPerColumn :: [[[a]]] -> [Int]
maxCellLengthsPerColumn = map maxLineLength . transpose

-- | Reformats the table.
equalizeCellLengths :: [[String]] -> [[String]]
equalizeCellLengths table = map (equalize maxLengths) table
    where
        maxLengths = maxCellLengthsPerColumn table

        -- equalize takes a list of lengths and a 2-dimensional table, and
        -- pads the columns so all entries have the same length.
        equalize = flip $ zipWith (padToLengthLeft ' ')

-- | Pads a list to a certain length on the right.
--
--   >>> padToLengthRight '.' "abc" 5
--   "abc.."
padToLengthLeft :: a   -- ^ Padding element
                -> [a] -- ^ List to be padded
                -> Int -- ^ Length to pad to
                -> [a]
padToLengthLeft padding list n = (replicate (n - length list) padding) ++ list
------------------------------------------------------------------------------

-- Backtrack por linha do tabuleiro:
-- Recebe matriz, linha, indice do termo na linha e retorna linha preenchida

-- backtrackLinha :: [[Int]] -> [Int] -> Int -> [[Int]]
-- backtrackLinha _ _ 8 = [[]]
-- backtrackLinha y (x:xs) k = [m:ms | m <- [0,1]
--                                 , ms <- backtrackLinha y (x:xs) (k+1)
--                                 , valida y (m:ms) k || (x /= -1 && m == x)]

-- backtrackLinha y (x:xs) k = if valida

-- -- Bruteforce
-- backtrack :: [[Int]] -> [[Int]]
-- backtrack (x:xs) = [[]]


-- Funcao final: resolve o tabuleiro
-- resolvePuzzle :: [[Int]] -> [[Int]]
-- resolvePuzzle

-- Teste
-- [[-1,0,-1,-1,-1,-1,-1,-1]
-- [[-1,-1,-1,1-1,-1,1-1,-1,0],[-1,-1,0,-1,-1,-1,-1,-1],[-1,1-1,-1,-1,-1,-1,-1],[-1,0,-1,-1,-1,-1,-1],[-1,-1,-1,1-1,-1,1-1,-1,0],[-1,-1,0,-1,-1,-1,-1,-1,-1,-1],[-1,1-1,-1,-1,-1,-1,-1]] [-1,-1,-1,1-1,-1,1-1,-1,0] 1
-- backtrackLinha [[-1,0,-1,-1,-1,-1,-1,-1],[-1,-1,-1,1,-1,1,-1,0],[-1,-1,0,-1,-1,-1,-1,-1],[-1,1,-1,-1,-1,-1,-1,-1],[-1,0,-1,-1,-1,-1,-1,-1],[-1,-1,-1,1,-1,1,-1,0],[-1,-1,0,-1,-1,-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1,-1,-1]] [-1,0,-1,-1,-1,-1,-1,-1] 1

-- [  ,  ,  ,  , 1,  ,  , 1]
-- [  ,  , 1,  , 1,  ,  ,  ]
-- [ 1,  , 1,  ,  , 1,  ,  ]
-- [  ,  ,  , 1,  ,  , 1, 0]
-- [ 1, 0,  ,  ,  ,  ,  , 1]
-- [  , 0,  ,  ,  ,  , 0,  ]
-- [  ,  , 0, 0,  ,  ,  , 0]
-- [  ,  ,  ,  , 0,  , 0,  ] 

-- [  ,  ,  ,  , 1,  ,  , 1] 1

-- valida [[-1,-1,-1,-1, 1,-1,-1, 1],[-1,-1, 1,-1, 1,-1,-1,-1],[ 1,-1, 1,-1,-1, 1,-1,-1],[-1,-1,-1, 1,-1,-1, 1, 0],[ 1, 0,-1,-1,-1,-1,-1, 1],[-1, 0,-1,-1,-1,-1, 0,-1],[-1,-1, 0, 0,-1,-1,-1, 0],[-1,-1,-1,-1, 0,-1, 0,-1]] [-1,-1,-1,-1, 1,-1,-1, 1] 1

-- aplicaDicas [[-1,-1,-1,-1, 1,-1,-1, 1],[-1,-1, 1,-1, 1,-1,-1,-1],[ 1,-1, 1,-1,-1, 1,-1,-1],[-1,-1,-1, 1,-1,-1, 1, 0],[ 1, 0,-1,-1,-1,-1,-1, 1],[-1, 0,-1,-1,-1,-1, 0,-1],[-1,-1, 0, 0,-1,-1,-1, 0],[-1,-1,-1,-1, 0,-1, 0,-1]] 1000
-- putStrLn $ showMat $[[-1,-1,0,-1,1,-1,-1,1],[-1,-1,1,0,1,-1,-1,-1],[1,0,1,-1,0,1,-1,-1],[0,1,0,1,-1,-1,1,0],[1,0,-1,-1,-1,-1,-1,1],[-1,0,-1,-1,-1,-1,0,-1],[-1,1,0,0,1,0,1,0],[-1,-1,-1,-1,0,1,0,-1]]

[            1        1]       [      0     1        1]
[      1     1         ]       [      1  0  1         ]
[1     1        1      ]       [1  0  1     0  1      ]
[         1        1  0]  ->   [0  1  0  1        1  0]
[1  0                 1]  ->   [1  0                 1]
[   0              0   ]       [   0              0   ]
[      0  0           0]       [   1  0  0  1  0  1  0]
[            0     0   ]       [            0  1  0   ]
