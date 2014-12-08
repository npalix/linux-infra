LINUSTREE=git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
NEXTTREE=git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
#LINUSTREE=http://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
#NEXTTREE=http://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

GLIMPSEINDEX=~/coccinelle/scripts/glimpseindex_cocci.sh
OWNER=user
GROUP=users

#
# Makefile.local may override the default configuration
#
-include Makefile.local

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
LIST23=linux-2.3.0	 \
       linux-2.3.1	 \
       linux-2.3.2	 \
       linux-2.3.3	 \
       linux-2.3.4	 \
       linux-2.3.5	 \
       linux-2.3.6	 \
       linux-2.3.7	 \
       linux-2.3.8	 \
       linux-2.3.9	 \
       linux-2.3.10	 \
       linux-2.3.11	 \
       linux-2.3.12	 \
       linux-2.3.13	 \
       linux-2.3.14	 \
       linux-2.3.15	 \
       linux-2.3.16	 \
       linux-2.3.17	 \
       linux-2.3.18	 \
       linux-2.3.19	 \
       linux-2.3.20	 \
       linux-2.3.21	 \
       linux-2.3.22	 \
       linux-2.3.23	 \
       linux-2.3.24	 \
       linux-2.3.25	 \
       linux-2.3.26	 \
       linux-2.3.27	 \
       linux-2.3.28	 \
       linux-2.3.29	 \
       linux-2.3.30	 \
       linux-2.3.31	 \
       linux-2.3.32	 \
       linux-2.3.33	 \
       linux-2.3.34	 \
       linux-2.3.35	 \
       linux-2.3.36	 \
       linux-2.3.37	 \
       linux-2.3.38	 \
       linux-2.3.39	 \
       linux-2.3.40	 \
       linux-2.3.41	 \
       linux-2.3.42	 \
       linux-2.3.43	 \
       linux-2.3.44	 \
       linux-2.3.45	 \
       linux-2.3.46	 \
       linux-2.3.47	 \
       linux-2.3.48	 \
       linux-2.3.49	 \
       linux-2.3.50	 \
       linux-2.3.51	 \
       linux-2.3.99-pre6 \
       linux-2.3.99-pre9
LIST24=linux-2.4.0       \
       linux-2.4.1       \
       linux-2.4.2       \
       linux-2.4.3       \
       linux-2.4.4       \
       linux-2.4.5       \
       linux-2.4.6       \
       linux-2.4.7       \
       linux-2.4.8       \
       linux-2.4.9       \
       linux-2.4.10      \
       linux-2.4.12      \
       linux-2.4.13      \
       linux-2.4.14      \
       linux-2.4.15      \
       linux-2.4.16      \
       linux-2.4.17      \
       linux-2.4.18      \
       linux-2.4.19      \
       linux-2.4.20      \
       linux-2.4.21      \
       linux-2.4.22      \
       linux-2.4.23      \
       linux-2.4.24      \
       linux-2.4.25      \
       linux-2.4.26      \
       linux-2.4.27      \
       linux-2.4.28      \
       linux-2.4.29      \
       linux-2.4.30      \
       linux-2.4.31      \
       linux-2.4.32      \
       linux-2.4.33      \
       linux-2.4.34      \
       linux-2.4.35      \
       linux-2.4.36      \
       linux-2.4.37
LIST25=linux-2.5.0       \
       linux-2.5.1       \
       linux-2.5.2       \
       linux-2.5.3       \
       linux-2.5.4       \
       linux-2.5.5       \
       linux-2.5.6       \
       linux-2.5.7       \
       linux-2.5.8       \
       linux-2.5.9       \
       linux-2.5.10      \
       linux-2.5.11      \
       linux-2.5.12      \
       linux-2.5.13      \
       linux-2.5.14      \
       linux-2.5.15      \
       linux-2.5.16      \
       linux-2.5.17      \
       linux-2.5.18      \
       linux-2.5.19      \
       linux-2.5.20      \
       linux-2.5.21      \
       linux-2.5.22      \
       linux-2.5.23      \
       linux-2.5.24      \
       linux-2.5.25      \
       linux-2.5.26      \
       linux-2.5.27      \
       linux-2.5.28      \
       linux-2.5.29      \
       linux-2.5.30      \
       linux-2.5.31      \
       linux-2.5.32      \
       linux-2.5.33      \
       linux-2.5.34      \
       linux-2.5.35      \
       linux-2.5.36      \
       linux-2.5.37      \
       linux-2.5.38      \
       linux-2.5.39      \
       linux-2.5.40      \
       linux-2.5.41      \
       linux-2.5.42      \
       linux-2.5.43      \
       linux-2.5.44      \
       linux-2.5.45      \
       linux-2.5.46      \
       linux-2.5.47      \
       linux-2.5.48      \
       linux-2.5.49      \
       linux-2.5.50      \
       linux-2.5.51      \
       linux-2.5.52      \
       linux-2.5.53      \
       linux-2.5.54      \
       linux-2.5.55      \
       linux-2.5.56      \
       linux-2.5.57      \
       linux-2.5.58      \
       linux-2.5.59      \
       linux-2.5.60      \
       linux-2.5.61      \
       linux-2.5.62      \
       linux-2.5.63      \
       linux-2.5.64      \
       linux-2.5.65      \
       linux-2.5.66      \
       linux-2.5.67      \
       linux-2.5.68      \
       linux-2.5.69      \
       linux-2.5.70      \
       linux-2.5.71      \
       linux-2.5.72      \
       linux-2.5.73      \
       linux-2.5.74      \
       linux-2.5.75
LIST26www=linux-2.6.0	 \
       linux-2.6.1	 \
       linux-2.6.2	 \
       linux-2.6.3	 \
       linux-2.6.4	 \
       linux-2.6.5	 \
       linux-2.6.6	 \
       linux-2.6.7	 \
       linux-2.6.8	 \
       linux-2.6.9	 \
       linux-2.6.10
LIST26git=\
       linux-2.6.11	 \
       linux-2.6.12	 \
       linux-2.6.13	 \
       linux-2.6.14	 \
       linux-2.6.15	 \
       linux-2.6.16	 \
       linux-2.6.17	 \
       linux-2.6.18	 \
       linux-2.6.19	 \
       linux-2.6.20	 \
       linux-2.6.21	 \
       linux-2.6.22	 \
       linux-2.6.23	 \
       linux-2.6.24	 \
       linux-2.6.25	 \
       linux-2.6.26	 \
       linux-2.6.27	 \
       linux-2.6.28	 \
       linux-2.6.29	 \
       linux-2.6.30	 \
       linux-2.6.31	 \
       linux-2.6.32      \
       linux-2.6.33      \
       linux-2.6.34      \
       linux-2.6.35      \
       linux-2.6.36      \
       linux-2.6.37      \
       linux-2.6.38      \
       linux-2.6.39

LINUXV3=$(shell git --git-dir=linux-git/.git tag -l v3.[0-9] v3.[0-9][0-9])
# To add new v3.x versions, run
# 	git --git-dir=/var/linuxes/linux-git/.git fetch
# This will update the git repository and also retrieve new tags.
# These tags will be available for extraction of the various Linux version by 'make'
# NOTE: This is run by 'make', 'make udpate' and 'make all-linux-3'
# In practice, to update a 3.x version just run make with no arguments
LIST3=$(LINUXV3:v%=linux-%)

DIR=$(LIST10) $(LIST11) $(LIST12) $(LIST13) \
	$(LIST20) $(LIST21) $(LIST22) $(LIST23) $(LIST24) $(LIST25) \
	$(LIST26www) $(LIST26git) $(LIST3)

PDIRwww=$(LIST10:%=v1.0/%) $(LIST11:%=v1.1/%) $(LIST12:%=v1.2/%) $(LIST13:%=v1.3/%) \
     $(LIST20:%=v2.0/%) $(LIST21:%=v2.1/%) $(LIST22:%=v2.2/%) $(LIST23:%=v2.3/%) \
     $(LIST24:%=v2.4/%) $(LIST25:%=v2.5/%) $(LIST26www:%=v2.6/%)
PDIRgit=$(LIST26git) $(LIST3)
IDX=$(DIR:%=idx-%)

all: update-git
	$(MAKE) check-all
check-all: $(DIR)

linux-git:
	git clone $(LINUSTREE) $@

update update-git:
	git --git-dir=linux-git/.git fetch

update-next:
	git --git-dir=linux-next/.git fetch --all
	cd linux-next && git reset --hard linux-next/master
	cd linux-next && $(GLIMPSEINDEX)

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
	cd $@ && $(GLIMPSEINDEX)
	chmod -R ug+r-w $@
	chown -R $(OWNER):$(GROUP) $@

$(IDX):
	if [ -d linux ] ;then mv linux $(@:idx-%=%); fi # Needed for some old versions prior to 2.6.0
	cd $(@:idx-%=%) && $(GLIMPSEINDEX)
	chmod -R ug+r-w $(@:idx-%=%)
	chown -R $(OWNER):$(GROUP) $(@:idx-%=%)

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

