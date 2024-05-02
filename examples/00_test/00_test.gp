# Autor: Ciro Fabian Bermudez Marquez
# File: 00_test.gp
# Description: Display test file for style reference
# Run: gnuplot 01_test.gp

filename = "00_test"

# PDF Version
reset
unit = 1
set terminal pdfcairo size unit*5in, unit*3in font "Sans, 12" fontscale 0.5*unit
set output filename . ".pdf"
test

# PNG Version
reset
unit = 1.8
set terminal png size unit*640, unit*384 font "Sans, 12" fontscale 1*unit*0.95
set output filename . ".png"
test

# Font LaTeX Version
reset
unit = 1
set terminal pdfcairo size unit*5in, unit*3in font "CMU Serif, 12" fontscale 0.5*unit
set output filename . "_latexfont.pdf"
test

# LaTeX Version
reset
unit = 1
set terminal epslatex standalone size unit*5in, unit*3in font ",9" 
set output filename . ".tex"
test

# Restore default values
reset
set terminal wxt
set output
