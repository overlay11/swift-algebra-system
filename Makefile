DIAGEN ?= ~/bin/diagen

RSTEXT := $(shell find . -name '*.rst')
DIAGRAMS := $(shell find . -name '*.gv.m4')

HTML := $(RSTEXT:.rst=.html)

.PHONY: html svg clean

html: svg $(HTML)

svg: $(DIAGRAMS:.gv.m4=.svg)

clean:
	rm -f $(HTML)

%.html: %.rst
	pandoc -s --mathjax -o $@ $<

%.svg: %.gv.m4
	$(DIAGEN) $< $@
