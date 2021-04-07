# Usage: gnuplot plot-firing-rates-IE-tex.plt
load 'figure4b.pal'
set term epslatex color size 4.7, 1.5 font "phv"
set xlabel "Time (\\(\\times 1000s\\))"
set ylabel "CC"
set border 3
set ytics border nomirror 0.5
set xtics border nomirror 2000 format "%.0s"
set lmargin at screen 0.01
set rmargin at screen 1.0
set tmargin at screen 0.99
set yrange[-0.5:0.5]
set key inside center top horizontal

simulation="201908061027"
inputtime1="1500.0"
inputtime2="2001.5"
inputtime3="4000.0"
inputtime4="18000.0"


set arrow nohead from first inputtime1, first -0.5 to first inputtime1, first 0.5 ls 0 lw 2 dt 2
set arrow nohead from first inputtime2, first -0.5 to first inputtime2, first 0.5 ls 0 lw 2 dt 2
set arrow nohead from first inputtime3, first -0.5 to first inputtime3, first 0.5 ls 0 lw 2 dt 2
set arrow nohead from first inputtime4, first -0.5 to first inputtime4, first 0.5 ls 0 lw 2 dt 2
# Horizontal line marking 0
set arrow nohead from first 0, first 0 to graph 1, first 0 ls 1 lc black lw 4
# Horizontal line marking 0.1
set arrow nohead from first 0, first 0.1 to graph 1, first 0.1 ls 0 lc black lw 1 dt 2

set output simulation."-CC-lpz_c_E-p_lpz_E.tex"
set title ""
plot "cc-lpz_c_E.gdf" using 1:3 with linespoints ls 1 pt 7 ps 0.4 title "LPZ C", "cc-p_lpz_E.gdf" using 1:3 with linespoints ls 3 lw 2 pt 7 ps 0.4 title "Peri-LPZ";
# column 2 is the number of neurons that were used to calculate the mean CC
