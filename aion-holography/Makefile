# Simple Makefile for the Computational Holography monograph

TEX     = pdflatex
BIB     = bibtex
MAIN    = main

.PHONY: all clean distclean

all: $(MAIN).pdf


TEX_SRCS = $(filter-out $(MAIN).tex,$(wildcard *.tex))

$(MAIN).pdf: $(MAIN).tex $(TEX_SRCS) references.bib
	$(TEX) $(MAIN)
	$(BIB) $(MAIN)
	$(TEX) $(MAIN)
	$(TEX) $(MAIN)

clean:
	@if [ -f $(MAIN).tex ]; then \
		rm -f $(MAIN).aux $(MAIN).bbl $(MAIN).blg $(MAIN).log \
			$(MAIN).out $(MAIN).toc $(MAIN).lof $(MAIN).lot; \
	fi

distclean: clean
	rm -f $(MAIN).pdf
