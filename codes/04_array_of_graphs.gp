# Autor: Ciro Bermudez
# File: 04_array_of_graphs.gp
# Description: Array of graphs
# Run: load "04_array_of_graphs.gp"

# reset
# set terminal wxt
# set output 

# Terminal default size 5in, 3in font "sans,12"
reset
unit = 1.5
set terminal pdfcairo size unit*5in, unit*6in font "Helvetica,16"
set output "04_array_of_graphs.pdf"

xleft = 0; xright = 2*pi; xstep = 1
ydown = -1; yup = 1; ystep = 0.2

set xrange [xleft:xright]
set yrange [ydown:yup]

set xtics xleft,xstep,xright 
set ytics ydown,ystep,yup

set border 1+2+4+8

set key top right box
# set key at 6,0.95 Right box

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

graph_style_1 = 102
set style line graph_style_1 linecolor rgb "#0000ff"\
                                       linewidth 1 \
                                       dashtype  1 \
#                                      pointsize 1 \
#                                      pointtype 4 \

graph_style_2 = 103
set style line graph_style_2 linecolor rgb "#ff0000"\
                                       linewidth 1 \
                                       dashtype  1 \
#                                      pointsize 1 \
#                                      pointtype 4 \
           
set multiplot layout 2,1
           
set samples 63
set dummy t

set title "f(t) = sin(t)" 
set xlabel "t"; set ylabel "f(t)"
f( t, a, w ) = a*sin(w*t)
plot f( t, 1, 1 ) title "1*sin(1*t)" with lines linestyle graph_style_1

set title "f(t) = cos(t)" 
set xlabel "t"; set ylabel "f(t)"
g( t, a, w ) = a*cos(w*t)
plot g( t, 1, 1 ) title "1*cos(1*t)" with lines linestyle graph_style_2


