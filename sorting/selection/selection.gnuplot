set terminal pngcairo size 1000,600 enhanced font 'Verdana,10'
set output 'sorting/selection/grafico_selection_julia100.png'

set title 'Tempo médio de execução - Selection Sort'
set xlabel 'Tamanho do vetor'
set ylabel 'Tempo (segundos)'

set grid
set key off

# Eixo X vai de 100 a 10000, com incremento de 100
plot 'sorting/selection/data/times_selection.txt' using (100 * $0 + 100):1 with lines lt rgb "#1f77b4" lw 2