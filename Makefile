OBJ = apt-deps apt-list csv2html extract git-cloc nix-add nix-autoremove nix-delete nix-info nix-search nsa-name openw pdfget search start vimv wname yt-music

DESTDIR = ${HOME}/.local/stow/cristianrz

all: $(OBJ)

nsa-name:
	go build -ldflags="-s -w" -o $@ $< 

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -t $(DESTDIR)$(PREFIX)/bin $(OBJ)

uninstall:
	for i in $(OBJ); do rm -f $(DESTDIR)$(PREFIX)/bin/$$i; done

clean:
	rm -f nsa-name
