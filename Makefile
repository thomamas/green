DIR_INSTALL_BASE=/Applications/Inform.app
DIR_EXE=$(DIR_INSTALL_BASE)/Contents/MacOS
DIR_INT=$(DIR_INSTALL_BASE)/Contents/Resources/Internal
DIR_I6L=$(DIR_INSTALL_BASE)/Contents/Resources/Library/6.11
DIR_PRO=./FoundersMercy.inform
DIR_MAT=./FoundersMercy.materials
PROJECT="Founder's Mercy"

# Release
OPTS_NI=-release
OPTS_I6=-kE2~S~DwG

# Dev
# OPTS_NI=-rng
# OPTS_I6=-kE2SDwG

all: Release

clean:
	rm -rf $(DIR_PRO)/Build $(DIR_MAT)/Release ./gameinfo.dbg

$(DIR_PRO)/Build/auto.inf: $(DIR_PRO)/Source/story.ni
	$(DIR_EXE)/ni $(OPTS_NI) -internal $(DIR_INT) -project $(DIR_PRO) -format=ulx -release

$(DIR_PRO)/Build/output.ulx: $(DIR_PRO)/Build/auto.inf $(DIR_MAT)/Extensions/*/*
	$(DIR_EXE)/inform6 $(OPTS_I6) +include_path=$(DIR_I6L),.,..,../Source $(DIR_PRO)/Build/auto.inf $(DIR_PRO)/Build/output.ulx

Release: $(DIR_PRO)/Build/output.ulx
	mkdir -p $(DIR_MAT)/Release/interpreter
	$(DIR_EXE)/cBlorb $(DIR_PRO)/Release.blurb $(DIR_PRO)/Build/output.glblorb
	cp $(DIR_PRO)/Build/output.glblorb $(DIR_MAT)/Release/$(PROJECT).gblorb
	#python tools/blorbtool.py $(DIR_MAT)/Release/$(PROJECT).gblorb giload $(DIR_MAT)/Release/interpreter interpreter
