reset
# set terminal pdfcairo
# set output "logistic.pdf"
unset key
set terminal wxt size 1200, 720
set output
graph_style2 = 103
set style line graph_style2 linecolor rgb "#000000"\
                                       linewidth 2 \
#                                      dashtype  1 \
#                                      pointsize 1 \
#   
plot [0:4][0:1] "13_bifurcation.txt" using 1:2 with dots linestyle graph_style2
pause -1
