load 'figure10c.pal'

set term epslatex color size 2.2, 2.0 font "phv"
set xlabel "Time (s)"
set xtics border nomirror autofreq 250 format "%.0s"
set ytics border nomirror autofreq 100 format "%.0s"
set lmargin at screen 0.00
set rmargin at screen 1.0
set tmargin at screen 0.85
set border 3
set key inside center top horizontal

unset grid

set xrange[0:800]
set yrange[:250]
stab_new_net = system('grep "^1500000\." new.csv | cut -f 5')
stab_new_E = system('grep "^1500000\." new.csv | cut -f 3')
stab_new_I = system('grep "^1500000\." new.csv | cut -f 4')

set arrow from 250, graph 0 to 250, graph 1 nohead lt 0 lc 1
set arrow from 500, graph 0 to 500, graph 1 nohead lt 0 lc 1
set arrow from 750, graph 0 to 750, graph 1 nohead lt 0 lc 1

set output "single-neuron-inputs-new.tex"
plot "new.csv" using ($1/1000 - 1500):(($3-stab_new_E)*0.5) with lines ls 2 title "E", "new.csv" using ($1/1000 - 1500):(($4-stab_new_I)*3) with lines ls 6 title "I", "new.csv" using ($1/1000 - 1500):($5-stab_new_net) with lines lc 1 title "Net",
