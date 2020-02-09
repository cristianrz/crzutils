#!/bin/bash

utils="amimullvad apt-du bye droidmnt extract git-cloc nsa-name open-term \
vimv yt-music"

main() {
	cmd="$(basename "$0")"

	if ! contains "$utils" "$cmd"; then
		if test "$#" -eq 0 || test "$1" = "--help"; then
			printusg
		elif test "$1" = "--list"; then
			printlist
		elif contains "$utils" "$1"; then
			cmd="$1"
			shift
		else
			printf '%s: applet not found\n' "$cmd" >&2
			exit 1
		fi
	fi

	eval "$cmd $*"
}

printusg() {
	cat << 'EOF'
crzutils v0.0.1 multi-call shell script.
(C) Cristian Ariza

Usage: crzutils [function [arguments]...]
   or: crzutils --list

Currently defined functions:
EOF
	printf '\t%s\n' "$utils"
	exit 1
}

printlist() {
	printf '%s\n' "$utils" | sed 's/ /\n/g'
	exit 0
}

contains() {
	case "$1" in
	*"$2"*) return 0 ;;
	"$2"*) return 0 ;;
	*"$2") return 0 ;;
	*) return 1 ;;
	esac
}

main "$@"
