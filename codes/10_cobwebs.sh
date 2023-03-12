#!/bin/bash
echo "Run cobwebs"

if [ $# -eq 0 ]; then
    var=3.0
else
    var=$1
fi

gcc cobwebs.c -o 10_cobwebs.exe
./10_cobwebs.exe $var 0.5 100
gnuplot -c 10_cobwebs.gp $var
start 10_cobwebs.pdf
#read -p "Press enter to continue"
read -t 5 -p "Press [Enter] to continue..."

