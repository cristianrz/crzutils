OBJ = apt-du bye droidmnt extract git-cloc nsa-name open-term own search start vimv xid yt-music

STOW = /usr/local/stow

all: crzutils

crzutils: $(OBJ)

install:
	@rm -rf $(STOW)/crzutils
	@mkdir -p $(STOW)/crzutils/bin
	@cp -t $(STOW)/crzutils/bin $(OBJ)
	@stow -d $(STOW) crzutils

clean:
	@rm -f $(OBJ)