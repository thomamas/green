DIR_INSTALL_BASE=/Applications/Inform.app
DIR_EXE=$(DIR_INSTALL_BASE)/Contents/MacOS
DIR_INT=$(DIR_INSTALL_BASE)/Contents/Resources/Internal
DIR_I6L=$(DIR_INSTALL_BASE)/Contents/Resources/Library/6.11
DIR_PRO=./FoundersMercy.inform
DIR_MAT=./FoundersMercy.materials
PROJECT="Founder's Mercy"

FEELIES_ARTIFACTS=FoundersMercy.materials/Map.pdf

# S3_PATH=s3://assets.tinsel.org/assets/IF/FM/
S3_PATH=s3://assets.tinsel.org/assets/IF/FM-v1-beta6/

OPTS_NI=-release
OPTS_I6=-kE2~S~DwG

OPTS_NI_TEST=-rng
OPTS_I6_TEST=-kE2SDwG

all: release

clean:
	rm -rf $(DIR_PRO)/Build $(DIR_MAT)/Release
	cd ./art/Feelies && make clean
	cd ./test && make clean

cleaner: clean
	rm -f $(FEELIES_ARTIFACTS)
	cd tools/interpreters && make cleaner

# One pass so we don't leave a non-release auto.inf lying around
$(DIR_PRO)/Build/testing.ulx: $(DIR_PRO)/Source/story.ni $(DIR_MAT)/Extensions/*/*
	@echo
	@echo --- Testing: Inform 6 \& 7
	@echo
	$(DIR_EXE)/ni $(OPTS_NI_TEST) -internal $(DIR_INT) -project $(DIR_PRO) -format=ulx
	cd $(DIR_PRO)/Build/ && $(DIR_EXE)/inform6 $(OPTS_I6_TEST) auto.inf testing.ulx
	rm $(DIR_PRO)/Build/auto.inf

$(DIR_PRO)/Build/auto.inf: $(DIR_PRO)/Source/story.ni $(DIR_MAT)/Extensions/*/*
	@echo
	@echo --- Inform 7
	@echo
	$(DIR_EXE)/ni $(OPTS_NI) -internal $(DIR_INT) -project $(DIR_PRO) -format=ulx

$(DIR_PRO)/Build/output.ulx: $(DIR_PRO)/Build/auto.inf
	@echo
	@echo --- Inform 6
	@echo
	cd $(DIR_PRO)/Build/ && $(DIR_EXE)/inform6 $(OPTS_I6) auto.inf output.ulx

release: feelies $(DIR_PRO)/Build/output.ulx
	@echo
	@echo --- Release
	@echo
	mkdir -p $(DIR_MAT)/Release/interpreter
	$(DIR_EXE)/cBlorb $(DIR_PRO)/Release.blurb $(DIR_PRO)/Build/output.gblorb
	cp $(DIR_PRO)/Build/output.gblorb $(DIR_MAT)/Release/$(PROJECT).gblorb
	# python tools/blorbtool.py $(DIR_MAT)/Release/$(PROJECT).gblorb giload $(DIR_MAT)/Release/interpreter interpreter

feelies: $(FEELIES_ARTIFACTS)

$(FEELIES_ARTIFACTS): art/Feelies/Feelies.graffle
	cd art/Feelies && make
	cp art/Feelies/Build/Map.pdf $(DIR_MAT)/Map.pdf

sync: release
	aws s3 sync --acl=public-read $(DIR_MAT)/Release/ $(S3_PATH)

.phony:

test: .phony $(DIR_PRO)/Build/output.ulx $(DIR_PRO)/Build/testing.ulx
	cd test && make
