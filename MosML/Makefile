# Makefile for Computational Theory LaTeX files

.SUFFIXES:
.SUFFIXES: .tex .pdf .mp

SRC=	asst1a.tex asst1b.tex asst1c.tex asst1d.tex

TARGETS=$(SRC:.tex=.pdf)

all: asst1a.pdf

.tex.pdf:
	pdflatex -shell-escape $<
	if [ -e $*.mp ] ; then pdflatex -shell-escape $* ; fi
	if egrep Rerun $*.log ; then pdflatex -shell-escape $* ; fi
	if egrep Rerun $*.log ; then pdflatex -shell-escape $* ; fi
	if egrep Rerun $*.log ; then pdflatex -shell-escape $* ; fi
	if egrep Rerun $*.log ; then pdflatex -shell-escape $* ; fi

clean:
	rm -f mpxerr.tex theory.mpx
	rm -f *.1 *.2 *.3 *.4 *.5 *.6 *.7 *.8 *.9 *.10
	rm -f *.11 *.12 *.13 *.14 *.15 *.16 *.17 *.18 *.19 *.20
	rm -f *.21 *.22 *.23 *.24 *.25 *.26 *.27 *.28 *.29 *.30
	rm -f *.31 *.32 *.33 *.34 *.35 *.36 *.37 *.38 *.39 *.40
	rm -f $(SRC:.tex=.pdf)
	rm -f $(SRC:.tex=.mp)
	rm -f $(SRC:.tex=.log)
	rm -f $(SRC:.tex=.aux)
	rm -f $(SRC:.tex=.mpx)
	rm -f $(SRC:.tex=.nav)
	rm -f $(SRC:.tex=.toc)
	rm -f $(SRC:.tex=.snm)
	rm -f $(SRC:.tex=.out)
