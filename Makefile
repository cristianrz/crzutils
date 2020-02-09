OBJ = amimullvad.sh apt-du.sh bye.sh droidmnt.sh extract.sh git-cloc.sh nsa-name.sh open-term.sh vimv.sh yt-music.sh

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