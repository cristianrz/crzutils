#!/bin/bash
#
# Extracts a compressed file in different formats

extract() {
	case "$1" in
	*.tbz2 | *.tar.bz2) tar fjvx "$1" ;;
	*.tar | *.tar.xz) tar fvx "$1" ;;
	*.tgz | *.tar.gz) tar fvxz "$1" ;;
	*.7z) 7za x "$1" ;;
	*.Z) uncompress "$1" ;;
	*.bz2) bunzip2 "$1" ;;
	*.gz) gunzip "$1" ;;
	*.rar) unrar e "$1" ;;
	*.zip) unzip "$1" ;;
	*) echo "'$1' cannot be extracted" ;;
	esac
}
