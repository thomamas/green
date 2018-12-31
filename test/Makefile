all: test

clean:
	rm -f ./comp-scripts/*.out ./*.out

tools/interpreters/bin/cheap-git:
	@echo
	@echo --- CheapGlk Git Interpreter
	@echo
	cd ../tools/interpreters && make bin/cheap-git

tools/interpreters/bin/rem-git:
	@echo
	@echo --- RemGlk Git Interpreter
	@echo
	cd ../tools/interpreters && make bin/rem-git

comptest: ../tools/interpreters/bin/cheap-git
	@echo
	@echo --- Simple Test
	@echo
	./comptest.sh

regtest: ../tools/interpreters/bin/rem-git
	@echo
	@echo --- RegTest
	@echo
	./regtest.sh

test: comptest regtest

scantest: ../tools/interpreters/bin/cheap-git
	@echo
	@echo --- Super Scan Test
	@echo
	./scantest.sh
