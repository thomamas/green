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

# Release
OPTS_NI=-release
OPTS_I6=-kE2~S~DwG

# Dev
# OPTS_NI=-rng
# OPTS_I6=-kE2SDwG

all: release

clean:
	rm -rf $(DIR_PRO)/Build $(DIR_MAT)/Release
	rm -f ./gameinfo.dbg ./test/comp-scripts/*.out
	cd ./art/Feelies && make clean

cleaner: clean
	rm -f $(FEELIES_ARTIFACTS)
	cd tools/interpreters && make cleaner

$(DIR_PRO)/Build/auto.inf: $(DIR_PRO)/Source/story.ni
	@echo
	@echo --- Inform 7
	@echo
	$(DIR_EXE)/ni $(OPTS_NI) -internal $(DIR_INT) -project $(DIR_PRO) -format=ulx -release

$(DIR_PRO)/Build/output.ulx: $(DIR_PRO)/Build/auto.inf $(DIR_MAT)/Extensions/*/*
	@echo
	@echo --- Inform 6
	@echo
	$(DIR_EXE)/inform6 $(OPTS_I6) +include_path=$(DIR_I6L),.,..,../Source $(DIR_PRO)/Build/auto.inf $(DIR_PRO)/Build/output.ulx

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

test: .phony $(DIR_PRO)/Build/output.ulx
	cd test && make
