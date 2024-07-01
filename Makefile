# Main filenames and directories
ALL=$(patsubst %.tex,%.pdf,$(wildcard *.tex))
FIG_DIR=fig/

# LaTeXMK
LMK=latexmk
LMKOPTS=--pdf --use-make --outdir=out --auxdir=aux --bibfudge --indexfudge

all: $(ALL)

%.pdf: %.tex
	$(LMK) $(LMKOPTS) $<

%.ind: %.idx
	makeindex $<

drawio/%.png: $(FIG_DIR)drawio/%.drawio
	drawio --export --output ./$(FIG_DIR)$@ $<

puml/%.png: $(FIG_DIR)puml/%.puml
	plantuml $<

clean:
	$(LMK) -c
	
cleanall:
	$(LMK) -C
	rm -rf ./aux ./out
