set terminal pngcairo size 1000,600 enhanced font 'Verdana,10'
set output 'data/graphics/grafico_distribution_julia.png'

set title 'Tempo de Execução - Distribution Sort'
set xlabel 'Tamanho do vetor'
set ylabel 'Tempo (nanosegundos)'  # Você mencionou que agora está salvando em ns

set grid
set key top left box               

# Eixo X vai de 100 a 1000, com incremento de 100
plot 'data/times/times_distribution-100-100-1000.txt' using (100 * $0 + 100):1 \
     title 'Distribution Sort (Julia)' with linespoints \
     lt rgb "#9b30ff" pt 1 ps 2 lw 2
