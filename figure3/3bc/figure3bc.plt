# Usage: gnuplot plot-firing-rates-IE-tex.plt
load 'figure3bc.pal'
set term epslatex color size 4.7, 1.5 font "phv"
set xlabel "Time (\\(\\times 1000s\\))"
set ylabel "Firing rate (Hz)"
set border 3
set ytics border nomirror autofreq 2
set xtics border nomirror 2000 format "%.0s"
set lmargin at screen 0.01
set rmargin at screen 1.0
set tmargin at screen 0.99
set yrange [0:7]
set key inside center top horizontal

simulation="201908061027"
inputtime1="1500.0"
inputtime2="2001.5"
inputtime3="4000.0"
inputtime4="18000.0"


set arrow nohead from first inputtime1, first -0.5 to first inputtime1, first 7 ls 0 lw 2 dt 2
set arrow nohead from first inputtime2, first -0.5 to first inputtime2, first 7 ls 0 lw 2 dt 2
set arrow nohead from first inputtime3, first -0.5 to first inputtime3, first 7 ls 0 lw 2 dt 2
set arrow nohead from first inputtime4, first -0.5 to first inputtime4, first 7 ls 0 lw 2 dt 2

set output simulation."-mean-firing-rates-lpz_c_I-E-zoomed.tex"
set title ""
plot "mean-firing-rates-lpz_c_E.gdf" every 100 with lines ls 1  title "E", "mean-firing-rates-lpz_c_I.gdf" every 100 with lines ls 6 title "I";

set output simulation."-mean-firing-rates-p_lpz_I-E-zoomed.tex"
set title ""
plot "mean-firing-rates-p_lpz_E.gdf" every 100 with lines ls 1  title "E", "mean-firing-rates-p_lpz_I.gdf" every 100 with lines ls 6 title "I";
