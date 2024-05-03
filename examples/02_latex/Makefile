
PLATFORM_OS ?= WINDOWS
TARGET = cobwebs
VAL ?= 3.6
LATEX_OUT = *.aux *.tex *.eps *.log *.gz
PDF_VIEWER = okular

# 1 : PNG     2 : PDF     3 : LaTeX
MODE ?= 3
SEQ ?= compile run

ifeq ($(MODE), 3)
	SEQ += latex
endif

.PHONY: compile run latex clean

all: $(SEQ)

compile:
	@echo "> Compiling and executing C..."
	gcc -o cobwebs.exe cobwebs.c
	$(TARGET).exe $(VAL) 0.2 150

run:
	@echo "> Running Gnuplot..."
	gnuplot -c $(TARGET).gp ${VAL} ${MODE}

latex:
	@echo "> Compiling LaTeX..."
	pdflatex -jobname=$(TARGET)_latex $(TARGET).tex > pdflatex.log

view:
	okular $(TARGET)_latex.pdf &

clean:
	@echo "> Cleaning..."
	rm -rf *.pdf *.png *.jpg *.txt *.bak *.exe $(LATEX_OUT)

