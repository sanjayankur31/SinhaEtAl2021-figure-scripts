# load '/home/asinha/Documents/02_Code/00_mine/Sinha2016-scripts/postprocess/gnuplot/firing-rates-palette.pal'

# Helper functions
# https://stackoverflow.com/a/21087936/375067
init_margins(left, right, gap, cols) = \
  sprintf('left_margin = %f; right_margin = %f;', left, right) . \
  sprintf('col_count = %d; gap_size = %f;', cols, gap)
set_margins(col) = sprintf('set lmargin at screen %f;', get_lmargin(col)) . \
  sprintf('set rmargin at screen %f;', get_rmargin(col));
get_lmargin(col) = (left_margin + (col - 1) * (gap_size + ((right_margin - left_margin)-(col_count - 1) * gap_size)/col_count))
get_rmargin(col) = (left_margin + (col - 1) * gap_size + col * ((right_margin - left_margin)-(col_count - 1) * gap_size)/col_count)
file_exists(fname) = system("[ -f '".fname."' ] && echo '1' || echo '0'") + 0

set term epslatex color size 5.2, 1.7 font "phv"
unset xtics
unset ytics
set size ratio -1
set bmargin at screen 0.01
set tmargin at screen 1.0
unset border

# No key
unset key
unset cbrange
unset colorbox


# Need to calculate these from data
o_x = 5960
o_y = 7467
r_lpz_c = 1141
r_lpz_b = 1594
r_p_lpz = 2352

set xrange[o_x-1.5*r_p_lpz:o_x+1.5*r_p_lpz]
set yrange[o_y-1.5*r_p_lpz:o_y+1.5*r_p_lpz]

# Circles denoting areas
# set offset 400, 400, 400, 400
set object 10 rectangle fc rgb "black" fs transparent solid 0.1 noborder from graph 0, graph 0 to graph 1, graph 1 behind
set object 11 circle at o_x,o_y size r_p_lpz fc rgb "green" fs transparent solid 0.3 noborder behind
set object 12 circle at o_x,o_y size r_lpz_b fc rgb "yellow" fs transparent solid 0.3 noborder behind
set object 13 circle at o_x,o_y size r_lpz_c fc rgb "red" fs transparent solid 0.1 noborder behind

# Variables
# Simulation
simulation = "201908061027"
# Number of images to put in the row
num_images = 3
# inputtimes
inputtime1="2000.0"
inputtime2="4000.0"
inputtime3="18000.0"

# line colours
# Excitatory synapses
set linestyle 1 lc rgb '#3b4cc0' lw 0.25 pt 7 ps 0.75
# Inhibitory synapses
set linestyle 2 lc rgb '#f7a789' lw 0.25 pt 7 ps 0.75
# Central neuron style
set linestyle 3 lc rgb 'black' lw 0.25 pt 7 ps 0.75

# neuron set
neuron_set = "lpz_c_I"
# Incoming or outgoing
conn_type = "out"


# type of synapse 1
synapse_set = "IE"
# Labels.
# set label 1 "Excitatory" at graph 0.1, 0.9 front
set label 1 "Inhibitory" at graph 0.1, 0.9 front
# Style for line
mylinestyle=2
# Style for src neurons
mysrcstyle=3
# Style for target neurons
mytgtstyle=1

set output simulation."-75-conns-top-".synapse_set."-".neuron_set."-".conn_type.".tex"
eval(init_margins(0.01, 0.99, 0.001, num_images))
set multiplot layout 1, num_images


# Incoming
do for [i=1:(num_images)] {
    inputtime = value(sprintf('inputtime%d', i))
    inputfile = "75-conns-top-".synapse_set."-".neuron_set."-".inputtime."-".conn_type.".txt"
    if (file_exists(inputfile)) {
        eval(set_margins(i))
        plot inputfile using 1:2:($3-$1):($4-$2) with vectors ls mylinestyle nohead title "", inputfile using 1:2 with points ls mysrcstyle title "", inputfile using 3:4 with points ls mytgtstyle title ""
    }
        # Unset so that they only show on first graph
        unset label 1
        # unset label 2
    else {
        print inputfile." not found. Exiting"
        exit
    }
}
