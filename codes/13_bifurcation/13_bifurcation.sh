#!/bin/bash
TIMEFORMAT='It took %R seconds.'
time {
echo "Run Animation"
WORKING_DIR=data
OUTPUT_VIDEO=13_bifurcation.mp4
if [ -d "$WORKING_DIR" ]; then 
    rm -Rf $WORKING_DIR
fi
if [ -f "$OUTPUT_VIDEO" ]; then 
    rm $OUTPUT_VIDEO
fi
echo "1. Compiling C program."
gcc 13_bifurcation.c -o 13_bifurcation.exe
gcc 13_cobwebs.c -o 13_cobwebs.exe
echo "2. Executing C program."
./13_bifurcation.exe
./13_cobwebs.exe
echo "3. Generating images in $WORKING_DIR directory."
gnuplot -c 13_bifurcation.gp
echo "4. Converting images to video."
ffmpeg -framerate 30 -i "data/img_%04d.png" -c:v libx264 -pix_fmt yuv420p -loglevel quiet 13_bifurcation.mp4
# -hidebanner -loglevel error
# start 13_bifurcation.mp4
}
read -p "Press enter to continue"
# read -t 5 -p "Press [Enter] to continue..."
