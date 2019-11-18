-- Nao to conseguindo receber uma lista como input.
-- Por enquanto, o input é digitado na linha de codigo mesmo :(

-- Printar o tabuleiro formatado tambem nao ta rolando.

-- Como printar o segundo termo da lista:
{-
    lista = [1,2,3,4,5]
    print lista !! 1

-}

dica1 = tabuleiro

main = do
    
    -- Declarando e inicializando tabuleiro.
    --tabuleiro :: [[Int,Int,Int,Int,Int,Int,Int,Int],[Int,Int,Int,Int,Int,Int,Int,Int],[Int,Int,Int,Int,Int,Int,Int,Int],[Int,Int,Int,Int,Int,Int,Int,Int],[Int,Int,Int,Int,Int,Int,Int,Int],[Int,Int,Int,Int,Int,Int,Int,Int],[Int,Int,Int,Int,Int,Int,Int,Int],[Int,Int,Int,Int,Int,Int,Int,Int]]
    let tabuleiro = [[-1,-1,-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1,-1,-1]]
    
    -- Preencher tabuleiro com dica 1
    tabuleiro <- dica1 tablueiro

    -- Printar tabuleiro resolvido.
    print tabuleiro