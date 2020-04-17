# load '/home/asinha/Documents/02_Code/00_repos/00_mine/gnuplot-palettes/paired.pal'
set term epslatex color size 2.2, 2.0 font "phv"
set xlabel "Time (s)"
set xtics border nomirror autofreq 250 format "%.0s"
set ytics border nomirror autofreq 2 format "%.0s"
set lmargin at screen 0.00
set rmargin at screen 1.0
set tmargin at screen 0.85
set border 3

unset grid

set xrange[0:800]

set arrow from 250, graph 0 to 250, graph 1 nohead lt 0 lc 1
set arrow from 500, graph 0 to 500, graph 1 nohead lt 0 lc 1
set arrow from 750, graph 0 to 750, graph 1 nohead lt 0 lc 1
# Only plot one since they're identical
set output "single-neuron-calciums.tex"
set ylabel "\\([Ca^{2+}]\\)"
set title ""
plot "new.csv" using ($1/1000 - 1500):2 with lines lw 2 lc 0 title "";
