
PLATFORM_OS ?= WINDOWS
TARGET = 01_sine
LATEX_OUT = *.aux *.tex *.eps *.log *.gz
PDF_VIEWER = okular

# 1 : PNG     2 : PDF     3 : LaTeX
MODE ?= 1
SEQ ?= run

ifeq ($(MODE), 3)
	SEQ += latex
endif

.PHONY: run latex clean

all: $(SEQ)

run:
	@echo "> Running Gnuplot..."
	gnuplot -c $(TARGET).gp ${MODE}

latex:
	@echo "> Compiling LaTeX..."
	pdflatex -jobname=$(TARGET)_latex $(TARGET).tex > pdflatex.log

view:
	okular $(TARGET)_latex.pdf &

clean:
	@echo "> Cleaning..."
	rm -rf *.pdf *.png *.jpg *.txt *.bak *.exe $(LATEX_OUT)

