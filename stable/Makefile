GLIMPSEINDEX=~/coccinelle/scripts/glimpseindex_cocci.sh
OWNER=user
GROUP=users

#
# Makefile.local may override the default configuration
#
-include ../Makefile.local

BASE=git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git

STABLE2632=$(shell seq 1 60)
TAG2632=2.6.32
TAGLIST=$(TAG2632) $(STABLE2632:%=$(TAG2632).%)

########################################################
LIST=$(TAGLIST:%=linux-%)
IDX=$(LIST:%=idx-%)

all: linux-stable
	$(MAKE) $(LIST)

linux-stable:
	git clone $(BASE)

$(LIST):
	@echo Retrieving $@
	cd linux-stable && git archive --format=tar --prefix=$@/ v$(@:linux-%=%) | (cd .. && tar xf - )
	$(MAKE) idx-$@

$(IDX): 
	cd $(@:idx-%=%) && $(GLIMPSEINDEX)
	chmod -R ug+r-w $(@:idx-%=%)
	chown -R $(OWNER):$(GROUP) $(@:idx-%=%)

