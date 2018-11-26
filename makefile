# simple makefile to re-scan pdf using ocrmypdf

SDIR := docs/
ODIR := ocr/

SFIL := $(wildcard $(SDIR)*.pdf)
OFIL := $(notdir $(SFIL:.pdf=.txt))
OFIL := $(addprefix $(ODIR), $(OFIL))

PHONY: all
all:
	make ocr |& tee all.log

.PHONY: ocr
ocr: $(OFIL)

$(ODIR)%.txt : $(SDIR)%.pdf
	ocrmypdf --force-ocr $< $< --sidecar $@
	touch $@
