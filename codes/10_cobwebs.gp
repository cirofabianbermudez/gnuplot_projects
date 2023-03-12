# Autor: Ciro Bermudez
# File: 10_cobwebs.gp
# Description: Cobwebs for chaotic maps
# Run: load "10_cobwebs.gp"

# reset
# set terminal wxt
# set output 

# Terminal pdfcairo default size 5in, 3in font "sans,12"  5:3 ratio
reset
unit = 1.5
set terminal pdfcairo size unit*5in, unit*3in font "Helvetica,16"
set output "10_cobwebs.pdf"
filename = "10_cobwebs.txt"

xleft = 0; xright = 1; xstep = 0.2
ydown = 0; yup = 1; ystep = 0.2

set xrange [xleft:xright]
set yrange [ydown:yup]

set xtics xleft,xstep,xright 
set ytics ydown,ystep,yup

set border 1+2+4+8

set key top right box
# set key at 6,0.95 Right box

set title "Cobwebs" 
set xlabel "x_n"; set ylabel "x_n+1"

grid_major = 100
grid_minor = 101

set style line grid_major dashtype 1 linecolor rgb "#E0E0E0"
set style line grid_minor dashtype 3 linecolor rgb "#C7C7C7"
set grid
set mxtics 5; set mytics 5; 
set grid mxtics mytics linestyle grid_major, lines grid_minor
set tics scale 1,0.01

# set tics font ",20"
# set key font ",20"
# set title font ",20"

graph_style = 102
set style line graph_style linecolor rgb "#000000"\
                                     linewidth 2 \
#                                     dashtype  1 \
#                                     pointsize 1 \
#                                     pointtype 4 \

unset key
set size square


beta = 3.0
if (ARGC >= 1) {
    beta = ARG1 + 0
}


f( x ) = beta * (x-x**2)
set label sprintf("r = %5.3f ",beta)  at 0.1,0.9
plot filename using 1:2 with lines linestyle graph_style,\
     x with lines linestyle graph_style,\
     f(x) with lines linestyle graph_style