
PLATFORM_OS ?= WINDOWS
TARGET = 00_test

LATEX_OUT = *.aux *.tex *.eps *.log *.gz

all: run

run:
	@echo "Generating pdf..."
	gnuplot $(TARGET).gp

latex:
	pdflatex -jobname=$(TARGET)_latex $(TARGET).tex > epslatex.log

clean:
	@echo "Cleaning..."
	rm -rf *.pdf *.png *.jpg *.bak $(LATEX_OUT)

