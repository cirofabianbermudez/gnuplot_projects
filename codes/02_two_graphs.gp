# Autor: Ciro Bermudez
# File: 02_two_graphs.gp
# Description: Two simple graphs
# Run: load "02_two_graphs.gp"

# reset
# set terminal wxt
# set output 

# Terminal default size 5in, 3in font "sans,12"
reset
set terminal pdfcairo size 7.5in, 4.5in font "Helvetica,16"
set output "02_two_graphs.pdf"

xleft = 0; xright = 2*pi; xstep = 1
ydown = -1; yup = 1; ystep = 0.2

set xrange [xleft:xright]
set yrange [ydown:yup]

set xtics xleft,xstep,xright 
set ytics ydown,ystep,yup

set border 1+2+4+8

set key bottom left box
#set key at 6,0.95 Right box

set title "f(t) = sin(t)" 
set xlabel "t"; set ylabel "f(t)"

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
                                     
set samples 63
set dummy t
f( t, a, w ) = a*sin(w*t)
g( t, a, w ) = a*cos(w*t)
plot f( t, 1, 1 ) title "1*sin(1*t)" with lines, \
     g( t, 1, 1 ) title "1*cos(1*t)" with lines
