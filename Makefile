OBJ = amimullvad apt-du bye droidmnt extract git-cloc nsa-name open-term vimv yt-music

all: amimullvad apt-du bye droidmnt extract git-cloc nsa-name open-term vimv yt-music 

amimullvad: amimullvad.sh
	mkdir -p bin
	cat amimullvad.sh > bin/amimullvad
	chmod a+x bin/amimullvad

apt-du: apt-du.sh
	mkdir -p bin
	cat apt-du.sh > bin/apt-du
	chmod a+x bin/apt-du

bye: bye.sh
	mkdir -p bin
	cat bye.sh > bin/bye
	chmod a+x bin/bye

droidmnt: droidmnt.sh
	mkdir -p bin
	cat droidmnt.sh > bin/droidmnt
	chmod a+x bin/droidmnt

extract: extract.sh
	mkdir -p bin
	cat extract.sh > bin/extract
	chmod a+x bin/extract

git-cloc: git-cloc.sh
	mkdir -p bin
	cat git-cloc.sh > bin/git-cloc
	chmod a+x bin/git-cloc

nsa-name: nsa-name.sh
	mkdir -p bin
	cat nsa-name.sh > bin/nsa-name
	chmod a+x bin/nsa-name

open-term: open-term.sh
	mkdir -p bin
	cat open-term.sh > bin/open-term
	chmod a+x bin/open-term

vimv: vimv.sh
	mkdir -p bin
	cat vimv.sh > bin/vimv
	chmod a+x bin/vimv

yt-music: yt-music.sh
	mkdir -p bin
	cat yt-music.sh > bin/yt-music
	chmod a+x bin/yt-music

install:
    cp bin/* /usr/local/bin

uninstall:
	rm -f /usr/local/bin/amimullvad
	rm -f /usr/local/bin/apt-du
	rm -f /usr/local/bin/bye
	rm -f /usr/local/bin/droidmnt
	rm -f /usr/local/bin/extract
	rm -f /usr/local/bin/git-cloc
	rm -f /usr/local/bin/nsa-name
	rm -f /usr/local/bin/open-term
	rm -f /usr/local/bin/vimv
	rm -f /usr/local/bin/yt-music

clean:
    rm -f $(OBJ)
