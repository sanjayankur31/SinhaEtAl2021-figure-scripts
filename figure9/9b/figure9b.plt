# Stacked histograms showing incoming connections
# https://stackoverflow.com/questions/10881747/how-to-plot-specific-rows-in-gnuplot
# http://psy.swansea.ac.uk/staff/carter/gnuplot/gnuplot_histograms.htm
# http://gnuplot.sourceforge.net/demo/histograms.8.gnu (8th example)


# Note that I iterate the columns in reverse so that the connections are
# plotted from the outside inwards. This is simply because there are usually
# more connections in the non LPZ regions where there are more neurons.

# For the LaTeX output, one needs to fix the labels, since they have double subscripts and so on. These are read from the data files.

# load '/home/asinha/Documents/02_Code/00_mine/Sinha2016-scripts/postprocess/gnuplot/firing-rates-palette.pal'
set term epslatex color size 4.5, 2.5 font "phv"
set xlabel "Time (\\(\\times 1000s\\))"
set ylabel "Synapses" offset 3.5,0

set border 3
set ytics border nomirror
set xtics border nomirror

set lmargin at screen 0.10
set rmargin at screen 1.0
set tmargin at screen 0.99

set format y "%.1t x 10\\textsuperscript\{%T\}"

# rowstacked histograms
set style histogram rowstacked
set style data histograms
set boxwidth 0.6 relative

# bmargin center horizontal is for placement of the key in the graph
# Left reverse is for the placement of the text for each entry
# set key bmargin center horizontal Left reverse noenhanced autotitle columnhead nobox height 1.25 maxcols 3
set key tmargin center horizontal samplen 1 nobox

simid="201908061027"

## LPZ C
set yrange [0:170000]
set output simid."-75-connection-rowstacked-histograms-I-to-p_lpz_E.tex"
plot for [COL=5:2:-1] '75-syn_conns-incoming-totals-p_lpz_E-IE.txt' every 1 using COL:xtic(sprintf("%.1f", $1/1000)) fill pattern COL-1 title columnheader
