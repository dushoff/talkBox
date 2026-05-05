## This is talkBox

current: target
-include target.mk
Ignore = target.mk

vim_session:
	bash -ic "vmt README.md"

-include makestuff/pyvenv.mk
-include makestuff/python.def
pyvenv: ; $(cleanpyvenv)

## -include makestuff/perl.def

######################################################################

Sources += $(wildcard *.md *.qmd)

Ignore += *.QMD
## hardFit.QMD: resources/hardFit.pptx
%.QMD: resources/%.pptx | 

######################################################################

mirrors += resources

######################################################################

### Makestuff

Sources += Makefile

Ignore += makestuff
msrepo = https://github.com/dushoff

## ln -s ../makestuff . ## Do this first if you want a linked makestuff
Makefile: makestuff/00.stamp
makestuff/%.stamp: | makestuff
	- $(RM) makestuff/*.stamp
	cd makestuff && $(MAKE) pull
	touch $@
makestuff:
	git clone --depth 1 $(msrepo)/makestuff

-include makestuff/os.mk

## -include makestuff/pipeR.mk
-include makestuff/mirror.mk

-include makestuff/git.mk
-include makestuff/visual.mk
