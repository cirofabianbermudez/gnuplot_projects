# Variables
VAL=1.1

# Target name
TARGET = 

# Targets
all: compile run

compile:
	gcc -o cobwebs.exe cobwebs.c
	cobwebs.exe 2.8 0.2 150

run:
	gnuplot -c cobwebs.gp ${VAL}
	pdflatex main.tex > pdflatex.log

view:
	start main.pdf

clean:
	rm *.aux *.log *.pdf *.eps

help:
	@echo "====================================="
	@echo "               HELP"
	@echo "====================================="
