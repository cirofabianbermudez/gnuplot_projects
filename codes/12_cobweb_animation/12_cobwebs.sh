#!/bin/bash
TIMEFORMAT='It took %R seconds.'
time {
echo "Run Animation"
WORKING_DIR=data
OUTPUT_VIDEO=12_cobwebs.mp4
if [ -d "$WORKING_DIR" ]; then 
    rm -Rf $WORKING_DIR
fi
if [ -f "$OUTPUT_VIDEO" ]; then 
    rm $OUTPUT_VIDEO
fi
echo "1. Compiling C program."
gcc 12_cobwebs.c -o 12_cobwebs.exe
echo "2. Executing C program."
./12_cobwebs.exe
echo "3. Generating images in $WORKING_DIR directory."
gnuplot -c 12_cobwebs.gp
echo "4. Converting images to video."
ffmpeg -framerate 30 -i "data/img_%04d.png" -c:v libx264 -pix_fmt yuv420p -loglevel quiet 12_cobwebs.mp4
# -hidebanner -loglevel error
# start 12_cobwebs.mp4
}
read -p "Press enter to continue"
# read -t 5 -p "Press [Enter] to continue..."
