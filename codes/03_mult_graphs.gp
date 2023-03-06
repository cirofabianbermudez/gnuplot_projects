# Autor: Ciro Bermudez
# File: 03_mult_graphs.gp
# Description: Multiple sine waves
# Run: load "03_mult_graphs.gp"

# reset
# set terminal wxt
# set output 

# Terminal default size 5in, 3in font "sans,12"
reset
set terminal pdfcairo size 7.5in, 4.5in font "Helvetica,16"
set output "03_mult_graphs.pdf"

xleft = 0; xright = 2*pi; xstep = 1
ydown = -5; yup = 5; ystep = 1

set xrange [xleft:xright]
set yrange [ydown:yup]

set xtics xleft,xstep,xright 
set ytics ydown,ystep,yup

set border 1+2+4+8

set key top right box

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

LINECOLORS = "#ff0000  #00ff00 #0000ff  #ff00ff"
selectcolor(i) = word(LINECOLORS,j)
#LINECOLORS = "red green blue magenta cyan"

set samples 63
set dummy t
f( t, a, w ) = a*sin(w*t)
plot for [j=1:4:1] f( t, j, 1) title "".j."*sin(t)" with lines linecolor rgb selectcolor(j)
