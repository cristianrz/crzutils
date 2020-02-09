#!/bin/bash

main() {
	if test "$#" -eq 0; then
		printusg
	fi

	cmd="$1"
	shift

	case "$cmd" in
	"--list") printlist ;;
	*)
		if ! eval "$cmd $*"; then
			printf '%s: applet not found\n' "$cmd" >&2
			exit 1
		fi
		;;
	esac
}

printusg() {
	cat << 'EOF'
crzutils v0.0.1 multi-call binary.
(C) Cristian Ariza

Usage: crzutils [function [arguments]...]
   or: crzutils --list

Currently defined functions:
    amimullvad apt-du bye droidmnt extract git-cloc nsa-name open-term vimv yt-music
EOF
	exit 1
}

printlist() {
	cat << 'EOF'
amimullvad
apt-du
bye
droidmnt
extract
git-cloc
nsa-name
open-term
vimv
yt-music
EOF
	exit
}

main "$@"
