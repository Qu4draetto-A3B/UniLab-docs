# Main filenames
ALL=$(patsubst %.tex,%.pdf,$(wildcard *.tex))
# LaTeXMK
LMK=latexmk
LMKOPTS=--pdf --use-make --outdir=out --auxdir=aux --bibfudge --indexfudge

all: $(ALL)

clean:
	$(LMK) -c
	
cleanall:
	$(LMK) -C
	rm -rf ./aux ./out

%.pdf: %.tex
	$(LMK) $(LMKOPTS) $<

%.ind: %.idx
	makeindex $<
