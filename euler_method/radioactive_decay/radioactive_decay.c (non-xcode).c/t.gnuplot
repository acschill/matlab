# set terminal pngcairo transparent enhanced font "arial,10" fontscale 1.0 size 200, 200
# /Users/alex/.Trash/graphinfo.p set output 'hw1output.png'
#//gcc -o main main.c
#//gnuplot -e "filename='decay.txt'" t.gnuplot

set title "Uranium Radioactive Decay" font "arial,20"
set xlabel "time" font "arial,20"
set ylabel "number of nuclei" font "arial,20"
set xtics auto
set ytics auto
#set xrange [0:10000]
#set yrange [0:30]
set linetype 2 dashtype 2 linecolor "blue"
plot "decay.txt" using 1:2 w line
