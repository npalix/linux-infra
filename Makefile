LINUSTREE=git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
NEXTTREE=git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
#LINUSTREE=http://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
#NEXTTREE=http://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

GLIMPSEINDEX=~/coccinelle/scripts/glimpseindex_cocci.sh
IDUTILSINDEX=~/linuxes/idutils.sh
INDEXER="idutils"
ifeq ($(INDEXER) , idutils)
	INDEXERTYPE=$(IDUTILSINDEX)
else
	INDEXERTYPE=$(GLIMPSEINDEX)
endif
OWNER=user
GROUP=group

#
# Makefile.local may override the default configuration
#
-include Makefile.local

ifeq ($(INDEXER) , idutils)
       	INDEXERTYPE=$(IDUTILSINDEX) 
else 
	INDEXERTYPE=$(GLIMPSEINDEX) 
endif


NEWOWNER=$(shell getent passwd $(OWNER) )
NEWGROUP=$(shell getent group $(GROUP) )

BASE=https://www.kernel.org/pub/linux/kernel/
EXT=.tar.xz
LIST10=linux-1.0
LIST11=linux-1.1.13      \
       linux-1.1.23      \
       linux-1.1.33      \
       linux-1.1.45      \
       linux-1.1.52      \
       linux-1.1.59      \
       linux-1.1.67      \
       linux-1.1.75      \
       linux-1.1.85      \
       linux-1.1.94      \
       linux-1.1.95
LIST12=linux-1.2.0       \
       linux-1.2.4       \
       linux-1.2.8
LIST13=linux-1.3.0       \
       linux-1.3.10      \
       linux-1.3.20      \
       linux-1.3.30      \
       linux-1.3.40      \
       linux-1.3.50      \
       linux-1.3.60      \
       linux-1.3.70      \
       linux-1.3.80      \
       linux-1.3.90      \
       linux-1.3.100
LIST20=linux-2.0   	 \
       linux-2.0.5 	 \
       linux-2.0.10	 \
       linux-2.0.15	 \
       linux-2.0.20	 \
       linux-2.0.21	 \
       linux-2.0.30	 \
       linux-2.0.40
LIST21=linux-2.1.0	 \
       linux-2.1.3	 \
       linux-2.1.4	 \
       linux-2.1.5	 \
       linux-2.1.6	 \
       linux-2.1.10	 \
       linux-2.1.13	 \
       linux-2.1.16	 \
       linux-2.1.20	 \
       linux-2.1.23	 \
       linux-2.1.26	 \
       linux-2.1.27	 \
       linux-2.1.28	 \
       linux-2.1.29	 \
       linux-2.1.30	 \
       linux-2.1.33	 \
       linux-2.1.36	 \
       linux-2.1.40	 \
       linux-2.1.43	 \
       linux-2.1.46	 \
       linux-2.1.50	 \
       linux-2.1.53	 \
       linux-2.1.56	 \
       linux-2.1.60	 \
       linux-2.1.63	 \
       linux-2.1.66	 \
       linux-2.1.70	 \
       linux-2.1.73	 \
       linux-2.1.76	 \
       linux-2.1.80	 \
       linux-2.1.83	 \
       linux-2.1.86	 \
       linux-2.1.90	 \
       linux-2.1.93	 \
       linux-2.1.96	 \
       linux-2.1.100	 \
       linux-2.1.103	 \
       linux-2.1.106	 \
       linux-2.1.110	 \
       linux-2.1.113	 \
       linux-2.1.116	 \
       linux-2.1.120     \
       linux-2.1.123     \
       linux-2.1.126     \
       linux-2.1.130     \
       linux-2.1.131     \
       linux-2.1.132
LIST22=linux-2.2.0       \
       linux-2.2.1       \
       linux-2.2.2       \
       linux-2.2.3       \
       linux-2.2.4       \
       linux-2.2.5       \
       linux-2.2.6       \
       linux-2.2.7       \
       linux-2.2.26

VER3=$(shell seq 0 51)
LIST23=$(VER3:%=linux-2.3.%)	 \
       linux-2.3.99-pre6 \
       linux-2.3.99-pre9

VER4=$(shell seq 0 37)
LIST24=$(VER4:%=linux-2.4.%)

VER5=$(shell seq 0 75)
LIST25=$(VER5:%=linux-2.5.%)

VER6www=$(shell seq 0 10)
LIST26www=$(VER6www:%=linux-2.6.%)
VER6git=$(shell seq 11 39)
LIST26git=$(VER6git:%=linux-2.6.%)

LINUXV3=$(shell git --git-dir=linux-git/.git tag -l v3.[0-9] v3.[0-9][0-9])
LINUXV4=$(shell git --git-dir=linux-git/.git tag -l v4.[0-9] v4.[0-9][0-9])
LINUXV5=$(shell git --git-dir=linux-git/.git tag -l v5.[0-9] v5.[0-9][0-9])
LINUXV6=$(shell git --git-dir=linux-git/.git tag -l v6.[0-9] v6.[0-9][0-9])
# To add new v3.x versions, run
# 	git --git-dir=/var/linuxes/linux-git/.git fetch
# This will update the git repository and also retrieve new tags.
# These tags will be available for extraction of the various Linux version by 'make'
# NOTE: This is run by 'make', 'make udpate' and 'make all-linux-3'
# In practice, to update a 3.x version just run make with no arguments
LIST3=$(LINUXV3:v%=linux-%)
LIST4=$(LINUXV4:v%=linux-%)
LIST5=$(LINUXV5:v%=linux-%)
LIST6=$(LINUXV6:v%=linux-%)

DIR=$(LIST10) $(LIST11) $(LIST12) $(LIST13) \
	$(LIST20) $(LIST21) $(LIST22) $(LIST23) $(LIST24) $(LIST25) \
	$(LIST26www) $(LIST26git) $(LIST3) $(LIST4) $(LIST5) $(LIST6)

PDIRwww=$(LIST10:%=v1.0/%) $(LIST11:%=v1.1/%) $(LIST12:%=v1.2/%) $(LIST13:%=v1.3/%) \
     $(LIST20:%=v2.0/%) $(LIST21:%=v2.1/%) $(LIST22:%=v2.2/%) $(LIST23:%=v2.3/%) \
     $(LIST24:%=v2.4/%) $(LIST25:%=v2.5/%) $(LIST26www:%=v2.6/%)
PDIRgit=$(LIST26git) $(LIST3) $(LIST4) $(LIST5) $(LIST6)
IDX=$(DIR:%=idx-%)

all: update-git
	$(MAKE) check-all
check-all: $(DIR)

linux-git:
	git clone $(LINUSTREE) $@

update update-git: linux-git
	git --git-dir=linux-git/.git fetch

update-next:
	git --git-dir=linux-next/.git fetch --all
	cd linux-next && git reset --hard linux-next/master
	cd linux-next && $(INDEXERTYPE)

linux-next: linux-git
	git clone -l linux-git linux-next
	git --git-dir=linux-next/.git remote add linux-next $(NEXTTREE)
linux-history:
	git clone http://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git linux-history

$(PDIRwww):
	@echo Retrieving $@
	wget -O - $(BASE)$@$(EXT) | tar xJf -

$(PDIRgit):
	@echo Retrieving $@
	cd linux-git && git archive --format=tar --prefix=$@/ v$(@:linux-%=%) | (cd .. && tar xf - )
	cd $@ && $(INDEXERTYPE) \
	chmod -R ug+r-w $@
	if test -n "$(NEWOWNER)" ; then chown -R $(OWNER) $@ ; fi
	if test -n "$(NEWGROUP)" ; then chgrp -R $(GROUP) $@ ; fi

$(IDX):
	if [ -d linux ] ;then mv linux $(@:idx-%=%); fi # Needed for some old versions prior to 2.6.0
	cd $(@:idx-%=%) && $(INDEXERTYPE)
	chmod -R ug+r-w $(@:idx-%=%)
	if test -n "$(NEWOWNER)" ; then chown -R $(OWNER) $(@:idx-%=%) ; fi
	if test -n "$(NEWGROUP)" ; then chgrp -R $(GROUP) $(@:idx-%=%) ; fi

$(LIST10):
	$(MAKE) v1.0/$@
	$(MAKE) idx-$@

$(LIST11):
	$(MAKE) v1.1/$@
	$(MAKE) idx-$@

$(LIST12):
	$(MAKE) v1.2/$@
	$(MAKE) idx-$@

$(LIST13):
	$(MAKE) v1.3/$@
	$(MAKE) idx-$@

$(LIST20):
	$(MAKE) v2.0/$@
	$(MAKE) idx-$@

$(LIST21):
	$(MAKE) v2.1/$@
	$(MAKE) idx-$@

$(LIST22):
	$(MAKE) v2.2/$@
	$(MAKE) idx-$@

$(LIST23):
	$(MAKE) v2.3/$@
	$(MAKE) idx-$@

$(LIST24):
	$(MAKE) v2.4/$@
	$(MAKE) idx-$@

$(LIST25):
	$(MAKE) v2.5/$@
	$(MAKE) idx-$@

all-linux-2.6: $(LIST26www) $(LIST26git)
$(LIST26www):
	$(MAKE) v2.6/$@
	$(MAKE) idx-$@

check-linux-3: $(LIST3)
all-linux-3: update
	$(MAKE) check-linux-3

check-linux-4: $(LIST4)
all-linux-4: update
	$(MAKE) check-linux-4

check-linux-5: $(LIST5)
all-linux-5: update
	$(MAKE) check-linux-5

check-linux-6: $(LIST6)
all-linux-6: update
	$(MAKE) check-linux-6
