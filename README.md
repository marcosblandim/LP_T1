# LP_T1
Trabalho 1 da matéria Linguagens de Programação. O trabalho consiste em um Binary Puzzle Solver desenvolvido na linguagem funcional Haskell. http://www.binarypuzzle.com/rules.php
### Descrição:
Este jogo é parecido com sudoku, mas as células podem ter apenas 0 e 1, veja as regras no link
acima. Implemente um programa que recebe como entrada a situação inicial do tabuleiro, e retorne
como saída o tabuleiro totalmente preenchido. Utilize tabuleiros de 8x8.
Dica: utilize as dicas (tips) do site para diminuir a quantidade de tentativas
### Entrada:
Uma matriz indicando cada posição do tabuleiro e seu valor
### Saída:
O tabuleiro completamente preenchido
### Entrada: 
[[,0,,,,,,],[,,,1,,1,,0],[,,0,,,,,,,,],[,1,,,,,,],[,0,,,,,,],[,,,1,,1,,0],[,,0,,,,,,,,],[,1,,,,,,]]
### Saída:
1 0 1 0 1 0 1 0

0 1 0 1 0 1 1 0

1 0 0 1 1 0 0 1

0 1 1 0 0 1 1 0

0 1 0 1 1 0 0 1

1 0 1 0 1 1 0 0

1 0 0 1 0 0 1 1

0 1 1 0 0 1 0 1

## Regras (em inglês):

Each binary puzzle has to be solved according to the following rules:

1. Each box should contain either a zero or a one.

2. More than two equal numbers immediately next to or below each are not allowed.

3. Each row and each column should contain an equal number of zeros and ones.

4. Each row is unique and each column is unique. Thus, any row cannot be exactly equal to another row, and any column cannot be exactly equal to another column.

Each binary puzzle has a unique solution. It is always possible to make a next step by reasoning. In other words, the solution can always be found without guessing.

Access this site for tips http://www.binarypuzzle.com/tips.php 