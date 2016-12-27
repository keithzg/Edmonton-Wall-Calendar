# Main input (w/o extension)
# Additional files the main input file depends on
RESDIR=../../resources/
ADDDEPS=preamble.tex $(addprefix $(RESDIR), flags.tex flags/fsb.tex flags/orthodox.tex flags/9May.png flags/RusDefence.png flags/SpaceFlag.png flags/RusAirborne.png flags/SpbFlag.pdf)

include custom.mk

# Needed to apply license to png files
XMP_IMAGES=$(addprefix $(RESDIR)/photos2014/,$(addsuffix .xmp, $(basename $(notdir $(IMAGES)))))

EPS_IMAGES=$(addprefix $(RESDIR)/photos2014/,$(addsuffix .eps, $(basename $(notdir $(IMAGES)))))

GOALS = 2017.pdf 2017-landscape.pdf cover.pdf

COPY = if test -r $*.toc; then cp $*.toc $*.toc.bak; fi
RM = /bin/rm -f
LN = ln -s

.PHONY: clean web license

all:            $(GOALS)

license: $(XMP_IMAGES)
	find ./photos -name "*.png" -exec exiv2 -S .xmp in {} \;

web:
	mkdir -p web/cal2017/site/target
	txt2site -g web/cal2017/cal2017.conf

DEPS = 	2017.tex customization.tex $(ADDDEPS)

2017-landscape.pdf: 2017.pdf 2017-landscape.tex

2017.pdf: $(DEPS) $(IMAGES) #$(EPS_IMAGES)

back.pdf: $(ADDDEPS) $(IMAGES) back.tex
front.pdf: $(ADDDEPS) $(IMAGES) front.tex

cover.pdf: back.pdf front.pdf cover.tex $(IMAGES)

%.xmp:  %.png
	$(LN) ccbysa.xmp $@

%.jpg:  %.png
	convert $< $@

%.png:  %.dia
	dia -e $@ $<

%.png: %.pic
	pic2plot -T png $< > $@

%.ps: %.pic
	pic2plot -T ps $< > $@

%.eps: %.ps
	ps2eps $<

%.eps:  %.dia
	dia -e $@ $<

%.eps:  %.dot
	dot -Tps $< -o $@

%.pdf:  %.eps
	epstopdf $<

%.eps: %.png
	convert $< $@

%.pdf:          %.tex
# http://tex.stackexchange.com/questions/67859/errors-in-latexmk-with-use-of-auto-pst-pdf-and-hyperref
	latexmk -e "\$$hash_calc_ignore_pattern{'pdf'} = '^/(CreationDate|ModDate|ID) ';" -pdf -pdflatex="pdflatex --shell-escape  %O  %S" $<

clean:
		latexmk -c
		$(RM) -f *.bbl
		$(RM) -f $(EPS_IMAGES) $(XMP_IMAGES) 2017-pics.pdf back-pics.pdf
#		aux *.log *.bbl *.blg *.brf *.cb *.ind *.idx *.ilg  \
#		*.inx *.ps *.dvi *.pdf *.toc *.out *.lot *.lof *.eps *.fls *.fdb_latexmk

