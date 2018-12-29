CURL = curl -L

all:  bin/rem-git bin/cheap-git

clean:
	$(RM) -rf */

cleaner: clean
	rm -f *.gz

cheapglk.tar.gz:
	$(CURL) -o cheapglk.tar.gz https://github.com/erkyrath/cheapglk/archive/cheapglk-1.0.6.tar.gz

cheapglk/Makefile: cheapglk.tar.gz
	tar fxz cheapglk.tar.gz
	mv cheapglk-cheapglk-1.0.6/ cheapglk/
	touch cheapglk/Makefile

cheapglk/libcheapglk.a: cheapglk/Makefile
	$(MAKE) -C cheapglk

remglk.tar.gz:
	$(CURL) -o remglk.tar.gz https://github.com/erkyrath/remglk/archive/remglk-0.2.6.tar.gz

remglk/Makefile: remglk.tar.gz
	tar fxz remglk.tar.gz
	mv remglk-remglk-0.2.6/ remglk/
	touch remglk/Makefile

remglk/libremglk.a: remglk/Makefile
	$(MAKE) -C remglk

git.tar.gz:
	$(CURL) -o git.tar.gz https://github.com/DavidKinder/Git/archive/v1.3.5.tar.gz

rem-git/Makefile: git.tar.gz
	tar fxz git.tar.gz
	mv Git-1.3.5/ rem-git/
	touch rem-git/Makefile

rem-git/git: rem-git/Makefile remglk/libremglk.a
	$(MAKE) GLK=remglk -C rem-git

bin/rem-git: rem-git/git
	mkdir -p bin/ && cd bin/ && ln -sf ../rem-git/git rem-git

cheap-git/Makefile: git.tar.gz
	tar fxz git.tar.gz
	mv Git-1.3.5/ cheap-git/
	touch cheap-git/Makefile

cheap-git/git: cheap-git/Makefile cheapglk/libcheapglk.a
	$(MAKE) -C cheap-git

bin/cheap-git: cheap-git/git
	mkdir -p bin/ && cd bin/ && ln -sf ../cheap-git/git cheap-git


#
#GLULXE_OPTS = GLKINCLUDEDIR=../$(GLK) GLKLIBDIR=../$(GLK) GLKMAKEFILE=Make.$(GLK)
#
#bin/glulxe: glulxe/glulxe
#	mkdir -p bin/ && cd bin/ && ln -sf ../glulxe/glulxe .
#
#glulxe.tar.gz:
#	$(CURL) -o glulxe.tar.gz https://github.com/erkyrath/glulxe/archive/glulxe-0.5.4.tar.gz
#
#glulxe/Makefile: glulxe.tar.gz
#	tar fxz glulxe.tar.gz
#	mv glulxe-glulxe-0.5.4/ glulxe/
#	touch glulxe/Makefile
#
#glulxe/glulxe: glulxe/Makefile $(GLK)/lib$(GLK).a
#	$(MAKE) $(GLULXE_OPTS) -C glulxe
