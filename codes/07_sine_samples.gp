# Autor: Ciro Bermudez
# File: 07_sine_samples.gp
# Description: Simple sine wave with samples
# Run: load "07_sine_samples.gp"

# reset
# set terminal wxt
# set output 

# Terminal pdfcairo default size 5in, 3in font "sans,12"  5:3 ratio
reset
unit = 1.5
set terminal pdfcairo size unit*5in, unit*3in font "Helvetica,16"
set output "07_sine_samples.pdf"

xleft = 0; xright = 2*pi; xstep = 1
ydown = -1; yup = 1; ystep = 0.2

set xrange [xleft:xright]
set yrange [ydown:yup]

set xtics xleft,xstep,xright 
set ytics ydown,ystep,yup

set border 1+2+4+8

set key top right box
# set key at 6,0.95 Right box

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

graph_style1 = 102
set style line graph_style1 linecolor rgb "#0000ff"\
#                                     linewidth 1 \
#                                     dashtype  1 \
#                                     pointsize 1 \
#                                     pointtype 4 \

graph_style2 = 103
set style line graph_style2 linecolor rgb "#0000ff"\
                                      pointtype 7 \
                                      pointsize 0.5
#                                     linewidth 1 \
#                                     dashtype  1 \

set samples 63
set dummy t
a = 1; w = 1
plot a*sin(w*t) title "f(t) = sin(t)" with impulses linestyle graph_style1,\
     a*sin(w*t) notitle with points linestyle graph_style2