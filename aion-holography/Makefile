# Simple Makefile for the Computational Holography monograph

TEX     = pdflatex
BIB     = bibtex
MAIN    = main

.PHONY: all clean distclean

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex sections/*.tex macros.tex references.bib
	$(TEX) $(MAIN)
	$(BIB) $(MAIN)
	$(TEX) $(MAIN)
	$(TEX) $(MAIN)
	$(TEX) $(MAIN)

clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lof *.lot

distclean: clean
	rm -f $(MAIN).pdf
