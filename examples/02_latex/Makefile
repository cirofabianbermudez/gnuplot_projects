
PLATFORM_OS ?= WINDOWS
TARGET = cobwebs
VAL=3.6
LATEX_OUT = *.aux *.tex *.eps *.log *.gz
PDF_VIEWER = okular

.PHONY: compile run latex clean

all: compile run latex

compile:
	@echo "> Compiling and executing C..."
	gcc -o cobwebs.exe cobwebs.c
	$(TARGET).exe $(VAL) 0.2 150

run:
	@echo "> Running Gnuplot..."
	gnuplot -c $(TARGET).gp ${VAL}

latex:
	@echo "> Compiling LaTeX..."
	pdflatex -jobname=$(TARGET)_latex $(TARGET).tex > pdflatex.log

view:
	okular $(TARGET)_latex.pdf &

clean:
	@echo "> Cleaning..."
	rm -rf *.pdf *.png *.jpg *.txt *.bak *.exe $(LATEX_OUT)

