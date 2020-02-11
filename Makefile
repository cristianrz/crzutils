OBJ = apt-du bye droidmnt extract git-cloc nsa-name openw own search start vimv wname yt-music

STOW = /usr/local/stow

all: crzutils

crzutils: $(OBJ)

nsa-name:
	@go build -o $@ $< 

.sh:
	@shfmt -mn $< >$@
	@chmod a+x $@

install:
	@rm -rf $(STOW)/crzutils
	@mkdir -p $(STOW)/crzutils/bin
	@cp -t $(STOW)/crzutils/bin $(OBJ)
	@stow -d $(STOW) crzutils

clean:
	@rm -f $(OBJ)
