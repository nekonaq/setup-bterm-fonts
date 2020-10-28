SHELL = /bin/bash

vpath %.bdf /usr/src
FONTS		= ucs.bgf unifont.bgf
FONTDIR		= fonts
DESTDIR		= /usr/share/fonts/bogl

all:; $(error No make target specified)

#//
install: $(addprefix $(DESTDIR)/,$(FONTS))

fonts: $(addprefix $(FONTDIR)/,$(FONTS))

$(DESTDIR)/%.bgf: $(FONTDIR)/%.bgf
	install -o root -g root -m 755 -d $(@D)
	install -o root -g root -m 644 $< $@

%.bgf $(FONTDIR)/%.bgf: %.bdf
	mkdir -p $(@D)
	bdftobogl -b $< >$@

.PHONY: fonts install

