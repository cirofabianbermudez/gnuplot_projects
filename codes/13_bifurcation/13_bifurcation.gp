# Autor: Ciro Bermudez
# File: 12_cobwebs.gp
# Description: Generate all images for animation
# Run: load "13_bifurcation.gp"

# -------------------- Settings ---------------------- #
reset
set term pngcairo enhanced size 1920, 1080 font ',14'
folderName = 'data'
system sprintf("mkdir %s", folderName)  # Make the folder

set size 1.0, 1.0
set origin 0.0, 0.0

set samples 1000


graph_style1 = 102
set style line graph_style1 linecolor rgb "#000000"\
                                       linewidth 2 \
#                                      dashtype  1 \
#                                      pointsize 1 \
#                                      pointtype 4 \

graph_style2 = 103
set style line graph_style2 linecolor rgb "#ff0000"\
                                       linewidth 2 \
#                                      dashtype  1 \
#                                      pointsize 1 \
#                                      pointtype 4 \

graph_style3 = 104
set style line graph_style3 linecolor rgb "#ff0000"\
#                                       linewidth 2 \
#                                      dashtype  1 \
#                                       pointtype 0 \
#                                      pointsize 0.001 \

step = 0.001
img_step = 10
n = 1/step
beta = 0.0
f( x ) = beta * (x-x**2)
unset key

do for [i=0:4*n:img_step] {
    beta = step*i;
    set output sprintf("%s/img_%04d.png", folderName, i/img_step)
    set multiplot
    # 0,0 Cobwebs plot
    set xrange [0:1]
    set yrange [0:1]
    set xtics 0,0.2,1 
    set ytics 0,0.2,1
    set size 0.5*(9.0/16.0),0.5
    set origin 0.125,0.0
    set grid
    set title "Cobwebs" 
    set xlabel "x_n"; set ylabel "x_n+1"
    plot "13_cobwebs.txt" index i using 1:2 with lines linestyle graph_style2,\
         x with lines linestyle graph_style1,\
         f(x) with lines linestyle graph_style1
    #  1,0 Bifurcation diagram
    set xrange [0:4]
    set yrange [-0.2:1]
    set xtics 0,1,4 
    set ytics -0.2,0.2,1
    set size 0.5,0.5
    set origin 0.5,0.0
    set grid
    set title "Bifurcation"
    set xlabel "r"
    set ylabel "stable"
    plot "13_bifurcation.txt" index 0:i  using 1:2 with dots linestyle graph_style3
    #  0,1 Time series
    set xrange [0:50]
    set yrange [0:1]
    set xtics 0,10,50 
    set ytics 0,0.2,1
    set size 0.5,0.5
    set origin 0.0,0.5
    set grid
    set title "time"
    set xlabel "x"
    set ylabel "xn" 
    plot "13_cobwebs.txt" index i every 2 using 1 with lines linestyle graph_style2
    
    #  1,1 Bifurcation diagram
    set xrange [3:4]
    set yrange [0:1]
    set xtics 3,0.1,4 
    set ytics -0,0.2,1
    set size 0.5,0.5
    set origin 0.5,0.5
    set grid
    set title "Bifurcation"
    set xlabel "r"
    set ylabel "stable"
    #set label 1 "Logistic map" at screen 0.55,0.9 font ',20'
    set label 2 sprintf("r = %5.3f ", beta) at screen 0.1,0.5 font ',20'
    plot "13_bifurcation.txt" index 0:i  using 1:2 with dots linestyle graph_style3
    # unset label 1
    unset label 2
    unset multiplot
    set output
}