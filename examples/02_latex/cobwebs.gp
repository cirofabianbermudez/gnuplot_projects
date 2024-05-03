# Autor: Ciro Bermudez
# Date: 16/06/2022
# Description: Cobwebs for chaotic maps
# Run: gnuplot -c cobwebs.gp 3.5

filename = "cobwebs"
input_data = filename . ".txt"
select = 3

if (select == 1) {
# PNG Version
  reset
  unit = 3
  set terminal pngcairo size unit*640, unit*384 font "CMU Serif, 10" fontscale 1*unit*0.95
  set output filename . ".png"
  set xlabel "x_{n}"
  set ylabel "x_{n+1}" rotate by 0 
}
if (select == 2) {
# PDF Version
  reset
  unit = 2.5
  set terminal pdfcairo size unit*5in, unit*3in font "CMU Serif, 10" fontscale 0.5*unit
  set output filename . ".pdf"
  set xlabel "x_{n}"
  set ylabel "x_{n+1}" rotate by 0 
}
if (select == 3){
# LaTex Version
  reset
  unit = 1.2
  set terminal epslatex standalone size unit*5in, unit*3in font ",9" 
  set output filename . ".tex"
  set xlabel "$x_{n}$"
  set ylabel "$x_{n+1}$" rotate by 0 
}

xleft = 0; xright = 1; xstep = 0.2
ydown = 0; yup = 1; ystep = 0.2

set xrange [xleft:xright]
set yrange [ydown:yup]

set xtics xleft,xstep,xright 
set ytics ydown,ystep,yup

set tics format "%.1f"
set border 1+2+4+8
unset key
set size square

# Grid configuration
grid_major = 100
grid_minor = 101
set style line grid_major dashtype 1 linecolor rgb "#E0E0E0"
set style line grid_minor dashtype 3 linecolor rgb "#C7C7C7"
set grid
set mxtics 4; set mytics 4; 
set grid mxtics mytics linestyle grid_major, lines grid_minor
set tics scale 1,1e-3

graph_style = 102
set style line graph_style linecolor rgb "#000000" \
                                     linewidth 1 
beta = 3.0

if (ARGC >= 1) {
    beta = ARG1 + 0
}

set samples 1000
f( x ) = beta * (x-x**2)
set label sprintf("A = %3.1f ",beta)  at 0.1,0.9 front
plot input_data using 1:2 with lines linestyle graph_style, \
                        x with lines linestyle graph_style, \
                     f(x) with lines linestyle graph_style

# Restore default values
reset
set terminal wxt
set output

