all: pre-feelies Build/Map.pdf

pre-feelies:
	@echo
	@echo --- Feelies
	@echo

clean:
	rm -f ./Build/* ./tools/makeFeelies.scpt

tools/makeFeelies.scpt: tools/makeFeelies.applescript
	osacompile -o tools/makeFeelies.scpt tools/makeFeelies.applescript

Build/Map.pdf: tools/makeFeelies.scpt Feelies.graffle
	mkdir -p ./Build/
	osascript tools/makeFeelies.scpt
