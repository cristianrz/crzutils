OBJ := $(shell ls -1 *.sh | grep -v main.sh | sed 's/\n/ /g')

all: crzutils

crzutils: $(OBJ) main.sh Makefile
	@echo '#!/bin/bash' > crzutils
	@shfmt -mn $(OBJ) >> crzutils
	@cat main.sh >> crzutils
	@chmod a+x crzutils

install:
	@mv crzutils /usr/local/bin

clean:
	@rm -f crzutils