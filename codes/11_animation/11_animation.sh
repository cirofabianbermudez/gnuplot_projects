#!/bin/bash
echo "Generate animation"
#time gnuplot -c 11_animation.gp
time ffmpeg -framerate 30 -i "data/img_%04d.png" -c:v libx264 -pix_fmt yuv420p 11_animation.mp4
read -t 5 -p "Press [Enter] to continue..."

