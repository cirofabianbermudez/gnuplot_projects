# Autor: Ciro Bermudez
# File: 12_cobwebs.gp
# Description: Generate all images for animation
# Run: load "12_cobwebs.gp"

# -------------------- Settings ---------------------- #
reset
set term pngcairo enhanced size 1280, 720 font ', 20'
folderName = 'data'
filename = "12_cobwebs.txt"
system sprintf("mkdir %s", folderName)  # Make the folder

xleft = 0; xright = 1; xstep = 0.2
ydown = 0; yup = 1; ystep = 0.2

set xrange [xleft:xright]
set yrange [ydown:yup]

set xtics xleft,xstep,xright 
set ytics ydown,ystep,yup

set title "Cobwebs" 
set xlabel "x_n"; set ylabel "x_n+1"

graph_style1 = 102
set style line graph_style1 linecolor rgb "#000000"\
                                     linewidth 2 \
#                                     dashtype  1 \
#                                     pointsize 1 \
#                                     pointtype 4 \

graph_style2 = 103
set style line graph_style2 linecolor rgb "#ff0000"\
                                     linewidth 2 \
#                                     dashtype  1 \
#                                     pointsize 1 \
#  

unset key
set size square
beta = 0.0;
f( x ) = beta * (x-x**2)

do for [i=0:400:1] {
    set output sprintf("%s/img_%04d.png", folderName, i)
    set label 1 sprintf("r = %5.3f ",beta)  at 0.1,0.9
    plot filename index i using 1:2 with lines linestyle graph_style2,\
    x with lines linestyle graph_style1,\
    f(x) with lines linestyle graph_style1
    beta = beta + 0.01
    set output
}
