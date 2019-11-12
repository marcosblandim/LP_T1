# LP_T1
Trabalho 1 da matéria Linguagens de Programação. O trabalho consiste em um Binary Puzzle Solver desenvolvido na linguagem funcional Haskell. http://www.binarypuzzle.com/rules.php
# Descrição:
Este jogo é parecido com sudoku, mas as células podem ter apenas 0 e 1, veja as regras no link
acima. Implemente um programa que recebe como entrada a situação inicial do tabuleiro, e retorne
como saída o tabuleiro totalmente preenchido. Utilize tabuleiros de 8x8.
Dica: utilize as dicas (tips) do site para diminuir a quantidade de tentativas
# Entrada:
Uma matriz indicando cada posição do tabuleiro e seu valor
# Saída:
O tabuleiro completamente preenchido
# Entrada: [[,0,,,,,,],[,,,1,,1,,0],[,,0,,,,,,,,],[,1,,,,,,],[,0,,,,,,],[,,,1,,1,,0],[,,0,,,,,,,,],[,1,,,,,,]]
# Saída:
1 0 1 0 1 0 1 0
0 1 0 1 0 1 1 0
1 0 0 1 1 0 0 1
0 1 1 0 0 1 1 0
0 1 0 1 1 0 0 1
1 0 1 0 1 1 0 0
1 0 0 1 0 0 1 1
0 1 1 0 0 1 0 1

